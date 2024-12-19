
% function Lapk=LLaplace(ngmar)
% Lapk={};
%     for i=1:length(size(ngmar))
%         ngtemp=tenmat(ngmar,i);
%         ngtemp=double(ngtemp');
%         T=1:size(ngtemp,2);
%         sizea=size(ngtemp,2);
%         T=sort(repmat(T',sizea,1));
%         for j=1:sizea
%             Ta=T((j-1)*sizea+1:j*sizea);
%             ngsum1=ngtemp(:,Ta)-ngtemp;
%             ma(j,:)=double(exp(-vecnorm(ngsum1,2).^2));
%         end
%         Lapk{i}=ma;
%         clear ngs ngsum1 ngtemp ma
%     end
% 
% end

function Lapk=LLaplace(ngmar)
Lapk={};
    for i=1:length(size(ngmar))
%         ngtemp=tenmat(ngmar,i);
%         ngtemp=double(ngtemp');
%         T=1:size(ngtemp,2);
%         sizea=size(ngtemp,2);
%         T=sort(repmat(T',sizea,1));
%         for j=1:sizea
%             Ta=T((j-1)*sizea+1:j*sizea);
%             ngsum1=ngtemp(:,Ta)-ngtemp;
%             ma(j,:)=double(exp(-vecnorm(ngsum1,2).^2));
%         end
        Lapk{i}=zeros(size(ngmar,i),size(ngmar,i));
%         clear ngs ngsum1 ngtemp ma
    end

        i=length(size(ngmar));
        ngtemp=tenmat(ngmar,i);
        ngtemp=double(ngtemp');
        T=1:size(ngtemp,2);
        sizea=size(ngtemp,2);
        T=sort(repmat(T',sizea,1));
        for j=1:sizea
            Ta=T((j-1)*sizea+1:j*sizea);
            ngsum1=ngtemp(:,Ta)-ngtemp;
            ma(j,:)=double(exp(-vecnorm(ngsum1,2).^2));
        end
        Lapk{i}=ma;
        clear ngs ngsum1 ngtemp ma
end




% function a=res(A,a,b)
% a=reshape(A.',b,a).';
% end


%         tic
%         T=1:size(ngtemp,2);
%         T=repmat(T',size(ngtemp,2),1);
%         ngs=ngtemp(:,sort(T));
%         ngs=reshape(ngs,size(ngs,1),size(ngtemp,2),size(ngtemp,2));
%         ngsum=ngs-ngtemp;
%         ngsum=squeeze(double(exp(-vecnorm(ngsum,2).^2)));
%         toc

%         tic
%         T=1:size(ngtemp,2);
%         T=repmat(T',size(ngtemp,2),1);
%         Ttemp=T;
%         T=[sort(T),Ttemp];
%         Ta=T(:,1);
%         Tb=T(:,2);
%         ngs=ngtemp(:,Ta)-ngtemp(:,Tb);
%         ngsum=exp(-vecnorm(ngs,2).^2);
%         ngsum=res(ngsum,size(ngmar,i),size(ngmar,i));
%         toc



%         tic
%         sizea=size(ngtemp,2);
%         ngs=repmat(ngtemp,sizea,1);
%         ngs=ngs-ngtemp(:);
%         tsize=size(ngtemp,1)*ones(1,sizea);
%         ngsum=mat2cell(ngs,tsize,sizea);
%         ngsum=ngsum';
%         ngsum=cell2mat(ngsum);
%         ngsum=exp(-vecnorm(ngsum,2).^2);
%         ngsum=res(ngsum,size(ngmar,i),size(ngmar,i));
%         toc




