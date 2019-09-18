function [X]=cramer(D,b)
%cramer - ����Ĭ����ⷽ����
%
%    �� MATLAB ���� ���ݿ���Ĭ�����������Է�����ϵ������ D �ͳ��������� b �Ľ� X��
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
            disp('�����Է������޽����Ψһ�⡣');
        end
    else
        X=NaN;
        warning('������������ϵ���������г����Ƿ���ȣ����鳣�������������Ƿ��뷽�󳤶���ƥ�䡣');
    end
end