
function fff = hanzitestFeature(hanziImg)
count=13;%ѡȡ��������
doubleImgtest=im2double(hanziImg);
d=im2bw(doubleImgtest,graythresh(doubleImgtest));
ff=zeros(count,1);%����
[m,n]=size(d);
%B=blkproc(Image,[m n])
%ˮƽ�ֳ��ķ�,��ֱ�ֳ�����,�ֱ�ͳ����8������İ����صĸ���,�õ�8������
low = 4; % ˮƽ����
row=2;%��ֱ����
ch = m/low; cw = n/row;
t1 = (0:low-1)*ch + 1; t2 = (1:low)*ch;
t3 = (0:row-1)*cw + 1; t4 = (1:row)*cw;
for x = 1 : low
    for j = 1 : row
        temp = d(t1(x):t2(x), t3(j):t4(j));
        %subplot(low, row, (i-1)*row+j);
        %imshow(temp, 'border', 'tight');
        ff((x-1)*row+j)=sum(sum(temp));%ͳ����8������İ����صĸ���,�õ�8������
    end
end
%ˮƽ�ʹ�ֱ���������߰�ˮƽ�ʹ�ֱ�ָ������, ͳ���������ߴ����İ����ظ���,�õ�4������
num=2;%������
for k=1:num
    ff(low*row+k)=sum(d(round(k*m/(num+1)),:));%ˮƽ�߰����غ�
end
for k=1:num
    ff(low*row+num+k)=sum(d(:,round(k*n/(num+1))));%��ֱ�߰����غ�
end
ff(count)=sum(sum(d));%ͼ��ȫ���غ�h
fff=ff;
