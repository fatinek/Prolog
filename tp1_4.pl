somme([],0).
somme([X|R],S):- somme(R,S1), S is X+S1.

somme2([],S,S).
somme2([X|L],I,S) :- 
		J is X+I,
		somme2(L,J,S).
