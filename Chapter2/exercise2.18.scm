#lang scheme
(define (length l)
    (if (null? l)
        0
        (+ 1 (length (cdr l)))))
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))
(define (reverse l)
  (if (or (= (length l) 1) (= (length l) 0))
      l
      (append (reverse (cdr l)) (list (car l)))))
(reverse (list 1 4 9 16 25))