%Variables

	%Center frequencies for the 3 double sided signals (in Hz)
	freq_1 = 2000; %First signal (Hz)
	freq_2 = 4000; %Second signal (Hz)
	freq_3 = 6000; %Third signal (Hz)

	%Filtering frequency for the low pass filter
	LPF_freq = 1000; % (Hz)

	%Sound signal after an initial low pass filter
	%bandwitdth will equal 1kHz
	LPF_1 = 0;
	LPF_2 = 0;
	LPF_3 = 0;

	%Frequency shifted sound files (after Low pass filtering)
	freq_sig_1 = 0;
	freq_sig_2 = 0;
	freq_sig_3 = 0;
	
	%Combined signal with all of the sound files
	radio_sound = 0;
    
    %Input signals
    %x1,t1 = audioread('x1.wav');
    %x2,t2 = audioread('x2.wav');
    %x3,t3 = audioread('x3.wav');
	
%Actions
    %t = t1;
    %fprintf('hi\n')
    %pause(3)
	%Step 1: Low Pass filter each incoming signal
	LPF_1 = LPF(x1, LPF_freq, t);
	LPF_2 = LPF(x2, LPF_freq, t);
	LPF_3 = LPF(x3, LPF_freq, t);

    %fprintf('hi\n')
    %pause(3)

	%Setp 2: Frequency Shift each signal
	freq_sig_1 = freq_shift(LPF_1, freq_1, t);
	freq_sig_2 = freq_shift(LPF_2, freq_2, t);
	freq_sig_3 = freq_shift(LPF_3, freq_3, t);

	%Step 3: Add each signal together
	radio_sound = freq_sig_1 + freq_sig_2 + freq_sig_3;

	%Step 4: Write the new signal to a file
	audiowrite('radio1.wav', radio_sound,44100);
    plot(t,fft(radio_sound));

