clear all;
clc;
% 170(10) 50; 160(20) 40; 180(0) 60
% 140 50; 130 40; 150 60

%% generation of 3d fingerprint contour based on FCN segmentation
for ii=1:160 %161:320
    for jj=1:6
zSurface=load(['..\3d_surface_full\FC\',num2str(ii),'_',num2str(jj),'.mat']);
mask=imread(['..\FCN\FCN_test_results\',num2str(ii),'_',num2str(jj),'.png']);
% mask=imread(['..\FCN\FCN_train_test_results\',num2str(ii),'_',num2str(jj),'.png']);
zSurface=zSurface.fc;
zSurface=flipud(zSurface);
mask=flipud(mask);
mask1=mask;
mask=imresize(mask,4);
mask1=imresize(mask1,2);
mask1=im2bw(mask1);

Z1=imresize(zSurface,0.25);
Z2=double(Z1).*double(mask1);
Z2(find(Z2==0))=nan;
[sizeX,sizeY]=size(Z1);
[X1,Y1] = meshgrid(1:sizeY, 1:sizeX); 
contour3(X1,Y1,-(Z2),30,'k');axis off;
view(0,90);
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 sizeY/100/3 sizeX/100/3]);
set(gca, 'position', [0 0 1 1]);
set(gcf,'visible','off');
print(gcf,'-dpng',['..\all_3d_full_topview_mask_contour_FCN\',num2str(ii),'_',num2str(jj),'.png']) ;
close all;

end
end
