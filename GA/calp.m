%% function P=calp(S,PNumber)
% ����˵����          ���ݻ���S,������ȹ���P
% ���������
%        S           Ϊ����  
%        PNumber     Ϊ�������� 
% �������: 
%        P           Ϊ����ĵ��ȹ��� 
%                    ��������102��ʾ����10�Ĺ���3
%%
function P=calp(S,PNumber)

WNumber=length(S);%�����ܸ���
MNumber=WNumber/PNumber;
if MNumber~=fix(MNumber)
    error('input parameters disagree')
end

%��ʼ��
temp=zeros(1,PNumber);
P=zeros(1,WNumber);

%�������ɵ��ȹ���
for i=1: WNumber 
    
  P(i)=S(i)*10+temp(S(i));
  
  %�����+1
  temp(S(i))=temp(S(i))+1;   
end


