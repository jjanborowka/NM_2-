function [out,outd] = hermit(x,a,n);
%Function calculating sum form  0 to n of a * hermit(x)
H0 = a(1)*1;
H0d = 0;
H1 = a(2)*2*x;
H1d = a(2)*2;
out =a(2)* 2*x+1*a(1);
outd =  a(2)*2;
for i=2:1:n
    if rem(i,2) == 0 
        H0d = a(i+1)*(2*H1+2*x*H1d-2*(i-1)*H0d);
        H0 = a(i+1)*(2*x*H1-2*(i-1)*H0);
        outd = outd +H0d;
        out = out + H0;
    end
    if rem(i,2) ==1 
        H1d = a(i+1)*(2*H0+2*x*H0d-2*(i-1)*H1d);
        H1 = a(i+1)*(2*x*H0-2*(i-1)*H1);
        out = out + H1;
        outd = outd +H1d;
    end
end

    
    
end

