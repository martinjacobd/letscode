Getting Started with Lisp
===
* First of all, we should review what our webapp will actually be! I realized that I didn't go over it in the last video. We will be building some [double-entry bookkeeping](https://en.wikipedia.org/wiki/Double-entry_bookkeeping) software. If you haven't heard of this, don't fret, if you've ever used something like Mint or Quicken, it's the same general idea. We are keeping track of assets or bank accounts by tracking where money goes and where it comes from.
* Basics of Lisp
  * There are no distinctions in Lisp between expressions and statements, like there is in C or Python.
  * Define a global variable with `(defparameter variable value)`.
  * Change the value of a variable with `(setf variable new-value)`.
  * Define a function with `(defun function-name (arguments) body)`.
  * See when a function is called and returns with `(trace function-name)`. Use `(untrace function-name)` to undo this effect.
  * We can do things either recursively or iteratively.
  * Define local variables with `(let)`.
  * Lisp passes by value.
* Other resources for learning about Lisp.
  * Freely Available Online
    * [On Lisp](http://www.paulgraham.com/onlisp.html) by Paul Graham
	* [Let Over Lambda](https://letoverlambda.com/) by Doug Hoyte
	* [Practical Common Lisp](http://www.gigamonkeys.com/book/) by Peter Seibel
	* [The Common Lisp HyperSpec](http://www.lispworks.com/documentation/HyperSpec/Front/) as a reference.
  * [ANSI Common Lisp](https://www.amazon.com/exec/obidos/ASIN/0133708756) by Paul Graham
  * [LISP 3rd edition](https://www.amazon.com/Lisp-3rd-Patrick-Winston/dp/0201083191/ref=sr_1_1?dchild=1&keywords=WInston+and+HOrn&qid=1586467035&rnid=1000&s=books&sr=1-1) by Winston and Horn
