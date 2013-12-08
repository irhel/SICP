#lang racket
(define (inc x)
  (+ x 1))
(define (square x)
  (if (= x 0) 0
      (+ 1 (square (- x 1)))))
(define zero
  (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x)
                (f ((n f) x)))))
(define (add-decimal n m)
  (define (apply-procedure f times argument)
  (if (= times 0)
      argument
      (f (apply-procedure f (- times 1) argument))))
  (lambda (f) (lambda (x) (apply-procedure f (+ n m) x))))
(add-1 zero)
(add-1 (lambda (f) (lambda (x) x)))
(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))
(lambda (f) (lambda (x) (f ((lambda (x) x) x))))
(define one (lambda (f) (lambda (x) (f x)))) ; Represented directly.
(define (add-church-numerals m n)
   (lambda (f) (lambda (x) ((m f) ((n f) x)))))
(add-1 one)
(add-1 (lambda (f) (lambda (x) (f x))))
(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f x))) f) x))))
(lambda (f) (lambda (x) (f (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

(define (f-calls church-numeral);Given a church numeral returns the number of function calls <=> the decimal representation.
  (- ((church-numeral inc) 0) 0))

(f-calls one) ; 1
(f-calls zero) ; 0
(f-calls (add-decimal 14 12)) ; 26
(f-calls (add-church-numerals one two)) ; 3