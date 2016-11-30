function [new_sample] = BPF(orig_sample, lower_freq, upper_freq, t)

lpf1 = sin(lower_freq * 2 * pi * t) ./ (pi * t);
lpf2 = sin(upper_freq * 2 * pi * t) ./ (pi * t);

bpf = lpf2 - lpf1;

%size(bpf)
%size(orig_sample)
new_sample = ece301conv(orig_sample, bpf);

end
