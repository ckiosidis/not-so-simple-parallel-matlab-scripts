clear
clc
for labs=[1,2,4,6,8,10,12,14,16]
        tic
matlabpool('open','JobManagerName',labs,'FileDependencies',{'hits_calc.m'})
    n=2^30;
    hits=0;

    spmd(labs)
        if(labindex==1)
             hits=hits_calc(1,n/labs);
        elseif(labindex==2)
             hits=hits_calc(1+n/labs,2*n/labs);
        elseif(labindex==3)
             hits=hits_calc(2*n/labs + 1, 3*n/labs);
        elseif(labindex==4)
             hits=hits_calc(3*n/labs + 1, 4*n/labs);
        elseif(labindex==5)
             hits=hits_calc(4*n/labs + 1, 5*n/labs);
        elseif(labindex==6)
             hits=hits_calc(5*n/labs + 1, 6*n/labs);
        elseif(labindex==7)
             hits=hits_calc(6*n/labs + 1, 7*n/labs);
        elseif(labindex==8)
             hits=hits_calc(7*n/labs + 1, 8*n/labs);
        elseif(labindex==9)
             hits=hits_calc(8*n/labs + 1, 9*n/labs);
        elseif(labindex==10)
             hits=hits_calc(9*n/labs + 1, 10*n/labs);
        elseif(labindex==11)
             hits=hits_calc(10*n/labs + 1, 11*n/labs);
        elseif(labindex==12)
             hits=hits_calc(11*n/labs + 1, 12*n/labs);
        elseif(labindex==13)
             hits=hits_calc(12*n/labs + 1, 13*n/labs);
        elseif(labindex==14)
             hits=hits_calc(13*n/labs + 1, 14*n/labs);
        elseif(labindex==15)
             hits=hits_calc(14*n/labs + 1, 15*n/labs);
        elseif(labindex==16)
             hits=hits_calc(15*n/labs + 1, 16*n/labs);
             
        end

    end
   
    p=0;
    for i=1:labs
          p=p + 4*hits{i}/n;
    end
    

    disp(p)

matlabpool('close')
    t(labs)=toc;
end



disp(t)


for labs=[1,2,4,6,8,10,12,14,16]
	S(labs)=t(1)/t(labs);
	E(labs)=S(labs)/labs;
end

disp(S)
disp(E)