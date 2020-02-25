close all

m=insilico_cell_creation;

im=m.RGB_image;

cells_pops=m.subpopulation_numbers_of_cells;
f_num=sum(cells_pops==1)
m_num=sum(cells_pops==2)
x0=10;
y0=10;
width=500;
height=500;
set(gcf,'position',[x0,y0,width,height])

imagesc(im(:,:,2))



