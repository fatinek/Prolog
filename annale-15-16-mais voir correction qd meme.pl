etat_initial([0,0]).

etat_final([1,_]).
etat_final([_,1]).

capacite(a,9).
capacite(b,4).

action(remplir(a,Volume),[A1,B],[A2,B]) :-
    capacite(a,Va_max),
    Va_max > A1,
    A2 is Va_max,
    Volume is (A2-A1).

action(remplir(b,Volume),[A,B1],[A,B2]) :-
    capacite(b,Vb_max),
    Vb_max > B1,
    B2 is Vb_max,
    Volume is (B2-B1).

action(vider(a,A1),[A1,B],[0,B]) :-
    A1 > 0.

action(vider(b,B1),[A,B1],[A,0]) :-
    B1 > 0.

action(transferer(a,b,Vol),[A1,B1],[A2,B2]) :-
    A1 > 0,
    capacite(b,Vb_max),
    B1 < Vb_max,
    Vol is min(A1,(Vb_max-B1)),
    B2 is (B1+Vol),
    A2 is (A1-Vol).


action(transferer(b,a,Vol),[A1,B1],[A2,B2]) :-
    B1 > 0,
    capacite(a,Va_max),
    A1 < Va_max,
	Vol is min(B1,(Va_max-A1)),
    A2 is (A1+Vol),
    B2 is (B1-Vol).

chemin(E1,E2,[A],Memo) :- 
    action(A,E1,E2).
chemin(E1,E2,[B|Actions],Memo) :- 
    action(B,E1,X), 
    \+(member(X,Memo)), 
    chemin(X,E2,Actions,[E1|Memo]).            %(ou [X|Memo] ??)

solution(Actions) :-
    etat_initial(I),
    etat_final(F),
    chemin(I,F,Actions,[]).

chemin2(E1,E2,[A],Memo,V) :- 
    action(A,E1,E2),
    (A=vider(_,V_perdu) ->  
    	V = V_perdu
    ;   
    	V = 0).
chemin2(E1,E2,[B|Actions],Memo,Total) :- 
    action(B,E1,X), 
    (B=vider(_,V_perdu) ->  
    	V = V_perdu
    ;   
    	V = 0),
    \+(member(X,Memo)), 
    chemin2(X,E2,Actions,[E1|Memo],Total1),
    Total is Total1+V.

solutions2(Actions,Eau_perdue) :-
    etat_initial(I),
    etat_final(F),
    chemin2(I,F,Actions,[],Eau_perdue).















