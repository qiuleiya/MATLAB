function out = shuzishibie()
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
 load('net1.mat')
shuzi=char(['0':'9']);
[filename, pathname] = uigetfile('*.bmp', '��ȡͼƬ�ļ�'); %ѡ��ͼƬ�ļ�

       pathfile=fullfile(pathname, filename);  %���ͼƬ·��
     
       M=imread(pathfile);     %��ͼƬ�������
       out=shuzi(testAnser(M,net1));
       figure;
     imshow(M);title(['ʶ����Ϊ=' out]);
end

