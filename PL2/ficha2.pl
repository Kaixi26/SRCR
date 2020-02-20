
% i
soma(X,Y,Ans) :- Ans is X + Y.

% ii
soma(X,Y,Z,Ans) :-
    soma(X, Y, Sum1),
    soma(Sum1, Z, Ans).

% iii
soma_lista([H], H).
soma_lista([H|T], Ans) :-
    soma_lista(T, Acc),
    Ans is H + Acc.

% iv
op(X, Y, +, Ans) :- Ans is X + Y.
op(X, Y, -, Ans) :- Ans is X - Y.
op(X, Y, *, Ans) :- Ans is X * Y.
op(X, Y, /, Ans) :- Ans is X / Y.

% v
op_lista([H], _, H).
op_lista([H|T], Op, Ans) :-
    op_lista(T, Op, Acc),
    op(H, Op, Acc).
