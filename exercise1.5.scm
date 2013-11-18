#lang scheme
(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))
;applicative-order: Evaluate all the arguments when the procedure is called.
;normal-order: Delay evaluation until primitives are needed.