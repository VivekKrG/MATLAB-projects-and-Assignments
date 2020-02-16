[f,p]=uigetfile('*.jpg');
file=strcat(p,f);
file=imread(file);
imshow(file);