x=0:0.01:1;
figure(1);  %Its point to a single figure frame.
filename='mygif.gif'; %name of the created gif
for n=1:3

        [f,p]=uigetfile('D:\Resources\MATLAB Class\*.jpg');
        file=strcat(p,f);   %concatenage the file ande file location
        file=imread(file);  %To read file ie matrix value
        
        frame=getframe(1);  %frame is captured by it
        im=frame2im(frame); %
        [imind,cm]=rgb2ind(file,256);
        
        if n==1
            imwrite(imind,cm,filename,'gif','Loopcount',inf);
        else
            imwrite(imind,cm,filename,'gif','WriteMode','append');
         
        end
end