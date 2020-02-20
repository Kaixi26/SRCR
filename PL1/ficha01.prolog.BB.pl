%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Base de Conhecimento com informacao genealogica.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado filho: Filho,Pai -> {V,F}

filho( joao,jose ).   % O joão é filho do josé
filho( jose,manuel ). % O josé é filho do manuel
filho( carlos,jose ). % O Carlos é filho do josé

filho(a,b).
filho(b,c).

% iv.
pai(paulo, filipe).
% v.
pai(paulo, maria).
% vi.
avo(antonio, nadia).
% vii.
neto(nuno, ana).
% viii.
masculino(joao).
% ix.
masculino(jose).
% x.
feminino(maria).
% xi.
feminino(joana).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pai: Pai,Filho -> {V,F}

pai( P,F ) :-
    filho( F,P ).

filho(F, P) :-
    pai(P, F).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado avo: Avo,Neto -> {V,F}

avo( A, N ) :-
    pai(A, P),
    pai(P, N).

neto(N, A) :-
    pai(A, P),
    pai(P, N).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado bisavo: Bisavo,Bisneto -> {V,F}

bisavo(B, BN) :-
    pai(B, A),
    avo(A, BN).

bisneto(BN, B) :-
    pai(B, A),
    avo(A, BN).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente -> {V,F}

descendente(A, D) :- filho(A, D).
descendente(A, D) :- filho(D, X), descendente(A, X).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente,Grau -> {V,F}

graudescendente(F,P,1):- filho(F,P).
graudescendente(D,A,G):- filho(D,X),graudescendente(X,A,N),G is N+1.
