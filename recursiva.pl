%base
vive_en(ana, villa_logica).
vive_en(juan, villa_logica).
vive_en(maria, villa_logica).
vive_en(pedro, villa_logica).
vive_en(sofia, villa_logica).

hermanos(ana, pedro).

primos(maria, sofia).

amigos(juan, ana).

companieros_trabajo(pedro, sofia).

estudian_juntos(maria, juan).

cocina(ana).

no_cocina(ana, cansada).

trabaja(pedro, semana).
trabaja(sofia, tienda).

estudia(pedro, semana).
estudia(sofia, idiomas).
estudia(maria, universidad).

juega(pedro, fines).

descansa(juan, fines).
descansa(maria, domingo).

%reglas
actividad(X) :- cocina(X); trabaja(X,_); estudia(X,_); juega(X,_).

descansa_dos(X):- descansa(X, domingo); descansa(X, fines).

parentesco(X,Y): hermanos(X,Y); hermanos(Y,X); primos(X,Y); primos(Y,X).

%reglas recursivas
amigo_de_amigo(X,Y):- amigos(X,Y).
amigo_de_amigo(X,Y):- amigos(X,Z), amigo_de_amigo(Z,Y).


% Caso base
longitud([], "").

% Caso general
longitud([_|T], N) :-
    append(_, T, L),
    longitud(L, N1).


%consultas
%cocina(ana).
%amigo(ana,maria).
%