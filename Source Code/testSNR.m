function test(teststromg, n, code,cb,win,mel,over,cent,snr)
% Speaker Recognition: Testing Stage
%
% Input:
%       teststromg : string name of directory contains all test sound files
%       n       : number of test files in teststromg
%       code    : codebooks of all trained speakers
%
% Note:
%       Sound files in testdir is supposed to be: 
%               s1.wav, s2.wav, ..., sn.wav
%
% Example:
%       >> test('C:\data\test\', 8, code);

for k = 1:n                     % read test sound file of each speaker
    file = sprintf('%ss%d.wav', teststromg, k);
    [s, fs] = audioread(file);      
    s = awgn(s,snr); % add noise
stemp = round(s, 3);  
crit = abs(stemp) > db2mag(-30);
s = s(find(crit, 1, 'first'):find(crit, 1, 'last')); 
    v = mfcc(s, fs,win,mel,over);              % Compute MFCC's
    distmin = inf;
    initdis=distmin;
    k1 = 0;
    for l = 1:length(code)      % each trained codebook, compute distortion
         code{1}(1,1);
        d = dista(v, code{l});
        dist = sum(min(d,[],2)) / size(d,1);
        if dist < distmin
            distmin = dist;
            k1 = l;
        end      
    end
   if distmin == initdis
     msg = sprintf('Speaker %d matches with no speaker', k);
   else
    msg = sprintf('Speaker %d matches with speaker %d', k, k1);
    disp(msg);
   end
end

end

function d = dista(cs, codes)
cs = transpose(cs);
codes = transpose(codes);
[M, N] = size(cs);
[M2, P] = size(codes); 
d = zeros(N, P);
if (N < P)
    copies = zeros(1,P);
    for n = 1:N
        d(n,:) = sum((cs(:, n+copies) - codes) .^2, 1);
    end
else
    copies = zeros(1,N);
    for p = 1:P
        d(:,p) = sum((cs - codes(:, p+copies)) .^2, 1)';
    end
end
d = d.^0.5;
end