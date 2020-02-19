close all

m=insilico_cell_creation;
im=m.RGB_image;


x0=10;
y0=10;
width=550;
height=1000;
set(gcf,'position',[x0,y0,width,height])
subplot(3,1,1);

imagesc(im(:,:,1))


subplot(3,1,2);
imagesc(im(:,:,2))

subplot(3,1,3);
imagesc(im(:,:,1)+im(:,:,2))