#lang scheme
(define (last-pair list)
  (define (length list)
    (if (null? list)
        0
        (+ 1 (length (cdr list)))))
  (if (= (length list) 1)
      list
      (last-pair (cdr list))))
