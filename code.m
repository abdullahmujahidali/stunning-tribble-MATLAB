function [T,Int] =reimsum(fun,a,b,n)

% l = left, m = middle, r = right, I = reimann sum

N = length(n);

for j = 1:N
  
h(j) = (b-a)/n(j); % getting the current dx

% initializing the sums to zero to prepare for cumulative sum
Il = 0;
Ir = 0;
Im = 0;

for i=1:n(j)
xl = a + h(j)*(i-1);
xr = a + h(j)*(i);
xm = a + h(j)*(2*i-1)/2;

Il = Il + fun(xl)*h(j);
Ir = Ir + fun(xr)*h(j);
Im = Im + fun(xm)*h(j);

end

% populating the vectors c,d and f with the corresponding sums
c(j,1) = Il;
d(j,1) = Im;
f(j,1) = Ir;

end

A =[n',c,d,f];
T=array2table(A,'VariableNames',{'n','Left','Middle','Right'});
Int = integral(fun,a,b);
end
