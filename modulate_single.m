%Variables

	%Center frequencies for the 3 double sided signals (in Hz)
	freq_1 = 2000; %First signal (Hz)
	freq_2 = 3000; %Second signal (Hz)
	freq_3 = 4000; %Third signal (Hz)
	freq_4 = 5000; %Fourth signal (Hz)
	freq_5 = 6000; %Fifth signal (Hz)
	freq_6 = 7000; %Sixth signal (Hz)

	%Filtering frequency for the low pass filter
	LPF_freq = 1000; % (Hz)

	%Sound signal after an initial low pass filter
	%bandwitdth will equal 1kHz
	LPF_1 = 0;
	LPF_2 = 0;
	LPF_3 = 0;
	LPF_4 = 0;
	LPF_5 = 0;
	LPF_6 = 0;

	%Frequency shifted sound files (after Low pass filtering)
	freq_sig_1 = 0;
	freq_sig_2 = 0;
	freq_sig_3 = 0;
	freq_sig_4 = 0;
	freq_sig_5 = 0;
	freq_sig_6 = 0;

	%Single sided signal after the frequency shift
	single_1 = 0;
	single_2 = 0;
	single_3 = 0;
	single_4 = 0;
	single_5 = 0;
	single_6 = 0;
	
	%Combined signal with all of the sound files
	radio_sound = 0;

%Actions

	%Step 1: Low Pass filter each incoming signal
	LPF_1 = LPF(x1, LPF_freq, t);
	LPF_2 = LPF(x2, LPF_freq, t);
	LPF_3 = LPF(x3, LPF_freq, t);
	LPF_4 = LPF(x4, LPF_freq, t);
	LPF_5 = LPF(x5, LPF_freq, t);
	LPF_6 = LPF(x6, LPF_freq, t);

	%Setp 2: Frequency Shift each signal
	freq_sig_1 = freq_shift(LPF_1, freq_1, t);
	freq_sig_2 = freq_shift(LPF_2, freq_2, t);
	freq_sig_3 = freq_shift(LPF_3, freq_3, t);
	freq_sig_4 = freq_shift(LPF_4, freq_4, t);
	freq_sig_5 = freq_shift(LPF_5, freq_5, t);
	freq_sig_6 = freq_shift(LPF_6, freq_6, t);

	%Step 3: Apply a low pass filter on each of the shifted signals
	single_1 = LPF(freq_sig_1, freq_1, t);
	single_2 = LPF(freq_sig_2, freq_2, t);
	single_3 = LPF(freq_sig_3, freq_3, t);
	single_4 = LPF(freq_sig_4, freq_4, t);
	single_5 = LPF(freq_sig_5, freq_5, t);
	single_6 = LPF(freq_sig_6, freq_6, t);

	%Step 4: Add each signal together
	radio_sound = single_1 + single_2 + single_3 + single_4 + single_5 + single_6;
    

	%Step 5: Write the new signal to a file
	audiowrite('radio2.wav', radio_sound,44100);
    soundsc(LPF_1,f_sample)
    plot(t, fft(radio_sound));
    





