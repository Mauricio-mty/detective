#lang racket

(define (promedio-positivos lst)
  (let* ([positivos (filter (lambda (x) (> x 0)) lst)]
         [suma (apply + positivos)]
         [cantidad (length positivos)])
    (if (zero? cantidad)
        0
        (/ suma cantidad))))

(promedio-positivos '(1 -2 3 4 5))