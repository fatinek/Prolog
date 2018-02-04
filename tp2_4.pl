graphe(g1, [1,2,3,4,5,6],[[1,2],[1,3],[2,4],[3,4],[4,5],[4,6] ]).
graphe(g2,[1,2,3,4,5,6],[[1,2],[1,3],[2,3],[2,4],[3,4],[4,1],[4,5],[4,6] ]).

arc(G,O,E):- graphe(G,_,L), member([O,E],L).

existe_chemin(G,O,E):- arc(G,O,E).
existe_chemin(G,O,E):- arc(G,O,X), existe_chemin(G,X,E).

chemin(G,O,E,[[O,E]]):- arc(G,O,E).
chemin(G,O,E,[[O,X]|Ch]):- arc(G,O,X), chemin(G,X,E,Ch).

chemin_sans_circuit(G,O,E,[[O,E]],Memo):- arc(G,O,E).
chemin_sans_circuit(G,O,E,[[O,X]|Ch],Memo):- arc(G,O,X), \+(member(X,Memo)), chemin_sans_circuit(G,X,E,Ch,[O|Memo]).
