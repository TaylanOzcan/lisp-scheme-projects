;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;::;:;:;::;:::
;;;   The Object-Oriented Adventure Game
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;::;:;:;:::;;;
;;;    	 		     
;;; ozgurozcan15@ku.edu.tr     Mon Dec  5 17:13:31 2016
;;;    	 		     
;;; Before you start:    	 		     
;;; * Please read the project handout available on the course
;;;   web site first to get a basic idea about the project and the
;;;   logic behind it, then to find out the details about what
;;;   your tasks are for the rest of the project.
;;;    	 		     
;;; * The following code should be studied and loaded for this
;;;   project.  Please do not modify these files, put all your work in
;;;   this file.    	 		     
;;;    	 		     
;;; - objsys.scm: support for an elementary object system
;;; - objtypes.scm: a few nice object classes
;;; - setup.scm: a bizarre world constructed using these classes
;;;    	 		     
;;; * Plan your work with pencil and paper before starting to code.
;;;    	 		     
;;; While you are working:    	 		     
;;; * Type all your work and notes in the appropriate sections of this file.
;;; * Please do not delete any of the existing lines.
;;; * Use the procedure names given in the instructions.
;;; * Remember to frequently save your file.
;;; * Use semicolon (;) to comment out text, tests and unused code.
;;; * Remember to document your code (in this file)
;;; * Remember our collaboration policy: you can discuss with your friends but:
;;;    	 		     
;;;   *** NOTHING WRITTEN GETS EXCHANGED ***
;;;    	 		     
;;;    	 		     
;;; When you are done:    	 		     
;;; * Perform a final save and submit your work following the instructions.
;;; * Please do not make any modifications after midnight on the due date.
;;; * Please send an email comp200-common@ku.edu.tr if you have any questions.
;;; * Make sure your file loads without errors:
;;; ****************************************************************************
;;; ***  Your code should run without any syntactic errors. Projects  causing error will NOT be graded. ***
;;; ****************************************************************************
;;;    	 		     
;; Do NOT modify or delete the lines below.
(#%require (only racket/base random))
(load "objsys.scm")    	 		     
(load "objtypes.scm")    	 		     
(load "setup.scm")    	 		     
(define nil '())    	 		     
(define your-answer-here #f)    	 		     
;;;;;;;;;    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;::;:;:;:::;;:
;;; PART II. Programming Assignment
;;;    	 		     
;;; The answers to the computer exercises in Section 5 go in the
;;; appropriate sections below.
;;;    	 		     
    	 		     
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;::;::;;::;;;;
;;;;;;;;;;;;; Computer Exercise 0: Setting up ;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;    	 		     
;;;;;;;;;;;;; CODES: ;;;;;;;;;;;;;
;;    	 		     
    	 		     
(ask screen 'deity-mode #f) 


;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;::;::;;::;;;:
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;    	 		     

#|

> (setup 'taylan)
ready
> (ask screen 'deity-mode #t)
> (run-clock 1)

At suzy-cafe suzy says -- Prepare to suffer, comp200-student ! 
At suzy-cafe comp200-student says -- Ouch! 2 hits is more than I want! 
lambda-man moves from sos-building to cas-building 
comp200-student moves from suzy-cafe to student-center 
prof-yuret moves from divan to cici-bufe 
At cici-bufe prof-yuret says -- Hi cici 
alyssa-p-hacker moves from deans-office to eng-z21 
At eng-z21 alyssa-p-hacker says -- I take problem-set from eng-z21 
ben-bitdiddle moves from computer-club to cici-bufe 
At cici-bufe ben-bitdiddle says -- Hi prof-yuret cici 
At cici-bufe ben-bitdiddle says -- I take kofte from cici-bufe 
--- the-clock Tick 0 --- done
> (ask screen 'deity-mode #f)
> (run-clock 1)

--- the-clock Tick 1 --- done
> (ask (ask me 'location) 'name)
library
> (ask me 'name)
taylan
> (ask me 'say '(hello world))

At library taylan says -- hello world said-and-heard
> (ask me 'go 'west)

taylan moves from library to gym 
An earth-shattering, soul-piercing scream is heard... 
--- the-clock Tick 2 --- 
You are in gym 
You are not holding anything. 
You see stuff in the room: basketball 
There are no other people around you. 
The exits are in directions: east #t
> (ask me 'take (thing-named 'basketball))

At gym taylan says -- I take basketball from gym 
> (ask me 'toss 'basketball)

At gym taylan says -- I drop basketball at gym 
> (ask me 'die)

At gym taylan says -- SHREEEEK!  I, uh, suddenly feel very faint... 
An earth-shattering, soul-piercing scream is heard... 
taylan moves from gym to heaven 
At heaven taylan says -- Hi prof-yuret game-over-for-you-dude

|#
    	 		     
;;    	 		     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;::;::;;::;;:;
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;::;::;;::;;::
;;;;;; Computer Exercise 1: Understanding installation;;;;;
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;::;::;;::;:;;
;;    	 		     
;;;;;;;;;;;;; ANSWER: ;;;;;;;;;;;;;
;;    	 		     
    	 		     
; Autonomous-person class inherits from person class. The implementation
; of autonomous-person constructor starts with a let procedure defining a
; person-part which is an object of person class. This person object can be
; thought as the core identity of autonomous-person object.
; With the delegate procedure, we pass the the value of autonomous-person
; object to do the relevant procedure in the person class, which is correct
; because we want to do the operations on autonomous-person object, not on
; its inherited object.
; If the code was changed as stated in the question, than we could not do the
; operations on autonomous-person object as we did not pass its value. In that
; case, operations would be done on the person-part object only, which is not
; a correct way.
    	 		     
;;    	 		     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;::;::;;::;:;:
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;::;::;;::;::;
;;;;;;;;;;;; Computer Exercise 2: Who just died? ;;;;;;;;;;
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;::;::;;::;:::
;;    	 		     
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;;    	 		     
    	 		     
(define (who-just-died?)
  (ask (car (ask heaven 'things)) 'name))
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;::;::;;:::;;;
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;;    	 		     
    	 		     
; Every person goes to the place heaven after death. Heaven as a place object
; has both named-object part and container part. The container part of the
; heaven object keeps the list of people in it. If we ask this list from
; heaven and take the car of the list, we can get the person instance
; who died last. Than we can ask its name to find out who it is.
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;::;::;;:::;;:
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;    	 		     
    	 		     
#|

> (setup 'taylan)
ready
> (ask (ask me 'location) 'name)
suzy-cafe
> (ask me 'go 'down)

taylan moves from suzy-cafe to cici-bufe 
At cici-bufe taylan says -- Hi cici 
At cici-bufe cici says -- Prepare to suffer, taylan ! 
At cici-bufe taylan says -- Ouch! 1 hits is more than I want! 
At cici-bufe lambda-man says -- Hi taylan cici 
At cici-bufe lambda-man says -- I take kofte from cici-bufe 
At cici-bufe prof-yuret says -- Hi lambda-man taylan cici 
At cici-bufe prof-yuret says -- I take kofte from lambda-man 
At cici-bufe lambda-man says -- I lose kofte 
At cici-bufe lambda-man says -- Yaaaah! I am upset! 
--- the-clock Tick 0 --- 
You are in cici-bufe 
You are not holding anything. 
There is no stuff in the room. 
You see other people: prof-yuret lambda-man cici 
The exits are in directions: down north west up #t
> (ask me 'take (thing-named 'kofte))

At cici-bufe taylan says -- I take kofte from prof-yuret 
At cici-bufe prof-yuret says -- I lose kofte 
At cici-bufe prof-yuret says -- Yaaaah! I am upset! 
> (ask me 'go 'west)

taylan moves from cici-bufe to computer-club 
At computer-club cici says -- Hi taylan 
At computer-club cici says -- Prepare to suffer, taylan ! 
At computer-club taylan says -- Ouch! 3 hits is more than I want! 
At computer-club taylan says -- SHREEEEK!  I, uh, suddenly feel very faint... 
At computer-club taylan says -- I lose kofte 
At computer-club taylan says -- Yaaaah! I am upset! 
An earth-shattering, soul-piercing scream is heard... 
taylan moves from computer-club to heaven 
--- the-clock Tick 1 --- 
You are in heaven 
You are not holding anything. 
There is no stuff in the room. 
There are no other people around you. 
There are no exits... you are dead and gone to heaven! #t
> (who-just-died?)
taylan

|#
    	 		     
;;    	 		     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;::;:::;::;;;;
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;::;:::;::;;;:
;;;;;;;; Computer exercise 3: Having a quick look ;;;;;;;;;
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;::;:::;::;;:;
;;    	 		     
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;;    	 		     
    	 		     
; the change is already done in objtypes file    	 		     
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;::;:::;::;;::
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;;    	 		     
    	 		     
; We call the method 'look-around' after clock tick in the 'go' method.
; So the avatar looks around after each time it succesfully moves from
; one place to another.
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;::;:::;::;:;;
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;    	 		     
    	 		     
#|

> (setup 'taylan)
ready
> (ask (ask me 'location) 'name)
bookstore
> (ask me 'go 'west)

taylan moves from bookstore to suzy-cafe 
At suzy-cafe taylan says -- Hi suzy 
At suzy-cafe suzy says -- Prepare to suffer, taylan ! 
At suzy-cafe taylan says -- Ouch! 1 hits is more than I want! 
--- the-clock Tick 0 --- 
You are in suzy-cafe 
You are not holding anything. 
You see stuff in the room: coke 
You see other people: suzy 
The exits are in directions: down east out #t

|#
    	 		     
;;    	 		     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;::;:::;::;:;:
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;::;:::;::;::;
;;;;;; Computer exercise 4: But I'm too young to die!! ;;;;
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;::;:::;::;:::
;;    	 		     
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;;    	 		     
    	 		     
(define (make-person name birthplace) ; symbol, location -> person
  (let ((mobile-thing-part (make-mobile-thing name birthplace))
	(container-part    (make-container))
	(health            3)    	 		     
	(strength          1)    	 		     
   (lives             3))    	 		     
    (lambda (message)    	 		     
      (case message    	 		     
	((PERSON?) (lambda (self) #T))
	((STRENGTH) (lambda (self) strength))
	((HEALTH) (lambda (self) health))
        ((SAY)    	 		     
         (lambda (self list-of-stuff)
           (ask screen 'TELL-ROOM (ask self 'location)
                (append (list "At" (ask (ask self 'LOCATION) 'NAME)
                                 (ask self 'NAME) "says --")
                           list-of-stuff))
                  'SAID-AND-HEARD))
	((HAVE-FIT)    	 		     
	 (lambda (self)    	 		     
	   (ask self 'SAY '("Yaaaah! I am upset!"))
	   'I-feel-better-now))
    	 		     
	((PEOPLE-AROUND)	; other people in room...
	 (lambda (self)    	 		     
	   (let* ((in-room (ask (ask self 'LOCATION) 'THINGS))
		  (people (myfilter (lambda (x) (is-a x 'PERSON?)) in-room)))
	     (delq self people))))
    	 		     
	((STUFF-AROUND)		; stuff (non people) in room...
	 (lambda (self)    	 		     
	   (let* ((in-room (ask (ask self 'LOCATION) 'THINGS))
		  (stuff (myfilter (lambda (x) (not (is-a x 'PERSON?))) in-room)))
	     stuff)))    	 		     
    	 		     
	((PEEK-AROUND)		; other people's stuff...
	 (lambda (self)    	 		     
	   (let ((people (ask self 'PEOPLE-AROUND)))
	     (accumulate append '() (map (lambda (p) (ask p 'THINGS)) people)))))
    	 		     
	((TAKE)    	 		     
	 (lambda (self thing)    	 		     
	   (cond ((ask self 'HAVE-THING? thing)  ; already have it
		  (ask self 'SAY (list "I am already carrying"
				       (ask thing 'NAME)))
		  #f)    	 		     
		 ((or (is-a thing 'PERSON?)
		      (not (is-a thing 'MOBILE-THING?)))
		  (ask self 'SAY (list "I try but cannot take"
				       (ask thing 'NAME)))
		  #F)    	 		     
		 (else    	 		     
		  (let ((owner (ask thing 'LOCATION)))
		    (ask self 'SAY (list "I take" (ask thing 'NAME)
					 "from" (ask owner 'NAME)))
		    (if (is-a owner 'PERSON?)
			(ask owner 'LOSE thing self)
			(ask thing 'CHANGE-LOCATION self))
		    thing)))))    	 		     
    	 		     
	((LOSE)    	 		     
	 (lambda (self thing lose-to)
	   (ask self 'SAY (list "I lose" (ask thing 'NAME)))
	   (ask self 'HAVE-FIT)
	   (ask thing 'CHANGE-LOCATION lose-to)))
    	 		     
	((DROP)    	 		     
	 (lambda (self thing)    	 		     
	   (ask self 'SAY (list "I drop" (ask thing 'NAME)
				"at" (ask (ask self 'LOCATION) 'NAME)))
	   (ask thing 'CHANGE-LOCATION (ask self 'LOCATION))))
    	 		     
        ((GO-EXIT)    	 		     
         (lambda (self exit)    	 		     
           (ask exit 'USE self)))
    	 		     
	((GO)    	 		     
	 (lambda (self direction) ; person, symbol -> boolean
	   (let ((exit (ask (ask self 'LOCATION) 'EXIT-TOWARDS direction)))
	     (if (is-a exit 'EXIT?)
                 (ask self 'GO-EXIT exit)
		 (begin (ask screen 'TELL-ROOM (ask self 'LOCATION)
			     (list "No exit in" direction "direction"))
			#F)))))
	((SUFFER)    	 		     
	 (lambda (self hits)    	 		     
	   (ask self 'SAY (list "Ouch!" hits "hits is more than I want!"))
	   (set! health (- health hits))
	   (if (<= health 0) (ask self 'DIE))
	   health))    	 		     
    	 		     
	((DEATH-SCREAM)    	 		     
	 (lambda (self)    	 		     
	   (ask screen 'TELL-WORLD
		'("An earth-shattering, soul-piercing scream is heard..."))))
    	 		     
	((ENTER-ROOM)    	 		     
	 (lambda (self)    	 		     
	   (let ((others (ask self 'PEOPLE-AROUND)))
	     (if (not (null? others))
		 (ask self 'SAY (cons "Hi" (names-of others)))))
	   (ask (ask self 'location) 'make-noise self)
	   #T))    	 		     
    	 		     
	;; Here is the original DIE method
       	 #|		     
	 ((DIE)    	 		     
	  (lambda (self)    	 		     
	    (ask self 'SAY '("SHREEEEK!  I, uh, suddenly feel very faint..."))
	    (for-each (lambda (item) (ask self 'LOSE item (ask self 'LOCATION)))
	 	     (ask self 'THINGS))
	    (ask self 'DEATH-SCREAM)
	    (ask death-exit 'USE self)
	    'GAME-OVER-FOR-YOU-DUDE))
       	 |#		     
	;; Your version goes here:
    	 		     
        ((DIE)    	 		     
         (lambda (self)
           (set! lives (- lives 1))
           (ask self 'SAY (list "Omg! I lost 1 more life, now I have only" lives "left!"))
           (if (= lives 0)
               (begin (ask self 'SAY '("SHREEEEK!  I, uh, suddenly feel very faint..."))
                      (for-each (lambda (item) (ask self 'LOSE item (ask self 'LOCATION)))
                                (ask self 'THINGS))
                      (ask self 'DEATH-SCREAM)
                      (ask death-exit 'USE self)
                      'GAME-OVER-FOR-YOU-DUDE)
               (begin (for-each (lambda (item) (ask self 'LOSE item (ask self 'LOCATION)))
                                (ask self 'THINGS))
                      (ask self 'SAY (list "Oh, thanks to reincarnation! I have to be more careful this time."))
                      (ask self 'CHANGE-LOCATION (ask self 'CREATION-SITE)))
               )
           ))    	    	 		     
        
	(else (find-method message mobile-thing-part container-part))))))
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;::;:::;:::;;;
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;;    	 		     
    	 		     
; The new version of the DIE method decrements the number of lives that
; person has, and then checks if the person has more lives left. If person
; has are more than 0 lives, then it loses its possessions and reincarnates
; in its birthplace. If there are no lives left, it loses its possesions
; and goes to heaven like in the original version of DIE method.
    	 		     
    	 		     		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;::;:::;:::;;:
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;    	 		     

#|

> (setup 'taylan)
ready
> (ask (ask me 'location) 'name)
cici-bufe
> (ask me 'die)

At cici-bufe taylan says -- Omg! I lost 1 more life, now I have only 2 left! 
At cici-bufe taylan says -- Yeah, thanks to reincarnation! I have to be more careful this time. 
> (ask (ask me 'location) 'name)
cici-bufe
> (ask me 'go 'up)

taylan moves from cici-bufe to suzy-cafe 
At suzy-cafe taylan says -- Hi suzy 
suzy moves from suzy-cafe to bookstore 
--- the-clock Tick 0 --- 
You are in suzy-cafe 
You are not holding anything. 
You see stuff in the room: coke 
There are no other people around you. 
The exits are in directions: down east out #t
> (ask me 'take (thing-named 'coke))

At suzy-cafe taylan says -- I take coke from suzy-cafe 
> (ask me 'die)

At suzy-cafe taylan says -- Omg! I lost 1 more life, now I have only 1 left!
At suzy-cafe taylan says -- I lose coke 
At suzy-cafe taylan says -- Yaaaah! I am upset! 
At suzy-cafe taylan says -- Oh, thanks to reincarnation! I have to be more careful this time. 
> (ask (ask me 'location) 'name)
cici-bufe
> (ask me 'die)

At cici-bufe taylan says -- Omg! I lost 1 more life, now I have only 0 left! 
At cici-bufe taylan says -- SHREEEEK!  I, uh, suddenly feel very faint... 
An earth-shattering, soul-piercing scream is heard... 
taylan moves from cici-bufe to heaven game-over-for-you-dude

|#
    	 		     
;;    	 		     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;:::;;;;::;;;;
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;:::;;;;::;;;:
;;; Computer exercise 5: Perhaps to arm oneself against a sea of .... ;;;;
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;:::;;;;::;;:;
;;    	 		     
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;;    	 		     

(define (make-weapon name location damage) 
  (let ((mobile-thing-part (make-mobile-thing name location)))    	 		     
    (lambda (message)    	 		     
      (case message    	 		     
	((WEAPON?) (lambda (self) #T))
	((DAMAGE) (lambda (self) damage))
	((HIT) (lambda (self user target)
                 (ask user 'say (list (ask target 'name)
                                      ", you will suffer from my"
                                      (ask self 'name)))
                 (ask target 'suffer (random-number damage))
                 ))	 		     
    	 		     
	(else (find-method message mobile-thing-part))))))
    	 		     
(define (create-weapon name location damage)
  (create make-weapon name location damage))

    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;:::;;;;::;;::
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;;    	 		     
    	 		     
; A new type of object, weapon, inherits from mobile-thing. It has 3
; methods: 1)WEAPON? checks if it is a weapon, 2) DAMAGE gives the
; maximum damage value of the weapon, 3)HIT makes one person hit
; a target person with the weapon. The target suffers an amount of
; damage which is a random value between 1 and the max damage of the weapon.
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;:::;;;;::;:;;
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;    	 		     

#|

> (setup 'taylan)
ready
> (ask me 'look-around)

You are in parking-lot 
You are not holding anything. 
You see stuff in the room: inflatable-lambda fancy-cars 
You see other people: alyssa-p-hacker 
The exits are in directions: east ok
> (ask (thing-named 'inflatable-lambda) 'hit me (thing-named 'alyssa-p-hacker))

At parking-lot taylan says -- alyssa-p-hacker , you will suffer from my inflatable-lambda 
At parking-lot alyssa-p-hacker says -- Ouch! 3 hits is more than I want! 
At parking-lot alyssa-p-hacker says -- Omg! I lost 1 more life, now I have only 2 left! 
At parking-lot alyssa-p-hacker says -- Oh, thanks to reincarnation! I have to be more careful this time.

|#	 		     
    	 		     
;;    	 		     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;:::;;;;::;:;:
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;:::;;;;::;::;
;;;;;;;; Computer exercise 6: Good thing I'm armed and dangerous ;;;;;;;;;
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;:::;;;;::;:::
;;    	 		     
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;;    	 		     

(define (make-violent-person name birthplace activity miserly frequency) 
  (let ((autonomous-player-part (make-autonomous-player name birthplace activity miserly)))    	 		     
    (lambda (message)    	 		     
      (case message    	 		     

        ((INSTALL) (lambda (self)
		     (ask clock 'ADD-CALLBACK
			  (make-clock-callback 'act-violent self
					       'ACT-VIOLENT))
		     (delegate autonomous-player-part self 'INSTALL)))
        
	((ACT-VIOLENT) (lambda (self)
                         (if (= frequency (random-number frequency))
                             (let ((weapons (myfilter (lambda (t) (is-a t 'WEAPON?))
                                                      (ask self 'THINGS)))
                                   (targets (ask self 'PEOPLE-AROUND)))
                               (if (and (not (null? weapons))
                                        (not (null? targets)))
                                   (let ((randomweapon (pick-random weapons))
                                         (randomtarget (pick-random targets)))
                                     (ask randomweapon 'hit self randomtarget)))))))	 		     
    	 		     
	(else (find-method message autonomous-player-part))))))
    	 		     
(define (create-violent-person name birthplace activity miserly frequency)
  (create make-violent-person name birthplace activity miserly frequency))
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;:::;;;;:::;;;
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;;    	 		     
    	 		     
; A new type of object, violent-person, inherits from autonomous-player
; object. Violent-person has the ability to act violently against the
; people in the same place with it. The method ACT-VIOLENT first decides
; if an action will be made according to the give frequency parameter.
; If the decision is affirmative, it takes a random weapon that
; violent-person has and a random person in the same place, then it
; make the violent-object hit the random person with the random weapon.
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;:::;;;;:::;;:
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;    	 		     

#|

> (setup 'taylan)
ready
> (ask me 'look-around)

You are in library 
You are not holding anything. 
You see stuff in the room: spoon engineering-book 
There are no other people around you. 
The exits are in directions: west east ok

> (ask me 'go 'east)

taylan moves from library to great-court 
At great-court taylan says -- Hi comp200-student 
comp200-student moves from great-court to library 
--- the-clock Tick 1 --- 

> (run-clock 3)

--- the-clock Tick 2 --- 
At great-court comp200-student says -- Hi taylan 
At great-court comp200-student says -- I try but cannot take flag-pole 
At great-court comp200-student says -- taylan , you will suffer from my spoon 
At great-court taylan says -- Ouch! 1 hits is more than I want! 
--- the-clock Tick 3 --- 
comp200-student moves from great-court to student-center 
--- the-clock Tick 4 --- done

|#
    	 		     
    	 		     
;;    	 		     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;:::;;:;::;;;;
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;:::;;:;::;;;:
;;; Computer exercise 7: A good hacker could defuse this situation ;;;;;;;
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;:::;;:;::;;:;
;;    	 		     
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;;    	 		     


(define (make-bomb name location damage)
  (let ((mobile-thing-part (make-mobile-thing name location))
	(aware-thing-part (make-aware-thing))
        (armed? 0))  	 		     
    (lambda (message)    	 		     
      (case message    	 		     
	((BOMB?) (lambda (self) #T))
        ((DAMAGE) (lambda (self) damage))
	((ARM) (lambda (self) (set! armed? 1) 'armed))
	((DISARM) (lambda (self) (set! armed? 0) 'disarmed))
        ((TRIGGER) (lambda (self) (if (= armed? 1) (ask self 'ACTIVATE))))
        ((HEARD-NOISE) (lambda (self who) (ask self 'TRIGGER)))
        ((ACTIVATE) (lambda (self)
                      (let ((targets (myfilter (lambda (t) (is-a t 'PERSON?))
                                               (ask (ask self 'LOCATION) 'THINGS))))
                        (ask self 'EMIT (list "The bomb,"
                                              name
                                            ", has just exploded and gave damage to"
                                            (names-of targets)))
                        (for-each (lambda (person) (ask person 'SUFFER damage)) targets))
                      (ask self 'DESTROY)
                      ))
        
        (else (find-method message aware-thing-part mobile-thing-part))))))
    	 		     
(define (create-bomb name location damage)
  (create make-bomb name location damage))
	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;:::;;:;::;;::
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;;    	 		     
    	 		     
; bomb object inherits from mobile-thing and aware-thing objects. When the
; ARM method is called, it sets the armed? variable to 1. And after this,
; when TRIGGER method is called, it checks if armed? is equal 1. If it
; is, the ACTIVATE method is called. ACTIVATE method makes every person
; in the room SUFFER with a hit value which is given as a parameter
; in make-bomb procedure.
    	 		     	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;:::;;:;::;:;;
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;    	 		     

#|

> (setup 'taylan)
ready
> (ask me 'look-around)

You are in cas-building 
You are not holding anything. 
There is no stuff in the room. 
There are no other people around you. 
The exits are in directions: south north ok
> (ask me 'go 'north)

taylan moves from cas-building to sos-building 
At sos-building taylan says -- Hi ben-bitdiddle 
ben-bitdiddle moves from sos-building to amphitheater 
At sos-building ben-bitdiddle says -- Hi taylan 
--- the-clock Tick 0 --- 
You are in sos-building 
You are not holding anything. 
You see stuff in the room: c4 
You see other people: ben-bitdiddle 
The exits are in directions: east south north #t
> (ask (thing-named 'c4) 'arm)
armed
> (ask me 'enter-room)

At sos-building taylan says -- Hi ben-bitdiddle 
At sos-building The bomb, c4 , has just exploded and gave damage to (ben-bitdiddle taylan) 
At sos-building ben-bitdiddle says -- Ouch! 2 hits is more than I want! 
At sos-building taylan says -- Ouch! 2 hits is more than I want! #t

|#

;;    	 		     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;:::;;:;::;:;:
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;:::;;:;::;::;
;;;; Computer exercise 8: Well, maybe only if they have enough time ;;;;;;
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;:::;;:;::;:::
;;    	 		     
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;;    	 		     

(define (make-bomb-with-timer name location damage)
  (let ((mobile-thing-part (make-mobile-thing name location))
	(aware-thing-part (make-aware-thing))
        (armed? 0)
        (timer 3))  	 		     
    (lambda (message)    	 		     
      (case message    	 		     
	((BOMB-WITH-TIMER?) (lambda (self) #T))
        ((DAMAGE) (lambda (self) damage))
	((ARM) (lambda (self) (set! armed? 1) 'armed))
	((DISARM) (lambda (self) (set! armed? 0) 'disarmed))
        ((TRIGGER) (lambda (self) (if (= armed? 1)
                                      (ask clock 'ADD-CALLBACK
                                           (make-clock-callback 'timer self
                                                                'TIMER))
                                      )))
        ((HEARD-NOISE) (lambda (self who) (ask self 'TRIGGER)))
        ((ACTIVATE) (lambda (self)
                      (let ((targets (myfilter (lambda (t) (is-a t 'PERSON?))
                                               (ask (ask self 'LOCATION) 'THINGS))))
                        (ask self 'EMIT (list "The bomb,"
                                              name
                                            ", has just exploded and gave damage to"
                                            (names-of targets)))
                        (for-each (lambda (person) (ask person 'SUFFER damage)) targets))
                      (ask self 'DESTROY)
                      ))
        ((TIMER) (lambda (self) (begin (set! timer (- timer 1))
                                       (if (> timer 0)
                                           (ask self 'EMIT
                                                (list "The time left for the explosion of"
                                                      name
                                                      ":"
                                                      timer))
                                       (ask self 'ACTIVATE)))))
        
        (else (find-method message aware-thing-part mobile-thing-part))))))
    	 		     
(define (create-bomb-with-timer name location damage)
  (create make-bomb-with-timer name location damage))  
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;:::;;:;:::;;;
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;;    	 		     
    	 		     
; Bomb-with-timer object is similar to the bomb object. However, instead of
; exploding instantly after trigger, it adds a TIMER callback. timer is a
; variable defined in let prodecure at the beginning and at every time the
; method TIMER called, the value of timer decrements. If its value becomes
; 0, the bomb explodes.
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;;;:::;;:;:::;;:
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;    	 		     

#|

> (setup 'taylan)
ready
> (ask me 'look-around)

You are in parking-lot 
You are not holding anything. 
You see stuff in the room: fancy-cars 
There are no other people around you. 
The exits are in directions: east ok
> (ask me 'go 'east)

taylan moves from parking-lot to eng-building 
At eng-building taylan says -- Hi rector 
At eng-building guest says -- Hi taylan rector 
guest moves from eng-building to soccer-field 
rector moves from eng-building to soccer-field 
At eng-building rector says -- Hi taylan 
--- the-clock Tick 0 --- 
You are in eng-building 
You are not holding anything. 
You see stuff in the room: apple 
You see other people: rector 
The exits are in directions: south in west north #t
> (ask me 'go 'in)

taylan moves from eng-building to eng-z21 
--- the-clock Tick 1 --- 
You are in eng-z21 
You are not holding anything. 
You see stuff in the room: tbomb5 problem-set 
There are no other people around you. 
The exits are in directions: up down south out #t
> (ask (thing-named 'tbomb5) 'arm)
armed
> (ask me 'enter-room)
#t
> (run-clock 1)

At eng-z21 The time left for the explosion of tbomb5 : 2 
At eng-z21 guest says -- Hi taylan 
--- the-clock Tick 2 --- done
> (run-clock 1)

At eng-z21 The time left for the explosion of tbomb5 : 1 
guest moves from eng-z21 to eng-building 
--- the-clock Tick 3 --- done
> (run-clock 1)

At eng-z21 The bomb, tbomb5 , has just exploded and gave damage to (taylan) 
At eng-z21 taylan says -- Ouch! 8 hits is more than I want! 
At eng-z21 taylan says -- Omg! I lost 1 more life, now I have only 2 left! 
At eng-z21 taylan says -- Oh, thanks to reincarnation! I have to be more careful this time. 
--- the-clock Tick 4 --- done

|#    	 		     
    	 		     
;;    	 		     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;:;::;;;;;::;;;;
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;:;::;;;;;::;;;:
;;;;;;;;; Computer Exercise 9: Even you can change the world! ;;;;;;;;;;;;
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;:;::;;;;;::;;:;
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;:;::;;;;;::;;::
;;;;;;;;;;;;; DESCRIPTION: ;;;;;;;;;;;;;
;;

; spagetti-monster object inherits from thing and aware-thing. As soon as
; it heards a noise, it triggers all the bombs on the game.   	 		     
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;:;::;;;;;::;:;;
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;;    	 		     

(define (make-spagetti-monster name location)
  (let 	((aware-thing-part (make-aware-thing))
         (thing-part (make-thing name location)))  	 		     
    (lambda (message)    	 		     
      (case message    	 		     
        ((SPAGETTI-MONSTER?) (lambda (self) #T))
        ((TRIGGER-BOMBS) (lambda (self)
                           (for-each (lambda (room)
                                       (for-each (lambda (bomb) (ask bomb 'TRIGGER))
                                                 (myfilter (lambda (x) (is-a x 'BOMB?))
                                                           (ask room 'THINGS))))
                                     all-rooms)
                           ))
        ((HEARD-NOISE) (lambda (self who) (ask self 'TRIGGER-BOMBS)))
        
        
        (else (find-method message aware-thing-part thing-part))))))
    	 		     
(define (create-spagetti-monster name location)
  (create make-spagetti-monster name location))

    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;:;::;;;;;::;:;:
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;;    	 		     
    	 		     
; spagetti-monster object inherits from thing and aware-thing. As soon as
; it heards a noise, it triggers all the bombs on the game.
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;:;::;;;;;::;::;
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;    	 		     

#|

> (setup 'taylan)
ready
> (create-spagetti-monster 'sm heaven)
#<procedure:...ct4/project4.scm:959:4>
> (ask me 'die)

At deans-office taylan says -- Omg! I lost 1 more life, now I have only 2 left! 
At deans-office taylan says -- Oh, thanks to reincarnation! I have to be more careful this time. 
> (ask me 'die)

At deans-office taylan says -- Omg! I lost 1 more life, now I have only 1 left! 
At deans-office taylan says -- Oh, thanks to reincarnation! I have to be more careful this time. 
> (ask me 'die)

At deans-office taylan says -- Omg! I lost 1 more life, now I have only 0 left! 
At deans-office taylan says -- SHREEEEK!  I, uh, suddenly feel very faint... 
An earth-shattering, soul-piercing scream is heard... 
taylan moves from deans-office to heaven game-over-for-you-dude

|#
    	 		     
    	 		     
;;    	 		     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;:;::;;;;;::;:::
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;:;::;;;;;:::;;;
;# DO NOT FORGET TO SUBMIT YOUR WORK BEFORE THE DEADLINE!         #
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;:;::;;;;;:::;;:
;# GOOD LUCK!                                                     #
;;;;;;;::;::::::::;:;::;;::::::;:;::::;;:;::;::::::::;:;::;;;::::;;;;:::;:::;;::;;;:;::;:;:;::;;::;::;:;:;::;;;:;::;;;;
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
    	 		     
