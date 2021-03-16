function [cn,ystt] = mfcc(s, fs,El,fil,ov)
[yst, ystf, ystt] = stft(s, fs, 'Window', hamming(El), 'OverlapLength', ov);%stft
%figure
%waterfall(ystf,ystt,abs(yst(:,:,1))')
%spectrogram(s,hamming(El),100,[],fs)
mel=melfb_own(fil,El,fs); % mel banks

ystpos = yst((El/2):end, :); % take only the positive half
ystpos = ystpos .* conj(ystpos); % take square of the positive half
mfctemp = mel * ystpos; % matrix multiply the filter banks with the stft


sk = log10(mfctemp);
cn = dct(sk); % apply the ceptrum step by taking the dct
cn = cn ./ max(max(abs(cn)));% normalize cn
%figure; surf(ystt, 1:fil, cn,'EdgeColor','none'); view(0, 90); colorbar;
%xlim([min(ystt), max(ystt)]); ylim([1 fil]);
 %xlabel('Time (s)'); ylabel('mfc coefficients')
 %caxis([-1 1]);
 

cn = transpose(cn); % somehow I flipped these and this works so eh





end
