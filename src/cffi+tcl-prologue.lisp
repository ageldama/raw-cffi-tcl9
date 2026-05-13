(in-package #:raw-cffi-tcl9)



(eval-when (:compile-toplevel :load-toplevel :execute)
  (defparameter %cffi+tcl--wide-int-p_tcl
    #.(uiop:read-file-string
       (merge-pathnames "cffi+tcl--wide-int-p.tcl"
                        (or *compile-file-truename*
                            *load-truename*)))))


(eval-when (:compile-toplevel :load-toplevel :execute)
  (defvar *inited* nil)


  (define-foreign-library libtcl
    (:unix    (:or #.(or (uiop:getenv "CFFI_LIBTCL") "libtcl9.0.so")))
    (:darwin  (:default #.(or (uiop:getenv "CFFI_LIBTCL") "libtcl9.0.dylib")))
    (:windows (:or #.(or (uiop:getenv "CFFI_LIBTCL") "libtcl90"
                         "tcl90" "tcl90t")))
    (t (:default #.(or (uiop:getenv "CFFI_LIBTCL") "libtcl"))))

  (use-foreign-library libtcl)

  ;; --- MINI TCL BINDINGS for COMPILE-TIME ---

  (defconstant +tcl-ok+* 0)

  ;; /* 94 */
  ;; EXTERN Tcl_Interp *	Tcl_CreateInterp(void);
  (defcfun ("Tcl_CreateInterp" tcl-create-interp*) :pointer)

  ;; /* 110 */
  ;; EXTERN void		Tcl_DeleteInterp(Tcl_Interp *interp);
  (defcfun ("Tcl_DeleteInterp" tcl-delete-interp*) :void
    (interp-ptr :pointer))

  ;; /* 129 */
  ;; EXTERN int		Tcl_Eval(Tcl_Interp *interp, const char *script);
  (defcfun ("Tcl_EvalEx" tcl-eval-ex*) :int
    (interp-ptr :pointer)
    (script :string)
    (num-bytes :ptrdiff)
    (flags     :int))

  (defun tcl-eval* (interp script)
    (tcl-eval-ex* interp script -1 0))

  (defcfun ("Tcl_GetObjResult" tcl-get-obj-result*) :pointer
    (interp-ptr :pointer))

  (defcfun ("Tcl_GetString" tcl-get-string*) :string
    (obj-ptr :pointer))

  (defun tcl-get-string-result* (interp)
    (tcl-get-string* (tcl-get-obj-result* interp)))

  ;; /* 175 */
  ;; EXTERN CONST84_RETURN char * Tcl_GetVar(Tcl_Interp *interp,
  ;; 				const char *varName, int flags);
  (defcfun ("Tcl_GetVar2" tcl-get-var2*) :string
    "`flags'은 `TCL_GLOBAL_ONLY'(=1) 등이 가능."
    (interp-ptr :pointer)
    (part1      :string)
    (part2      :string)
    (flags      :int))

  (defun tcl-get-var* (interp var-name flags)
    (tcl-get-var2* interp var-name (cffi:null-pointer) flags))

  ;; /* 180 */
  ;; EXTERN int		Tcl_Init(Tcl_Interp *interp);
  (defcfun ("Tcl_Init" tcl-init*) :int
    "=`TCL_OK'(0)"
    (interp-ptr :pointer))

  ;;; /* 327 */
  (defcfun ("Tcl_UtfBackslash" tcl-utf-backslash*) :int
    (src :string)
    (read-ptr :pointer)
    (dst :pointer))

  (unless *inited*
    ;; --- TCL_UTF_MAX ==> Tcl_UniChar.

    (defun get-tcl-utf-max ()
      "런타임에 Tcl 라이브러리의 TCL_UTF_MAX 값을 검출합니다."
      (with-foreign-objects ((read-ptr :int)
                             (dst :char 8)) ; 충분히 큰 버퍼 할당
        ;; 4바이트 UTF-8이 필요한 문자를 생성하는 시퀀스 사용 (예: \U0001F600)
        ;; Tcl 버전이나 설정에 따라 3 또는 4를 반환함
        (let ((bytes-written (tcl-utf-backslash* "\\U0001F600" read-ptr dst)))
          bytes-written)))

    (let ((utf-max  (get-tcl-utf-max)))
      (if (>= utf-max 4)
          (progn (defctype tcl-uni-char :uint)
                 (defconstant +tcl-utf-max+ 4))
          (progn (defctype tcl-uni-char :ushort)
                 (defconstant +tcl-utf-max+ 3))))

    (when (< +tcl-utf-max+ 4)
      (let ()
        #+sbcl
        (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
        (push :tcl-utf-max<4 *features*)))

    ;; --- Tcl_WideInt, Tcl_WideUInt.

    (let* ((interp-ptr (tcl-create-interp*)))
      (unwind-protect
           (progn
             (unless (eq +tcl-ok+* (tcl-init* interp-ptr))
               (error "tcl-init* FAIL: ~a" (tcl-get-string-result* interp-ptr)))
             (unless (eq +tcl-ok+*
                         (tcl-eval* interp-ptr %cffi+tcl--wide-int-p_tcl))
               (error "tcl-eval* FAIL: ~a" (tcl-get-string-result* interp-ptr)))
             (let* ((res (tcl-get-var* interp-ptr "::wideint" 1))
                    (32-vs-64-bits (format nil "~A" res)))
               (cond
                 ((equal 32-vs-64-bits "64bits")
                  (progn (push :tcl-64-bits *features*)
                         (defctype tcl-wide-int
                           :long-long)
                         (defctype tcl-wide-uint
                           :unsigned-long-long)))
                 ((equal 32-vs-64-bits "32bits")
                  (progn (push :tcl-32-bits *features*)
                         (defctype tcl-wide-int
                           :long)
                         (defctype tcl-wide-uint
                           :unsigned-long)))
                 (t (error "WTF?! [~A]" 32-vs-64-bits))))
             ;; cleanup
             (tcl-delete-interp* interp-ptr))))
    ;;
    (setf *inited* t)))


