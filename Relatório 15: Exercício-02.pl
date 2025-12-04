disciplina(programacao1, computacao, 4).
disciplina(estrutura_dados, computacao, 4).
disciplina(inteligencia_artificial, computacao, 4).
disciplina(logica, fundamental, 3).
disciplina(calculo1, fundamental, 4).
disciplina(redes, computacao, 4).

prerequisito(programacao1, estrutura_dados).
prerequisito(estrutura_dados, inteligencia_artificial).
prerequisito(logica, inteligencia_artificial).
prerequisito(programacao1, redes).

concluiu(joao, programacao1).
concluiu(maria, programacao1).
concluiu(maria, estrutura_dados).
concluiu(maria, logica).

falta_concluir(Aluno, Disciplina) :-
    prerequisito(Disciplina, _),
    \+ concluiu(Aluno, Disciplina).

aluno_apto(Aluno, Disciplina) :-
    disciplina(Disciplina, Area, _),
    Area \= fundamental,
    \+ concluiu(Aluno, Disciplina),
    \+ (prerequisito(Pre, Disciplina), \+ concluiu(Aluno, Pre)).
