%Variable Declarations
	
	duration=8;
	f_sample=44100; 

%Setup code

	%Load in sound files
	[x1, f_sample]=audioread('x1.wav');
	x1=x1';

	[x2, f_sample]=audioread('x2.wav');
	x2=x2';

	[x3, f_sample]=audioread('x3.wav');
	x3=x3';

	[x4, f_sample]=audioread('x4.wav');
	x4=x4';

	[x5, f_sample]=audioread('x5.wav');
	x5=x5';

	[x6, f_sample]=audioread('x6.wav');
	x6=x6';

	%Create time
	t=(((0-4)*f_sample+0.5):((duration-4)*f_sample-0.5))/f_sample;
