;;;; bookkeeping.asd

(asdf:defsystem #:bookkeeping
  :description "A simple package for keeping track of accounts in a double-entry accounting context."
  :author "Jacob Martin <jacobm@alum.mit.edu>"
  :license  "AGPL"
  :version "0.0.1"
  :serial t
  :components ((:file "package")
	       (:file "utilities")
               (:file "bookkeeping")))
