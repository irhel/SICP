#lang racket
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
;If b is greater then zero than we add a and b else we substract -b from a. a - (-b) = a + b.

