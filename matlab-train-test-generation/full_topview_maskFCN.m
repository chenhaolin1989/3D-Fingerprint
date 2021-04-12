clear all;
clc;
% 170(10) 50; 160(20) 40; 180(0) 60
% 140 50; 130 40; 150 60
%% generation of topview fingerprint based on FCN segmentation
for ii=1:160
    for jj=1:6
zSurface=load(['..\3d_surface_full\FC\',num2str(ii),'_',num2str(jj),'.mat']);
mask=imread(['..\FCN\FCN_test_results1\',num2str(ii),'_',num2str(jj),'.png']);
% mask=imfill(mask,'holes');
zSurface=zSurface.fc;
zSurface=flipud(zSurface);
mask=flipud(mask);
mask=imresize(mask,8);

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
figure,
colormap(gray);
mesh(X1/8,Y1/8,-Z2,-si1);axis off;
view(180,90);
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 sizeY/100/1.5/4 sizeX/100/1.5/4]);
set(gca, 'position', [0 0 1 1]);
set(gcf,'visible','off');
print(gcf,'-dpng',['..\all_3d_full_topview_maskFCN\',num2str(ii),'_',num2str(jj),'.png']) ;
close all;
end
end
