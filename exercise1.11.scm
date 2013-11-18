#lang scheme
(define (fr n)
  (cond ((< n 3) n)
        (else (+ (fr (- n 1)) (* (fr (- n 2)) 2) (* (fr (- n 3)) 3)))))
(define (fi n)
  (fi-iter 2 1 0 2 n))
(define (fi-iter a b c count n)
  (cond ((< n 3) n)
        ((= count n) a)
        (else (fi-iter (+ a (* b 2) (* 3 c)) a b (+ count 1) n))))
;fr - stands for recursive and fi stands for the iterative process.