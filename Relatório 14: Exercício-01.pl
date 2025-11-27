filho(hades, cronos).
filho(hades, reia).
dominio(hades, submundo).

divindade_olimpica(D) :-
    filho(D, cronos),
    (dominio(D, ceu); dominio(D, mar); dominio(D, submundo)).
