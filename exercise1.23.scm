#lang scheme
(define (search-for-prime n)
  (define (search-for-primes-greater-than n count)
    (if (< count 3)
        (if (and (odd? n) (prime? n)) (display-and-continue n count) (search-for-primes-greater-than (+ n 2) count))
        (void)))
  (define (display-and-continue n count)
    (timed-prime-test n)
    (search-for-primes-greater-than (+ n 2) (+ count 1)))
  (search-for-primes-greater-than (if (even? n) (+ n 1) n) 0))
(define (search-for-primes low high)
  (if (even? low) (search-for-primes (+ low 1) high)
      (cond ((< low high) (timed-prime-test low) (search-for-primes (+ low 2) high))))) 


(define (timed-prime-test n)
   (newline)
   (display n)
   (start-prime-test n (current-inexact-milliseconds)))
(define (start-prime-test n start-time)
   (cond ((prime? n)
          (report-prime (- (current-inexact-milliseconds) start-time)))))
(define (report-prime elapsed-time)
   (display " *** ")
   (display elapsed-time))

(define (square x)
  (* x x))
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? n test-divisor) test-divisor)
        (else (find-divisor n (+ 1 test-divisor)))))
(define (divides? n d)
  (= (remainder n d) 0))
(define (prime? n)
  (= (smallest-divisor n) n))
(define (next n)
  (if (odd? n) (+ n 2) (+ n 1)))

; Without next procedure for primes > 1 000 000, time =  0.2060546875 mS
; With procedure next, time = 0.13892578125 mS Rat: 1.483199775

; Without next procedure for primes > 10 000 000, time = 0.64990234375
; With next, time = 0.421875. Rat: 1.540509259

; Without next procedure for primes > 100 000 000, time = 2.0419921875
; With next, time = 1.513916015625 Rat: 1.348814707

; Without next for primes > 10 ^ 13, time = 3044.824951171875 mS = 3 seconds.
; With next, time = 1737.48095703125 Rat: 1.752436445



; Doesn't run half as fast. Though significant improvement is observed.
; Reason might be the imprecise (current-inexact-milliseconds) procedure plus OS interference.
