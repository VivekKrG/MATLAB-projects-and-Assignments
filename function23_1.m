clc
close all
clear all
% clf
x=45;
a=input('enter a number:');
fprintf('%d\n', a);
%%
if a>45
    fprintf('a is greter then 45 \n');
else 
    fprintf('a is less than or equal to 45 \n');
end
%%
for i=1:5
    fprintf('i=%d \n',i);
end
