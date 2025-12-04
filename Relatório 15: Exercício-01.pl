disciplina(calculo1, matematica, 4).
disciplina(calculo2, matematica, 5).
disciplina(algebra, matematica, 4).
disciplina(analise, matematica, 6).
disciplina(geometria, matematica, 4).
disciplina(topologia, matematica, 4).
disciplina(programacao, computacao, 6).
disciplina(sistemas, computacao, 5).
disciplina(redes, computacao, 4).
disciplina(fisica, fisica, 5).
disciplina(calculo3, matematica, 6).

prerequisito(calculo1, calculo2).
prerequisito(calculo1, analise).
prerequisito(algebra, analise).
prerequisito(programacao, sistemas).
prerequisito(programacao, redes).
prerequisito(analise, fisica).
prerequisito(analise, calculo3).

alto_impacto(D) :-
    disciplina(D, _, C),
    C > 5,
    prerequisito(D, X),
    prerequisito(D, Y),
    X \= Y.

disciplina_matematica_isolada(D) :-
    disciplina(D, matematica, 4),
    \+ prerequisito(D, _).
