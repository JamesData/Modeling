%% D = calDeliveryDate(i,T,R)
% ����˵����    ���㽻����
% ���������
%        i     ��i������
%        T     �����ӹ�ʱ�����      
%        R     �����ͷ�ʱ�����
% �������:
%        D     ������
%%
function d = calDeliveryDate(i,T,R)
% t = 1096;
[~,MNumber] = size(T);

% ����������ܼӹ�ʱ��
TTime(i) = 0;
for j = 1 : MNumber
    TTime(i) = TTime(i) + T(i,j);
end
f = 1.5;                              % �������ɽ�ϵ��

d = R(i) + f * TTime(i);   
end