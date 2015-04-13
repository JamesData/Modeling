%% [MinVal,P] = JSP(T,Jm,NIND,MAXGEN,GGAP,XOVR,MUTR)
% ����˵����
% T          - ������������ʹ�õ�ʱ��
% Jm         - ������������ʹ�õĻ���
% NIND       - ������Ŀ(Number of individuals)
% MAXGEN     - ����Ŵ�����(Maximum number of generations)
% GGAP       - ����(Generation gap)
% XOVR       - ������
% MUTR       - ������

% ���� MinVal = JSP(T,Jm,40,50,0.9,0.8,0.6)
% NIND=60;        ������Ŀ(Number of individuals)
% MAXGEN=500;     ����Ŵ�����(Maximum number of generations)
% GGAP=0.9;       ����(Generation gap)
% XOVR=0.8;       ������
% MUTR=0.6;       ������
%%

function [MinVal,P] = JSP(T,Jm,NIND,MAXGEN,GGAP,XOVR,MUTR)

[PNumber,MNumber]=size(T);              % PNumber��������   % MNumber�����������������
gen=0;                                  % ��������
trace=zeros(2, MAXGEN);                 % Ѱ�Ž���ĳ�ʼֵ

% ��ʼ��Ⱥ

% ���ڵ������ȼ��ı��뷽����ÿ�������Ӧһ�����򣬴���ù����ڽ��е��Ȳ���ʱ�Ĵ������ȼ���
% ����һ��3!3���⣬��Ⱦɫ����1-3��������ʾΪ�� [1 3 2 1 1 3 3 2 2]
% �����빤��Ķ�Ӧ��ϵ���£�
%  P11  P31  P21  P12  P13  P32  P33  P22  P23
%  [1    3    2    1    1    3    3    2    2 ]
% ����Pij��ʾ��i������ĵ�j������
WNumber=PNumber*MNumber;                % ����������
Chrom=zeros(NIND,WNumber);              % ���弯�Ͼ���
Number=zeros(1,PNumber);                % ��ʼ��Ⱦɫ�弯�Ͼ�����ʱ����
for i=1:PNumber
    Number(i)=MNumber;
end
% ������ɹ�������
for j=1:NIND
    WPNumberTemp=Number;
    for i=1:WNumber
        val=unidrnd(PNumber);          % unidrnd: Discrete uniform random numbers��one to N
        
        while WPNumberTemp(val)==0     % �жϸù����Ƿ������
            val=unidrnd(PNumber);
        end
        
        Chrom(j,i)= val;
        WPNumberTemp(val)=WPNumberTemp(val)-1;
    end
end

% ����Ŀ�꺯��ֵ
[PVal, ObjV, P]=cal(Chrom,T,Jm);
% PVal      - Ϊ��ѵ��ȹ���ʱ��
% ObjV      - ΪȺ��ÿ������ĵ��ȹ���ʱ��
% P         - Ϊ�������ĵ��ȹ���

while gen<MAXGEN
    FitnV=ranking(ObjV);                                 % ������Ӧ��ֵ(Assign fitness values)
    SelCh=select('sus', Chrom, FitnV, GGAP);             % ѡ��
    SelCh=across(SelCh,XOVR,PNumber);                    % ����
    SelCh=aberrance(SelCh,MUTR);                         % ����
    [PVal, ObjVSel, P]=cal(SelCh,T,Jm);                  % ����Ŀ�꺯��ֵ
    [Chrom, ObjV] =reins(Chrom, SelCh,1, 1, ObjV, ObjVSel);            % �ز����Ӵ�������Ⱥ
    gen=gen+1;                                           % ������������
    
    % ������Ž⼰����ţ�����Ŀ�꺯��ͼ���б����YΪ���Ž�,IΪ��Ⱥ�����
    % �Ŵ��㷨���ܸ���
    trace(1, gen)=min(ObjV);
    trace(2, gen)=mean(ObjV);
    
    % ��ʼ��
    if gen==1
        Val1=PVal;
        Val2=P;
        MinVal=min(ObjV);                  % ��ʼ����С���ȹ���ʱ��
    end
    % ��¼��ѵ��ȹ���ʱ�䡢�������ĵ��ȹ�����С�ĵ��ȹ���ʱ��
    if MinVal> trace(1,gen)
        Val1=PVal;
        Val2=P;
        MinVal=trace(1,gen);
    end
end

PVal=Val1;                  % ����ʱ��
P=Val2;                     % ����

% ������
save('Result\PVal.mat','PVal');
save('Result\P.mat','P');

% ��ʾ��ı仯
figure(1);
hold on;
plot([0,0],[0,0]);
BestV=plot(trace(1,:),'r');
hold on;
MeanV=plot(trace(2,:),'b');
grid;
legend([BestV,MeanV],'��ı仯','��Ⱥ��ֵ�ı仯');
% ��ʾ���
figure(2);
for i=1:WNumber
    val= P(1,i);
    a=(mod(val,10))+1;                             % Modulus after division
    b=((val-a+1)/10);
    mText=Jm(b,a);
    PlotRec(PVal(1,i),PVal(2,i),mText);
    hold on;
    mPoint1=PVal(1,i);
    mPoint2=PVal(2,i);
    x1=mPoint1;
    y1=mText-0.5;
    x2=mPoint2;
    y2=mText-0.5;
    x3=mPoint2;
    y3=mText;
    x4=mPoint1;
    y4=mText;
    fill([x1,x2,x3,x4],[y1,y2,y3,y4],[1,0.5,1]);
    word=num2str(P(1,i));
    %text(0.5*mPoint1+0.5*mPoint2,mText-0.5,word);
    text(mPoint1,mText-0.7,word);
end
