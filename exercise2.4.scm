#lang scheme
(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))
(define (cdr z)
  (z (lambda (p q) q)))

(define z (cons 1 2))
(car z)
(car (lambda (m) (m 1 2)))
((lambda (m) (m 1 2)) (lambda (p q) p))
((lambda (p q) p) 1 2)
1

(cdr z)
(cdr (lambda (m) (m 1 2)))
((lambda (m) (m 1 2)) (lambda (p q) q))
((lambda (p q) q) 1 2)
2
