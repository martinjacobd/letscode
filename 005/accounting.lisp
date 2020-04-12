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

(defmethod add-transaction ((transaction transaction)
			    (register register))
  (labels
      ((add-at-proper-location (transaction
				rest
				&optional (first-n nil))
	 (if (or (null rest)
		 (>= (transaction-date transaction)
		     (transaction-date (car rest))))
	     (append first-n (cons transaction rest))
	     (add-at-proper-location transaction
				     (cdr rest)
				     (append first-n (list (car rest)))))))
    (setf (register-transactions register)
	  (add-at-proper-location transaction (register-transactions register)))))

(defmethod add-account ((account account)
			account-name)
  (acons account-name account *accounts*))

(defun find-account (account-name)
  (assoc account-name *accounts*))
