% ****************ASSIGNMENT****************
% 2. Find out the values of current il. 12 13 for the following given ckt using the
%    MATLAB R1=5 ohm, R2=100 ohm, R3=200 ohm,R4=150 ohm,R=250 ohm; V1= 5V and V2= 10V.
%                 [V]= [R][I]
%                 [i]= inv([R])[V]
%                 -V1= (R1+R4)I1 + (-R4)I2      + (0)I3
%                   0= (-R4)I1   + (R2+R4+R5)I2 + (-R5)I3
%                 -V2= (0)I1     + (-R5)I2      + (R3+R5)I3
R1=5;
R2=100;
R3=200;
R4=150;
R5=250;
V1=5;
V2=10;
V=[-V1;0;-V2];
R=[R1+R4 -R4       0;
   -R4   R2+R4+R5 -R5;
   0     -R5      R3+R5];
I=inv(R)*V;
I