#lang racket
(define (fringe tree)
  (cond ((null? tree) tree)
        ((list? (car tree))
         (append (fringe (car tree)) (fringe (cdr tree))))
        (else
         (append (list (car tree)) (fringe (cdr tree))))))
(fringe (list 1 2))
(fringe (list (list (list (list (list 124012 124124))))))
(fringe (list (list 3 4) 2))
(fringe (list (list 3 4) (list 2 1)))
(define x (list (list 1 2) (list 3 4)))