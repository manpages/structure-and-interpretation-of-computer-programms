(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
;
; Normal-order:
; gcd 206 40
; gcd 40 (rem 206 40)
; gcd 40 6
; gcd 6 (rem 40 6)
; gcd 6 4
; gcd 4 (rem 6 4)
; gcd 4 2
; gcd 2 (rem 4 2)
; gcd 2 0
; 2
;
; Applicative-order: //rem gets evaluated in if
; gcd 206 40
; gcd 40 (rem 206 40) 
; gcd 6 (rem 40 6)
; gcd 4 (rem 6 4)
; gcd 2 (rem 4 2)
; 2
