#lang racket

;ejercicio 1 - contar elementos positivos en una lista
(define (contar-positivos lista)
  (length (filter (lambda (x) (> x 0)) lista)))

(displayln "1. Contar elementos positivos en una lista:")
(displayln (contar-positivos '(3 -2 7 0 -5 9)))
(newline)

;ejercicio 2 - generar lista de cuadrados pares
(define (cuadrados-pares lista)
  (map (lambda (x) (* x x))
       (filter even? lista)))

(displayln "2. Generar lista de cuadrados pares:")
(displayln (cuadrados-pares '(1 2 3 4 5 6 7 8)))
(newline)

;ejercicio 3 - calcular factorial de un número
(define (factorial n)
  (if (<= n 1)
      1
      (* n (factorial (- n 1)))))

(displayln "3. Calcular factorial de un número:")
(displayln (factorial 5))
(newline)

;ejercicio 4 - elevar cada elemento al cubo
(define (elevar-al-cubo lista)
  (map (lambda (x) (expt x 3)) lista))

(displayln "4. Elevar cada elemento al cubo:")
(displayln (elevar-al-cubo '(2 3 4)))
(newline)

;ejercicio 5 - sumar todos los elementos impares
(define (sumar-impares lista)
  (apply + (filter odd? lista)))

(displayln "5. Sumar todos los elementos impares:")
(displayln (sumar-impares '(1 2 3 4 5 6 7)))
(newline)

;ejercicio 6 - determinar si una lista contiene números negativos
(define (contiene-negativos? lista)
    (not (null? (filter (lambda (x) (< x 0)) lista))))

(displayln "6. Determinar si una lista contiene números negativos:")
(displayln (contiene-negativos? '(5 9 -3 2)))
(newline)

;ejercicio 7 - calcular la suma acumulada de una lista
(define (suma-acumulada lista)
  (define (helper lst acc)
    (if (null? lst)
        '()
        (let ((new-acc (+ acc (car lst))))
          (cons new-acc (helper (cdr lst) new-acc)))))
  (helper lista 0))

(displayln "7. Calcular la suma acumulada de una lista:")
(displayln (suma-acumulada '(1 2 3 4)))
(newline)

;ejercicio 8 - concatenar cadenas de texto en una lista
(define (concatenar-cadenas lista)
  (apply string-append lista))
(displayln "8. Concatenar cadenas de texto en una lista:")
(displayln (concatenar-cadenas '("Hola, " "mundo" "!")))
(newline)   

;ejercicio 9 - generar lista con el doble de los numeros mayores que 5
(define (doble-mayores-que-cinco lista)
  (map (lambda (x) (* 2 x))
       (filter (lambda (x) (> x 5)) lista)))

(displayln "9. Generar lista con el doble de los numeros mayores que 5:")
(displayln (doble-mayores-que-cinco '(3 6 8 2 10)))
(newline)

;ejercicio 10 - invertir el orden de una lista
(define (invertir-lista lista)
  (reverse lista))

(displayln "10. Invertir el orden de una lista:")
(displayln (invertir-lista '(1 2 3 4)))
(newline)

;ejercicio 11 - crear una funcion que reciba una funcion como parametro la funcion a recibir sera la del cuadrado
(define (aplicar-funcion lista func)
  (map func lista))

(displayln "11. Crear una funcion que reciba una funcion como parametro:")
(displayln (aplicar-funcion '(1 2 3 4) (lambda (x) (* x x))))
(newline)

;ejercicio 12 - promedio de los numeros mayores a 5 en un valor dado usando map, filter y foldl
(define (promedio-mayores-a-cinco lista)
  (define mayores (filter (lambda (x) (> x 5)) lista))
  (/ (foldl + 0.0 mayores) (length mayores)))

(displayln "12. Promedio de los numeros mayores a 5 en un valor dado:")
(displayln (exact->inexact (promedio-mayores-a-cinco '(3 6 8 10 4 9 2 7))))
(newline)  
