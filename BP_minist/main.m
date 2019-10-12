clc;
clear all;
close all;
%% 读取图像
root='./data/training';
img=read_train(root);         
%% 提取特征
img_feature=feature_lattice(img);
%% 构造标签
class=33;                   %十行的向量，对应位置是1，其他为0
numberpclass=500;       
ann_label=zeros(class,numberpclass*class);            %lable是标签
ann_data=img_feature;                           
for i=1:class                   
 for j=numberpclass*(i-1)+1:numberpclass*i   %给每一个图片打上标签
     ann_label(i,j)=1;                 
 end
end

%% 选定训练集和测试集
k=rand(1,numberpclass*class);  
[m,n]=sort(k);  
ntraindata=4500;       %练神经网络，做训练    
ntestdata=500;          %未出现过的，做测试   
train_data=ann_data(:,n(1:ntraindata));                    %切割35行500列
test_data=ann_data(:,n(ntraindata+1:numberpclass*class));   %10行500列
train_label=ann_label(:,n(1:ntraindata));                 
test_label=ann_label(:,n(ntraindata+1:numberpclass*class)); %打标签
%% BP神经网络创建，训练和测试
net=network_train(train_data,train_label);      %训练数据训练标签
predict_label=network_test(test_data,net);           %预测，剩下的500个
%% 正确率计算
[u,v]=find(test_label==1);    %下标索引
label=u';
error=label-predict_label;
accuracy=size(find(error==0),2)/size(label,2)           %准确率
figure(1)
plot(error)
title('BP网络分类误差','fontsize',12)
xlabel('输入数字','fontsize',12)
ylabel('分类误差','fontsize',12)

root='./d';


