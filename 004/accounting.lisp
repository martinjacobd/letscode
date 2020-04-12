(defparameter *general-ledger* nil)

;; format for transactions:
;; (:date <UTC-date>
;;  :debit-account <account>
;;  :credit-account <account>
;;  :amount <amount>)
;; The date will be in universal-time

(defun midnight-at (year month day)
  (encode-universal-time 0 0 0 day month year))

(defun add-transaction (date debit-account credit-account amount)
  (push (list :date date
	      :debit-account debit-account
	      :credit-account credit-account
	      :amount amount)
	*general-ledger*))

(defun date (transaction)
  (getf transaction :date))

(defun debit (transaction)
  (getf transaction :debit-account))

(defun credit (transaction)
  (getf transaction :credit-account))

(defun amount (transaction)
  (getf transaction :amount))

(defun ledger (account)
  (loop :for transaction :in *general-ledger*
     :if (or (eq (debit-of transaction) account)
	     (eq (credit-of transaction) account))
     :collect transaction))

(defun balance-of (account increasing-with)
  (let ((balance 0))
    (loop :for transaction :in (ledger account) :do
	 (if (eq increasing-with 'credit)
	     (if (eq (credit transaction) account)
		 (setf balance (+ balance (amount transaction)))
		 (setf balance (- balance (amount transaction))))
	     (if (eq (credit transaction) account)
		 (setf balance (- balance (amount transaction)))
		 (setf balance (+ balance (amount transaction))))))
    balance))
	     
(add-transaction (midnight-at 2020 4 11) 'checking 'opening 2000)
(add-transaction (midnight-at 2020 4 11) 'gasoline 'checking 50)
(add-transaction (midnight-at 2020 4 11) 'savings 'opening 5000)
