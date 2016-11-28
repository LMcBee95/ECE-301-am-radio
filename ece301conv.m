function [ y ] =ece301conv(x1,x2)
%UNTITLED1 Summary of this function goes here
%  Detailed explanation goes here

duration=8;
x1e=[x1 zeros(size(x1))];
x2e=[x2 zeros(size(x2))];

fx1e=fft(x1e);
fx2e=fft(x2e);

fye=fx1e.*fx2e;
ye=ifft(fye);

y=ye(floor(length(x1)/2)+(1:length(x1)))/length(x1)*duration;