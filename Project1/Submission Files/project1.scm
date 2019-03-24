;;; ozgurozcan15@ku.edu.tr     Wed Oct 19 12:48:37 2016
;;;    	 		     
;;; Comp200 Project 1    	 		     
;;;    	 		     
;;; Before you start:    	 		     
;;;    	 		     
;;; * Please read the detailed instructions for this project from the
;;; file project1.pdf available on the course website.
;;;    	 		     
;;; * Please read "Project Submission Instructions" carefully and make
;;; sure you understand everything before you start working on your
;;; project in order to avoid problems.
;;;    	 		     
;;; While you are working:    	 		     
;;; * Type all your work and notes in the appropriate sections of this file.
;;; * Please do not delete any of the existing lines.
;;; * Use the procedure names given in the instructions.
;;; * Remember to frequently save your file.
;;; * Use semicolon (;) to comment out text, tests and unused code.
;;; * Remember to document your code.
;;; * Remember our collaboration policy: you can discuss with your friends but:
;;;    	 		     
;;;   *** NOTHING WRITTEN GETS EXCHANGED ***
;;;    	 		     
;;; When you are done:    	 		     
    	 		     
;;; * Perform a final save and submit your work following the instructions.
;;; * Please do not make any modifications after midnight on the due date.
;;; * Please send an email comp200@ku.edu.tr if you have any questions.
;;; * Make sure your file loads without errors:
;;;    	 		     
;;; *** IF LOADING GIVES ERRORS YOUR PROJECT WILL NOT BE GRADED ***
;;;    	 		     
;;; Before the definition of each procedure, please write a description
;;; about what the procedure does and what its input and output should
;;; be, making sure the lines are commented out with semi-colons.
    	 		     
;;; These two lines are necessary, please do not delete:
#lang sicp    	 		     
(#%require (only racket/base random))
(define your-answer-here -1)    	 		     
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;:;:;::;;;:;::;;::
;;; Problem 1: Modular Arithmetic
    	 		     
;; (modulo 13 8) ; ->  ?    	 		     
;; (remainder 13 8) ; ->  ?    	 		     
;; (modulo -13 8) ; ->  ?    	 		     
;; (remainder -13 8) ; ->  ?    	 		     
;; (modulo -13 -8) ; ->  ?    	 		     
;; (remainder -13 -8) ; ->  ?    	 		     
    	 		     
;;; What is the difference between remainder and modulo? Which one is
;;; the best choice for implementng modular arithmetic as described in
;;; project pdf?  Include your test results and your answers to these
;;; questions in a comment in your solution.

; For positive numbers, there is no difference between remainder and modulo.
; However for negative numbers, remainder gives a negative number which is
; the remaining value after division, modulo gives a positive number.
    	 		     
;;; Description for +mod
; +mod takes two values, add them up and takes the modulo of this sum
    	 		     
(define +mod    	 		     
  (lambda (a b n)    	 		     
    (modulo (+ a b) n)
))

;(+mod 7 5 8) ; -> 4		     
;(+mod 10 10 3) ; -> 2
;(+mod 99 99 100) ; -> 98
    	 		     
;;; Description for -mod    	 		     
; -mod takes two values, subtracks the second value from the first one
; and takes the modulo of this subtraction

(define -mod    	 		     
  (lambda (a b n)    	 		     
    (modulo (- a b) n)    	 		     
))

;(-mod 5 12 2) ; -> 1
    	 		     
;;; Description for *mod
; *mod takes two values, multiply them and takes the modulo of this product
    	 		     
(define *mod    	 		     
  (lambda (a b n)    	 		     
    (modulo (* a b) n)    	 		     
))

;(*mod 50 -3 100) ; -> 50
;(*mod 6 6 9) ; -> 0
    	 		     
; After the definition of each procedure, please cut and paste some
; test cases you have run, making sure the lines are commented out
; with semi-colons:    	 		     
    	 		     
; Test cases    	 		     
    	 		     
   	 		      	 		        	 		   	 		     	 		     
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;:;:;::;;;:;::;:;;
;;; Problem 2: Raising a Number to a Power
    	 		     
;; What is the order of growth in time of slow-exptmod?
;Linear    	 		     
    	 		     
;; What is its order of growth in space?
;Linear    	 		     
    	 		     
;; Does slow-exptmod use an iterative algorithm or a recursive algorithm?
;Recursive    	 		     
    	 		     
;;; Description for exptmod    	 		     
; exptmod is a recursive procedure which takes 3 numbers as arguments and
; takes first argument to the power of second argument, then takes modulo
; according to third argument

(define exptmod    	 		     
  (lambda (a b n)
    (cond ((= b 0) 1)
          ((even? b) (*mod 1 (exptmod (* a a) (/ b 2) n) n))
          (else (*mod a (exptmod a (- b 1) n) n)))))
    	 		     
; Test cases:    	 		     
    	 		     
;; (exptmod 2 0 10) ; -> 1    	 		     
;; (exptmod 2 3 10) ; -> 8    	 		     
;; (exptmod 3 4 10) ; -> 1    	 		     
;; (exptmod 2 15 100) ; -> 68    	 		     
;; (exptmod -5 3 100) ; -> 75    	 		     
    	 		     
;; What is the order of growth in time of exptmod?
; If b=2^x, it is logarithmic    	 		     
    	 		     
;; What is its order of growth in space?
; Constant	 		     
    	 		     
;; Does exptmod use an iterative algorithm or a recursive algorithm?
; Recursive    	 		     
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;:;:;::;;;:;::;:;:
;;; Problem 3: Large Random Number
    	 		     
;;; Examples of random    	 		     
;; The results of random will be different for each run so you might not get the
;; below results.    	 		     
;; (random 10) ; ->1    	 		     
;; (random 10) ; ->6    	 		     
;; (random 10) ; ->6    	 		     
;; (random 10) ; ->0    	 		     
;; (random 10) ; ->7    	 		     
    	 		     
;;; Description for random-k-digit-number:
; this procedure takes a number as an argument and gives a random number with digit
; number of the given number
    	 		     
(define random-k-digit-number    	 		     
  (lambda (n)    	 		     
    (if (= n 1) (random 10)
        (+ (* (random 10) (expt 10 (- n 1))) (random-k-digit-number (- n 1))))))
    	 		     
; Test cases:    	 		     
    	 		     
;; (random-k-digit-number 1) ; ->  ?  (1 digit)
;; (random-k-digit-number 3) ; ->  ?  (1-3 digits)
;; (random-k-digit-number 3) ; ->  ?  (is it different?)
;; (random-k-digit-number 50) ; ->  ?  (1-50 digits)
    	 		     
;;; Description for count-digits
; count-digits takes a number n as an argument and gives the count of its digits.
    	 		     
(define count-digits    	 		     
  (lambda (n)    	 		     
    (if (< n 10) 1
        (inc (count-digits (/ n 10))))))

; Test cases:    	 		     
    	 		     
;; (count-digits 3) ; -> 1    	 		     
;; (count-digits 2007) ; -> 4    	 		     
;; (count-digits 123456789) ; -> 9
    	 		     
;;; Description for big-random
; big-random takes a number n as an argument and gives a random number which is in [0, n-1]
; this procedure uses the help of count-digits and random-k-digit-number procedures
    	 		     
(define big-random    	 		     
  (lambda (n)    	 		     
    (let ((num (random-k-digit-number (count-digits n))))
    (if (< num n) num
        (big-random n)))))

; (big-random 100) -> 8
; (big-random 100) -> 90
; (big-random 1) ->0
; (big-random 1) -> 0
; (big-random (expt 10 40)) -> 676647656760924406758784194339045232438

; Test cases:    	 		     
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;:;:;::;;;:;::;::;
;;; Problem 4: Prime Numbers    	 		     
    	 		     
;;; What is the order of growth in time of slow-prime? ?
; Linear    	 		     
    	 		     
;;; What is its order of growth in space?
; Constant    	 		     
    	 		     
;;; Does slow-prime? use an iterative algorithm or a recursive algorithm?
; Itself is not recursive but it uses a recursive procedure in it.    	 		     
    	 		     
;;; We only have to check factors less than or equal to (sqrt n). How would this
;;; affect the order of growth in time?
; It would become logarithmic    	 		     
    	 		     
;;; We only have to check odd factors (and 2, as a special case). How would this
;;; affect the order of growth in time?
; It would not change    	 		     
    	 		     
;;; Test Fermat's Little Theorem

; (let ((rand (big-random 71)))
;          (if (= (exptmod rand 71 71) rand)
;              #t
;              #f))

;(let ((rand2 (big-random 30)))
;          (if (= (exptmod rand2 30 30) rand2)
;              #t
;              #f))
    	 		     
;;; Description for prime?    	 		     
; prime? takes a number n as an argument and control if n is prime by using Fermat's
; Theorem for 20 different numbers.

(define prime-test-iterations 20)
    	 		     
(define prime?    	 		     
  (lambda (p)
    (define (helper counter)
      (if (= counter prime-test-iterations) #t
          (let ((rand (big-random p)))
            (if (= (exptmod rand p p) rand)
                (helper (inc counter))
                #f))))
    (cond
      ((= p 0) #f)
      ((= p 1) #f)
      (else (helper 0)))))

; (prime? 200) ;-> #f
; (prime? 199) ;-> #t

; Test cases:    	 		     
;; (prime? 2) ; -> #t    	 		     
;; (prime? 4) ; -> #f    	 		     
;; (prime? 1) ; -> #f    	 		     
;; (prime? 0) ; -> #f    	 		       	 		     
    	 		     
;;; What is the order of growth in time of your implementation of prime?
; Linear    	 		     
    	 		     
;;; What is its order of growth in space? (take exptmod into account)
; Constant    	 		     
    	 		     
;;; Does prime? use an iterative algoritm or a recursive algorithm?
; Iterative    	 		     
    	 		     
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;:;:;::;;;:;::;:::
;;; Problem 5: Random Primes    	 		     
    	 		     
;;; Description for random-prime:
; random-prime takes a number n as an argument and finds a prime number in [0, n-1]
; by using prime? procedure in it.
    	 		     
(define random-prime    	 		     
  (lambda (n)
    (let ((randp (big-random n)))
      (if (prime? randp) randp (random-prime n)))))

; Answer to the question: random-prime procedure contains prime? procedure in it which checks
; if the given number is prime by using Fermat's Little Theorem for 20 random numbers. Since
; the inverse of this theorem does not hold always, it may give a wrong result although it is
; tried for 20 different numbers.
    	 		     
; Test cases:    	 		     
; (random-prime 3) ; -> 2    	 		     
; (random-prime 3) ; -> 2 (must be always 2)
; (random-prime 100) ; ->  29    	 		     
; (random-prime 100) ; ->  43    	 		     
; (random-prime 100000) ; ->  15263
    	 		     
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;:;:;::;;;:;:::;;;
;;; Problem 6: Multiplicative Inverses
    	 		     
;;; Description of ax+by=1
; ax+by=1 takes two numbers a and b as arguments, solves the equation ax+by=1 and
; returns the result in the form of list (x y).
    	 		     
(define ax+by=1    	 		     
  (lambda (a b)
    (if (= b 0) (cons 1 0)
        (let ((q (quotient a b))
          (r (remainder a b))) 
          (cons (cdr (ax+by=1 b r)) (+ (car (ax+by=1 b r)) (* (- q) (cdr (ax+by=1 b r)))))))))
    	 		     
; Test cases    	 		     
; (ax+by=1 17 13) ; -> (-3 4) 17*-3 + 13*4 = 1
; (ax+by=1 7 3) ; -> (1 -2) 7*1 + 3*-2 =1
; (ax+by=1 10 27) ; -> (-8 3) 10*-8 + 3*27 =1
    	 		     
;;; Description of inverse-mod
; inverse-mod takes two numbers e and n as arguments and finds the inverse of e in modulo n,
; if gcd(e, n) is not equal to 1 it displays an error message.
    	 		     
(define inverse-mod    	 		     
  (lambda (e n)    	 		     
    (if (= (gcd e n) 1)
        (if (> 0(car (ax+by=1 e n)))
            (+ (car (ax+by=1 e n)) n)
            (car (ax+by=1 e n)))
        (display "error no inverse exists\n"))))    	 		     

; Test cases:    	 		     
; (inverse-mod 5 11) ; ->9 5*9 = 45 = 1 (mod 11)
; (inverse-mod 9 11) ; -> 5    	 		     
; (inverse-mod 7 11) ; -> 8 7*8 = 56 = 1 (mod 11)
; (inverse-mod 8 12) ; -> error no inverse exists
; (inverse-mod (random-prime 101) 101) ;-> (test your answer with *mod)  ?
    	 		     
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;:;:;::;;;:;:::;;:
;;; Problem 7: RSA    	 		     
    	 		     
;;; Description of random-keypair
; random-keypair takes an integer m as an argument and return a random pair of
; public-private keys for the integer m to be encrypted or decrypted

(define (make-key exp mod)    	 		     
  (list exp mod)
  )    	 		     
    	 		     
(define (get-exponent key)    	 		     
  (car (key))
  )    	 		     
(define (get-modulus key)    	 		     
  (cadr (key))
  )    	 		     
    	 		     
(define random-keypair    	 		     
  (lambda (m)    	 		     
    (let ((p (random-prime m))
          (q (random-prime m)))
      (define (helper)
        (let ((e (big-random (* p q))))
          (if (= (gcd e (* (- p 1) (- q 1))) 1) (list e (inverse-mod e (* (- p 1) (- q 1)))) helper))) (helper) )))   	 		     
    	 		     
;;; Description of rsa
; rsa takes a key and a message as arguments and returns encrypted/decrypted message
; according to the given key.

(define rsa    	 		     
  (lambda (key message)    	 		     
    (exptmod message (get-exponent key) (get-modulus key))))    	 		     


; Test cases:    	 		     	 		     
    	 		     
;;; What happend when you try to encrypt and decrypt a message integer
;;;which is too large for the key - i.e., larger than the modulus n?
; encryption and decryption would not work properly in this case  	 		     
    	 		     
;;; Description of encrypt:    	 		     
; encrypt takes a key and string as arguments, turn the string into integer
; and encrypt it for the given key.
(define encrypt    	 		     
  (lambda (public-key string)    	 		     
    (rsa public-key (string->integer string))
))    	 		     
    	 		     
;;; Description of decrypt:
; decrypt takes a key and an integer as arguments, decrypts the integer for
; the given key and turn the result value into string.

(define decrypt    	 		     
  (lambda (private-key encrypted-message)
    (integer->string (rsa private-key encrypted-message))
))    	 		     
    	 		     
;; Test cases:    	 		     
;; (define key (random-keypair 10000000000000000000000000))
;; (define e1 (encrypt (car key) "hello Comp200!"))
;; (decrypt (cadr key) e1) ; -> "hello Comp200!"
    	 		     
;; (define e2 (encrypt (car key) ""))
;; (decrypt (cadr key) e2) ; -> ""
    	 		     
;; (define e3 (encrypt (car key) "This is fun!"))
;; (decrypt (cadr key) e3) ; -> "This is fun!"
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;:;:;::;;:;;::;;;;
;; Helper functions: you do not need to edit the functions given below.
    	 		     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;    	 		     
;; Problem 2: Raising a Number to a Power
;;    	 		     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    	 		     
(define slow-exptmod    	 		     
  (lambda (a b n)    	 		     
    (if (= b 0)    	 		     
	1    	 		     
	(*mod a (slow-exptmod a (- b 1) n) n))))
    	 		     
    	 		     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;    	 		     
;; Problem 4: Prime Numbers    	 		     
;;    	 		     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    	 		     
(define test-factors    	 		     
  (lambda (n k)    	 		     
    (cond ((>= k n) #t)    	 		     
	  ((= (remainder n k) 0) #f)
	  (else (test-factors n (+ k 1))))))
    	 		     
(define slow-prime?    	 		     
  (lambda (n)    	 		     
    (if (< n 2)    	 		     
	#f    	 		     
	(test-factors n 2))))    	 		     
    	 		     
    	 		     
    	 		     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;    	 		     
;; Problem 7: RSA    	 		     
;;    	 		     
;; Converting message strings to and from
;; integers.    	 		     
;;    	 		     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    	 		     
    	 		     
(define (join-numbers list radix)
  ; Takes a list of numbers (i_0 i_1 i_2 ... i_k)
  ; and returns the number    	 		     
  ;    n = i_0 + i_1*radix + i_2*radix2 + ... i_k*radix^k + radix^(k+1)
  ; The last term creates a leading 1, which allows us to distinguish
  ; between lists with trailing zeros.
  (if (null? list)    	 		     
      1    	 		     
      (+ (car list) (* radix (join-numbers (cdr list) radix)))))
    	 		     
; test cases    	 		     
;(join-numbers '(3 20 39 48) 100) ;-> 148392003
;(join-numbers '(5 2 3 5 1 9) 10) ;-> 1915325
;(join-numbers '() 10) ;-> 1    	 		     
    	 		     
    	 		     
(define (split-number n radix)    	 		     
  ; Inverse of join-numbers.  Takes a number n generated by
  ; join-numbers and converts it to a list (i_0 i_1 i_2 ... i_k) such
  ; that    	 		     
  ;    n = i_0 + i_1*radix + i_2*radix2 + ... i_k*radix^k + radix^(k+1)
  (if (<= n 1)    	 		     
      '()    	 		     
      (cons (remainder n radix)
	    (split-number (quotient n radix) radix))))
    	 		     
; test cases    	 		     
;(split-number (join-numbers '(3 20 39 48) 100) 100) ;-> (3 20 39 48)
;(split-number (join-numbers '(5 2 3 5 1 9) 10) 10)  ;-> (5 2 3 5 1 9)
;(split-number (join-numbers '() 10) 10) ; -> ()
    	 		     
    	 		     
(define chars->bytes    	 		     
  ; Takes a list of 16-bit Unicode characters (or 8-bit ASCII
  ; characters) and returns a list of bytes (numbers in the range
  ; [0,255]).  Characters whose code value is greater than 255 are
  ; encoded as a three-byte sequence, 255 <low byte> <high byte>.
  (lambda (chars)    	 		     
    (if (null? chars)    	 		     
	'()    	 		     
	(let ((c (char->integer (car chars))))
	  (if (< c 255)    	 		     
	      (cons c (chars->bytes (cdr chars)))
	      (let ((lowbyte (remainder c 256))
		    (highbyte  (quotient c 256)))
		(cons 255 (cons lowbyte (cons highbyte (chars->bytes (cdr chars)))))))))))
    	 		     
; test cases    	 		     
;(chars->bytes (string->list "hello")) ; -> (104 101 108 108 111)
;(chars->bytes (string->list "\u0000\u0000\u0000")) ; -> (0 0 0)
;(chars->bytes (string->list "\u3293\u5953\uabab")) ; -> (255 147 50 255 83 89 255 171 171)
    	 		     
    	 		     
(define bytes->chars    	 		     
  ; Inverse of chars->bytes.  Takes a list of integers that encodes a
  ; sequence of characters, and returns the corresponding list of
  ; characters.  Integers less than 255 are converted directly to the
  ; corresponding ASCII character, and sequences of 255 <low-byte>
  ; <high-byte> are converted to a 16-bit Unicode character.
  (lambda (bytes)    	 		     
    (if (null? bytes)    	 		     
	'()    	 		     
	(let ((b (car bytes)))    	 		     
	  (if (< b 255)    	 		     
	      (cons (integer->char b)
		    (bytes->chars (cdr bytes)))
	      (let ((lowbyte (cadr bytes))
		    (highbyte (caddr bytes)))
		(cons (integer->char (+ lowbyte (* highbyte 256)))
		      (bytes->chars (cdddr bytes)))))))))
    	 		     
; test cases    	 		     
;(bytes->chars '(104 101 108 108 111)) ; -> (#\h #\e #\l #\l #\o)
;(bytes->chars '(255 147 50 255 83 89 255 171 171)) ; -> (#\u3293 #\u5953 #\uabab)
    	 		     
    	 		     
    	 		     
(define (string->integer string)
  ; returns an integer representation of an arbitrary string.
  (join-numbers (chars->bytes (string->list string)) 256))
    	 		     
; test cases    	 		     
;(string->integer "hello, world")
;(string->integer "")    	 		     
;(string->integer "April is the cruelest month")
;(string->integer "\u0000\u0000\u0000")
    	 		     
    	 		     
(define (integer->string integer)
  ; inverse of string->integer.  Returns the string corresponding to
  ; an integer produced by string->integer.
  (list->string (bytes->chars (split-number integer 256))))
    	 		     
; test cases    	 		     
;(integer->string (string->integer "hello, world"))
;(integer->string (string->integer ""))
;(integer->string (string->integer "April is the cruelest month"))
;(integer->string (string->integer "\u0000\u0000\u0000"))
;(integer->string (string->integer "\u3293\u5953\uabab"))
