for labs=[1,2,4]
      matlabpool('open','local',labs);
      n=2^25;
      hits=0;
      tic
        parfor i=1:n
            x=rand(1);
            y=rand(1);
            dist=sqrt(x^2+y^2);
            if(dist<=1)
                hits=hits+1;
            end            
        end
       p=4*hits/n;
       t(labs)=toc;
       disp(p);
       matlabpool('close');
end
disp(t);
        