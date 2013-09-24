(define (f-bad n)
  (cond ((< n 3) n)
        (else (+ (f-bad (- n 1)) 
                 (* 2 (f-bad (- n 2))) 
                 (* 3 (f-bad (- n 3))) )) ))

(define (f-good n)
  (define (y a b c)
    (+ a (* 2 b) (* 3 c)) )

  (define (f-iter i n a b c)
    (define r (y a b c))
    (cond ((= i n) r)
          (else (f-iter (+ 1 i) n r a b)) ))

  (cond ((< n 3) n)
        (else (f-iter 3 n 2 1 0)) )
)
