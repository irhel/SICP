#lang scheme
(define (square x)
  (* x x))
(define (f g) (g 2))
(f f)
; (f,f) -> (f, 2) -> (2 2) 
; 2 is a primitive and not a procedure name, as expected the interprereter will
; complain.