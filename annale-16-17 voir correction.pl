precede(X,Y,[X|R]) :- member(Y,R).
precede(X,Y,[_|R]) :- precede(X,Y,R).

echange(X,Y,L1,L2) :-
    append(A1,[X|R1],L1),
    append(A2,[Y|R2],R1),
    append(A1,[Y|A2],R3),
    append(R3,[X|R2],L2).
    
%Exercice2

formule(F) :- atom(F).
formule(non(F)) :- formule(F).
formule(et(F,G)) :- formule(F), formule(G).
formule(ou(F,G)) :- formule(F), formule(G).
formule(imp(F,G)) :- formule(F), formule(G).

regle_alpha(L,R) :-
    append(A1,[et(F,G)|R1],L),
    append(A1,[F],R2),
    append(R2,[G|R1],R).

regle_alpha(L,R) :-
    append(A1,[non(ou((F,G)))|R1],L),
    append(A1,[non(F)],R2),
    append(R2,[non(G)|R1],R).

regle_alpha(L,R) :-
    append(A1,[non(imp((F,G)))|R1],L),
    append(A1,[F],R2),
    append(R2,[non(G)|R1],R).

regle_alpha(L,R) :-
    append(A1,[non(imp(G,F))|R1],L),
    append(A1,[non(F)],R2),
    append(R2,[G|R1],R).

regle_beta(L,R1,R2) :-
    append(A,[ou(F,G)|B],L),
    append(A,[F|B],R1),
    append(A,[G|B],R2).

regle_beta(L,R1,R2) :-
    append(A,[non(et(F,G))|B],L),
    append(A,[non(F)|B],R1),
    append(A,[non(G)|B],R2).

regle_beta(L,R1,R2) :-
    append(A,[imp(F,G)|B],L),
    append(A,[non(F)|B],R1),
    append(A,[G|B],R2).

regle_beta(L,R1,R2) :-
    append(A,[imp(G,F)|B],L),
    append(A,[F|B],R1),
    append(A,[non(G)|B],R2).


est_fermee(L) :-
    member(P,L),
    member(non(P),L),
    !.

est_fermee(L) :-
    regle_alpha(L,R),
    !,
    est_fermee(R).

est_fermee(L) :-
    regle_beta(L,R1,R2),
    !,
    est_fermee(R1),
    est_fermee(R2).


est_valide(F) :- est_fermee([non(F)]).
    


















