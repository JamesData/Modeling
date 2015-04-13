%% [PVal,ObjV,P]=cal(Chrom,T,Jm)
% ����˵����       ���ݻ���Ⱥ,�������Ⱥ��ÿ������ĵ��ȹ���ʱ�䣬
%                 ������Сʱ��ĵ��ȹ���͵��ȹ���ʱ��(��ʼʱ������ʱ��)
% ���������
%       Chrom     - Ϊ������Ⱥ
%       T         - Ϊ������������ʹ�õ�ʱ��
%       Jm        - Ϊ������������ʹ�õĻ���
% �������:
%       PVal      - Ϊ��ѵ��ȹ���ʱ��
%       P         - Ϊ�������ĵ��ȹ���
%       ObjV      - ΪȺ��ÿ������ĵ��ȹ���ʱ��
%%
function [PVal, ObjV, P]=cal(Chrom,T,Jm)

% ��ʼ��
PNumber=size(T,1);
NIND=size(Chrom,1);
ObjV=zeros(NIND,1);

for i=1:NIND
    
    % ȡһ������
    S=Chrom(i,:);
    
    % ���ݻ��򣬼�����ȹ���
    P= calp(S,PNumber);
    
    % ���ݵ��ȹ��򣬼�������ȹ���ʱ��
    PVal=caltime(P,T,Jm);
    
    % ȡ���ʱ��
    MT=max(PVal);
    TVal=max(MT);
    
    % ����ʱ��
    ObjV(i,1)=TVal;
    
    % ��ʼ��
    if i==1
        Val1=PVal;
        Val2=P;
        MinVal=ObjV(i,1);
    end
    
    % ��¼��С�ĵ��ȹ���ʱ�䡢��ѵ��ȹ���ʱ�䡢�������ĵ��ȹ���
    if MinVal> ObjV(i,1)
        Val1=PVal;
        Val2=P;
        MinVal=ObjV(i,1);
    end
end
 
PVal=Val1;        % ��ѵ��ȹ���ʱ��
P=Val2;           % �������ĵ��ȹ���




