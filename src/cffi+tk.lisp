(defpackage #:raw-cffi-tcl9
  (:use #:cl #:cffi)
  (:export
   #:libtk
   #:tk-init
   #:tk-safe-init
   #:tk-create-console-window
   #:tk-main-loop
   ))



(in-package :raw-cffi-tcl9)


(eval-when (:compile-toplevel :load-toplevel :execute)
  (define-foreign-library libtk
    (:unix    (:or #.(or (uiop:getenv "CFFI_LIBTK")
                         "libtcl9tk9.0.so" "libtk9.0.so" )))
    (:darwin  (:default #.(or (uiop:getenv "CFFI_LIBTK")
                              "libtcl9tk9.0.dylib" "libtk9.0.dylib" )))
    (:windows (:or #.(or (uiop:getenv "CFFI_LIBTK") "libtcl9tk90"
                         "tcl9tk90" "tcl9tk90t")))
    (t (:default #.(or (uiop:getenv "CFFI_LIBTK") "libtcl9tk9.0"))))

  (use-foreign-library libtk))

(defcfun ("Tk_Init" tk-init) :int
  (interp-ptr tcl-interp-ptr))

(defcfun ("Tk_SafeInit" tk-safe-init) :int
  (interp-ptr tcl-interp-ptr))

(defcfun ("Tk_CreateConsoleWindow" tk-create-console-window) :int
  (interp-ptr tcl-interp-ptr))

(defcfun ("Tk_MainLoop" tk-main-loop) :void)
