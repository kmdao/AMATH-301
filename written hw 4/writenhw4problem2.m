clear all; close all; clc
%Problem 2 matrix A from coding hw
v1=zeros(1,114)
v1(1,:)=2;
B=diag(v1);
v2=zeros(1,113);
v2(1,:)=-1;
C=diag(v2,1);
D=diag(v2,-1);
A=B+C+D

w_values=1.001:0.001:1.998;
eigenvalues=zeros(1,998);
for i=1:998
    w=w_values(i);
    P=1/w*diag(diag(A))+tril(A,-1);
    T=(w-1)/w*diag(diag(A))+triu(A,+1);
    M=-P\T;
    eigenvalues(i)=max(abs(eig(M)));
end

plot(w_values,eigenvalues,'k');
xlabel('omega');
ylabel('absolute value of the largest eigenvalue of M');
title('Successive over-relaxation of matrix A');

%Part C
[M,I]=min(eigenvalues);

%Part D

p=zeros(114,1);
for j=1:114
    p(j)=2*(1-cos(53*pi/115))*sin(53*pi*j/115);
end

w=w_values(I);
P=1/w*diag(diag(A))+tril(A,-1);
T=(w-1)/w*diag(diag(A))+triu(A,+1);
M=-P\T;

tolerance=1e-5;
x0=ones(114,1);
X=zeros(114,101);
X(:,1)=x0;
k=1;

err=tolerance+1;

if max(eig(-P\T)) < 1 
    while err >= tolerance
        X(:,k+1)=P\(-T*X(:,k)+p);
        err=max(abs(X(:,k+1)-X(:,k)));
        k=k+1;
    end
end

X(:,k)