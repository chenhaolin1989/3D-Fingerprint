clear all;
clc;

% %% find crop
% max_x=0;max_y=0;
% for ii=1:1
%     for jj=1:1
% img=imread([..\all_3d_full_sideview\',num2str(ii),'_',num2str(jj),'.png']);
% img=rgb2gray(img);
% [x,y]=find(img~=0);
% sizex=max(x)-min(x);
% sizey=max(y)-min(y);
% if sizex>max_x
%     max_x=sizex;
% end
% if sizey>max_y
%     max_y=sizey;
% end
% end
% end

%% crop sideview1/2 fingerprint for training and test based on FCN segmentation
maxx=354; maxy=472;
%cropsize: 354*472
% cropx=30;cropy=40;
num=0;
for ii=161:320
% for ii=1:160
    for jj=1:30
img=imread(['..\all_3d_full_sideview_mask_shapecode_FCN\',num2str(ii),'_',num2str(jj),'.png']);
% img=imread(['..\all_3d_full_sideview1_mask_shapecode_FCN\',num2str(ii),'_',num2str(jj),'.png']);
img=rgb2gray(img);
img(find(img==0))=255;
% figure,imshow(img);
[x,y]=find(img~=255);
% centerx=floor((max(x)+min(x))/2);
% centery=floor((max(y)+min(y))/2);
img1 = adapthisteq(img,'NumTiles',[16 16],'clipLimit',0.03,'NBins',256,'Distribution','uniform');
img2 = img1(min(x):max(x),min(y):max(y));
addx=floor((maxx-(max(x)-min(x)))/2);
addy=floor((maxy-(max(y)-min(y)))/2);
addxx1=ones(addx,max(y)-min(y)+1)*255;addxx2=ones(maxx-(max(x)-min(x))-addx-1,max(y)-min(y)+1)*255;
img3=img2;img3=[addxx1;img2;addxx2];
addyy1=ones(maxx,addy)*255;addyy2=ones(maxx,maxy-(max(y)-min(y))-addy-1)*255;
img3=[addyy1,img3,addyy2];
[sizexx,sizeyy]=size(img3);
if sizexx~=354 || sizeyy~=472
    num=num+1;
end
img3(find(img3<100))=0;
img3(find(img3>200))=255;
img3=imresize(img3,256/472);
imwrite(img3,['..\all_3d_full_sideview_mask_shapecode_FCN_train\',num2str(ii-160),'_',num2str(jj),'.png']);
% imwrite(img3,['..\all_3d_full_sideview_mask_shapecode_FCN_test\',num2str(ii),'_',num2str(jj),'.png']);
% imwrite(img3,['..\all_3d_full_sideview1_mask_shapecode_FCN_train\',num2str(ii-160),'_',num2str(jj),'.png']);
% imwrite(img3,['..\all_3d_full_sideview1_mask_shapecode_FCN_test\',num2str(ii),'_',num2str(jj),'.png']);
end
end
