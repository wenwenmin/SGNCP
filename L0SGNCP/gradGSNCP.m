%% Gradient calculation function
function [U,L]=gradGSNCP(var,ngmar,n,num,r,Lapk,alpha)
  [Xtemp,temp]=krob2(var,n,num,ngmar);
   a=0;
   ck=norm(temp,'fro')+alpha*norm(Lapk{n},'fro');
   L=ck;
   tao=1/(r*ck);
   if(temp==0) 
       while(a==0)
           a=rand(1);
       end
       tao=1/a;
   end
   mar=var{n}*temp-Xtemp+alpha*Lapk{n}*var{n};
   U=var{n}-tao*mar;
end