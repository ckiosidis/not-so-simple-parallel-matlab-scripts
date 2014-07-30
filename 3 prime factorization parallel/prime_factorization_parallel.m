clear
clc
a=90000049;
b=94418953;
n=a*b;
for labs=[4]
    matlabpool('open','local',labs);
    tic
    k=double(floor(sqrt(sym(n))));
    k1=k/labs;
    spmd(labs)
        if(labindex==1)
            [x,y]=prime_factorize(2, k1, n);
            disp(x);
            disp(y);
        elseif(labindex==2)
            [x,y]=prime_factorize(1 + k1  , 2*k1, n);
            disp(x);
            disp(y);
        elseif(labindex==3)
            [x,y]=prime_factorize(1 +  2*k1, 3*k1, n);
            disp(x);
            disp(y);
        elseif(labindex==4)
            [x,y]=prime_factorize(1 +  3*k1, 4*k1, n);
            disp(x);
            disp(y);
        end
        
    end
    toc
    matlabpool('close');
end



% labs = 4 , labindex==2 end at     m=2.4259e+007   n= 8.4977e+015