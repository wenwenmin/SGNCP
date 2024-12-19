clearvars -except 
clc
warning('off');
%% Parameter.
%   index     : The dataset to be used, when index=1, index=1, use orlraws10P dataset
%               when index=2, use pixraw10P dataset
%   r         : Step factor
%   maxiteropt: Maximum iteration alloted to the method
%   trigger   : Whether to enable the indicator array of each method, where
%               when 1∈trigger, enable the 𝓁0-SNCP method
%               when 2∈trigger, enable the 𝓁0-GSNCP method
%   percent   ：The proportion of non-zero elements allowed in each decomposition matrix
%   alphat    : The graph regularization parameter
%   stopindex : The indicator of the stop condition.  
%               To set the specific termination condition, see the 'stopcheck' function for details.  
%               The default termination condition is: ϵ<1e-5 or rum time>300 seconds 
%% Display
%   nonzero   ：The number of non-zero elements in each component.
%   Rel       : The difference in the variable value between two iterations.

%% Parameter settings
rng('shuffle')
index=1;
r=1.01;
maxiteropt=12000;
trigger=[1,2];
percent=[0.7,0.7,0.7,1];
alphat=1;
stopindex=2;





[ngmar,R,Rdims,y]=readfile(index);
num=length(size(ngmar));
N=R;







for j=1:5
%% Init
var=[];
for i=1:num
    var{i}=rand(size(ngmar,i),Rdims(num));
end
for i=1:length(size(ngmar))
    a(i)=round(Rdims(num)*size(ngmar,i)*percent(i));
end
aa=a;





%% Solving
for i=1:length(trigger)
[datas{i},varss{i}]=ALGOchoose(var,ngmar,aa,maxiteropt,Rdims,trigger(i),stopindex,r,alphat);
end
vart=var;
datas{length(trigger)+1}=varss;
datas{length(trigger)+2}=vart;
for i=1:length(trigger)
    vars1=datas{length(trigger)+1};
    vars11=vars1{i};
    vartemp=vars11{end};
     [acc(j,i),rdx(j,i),NMIs(j,i)]=clustermeans(vartemp{end},N,y);
end
   datass{j}=datas;
end




accmean=mean(acc)
rdxmean=mean(rdx)
nmimean=mean(NMIs)
plt0=plotplt(trigger,acc,rdx,NMIs); plt0=plotplt(trigger,acc,rdx,NMIs);
