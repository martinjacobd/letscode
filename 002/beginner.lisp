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
