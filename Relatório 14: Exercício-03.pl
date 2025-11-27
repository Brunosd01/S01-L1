pai(zeus, cronos).
pai(hera, cronos).
pai(poseidon, cronos).
pai(hades, cronos).
pai(demeter, cronos).

mae(zeus, reia).
mae(hera, reia).
mae(poseidon, reia).
mae(hades, reia).
mae(demeter, reia).

irmaos_germanos(A, B) :-
    pai(A, P), pai(B, P),
    mae(A, M), mae(B, M),
    A \= B.
