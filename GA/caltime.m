%% function PVal=caltime(P,T,Jm)
% ����˵����    ���ݵ��ȹ���,��������ȹ���ʱ��
% ���������
%        P     Ϊ���ȹ���  
%        T     Ϊ������������ļӹ�ʱ�� 
%        Jm    Ϊ������������ʹ�õĻ��� 
% �������:
%        PVal  Ϊ���ȹ���ʼ�ӹ�ʱ�估���ʱ��
%%
function PVal=caltime(P,T,Jm)

% ȡ���������ͻ�������
[PNumber,MNumber]=size(T); 

% �����ܸ���
WNumber=PNumber*MNumber;
if WNumber~=length(P)
    error('input parameters disagree')
end

% ��ʼ��
TM=zeros(1,MNumber);        % ��¼��ǰ����ʼʱ��
TP=zeros(1,PNumber);        % ��¼����(ǰһ������)���ʱ��
PVal=zeros(2,WNumber);

% ������ȹ���ʱ��
for i=1: WNumber 
    
    % ȡ������
    val= P(1,i);
    a=(mod(val,10))+1;      % �����
    b=((val-a+1)/10);       % ������
    m=Jm(b,a);              % ������
    
    % ȡ�ӹ�ʱ��
    t=T(b,a);
    
    % ȡ�����ӹ�������Ŀ�ʼʱ���ǰ��һ����������ʱ��
    TMval=TM(1,m);
    TPval=TP(1,b); 
    
    % �����ӹ�������Ŀ�ʼʱ�����ǰ��һ����������ʱ ��ȡ�����ӹ�������Ŀ�ʼʱ��
    if TMval>TPval 
        val=TMval;
    % ȡǰ��һ����������ʱ��  
    else
        val=TPval;
    end
    
    % ����ʱ��
    PVal(1,i)=val;
    PVal(2,i)=val+t;
    
    % ��¼���ι���Ļ���ʱ��͹���ʱ��
    TM(1,m)=PVal(2,i);
    TP(1,b)=PVal(2,i); 
end

