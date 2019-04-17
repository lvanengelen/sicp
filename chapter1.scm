#lang sicp

; Exercise 1.2
; Evaluates to (/ -37 150)
(/ (+ 5
      4
      (- 2
         (- 3
            (+ 6
               (/ 4 5)))))
   (* 3
      (- 6 2)
      (- 2 7)))

; Exercise 1.3
(define (sum-of-squares-of-largest x y z)
  (define (square x) (* x x))
  (define (sum-of-squares x y) (+ (square x) (square y)))
  (cond ((and (< z x) (< z y)) (sum-of-squares x y))
        ((and (< y x) (< y z)) (sum-of-squares x z))
        ((and (< x y) (< x z)) (sum-of-squares y z))))

; Exercise 1.7
(define (sqrt x)
  (define (sqrt-iter guess previous-guess x)
    (if (good-enough? guess previous-guess)
        guess
        (sqrt-iter (improve guess x) guess x)))
  (define (good-enough? guess previous-guess)
    (< (abs (/ (- guess previous-guess) guess)) 0.001))
  (define (improve guess x)
    (average guess (/ x guess)))
  (define (average x y)
    (/ (+ x y) 2))
  (sqrt-iter 1.0 2.0 x))