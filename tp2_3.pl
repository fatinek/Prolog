
a_droite(X,[X|L],L).
a_droite(X,[Y|L],D):- a_droite(X,L,D). 

a_gauche(X,[X|L],[]).
a_gauche(X,[Y|L],[Y|G]):- a_gauche(X,L,G).

separer(X,[X|L],[],L).
separer(X,[Y|L],[Y|G],D):- separer(X,L,G,D).
