fibo(0,0):-!.
fibo(1,1):-!.
fibo(N,F):- N1 is N-1, N2 is N-2, fibo(N1,F1), fibo(N2,F2), F is F1+F2.

fiboplus(0,0,0):-!.
fiboplus(1,1,0):-!.
fiboplus(N,F,F1) :- N1 is N-1, fiboplus(N1,F1,F2), F is F1+F2.
