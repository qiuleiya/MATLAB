clc;
clear;
N=100;%%粒子数
T=50;%%帧数

%% 选取目标
% Paths='';%%文件路径
I=imread('img0/0329.jpg');%%读入图片
figure(1);%%绘图
imshow(I);
[aa,bb,cc]=size(I);

[temp,rect]=imcrop(I); %%目标选取
[a,b,c]=size(temp);

v1=rect(1);
v2=rect(2);
v3=rect(3);
v4=rect(4);

tic_x=v1+v3/2;
tic_y=v2+v4/2;

X0=v1; %%初始化
Y0=v2;

dX=[0;0];
dL=[0;0];

Hist0=FHist(temp,8);

%%粒子初始化
xpart=zeros(2,N);
xhatPart=zeros(2,N);
R=5;%%R=5;
RR=30;%%RR=30;
for i=1:N  %%粒子数
    xpart(:,i) = [X0;Y0] + RR* randn(2,1);  %%粒子正态随机分布
end


%% 粒子滤波
for i=1:T  %%长度为
    if i==1
        Hist1=Hist0;%特征更新
    else
        Hist1=Hist2;
    end
    Im=imread(['img0/0',num2str(329+i),'.jpg']);%%读入一帧图像
    
    for j=1:N
        if i~=1
            xpart(:,j)=xpart(:,j)+dX+R*randn(2,1);%%状态预测 X（k|k-1）
        end
        rect=[xpart(1,j),xpart(2,j),v3,v4];
        temp=imcrop(Im,rect);
        Hist2= FHist(temp,8);% 对预测值观察，
        bc(j)=Bhatt(Hist0,Hist2);
        db=1-bc(j);
        q(j) = exp(-20*db); %粒子权值分配
    end
    aaaa=bc;
    q=q/sum(q);
    xxxx=xpart.*[q;q];
    yyyy=sum(xxxx,2);
    %%重采样
    for ii = 1 : N
        u = rand; % uniform random number between 0 and 1
        qs = 0;
        for jj = 1 : N
            qs = qs + q(jj);
            if qs >= u
                xpart(:,ii) = xpart(:,jj);
                break;
            end
        end
    end
    
    %%取均值
    bbbb=mean(xpart,2);
    xhatPart(:,i) = yyyy;
    rect=[xhatPart(1,i),xpart(2,j),v3,v4];
    temp=imcrop(Im,rect);
    Hist2= FHist(temp,8); % 对预测值观察，
    cccc=Bhatt(Hist1,Hist2);
    Xcb(i)=cccc;
    
    if i==1
        dX=xhatPart(:,i)-[X0;Y0];
    else
        dX=xhatPart(:,i)-xhatPart(:,i-1);
    end
    
    %%更新
    rect=[xhatPart(1,i),xhatPart(2,i),v3,v4];
    temp=imcrop(Im,rect);
    
    v1=rect(1);
    v2=rect(2);
    v3=rect(3);
    v4=rect(4);
    
    tic_x=[tic_x;v1+v3/2];
    tic_y=[tic_y;v2+v4/2];

    if isnan(dX(1))
        break;
    end
    
    if ( v1<0 || v2<0 || v1+v3>bb || v2+v4>aa )
        break;
    end
    
    %%显示跟踪结果
    
    figure(3)
%     clf
    imshow(uint8(Im));
    title('粒子滤波目标跟踪结果及其运动轨迹');
    hold on;
    plot([v1,v1+v3],[v2,v2],[v1,v1],[v2,v2+v4],[v1,v1+v3],...
        [v2+v4,v2+v4],[v1+v3,v1+v3],[v2,v2+v4],'LineWidth',1,'Color','r')
    plot(tic_x,tic_y,'LineWidth',2,'Color','b');
end
%%
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
function C=Bhatt( R , Q)
C=sum(sqrt(R.*Q));
end