#lang scheme
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


; Misread problem statement, the below procecure generates the first 3 prime numbers greater than n.
; EDIT: Renamed it to search-for-prime to avoid conflict.
(define (search-for-prime n)
  (define (search-for-primes-greater-than n count)
    (if (< count 3)
        (if (and (odd? n) (prime? n)) (display-and-continue n count) (search-for-primes-greater-than (+ n 2) count))
        (void)))
  (define (display-and-continue n count)
    (display n)
    (newline)
    (search-for-primes-greater-than (+ n 2) (+ count 1)))
  (search-for-primes-greater-than (if (even? n) (+ n 1) n) 0))

(define (search-for-primes low high)
  (if (even? low) (search-for-primes (+ low 1) high)
      (cond ((< low high) (timed-prime-test low) (search-for-primes (+ low 2) high))))) 
; For 1000 approximately 0.008 mS.
; For 10000 appriximately 0.021 mS.
; For 100000 apprixmately 0.065 mS.
; For 1000000 approximately 0.21 mS.
; For 10000000 apprixmately 0.64 mS.
; For 100000000 approximately 2.1 mS.
; For 1000000000 apprixamately 6.64 mS.
; 3 times increase in required time.