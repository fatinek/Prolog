dispatch(_,[],[],[]).
dispatch(X,[Y|R],[Y|I],S):- Y=<X,dispatch(X,R,I,S).
dispatch(X,[Y|R],I,[Y|S]):- Y>X,dispatch(X,R,I,S).

quicksort([],[]).
quicksort([X|R],S):-dispatch(X,R,I,Sup), quicksort(I,S1), quicksort(Sup,S2), append(S1,[X|S2],S).

quicksort2([],P,P).
quicksort2([X|R],P,S):- dispatch(X,R,I,Sup),quicksort2(Sup,P,S1), quicksort2(I,[X|S1],S). 
