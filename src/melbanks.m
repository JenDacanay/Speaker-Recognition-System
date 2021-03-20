function filterbanks = melbanks(K, Fs,numfft)
% Input     K = 
%           Fs = sampling frequency
%           numfft = number of FFT

lowerFreq = 0;
upperFreq = Fs/2;
filterMax = 1
spacing = melspace(K, lowerFreq, upperFreq);
spacing_n = floor((numfft - 1)*spacing/Fs);
filterbanks = zeros(K, numfft/2);
    for k = 2:(K+1)
        for i = 1:(numfft/2)
            if i >= spacing_n(k-1) && i <= spacing_n(k)
                filterbanks(k-1,i+1) =  (i -spacing_n(k-1)) *(filterMax/(spacing_n(k) - spacing_n(k-1)));
            elseif i >= spacing_n(k) && i <= spacing_n(k+1)
                filterbanks(k-1,i+1) =  (i -spacing_n(k))*(-filterMax/(spacing_n(k+1) - spacing_n(k))) + filterMax;
            end
        end
    end
    function spacing = melspace(K,fmin, fmax)
        melMin = 1127*log(1 + fmin/700);
        melMax = 1127*log(1 + fmax/700);
        spacing = linspace(melMin,melMax, K + 2);
        spacing = 700*(exp(spacing/1127) - 1);
    end
end