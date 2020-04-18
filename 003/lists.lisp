(defparamater cons-cell (cons 'a b))
;; => (A . B)

(car cons-cell)
;; => A

(cdr (cons-cell))
;; => B

'(a . (b . (c . (d . nil))))
;; => (A B C D)

(car '(a b c d))
;; => A

(cdr '(a b c d))
;; => (B C D)

(mapcar #'exp '(1 2 3 4))

;; let's make our own mapcar
(defun our-mapcar (function list)
  (if (null list)
      nil
      (cons (funcall function (car list))
	    (our-mapcar function (cdr list)))))

;; Can you think of a tail-recursive version?








;; Here's mine!

(defun tail-mapcar (function list &optional build-up)
  (if (null list)
      (nreverse build-up)
      (tail-mapcar function
		   (cdr list)
		   (cons (funcall function (car list))
			 build-up))))
