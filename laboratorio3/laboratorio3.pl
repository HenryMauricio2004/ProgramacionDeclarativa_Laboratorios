suma(1,1).
suma(N, R):-
    N2 is N-1,
    suma(N2, R2),
    R is N + R2,
    !.