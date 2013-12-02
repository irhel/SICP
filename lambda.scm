#lang scheme

(define (gcd a b)
   (if (= b 0)
       a
       (gcd b (remainder a b))))
(define (divides? a b) 
  (= (remainder b a) 0))
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (lambda (x) (* x x) test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (prime? n)
  (cond ((< n 2) #f)
        (else (= (smallest-divisor n) n))))

(define (filtered-accumulate combiner null-value term a next b filter)
  (if (> a b)
      null-value
      (if (filter a) (combiner (term a) (filtered-accumulate combiner null-value
                                                             term (next a)
                                                             next b
                                                             filter))
          (filtered-accumulate combiner null-value term (next a) next b filter))))
(define (sum term a next b filter)
  (filtered-accumulate + 0 term a next b filter))
(define (product term a next b filter)
  (filtered-accumulate * 1 term a next b filter))
(define (sum-of-primes a b)
  (sum (lambda (x) (* x x)) a (lambda (x) (+ x 1)) b (lambda (x) (prime? x))))
(define (product-relative-prime n)
  (filtered-accumulate * 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) (- n 1) (lambda (x) ( = (gcd x n) 1))))
(product-relative-prime 10)
(product-relative-prime 11)

        
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       