clear all; close all; clc
%Problem 1 
x0=2;
tolerance=1e-8;

%Problem 1 part A
fprime=@(x)(2*x);
fdprime=@(x)(2);

X=zeros(1,101);
X(1)=x0;

for k = 1:100;
    X(k+1) = X(k) - fprime(X(k)) / fprime(X(k));
    if abs(fprime(X(k+1))) < tolerance
        break;
    end
end

%changed from k+1 to k
A1=k;
A2=X(1,k+1);

%Problem 1 part B
yprime=@(a)(500*a^499);
ydprime=@(a)(500*499*a^498);

A=zeros(1,1001);
A(1)=2;

for i=1:1000
    A(i+1) = A(i) -yprime(A(i)) / ydprime(A(i));
    if abs(yprime(A(i+1))) < tolerance
        break;
    end
end

A3=i+1
A4=A(1,i+1)


%Problem 1 part C

zprime=@(b)(1000*b^999);
zdprime=@(b)(1000*999*b^998);
B=zeros(1,1001);
B(1)=x0;

for j = 1:1000;
    B(j+1) = B(j) - zprime(B(j)) / zdprime(B(j));
    if abs(zprime(B(j+1))) < tolerance
        break;
    end
end

A5=j+1
A6=B(1,j+1)

%Problem 1 part D
f=@(z)(z^1000);
a=-2;
b=2;
tolerance=1e-8;
c = (-1 + sqrt(5)) / 2;
z= c*a + (1-c)*b;
fz=f(z);
q= (1-c)*a + c*b;
fq=f(q);

for p=1:1000 
    if fz < fq
        b=q;
        q=z;
        fq=fz;
        z= c*a + (1-c)*b;
        fz=f(z);
    else
        a=z;
        z=q;
        fz=fq;
        q= (1-c)*a + c*b;
        fq=f(q);
    end
    if (b-a) < tolerance
        break;
    end
end
%p+2 becuase 2 function calls before loop and 1 for each loop iteration
A7=p+2;
A8=b;

%Problem 2 fnd tmax and ctmax
c=@(t)(-1.3*((exp(-t/11))-(exp(-4*t/3))));
A9=fminbnd(c,0,5)
A10=-c(A9)

%Problem 3 A12 and A13 incorrect on autograder??
h=@(x)((-1/((x-0.3)^2+0.01))-(1/((x-0.9)^2+0.04))-6);
A11=fminbnd(h,0,0.5)
A12=fminbnd(@(x)(-h(x)),0.5,0.8)
A13=fminbnd(h,0.8,2)

%Problem 4 part A v=[-2;3]
f=@(v)((v(1)^2+v(2)-11)^2 + (v(1)+v(2)^2-7)^2);
A14=fminsearch(f,[-2;3])

%Problem 4 part B v=[0;0]
A15=fminsearch(@(v)(-f(v)),[0;0])


