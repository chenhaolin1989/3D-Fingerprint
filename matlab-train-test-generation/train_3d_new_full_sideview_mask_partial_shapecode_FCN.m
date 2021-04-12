clear all;
clc;
% 170(10) 50; 160(20) 40; 180(0) 60
% 140 50; 130 40; 150 60

%% generate original side-view1/2 fingerprint for training based FCN segmentation
for ii=161:320
    for jj=1:6
zSurface=load(['..\3d_surface_full\FC\',num2str(ii),'_',num2str(jj),'.mat']);
mask=imread(['..\FCN\FCN_train_test_results\',num2str(ii-160),'_',num2str(jj),'.png']);
zSurface=zSurface.fc;
zSurface=flipud(zSurface);
mask=flipud(mask);
mask=imresize(mask,8);
mask=im2bw(mask);
zSurface1=imresize(zSurface,0.25);
[sizeX,sizeY]=size(zSurface1);
[X,Y] = meshgrid(1:sizeY, 1:sizeX);  
[K1,H1,Pmax1,Pmin1] = surfature(X,Y,zSurface1);
Pmax=Pmax1;
Pmin=Pmin1;
si=0.5-(1/pi)*atan((Pmax1+Pmin1)./(Pmax1-Pmin1));
si1=si;
si1(find(si1>0.5))=1;si1(find(si1<0.5))=0;
si1=imresize(si1,4);
Z1=zSurface;
Z2=double(Z1).*double(mask);
Z2(find(Z2==0))=nan;
[sizeX,sizeY]=size(zSurface);
[X1,Y1] = meshgrid(1:sizeY, 1:sizeX); 
[C1,C2] = gradient(Z1);
C3=sqrt(C1.^2+C2.^2);
figure,
colormap(gray);
mesh(X1/8,Y1/8,-Z2,-si1);axis off;
view(170,50);% view(170,40);view(170,60);view(160,40);view(180,60);
% view(10,50);view(10,40);view(10,60);view(20,40);view(0,60);
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 sizeY/100/1.5/4 sizeX/100/1.5/4]);
set(gca, 'position', [0 0 1 1]);
set(gcf,'visible','off');
print(gcf,'-dpng',['D:\study\cross_cnn_data_3d\\all_3d_full_sideview_mask_shapecode_FCN\',num2str(ii),'_',num2str(jj),'.png']) ;
% print(gcf,'-dpng',['D:\study\cross_cnn_data_3d\\all_3d_full_sideview1_mask_shapecode_FCN\',num2str(ii),'_',num2str(jj),'.png']) ;
close all;

end
end
