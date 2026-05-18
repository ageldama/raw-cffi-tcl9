# raw-cffi-tcl9

Barely a bunch of [CFFI](https://cffi.common-lisp.dev/)-binding for libtcl/libtk version 9.0.

* VERSION: 0.0.1

* (Almost?) tested under:
   * SBCL 2.6.4 / Linux x86_64
   * libtcl9.0 (9.0.1+dfsg-2)
   * libtk9.0 (9.0.1-3)

* Suggestions, Patches, Issues and PRs are Welcomed.

* Put a symlink of the `.asd` file into your
  `$HOME/common-lisp`-directory, and:
  ```lisp
  > (asdf:clear-configuration)
  > (ql:quickload :raw-cffi-tcl9)
  ```


...More hacks will be come, anytime soon. ;-)

