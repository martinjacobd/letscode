(defparameter *general-ledger* nil)

;; Transaction class
;; The date will be in universal-time

(defclass transaction ()
  ((date
    :reader   transaction-date
    :type     integer
    :initarg  :date
    :initform (get-universal-time))
   (debit-account
    :reader   transaction-debit
    :type     symbol
    :initarg  :debit-account
    :initform 'imbalance)
   (credit-account
    :reader   transaction-credit
    :type     symbol
    :initarg  :credit-account
    :initform 'imbalance)
   (amount
    :reader   transaction-amount
    :type     double-float
    :initarg  :amount
    :initform 0.0d0)))

(defclass account ()
  ((name
    :reader   account-name
    :type     string
    :initarg  :name)
   (increases-with
    :reader   account-increases-with
    :type     (member debit credit)
    :initarg  :increases-with)
   (ledger
    :reader   account-ledger
    :type     list
    :initarg  :ledger)))

(defun midnight-at (year month day)
  (encode-universal-time 0 0 0 day month year))

(defun add-transaction (transaction)
  (push transaction *general-ledger*))

(defun transaction-pertainsto-account (transaction account)
  (with-accessors ((debit  transaction-debit)
		   (credit transaction-credit))
      transaction
    (or (eq debit  account)
	(eq credit account))))

(defun account-ledger (account)
  (loop
     :for transaction :in *general-ledger*
     :if (transaction-pertainsto-account transaction account)
     :collect transaction))

(defun transaction-increases-account (transaction account increasing-with)
  (check-type increasing-with (member debit credit))
  (with-accessors ((debit transaction-debit)
		   (credit transaction-credit))
      transaction
    (or (and (eq increasing-with 'debit)
	     (eq debit
		 account))
	(and (eq increasing-with 'credit)
	     (eq credit
		 account)))))

(defun account-balance (account &key increasing-with)
  (check-type increasing-with (member debit credit))
  (let ((balance 0))
    (loop
       :for transaction :in (account-ledger account)
       :do
	 (setf balance (+ balance
			  (if
			   (transaction-increases-account
			    transaction
			    account
			    increasing-with)
			   (transaction-amount transaction)
			   (- (transaction-amount transaction))))))
    balance))
	     
