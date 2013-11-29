#lang scheme

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a)
                                     next b))))
(define (identity x)
  x)
(define (inc x)
  (+ x 1))
(define (product term a next b)
  (accumulate-iterative * 1 term a next b))
(define (sum term a next b)
  (accumulate-iterative + 0 term a next b))
(define (fact n)
  (product identity 1 inc n))
(define (sum-firstn n)
  (sum identity 1 inc n))

(define (accumulate-iterative combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))
(fact 10)
(sum-firstn 100)