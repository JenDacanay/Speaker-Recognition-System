function [code,cb,resval] = train2(trainstring, n,win,mel,over,cent)
% Speaker Recognition: Training Stage
%
% Input:
%       trainstring : string name of directory contains all train sound files
%       n        : number of train files in traindir
%
% Output:
%       code     : trained  codebooks, code{i} for i-th speaker
%
% Note:
%       Sound files in traindir is supposed to be: 
%                       s1.wav, s2.wav, ..., sn.wav
% Example:
%       >> code = train('C:\data\train\', 8);

k = 16;                         % number of centroids required

for i = 1:n                     % train a codebook for each speaker
    file = sprintf('%ss%d.wav', trainstring, i);           
    disp(file);
   
    [s, fs] = audioread(file);
stemp = round(s, 3);  
crit = abs(stemp) > db2mag(-30);
s = s(find(crit, 1, 'first'):find(crit, 1, 'last')); 
    v = mfcc(s, fs,win,mel,over)      ;      % Compute MFCC's
   
    [code{i},cb{i},resval{i}] = Dothelifting(v, cent);      % Train  codebook
end