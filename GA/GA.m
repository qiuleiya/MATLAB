% Optimizing a function  using Simple Genetic Algorithm with elitist preserved

%Max f(x1,x2)=100*(x1*x1-x2).^2+(1-x1).^2; -2.0480<=x1,x2<=2.0480


%����Ϊ���롣�������ֵΪ3904.9262����ʱ����������Ϊ-2.0480����ʱ����־ֲ���ֵ����ʱһ������Ϊ-2.0480��һ��Ϊ2.0480����
%�����pm=0.05���������pc=0.8��

clc;clear all;

format long;%�趨������ʾ��ʽ

%��ʼ������

T=500;%�������

N=80;% Ⱥ���ģ

pm=0.05;pc=0.8;%����������

umax=30;umin=-30;%����ȡֵ��Χ

L=10;%���������ִ����ȣ��ܱ��볤��Dim*L
Dim=5;%Dimά�ռ�����

bval=round(rand(N,Dim*L));%��ʼ��Ⱥ��round����Ϊ��������

bestv=-inf;%������Ӧ�ȳ�ֵ
funlabel=2;       %ѡ����Ż��ĺ�����1ΪRastrigin,2ΪSchaffer,3ΪGriewank
Drawfunc(funlabel);%�������Ż��ĺ�����ֻ������ά�����Ϊ���ӻ����

%������ʼ

for ii=1:T

%���룬������Ӧ��

    for i=1:N  %��ÿһ���ĵ�i������
        for k=1:Dim
            y(k)=0;
            for j=1:1:L  %��1��L��ÿ�μ���1

               y(k)=y(k)+bval(i,k*L-j+1)*2^(j-1);%�ѵ�i������ת��Ϊʮ���Ƶ�ֵ������y1�ǵ�һά

            end 
            x(k)=(umax-umin)*y(k)/(2^L-1)+umin;%ת��Ϊʵ�ʵ�x1
        end

  %     obj(i)=100*(x1*x1-x2).^2+(1-x1).^2; %Ŀ�꺯�� 
       obj(i)=fun(x,funlabel);
       xx(i,:)=x;

    end

    func=obj;%Ŀ�꺯��ת��Ϊ��Ӧ�Ⱥ���

    p=func./sum(func);

    q=cumsum(p);%�ۼ�

    [fmax,indmax]=max(func);%�󵱴���Ѹ���

   if fmax>=bestv

      bestv=fmax;%��ĿǰΪֹ������Ӧ��ֵ

      bvalxx=bval(indmax,:);%��ĿǰΪֹ���λ��

      optxx=xx(indmax,:);%��ĿǰΪֹ���Ų���

   end   

   Bfit1(ii)=bestv; % �洢ÿ����������Ӧ��

%%%%�Ŵ�������ʼ

%���̶�ѡ��

 for i=1:(N-1)

    r=rand;

    tmp=find(r<=q);

    newbval(i,:)=bval(tmp(1),:);

 end

  newbval(N,:)=bvalxx;%���ű���

  bval=newbval;

%���㽻��

    for i=1:2:(N-1)

       cc=rand;

       if cc<pc

           point=ceil(rand*(2*L-1));%ȡ��һ��1��2L-1������

           ch=bval(i,:);

           bval(i,point+1:2*L)=bval(i+1,point+1:2*L);

           bval(i+1,point+1:2*L)=ch(1,point+1:2*L);

        end

    end   

    bval(N,:)=bvalxx;%���ű���

    %λ�����

    mm=rand(N,Dim*L)<pm;%N��

    mm(N,:)=zeros(1,Dim*L);%���һ���Ǿ�Ӣ�����죬ǿ�Ƹ�0

    bval(mm)=1-bval(mm); 

end

%���
figure;

plot(-Bfit1);% ����������Ӧ�Ƚ�������

bestv   %���������Ӧ��ֵ

optxx    %������Ų���
