#lang scheme
(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))
(define (times x num)
  (if (> (remainder x num) 0) 0
      (+ 1 (times (/ x num) num))))
(define (car x)
  (times x 2))
(define (cdr x)
  (times x 3))