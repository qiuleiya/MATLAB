function [hist]=FHist(temp,D)


% �˺���Ϊ��ȡ����Ŀ��ɫ��ֱ��ͼ
% temp-Ŀ������
% D-��ɫ�ռ�λ��
% m_wei(i,j)-���ص�Ȩֵ����
% hist-ɫ��ֱ��ͼ�ֲ�


E=256/D;
hist=zeros(1,D^3);
[a,b,c]=size(temp);


y(1)=a/2;
y(2)=b/2;
m_wei=zeros(a,b);%Ȩֵ����
h=y(1)^2+y(2)^2 ;%����


for i=1:a
	 for j=1:b
        dist=(i-y(1))^2+(j-y(2))^2;
        m_wei(i,j)=1-dist/h; %���ص�Ȩֵ����
	end
end
C=sum(sum(m_wei));%��һ��ϵ��
for i=1:a
    for j=1:b
	 %rgb��ɫ�ռ�����
        q_r=fix(double(temp(i,j,1))/E);  %fixΪ����0ȡ������
        q_g=fix(double(temp(i,j,2))/E);
        q_b=fix(double(temp(i,j,3))/E);
        q_temp=q_r*D^2+q_g*D+q_b;  %������ɫ����
        hist(q_temp+1)= hist(q_temp+1)+m_wei(i,j);  %���ص�Ȩ���ۻ�
	end
end
hist=hist/C;
end

