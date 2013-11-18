#lang scheme
(define (pow x y)
  (cond ((= y 0) 1)
        ((= y 1) x)
        ( else (* x (pow x (- y 1))))))
(define (fib n)
  (fib-iter 1 0 n))
(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))