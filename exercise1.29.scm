#lang scheme
(define (cube x)
  (* x x x))
(define (square x)
  (* x x))
(define (sum term a next b)
  (if (> a b)
      0
   (+ (term a) (sum term (next a) next b))))
(define (integral f a b)
  (define n 1000.0)
  (define h (/ (- b a) n))
  (define (integral-term x)
    (if (even? x) (* 2 (f (+ a (* x h)))) (* 4 (f (+ a (* x h))))))
  (define (integral-next x)
    (+ x 1))
  (* (/ h 3) (+ (sum integral-term 1 integral-next (- n 1)) (+ (f a) (f (+ a (* n h)))))))
(integral cube 0 1)
; Yileds 0.24999999999999992 when n = 100.0
; And, yields 0.2500000000000003, when n = 1000.0 