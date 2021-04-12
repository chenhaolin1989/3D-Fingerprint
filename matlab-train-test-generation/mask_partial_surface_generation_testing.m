clear all;
clc;
%% generate testing partial fingerprints 

% 170(10) 50; 160(20) 40; 180(0) 60
% 140 50; 130 40; 150 60

%% random partail
% ran_d_m_all1=[];ran_d_m_all2=[];
% for num1=1:160
%     num2=0;ran_d_m1=[];ran_d_m2=[];
%     while num2<12       
%       ran_d1=floor(rand(1,2)*10+5);
%       ran_d2=-floor(rand(1,2)*10+5);
%       if ran_d1(1)~=ran_d1(2) && ran_d2(1)~=ran_d2(2)
%           num2=num2+1;
%           ran_d_m1=cat(2,ran_d_m1,ran_d1');
%           ran_d_m2=cat(2,ran_d_m2,ran_d2');
%       end
%     end
%     ran_d_m_all1=cat(1,ran_d_m_all1,ran_d_m1);
%     ran_d_m_all2=cat(1,ran_d_m_all2,ran_d_m2);
% end

for ii=1:160
num=1;% num=1+12;
    for jj=4:6
zSurface=load(['..\3d_surface_full\FC\',num2str(ii),'_',num2str(jj),'.mat']);
mask=imread(['..\FCN\FCN_test_results\',num2str(ii),'_',num2str(jj),'.png']);
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

%% random view 150-180  30-60
v11=randperm(21);v22=randperm(21);
for kk=1:4
figure,
colormap(gray);
mesh(X1/8,Y1/8,-Z2,-si1);axis off;
v1=159+v11;
v2=29+v22;
% v1=-1+v11;
% v2=29+v22;
view(v1(kk),v2(kk));
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 sizeY/100/1.5/4 sizeX/100/1.5/4]);
set(gca, 'position', [0 0 1 1]);
set(gcf,'visible','off');
print(gcf,'-dpng',['..\testing_sample_new\',num2str(ii),'_',num2str(num),'.png']) ;
close all;
num=num+1;
end
end
end
