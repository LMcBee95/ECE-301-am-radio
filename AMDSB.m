function [ y ] =AMDSB(ch)
% ch: is an input deciding which signal you would like to tune into.
% ch = 1, 2, 3 for AM-DSB and ch=1,…, 6 for AM-SSB.

%Variables
    duration=8;
    f_sample=44100; 
    t=(((0-4)*f_sample+0.5):((duration-4)*f_sample-0.5))/f_sample;
    [radio1, f_sample]=audioread('radio1.wav');
    radio1=radio1';

	%Center frequencies for the 3 double sided signals (in Hz)
	freq = [2000, 4000, 6000]; %All frequencies (Hz)	

	%Filtering frequency for the low pass filter
	LPF_freq = 1000; % (Hz)

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
	%ch = 3; %chooses which signal to pull out

	%Temp var; will be output var to the function
	y = 0; %Output sound file
	
%Actions
	
	%Step 1: Band pass filter the radio file
    f = freq(ch);
	BPF_sig = BPF(radio1, f - LPF_freq, f + LPF_freq, t);

	%Setp 2: Frequency shift the filtered sound file
	freq_sig = freq_shift(BPF_sig, f, t);

	%Step 3: LPF the shifted signal
	LPF_sig = LPF(freq_sig, LPF_freq, t);

	%Step 4: Scale the new value to bring it back to normal
	scaled_sig = LPF_sig * scaling_factor;

	%Step 5: Define the output value as the scaled value
	y = scaled_sig;
    
    soundsc(scaled_sig,f_sample);
    %plot(t,fft(scaled_sig),t,fft(x1))
    %legend('show')





