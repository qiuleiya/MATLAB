function imgc=chuli(img)
% 对初始图像进行处理定位切割处理

figure('Name', '原始车牌图切割前处理过程');
%% 灰度处理
img1 = rgb2gray(img);    % RGB图像转灰度图像
subplot(2, 3, 1);
imshow(img1);
title('灰度处理后图片');
%% 边缘提取
img2 = edge(img1, 'roberts', 0.15, 'both');
subplot(2, 3, 2);
imshow(img2);
title('边缘提取处理后图片');
%% 图像腐蚀
se=[1;1;1];
img3 = imerode(img2, se);
subplot(2, 3, 3);
imshow(img3);
title('图像腐蚀后的图像');
%% 平滑图像，图像膨胀
se = strel('rectangle', [30, 30]);
img4 = imclose(img3, se);
subplot(2, 3, 4);
imshow(img4);
title('平滑图像的轮廓');

%% 从图像中删除所有少于2200像素8邻接
img5 = bwareaopen(img4, 2200);
subplot(2, 3, 5);
imshow(img5);
title('从图像中移除小对象');
%% 切割出图像
[y, x, z] = size(img5);
img6 = double(img5);    % 转成双精度浮点型

% 车牌的蓝色区域
% Y方向
blue_Y = zeros(y, 1);
for i = 1:y
    for j = 1:x
        if(img6(i, j) == 1) % 判断车牌位置区域
            blue_Y(i, 1) = blue_Y(i, 1) + 1;    % 像素点统计
        end
    end
end

% 找到Y坐标的最小值
img_Y1 = 1;
while (blue_Y(img_Y1) < 5) && (img_Y1 < y)
    img_Y1 = img_Y1 + 1;
end

% 找到Y坐标的最大值
img_Y2 = y;
while (blue_Y(img_Y2) < 5) && (img_Y2 > img_Y1)
    img_Y2 = img_Y2 - 1;
end

% x方向
blue_X = zeros(1, x);
for j = 1:x
    for i = 1:y
        if(img6(i, j) == 1) % 判断车牌位置区域
            blue_X(1, j) = blue_X(1, j) + 1;
        end
    end
end

% 找到x坐标的最小值
img_X1 = 1;
while (blue_X(1, img_X1) < 5) && (img_X1 < x)
    img_X1 = img_X1 + 1;
end

% 找到x坐标的最小值
img_X2 = x;
while (blue_X(1, img_X2) < 5) && (img_X2 > img_X1)
    img_X2 = img_X2 - 1;
end

% 对图像进行裁剪
img7 = img(img_Y1:img_Y2, img_X1:img_X2, :);
subplot(2, 3, 6);
imshow(img7);
title('定位剪切处理后的车牌图像')

% 保存提取出来的车牌图像
imwrite(img7, '车牌图像.jpg');
imgc=img7;
end