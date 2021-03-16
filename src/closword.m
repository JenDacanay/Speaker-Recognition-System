function words = closword(cs, codes)
%returns the nearest codeword for each value
%
%Inputs:
%   cs- [m*n] matrix containing m-samples and n-numbniner of features
%   codes - [K*n] matrix contaig K-number of centroids
%               on a n-dimensional space (feature space)
%Outputs:
%   words - [m*1] matrix containing each codeword membership on m-samples
%
cs = transpose(cs); % these are nessesary to get the matrices in the correct dimension order 
codes = transpose(codes);


[M, N] = size(cs); % get matrix sizes 
[M2, P] = size(codes); 



d = zeros(N, P); % prealocate d

    copies = zeros(1,N);
    for p = 1:P         % find the distances for all points
        d(:,p) = sum((cs - codes(:, p+copies)) .^2, 1)'; % calculate the Euclidean distance
    end


d = d.^0.5; % take the square
[m, words] = min(d, [], 2); % find the minumum and take that as the codeword 
end