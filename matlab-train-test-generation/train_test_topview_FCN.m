clear all;
clc;

%% generation of topview fingerprint based on FCN segmentation
for ii=161:320 % 1:160
    for jj=1:6 
img=imread(['..\all_3d_full_topview_maskFCN\',num2str(ii),'_',num2str(jj),'.png']);
img=rgb2gray(img);
img(find(img==0))=255;
img(find(img<100))=0;
img(find(img>200))=255;
img3=imresize(img,256/512);
imwrite(img3,['..\all_3d_full_topview_maskFCN_train\',num2str(ii-160),'_',num2str(jj),'.png']);
% imwrite(img3,['..\all_3d_full_topview_maskFCN_test\',num2str(ii),'_',num2str(jj),'.png']);
end
end