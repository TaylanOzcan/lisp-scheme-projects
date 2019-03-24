;;; YOUR NAME: Özgür Taylan Özcan   	 		     
;;;    	 		     
;;; Comp200 Project 3    	 		     
;;;    	 		     
;;; Before you start:    	 		     
;;;    	 		     
;;; * Please read the detailed instructions for this project from the
;;; file project3.pdf available in the Assignments section of the
;;; course website.    	 		     
;;;    	 		     
;;; * Please read "Project Submission Instructions" carefully and make
;;; sure you understand everything before you start working on your
;;; project in order to avoid problems.
;;;    	 		     
;;; While you are working:    	 		     
;;; * Type all your work and notes in the appropriate sections of this file.
;;; * Please do not delete any of the existing lines.
;;; * Use the procedure names given in the instructions.
;;; * Remember to frequently save (C-x C-s in edwin) your file.
;;; * Use semicolon (;) to comment out text, tests and unused code.
;;; * Remember to document your code.
;;; * Remember our collaboration policy: you can discuss with your friends but:
;;;    	 		     
;;;   *** NOTHING WRITTEN GETS EXCHANGED ***
;;;    	 		     
;;; When you are done:    	 		     
    	 		     
;;; * Perform a final save and copy the file to the following location
;;;   DriveF@VOL\UGRADS\COMP200\HOMEWORK\username\project3.zip
;;;   where the username is your login name.
;;; * Please do not make any modifications after midnight on the due date.
;;; * Please send an email comp200@ku.edu.tr if you have any questions.
;;; * Make sure your file loads without errors:
;;;    	 		     
;;; *** IF (load "project3.scm"), ALT-O(MIT/GNU Scheme) or Run
;;; button(DrScheme0 GIVES ERRORS YOUR PROJECT WILL NOT BE GRADED ***
;;;    	 		     
;;; Before the definition of each procedure, please write a description
;;; about what the procedure does and what its input and output should
;;; be, making sure the lines are commented out with semi-colons.
(define your-answer-here -1)    	 		     
(load "databases.scm")    	 		     
    	 		     
;;; problem 1 ;;;    	 		     
    	 		     
;; your code should have the following general form

; the following code creates an empty table with 2 columns(name and major),
; then adds 5 new rows with the given name and major values
; by using table-insert! procedure.
(define example-table    	 		     
  (make-empty-table (list (make-column 'name 'symbol)
                          (make-column 'major 'number))))

(table-insert! '(ben 6) example-table)
(table-insert! '(jen 3) example-table)
(table-insert! '(amy 12) example-table)
(table-insert! '(kim 13) example-table)
(table-insert! '(alex 6) example-table) 
    	 		     
;; test cases
 (display "\nTesting Problem 1\n")
 (table-display example-table)
    	 		     
;;; problem 2 ;;;

; this procedure takes a list and a table as arguments and inserts all
; of the rows in the given list to the given table.
(define (table-insert-all! lst table)
  (for-each (lambda (x) (table-insert! x table)) lst)
  )

;; test cases    	 		     

 (display "\nTesting Problem 2\n")
 (define books (make-empty-table
 	       (list (make-column 'title 'symbol)
 		     (make-column 'author 'symbol)
 		     (make-column 'rating 'number))))
    	 		     
    	 		     
 (table-insert-all! '((sicp abelson-sussman 8)
 		     (return-of-the-king jrr-tolkien 9)
 		     (treatment-of-subordinates darth-vader 4)
 		     (project-grading tom 2)
 		     (all-things-stata frank-gehry 5)
 		     (biting-the-hand-that-feeds-me my-cat 1))
 		   books)    	 		     
 (table-display books)    	 		     
    	 		     
;;; problem 3 ;;;    	 		     
;; Hint: Writing (filter predicate lst) might be helpful

; this procedure takes a predicate procedure and a table as arguments
; and return a new table consists of the rows for which the prediciate
; procedure returns #t
(define (table-select selector table)
  (let ((newcolumns (get-table-columns table))
        (newdata (filter selector (get-table-data table))))
    (make-table newcolumns newdata)
    ))    	 		     
    	 		     
;; test cases    	 		     
    	 		     
 (display "\nTesting Problem 3\n")
 (table-display    	 		     
  (table-select    	 		     
   (lambda (row)    	 		     
     (> (get 'rating row) 4))
   books))    	 		     
    	 		     
;;; problem 4 ;;;    	 		     
    	 		     
;; Hint: Be careful about the comparator operator of the corresponding
;; row.  Writing a (get-column-type row column-name) might be helpful.

; this procedure takes a column name and a table as arguments and returns
; a new table consists of the same rows with the first table but in a sorted
; order according to the values of the given column.
(define (table-order-by column table)
  (let ((newdata (sort (make-row-comparator column table) (get-table-data table)))
    (newcolumns (get-table-columns table)))
    (make-table newcolumns newdata))
  )

;; test cases    	 		     
 (display "\nTesting Problem 4\n")
 (table-display    	 		     
  (table-order-by 'rating books)
 )    	 		     
    	 		     
 (table-display    	 		     
  (table-order-by 'title books)
 )    	 		     
    	 		     
;;; problem 5 ;;;    	 		     

; this procedure takes a prediciate procedure and a table and deletes
; the rows on the table for which predicate returns true.
(define (table-delete! pred table)
  (let ((newdata (filter (compose not pred) (get-table-data table))))
  (change-table-data! table newdata))
  )    	 		     
    	 		     
;; test cases    	 		     
 (display "\nTesting Problem 5\n")
 (table-delete!    	 		     
  (lambda (row)    	 		     
   (eq? (get 'author row) 'my-cat))
 books)    	 		     
    	 		     
 (table-display books)    	 		     
    	 		     
;;; problem 6 ;;;

; this procedure takes two procedures, a column name and a table as arguments
; and updates the value of the given table by filtering and mapping the rows
; according to the given procedures.
(define (table-update! pred column proc table)
  (let ((newdata (table-map (lambda (x) (if (pred x)
                                            (row-col-replace x column (proc x))
                                            x))
                            table)))
    (change-table-data! table newdata)))

;; test cases    	 		     
    	 		     
 (display "\nTesting Problem 6\n")
 (table-update! (lambda (row) (or (eq? (get 'name row) 'amy) (eq? (get 'name row) 'alex)))
               'major    	 		     
               (lambda (row) '9)
               example-table)
 (table-display example-table)
    	 		     
;;; problem 7 ;;;    	 		     

; the following code implements a new *type-table* definition which
; includes string type.
(define *type-table*    	 		     
(list    	 		     
        (list 'number number? <)
        (list 'symbol symbol? symbol<?)
        (list 'string string? string<?)))        

(define example-table2    	 		     
  (make-empty-table (list (make-column 'name 'string)
                          (make-column 'major 'number))))  	 		     
    	 		     
;; test cases    	 		     
 (display "\nTesting Problem 7\n")
 (table-insert! '("jen" 3) example-table2)
 (table-insert! '("ben" 6) example-table2)
 (table-insert! '("alex" 6) example-table2)
 (table-insert! '("amy" 12) example-table2)
 (table-insert! '("kim" 13) example-table2)
    	 		     
    	 		     
 (table-display example-table2)
 (display "\nordered example-table2\n")
 (table-display    	 		     
 (table-order-by 'name example-table2)
 )    	 		     
    	 		     
;;; problem 8 ;;;    	 		     
    	 		     
;; Hint: Writing these two procedures might be helpful (contains? lst
;; x) returns true if x in the lst and (get-pos lst x) returns the
;; position of x if it is in the list.
;; Ex: (get-pos '(1 2 3 4) 2) => 2
;;     (get-pos '(1 2 3 4) 5) => 0

; this procedure takes an element and a list as arguments and checks if
; the given list contains the given element. If yes returns #t, otherwise #f
(define (contains? lst x)
  (if (null? lst) #f
      (if (equal? (car lst) x) #t (contains? (cdr lst) x))))

; this procedure takes an element and a list as arguments and returns
; the position of the element in the given list(starting from 1). If list
; does not contain the element, it returns 0.
(define (get-pos lst x)
  (if (contains? lst x)
       (if (equal? (car lst) x) 1
           (+ 1 (get-pos (cdr lst) x)))
      0))

; this procedure takes an enumeration list and returns a checker procedure
; to be applied to an element to check if it is contained in the enumeration list.
(define (make-enum-checker lst)
  (lambda (x) (if (contains? lst x) #t #f)) 	 		     
  )

; this procedure takes an enumeration list and returns a comparator procedure
; to be applied to two elements to compare them according to their positions
; in the given enumeration list.
(define (make-enum-comparator lst)
  (lambda (x y) (if (< (get-pos lst x) (get-pos lst y)) #t #f))
)

(define *days* '(sunday monday tuesday Wednesday thursday friday saturday))
(define day-checker (make-enum-checker *days*))
(define day-comparator (make-enum-comparator *days*))
    	 		     
;; test cases    	 		     
 (display "\nTesting Problem 8\n")
 (day-checker 'monday)   ;=> #t
 (day-checker 7)         ;=> #f
 (day-comparator 'monday 'tuesday)   ;=> #t (monday is "less than" tuesday)
 (day-comparator 'friday 'sunday)    ;=> #f (sunday is before friday)
    	 		     
    	 		     
(define *type-table*    	 		     
(list    	 		     
        (list 'number number? <)
        (list 'symbol symbol? symbol<?)
        (list 'string string? string<?)
        (list 'day day-checker day-comparator)))   	 		     
    	 		     
 (define example-table3    	 		     
   (make-empty-table    	 		     
    (list (make-column 'name 'string)
          (make-column 'date 'day)
          (make-column 'major 'number)))
    )    	 		     
    	 		     
 (table-insert! '("jen" monday 3) example-table3)
 (table-insert! '("ben" sunday 6) example-table3)
 (table-insert! '("alex" friday 6) example-table3)
 (table-insert! '("amy" tuesday 1) example-table3)
 (table-insert! '("kim" saturday 2) example-table3)
    	 		     
 (table-display example-table3)
 (display "\nordered example-table3\n")
 (table-display    	 		     
  (table-order-by 'date example-table3)
 )    	 		     
    	 		     
;;; Problem 9    	 		     
;; Hint: Similar with Problem 8

; the following codes creates two new enumerated types(gender and race) with
; appropriate checker and comparator procedures and adds them to the type-table.
(define *gender* '(male female))
(define gender-checker    	 		     
  (make-enum-checker *gender*)
)    	 		     
(define gender-comparator    	 		     
  (make-enum-comparator *gender*)	 		     
)    	 		     
(define *race* '(white black red))
    	 		     
(define race-checker    	 		     
  (make-enum-checker *race*)
)    	 		     
(define race-comparator    	 		     
  (make-enum-comparator *race*)
)    	 		     
    	 		     
(define *type-table*    	 		     
(list    	 		     
        (list 'number number? <)
        (list 'symbol symbol? symbol<?)
        (list 'string string? string<?)
        (list 'day day-checker day-comparator)
        (list 'race race-checker race-comparator)
        (list 'gender gender-checker gender-comparator)))

;; test cases    	 		     
 (display "\nTesting Problem 9\n")
 (define example-table4
   (make-empty-table (list (make-column 'name 'string)
                           (make-column 'gender 'gender)
                           (make-column 'race 'race)))
   )
 (table-insert! '("jen" female black) example-table4)
 (table-insert! '("ben" female red) example-table4)
 (table-insert! '("alex" male red) example-table4)
 (table-insert! '("amy" male black) example-table4)
 (table-insert! '("kim" female white) example-table4)

 (table-display example-table4)
 (display "\ngender ordered example-table4\n")
 (table-display    	 		     
  (table-order-by 'gender example-table4)
 )
 (display "\nrace ordered example-table4\n")
 (table-display    	 		     
  (table-order-by 'race example-table4)
 )  
    	 		     
;;; Problem 10    	 		     

; the following code creates an empty table named person-table with the
; columns name, race, gender and birthdate.
(define person-table    	 		     
  (make-empty-table(list (make-column 'name 'string)
                         (make-column 'race 'race)
                         (make-column 'gender 'gender)
                         (make-column 'birthyear 'number)))
  )

;;; tests    	 		     
 (display "\nTesting Problem 10\n")
 (table-insert! '("jen" white female 1983) person-table)
 (table-insert! '("axe" black male 1982) person-table)
 (table-display person-table)
    	 		     
    	 		     
;;; Problem 11    	 		     
 (table-delete! (lambda (x) #t) person-table)
 (display "\nDeleted Person Table\n")
 (table-display person-table)

; this code implements a constructor for person. It takes a name, race,
; gender and birthyear as arguments and inserts a row for this person
; to person-table. Then it returns the name of the person.
(define (make-person name race gender birthyear)
  (table-insert! (list name race gender birthyear) person-table)
  name)    	 		     
    	 		     
;; test cases    	 		     
    	 		     
 (display "\nTesting Problem 11\n")
    	 		     
 (define p1 (make-person "Alex" 'white 'male 1983))
 (define p2 (make-person "Clark" 'black 'male 1982))
 (table-display person-table)
    	 		     
;;; Probelm 12    	 		     
    	 		     
 (define (person-name person) person)

; this procedure takes a person as argument and returns the row in the
; person-table which contains the given person's name. It returns an error
; message if the given person does not exist in the person-table.
(define (lookup-person-row person)
  (let ((data (get-table-data person-table))
        (name (person-name person)))
    (define (helper data name)
      (if (null? data) "Error: Person cannot found in person-table."
          (if (contains? (row-data (car data)) name) (car data)
              (helper (cdr data) name))))
    (helper data name)))    	 		     

; the followings are the selectors of person object 
(define (person-race person)    	 		     
  (get 'race (lookup-person-row person)))
    	 		     
(define (person-gender person)    	 		     
  (get 'gender (lookup-person-row person)))
    	 		     
(define (person-birthyear person)
  (get 'birthyear (lookup-person-row person)))
    	 		     
(define (person-age person)    	 		     
; returns an approximation to the person's age in years
  (let ((*current-year* 2012))    	 		     
    (- *current-year* (person-birthyear person))))
    	 		     
;; test cases    	 		     
 (display "\nTesting Problem 12\n")
 (lookup-person-row p1)    	 		     
 (person-race p1)    	 		     
 (person-gender p1)    	 		     
 (person-birthyear p1)    	 		     
 (person-age p1)    	 		     
 (lookup-person-row "Muslera")
    	 		     
;;; Problem 13    	 		     
    	 		     
(define (update-person-row! person colname newvalue)
  (let ((pred (lambda (row) (contains? (row-data row) (person-name person))))
        (proc (lambda (row) newvalue)))
    (table-update! pred colname proc person-table)
    ))    	 		     

(define (set-person-name! person newname)
  (update-person-row! person 'name newname))
    	 		     
(define (set-person-race! person newrace)
  (update-person-row! person 'race newrace))
    	 		     
(define (set-person-gender! person newgender)
  (update-person-row! person 'gender newgender))
    	 		     
(define (set-person-birthyear! person newbirthyear)
  (update-person-row! person 'birthyear newbirthyear))
    	 		     
;; QUESTION What happens? Why? Comments?
; After setting a new name for alyssa by (set-person-name!) method,
; when (person-name) procedure was called it showed the old name and then
; it gave an error for the procedure (person-race). This happened because
; the output name value of person constructor was not changed, only the name
; value in person-table was changed. So when alyssa is called, it returns
; the initial name, not the new one.
    	 		     
;;; test cases    	 		     
    	 		     
 (display "\nTesting Problem 13\n")
 (define alyssa (make-person "alyssa-p-hacker" 'black 'female 1978))
 (set-person-name! alyssa "alyssa-p-hacker-bitdiddle")  ; got married!
 (table-display person-table)
 (person-name alyssa)    	 		     
; (person-race alyssa)    	 		     
    	 		     
;;; Problem 14    	 		     

; the following codes defines a table called life-table that consists of the
; same columns with life-expect-data, then inserts all of the rows in
; life-expect-data to this new table
(define life-table    	 		     
  (make-empty-table    	 		     
   (list (make-column 'year 'number)
         (make-column 'all-all 'number)
         (make-column 'all-male 'number)
         (make-column 'all-female 'number)
         (make-column 'white-all 'number)
         (make-column 'white-male 'number)
         (make-column 'white-female 'number)
         (make-column 'black-all 'number)
         (make-column 'black-male 'number)
         (make-column 'black-female 'number)
         )))    	 		       
    	 		     
(table-insert-all! life-expect-data life-table)
    	 		     
 (display "\nTesting Problem 14\nSelecting 1950\n")
 (table-display    	 		     
  (table-select    	 		     
  (lambda (row)    	 		     
    (= (get 'year row) 1950))
  life-table))    	 		     
    	 		     
;;; Problem 15

; this procedure takes one row of life-expect-data and returns a list
; of 4 new rows in (year race gender expected) format to be used in
; the converted lifetable.
(define (convert-liferow contents)
  (list (list (car contents) 'white 'male (list-ref contents 5))
        (list (car contents) 'white 'female (list-ref contents 6))
        (list (car contents) 'black 'male (list-ref contents 8))
        (list (car contents) 'black 'female (list-ref contents 9))))

; By using recursion, this procedure appends the 4-element lists produced
; by the previously implemented procedure (convert-liferow) and forms a
; new data table in (year race gender expected) format
(define (convert-lifetable lst)
  (if (null? lst) '()
      (append (convert-liferow (car lst)) (convert-lifetable (cdr lst))))
      )
  
;; test cases    	 		       	 		     
    	 		     
(define life-expect-data-new (convert-lifetable life-expect-data))
    	 		     
(define life-table-new    	 		     
   (make-empty-table    	 		     
   (list (make-column 'year 'number)
         (make-column 'race 'race)
         (make-column 'gender 'gender)
         (make-column 'expected 'number)
   )))    	 		     
(table-insert-all! life-expect-data-new life-table-new)
(display "\nTesting Problem 15\nSelecting 1950 from new data\n")
(table-display    	 		     
(table-select    	 		     
 (lambda (row)    	 		     
  (= (get 'year row) 1950))    	 		     
  life-table-new))    	 		     
    	 		     
    	 		     
;;; Problem 16    	 		     
(display "\nTesting Problem 16\n")

; this code defines a table that consists of the rows in life-table-new
; with the year values between 1950-59, gender value female and race value white.
(define problem16-table    	 		     
  (table-select    	 		     
   (lambda (row)    	 		     
     (and (>= (get 'year row) 1950) (<= (get 'year row) 1959)
          (eq? (get 'gender row) 'female) (eq? (get 'race row) 'white)
          ))    	 		     
   life-table-new))
    	 		     
;;; QUESTION Was life expectancy for white women steadily increasing
;;; in this decade?    	 		     
; there is an increase but it is not steady. in 1957, a little decrease occurs	 		     
; and between 1954-55 the value stays the same.

(display "White females between 1950-59\n")

(table-display    	 		     
  (table-order-by 'expected problem16-table)
)    	 		     
    	 		     
;; Paste the output of Problem 16 for black female
;; between 1950 and 1959    	 		     

; defines a similar table to problem16-table1, but this time for black females
(define problem16-table2    	 		     
  (table-select    	 		     
   (lambda (row)    	 		     
     (and (>= (get 'year row) 1950) (<= (get 'year row) 1959)
          (eq? (get 'gender row) 'female) (eq? (get 'race row) 'black)
          ))    	 		     
   life-table-new))

(display "Black females between 1950-59\n")

(table-display    	 		     
  (table-order-by 'expected problem16-table2)
)  
    	 		     
;;; Problem 17    	 		     
    	 		     
(define p3 (make-person "GeorgeBest" 'white 'female 1987))
(define p4 (make-person "Lizarazu" 'white 'male 1940))

; this procedure takes a person as argument and returns the expected lifetime
; for him/her by finding the expected value in the life-table-new for
; person's gender, race and birthyear values.
(define (expected-years person)
  (let ((wantedbirth (person-birthyear person))
        (wantedgender (person-gender person))
        (wantedrace (person-race person)))
    (let ((wantedrow
           (car (get-table-data (table-select    	 		     
                            (lambda (row) (and (= (get 'year row) wantedbirth)
                                               (eq? (get 'race row) wantedrace)
                                               (eq? (get 'gender row) wantedgender)))    	 		     
                            life-table-new))
           )))
      (get 'expected (contents wantedrow))
      )))    	 		     
;; test cases    	 		     
(display "\nTesting problem 17\n")    	 		     
(expected-years p3)    	 		     
(expected-years p4)    	 		     