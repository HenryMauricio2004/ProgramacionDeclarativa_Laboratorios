:- ['hechos.pl'].

ashley_vive(LugarAshley):-
    aliado(Aliado),
    ubicacion(Aliado, LugarAshley),
    \=(Aliado, ashley),
    !.
ashley_vive(LugarAshley):-
    dificultad(LugarAshley, facil).

sobrevive_a_regeneradores(Aliado):-
    equipamiento(Aliado, pistola).

manda_a(Aliado, Subordinado):-
    rol(Aliado, Rol1),
    rol(Subordinado, Rol2),
    rango(Rol1, Rango1),
    rango(Rol2, Rango2),
    <(Rango1, Rango2).