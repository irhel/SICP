#lang scheme
(define (same-parity x . z)
  (define (f list1 filter)
    (if (null? list1)
        null
        ( if (filter (car list1))
             (cons (car list1) (f (cdr list1) filter))
             (f (cdr list1) filter))))
  (if (even? x)
      (f (cons x z) even?)
      (f (cons x z) odd?)))
(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)