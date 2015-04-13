%% [T,Jm] = GenInstance(PNumber,MNumber,InsNumber)
% ����ʵ���������롣ʹ����ɢ���ȷֲ����ɼӹ�����ʱ��͹����ӹ�������
% ����˵����
% PNumber       - ��������
% MNumber       - ������ÿ��������������
% InsNumber     - ʵ������
% T             - ������������ʹ�õ�ʱ����󼯺�
% Jm            - ������������ʹ�õĻ������󼯺�
%%
function [T,Jm] = GenInstance(PNumber,MNumber,InsNumber)

T = zeros(PNumber,MNumber,InsNumber);
Jm = zeros(PNumber,MNumber,InsNumber);
for i = 1 : InsNumber
    % ����ʱ�����
    t = unidrnd(100,PNumber,MNumber);           % ��ɢ����ֲ�
    T(:,:,i) = t;
    % ��������
    jm = zeros(PNumber,MNumber);
    for j = 1 : PNumber                         % ��������
        jmTemp =zeros(1,MNumber);
        for k = 1 : MNumber                     % ��������
            jmVal = unidrnd(MNumber);
            while(jmTemp(1,jmVal) == 1)         % �жϸû������Ƿ��ѱ�����
                jmVal = unidrnd(MNumber);
            end
            jm(j,k) = jmVal;
            jmTemp(1,jmVal) = 1;                % ����ѷ���Ļ�����
        end
    end
    Jm(:,:,i) = jm;
end
end
