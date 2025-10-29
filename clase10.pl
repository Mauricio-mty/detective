% 📘 Guía de Ejercicios – Programación Simbólica en Prolog

%### Instrucciones.

%- Usa los predicados implementados (`simplifica/2`, `derivada/3`, `evalua/4`, `suma/3`, `resuelve/3`).
%- Ejecuta las consultas en **SWI-Prolog**.
%- Registra los resultados y súbelos al repositorio indicado.


%## 🔹 1. Simplificación simbólicza
% Sumar cero a la izquierda no altera el resultado.
simplifica(+(0, X), X).
% Sumar cero a la derecha tampoco cambia el valor.
simplifica(+(X, 0), X).
% Multiplicar por uno a la izquierda mantiene el factor original.
simplifica(*(1, X), X).
% Multiplicar por uno a la derecha produce el mismo efecto.
simplifica(*(X, 1), X).
% Multiplicar por cero a la izquierda fuerza el resultado a cero.
simplifica(*(0, _), 0).
% Multiplicar por cero a la derecha tambien produce cero.
simplifica(*(_, 0), 0).
% Regla por defecto: si nada se reduce, la expresion se queda igual.
simplifica(X, X).

%**1.** Simplifique la siguiente expresión:  
%?- simplifica(*(1, +(0, X)), R).
%R = 0 + X.
%R= 1*(0 + X) .

%**2.** Aplique las reglas de simplificación al siguiente término:  
%?- simplifica(*(0, +(X, 3)), R).
%R = 0.
%R= 0*(X + 3).

%**3.** Determine el resultado tras aplicar las reglas a:  
%?- simplifica(+(X, 0), R).
%X=R, R=0.
%X= R.
%R= X + 0.

%**4.** Proponga una expresión propia que contenga al menos **una suma y un producto con términos neutros** y simplifíquela.
%?- simplifica(*(1, +(0, *(x, 1))), R).
%R= 0 + x*1.
%R= 1*(0 + x*1).

%## 🔸 2. Derivación simbólica

% La derivada de una variable respecto de si misma es 1.
derivada(X, X, 1).
% La derivada de una constante respecto de cualquier variable es 0.
derivada(C, _, 0) :- number(C).
% Regla de derivacion para la suma: (A + B)' = A' + B'.
derivada(A + B, X, DA + DB) :-
    derivada(A, X, DA),
    derivada(B, X, DB).
% Regla del producto: (A * B)' = A * B' + B * A'.
derivada(A * B, X, A*DB + B*DA) :-
    derivada(A, X, DA),
    derivada(B, X, DB).
% Regla de la resta: (A - B)' = A' - B'.
derivada(A - B, X, DA - DB) :-
    derivada(A, X, DA),
    derivada(B, X, DB).

%**5.** Calcule la derivada de la siguiente expresión:  
%?- derivada(x*x + 3*x + 2, x, D).
%D = x*1+X*1+(3*1+X*0)+0.

%**6.** Derive la siguiente función:  
%?- derivada(x*x*x, x, D).
%D = x*x*1 + x*(x*1 + x*1).

%**7.** Calcule la derivada de la resta:  
%?- derivada(x*x - 4*x + 1, x, D).
%D = x*1 + X*1 - (4*1 + X*0) + 0.

%**8.** Cree su propia función polinómica de tres términos y obtenga su derivada simbólica.
%?- derivada(2*x*x + 5*x + 3, x, D).
%D= 2*x*1+x*(2*1+x*0)+(5*1+x*0)+0.


%## 🧮 3. Evaluación simbólica
% Si el termino coincide con la variable de interes, se reemplaza.
evalua(X, X, V, V).
% Las constantes permanecen iguales sin importar la variable.
evalua(C, _, _, C) :- number(C).
% Evaluacion de una suma: se evalua cada sumando y se suman sus valores.
evalua(A + B, X, V, R) :-
    evalua(A, X, V, RA),
    evalua(B, X, V, RB),
    R is RA + RB.
% Evaluacion de una resta: se evalua cada parte y se restan los valores.
evalua(A - B, X, V, R) :-
    evalua(A, X, V, RA),
    evalua(B, X, V, RB),
    R is RA - RB.
% Evaluacion de un producto: se evalua cada factor y se multiplican.
evalua(A * B, X, V, R) :-
    evalua(A, X, V, RA),
    evalua(B, X, V, RB),
    R is RA * RB.

%**9.** Evalúe la siguiente expresión sustituyendo `x = 3`:  
%?- evalua(x*x + 3*x + 2, x, 3, R).
%R = 20.

%**10.** Determine el resultado de la expresión:  
%?- evalua(x*x - 4*x + 4, x, 2, R).
%R = 0.

%**11.** Combine evaluación y derivación: primero derive y luego evalúe el resultado en `x = 2`.  
%?- derivada(x*x + 3*x + 2, x, D), evalua(D, x, 2, R).
%D= x*1 + X*1 + (3*1 + X*0) + 0.
%R = 7.

%---

%## ⚙️ 4. Suma de fracciones simbólicas
% Calcula la fraccion resultante aplicando la suma de fracciones.
suma(frac(A, B), frac(C, D), frac(N, M)) :-
    N is A*D + C*B,
    M is B*D.

resta(frac(A, B), frac(C, D), frac(N, M)) :-
    N is A*D - C*B,
    M is B*D.

%**12.** Sume las siguientes fracciones simbólicas:  
%?- suma(frac(1,2), frac(1,3), R).
%R = frac(5, 6).

%**13.** Realice la suma siguiente y verifique el numerador y denominador del resultado:  
%?- suma(frac(2,5), frac(3,10), R).
%R = frac(35, 50).

%**14.** Cree una regla adicional para **restar fracciones** y pruebe:  
%?- resta(frac(3,4), frac(1,2), R).
%R = frac(2, 8).

%---

%## 🧠 5. Resolución simbólica sencilla
% Caso donde la variable aparece primero: X + N = M.
resuelve(X + N = M, X, V) :-
    number(N), number(M),
    V is M - N.
% Caso donde la variable aparece como segundo sumando: N + X = M.
resuelve(N + X = M, X, V) :-
    number(N), number(M),
    V is M - N.

%**15.** Resuelva la ecuación:  
%?- resuelve(x + 3 = 7, x, V).
%V = 4.

%**16.** Pruebe el caso donde la variable aparece al final:  
%?- resuelve(5 + x = 10, x, V).
%V = 5.

%**17.** Cree una ecuación nueva y resuélvala simbólicamente (de la forma `x + N = M` o `N + x = M`).
%?- resuelve(x + 8 = 15, x, V).
%V = 7.