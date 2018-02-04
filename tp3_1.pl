disque(a,[-1,0,0,0,0,0]).
disque(b,[-1,-1,0,0,0,0]).
disque(c,[-1,0,-1,0,0,0]).
disque(d,[-1,0,0,-1,0,0]).
disque(e,[-1,-1,-1,0,0,0]).
disque(f,[-1,-1,0,-1,0,0]).
disque(g,[-1,0,-1,0,-1,0]).
disque(h,[-1,-1,-1,-1,0,0]).
disque(i,[-1,-1,-1,0,-1,0]).
disque(j,[-1,-1,0,-1,-1,0]).
disque(k,[-1,-1,-1,-1,-1,0]).
disque(l,[-1,-1,-1,-1,-1,-1]).

liste_des_disques(L) :- findall(X, disque(X,Y), L).

tourner_disque([A|L1],L2):- append(L1,[A],L2).
orienter2(M1,M1,0,P).
orienter2(M1,M2,N,P):- tourner_disque(M1,D), D\=P, orienter2(D,M2,N1,P), N is N1+1.

orienter(M1,M2,N) :- orienter2(M1,M2,N,M1). 

empilement_secteur(0,0,0).
empilement_secteur(0,-1,2).
empilement_secteur(2,-1,1).
empilement_secteur(1,-1,0).

empilement([],[],[]).
empilement([A1|R1], [A2|R2], [S1|R3]) :- empilement_secteur(A1,A2,S1), empilement(R1,R2,R3).


enlever(E,[E|R],R).
enlever(E, [P|R], [P|Q]) :- enlever(E,R,Q).

chemin([0,0,0,0,0,0],[0,0,0,0,0,0],[],[]).
chemin(Initial,Final,[[X,Y]|R],L) :-
	disque(X,Motif),
	orienter(Motif,Motif2,Y),
	empilement(Initial,Motif2,Res),
	enlever(X,L,L2),
	chemin(Res,Final,R,L2).

plat([0,0,0,0,0,0]).
chemin2([0,0,0,0,0,0],[0,0,0,0,0,0],[],[]).
chemin2(Initial,Final,[[X,0]|R],L) :-
	disque(X,Motif),
	plat(Initial),
	empilement(Initial,Motif,Res),
	enlever(X,L,L2),
	chemin2(Res,Final,R,L2).
chemin2(Initial,Final,[[X,Y]|R],L) :-
	disque(X,Motif),
	\+ plat(Initial),
	orienter(Motif,Motif2,Y),
	empilement(Initial,Motif2,Res),
	enlever(X,L,L2),
	chemin2(Res,Final,R,L2).
	
solutions(S) :- liste_des_disques(L), chemin2([0,0,0,0,0,0],[0,0,0,0,0,0],S,L).

compteur(S,N) :- findall(1,solutions(S),L), length(L,N).



