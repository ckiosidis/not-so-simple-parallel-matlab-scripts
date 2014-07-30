for labs=[1,2,4]
    disp(labs);
    matlabpool('open','local',labs);
    n=2^25;
    hits=0;
    tic
    spmd(labs)
        if(labindex==1)
             hits=hits_calc_func(1,n/labs);
        elseif(labindex==2)
             hits=hits_calc_func(1+n/labs,2*n/labs);
        elseif(labindex==3)
             hits=hits_calc_func(2*n/labs + 1, 3*n/labs);
         elseif(labindex==4)
             hits=hits_calc_func(3*n/labs + 1, 4*n/labs);
        end

    end
   
    p=0;
    for i=1:labs
          p=p + 4*hits{i}/n;
    end
    
    t(labs)=toc;
    disp(p)
    matlabpool('close');
end

disp(t);