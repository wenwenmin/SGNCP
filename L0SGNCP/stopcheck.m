
% threshold            : Decomposed residuals threshold, see Eq. (24) of the paper 
% An Accelerated Block Proximal Framework with Adaptive Momentum for Nonconvex and Nonsmooth Optimization
% timerun(end)>timeend : Where 'timeend' refers to the termination running time

function stop=stopcheck(Res,timerun,stopindex)
    stop=0;
    threshold=1e-6;
     if(stopindex==1)
        if(timerun(end)>6)
        stop=1;
        end
     elseif(stopindex==2)
        if(Res<1e-5 || timerun(end)>300)
        stop=1;
        end
    end
end