/* ================================
   1. OPERADORES ARITMÉTICOS
   ================================ */

%% Ejercicio 1: Cálculo de área y perímetro
%% rectangulo(+Base, +Altura, -Resultado).
%% Para respetar el /3, guardo área y perímetro en una estructura.
%% Resultado = rect(Area, Perimetro).

rectangulo(Base, Altura, rect(Area, Perimetro)) :-
    Area is Base * Altura,
    Perimetro is 2 * (Base + Altura).

/*
?- rectangulo(3, 4, R).
R = rect(12, 14).
*/


%% Ejercicio 2: Número par o impar
%% par_impar(+N) -> escribe en pantalla si es par o impar.

par_impar(N) :-
    (   0 is N mod 2
    ->  writeln('El numero es par')
    ;   writeln('El numero es impar')
    ).

/*
?- par_impar(4).
El numero es par
true.
*/


%% Ejercicio 3: Tabla de multiplicar de un número
%% tabla_multiplicar(+N) -> imprime la tabla del 1 al 10.

tabla_multiplicar(N) :-
    between(1, 10, I),
    R is N * I,
    format('~w x ~w = ~w~n', [N, I, R]),
    fail ; true.

/*
?- tabla_multiplicar(5).
5 x 1 = 5
...
5 x 10 = 50
true.
*/


/* ================================
   2. OPERADORES RELACIONALES
   ================================ */

%% Ejercicio 4: Mayor de dos números
%% mayor(+A, +B, -M).

mayor(A, B, M) :-
    (   A >= B
    ->  M = A
    ;   M = B
    ).

/*
?- mayor(10, 7, M).
M = 10.
*/


%% Ejercicio 5: Rango de edad / categoría
%% categoria_edad(+Edad) -> escribe la categoría.

categoria_edad(Edad) :-
    (   Edad < 0 ->
        writeln('Edad invalida')
    ;   Edad =< 12 ->
        writeln('Ninez')
    ;   Edad =< 17 ->
        writeln('Adolescencia')
    ;   Edad =< 64 ->
        writeln('Adultez')
    ;   writeln('Adulto mayor')
    ).

/*
?- categoria_edad(20).
Adultez
true.
*/


%% Ejercicio 6: Nota de aprobación
%% aprobo(+Nota) -> tiene éxito si la nota es aprobada.
%% Aquí asumo aprobación con 6 o más (puedes cambiar el umbral).

aprobo(Nota) :-
    Nota >= 6.

/*
?- aprobo(5).
false.

?- aprobo(7).
true.
*/


/* =========================================
   3. LIGADURA Y UNIFICACIÓN DE ESTRUCTURAS
   ========================================= */

%% Ejercicio 7: es_hermano/2
%% Usamos estructuras persona/3: persona(Nombre, Padre, Madre).

persona(ana,    juan, maria).
persona(luis,   juan, maria).
persona(carla,  pedro, laura).
persona(sofia,  pedro, laura).
persona(ricardo,juan, maria).

%% es_hermano(+A, +B) -> A y B son hermanos si comparten padre y madre.

es_hermano(A, B) :-
    persona(A, Padre, Madre),
    persona(B, Padre, Madre),
    A \== B.

/*
?- es_hermano(ana, luis).
true.

?- es_hermano(ana, sofia).
false.
*/


%% Ejercicio 8: Comparación estricta (=, ==, \==)
%%
%%  =  : unifica, puede instanciar variables.
%%  == : compara si son exactamente el mismo término, sin instanciar.
%% \== : verifica que no sean el mismo término.
%%
%% Ejemplos de uso:
%%
%% ?- X = 5, X == 5.
%% X = 5.
%% true.
%%
%% ?- X == 5.
%% false.
%%
%% ?- 3 = 3.
%% true.
%%
%% ?- 3 == 3.
%% true.
%%
%% ?- 3 \== 4.
%% true.


%% Ejercicio 9: Juego de colores
%% color_equipo/1 -> define algunos equipos válidos por color.
%% Aquí lo planteo como un pequeño juego de verificación.

%% Hechos: color_equipo(NombreEquipo, Color).
color_equipo(barcelona, azulgrana).
color_equipo(real_madrid, blanco).
color_equipo(liverpool, rojo).
color_equipo(juventus, blanco_negro).

%% Versión /1 que simplemente muestra posibles combinaciones:
equipo_color(Equipo) :-
    color_equipo(Equipo, Color),
    format('El equipo ~w usa el color ~w.~n', [Equipo, Color]).

/*
?- equipo_color(barcelona).
El equipo barcelona usa el color azulgrana.
true.

?- color_equipo(Equipo, rojo).
Equipo = liverpool.
*/


/* ======================================
   4. FUNCIONES ARITMÉTICAS PREDEFINIDAS
   ====================================== */

%% Ejercicio 10: Distancia entre dos puntos (x1,y1) y (x2,y2)
%% distancia(+X1,+Y1,+X2,+Y2,-D).

distancia(X1, Y1, X2, Y2, D) :-
    DX is X2 - X1,
    DY is Y2 - Y1,
    D  is sqrt(DX*DX + DY*DY).

/*
?- distancia(0,0, 3,4, D).
D = 5.0.
*/


%% Ejercicio 11: grados a radianes
%% grados_a_radianes(+G, -R).

grados_a_radianes(G, R) :-
    R is G * pi / 180.

/*
?- grados_a_radianes(180, R).
R = 3.141592653589793.
*/


%% Ejercicio 12: Promedios y extremos
%% analisis(+Lista, -Promedio, -Extremos).
%% Para respetar /3, guardo max/min en una estructura extremos(Max,Min).

analisis(Lista, Promedio, extremos(Max, Min)) :-
    Lista \= [],
    sumlist(Lista, Suma),
    length(Lista, N),
    N > 0,
    Promedio is Suma / N,
    max_list(Lista, Max),
    min_list(Lista, Min).

/*
?- analisis([10, 5, 8], P, E).
P = 7.666666666666667,
E = extremos(10, 5).
*/


%% Ejercicio 13: Estadísticas usando abs, round, floor, ceiling
%% estadisticas(+N, -Abs, -Redondeado, -Piso, -Techo).

estadisticas(N, Abs, Redondeado, Piso, Techo) :-
    Abs         is abs(N),
    Redondeado  is round(N),
    Piso        is floor(N),
    Techo       is ceiling(N).

/*
?- estadisticas(-3.7, A, R, F, C).
A = 3.7,
R = -4,
F = -4,
C = -3.
*/


/* ================================
   5. DESAFÍOS INTEGRADORES
   ================================ */

%% Ejercicio 14: Calculadora sencilla
%% calculadora(+X, +Op, +Y, -R).
%% Op puede ser: +, -, *, /, mod, pow.

calculadora(X, +, Y, R) :- R is X + Y.
calculadora(X, -, Y, R) :- R is X - Y.
calculadora(X, *, Y, R) :- R is X * Y.
calculadora(X, /, Y, R) :- Y =\= 0, R is X / Y.
calculadora(X, mod, Y, R) :- Y =\= 0, R is X mod Y.
calculadora(X, pow, Y, R) :- R is X ** Y.

/*
?- calculadora(5, +, 3, R).
R = 8.

?- calculadora(5, pow, 2, R).
R = 25.
*/


%% Ejercicio 15: Triángulo rectángulo – hipotenusa
%% hipotenusa(+CatetoA, +CatetoB, -H).

hipotenusa(A, B, H) :-
    H is sqrt(A*A + B*B).

/*
?- hipotenusa(3, 4, H).
H = 5.0.
*/


%% Ejercicio 16: Sistema de calificaciones
%% Dada una lista de notas, calcular nota máxima, mínima y promedio.
%% sistema_calificaciones(+ListaNotas, -Max, -Min, -Promedio).

sistema_calificaciones(Lista, Max, Min, Promedio) :-
    Lista \= [],
    max_list(Lista, Max),
    min_list(Lista, Min),
    sumlist(Lista, Suma),
    length(Lista, N),
    N > 0,
    Promedio is Suma / N.

/*
?- sistema_calificaciones([6, 8, 9, 5], Max, Min, P).
Max = 9,
Min = 5,
P = 7.0.
*/
