#lang scheme
(define (square x)
  (* x x))
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (append answer (list (square (car things))))
              )))
  (iter items null))
(square-list (list 1 2 3 4 5))
; Results are in reverse because the square of each element goes to the frint. (1 2) -> answer = null then answer = 1 then answer = 4 1
; Second example, cons proc forms a pair. We want to obtain a list which is a pair with end element of null.
; But since answer is a list we obtain a list with sublists as the end result.
; To remedy it, use append.