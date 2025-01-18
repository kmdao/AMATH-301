clear all; close all; clc;
%Problem 1
A=readmatrix('hw4_matrix.csv');

%Part A
b=rand(20,1);
x=A\b;
abs(A*x-b);

%Part B
Pj=diag(diag(A));
Tj=A-Pj;
Mj=-Pj\Tj;

tolerance=1e-4;
stop_error=tolerance+1;

x0=ones(20,1);
X=zeros(20,100);
X(:,1)=x0;

k=1;

errorj=zeros(1,10000);
errorj(1)=norm(X(:,1)-x,Inf);

if max(eig(Mj)) < 1
    while stop_error >= tolerance
        X(:,k+1)=Pj\(-Tj*X(:,k)+b);
        stop_error=norm(X(:,k+1)-X(:,k),Inf);
        k=k+1;
        errorj(k)=norm(X(:,k)-x,Inf);        
    end
end
X(:,k);
errorj;

%Part C reset

Pg=tril(A);
Tg=A-Pg;
Mg=-Pg\Tg;

tolerance=1e-4;
stop_error=tolerance+1;
phi0=ones(20,1);
phi=zeros(20,100);
phi(:,1)=phi0;

j=1;

errorg=zeros(1,10000);
errorg(1)=norm(phi(:,1)-x,Inf);

if max(eig(Mg)) < 1
    while stop_error >= tolerance
        phi(:,j+1)=Pg\(-Tg*phi(:,j)+b);
        stop_error=norm(phi(:,j+1)-phi(:,j),Inf);
        j=j+1;
        errorg(j)=norm(phi(:,j)-x,Inf);
    end
end
phi(:,j)
errorg;
%Part D add title etc
% plot(1:k,errorj,'k',1:j,errorg,'b')
% xlabel('k=number of guesses');
% ylabel('error')
% title('number of guesses of x vs. error in guess by the Jacobi and Gauss-Siedel Methods');
% legend('Jacobi Method','Gauss-Siedel Method');


%Part E add title etc
semilogy(1:k,errorj,'k',1:j,errorg,'b');
xlabel('k=number of guesses');
ylabel('error');
title('number of guesses of x vs. error in guess by the Jacobi and Gauss-Siedel Methods');
legend('Jacobi Method','Gauss-Siedel Method');



