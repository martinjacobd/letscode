LET'S BUILD A WEBAPP
===
* Expectations
  * General computer knowledge, basic troubleshooting
  * Basic HTML/CSS knowledge
  * Basic knowledge of some other programming language
* Non-expectations
  * Beefy Computer
  * Advanced mathematics knowledge (anything past arithmetic)
  * Knowledge of LISP
  * My particular setup (Linux/Emacs/SLIME/SBCL)
* Building my Setup
  * Install emacs & SBCL
    ```sh
    sudo apt update
    sudo apt install emacs sbcl
    ```
  * Install quicklisp
  * Download quicklisp: https://beta.quicklisp.org/quicklisp.lisp
  * From the Downloads directory, execute `sbcl --load quicklisp.lisp`
  * While in SBCL, execute `(quicklisp-quickstart:install)`
  * Execute `(ql:add-to-init-file)`
  * Download quicklisp-slime-helper `(ql:quickload 'quicklisp-slime-helper)`
  * (In shell after exiting from SBCL) Execute `which sbcl` to see the path to SBCL
  * Add relevant bits to `~/.emacs`
