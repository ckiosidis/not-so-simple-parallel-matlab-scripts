clear
clc
a=1;
b=3;
f=inline('x*exp(x)+x^2-5*x+log(x)')
%f=inline('x^5-x^3');

for labs=[1,2,4,8,16]
    n=2^20;
    h=(b-a)/n;
    s=0;

    tic
    matlabpool('open','JobManagerName',labs,'FileDependencies',{'calculation_of_integral_area_of_function.m'})
    parfor i=1:n
		s=s+integral_calc(f(a+(i-1)*h),f(a+i*h),h) ;
    end
    matlabpool('close')
    t(labs)=toc;
    
	integralArray(labs)=s;
end




for labs=[1,2,4,8,16]
	S(labs)=t(1)/t(labs);
	E(labs)=S(labs)/labs;
end

disp(S)
disp(E)