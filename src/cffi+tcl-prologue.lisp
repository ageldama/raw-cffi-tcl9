(in-package #:raw-cffi-tcl9)



(define-foreign-library libtcl
  (:unix    (:or #.(or (uiop:getenv "CFFI_LIBTCL") "libtcl9.0.so")))
  (:darwin  (:default #.(or (uiop:getenv "CFFI_LIBTCL") "libtcl9.0.dylib")))
  (:windows (:or #.(or (uiop:getenv "CFFI_LIBTCL") "libtcl90"
                       "tcl90" "tcl90t")))
  (t (:default #.(or (uiop:getenv "CFFI_LIBTCL") "libtcl"))))

(use-foreign-library libtcl)


(defctype tcl-uni-char :uint)
(defconstant +tcl-utf-max+ 4)



(if (eq (cffi:foreign-type-size :long-long)
        (cffi:foreign-type-size :long))
    (progn
      (defctype tcl-wide-int :long)
      (defctype tcl-wide-uint :unsigned-long))
    (progn
      (defctype tcl-wide-int :long-long)
      (defctype tcl-wide-uint :unsigned-long-long)))

