(load "sqrt-newton-example.lisp")

(define (test_do x)
  (define result (sqrt-newton x))
  (define mistake (abs (- (square result) x)))
  (or (and (< mistake precision) ; we either meet requirements
        (< mistake (* x precision))) ; even for small numbers
      (= 0 (- (sqrt x) result)))) ; or we couldn't do better

(define (test_small x)
  (if (= x 0)
    (= 0 0)
    (and (test_do (/ 1.0 (expt 10 x))) 
         (test_small (- x 1)))))

(define (test_normal x) (and
  (if (= x 0)
    (= 0 0)
    (and (test_do x)
         (test_normal (- x 1)))))
)

(define (test_big x)
  (if (= x 0)
    (= 0 0)
    (and (test_do (expt 10 x))
         (test_big (- x 1)))))

(define test (and
  (display "Running small test...\n")
  (or 
    (test_small 4)
    (and (display "FAIL (small test)!\n")
    #f))

  (display "Running normal test...\n")
  (or
    (test_normal 10)
    (and (display "FAIL (normal test)!\n")
    #f))

  (display "Running big test...\n")
  (or 
    (test_big 13)
    (and (display "FAIL (big test)!\n")
    #f))
))
