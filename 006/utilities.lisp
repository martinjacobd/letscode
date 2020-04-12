;;;; Copyright (c) 2020 Jacob Martin where applicable
;;;; See LICENSING for details
(in-package #:bookkeeping)

;;;; anaphoric macros
(defmacro aif (predicate then else) ; adapted from *On Lisp*
  `(let ((it ,predicate))
     (if it ,then ,else)))

(defmacro alambda (lambda-list &body body) ; adapted from *On Lisp*
  `(labels ((self ,lambda-list ,@body))
     #'self))

