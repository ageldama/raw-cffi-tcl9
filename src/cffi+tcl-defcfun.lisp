(in-package #:raw-cffi-tcl9)




(defcfun ("Tcl_MainEx" tcl-main-ex) :void
  (argc tcl-size)
  (argv (:pointer (:pointer :char)))
  (app-init-proc tcl-app-init-proc)
  (interp tcl-interp-ptr))

#|
(defun tcl-main (argc argv proc)
  (tcl-main-ex argc argv proc
               (tcl-set-panic-proc
                (cffi:foreign-symbol-pointer "Tcl_ConsolePanic"))
               (tcl-create-interp)))
|#

(defcfun ("Tcl_PkgInitStubsCheck" tcl-pkg-init-stubs-check) :string
  (interp  tcl-interp-ptr)
  (version :string)
  (exact   :int))

(defcfun ("Tcl_InitSubsystems" tcl-init-subsystems) :string)

(defcfun ("Tcl_GetMemoryInfo" tcl-get-memory-info) :void
  (ds-ptr tcl-d-string-ptr))

(defcfun ("Tcl_FindExecutable" tcl-find-executable) :string
  (argv0 :string))

(defcfun ("Tcl_SetPreInitScript" tcl-set-pre-init-script) :string
  (string :string))

(defcfun ("Tcl_SetPanicProc" tcl-set-panic-proc) :string
  (panic-proc tcl-panic-proc))

(defcfun ("Tcl_StaticLibrary" tcl-static-library) :void
  (interp tcl-interp-ptr)
  (prefix :string)
  (init-proc tcl-library-init-proc)
  (safe-init-proc tcl-library-init-proc))


(defcfun ("TclSetObjNameOfExecutable" tcl-set-obj-name-of-executable) :void
  (name  tcl-obj-ptr)
  (enc   tcl-encoding))




;;; Tcl_IncrRefCount macro equivalent:
;;;   objPtr->refCount++
(defun tcl-incr-ref-count* (obj-ptr)
  (incf
   (foreign-slot-value obj-ptr '(:struct tcl-obj) 'ref-count)))


;; /* 30 */
;; EXTERN void		TclFreeObj(Tcl_Obj *objPtr);
;;; Tcl_DecrRefCount macro equivalent:
;;;   if (--objPtr->refCount <= 0) TclFreeObj(objPtr)
(defcfun ("TclFreeObj" tcl-free-obj) :void
  (obj-ptr :pointer))


(defun tcl-decr-ref-count* (obj-ptr)
  (let ((new-count
          (decf (foreign-slot-value obj-ptr '(:struct tcl-obj) 'ref-count))))
    (when (<= new-count 0)
      (tcl-free-obj obj-ptr))))


;;; Tcl_IsShared macro equivalent:
;;;   ((objPtr)->refCount > 1)
(defun tcl-is-shared* (obj-ptr)
  (> (foreign-slot-value obj-ptr '(:struct tcl-obj) 'ref-count) 1))


(defun tcl-bounce-ref-count (obj-ptr)
  (unless (cffi:null-pointer-p obj-ptr)
    (let ((count
            (foreign-slot-value obj-ptr '(:struct tcl-obj) 'ref-count)))
      (when (eq count 0)
        (tcl-decr-ref-count obj-ptr)))))






(defcfun ("Tcl_PkgProvideEx" tcl-pkg-provide-ex) :int
  "/* 0 */ EXTERN int
Tcl_PkgProvideEx(Tcl_Interp *interp,
                 const char *name, const char *version,
                 const void *clientData);"
  (interp tcl-interp-ptr)
  (name :string) (version :string) (client-data :pointer))

(defcfun ("Tcl_PkgRequireEx" tcl-pkg-require-ex) :string
  "/* 1 */ EXTERN const char *
Tcl_PkgRequireEx(
  Tcl_Interp *interp,
  const char *name, const char *version,
  int exact, void *clientDataPtr);"
  (interp tcl-interp-ptr)
  (name :string) (version :string)
  (exact :int) (client-data :pointer))

(defcfun ("Tcl_Panic" tcl-panic) :void
  "/* 2 */ EXTERN TCL_NORETURN
void Tcl_Panic(const char *format, ...)
TCL_FORMAT_PRINTF(1, 2);"
  (format :string) &rest)

(defcfun ("Tcl_Alloc" tcl-alloc) :pointer
  "/* 3 */ EXTERN void *
Tcl_Alloc(TCL_HASH_TYPE size);"
  (size tcl-hash-type))

(defcfun ("Tcl_Free" tcl-free) :void
  "/* 4 */ EXTERN void
Tcl_Free(void *ptr);"
  (ptr :pointer))

(defcfun ("Tcl_Realloc" tcl-realloc) :pointer
  "/* 5 */ EXTERN void *
Tcl_Realloc(void *ptr, TCL_HASH_TYPE size);"
  (ptr :pointer) (size tcl-hash-type))

(defcfun ("Tcl_DbCkalloc" tcl-db-ckalloc) :pointer
  "/* 6 */ EXTERN void *
Tcl_DbCkalloc(TCL_HASH_TYPE size, const char *file, int line);"
  (size tcl-hash-type) (file :string) (line :int))

(defcfun ("Tcl_DbCkfree" tcl-db-ckfree) :void
  "/* 7 */ EXTERN void
Tcl_DbCkfree(void *ptr, const char *file, int line);"
  (ptr :pointer) (file :string) (line :int))

(defcfun ("Tcl_DbCkrealloc" tcl-db-ckrealloc) :pointer
  "/* 8 */ EXTERN void *
Tcl_DbCkrealloc(void *ptr, TCL_HASH_TYPE size, const char *file, int line);"
  (ptr :pointer) (size tcl-hash-type) (file :string) (line :int))

(defcfun ("Tcl_CreateFileHandler"
          tcl-create-file-handler) :void
  "/* 9 */ EXTERN void
Tcl_CreateFileHandler(
  int fd, int mask, Tcl_FileProc *proc, void *clientData);"
  (fd :int) (mask :int)
  (file-proc tcl-file-proc)
  (client-data client-data))

(defcfun ("Tcl_DeleteFileHandler" tcl-delete-file-handler) :void
  "/* 10 */ EXTERN void
Tcl_DeleteFileHandler(int fd);"
  (fd :int))

(defcfun ("Tcl_SetTimer" tcl-set-timer) :void
  "/* 11 */ EXTERN void
Tcl_SetTimer(const Tcl_Time *timePtr);"
  (time-ptr tcl-time-ptr))

(defcfun ("Tcl_Sleep" tcl-sleep) :void
  "/* 12 */ EXTERN void
Tcl_Sleep(int ms);"
  (ms :int))

(defcfun ("Tcl_WaitForEvent" tcl-wait-for-event) :int
  "/* 13 */ EXTERN int
Tcl_WaitForEvent(const Tcl_Time *timePtr);"
  (time-ptr tcl-time-ptr))

(defcfun ("Tcl_AppendAllObjTypes" tcl-append-all-obj-types) :int
  "/* 14 */ EXTERN int
Tcl_AppendAllObjTypes(Tcl_Interp *interp, Tcl_Obj *objPtr);"
  (interp   tcl-interp-ptr)
  (obj-ptr  tcl-obj-ptr))

(defcfun ("Tcl_AppendStringsToObj" tcl-append-strings-to-obj) :void
  "/* 15 */ EXTERN void
Tcl_AppendStringsToObj(Tcl_Obj *objPtr, ...);"
  (obj-ptr tcl-obj-ptr) &rest)

(defcfun ("Tcl_AppendToObj" tcl-append-to-obj) :void
  "/* 16 */ EXTERN void
Tcl_AppendToObj(
  Tcl_Obj *objPtr, const char *bytes, Tcl_Size length);"
  (obj-ptr tcl-obj-ptr)
  (bytes   (:pointer :char))
  (length  tcl-size))

(defcfun ("Tcl_ConcatObj" tcl-concat-obj) :pointer
  "/* 17 */ EXTERN Tcl_Obj *
Tcl_ConcatObj(Tcl_Size objc, Tcl_Obj *const objv[]);"
  (objc tcl-size) (objv (:pointer tcl-obj-ptr)))

(defcfun ("Tcl_ConvertToType" tcl-convert-to-type) :int
  "/* 18 */ EXTERN int
Tcl_ConvertToType(
  Tcl_Interp *interp, Tcl_Obj *objPtr,
  const Tcl_ObjType *typePtr);"
  (interp  tcl-interp-ptr)
  (obj-ptr tcl-obj-ptr)
  (type-ptr tcl-obj-type-ptr))

(defcfun ("Tcl_DbDecrRefCount" tcl-db-decr-ref-count) :void
  "/* 19 */ EXTERN void
Tcl_DbDecrRefCount(
Tcl_Obj *objPtr, const char *file, int line);"
  (obj-ptr tcl-obj-ptr) (file :string) (line :int))

(defcfun ("Tcl_DbIncrRefCount" tcl-db-incr-ref-count) :void
  "/* 20 */ EXTERN void
Tcl_DbIncrRefCount(
  Tcl_Obj *objPtr, const char *file, int line);"
  (obj-ptr tcl-obj-ptr) (file :string) (line :int))

(defcfun ("Tcl_DbIsShared" tcl-db-is-shared) :int
  "/* 21 */ EXTERN int
Tcl_DbIsShared(
  Tcl_Obj *objPtr, const char *file, int line);"
  (obj-ptr tcl-obj-ptr) (file :string) (line :int))

(defcfun ("Tcl_DbNewBooleanObj" %tcl-db-new-boolean-obj) tcl-obj-ptr
  "/* Slot 22 is reserved */ DEPRECATED 9.0"
  (int-val :int) (file :string) (line :int))

(defcfun ("Tcl_DbNewByteArrayObj" tcl-db-new-byte-array-obj) tcl-obj-ptr
  "/* 23 */ EXTERN Tcl_Obj *
Tcl_DbNewByteArrayObj(
  const unsigned char *bytes, Tcl_Size numBytes,
  const char *file, int line);"
  (bytes (:pointer :uchar)) (length tcl-size)
  (file :string) (line :int))

(defcfun ("Tcl_DbNewDoubleObj" tcl-db-new-double-obj) tcl-obj-ptr
  "/* 24 */ EXTERN Tcl_Obj *
Tcl_DbNewDoubleObj(
  double doubleValue, const char *file, int line);"
  (double-val :double) (file :string) (line :int))

(defcfun ("Tcl_DbNewListObj" tcl-db-new-list-obj) tcl-obj-ptr
  "/* 25 */ EXTERN Tcl_Obj *
Tcl_DbNewListObj(
  Tcl_Size objc, Tcl_Obj *const *objv,
  const char *file, int line);"
  (objc tcl-size) (objv (:pointer tcl-obj-ptr))
  (file :string) (line :int))

(defcfun ("Tcl_DbNewLongObj" %tcl-db-new-long-obj) tcl-obj-ptr
  "/* Slot 26 is reserved */ DEPRECATED 9.0"
  (long-val :long) (file :string) (line :int))

(defcfun ("Tcl_DbNewObj" tcl-db-new-obj) tcl-obj-ptr
  "/* 27 */ EXTERN Tcl_Obj *
Tcl_DbNewObj(const char *file, int line);"
  (file :string) (line :int))

(defcfun ("Tcl_DbNewStringObj" tcl-db-new-string-obj) tcl-obj-ptr
  "/* 28 */ EXTERN Tcl_Obj *
Tcl_DbNewStringObj(
  const char *bytes, Tcl_Size length,
  const char *file, int line);"
  (bytes (:pointer :char)) (length tcl-size)
  (file :string) (line :int))

(defcfun ("Tcl_DuplicateObj" tcl-duplicate-obj) tcl-obj-ptr
  "/* 29 */ EXTERN Tcl_Obj *
Tcl_DuplicateObj(Tcl_Obj *objPtr);"
  (obj-ptr tcl-obj-ptr))

;; /* 30 */ (SEE ABOVE, ALREADY DEFINED)
;; EXTERN void		TclFreeObj(Tcl_Obj *objPtr);

(defcfun ("Tcl_GetBoolean" tcl-get-boolean) :int
  "/* 31 */ EXTERN int
Tcl_GetBoolean(
  Tcl_Interp *interp, const char *src, int *intPtr);"
  (interp-ptr tcl-interp-ptr) (src :string) (int-ptr (:pointer :int)))

(defcfun ("Tcl_GetBooleanFromObj" tcl-get-boolean-from-obj) :int
  "/* 32 */ EXTERN int
Tcl_GetBooleanFromObj(
  Tcl_Interp *interp, Tcl_Obj *objPtr, int *intPtr);"
  (interp-ptr  tcl-interp-ptr)
  (obj-ptr     tcl-obj-ptr)
  (int-ptr     (:pointer :int)))

(defcfun ("Tcl_GetByteArrayFromObj" %tcl-get-byte-array-from-obj)
    (:pointer :uchar)
  "/* 33 */ EXTERN unsigned char *
Tcl_GetByteArrayFromObj(Tcl_Obj *objPtr, Tcl_Size *numBytesPtr);"
  (obj-ptr        tcl-obj-ptr)
  (num-bytes-ptr  tcl-size-ptr))

(defcfun ("Tcl_GetDouble" tcl-get-double) :int
  "/* 34 */ EXTERN int
Tcl_GetDouble(Tcl_Interp *interp, const char *src, double *doublePtr);"
  (interp-ptr tcl-interp-ptr) (src :string) (double-ptr (:pointer :double)))

(defcfun ("Tcl_GetDoubleFromObj" tcl-get-double-from-obj) :int
  "/* 35 */ EXTERN int
Tcl_GetDoubleFromObj(
  Tcl_Interp *interp, Tcl_Obj *objPtr, double *doublePtr);"
  (interp-ptr  tcl-interp-ptr)
  (obj-ptr     tcl-obj-ptr)
  (double-ptr  (:pointer :double)))

(defcfun ("Tcl_GetIndexFromObj" %tcl-get-index-from-obj) :int
  "/* Slot 36 is reserved */ DEPRECATED 9.0"
  (interp-ptr  tcl-interp-ptr)
  (table-ptr   tcl-obj-ptr)
  (msg         :string)
  (flags       :int)
  (idx-ptr     (:pointer :int)))

(defcfun ("Tcl_GetInt" tcl-get-int) :int
  "/* 37 */ EXTERN int
Tcl_GetInt(
  Tcl_Interp *interp, const char *src, int *intPtr);"
  (interp-ptr  tcl-interp-ptr)
  (src         :string)
  (int-ptr     (:pointer :int)))

(defcfun ("Tcl_GetIntFromObj" tcl-get-int-from-obj) :int
  "/* 38 */ EXTERN int
Tcl_GetIntFromObj(Tcl_Interp *interp, Tcl_Obj *objPtr, int *intPtr);"
  (interp-ptr  tcl-interp-ptr)
  (obj-ptr     tcl-obj-ptr)
  (int-ptr     (:pointer :int)))

(defcfun ("Tcl_GetLongFromObj" tcl-get-long-from-obj) :int
  "/* 39 */ EXTERN int
Tcl_GetLongFromObj(
Tcl_Interp *interp, Tcl_Obj *objPtr, long *longPtr);"
  (interp-ptr  tcl-interp-ptr)
  (obj-ptr     tcl-obj-ptr)
  (long-ptr    (:pointer :long)))

(defcfun ("Tcl_GetObjType" tcl-get-obj-type) tcl-obj-type-ptr
  "/* 40 */ EXTERN const Tcl_ObjType *
Tcl_GetObjType(const char *typeName);"
  (type-name :string))

(defcfun ("TclGetStringFromObj" tcl_get-string-from-obj) :string
  "/* 41 */ EXTERN char *
TclGetStringFromObj(Tcl_Obj *objPtr, void *lengthPtr);"
  (obj-ptr tcl-obj-ptr) (length-ptr :pointer))

(defcfun ("Tcl_InvalidateStringRep" tcl-invalidate-string-rep) :void
  "/* 42 */ EXTERN void
Tcl_InvalidateStringRep(Tcl_Obj *objPtr);"
  (obj-ptr tcl-obj-ptr))

(defcfun ("Tcl_ListObjAppendList" tcl-list-obj-append-list) :int
  "/* 43 */ EXTERN int
Tcl_ListObjAppendList(
  Tcl_Interp *interp, Tcl_Obj *listPtr, Tcl_Obj *elemListPtr);"
  (interp-ptr     tcl-interp-ptr)
  (list-ptr       tcl-obj-ptr)
  (elem-list-ptr  tcl-obj-ptr))

(defcfun ("Tcl_ListObjAppendElement" tcl-list-obj-append-element) :int
  "/* 44 */ EXTERN int
Tcl_ListObjAppendElement(
  Tcl_Interp *interp, Tcl_Obj *listPtr, Tcl_Obj *objPtr);"
  (interp-ptr  tcl-interp-ptr)
  (list-ptr    tcl-obj-ptr)
  (obj-ptr     tcl-obj-ptr))

(defcfun ("TclListObjGetElements" tcl_list-obj-get-elements) :int
  "/* 45 */ EXTERN int
TclListObjGetElements(
  Tcl_Interp *interp, Tcl_Obj *listPtr, void *objcPtr, Tcl_Obj ***objvPtr);"
  (interp-ptr  tcl-interp-ptr)
  (list-ptr    tcl-obj-ptr)
  (objc-ptr    :pointer)
  (objv-ptr    (:pointer (:pointer tcl-obj-ptr))))

(defcfun ("Tcl_ListObjIndex" tcl-list-obj-index) :int
  "/* 46 */ EXTERN int
Tcl_ListObjIndex(
  Tcl_Interp *interp,
  Tcl_Obj *listPtr, Tcl_Size index,
  Tcl_Obj **objPtrPtr);"
  (interp-ptr   tcl-interp-ptr)
  (list-ptr     tcl-obj-ptr)
  (index        tcl-size)
  (obj-ptr-ptr  (:pointer tcl-obj-ptr)))

(defcfun ("TclListObjLength" tcl_list-obj-length) :int
  "/* 47 */ EXTERN int
TclListObjLength(
  Tcl_Interp *interp, Tcl_Obj *listPtr, void *lengthPtr);"
  (interp-ptr  tcl-interp-ptr)
  (list-ptr    tcl-obj-ptr)
  (length-ptr  :pointer))

(defcfun ("Tcl_ListObjReplace" tcl-list-obj-replace) :int
  "/* 48 */ EXTERN int
Tcl_ListObjReplace(
  Tcl_Interp *interp,
  Tcl_Obj *listPtr, Tcl_Size first,
  Tcl_Size count, Tcl_Size objc,
  Tcl_Obj *const objv[]);"
  (interp-ptr tcl-interp-ptr)
  (list-ptr   tcl-obj-ptr)
  (first      tcl-size)
  (count      tcl-size)
  (objc       tcl-size)
  (objv       (:pointer tcl-obj-ptr)))

(defcfun ("Tcl_NewBooleanObj" %tcl-new-boolean-obj) tcl-obj-ptr
  "/* Slot 49 is reserved */ DEPRECATED 9.0"
  (int-val :int))

(defcfun ("Tcl_NewByteArrayObj" tcl-new-byte-array-obj) tcl-obj-ptr
  "/* 50 */ EXTERN Tcl_Obj *
Tcl_NewByteArrayObj(
  const unsigned char *bytes, Tcl_Size numBytes);"
  (bytes (:pointer :uchar) (num-bytes tcl-size)))

(defcfun ("Tcl_NewDoubleObj" tcl-new-double-obj) tcl-obj-ptr
  "/* 51 */ EXTERN Tcl_Obj *
Tcl_NewDoubleObj(double doubleValue);"
  (double-val :double))

(defcfun ("Tcl_NewIntObj" %tcl-new-int-obj) tcl-obj-ptr
  "/* Slot 52 is reserved */ DEPRECATED 9.0"
  (int-val :int))

(defcfun ("Tcl_NewListObj" tcl-new-list-obj) tcl-obj-ptr
  "/* 53 */ EXTERN Tcl_Obj *
Tcl_NewListObj(Tcl_Size objc, Tcl_Obj *const objv[]);"
  (objc tcl-size) (objv (:pointer tcl-obj-ptr)))

(defcfun ("Tcl_NewLongObj" %tcl-new-long-obj) tcl-obj-ptr
  "/* Slot 54 is reserved */ DEPRECATED 9.0"
  (long-val :long))

(defcfun ("Tcl_NewObj" tcl-new-obj) tcl-obj-ptr
  "/* 55 */ EXTERN Tcl_Obj *
Tcl_NewObj(void);")

(defcfun ("Tcl_NewStringObj" tcl-new-string-obj) tcl-obj-ptr
  "/* 56 */ EXTERN Tcl_Obj *
Tcl_NewStringObj(const char *bytes, Tcl_Size length);"
  (bytes (:pointer :char)) (length tcl-size))

(defcfun ("Tcl_SetBooleanObj" %tcl-set-boolean-obj) :void
  "/* Slot 57 is reserved */ DEPRECATED 9.0"
  (obj-ptr tcl-obj-ptr) (int-val :int))

(defcfun ("Tcl_SetByteArrayLength" tcl-set-byte-array-length)
    (:pointer :uchar)
  "/* 58 */ EXTERN unsigned char *
Tcl_SetByteArrayLength(
  Tcl_Obj *objPtr, Tcl_Size numBytes);"
  (obj-ptr tcl-obj-ptr) (num-bytes tcl-size))

(defcfun ("Tcl_SetByteArrayObj" tcl-set-byte-array-obj) :void
  "/* 59 */ EXTERN void
Tcl_SetByteArrayObj(
  Tcl_Obj *objPtr, const unsigned char *bytes, Tcl_Size numBytes);"
  (obj-ptr    tcl-obj-ptr)
  (bytes      (:pointer :uchar))
  (num-bytes  tcl-size))

(defcfun ("Tcl_SetDoubleObj" tcl-set-double-obj) :void
  "/* 60 */ EXTERN void
Tcl_SetDoubleObj(Tcl_Obj *objPtr, double doubleValue);"
  (obj-ptr tcl-obj-ptr) (double-val :double))

(defcfun ("Tcl_SetIntObj" %tcl-set-int-obj) :void
  "/* Slot 61 is reserved */ DEPRECATED 9.0"
  (obj-ptr tcl-obj-ptr) (int-val :int))

(defcfun ("Tcl_SetListObj" tcl-set-list-obj) :void
  "/* 62 */ EXTERN void
Tcl_SetListObj(
  Tcl_Obj *objPtr, Tcl_Size objc, Tcl_Obj *const objv[]);"
  (obj-ptr  tcl-obj-ptr)
  (objc     tcl-size)
  (objv     (:pointer tcl-obj-ptr)))

(defcfun ("Tcl_SetLongObj" %tcl-set-long-obj) :void
  "/* Slot 63 is reserved */ DEPRECATED 9.0"
  (obj-ptr tcl-obj-ptr) (long-val :long))

(defcfun ("Tcl_SetObjLength" tcl-set-obj-length) :void
  "/* 64 */ EXTERN void
Tcl_SetObjLength(Tcl_Obj *objPtr, Tcl_Size length);"
  (obj-ptr tcl-obj-ptr) (length tcl-size))

(defcfun ("Tcl_SetStringObj" tcl-set-string-obj) :void
  "/* 65 */ EXTERN void
Tcl_SetStringObj(
  Tcl_Obj *objPtr, const char *bytes, Tcl_Size length);"
  (obj-ptr tcl-obj-ptr) (bytes (:pointer :char)) (length tcl-size))

(defcfun ("Tcl_AddErrorInfo" %tcl-add-error-info) :void
  "/* Slot 66 is reserved */ DEPRECATED 9.0"
  (interp-ptr tcl-interp-ptr) (message :string))

(defcfun ("Tcl_AddObjErrorInfo" %tcl-add-obj-error-info) :void
  "/* Slot 67 is reserved */ DEPRECATED 9.0"
  (interp-ptr tcl-interp-ptr)
  (message :string) (length :int))

(defcfun ("Tcl_AllowExceptions" tcl-allow-exceptions) :void
  "/* 68 */ EXTERN void
Tcl_AllowExceptions(Tcl_Interp *interp);"
  (interp-ptr tcl-interp-ptr))

(defcfun ("Tcl_AppendElement" tcl-append-element) :void
  "/* 69 */ EXTERN void
Tcl_AppendElement(Tcl_Interp *interp, const char *element);"
  (interp-ptr tcl-interp-ptr)
  (element (:pointer :char)))

(defcfun ("Tcl_AppendResult" tcl-append-result) :void
  "/* 70 */ EXTERN void
Tcl_AppendResult(Tcl_Interp *interp, ...);"
  (interp-ptr tcl-interp-ptr) &rest)

(defcfun ("Tcl_AsyncCreate" tcl-async-create) tcl-async-handler
  "/* 71 */ EXTERN Tcl_AsyncHandler
Tcl_AsyncCreate(Tcl_AsyncProc *proc, void *clientData);"
  (async-proc   tcl-async-proc)
  (client-data  client-data))

(defcfun ("Tcl_AsyncDelete" tcl-async-delete) :void
  "/* 72 */ EXTERN void
Tcl_AsyncDelete(Tcl_AsyncHandler async);"
  (async-handler tcl-async-handler))

(defcfun ("Tcl_AsyncInvoke" tcl-async-invoke) :int
  "/* 73 */ EXTERN int
Tcl_AsyncInvoke(Tcl_Interp *interp, int code);"
  (interp-ptr tcl-interp-ptr) (code :int))

(defcfun ("Tcl_AsyncMark" tcl-async-mark) :void
  "/* 74 */ EXTERN void
Tcl_AsyncMark(Tcl_AsyncHandler async);"
  (async-handler tcl-async-handler))

(defcfun ("Tcl_AsyncReady" tcl-async-ready) :int
  "/* 75 */ EXTERN int
Tcl_AsyncReady(void);")

(defcfun ("Tcl_BackgroundError" %tcl-background-error) :void
  "/* Slot 76 is reserved */ DEPRECATED 9.0"
  (interp-ptr tcl-interp-ptr))

(defcfun ("Tcl_Backslash" %tcl-backslash) :char
  "/* Slot 77 is reserved */ DEPRECATED 9.0"
  (src :string) (read-ptr (:pointer :int)))

(defcfun ("Tcl_BadChannelOption" tcl-bad-channel-option) :int
  "/* 78 */ EXTERN int
Tcl_BadChannelOption(
  Tcl_Interp *interp, const char *optionName, const char *optionList);"
  (interp-ptr tcl-interp-ptr)
  (option-name :string)
  (option-list :string))

(defcfun ("Tcl_CallWhenDeleted" tcl-call-when-deleted) :void
  "/* 79 */ EXTERN void
Tcl_CallWhenDeleted(
  Tcl_Interp *interp, Tcl_InterpDeleteProc *proc, void *clientData);"
  (interp-ptr          tcl-interp-ptr)
  (interp-delete-proc  tcl-interp-delete-proc)
  (client-data         client-data))

(defcfun ("Tcl_CancelIdleCall" tcl-cancel-idle-call) :void
  "/* 80 */ EXTERN void
Tcl_CancelIdleCall(Tcl_IdleProc *idleProc, void *clientData);"
  (idle-proc    tcl-idle-proc)
  (client-data  client-data))

(defcfun ("Tcl_Close" %tcl-close) :int
  "/* 81 */ EXTERN int
Tcl_Close(Tcl_Interp *interp, Tcl_Channel chan);"
  (interp-ptr tcl-interp-ptr) (chan tcl-channel))

(defcfun ("Tcl_CommandComplete" tcl-command-complete) :int
  "/* 82 */ EXTERN int
Tcl_CommandComplete(const char *cmd);"
  (cmd :string))

(defcfun ("Tcl_Concat" tcl-concat) :string
  "/* 83 */ EXTERN char *
Tcl_Concat(Tcl_Size argc, const char *const *argv);"
  (argc tcl-size) (argv :string))

(defcfun ("Tcl_ConvertElement" tcl-convert-element) tcl-size
  "/* 84 */ EXTERN Tcl_Size
Tcl_ConvertElement(const char *src, char *dst, int flags);"
  (src :string) (dst :string) (flags :int))

(defcfun ("Tcl_ConvertCountedElement" tcl-convert-counter-element) tcl-size
  "/* 85 */ EXTERN Tcl_Size
Tcl_ConvertCountedElement(
  const char *src, Tcl_Size length, char *dst, int flags);"
  (src :string) (length tcl-size) (dst :string) (flags :int))

(defcfun ("Tcl_CreateAlias" tcl-create-alias) :int
  "/* 86 */ EXTERN int
Tcl_CreateAlias(
  Tcl_Interp *childInterp,
  const char *childCmd, Tcl_Interp *target,
  const char *targetCmd, Tcl_Size argc,
  const char *const *argv);"
  (child-interp tcl-interp-ptr)
  (child-cmd :string)
  (target tcl-interp-ptr)
  (target-cmd :string)
  (argc tcl-size)
  (argv (:pointer (:pointer :char))))

(defcfun ("Tcl_CreateAliasObj" tcl-create-alias-obj) :int
  "/* 87 */ EXTERN int
Tcl_CreateAliasObj(
  Tcl_Interp *childInterp,
  const char *childCmd, Tcl_Interp *target,
  const char *targetCmd, Tcl_Size objc,
  Tcl_Obj *const objv[]);"
  (child-interp tcl-interp-ptr)
  (child-cmd :string)
  (target tcl-interp-ptr)
  (target-cmd :string)
  (objc tcl-size)
  (objv (:pointer tcl-obj-ptr)))

(defcfun ("Tcl_CreateChannel" tcl-create-channel) tcl-channel
  "/* 88 */ EXTERN Tcl_Channel
Tcl_CreateChannel(
  const Tcl_ChannelType *typePtr,
  const char *chanName, void *instanceData, int mask);"
  (type-ptr       tcl-channel-type-ptr)
  (chan-name      :string)
  (instance-data  client-data)
  (mask           :int))

(defcfun ("Tcl_CreateChannelHandler" tcl-create-channel-handler) :void
  "/* 89 */ EXTERN void
Tcl_CreateChannelHandler(
  Tcl_Channel chan, int mask, Tcl_ChannelProc *proc, void *clientData);"
  (chan         tcl-channel)
  (mask         :int)
  (chan-proc    tcl-channel-proc)
  (client-data  client-data))

(defcfun ("Tcl_CreateCloseHandler" tcl-create-close-handler) :void
  "/* 90 */ EXTERN void
Tcl_CreateCloseHandler(
  Tcl_Channel chan,Tcl_CloseProc *proc, void *clientData);"
  (chan         tcl-channel)
  (close-proc   tcl-close-proc)
  (client-data  client-data))

(defcfun ("Tcl_CreateCommand" tcl-create-command) tcl-command
  "/* 91 */ EXTERN Tcl_Command
Tcl_CreateCommand(
  Tcl_Interp *interp,
  const char *cmdName, Tcl_CmdProc *proc,
  void *clientData, Tcl_CmdDeleteProc *deleteProc);"
  (interp-ptr       tcl-interp-ptr)
  (cmd-name         :string)
  (cmd-proc         tcl-cmd-proc)
  (client-data      client-data)
  (cmd-delete-proc  tcl-cmd-delete-proc))

(defcfun ("Tcl_CreateEventSource" tcl-create-event-source) :void
  "/* 92 */ EXTERN void
Tcl_CreateEventSource(
  Tcl_EventSetupProc *setupProc,
  Tcl_EventCheckProc *checkProc,
  void *clientData);"
  (setup-proc   tcl-event-setup-proc)
  (check-proc   tcl-event-check-proc)
  (client-data  client-data))

(defcfun ("Tcl_CreateExitHandler" tcl-create-exit-handler) :void
  "/* 93 */ EXTERN void
Tcl_CreateExitHandler(Tcl_ExitProc *proc, void *clientData);"
  (exit-proc    tcl-exit-proc)
  (client-data  client-data))

(defcfun ("Tcl_CreateInterp" tcl-create-interp) tcl-interp-ptr
  "/* 94 */ EXTERN Tcl_Interp * Tcl_CreateInterp(void);")

(defcfun ("Tcl_CreateMathFunc" %tcl-create-math-func) :void
  "/* Slot 95 is reserved */ DEPRECATED 9.0"
  (interp-ptr   tcl-interp-ptr)
  (name         :string)
  (num-args     :int)
  (arg-types    tcl-value-type-ptr)
  (math-proc    tcl-math-proc)
  (client-data  client-data))

(defcfun ("Tcl_CreateObjCommand" tcl-create-obj-command) tcl-command
  "/* 96 */ EXTERN Tcl_Command
Tcl_CreateObjCommand(
  Tcl_Interp *interp,
  const char *cmdName, Tcl_ObjCmdProc *proc,
  void *clientData,
  Tcl_CmdDeleteProc *deleteProc);"
  (interp-ptr       tcl-interp-ptr)
  (cmd-name         :string)
  (obj-cmd-proc     tcl-obj-cmd-proc)
  (client-data      client-data)
  (cmd-delete-proc  tcl-cmd-delete-proc))

(defcfun ("Tcl_CreateChild" tcl-create-child) tcl-interp-ptr
  "/* 97 */ EXTERN Tcl_Interp *
Tcl_CreateChild(
  Tcl_Interp *interp, const char *name, int isSafe);"
  (interp-ptr  tcl-interp-ptr)
  (name        :string)
  (is-safe     :int))

(defcfun ("Tcl_CreateTimerHandler" tcl-create-timer-handler) tcl-timer-token
  "/* 98 */ EXTERN Tcl_TimerToken
Tcl_CreateTimerHandler(
  int milliseconds, Tcl_TimerProc *proc, void *clientData);"
  (milliseconds :int)
  (timer-proc   tcl-timer-proc)
  (client-data  client-data))

(defcfun ("Tcl_CreateTrace" tcl-create-trace) tcl-trace
  "/* 99 */ EXTERN Tcl_Trace
Tcl_CreateTrace(
  Tcl_Interp *interp, Tcl_Size level,
  Tcl_CmdTraceProc *proc, void *clientData);"
  (interp-ptr     tcl-interp-ptr)
  (level          tcl-size)
  (cmd-trace-proc tcl-cmd-trace-proc)
  (client-data    client-data))

(defcfun ("Tcl_DeleteAssocData" tcl-delete-assoc-data) :void
  "/* 100 */ EXTERN void
Tcl_DeleteAssocData(Tcl_Interp *interp, const char *name);"
  (interp-ptr  tcl-interp-ptr)
  (name        :string))

(defcfun ("Tcl_DeleteChannelHandler" tcl-delete-channel-handler) :void
  "/* 101 */ EXTERN void
Tcl_DeleteChannelHandler(
  Tcl_Channel chan, Tcl_ChannelProc *proc, void *clientData);"
  (chan         tcl-channel)
  (chan-proc    tcl-channel-proc)
  (client-data  client-data))

(defcfun ("Tcl_DeleteCloseHandler" tcl-delete-close-handler) :void
  "/* 102 */ EXTERN void
Tcl_DeleteCloseHandler(
  Tcl_Channel chan, Tcl_CloseProc *proc, void *clientData);"
  (chan         tcl-channel)
  (close-proc   tcl-close-proc)
  (client-data  client-data))

(defcfun ("Tcl_DeleteCommand" tcl-delete-command) :int
  "/* 103 */ EXTERN int
Tcl_DeleteCommand(Tcl_Interp *interp, const char *cmdName);"
  (interp-ptr  tcl-interp-ptr)
  (cmd-name    :string))

(defcfun ("Tcl_DeleteCommandFromToken" tcl-delete-command-from-token) :int
  "/* 104 */ EXTERN int
Tcl_DeleteCommandFromToken(Tcl_Interp *interp, Tcl_Command command);"
  (interp-ptr  tcl-interp-ptr)
  (command     tcl-command))

(defcfun ("Tcl_DeleteEvents" tcl-delete-events) :void
  "/* 105 */ EXTERN void
Tcl_DeleteEvents(Tcl_EventDeleteProc *proc, void *clientData);"
  (evt-delete-proc  tcl-event-delete-proc)
  (client-data      client-data))

(defcfun ("Tcl_DeleteEventSource" tcl-delete-event-source) :void
  "/* 106 */ EXTERN void
Tcl_DeleteEventSource(
  Tcl_EventSetupProc *setupProc,
  Tcl_EventCheckProc *checkProc,
  void *clientData);"
  (evt-setup-proc  tcl-event-setup-proc)
  (evt-check-proc  tcl-event-check-proc)
  (client-data     client-data))

(defcfun ("Tcl_DeleteExitHandler" tcl-delete-exit-handler) :void
  "/* 107 */ EXTERN void
Tcl_DeleteExitHandler(Tcl_ExitProc *proc, void *clientData);"
  (exit-proc    tcl-exit-proc)
  (client-data  client-data))

(defcfun ("Tcl_DeleteHashEntry" tcl-delete-hash-entry) :void
  "/* 108 */ EXTERN void
Tcl_DeleteHashEntry(Tcl_HashEntry *entryPtr);"
  (hash-entry-ptr tcl-hash-entry-ptr))

(defcfun ("Tcl_DeleteHashTable" tcl-delete-hash-table) :void
  "/* 109 */ EXTERN void
Tcl_DeleteHashTable(Tcl_HashTable *tablePtr);"
  (hash-table-ptr tcl-hash-table-ptr))

(defcfun ("Tcl_DeleteInterp" tcl-delete-interp) :void
  "/* 110 */ EXTERN void Tcl_DeleteInterp(Tcl_Interp *interp);"
  (interp-ptr tcl-interp-ptr))

(defcfun ("Tcl_DetachPids" tcl-detach-pids) :void
  "/* 111 */ EXTERN void
Tcl_DetachPids(Tcl_Size numPids, Tcl_Pid *pidPtr);"
  (num-pids tcl-size) (pid-ptr tcl-pid-ptr))

(defcfun ("Tcl_DeleteTimerHandler" tcl-delete-timer-handler) :void
  "/* 112 */ EXTERN void
Tcl_DeleteTimerHandler(Tcl_TimerToken token);"
  (timer-token tcl-timer-token))

(defcfun ("Tcl_DeleteTrace" tcl-delete-trace) :void
  "/* 113 */ EXTERN void
Tcl_DeleteTrace(Tcl_Interp *interp, Tcl_Trace trace);"
  (interp-ptr  tcl-interp-ptr)
  (trace       tcl-trace))

(defcfun ("Tcl_DontCallWhenDeleted" tcl-dont-call-when-deleted) :void
  "/* 114 */ EXTERN void
Tcl_DontCallWhenDeleted(
  Tcl_Interp *interp, Tcl_InterpDeleteProc *proc, void *clientData);"
  (interp-ptr          tcl-interp-ptr)
  (interp-delete-proc  tcl-interp-delete-proc)
  (client-data         client-data))

(defcfun ("Tcl_DoOneEvent" tcl-do-one-event) :int
  "/* 115 */ EXTERN int Tcl_DoOneEvent(int flags);"
  (flags :int))

(defcfun ("Tcl_DoWhenIdle" tcl-do-when-idle) :void
  "/* 116 */ EXTERN void
Tcl_DoWhenIdle(Tcl_IdleProc *proc, void *clientData);"
  (idle-proc    tcl-idle-proc)
  (client-data  client-data))

(defcfun ("Tcl_DStringAppend" tcl-d-string-append) :string
  "/* 117 */ EXTERN char *
Tcl_DStringAppend(
  Tcl_DString *dsPtr, const char *bytes, Tcl_Size length);"
  (ds-ptr  tcl-d-string-ptr)
  (bytes   (:pointer :char))
  (length  tcl-size))

(defcfun ("Tcl_DStringAppendElement" tcl-d-string-append-element) :string
  "/* 118 */ EXTERN char *
Tcl_DStringAppendElement(Tcl_DString *dsPtr, const char *element);"
  (ds-ptr   tcl-d-string-ptr)
  (element  (:pointer :char)))

(defcfun ("Tcl_DStringEndSublist" tcl-d-string-end-sublist) :void
  "/* 119 */ EXTERN void
Tcl_DStringEndSublist(Tcl_DString *dsPtr);"
  (ds-ptr  tcl-d-string-ptr))

(defcfun ("Tcl_DStringFree" tcl-d-string-free) :void
  "/* 120 */ EXTERN void Tcl_DStringFree(Tcl_DString *dsPtr);"
  (ds-ptr  tcl-d-string-ptr))

(defcfun ("Tcl_DStringGetResult" tcl-d-string-get-result) :void
  "/* 121 */ EXTERN void
Tcl_DStringGetResult(Tcl_Interp *interp, Tcl_DString *dsPtr);"
  (interp-ptr  tcl-interp-ptr)
  (ds-ptr      tcl-d-string-ptr))

(defcfun ("Tcl_DStringInit" tcl-d-string-init) :void
  "/* 122 */ EXTERN void Tcl_DStringInit(Tcl_DString *dsPtr);"
  (ds-ptr tcl-d-string-ptr))

(defcfun ("Tcl_DStringResult" tcl-d-string-result) :void
  "/* 123 */ EXTERN void
Tcl_DStringResult(Tcl_Interp *interp, Tcl_DString *dsPtr);"
  (interp-ptr tcl-interp-ptr) (ds-ptr tcl-d-string-ptr))

(defcfun ("Tcl_DStringSetLength" tcl-d-string-set-length) :void
  "/* 124 */ EXTERN void
Tcl_DStringSetLength(Tcl_DString *dsPtr, Tcl_Size length);"
  (ds-ptr tcl-d-string-ptr) (length tcl-size))

(defcfun ("Tcl_DStringStartSublist" tcl-d-string-start-sublist) :void
  "/* 125 */ EXTERN void
Tcl_DStringStartSublist(Tcl_DString *dsPtr);"
  (ds-ptr tcl-d-string-ptr))

(defcfun ("Tcl_Eof" tcl-eof) :int
  "/* 126 */ EXTERN int
Tcl_Eof(Tcl_Channel chan);"
  (chan tcl-channel))

(defcfun ("Tcl_ErrnoId" tcl-errno-id) :string
  "/* 127 */ EXTERN const char * Tcl_ErrnoId(void);")

(defcfun ("Tcl_ErrnoMsg" tcl-errno-msg) :string
  "/* 128 */ EXTERN const char * Tcl_ErrnoMsg(int err);"
  (err :int))

(defcfun ("Tcl_Eval" %tcl-eval) :int
  "/* Slot 129 is reserved */ DEPRECATED 9.0"
  (interp-ptr tcl-interp-ptr)
  (script :string))

(defcfun ("Tcl_EvalFile" tcl-eval-file) :int
  "/* 130 */ EXTERN int
Tcl_EvalFile(Tcl_Interp *interp, const char *fileName);"
  (interp-ptr tcl-interp-ptr)
  (file-name :string))

(defcfun ("Tcl_EvalObj" %tcl-eval-obj) :int
  "/* Slot 131 is reserved */ DEPRECATED 9.0"
  (interp-ptr tcl-interp-ptr) (obj-ptr :pointer))

(defcfun ("Tcl_EventuallyFree" tcl-eventually-free) :void
  "/* 132 */ EXTERN void
Tcl_EventuallyFree(void *clientData, Tcl_FreeProc *freeProc);"
  (client-data  client-data)
  (free-proc    tcl-free-proc))

(defcfun ("Tcl_Exit" tcl-exit) :void
  "/* 133 */ EXTERN TCL_NORETURN void Tcl_Exit(int status);"
  (status :int))

(defcfun ("Tcl_ExposeCommand" tcl-expose-command) :int
  "/* 134 */ EXTERN int
Tcl_ExposeCommand(
  Tcl_Interp *interp, const char *hiddenCmdToken, const char *cmdName);"
  (interp-ptr       tcl-interp-ptr)
  (hidden-cmd-token :string)
  (cmd-name         :string))

(defcfun ("Tcl_ExprBoolean" tcl-expr-boolean) :int
  "/* 135 */ EXTERN int
Tcl_ExprBoolean(Tcl_Interp *interp, const char *expr, int *ptr);"
  (interp-ptr tcl-interp-ptr)
  (expr :string)
  (ptr  (:pointer :int)))

(defcfun ("Tcl_ExprBooleanObj" tcl-expr-boolean-obj) :int
  "/* 136 */ EXTERN int
Tcl_ExprBooleanObj(Tcl_Interp *interp, Tcl_Obj *objPtr, int *ptr);"
  (interp-ptr tcl-interp-ptr)
  (obj-ptr    tcl-obj-ptr)
  (ptr        (:pointer :int)))

(defcfun ("Tcl_ExprDouble" tcl-expr-double) :int
  "/* 137 */ EXTERN int
Tcl_ExprDouble(Tcl_Interp *interp, const char *expr, double *ptr);"
  (interp-ptr tcl-interp-ptr)
  (expr       :string)
  (ptr        (:pointer :double)))

(defcfun ("Tcl_ExprDoubleObj" tcl-expr-double-obj) :int
  "/* 138 */ EXTERN int
Tcl_ExprDoubleObj(Tcl_Interp *interp, Tcl_Obj *objPtr, double *ptr);"
  (interp-ptr tcl-interp-ptr)
  (obj-ptr    tcl-obj-ptr)
  (ptr        (:pointer :double)))

(defcfun ("Tcl_ExprLong" tcl-expr-long) :int
  "/* 139 */ EXTERN int
Tcl_ExprLong(Tcl_Interp *interp, const char *expr, long *ptr);"
  (interp-ptr tcl-interp-ptr)
  (expr       :string)
  (ptr        (:pointer :long)))

(defcfun ("Tcl_ExprLongObj" tcl-expr-long-obj) :int
  "/* 140 */ EXTERN int
Tcl_ExprLongObj(Tcl_Interp *interp, Tcl_Obj *objPtr, long *ptr);"
  (interp-ptr tcl-interp-ptr)
  (obj-ptr    tcl-obj-ptr)
  (ptr        (:pointer :long)))

(defcfun ("Tcl_ExprObj" tcl-expr-obj) :int
  "/* 141 */ EXTERN int
Tcl_ExprObj(Tcl_Interp *interp, Tcl_Obj *objPtr, Tcl_Obj **resultPtrPtr);"
  (interp-ptr      tcl-interp-ptr)
  (obj-ptr         tcl-obj-ptr)
  (result-ptr-ptr  (:pointer tcl-obj-ptr)))

(defcfun ("Tcl_ExprString" tcl-expr-string) :int
  "/* 142 */ EXTERN int
Tcl_ExprString(Tcl_Interp *interp, const char *expr);"
  (interp-ptr tcl-interp-ptr)
  (expr       :string))

(defcfun ("Tcl_Finalize" tcl-finalize) :void
  "/* 143 */ EXTERN void Tcl_Finalize(void);")

(defcfun ("Tcl_FindExecutable" %tcl-find-executable) :void
  "/* Slot 144 is reserved */ DEPRECATED 9.0"
  (argv0 :string))

(defcfun ("Tcl_FirstHashEntry" tcl-first-hash-entry) tcl-hash-entry-ptr
  "/* 145 */ EXTERN Tcl_HashEntry *
Tcl_FirstHashEntry(Tcl_HashTable *tablePtr, Tcl_HashSearch *searchPtr);"
  (table-ptr  tcl-hash-table-ptr)
  (search-ptr tcl-hash-search-ptr))

(defcfun ("Tcl_Flush" tcl-flush) :int
  "/* 146 */ EXTERN int Tcl_Flush(Tcl_Channel chan);"
  (chan tcl-channel))

(defcfun ("Tcl_FreeResult" %tcl-free-result) :void
  "/* Slot 147 is reserved */ DEPRECATED 9.0"
  (interp-ptr tcl-interp-ptr))

(defcfun ("Tcl_GetAlias" %tcl-get-alias) :int
  "/* Slot 148 is reserved */ DEPRECATED 9.0"
  (interp                tcl-interp-ptr)
  (child-cmd             :string)
  (target-interp-ptr-ptr (:pointer tcl-interp-ptr))
  (target-cmd-ptr        (:pointer (:pointer :char)))
  (argc-ptr              (:pointer :int))
  (argv-ptr              (:pointer (:pointer (:pointer :char)))))

(defcfun ("TclGetAliasObj" tcl_get-alias-obj) :int
  "/* 149 */ EXTERN int
TclGetAliasObj(
  Tcl_Interp *interp, const char *childCmd,
  Tcl_Interp **targetInterpPtr, const char **targetCmdPtr,
   int *objcPtr, Tcl_Obj ***objvPtr);"
  (interp                tcl-interp-ptr)
  (child-cmd             :string)
  (target-interp-ptr-ptr (:pointer tcl-interp-ptr))
  (target-cmd-ptr        (:pointer (:pointer :char)))
  (objc-ptr              (:pointer :int))
  (objv-ptr              (:pointer (:pointer tcl-obj-ptr))))

(defcfun ("Tcl_GetAssocData" tcl-get-assoc-data) client-data
  "/* 150 */ EXTERN void *
Tcl_GetAssocData(
  Tcl_Interp *interp, const char *name, Tcl_InterpDeleteProc **procPtr);"
  (interp-ptr         tcl-interp-ptr)
  (name               :string)
  (interp-delete-proc (:pointer tcl-interp-delete-proc)))

(defcfun ("Tcl_GetChannel" tcl-get-channel) tcl-channel
  "/* 151 */ EXTERN Tcl_Channel
Tcl_GetChannel(Tcl_Interp *interp, const char *chanName, int *modePtr);"
  (interp-ptr tcl-interp-ptr)
  (chan-name  :string)
  (mod-ptr    (:pointer :int)))

(defcfun ("Tcl_GetChannelBufferSize" tcl-get-channel-buffer-size) tcl-size
  "/* 152 */ EXTERN Tcl_Size
Tcl_GetChannelBufferSize(Tcl_Channel chan);"
  (chan tcl-channel))

(defcfun ("Tcl_GetChannelHandle" tcl-get-channel-handle) :int
  "/* 153 */ EXTERN int
Tcl_GetChannelHandle(Tcl_Channel chan, int direction, void **handlePtr);"
  (chan       tcl-channel)
  (direction  :int)
  (handle-ptr (:pointer :pointer)))

(defcfun ("Tcl_GetChannelInstanceData" tcl-get-channel-instance-data) client-data
  "/* 154 */ EXTERN void * Tcl_GetChannelInstanceData(Tcl_Channel chan);"
  (chan tcl-channel))

(defcfun ("Tcl_GetChannelMode" tcl-get-channel-mode) :int
  "/* 155 */ EXTERN int Tcl_GetChannelMode(Tcl_Channel chan);"
  (chan tcl-channel))

(defcfun ("Tcl_GetChannelName" tcl-get-channel-name) :string
  "/* 156 */ EXTERN const char * Tcl_GetChannelName(Tcl_Channel chan);"
  (chan tcl-channel))

(defcfun ("Tcl_GetChannelOption" tcl-get-channel-option) :int
  "/* 157 */ EXTERN int
Tcl_GetChannelOption(
  Tcl_Interp *interp, Tcl_Channel chan,
  const char *optionName, Tcl_DString *dsPtr);"
  (interp-ptr   tcl-interp-ptr)
  (chan         tcl-channel)
  (option-name  :string)
  (ds-ptr       tcl-d-string-ptr))

(defcfun ("Tcl_GetChannelType" tcl-get-channel-type) tcl-channel-type-ptr
  "/* 158 */ EXTERN const Tcl_ChannelType *
Tcl_GetChannelType(Tcl_Channel chan);"
  (chan tcl-channel))

(defcfun ("Tcl_GetCommandInfo" tcl-get-command-info) :int
  "/* 159 */ EXTERN int
Tcl_GetCommandInfo(
  Tcl_Interp *interp, const char *cmdName, Tcl_CmdInfo *infoPtr);"
  (interp-ptr tcl-interp-ptr)
  (cmd-name   :string)
  (info-ptr   tcl-cmd-info-ptr))

(defcfun ("Tcl_GetCommandName" tcl-get-command-name) :string
  "/* 160 */ EXTERN const char *
Tcl_GetCommandName(Tcl_Interp *interp, Tcl_Command command);"
  (interp-ptr tcl-interp-ptr)
  (command    tcl-command))

(defcfun ("Tcl_GetErrno" tcl-get-errno) :int
  "/* 161 */ EXTERN int Tcl_GetErrno(void);")

(defcfun ("Tcl_GetHostName" tcl-get-host-name) :string
  "/* 162 */ EXTERN const char * Tcl_GetHostName(void);")

(defcfun ("Tcl_GetInterpPath" tcl-get-interp-path) :int
  "/* 163 */ EXTERN int
Tcl_GetInterpPath(Tcl_Interp *interp, Tcl_Interp *childInterp);"
  (interp-ptr       tcl-interp-ptr)
  (child-interp-ptr tcl-interp-ptr))

(defcfun ("Tcl_GetParent" tcl-get-parent) tcl-interp-ptr
  "/* 164 */ EXTERN Tcl_Interp * Tcl_GetParent(Tcl_Interp *interp);"
  (interp-ptr tcl-interp-ptr))

(defcfun ("Tcl_GetNameOfExecutable" tcl-get-name-of-executalble) :string
  "/* 165 */ EXTERN const char * Tcl_GetNameOfExecutable(void);")

(defcfun ("Tcl_GetObjResult" tcl-get-obj-result) tcl-obj-ptr
  "/* 166 */ EXTERN Tcl_Obj * Tcl_GetObjResult(Tcl_Interp *interp);"
  (interp-ptr tcl-interp-ptr))

(defcfun ("Tcl_GetOpenFile" tcl-get-open-file) :int
  "/* 167 */ EXTERN int
Tcl_GetOpenFile(
  Tcl_Interp *interp, const char *chanID,
  int forWriting, int checkUsage, void **filePtr);"
  (interp-ptr   tcl-interp-ptr)
  (chan-id      :string)
  (for-writing  :int)
  (check-usage  :int)
  (client-data  (:pointer client-data)))

(defcfun ("Tcl_GetPathType" tcl-get-path-type) tcl-path-type
  "/* 168 */ EXTERN Tcl_PathType Tcl_GetPathType(const char *path);"
  (path :string))

(defcfun ("Tcl_Gets" tcl-gets) tcl-size
  "/* 169 */ EXTERN Tcl_Size Tcl_Gets(Tcl_Channel chan, Tcl_DString *dsPtr);"
  (chan    tcl-channel)
  (ds-ptr  tcl-d-string-ptr))

(defcfun ("Tcl_GetsObj" tcl-gets-obj) tcl-size
  "/* 170 */ EXTERN Tcl_Size Tcl_GetsObj(Tcl_Channel chan, Tcl_Obj *objPtr);"
  (chan    tcl-channel)
  (obj-ptr tcl-obj-ptr))

(defcfun ("Tcl_GetServiceMode" tcl-get-service-mode) :int
  "/* 171 */ EXTERN int Tcl_GetServiceMode(void);")

(defcfun ("Tcl_GetChild" tcl-get-child) tcl-interp-ptr
  "/* 172 */ EXTERN Tcl_Interp *
Tcl_GetChild(Tcl_Interp *interp, const char *name);"
  (interp-ptr tcl-interp-ptr)
  (name       :string))

(defcfun ("Tcl_GetStdChannel" tcl-get-std-channel) tcl-channel
  "/* 173 */ EXTERN Tcl_Channel Tcl_GetStdChannel(int type);"
  (type :int))

(defcfun ("Tcl_GetStringResult" %tcl-get-string-result) :string
  "/* Slot 174 is reserved */ DEPRECATED 9.0"
  (interp-ptr tcl-interp-ptr))

(defcfun ("Tcl_GetVar" %tcl-get-var) :string
  "/* Slot 175 is reserved */ DEPRECATED 9.0"
  (interp-ptr tcl-interp-ptr)
  (var-name   :string)
  (flags      :int))

(defcfun ("Tcl_GetVar2" tcl-get-var2) :string
  "/* 176 */ EXTERN const char *
Tcl_GetVar2(Tcl_Interp *interp, const char *part1, const char *part2, int flags);"
  (interp-ptr tcl-interp-ptr)
  (part1      :string)
  (part2      :string)
  (flags      :int))

(defcfun ("Tcl_GlobalEval" %tcl-global-eval) :int
  "/* Slot 177 is reserved */ DEPRECATED 9.0"
  (interp-ptr tcl-interp-ptr)
  (command    :string))

(defcfun ("Tcl_GlobalEvalObj" %tcl-global-eval-obj) :int
  "/* Slot 178 is reserved */ DEPRECATED 9.0"
  (interp-ptr tcl-interp-ptr)
  (obj-ptr    tcl-obj-ptr))

(defcfun ("Tcl_HideCommand" tcl-hide-command) :int
  "/* 179 */ EXTERN int
Tcl_HideCommand(
  Tcl_Interp *interp, const char *cmdName, const char *hiddenCmdToken);"
  (interp-ptr        tcl-interp-ptr)
  (cmd-name          :string)
  (hidden-cmd-token  :string))

(defcfun ("Tcl_Init" tcl-init) :int
  "/* 180 */ EXTERN int Tcl_Init(Tcl_Interp *interp);"
  (interp-ptr tcl-interp-ptr))

(defcfun ("Tcl_InitHashTable" tcl-init-hash-table) :void
  "/* 181 */ EXTERN void Tcl_InitHashTable(Tcl_HashTable *tablePtr, int keyType);"
  (table-ptr  tcl-hash-table-ptr)
  (key-type   :int))

(defcfun ("Tcl_InputBlocked" tcl-input-blocked) :int
  "/* 182 */ EXTERN int Tcl_InputBlocked(Tcl_Channel chan);"
  (chan tcl-channel))

(defcfun ("Tcl_InputBuffered" tcl-input-buffered) :int
  "/* 183 */ EXTERN int Tcl_InputBuffered(Tcl_Channel chan);"
  (chan tcl-channel))

(defcfun ("Tcl_InterpDeleted" tcl-interp-deleted) :int
  "/* 184 */ EXTERN int Tcl_InterpDeleted(Tcl_Interp *interp);"
  (interp-ptr tcl-interp-ptr))

(defcfun ("Tcl_IsSafe" tcl-is-safe) :int
  "/* 185 */ EXTERN int Tcl_IsSafe(Tcl_Interp *interp);"
  (interp-ptr tcl-interp-ptr))

(defcfun ("Tcl_JoinPath" tcl-join-path) :string
  "/* 186 */ EXTERN char *
Tcl_JoinPath(
  Tcl_Size argc, const char *const *argv, Tcl_DString *resultPtr);
"
  (argc       tcl-size)
  (argv       (:pointer (:pointer :char)))
  (result-ptr tcl-d-string-ptr))

(defcfun ("Tcl_LinkVar" tcl-link-var) :int
  "/* 187 */ EXTERN int
Tcl_LinkVar(Tcl_Interp *interp, const char *varName, void *addr, int type);"
  (interp-ptr tcl-interp-ptr)
  (var-name   :string)
  (addr       :string)
  (type       :int))

;; /* Slot 188 is reserved */

(defcfun ("Tcl_MakeFileChannel" tcl-make-file-channel) tcl-channel
  "/* 189 */ EXTERN Tcl_Channel Tcl_MakeFileChannel(void *handle, int mode);"
  (handle client-data)
  (mode   :int))

(defcfun ("Tcl_MakeSafe" %tcl-make-safe) :int
  "/* Slot 190 is reserved */ DEPRECATED 9.0"
  (interp-ptr tcl-interp-ptr))

(defcfun ("Tcl_MakeTcpClientChannel" tcl-make-tcp-client-channel) tcl-channel
  "/* 191 */ EXTERN Tcl_Channel	Tcl_MakeTcpClientChannel(void *tcpSocket);"
  (tcl-socket client-data))

(defcfun ("Tcl_Merge" tcl-merge) :string
  "/* 192 */ EXTERN char * Tcl_Merge(Tcl_Size argc, const char *const *argv);"
  (argc tcl-size)
  (argv (:pointer (:pointer :char))))

(defcfun ("Tcl_NextHashEntry" tcl-next-hash-entry) tcl-hash-entry-ptr
  "/* 193 */ EXTERN Tcl_HashEntry *
Tcl_NextHashEntry(Tcl_HashSearch *searchPtr);"
  (search-ptr tcl-hash-search-ptr))

(defcfun ("Tcl_NotifyChannel" tcl-notify-channel) :void
  "/* 194 */ EXTERN void Tcl_NotifyChannel(Tcl_Channel channel, int mask);"
  (chan tcl-channel) (mask :int))

(defcfun ("Tcl_ObjGetVar2" tcl-obj-get-var2) tcl-obj-ptr
  "/* 195 */ EXTERN Tcl_Obj *
Tcl_ObjGetVar2(Tcl_Interp *interp, Tcl_Obj *part1Ptr, Tcl_Obj *part2Ptr, int flags);"
  (interp-ptr tcl-interp-ptr)
  (part-1-ptr tcl-obj-ptr)
  (part-2-ptr tcl-obj-ptr)
  (flags      :int))

(defcfun ("Tcl_ObjSetVar2" tcl-obj-set-var2) tcl-obj-ptr
  "/* 196 */ EXTERN Tcl_Obj *
Tcl_ObjSetVar2(
  Tcl_Interp *interp, Tcl_Obj *part1Ptr,
  Tcl_Obj *part2Ptr, Tcl_Obj *newValuePtr,
  int flags);"
  (interp-ptr  tcl-interp-ptr)
  (part-1-ptr  tcl-obj-ptr)
  (part-2-ptr  tcl-obj-ptr)
  (new-val-ptr tcl-obj-ptr)
  (flags       :int))

(defcfun ("Tcl_OpenCommandChannel" tcl-open-command-channel) tcl-channel
  "/* 197 */ EXTERN Tcl_Channel
Tcl_OpenCommandChannel(
  Tcl_Interp *interp, Tcl_Size argc, const char **argv, int flags);"
  (interp-ptr tcl-interp-ptr)
  (argc       tcl-size)
  (argv       (:pointer (:pointer :char)))
  (flags      :int))

(defcfun ("Tcl_OpenFileChannel" tcl-open-file-channel) tcl-channel
  "/* 198 */ EXTERN Tcl_Channel
Tcl_OpenFileChannel(
  Tcl_Interp *interp, const char *fileName,
  const char *modeString, int permissions);"
  (interp-ptr  tcl-interp-ptr)
  (file-name   :string)
  (mode-string :string)
  (permissions :int))

(defcfun ("Tcl_OpenTcpClient" tcl-open-tcp-client) tcl-channel
  "/* 199 */ EXTERN Tcl_Channel
Tcl_OpenTcpClient(
  Tcl_Interp *interp, int port,
  const char *address, const char *myaddr,
  int myport, int flags);"
  (interp-ptr tcl-interp-ptr)
  (port       :int)
  (address    :string)
  (my-addr    :string)
  (my-port    :int)
  (flags      :int))

(defcfun ("Tcl_OpenTcpServer" tcl-open-tcp-server) tcl-channel
  "/* 200 */ EXTERN Tcl_Channel
Tcl_OpenTcpServer(
  Tcl_Interp *interp, int port, const char *host,
  Tcl_TcpAcceptProc *acceptProc, void *callbackData);"
  (interp-ptr     tcl-interp-ptr)
  (port           :int)
  (host           :string)
  (accept-proc    tcl-tcp-accept-proc)
  (callback-data  client-data))

(defcfun ("Tcl_Preserve" tcl-preserve) :void
  "/* 201 */ EXTERN void Tcl_Preserve(void *data);"
  (data client-data))

(defcfun ("Tcl_PrintDouble" tcl-print-double) :void
  "/* 202 */ EXTERN void
Tcl_PrintDouble(Tcl_Interp *interp, double value, char *dst);"
  (interp-ptr tcl-interp-ptr)
  (value      :double)
  (dst        :string))

(defcfun ("Tcl_PutEnv" tcl-put-env) :int
  "/* 203 */ EXTERN int Tcl_PutEnv(const char *assignment);"
  (assignment :string))

(defcfun ("Tcl_PosixError" tcl-posix-error) :string
  "/* 204 */ EXTERN const char * Tcl_PosixError(Tcl_Interp *interp);"
  (interp-ptr tcl-interp-ptr))

(defcfun ("Tcl_QueueEvent" tcl-queue-event) :void
  "/* 205 */ EXTERN void Tcl_QueueEvent(Tcl_Event *evPtr, int position);"
  (ev-ptr   tcl-event-ptr)
  (position :int))

(defcfun ("Tcl_Read" tcl-read) tcl-size
  "/* 206 */ EXTERN Tcl_Size
Tcl_Read(Tcl_Channel chan, char *bufPtr, Tcl_Size toRead);"
  (chan    tcl-channel)
  (buf-ptr (:pointer :char))
  (to-rad  tcl-size))

(defcfun ("Tcl_ReapDetachedProcs" tcl-reap-detached-procs) :void
  "/* 207 */ EXTERN void Tcl_ReapDetachedProcs(void);")

(defcfun ("Tcl_RecordAndEval" tcl-record-and-eval) :int
  "/* 208 */ EXTERN int
Tcl_RecordAndEval(Tcl_Interp *interp, const char *cmd, int flags);"
  (interp-ptr tcl-interp-ptr)
  (cmd        :string)
  (flags      :int))

(defcfun ("Tcl_RecordAndEvalObj" tcl-record-and-eval-obj) :int
  "/* 209 */ EXTERN int
Tcl_RecordAndEvalObj(Tcl_Interp *interp, Tcl_Obj *cmdPtr, int flags);"
  (interp-ptr tcl-interp-ptr)
  (cmd-ptr    tcl-obj-ptr)
  (flags      :int))

(defcfun ("Tcl_RegisterChannel" tcl-register-channel) :void
  "/* 210 */ EXTERN void
Tcl_RegisterChannel(Tcl_Interp *interp, Tcl_Channel chan);"
  (interp-ptr tcl-interp-ptr)
  (chan       tcl-channel))

(defcfun ("Tcl_RegisterObjType" tcl-register-obj-type) :void
  "/* 211 */ EXTERN void Tcl_RegisterObjType(const Tcl_ObjType *typePtr);"
  (type-ptr tcl-obj-type-ptr))

(defcfun ("Tcl_RegExpCompile" tcl-reg-exp-compile) tcl-reg-exp
  "/* 212 */ EXTERN Tcl_RegExp
Tcl_RegExpCompile(Tcl_Interp *interp, const char *pattern);"
  (interp-ptr tcl-interp-ptr) (patter :string))

(defcfun ("Tcl_RegExpExec" tcl-reg-exp-exec) :int
  "/* 213 */ EXTERN int
Tcl_RegExpExec(
  Tcl_Interp *interp, Tcl_RegExp regexp, const char *text, const char *start);"
  (interp-ptr tcl-interp-ptr)
  (regexp     tcl-reg-exp)
  (text       (:pointer :char))
  (start      (:pointer :char)))

(defcfun ("Tcl_RegExpMatch" tcl-reg-exp-match) :int
  "/* 214 */ EXTERN int
Tcl_RegExpMatch(Tcl_Interp *interp, const char *text, const char *pattern);"
  (interp-ptr tcl-interp-ptr)
  (text       :string)
  (pattern    :string))

(defcfun ("Tcl_RegExpRange" tcl-reg-exp-range) :void
  "/* 215 */ EXTERN void
Tcl_RegExpRange(
  Tcl_RegExp regexp, Tcl_Size index,
  const char **startPtr, const char **endPtr);"
  (interp-ptr tcl-interp-ptr)
  (index      tcl-size)
  (start-ptr  (:pointer (:pointer :char)))
  (end-ptr    (:pointer (:pointer :char))))

(defcfun ("Tcl_Release" tcl-release) :void
  "/* 216 */ EXTERN void Tcl_Release(void *clientData);"
  (client-data client-data))

(defcfun ("Tcl_ResetResult" tcl-reset-result) :void
  "/* 217 */ EXTERN void Tcl_ResetResult(Tcl_Interp *interp);"
  (interp-ptr tcl-interp-ptr))

(defcfun ("Tcl_ScanElement" tcl-scan-element) tcl-size
  "/* 218 */ EXTERN Tcl_Size Tcl_ScanElement(const char *src, int *flagPtr);"
  (src      :string)
  (flag-ptr (:pointer :int)))

(defcfun ("Tcl_ScanCountedElement" tcl-scan-counted-element) tcl-size
  "/* 219 */ EXTERN Tcl_Size
Tcl_ScanCountedElement(const char *src, Tcl_Size length, int *flagPtr);"
  (src      :string)
  (length   tcl-size)
  (flag-ptr (:pointer :int)))

(defcfun ("Tcl_SeekOld" %tcl-seek-old) :int
  "/* Slot 220 is reserved */ DEPRECATED 9.0"
  (chan   :pointer) (offset :int) (mode   :int))

(defcfun ("Tcl_ServiceAll" tcl-service-all) :int
  "/* 221 */ EXTERN int Tcl_ServiceAll(void);")

(defcfun ("Tcl_ServiceEvent" tcl-service-event) :int
  "/* 222 */ EXTERN int Tcl_ServiceEvent(int flags);"
  (flags :int))

(defcfun ("Tcl_SetAssocData" tcl-set-assoc-data) :void
  "/* 223 */ EXTERN void
Tcl_SetAssocData(
  Tcl_Interp *interp, const char *name,
  Tcl_InterpDeleteProc *proc, void *clientData);"
  (interp-ptr         tcl-interp-ptr)
  (name               :string)
  (interp-delete-proc tcl-interp-delete-proc)
  (client-data        client-data))

(defcfun ("Tcl_SetChannelBufferSize" tcl-set-channel-buffer-size) :void
  "/* 224 */  EXTERN void Tcl_SetChannelBufferSize(Tcl_Channel chan, Tcl_Size sz);"
  (chan tcl-channel)
  (sz   tcl-size))

(defcfun ("Tcl_SetChannelOption" tcl-set-channel-option) :int
  "/* 225 */ EXTERN int
Tcl_SetChannelOption(
  Tcl_Interp *interp, Tcl_Channel chan,
  const char *optionName, const char *newValue);"
  (interp-ptr  tcl-interp-ptr)
  (chan        tcl-channel)
  (option-name :string)
  (new-value   :string))

(defcfun ("Tcl_SetCommandInfo" tcl-set-command-info) :int
  "/* 226 */ EXTERN int
Tcl_SetCommandInfo(
  Tcl_Interp *interp, const char *cmdName, const Tcl_CmdInfo *infoPtr);"
  (interp-ptr tcl-interp-ptr)
  (cmd-name   :string)
  (info-ptr   tcl-cmd-info-ptr))

(defcfun ("Tcl_SetErrno" tcl-set-errno) :void
  "/* 227 */ EXTERN void Tcl_SetErrno(int err);"
  (err :int))

(defcfun ("Tcl_SetErrorCode" tcl-set-error-code) :void
  "/* 228 */ EXTERN void Tcl_SetErrorCode(Tcl_Interp *interp, ...);"
  (interp-ptr tcl-interp-ptr) &rest)

(defcfun ("Tcl_SetMaxBlockTime" tcl-set-max-block-time) :void
  "/* 229 */ EXTERN void Tcl_SetMaxBlockTime(const Tcl_Time *timePtr);"
  (time-ptr tcl-time-ptr))

(defcfun ("Tcl_SetPanicProc" %tcl-set-panic-proc) :void
  "/* Slot 230 is reserved */ DEPRECATED 9.0"
  (panic-proc tcl-panic-proc))

(defcfun ("Tcl_SetRecursionLimit" tcl-set-recursion-limit) tcl-size
  "/* 231 */ EXTERN Tcl_Size
Tcl_SetRecursionLimit(Tcl_Interp *interp, Tcl_Size depth);"
  (interp-ptr tcl-interp-ptr)
  (depth      tcl-size))

(defcfun ("Tcl_SetResult" %tcl-set-result) :void
  "/* Slot 232 is reserved */ DEPRECATED 9.0"
  (interp-ptr tcl-interp-ptr)
  (result     :string)
  (free-proc  tcl-free-proc))

(defcfun ("Tcl_SetServiceMode" tcl-set-service-mode) :int
  "/* 233 */ EXTERN int Tcl_SetServiceMode(int mode);"
  (mode :int))

(defcfun ("Tcl_SetObjErrorCode" tcl-set-obj-error-code) :void
  "/* 234 */ EXTERN void
Tcl_SetObjErrorCode(Tcl_Interp *interp, Tcl_Obj *errorObjPtr);"
  (interp-ptr     tcl-interp-ptr)
  (error-obj-ptr  tcl-obj-ptr))

(defcfun ("Tcl_SetObjResult" tcl-set-obj-result) :void
  "/* 235 */ EXTERN void
Tcl_SetObjResult(Tcl_Interp *interp, Tcl_Obj *resultObjPtr);"
  (interp-ptr      tcl-interp-ptr)
  (result-obj-ptr  tcl-obj-ptr))

(defcfun ("Tcl_SetStdChannel" tcl-set-std-channel) :void
  "/* 236 */ EXTERN void Tcl_SetStdChannel(Tcl_Channel channel, int type);"
  (chan tcl-channel)
  (type :int))

(defcfun ("Tcl_SetVar" %tcl-set-var) :string
  "/* Slot 237 is reserved */ DEPRECATED 9.0"
  (interp-ptr tcl-interp-ptr)
  (var-name   :string)
  (new-value  :string)
  (flags      :int))

(defcfun ("Tcl_SetVar2" tcl-set-var2) :string
  "/* 238 */ EXTERN const char *
Tcl_SetVar2(
  Tcl_Interp *interp, const char *part1,
  const char *part2, const char *newValue, int flags);"
  (interp-ptr tcl-interp-ptr)
  (part-1     :string)
  (part-2     :string)
  (new-value  :string)
  (flags      :int))

(defcfun ("Tcl_SignalId" tcl-signal-id) :string
  "/* 239 */ EXTERN const char * Tcl_SignalId(int sig);"
  (sig :int))

(defcfun ("Tcl_SignalMsg" tcl-signal-msg) :string
  "/* 240 */ EXTERN const char * Tcl_SignalMsg(int sig);"
  (sig :int))

(defcfun ("Tcl_SourceRCFile" tcl-source-rc-file) :void
  "/* 241 */ EXTERN void Tcl_SourceRCFile(Tcl_Interp *interp);"
  (interp-ptr tcl-interp-ptr))

(defcfun ("TclSplitList" tcl_split-list) :int
  "/* 242 */ EXTERN int
TclSplitList(
  Tcl_Interp *interp, const char *listStr,
  void *argcPtr, const char ***argvPtr);"
  (interp-ptr tcl-interp-ptr)
  (list-str   :string)
  (argc-ptr   :pointer)
  (argv-ptr   (:pointer (:pointer (:pointer :char)))))

(defcfun ("TclSplitPath" tcl_split-path) :void
  "/* 243 */ EXTERN void
TclSplitPath(const char *path, void *argcPtr, const char ***argvPtr);"
  (path       :string)
  (argc-ptr   :pointer)
  (argv-ptr   (:pointer (:pointer (:pointer :char)))))

(defcfun ("Tcl_StaticPackage" %tcl-static-package) :void
  "/* Slot 244 is reserved */ DEPRECATED 9.0"
  (interp-ptr          tcl-interp-ptr)
  (prefix              :string)
  (pkg-init-proc       tcl-package-init-proc)
  (safe-pkg-init-proc  tcl-package-init-proc))

(defcfun ("Tcl_StringMatch" %tcl-string-match) :int
  "/* Slot 245 is reserved */ DEPRECATED 9.0"
  (str     :string)
  (pattern :string))

(defcfun ("Tcl_TellOld" %tcl-tell-old) :int
  "/* Slot 246 is reserved */ DEPRECATED 9.0"
  (chan tcl-channel))

(defcfun ("Tcl_TraceVar" %tcl-trace-var) :int
  "/* Slot 247 is reserved */ DEPRECATED 9.0"
  (interp-ptr       tcl-interp-ptr)
  (var-name         :string)
  (flags            :int)
  (var-trace-proc   tcl-var-trace-proc)
  (client-data      client-data))

(defcfun ("Tcl_TraceVar2" tcl-trace-var2) :int
  "/* 248 */ EXTERN int
Tcl_TraceVar2(
  Tcl_Interp *interp, const char *part1,
  const char *part2, int flags,
  Tcl_VarTraceProc *proc, void *clientData);"
  (interp-ptr tcl-interp-ptr)
  (part-1         :string)
  (part-2         :string)
  (flags          :int)
  (var-trace-proc tcl-var-trace-proc)
  (client-data    client-data))

(defcfun ("Tcl_TranslateFileName" tcl-translate-file-name) :string
  "/* 249 */ EXTERN char *
Tcl_TranslateFileName(
  Tcl_Interp *interp, const char *name, Tcl_DString *bufferPtr);"
  (interp-ptr tcl-interp-ptr)
  (name       :string)
  (buffer-ptr tcl-d-string-ptr))

(defcfun ("Tcl_Ungets" tcl-ungets) tcl-size
  "/* 250 */ EXTERN Tcl_Size
Tcl_Ungets(Tcl_Channel chan, const char *str, Tcl_Size len, int atHead);"
  (chan    tcl-channel)
  (str     :string)
  (len     tcl-size)
  (at-head :int))

(defcfun ("Tcl_UnlinkVar" tcl-unlink-var) :void
  "/* 251 */ EXTERN void Tcl_UnlinkVar(Tcl_Interp *interp, const char *varName);"
  (interp-ptr tcl-interp-ptr)
  (var-name   :string))

(defcfun ("Tcl_UnregisterChannel" tcl-unregister-channel) :int
  "/* 252 */ EXTERN int
Tcl_UnregisterChannel(Tcl_Interp *interp, Tcl_Channel chan);"
  (interp-ptr tcl-interp-ptr)
  (chan       tcl-channel))

(defcfun ("Tcl_UnsetVar" %tcl-unset-var) :int
  "/* Slot 253 is reserved */ DEPRECATED 9.0"
  (interp-ptr tcl-interp-ptr)
  (var-name   :string)
  (flags      :int))

(defcfun ("Tcl_UnsetVar2" tcl-unset-var2) :int
  "/* 254 */ EXTERN int
Tcl_UnsetVar2(
  Tcl_Interp *interp, const char *part1, const char *part2, int flags);"
  (interp-ptr tcl-interp-ptr)
  (part-1     :string)
  (part-2     :string)
  (flags      :int))

(defcfun ("Tcl_UntraceVar" %tcl-untrace-var) :void
  "/* Slot 255 is reserved */ DEPRECATED 9.0"
  (interp-ptr     tcl-interp-ptr)
  (var-name       :string)
  (flags          :int)
  (var-trace-proc tcl-var-trace-proc)
  (client-data    client-data))

(defcfun ("Tcl_UntraceVar2" tcl-untrace-var2) :void
  "/* 256 */ EXTERN void
Tcl_UntraceVar2(
  Tcl_Interp *interp, const char *part1, const char *part2,
  int flags, Tcl_VarTraceProc *proc,
  void *clientData);"
  (interp-ptr      tcl-interp-ptr)
  (part-1          :string)
  (part-2          :string)
  (flags           :int)
  (var-trace-proc  tcl-var-trace-proc)
  (client-data     client-data))

(defcfun ("Tcl_UpdateLinkedVar" tcl-update-linked-var) :void
  "/* 257 */ EXTERN void
Tcl_UpdateLinkedVar(Tcl_Interp *interp, const char *varName);"
  (interp-ptr tcl-interp-ptr)
  (var-name   :string))

(defcfun ("Tcl_UpVar" %tcl-up-var) :int
  "/* Slot 258 is reserved */ DEPRECATED 9.0"
  (interp-ptr tcl-interp-ptr)
  (frame-name :string)
  (var-name   :string)
  (local-name :string)
  (flags      :int))

(defcfun ("Tcl_UpVar2" tcl-up-var2) :int
  "/* 259 */ EXTERN int
Tcl_UpVar2(
  Tcl_Interp *interp, const char *frameName,
  const char *part1, const char *part2,
  const char *localName, int flags);"
  (interp-ptr tcl-interp-ptr)
  (frame-name :string)
  (part-1     :string)
  (part-2     :string)
  (local-name :string)
  (flags      :int))

(defcfun ("Tcl_VarEval" tcl-var-eval) :int
  "/* 260 */ EXTERN int Tcl_VarEval(Tcl_Interp *interp, ...);"
  (interp-ptr tcl-interp-ptr) &rest)

(defcfun ("Tcl_VarTraceInfo" %tcl_VarTraceInfo) client-data
  "/* Slot 261 is reserved */ DEPRECATED 9.0"
  (interp-ptr        tcl-interp-ptr)
  (var-name          :string)
  (flags             :int)
  (var-trace-proc    tcl-var-trace-proc)
  (prev-client-data  client-data))

(defcfun ("Tcl_VarTraceInfo2" tcl-var-trace-info2) client-data
  "/* 262 */ EXTERN void *
Tcl_VarTraceInfo2(
  Tcl_Interp *interp, const char *part1, const char *part2,
  int flags, Tcl_VarTraceProc *procPtr, void *prevClientData);"
  (interp-ptr        tcl-interp-ptr)
  (part-1            :string)
  (part-2            :string)
  (flags             :int)
  (var-trace-proc    tcl-var-trace-proc)
  (prev-client-data  client-data))

(defcfun ("Tcl_Write" tcl-write) tcl-size
  "/* 263 */ EXTERN Tcl_Size
Tcl_Write(Tcl_Channel chan, const char *s, Tcl_Size slen);"
  (chan   tcl-channel)
  (s      :string)
  (slen   tcl-size))

(defcfun ("Tcl_WrongNumArgs" tcl-wrong-num-args) :void
  "/* 264 */ EXTERN void
Tcl_WrongNumArgs(
  Tcl_Interp *interp, Tcl_Size objc,
  Tcl_Obj *const objv[], const char *message);"
  (interp-ptr  tcl-interp-ptr)
  (objc        tcl-size)
  (objv        (:pointer tcl-obj-ptr))
  (message     :string))

(defcfun ("Tcl_DumpActiveMemory" tcl-dump-active-memory) :int
  "/* 265 */ EXTERN int Tcl_DumpActiveMemory(const char *fileName);"
  (file-name  :string))

(defcfun ("Tcl_ValidateAllMemory" tcl-validate-all-memory) :void
  "/* 266 */ EXTERN void Tcl_ValidateAllMemory(const char *file, int line);"
  (file-name  :string)
  (line       :int))

;; /* Slot 267 is reserved */

;; /* Slot 268 is reserved */

(defcfun ("Tcl_HashStats" tcl-hash-stats) :string
  "/* 269 */ EXTERN char * Tcl_HashStats(Tcl_HashTable *tablePtr);"
  (table-ptr  tcl-hash-table-ptr))

(defcfun ("Tcl_ParseVar" tcl-parse-var) :string
  "/* 270 */ EXTERN const char *
Tcl_ParseVar(Tcl_Interp *interp, const char *start, const char **termPtr);"
  (interp-ptr  tcl-interp-ptr)
  (start       :string)
  (term-ptr    (:pointer (:pointer :char))))

(defcfun ("Tcl_PkgPresent" %tcl-pkg-present) :string
  "/* Slot 271 is reserved */ DEPRECATED 9.0"
  (interp-ptr  tcl-interp-ptr)
  (name        :string)
  (version     :string)
  (exact       :int))

(defcfun ("Tcl_PkgPresentEx" tcl-pkg-present-ex) :string
  "/* 272 */ EXTERN const char *
Tcl_PkgPresentEx(
  Tcl_Interp *interp, const char *name, const char *version,
  int exact, void *clientDataPtr);"
  (interp-ptr       tcl-interp-ptr)
  (name             :string)
  (version          :string)
  (exact            :int)
  (client-data-ptr  client-data))

(defcfun ("Tcl_PkgProvide" %tcl-pkg-provide) :int
  "/* Slot 273 is reserved */ DEPRECATED 9.0"
  (interp-ptr  tcl-interp-ptr)
  (name        :string)
  (version     :string))

(defcfun ("Tcl_PkgRequire" %tcl-pkg-require) :string
  "/* Slot 274 is reserved */ DEPRECATED 9.0"
  (interp-ptr  tcl-interp-ptr)
  (name        :string)
  (version     :string)
  (exact       :int))

;; /* Slot 275 is reserved */

;; /* Slot 276 is reserved */

(defcfun ("Tcl_WaitPid" tcl-wait-pid) tcl-pid
  "/* 277 */ EXTERN Tcl_Pid Tcl_WaitPid(Tcl_Pid pid, int *statPtr, int options);"
  (pid        tcl-pid)
  (stat-ptr   (:pointer :int))
  (options    :int))

;; /* Slot 278 is reserved */

(defcfun ("Tcl_GetVersion" tcl-get-version) :void
  "/* 279 */ EXTERN void
Tcl_GetVersion(int *major, int *minor, int *patchLevel, int *type);"
  (major       (:pointer :int))
  (minor       (:pointer :int))
  (patch-level (:pointer :int))
  (type        (:pointer :int)))

(defcfun ("Tcl_InitMemory" tcl-init-memory) :void
  "/* 280 */ EXTERN void Tcl_InitMemory(Tcl_Interp *interp);"
  (interp-ptr tcl-interp-ptr))

(defcfun ("Tcl_StackChannel" tcl-stack-channel) tcl-channel
  "/* 281 */ EXTERN Tcl_Channel
Tcl_StackChannel(
  Tcl_Interp *interp, const Tcl_ChannelType *typePtr,
  void *instanceData, int mask, Tcl_Channel prevChan);"
  (interp-ptr     tcl-interp-ptr)
  (type-ptr       tcl-channel-type-ptr)
  (instance-data  client-data)
  (mask           :int)
  (prev-chan      tcl-channel))

(defcfun ("Tcl_UnstackChannel" tcl-unstack-channel) :int
  "/* 282 */ EXTERN int
Tcl_UnstackChannel(Tcl_Interp *interp, Tcl_Channel chan);"
  (interp-ptr  tcl-interp-ptr)
  (chan        tcl-channel))

(defcfun ("Tcl_GetStackedChannel" tcl-get-stacked-channel) tcl-channel
  "/* 283 */ EXTERN Tcl_Channel Tcl_GetStackedChannel(Tcl_Channel chan);"
  (chan  tcl-channel))

(defcfun ("Tcl_SetMainLoop" tcl-set-main-loop) :void
  "/* 284 */ EXTERN void Tcl_SetMainLoop(Tcl_MainLoopProc *proc);"
  (main-loop-proc  tcl-main-loop-proc))

(defcfun ("Tcl_GetAliasObj" tcl-get-alias-obj) :int
  "/* 285 */ EXTERN int
Tcl_GetAliasObj(
  Tcl_Interp *interp, const char *childCmd,
  Tcl_Interp **targetInterpPtr, const char **targetCmdPtr,
  Tcl_Size *objcPtr, Tcl_Obj ***objvPtr);"
  (interp            tcl-interp-ptr)
  (child-cmd          :string)
  (target-interp-ptr (:pointer tcl-interp-ptr))
  (target-cmd-ptr    (:pointer (:pointer :char)))
  (objc-ptr          tcl-size-ptr)
  (objv-ptr          (:pointer (:pointer tcl-obj-ptr))))

(defcfun ("Tcl_AppendObjToObj" tcl-append-obj-to-obj) :void
  "/* 286 */ EXTERN void
Tcl_AppendObjToObj(Tcl_Obj *objPtr, Tcl_Obj *appendObjPtr);"
  (obj-ptr          tcl-obj-ptr)
  (append-obj-ptr   tcl-obj-ptr))

(defcfun ("Tcl_CreateEncoding" tcl-create-encoding) tcl-encoding
  "/* 287 */ EXTERN Tcl_Encoding
Tcl_CreateEncoding(const Tcl_EncodingType *typePtr);"
  (type-ptr  tcl-encoding-type-ptr))

(defcfun ("Tcl_CreateThreadExitHandler" tcl-create-thread-exit-handler) :void
  "/* 288 */ EXTERN void
Tcl_CreateThreadExitHandler(Tcl_ExitProc *proc, void *clientData);"
  (exit-proc    tcl-exit-proc)
  (client-data  client-data))

(defcfun ("Tcl_DeleteThreadExitHandler" tcl-delete-thread-exit-handler) :void
  "/* 289 */ EXTERN void
Tcl_DeleteThreadExitHandler(Tcl_ExitProc *proc, void *clientData);"
  (exit-proc    tcl-exit-proc)
  (client-data  client-data))

(defcfun ("Tcl_DiscardResult" %tcl-discard-result) :void
  "/* Slot 290 is reserved */ DEPRECATED 9.0"
  (state-ptr  tcl-saved-result-ptr))

(defcfun ("Tcl_EvalEx" tcl-eval-ex) :int
  "/* 291 */ EXTERN int
Tcl_EvalEx(Tcl_Interp *interp, const char *script, Tcl_Size numBytes, int flags);"
  (interp-ptr  tcl-interp-ptr)
  (script      :string)
  (num-bytes   tcl-size)
  (flags       :int))

(defcfun ("Tcl_EvalObjv" tcl-eval-objv) :int
  "/* 292 */ EXTERN int
Tcl_EvalObjv(Tcl_Interp *interp, Tcl_Size objc, Tcl_Obj *const objv[], int flags);"
  (interp-ptr  tcl-interp-ptr)
  (objc        tcl-size)
  (objv        (:pointer tcl-obj-ptr))
  (flags       :int))

(defcfun ("Tcl_EvalObjEx" tcl-eval-obj-ex) :int
  "/* 293 */ EXTERN int
Tcl_EvalObjEx(Tcl_Interp *interp, Tcl_Obj *objPtr, int flags);"
  (interp-ptr  tcl-interp-ptr)
  (obj-ptr     tcl-obj-ptr)
  (flags       :int))

(defcfun ("Tcl_ExitThread" tcl-exit-thread) :void
  "/* 294 */ EXTERN TCL_NORETURN void Tcl_ExitThread(int status);"
  (status  :int))

(defcfun ("Tcl_ExternalToUtf" tcl-external-to-utf) :int
  "/* 295 */ EXTERN int
Tcl_ExternalToUtf(
  Tcl_Interp *interp, Tcl_Encoding encoding, const char *src,
  Tcl_Size srcLen, int flags,
  Tcl_EncodingState *statePtr, char *dst,
  Tcl_Size dstLen, int *srcReadPtr,
  int *dstWrotePtr, int *dstCharsPtr);"
  (interp-ptr  tcl-interp-ptr)
  (encoding    tcl-encoding)
  (src         (:pointer :char))
  (src-len     tcl-size)
  (flags       :int)
  (state-ptr   tcl-encoding-state-ptr)
  (dst         (:pointer :char))
  (dst-len     tcl-size)
  (src-read-ptr     (:pointer :int))
  (dst-wrote-ptr    (:pointer :int))
  (dst-chars-ptr    (:pointer :int)))

(defcfun ("Tcl_ExternalToUtfDString" tcl-external-to-utf-d-string) :string
  "/* 296 */ EXTERN char *
Tcl_ExternalToUtfDString(
  Tcl_Encoding encoding, const char *src, Tcl_Size srcLen, Tcl_DString *dsPtr);"
  (encoding  tcl-encoding)
  (src       (:pointer :char))
  (src-len   tcl-size)
  (ds-ptr    tcl-d-string-ptr))

(defcfun ("Tcl_FinalizeThread" tcl-finalize-thread) :void
  "/* 297 */ EXTERN void Tcl_FinalizeThread(void);")

(defcfun ("Tcl_FinalizeNotifier" tcl-finalize-notifier) :void
  "/* 298 */ EXTERN void Tcl_FinalizeNotifier(void *clientData);"
  (client-data  :pointer))

(defcfun ("Tcl_FreeEncoding" tcl-free-encoding) :void
  "/* 299 */ EXTERN void Tcl_FreeEncoding(Tcl_Encoding encoding);"
  (encoding  tcl-encoding))

(defcfun ("Tcl_GetCurrentThread" tcl-get-current-thread) tcl-thread-id
  "/* 300 */ EXTERN Tcl_ThreadId Tcl_GetCurrentThread(void);")

(defcfun ("Tcl_GetEncoding" tcl-get-encoding) tcl-encoding
  "/* 301 */ EXTERN Tcl_Encoding
Tcl_GetEncoding(Tcl_Interp *interp, const char *name);"
  (interp-ptr  tcl-interp-ptr)
  (name        :string))

(defcfun ("Tcl_GetEncodingName" tcl-get-encoding-name) :string
  "/* 302 */ EXTERN const char * Tcl_GetEncodingName(Tcl_Encoding encoding);"
  (encoding  tcl-encoding))

(defcfun ("Tcl_GetEncodingNames" tcl-get-encoding-names) :void
  "/* 303 */ EXTERN void Tcl_GetEncodingNames(Tcl_Interp *interp);"
  (interp-ptr tcl-interp-ptr))

(defcfun ("Tcl_GetIndexFromObjStruct" tcl-get-index-from-obj-struct) :int
  "/* 304 */ EXTERN int
Tcl_GetIndexFromObjStruct(
  Tcl_Interp *interp, Tcl_Obj *objPtr, const void *tablePtr,
  Tcl_Size offset, const char *msg, int flags, void *indexPtr);"
  (interp-ptr  tcl-interp-ptr)
  (obj-ptr     tcl-obj-ptr)
  (table-ptr   :pointer)
  (offset      tcl-size)
  (msg         :string)
  (flags       :int)
  (index-ptr   :pointer))

(defcfun ("Tcl_GetThreadData" tcl-get-thread-data) :pointer
  "/* 305 */ EXTERN void * Tcl_GetThreadData(Tcl_ThreadDataKey *keyPtr, Tcl_Size size);"
  (thread-data-key-ptr   tcl-thread-data-key-ptr)
  (size                  tcl-size))

(defcfun ("Tcl_GetVar2Ex" tcl-get-var2-ex) tcl-obj-ptr
  "/* 306 */ EXTERN Tcl_Obj *
  Tcl_GetVar2Ex(Tcl_Interp *interp, const char *part1, const char *part2, int flags);"
  (interp-ptr  tcl-interp-ptr)
  (part-1      :string)
  (part-2      :string)
  (flags       :int))

(defcfun ("Tcl_InitNotifier" tcl-init-notifier) client-data
  "/* 307 */ EXTERN void * Tcl_InitNotifier(void);")

(defcfun ("Tcl_MutexLock" tcl-mutex-lock) :void
  "/* 308 */ EXTERN void Tcl_MutexLock(Tcl_Mutex *mutexPtr);"
  (mutex-ptr  tcl-mutex-ptr))

(defcfun ("Tcl_MutexUnlock" tcl-mutex-unlock) :void
  "/* 309 */ EXTERN void Tcl_MutexUnlock(Tcl_Mutex *mutexPtr);"
  (mutex-ptr  tcl-mutex-ptr))

(defcfun ("Tcl_ConditionNotify" tcl-condition-notify) :void
  "/* 310 */ EXTERN void Tcl_ConditionNotify(Tcl_Condition *condPtr);"
  (cond-ptr  tcl-condition-ptr))

(defcfun ("Tcl_ConditionWait" tcl-condition-wait) :void
  "/* 311 */ EXTERN void
Tcl_ConditionWait(
  Tcl_Condition *condPtr, Tcl_Mutex *mutexPtr, const Tcl_Time *timePtr);"
  (cond-ptr  tcl-condition-ptr)
  (mutex-ptr tcl-mutex-ptr)
  (time-ptr  tcl-time-ptr))

(defcfun ("TclNumUtfChars" tcl_num-utf-chars) tcl-size
  "/* 312 */ EXTERN Tcl_Size TclNumUtfChars(const char *src, Tcl_Size length);"
  (src     (:pointer :char))
  (length  tcl-size))

(defcfun ("Tcl_ReadChars" tcl-read-chars) tcl-size
  "/* 313 */ EXTERN Tcl_Size
Tcl_ReadChars(
  Tcl_Channel channel, Tcl_Obj *objPtr,
  Tcl_Size charsToRead, int appendFlag);"
  (chan           tcl-channel)
  (obj-ptr        tcl-obj-ptr)
  (chars-to-read  tcl-size)
  (append-flag    :int))

;; /* Slot 314 is reserved */

;; /* Slot 315 is reserved */

(defcfun ("Tcl_SetSystemEncoding" tcl-set-system-encoding) :int
  "/* 316 */ EXTERN int Tcl_SetSystemEncoding(Tcl_Interp *interp, const char *name);"
  (interp-ptr tcl-interp-ptr)
  (name       :string))

(defcfun ("Tcl_SetVar2Ex" tcl-set-var2-ex) tcl-obj-ptr
  "/* 317 */ EXTERN Tcl_Obj *
Tcl_SetVar2Ex(
  Tcl_Interp *interp, const char *part1, const char *part2,
  Tcl_Obj *newValuePtr, int flags);"
  (interp-ptr     tcl-interp-ptr)
  (part-1         :string)
  (part-2         :string)
  (new-value-ptr  tcl-obj-ptr)
  (flags          :int))

(defcfun ("Tcl_ThreadAlert" tcl-thread-alert) :void
  "/* 318 */ EXTERN void Tcl_ThreadAlert(Tcl_ThreadId threadId);"
  (thread-id  tcl-thread-id))

(defcfun ("Tcl_ThreadQueueEvent" tcl-thread-queue-event) :void
  "/* 319 */ EXTERN void
Tcl_ThreadQueueEvent(Tcl_ThreadId threadId, Tcl_Event *evPtr, int position);"
  (thread-id  tcl-thread-id)
  (ev-ptr     tcl-event-ptr)
  (position   :int))

(defcfun ("Tcl_UniCharAtIndex" tcl-uni-char-at-index) :int
  "/* 320 */  EXTERN int Tcl_UniCharAtIndex(const char *src, Tcl_Size index);"
  (src    :string)
  (index  tcl-size))

(defcfun ("Tcl_UniCharToLower" tcl-uni-char-to-lower) :int
  "/* 321 */ EXTERN int Tcl_UniCharToLower(int ch);"
  (ch  :int))

(defcfun ("Tcl_UniCharToTitle" tcl-uni-char-to-title) :int
  "/* 322 */ EXTERN int Tcl_UniCharToTitle(int ch);"
  (ch  :int))

(defcfun ("Tcl_UniCharToUpper" tcl-uni-char-to-upper) :int
  "/* 323 */ EXTERN int Tcl_UniCharToUpper(int ch);"
  (ch  :int))

(defcfun ("Tcl_UniCharToUtf" tcl-uni-char-to-utf) tcl-size
  "/* 324 */ EXTERN Tcl_Size Tcl_UniCharToUtf(int ch, char *buf);"
  (ch  :int)
  (buf (:pointer :char)))

(defcfun ("TclUtfAtIndex" tcl_utf-at-index) :string
  "/* 325 */ EXTERN const char * TclUtfAtIndex(const char *src, Tcl_Size index);"
  (src    :string)
  (index  tcl-size))

(defcfun ("TclUtfCharComplete" tcl_utf-char-complete) :int
  "/* 326 */ EXTERN int TclUtfCharComplete(const char *src, Tcl_Size length);"
  (src     (:pointer :char))
  (length  tcl-size))

(defcfun ("Tcl_UtfBackslash" tcl-utf-backslash) tcl-size
  "/* 327 */ EXTERN Tcl_Size Tcl_UtfBackslash(const char *src, int *readPtr, char *dst);"
  (src       (:pointer :char))
  (read-ptr  (:pointer :int))
  (dst       (:pointer :char)))

(defcfun ("Tcl_UtfFindFirst" tcl-utf-find-first) (:pointer :char)
  "/* 328 */ EXTERN const char * Tcl_UtfFindFirst(const char *src, int ch);"
  (src   (:pointer :char))
  (ch    :int))

(defcfun ("Tcl_UtfFindLast" tcl-utf-find-last) (:pointer :char)
  "/* 329 */ EXTERN const char * Tcl_UtfFindLast(const char *src, int ch);"
  (src  (:pointer :char))
  (ch   :int))

(defcfun ("TclUtfNext" tcl_utf-next) (:pointer :char)
  "/* 330 */ EXTERN const char * TclUtfNext(const char *src);"
  (src  (:pointer :char)))

(defcfun ("TclUtfPrev" tcl_utf-prev) (:pointer :char)
  "/* 331 */ EXTERN const char * TclUtfPrev(const char *src, const char *start);"
  (src    (:pointer :char))
  (start  (:pointer :char)))

(defcfun ("Tcl_UtfToExternal" tcl-utf-to-external) :int
  "/* 332 */ EXTERN int
Tcl_UtfToExternal(
  Tcl_Interp *interp, Tcl_Encoding encoding,
  const char *src, Tcl_Size srcLen,
  int flags, Tcl_EncodingState *statePtr,
  char *dst, Tcl_Size dstLen,
  int *srcReadPtr,
  int *dstWrotePtr, int *dstCharsPtr);
"
  (interp-ptr     tcl-interp-ptr)
  (encoding       tcl-encoding)
  (src            (:pointer :char))
  (src-len        tcl-size)
  (flags          :int)
  (state-ptr      tcl-encoding-state-ptr)
  (dst            (:pointer :char))
  (dst-len        tcl-size)
  (src-read-ptr   (:pointer :int))
  (dst-wrote-ptr  (:pointer :int))
  (dst-chars-ptr  (:pointer :int)))

(defcfun ("Tcl_UtfToExternalDString" tcl-utf-to-external-d-string)
    (:pointer :char)
  "/* 333 */ EXTERN char *
Tcl_UtfToExternalDString(
  Tcl_Encoding encoding, const char *src, Tcl_Size srcLen, Tcl_DString *dsPtr);"
  (encoding  tcl-encoding)
  (src       (:pointer :char))
  (src-len   tcl-size)
  (ds-ptr    tcl-d-string-ptr))

(defcfun ("Tcl_UtfToLower" tcl-utf-to-lower) tcl-size
  "/* 334 */ EXTERN Tcl_Size Tcl_UtfToLower(char *src);"
  (src  :string))

(defcfun ("Tcl_UtfToTitle" tcl-utf-to-title) tcl-size
  "/* 335 */ EXTERN Tcl_Size Tcl_UtfToTitle(char *src);"
  (src  :string))

(defcfun ("Tcl_UtfToChar16" tcl-utf-to-char16) tcl-size
  "/* 336 */ EXTERN Tcl_Size Tcl_UtfToChar16(const char *src, unsigned short *chPtr);"
  (src     (:pointer :char))
  (ch-ptr  (:pointer :ushort)))

(defcfun ("Tcl_UtfToUpper" tcl-utf-to-upper) tcl-size
  "/* 337 */ EXTERN Tcl_Size Tcl_UtfToUpper(char *src);"
  (src  :string))

(defcfun ("Tcl_WriteChars" tcl-write-chars) tcl-size
  "/* 338 */ EXTERN Tcl_Size
Tcl_WriteChars(Tcl_Channel chan, const char *src, Tcl_Size srcLen);"
  (chan     tcl-channel)
  (src      (:pointer :char))
  (src-len  tcl-size))

(defcfun ("Tcl_WriteObj" tcl-write-obj) tcl-size
  "/* 339 */ EXTERN Tcl_Size Tcl_WriteObj(Tcl_Channel chan, Tcl_Obj *objPtr);"
  (chan     tcl-channel)
  (obj-ptr  :pointer))

(defcfun ("Tcl_GetString" tcl-get-string) :string
  "/* 340 */ EXTERN char * Tcl_GetString(Tcl_Obj *objPtr);"
  (obj-ptr  tcl-obj-ptr))

;; /* Slot 341 is reserved */

;; /* Slot 342 is reserved */

(defcfun ("Tcl_AlertNotifier" tcl-alert-notifier) :void
  "/* 343 */ EXTERN void Tcl_AlertNotifier(void *clientData);"
  (client-data  client-data))

(defcfun ("Tcl_ServiceModeHook" tcl-service-mode-hook) :void
  "/* 344 */ EXTERN void Tcl_ServiceModeHook(int mode);"
  (mode  :int))

(defcfun ("Tcl_UniCharIsAlnum" tcl-uni-char-is-alnum) :int
  "/* 345 */ EXTERN int Tcl_UniCharIsAlnum(int ch);"
  (ch  :int))

(defcfun ("Tcl_UniCharIsAlpha" tcl-uni-char-is-alpha) :int
  "/* 346 */ EXTERN int Tcl_UniCharIsAlpha(int ch);"
  (ch  :int))

(defcfun ("Tcl_UniCharIsDigit" tcl-uni-char-is-digit) :int
  "/* 347 */ EXTERN int Tcl_UniCharIsDigit(int ch);"
  (ch  :int))

(defcfun ("Tcl_UniCharIsLower" tcl-uni-char-is-lower) :int
  "/* 348 */ EXTERN int Tcl_UniCharIsLower(int ch);"
  (ch  :int))

(defcfun ("Tcl_UniCharIsSpace" tcl-uni-char-is-space) :int
  "/* 349 */ EXTERN int Tcl_UniCharIsSpace(int ch);"
  (ch  :int))

(defcfun ("Tcl_UniCharIsUpper" tcl-uni-char-is-upper) :int
  "/* 350 */ EXTERN int Tcl_UniCharIsUpper(int ch);"
  (ch  :int))

(defcfun ("Tcl_UniCharIsWordChar" tcl-uni-char-is-word-char) :int
  "/* 351 */ EXTERN int Tcl_UniCharIsWordChar(int ch);"
  (ch  :int))

(defcfun ("Tcl_Char16Len" tcl-char16-len) tcl-size
  "/* 352 */ EXTERN Tcl_Size Tcl_Char16Len(const unsigned short *uniStr);"
  (uni-str  (:pointer :ushort)))

;; /* Slot 353 is reserved */

(defcfun ("Tcl_Char16ToUtfDString" tcl-char16-to-utf-d-string) :string
  "/* 354 */ EXTERN char *
Tcl_Char16ToUtfDString(
  const unsigned short *uniStr, Tcl_Size uniLength, Tcl_DString *dsPtr);"
  (uni-str     (:pointer :ushort))
  (uni-length  tcl-size)
  (ds-ptr      tcl-d-string-ptr))

(defcfun ("Tcl_UtfToChar16DString" tcl-utf-to-char16-d-string)
    (:pointer :ushort)
  "/* 355 */ EXTERN unsigned short *
Tcl_UtfToChar16DString(const char *src, Tcl_Size length, Tcl_DString *dsPtr);"
  (src     (:pointer :char))
  (length  tcl-size)
  (ds-ptr  tcl-d-string-ptr))

(defcfun ("Tcl_GetRegExpFromObj" tcl-get-reg-exp-from-obj) tcl-reg-exp
  "/* 356 */ EXTERN Tcl_RegExp
Tcl_GetRegExpFromObj(Tcl_Interp *interp, Tcl_Obj *patObj, int flags);"
  (interp-ptr     tcl-interp-ptr)
  (pat-obj        tcl-obj-ptr)
  (flags          :int))

;; /* Slot 357 is reserved */

(defcfun ("Tcl_FreeParse" tcl-free-parse) :void
  "/* 358 */ EXTERN void Tcl_FreeParse(Tcl_Parse *parsePtr);"
  (parse-ptr  tcl-parse-ptr))

(defcfun ("Tcl_LogCommandInfo" tcl-log-command-info) :void
  "/* 359 */ EXTERN void
Tcl_LogCommandInfo(
  Tcl_Interp *interp, const char *script, const char *command, Tcl_Size length);"
  (interp-ptr     tcl-interp-ptr)
  (script         :string)
  (command        :string)
  (length         tcl-size))

(defcfun ("Tcl_ParseBraces" tcl-parse-braces) :int
  "/* 360 */ EXTERN int
Tcl_ParseBraces(
  Tcl_Interp *interp, const char *start, Tcl_Size numBytes,
  Tcl_Parse *parsePtr, int append, const char **termPtr);"
  (interp-ptr     tcl-interp-ptr)
  (start          (:pointer :char))
  (num-bytes      tcl-size)
  (parse-ptr      tcl-parse-ptr)
  (append         :int)
  (term-ptr       (:pointer (:pointer :char))))

(defcfun ("Tcl_ParseCommand" tcl-parse-command) :int
  "/* 361 */ EXTERN int
Tcl_ParseCommand(
  Tcl_Interp *interp, const char *start, Tcl_Size numBytes,
  int nested, Tcl_Parse *parsePtr);"
  (interp-ptr     tcl-interp-ptr)
  (start          (:pointer :char))
  (num-bytes      tcl-size)
  (nested         :int)
  (parse-ptr      tcl-parse-ptr))

(defcfun ("Tcl_ParseExpr" tcl-parse-expr) :int
  "/* 362 */ EXTERN int
Tcl_ParseExpr(
  Tcl_Interp *interp, const char *start,
  Tcl_Size numBytes, Tcl_Parse *parsePtr);"
  (interp-ptr     tcl-interp-ptr)
  (start          (:pointer :char))
  (num-bytes      tcl-size)
  (parse-ptr      tcl-parse-ptr))

(defcfun ("Tcl_ParseQuotedString" tcl-parse-quoted-string) :int
  "/* 363 */ EXTERN int
Tcl_ParseQuotedString(
  Tcl_Interp *interp, const char *start, Tcl_Size numBytes,
  Tcl_Parse *parsePtr, int append, const char **termPtr);"
  (interp-ptr     tcl-interp-ptr)
  (start          (:pointer :char))
  (num-bytes      tcl-size)
  (parse-ptr      tcl-parse-ptr)
  (append         :int)
  (term-ptr       (:pointer (:pointer :char))))

(defcfun ("Tcl_ParseVarName" tcl-parse-var-name) :int
  "/* 364 */ EXTERN int
Tcl_ParseVarName(
  Tcl_Interp *interp, const char *start, Tcl_Size numBytes,
  Tcl_Parse *parsePtr, int append);"
  (interp-ptr     tcl-interp-ptr)
  (start          (:pointer :char))
  (num-bytes      tcl-size)
  (parse-ptr      tcl-parse-ptr)
  (append         :int))

(defcfun ("Tcl_GetCwd" tcl-get-cwd) :string
  "/* 365 */ EXTERN char * Tcl_GetCwd(Tcl_Interp *interp, Tcl_DString *cwdPtr);"
  (interp-ptr     tcl-interp-ptr)
  (cwd-ptr        tcl-d-string-ptr))

(defcfun ("Tcl_Chdir" tcl-chdir) :int
  "/* 366 */ EXTERN int Tcl_Chdir(const char *dirName);"
  (dir-name  :string))

(defcfun ("Tcl_Access" tcl-access) :int
  "/* 367 */ EXTERN int Tcl_Access(const char *path, int mode);"
  (path  :string)
  (mode  :int))

(defcfun ("Tcl_Stat" tcl-stat) :int
  "/* 368 */ EXTERN int Tcl_Stat(const char *path, struct stat *bufPtr);"
  (path     :string)
  (buf-ptr  :pointer))

(defcfun ("TclUtfNcmp" tcl_utf-ncmp) :int
  "/* 369 */ EXTERN int TclUtfNcmp(const char *s1, const char *s2, size_t n);"
  (s1  :string)
  (s2  :string)
  (n   :size))

(defcfun ("TclUtfNcasecmp" tcl_utf-ncasecmp) :int
  "/* 370 */ EXTERN int TclUtfNcasecmp(const char *s1, const char *s2, size_t n);"
  (s1  :string)
  (s2  :string)
  (n   :size))

(defcfun ("Tcl_StringCaseMatch" tcl-string-case-match) :int
  "/* 371 */ EXTERN int
Tcl_StringCaseMatch(const char *str, const char *pattern, int nocase);"
  (str      :string)
  (pattern  :string)
  (nocase   :int))

(defcfun ("Tcl_UniCharIsControl" tcl-uni-char-is-control) :int
  "/* 372 */ EXTERN int Tcl_UniCharIsControl(int ch);"
  (ch  :int))

(defcfun ("Tcl_UniCharIsGraph" tcl-uni-char-is-graph) :int
  "/* 373 */ EXTERN int Tcl_UniCharIsGraph(int ch);"
  (ch  :int))

(defcfun ("Tcl_UniCharIsPrint" tcl-uni-char-is-print) :int
  "/* 374 */ EXTERN int Tcl_UniCharIsPrint(int ch);"
  (ch  :int))

(defcfun ("Tcl_UniCharIsPunct" tcl-uni-char-is-punct) :int
  "/* 375 */ EXTERN int Tcl_UniCharIsPunct(int ch);"
  (ch  :int))

(defcfun ("Tcl_RegExpExecObj" tcl-reg-exp-exec-obj) :int
  "/* 376 */ EXTERN int
Tcl_RegExpExecObj(
  Tcl_Interp *interp, Tcl_RegExp regexp, Tcl_Obj *textObj,
  Tcl_Size offset, Tcl_Size nmatches, int flags);"
  (interp-ptr     tcl-interp-ptr)
  (regexp         tcl-reg-exp)
  (text-obj       tcl-obj-ptr)
  (offset         tcl-size)
  (nmatches       tcl-size)
  (flags          :int))

(defcfun ("Tcl_RegExpGetInfo" tcl-reg-exp-get-info) :void
  "/* 377 */ EXTERN void
Tcl_RegExpGetInfo(Tcl_RegExp regexp, Tcl_RegExpInfo *infoPtr);"
  (regexp    tcl-reg-exp)
  (info-ptr  tcl-reg-exp-info-ptr))

(defcfun ("Tcl_NewUnicodeObj" tcl-new-unicode-obj) tcl-obj-ptr
  "/* 378 */ EXTERN Tcl_Obj *
Tcl_NewUnicodeObj(const Tcl_UniChar *unicode, Tcl_Size numChars);
"
  (unicode    tcl-uni-char-ptr)
  (num-chars  tcl-size))

(defcfun ("Tcl_SetUnicodeObj" tcl-set-unicode-obj) :void
  "/* 379 */ EXTERN void
Tcl_SetUnicodeObj(
  Tcl_Obj *objPtr, const Tcl_UniChar *unicode, Tcl_Size numChars);"
  (obj-ptr    tcl-obj-ptr)
  (unicode    tcl-uni-char-ptr)
  (num-chars  tcl-size))

(defcfun ("TclGetCharLength" tcl_get-char-length) tcl-size
  "/* 380 */ EXTERN Tcl_Size TclGetCharLength(Tcl_Obj *objPtr);"
  (obj-ptr  tcl-obj-ptr))

(defcfun ("TclGetUniChar" tcl_get-uni-char) :int
  "/* 381 */ EXTERN int TclGetUniChar(Tcl_Obj *objPtr, Tcl_Size index);"
  (obj-ptr  tcl-obj-ptr)
  (index    tcl-size))

;; /* Slot 382 is reserved */

(defcfun ("TclGetRange" tcl_get-range) tcl-obj-ptr
  "/* 383 */ EXTERN Tcl_Obj *
TclGetRange(Tcl_Obj *objPtr, Tcl_Size first, Tcl_Size last);"
  (obj-ptr  tcl-obj-ptr)
  (first    tcl-size)
  (last     tcl-size))

(defcfun ("Tcl_AppendUnicodeToObj" tcl-append-unicode-to-obj) :void
  "/* 384 */ EXTERN void
Tcl_AppendUnicodeToObj(Tcl_Obj *objPtr, const Tcl_UniChar *unicode, Tcl_Size length);"
  (obj-ptr  tcl-obj-ptr)
  (unicode  tcl-uni-char-ptr)
  (length   tcl-size))

(defcfun ("Tcl_RegExpMatchObj" tcl-reg-exp-match-obj) :int
  "/* 385 */ EXTERN int
Tcl_RegExpMatchObj(Tcl_Interp *interp, Tcl_Obj *textObj, Tcl_Obj *patternObj);"
  (interp-ptr     tcl-interp-ptr)
  (text-obj       tcl-obj-ptr)
  (pattern-obj    tcl-obj-ptr))

(defcfun ("Tcl_SetNotifier" tcl-set-notifier) :void
  "/* 386 */ EXTERN void Tcl_SetNotifier(const Tcl_NotifierProcs *notifierProcPtr);"
  (notifier-proc-ptr  tcl-notifier-procs-ptr))

(defcfun ("Tcl_GetAllocMutex" tcl-get-alloc-mutex) tcl-mutex-ptr
  "/* 387 */ EXTERN Tcl_Mutex * Tcl_GetAllocMutex(void);")

(defcfun ("Tcl_GetChannelNames" tcl-get-channel-names) :int
  "/* 388 */ EXTERN int Tcl_GetChannelNames(Tcl_Interp *interp);"
  (interp-ptr     tcl-interp-ptr))

(defcfun ("Tcl_GetChannelNamesEx" tcl-get-channel-names-ex) :int
  "/* 389 */ EXTERN int
Tcl_GetChannelNamesEx(Tcl_Interp *interp, const char *pattern);"
  (interp-ptr     tcl-interp-ptr)
  (pattern        :string))

(defcfun ("Tcl_ProcObjCmd" tcl-proc-obj-cmd) :int
  "/* 390 */ EXTERN int
Tcl_ProcObjCmd(
  void *clientData, Tcl_Interp *interp,
  Tcl_Size objc, Tcl_Obj *const objv[]);"
  (client-data    client-data)
  (interp-ptr     tcl-interp-ptr)
  (objc           tcl-size)
  (objv           (:pointer tcl-obj-ptr)))

(defcfun ("Tcl_ConditionFinalize" tcl-condition-finalize) :void
  "/* 391 */ EXTERN void Tcl_ConditionFinalize(Tcl_Condition *condPtr);"
  (cond-ptr  tcl-condition-ptr))

(defcfun ("Tcl_MutexFinalize" tcl-mutex-finalize) :void
  "/* 392 */ EXTERN void Tcl_MutexFinalize(Tcl_Mutex *mutex);"
  (mutex-ptr  tcl-mutex-ptr))

(defcfun ("Tcl_CreateThread" tcl-create-thread) :int
  "/* 393 */ EXTERN int
Tcl_CreateThread(
  Tcl_ThreadId *idPtr, Tcl_ThreadCreateProc *proc, void *clientData,
  TCL_HASH_TYPE stackSize, int flags);"
  (id-ptr  tcl-thread-id-ptr)
  (proc    tcl-thread-create-proc)
  (client-data  client-data)
  (stack-size   tcl-hash-type)
  (flags        :int))

(defcfun ("Tcl_ReadRaw" tcl-read-raw) tcl-size
  "/* 394 */ EXTERN Tcl_Size
Tcl_ReadRaw(Tcl_Channel chan, char *dst, Tcl_Size bytesToRead);"
  (chan  tcl-channel)
  (dst   (:pointer :char))
  (bytes-to-read  tcl-size))

(defcfun ("Tcl_WriteRaw" tcl-write-raw) tcl-size
  "/* 395 */ EXTERN Tcl_Size
Tcl_WriteRaw(Tcl_Channel chan, const char *src, Tcl_Size srcLen);"
  (chan  tcl-channel)
  (src   (:pointer :char))
  (src-len  tcl-size))

(defcfun ("Tcl_GetTopChannel" tcl-get-top-channel) tcl-channel
  "/* 396 */ EXTERN Tcl_Channel Tcl_GetTopChannel(Tcl_Channel chan);"
  (chan  tcl-channel))

(defcfun ("Tcl_ChannelBuffered" tcl-channel-buffered) :int
  "/* 397 */ EXTERN int Tcl_ChannelBuffered(Tcl_Channel chan);"
  (chan  tcl-channel))

(defcfun ("Tcl_ChannelName" tcl-channel-name) :string
  "/* 398 */ EXTERN const char * Tcl_ChannelName(const Tcl_ChannelType *chanTypePtr);"
  (chan-type-ptr  tcl-channel-type-ptr))

(defcfun ("Tcl_ChannelVersion" tcl-channel-version) tcl-channel-type-version
  "/* 399 */ EXTERN Tcl_ChannelTypeVersion
Tcl_ChannelVersion(const Tcl_ChannelType *chanTypePtr);"
  (chan-type-ptr  tcl-channel-type-ptr))

(defcfun ("Tcl_ChannelBlockModeProc" tcl-channel-block-mode-proc)
  tcl-driver-block-mode-proc
  "/* 400 */ EXTERN Tcl_DriverBlockModeProc *
Tcl_ChannelBlockModeProc(const Tcl_ChannelType *chanTypePtr);"
  (chan-type-ptr  tcl-channel-type-ptr))

;; /* Slot 401 is reserved */

(defcfun ("Tcl_ChannelClose2Proc" tcl-channel-close2-proc) tcl-driver-close2-proc
  "/* 402 */ EXTERN Tcl_DriverClose2Proc *
Tcl_ChannelClose2Proc(const Tcl_ChannelType *chanTypePtr);"
  (chan-type-ptr  tcl-channel-type-ptr))

(defcfun ("Tcl_ChannelInputProc" tcl-channel-input-proc) tcl-driver-input-proc
  "/* 403 */ EXTERN Tcl_DriverInputProc *
Tcl_ChannelInputProc(const Tcl_ChannelType *chanTypePtr);"
  (chan-type-ptr  tcl-channel-type-ptr))

(defcfun ("Tcl_ChannelOutputProc" tcl-channel-output-proc) tcl-driver-output-proc
  "/* 404 */ EXTERN Tcl_DriverOutputProc *
Tcl_ChannelOutputProc(const Tcl_ChannelType *chanTypePtr);"
  (chan-type-ptr  tcl-channel-type-ptr))

;; /* Slot 405 is reserved */

(defcfun ("Tcl_ChannelSetOptionProc" tcl-channel-set-option-proc)
  tcl-driver-set-option-proc
  "/* 406 */ EXTERN Tcl_DriverSetOptionProc *
Tcl_ChannelSetOptionProc(const Tcl_ChannelType *chanTypePtr);"
  (chan-type-ptr  tcl-channel-type-ptr))

(defcfun ("Tcl_ChannelGetOptionProc" tcl-channel-get-option-proc)
  tcl-driver-get-option-proc
  "/* 407 */ EXTERN Tcl_DriverGetOptionProc *
Tcl_ChannelGetOptionProc(const Tcl_ChannelType *chanTypePtr);"
  (chan-type-ptr  tcl-channel-type-ptr))

(defcfun ("Tcl_ChannelWatchProc" tcl-channel-watch-proc)
  tcl-driver-watch-proc
  "/* 408 */ EXTERN Tcl_DriverWatchProc *
Tcl_ChannelWatchProc(const Tcl_ChannelType *chanTypePtr);"
  (chan-type-ptr  tcl-channel-type-ptr))

(defcfun ("Tcl_ChannelGetHandleProc" tcl-channel-get-handle-proc)
  tcl-driver-get-handle-proc
  "/* 409 */ EXTERN Tcl_DriverGetHandleProc *
Tcl_ChannelGetHandleProc(const Tcl_ChannelType *chanTypePtr);"
  (chan-type-ptr  tcl-channel-type-ptr))

(defcfun ("Tcl_ChannelFlushProc" tcl-channel-flush-proc)
  tcl-driver-flush-proc
  "/* 410 */ EXTERN Tcl_DriverFlushProc *
Tcl_ChannelFlushProc(const Tcl_ChannelType *chanTypePtr);"
  (chan-type-ptr  tcl-channel-type-ptr))

(defcfun ("Tcl_ChannelHandlerProc" tcl-channel-handler-proc)
  tcl-driver-handler-proc
  "/* 411 */ EXTERN Tcl_DriverHandlerProc *
Tcl_ChannelHandlerProc(const Tcl_ChannelType *chanTypePtr);"
  (chan-type-ptr  tcl-channel-type-ptr))

(defcfun ("Tcl_JoinThread" tcl-join-thread) :int
  "/* 412 */ EXTERN int Tcl_JoinThread(Tcl_ThreadId threadId, int *result);"
  (thread-id  tcl-thread-id)
  (result     (:pointer :int)))

(defcfun ("Tcl_IsChannelShared" tcl-is-channel-shared) :int
  "/* 413 */ EXTERN int Tcl_IsChannelShared(Tcl_Channel channel);"
  (chan  tcl-channel))

(defcfun ("Tcl_IsChannelRegistered" tcl-is-channel-registered) :int
  "/* 414 */ EXTERN int
Tcl_IsChannelRegistered(Tcl_Interp *interp, Tcl_Channel channel);"
  (interp-ptr     tcl-interp-ptr)
  (chan           tcl-channel))

(defcfun ("Tcl_CutChannel" tcl-cut-channel) :void
  "/* 415 */ EXTERN void Tcl_CutChannel(Tcl_Channel channel);"
  (chan  tcl-channel))

(defcfun ("Tcl_SpliceChannel" tcl-splice-channel) :void
  "/* 416 */ EXTERN void Tcl_SpliceChannel(Tcl_Channel channel);"
  (chan           tcl-channel))

(defcfun ("Tcl_ClearChannelHandlers" tcl-clear-channel-handlers) :void
  "/* 417 */ EXTERN void Tcl_ClearChannelHandlers(Tcl_Channel channel);"
  (chan           tcl-channel))

(defcfun ("Tcl_IsChannelExisting" tcl-is-channel-existing) :int
  "/* 418 */ EXTERN int Tcl_IsChannelExisting(const char *channelName);"
  (chan-name  :string))

;; /* Slot 419 is reserved */

;; /* Slot 420 is reserved */

;; /* Slot 421 is reserved */

;; /* Slot 422 is reserved */

(defcfun ("Tcl_InitCustomHashTable" tcl-init-custom-hash-table) :void
  "/* 423 */ EXTERN void
Tcl_InitCustomHashTable(
  Tcl_HashTable *tablePtr,
  int keyType, const Tcl_HashKeyType *typePtr);"
  (table-ptr    tcl-hash-table-ptr)
  (key-type     :int)
  (type-ptr     tcl-hash-key-type-ptr))

(defcfun ("Tcl_InitObjHashTable" tcl-init-obj-hash-table) :void
  "/* 424 */ EXTERN void Tcl_InitObjHashTable(Tcl_HashTable *tablePtr);"
  (table-ptr  tcl-hash-table-ptr))

(defcfun ("Tcl_CommandTraceInfo" tcl-command-trace-info) client-data
  "/* 425 */ EXTERN void *
Tcl_CommandTraceInfo(
  Tcl_Interp *interp, const char *varName, int flags,
  Tcl_CommandTraceProc *procPtr, void *prevClientData);"
  (interp-ptr        tcl-interp-ptr)
  (var-name          :string)
  (flags             :int)
  (cmd-trace-proc    tcl-cmd-trace-proc)
  (prev-client-date  client-data))

(defcfun ("Tcl_TraceCommand" tcl-trace-command) :int
  "/* 426 */ EXTERN int
Tcl_TraceCommand(
  Tcl_Interp *interp, const char *varName, int flags,
  Tcl_CommandTraceProc *proc, void *clientData);"
  (interp-ptr     tcl-interp-ptr)
  (var-name       :string)
  (flags          :int)
  (cmd-trace-proc tcl-cmd-trace-proc)
  (client-data    client-data))

(defcfun ("Tcl_UntraceCommand" tcl-untrace-command) :void
  "/* 427 */ EXTERN void
Tcl_UntraceCommand(
  Tcl_Interp *interp, const char *varName, int flags,
  Tcl_CommandTraceProc *proc, void *clientData);"
  (interp-ptr     tcl-interp-ptr)
  (var-name       :string)
  (flags          :int)
  (cmd-trace-proc tcl-cmd-trace-proc)
  (client-data    client-data))

(defcfun ("Tcl_AttemptAlloc" tcl-attempt-alloc) :pointer
  "/* 428 */ EXTERN void * Tcl_AttemptAlloc(TCL_HASH_TYPE size);"
  (size tcl-hash-type))

(defcfun ("Tcl_AttemptDbCkalloc" tcl-attempt-db-ckalloc) :pointer
  "/* 429 */ EXTERN void *
Tcl_AttemptDbCkalloc(TCL_HASH_TYPE size, const char *file, int line);"
  (size  tcl-hash-type)
  (file  :string)
  (line  :int))

(defcfun ("Tcl_AttemptRealloc" tcl-attempt-realloc) :pointer
  "/* 430 */ EXTERN void *
Tcl_AttemptRealloc(void *ptr, TCL_HASH_TYPE size);"
  (ptr   :pointer)
  (size  tcl-hash-type))

(defcfun ("Tcl_AttemptDbCkrealloc" tcl-attempt-db-ckrealloc) :pointer
  "/* 431 */ EXTERN void *
Tcl_AttemptDbCkrealloc(
  void *ptr, TCL_HASH_TYPE size, const char *file, int line);"
  (ptr   :pointer)
  (size  tcl-hash-type)
  (file  :string)
  (line  :int))

(defcfun ("Tcl_AttemptSetObjLength" tcl-attempt-set-obj-length) :int
  "/* 432 */ EXTERN int
Tcl_AttemptSetObjLength(Tcl_Obj *objPtr, Tcl_Size length);"
  (obj-ptr  tcl-obj-ptr) (length  tcl-size))

(defcfun ("Tcl_GetChannelThread" tcl-get-channel-thread) tcl-thread-id
  "/* 433 */ EXTERN Tcl_ThreadId Tcl_GetChannelThread(Tcl_Channel channel);"
  (chan           tcl-channel))

(defcfun ("TclGetUnicodeFromObj" tcl_get-unicode-from-obj)
  tcl-uni-char-ptr
  "/* 434 */ EXTERN Tcl_UniChar *
TclGetUnicodeFromObj(Tcl_Obj *objPtr, void *lengthPtr);"
  (obj-ptr  tcl-obj-ptr) (length-ptr  :pointer))

;; /* Slot 435 is reserved */

;; /* Slot 436 is reserved */

(defcfun ("Tcl_SubstObj" tcl-subst-obj) tcl-obj-ptr
  "/* 437 */ EXTERN Tcl_Obj *
Tcl_SubstObj(Tcl_Interp *interp, Tcl_Obj *objPtr, int flags);"
  (interp-ptr     tcl-interp-ptr)
  (obj-ptr        tcl-obj-ptr)
  (flags          :int))

(defcfun ("Tcl_DetachChannel" tcl-detach-channel) :int
  "/* 438 */ EXTERN int
Tcl_DetachChannel(Tcl_Interp *interp, Tcl_Channel channel);"
  (interp-ptr     tcl-interp-ptr)
  (chan           tcl-channel))

(defcfun ("Tcl_IsStandardChannel" tcl-is-standard-channel) :int
  "/* 439 */ EXTERN int Tcl_IsStandardChannel(Tcl_Channel channel);"
  (chan           tcl-channel))

(defcfun ("Tcl_FSCopyFile" tcl-fs-copy-file) :int
  "/* 440 */ EXTERN int
Tcl_FSCopyFile(Tcl_Obj *srcPathPtr, Tcl_Obj *destPathPtr);"
  (src-path-ptr   tcl-obj-ptr)
  (dest-path-ptr  tcl-obj-ptr))

(defcfun ("Tcl_FSCopyDirectory" tcl-fs-copy-directory) :int
  "/* 441 */ EXTERN int
Tcl_FSCopyDirectory(Tcl_Obj *srcPathPtr, Tcl_Obj *destPathPtr, Tcl_Obj **errorPtr);"
  (src-path-ptr   tcl-obj-ptr)
  (dest-path-ptr  tcl-obj-ptr)
  (error-ptr      (:pointer tcl-obj-ptr)))

(defcfun ("Tcl_FSCreateDirectory" Tcl_FSCreateDirectory) :int
  "/* 442 */ EXTERN int Tcl_FSCreateDirectory(Tcl_Obj *pathPtr);"
  (path-ptr  tcl-obj-ptr))

(defcfun ("Tcl_FSDeleteFile" tcl-fs-delete-file) :int
  "/* 443 */ EXTERN int Tcl_FSDeleteFile(Tcl_Obj *pathPtr);"
  (path-ptr  tcl-obj-ptr))

(defcfun ("Tcl_FSLoadFile" tcl-fs-load-file) :int
  "/* 444 */ EXTERN int
Tcl_FSLoadFile(
  Tcl_Interp *interp, Tcl_Obj *pathPtr,
  const char *sym1, const char *sym2,
  Tcl_LibraryInitProc **proc1Ptr,
  Tcl_LibraryInitProc **proc2Ptr,
  Tcl_LoadHandle *handlePtr,
  Tcl_FSUnloadFileProc **unloadProcPtr);"
  (interp-ptr     tcl-interp-ptr)
  (path-ptr       tcl-obj-ptr)
  (sym-1          :string)
  (sym-2          :string)
  (proc-1-ptr     (:pointer tcl-library-init-proc))
  (proc-2-ptr     (:pointer tcl-library-init-proc))
  (load-handle-ptr   tcl-load-handle-ptr)
  (unload-proc       (:pointer tcl-fs-unload-file-proc)))

(defcfun ("Tcl_FSMatchInDirectory" tcl-fs-match-in-directory) :int
  "/* 445 */ EXTERN int
Tcl_FSMatchInDirectory(
  Tcl_Interp *interp, Tcl_Obj *result, Tcl_Obj *pathPtr,
  const char *pattern, Tcl_GlobTypeData *types);"
  (interp-ptr     tcl-interp-ptr)
  (result         tcl-obj-ptr)
  (path-ptr       tcl-obj-ptr)
  (pattern        :string)
  (types          tcl-glob-type-data-ptr))

(defcfun ("Tcl_FSLink" tcl-fs-link) tcl-obj-ptr
  "/* 446 */ EXTERN Tcl_Obj *
Tcl_FSLink(Tcl_Obj *pathPtr, Tcl_Obj *toPtr, int linkAction);"
  (path-ptr     tcl-obj-ptr)
  (to-ptr       tcl-obj-ptr)
  (link-action  :int))

(defcfun ("Tcl_FSRemoveDirectory" tcl-fs-remove-directory) :int
  "/* 447 */ EXTERN int
Tcl_FSRemoveDirectory(Tcl_Obj *pathPtr, int recursive, Tcl_Obj **errorPtr);"
  (path-ptr  tcl-obj-ptr)
  (recursive :int)
  (error-ptr (:pointer tcl-obj-ptr)))

(defcfun ("Tcl_FSRenameFile" tcl-fs-rename-file) :int
  "/* 448 */ EXTERN int
Tcl_FSRenameFile(Tcl_Obj *srcPathPtr, Tcl_Obj *destPathPtr);"
  (src-path-ptr   tcl-obj-ptr)
  (dest-path-ptr  tcl-obj-ptr))

(defcfun ("Tcl_FSLstat" tcl-fs-lstat) :int
  "/* 449 */ EXTERN int Tcl_FSLstat(Tcl_Obj *pathPtr, Tcl_StatBuf *buf);"
  (path-ptr  tcl-obj-ptr)
  (buf       tcl-stat-buf-ptr))

(defcfun ("Tcl_FSUtime" tcl-fs-utime) :int
  "/* 450 */ EXTERN int Tcl_FSUtime(Tcl_Obj *pathPtr, struct utimbuf *tval);"
  (path-ptr  tcl-obj-ptr)
  (tval      :pointer))

(defcfun ("Tcl_FSFileAttrsGet" tcl-fs-file-attrs-get) :int
  "/* 451 */ EXTERN int
Tcl_FSFileAttrsGet(
  Tcl_Interp *interp, int index, Tcl_Obj *pathPtr, Tcl_Obj **objPtrRef);"
  (interp-ptr     tcl-interp-ptr)
  (index          :int)
  (path-ptr       tcl-obj-ptr)
  (obj-ptr-ref    (:pointer tcl-obj-ptr)))

(defcfun ("Tcl_FSFileAttrsSet" tcl-fs-file-attrs-set) :int
  "/* 452 */ EXTERN int
Tcl_FSFileAttrsSet(
  Tcl_Interp *interp, int index, Tcl_Obj *pathPtr, Tcl_Obj *objPtr);"
  (interp-ptr     tcl-interp-ptr)
  (index          :int)
  (path-ptr       tcl-obj-ptr)
  (obj-ptr        tcl-obj-ptr))

(defcfun ("Tcl_FSFileAttrStrings" tcl-fs-file-attr-strings)
  (:pointer (:pointer :char))
  "/* 453 */ EXTERN const char *const *
 Tcl_FSFileAttrStrings(Tcl_Obj *pathPtr, Tcl_Obj **objPtrRef);"
  (path-ptr  tcl-obj-ptr)
  (obj-ptr   (:pointer tcl-obj-ptr)))

(defcfun ("Tcl_FSStat" tcl-fs-stat) :int
  "/* 454 */ EXTERN int Tcl_FSStat(Tcl_Obj *pathPtr, Tcl_StatBuf *buf);"
  (path-ptr  tcl-obj-ptr)
  (buf       tcl-stat-buf-ptr))

(defcfun ("Tcl_FSAccess" tcl-fs-access) :int
  "/* 455 */ EXTERN int Tcl_FSAccess(Tcl_Obj *pathPtr, int mode);"
  (path-ptr  tcl-obj-ptr)
  (mode      :int))

(defcfun ("Tcl_FSOpenFileChannel" tcl-fs-open-file-channel) tcl-channel
  "/* 456 */ EXTERN Tcl_Channel
Tcl_FSOpenFileChannel(
  Tcl_Interp *interp, Tcl_Obj *pathPtr, const char *modeString, int permissions);"
  (interp-ptr     tcl-interp-ptr)
  (path-ptr       tcl-obj-ptr)
  (mode-string    :string)
  (permissions    :int))

(defcfun ("Tcl_FSGetCwd" tcl-fs-get-cwd) tcl-obj-ptr
  "/* 457 */ EXTERN Tcl_Obj * Tcl_FSGetCwd(Tcl_Interp *interp);"
  (interp-ptr     tcl-interp-ptr))

(defcfun ("Tcl_FSChdir" tcl-fs-chdir) :int
  "/* 458 */ EXTERN int Tcl_FSChdir(Tcl_Obj *pathPtr);"
  (path-ptr  tcl-obj-ptr))

(defcfun ("Tcl_FSConvertToPathType" tcl-fs-convert-to-path-type) :int
  "/* 459 */ EXTERN int
Tcl_FSConvertToPathType(Tcl_Interp *interp, Tcl_Obj *pathPtr);"
  (interp-ptr     tcl-interp-ptr)
  (path-ptr       tcl-obj-ptr))

(defcfun ("Tcl_FSJoinPath" tcl-fs-join-path) tcl-obj-ptr
  "/* 460 */ EXTERN Tcl_Obj *
Tcl_FSJoinPath(Tcl_Obj *listObj, Tcl_Size elements);"
  (list-obj  tcl-obj-ptr)
  (elements  tcl-size))

(defcfun ("TclFSSplitPath" tcl_fs-split-path) tcl-obj-ptr
  "/* 461 */ EXTERN Tcl_Obj * TclFSSplitPath(Tcl_Obj *pathPtr, void *lenPtr);"
  (path-ptr  tcl-obj-ptr)
  (len-ptr   :pointer))

(defcfun ("Tcl_FSEqualPaths" tcl-fs-equal-paths) :int
  "/* 462 */ EXTERN int Tcl_FSEqualPaths(Tcl_Obj *firstPtr, Tcl_Obj *secondPtr);"
  (first-ptr   tcl-obj-ptr)
  (second-ptr  tcl-obj-ptr))

(defcfun ("Tcl_FSGetNormalizedPath" tcl-fs-get-normalized-path) tcl-obj-ptr
  "/* 463 */ EXTERN Tcl_Obj *
Tcl_FSGetNormalizedPath(Tcl_Interp *interp, Tcl_Obj *pathPtr);"
  (interp-ptr     tcl-interp-ptr)
  (path-ptr       tcl-obj-ptr))

(defcfun ("Tcl_FSJoinToPath" tcl-fs-join-to-path) tcl-obj-ptr
  "/* 464 */ EXTERN Tcl_Obj *
Tcl_FSJoinToPath(Tcl_Obj *pathPtr, Tcl_Size objc, Tcl_Obj *const objv[]);"
  (path-ptr  tcl-obj-ptr)
  (objc      tcl-size)
  (objv      (:pointer tcl-obj-ptr)))

(defcfun ("Tcl_FSGetInternalRep" tcl-fs-get-internal-rep) client-data
  "/* 465 */ EXTERN void *
Tcl_FSGetInternalRep(Tcl_Obj *pathPtr, const Tcl_Filesystem *fsPtr);"
  (path-ptr  tcl-obj-ptr)
  (fs-ptr    tcl-filesystem-ptr))

(defcfun ("Tcl_FSGetTranslatedPath" tcl-fs-get-translated-path) tcl-obj-ptr
  "/* 466 */ EXTERN Tcl_Obj *
Tcl_FSGetTranslatedPath(Tcl_Interp *interp, Tcl_Obj *pathPtr);"
  (interp-ptr     tcl-interp-ptr)
  (path-ptr       tcl-obj-ptr))

(defcfun ("Tcl_FSEvalFile" tcl-fs-eval-file) :int
  "/* 467 */ EXTERN int
Tcl_FSEvalFile(Tcl_Interp *interp, Tcl_Obj *fileName);"
  (interp-ptr     tcl-interp-ptr)
  (file-name      tcl-obj-ptr))

(defcfun ("Tcl_FSNewNativePath" tcl-fs-new-native-path) tcl-obj-ptr
  "/* 468 */ EXTERN Tcl_Obj *
Tcl_FSNewNativePath(
  const Tcl_Filesystem *fromFilesystem, void *clientData);"
  (from-filesystem  tcl-filesystem-ptr)
  (client-data      client-data))

(defcfun ("Tcl_FSGetNativePath" tcl-fs-get-native-path) :pointer
  "/* 469 */ EXTERN const void * Tcl_FSGetNativePath(Tcl_Obj *pathPtr);"
  (path-ptr tcl-obj-ptr))

(defcfun ("Tcl_FSFileSystemInfo" tcl-fs-file-system-info) tcl-obj-ptr
  "/* 470 */ EXTERN Tcl_Obj * Tcl_FSFileSystemInfo(Tcl_Obj *pathPtr);"
  (path-ptr  tcl-obj-ptr))

(defcfun ("Tcl_FSPathSeparator" tcl-fs-path-separator) tcl-obj-ptr
  "/* 471 */ EXTERN Tcl_Obj * Tcl_FSPathSeparator(Tcl_Obj *pathPtr);"
  (path-ptr  tcl-obj-ptr))

(defcfun ("Tcl_FSListVolumes" tcl-fs-list-volumes) tcl-obj-ptr
  "/* 472 */ EXTERN Tcl_Obj * Tcl_FSListVolumes(void);")

(defcfun ("Tcl_FSRegister" tcl-fs-register) :int
  "/* 473 */ EXTERN int Tcl_FSRegister(void *clientData, const Tcl_Filesystem *fsPtr);"
  (client-data  client-data)
  (fs-ptr       tcl-filesystem-ptr))

(defcfun ("Tcl_FSUnregister" tcl-fs-unregister) :int
  "/* 474 */ EXTERN int Tcl_FSUnregister(const Tcl_Filesystem *fsPtr);"
  (fs-ptr       tcl-filesystem-ptr))

(defcfun ("Tcl_FSData" tcl-fs-data) client-data
  "/* 475 */ EXTERN void * Tcl_FSData(const Tcl_Filesystem *fsPtr);"
  (fs-ptr       tcl-filesystem-ptr))

(defcfun ("Tcl_FSGetTranslatedStringPath" tcl-fs-get-translated-string-path)
  :string
  "/* 476 */ EXTERN const char *
Tcl_FSGetTranslatedStringPath(
  Tcl_Interp *interp, Tcl_Obj *pathPtr);"
  (interp-ptr  tcl-interp-ptr)
  (path-ptr    tcl-obj-ptr))

(defcfun ("Tcl_FSGetFileSystemForPath" tcl-fs-get-file-system-for-path)
  tcl-filesystem-ptr
  "/* 477 */ EXTERN const Tcl_Filesystem *
Tcl_FSGetFileSystemForPath(Tcl_Obj *pathPtr);"
  (path-ptr  tcl-obj-ptr))

(defcfun ("Tcl_FSGetPathType" tcl-fs-get-path-type) tcl-path-type
  "/* 478 */ EXTERN Tcl_PathType Tcl_FSGetPathType(Tcl_Obj *pathPtr);"
  (path-ptr  tcl-obj-ptr))

(defcfun ("Tcl_OutputBuffered" tcl-output-buffered) :int
  "/* 479 */ EXTERN int Tcl_OutputBuffered(Tcl_Channel chan);"
  (chan           tcl-channel))

(defcfun ("Tcl_FSMountsChanged" tcl-fs-mounts-changed) :void
  "/* 480 */ EXTERN void Tcl_FSMountsChanged(const Tcl_Filesystem *fsPtr);"
  (fs-ptr  tcl-filesystem-ptr))

(defcfun ("Tcl_EvalTokensStandard" tcl-eval-tokens-standard) :int
  "/* 481 */ EXTERN int
Tcl_EvalTokensStandard(Tcl_Interp *interp, Tcl_Token *tokenPtr, Tcl_Size count);"
  (interp-ptr   tcl-interp-ptr)
  (token-ptr    tcl-token-ptr)
  (count        tcl-size))

(defcfun ("Tcl_GetTime" tcl-get-time) :void
  "/* 482 */ EXTERN void Tcl_GetTime(Tcl_Time *timeBuf);"
  (time-buf  tcl-time-ptr))

(defcfun ("Tcl_CreateObjTrace" tcl-create-obj-trace) tcl-trace
  "/* 483 */ EXTERN Tcl_Trace
Tcl_CreateObjTrace(
  Tcl_Interp *interp, Tcl_Size level, int flags,
  Tcl_CmdObjTraceProc *objProc, void *clientData,
  Tcl_CmdObjTraceDeleteProc *delProc);"
  (interp-ptr     tcl-interp-ptr)
  (level          tcl-size)
  (flags          :int)
  (obj-proc       tcl-cmd-obj-trace-proc)
  (client-data    client-data)
  (del-proc       tcl-cmd-obj-trace-delete-proc))

(defcfun ("Tcl_GetCommandInfoFromToken" tcl-get-command-info-from-token) :int
  "/* 484 */ EXTERN int
Tcl_GetCommandInfoFromToken(Tcl_Command token, Tcl_CmdInfo *infoPtr);"
  (token         tcl-command)
  (cmd-info-ptr  tcl-cmd-info-ptr))

(defcfun ("Tcl_SetCommandInfoFromToken" tcl-set-command-info-from-token) :int
  "/* 485 */ EXTERN int
Tcl_SetCommandInfoFromToken(Tcl_Command token, const Tcl_CmdInfo *infoPtr);"
  (token         tcl-command)
  (cmd-info-ptr  tcl-cmd-info-ptr))

(defcfun ("Tcl_DbNewWideIntObj" tcl-db-new-wide-int-obj) tcl-obj-ptr
  "/* 486 */ EXTERN Tcl_Obj *
Tcl_DbNewWideIntObj(Tcl_WideInt wideValue, const char *file, int line);"
  (wide-value  tcl-wide-int)
  (file        :string)
  (line        :int))

(defcfun ("Tcl_GetWideIntFromObj" tcl-get-wide-int-from-obj) :int
  "/* 487 */ EXTERN int
Tcl_GetWideIntFromObj(Tcl_Interp *interp, Tcl_Obj *objPtr, Tcl_WideInt *widePtr);"
  (interp-ptr  tcl-interp-ptr)
  (obj-ptr     tcl-obj-ptr)
  (wide-ptr    (:pointer tcl-wide-int)))

(defcfun ("Tcl_NewWideIntObj" tcl-new-wide-int-obj) tcl-obj-ptr
  "/* 488 */ EXTERN Tcl_Obj * Tcl_NewWideIntObj(Tcl_WideInt wideValue);"
  (wide-value  tcl-wide-int))

(defcfun ("Tcl_SetWideIntObj" tcl-set-wide-int-obj) :void
  "/* 489 */ EXTERN void Tcl_SetWideIntObj(Tcl_Obj *objPtr, Tcl_WideInt wideValue);"
  (obj-ptr     tcl-obj-ptr)
  (wide-value  tcl-wide-int))

(defcfun ("Tcl_AllocStatBuf" tcl-alloc-stat-buf) tcl-stat-buf-ptr
  "/* 490 */ EXTERN Tcl_StatBuf * Tcl_AllocStatBuf(void);")

(defcfun ("Tcl_Seek" tcl-seek) :long-long
  "/* 491 */ EXTERN long long
Tcl_Seek(Tcl_Channel chan, long long offset, int mode);"
  (chan     tcl-channel)
  (offset   :long-long)
  (mode     :int))

(defcfun ("Tcl_Tell" tcl-tell) :long-long
  "/* 492 */ EXTERN long long Tcl_Tell(Tcl_Channel chan);"
  (chan           tcl-channel))

(defcfun ("Tcl_ChannelWideSeekProc" tcl-channel-wide-seek-proc)
  tcl-driver-wide-seek-proc
  "/* 493 */ EXTERN Tcl_DriverWideSeekProc *
Tcl_ChannelWideSeekProc(const Tcl_ChannelType *chanTypePtr);"
  (chan-type-ptr  tcl-channel-type-ptr))

(defcfun ("Tcl_DictObjPut" tcl-dict-obj-put) :int
  "/* 494 */ EXTERN int
Tcl_DictObjPut(
  Tcl_Interp *interp, Tcl_Obj *dictPtr, Tcl_Obj *keyPtr, Tcl_Obj *valuePtr);"
  (interp-ptr     tcl-interp-ptr)
  (dict-ptr       tcl-obj-ptr)
  (key-ptr        tcl-obj-ptr)
  (value-ptr      tcl-obj-ptr))

(defcfun ("Tcl_DictObjGet" tcl-dict-obj-get) :int
  "/* 495 */ EXTERN int
Tcl_DictObjGet(
  Tcl_Interp *interp, Tcl_Obj *dictPtr,
  Tcl_Obj *keyPtr, Tcl_Obj **valuePtrPtr);"
  (interp-ptr     tcl-interp-ptr)
  (dict-ptr       tcl-obj-ptr)
  (key-ptr        tcl-obj-ptr)
  (value-ptr-ptr  (:pointer tcl-obj-ptr)))

(defcfun ("Tcl_DictObjRemove" tcl-dict-obj-remove) :int
  "/* 496 */ EXTERN int
Tcl_DictObjRemove(Tcl_Interp *interp, Tcl_Obj *dictPtr, Tcl_Obj *keyPtr);"
  (interp-ptr     tcl-interp-ptr)
  (dict-ptr       tcl-obj-ptr)
  (key-ptr        tcl-obj-ptr))

(defcfun ("TclDictObjSize" tcl_dict-obj-size) :int
  "/* 497 */ EXTERN int
TclDictObjSize(Tcl_Interp *interp, Tcl_Obj *dictPtr, void *sizePtr);"
  (interp-ptr     tcl-interp-ptr)
  (dict-ptr       tcl-obj-ptr)
  (size-ptr       :pointer))

(defcfun ("Tcl_DictObjFirst" tcl-dict-obj-first) :int
  "/* 498 */ EXTERN int
Tcl_DictObjFirst(
  Tcl_Interp *interp,
  Tcl_Obj *dictPtr, Tcl_DictSearch *searchPtr,
  Tcl_Obj **keyPtrPtr, Tcl_Obj **valuePtrPtr,
  int *donePtr);"
  (interp-ptr     tcl-interp-ptr)
  (dict-ptr       tcl-obj-ptr)
  (search-ptr     tcl-dict-search-ptr)
  (key-ptr-ptr    (:pointer tcl-obj-ptr))
  (value-ptr-ptr  (:pointer tcl-obj-ptr))
  (done-ptr       (:pointer :int)))

(defcfun ("Tcl_DictObjNext" tcl-dict-obj-next) :void
  "/* 499 */ EXTERN void
Tcl_DictObjNext(
  Tcl_DictSearch *searchPtr, Tcl_Obj **keyPtrPtr, Tcl_Obj **valuePtrPtr,
  int *donePtr);"
  (search-ptr     tcl-dict-search-ptr)
  (key-ptr-ptr    (:pointer tcl-obj-ptr))
  (value-ptr-ptr  (:pointer tcl-obj-ptr))
  (done-ptr       (:pointer :int)))

(defcfun ("Tcl_DictObjDone" tcl-dict-obj-done) :void
  "/* 500 */ EXTERN void Tcl_DictObjDone(Tcl_DictSearch *searchPtr);"
  (search-ptr     tcl-dict-search-ptr))

(defcfun ("Tcl_DictObjPutKeyList" tcl-dict-obj-put-key-list) :int
  "/* 501 */ EXTERN int
Tcl_DictObjPutKeyList(
  Tcl_Interp *interp, Tcl_Obj *dictPtr, Tcl_Size keyc,
  Tcl_Obj *const *keyv, Tcl_Obj *valuePtr);"
  (interp-ptr     tcl-interp-ptr)
  (dict-ptr       tcl-obj-ptr)
  (keyc           tcl-size)
  (keyv           (:pointer tcl-obj-ptr))
  (value-ptr      tcl-obj-ptr))

(defcfun ("Tcl_DictObjRemoveKeyList" tcl-dict-obj-remove-key-list) :int
  "/* 502 */ EXTERN int
Tcl_DictObjRemoveKeyList(
  Tcl_Interp *interp, Tcl_Obj *dictPtr,
  Tcl_Size keyc, Tcl_Obj *const *keyv);"
  (interp-ptr     tcl-interp-ptr)
  (dict-ptr       tcl-obj-ptr)
  (keyc           tcl-size)
  (keyv           (:pointer tcl-obj-ptr)))

(defcfun ("Tcl_NewDictObj" tcl-new-dict-obj) tcl-obj-ptr
  "/* 503 */ EXTERN Tcl_Obj * Tcl_NewDictObj(void);")

(defcfun ("Tcl_DbNewDictObj" tcl-db-new-dict-obj) tcl-obj-ptr
  "/* 504 */ EXTERN Tcl_Obj * Tcl_DbNewDictObj(const char *file, int line);"
  (file :string) (line :int))

(defcfun ("Tcl_RegisterConfig" tcl-register-config) :void
  "/* 505 */ EXTERN void
Tcl_RegisterConfig(
  Tcl_Interp *interp, const char *pkgName,
  const Tcl_Config *configuration, const char *valEncoding);"
  (interp-ptr     tcl-interp-ptr)
  (pkg-name       :string)
  (configuration  tcl-config-ptr)
  (val-encoding   :string))

(defcfun ("Tcl_CreateNamespace" tcl-create-namespace) tcl-namespace-ptr
  "/* 506 */ EXTERN Tcl_Namespace *
Tcl_CreateNamespace(
  Tcl_Interp *interp, const char *name, void *clientData,
  Tcl_NamespaceDeleteProc *deleteProc);"
  (interp-ptr             tcl-interp-ptr)
  (name                   :string)
  (client-data            client-data)
  (namespace-delete-proc  tcl-namespace-delete-proc))

(defcfun ("Tcl_DeleteNamespace" tcl-delete-namespace) :void
  "/* 507 */ EXTERN void Tcl_DeleteNamespace(Tcl_Namespace *nsPtr);"
  (ns-ptr  tcl-namespace-ptr))

(defcfun ("Tcl_AppendExportList" tcl-append-export-list) :int
  "/* 508 */ EXTERN int
Tcl_AppendExportList(Tcl_Interp *interp, Tcl_Namespace *nsPtr, Tcl_Obj *objPtr);"
  (interp-ptr     tcl-interp-ptr)
  (ns-ptr         tcl-namespace-ptr)
  (obj-ptr        tcl-obj-ptr))

(defcfun ("Tcl_Export" tcl-export) :int
  "/* 509 */ EXTERN int
Tcl_Export(
  Tcl_Interp *interp, Tcl_Namespace *nsPtr, const char *pattern, int resetListFirst);"
  (interp-ptr     tcl-interp-ptr)
  (ns-ptr         tcl-namespace-ptr)
  (pattern        :string)
  (reset-list-first  :int))

(defcfun ("Tcl_Import" tcl-import) :int
  "/* 510 */ EXTERN int
Tcl_Import(
  Tcl_Interp *interp, Tcl_Namespace *nsPtr, const char *pattern, int allowOverwrite);"
  (interp-ptr     tcl-interp-ptr)
  (ns-ptr         tcl-namespace-ptr)
  (pattern        :string)
  (allow-overwrite  :int))

(defcfun ("Tcl_ForgetImport" tcl-forget-import) :int
  "/* 511 */ EXTERN int
Tcl_ForgetImport(Tcl_Interp *interp, Tcl_Namespace *nsPtr, const char *pattern);"
  (interp-ptr     tcl-interp-ptr)
  (ns-ptr         tcl-namespace-ptr)
  (pattern        :string))

(defcfun ("Tcl_GetCurrentNamespace" tcl-get-current-namespace)
  tcl-namespace-ptr
  "/* 512 */ EXTERN Tcl_Namespace * Tcl_GetCurrentNamespace(Tcl_Interp *interp);"
  (interp-ptr     tcl-interp-ptr))

(defcfun ("Tcl_GetGlobalNamespace" tcl-get-global-namespace)
  tcl-namespace-ptr
  "/* 513 */ EXTERN Tcl_Namespace * Tcl_GetGlobalNamespace(Tcl_Interp *interp);"
  (interp-ptr     tcl-interp-ptr))

(defcfun ("Tcl_FindNamespace" tcl-find-namespace) tcl-namespace-ptr
  "/* 514 */ EXTERN Tcl_Namespace *
Tcl_FindNamespace(
  Tcl_Interp *interp, const char *name, Tcl_Namespace *contextNsPtr, int flags);"
  (interp-ptr     tcl-interp-ptr)
  (name           :string)
  (context-ns-ptr tcl-namespace-ptr)
  (flags          :int))

(defcfun ("Tcl_FindCommand" tcl-find-command) tcl-command
  "/* 515 */ EXTERN Tcl_Command
Tcl_FindCommand(
  Tcl_Interp *interp, const char *name,
  Tcl_Namespace *contextNsPtr, int flags);"
  (interp-ptr     tcl-interp-ptr)
  (name           :string)
  (context-ns-ptr tcl-namespace-ptr)
  (flags          :int))

(defcfun ("Tcl_GetCommandFromObj" tcl-get-command-from-obj) tcl-command
  "/* 516 */ EXTERN Tcl_Command
Tcl_GetCommandFromObj(Tcl_Interp *interp, Tcl_Obj *objPtr);"
  (interp-ptr     tcl-interp-ptr)
  (obj-ptr        tcl-obj-ptr))

(defcfun ("Tcl_GetCommandFullName" tcl-get-command-full-name) :void
  "/* 517 */ EXTERN void
Tcl_GetCommandFullName(Tcl_Interp *interp, Tcl_Command command, Tcl_Obj *objPtr);"
  (interp-ptr     tcl-interp-ptr)
  (command        tcl-command)
  (obj-ptr        tcl-obj-ptr))

(defcfun ("Tcl_FSEvalFileEx" tcl-fs-eval-file-ex) :int
  "/* 518 */ EXTERN int
Tcl_FSEvalFileEx(Tcl_Interp *interp, Tcl_Obj *fileName, const char *encodingName);"
  (interp-ptr     tcl-interp-ptr)
  (file-name      tcl-obj-ptr)
  (encoding-name  :string))

;; /* Slot 519 is reserved */

(defcfun ("Tcl_LimitAddHandler" tcl-limit-add-handler) :void
  "/* 520 */ EXTERN void
Tcl_LimitAddHandler(
  Tcl_Interp *interp, int type,
  Tcl_LimitHandlerProc *handlerProc,
  void *clientData,
  Tcl_LimitHandlerDeleteProc *deleteProc);"
  (interp-ptr     tcl-interp-ptr)
  (type           :int)
  (handler-proc   tcl-limit-handler-proc)
  (client-data    client-data)
  (delete-proc    tcl-limit-handler-delete-proc))

(defcfun ("Tcl_LimitRemoveHandler" tcl-limit-remove-handler) :void
  "/* 521 */ EXTERN void
Tcl_LimitRemoveHandler(
  Tcl_Interp *interp, int type,
  Tcl_LimitHandlerProc *handlerProc, void *clientData);"
  (interp-ptr     tcl-interp-ptr)
  (type           :int)
  (handler-proc   tcl-limit-handler-proc)
  (client-data    client-data))

(defcfun ("Tcl_LimitReady" tcl-limit-ready) :int
  "/* 522 */ EXTERN int Tcl_LimitReady(Tcl_Interp *interp);"
  (interp-ptr     tcl-interp-ptr))

(defcfun ("Tcl_LimitCheck" tcl-limit-check) :int
  "/* 523 */ EXTERN int Tcl_LimitCheck(Tcl_Interp *interp);"
  (interp-ptr     tcl-interp-ptr))

(defcfun ("Tcl_LimitExceeded" tcl-limit-exceeded) :int
  "/* 524 */ EXTERN int Tcl_LimitExceeded(Tcl_Interp *interp);"
  (interp-ptr     tcl-interp-ptr))

(defcfun ("Tcl_LimitSetCommands" tcl-limit-set-commands) :void
  "/* 525 */ EXTERN void
Tcl_LimitSetCommands(Tcl_Interp *interp, Tcl_Size commandLimit);"
  (interp-ptr     tcl-interp-ptr)
  (command-limit  tcl-size))

(defcfun ("Tcl_LimitSetTime" tcl-limit-set-time) :void
  "/* 526 */ EXTERN void
Tcl_LimitSetTime(Tcl_Interp *interp, Tcl_Time *timeLimitPtr);"
  (interp-ptr     tcl-interp-ptr)
  (time-limit-ptr tcl-time-ptr))

(defcfun ("Tcl_LimitSetGranularity" tcl-limit-set-granularity) :void
  "/* 527 */ EXTERN void
Tcl_LimitSetGranularity(Tcl_Interp *interp, int type, int granularity);"
  (interp-ptr     tcl-interp-ptr)
  (type           :int)
  (granularity    :int))

(defcfun ("Tcl_LimitTypeEnabled" tcl-limit-type-enabled) :int
  "/* 528 */ EXTERN int Tcl_LimitTypeEnabled(Tcl_Interp *interp, int type);"
  (interp-ptr     tcl-interp-ptr)
  (type           :int))

(defcfun ("Tcl_LimitTypeExceeded" tcl-limit-type-exceeded) :int
  "/* 529 */ EXTERN int Tcl_LimitTypeExceeded(Tcl_Interp *interp, int type);"
  (interp-ptr     tcl-interp-ptr)
  (type           :int))

(defcfun ("Tcl_LimitTypeSet" tcl-limit-type-set) :void
  "/* 530 */ EXTERN void Tcl_LimitTypeSet(Tcl_Interp *interp, int type);"
  (interp-ptr     tcl-interp-ptr)
  (type           :int))

(defcfun ("Tcl_LimitTypeReset" tcl-limit-type-reset) :void
  "/* 531 */ EXTERN void Tcl_LimitTypeReset(Tcl_Interp *interp, int type);"
  (interp-ptr     tcl-interp-ptr)
  (type           :int))

(defcfun ("Tcl_LimitGetCommands" tcl-limit-get-commands) :int
  "/* 532 */ EXTERN int Tcl_LimitGetCommands(Tcl_Interp *interp);"
  (interp-ptr     tcl-interp-ptr))

(defcfun ("Tcl_LimitGetTime" tcl-limit-get-time) :void
  "/* 533 */ EXTERN void Tcl_LimitGetTime(Tcl_Interp *interp, Tcl_Time *timeLimitPtr);"
  (interp-ptr      tcl-interp-ptr)
  (time-limit-ptr  tcl-time-ptr))

(defcfun ("Tcl_LimitGetGranularity" tcl-limit-get-granularity) :int
  "/* 534 */ EXTERN int Tcl_LimitGetGranularity(Tcl_Interp *interp, int type);"
  (interp-ptr     tcl-interp-ptr)
  (type           :int))

(defcfun ("Tcl_SaveInterpState" tcl-save-interp-state) tcl-interp-state
  "/* 535 */ EXTERN Tcl_InterpState
Tcl_SaveInterpState(Tcl_Interp *interp, int status);"
  (interp-ptr     tcl-interp-ptr)
  (status         :int))

(defcfun ("Tcl_RestoreInterpState" tcl-restore-interp-state) :int
  "/* 536 */ EXTERN int
Tcl_RestoreInterpState(Tcl_Interp *interp, Tcl_InterpState state);"
  (interp-ptr     tcl-interp-ptr)
  (state          tcl-interp-state))

(defcfun ("Tcl_DiscardInterpState" tcl-discard-interp-state) :void
  "/* 537 */ EXTERN void Tcl_DiscardInterpState(Tcl_InterpState state);"
  (state          tcl-interp-state))

(defcfun ("Tcl_SetReturnOptions" tcl-set-return-options) :int
  "/* 538 */ EXTERN int
Tcl_SetReturnOptions(Tcl_Interp *interp, Tcl_Obj *options);"
  (interp-ptr     tcl-interp-ptr)
  (options        tcl-obj-ptr))

(defcfun ("Tcl_GetReturnOptions" tcl-get-return-options) tcl-obj-ptr
  "/* 539 */ EXTERN Tcl_Obj *
Tcl_GetReturnOptions(Tcl_Interp *interp, int result);"
  (interp-ptr     tcl-interp-ptr)
  (result         :int))

(defcfun ("Tcl_IsEnsemble" tcl-is-ensemble) :int
  "/* 540 */ EXTERN int Tcl_IsEnsemble(Tcl_Command token);"
  (token  tcl-command))

(defcfun ("Tcl_CreateEnsemble" tcl-create-ensemble) tcl-command
  "/* 541 */ EXTERN Tcl_Command
Tcl_CreateEnsemble(
  Tcl_Interp *interp, const char *name, Tcl_Namespace *namespacePtr, int flags);"
  (interp-ptr     tcl-interp-ptr)
  (name           :string)
  (namespace-ptr  tcl-namespace-ptr)
  (flags          :int))

(defcfun ("Tcl_FindEnsemble" tcl-find-ensemble) tcl-command
  "/* 542 */ EXTERN Tcl_Command
Tcl_FindEnsemble(Tcl_Interp *interp, Tcl_Obj *cmdNameObj, int flags);"
  (interp-ptr     tcl-interp-ptr)
  (cmd-name-obj   tcl-obj-ptr)
  (flags          :int))

(defcfun ("Tcl_SetEnsembleSubcommandList" tcl-set-ensemble-subcommand-list) :int
  "/* 543 */ EXTERN int
Tcl_SetEnsembleSubcommandList(
  Tcl_Interp *interp,Tcl_Command token, Tcl_Obj *subcmdList);"
  (interp-ptr     tcl-interp-ptr)
  (token          tcl-command)
  (subcmd-list    tcl-obj-ptr))

(defcfun ("Tcl_SetEnsembleMappingDict" tcl-set-ensemble-mapping-dict) :int
  "/* 544 */ EXTERN int
Tcl_SetEnsembleMappingDict(Tcl_Interp *interp, Tcl_Command token, Tcl_Obj *mapDict);"
  (interp-ptr     tcl-interp-ptr)
  (token          tcl-command)
  (map-dict       tcl-obj-ptr))

(defcfun ("Tcl_SetEnsembleUnknownHandler" tcl-set-ensemble-unknown-handler) :int
  "/* 545 */ EXTERN int
Tcl_SetEnsembleUnknownHandler(
  Tcl_Interp *interp, Tcl_Command token, Tcl_Obj *unknownList);"
  (interp-ptr     tcl-interp-ptr)
  (token          tcl-command)
  (unknown-list   tcl-obj-ptr))

(defcfun ("Tcl_SetEnsembleFlags" tcl-set-ensemble-flags) :int
  "/* 546 */ EXTERN int
Tcl_SetEnsembleFlags(Tcl_Interp *interp, Tcl_Command token, int flags);"
  (interp-ptr     tcl-interp-ptr)
  (token          tcl-command)
  (flags          :int))

(defcfun ("Tcl_GetEnsembleSubcommandList" tcl-get-ensemble-subcommand-list) :int
  "/* 547 */ EXTERN int
Tcl_GetEnsembleSubcommandList(
  Tcl_Interp *interp, Tcl_Command token, Tcl_Obj **subcmdListPtr);"
  (interp-ptr       tcl-interp-ptr)
  (token            tcl-command)
  (subcmd-list-ptr  (:pointer tcl-obj-ptr)))

(defcfun ("Tcl_GetEnsembleMappingDict" tcl-get-ensemble-mapping-dict) :int
  "/* 548 */ EXTERN int
Tcl_GetEnsembleMappingDict(
  Tcl_Interp *interp, Tcl_Command token, Tcl_Obj **mapDictPtr);"
  (interp-ptr     tcl-interp-ptr)
  (token          tcl-command)
  (map-dict-ptr   (:pointer tcl-obj-ptr)))

(defcfun ("Tcl_GetEnsembleUnknownHandler" tcl-get-ensemble-unknown-handler) :int
  "/* 549 */ EXTERN int
Tcl_GetEnsembleUnknownHandler(
  Tcl_Interp *interp, Tcl_Command token, Tcl_Obj **unknownListPtr);"
  (interp-ptr        tcl-interp-ptr)
  (token             tcl-command)
  (unknown-list-ptr  (:pointer tcl-obj-ptr)))

(defcfun ("Tcl_GetEnsembleFlags" tcl-get-ensemble-flags) :int
  "/* 550 */ EXTERN int
Tcl_GetEnsembleFlags(Tcl_Interp *interp, Tcl_Command token, int *flagsPtr);"
  (interp-ptr     tcl-interp-ptr)
  (token          tcl-command)
  (flags-ptr      (:pointer :int)))

(defcfun ("Tcl_GetEnsembleNamespace" tcl-get-ensemble-namespace) :int
  "/* 551 */ EXTERN int
Tcl_GetEnsembleNamespace(
  Tcl_Interp *interp, Tcl_Command token, Tcl_Namespace **namespacePtrPtr);"
  (interp-ptr     tcl-interp-ptr)
  (token          tcl-command)
  (namespace-ptr  (:pointer tcl-namespace-ptr)))

(defcfun ("Tcl_SetTimeProc" tcl-set-time-proc) :void
  "/* 552 */ EXTERN void
Tcl_SetTimeProc(
  Tcl_GetTimeProc *getProc,
  Tcl_ScaleTimeProc *scaleProc,
  void *clientData);
"
  (get-time-proc   tcl-get-time-proc)
  (scale-time-proc tcl-scale-time-proc)
  (client-data     client-data))

(defcfun ("Tcl_QueryTimeProc" tcl-query-time-proc) :void
  "/* 553 */ EXTERN void
Tcl_QueryTimeProc(
  Tcl_GetTimeProc **getProc, Tcl_ScaleTimeProc **scaleProc, void **clientData);"
  (get-time-proc-ptr    (:pointer tcl-get-time-proc))
  (scale-time-proc-ptr  (:pointer tcl-scale-time-proc))
  (client-data          (:pointer client-data)))

(defcfun ("Tcl_ChannelThreadActionProc" tcl-channel-thread-action-proc)
  tcl-driver-thread-action-proc
  "/* 554 */ EXTERN Tcl_DriverThreadActionProc *
Tcl_ChannelThreadActionProc(const Tcl_ChannelType *chanTypePtr);"
  (chan-type-ptr tcl-channel-type-ptr))

(defcfun ("Tcl_NewBignumObj" tcl-new-bignum-obj) tcl-obj-ptr
  "/* 555 */ EXTERN Tcl_Obj * Tcl_NewBignumObj(void *value);"
  (value  mp-int-ptr))

(defcfun ("Tcl_DbNewBignumObj" tcl-db-new-bignum-obj) tcl-obj-ptr
  "/* 556 */ EXTERN Tcl_Obj *
Tcl_DbNewBignumObj(void *value, const char *file, int line);"
  (value  mp-int-ptr)
  (file   :string)
  (line   :int))

(defcfun ("Tcl_SetBignumObj" tcl-set-bignum-obj) :void
  "/* 557 */ EXTERN void Tcl_SetBignumObj(Tcl_Obj *obj, void *value);"
  (obj    tcl-obj-ptr)
  (value  :pointer))

(defcfun ("Tcl_GetBignumFromObj" tcl-get-bignum-from-obj) :int
  "/* 558 */ EXTERN int
Tcl_GetBignumFromObj(Tcl_Interp *interp, Tcl_Obj *obj, void *value);"
  (interp-ptr     tcl-interp-ptr)
  (obj            tcl-obj-ptr)
  (value          :pointer))

(defcfun ("Tcl_TakeBignumFromObj" tcl-take-bignum-from-obj) :int
  "/* 559 */ EXTERN int
Tcl_TakeBignumFromObj(Tcl_Interp *interp, Tcl_Obj *obj, void *value);"
  (interp-ptr     tcl-interp-ptr)
  (obj            tcl-obj-ptr)
  (value          :pointer))

(defcfun ("Tcl_TruncateChannel" tcl-truncate-channel) :int
  "/* 560 */ EXTERN int
Tcl_TruncateChannel(Tcl_Channel chan, long long length);"
  (chan    tcl-channel)
  (length  :long-long))

(defcfun ("Tcl_ChannelTruncateProc" tcl-channel-truncate-proc)
  tcl-driver-thread-action-proc
  "/* 561 */ EXTERN Tcl_DriverTruncateProc *
Tcl_ChannelTruncateProc(const Tcl_ChannelType *chanTypePtr);"
  (chan-type-ptr  tcl-channel-type-ptr))

(defcfun ("Tcl_SetChannelErrorInterp" tcl-set-channel-error-interp) :void
  "/* 562 */ EXTERN void
Tcl_SetChannelErrorInterp(Tcl_Interp *interp, Tcl_Obj *msg);"
  (interp-ptr     tcl-interp-ptr)
  (msg            tcl-obj-ptr))

(defcfun ("Tcl_GetChannelErrorInterp" tcl-get-channel-error-interp) :void
  "/* 563 */ EXTERN void
Tcl_GetChannelErrorInterp(Tcl_Interp *interp, Tcl_Obj **msg);"
  (interp-ptr     tcl-interp-ptr)
  (msg            (:pointer tcl-obj-ptr)))

(defcfun ("Tcl_SetChannelError" tcl-set-channel-error) :void
  "/* 564 */ EXTERN void Tcl_SetChannelError(Tcl_Channel chan, Tcl_Obj *msg);"
  (chan  tcl-channel)
  (msg   tcl-obj-ptr))

(defcfun ("Tcl_GetChannelError" tcl-get-channel-error) :void
  "/* 565 */ EXTERN void Tcl_GetChannelError(Tcl_Channel chan, Tcl_Obj **msg);"
  (chan  tcl-channel)
  (msg   (:pointer tcl-obj-ptr)))

(defcfun ("Tcl_InitBignumFromDouble" tcl-init-bignum-from-double) :int
  "/* 566 */ EXTERN int
Tcl_InitBignumFromDouble(Tcl_Interp *interp, double initval, void *toInit);"
  (interp-ptr     tcl-interp-ptr)
  (initval        :double)
  (to-init        :pointer))

(defcfun ("Tcl_GetNamespaceUnknownHandler" tcl-get-namespace-unknown-handler)
  tcl-obj-ptr
  "/* 567 */ EXTERN Tcl_Obj *
Tcl_GetNamespaceUnknownHandler(Tcl_Interp *interp, Tcl_Namespace *nsPtr);"
  (interp-ptr     tcl-interp-ptr)
  (ns-ptr         tcl-namespace-ptr))

(defcfun ("Tcl_SetNamespaceUnknownHandler" tcl-set-namespace-unknown-handler) :int
  "/* 568 */ EXTERN int
Tcl_SetNamespaceUnknownHandler(
  Tcl_Interp *interp, Tcl_Namespace *nsPtr, Tcl_Obj *handlerPtr);"
  (interp-ptr     tcl-interp-ptr)
  (ns-ptr         tcl-namespace-ptr)
  (handler-ptr    tcl-obj-ptr))

(defcfun ("Tcl_GetEncodingFromObj" tcl-get-encoding-from-obj) :int
  "/* 569 */ EXTERN int
Tcl_GetEncodingFromObj(
  Tcl_Interp *interp, Tcl_Obj *objPtr, Tcl_Encoding *encodingPtr);"
  (interp-ptr     tcl-interp-ptr)
  (obj-ptr        tcl-obj-ptr)
  (encoding-ptr   tcl-encoding-ptr))

(defcfun ("Tcl_GetEncodingSearchPath" tcl-get-encoding-search-path) tcl-obj-ptr
  "/* 570 */ EXTERN Tcl_Obj * Tcl_GetEncodingSearchPath(void);")

(defcfun ("Tcl_SetEncodingSearchPath" tcl-set-encoding-search-path) :int
  "/* 571 */ EXTERN int Tcl_SetEncodingSearchPath(Tcl_Obj *searchPath);"
  (search-ptr  tcl-obj-ptr))

(defcfun ("Tcl_GetEncodingNameFromEnvironment" tcl-get-encoding-name-from-environment)
  :string
  "/* 572 */ EXTERN const char *
Tcl_GetEncodingNameFromEnvironment(Tcl_DString *bufPtr);"
  (buf-ptr  tcl-d-string-ptr))

(defcfun ("Tcl_PkgRequireProc" tcl-pkg-require-proc) :int
  "/* 573 */ EXTERN int
Tcl_PkgRequireProc(
  Tcl_Interp *interp, const char *name, Tcl_Size objc,
  Tcl_Obj *const objv[], void *clientDataPtr);"
  (interp-ptr         tcl-interp-ptr)
  (name               :string)
  (objc               tcl-size)
  (objv               (:pointer tcl-obj-ptr))
  (client-data-ptr    :pointer))

(defcfun ("Tcl_AppendObjToErrorInfo" tcl-append-obj-to-error-info) :void
  "/* 574 */ EXTERN void
Tcl_AppendObjToErrorInfo(Tcl_Interp *interp, Tcl_Obj *objPtr);"
  (interp-ptr     tcl-interp-ptr)
  (obj-ptr        tcl-obj-ptr))

(defcfun ("Tcl_AppendLimitedToObj" tcl-append-limited-to-obj) :void
  "/* 575 */ EXTERN void
Tcl_AppendLimitedToObj(
  Tcl_Obj *objPtr,
  const char *bytes, Tcl_Size length,
  Tcl_Size limit, const char *ellipsis);"
  (obj-ptr  tcl-obj-ptr)
  (bytes    (:pointer :char))
  (length   tcl-size)
  (limit    tcl-size)
  (ellipsis (:pointer :char)))

(defcfun ("Tcl_Format" tcl-format) tcl-obj-ptr
  "/* 576 */ EXTERN Tcl_Obj *
Tcl_Format(
  Tcl_Interp *interp, const char *format,
  Tcl_Size objc, Tcl_Obj *const objv[]);"
  (interp-ptr     tcl-interp-ptr)
  (format         :string)
  (objc           tcl-size)
  (objv           (:pointer tcl-obj-ptr)))

(defcfun ("Tcl_AppendFormatToObj" tcl-append-format-to-obj) :int
  "/* 577 */ EXTERN int
Tcl_AppendFormatToObj(
  Tcl_Interp *interp, Tcl_Obj *objPtr, const char *format,
  Tcl_Size objc, Tcl_Obj *const objv[]);"
  (interp-ptr     tcl-interp-ptr)
  (obj-ptr        tcl-obj-ptr)
  (format         :string)
  (objc           tcl-size)
  (objv           (:pointer tcl-obj-ptr)))

(defcfun ("Tcl_ObjPrintf" tcl-obj-printf) tcl-obj-ptr
  "/* 578 */ EXTERN Tcl_Obj *
Tcl_ObjPrintf(const char *format, ...) TCL_FORMAT_PRINTF(1, 2);"
  (format :string) &rest)

(defcfun ("Tcl_AppendPrintfToObj" tcl-append-printf-to-obj) :void
  "/* 579 */ EXTERN void
Tcl_AppendPrintfToObj(Tcl_Obj *objPtr, const char *format, ...) TCL_FORMAT_PRINTF(2, 3);"
  (obj-ptr  tcl-obj-ptr) (format   :string) &rest)

(defcfun ("Tcl_CancelEval" tcl-cancel-eval) :int
  "/* 580 */ EXTERN int
Tcl_CancelEval(
  Tcl_Interp *interp, Tcl_Obj *resultObjPtr, void *clientData, int flags);"
  (interp-ptr     tcl-interp-ptr)
  (result-obj-ptr tcl-obj-ptr)
  (client-data    client-data)
  (flags          :int))

(defcfun ("Tcl_Canceled" tcl-canceled) :int
  "/* 581 */ EXTERN int Tcl_Canceled(Tcl_Interp *interp, int flags);"
  (interp-ptr     tcl-interp-ptr)
  (flags          :int))

(defcfun ("Tcl_CreatePipe" tcl-create-pipe) :int
  "/* 582 */ EXTERN int
Tcl_CreatePipe(
  Tcl_Interp *interp, Tcl_Channel *rchan, Tcl_Channel *wchan, int flags);"
  (interp-ptr     tcl-interp-ptr)
  (rchan          (:pointer tcl-channel))
  (wchan          (:pointer tcl-channel))
  (flags          :int))

(defcfun ("Tcl_NRCreateCommand" tcl-nr-create-command) tcl-command
  "/* 583 */ EXTERN Tcl_Command
Tcl_NRCreateCommand(
  Tcl_Interp *interp, const char *cmdName,
  Tcl_ObjCmdProc *proc, Tcl_ObjCmdProc *nreProc,
  void *clientData, Tcl_CmdDeleteProc *deleteProc);"
  (interp-ptr     tcl-interp-ptr)
  (cmd-name       :string)
  (proc           tcl-obj-cmd-proc)
  (nre-proc       tcl-obj-cmd-proc)
  (client-data    client-data)
  (delete-proc    tcl-cmd-delete-proc))

(defcfun ("Tcl_NREvalObj" tcl-nr-eval-obj) :int
  "/* 584 */ EXTERN int
Tcl_NREvalObj(Tcl_Interp *interp, Tcl_Obj *objPtr, int flags);"
  (interp-ptr     tcl-interp-ptr)
  (obj-ptr        tcl-obj-ptr)
  (flags          :int))

(defcfun ("Tcl_NREvalObjv" tcl-nr-eval-objv) :int
  "/* 585 */ EXTERN int
Tcl_NREvalObjv(Tcl_Interp *interp, Tcl_Size objc, Tcl_Obj *const objv[], int flags);"
  (interp-ptr     tcl-interp-ptr)
  (objc           tcl-size)
  (objv           (:pointer tcl-obj-ptr))
  (flags          :int))

(defcfun ("Tcl_NRCmdSwap" tcl-nr-cmd-swap) :int
  "/* 586 */ EXTERN int
Tcl_NRCmdSwap(
  Tcl_Interp *interp, Tcl_Command cmd,
  Tcl_Size objc, Tcl_Obj *const objv[],
  int flags);"
  (interp-ptr     tcl-interp-ptr)
  (cmd            tcl-command)
  (objc           tcl-size)
  (objv           (:pointer tcl-obj-ptr))
  (flags          :int))

(defcfun ("Tcl_NRAddCallback" tcl-nr-add-callback) :void
  "/* 587 */ EXTERN void
Tcl_NRAddCallback(
  Tcl_Interp *interp,
  Tcl_NRPostProc *postProcPtr, void *data0,
  void *data1, void *data2, void *data3);"
  (interp-ptr     tcl-interp-ptr)
  (post-proc-ptr  tcl-nr-post-proc)
  (data-0         client-data)
  (data-1         client-data)
  (data-2         client-data)
  (data-3         client-data))

(defcfun ("Tcl_NRCallObjProc" tcl-nr-call-obj-proc) :int
  "/* 588 */ EXTERN int
Tcl_NRCallObjProc(
  Tcl_Interp *interp,
  Tcl_ObjCmdProc *objProc, void *clientData,
  Tcl_Size objc, Tcl_Obj *const objv[]);"
  (interp-ptr     tcl-interp-ptr)
  (obj-proc       tcl-obj-cmd-proc)
  (client-data    client-data)
  (objc           tcl-size)
  (objv           (:pointer tcl-obj-ptr)))

(defcfun ("Tcl_GetFSDeviceFromStat" tcl-get-fs-device-from-stat) :uint
  "/* 589 */ EXTERN unsigned
  Tcl_GetFSDeviceFromStat(const Tcl_StatBuf *statPtr);"
  (stat-ptr  tcl-stat-buf-ptr))

(defcfun ("Tcl_GetFSInodeFromStat" tcl-get-fs-inode-from-stat) :uint
  "/* 590 */ EXTERN unsigned Tcl_GetFSInodeFromStat(const Tcl_StatBuf *statPtr);"
  (stat-ptr  tcl-stat-buf-ptr))

(defcfun ("Tcl_GetModeFromStat" tcl-get-mode-from-stat) :uint
  "/* 591 */ EXTERN unsigned Tcl_GetModeFromStat(const Tcl_StatBuf *statPtr);"
  (stat-ptr  tcl-stat-buf-ptr))

(defcfun ("Tcl_GetLinkCountFromStat" tcl-get-link-count-from-stat) :int
  "/* 592 */ EXTERN int Tcl_GetLinkCountFromStat(const Tcl_StatBuf *statPtr);"
  (stat-ptr  tcl-stat-buf-ptr))

(defcfun ("Tcl_GetUserIdFromStat" tcl-get-user-id-from-stat) :int
  "/* 593 */ EXTERN int Tcl_GetUserIdFromStat(const Tcl_StatBuf *statPtr);"
  (stat-ptr  tcl-stat-buf-ptr))

(defcfun ("Tcl_GetGroupIdFromStat" tcl-get-group-id-from-stat) :int
  "/* 594 */ EXTERN int Tcl_GetGroupIdFromStat(const Tcl_StatBuf *statPtr);"
  (stat-ptr  tcl-stat-buf-ptr))

(defcfun ("Tcl_GetDeviceTypeFromStat" tcl-get-device-type-from-stat) :int
  "/* 595 */ EXTERN int Tcl_GetDeviceTypeFromStat(const Tcl_StatBuf *statPtr);"
  (stat-ptr  tcl-stat-buf-ptr))

(defcfun ("Tcl_GetAccessTimeFromStat" tcl-get-access-time-from-stat) :long-long
  "/* 596 */ EXTERN long long Tcl_GetAccessTimeFromStat(const Tcl_StatBuf *statPtr);"
  (stat-ptr  tcl-stat-buf-ptr))

(defcfun ("Tcl_GetModificationTimeFromStat" tcl-get-modification-time-from-stat)
  :long-long
  "/* 597 */ EXTERN long long
Tcl_GetModificationTimeFromStat(const Tcl_StatBuf *statPtr);"
  (stat-ptr  tcl-stat-buf-ptr))

(defcfun ("Tcl_GetChangeTimeFromStat" tcl-get-change-time-from-stat)
  :long-long
  "/* 598 */ EXTERN long long Tcl_GetChangeTimeFromStat(const Tcl_StatBuf *statPtr);"
  (stat-ptr  tcl-stat-buf-ptr))

(defcfun ("Tcl_GetSizeFromStat" tcl-get-size-from-stat) :unsigned-long-long
  "/* 599 */ EXTERN unsigned long long Tcl_GetSizeFromStat(const Tcl_StatBuf *statPtr);"
  (stat-ptr  tcl-stat-buf-ptr))

(defcfun ("Tcl_GetBlocksFromStat" tcl-get-blocks-from-stat) :unsigned-long-long
  "/* 600 */ EXTERN unsigned long long Tcl_GetBlocksFromStat(const Tcl_StatBuf *statPtr);"
  (stat-ptr  tcl-stat-buf-ptr))

(defcfun ("Tcl_GetBlockSizeFromStat" tcl-get-block-size-from-stat) :uint
  "/* 601 */ EXTERN unsigned Tcl_GetBlockSizeFromStat(const Tcl_StatBuf *statPtr);"
  (stat-ptr  tcl-stat-buf-ptr))

(defcfun ("Tcl_SetEnsembleParameterList" tcl-set-ensemble-parameter-list) :int
  "/* 602 */ EXTERN int
Tcl_SetEnsembleParameterList(Tcl_Interp *interp, Tcl_Command token, Tcl_Obj *paramList);"
  (interp-ptr     tcl-interp-ptr)
  (token          tcl-command)
  (param-list     tcl-obj-ptr))

(defcfun ("Tcl_GetEnsembleParameterList" tcl-get-ensemble-parameter-list) :int
  "/* 603 */ EXTERN int
Tcl_GetEnsembleParameterList(
  Tcl_Interp *interp, Tcl_Command token, Tcl_Obj **paramListPtr);"
  (interp-ptr     tcl-interp-ptr)
  (token          tcl-command)
  (param-list     (:pointer tcl-obj-ptr)))

(defcfun ("TclParseArgsObjv" tcl_parse-args-objv) :int
  "/* 604 */ EXTERN int
TclParseArgsObjv(
  Tcl_Interp *interp,
  const Tcl_ArgvInfo *argTable, void *objcPtr,
  Tcl_Obj *const *objv, Tcl_Obj ***remObjv);"
  (interp-ptr     tcl-interp-ptr)
  (arg-table      tcl-argv-info-ptr)
  (objc-ptr       :pointer)
  (objv           (:pointer tcl-obj-ptr))
  (rem-objv       (:pointer (:pointer tcl-obj-ptr))))

(defcfun ("Tcl_GetErrorLine" tcl-get-error-line) :int
  "/* 605 */ EXTERN int Tcl_GetErrorLine(Tcl_Interp *interp);"
  (interp-ptr     tcl-interp-ptr))

(defcfun ("Tcl_SetErrorLine" tcl-set-error-line) :void
  "/* 606 */ EXTERN void Tcl_SetErrorLine(Tcl_Interp *interp, int lineNum);"
  (interp-ptr     tcl-interp-ptr)
  (line-num       :int))

(defcfun ("Tcl_TransferResult" tcl-transfer-result) :void
  "/* 607 */ EXTERN void
Tcl_TransferResult(Tcl_Interp *sourceInterp, int code, Tcl_Interp *targetInterp);"
  (src-interp-ptr     tcl-interp-ptr)
  (code               :int)
  (target-interp-ptr  tcl-interp-ptr))

(defcfun ("Tcl_InterpActive" tcl-interp-active) :int
  "/* 608 */ EXTERN int Tcl_InterpActive(Tcl_Interp *interp);"
  (interp-ptr     tcl-interp-ptr))

(defcfun ("Tcl_BackgroundException" tcl-background-exception) :void
  "/* 609 */ EXTERN void
Tcl_BackgroundException(Tcl_Interp *interp, int code);"
  (interp-ptr  tcl-interp-ptr)
  (code        :int))

(defcfun ("Tcl_ZlibDeflate" tcl-zlib-deflate) :int
  "/* 610 */ EXTERN int
Tcl_ZlibDeflate(
  Tcl_Interp *interp, int format,
  Tcl_Obj *data, int level, Tcl_Obj *gzipHeaderDictObj);"
  (interp-ptr            tcl-interp-ptr)
  (format                :int)
  (data                  tcl-obj-ptr)
  (level                 :int)
  (gzip-header-dict-obj  tcl-obj-ptr))

(defcfun ("Tcl_ZlibInflate" tcl-zlib-inflate) :int
  "/* 611 */ EXTERN int
Tcl_ZlibInflate(
  Tcl_Interp *interp, int format,
  Tcl_Obj *data, Tcl_Size buffersize,
  Tcl_Obj *gzipHeaderDictObj);"
  (interp-ptr     tcl-interp-ptr)
  (format         :int)
  (data           tcl-obj-ptr)
  (buffer-size    tcl-size)
  (gzip-header-dict-obj  tcl-obj-ptr))

(defcfun ("Tcl_ZlibCRC32" tcl-zlib-crc32) :uint
  "/* 612 */ EXTERN unsigned int
Tcl_ZlibCRC32(unsigned int crc, const unsigned char *buf, Tcl_Size len);"
  (crc :uint) (buf (:pointer :uchar)) (len tcl-size))

(defcfun ("Tcl_ZlibAdler32" tcl-zlib-adler32) :uint
  "/* 613 */ EXTERN unsigned int
Tcl_ZlibAdler32(unsigned int adler, const unsigned char *buf, Tcl_Size len);"
  (adler :uint) (buf (:pointer :uchar)) (len tcl-size))

(defcfun ("Tcl_ZlibStreamInit" tcl-zlib-stream-init) :int
  "/* 614 */ EXTERN int
Tcl_ZlibStreamInit(
  Tcl_Interp *interp, int mode,
  int format, int level, Tcl_Obj *dictObj,
  Tcl_ZlibStream *zshandle);"
  (interp-ptr     tcl-interp-ptr)
  (mode           :int)
  (format         :int)
  (level          :int)
  (dict-obj       tcl-obj-ptr)
  (zshandle       tcl-zlib-stream-ptr))

(defcfun ("Tcl_ZlibStreamGetCommandName" tcl-zlib-stream-get-command-name)
  tcl-obj-ptr
  "/* 615 */ EXTERN Tcl_Obj * Tcl_ZlibStreamGetCommandName(Tcl_ZlibStream zshandle);"
  (zshandle tcl-zlib-stream-ptr))

(defcfun ("Tcl_ZlibStreamEof" tcl-zlib-stream-eof) :int
  "/* 616 */ EXTERN int Tcl_ZlibStreamEof(Tcl_ZlibStream zshandle);"
  (zshandle tcl-zlib-stream-ptr))

(defcfun ("Tcl_ZlibStreamChecksum" tcl-zlib-stream-checksum) :int
  "/* 617 */ EXTERN int Tcl_ZlibStreamChecksum(Tcl_ZlibStream zshandle);"
  (zshandle tcl-zlib-stream-ptr))

(defcfun ("Tcl_ZlibStreamPut" tcl-zlib-stream-put) :int
  "/* 618 */ EXTERN int
Tcl_ZlibStreamPut(Tcl_ZlibStream zshandle, Tcl_Obj *data, int flush);"
  (zshandle tcl-zlib-stream-ptr)
  (data     tcl-obj-ptr)
  (flush    :int))

(defcfun ("Tcl_ZlibStreamGet" tcl-zlib-stream-get) :int
  "/* 619 */ EXTERN int
Tcl_ZlibStreamGet(Tcl_ZlibStream zshandle, Tcl_Obj *data, Tcl_Size count);"
  (zshandle tcl-zlib-stream-ptr)
  (data     tcl-obj-ptr)
  (count    tcl-size))

(defcfun ("Tcl_ZlibStreamClose" tcl-zlib-stream-close) :int
  "/* 620 */ EXTERN int Tcl_ZlibStreamClose(Tcl_ZlibStream zshandle);"
  (zshandle tcl-zlib-stream-ptr))

(defcfun ("Tcl_ZlibStreamReset" tcl-zlib-stream-reset) :int
  "/* 621 */ EXTERN int Tcl_ZlibStreamReset(Tcl_ZlibStream zshandle);"
  (zshandle tcl-zlib-stream-ptr))

(defcfun ("Tcl_SetStartupScript" tcl-set-startup-script) :void
  "/* 622 */ EXTERN void Tcl_SetStartupScript(Tcl_Obj *path, const char *encoding);"
  (path tcl-obj-ptr) (encoding :string))

(defcfun ("Tcl_GetStartupScript" tcl-get-startup-script) tcl-obj-ptr
  "/* 623 */ EXTERN Tcl_Obj * Tcl_GetStartupScript(const char **encodingPtr);"
  (encoding-ptr (:pointer (:pointer :char))))

(defcfun ("Tcl_CloseEx" tcl-close-ex) :int
  "/* 624 */ EXTERN int
Tcl_CloseEx(Tcl_Interp *interp, Tcl_Channel chan, int flags);"
  (interp-ptr  tcl-interp-ptr)
  (chan        tcl-channel)
  (flags       :int))

(defcfun ("Tcl_NRExprObj" tcl-nr-expr-obj) :int
  "/* 625 */ EXTERN int
Tcl_NRExprObj(Tcl_Interp *interp, Tcl_Obj *objPtr, Tcl_Obj *resultPtr);"
  (interp-ptr     tcl-interp-ptr)
  (obj-ptr        tcl-obj-ptr)
  (result-ptr     tcl-obj-ptr))

(defcfun ("Tcl_NRSubstObj" tcl-nr-subst-obj) :int
  "/* 626 */ EXTERN int
Tcl_NRSubstObj(Tcl_Interp *interp, Tcl_Obj *objPtr, int flags);"
  (interp-ptr     tcl-interp-ptr)
  (obj-ptr        tcl-obj-ptr)
  (flags          :int))

(defcfun ("Tcl_LoadFile" tcl-load-file) :int
  "/* 627 */ EXTERN int
Tcl_LoadFile(
  Tcl_Interp *interp, Tcl_Obj *pathPtr,
  const char *const symv[], int flags,
  void *procPtrs, Tcl_LoadHandle *handlePtr);"
  (interp-ptr     tcl-interp-ptr)
  (path-ptr       tcl-obj-ptr)
  (symv           (:pointer (:pointer :char)))
  (flags          :int)
  (proc-ptrs      :pointer)
  (handle-ptr     tcl-load-handle-ptr))

(defcfun ("Tcl_FindSymbol" tcl-find-symbol) :pointer
  "/* 628 */ EXTERN void *
Tcl_FindSymbol(Tcl_Interp *interp, Tcl_LoadHandle handle, const char *symbol);"
  (interp-ptr     tcl-interp-ptr)
  (handle         tcl-load-handle)
  (symbol         :string))

(defcfun ("Tcl_FSUnloadFile" tcl-fs-unload-file) :int
  "/* 629 */ EXTERN int
Tcl_FSUnloadFile(Tcl_Interp *interp, Tcl_LoadHandle handlePtr);"
  (interp-ptr     tcl-interp-ptr)
  (load-handle    tcl-load-handle))

(defcfun ("Tcl_ZlibStreamSetCompressionDictionary"
          tcl-zlib-stream-set-compression-dictionary) :void
  "/* 630 */ EXTERN void
Tcl_ZlibStreamSetCompressionDictionary(
  Tcl_ZlibStream zhandle,
  Tcl_Obj *compressionDictionaryObj);"
  (zshandle                    tcl-zlib-stream-ptr)
  (compression-dictionary-obj  tcl-obj-ptr))

(defcfun ("Tcl_OpenTcpServerEx" tcl-open-tcp-server-ex) tcl-channel
  "/* 631 */ EXTERN Tcl_Channel
Tcl_OpenTcpServerEx(
  Tcl_Interp *interp,
  const char *service, const char *host,
  unsigned int flags, int backlog,
  Tcl_TcpAcceptProc *acceptProc,
  void *callbackData);"
  (interp   tcl-interp-ptr)
  (service  :string)
  (host     :string)
  (flags    :int)
  (backlog  :int)
  (accept-proc    tcl-tcp-accept-proc)
  (callback-data  :pointer))

(defcfun ("TclZipfs_Mount" tcl-zipfs-mount) :int
  "/* 632 */ EXTERN int
TclZipfs_Mount(
  Tcl_Interp *interp, const char *zipname, const char *mountPoint,
  const char *passwd);"
  (interp       tcl-interp-ptr)
  (zipname      :string)
  (mount-point  :string)
  (passwd       :string))

(defcfun ("TclZipfs_Unmount" tcl-zipfs-unmount) :int
  "/* 633 */ EXTERN int
TclZipfs_Unmount(
  Tcl_Interp *interp, const char *mountPoint);"
  (interp       tcl-interp-ptr)
  (mount-point  :string))

(defcfun ("TclZipfs_TclLibrary" tcl-zipfs-tcl-library) tcl-obj-ptr
  "/* 634 */ EXTERN Tcl_Obj * TclZipfs_TclLibrary(void);")

(defcfun ("TclZipfs_MountBuffer" tcl-zipfs-mount-buffer) :int
  "/* 635 */ EXTERN int
TclZipfs_MountBuffer(
  Tcl_Interp *interp, const void *data, size_t datalen,
  const char *mountPoint, int copy);"
  (interp       tcl-interp-ptr)
  (data         :pointer)
  (datalen      :size)
  (mount-point  :string)
  (copy         :int))

(defcfun ("Tcl_FreeInternalRep" tcl-free-internal-rep) :void
  "/* 636 */ EXTERN void Tcl_FreeInternalRep(Tcl_Obj *objPtr);"
  (obj-ptr tcl-obj-ptr))

(defcfun ("Tcl_InitStringRep" tcl-init-string-rep) :string
  "/* 637 */ EXTERN char *
Tcl_InitStringRep(Tcl_Obj *objPtr, const char *bytes, TCL_HASH_TYPE numBytes);"
  (obj-ptr    tcl-obj-ptr)
  (bytes      (:pointer :char))
  (num-bytes  tcl-hash-type))

(defcfun ("Tcl_FetchInternalRep" tcl-fetch-internal-rep) tcl-obj-internal-rep-ptr
  "/* 638 */ EXTERN Tcl_ObjInternalRep *
Tcl_FetchInternalRep(Tcl_Obj *objPtr, const Tcl_ObjType *typePtr);"
  (obj-ptr  tcl-obj-ptr)
  (type-ptr tcl-obj-type-ptr))

(defcfun ("Tcl_StoreInternalRep" tcl-store-internal-rep) :void
  "/* 639 */ EXTERN void
Tcl_StoreInternalRep(
  Tcl_Obj *objPtr, const Tcl_ObjType *typePtr, const Tcl_ObjInternalRep *irPtr);"
  (obj-ptr   tcl-obj-ptr)
  (type-ptr  tcl-obj-type-ptr)
  (ir-ptr    tcl-obj-internal-rep-ptr))

(defcfun ("Tcl_HasStringRep" tcl-has-string-rep) :int
  "/* 640 */ EXTERN int Tcl_HasStringRep(Tcl_Obj *objPtr);"
  (obj-ptr  tcl-obj-ptr))

(defcfun ("Tcl_IncrRefCount" tcl-incr-ref-count) :void
  "/* 641 */ EXTERN void Tcl_IncrRefCount(Tcl_Obj *objPtr);"
  (obj-ptr  tcl-obj-ptr))

(defcfun ("Tcl_DecrRefCount" tcl-decr-ref-count) :void
  "/* 642 */ EXTERN void Tcl_DecrRefCount(Tcl_Obj *objPtr);"
  (obj-ptr  tcl-obj-ptr))

(defcfun ("Tcl_IsShared" tcl-is-shared) :int
  "/* 643 */ EXTERN int Tcl_IsShared(Tcl_Obj *objPtr);"
  (obj-ptr  tcl-obj-ptr))

(defcfun ("Tcl_LinkArray" tcl-link-array) :int
  "/* 644 */ EXTERN int
Tcl_LinkArray(
  Tcl_Interp *interp, const char *varName, void *addr, int type, Tcl_Size size);"
  (interp       tcl-interp-ptr)
  (var-name     :string)
  (addr         :pointer)
  (type         :int)
  (size         tcl-size))

(defcfun ("Tcl_GetIntForIndex" tcl-get-int-for-index) :int
  "/* 645 */ EXTERN int
Tcl_GetIntForIndex(
  Tcl_Interp *interp, Tcl_Obj *objPtr, Tcl_Size endValue, Tcl_Size *indexPtr);"
  (interp       tcl-interp-ptr)
  (obj-ptr      tcl-obj-ptr)
  (end-value    tcl-size)
  (index-ptr    tcl-size-ptr))

(defcfun ("Tcl_UtfToUniChar" tcl-utf-to-uni-char) tcl-size
  "/* 646 */ EXTERN Tcl_Size Tcl_UtfToUniChar(const char *src, int *chPtr);"
  (src     :string)
  (ch-ptr  (:pointer :int)))

(defcfun ("Tcl_UniCharToUtfDString" tcl-uni-char-to-utf-d-string) :string
  "/* 647 */ EXTERN char *
Tcl_UniCharToUtfDString(const int *uniStr, Tcl_Size uniLength, Tcl_DString *dsPtr);"
  (uni-str   (:pointer :int))
  (uni-len   tcl-size)
  (ds-ptr    tcl-d-string-ptr))

(defcfun ("Tcl_UtfToUniCharDString" tcl-utf-to-uni-char-d-string) (:pointer :int)
  "/* 648 */ EXTERN int *
Tcl_UtfToUniCharDString(const char *src, Tcl_Size length, Tcl_DString *dsPtr);"
  (src     (:pointer :char))
  (len     tcl-size)
  (ds-ptr  tcl-d-string-ptr))

(defcfun ("TclGetBytesFromObj" tcl_get-bytes-from-obj) (:pointer :uchar)
  "/* 649 */ EXTERN unsigned char *
TclGetBytesFromObj(Tcl_Interp *interp, Tcl_Obj *objPtr, void *numBytesPtr);"
  (interp         tcl-interp-ptr)
  (obj-ptr        tcl-obj-ptr)
  (num-bytes-ptr  :pointer))

(defcfun ("Tcl_GetBytesFromObj" tcl-get-bytes-from-obj) (:pointer :uchar)
  "/* 650 */ EXTERN unsigned char *
Tcl_GetBytesFromObj(Tcl_Interp *interp, Tcl_Obj *objPtr, Tcl_Size *numBytesPtr);"
  (interp         tcl-interp-ptr)
  (obj-ptr        tcl-obj-ptr)
  (num-bytes-ptr  tcl-size-ptr))

(defcfun ("Tcl_GetStringFromObj" tcl-get-string-from-obj) :string
  "/* 651 */ EXTERN char *
Tcl_GetStringFromObj(Tcl_Obj *objPtr, Tcl_Size *lengthPtr);"
  (obj-ptr     tcl-obj-ptr)
  (length-ptr  tcl-size-ptr))

(defcfun ("Tcl_GetStringFromObj" tcl-get-string-from-obj/char*) (:pointer :char)
  "/* 651 */ EXTERN char *
Tcl_GetStringFromObj(Tcl_Obj *objPtr, Tcl_Size *lengthPtr);"
  (obj-ptr     tcl-obj-ptr)
  (length-ptr  tcl-size-ptr))

(defcfun ("Tcl_GetUnicodeFromObj" tcl-get-unicode-from-obj) tcl-uni-char-ptr
  "/* 652 */ EXTERN Tcl_UniChar *
Tcl_GetUnicodeFromObj(Tcl_Obj *objPtr, Tcl_Size *lengthPtr);"
  (obj-ptr     tcl-obj-ptr)
  (length-ptr  tcl-size-ptr))

(defcfun ("Tcl_GetSizeIntFromObj" tcl-get-size-int-from-obj) :int
  "/* 653 */ EXTERN int
Tcl_GetSizeIntFromObj(Tcl_Interp *interp, Tcl_Obj *objPtr, Tcl_Size *sizePtr);"
  (interp       tcl-interp-ptr)
  (obj-ptr      tcl-obj-ptr)
  (size-ptr     tcl-size-ptr))

(defcfun ("Tcl_UtfCharComplete" tcl-utf-char-complete) :int
  "/* 654 */ EXTERN int Tcl_UtfCharComplete(const char *src, Tcl_Size length);"
  (src  (:pointer :char))
  (len  tcl-size))

(defcfun ("Tcl_UtfNext" tcl-utf-next) (:pointer :char)
  "/* 655 */ EXTERN const char * Tcl_UtfNext(const char *src);"
  (src (:pointer :char)))

(defcfun ("Tcl_UtfPrev" tcl-utf-prev) (:pointer :char)
  "/* 656 */ EXTERN const char * Tcl_UtfPrev(const char *src, const char *start);"
  (src    (:pointer :char))
  (start  (:pointer :char)))

(defcfun ("Tcl_FSTildeExpand" tcl-fs-tilde-expand) :int
  "/* 657 */ EXTERN int
Tcl_FSTildeExpand(Tcl_Interp *interp, const char *path, Tcl_DString *dsPtr);"
  (interp       tcl-interp-ptr)
  (path         :string)
  (ds-ptr       tcl-d-string-ptr))

(defcfun ("Tcl_ExternalToUtfDStringEx" tcl-external-to-utf-d-string-ex) :int
  "/* 658 */ EXTERN int
Tcl_ExternalToUtfDStringEx(
  Tcl_Interp *interp,
  Tcl_Encoding encoding, const char *src,
  Tcl_Size srcLen, int flags,
  Tcl_DString *dsPtr,
  Tcl_Size *errorLocationPtr);"
  (interp       tcl-interp-ptr)
  (encoding     tcl-encoding)
  (src          (:pointer :char))
  (src-len      tcl-size)
  (flags        :int)
  (ds-ptr       tcl-d-string-ptr)
  (err-loc-ptr  tcl-size-ptr))

(defcfun ("Tcl_UtfToExternalDStringEx" tcl-utf-to-external-d-string-ex) :int
  "/* 659 */ EXTERN int
Tcl_UtfToExternalDStringEx(
  Tcl_Interp *interp,
  Tcl_Encoding encoding, const char *src,
  Tcl_Size srcLen, int flags,
  Tcl_DString *dsPtr,
  Tcl_Size *errorLocationPtr);"
  (interp       tcl-interp-ptr)
  (encoding     tcl-encoding)
  (src          (:pointer :char))
  (src-len      tcl-size)
  (flags        :int)
  (ds-ptr       tcl-d-string-ptr)
  (err-loc-ptr  tcl-size-ptr))

(defcfun ("Tcl_AsyncMarkFromSignal" tcl-async-mark-from-signal) :int
  "/* 660 */ EXTERN int Tcl_AsyncMarkFromSignal(
  Tcl_AsyncHandler async, int sigNumber);"
  (async   tcl-async-handler)
  (sig-nr  :int))

(defcfun ("Tcl_ListObjGetElements" tcl-list-obj-get-elements) :int
  "/* 661 */ EXTERN int
Tcl_ListObjGetElements(
  Tcl_Interp *interp, Tcl_Obj *listPtr, Tcl_Size *objcPtr, Tcl_Obj ***objvPtr);"
  (interp       tcl-interp-ptr)
  (list-ptr     tcl-obj-ptr)
  (objc-ptr     tcl-obj-ptr)
  (objv-ptr     (:pointer (:pointer tcl-obj-ptr))))

(defcfun ("Tcl_ListObjLength" tcl-list-obj-length) :int
  "/* 662 */ EXTERN int
Tcl_ListObjLength(Tcl_Interp *interp, Tcl_Obj *listPtr, Tcl_Size *lengthPtr);"
  (interp       tcl-interp-ptr)
  (list-ptr     tcl-obj-ptr)
  (length-ptr   tcl-obj-ptr))

(defcfun ("Tcl_DictObjSize" tcl-dict-obj-size) :int
  "/* 663 */ EXTERN int
Tcl_DictObjSize(Tcl_Interp *interp, Tcl_Obj *dictPtr, Tcl_Size *sizePtr);"
  (interp       tcl-interp-ptr)
  (dict-obj     tcl-obj-ptr)
  (size-ptr     tcl-size-ptr))

(defcfun ("Tcl_SplitList" tcl-split-list) :int
  "/* 664 */ EXTERN int
Tcl_SplitList(
  Tcl_Interp *interp,
  const char *listStr, Tcl_Size *argcPtr,
  const char ***argvPtr);"
  (interp       tcl-interp-ptr)
  (list-str     :string)
  (argc-ptr     tcl-size-ptr)
  (argv-ptr     (:pointer (:pointer (:pointer :char)))))

(defcfun ("Tcl_SplitPath" tcl-split-path) :void
  "/* 665 */ EXTERN void
Tcl_SplitPath(const char *path, Tcl_Size *argcPtr, const char ***argvPtr);"
  (path      :string)
  (argc-ptr  tcl-size-ptr)
  (argv-ptr  (:pointer (:pointer (:pointer :char)))))

(defcfun ("Tcl_FSSplitPath" tcl-fs-split-path) tcl-obj-ptr
  "/* 666 */ EXTERN Tcl_Obj * Tcl_FSSplitPath(Tcl_Obj *pathPtr, Tcl_Size *lenPtr);"
  (path-ptr  tcl-obj-ptr)
  (len-ptr   tcl-size-ptr))

(defcfun ("Tcl_ParseArgsObjv" tcl-parse-args-objv) :int
  "/* 667 */ EXTERN int
Tcl_ParseArgsObjv(
  Tcl_Interp *interp,
  const Tcl_ArgvInfo *argTable,
  Tcl_Size *objcPtr, Tcl_Obj *const *objv,
  Tcl_Obj ***remObjv);"
  (interp       tcl-interp-ptr)
  (arg-table    tcl-argv-info-ptr)
  (objc-ptr     tcl-size-ptr)
  (objv         (:pointer tcl-obj-ptr))
  (rem-objv     (:pointer (:pointer tcl-obj-ptr))))

(defcfun ("Tcl_UniCharLen" tcl-uni-char-len) tcl-size
  "/* 668 */ EXTERN Tcl_Size Tcl_UniCharLen(const int *uniStr);"
  (uni-str  (:pointer :int)))

(defcfun ("Tcl_NumUtfChars" tcl-num-utf-chars) tcl-size
  "/* 669 */ EXTERN Tcl_Size Tcl_NumUtfChars(const char *src, Tcl_Size length);"
  (src     (:pointer :char))
  (length  tcl-size))

(defcfun ("Tcl_GetCharLength" tcl-get-char-length) tcl-size
  "/* 670 */ EXTERN Tcl_Size Tcl_GetCharLength(Tcl_Obj *objPtr);"
  (obj-ptr tcl-obj-ptr))

(defcfun ("Tcl_UtfAtIndex" tcl-utf-at-index) (:pointer :char)
  "/* 671 */ EXTERN const char * Tcl_UtfAtIndex(const char *src, Tcl_Size index);"
  (src    (:pointer :char))
  (index  tcl-size))

(defcfun ("Tcl_GetRange" tcl-get-range) tcl-obj-ptr
  "/* 672 */ EXTERN Tcl_Obj *
Tcl_GetRange(Tcl_Obj *objPtr, Tcl_Size first, Tcl_Size last);"
  (obj-ptr   tcl-obj-ptr)
  (first     tcl-size)
  (last      tcl-size))

(defcfun ("Tcl_GetUniChar" tcl-get-uni-char) :int
         "/* 673 */ EXTERN int Tcl_GetUniChar(Tcl_Obj *objPtr, Tcl_Size index);"
  (obj-ptr tcl-obj-ptr)
  (index   tcl-size))

(defcfun ("Tcl_GetBool" tcl-get-bool) :int
  "/* 674 */ EXTERN int
Tcl_GetBool(Tcl_Interp *interp, const char *src, int flags, char *charPtr);"
  (interp       tcl-interp-ptr)
  (src          (:pointer :char))
  (flags        :int)
  (char-ptr     (:pointer :char)))

(defcfun ("Tcl_GetBoolFromObj" tcl-get-bool-from-obj) :int
  "/* 675 */ EXTERN int
Tcl_GetBoolFromObj(Tcl_Interp *interp, Tcl_Obj *objPtr, int flags, char *charPtr);"
  (interp       tcl-interp-ptr)
  (obj-ptr      tcl-obj-ptr)
  (flags        :int)
  (char-ptr     (:pointer :char)))

(defcfun ("Tcl_CreateObjCommand2" tcl-create-obj-command2) tcl-command
  "/* 676 */ EXTERN Tcl_Command
Tcl_CreateObjCommand2(
  Tcl_Interp *interp, const char *cmdName, Tcl_ObjCmdProc2 *proc2,
  void *clientData, Tcl_CmdDeleteProc *deleteProc);"
  (interp       tcl-interp-ptr)
  (cmd-name     :string)
  (proc2        tcl-obj-cmd-proc2)
  (client-data  :pointer)
  (delete-proc  tcl-cmd-delete-proc))

(defcfun ("Tcl_CreateObjTrace2" tcl-create-obj-trace2) tcl-trace
  "/* 677 */ EXTERN Tcl_Trace
Tcl_CreateObjTrace2(
  Tcl_Interp *interp, Tcl_Size level, int flags,
  Tcl_CmdObjTraceProc2 *objProc2, void *clientData,
  Tcl_CmdObjTraceDeleteProc *delProc);"
  (interp       tcl-interp-ptr)
  (level        tcl-size)
  (flags        :int)
  (obj-proc2    tcl-cmd-obj-trace-proc2)
  (client-data  :pointer)
  (del-proc     tcl-cmd-obj-trace-delete-proc))

(defcfun ("Tcl_NRCreateCommand2" tcl-nr-create-command2) tcl-command
  "/* 678 */ EXTERN Tcl_Command
Tcl_NRCreateCommand2(
  Tcl_Interp *interp, const char *cmdName, Tcl_ObjCmdProc2 *proc,
  Tcl_ObjCmdProc2 *nreProc2, void *clientData, Tcl_CmdDeleteProc *deleteProc);"
  (interp       tcl-interp-ptr)
  (cmd-name     :string)
  (proc         tcl-obj-cmd-proc2)
  (nre-proc2    tcl-obj-cmd-proc2)
  (client-data  :pointer)
  (delete-proc  tcl-cmd-delete-proc))

(defcfun ("Tcl_NRCallObjProc2" tcl-nr-call-obj-proc2) :int
  "/* 679 */ EXTERN int
Tcl_NRCallObjProc2(
  Tcl_Interp *interp, Tcl_ObjCmdProc2 *objProc2, void *clientData,
  Tcl_Size objc, Tcl_Obj *const objv[]);"
  (interp       tcl-interp-ptr)
  (obj-proc2    tcl-obj-cmd-proc2)
  (client-data  :pointer)
  (objc         tcl-size)
  (objv         (:pointer tcl-obj-ptr)))

(defcfun ("Tcl_GetNumberFromObj" tcl-get-number-from-obj) :int
  "/* 680 */ EXTERN int
Tcl_GetNumberFromObj(
  Tcl_Interp *interp, Tcl_Obj *objPtr, void **clientDataPtr, int *typePtr);"
  (interp       tcl-interp-ptr)
  (obj-ptr      tcl-obj-ptr)
  (client-data-ptr  (:pointer :pointer))
  (type-ptr     (:pointer :int)))

(defcfun ("Tcl_GetNumber" tcl-get-number) :int
  "/* 681 */ EXTERN int
Tcl_GetNumber(
  Tcl_Interp *interp, const char *bytes,
  Tcl_Size numBytes, void **clientDataPtr, int *typePtr);"
  (interp       tcl-interp-ptr)
  (bytes        (:pointer :char))
  (num-bytes    tcl-size)
  (client-data-ptr  (:pointer :pointer))
  (type-ptr     (:pointer :int)))

(defcfun ("Tcl_RemoveChannelMode" tcl-remove-channel-mode) :int
  "/* 682 */ EXTERN int
Tcl_RemoveChannelMode(Tcl_Interp *interp, Tcl_Channel chan, int mode);"
  (interp       tcl-interp-ptr)
  (chan         tcl-channel)
  (mod          :int))

(defcfun ("Tcl_GetEncodingNulLength" tcl-get-encoding-nul-length) tcl-size
  "/* 683 */ EXTERN Tcl_Size Tcl_GetEncodingNulLength(Tcl_Encoding encoding);"
  (encoding tcl-encoding))

(defcfun ("Tcl_GetWideUIntFromObj" tcl-get-wide-u-int-from-obj) :int
  "/* 684 */ EXTERN int
Tcl_GetWideUIntFromObj(
  Tcl_Interp *interp, Tcl_Obj *objPtr, Tcl_WideUInt *uwidePtr);"
  (interp       tcl-interp-ptr)
  (obj-ptr      tcl-obj-ptr)
  (uwide-ptr    (:pointer tcl-wide-uint)))

(defcfun ("Tcl_DStringToObj" tcl-d-string-to-obj) tcl-obj-ptr
  "/* 685 */ EXTERN Tcl_Obj * Tcl_DStringToObj(Tcl_DString *dsPtr);"
  (ds-ptr  tcl-d-string-ptr))

(defcfun ("Tcl_UtfNcmp" tcl-utf-ncmp) :int
  "/* 686 */ EXTERN int
Tcl_UtfNcmp(const char *s1, const char *s2, size_t n);"
  (s1  :string)
  (s2  :string)
  (n   :size))

(defcfun ("Tcl_UtfNcasecmp" tcl-utf-ncasecmp) :int
  "/* 687 */ EXTERN int
Tcl_UtfNcasecmp(const char *s1, const char *s2, size_t n);"
  (s1  :string)
  (s2  :string)
  (n   :size))

(defcfun ("Tcl_NewWideUIntObj" tcl-new-wide-u-int-obj) tcl-obj-ptr
  "/* 688 */ EXTERN Tcl_Obj * Tcl_NewWideUIntObj(Tcl_WideUInt wideValue);"
  (wide-value tcl-wide-uint))

(defcfun ("Tcl_SetWideUIntObj" tcl-set-wide-u-int-obj) :void
  "/* 689 */ EXTERN void
Tcl_SetWideUIntObj(Tcl_Obj *objPtr, Tcl_WideUInt uwideValue);"
  (obj-ptr      tcl-obj-ptr)
  (uwide-value  tcl-wide-uint))

(defcfun ("TclUnusedStubEntry" tcl-unused-stub-entry) :void
  "/* 690 */ EXTERN void TclUnusedStubEntry(void);")





;; TODO (declaim (inline

(declaim (inline tcl-pkg-present))
(defun tcl-pkg-present (interp name version exact)
  (tcl-pkg-present-ex interp name version exact (cffi:null-pointer)))

(defun tcl-pkg-provide (interp name version)
  (tcl-pkg-provide-ex interp name version (cffi:null-pointer)))

(defun tcl-pkg-require (interp name version exact)
  (tcl-pkg-require-ex interp name version exact (cffi:null-pointer)))

(defun tcl-get-index-from-obj (interp obj-ptr table-ptr msg flags index-ptr)
  (tcl-get-index-from-obj-struct interp obj-ptr table-ptr
                                 (cffi:foreign-type-size '(:pointer :char))
                                 msg flags index-ptr))

(defun tcl-new-boolean-obj (int-value)
  (tcl-new-wide-int-obj (cond ((zerop int-value) 0) (t 1))))

(defun tcl-db-new-boolean-obj (int-value file line)
  (tcl-db-new-wide-int-obj (cond ((zerop int-value) 0) (t 1)) file line))

(defun tcl-set-boolean-obj (obj-ptr int-value)
  (tcl-set-wide-int-obj obj-ptr (cond ((zerop int-value) 0) (t 1))))

(defun tcl-set-var (interp var-name new-value flags)
  (tcl-set-var2 interp var-name (cffi:null-pointer) new-value flags))

(defun tcl-unset-var (interp var-name flags)
  (tcl-unset-var2 interp var-name (cffi:null-pointer) flags))

(defun tcl-get-var (interp var-name flags)
  (tcl-get-var2 interp var-name (cffi:null-pointer) flagS))

(defun tcl-trace-var (interp var-name flags proc client-data)
  (tcl-trace-var2 interp var-name (cffi:null-pointer) flags proc client-data))

(defun tcl-untrace-var (interp var-name flags proc client-data)
  (tcl-untrace-var2 interp var-name (cffi:null-pointer) flags proc client-data))

(defun tcl-var-trace-info (interp var-name flags proc prev-client-data)
  (tcl-var-trace-info2 interp var-name (cffi:null-pointer) flags proc
                       prev-client-data))

(defun tcl-up-var (interp frame-name var-name local-name flags)
  (tcl-up-var2 interp frame-name var-name (cffi:null-pointer) local-name flags))

(defun tcl-add-error-info (interp message)
  (tcl-append-obj-to-error-info interp
                                (tcl-new-string-obj message -1)))

(defun tcl-add-obj-error-info (interp message length)
  (tcl-append-obj-to-error-info interp
                                (tcl-new-string-obj message length)))

(defun tcl-eval (interp obj-ptr)
  (tcl-eval-ex interp obj-ptr +tcl-index-none+ 0))

(defun tcl-global-eval (interp obj-ptr)
  (tcl-eval-ex interp obj-ptr +tcl-index-none+ +tcl-eval-global+))

(defun tcl-get-string-result (interp)
  (tcl-get-string (tcl-get-obj-result interp)))

(defun tcl-set-result (interp result free-proc)
  (tcl-set-obj-result interp (tcl-new-string-obj result -1))
  (if (and (not (cffi:null-pointer-p result))
           (not (cffi:null-pointer-p free-proc))
           (not (eq +tcl-volatile+
                    (cffi:pointer-address free-proc))))
      (if (eq +tcl-dynamic+ (cffi:pointer-address free-proc))
          (tcl-free result)
          ;; else:
          (cffi:foreign-funcall-pointer free-proc
                                        () ; Options
                                        :pointer result
                                        ;; return:
                                        :void))))

(defun tcl-get-unicode (obj-ptr)
  (tcl-get-unicode-from-obj obj-ptr (cffi:null-pointer)))

(defun tcl-new-long-obj (value)
  (tcl-new-wide-int-obj value))

(defun tcl-new-int-obj (value)
  (tcl-new-wide-int-obj value))

(defun tcl-db-new-long-obj (value file line)
  (tcl-db-new-wide-int-obj value file line))

(defun tcl-set-int-obj (obj-ptr value)
  (tcl-set-wide-int-obj obj-ptr value))

(defun tcl-set-long-obj (obj-ptr value)
  (tcl-set-wide-int-obj obj-ptr value))

(defun tcl-background-error (interp)
  (tcl-background-exception interp +tcl-error+))

(defun tcl-string-match (str pat)
  (tcl-string-case-match str pat 0))

(defun tcl-eval-obj (interp obj-ptr)
  (tcl-eval-obj-ex interp obj-ptr 0))

(defun tcl-global-eval-obj (interp obj-ptr)
  (tcl-eval-obj-ex interp obj-ptr +tcl-eval-global+))

(defun tcl-close (interp chan)
  (tcl-close-ex interp chan 0))




;;; +tcl-utf-max+

(defmacro overwrite-func (&rest dst.src-list)
  `(setf
    ,@(loop for (dst . src) in dst.src-list
            append `((fdefinition (quote ,dst))
                     (fdefinition (quote ,src))))))


#+tcl-utf-max<4 (progn

    (overwrite-func
     ;; #   define Tcl_UniCharToUtfDString Tcl_Char16ToUtfDString
     (tcl-uni-char-to-utf-d-string . tcl-char16-to-utf-d-string)

     ;; #   define Tcl_NumUtfChars TclNumUtfChars
     (tcl-num-utf-chars . tcl_num-utf-chars)

     ;; #   define Tcl_GetCharLength TclGetCharLength
     (tcl-get-char-length . tcl_get-char-length)

     ;; #   define Tcl_UtfAtIndex TclUtfAtIndex
     (tcl-utf-at-index . tcl_utf-at-index)

     ;; #   define Tcl_GetRange TclGetRange
     (tcl-get-range . tcl_get-range)

     ;; #   define Tcl_GetUniChar TclGetUniChar
     (tcl-get-uni-char . tcl_get-uni-char)

     ;; #   define Tcl_UtfNcmp TclUtfNcmp
     (tcl-utf-ncmp . tcl_utf-ncmp)

     ;; #   define Tcl_UtfNcasecmp TclUtfNcasecmp
     (tcl-utf-ncasecmp . tcl_utf-ncasecmp)

     ;; #   define Tcl_UtfToUniCharDString Tcl_UtfToChar16DString
     (tcl-utf-to-uni-char-d-string . tcl-utf-to-char16-d-string)

     ;; #   define Tcl_UtfToUniChar Tcl_UtfToChar16
     (tcl-utf-to-uni-char . tcl-utf-to-char16)

     ;; #   define Tcl_UniCharLen Tcl_Char16Len
     (tcl-uni-char-len . tcl-char16-len))

    ;; #	define Tcl_UniCharToUtf(c, p) \
    ;; 		((Tcl_UniCharToUtf)((c)|TCL_COMBINE, (p)))
    (let ((fdef--tcl-uni-char-to-utf
            (fdefinition 'tcl-uni-char-to-utf)))
      (setf (fdefinition 'tcl-uni-char-to-utf)
            (lambda (ch buf)
              (funcall fdef--tcl-uni-char-to-utf
                       (logior ch +tcl-combine+)
                       buf))))

    )








(if (null (cffi:foreign-symbol-pointer "Tcl_GetByteArrayFromObj"))
  (defun tcl-get-byte-array-from-obj (obj-ptr size-ptr)
    (tcl-get-bytes-from-obj (cffi:null-pointer) obj-ptr size-ptr))
  ;; else:
  (defun tcl-get-byte-array-from-obj (obj-ptr size-ptr)
    (%tcl-get-byte-array-from-obj obj-ptr size-ptr)))







(defun fix-argv0 (interp argv0)
  (when (null (tcl-get-var interp "::argv0" 0))
    (tcl-set-var interp "::argv0" argv0 0)))








