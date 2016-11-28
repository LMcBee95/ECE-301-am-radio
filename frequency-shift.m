function [new_sample] = freq_shift(orig_sample, freq, t)

new_sample = orig_sample .* cos(t * freq * 2 * pi);

end
