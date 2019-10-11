function net = hanzinet()
%汉字神经网络
%% 读取图像
root3='./data/hanzi/';
img3=read_train(root3);

%% 提取特征
img_feature3=hanzifeature(img3);

%% 构造汉字标签
class3=10;                   %十行的向量，对应位置是1，其他为0
numberpclass=200;       
ann_label3=zeros(class3,numberpclass*class3);            %lable是标签
ann_data13=img_feature3;                           
for i=1:class3                 
 for j=numberpclass*(i-1)+1:numberpclass*i   %给每一个图片打上标签
     ann_label3(i,j)=1;                 
 end
end
 %%  汉字训练集3
k3=rand(1,numberpclass*class3);  
[m3,n3]=sort(k3);  
ntraindata3=1800;       %练神经网络，做训练    
ntestdata3=200;          %未出现过的，做测试   
train_data3=ann_data13(:,n3(1:ntraindata3));                    %13*1800
test_data3=ann_data13(:,n3(ntraindata3+1:numberpclass*class3));   %13*200
train_label3=ann_label3(:,n3(1:ntraindata3));                 
test_label3=ann_label3(:,n3(ntraindata3+1:numberpclass*class3)); %打标签

 %% 汉字神经网络
net3=hanzinetwork_train(train_data3,train_label3);      %训练数据训练标签
predict_label3=network_test(test_data3,net3);           %预测，剩下的500个

%% 汉字识别正确率
[u,v]=find(test_label3==1);    %下标索引
label3=u';
error=label3-predict_label3;
accuracy3=size(find(error==0),2)/size(label3,2)           %准确率
%%
str1=['汉字神经网络识别训练的准确率为',num2str(accuracy3)];
msgbox(str1)
%%
 figure('name','汉字神经网络模型各阈值权值');
yuzhiquanzhi(net3);
net=net3;
end


