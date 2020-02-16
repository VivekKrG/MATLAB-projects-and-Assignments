%************ASSIGNMENT******************
% Problem 1
%Create a 10x10 random matrix with the command A=rand(10). Now do the following operations. 
%   a) Multiply all elements by 100 and then round off all elements of the matrix to integers with the command A=fix(A). 
%   b) Replace all elements of A<10 with Zeros.
%   c) Replace all elements of A>90 with infinity (inf). 
%   d) Extract all 30 <= aij <= 50 in a vector b, that is find all elements between 30 and 50 and put them in a vector b. 
%
A=rand(10);
%%
%(a)
A=A*100;
A=fix(A);
%%
%(b)
A(A<10)=0;
%%
%(c)
A(A>90)=inf;
%%
%(d)
b=A(A>=30 & A<=50)


