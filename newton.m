function [k,x] = newton(a,b,x0,ak,n)
%NEWTON Newton method for polynomials from hermit function
%   Input:
%       [a, b] - interval
%       x0 - start point x0 in [a,b]
%       ak - vector of polynomial coefficients
%       n - size of Wn(x) polynomial
%   Output:
%       k - number of iterations made before stop
%       x - reached root approximation
%Test: [k,x] = newton(-5, -1.4, -5, ones(5), 4)

x = x0;
k = 1;

[w, wd] = hermit(x, ak, n);
d = 0 ;
while (abs(w) > 1e-10 && d < 10000)
    x = x - (w/wd);
    [w, wd] = hermit(x, ak, n);
    k = k+1;
    d = d+1;
    
end
end
