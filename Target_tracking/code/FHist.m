function [hist]=FHist(temp,D)


% 此函数为提取区域目标色彩直方图
% temp-目标区域
% D-颜色空间位数
% m_wei(i,j)-像素点权值贡献
% hist-色彩直方图分布


E=256/D;
hist=zeros(1,D^3);
[a,b,c]=size(temp);


y(1)=a/2;
y(2)=b/2;
m_wei=zeros(a,b);%权值矩阵
h=y(1)^2+y(2)^2 ;%带宽


for i=1:a
	 for j=1:b
        dist=(i-y(1))^2+(j-y(2))^2;
        m_wei(i,j)=1-dist/h; %像素点权值分配
	end
end
C=sum(sum(m_wei));%归一化系数
for i=1:a
    for j=1:b
	 %rgb颜色空间量化
        q_r=fix(double(temp(i,j,1))/E);  %fix为趋近0取整函数
        q_g=fix(double(temp(i,j,2))/E);
        q_b=fix(double(temp(i,j,3))/E);
        q_temp=q_r*D^2+q_g*D+q_b;  %设置颜色分量
        hist(q_temp+1)= hist(q_temp+1)+m_wei(i,j);  %像素点权重累积
	end
end
hist=hist/C;
end

