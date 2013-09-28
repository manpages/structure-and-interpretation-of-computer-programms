(define (pascal n)

  (define (gauss-sum n) 
    (/ (* n (+ 1 n)) 2) )

  (define (xy n)

    (define (xy-iter p s y n)
      (cond ((>= s n) (list (- n p) y))
            (else (xy-iter s (gauss-sum (+ 1 y)) (+ 1 y) n)) ))

    (xy-iter 0 0 0 n)
  )

  (define (pascal-list l)
    (pascal-do (car l) (car (cdr l))) )

  (define (pascal-do x y)
    (define lower-bound (+ 1 (gauss-sum (- y 1))))
    (define higher-bound (- (gauss-sum y) (gauss-sum (- y 1))))
    (cond ((or (< y 1) (< x 1) (< (gauss-sum y) x)) 0)
          ((or (= x lower-bound) (= x higher-bound)) 1)
          (else (+ (pascal-do (- x 1) (- y 1)) (pascal-do x (- y 1)))) ))

  (pascal-list (xy n))
)
