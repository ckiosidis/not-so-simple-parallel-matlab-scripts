clear
clc
a=1;
b=5;
f=inline('x^5-x^3')
n=1000;
tic
h=(b-a)/n;
s=0;
for i=1:n
	s=s+integral_calc(f(a+(i-1)*h), f(a+i*h),h);
end
toc
disp(s)