function out = hanzishibie()
%����ʶ��
 load('net3.mat')
hanzi=char(['��' '��' '��' '��' '��' '��' '��' '³' '��' 'ԥ'  ]);
[filename, pathname] = uigetfile('*.bmp', '��ȡͼƬ�ļ�'); %ѡ��ͼƬ�ļ�

      pathfile=fullfile(pathname, filename);  %���ͼƬ·��
     z=imread(pathfile);     %��ͼƬ�������
     out= hanzi(hanzitestAnser(z,net3));
      figure;
     imshow(z);title(['ʶ����Ϊ=' num2str(out)]) 

end
