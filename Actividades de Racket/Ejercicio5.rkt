#lang racket
(define (maximo lst)
     (foldl (lambda (x accumulator)
            (if (> x accumulator)
                x accumulator)
            )
          (first lst)
          (rest lst)))

(maximo '(3 1 4 1 5 9 2 6 5 3 5))