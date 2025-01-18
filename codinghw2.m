clear all;close all; clc
%Problem 1

A=zeros(19,34);
f=@(i,j)(1/(i*j));
for i=1:19
    for j=1:34
        A(i,j)=f(i,j)
    end
end

A1=A

B=zeros(19,34);
f=@(i,j)(1/(i*j));
for i=1:19
    for j=1:34
        B(i,j)=f(i,j);
        if i==17
            B(i,j)=0;
        elseif j==33
            B(i,j)=0;
        end 
    end
end

A2=B
A3=B(end-4:end,end-2:end)
A4=B(1:19,5)

%%
%Problem 2a
sum_tenth=0;
for n=1:10
    sum_tenth=sum_tenth+(1/n);
end
A5=sum_tenth


%Problem 2b
sum_hundreth=0;
for n=1:100
    sum_hundreth=sum_hundreth+(1/n);
end
A6=sum_hundreth


%Problem 2c
sum_five=0;
for n=1:999
    sum_five=sum_five+(1/n);
    if sum_five>5
        break;
    end
end
A7=n
A8=sum_five

%Problem 2d
sum_fifteen=0
for n=1:99999999
    sum_fifteen=sum_fifteen+(1/n);
    if sum_fifteen>15
        break;
    end
end
A9=n
A10=sum_fifteen

%%
%Problem 3a
%let P(0)=pop(1), so vector must go to n=(t+1) for t and p(1)=p0;
%first vector entry corresponds to t=0

% vectora=P(3,1000,2.5,20);
% A11=vectora(1,end-2:end)
% 
% 
% In question, p0 and K are all the same so variables cut down
% 
%  function pop=P(P0,T,r,K)
%     pop=zeros(1,T+1);
%     pop(1)=P0;
%     for t=2:T+1
%         pop(t)=r*pop(t-1)*(1-pop(t-1)/K);
%     end
%  end

 
vectora=P(1000,2.5);
A11=vectora(1,end-2:end)

vectorb=P(1000,3.2);
A12=vectorb(1,end-2:end)

vectorc=P(1000,3.5)
A13=vectorc(1,end-2:end)

function pop=P(T,r)
    pop=zeros(1,T+1);
    pop(1)=3;
    for t=2:T+1
        pop(t)=r*pop(t-1)*(1-pop(t-1)/20);
    end
end
 







