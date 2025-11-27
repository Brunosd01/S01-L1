progenitor(urano, cronos).
progenitor(urano, reia).
progenitor(cronos, zeus).
progenitor(cronos, hera).
progenitor(cronos, poseidon).
progenitor(cronos, hades).
progenitor(cronos, demeter).
progenitor(reia, zeus).
progenitor(reia, hera).
progenitor(reia, poseidon).
progenitor(reia, hades).
progenitor(reia, demeter).

ancestral(A, D) :-
    progenitor(A, D).
ancestral(A, D) :-
    progenitor(A, Z),
    ancestral(Z, D).
