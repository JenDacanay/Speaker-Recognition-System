function [cn,ystt] = mfcc(s, fs, El, fil, ov)
% MFCC Mel frequency cepstral coefficient feature extraction.
% Inputs:
%       s is the input speech signal (as vector)
%       fs is the sampling frequency (Hz) 
%       E1 is number of samples
%       fil is the number of filterbank channels
%       fil is the number of cepstral coefficients 
%             (including the 0th coefficient)
%       ov is the liftering parameter  
% Outputs
%       cn is a matrix of mel frequency cepstral coefficients
%           (MFCCs) with feature vectors as columns
%       ystt 
%
% Short-time Fourier transform analysis done applies a window
% then takes fft of each frame.
[yst, ystf, ystt] = stft(s, fs, 'Window', hamming(El), 'OverlapLength', ov);%stft
% stft Inputs:
%       s is the input speech signal (as vector)
%       fs is the sampling frequency (Hz) 
%         Window
%         hamming
%         OverlapLength
%         ov
% stft Outputs:
%       yst returns the short-time Fourier transform (STFT) of s.
%       ystf returns the frequencies f at which stft is evaluated.
%       ystt returns the times at which stft is evaluated.

% Filterbank design with M triangular filters uniformly spaced on the mel
% scale
%figure
%waterfall(ystf,ystt,abs(yst(:,:,1))')
mel=melfb_own(fil,El,fs); % mel banks
ystpos = yst((El/2):end, :); % take only the positive half
ystpos = ystpos .* conj(ystpos); % take square of the positive half
mfctemp = mel * ystpos; % matrix multiply the filter banks with the stft
sk = log10(mfctemp); % converts to log values 
cn = dct(sk); % apply the ceptrum step by taking the dct
cnNorm = cn ./ max(max(abs(cn)));% normalize cn

cn = transpose(cnNorm); % somehow I flipped these and this works so eh

%% For Test 3
% Uncomment to Plot spectrum before and after melbanks
% figure()
% subplot(1,3,1)
% sgtitle('Speech Segment of Speaker 5')
% set(sgtitle,'Color','b')
% Sb = spectrogram(s,hamming(El),100,[],fs)
% spectrogram(s,hamming(El),100,[],fs)
% subtitle('Raw Spectrogram')
% 
% subplot(1,3,2)
% Plots the spectrogram after mel-frequency wrapping
% [m, n]= size(Sb);
% for i = 1:n
%     S = zeros(129,n);
%     for k = 1:10;
%         S(:,k) = mel(k, :) .*  Sb(:,i)';
%     end
%     Sa(:,i) = sum(S,2);
% end
% 
% Sa = 10*log10(abs(Sa).^2);
% Sa = Sa ./ max(Sa);% normalize Sa
% surf(Sa,'EdgeColor','none'); view(0, 90); colorbar;
% xlabel('Time (cs)'); ylabel('Mel-frequency')
% subtitle('Spectrogram After Multiplication with Mel-weighted Filterbank')
% 
% subplot(1,3,3)
% surf(ystt, 1:fil, cnNorm,'EdgeColor','none'); view(0, 90); colorbar; % Plots the MFCCs
% xlim([min(ystt), max(ystt)]); ylim([1 fil]);
% xlabel('Time (s)'); ylabel('mfc coefficients')
% subtitle('Corresponding MFCCs')
% caxis([-1 1]);


end
