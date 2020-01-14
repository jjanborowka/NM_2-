function [out,outd] = hermit(x,a,n)
%Function calculates Wn(x) and Wn'(x)
%Wn(x) = sum (0 to n) of { a[k] * H[k](x) }

H0 = 1;
H0d = 0;

H1 = 2*x;
H1d = 2;

out = a(2)*2*x+a(1)*1;
outd = a(2)*2;

for i=2:1:n
    disp(i)
    if rem(i,2) == 0 
        H0d = (2*H1+2*x*H1d-2*(i-1)*H0d);
        H0 = (2*x*H1-2*(i-1)*H0);
        outd = outd + a(i+1)*H0d;
        out = out + a(i+1)*H0;
    end
    if rem(i,2) == 1 
        H1d = (2*H0+2*x*H0d-2*(i-1)*H1d);
        H1 = (2*x*H0-2*(i-1)*H1);
        out = out + a(i+1)*H1;
        outd = outd +a(i+1)*H1d;
    end
end

end