(define (fast-mul b n)
  (fast-mul-iter b n 0))

(define (fast-mul-iter b n a)
  (cond ((= n 0) a)
        (else (fast-mul-iter (+ b b)
                             (quotient n 2)
                             (cond ((even? n) a)
                                   (else (+ a b)) ))) ))

(define (even? n)
  (= (remainder n 2) 0) )
