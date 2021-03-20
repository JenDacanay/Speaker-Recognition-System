function periodogram_stft(s, Fs)
% Test 2: Plot periodograms with N = 128, 256, 512 frame sizes

%% Test 2: Plot periodograms with N = 128, 256, 512 frame sizes

num_mfcc = 20;
[y, f, t] = stft(s, Fs, 'Window', hamming(128), 'OverlapLength', 30);%stft
sgtitle('STFT Periodograms for Speaker 5')
set(sgtitle,'Color','b')
subplot(1,3,1);
surf(f, abs(t),abs(y(:,:,1))')
% waterfall(f,t,abs(y(:,:,1))')
subtitle('N = 128')
xlabel('Frequency(Hz)')
ylabel('Time (s)')
zlabel('Magnitdue(dB)')
shading interp
axis tight
view(0,90)
colormap jet


subplot(1,3,2);
[y, f, t] = stft(s, Fs, 'Window', hamming(256), 'OverlapLength', 100);%stft
waterfall(f,0:t,abs(y(:,:,1))')
subtitle('N = 256')
xlabel('Frequency(Hz)')
ylabel('Time (s)')
subplot(1,3,3);
[y, f, t] = stft(s, Fs, 'Window', hamming(512), 'OverlapLength', 170);%stft
waterfall(f,t,abs(y(:,:,1))')
subtitle('N = 512')
xlabel('Frequency(Hz)')
ylabel('Time (s)')

% 
% num_mfcc = 20;
% [stft_s, f, t] = stft(s, Fs, 'Window', hamming(128), 'OverlapLength', 30);%stft
% 
% figure()
% sgtitle('STFT Periodograms for Speaker 5')
% set(sgtitle,'Color','b')
% subplot(1,3,1);
% [y, f, t] = stft(s, 'Window', hamming(256), 'OverlapLength', 100);%stft
% waterfall(f,t,abs(y(:,:,1))')
% subtitle('N = 128')
% xlabel('Frequency(Hz)')
% ylabel('Time (s)')
% shading interp
% axis tight
% view(-45,65)
% colormap jet
% % subplot(1,3,2);
% % [y, f, t] = stft(s, Fs, 'Window', hamming(256), 'OverlapLength', 100);%stft
% % waterfall(f,t,abs(y(:,:,1))')
% % subtitle('N = 256')
% % xlabel('Frequency(Hz)')
% % ylabel('Time (s)')
% % 
% % subplot(1,3,3);
% % [y, f, t] = stft(s, Fs, 'Window', hamming(512), 'OverlapLength', 170);%stft
% % waterfall(f,t,abs(y(:,:,1))')
% % subtitle('N = 512')
% % xlabel('Frequency(Hz)')
% % ylabel('Time (s)')