%numero de prueba: 1234567

almacenar(Numero, [Numero]):-
    RestoDeNumero is Numero // 10,
    RestoDeNumero == 0,
    !.

almacenar(Numero, Digitos):-
    Residuo is Numero rem 10, %7
    RestoDeNumero is Numero // 10, %123456
    almacenar(RestoDeNumero, DigitosRestantes),
    append(DigitosRestantes, [Residuo], Digitos).