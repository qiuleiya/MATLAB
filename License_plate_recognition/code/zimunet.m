function net = zimunet()
%UNTITLED14 此处显示有关此函数的摘要
%   此处显示详细说明
root2='./data/zimu/';
img2=read_train(root2);
%% 提取特征
img_feature2=feature_lattice(img2);

%% 构造字母的标签
class2=26;                   %十行的向量，对应位置是1，其他为0
numberpclass=200;       
ann_label2=zeros(class2,numberpclass*class2);            %lable是标签
ann_data12=img_feature2;                           
for i=1:class2                 
 for j=numberpclass*(i-1)+1:numberpclass*i   %给每一个图片打上标签
     ann_label2(i,j)=1;                 
 end
end

%% 字母 测试训练集
k2=rand(1,numberpclass*class2);  
[m2,n2]=sort(k2);  
ntraindata2=4000;       %练神经网络，做训练    
ntestdata2=1200;          %未出现过的，做测试   
train_data2=ann_data12(:,n2(1:ntraindata2));                    %切割35行500列
test_data2=ann_data12(:,n2(ntraindata2+1:numberpclass*class2));   %10行500列
train_label2=ann_label2(:,n2(1:ntraindata2));                 
test_label2=ann_label2(:,n2(ntraindata2+1:numberpclass*class2)); %打标签


%% BP神经网络创建，训练和测试
net2=network_train(train_data2,train_label2);      %训练数据训练标签
predict_label2=network_test(test_data2,net2);           %预测，剩下的500个

%% % 字母正确率
[u,v]=find(test_label2==1);    %下标索引
label2=u';
error=label2-predict_label2;
accuracy2=size(find(error==0),2)/size(label2,2);          %准确率

 %%   
str1=['字母神经网络识别训练的准确率为',num2str(accuracy2)];
msgbox(str1)
%%
figure('name','字母神经网络模型各阈值权值');
yuzhiquanzhi(net2);

net=net2;
end

