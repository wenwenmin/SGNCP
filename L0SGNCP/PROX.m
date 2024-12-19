
function [X,IX]=PROX(X,U,a)
S=U(:);%可以带负数进行排列, 因为到最后会有非负约束去掉负数. 因此带负数排列再去负数, 与先去负数再排列结果一致. 
[~,IX1] = maxk(S(:),a);

X(IX1)=U(IX1);
X(X<0)=0;
% 
% [~,IX] = sort(S(:),'descend');
% if(a>length(IX))
%     a=length(IX);
% end
% X(IX(1:a))=U(IX(1:a));
% X(X<0)=0;
% if (norm(IX(1:a)-IX1)>0)
%     pause(1);
% end

IX=IX1;

end

