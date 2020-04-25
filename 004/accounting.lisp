;;;; Copyright (C) 2020 Jacob Martin

;;;; This program is free software: you can redistribute it and/or modify
;;;; it under the terms of the GNU Affero General Public License as published by
;;;; the Free Software Foundation, either version 3 of the License, or
;;;; (at your option) any later version.

;;;; This program is distributed in the hope that it will be useful,
;;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;;; GNU Affero General Public License for more details.

;;;; You should have received a copy of the GNU Affero General Public License
;;;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

(defparameter *general-ledger* nil)

;; format for transactions:
;; (:date <UTC-date>
;;  :debit-account <account>
;;  :credit-account <account>
;;  :amount <amount>)
;; The date will be in universal-time

(defun midnight-at (year month day)
  (encode-universal-time 0 0 0 day month year))

(defun transaction-date (transaction)
  (getf transaction :date))

(defun transaction-credit (transaction)
  (getf transaction :credit-account))

(defun transaction-debit (transaction)
  (getf transaction :debit-account))

(defun transaction-amount (transaction)
  (getf transaction :amount))

(defun make-transaction (&key
			   (date (get-universal-time))
			   credit-account
			   debit-account
			   amount)
  (list :date date :credit-account credit-account
	:debit-account debit-account :amount amount))

(defun add-transaction (transaction)
  (push transaction *general-ledger*))

(defun account-ledger (account)
  (loop
     :for transaction :in *general-ledger*
     :if (or (eq (transaction-debit transaction) account)
	     (eq (transaction-credit transaction) account))
     :collect transaction))

(defun account-balance (account &key increasing-with)
  (let ((balance 0))
    (loop
       :for transaction :in (account-ledger account)
       :do
	 (setf balance (+ balance
			  (if
			   (or (and (eq increasing-with 'debit)
				    (eq (transaction-debit
					 transaction)
					account))
			       (and (eq increasing-with 'credit)
				    (eq (transaction-credit
					 transaction)
					account)))
			   (transaction-amount transaction)
			   (- (transaction-amount transaction))))))
    balance))
	     
