#lang scheme
(define (double x)
  (+ x x))
(define (halve x)
  (/ x 2))
(define (* a b)
  (*-iter a b 0))
(define (*-iter a b sum)
  (cond ((= b 0) 0)
        ((= b 1) (+ a sum))
        ((even? b) (*-iter (double a) (halve b) sum))
        (else (*-iter a (- b 1) (+ sum a)))))

 
(= (* 4 0) 0) 
(= (* 5 1) 5) 
(= (* 7 10) 70)
(= (* 99 99) 9801) 
(= (* 9 8) 72)