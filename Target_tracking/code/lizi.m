clc;
clear;
N=100;%%������
T=50;%%֡��

%% ѡȡĿ��
% Paths='';%%�ļ�·��
I=imread('img0/0329.jpg');%%����ͼƬ
figure(1);%%��ͼ
imshow(I);
[aa,bb,cc]=size(I);

[temp,rect]=imcrop(I); %%Ŀ��ѡȡ
[a,b,c]=size(temp);

v1=rect(1);
v2=rect(2);
v3=rect(3);
v4=rect(4);

tic_x=v1+v3/2;
tic_y=v2+v4/2;

X0=v1; %%��ʼ��
Y0=v2;

dX=[0;0];
dL=[0;0];

Hist0=FHist(temp,8);

%%���ӳ�ʼ��
xpart=zeros(2,N);
xhatPart=zeros(2,N);
R=5;%%R=5;
RR=30;%%RR=30;
for i=1:N  %%������
    xpart(:,i) = [X0;Y0] + RR* randn(2,1);  %%������̬����ֲ�
end


%% �����˲�
for i=1:T  %%����Ϊ
    if i==1
        Hist1=Hist0;%��������
    else
        Hist1=Hist2;
    end
    Im=imread(['img0/0',num2str(329+i),'.jpg']);%%����һ֡ͼ��
    
    for j=1:N
        if i~=1
            xpart(:,j)=xpart(:,j)+dX+R*randn(2,1);%%״̬Ԥ�� X��k|k-1��
        end
        rect=[xpart(1,j),xpart(2,j),v3,v4];
        temp=imcrop(Im,rect);
        Hist2= FHist(temp,8);% ��Ԥ��ֵ�۲죬
        bc(j)=Bhatt(Hist0,Hist2);
        db=1-bc(j);
        q(j) = exp(-20*db); %����Ȩֵ����
    end
    aaaa=bc;
    q=q/sum(q);
    xxxx=xpart.*[q;q];
    yyyy=sum(xxxx,2);
    %%�ز���
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
    
    %%ȡ��ֵ
    bbbb=mean(xpart,2);
    xhatPart(:,i) = yyyy;
    rect=[xhatPart(1,i),xpart(2,j),v3,v4];
    temp=imcrop(Im,rect);
    Hist2= FHist(temp,8); % ��Ԥ��ֵ�۲죬
    cccc=Bhatt(Hist1,Hist2);
    Xcb(i)=cccc;
    
    if i==1
        dX=xhatPart(:,i)-[X0;Y0];
    else
        dX=xhatPart(:,i)-xhatPart(:,i-1);
    end
    
    %%����
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
    
    %%��ʾ���ٽ��
    
    figure(3)
%     clf
    imshow(uint8(Im));
    title('�����˲�Ŀ����ٽ�������˶��켣');
    hold on;
    plot([v1,v1+v3],[v2,v2],[v1,v1],[v2,v2+v4],[v1,v1+v3],...
        [v2+v4,v2+v4],[v1+v3,v1+v3],[v2,v2+v4],'LineWidth',1,'Color','r')
    plot(tic_x,tic_y,'LineWidth',2,'Color','b');
end
%%
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
function C=Bhatt( R , Q)
C=sum(sqrt(R.*Q));
end