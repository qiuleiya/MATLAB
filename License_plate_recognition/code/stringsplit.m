function [PIN0,PIN1,PIN2,PIN3,PIN4,PIN5,PIN6]=stringsplit(qiegeimg)
%�ַ��ָ�
%% ת���ɻҶ�ͼ��
qiegeimg1 = rgb2gray(qiegeimg);    % RGBͼ��ת�Ҷ�ͼ��
figure;
subplot(3, 2, 1);
imshow(qiegeimg1);
title('�Ҷ�ͼ��');
subplot(3, 2, 2);
imhist(qiegeimg1);
title('�Ҷȴ����ĻҶ�ֱ��ͼ');

%% ֱ��ͼ���⻯
qiegeimg2 = histeq(qiegeimg1);
subplot(3, 2, 3);
imshow(qiegeimg2);
title('ֱ��ͼ���⻯��ͼ��');
subplot(3,2,4);
imhist(qiegeimg2);
title('ֱ��ͼ');

%% ��ֵ������
qiegeimg3 = im2bw(qiegeimg2, 0.76);
subplot(3, 2, 5);
imshow(qiegeimg3);
title('���ƶ�ֵͼ��');

%% ��ֵ�˲�
qiegeimg4 = medfilt2(qiegeimg3);
subplot(3, 2, 6);
imshow(qiegeimg4);
title('��ֵ�˲����ͼ��');
imwrite(qiegeimg4,'./qiege.jpg'); 
%% �����ַ�ʶ��
qiegeimg5 = imsplit(qiegeimg4);
[m, n] = size(qiegeimg5);

s = sum(qiegeimg5);    %sum(x)����������ӣ���ÿ�еĺͣ������������;
j = 1;
k1 = 1;
k2 = 1;
while j ~= n
    while s(j) == 0
        j = j + 1;
    end
    k1 = j;
    while s(j) ~= 0 && j <= n-1
        j = j + 1;
    end
    k2 = j + 1;
    if k2 - k1 > round(n / 6.5)
        [val, num] = min(sum(qiegeimg5(:, [k1+5:k2-5])));
        qiegeimg5(:, k1+num+5) = 0;
    end
end

y1 = 10;
y2 = 0.25;
flag = 0;
word1 = [];
while flag == 0
    [m, n] = size(qiegeimg5);
    left = 1;
    width = 0;
    while sum(qiegeimg5(:, width+1)) ~= 0
        width = width + 1;
    end
    if width < y1
        qiegeimg5(:, [1:width]) = 0;
        qiegeimg5 = my_imsplit(qiegeimg5);
    else
        temp = imsplit(imcrop(qiegeimg5, [1,1,width,m]));
        [m, n] = size(temp);
        all = sum(sum(temp));
        two_thirds=sum(sum(temp([round(m/3):2*round(m/3)],:)));
        if two_thirds/all > y2
            flag = 1;
            word1 = temp;
        end
        qiegeimg5(:, [1:width]) = 0;
        qiegeimg5 = imsplit(qiegeimg5);
    end
end


 % �ָ���ڶ����ַ�
 [word2,qiegeimg5]=getword(qiegeimg5);

 % �ָ���������ַ�
 [word3,qiegeimg5]=getword(qiegeimg5);

 % �ָ�����ĸ��ַ�
 [word4,qiegeimg5]=getword(qiegeimg5);
 
 % �ָ��������ַ�
 [word5,qiegeimg5]=getword(qiegeimg5);
 
 % �ָ���������ַ�
 [word6,qiegeimg5]=getword(qiegeimg5);

 % �ָ�����߸��ַ�
 [word7,qiegeimg5]=getword(qiegeimg5);


 figure;
 subplot(3,7,1),imshow(word1),title('1');
 subplot(3,7,2),imshow(word2),title('2');
 subplot(3,7,3),imshow(word3),title('3');
 subplot(3,7,4),imshow(word4),title('4');
 subplot(3,7,5),imshow(word5),title('5');
 subplot(3,7,6),imshow(word6),title('6');
 subplot(3,7,7),imshow(word7),title('7');

 word1=imresize(word1,[40 32]);%imresize��ͼ�������Ŵ������õ��ø�ʽΪ��B=imresize(A,ntimes,method)������method��ѡnearest,bilinear��˫���ԣ�,bicubic,box,lanczors2,lanczors3��
 word2=imresize(word2,[40 32]);
 word3=imresize(word3,[40 32]);
 word4=imresize(word4,[40 32]);
 word5=imresize(word5,[40 32]);
 word6=imresize(word6,[40 32]);
 word7=imresize(word7,[40 32]);

 subplot(3,7,15),imshow(word1),title('11');
 subplot(3,7,16),imshow(word2),title('22');
 subplot(3,7,17),imshow(word3),title('33');
 subplot(3,7,18),imshow(word4),title('44');
 subplot(3,7,19),imshow(word5),title('55');
 subplot(3,7,20),imshow(word6),title('66');
 subplot(3,7,21),imshow(word7),title('77');
 
 imwrite(word1,'./chepaiqiege/1.jpg'); % ������λ�����ַ�ͼ��
 imwrite(word2,'./chepaiqiege/2.jpg');
 imwrite(word3,'./chepaiqiege/3.jpg');
 imwrite(word4,'./chepaiqiege/4.jpg');
 imwrite(word5,'./chepaiqiege/5.jpg');
 imwrite(word6,'./chepaiqiege/6.jpg');
 imwrite(word7,'./chepaiqiege/7.jpg');
 %%
 I=imread('����ͼ��.jpg');  
subplot(1,2,1);  
imshow(I);  
title('1 rice��ԭͼ'); 
I=rgb2gray(I); 
bw=graythresh(I);  
disp(strcat('otsu��ֵ�ָ����ֵ:',num2str(bw*255)));%��command window����ʾ�� :��������ֵ:��ֵ  
newII=im2bw(I,bw);
f=newII;
imwrite(newII,'./qiege.jpg')
subplot(1,2,2);  
imshow(newII);  
title('2 rice��otsu��ֵ�ָ�');
[row col]=size(f);
a=zeros(row,1);
b=zeros(col,1);
for i=1:row
    for j=1:col
        a(i)=a(i)+f(i,j);
    end
end
for j=1:col
    for i=1:row
        b(j)=b(j)+f(i,j);
    end
end
for i=1:row
    if (a(i)>50)
        break;
    end
end
p=i;
for i=row:-1:1
    if (a(i)>50)
        break;
    end
end
q=i;
f=f(p:q,1:end);
figure,imshow(f),figure,plot(1:row,a),figure,plot(1:col,b)
c=zeros(16);
k=1;
if (k<17)
    for i=(c(k)+1):col
        if (mod(k,2))
            if (b(i)>3)
                c(k)=i;
                k=k+1;
            end
        else if (b(i)<3)
               c(k)=i;
               k=k+1;
            end
        end
     end
end
%c(1),c(2),c(3),c(4),c(5),c(6),c(7),c(8),c(9),c(10),c(11),c(12),c(13),c(14)

    z1=f(1:end,c(1):c(2));
    z2=f(1:end,c(3):c(4));
    z3=f(1:end,c(5):c(6));
    z4=f(1:end,c(7):c(8));
    z5=f(1:end,c(9):c(10));
    z6=f(1:end,c(11):c(12));
    z7=f(1:end,c(13):c(14));
    z8=f(1:end,c(15):c(16));
   figure,
subplot (241) ,imshow(z1) ,title ('one') ;
hold on
subplot (242) ,imshow(z2) ,title ('two') ;
subplot (243) ,imshow(z3) ,title ('three') ;
subplot (244) ,imshow(z4) ,title ('four') ;
subplot (245) ,imshow(z5) ,title ('five') ;
subplot (246) ,imshow(z6) ,title ('six') ;
subplot (247) ,imshow(z7) ,title ('seven') ;
subplot (248) ,imshow(z8) ,title ('eight') ;
