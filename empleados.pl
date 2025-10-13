% USO: cargar empleados
% ? - [empleados].
% main.

% ==========================================
% SISTEMA DE EMPLEADOS EN PROLOG
% Hechos dinámicos + Menú interactivo + Simulación de sesión
% ==========================================

:- dynamic empleado/3.

% ---- Base inicial (en el mismo orden que la salida pedida) ----
empleado('Ana', 'TI', 900).
empleado('Luis', 'RRHH', 1200).
empleado('Sofia', 'Marketing', 1100).

% ---------- Utilitarios de E/S ----------
nl2 :- nl, nl.

linea_sep :-
    writeln('----------------------------').

cabecera_sistema :-
    writeln('=========================================='),
    writeln('SISTEMA DE EMPLEADOS EN PROLOG'),
    writeln('Simulación de una sesión interactiva con el menú principal'),
    writeln('==========================================').

cabecera_iniciado :-
    writeln('SISTEMA DE EMPLEADOS INICIADO').

mostrar_menu :-
    writeln('========= MENU ========='),
    writeln('1. Listar empleados'),
    writeln('2. Agregar empleado'),
    writeln('3. Eliminar empleado'),
    writeln('4. Actualizar empleado'),
    writeln('5. Agregar con validacion'),
    writeln('6. Eliminar todos'),
    writeln('0. Salir'),
    writeln('========================'),
    write('Seleccione una opcion: ').

% Lee un átomo o string y lo normaliza a átomo conservando comillas si se escriben.
leer_termino(T) :-
    read(T0),
    (   string(T0) -> atom_string(T, T0)
    ;   atom(T0)   -> T = T0
    ;   number(T0) -> T = T0
    ;   T = T0).

% ---------- Operaciones CRUD ----------

listar_empleados :-
    writeln('--- LISTA DE EMPLEADOS ---'),
    (   empleado(N, D, S),
        format('Nombre: ~w | Depto: ~w | Salario: $~w~n', [N, D, S]),
        fail
    ;   true
    ),
    linea_sep.

agregar_empleado(Nombre, Depto, Salario) :-
    % assertz para conservar el orden (nuevo al final)
    assertz(empleado(Nombre, Depto, Salario)),
    format('Se agrego a ~w en el departamento ~w con salario $~w.~n',
           [Nombre, Depto, Salario]).

eliminar_empleado(Nombre) :-
    retract(empleado(Nombre, Depto, Salario)), !,
    format('Se elimino a ~w del departamento ~w (salario $~w).~n',
           [Nombre, Depto, Salario]).
eliminar_empleado(Nombre) :-
    format('No se encontro a ~w para eliminar.~n', [Nombre]).

actualizar_empleado(Nombre, NuevoDepto, NuevoSalario) :-
    retract(empleado(Nombre, _, _)), !,
    assertz(empleado(Nombre, NuevoDepto, NuevoSalario)),
    format('Datos actualizados: ~w → Depto: ~w | Salario: $~w~n',
           [Nombre, NuevoDepto, NuevoSalario]).
actualizar_empleado(Nombre, _, _) :-
    format('No se encontro a ~w para actualizar.~n', [Nombre]).

agregar_unico(Nombre, Depto, Salario) :-
    (   empleado(Nombre, _, _)
    ->  format('El empleado ~w ya existe, no se agrego.~n', [Nombre])
    ;   agregar_empleado(Nombre, Depto, Salario)
    ).

eliminar_todos :-
    retractall(empleado(_,_,_)),
    writeln('Todos los empleados han sido eliminados de la base.').

% ---------- Menú interactivo ----------

main :-
    cabecera_sistema,
    nl,
    cabecera_iniciado,
    loop_menu.

loop_menu :-
    mostrar_menu,
    read(Opc),
    nl,
    (   Opc =:= 1 ->
            listar_empleados, loop_menu
    ;   Opc =:= 2 ->
            write('Nombre: '), read(N),
            write('Departamento: '), read(D),
            write('Salario: '), read(S),
            agregar_empleado(N, D, S), nl, loop_menu
    ;   Opc =:= 3 ->
            write('Nombre a eliminar: '), read(N2),
            eliminar_empleado(N2), nl, loop_menu
    ;   Opc =:= 4 ->
            write('Nombre: '), read(N3),
            write('Nuevo departamento: '), read(D3),
            write('Nuevo salario: '), read(S3),
            actualizar_empleado(N3, D3, S3), nl, loop_menu
    ;   Opc =:= 5 ->
            write('Nombre: '), read(N4),
            write('Departamento: '), read(D4),
            write('Salario: '), read(S4),
            agregar_unico(N4, D4, S4), nl, loop_menu
    ;   Opc =:= 6 ->
            eliminar_todos, nl, loop_menu
    ;   Opc =:= 0 ->
            true
    ;   writeln('Opcion no valida.'), nl, loop_menu).
