(define (f-bad n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1)) 
                 (* 2 (f (- n 2))) 
                 (* 3 (f (- n 3))) )) ))

(define (f-good n)
  (cond ((< n 3) n)
        (else (f-iter 3 n 2 1 0)) ))

(define (f-iter i n a b c)
  (cond ((= i n) r)
        (else (f-iter (+ 1 i) n r a b)) ))

(define (y a b c)
  (+ a (* 2 b) (* 3 c)) )
