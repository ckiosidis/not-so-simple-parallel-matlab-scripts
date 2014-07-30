function hits = hits_calc_func(startofArray,endofArray)
hits=0;
for m= startofArray:endofArray
            x=rand(1);
            y=rand(1);
            dist=sqrt(x^2+y^2);
            if(dist<=1)
                hits=hits+1;
            end            
end

end

