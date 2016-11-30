function [ y ] =AMSSB(ch)
% ch: is an input deciding which signal you would like to tune into.
% ch = 1, 2, 3 for AM-DSB and ch=1,…, 6 for AM-SSB.

%Variables

	%Center frequencies for the 3 double sided signals (in Hz)
	freq = [2000, 3000, 4000, 5000, 6000, 7000]; %All frequencies (Hz)	

	%Filtering frequency for the low pass filter
	LPF_freq = 1000; % (Hz)

	%Radio file that will be read in 
	radio2 = 0;

	%Radio file after a band pass filter is applied
	BPF_sig = 0;

	%Frequency shifted sound file (after band pass filtering)
	freq_sig = 0;

	%Low passed sound file after frequency shifting
	LPF_sig = 0;

	%Scaled value of the low pass filtered signal
	scaled_sig = 0;

	%Scaling factor for the demodulation
	scaling_factor = 4; %Four for signle sided demodulation

	%Temp var; will be input var to the function
	%ch = 6; %chooses which signal to pull out

	%Temp var; will be output var to the function
	y = 0; %Output sound file
	
%Actions

	%Pre step: Load in the radio file into a workable format
	[radio2, f_sample]=audioread('radio2.wav');
	radio2=radio2';
	
	%Step 1: Band pass filter the radio file
    f = freq(ch);
	BPF_sig = BPF(radio2, f - LPF_freq, f, t);

	%Setp 2: Frequency shift the filtered sound file
	freq_sig = freq_shift(BPF_sig, f, t);

	%Step 3: LPF the shifted signal
	LPF_sig = LPF(freq_sig, LPF_freq, t);

	%Step 4: Scale the new value to bring it back to normal
	scaled_sig = LPF_sig * scaling_factor;

	%Step 5: Define the output value as the scaled value
	y = scaled_sig;
    
    soundsc(y,f_sample)
    %pause(8)
    %soundsc(x1,f_sample)
    %plot(t,fft(scaled_sig),t,fft(x1))
    %plot(t,fft(radio2))
    %legend('show')





