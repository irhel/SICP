#lang scheme
; Normal order. Fully expand and then reduce. Evaluate only when needed.
; Irhad Elezovikj
; Change the procedure name "remainder" to "r" to avoid headaches and seizures.
(define (gcd a b)
	(if (= b 0) a
		(gcd b (remainder a b))))
(define (r a b)
  (remainder a b))

(gcd 206 40)
(if (= 40 0) 206 (gcd 40 (r 206 40)))

(gcd 40 (r 206 40))
(if (= (r 206 40) 0) 40 (gcd (r 206 40) (r 40 (r 206 40)))); (r 206 40) has to be evaluated. 1 time in total.

(if (= 6 0) 40 (gcd (r 206 40) (r 40 (r 206 40))));1 time in total.

(gcd (r 206 40) (r 40 (r 206 40)))
(if (= (r 40 (r 206 40)) 0) (r 206 40) (gcd (r 40 (r 206 40)) 
                                            (r (r 206 40) (r 40 (r 206 40))))) ; +2 to evaluate the predicate. 3 times in total.

(if (= 4 0) (r 206 40) (gcd (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40)))))

(gcd (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40))))

(if (= (r (r 206 40) (r 40 (r 206 40))) 0) (r 40 (r 206 40)) ; +4 for predicate. 7 in total.
    (gcd (r (r 206 40) (r 40 (r 206 40))) (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40))))))

(if (= 2 0) (r 40 (r 206 40)) 
    (gcd (r (r 206 40) (r 40 (r 206 40))) (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40))))))

(gcd (r (r 206 40) (r 40 (r 206 40))) (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40)))))

(if (= (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40)))) 0); +7 for predicate. 14 in total.
    (r (r 206 40) (r 40 (r 206 40)))
    (gcd (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40))))
         (r (r (r 206 40) (r 40 (r 206 40))) (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40)))))))


(if (= 0 0) (r (r 206 40) (r 40 (r 206 40)))
    (gcd (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40))))
         (r (r (r 206 40) (r 40 (r 206 40))) (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40)))))))
    

(r (r 206 40) (r 40 (r 206 40))) ;+4 and that's all. 18 in total.


;Applicative order evaluate all the arguments when a procedure is called.

(gcd 206 40)
(if (= 40 0) 206 (gcd 40 (r 206 40))) ; +1 , 1 in total.

(if (= 40 0) 206 (gcd 40 6))

(gcd 40 6) 
(if (= 6 0) 40 (gcd 6 (r 40 6))) ;+ 1, 2 in total.

(if (= 6 0) 40 (gcd 6 4))

(gcd 6 4)
(if (= 4 0) 6 (gcd 4 (r 6 4))) ; + 1, 3 in total.

(gcd 4 2)
(if (= 2 0) 4 (gcd 2 (r 4 2))) ; +1, 4 in total.

(if (= 2 0) 4 (gcd 2 0))

(gcd 2 0)
(if (= 0 0) 2 (gcd 0 (r 2 0))) ; if is a special form and hence short-circuited, the procedure terminates with result of 2.



    


