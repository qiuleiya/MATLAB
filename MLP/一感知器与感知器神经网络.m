% ��һ��  ��֪��
% 1. ��֪��������Ĺ���
% 1.1  ��������
net=newp([0 3],1);%�����룬����ֵΪ[0,2]֮�����
inputweights=net.inputweights{1,1};%��һ���Ȩ��Ϊ1
biases=net.biases{1};%��ֵΪ1
% 1.2  �������

net=newp([-3 3;-2 3],1);%�������룬һ����Ԫ��Ĭ�϶�ֵ����
net.IW{1,1}=[-1 1];%Ȩ�أ�net.IW{i,j}��ʾ��i�������j����Ԫ��Ȩ������
net.IW{1,1}
net.b{1}=1;
net.b{1}
p1=[1;1],a1=sim(net,p1)
p2=[1;-1],a2=sim(net,p2)
p3={[1;1] [1 ;-1]},a3=sim(net,p3) %�������ݷ�һ��
p4=[1 1;1 -1],a4=sim(net,p4)%Ҳ���Է��ھ�������
net.IW{1,1}=[3,4];
net.b{1}=[1];
a1=sim(net,p1)
% 1.3  �����ʼ��
net=init(net);
wts=net.IW{1,1}
bias=net.b{1}
% �ı�Ȩֵ����ֵΪ�����
net.inputweights{1,1}.initFcn='rands';
net.biases{1}.initFcn='rands';
net=init(net);
bias=net.b{1}
wts=net.IW{1,1}
a1=sim(net,p1)

% 2. ��֪���������ѧϰ��ѵ��
% 1 ����ѧϰ
net=newp([-2 2;-2 2],1);
net.b{1}=[0];
w=[1 -0.8]
net.IW{1,1}=w;
p=[1;2];
t=[1];
a=sim(net,p)
e=t-a
help learnp
dw=learnp(w,p,[],[],[],[],e,[],[],[],[],[])
w=w+dw
net.IW{1,1}=w;
a=sim(net,p)


net = newp([0 1; -2 2],1);
P = [0 0 1 1; 0 1 0 1];
T = [0 1 1 1];
Y = sim(net,P)
net.trainParam.epochs = 20;
net = train(net,P,T);
Y = sim(net,P)


% 2 ����ѵ��
net=init(net);
p1=[2;2];t1=0;p2=[1;-2];t2=1;p3=[-2;2];t3=0;p4=[-1;1];t4=1;
net.trainParam.epochs=1;
net=train(net,p1,t1)
w=net.IW{1,1}
b=net.b{1}
a=sim(net,p1)
net=init(net);
p=[[2;2] [1;-2] [-2;2] [-1;1]];
t=[0 1 0 1];%ʵ��
net.trainParam.epochs=1;
net=train(net,p,t);
a=sim(net,p)
net=init(net);
net.trainParam.epochs=2;
net=train(net,p,t);
a=sim(net,p)
net=init(net);
net.trainParam.epochs=20;
net=train(net,p,t);
a=sim(net,p)

% 3. �������֪��������ӻ�����
P=[-0.5 1 0.5 -0.1;-0.5 1 -0.5 1];
T=[1 1 0 1]
net=newp([-1 1;-1 1],1);
plotpv(P,T);
plotpc(net.IW{1,1},net.b{1});
%hold on;
%plotpv(P,T);
net=adapt(net,P,T);
net.IW{1,1}
net.b{1}
plotpv(P,T);
plotpc(net.IW{1,1},net.b{1})
net.adaptParam.passes=3;
net=adapt(net,P,T);
net.IW{1,1}
net.b{1}
plotpc(net.IW{1},net.b{1})
net.adaptParam.passes=6;
net=adapt(net,P,T)
net.IW{1,1}
net.b{1}
plotpv(P,T);
plotpc(net.IW{1},net.b{1})

plotpc(net.IW{1},net.b{1})
%����
a=sim(net,p);
plotpv(p,a)

p=[0.7;1.2]
a=sim(net,p);
plotpv(p,a);
hold on;
plotpv(P,T);
plotpc(net.IW{1},net.b{1})
%��֪���ܹ���ȷ���࣬�Ӷ�������С�

% 4. ��׼��ѧϰ����ѵ����������
P=[-0.5 -0.5 0.3 -0.1 -40;-0.5 0.5 -0.5 1.0 50]
T=[1 1 0 0 1];
net=newp([-40 1;-1 50],1);
plotpv(P,T);%������е�
hold on;
linehandle=plotpc(net.IW{1},net.b{1});%����������
E=1;
net.adaptParam.passes=3;%passes������ѵ��������ѵ��ֵ�ظ��Ĵ�����
while (sse(E))
    [net,Y,E]=adapt(net,P,T);
    linehandle=plotpc(net.IW{1},net.b{1},linehandle);
    drawnow;
end;
axis([-2 2 -2 2]);
net.IW{1}
net.b{1}
%����һ����������ѧϰ���Ǳ�׼��ѧϰ����learnp��
hold off;
net=init(net);
net.adaptParam.passes=3;
net=adapt(net,P,T);
plotpc(net.IW{1},net.b{1});
axis([-2 2 -2 2]);
net.IW{1}
net.b{1}
%�޷���ȷ����
%��׼��ѧϰ��������ѵ���ٶ�Ҫ�죡

% ѵ����������
% �ñ�׼����֪��ѧϰ���򣨱�׼��ѧϰ��learnpn�����з���
net=newp([-40 1;-1 50],1,'hardlim','learnpn');
plotpv(P,T);
linehandle=plotpc(net.IW{1},net.b{1});
e=1;
net.adaptParam.passes=3;
net=init(net);
linehandle=plotpc(net.IW{1},net.b{1});
while (sse(e))
[net,Y,e]=adapt(net,P,T);
linehandle=plotpc(net.IW{1},net.b{1},linehandle);
end;
axis([-2 2 -2 2]);
net.IW{1}%Ȩ��
net.b{1}%��ֵ
%��ȷ����

 %�Ǳ�׼����֪��ѧϰ����ѵ�����������Ľ��
net=newp([-40 1;-1 50],1);
net.trainParam.epochs=30;
net=train(net,P,T);
pause;
linehandle=plotpc(net.IW{1},net.b{1});
hold on;
plotpv(P,T);
linehandle=plotpc(net.IW{1},net.b{1});
axis([-2 2 -2 2]);

% 5. ��ƶ����֪����Ԫ�����������
p=[1.0 1.2 2.0 -0.8; 2.0 0.9 -0.5 0.7]
t=[1 1 0 1;0 1 1 0]
plotpv(p,t);
hold on;
net=newp([-0.8 1.2; -0.5 2.0],2);
linehandle=plotpc(net.IW{1},net.b{1});
net=newp([-0.8 1.2; -0.5 2.0],2);
linehandle=plotpc(net.IW{1},net.b{1});
e=1;
net=init(net);
while (sse(e))
[net,y,e]=adapt(net,p,t);
linehandle=plotpc(net.IW{1},net.b{1},linehandle);
drawnow;
end;
