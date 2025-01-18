clear all; close all; clc
%Problem 1 part a
v1=zeros(1,114)
v1(1,:)=2;
A=diag(v1);
v2=zeros(1,113);
v2(1,:)=-1;
B=diag(v2,1);
C=diag(v2,-1);
A1=A+B+C

%Problem 1 part b
p=zeros(114,1);
for j=1:114
    p(j)=2*(1-cos(53*pi/115))*sin(53*pi*j/115);
end

A2=p

%Problem 2 part c
P=diag(diag(A1));
T=A1-P;
M=-P\T;
A3=max(abs(eig(M)))

%Problem 2 part D
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
A4=X(:,k)
A5=k


%Problem 2 part E
phi=zeros(114,1);
for j=1:114
    phi(j,:)=sin(53*pi*j/115);
end
A6=abs(max(A4-phi))


%Problem 3 part f
P_g=tril(A1);
T_g=A1-P_g;
M_g=-P_g\T_g;
A7=max(abs(eig(M_g)))

%Problem 3 part g
tolerance=1e-5;
phi_g=zeros(114,101);
phi0=ones(114,1);
phi_g(:,1)=phi0;
k=1;

err=tolerance+1;

if max(eig(-P_g\T_g)) < 1 
    while err >= tolerance
        phi_g(:,k+1)=P_g\(-T_g*phi_g(:,k)+p);
        err=max(abs(phi_g(:,k+1)-phi_g(:,k)));
        k=k+1;
    end
end


A8=phi_g(:,k)
A9=k

%Problem 3 part h
A10=abs(max(A8-phi))

%Problem 4 part i
w=1.5;
P=1/w*diag(diag(A1))+tril(A1,-1);
A11=P

%Problem 4 part j
T=(w-1)/w*diag(diag(A1))+triu(A1,+1);
M=-P\T;
A12=abs(max(eig(M)))

%Problem 4 part k

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

A13=X(:,k)
A14=k

%Problem 4 part l

A15=max(abs(A13-phi))

