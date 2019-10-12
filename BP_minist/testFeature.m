function testImgFeature = testFeature(testImg)

doubleImgtest=im2double(testImg);
testBw2=im2bw(doubleImgtest,graythresh(doubleImgtest));
bw_7050=imresize(testBw2,[70,50]);

for cnt=1:7
    for cnt2=1:5
        Atemp=sum(bw_7050(((cnt*10-9):(cnt*10)),((cnt2*10-9):(cnt2*10))));%10*10box
        lett((cnt-1)*5+cnt2)=sum(Atemp);
    end
end
lett=((100-lett)/100);
lett=lett';
testImgFeature=lett;