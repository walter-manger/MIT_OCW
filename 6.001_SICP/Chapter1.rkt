#lang racket

;; Exercise 1.1
;10                                   => 10
;(+ 5 3 4)                            => 12
;(- 9 1)                              => 8
;(/ 6 2)                              => 3
;(+ (* 2 4) (- 4 6))                  => 6
;(define a 3)                         => a
;(define b (+ a 1))                   => b
;(+ a b (* a b))                      => 19
;(= a b)                              => False
;(if (and (> b a) (< b (* a b))) b a) => 4
;(cond ((= a 4) 6)
;((= b 4) (+ 6 7 a))
;(else 25))                           => 16
;(+ 2 (if (> b a) b a))               => 6
;(* (cond ((> a b) a)
;((< a b) b)
;(else -1))
;(+ a 1))                             => 16
;; Results
10
(+ 5 3 4)
(- 9 1)
(/ 6 2)
(+ (* 2 4) (- 4 6))
(define a 3)
(define b (+ a 1))
(+ a b (* a b))
(= a b)
(if (and (> b a) (< b (* a b)))
b
a)
(cond ((= a 4) 6)
((= b 4) (+ 6 7 a))
(else 25))
(+ 2 (if (> b a) b a))
(* (cond ((> a b) a)
((< a b) b)
(else -1))
(+ a 1))


;; Exercise 1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))

;; Exercise 1.3
(define (sum-two-largest x y z) 
  (define (sq a) (* a a))
  (cond ((> x y)  (+ (sq x) (cond ((> y z) (sq y)) (else (sq z)))))
        (else (+ (sq y) (cond ((> x z) (sq x)) (else (sq z))))))
)

;; Exercise 1.4
;;(define (a-plus-abs-b a b)
;;  ((if (> b 0) + -) a b))
;; The if combination determines the operation on a and b
;; if b is a negative number, ie less than zero, then the operation
;; is the difference between a and -b
;; else, the + operator is used

;; Exercise 1.5



