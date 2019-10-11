function out = hanzishibie()
%汉字识别
 load('net3.mat')
hanzi=char(['京' '闽' '粤' '苏' '沪' '浙' '皖' '鲁' '晋' '豫'  ]);
[filename, pathname] = uigetfile('*.bmp', '读取图片文件'); %选择图片文件

      pathfile=fullfile(pathname, filename);  %获得图片路径
     z=imread(pathfile);     %将图片读入矩阵
     out= hanzi(hanzitestAnser(z,net3));
      figure;
     imshow(z);title(['识别结果为=' num2str(out)]) 

end
