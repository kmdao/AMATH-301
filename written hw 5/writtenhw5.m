clear all; close all; clc
%Problem 1 part b
f=@(x)(sin(tan(x))-tan(sin(x)));
tolerance=1e-16;
a=1.5646;
b=1.5647;
c=(-1+sqrt(5))/2;

x=c*a+(1-c)*b;
fx=f(x);
y=(1-c)*a+c*b;
fy=f(y);

for k=1:1000
    if fx<fy
        b=y;
        y=x;
        fy=fx;
        x=c*a+(1-c)*b;
        fx=f(x);
    else
        a=x;
        x=y;
        fx=fy;
        y=(1-c)*a+c*b;
        fy=f(y);
    end
    if (b-a) < tolerance
        break;
    end   
end

xmin=b


%Using Newton's method
fprime=@(x)(cos(tan(x))*(sec(x).^2)-(sec(sin(x)).^2)*cos(x));
fdprime=@(x)((-sec(x).^4)*sin(tan(x))+2*(sec(x).^2)*tan(x)*cos(tan(x))-2*sec(sin(x).^2)*(cos(x).^2)*tan(sin(x))+(sec(sin(x)).^2)*sin(x))

%initial guess x0=b from goldensection search method
x0=b;
tolerance=1e-16;
X=zeros(1,101);
X(1)=x0;

for i=1:100
    X(i+1)=X(i)-fprime(X(i)) / fdprime(X(i));
    if abs(fprime(X(i+1))) < tolerance
        break;
    end
end

xmin2=X(i+1)


%Intial guess x0=2
x0=2;
tolerance=1e-16;
X=zeros(1,101);
X(1)=x0;

for i=1:100
    X(i+1)=X(i)-fprime(X(i)) / fdprime(X(i));
    if abs(fprime(X(i+1))) < tolerance
        break;
    end
end

xmin3=X(i+1)


%Initial guess x0=1
x0=1;
tolerance=1e-16;
X=zeros(1,101);
X(1)=x0;

for i=1:100
    X(i+1)=X(i)-fprime(X(i)) / fdprime(X(i));
    if abs(fprime(X(i+1))) < tolerance
        break;
    end
end

xmin4=X(i+1)



%Initial guess x0=1.5
x0=1.5;
tolerance=1e-16;
X=zeros(1,101);
X(1)=x0;

for i=1:100
    X(i+1)=X(i)-fprime(X(i)) / fdprime(X(i));
    if abs(fprime(X(i+1))) < tolerance
        break;
    end
end

xmin5=X(i+1)


%Initial guess x0=1.6

x0=1.6;
tolerance=1e-16;
X=zeros(1,101);
X(1)=x0;

for i=1:100
    X(i+1)=X(i)-fprime(X(i)) / fdprime(X(i));
    if abs(fprime(X(i+1))) < tolerance
        break;
    end
end

xmin6=X(i+1)


%change of tolerance to larger value
x0=1.6;
tolerance=1e-7;
X=zeros(1,101);
X(1)=x0;

for i=1:100
    X(i+1)=X(i)-fprime(X(i)) / fdprime(X(i));
    if abs(fprime(X(i+1))) < tolerance
        break;
    end
end

xmin7=X(i+1)

% 
%%
clear all; close all; clc
%Problem 1 part C
f=@(x)(2/3*(abs(x-2))^(3/2));
fprime=@(x)((x-2)/((abs(x-2))^(1/2)));
fdprime=@(x)(((x-2)^2)/(2*abs(x-2)^(5/2)));

tolerance=1e-10;
X=zeros(1,1001);
x0=3;
X(1)=x0;

for k=1:1000
    X(k+1)=X(k)-fprime(X(k))/fdprime(X(k));
    if abs(fprime(X(k+1))) < tolerance
        break;
    end
end

X=X(1:k+1)
%%
clear all; close all; clc
%Problem 1 part A

%Section Search and golden search for A_114 with a=1, b=2, c=0.5001
v1=zeros(1,114)
v1(1,:)=2;
A=diag(v1);
v2=zeros(1,113);
v2(1,:)=-1;
B=diag(v2,1);
C=diag(v2,-1);
A_114=A+B+C;

max_abs_eig_A114=@(w)(f(w, diag(diag(A_114)), tril(A_114,-1), triu(A_114,+1)))
tic
w = section_search(max_abs_eig_A114, 1, 2, 0.5001)
toc

tic
w2 = golden_section_search(max_abs_eig_A114, 1, 2)
toc 


%Section search and golden search methods of A_1000
v12=zeros(1,1000)
v12(1,:)=2;
A2=diag(v12);
v22=zeros(1,999);
v22(1,:)=-1;
B2=diag(v22,1);
C2=diag(v22,-1);
A_1000=A2+B2+C2;


max_abs_eig_A1000 = @(w)(f(w, diag(diag(A_1000)), tril(A_1000, -1), triu(A_1000, +1)));
tic
w_1000 = section_search(max_abs_eig_A1000, 1, 2, 0.5001)
toc

tic
w2_1000 = golden_section_search(max_abs_eig_A1000, 1, 2)
toc
function y=f(w,D,L,U)
    P=1/w*D+L;
    T=(w-1)/w*D+U;
    M=-P\T;
    y=max(abs(eig(M)));
end
function x = section_search(f, a, b, c)
    tolerance = 1e-8;
    for k=1:1000
        x = c*a + (1-c)*b;
        y = (1-c)*a + c*b;
        if f(x) < f(y)
            b = y;
        else
            a = x;
        end
        if (b-a) < tolerance
            break; 
        end 
    end
end
function x = golden_section_search(f,a,b)
    c = (-1 + sqrt(5)) / 2;
    tolerance = 1e-8;
    x = c*a + (1-c)*b;
    fx = f(x);
    y = (1-c)*a + c*b;
    fy = f(y);
    for k = 1:1000
        if fx < fy
            b = y;
            y = x;
            fy = fx;
            x = c*a + (1-c)*b;
            fx = f(x);
        else
            a = x;
            x = y;
            fx = fy;
            y = (1-c)*a +c*b;
            fy = f(y);
        end
        if (b-a) < tolerance
            break;
        end
    end
end
