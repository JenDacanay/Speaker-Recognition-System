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