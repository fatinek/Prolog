% Faits
personne(edouard, homme, 72, retraite(commandant(armee_de_terre)), nice).
personne(agathe, femme, 58, musicienne(blues), nice).
personne(gaston, homme, 65, retraite(chauffeur(semvat)), balma).
personne(simone, femme, 65, retraite(cableur(airbus)), balma).
personne(georges, homme, 28, animateur(club_med), toulouse).
personne(marie_cecile,femme,35, clerc_de_notaire, toulouse).
personne(octave, homme, 40, huissier, nice).
personne(elton, homme, 10, ecolier, toulouse).
personne(vanessa, femme, 5, ecolier, toulouse).
parent(edouard, marie_cecile).
parent(agathe, marie_cecile).
parent(edouard, octave).
parent(agathe, octave).
parent(gaston, georges).
parent(simone, georges).
parent(georges, elton).
parent(georges, vanessa).
parent(marie_cecile, elton).
parent(marie_cecile, vanessa).

% Règles
pere(Pere, Enfant) :-
personne(Pere, homme, _, _, _),
parent(Pere, Enfant).

mere(Mere,Enfant) :-
personne(Mere, femme, _, _, _),
parent(Mere, Enfant).

fille(Fille, Parent) :-
personne(Fille, femme, _, _, _),
parent(Parent, Fille).

fils(Fils,Parent) :-
personne(Fils, homme, _, _, _),
parent(Parent, Fils).

parent_ecolier(P) :-
personne(P,_,_,_,_), once((parent(P,E),personne(E,_,_,ecolier,_))).