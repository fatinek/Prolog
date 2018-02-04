palindrome([]).

palindrome([_]).

palindrome(P):- append([X|T],[X],P), palindrome(T).
