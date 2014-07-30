clear
clc
format long
for labs=[1,2,4,6,8,10,12,14,16]
    tic
    matlabpool('open','JobManagerName',labs,'FileDependencies',{''})
    n=2^25;
    hits=0;

        parfor i=1:n
            x=rand(1);
            y=rand(1);
            dist=sqrt(x^2+y^2);
            if(dist<=1)
                hits=hits+1;
            end            
        end
   
       p=4*hits/n;
    

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