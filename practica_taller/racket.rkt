#lang racket

;Ejercicio 1 – Sumar elementos de una lista
(define (suma-lista lista)
 (foldl + 0 lista))

(displayln "1. Sumar elementos de una lista:")
(displayln (suma-lista '(1 2 3 4 5)))
(newline)

;Ejercicio 2 – Filtrar mayores a un número
(define (filtrar-mayores lista n)
 (filter (lambda (x) (> x n)) lista))

(displayln "2. Filtrar mayores a un número:")
(displayln (filtrar-mayores '(5 3 8 1 10) 4))
(newline)

;Ejercicio 3 – Producto de una lista
(define (producto-lista lista)
 (foldl * 1 lista))

(displayln "3. Producto de una lista:")
(displayln (producto-lista '(2 3 4)))
(newline)

;Ejercicio 4 – Aplicar una función a todos los elementos
(define (aplicar-funcion f lista)
 (map f lista))

(displayln "4. Aplicar una función a todos los elementos:")
(displayln "Aplicar función que duplica los elementos:")
(displayln (aplicar-funcion (lambda (x) (* x 2)) '(1 2 3 4)))
(displayln "convertir a cadenas:")
(displayln (aplicar-funcion number->string '(10 20 30)))
(newline)

;Ejercicio 5 – Cuadrado de números
(define (cuadrado-lista lista)
 (map (lambda (x) (* x x)) lista))

(displayln "5. Cuadrado de números:")
(displayln (cuadrado-lista '(1 2 3 4 5)))
(newline)

;Ejercicio 6 – Duplicar elementos de una lista
(define (duplicar-elementos lista)
 (map (lambda (x) (* 2 x)) lista))

(displayln "6. Duplicar elementos de una lista:")
(displayln (duplicar-elementos '(2 4 6)))
(newline)

;Ejercicio 7 – Seleccionar los números pares
(define (seleccionar-pares lista)
 (filter even? lista))

(displayln "7. Seleccionar los números pares:")
(displayln (seleccionar-pares '(1 2 3 4 5 6)))
(newline)

;Ejercicio 8 – Calcular el promedio de una lista (Combinar foldl con operaciones aritméticas y length.)
(define (promedio-lista lista)
 (foldl + 0 lista) 
 (/ (foldl + 0 lista) (length lista)))

(displayln "8. Calcular el promedio de una lista:")
(displayln (promedio-lista '(4 6 8 10)))
(newline)

;Ejercicio 9 – Elevar elementos a una potencia n
(define (elevar-a-potencia lista n)
 (map (lambda (x) (expt x n)) lista))

(displayln "9. Elevar elementos a una potencia n:")
(displayln (elevar-a-potencia '(2 3 4) 2)) 
(newline)

;Ejercicio 10 – Contar cuántos elementos superan un valor dado
(define (contar-mayores lista n)
 (length (filter (lambda (x) (> x n)) lista)))

(displayln "10. Contar cuántos elementos superan un valor dado:")
(displayln (contar-mayores '(5 7 2 9 1 10) 6))
(newline)

;Ejercicio 11 – Aplicar una función dos veces función sqrt y valor 16
(define (aplicar-dos-veces f x)
 (f (f x)))

(displayln "11. Aplicar una función dos veces:")
(displayln (aplicar-dos-veces sqrt 16))
(newline)

;Ejercicio 12 – Producto de elementos mayores a 5 usando map, filter y foldl
(define (producto-mayores-a-cinco lista)
 (foldl * 1 (filter (lambda (x) (> x 5)) lista)))

(displayln "12. Producto de elementos mayores a 5:")
(displayln (producto-mayores-a-cinco '(2 5 6 8 3 10)))
(newline)
