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
