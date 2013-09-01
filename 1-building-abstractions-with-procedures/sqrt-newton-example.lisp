(define (sqrt-newton x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x)
                x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x) (and 
  (display x)
  (display ": Checking if ")
  (display guess)
  (display " is good enough\n")
  (or
    (< (abs (- (improve guess x) guess)) min_delta))
))

(define min_delta (square precision))
(define precision 0.00001)
