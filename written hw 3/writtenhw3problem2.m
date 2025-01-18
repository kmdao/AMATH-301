clear all; close all; clc
%Part A
A=readmatrix('example_matrix.csv');

%Part B/E
tic
r1_values=zeros(1,100);
for i=1:100
    b=rand([3000,1]);
    x=A\b; 
    r1_values(1,i)=max(abs(A*x-b));
end
r1=mean(r1_values)
t1=toc;


%Part C/E
tic
[L,U,P]=lu(A);
r2_values=zeros(1,100)
for i=1:100
    b=rand([3000,1]);
    x=U\(L\(P*b));
    r2_values(1,i)=max(abs(A*x-b));
end
r2=mean(r2_values)
t2=toc;


%Part D/E
tic
C=inv(A);
r3_values=zeros(1,100);
for i=1:100
    b=rand([3000,1]);
    x=C\b;
    r3_values(1,i)=max(abs(C*x-b));
end
r3=mean(r3_values)
t3=toc;

