disciplina(introducao_programacao, fundamentos, 4).
disciplina(matematica_discreta, fundamentos, 4).
disciplina(algoritmos, fundamentos, 4).
disciplina(padroes, aplicacoes, 4).
disciplina(sistemas_operacionais, aplicacoes, 4).
disciplina(redes, aplicacoes, 4).
disciplina(ia, aplicacoes, 4).
disciplina(estruturas, fundamentos, 4).
disciplina(banco_de_dados, aplicacoes, 4).
disciplina(metodos_numericos, fundamentos, 4).
disciplina(calculo, fundamentos, 5).

prerequisito(introducao_programacao, algoritmos).
prerequisito(algoritmos, estruturas).
prerequisito(matematica_discreta, algoritmos).
prerequisito(estruturas, sistemas_operacionais).
prerequisito(calculo, metodos_numericos).
prerequisito(estruturas, redes).
prerequisito(algoritmos, ia).
prerequisito(introducao_programacao, banco_de_dados).
prerequisito(algoritmos, banco_de_dados).

disciplina_raiz(D) :-
    disciplina(D, _, _),
    \+ prerequisito(_, D).

disciplina_folha(D) :-
    disciplina(D, _, _),
    \+ prerequisito(D, _).
