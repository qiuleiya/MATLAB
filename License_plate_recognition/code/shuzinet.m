function net = shuzinet()
%UNTITLED14 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

root1='./data/number/';
img1=read_train(root1);
%% ��ȡ����
img_feature1=feature_lattice(img1);

%% �������ֵı�ǩ
class1=10;                   %ʮ�е���������Ӧλ����1������Ϊ0
numberpclass=200;       
ann_label1=zeros(class1,numberpclass*class1);            %lable�Ǳ�ǩ
ann_data1=img_feature1;                           
for i=1:class1                   
 for j=numberpclass*(i-1)+1:numberpclass*i   %��ÿһ��ͼƬ���ϱ�ǩ
     ann_label1(i,j)=1;                 
 end
end

%% ѡ��ѵ�����Ͳ��Լ�����1
k1=rand(1,numberpclass*class1);  
[m1,n1]=sort(k1);  
ntraindata1=1500;       %�������磬��ѵ��    
ntestdata1=500;          %δ���ֹ��ģ�������   
train_data1=ann_data1(:,n1(1:ntraindata1));                    %
test_data1=ann_data1(:,n1(ntraindata1+1:numberpclass*class1));   %
train_label1=ann_label1(:,n1(1:ntraindata1));                 
test_label1=ann_label1(:,n1(ntraindata1+1:numberpclass*class1)); %���ǩ


%% BP�����紴����ѵ���Ͳ���
 net1=network_train(train_data1,train_label1);      %ѵ������ѵ����ǩ
 predict_label1=network_test(test_data1,net1);           %Ԥ�⣬ʣ�µ�500��

  
  %% ������ȷ�ʼ���
[u,v]=find(test_label1==1);    %�±�����
label1=u';
error=label1-predict_label1;
accuracy1=size(find(error==0),2)/size(label1,2)           %׼ȷ��
%%
str1=['����������ʶ��ѵ����׼ȷ��Ϊ',num2str(accuracy1)];
msgbox(str1)
%%
% shuzi=char(['0':'9']);
% [filename, pathname] = uigetfile('*.bmp', '��ȡͼƬ�ļ�'); %ѡ��ͼƬ�ļ�
% 
%        pathfile=fullfile(pathname, filename);  %���ͼƬ·��
%      
%        M=imread(pathfile);     %��ͼƬ�������
%        x=shuzi(testAnser(M,net1));
%        figure;
%      imshow(M);title(['ʶ����Ϊ=' x]);
% 
figure('name','����������ģ�͸���ֵȨֵ');
yuzhiquanzhi(net1);
net=net1;
end

