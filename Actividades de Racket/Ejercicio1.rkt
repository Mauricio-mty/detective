#lang racket

; Ejercicio 1: Definí una función que reciba una lista de números y devuelva cuántos son pares.

(define (contar-pares lista)
  (length (filter (lambda (x) (even? x)) lista)))

; Ejemplo de uso

(contar-pares '(1 2 3 4 5 6))  ; → 3

