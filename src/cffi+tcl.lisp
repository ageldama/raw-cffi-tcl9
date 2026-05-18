(in-package #:raw-cffi-tcl9)



(eval-when (:compile-toplevel :load-toplevel :execute)
  (setf (get :raw-cffi-tcl9 :doqumen)
        `(:sections (
                     ,#p"src/01-title.md"
                     :toc
                     ,#p"src/02-support.md"
                     ,#p"src/03-license.md"
                     :api-ref
                     |footer (:copyright " by https://github.com/ageldama")|
                     ))))


;; (eval-when (:compile-toplevel :load-toplevel :execute)
;;   (ql:quickload :doqumen)
;;   (doqumen:build-doc :raw-cffi-tcl9 :output-file #p"README.md"))





