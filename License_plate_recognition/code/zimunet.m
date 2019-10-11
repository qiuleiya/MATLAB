function net = zimunet()
%UNTITLED14 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
root2='./data/zimu/';
img2=read_train(root2);
%% ��ȡ����
img_feature2=feature_lattice(img2);

%% ������ĸ�ı�ǩ
class2=26;                   %ʮ�е���������Ӧλ����1������Ϊ0
numberpclass=200;       
ann_label2=zeros(class2,numberpclass*class2);            %lable�Ǳ�ǩ
ann_data12=img_feature2;                           
for i=1:class2                 
 for j=numberpclass*(i-1)+1:numberpclass*i   %��ÿһ��ͼƬ���ϱ�ǩ
     ann_label2(i,j)=1;                 
 end
end

%% ��ĸ ����ѵ����
k2=rand(1,numberpclass*class2);  
[m2,n2]=sort(k2);  
ntraindata2=4000;       %�������磬��ѵ��    
ntestdata2=1200;          %δ���ֹ��ģ�������   
train_data2=ann_data12(:,n2(1:ntraindata2));                    %�и�35��500��
test_data2=ann_data12(:,n2(ntraindata2+1:numberpclass*class2));   %10��500��
train_label2=ann_label2(:,n2(1:ntraindata2));                 
test_label2=ann_label2(:,n2(ntraindata2+1:numberpclass*class2)); %���ǩ


%% BP�����紴����ѵ���Ͳ���
net2=network_train(train_data2,train_label2);      %ѵ������ѵ����ǩ
predict_label2=network_test(test_data2,net2);           %Ԥ�⣬ʣ�µ�500��

%% % ��ĸ��ȷ��
[u,v]=find(test_label2==1);    %�±�����
label2=u';
error=label2-predict_label2;
accuracy2=size(find(error==0),2)/size(label2,2);          %׼ȷ��

 %%   
str1=['��ĸ������ʶ��ѵ����׼ȷ��Ϊ',num2str(accuracy2)];
msgbox(str1)
%%
figure('name','��ĸ������ģ�͸���ֵȨֵ');
yuzhiquanzhi(net2);

net=net2;
end

