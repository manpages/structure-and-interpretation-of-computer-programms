(define (fast-expt b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter b n a)
  (cond ((= n 0) a)
        ; <3 popoffka
        (else (fast-expt-iter (square b) 
                              (quotient n 2) 
                              (cond ((even? n) a)
                                    (else (* a b)) ))) ))

(define (even? n)
  (= (remainder n 2) 0) )
