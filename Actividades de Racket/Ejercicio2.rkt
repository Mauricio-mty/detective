#lang racket

; Ejercicio 2: Definí una función que eleve al cuadrado cada número de una lista y luego sume todos los resultados.

(define (sumar-cuadrados lista)
  (apply + (map (lambda (x) (* x x)) lista)))
  
; Ejemplo de uso
(sumar-cuadrados '(1 2 3 4))  ; → 30