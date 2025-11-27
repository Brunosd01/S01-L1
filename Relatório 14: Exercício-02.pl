dominio(zeus, ceu).
dominio(zeus, trovrao).
dominio(hera, casamento).
dominio(hera, familia).
dominio(poseidon, mar).
dominio(poseidon, terremoto).
dominio(hades, submundo).

habita(zeus, olimpo).
habita(hera, olimpo).
habita(poseidon, olimpo).
habita(hades, submundo).

deus_maior(D) :-
    habita(D, olimpo),
    dominio(D, A),
    dominio(D, B),
    A \= B.
