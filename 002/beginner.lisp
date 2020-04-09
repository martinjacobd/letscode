(defparameter foo 5)
;; Use C-x C-e to evaluate the previous expression. Its result will display in the lower bar
(setf foo "asdf")
;; If we use C-x C-e now and evaluate foo in the REPL, it will show "asdf" instead of 5.


;; defun stands for DEfine Function
;; the factorial stands for the function which multiplies all positive integers up to a certain number together
;; 5! = 5 * 4 * 3 * 2 * 1
;; We can define a factorial recursively by saying
;; 1! = 1
;; n! = n * (n - 1)! IF n > 1
(defun recursive-factorial (n)
  (if (= n 1)
      1
      (* n (recursive-factorial (- n 1)))))

;; this will print all calls to recursive-factorial
(trace recursive-factorial)

(untrace recursive-factorial)

(defun tail-factorial (n &optional (build-up 1))
  (if (<= n 0)
      build-up
      (tail-factorial (- n 1) (* n build-up))))

(defun iter-factorial (n)
  (let ((acc 1)
	i)
    (dotimes (i n acc)
      (setf acc (* (+ i 1) acc)))))

(defun loop-factorial (n)
  (let ((acc 1))
    (loop for i from 1 to n do (setf acc (* acc i)))
    acc))

;; Fibonacci sequence
;; F(1), F(2) = 1
;; F(n) = F(n-1) + F(n-2), n >= 3
;; 1, 1, 2, 3, 5, 8, 13
(defun recursive-fibonacci (n)
  (if (<= n 2)
      1
      (+ (recursive-fibonacci (- n 1)) (recursive-fibonacci (- n 2)))))

(defun fib-helper (prev1 prev2)
  (values (+ prev1 prev2) prev2))

(defun iter-fib (n &optional (at 3) (prev1 1) (prev2 1))
  (cond
    ((<= n 2)
     1)
    ((= at n)
     (+ prev1 prev2))
    (t
     (fib-acc n (+ at 1) (+ prev1 prev2) prev1))))

(let ((memoization (make-hash-table)))
  (defun memoized-fib (n)
    (cond
      ((gethash n memoization)
       (gethash n memoization))
      ((<= n 2)
       (setf (gethash n memoization) 1)
       1)
      (t
       (let ((result (+ (memoized-fib (- n 2)) (memoized-fib (- n 1)))))
	 (setf (gethash n memoization) result)
	 result)))))
