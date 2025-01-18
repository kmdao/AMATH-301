clear all; close all; clc

%Part a
a=1e21-(1e21-1e5);
b=(1e21-1e21)+1e5;

abs_ab=abs(a-b)

%Part b
A=[10e-20, 1; 1 1];
condition_A=cond(A)

%Part c
L=[1 0; 10e20 1];
U=[10e-20 1;0 1-10e20];
L*U


%Part d
B=[1 1; 10e-20 1];
L=[1 0;10e-20 1];
U=[1 1;0 1-(10e-20)];
L*U

%Part E
[L,U,P]=lu(A)
[L,U,P]=lu(B)