function [new_sample] = LPF(orig_sample, upper_freq, t)

lpf = sin(upper_freq * 2 * pi * t) ./ (pi * t);


new_sample = ece301conv(orig_sample, lpf);

end
