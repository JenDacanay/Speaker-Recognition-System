function filtered_signal = plotfilt(s, dB, num)
% returns filtered signal removing any data that is lower than 
% given dB, then plots raw signal and filtered signal in time domain
%   Inputs:
%       s   =  raw sound wave signal
%       db  =  minimum dB to be kept
%       num =  speaker number
%   Outputs:
%       sf  =  filtered speech signal with silent parts removed
stemp = round(s, 3);  
crit = abs(stemp) > db2mag(dB); % Filter out silence in signal  
filtered_signal = s(find(crit, 1, 'first'):find(crit, 1, 'last'));

figure()
% Test 2 - Plot raw voice signals in time domain
subplot(2,1,1)
plot(s)
% title('Raw Signal, %s.wav, in Time Domain')
title(['Raw Signal of s', num2str(num), '.wav'])
xlabel('Time (s)')
ylabel('Amplitude')
subplot(2,1,2)
plot(filtered_signal)
title(['Filtered Signal of s', num2str(num), '.wav'])
xlabel('Time (s)')
ylabel('Amplitude')