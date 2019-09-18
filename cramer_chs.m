function [X]=cramer(D,b)
%cramer - 克拉默法则解方程组
%
%    此 MATLAB 函数 根据克拉默法则利用线性方程组系数方阵 D 和常数项向量 b 的解 X。
%
%    X = cramer(D)
%    X = cramer(D,b)
if nargin == 1
    b(length(D),1)=0;
end
    if max(size(D))==min(size(D)) && length(b)==length(D)
        if det(D)~=0
            X(length(D),1)=0;
            for i=1:length(D)
                tmp=D;
                D(:,i)=b;
                X(i,1)=det(D)/det(tmp);
                D=tmp;
            end
        else 
            X=NaN;
            disp('本线性方程组无解或无唯一解。');
        end
    else
        X=NaN;
        warning('输入有误，请检查系数方阵行列长度是否相等，或检查常数项向量长度是否与方阵长度相匹配。');
    end
end