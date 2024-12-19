
% Input.
% var         : initial matrix
% ngmar       : decomposed tensor
% aa          : Maximum number of non-zero elements for each decomposition matrix
% The remaining parameters are explained the same as the 'main_Run_me' function

% Output.
% vars        : Decomposition matrix resulting from the final iterative result
% loss:       : Array of loss functions generated during iteration
% tr:         : Runtime array during iteration

function [data,varss]=ALGOchoose(var,ngmar,aa,maxiteropt,Rdims,flag,stopindex,r,alphat)



if(flag==1)
[vars,loss,tr]=L0GSNCP(var,ngmar,aa,maxiteropt,stopindex,r,0,0.99);  
varss{1}=vars;
lossdata=loss;
trdata=tr;


elseif(flag==2) 
[vars,loss,tr]=L0GSNCP(var,ngmar,aa,maxiteropt,stopindex,r,alphat,0.99);  
varss{1}=vars;
lossdata=loss;
trdata=tr;

   

end


data{1}=lossdata;
data{2}=trdata;



end