%% function MD = calMD(T,Jm)
% ����˵����    ����MD(Macroscopic Distance)����
% ���������
%        T     �����ӹ�ʱ�����
%        R     �����ͷ�ʱ�����
% �������:
%        MD    MD�������
%%
function MD = calMD(T,Jm)
% ��ʼ��
[PNumber, MNumber] = size(T);
MD = zeros(PNumber,PNumber);                   % MD����
Ind = zeros(PNumber,MNumber);                  % ��������λ��(���)����
Len = MNumber;                                 % �ܲ�����
pos = zeros(PNumber,MNumber);                  % �������λ�þ���
d = zeros(PNumber,PNumber,MNumber);            % �������λ��֮�����

for k = 1 : MNumber
    % �������λ��
    for i = 1 : PNumber
        [row,col] = find(Jm==k);
        pNum = row(i);                 % ������
        Ind(pNum,k) = col(i);
        pos(pNum,k) = col(i) ./ Len;
    end
    % �������λ��֮��
    for i = 1: PNumber
        for j = 1 : PNumber
            d(i,j,k) = abs(pos(i,k)-pos(j,k));
        end
    end
end
% ������
for i = 1 : PNumber
    for j = 1 : PNumber
        MD(i,j) = max(d(i,j,:));
    end
end

end