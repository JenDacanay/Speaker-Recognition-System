function plot_periodogram_stft(s, Fs)
% Test 2: Plot periodograms with N = 128, 256, 512 frame sizes
% Input:
%       s   =   Signal number to plot
%       Fs  =   Sampling Frequency of Signal

% Calculate Short-time Fourier Transform(STFT) of signal
[y, f, t] = stft(s, Fs, 'Window', hamming(128), 'OverlapLength', 30);


% Plot 
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
[y, f, t] = stft(s, Fs, 'Window', hamming(256), 'OverlapLength', 100);
surf(f, abs(t),abs(y(:,:,1))')
% waterfall(f,0:t,abs(y(:,:,1))')
subtitle('N = 256')
xlabel('Frequency(Hz)')
ylabel('Time (s)')
shading interp
axis tight
view(0,90)
colormap jet

subplot(1,3,3);
[y, f, t] = stft(s, Fs, 'Window', hamming(512), 'OverlapLength', 170);
surf(f, abs(t),abs(y(:,:,1))')
% waterfall(f,t,abs(y(:,:,1))')
subtitle('N = 512')
xlabel('Frequency(Hz)')
ylabel('Time (s)')
shading interp
axis tight
view(0,90)
colormap jet
end