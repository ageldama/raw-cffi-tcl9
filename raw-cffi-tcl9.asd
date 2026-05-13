(defsystem "raw-cffi-tcl9"
  :version "0.0.1"
  :author "Jonghyouk Yun"
  :mailto "ageldama@gmail.com"
  :license "MIT"
  :depends-on (
               :uiop
               :cffi
               )
  :components ((:module "src"
                :serial t
                :components
                (
                 (:file "cffi+tcl-defpkg")
                 (:file "cffi+tcl-prologue")
                 (:file "cffi+tcl-tcl.h")
                 (:file "cffi+tcl-defcfun")
                 (:file "cffi+tcl")

                 (:file "cffi+tk")
                 ))
               )
  :description "Raw CFFI Binding of Tcl/Tk 9.0"
  )
