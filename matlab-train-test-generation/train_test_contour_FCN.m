clear all;
clc;

%% generation of 3d fingerprint contour (train and test) based on FCN segmentation
for ii=1:160 %161:320
    for jj=1:6
img=imread(['..\all_3d_full_topview_mask_contour_FCN\',num2str(ii),'_',num2str(jj),'.png']);
img=rgb2gray(img);
img=fliplr(img);
img=flipud(img);
img(find(img>0))=255;
% imwrite((img),['..\all_3d_full_topview_mask_contour_FCN_train\',num2str(ii),'_',num2str(jj),'.png']);
imwrite((img),['..\all_3d_full_topview_mask_contour_FCN_test\',num2str(ii),'_',num2str(jj),'.png']);
end
end