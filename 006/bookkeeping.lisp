(in-package #:bookkeeping)

(defstruct account
  (name "" :type string)
  (balance 0.0 :type number)
  (ledger (make-register) :type register)
  (debits-increasep t :type boolean))

(defstruct transaction
  (date (get-universal-time) :type integer)
  (credit "imbalance" :type string)
  (debit  "imbalance" :type string)
  (amount 0r1 :type number))

(defstruct register
  (transactions nil :type list))

(defstruct account-list
  (accounts nil :type list))

(defparameter *general-register* (make-register))

(defparameter *accounts* (make-account-list))

(defgeneric add-transaction (transaction place)
  (declare (optimize (speed 0) (safety 3) (debug 3))))

(defmethod add-transaction ((transaction transaction)
			    (register register))
  (declare (optimize (speed 0) (safety 3) (debug 3)))
  (setf (register-transactions register)
	(do* ((i 0)
	      (acc-list nil
			(aif cur-trans
			     (cons it acc-list)
			     acc-list))
	      (cur-trans
	       (nth 0 (register-transactions register))
	       (nth i (register-transactions register))))
	     ((or (null cur-trans)
		  (>= (transaction-date transaction)
		      (transaction-date cur-trans)))
	      (append (nreverse acc-list)
		      (list transaction)
		      (nthcdr i
			      (register-transactions register)))))))

(defmethod add-account ((account account)
			account-name)
  (acons account-name account *accounts*))

(defun find-account (account-name)
  (assoc account-name *accounts*))
