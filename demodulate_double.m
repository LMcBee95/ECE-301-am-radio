%Variables

	%Center frequencies for the 3 double sided signals (in Hz)
	freq[3] = {1000, 2500, 4000}; %All frequencies (Hz)	

	%Filtering frequency for the low pass filter
	LPF_freq = 1000; % (Hz)

	%Radio file that will be read in 
	radio1 = 0;

	%Radio file after a band pass filter is applied
	BPF_sig = 0;

	%Frequency shifted sound file (after band pass filtering)
	freq_sig = 0;

	%Low passed sound file after frequency shifting
	LPF_sig = 0;

	%Scaled value of the low pass filtered signal
	scaled_sig = 0;

	%Scaling factor for the demodulation
	scaling_factor = 2; %Two for double sided demodulation

	%Temp var; will be input var to the function
	ch = 0; %chooses which signal to pull out

	%Temp var; will be output var to the function
	y = 0; %Output sound file
	
%Actions

	%Pre step: Load in the radio file into a workable format
	[radio1, f_sample]=audioread('radio1.wav');
	radio1=radio1';
	
	%Step 1: Band pass filter the radio file
	BPF_sig = BPF(radio1, freq[ch] - LPF_freq, freq[ch] + LPF_freq, t);

	%Setp 2: Frequency shift the filtered sound file
	freq_sig = freq_shift(BPF_sig, freq[ch], t);

	%Step 3: LPF the shifted signal
	LPF_sig = LPF(freq_sig, LPF_freq, t);

	%Step 4: Scale the new value to bring it back to normal
	scaled_sig = LPF_sig * scaling_factor;

	%Step 5: Define the output value as the scaled value
	y = scaled_sig;	






