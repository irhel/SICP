#lang racket
(define (square x) (* x x))
(define (sum-of-squares x y) (+ (square x) (square y)))
(define (smallest x y z) (cond
                           ((and (<= x y) (<= x z)) x)
                           ((and (<= y x) (<= y z)) y)
                           (else z)))
(define (two-larger-sum-square x y z) (cond
                                        ((= (smallest x y z) x) (sum-of-squares y z ))
                                        ((= (smallest x y z) y) (sum-of-squares x z ))
                                        (else (sum-of-squares x y))))
