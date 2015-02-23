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
(define (p) (p))
(define (test x y)
(if (= x 0) 0 y))
(test 0 (p))

;; Applicative-Order: Eval [the arguments] and [then] Apply. 
;; To apply a compound procedure to arguments, 
;; evaluate the body of the procedure with each formal
;; parameter replaced by the corresponding argument.

; Applicative-Order Applied
; (test 0 (p))
; (test 0 ((p)))          ; Replace
; (test 0 (((p))))        ; Replace
; (test 0 ((((p)))))      ; Replace
; ...                     ; Replace Forever

; Normal-Order: Fully expand and then reduce

; Normal-Order Applied
; (test 0 (p))
; (if (= 0 0) 0 (p))      ; 
; (if true 0 (p))        
; 0
; Short Cicuits because the predicate is evaluated first, 
; which evaluates to true, therefore the consequent, 
; 0 in this case, is returned


;; Exercise 1.6
; Original Newton's Method
;(define (sqrt-iter guess x)
;  (if (good-enough? guess x)
;      guess 
;      (sqrt-iter (improve guess x) x)))

; New If
;(define (sqrt-iter guess x)
;  (new-if (good-enough? guess x)
;          guess
;          (sqrt-iter (improve guess x) x)))

; In the new-if procedure, Applicative-Order substitution will need to
; evaluate the call to sqrt-iter since it is an argument, 
; regardless if it is truly needed or not.
; As a result, there will be a non-terminated procedure call to sqrt-iter

;; Exercise 1.7


