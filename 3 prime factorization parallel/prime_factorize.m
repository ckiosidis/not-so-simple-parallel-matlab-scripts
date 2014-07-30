function [a,b] = prime_factorize(startofArray,endofArray,n)
    format long g;
    a=0;
    b=0;
    disp(startofArray);
    disp(endofArray);
    disp(n);
    for m = startofArray:endofArray
        if mod(n,m) == 0
            a=m;
            b=n/m;
            return
        end
    end
