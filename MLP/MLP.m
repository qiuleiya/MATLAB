% 2. ��֪���������ѧϰ��ѵ��
% 2.1 ����ѧϰ
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
% 2.2 ����ѵ��
net=init(net);
p1=[2;2];t1=0;p2=[1;-2];t2=1;p3=[-2;2];t3=0;p4=[-1;1];t4=1;
net.trainParam.epochs=1;     %�����������ѵ������Ϊ1��
net=train(net,p1,t1);         %ʹ��ѵ�������Դ������������ѵ��
w=net.IW{1,1};
b=net.b{1};
a0=sim(net,p1)                 %��ѵ�����������з���
net=init(net);
p=[[1;2] [2;-2] [-1;2] [-1;1]];
t=[0 1 0 1];                 %�����Ŀ�����
net.trainParam.epochs=1;
net=train(net,p,t);
a1=sim(net,p)
net=init(net);
net.trainParam.epochs=2;
net=train(net,p,t);
a2=sim(net,p)
net=init(net);
net.trainParam.epochs=20;      %�����������ѵ������Ϊ20�� 
net=train(net,p,t);
a20=sim(net,p)

% 3. �������֪����������
P=[-0.1 0.3 0.5  0.4 ;-0.4 0.5 -0.5 1];
T=[0 1 0 1];
net=newp([-1 1;-1 1],1);
plotpc(net.IW{1,1},net.b{1})  %%��������
plotpv(P,T);                % plotpv�������ø�֪��������������Ŀ��������������������ͼ��
net=adapt(net,P,T);  %��������������������net 
net.IW{1,1}
net.b{1}
plotpc(net.IW{1,1},net.b{1})  %���»�������
net.adaptParam.passes=3;      %��ѵ���������ظ�����Ϊ3
net=adapt(net,P,T);
net.IW{1,1}
net.b{1}
plotpc(net.IW{1},net.b{1})
net.adaptParam.passes=6;
net=adapt(net,P,T);
net.IW{1,1}
net.b{1}
plotpc(net.IW{1},net.b{1})
%����
%a=sim(net,p);
%plotpv(p,a)
p=[0.5 0.2;1.0 0.1];
a=sim(net,p);
plotpv(p,a);
hold on;
plotpv(P,T);
plotpc(net.IW{1},net.b{1})
%��֪���ܹ���ȷ���࣬�Ӷ��������)