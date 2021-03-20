function [newcode,cb,resval] = Dothelifting(cs, k)
%
% Inputs:
%       cs contains training data vectors (one per column) from mfcc
%       k is number of centroids 
%
% Outputs:
%       cb contains the codebook (k columns, one for each centroids)

place=randperm(size(cs, 1)); %initiate centroids at random points
incode = cs(place(1:k), :);
newcode=incode; % create a copy of the initial centroids
reswan=.12; % threshold for centroid completion 
lasres=0; %initiate res value 

 
while (1)
cb = closword(cs, newcode); % call the formula for new closest centroids
 newcode = zeros(k, size(cs, 2)); % reinitialize centroids( if we don't do this it can get stucl) 

    for i = 1:k % create new centroids by taking the mean of all the closest centroids 
        num = find(cb == i); 
        newcode(i,:) = mean(cs(num,:));
    end

    resval = 0; % initialize res each itteration 
   
    for vals = 1:k % find the distances between the input matrix and their closest centroids, and calculate the total value
        sel = find(cb == vals);
        diff = bsxfun(@minus, cs(sel, :), newcode(vals,:));
        resval = resval + sum(diff.^2, 'all');
    end
    resval = resval ./ size(cs, 1); % normalize the res/dis value

compres = abs( (lasres-resval)/resval); % find how much the res changed this itteration

    if ( compres < reswan ) % if the res hasn't changed much end function, otherwise keep iterating

        break
    end
    lasres = resval;


end

end

