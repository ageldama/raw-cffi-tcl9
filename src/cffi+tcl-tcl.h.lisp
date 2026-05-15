(in-package #:raw-cffi-tcl9)


(defctype tcl-uni-char-ptr (:pointer tcl-uni-char))

(defctype client-data :pointer)

(defconstant +tcl-alpha-release+	0)
(defconstant +tcl-beta-release+ 	1)
(defconstant +tcl-final-release+	2)

(defconstant +tcl-ok+       0)
(defconstant +tcl-error+    1)
(defconstant +tcl-return+   2)
(defconstant +tcl-break+    3)
(defconstant +tcl-continue+ 4)
(defconstant +tcl-code-user-min+ 5)
(defconstant +tcl-code-user-max+ #x3fffffff "/*  1073741823 */")

(defconstant +tcl-result-size+		200)


(defconstant +tcl-subst-commands+	#o001)
(defconstant +tcl-subst-variables+	#o002)
(defconstant +tcl-subst-backslashes+	#o004)
(defconstant +tcl-subst-all+		#o007)


(defconstant +tcl-exact+	1
  "Flag that may be passed to Tcl_GetIndexFromObj to force it to disallow abbreviated strings.")
(defconstant +tcl-null-ok+      32)
(defconstant +tcl-index-temp-table+  64)

(defconstant +tcl-combine+  #x1000000)

(defconstant +tcl-dont-use-braces+	1
  "Tcl_ConvertElement: forces it not to enclose the element in braces, but to
use backslash quoting instead.")
(defconstant +TCL-DONT-QUOTE-HASH+	8
  "Tcl_ConvertElement: disables the default quoting of the '#' character. It is safe to leave the hash unquoted when the element is not the first element of a list, and this flag can be used by the caller to indicate that condition.")

(defconstant +tcl-thread-stack-default+  0)
(defconstant +tcl-thread-noflags+        #o0000)
(defconstant +tcl-thread-joinable+       #o0001)

(defconstant +tcl-match-nocase+          (ash 1 0))


(defctype tcl-size :ptrdiff)

(defctype tcl-size-ptr (:pointer tcl-size))


(defcenum tcl-path-type
  :tcl-path-absolute
  :tcl-path-relative
  :tcl-path-volume-relative)


(defcenum tcl-value-type
  :tcl-int
  :tcl-double
  :tcl-either
  :tcl-wide-int)

(defconstant +tcl-link-int+		1)
(defconstant +tcl-link-double+		2)
(defconstant +tcl-link-boolean+		3)
(defconstant +tcl-link-string+		4)
(defconstant +tcl-link-wide-int+	5)
(defconstant +tcl-link-char+		6)
(defconstant +tcl-link-uchar+		7)
(defconstant +tcl-link-short+		8)
(defconstant +tcl-link-ushort+		9)
(defconstant +tcl-link-uint+		10)
(defconstant +tcl-link-long+
  #+64-bit 5 ; wide-int
  #-64-bit 1 ; int
  )
(defconstant +tcl-link-ulong+
  #+64-bit 14 ; wide-uint
  #-64-bit 10 ; uint
  )
(defconstant +tcl-link-float+		13)
(defconstant +tcl-link-wide-uint+	14)
(defconstant +tcl-link-chars+	        15)
(defconstant +tcl-link-binary+	        16)
(defconstant +tcl-link-read-only+	#x80)


(defconstant +tcl-global-only+		 1)
(defconstant +tcl-namespace-only+	 2)
(defconstant +tcl-append-value+		 4)
(defconstant +tcl-list-element+		 8)
(defconstant +tcl-trace-reads+		 #x10)
(defconstant +tcl-trace-writes+	 	 #x20)
(defconstant +tcl-trace-unsets+		 #x40)
(defconstant +tcl-trace-destroyed+	 #x80)
(defconstant +tcl-interp-destroyed+	 #x100)

(defconstant +tcl-leave-err-msg+	 #x200)
(defconstant +tcl-trace-array+		 #x800)
(defconstant +tcl-trace-old-style+	 #x1000)

(defconstant +tcl-trace-result-dynamic+	 #x8000)
(defconstant +tcl-trace-result-object+   #x10000)


(defconstant +tcl-reg-basic+   	#o000000)
(defconstant +tcl-reg-extended+	#o000001)
(defconstant +tcl-reg-advf+	#o000002)
(defconstant +tcl-reg-advanced+	#o000003)
(defconstant +tcl-reg-quote+	#o000004)
(defconstant +tcl-reg-nocase+	#o000010)
(defconstant +tcl-reg-nosub+	#o000020)
(defconstant +tcl-reg-expanded+	#o000040)
(defconstant +tcl-reg-nlstop+	#o000100)
(defconstant +tcl-reg-nlanch+	#o000200)
(defconstant +tcl-reg-newline+	#o000300)
(defconstant +tcl-reg-canmatch+	#o001000)


(defconstant +tcl-reg-notbol+	#o0001)
(defconstant +tcl-reg-noteol+	#o0002)


(defconstant +tcl-f-ok+		#o00)
(defconstant +tcl-x-ok+		#o01)
(defconstant +tcl-w-ok+		#o02)
(defconstant +tcl-r-ok+		#o04)


(defconstant +tcl-thread-stack-default+ 0)
(defconstant +tcl-thread-noflags+	 #o0000)
(defconstant +tcl-thread-joinable+	 #o0001)

(defconstant +tcl-mode-blocking+	0)
(defconstant +tcl-mode-nonblocking+	1)

(defconstant +tcl-trace-rename+	#x2000)
(defconstant +tcl-trace-delete+	#x4000)

(defconstant +tcl-allow-inline-compilation+ #x20000)



(defconstant +tcl-limit-commands+	#x01)
(defconstant +tcl-limit-time+		#x02)


(defconstant +tcl-no-eval+		#x010000)
(defconstant +tcl-eval-global+		#x020000)
(defconstant +tcl-eval-direct+		#x040000)
(defconstant +tcl-eval-invoke+		#x080000)
(defconstant +tcl-cancel-unwind+	#x100000)
(defconstant +tcl-eval-noerr+           #x200000)

(defconstant +tcl-volatile+  1)
(defconstant +tcl-static+    0)
(defconstant +tcl-dynamic+   3)












(defconstant +tcl-ensemble-prefix+ #x02
  "Flag value to say whether to allow unambiguous prefixes of commands or
to require exact matches for command names.")









(defcstruct tcl-reg-exp-indices
  "typedef struct Tcl_RegExpIndices"
  (start tcl-size)   ;/* Character offset of first character in match. */
  (end   tcl-size)   ;/* Character offset of first character after the match. */
  )

(defctype tcl-reg-exp-indices-ptr (:pointer (:struct tcl-reg-exp-indices)))


(defcstruct tcl-reg-exp-info
  "typedef struct Tcl_RegExpInfo"
  (nsubs   tcl-size)  ;/* Number of subexpressions in the compiled expression. */
  (matches tcl-reg-exp-indices-ptr) ;/* Array of nsubs match offset pairs. */
  (extendStart tcl-size) ;/* The offset at which a subsequent match might begin. */
  ;; (reserved :long) ;/* Reserved for later use. */
)


(defctype tcl-reg-exp-info-ptr
    (:pointer (:struct tcl-reg-exp-info)))









(defctype tcl-async-handler (:pointer)
  "OPAQUE: Tcl_AsyncHandler")


(defctype tcl-channel (:pointer)
  "OPAQUE: Tcl_Channel")


(defctype tcl-channel-type-version (:pointer)
  "OPAQUE: Tcl_ChannelTypeVersion")


(defctype tcl-command (:pointer)
  "OPAQUE: Tcl_Command")


(defctype tcl-condition-ptr (:pointer)
  "OPAQUE: Tcl_Condition*")


(defctype tcl-dict (:pointer)
  "OPAQUE: Tcl_Dict")


(defctype tcl-dict-ptr (:pointer)
  "OPAQUE: Tcl_Dict*")


(defctype tcl-encoding-state-ptr (:pointer)
  "OPAQUE: Tcl_EncodingState*")


(defctype tcl-encoding (:pointer)
  "OPAQUE: Tcl_Encoding")

(defctype tcl-encoding-ptr (:pointer)
  "OPAQUE: Tcl_Encoding*")


(defctype tcl-interp-ptr (:pointer)
  "OPAQUE: Tcl_Interp*")


(defctype tcl-interp-state (:pointer)
  "OPAQUE: Tcl_InterpState")


(defctype tcl-load-handle (:pointer)
  "OPAQUE: Tcl_LoadHandle")

(defctype tcl-load-handle-ptr (:pointer tcl-load-handle)
  "OPAQUE: Tcl_LoadHandle*")


(defctype tcl-mutex-ptr (:pointer)
  "OPAQUE: Tcl_Mutex*")


(defctype tcl-pid (:pointer) "OPAQUE: Tcl_Pid")

(defctype tcl-pid-ptr (:pointer tcl-pid) "OPAQUE: Tcl_Pid*")


(defctype tcl-reg-exp (:pointer) "OPAQUE: Tcl_RegExp")


(defctype tcl-thread-data-key-ptr (:pointer)
  "OPAQUE: Tcl_ThreadDataKey*")

(defctype tcl-thread-id (:pointer) "OPAQUE: Tcl_ThreadId")

(defctype tcl-thread-id-ptr (:pointer tcl-thread-id)
  "OPAQUE: Tcl_ThreadId*")

(defctype tcl-timer-token (:pointer)
  "OPAQUE: Tcl_TimerToken")

(defctype tcl-trace (:pointer)
  "OPAQUE: Tcl_Trace")

(defctype tcl-var (:pointer)
  "OPAQUE: Tcl_Var")

(defctype tcl-zlib-stream-ptr (:pointer)
  "OPAQUE: Tcl_ZlibStream*")


(defctype tcl-stat-buf-ptr (:pointer)
  "TODO: Tcl_StatBuf* ?")





;;;

(defctype tcl-thread-create-proc (:pointer)
    "#if defined _WIN32
typedef unsigned (__stdcall Tcl_ThreadCreateProc) (ClientData clientData);
#else
typedef void (Tcl_ThreadCreateProc) (ClientData clientData);
#endif")






;;; function types:


(defctype tcl-app-init-proc (:pointer)
  "typedef int (Tcl_AppInitProc) (Tcl_Interp *interp);")

(defctype tcl-async-proc (:pointer)
  "typedef int (Tcl_AsyncProc) (ClientData clientData, Tcl_Interp *interp, int code);")

(defctype tcl-channel-proc (:pointer)
  "typedef void (Tcl_ChannelProc) (ClientData clientData, int mask);")

(defctype tcl-close-proc (:pointer)
  "typedef void (Tcl_CloseProc) (ClientData data);")

(defctype tcl-cmd-delete-proc (:pointer)
  "typedef void (Tcl_CmdDeleteProc) (ClientData clientData);")

(defctype tcl-cmd-proc (:pointer)
  "typedef int (Tcl_CmdProc) (ClientData clientData, Tcl_Interp *interp,
	int argc, CONST84 char *argv[]);")

(defctype tcl-cmd-trace-proc (:pointer)
  "typedef void (Tcl_CmdTraceProc) (ClientData clientData, Tcl_Interp *interp,
	int level, char *command, Tcl_CmdProc *proc,
	ClientData cmdClientData, int argc, char *argv[]);")

(defctype tcl-cmd-obj-trace-proc (:pointer)
"typedef int (Tcl_CmdObjTraceProc) (ClientData clientData, Tcl_Interp *interp,
	int level, const char *command, Tcl_Command commandInfo, int objc,
	struct Tcl_Obj *const *objv);
")

(defctype tcl-cmd-obj-trace-delete-proc (:pointer)
"typedef void (Tcl_CmdObjTraceDeleteProc) (ClientData clientData);")

(defctype tcl-dup-internal-rep-proc (:pointer)
"typedef void (Tcl_DupInternalRepProc) (struct Tcl_Obj *srcPtr, struct Tcl_Obj *dupPtr);")

(defctype tcl-encoding-convert-proc (:pointer)
  "typedef int (Tcl_EncodingConvertProc) (void *clientData, const char *src,
	int srcLen, int flags, Tcl_EncodingState *statePtr, char *dst,
	int dstLen, int *srcReadPtr, int *dstWrotePtr, int *dstCharsPtr);")

(defctype tcl-encoding-free-proc (:pointer)
  "typedef void (Tcl_EncodingFreeProc) (void *clientData);")

(defctype tcl-event-proc (:pointer)
  "typedef int (Tcl_EventProc) (Tcl_Event *evPtr, int flags);")

(defctype tcl-event-check-proc (:pointer)
  "typedef void (Tcl_EventCheckProc) (ClientData clientData, int flags);")

(defctype tcl-event-delete-proc (:pointer)
  "typedef int (Tcl_EventDeleteProc) (Tcl_Event *evPtr, ClientData clientData);")

(defctype tcl-event-setup-proc (:pointer)
  "typedef void (Tcl_EventSetupProc) (ClientData clientData, int flags);")

(defctype tcl-exit-proc (:pointer)
  "typedef void (Tcl_ExitProc) (ClientData clientData);")

(defctype tcl-file-proc (:pointer)
  "typedef void (Tcl_FileProc) (ClientData clientData, int mask);")

(defctype tcl-file-free-proc (:pointer)
  "typedef void (Tcl_FileFreeProc) (void *clientData);")

(defctype tcl-free-internal-rep-proc (:pointer)
  "typedef void (Tcl_FreeInternalRepProc) (struct Tcl_Obj *objPtr);")

(defctype tcl-idle-proc (:pointer)
  "typedef void (Tcl_IdleProc) (ClientData clientData);")

(defctype tcl-interp-delete-proc (:pointer)
  "typedef void (Tcl_InterpDeleteProc) (ClientData clientData, Tcl_Interp
*interp);")

(defctype tcl-namespace-delete-proc (:pointer)
  "typedef void (Tcl_NamespaceDeleteProc) (ClientData clientData);")

(defctype tcl-obj-cmd-proc (:pointer)
  "typedef int (Tcl_ObjCmdProc) (ClientData clientData, Tcl_Interp *interp,
	int objc, struct Tcl_Obj *const *objv);")

(defctype tcl-obj-cmd-proc2 (:pointer)
  "typedef int (Tcl_ObjCmdProc2) (void *clientData, Tcl_Interp *interp,
	Tcl_Size objc, struct Tcl_Obj *const *objv);")

(defctype tcl-cmd-obj-trace-proc2 (:pointer)
  "typedef int (Tcl_CmdObjTraceProc2) (void *clientData, Tcl_Interp *interp,
	Tcl_Size level, const char *command, Tcl_Command commandInfo, Tcl_Size objc,
	struct Tcl_Obj *const *objv);")

(defctype tcl-free-proc (:pointer)
    "typedef void (Tcl_FreeProc) (char *blockPtr);")

(defctype tcl-library-init-proc (:pointer)
  "typedef int (Tcl_LibraryInitProc) (Tcl_Interp *interp);")

(defctype tcl-library-unload-proc (:pointer)
  "typedef int (Tcl_LibraryUnloadProc) (Tcl_Interp *interp, int flags);")

(defctype tcl-panic-proc (:pointer)
  "typedef void (Tcl_PanicProc) (const char *format, ...);")

(defctype tcl-tcp-accept-proc (:pointer)
  "typedef void (Tcl_TcpAcceptProc) (ClientData callbackData, Tcl_Channel chan, char *address, int port);")

(defctype tcl-timer-proc (:pointer)
  "typedef void (Tcl_TimerProc) (ClientData clientData);")

(defctype tcl-set-from-any-proc (:pointer)
  "typedef int (Tcl_SetFromAnyProc) (Tcl_Interp *interp, struct Tcl_Obj *objPtr);")

(defctype tcl-update-string-proc (:pointer)
  "typedef void (Tcl_UpdateStringProc) (struct Tcl_Obj *objPtr);")

(defctype tcl-var-trace-proc (:pointer)
  "typedef char * (Tcl_VarTraceProc) (ClientData clientData, Tcl_Interp
*interp, char *part1, char *part2, int flags);")

(defctype tcl-command-trace-proc (:pointer)
  "typedef void (Tcl_CommandTraceProc) (void *clientData, Tcl_Interp *interp,
	const char *oldName, const char *newName, int flags);")

(defctype tcl-create-file-handler-proc (:pointer)
  "typedef void (Tcl_CreateFileHandlerProc) (int fd, int mask, Tcl_FileProc *proc,
	void *clientData);")

(defctype tcl-delete-file-handler-proc (:pointer)
  "typedef void (Tcl_DeleteFileHandlerProc) (int fd);")

(defctype tcl-alert-notifier-proc (:pointer)
  "typedef void (Tcl_AlertNotifierProc) (void *clientData);")

(defctype tcl-service-mode-hook-proc (:pointer)
  "typedef void (Tcl_ServiceModeHookProc) (int mode);")

(defctype tcl-init-notifier-proc (:pointer)
  "typedef void *(Tcl_InitNotifierProc) (void);")

(defctype tcl-finalize-notifier-proc (:pointer)
  "typedef void (Tcl_FinalizeNotifierProc) (void *clientData);")

(defctype tcl-main-loop-proc (:pointer)
  "typedef void (Tcl_MainLoopProc) (void);")




;;; abstract list functions

(defctype tcl-obj-type-length-proc (:pointer)
  "typedef Tcl_Size (Tcl_ObjTypeLengthProc) (struct Tcl_Obj *listPtr);")

(defctype tcl-obj-type-index-proc (:pointer)
  "typedef int (Tcl_ObjTypeIndexProc) (Tcl_Interp *interp,
struct Tcl_Obj *listPtr, Tcl_Size index, struct Tcl_Obj** elemObj);")

(defctype tcl-obj-type-slice-proc (:pointer)
  "typedef int (Tcl_ObjTypeSliceProc) (Tcl_Interp *interp,
struct Tcl_Obj *listPtr,Tcl_Size fromIdx, Tcl_Size toIdx, struct Tcl_Obj **newObjPtr);")

(defctype tcl-obj-type-reverse-proc (:pointer)
  "typedef int (Tcl_ObjTypeReverseProc) (Tcl_Interp *interp,
	struct Tcl_Obj *listPtr, struct Tcl_Obj **newObjPtr);")

(defctype tcl-obj-type-get-elements (:pointer)
"typedef int (Tcl_ObjTypeGetElements) (Tcl_Interp *interp,
	struct Tcl_Obj *listPtr, Tcl_Size *objcptr, struct Tcl_Obj ***objvptr);")

(defctype tcl-obj-type-set-element (:pointer)
"typedef	struct Tcl_Obj *(Tcl_ObjTypeSetElement) (Tcl_Interp *interp,
	struct Tcl_Obj *listPtr, Tcl_Size indexCount,
	struct Tcl_Obj *const indexArray[], struct Tcl_Obj *valueObj);")

(defctype tcl-obj-type-replace-proc (:pointer)
"typedef int (Tcl_ObjTypeReplaceProc) (Tcl_Interp *interp,
	struct Tcl_Obj *listObj, Tcl_Size first, Tcl_Size numToDelete,
	Tcl_Size numToInsert, struct Tcl_Obj *const insertObjs[]);")

(defctype tcl-obj-type-in-operator-proc (:pointer)
"typedef int (Tcl_ObjTypeInOperatorProc) (Tcl_Interp *interp,
	struct Tcl_Obj *valueObj, struct Tcl_Obj *listObj, int *boolResult);")







(defcstruct tcl-obj-type
  "Tcl_ObjType

The following structure represents a type of object, which is a
particular internal representation for an object plus a set of
functions that provide standard operations on objects of that type."

  ;; Name of the type, e.g. "int".
  (name :string)

  ;; Called to free any storage for the type's internal rep. NULL if
  ;; the internal rep does not need freeing.
  (free-int-rep-proc tcl-free-internal-rep-proc)

  ;; Called to create a new object as a copy of an existing object.
  (dup-int-rep-proc  tcl-dup-internal-rep-proc)

  ;; Called to update the string rep from the type's internal
  ;; representation.
  (update-string-proc  tcl-update-string-proc)

  ;; Called to convert the object's internal rep to this type. Frees
  ;; the internal rep of the old type. Returns TCL_ERROR on failure.
  (set-from-any-proc   tcl-set-from-any-proc)

  ;; Version field for future-proofing.
  (version :size)

  ;; -- List emulation functions - ObjType Version 1 --

  ;; Return the [llength] of the AbstractList
  (length-proc tcl-obj-type-length-proc)

  ;; Return a value (Tcl_Obj) at a given index
  (index-proc tcl-obj-type-index-proc)

  ;; Return an AbstractList for [lrange $al $start $end]
  (slice-proc tcl-obj-type-slice-proc)

  ;; Return an AbstractList for [lreverse $al]
  (reverse-proc tcl-obj-type-reverse-proc)

  ;; Return an objv[] of all elements in the list
  (get-elements-proc tcl-obj-type-get-elements)

  ;; Replace the element at the indicies with the given valueObj.
  (set-elements-proc tcl-obj-type-set-element)

  ;; Replace sublist with another sublist
  (replace-proc tcl-obj-type-replace-proc)

  ;; "in" and "ni" expr list operation. Determine if the given string
  ;; value matches an element in the list.
  (in-oper-proc tcl-obj-type-in-operator-proc)
  )


(defctype tcl-obj-type-ptr (:pointer (:struct tcl-obj-type))
  "Tcl_ObjType*")




(defcstruct tcl-obj-internal-rep/two-ptr-value
  (ptr1 :pointer)
  (ptr2 :pointer))


(defcstruct tcl-obj-internal-rep/ptr-and-long-rep
  (ptr1 :pointer)
  (value :ulong))


(defcstruct tcl-obj-internal-rep/ptr-and-size
  (ptr1 :pointer)
  (size tcl-size))


(cffi:defcunion tcl-obj-internal-rep
  "Tcl_ObjInternalRep

The following structure stores an internal
representation (internalrep) for a Tcl value. An internalrep is
associated with an Tcl_ObjType when both are stored in the same
Tcl_Obj. The routines of the Tcl_ObjType govern the handling of the
internalrep."
  (long-value        :long)
  (double-value      :double)
  (other-value-ptr   :pointer)
  (wide-value        tcl-wide-int)
  (two-ptr-value     (:struct tcl-obj-internal-rep/two-ptr-value))
  (ptr-and-long-rep  (:struct tcl-obj-internal-rep/ptr-and-long-rep))
  (ptr-and-size      (:struct tcl-obj-internal-rep/ptr-and-size)))


(defctype tcl-obj-internal-rep-ptr (:pointer (:union tcl-obj-internal-rep)))






(defcstruct tcl-obj
  "Tcl_Obj

One of the following structures exists for each object in the Tcl
system. An object stores a value as either a string, some internal
representation, or both."
  ;; When 0 the object will be freed.
  (ref-count tcl-size)

  ;; This points to the first byte of the object's string
  ;; representation. The array must be followed by a null byte (i.e.,
  ;; at offset length) but may also contain embedded null characters.
  ;; The array's storage is allocated by Tcl_Alloc. NULL means the
  ;; string rep is invalid and must be regenerated from the internal
  ;; rep. Clients should use Tcl_GetStringFromObj or Tcl_GetString to
  ;; get a pointer to the byte array as a readonly value.
  (bytes     :pointer)

  ;; The number of bytes at *bytes, not including the terminating
  ;; null.
  (length    tcl-size)

  ;; Denotes the object's type. Always corresponds to the type of the
  ;; object's internal rep. NULL indicates the object has no internal
  ;; rep (has no type).
  (type-ptr  tcl-obj-type-ptr)

  (internal-rep (:union tcl-obj-internal-rep)))


(defctype tcl-obj-ptr (:pointer (:struct tcl-obj)))





(defcstruct tcl-namespace
  "Tcl_Namespace

The following definitions support Tcl's namespace facility. Note: the
first five fields must match exactly the fields in a Namespace
structure (see tclInt.h)."

  ;; The namespace's name within its parent namespace. This contains
  ;; no ::'s. The name of the global namespace is "" although "::"
  (name         :string)

  ;; The namespace's fully qualified name. This starts with ::.
  (full-name    :string)

  ;; Arbitrary value associated with this namespace.
  (client-data  client-data)

  ;; Function invoked when deleting the namespace to, e.g., free
  ;; clientData.
  (delete-proc  tcl-namespace-delete-proc)

  ;; Points to the namespace that contains this one. NULL if this is
  ;; the global namespace.
  (parent-ptr   (:pointer)))


(defctype tcl-namespace-ptr (:pointer (:struct tcl-namespace))
  "Tcl_Namespace*")






(defcstruct tcl-call-frame
  "Tcl_CallFrame

The following structure represents a call frame, or activation record.
A call frame defines a naming context for a procedure call: its local
scope
(for local variables) and its namespace scope (used for non-local
variables; often the global :: namespace). A call frame can also define the
naming context for a namespace eval or namespace inscope command: the
namespace in which the command's code should execute. The Tcl_CallFrame
structures exist only while procedures or namespace eval/inscope's are
being executed, and provide a Tcl call stack.

A call frame is initialized and pushed using Tcl_PushCallFrame and
popped using Tcl_PopCallFrame. Storage for a Tcl_CallFrame must be
provided by the Tcl_PushCallFrame caller, and callers typically
allocate them on the C call stack for efficiency. For this reason,
Tcl_CallFrame is defined as a structure and not as an opaque token.
However, most Tcl_CallFrame fields are hidden since applications
should not access them directly; others are declared as `dummyX'.

WARNING!! The structure definition must be kept consistent with the
CallFrame structure in tclInt.h. If you change one, change the other.
"
  ;; Current namespace for the call frame.
  (ns-ptr  tcl-namespace-ptr)
  (dummy1 :int)
  (dummy2 tcl-size)
  (dummy3 :pointer)
  (dummy4 :pointer)
  (dummy5 :pointer)
  (dummy6 tcl-size)
  (dummy7 :pointer)
  (dummy8 :pointer)
  (dummy9 tcl-size)
  (dummy10 :pointer)
  (dummy11 :pointer)
  (dummy12 :pointer)
  (dummy13 :pointer))





(defcstruct tcl-cmd-info
  "Tcl_CmdInfo

Information about commands that is returned by Tcl_GetCommandInfo and
passed to Tcl_SetCommandInfo. objProc is an objc/objv object-based
command function while proc is a traditional Tcl argc/argv
string-based function. Tcl_CreateObjCommand and Tcl_CreateCommand
ensure that both objProc and proc are non-NULL and can be called to
execute the command. However, it may be faster to call one instead of
the other. The member isNativeObjectProc is set to 1 if an
object-based function was registered by Tcl_CreateObjCommand, and to 0
if a string-based function was registered by Tcl_CreateCommand. The
other function is typically set to a compatibility wrapper that does
string-to-object or object-to-string argument conversions then calls
the other function.
"
  ;; 1 if objProc was registered by a call to Tcl_CreateObjCommand; 2
  ;; if objProc was registered by a call to Tcl_CreateObjCommand2; 0
  ;; otherwise. Tcl_SetCmdInfo does not modify this field.
  (is-native-object-proc  :int)

  ;; Command's object-based function.
  (obj-proc               tcl-obj-cmd-proc)

  ;; ClientData for object proc.
  (obj-client-data        client-data)

  ;; Command's string-based function.
  (proc                   tcl-cmd-proc)

  ;; ClientData for string proc.
  (client-data            client-data)

  ;; Function to call when command is deleted.
  (delete-proc            tcl-cmd-delete-proc)

  ;; Value to pass to deleteProc (usually the same as clientData).
  (delete-data            client-data)

  ;; Points to the namespace that contains this command. Note that
  ;; Tcl_SetCmdInfo will not change a command's namespace; use
  ;; TclRenameCommand or Tcl_Eval (of 'rename') to do that.
  (namespace-ptr          tcl-namespace-ptr)

  ;; Command's object2-based function.
  (obj-proc2              tcl-obj-cmd-proc2)

  ;; ClientData for object2 proc.
  (obj-client-data2       client-data))

(defctype tcl-cmd-info-ptr (:pointer (:struct tcl-cmd-info))
  "Tcl_CmdInfo*")





(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +tcl-d-string-static-size+ 200
    "TCL_DSTRING_STATIC_SIZE"))


(defcstruct tcl-d-string
  "Tcl_DString

The structure defined below is used to hold dynamic strings. The only
fields that clients should use are string and length, accessible via
the macros Tcl_DStringValue and Tcl_DStringLength."

  ;; Points to beginning of string: either staticSpace below or a
  ;; malloced array.
  (string        :string)

  ;; Number of bytes in string excluding terminating nul
  (length        tcl-size)

  ;; Total number of bytes available for the string and its
  ;; terminating NULL char.
  (space-avl     tcl-size)

  ;; Space to use in common case where string is small.
  (static-space  (:array :char #.+tcl-d-string-static-size+))
  )

(defctype tcl-d-string-ptr (:pointer)
  "Tcl_DString*")




(defconstant +tcl-max-prec+		17
  "TCL_MAX_PREC")

(defconstant +tcl-double-space+	(+ 10 +tcl-max-prec+)
  "TCL_DOUBLE_SPACE")



(defconstant +tcl-integer-space+
  (* 3 (cffi:foreign-type-size 'tcl-wide-int))
  "TCL_INTEGER_SPACE")





(defconstant +tcl-number-int+          2
  "TCL_NUMBER_INT")

(defconstant +tcl-number-big+          3
  "TCL_NUMBER_BIG")

(defconstant +tcl-number-double+       4
  "TCL_NUMBER_DOUBLE")

(defconstant +tcl-number-nan+          5
  "TCL_NUMBER_NAN")








(defctype tcl-hash-type :size)


(defctype tcl-hash-key-proc (:pointer)
  "typedef TCL_HASH_TYPE (Tcl_HashKeyProc) (Tcl_HashTable *tablePtr, void *keyPtr);")

(defctype tcl-compare-hash-keys-proc (:pointer)
  "typedef int (Tcl_CompareHashKeysProc) (void *keyPtr, Tcl_HashEntry *hPtr);")

(defctype tcl-alloc-hash-entry-proc (:pointer)
  "typedef Tcl_HashEntry * (Tcl_AllocHashEntryProc) (Tcl_HashTable *tablePtr,
	void *keyPtr);")

(defctype tcl-free-hash-entry-proc (:pointer)
  "typedef void (Tcl_FreeHashEntryProc) (Tcl_HashEntry *hPtr);")


(cffi:defcunion tcl-hash-entry/key
  (one-word-value   (:pointer :char))
  (obj-ptr          tcl-obj-ptr)
  (words            (:array :int 1))
  (string           (:array :char 1)))


(defcstruct tcl-hash-entry
  "Tcl_HashEntry"

  (next-ptr  (:pointer)) ; Tcl_HashEntry*
  (table-ptr (:pointer)) ; Tcl_HashTable*
  (hash      :size)
  (client-data  client-data)
  (key       (:union tcl-hash-entry/key)))


(defctype tcl-hash-entry-ptr
    (:pointer (:struct tcl-hash-entry))
  "Tcl_HashEntry*")


(defconstant +tcl-hash-key-randomize-hash+ #x1
  "TCL_HASH_KEY_RANDOMIZE_HASH")

(defconstant +tcl-hash-key-system-hash+    #x2
  "TCL_HASH_KEY_SYSTEM_HASH")

(defconstant +tcl-hash-key-direct-compare+ #x4
  "TCL_HASH_KEY_DIRECT_COMPARE")


(defconstant +tcl-hash-key-type-version+ 1
  "TCL_HASH_KEY_TYPE_VERSION")


(defcstruct tcl-hash-key-type
  "Tcl_HashKeyType"
  (version :int)
  (flags   :int)
  (hash-key-proc      tcl-hash-key-proc)
  (compare-keys-proc  tcl-compare-hash-keys-proc)
  (alloc-entry-proc   tcl-alloc-hash-entry-proc)
  (free-entry-proc    tcl-free-hash-entry-proc))

(defctype tcl-hash-key-type-ptr
    (:pointer (:struct tcl-hash-key-type))
  "Tcl_HashKeyType*")

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +tcl-small-hash-table+ 4
    "TCL_SMALL_HASH_TABLE"))

(defcstruct tcl-hash-table
  (buckets              (:pointer tcl-hash-entry-ptr))
  (static-buckets       (:array tcl-hash-entry-ptr #.+tcl-small-hash-table+))
  (num-buckets          tcl-size)
  (num-entries          tcl-size)
  (rebuild-size         tcl-size)
  (mask                 :size)
  (down-shift           :int)
  (key-type             :int)

  ;;     Tcl_HashEntry *(*findProc) (Tcl_HashTable *tablePtr, const
  ;;     char *key);
  (find-proc            :pointer)

  ;;     Tcl_HashEntry *(*createProc) (Tcl_HashTable *tablePtr, const
  ;;     char *key, int *newPtr);
  (create-proc          :pointer)

  (type-ptr             tcl-hash-key-type-ptr))

(defctype tcl-hash-table-ptr (:pointer (:struct tcl-hash-table))
  "Tcl_HashTable*")




(defcstruct tcl-hash-search
  "Tcl_HashSearch"
  (table-ptr       tcl-hash-table-ptr)
  (next-index      tcl-size)
  (next-entry-ptr  tcl-hash-entry-ptr))

(defctype tcl-hash-search-ptr
    (:pointer (:struct tcl-hash-search))
  "Tcl_HashSearch*")





(defconstant +tcl-string-keys+		0)
(defconstant +tcl-one-word-keys+	1)
(defconstant +tcl-custom-type-keys+	-2)
(defconstant +tcl-custom-ptr-keys+	-1)


(defcstruct tcl-dict-search
  "Tcl_DictSearch"
  (next            :pointer)
  (epoch           tcl-hash-type)
  (dictionary-ptr  tcl-dict))


(defctype tcl-dict-search-ptr (:pointer (:struct tcl-dict-search))
  "Tcl_DictSearch*")




(defconstant +tcl-dont-wait+		(ash 1 1))
(defconstant +tcl-window-events+	(ash 1 2))
(defconstant +tcl-file-events+		(ash 1 3))
(defconstant +tcl-timer-events+		(ash 1 4))
(defconstant +tcl-idle-events+		(ash 1 5)) ; WAS 0x10 ????
(defconstant +tcl-all-events+		(lognot +tcl-dont-wait+))







(defcstruct tcl-event
  "Tcl_Event"
  (proc      tcl-event-proc)
  ;;     struct Tcl_Event *nextPtr; /* Next in list of pending events,
  ;;     or NULL. */
  (next-ptr  :pointer))


(defctype tcl-event-ptr (:pointer (:struct tcl-event))
  "Tcl_Event*")


(defcenum tcl-queue-position
  :tcl-queue-tail
  :tcl-queue-head
  :tcl-queue-mark
  (:tcl-queue-alert-if-empty 4)
  )


(defconstant +tcl-service-none+ 0)
(defconstant +tcl-service-all+ 1)





(defcstruct tcl-time
  (sec  :long-long)			;/* Seconds. */
  (usec :long)			;/* Microseconds. */
  )

(defctype tcl-time-ptr (:pointer (:struct tcl-time)))



(defctype tcl-set-timer-proc :pointer
  "typedef void (Tcl_SetTimerProc) (const Tcl_Time *timePtr);")

(defctype tcl-wait-for-event-proc :pointer
  "typedef int (Tcl_WaitForEventProc) (const Tcl_Time *timePtr);")

(defctype tcl-get-time-proc (:pointer)
  "typedef void (Tcl_GetTimeProc)   (Tcl_Time *timebuf, ClientData clientData);")

(defctype tcl-scale-time-proc (:pointer)
  "typedef void (Tcl_ScaleTimeProc) (Tcl_Time *timebuf, ClientData clientData);")




(defconstant +TCL-READABLE+   (ash 1 1))
(defconstant +TCL-WRITABLE+   (ash 1 2))
(defconstant +TCL-EXCEPTION+  (ash 1 3))



(defconstant +TCL-STDIN+        (ash 1 1))
(defconstant +TCL-STDOUT+       (ash 1 2))
(defconstant +TCL-STDERR+       (ash 1 3))
(defconstant +TCL-ENFORCE-MODE+ (ash 1 4))


(defconstant +TCL-CLOSE-READ+   (ash 1 1))
(defconstant +TCL-CLOSE-WRITE+  (ash 1 2))



(defconstant +tcl-close2proc+    (cffi:null-pointer)
  "TCL_CLOSE2PROC")


(defconstant +tcl-channel-version-1+ #x1
  "TCL_CHANNEL_VERSION_1")

(defconstant +tcl-channel-version-2+ #x2
  "TCL_CHANNEL_VERSION_2")

(defconstant +tcl-channel-version-3+ #x3
  "TCL_CHANNEL_VERSION_3")

(defconstant +tcl-channel-version-4+ #x4
  "TCL_CHANNEL_VERSION_4")

(defconstant +tcl-channel-version-5+ #x5
  "TCL_CHANNEL_VERSION_5")


(defconstant +tcl-channel-thread-insert+ 0
  "TCL_CHANNEL_THREAD_INSERT")

(defconstant +tcl-channel-thread-remove+ 1
  "TCL_CHANNEL_THREAD_REMOVE")



(defctype tcl-driver-block-mode-proc (:pointer)
  "typedef int	(Tcl_DriverBlockModeProc) (ClientData instanceData, int mode);")

(defctype tcl-driver-close-proc (:pointer))

(defctype tcl-driver-close2-proc (:pointer)
  "typedef int	(Tcl_DriverClose2Proc) (ClientData instanceData, Tcl_Interp *interp, int flags);")

(defctype tcl-driver-input-proc (:pointer)
  "typedef int	(Tcl_DriverInputProc) (ClientData instanceData, char *buf, int toRead, int *errorCodePtr);")

(defctype tcl-driver-output-proc (:pointer)
  "typedef int	(Tcl_DriverOutputProc) (ClientData instanceData, CONST84 char *buf, int toWrite, int *errorCodePtr);")

(defctype tcl-driver-seek-proc (:pointer)
"typedef int	(Tcl_DriverSeekProc)
(ClientData instanceData, long offset, int mode, int *errorCodePtr);")

(defctype tcl-driver-set-option-proc (:pointer)
"typedef int	(Tcl_DriverSetOptionProc)
(ClientData instanceData, Tcl_Interp *interp, const char *optionName, const char *value);")

(defctype tcl-driver-get-option-proc (:pointer)
"typedef int	(Tcl_DriverGetOptionProc)
(ClientData instanceData, Tcl_Interp *interp, CONST84 char *optionName, Tcl_DString *dsPtr);")

(defctype tcl-driver-watch-proc (:pointer)
"typedef void	(Tcl_DriverWatchProc)
 (ClientData instanceData, int mask);")

(defctype tcl-driver-get-handle-proc (:pointer)
"typedef int	(Tcl_DriverGetHandleProc)
 (ClientData instanceData, int direction, ClientData *handlePtr);")

(defctype tcl-driver-flush-proc (:pointer)
"typedef int	(Tcl_DriverFlushProc) (ClientData instanceData);")

(defctype tcl-driver-handler-proc (:pointer)
"typedef int	(Tcl_DriverHandlerProc)
 (ClientData instanceData, int interestMask);")

(defctype tcl-driver-wide-seek-proc (:pointer)
"typedef Tcl_WideInt (Tcl_DriverWideSeekProc)
 (ClientData instanceData, Tcl_WideInt offset, int mode, int *errorCodePtr);")

(defctype tcl-driver-thread-action-proc (:pointer)
  "typedef void	(Tcl_DriverThreadActionProc) (ClientData instanceData, int action);")

(defctype tcl-driver-truncate-proc (:pointer)
  "typedef int	(Tcl_DriverTruncateProc) (ClientData instanceData, Tcl_WideInt length);")




;;;



(defcstruct tcl-channel-type
  "Tcl_ChannelType"
  (type-name  (:pointer :char))
  (version    tcl-channel-type-version)
  (close-proc :pointer)
  (input-proc tcl-driver-input-proc)
  (output-proc tcl-driver-output-proc)
  (seek-proc  :pointer)
  (set-option-proc tcl-driver-set-option-proc)
  (get-option-proc tcl-driver-get-option-proc)
  (watch-proc tcl-driver-watch-proc)
  (get-handle-proc tcl-driver-get-handle-proc)
  (close2-proc tcl-driver-close2-proc)
  (block-mode-proc tcl-driver-block-mode-proc)
  (flush-proc tcl-driver-flush-proc)
  (handler-proc tcl-driver-handler-proc)
  (wide-seek-proc tcl-driver-wide-seek-proc)
  (thread-action-proc tcl-driver-thread-action-proc)
  (truncate-proc tcl-driver-truncate-proc)
  )

(defctype tcl-channel-type-ptr (:pointer)
  "Tcl_ChannelType*")


;;;;


(defcstruct tcl-glob-type-data
  (type  :int) ;/* Corresponds to bcdpfls as in 'find -t'. */
  (perm  :int) ;/* Corresponds to file permissions. */
  (mac-type  (:pointer (:struct tcl-obj))) ;/* Acceptable Mac type. */
  (mac-creator (:pointer (:struct tcl-obj))) ;/* Acceptable Mac creator. */
  )


(defctype tcl-glob-type-data-ptr (:pointer (:struct tcl-glob-type-data)))


(defconstant +tcl-glob-type-block+ (ash 1 0))
(defconstant +tcl-glob-type-char+  (ash 1 1))
(defconstant +tcl-glob-type-dir+   (ash 1 2))
(defconstant +tcl-glob-type-pipe+  (ash 1 3))
(defconstant +tcl-glob-type-file+  (ash 1 4))
(defconstant +tcl-glob-type-link+  (ash 1 5))
(defconstant +tcl-glob-type-sock+  (ash 1 6))
(defconstant +tcl-glob-type-mount+ (ash 1 7))

(defconstant +tcl-glob-perm-ronly+   (ash 1 0))
(defconstant +tcl-glob-perm-hidden+  (ash 1 1))
(defconstant +tcl-glob-perm-r+       (ash 1 2))
(defconstant +tcl-glob-perm-w+       (ash 1 3))
(defconstant +tcl-glob-perm-x+       (ash 1 4))





;;; Flags for the unload callback function.

(defconstant +tcl-unload-detach-from-interpreter+  (ash 1 0))
(defconstant +tcl-unload-detach-from-process+      (ash 1 1))



;;; Typedefs for the various filesystem operations:

(defctype tcl-fs-stat-proc :pointer
  "typedef int (Tcl_FSStatProc) (Tcl_Obj *pathPtr, Tcl_StatBuf *buf);")

(defctype tcl-fs-access-proc :pointer
  "typedef int (Tcl_FSAccessProc) (Tcl_Obj *pathPtr, int mode);")

(defctype tcl-fs-open-file-channel-proc :pointer
  "typedef Tcl_Channel (Tcl_FSOpenFileChannelProc) (Tcl_Interp *interp,
	Tcl_Obj *pathPtr, int mode, int permissions);")

(defctype tcl-fs-match-in-directory-proc :pointer
  "typedef int (Tcl_FSMatchInDirectoryProc) (Tcl_Interp *interp, Tcl_Obj *result,
	Tcl_Obj *pathPtr, const char *pattern, Tcl_GlobTypeData *types);")

(defctype tcl-fs-get-cwd-proc :pointer
  "typedef Tcl_Obj * (Tcl_FSGetCwdProc) (Tcl_Interp *interp);")

(defctype tcl-fs-chdir-proc :pointer
  "typedef int (Tcl_FSChdirProc) (Tcl_Obj *pathPtr);")

(defctype tcl-fs-lstat-proc :pointer
  "typedef int (Tcl_FSLstatProc) (Tcl_Obj *pathPtr, Tcl_StatBuf *buf);")

(defctype tcl-fs-create-directory-proc :pointer
  "typedef int (Tcl_FSCreateDirectoryProc) (Tcl_Obj *pathPtr);")

(defctype tcl-fs-delete-file-proc :pointer
  "typedef int (Tcl_FSDeleteFileProc) (Tcl_Obj *pathPtr);")

(defctype tcl-fs-copy-directory-proc :pointer
"typedef int (Tcl_FSCopyDirectoryProc) (Tcl_Obj *srcPathPtr,
	Tcl_Obj *destPathPtr, Tcl_Obj **errorPtr);")

(defctype tcl-fs-copy-file-proc :pointer
  "typedef int (Tcl_FSCopyFileProc) (Tcl_Obj *srcPathPtr, Tcl_Obj *destPathPtr);")

(defctype tcl-fs-remove-directory-proc :pointer
"typedef int (Tcl_FSRemoveDirectoryProc) (Tcl_Obj *pathPtr, int recursive,
	Tcl_Obj **errorPtr);")

(defctype tcl-fs-rename-file-proc :pointer
  "typedef int (Tcl_FSRenameFileProc) (Tcl_Obj *srcPathPtr, Tcl_Obj *destPathPtr);")

(defctype tcl-fs-unload-file-proc (:pointer)
"typedef void (Tcl_FSUnloadFileProc) (Tcl_LoadHandle loadHandle);")

(defctype tcl-fs-unload-file-proc :pointer
  "typedef void (Tcl_FSUnloadFileProc) (Tcl_LoadHandle loadHandle);")

(defctype tcl-fs-list-volumes-proc :pointer
  "typedef Tcl_Obj * (Tcl_FSListVolumesProc) (void);")

(defctype tcl-fs-utime-proc :pointer
  "typedef int (Tcl_FSUtimeProc) (Tcl_Obj *pathPtr, struct utimbuf *tval);")

(defctype tcl-fs-normalize-path-proc :pointer
"typedef int (Tcl_FSNormalizePathProc) (Tcl_Interp *interp, Tcl_Obj *pathPtr,
	int nextCheckpoint);")

(defctype tcl-fs-file-attrs-get-proc :pointer
"typedef int (Tcl_FSFileAttrsGetProc) (Tcl_Interp *interp, int index,
	Tcl_Obj *pathPtr, Tcl_Obj **objPtrRef);")

(defctype tcl-fs-file-attr-strings-proc :pointer
"typedef const char *const * (Tcl_FSFileAttrStringsProc) (Tcl_Obj *pathPtr,
	Tcl_Obj **objPtrRef);")

(defctype tcl-fs-file-attrs-set-proc :pointer
"typedef int (Tcl_FSFileAttrsSetProc) (Tcl_Interp *interp, int index,
	Tcl_Obj *pathPtr, Tcl_Obj *objPtr);")

(defctype tcl-fs-link-proc :pointer
"typedef Tcl_Obj * (Tcl_FSLinkProc) (Tcl_Obj *pathPtr, Tcl_Obj *toPtr,
	int linkType);")

(defctype tcl-fs-load-file-proc :pointer
"typedef int (Tcl_FSLoadFileProc) (Tcl_Interp *interp, Tcl_Obj *pathPtr,
	Tcl_LoadHandle *handlePtr, Tcl_FSUnloadFileProc **unloadProcPtr);")

(defctype tcl-fs-path-in-filesystem-proc :pointer
"typedef int (Tcl_FSPathInFilesystemProc) (Tcl_Obj *pathPtr,
	void **clientDataPtr);")

(defctype tcl-fs-filesystem-path-type-proc :pointer
  "typedef Tcl_Obj * (Tcl_FSFilesystemPathTypeProc) (Tcl_Obj *pathPtr);")

(defctype tcl-fs-filesystem-separator-proc :pointer
  "typedef Tcl_Obj * (Tcl_FSFilesystemSeparatorProc) (Tcl_Obj *pathPtr);")

(defctype tcl-fs-free-internal-rep-proc :pointer
  "#define Tcl_FSFreeInternalRepProc Tcl_FreeProc")

(defctype tcl-fs-dup-internal-rep-proc :pointer
  "typedef void *(Tcl_FSDupInternalRepProc) (void *clientData);")

(defctype tcl-fs-internal-to-normalized-proc :pointer
  "typedef Tcl_Obj * (Tcl_FSInternalToNormalizedProc) (void *clientData);")

(defctype tcl-fs-create-internal-rep-proc :pointer
  "typedef void *(Tcl_FSCreateInternalRepProc) (Tcl_Obj *pathPtr);")



(defctype tcl-fs-version :pointer)


(defconstant +tcl-filesystem-version-1+	#x1)



(defcstruct tcl-filesystem
  "Tcl_Filesystem"
  (type-name            :string)
  (structure-length     tcl-size)
  (version              tcl-fs-version)
  (path-in-filesystem-proc  tcl-fs-path-in-filesystem-proc)
  (dup-internal-rep-proc    tcl-fs-dup-internal-rep-proc)
  (free-internal-rep-proc   tcl-fs-free-internal-rep-proc)
  (internal-to-normalized-proc   tcl-fs-internal-to-normalized-proc)
  (create-internal-rep-proc      tcl-fs-create-internal-rep-proc)
  (normalize-path-proc           tcl-fs-normalize-path-proc)
  (filesystem-path-type-proc     tcl-fs-filesystem-path-type-proc)
  (filesystem-separator-proc     tcl-fs-filesystem-separator-proc)
  (stat-proc                     tcl-fs-stat-proc)
  (access-proc                   tcl-fs-access-proc)
  (open-file-channel-proc        tcl-fs-open-file-channel-proc)
  (match-in-directory-proc       tcl-fs-match-in-directory-proc)
  (utime-proc                    tcl-fs-utime-proc)
  (link-proc                     tcl-fs-link-proc)
  (list-volumes-proc             tcl-fs-list-volumes-proc)
  (file-attr-strings-proc        tcl-fs-file-attr-strings-proc)
  (file-attrs-get-proc           tcl-fs-file-attrs-get-proc)
  (file-attrs-set-proc           tcl-fs-file-attrs-set-proc)
  (create-directory-proc         tcl-fs-create-directory-proc)
  (remove-directory-proc         tcl-fs-remove-directory-proc)
  (delete-file-proc              tcl-fs-delete-file-proc)
  (copy-file-proc                tcl-fs-copy-file-proc)
  (rename-file-proc              tcl-fs-rename-file-proc)
  (copy-directory-proc           tcl-fs-copy-directory-proc)
  (lstat-proc                    tcl-fs-lstat-proc)
  (load-file-proc                tcl-fs-load-file-proc)
  (get-cwd-proc                  tcl-fs-get-cwd-proc)
  (chdir-proc                    tcl-fs-chdir-proc))


(defctype tcl-filesystem-ptr (:pointer)
  "Tcl_Filesystem*")



(defconstant +tcl-create-symbolic-link+	#x01)
(defconstant +tcl-create-hard-link+	#x02)





;;; The following structure represents the Notifier functions that you
;;; can override with the Tcl_SetNotifier call.

(defcstruct tcl-notifier-procs
  "Tcl_NotifierPRocs"
  (set-timer-proc       tcl-set-timer-proc)
  (wait-for-event-proc  tcl-wait-for-event-proc)
  (create-file-handler-proc  tcl-create-file-handler-proc)
  (delete-file-handler-proc  tcl-delete-file-handler-proc)
  (init-notifier-proc        tcl-init-notifier-proc)
  (finalize-notifier-proc    tcl-finalize-notifier-proc)
  (alert-notifier-proc       tcl-alert-notifier-proc)
  (service-mode-hook-proc    tcl-service-mode-hook-proc)
  )


(defctype tcl-notifier-procs-ptr (:pointer)
  "Tcl_NotifierProcs*")






;;; The following data structures and declarations are for the new Tcl
;;; parser. For each word of a command, and for each piece of a word
;;; such as a variable reference, one of the following structures is
;;; created to describe the token.


(defcstruct tcl-token
  "Tcl_Token"
  (type  :int) ;;/* Type of token, such as TCL_TOKEN_WORD; see below
               ;;for valid types. */
  (start (:pointer :char)) ;;/* First character in token. */
  (size  :int)          ;;/* Number of bytes in token. */
  (num-components :int) ;; If this token is composed of other
                        ;; tokens,this field tells how many of them
                        ;; there are (including components of
                        ;; components,etc.). The component tokens
                        ;; immediately follow this one.
  )

(defctype tcl-token-ptr (:pointer (:struct tcl-token)))



(defconstant +tcl-token-word+		1)
(defconstant +tcl-token-simple-word+	2)
(defconstant +tcl-token-text+		4)
(defconstant +tcl-token-bs+		8)
(defconstant +tcl-token-command+	16)
(defconstant +tcl-token-variable+	32)
(defconstant +tcl-token-sub-expr+	64)
(defconstant +tcl-token-operator+	128)
(defconstant +tcl-token-expand-word+	256)


(defconstant +tcl-parse-success+		0)
(defconstant +tcl-parse-quote-extra+		1)
(defconstant +tcl-parse-brace-extra+		2)
(defconstant +tcl-parse-missing-brace+		3)
(defconstant +tcl-parse-missing-bracket+	4)
(defconstant +tcl-parse-missing-paren+		5)
(defconstant +tcl-parse-missing-quote+		6)
(defconstant +tcl-parse-missing-var-brace+	7)
(defconstant +tcl-parse-syntax+		8)
(defconstant +tcl-parse-bad-number+		9)


(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +num-static-tokens+ 20))



(defcstruct tcl-parse
  "Tcl_Parse"

  (comment-start (:pointer :char))
  (comment-size  tcl-size)

  (command-start (:pointer :char))
  (command-size  tcl-size)

  (num-words     tcl-size)
  (token-ptr     tcl-token-ptr)
  (num-tokens    tcl-size)
  (tokens-available  tcl-size)
  (incomplete    :int)

  (string        (:pointer :char))
  (end           (:pointer :char))

  (interp        tcl-interp-ptr)

  (term          :string)

  (static-tokens (:array (:struct tcl-token) #.+num-static-tokens+)))



(defctype tcl-parse-ptr :pointer "Tcl_Parse*")






;;; The following structure represents a user-defined encoding. It
;;; collects together all the functions that are used by the specific
;;; encoding.

(defcstruct tcl-encoding-type
  "Tcl_EncodingType"
  (encoding-name  :string)
  (to-utf-proc    tcl-encoding-convert-proc)
  (from-utf-proc  tcl-encoding-convert-proc)
  (free-proc      tcl-free-proc)
  (client-data    client-data)
  (null-size      tcl-size))


(defctype tcl-encoding-type-ptr (:pointer)
  "Tcl_EncodingType*")



(defconstant +tcl-encoding-start+		#x01)
(defconstant +tcl-encoding-end+		#x02)
(defconstant +tcl-encoding-stoponerror+	#x0 "Not used any more")

(defconstant +tcl-encoding-no-terminate+	#x08)
(defconstant +tcl-encoding-char-limit+		#x10)
(defconstant +tcl-encoding-internal-use-mask+  #xFF00)


(defconstant +tcl-encoding-profile-strict+ 0
  "=TCL_ENCODING_STOPONERROR (0)")
(defconstant +tcl-encoding-profile-tcl8+     #x01000000)
(defconstant +tcl-encoding-profile-replace+  #x02000000)



(defconstant +tcl-convert-multibyte+	-1)
(defconstant +tcl-convert-syntax+	-2)
(defconstant +tcl-convert-unknown+	-3)
(defconstant +tcl-convert-nospace+	-4)



(defconstant +tcl-utf-max+		4)




;; TIP #59: The following structure is used in calls
;; 'Tcl_RegisterConfig' to provide the system with the embedded
;; configuration data.

(defcstruct tcl-config
  (key    :string)   ; ASCII/UTF-8
  (value  :string)   ; System encoding
  )

(defctype tcl-config-ptr (:pointer (:struct tcl-config)))





;;;; Structure containing information about a limit handler to be
;;;; called when a command- or time-limit is exceeded by an
;;;; interpreter.


(defctype tcl-limit-handler-proc (:pointer)
  "typedef void (Tcl_LimitHandlerProc) (ClientData clientData, Tcl_Interp *interp);")

(defctype tcl-limit-handler-delete-proc (:pointer)
  "typedef void (Tcl_LimitHandlerDeleteProc) (ClientData clientData);")




;;; mp_int

(defctype mp-int-ptr (:pointer) "mp_int")






;;; Definitions needed for Tcl_ParseArgvObj routines. Based on
;;; tkArgv.c.
;;;
;;; Modifications from the original are copyright (c) Sam Bromley 2006

(defcstruct tcl-argv-info
  (type         :int)
  (key-str      (:pointer :char))
  (src-ptr      :pointer)
  (dst-ptr      :pointer)
  (help-str     (:pointer :char))
  (client-data  client-data))

(defctype tcl-argv-info-ptr
    (:pointer (:struct tcl-argv-info)))



(defconstant +tcl-argv-constant+	15)
(defconstant +tcl-argv-int+		16)
(defconstant +tcl-argv-string+		17)
(defconstant +tcl-argv-rest+		18)
(defconstant +tcl-argv-float+		19)
(defconstant +tcl-argv-func+		20)
(defconstant +tcl-argv-genfunc+	21)
(defconstant +tcl-argv-help+		22)
(defconstant +tcl-argv-end+		23)






;;; Definitions needed for Tcl_Zlib routines. [TIP #234]

(defconstant +tcl-zlib-format-raw+	1)
(defconstant +tcl-zlib-format-zlib+	2)
(defconstant +tcl-zlib-format-gzip+	4)
(defconstant +tcl-zlib-format-auto+	8)

(defconstant +tcl-zlib-stream-deflate+	16)
(defconstant +tcl-zlib-stream-inflate+	32)

(defconstant +tcl-zlib-compress-none+	0)
(defconstant +tcl-zlib-compress-fast+	1)
(defconstant +tcl-zlib-compress-best+	9)
(defconstant +tcl-zlib-compress-default+ -1)

(defconstant +tcl-zlib-no-flush+	0)
(defconstant +tcl-zlib-flush+		2)
(defconstant +tcl-zlib-fullflush+	3)
(defconstant +tcl-zlib-finalize+	4)




;;; Definitions needed for the Tcl_LoadFile function. [TIP #416]

(defconstant +tcl-load-global+ 1)
(defconstant +tcl-load-lazy+ 2)




;;; Definitions needed for the Tcl_OpenTcpServerEx function. [TIP #456]

(defconstant +tcl-tcpserver-reuseaddr+ (ash 1 0))
(defconstant +tcl-tcpserver-reuseport+ (ash 1 1))




;;; Constants for special Tcl_Size-typed values, see TIP #494

(defconstant +tcl-io-failure+	-1 "((Tcl_Size)-1)")
(defconstant +tcl-auto-length+	-1 "((Tcl_Size)-1)")
(defconstant +tcl-index-none+   -1 "((Tcl_Size)-1)")




;;;  * Single public declaration for NRE.
(defctype tcl-nr-post-proc (:pointer)
  "typedef int (Tcl_NRPostProc) (ClientData data[], Tcl_Interp *interp, int result);")









;;;  The following constant is used to test for older versions of Tcl
;;;  in the stubs tables.
(defconstant +tcl-stub-magic+
  (+ #xFCA3BACB (cffi:foreign-type-size :pointer)))


;; The following function is required to be defined in all stubs aware
;; extensions. The function is actually implemented in the stub
;; library, not the main Tcl library, although there is a trivial
;; implementation in the main library in case an extension is
;; statically linked into an application.

(defcfun ("Tcl_InitStubs" tcl-init-stubs)
  :string
  (interp  tcl-interp-ptr)
  (version :string)
  (magic   :int))

(defcfun ("TclTomMathInitializeStubs" tcl-tom-math-initialize-stubs)
  :string
  (interp  tcl-interp-ptr)
  (version :string)
  (epoch   :int)
  (revision :int))

(defcfun ("TclInitStubTable" tcl-init-stub-table)
  :string
  (version :string))

(defcfun ("TclStubCall" tcl-stub-call) :pointer
  (arg :pointer))

(defcfun ("Tcl_ConsolePanic" tcl-console-panic) :void
  "(OR) #define Tcl_ConsolePanic ((Tcl_PanicProc *)NULL)"
  (fmt :string) &rest)









;;; <<<LOST+FOUND>>>

(defctype tcl-package-init-proc (:pointer)
  "typedef int (Tcl_PackageInitProc) (Tcl_Interp *interp);")

(defctype tcl-saved-result-ptr (:pointer)
  "TODO struct Tcl_SavedResult")

(defctype tcl-value-type-ptr (:pointer tcl-value-type))

(defctype tcl-math-proc (:pointer)
  "typedef int (Tcl_MathProc) (ClientData clientData, Tcl_Interp *interp,
	Tcl_Value *args, Tcl_Value *resultPtr);")


;;; EOF.
