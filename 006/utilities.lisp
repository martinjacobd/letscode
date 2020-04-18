;;;; Copyright (c) 2020 Jacob Martin where applicable
;;;; See LICENSING for details
(in-package #:bookkeeping)

;;; anaphoric macros
(defmacro aif (predicate then else) ; adapted from *On Lisp*
  `(let ((it ,predicate))
     (if it ,then ,else)))

(defmacro alambda (lambda-list &body body) ; adapted from *On Lisp*
  `(labels ((self ,lambda-list ,@body))
     #'self))

;;; list functions
(defun first-n (n list)
  (labels ((first-n-help (n list &optional (build-up-list nil))
	     (if (= n 0)
		 (reverse build-up-list)
		 (first-n-help (- n 1)
			       (cdr list)
			       (cons (car list) build-up-list)))))
    (first-n-help n list)))

(defun insert-after (index element list)
  (append (first-n index list) (list element) (nthcdr index list)))

(defun ninsert-after (index element list)
  (if (= index 0)
      (push element list)
      (push element (cdr (nthcdr (- index 1) list))))
  list)
