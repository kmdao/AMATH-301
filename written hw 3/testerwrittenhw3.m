%Part B
tic
for i=1:100
    b=rand([3000,1]);
    x=A\b; 
end
t1=toc;


%Part C
tic
[L,U,P]=lu(A);
for i=1:100
    b=rand([3000,1]);
    x=U\(L\(P*b));
end
t2=toc;

%Part D
tic
C=inv(A);
for i=1:100
    b=rand([3000,1]);
    x=C\b;
end
t3=toc;