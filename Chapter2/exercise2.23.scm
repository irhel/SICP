#lang scheme
(define (for-each proc items)
  (when (not (null? items))
    (proc (car items))
    (for-each proc (cdr items))))
(for-each (lambda (x) (newline) (display x)) (list 1 2 3 4 5 6 7 8 9 10))
