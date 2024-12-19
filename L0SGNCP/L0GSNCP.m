%%  All parameters of this function are explained the same as 'main_Run_me' and 'ALGOchoose' functions
%%  This algorithm comes from the paper: "A Globally Convergent Algorithm for Nonconvex Optimization Based on Block Coordinate Update"
function [var,loss,timerun]=L0GSNCP(var,ngmar,aa,maxiteropt,stopindex,r,alphat,btmax)
%% initialization algorithm
loss=[];
timerun=[0];
num=length(size(ngmar));
for i=1:num
    varze{i}=zeros(size(var{i}));
end
Lapk=LLaplace(ngmar);

LK=zeros(1,num);
L=ones(1,num);
tk=1;
bts=[];
wk=zeros(1,num);
varK=var;
for j=1:num
wk(j)=(tk-1)/(tk);
end
for i=1:num-1
    alpha(i)=0;
end
alpha(num)=alphat;




loss(1)=computeloss(ngmar,var,alpha,Lapk);


t1=clock;


for i=1:maxiteropt
%% update parameters
fprintf("%d\n",i);
vv=var;

%% Update parameters
for j=1:num
    wk(j)=min(wk(j),btmax);
    vv{j}=var{j}+wk(j)*(var{j}-varK{j});
    varK{j}=var{j};
    var{j}=vv{j};
    LK(j)=L(j);
    [V,L(j)]=gradGSNCP(var,ngmar,j,num,r,Lapk,alpha(j));
        if(j<num)
        var{j}=PROX(varze{j},V,aa(j));
        else
        var{j}=PROXn1(V);
        end
end
loss(i+1)=computeloss(ngmar,var,alpha,Lapk);


%% Judging whether to extrapolate
if(loss(i+1)>loss(i))
    var=varK;
    for j=1:num
    [V,L(j)]=gradGSNCP(var,ngmar,j,num,r,Lapk,alpha(j));
        if(j<num)
        var{j}=PROX(varze{j},V,aa(j));
        else
        var{j}=PROXn1(V);
        end
    end
    loss(i+1)=computeloss(ngmar,var,alpha,Lapk);
end



%% Check if termination condition is met
if(alpha==0)
fprintf("L0SNCP\n");
else
fprintf("L0GSNCP\n");
end

check1=0;
check2=0;
for j=1:num
    fprintf("nonzero:%d\n",nnz(var{j}));
    check1=check1+norm(var{j}-varK{j},'fro');
    check2=check2+norm(varK{j},'fro');
end



bts{i}=wk;
t2=clock;
timerun(i+1)=etime(t2,t1);
% Res=abs(loss(i+1)-loss(i));
% Res=norm(tensor(S2-S1))/returnloss;
% S1=S2;
Res=check1/check2;
fprintf("cri：%d\n",Res);
stop=stopcheck(Res,timerun,stopindex);
if(stop==1)
    fprintf("Number of terminations：%d\n",i);
%     find(diff(loss)>0)
    pause(4);
    break;
end
tk=(1+sqrt(1+4*tk^2))/2;
for j=1:num
wk(j)=(tk-1)/(tk);
end
end

end


function loss=computeloss(ngmar,var,alpha,Lapk)
    loss=computeCP(var,ngmar);
    for i=1:length(size(ngmar))
    loss=loss+alpha(i)/2*trace(var{i}'*Lapk{i}*var{i});
    end
end


function x=PROXn1(x)
x=double(x);
x(x<0)=0;
end