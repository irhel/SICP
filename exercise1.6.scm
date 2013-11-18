;Irhad Elezovikj;
#lang scheme
(define (average x y)
(/ (+ x y) 2))

(define (abs x)
  (cond ((> x 0) x)
        ((< x 0) (- x))
        ((= x 0) 0)))

(define (square x)
  (* x x))

(define (good-enough? guess x)
(< (abs (- (square guess) x)) 0.00000000001))

(define (improve guess x)
(average guess (/ x guess)))

(define (sqrt-iter guess x)
(new-if (good-enough? guess x) ; AHA. new-if isn't a special form and hence its arguments get evaluated when the procedure
        ; when the procedure is called. In other words (sqrt (improve guess x) x) continues ad infinitum.
guess
(sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (new-if predicate then-clause else-clause) ;this isn't a spacial form. Applicative-order evaluation applies.
  (cond (predicate then-clause)
        (else else-clause)))

