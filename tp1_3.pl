fact(0,1) :- !. 			% factorielle(0) = 1
fact(N,F) :- 				% factorielle(N) = N*factorielle(N-1)
	N1 is N-1,
	fact(N1,F1),
	F is N*F1.

factv2(0,1).
factv2(N,F) :-
    N>0,
    N1 is N-1,
    factv2(N1,F1),
    F is N*F1.