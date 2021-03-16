function [code,cb,resval] = train(trainstring, n,win,mel,over,cent)
% Speaker Recognition: Training 
%
% Input:
%      trainstring : string name of directory contains all train sound
%       files, train files must be lables s1 s2 s3 etc 
%       n        : number of train files in traindir
%       win      : Hamming window size 
%       mel      : Number of Mel coeficients
%       over     : Overlap size
%       cent     : Number of centroids 
%
% Output:
%       code     : trained  centroids, code{i} for i-th speaker
%       cb       : matching centroid for each point 
%       resval   : distortion value for debugging 



for i = 1:n                     % train a codebook for each speaker
    file = sprintf('%ss%d.wav', trainstring, i);     % put together filename           
    disp(file); % disp filename for debugging 
   
    [s, fs] = audioread(file); % read the file 
stemp = round(s, 3);  % rounds everything to 3 sig figs
crit = abs(stemp) > db2mag(-30); % keeps only the parts bigger than -30db ( gets rid of a lot of the noise) 
s = s(find(crit, 1, 'first'):find(crit, 1, 'last'));  % cut the signal down to only the section thats nonzero ( edge trimming) 
    v = mfcc(s, fs,win,mel,over)      ;      % Compute MFCC's
   
    [code{i},cb{i},resval{i}] = Dothelifting(v, cent);      % Train  codebook
end