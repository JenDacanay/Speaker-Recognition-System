function filtered_signal = keepsound(s, dB, num)
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
