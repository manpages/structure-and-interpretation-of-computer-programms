(define (big-square x y z)
  (define xy (+ (* x x) (* y y)))
  (define xz (+ (* x x) (* z z)))
  (define yz (+ (* y y) (* z z)))
  (if (> xy xz) (if (> yz xy) yz xy) (if (> yz xz) yz xz))
)

(define (big-square-fix x y z) ; <3 popoffka
  (define (big-square-do l)
    (if (eq? l (list)) 0
                       (+ (square (car l)) (big-square-do (cdr l))) )) ; should be more iterative :D
  (define (drop-min l)
    (define (drop-min-do candidate l r)
      (if (eq? r (list)) l
                         (if (< candidate (car r)) (drop-min-do candidate (cons (car r) l) (cdr r))
                                                   (drop-min-do (car r) (cons candidate l) (cdr r)) ) ))
    (drop-min-do (car l) (list) (cdr l)) ) ; die with an error if we want to drop something from an empty list

  (big-square-do (drop-min (list x y z))) ) ; solution itself :)

(define (test) (and (= (big-square-fix 1 2 3)
                       (big-square-fix 1 3 2)
                       (big-square-fix 2 1 3)
                       (big-square-fix 2 3 1)
                       (big-square-fix 3 1 2)
                       (big-square-fix 3 2 1)
                       13 )
                    (= (big-square-fix -10000 1 1) 2)))
(test)
