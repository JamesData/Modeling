function ChromNew=aberrance(Chrom,MUTR)

% Chrom=[1 3 2 3 1 2 1 3 2; 
%     1 1 2 3 3 1 2 3 2;
%     1 3 2 3 2 2 1 3 1;
%     1 3 3 3 1 2 1 2 2;
%     2 3 2 3 1 2 1 3 1;
%     1 3 2 1 1 2 3 3 2 ;
%     3 3 2 1 2 2 1 3 1;
%     1 3 2 2 1 2 1 3 3;
%     1 3 3 2 2 2 1 3 1 ;
%     1 3 2 1 3 2 1 3 2 ]; 
%  
%   MUTR=0.2;
%  

%��ʼ��
[NIND,WNumber]=size(Chrom);
ChromNew=Chrom;

for i=1:NIND    
    %�Ƿ����
    if MUTR>rand;
        
        %����λ��
        Pos1=unidrnd(WNumber);
        Pos2=unidrnd(WNumber);
        
        %����λ�ò���ͬ
        while Pos1==Pos2      
            Pos2=unidrnd(WNumber);
        end 
        
        %ȡһ������
        S=Chrom(i,:); 
        
        %����
        temp=S(Pos1);
        S(Pos1)=S(Pos2);
        S(Pos2)=temp; 
        
        %���ݷ�����Ⱥ
        ChromNew(i,:)=S;
    end
end

 