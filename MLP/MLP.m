% 2. 感知器神经网络的学习和训练
% 2.1 网络学习
net=newp([-2 2;-2 2],1);
net.b{1}=[0];
w=[0.5 -0.6];
net.IW{1,1}=w;
p=[2;2];
t=[1];
a=sim(net,p)
e=t-a;
dw=learnp(w,p,[],[],[],[],e,[],[],[],[],[])  %dw=e*p
w+dw
% 2.2 网络训练
net=init(net);
p1=[2;2];t1=0;p2=[1;-2];t2=1;p3=[-2;2];t3=0;p4=[-1;1];t4=1;
net.trainParam.epochs=1;     %设置网络最大训练次数为1次
net=train(net,p1,t1);         %使用训练函数对创建的网络进行训练
w=net.IW{1,1};
b=net.b{1};
a0=sim(net,p1)                 %对训练后的网络进行仿真
net=init(net);
p=[[1;2] [2;-2] [-1;2] [-1;1]];
t=[0 1 0 1];                 %网络的目标矩阵
net.trainParam.epochs=1;
net=train(net,p,t);
a1=sim(net,p)
net=init(net);
net.trainParam.epochs=2;
net=train(net,p,t);
a2=sim(net,p)
net=init(net);
net.trainParam.epochs=20;      %设置网络最大训练次数为20次 
net=train(net,p,t);
a20=sim(net,p)

% 3. 二输入感知器分类问题
P=[-0.1 0.3 0.5  0.4 ;-0.4 0.5 -0.5 1];
T=[0 1 0 1];
net=newp([-1 1;-1 1],1);
plotpc(net.IW{1,1},net.b{1})  %%画分类线
plotpv(P,T);                % plotpv函数利用感知器的输入向量和目标向量来画输入向量的图像
net=adapt(net,P,T);  %利用输入样本调节神经网net 
net.IW{1,1}
net.b{1}
plotpc(net.IW{1,1},net.b{1})  %重新画分类线
net.adaptParam.passes=3;      %在训练过程中重复次数为3
net=adapt(net,P,T);
net.IW{1,1}
net.b{1}
plotpc(net.IW{1},net.b{1})
net.adaptParam.passes=6;
net=adapt(net,P,T);
net.IW{1,1}
net.b{1}
plotpc(net.IW{1},net.b{1})
%仿真
%a=sim(net,p);
%plotpv(p,a)
p=[0.5 0.2;1.0 0.1];
a=sim(net,p);
plotpv(p,a);
hold on;
plotpv(P,T);
plotpc(net.IW{1},net.b{1})
%感知器能够正确分类，从而网络可行)