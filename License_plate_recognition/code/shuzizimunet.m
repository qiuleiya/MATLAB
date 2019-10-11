function net = shuzizimunet()
%UNTITLED14 此处显示有关此函数的摘要
%   此处显示详细说明
root4='./data/numberzimu/';
img4=read_train(root4);
%% 提取特征
img_feature4=feature_lattice(img4);

%% 构造数字的标签
class4=34;                   %十行的向量，对应位置是1，其他为0
numberpclass=200;       
ann_label4=zeros(class4,numberpclass*class4);            %lable是标签
ann_data4=img_feature4;                           
for i=1:class4                   
 for j=numberpclass*(i-1)+1:numberpclass*i   %给每一个图片打上标签
     ann_label4(i,j)=1;                 
 end
end

%% 选定训练集和测试集数字1
k4=rand(1,numberpclass*class4);  
[m4,n4]=sort(k4);  
ntraindata4=6000;       %练神经网络，做训练    
ntestdata4=800;          %未出现过的，做测试   
train_data4=ann_data4(:,n4(1:ntraindata4));                    %切割35行500列
test_data4=ann_data4(:,n4(ntraindata4+1:numberpclass*class4));   %10行500列
train_label4=ann_label4(:,n4(1:ntraindata4));                 
test_label4=ann_label4(:,n4(ntraindata4+1:numberpclass*class4)); %打标签


%% BP神经网络创建，训练和测试
 net4=shuzizimunetwork_train(train_data4,train_label4);      %训练数据训练标签
 predict_label4=network_test(test_data4,net4);           %预测，剩下的500个

  
  %% 数字正确率计算
[u,v]=find(test_label4==1);    %下标索引
label4=u';
error=label4-predict_label4;
accuracy4=size(find(error==0),2)/size(label4,2)           %准确率
%%
str1=['数字+字母神经网络识别训练的准确率为',num2str(accuracy4)];
msgbox(str1)
%%
% hun=char(['0' '1' 'A':'H' 'JK' '2' 'L':'N' 'P':'V' '3' 'W':'Z' '4':'9']);
% [filename, pathname] = uigetfile('*.bmp', '读取图片文件'); %选择图片文件
% 
%        pathfile=fullfile(pathname, filename);  %获得图片路径
%      
%        z=imread(pathfile);     %将图片读入矩阵
%      a=hun(testAnser(z,net4));
%      figure;
%      imshow(z);title(['识别结果为=' num2str(a)]);
%
figure('name','数字字母神经网络模型各阈值权值');
yuzhiquanzhi(net4);
net=net4;
end