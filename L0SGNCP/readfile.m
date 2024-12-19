%   R         : Rank of Tensor Tucker Decomposition

function [ngmar,R,Rdims,tlabel]=readfile(i)
  if(i==1)  
   E=load('.\Data\orlraws10P.mat');
   ngmar= double(E.X);
   ngmart=ngmar;
   ngmar=reshape(ngmar',92,112,size(ngmar,1));
   label= double(E.Y);

    M1=tenmat(ngmar,3);
    M11=double(M1)';
    M11=normalize(M11,'range');
    M11=M11';
    rdims =M1.rdims;% Dimensions that were mapped to the rows.
    cdims =M1.cdims;% Dimensions that were mapped to the columns.
    tsize = size(ngmar); %或M1.tsize % Size of the original tensor.
    M10=tenmat(M11,rdims,cdims,tsize);
    ngmar=tensor(M10);

   tlabel=double(label);
    R=length(unique(tlabel));

     tsize=size(ngmar);
     Rdims=[ceil(tsize(1:end-1)/2),R];


   if(i==2)    
   E=load('.\Data\pixraw10P.mat');
   ngmar= double(E.X);
   ngmart=ngmar;
   ngmar=reshape(ngmar',100,100,size(ngmar,1));
   label= double(E.Y);

    M1=tenmat(ngmar,3);
    M11=double(M1)';
    M11=normalize(M11,'range');
    M11=M11';
    rdims =M1.rdims;% Dimensions that were mapped to the rows.
    cdims =M1.cdims;% Dimensions that were mapped to the columns.
    tsize = size(ngmar); %或M1.tsize % Size of the original tensor.
    M10=tenmat(M11,rdims,cdims,tsize);
    ngmar=tensor(M10);

   tlabel=double(label);
    R=length(unique(tlabel));

     tsize=size(ngmar);
     Rdims=[ceil(tsize(1:end-1)/2),R];



   end 

end


