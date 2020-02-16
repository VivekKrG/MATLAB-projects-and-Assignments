% *********ASSIGNMENT*********************
% 3. Write a program which does the following operation on given signal:
%     a) Addition, Multiplication and Convolution of two signal
%     b) Folding, Shifting and Scaling operation on a given signal 
%%
%Let two DIGITAL signals are X, Y
N=0:9;
X=N;
H=fliplr(N);%H=9:-1:0
subplot(421); stem(N,X,'r'); title('Signals X');
subplot(422); stem(N,H,'g'); title('Signals Y');
%%
%(a)Addition, Multiplication and Convolution
Added=X+H;
Product=X.*H;
Convolution=conv(X,H);
subplot(423); stem(N,Added,'b'); title('Added signals');
subplot(424); stem(N,Product,'m'); title('Product signals');
subplot(425); stem(-9:9,Convolution,'r'); title('Convolution signals');
%stem(0:19,Convolution)
%%
%(b) Folding, Shifting and Scaling operation on a given signal
%Folding using inbuilt function
Folded1=fliplr(X);
%Using for loop
Folded2=[];
for ij=length(X):-1:1
    Folded2=[Folded2  X(ij)];
end
subplot(426); stem(0:9,Folded2,'r'); title('Folded signals');
%Shifing by 3 in right(Delay)
N2=N+3;
Shfited1(N2)=X;
subplot(427); stem(0:11,Shfited1,'r'); title('Shifted signals');
%Scaling by factor c=2
Scaled=X(1:2:9);
subplot(428); stem(0:4,Scaled,'r'); title('Scaled signals');
