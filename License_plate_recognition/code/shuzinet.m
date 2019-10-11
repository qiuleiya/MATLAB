function net = shuzinet()
%UNTITLED14 此处显示有关此函数的摘要
%   此处显示详细说明

root1='./data/number/';
img1=read_train(root1);
%% 提取特征
img_feature1=feature_lattice(img1);

%% 构造数字的标签
class1=10;                   %十行的向量，对应位置是1，其他为0
numberpclass=200;       
ann_label1=zeros(class1,numberpclass*class1);            %lable是标签
ann_data1=img_feature1;                           
for i=1:class1                   
 for j=numberpclass*(i-1)+1:numberpclass*i   %给每一个图片打上标签
     ann_label1(i,j)=1;                 
 end
end

%% 选定训练集和测试集数字1
k1=rand(1,numberpclass*class1);  
[m1,n1]=sort(k1);  
ntraindata1=1500;       %练神经网络，做训练    
ntestdata1=500;          %未出现过的，做测试   
train_data1=ann_data1(:,n1(1:ntraindata1));                    %
test_data1=ann_data1(:,n1(ntraindata1+1:numberpclass*class1));   %
train_label1=ann_label1(:,n1(1:ntraindata1));                 
test_label1=ann_label1(:,n1(ntraindata1+1:numberpclass*class1)); %打标签


%% BP神经网络创建，训练和测试
 net1=network_train(train_data1,train_label1);      %训练数据训练标签
 predict_label1=network_test(test_data1,net1);           %预测，剩下的500个

  
  %% 数字正确率计算
[u,v]=find(test_label1==1);    %下标索引
label1=u';
error=label1-predict_label1;
accuracy1=size(find(error==0),2)/size(label1,2)           %准确率
%%
str1=['数字神经网络识别训练的准确率为',num2str(accuracy1)];
msgbox(str1)
%%
% shuzi=char(['0':'9']);
% [filename, pathname] = uigetfile('*.bmp', '读取图片文件'); %选择图片文件
% 
%        pathfile=fullfile(pathname, filename);  %获得图片路径
%      
%        M=imread(pathfile);     %将图片读入矩阵
%        x=shuzi(testAnser(M,net1));
%        figure;
%      imshow(M);title(['识别结果为=' x]);
% 
figure('name','数字神经网络模型各阈值权值');
yuzhiquanzhi(net1);
net=net1;
end

