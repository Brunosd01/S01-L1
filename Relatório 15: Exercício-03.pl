disciplina(calculo1, matematica, 4).
disciplina(algebra, matematica, 4).
disciplina(prog1, computacao, 4).
disciplina(estruturas, computacao, 4).
disciplina(redes, computacao, 4).
disciplina(logica, fundamental, 3).

concluiu(joao, prog1).
concluiu(joao, estruturas).

concluiu(maria, prog1).
concluiu(maria, calculo1).

concluiu(pedro, prog1).
concluiu(pedro, estruturas).
concluiu(pedro, calculo1).

concluiu(ana, redes).
concluiu(ana, estruturas).

concluiu(lucas, logica).

especialista_comp(Aluno) :-
    concluiu(Aluno, D1),
    concluiu(Aluno, D2),
    disciplina(D1, computacao, _),
    disciplina(D2, computacao, _),
    D1 \= D2.

deficiencia_mat(Aluno) :-
    \+ (concluiu(Aluno, D), disciplina(D, matematica, _)).
