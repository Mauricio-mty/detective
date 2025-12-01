#lang racket

(define (procesar-lista lst f)
  (define lista-transformada (map f lst))
  (define suma (apply + lista-transformada))
  (list lst lista-transformada suma))

(procesar-lista '(1 2 3 4) (lambda (x) (* x 2)))
