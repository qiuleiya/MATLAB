function imgc=chuli(img)
% �Գ�ʼͼ����д���λ�и��

figure('Name', 'ԭʼ����ͼ�и�ǰ�������');
%% �Ҷȴ���
img1 = rgb2gray(img);    % RGBͼ��ת�Ҷ�ͼ��
subplot(2, 3, 1);
imshow(img1);
title('�Ҷȴ����ͼƬ');
%% ��Ե��ȡ
img2 = edge(img1, 'roberts', 0.15, 'both');
subplot(2, 3, 2);
imshow(img2);
title('��Ե��ȡ�����ͼƬ');
%% ͼ��ʴ
se=[1;1;1];
img3 = imerode(img2, se);
subplot(2, 3, 3);
imshow(img3);
title('ͼ��ʴ���ͼ��');
%% ƽ��ͼ��ͼ������
se = strel('rectangle', [30, 30]);
img4 = imclose(img3, se);
subplot(2, 3, 4);
imshow(img4);
title('ƽ��ͼ�������');

%% ��ͼ����ɾ����������2200����8�ڽ�
img5 = bwareaopen(img4, 2200);
subplot(2, 3, 5);
imshow(img5);
title('��ͼ�����Ƴ�С����');
%% �и��ͼ��
[y, x, z] = size(img5);
img6 = double(img5);    % ת��˫���ȸ�����

% ���Ƶ���ɫ����
% Y����
blue_Y = zeros(y, 1);
for i = 1:y
    for j = 1:x
        if(img6(i, j) == 1) % �жϳ���λ������
            blue_Y(i, 1) = blue_Y(i, 1) + 1;    % ���ص�ͳ��
        end
    end
end

% �ҵ�Y�������Сֵ
img_Y1 = 1;
while (blue_Y(img_Y1) < 5) && (img_Y1 < y)
    img_Y1 = img_Y1 + 1;
end

% �ҵ�Y��������ֵ
img_Y2 = y;
while (blue_Y(img_Y2) < 5) && (img_Y2 > img_Y1)
    img_Y2 = img_Y2 - 1;
end

% x����
blue_X = zeros(1, x);
for j = 1:x
    for i = 1:y
        if(img6(i, j) == 1) % �жϳ���λ������
            blue_X(1, j) = blue_X(1, j) + 1;
        end
    end
end

% �ҵ�x�������Сֵ
img_X1 = 1;
while (blue_X(1, img_X1) < 5) && (img_X1 < x)
    img_X1 = img_X1 + 1;
end

% �ҵ�x�������Сֵ
img_X2 = x;
while (blue_X(1, img_X2) < 5) && (img_X2 > img_X1)
    img_X2 = img_X2 - 1;
end

% ��ͼ����вü�
img7 = img(img_Y1:img_Y2, img_X1:img_X2, :);
subplot(2, 3, 6);
imshow(img7);
title('��λ���д����ĳ���ͼ��')

% ������ȡ�����ĳ���ͼ��
imwrite(img7, '����ͼ��.jpg');
imgc=img7;
end