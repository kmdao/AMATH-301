clear all; close all; clc

%Problem 1

A=readmatrix('bridge_matrix.csv');
b=[0 0 0 0 0 0 0 0 2 0 8 0 4]';

A1=A\b

[L,U,P]=lu(A);

A2=L

y=L\(P*b);
A3=y

% for i=1:10000
%     b=b+[0 0 0 0 0 0 0 0 0.01 0 0 0 0]';
%     y=L\(P*b);
%     f=U\y;
%     [M,I]=max(abs(f))
%     if max(abs(M)) >= 30
%         break
%     end
% end
% 
% A4=b(9,1)
% A5=I



[M,I]=max(abs(f));
while max(abs(M)) <= 30
    b(9)=b(9)+0.01;
    y=L\(P*b);
    f=U\y;
end

A4=b(9)
[M,I]=max(abs(f));
A5=I
%%
%Problem 2
%Postition is x(t)=[x(t),y(t)]'
%Ax(t+1)=x(t)
A=[1-(-0.003), -0.05;0.05, 1-(-0.003)];
position=zeros(2,1001);
position(1:2,1)=[1;-1];

for t=2:1001
    position(1:2,t)=A\position(1:2,t-1);
end

A6=position(1,:)
A7=position(2,:)

d=zeros(1,1001);
for t=1:1001
    d(t)=sqrt(((A6(t))^2)+((A7(t))^2));
end

A8=d
for t=1:1001
    d(t)=sqrt(((A6(t))^2)+((A7(t))^2));
    if d(t)<=0.05
        break;
    end        
end

 A10=d(t)
 %time starts at 0 where t=1 is t=0 on paper so subtract 1 for A9
 A9=t-1


%%
%Problem 3
%Part A
A11=R(pi/10)

%Part B
x=[0.3,1.4,-2.7]';
A12=R(3*pi/8)*x

%Part C
y=[1.2, -0.3, 2]';
A13=R(pi/7)\y

%Part D
A14=inv(R(5*pi/7))

%Part E
A15=9*pi/7

function rotation_matrix=R(theta)
    rotation_matrix=[cos(theta), 0, sin(theta); 0, 1, 0; -sin(theta), 0, cos(theta)];
end




