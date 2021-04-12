clear all;
clc;
%% generate gallery and testing partial fingerprints for training and test 

for ii=1:160
    for jj=13:18 %1:6
img=imread(['..\testing_sample_new\',num2str(ii),'_',num2str(jj),'.png']);
% img=imread(['..\gallery_sample_new\',num2str(ii),'_',num2str(jj),'.png']);
img=rgb2gray(img);
img1 = adapthisteq(img,'NumTiles',[16 16],'clipLimit',0.03,'NBins',256,'Distribution','uniform');
img(find(img==0))=255;
img(find(img<100))=0;
img(find(img>200))=255;
img=imresize(img,0.5);
imwrite((img),['..\testing_sample_new_cnn1\',num2str(ii),'_',num2str(jj-6),'.png']);
% imwrite((img),['..\gallery_sample_new_cnn1\',num2str(ii),'_',num2str(jj),'.png']);
end
end