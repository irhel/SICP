#lang racket
(define (deep-reverse items)
  (cond ((null? items) items)
        ((list? (car items))
         (append (deep-reverse (cdr items)) (list (deep-reverse (car items)))))
        (else
         (append (deep-reverse (cdr items)) (list (car items))))))
(define x (list 1 2))
(deep-reverse x)
(define y (list (list 1 2) (list 2 3)))
(deep-reverse y)
(define z (list (list (list (list 1 2)))))
(deep-reverse z)
(deep-reverse (list (list (list (list (list (list (list (list 1 2 3 4 5) (list 10 11)) (list 3 4)) (list 1 2)))))))