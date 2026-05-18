<a name="src01-titlemd_00CDD61337F81A5DD72C41C5FB1DEC10"></a>
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

<a name="toc_6994206AA5146E62315E61B6ECF6F56B"></a>
# Table of Contents

   1. [raw-cffi-tcl9](#src01-titlemd_00CDD61337F81A5DD72C41C5FB1DEC10)
   1. [Table of Contents](#toc_6994206AA5146E62315E61B6ECF6F56B)
   1. [Supporting](#src02-supportmd_FBD3A3A997C645ED7BD27AF5F2A8C684)
   1. [License](#src03-licensemd_F1D6E1209BCE79BB56C1162561D8C7BB)
   1. [APIs](#api-refs_523EACBA8CE3897B5EE91337B062B676)
      1. [PACKAGE: `RAW-CFFI-TCL9`](#api-package-raw-cffi-tcl9_91D014E58231F3ED0681213DC83C9019)
         1. [CFFI-ENUM: `TCL-PATH-TYPE`](#api-cffi-enum-tcl-path-type_5C592BD387898E4C549A6CC13B588715)
         1. [CFFI-ENUM: `TCL-QUEUE-POSITION`](#api-cffi-enum-tcl-queue-position_C321D10BF154588515E6E63EBEA7212C)
         1. [CFFI-ENUM: `TCL-VALUE-TYPE`](#api-cffi-enum-tcl-value-type_EC8EF1FA4E56E8A7A8AD99D7952ED452)
         1. [CFFI-FUNCTION: `%TCL-ADD-ERROR-INFO`](#api-cffi-function-tcl-add-error-info_7203EF289B4433434E604275EBDC93F7)
         1. [CFFI-FUNCTION: `%TCL-ADD-OBJ-ERROR-INFO`](#api-cffi-function-tcl-add-obj-error-info_F5E5A0BF6DBEED26EDCE766A2BBF5E90)
         1. [CFFI-FUNCTION: `%TCL-BACKGROUND-ERROR`](#api-cffi-function-tcl-background-error_6EFD345B94439FC6AC1C69AFFBF23696)
         1. [CFFI-FUNCTION: `%TCL-BACKSLASH`](#api-cffi-function-tcl-backslash_2713AF7DDFFB2318DC0C3F998DCEFC37)
         1. [CFFI-FUNCTION: `%TCL-CLOSE`](#api-cffi-function-tcl-close_9D9284043804DFF39AD5B2E9E41F52BD)
         1. [CFFI-FUNCTION: `%TCL-CREATE-MATH-FUNC`](#api-cffi-function-tcl-create-math-func_0DB274FBBD42C2A5E90A23C53759CC42)
         1. [CFFI-FUNCTION: `%TCL-DB-NEW-BOOLEAN-OBJ`](#api-cffi-function-tcl-db-new-boolean-obj_2B233C8F25DF9667247E2CA0C50BAE51)
         1. [CFFI-FUNCTION: `%TCL-DB-NEW-LONG-OBJ`](#api-cffi-function-tcl-db-new-long-obj_909121FF16EA312C86152A418E656376)
         1. [CFFI-FUNCTION: `%TCL-DISCARD-RESULT`](#api-cffi-function-tcl-discard-result_B7AEF1AF4BB79DAAC43FC520D8E1B99E)
         1. [CFFI-FUNCTION: `%TCL-EVAL-OBJ`](#api-cffi-function-tcl-eval-obj_3F0DBA6493793614210A3C8C2E0E8E4D)
         1. [CFFI-FUNCTION: `%TCL-EVAL`](#api-cffi-function-tcl-eval_65DF61B1ABC81C546CE693251FA93F71)
         1. [CFFI-FUNCTION: `%TCL-FIND-EXECUTABLE`](#api-cffi-function-tcl-find-executable_C758C4048AEAACD4EA12865C7396E7DE)
         1. [CFFI-FUNCTION: `%TCL-FREE-RESULT`](#api-cffi-function-tcl-free-result_382AF0F1B7149078B265E8E2B879E3B4)
         1. [CFFI-FUNCTION: `%TCL-GET-ALIAS`](#api-cffi-function-tcl-get-alias_E385AEAE84CB87707FB2EAE42895FDDD)
         1. [CFFI-FUNCTION: `%TCL-GET-BYTE-ARRAY-FROM-OBJ`](#api-cffi-function-tcl-get-byte-array-from-obj_BC9C678C95DD5FC28ABD450957440832)
         1. [CFFI-FUNCTION: `%TCL-GET-INDEX-FROM-OBJ`](#api-cffi-function-tcl-get-index-from-obj_DA7F547A6477B71F4114B444188D181E)
         1. [CFFI-FUNCTION: `%TCL-GET-STRING-RESULT`](#api-cffi-function-tcl-get-string-result_CA069B8780816CAF1D0BDD7EBF4B509D)
         1. [CFFI-FUNCTION: `%TCL-GET-VAR`](#api-cffi-function-tcl-get-var_5468585500F177C667EFFAD99EF0FF7F)
         1. [CFFI-FUNCTION: `%TCL-GLOBAL-EVAL-OBJ`](#api-cffi-function-tcl-global-eval-obj_C4C88D973731E0D2527925C8139FB21B)
         1. [CFFI-FUNCTION: `%TCL-GLOBAL-EVAL`](#api-cffi-function-tcl-global-eval_1A99A786AF3D5BFB21702FC479BCCC04)
         1. [CFFI-FUNCTION: `%TCL-MAKE-SAFE`](#api-cffi-function-tcl-make-safe_3395693A5D26BDA4B070FCCFB1C3A961)
         1. [CFFI-FUNCTION: `%TCL-NEW-BOOLEAN-OBJ`](#api-cffi-function-tcl-new-boolean-obj_00BF6EC587D161EDE6393E636359A3E6)
         1. [CFFI-FUNCTION: `%TCL-NEW-INT-OBJ`](#api-cffi-function-tcl-new-int-obj_1238B55100ED95BC07CA9B4870761E74)
         1. [CFFI-FUNCTION: `%TCL-NEW-LONG-OBJ`](#api-cffi-function-tcl-new-long-obj_2CFFA41206D472F139AB37666FE9AEFF)
         1. [CFFI-FUNCTION: `%TCL-PKG-PRESENT`](#api-cffi-function-tcl-pkg-present_91D901C78B78E44A2B8205D6F8A3BE6E)
         1. [CFFI-FUNCTION: `%TCL-PKG-PROVIDE`](#api-cffi-function-tcl-pkg-provide_6E2549B5B9588598DBC1570AC81A7903)
         1. [CFFI-FUNCTION: `%TCL-PKG-REQUIRE`](#api-cffi-function-tcl-pkg-require_9CB6CDE3B31C49AE93AAFAA16D30F59E)
         1. [CFFI-FUNCTION: `%TCL-SEEK-OLD`](#api-cffi-function-tcl-seek-old_B79B4608BB876591061C395ADDD496CA)
         1. [CFFI-FUNCTION: `%TCL-SET-BOOLEAN-OBJ`](#api-cffi-function-tcl-set-boolean-obj_9B78267EA4750D08CF0C2E6D1D112D34)
         1. [CFFI-FUNCTION: `%TCL-SET-INT-OBJ`](#api-cffi-function-tcl-set-int-obj_6F53E89684AA7063058F5A75C609F454)
         1. [CFFI-FUNCTION: `%TCL-SET-LONG-OBJ`](#api-cffi-function-tcl-set-long-obj_3B5CD49449A1F3F53E64FDC54B5A84E2)
         1. [CFFI-FUNCTION: `%TCL-SET-PANIC-PROC`](#api-cffi-function-tcl-set-panic-proc_400DD4687D688C0D86CD76B553A6067C)
         1. [CFFI-FUNCTION: `%TCL-SET-RESULT`](#api-cffi-function-tcl-set-result_909EA957ABF1BF5AF0B7F64046112756)
         1. [CFFI-FUNCTION: `%TCL-SET-VAR`](#api-cffi-function-tcl-set-var_F0E78838C50173FA829305CB8317E9D4)
         1. [CFFI-FUNCTION: `%TCL-STATIC-PACKAGE`](#api-cffi-function-tcl-static-package_14365A93EADA445000FE31205FE1351E)
         1. [CFFI-FUNCTION: `%TCL-STRING-MATCH`](#api-cffi-function-tcl-string-match_91B9558690B3C5AE1AB7DEB953DD3B08)
         1. [CFFI-FUNCTION: `%TCL-TELL-OLD`](#api-cffi-function-tcl-tell-old_AED685973AA3D8826E2123F87113CA86)
         1. [CFFI-FUNCTION: `%TCL-TRACE-VAR`](#api-cffi-function-tcl-trace-var_3665E2A2F94FE0837BBE5082D28179B8)
         1. [CFFI-FUNCTION: `%TCL-UNSET-VAR`](#api-cffi-function-tcl-unset-var_EE771CCBA97D51E260C68EC5B530DEAE)
         1. [CFFI-FUNCTION: `%TCL-UNTRACE-VAR`](#api-cffi-function-tcl-untrace-var_7704AEE111829D1580785B2CAAF3BA9E)
         1. [CFFI-FUNCTION: `%TCL-UP-VAR`](#api-cffi-function-tcl-up-var_373EF3C7B5D8F31A3A19311947B10925)
         1. [CFFI-FUNCTION: `%TCL_VARTRACEINFO`](#api-cffi-function-tclvartraceinfo_A09EF491511DE853B92D7C7E25E62D9C)
         1. [CFFI-FUNCTION: `TCL-ACCESS`](#api-cffi-function-tcl-access_A578095C898D55D1F18206FB189C756C)
         1. [CFFI-FUNCTION: `TCL-ALERT-NOTIFIER`](#api-cffi-function-tcl-alert-notifier_DE800CF99F338705AB44773F5C9EF0EA)
         1. [CFFI-FUNCTION: `TCL-ALLOC-STAT-BUF`](#api-cffi-function-tcl-alloc-stat-buf_F3C13BD01B49CB4FB9A521E4AD1FEED8)
         1. [CFFI-FUNCTION: `TCL-ALLOC`](#api-cffi-function-tcl-alloc_EDB2FE4708CE48B90115B9224CEBA631)
         1. [CFFI-FUNCTION: `TCL-ALLOW-EXCEPTIONS`](#api-cffi-function-tcl-allow-exceptions_441E9450A7EB5DAB53AA32B16FAC8DF7)
         1. [CFFI-FUNCTION: `TCL-APPEND-ALL-OBJ-TYPES`](#api-cffi-function-tcl-append-all-obj-types_F0787F41655A217325AAE0D7A2522C08)
         1. [CFFI-FUNCTION: `TCL-APPEND-ELEMENT`](#api-cffi-function-tcl-append-element_9443FC706E96DB398A3EFF8EF98E236C)
         1. [CFFI-FUNCTION: `TCL-APPEND-EXPORT-LIST`](#api-cffi-function-tcl-append-export-list_E0A9C491EA4678395F620A70B08EE660)
         1. [CFFI-FUNCTION: `TCL-APPEND-FORMAT-TO-OBJ`](#api-cffi-function-tcl-append-format-to-obj_39128B8D18345D22DB27277CF24EF926)
         1. [CFFI-FUNCTION: `TCL-APPEND-LIMITED-TO-OBJ`](#api-cffi-function-tcl-append-limited-to-obj_E6C832FCB36A6B9977003EE5A3E81AB8)
         1. [CFFI-FUNCTION: `TCL-APPEND-OBJ-TO-ERROR-INFO`](#api-cffi-function-tcl-append-obj-to-error-info_CA06C339155CCEFE8B263A60F4071E62)
         1. [CFFI-FUNCTION: `TCL-APPEND-OBJ-TO-OBJ`](#api-cffi-function-tcl-append-obj-to-obj_1E6DDFB606B745C69CAA83D8F798EDB2)
         1. [CFFI-FUNCTION: `TCL-APPEND-PRINTF-TO-OBJ`](#api-cffi-function-tcl-append-printf-to-obj_DA3EB7151EECF83625C4D4B878E1577C)
         1. [CFFI-FUNCTION: `TCL-APPEND-RESULT`](#api-cffi-function-tcl-append-result_1DBE84A6CB89DD3DCE610118A9CC1C10)
         1. [CFFI-FUNCTION: `TCL-APPEND-STRINGS-TO-OBJ`](#api-cffi-function-tcl-append-strings-to-obj_748F2E5706C7CDFC04D1821921F258F4)
         1. [CFFI-FUNCTION: `TCL-APPEND-TO-OBJ`](#api-cffi-function-tcl-append-to-obj_9727BAC4DD4C7CF01D2DC526CCE13872)
         1. [CFFI-FUNCTION: `TCL-APPEND-UNICODE-TO-OBJ`](#api-cffi-function-tcl-append-unicode-to-obj_FA6CCD62DB5007CA5A0550921FC1549C)
         1. [CFFI-FUNCTION: `TCL-ASYNC-CREATE`](#api-cffi-function-tcl-async-create_8E46767CCB0C419BB2D0B1597EFB6E6E)
         1. [CFFI-FUNCTION: `TCL-ASYNC-DELETE`](#api-cffi-function-tcl-async-delete_7984FB1C22DDC6D0E39A3973202A8A75)
         1. [CFFI-FUNCTION: `TCL-ASYNC-INVOKE`](#api-cffi-function-tcl-async-invoke_D1E3532DE2C66F9606B1584D61489EAC)
         1. [CFFI-FUNCTION: `TCL-ASYNC-MARK-FROM-SIGNAL`](#api-cffi-function-tcl-async-mark-from-signal_83943AC2E1C2DB7B560AD3EC7BF31B32)
         1. [CFFI-FUNCTION: `TCL-ASYNC-MARK`](#api-cffi-function-tcl-async-mark_E42C3505B2C3BA8E596739C9AA187C41)
         1. [CFFI-FUNCTION: `TCL-ASYNC-READY`](#api-cffi-function-tcl-async-ready_55E1EF29FC70C7B9C7EFFED7AA8609D1)
         1. [CFFI-FUNCTION: `TCL-ATTEMPT-ALLOC`](#api-cffi-function-tcl-attempt-alloc_9224F5E1CB832378698FE8DB3B7FF6ED)
         1. [CFFI-FUNCTION: `TCL-ATTEMPT-DB-CKALLOC`](#api-cffi-function-tcl-attempt-db-ckalloc_EC05F80CFB9935EB641A8180DE0681B5)
         1. [CFFI-FUNCTION: `TCL-ATTEMPT-DB-CKREALLOC`](#api-cffi-function-tcl-attempt-db-ckrealloc_2E17412D2B27D96C771277A0D4385657)
         1. [CFFI-FUNCTION: `TCL-ATTEMPT-REALLOC`](#api-cffi-function-tcl-attempt-realloc_A5E3D1CBEC98C31138F53FE8397045FC)
         1. [CFFI-FUNCTION: `TCL-ATTEMPT-SET-OBJ-LENGTH`](#api-cffi-function-tcl-attempt-set-obj-length_F4D24ADA1DB50BB2C2A4DAC568185818)
         1. [CFFI-FUNCTION: `TCL-BACKGROUND-EXCEPTION`](#api-cffi-function-tcl-background-exception_19D688E2A102FB4553A6F18B3C9C3F6E)
         1. [CFFI-FUNCTION: `TCL-BAD-CHANNEL-OPTION`](#api-cffi-function-tcl-bad-channel-option_D5BB5F34495B9ACE2212E2E6F8678DA8)
         1. [CFFI-FUNCTION: `TCL-CALL-WHEN-DELETED`](#api-cffi-function-tcl-call-when-deleted_EB43D8F7C5AC9F3539CC7D90B7698CAC)
         1. [CFFI-FUNCTION: `TCL-CANCEL-EVAL`](#api-cffi-function-tcl-cancel-eval_50D6BB5B7A4CE2349F9F933E33E4107B)
         1. [CFFI-FUNCTION: `TCL-CANCEL-IDLE-CALL`](#api-cffi-function-tcl-cancel-idle-call_413655A1179A38AFC0A59E4E16EBC145)
         1. [CFFI-FUNCTION: `TCL-CANCELED`](#api-cffi-function-tcl-canceled_5E63E1E82196F5C20402738945E2AF39)
         1. [CFFI-FUNCTION: `TCL-CHANNEL-BLOCK-MODE-PROC`](#api-cffi-function-tcl-channel-block-mode-proc_DFB2AC0A81FB8B7C7407EB83A568B3AE)
         1. [CFFI-FUNCTION: `TCL-CHANNEL-BUFFERED`](#api-cffi-function-tcl-channel-buffered_C7102482EDAB166F0746AF0A96D7FD3D)
         1. [CFFI-FUNCTION: `TCL-CHANNEL-CLOSE2-PROC`](#api-cffi-function-tcl-channel-close2-proc_92019D5EA2117CC56A31B9FE5F619B96)
         1. [CFFI-FUNCTION: `TCL-CHANNEL-FLUSH-PROC`](#api-cffi-function-tcl-channel-flush-proc_3032A16A28F73A0FFC66ACD8643DEF96)
         1. [CFFI-FUNCTION: `TCL-CHANNEL-GET-HANDLE-PROC`](#api-cffi-function-tcl-channel-get-handle-proc_342A6202EE985033F6C06FE93CCDF5A1)
         1. [CFFI-FUNCTION: `TCL-CHANNEL-GET-OPTION-PROC`](#api-cffi-function-tcl-channel-get-option-proc_31D8806CFF4BBB6265BF1E701516145F)
         1. [CFFI-FUNCTION: `TCL-CHANNEL-HANDLER-PROC`](#api-cffi-function-tcl-channel-handler-proc_C3ACF4EC6ABFE62D74F0C70AA57CC194)
         1. [CFFI-FUNCTION: `TCL-CHANNEL-INPUT-PROC`](#api-cffi-function-tcl-channel-input-proc_BC2D5C73E6CE7CF30C8E1E791EB0F3B6)
         1. [CFFI-FUNCTION: `TCL-CHANNEL-NAME`](#api-cffi-function-tcl-channel-name_54F91D87F10DCC6A079F3E39F9CFB7BA)
         1. [CFFI-FUNCTION: `TCL-CHANNEL-OUTPUT-PROC`](#api-cffi-function-tcl-channel-output-proc_393843971B5ED5CAB4AD586B47B292B2)
         1. [CFFI-FUNCTION: `TCL-CHANNEL-SET-OPTION-PROC`](#api-cffi-function-tcl-channel-set-option-proc_496BF1B8C2F1E5F617ACE8C5D6BB1FF4)
         1. [CFFI-FUNCTION: `TCL-CHANNEL-THREAD-ACTION-PROC`](#api-cffi-function-tcl-channel-thread-action-proc_0A27F31D13C22AD2081F5B1CAC7BC33A)
         1. [CFFI-FUNCTION: `TCL-CHANNEL-TRUNCATE-PROC`](#api-cffi-function-tcl-channel-truncate-proc_CEC02401A6F63E0D0C3794C21BF154BF)
         1. [CFFI-FUNCTION: `TCL-CHANNEL-VERSION`](#api-cffi-function-tcl-channel-version_D83797839FCD9AA2D8AEE9C50376F24A)
         1. [CFFI-FUNCTION: `TCL-CHANNEL-WATCH-PROC`](#api-cffi-function-tcl-channel-watch-proc_082BE5A9702A2B5039E84A9405CE3C89)
         1. [CFFI-FUNCTION: `TCL-CHANNEL-WIDE-SEEK-PROC`](#api-cffi-function-tcl-channel-wide-seek-proc_BE539FE8967B8147DE04ADFCBF4B310C)
         1. [CFFI-FUNCTION: `TCL-CHAR16-LEN`](#api-cffi-function-tcl-char16-len_5136BEFC63F9D170DBA018C639B9FF5A)
         1. [CFFI-FUNCTION: `TCL-CHAR16-TO-UTF-D-STRING`](#api-cffi-function-tcl-char16-to-utf-d-string_9A0BA290D153DEF04A71B2BC749882CB)
         1. [CFFI-FUNCTION: `TCL-CHDIR`](#api-cffi-function-tcl-chdir_4B819113BD0817A7B72BCDF79586500B)
         1. [CFFI-FUNCTION: `TCL-CLEAR-CHANNEL-HANDLERS`](#api-cffi-function-tcl-clear-channel-handlers_CF27A5FB166BAF4FF6B5458350C49545)
         1. [CFFI-FUNCTION: `TCL-CLOSE-EX`](#api-cffi-function-tcl-close-ex_CB75658A4A12ECBC567FD9BD242DEE52)
         1. [CFFI-FUNCTION: `TCL-COMMAND-COMPLETE`](#api-cffi-function-tcl-command-complete_9F63F21C99888452883A072078A9C8AE)
         1. [CFFI-FUNCTION: `TCL-COMMAND-TRACE-INFO`](#api-cffi-function-tcl-command-trace-info_70DA7F31BDC041B54DC9B96474B90F23)
         1. [CFFI-FUNCTION: `TCL-CONCAT-OBJ`](#api-cffi-function-tcl-concat-obj_E186BD3111AE20820C2BDA23939E06E3)
         1. [CFFI-FUNCTION: `TCL-CONCAT`](#api-cffi-function-tcl-concat_8F4ABFD4C396794361F51D2E1D0D2CA9)
         1. [CFFI-FUNCTION: `TCL-CONDITION-FINALIZE`](#api-cffi-function-tcl-condition-finalize_AE34946C19F94CE7AC1886273304AE65)
         1. [CFFI-FUNCTION: `TCL-CONDITION-NOTIFY`](#api-cffi-function-tcl-condition-notify_D827A702515B0D0B5C5DE492598BE3F7)
         1. [CFFI-FUNCTION: `TCL-CONDITION-WAIT`](#api-cffi-function-tcl-condition-wait_9C850A8824874FF03C010B02278A60C1)
         1. [CFFI-FUNCTION: `TCL-CONSOLE-PANIC`](#api-cffi-function-tcl-console-panic_B6B18065634D228F65356BF36827AE4B)
         1. [CFFI-FUNCTION: `TCL-CONVERT-COUNTER-ELEMENT`](#api-cffi-function-tcl-convert-counter-element_EA9CD07B07B6D092B713E1C4B4E8BFAC)
         1. [CFFI-FUNCTION: `TCL-CONVERT-ELEMENT`](#api-cffi-function-tcl-convert-element_16607AFF79C6B12D121A102591C99F4B)
         1. [CFFI-FUNCTION: `TCL-CONVERT-TO-TYPE`](#api-cffi-function-tcl-convert-to-type_AE492191681221EA7024E96EB8E38177)
         1. [CFFI-FUNCTION: `TCL-CREATE-ALIAS-OBJ`](#api-cffi-function-tcl-create-alias-obj_FA552BE22D7539EA792EDD4E55407AEE)
         1. [CFFI-FUNCTION: `TCL-CREATE-ALIAS`](#api-cffi-function-tcl-create-alias_F06EAC857ADBD9F439F16D838C56B0FC)
         1. [CFFI-FUNCTION: `TCL-CREATE-CHANNEL-HANDLER`](#api-cffi-function-tcl-create-channel-handler_A7BC480F5229AEFABAD3CD8362006356)
         1. [CFFI-FUNCTION: `TCL-CREATE-CHANNEL`](#api-cffi-function-tcl-create-channel_9D21317C099CC287A409ABB47AC1D203)
         1. [CFFI-FUNCTION: `TCL-CREATE-CHILD`](#api-cffi-function-tcl-create-child_D7508430EAAE787D228C273B75C15063)
         1. [CFFI-FUNCTION: `TCL-CREATE-CLOSE-HANDLER`](#api-cffi-function-tcl-create-close-handler_4D2E85821DEACDEB7828EBADD020E6BA)
         1. [CFFI-FUNCTION: `TCL-CREATE-COMMAND`](#api-cffi-function-tcl-create-command_AF0115E1BF956B80DE2E46DA0218F964)
         1. [CFFI-FUNCTION: `TCL-CREATE-ENCODING`](#api-cffi-function-tcl-create-encoding_AC06D294232267F4C68EDFE128F5162C)
         1. [CFFI-FUNCTION: `TCL-CREATE-ENSEMBLE`](#api-cffi-function-tcl-create-ensemble_58E7637A49579EB6892BED6A8FA9266D)
         1. [CFFI-FUNCTION: `TCL-CREATE-EVENT-SOURCE`](#api-cffi-function-tcl-create-event-source_6964157EED3D360CEEC1713FC274CE22)
         1. [CFFI-FUNCTION: `TCL-CREATE-EXIT-HANDLER`](#api-cffi-function-tcl-create-exit-handler_D76DE1EA98BD29A2907D5B0C24E380D4)
         1. [CFFI-FUNCTION: `TCL-CREATE-FILE-HANDLER`](#api-cffi-function-tcl-create-file-handler_EDB669D445003F32CE2C888A9667A174)
         1. [CFFI-FUNCTION: `TCL-CREATE-INTERP*`](#api-cffi-function-tcl-create-interp_5E807FC874ACB5A095F61269DF307FBF)
         1. [CFFI-FUNCTION: `TCL-CREATE-INTERP`](#api-cffi-function-tcl-create-interp_DAE18DEED8F7AAE51AC42EBBE9F13BCD)
         1. [CFFI-FUNCTION: `TCL-CREATE-NAMESPACE`](#api-cffi-function-tcl-create-namespace_B0E6E17EC1E358349B487C8299EEBDED)
         1. [CFFI-FUNCTION: `TCL-CREATE-OBJ-COMMAND2`](#api-cffi-function-tcl-create-obj-command2_68BD9CF1CC20FCFE1239E38624EE2CAB)
         1. [CFFI-FUNCTION: `TCL-CREATE-OBJ-COMMAND`](#api-cffi-function-tcl-create-obj-command_B764DB0C0586348C155A0B6CA048C189)
         1. [CFFI-FUNCTION: `TCL-CREATE-OBJ-TRACE2`](#api-cffi-function-tcl-create-obj-trace2_ACD353CBC08D0E1181E2DAF85DEEC15A)
         1. [CFFI-FUNCTION: `TCL-CREATE-OBJ-TRACE`](#api-cffi-function-tcl-create-obj-trace_43234CF25A476DC576B2EC0670723011)
         1. [CFFI-FUNCTION: `TCL-CREATE-PIPE`](#api-cffi-function-tcl-create-pipe_755BA51EC54768927475180FFA85BA94)
         1. [CFFI-FUNCTION: `TCL-CREATE-THREAD-EXIT-HANDLER`](#api-cffi-function-tcl-create-thread-exit-handler_DB662628A1F22DF6287BAECDEADFBD31)
         1. [CFFI-FUNCTION: `TCL-CREATE-THREAD`](#api-cffi-function-tcl-create-thread_CFEDC560FDCCC7DB79A5263E26C4D46B)
         1. [CFFI-FUNCTION: `TCL-CREATE-TIMER-HANDLER`](#api-cffi-function-tcl-create-timer-handler_071055D17FFDC98E274B88B2EA33CAAC)
         1. [CFFI-FUNCTION: `TCL-CREATE-TRACE`](#api-cffi-function-tcl-create-trace_FB2EA432864FEB2DD67229A0302A65B0)
         1. [CFFI-FUNCTION: `TCL-CUT-CHANNEL`](#api-cffi-function-tcl-cut-channel_7A421E579B874FE4DD0D476EFB488E18)
         1. [CFFI-FUNCTION: `TCL-D-STRING-APPEND-ELEMENT`](#api-cffi-function-tcl-d-string-append-element_D528D3C71386BDEE641A5631C2D32C85)
         1. [CFFI-FUNCTION: `TCL-D-STRING-APPEND`](#api-cffi-function-tcl-d-string-append_666D52C99130577730595F2F0A37C7C4)
         1. [CFFI-FUNCTION: `TCL-D-STRING-END-SUBLIST`](#api-cffi-function-tcl-d-string-end-sublist_34CC2E354279BB323EE718082B8F0300)
         1. [CFFI-FUNCTION: `TCL-D-STRING-FREE`](#api-cffi-function-tcl-d-string-free_917F82CF9C7F8518D0DF88D44A085109)
         1. [CFFI-FUNCTION: `TCL-D-STRING-GET-RESULT`](#api-cffi-function-tcl-d-string-get-result_DFB3C96369118D3042489A54EA2420A2)
         1. [CFFI-FUNCTION: `TCL-D-STRING-INIT`](#api-cffi-function-tcl-d-string-init_570C6E55980D6FD5CE67EB1DFCF5F2EB)
         1. [CFFI-FUNCTION: `TCL-D-STRING-RESULT`](#api-cffi-function-tcl-d-string-result_F000AFAB6680FDF3A664BA600DDBAF7B)
         1. [CFFI-FUNCTION: `TCL-D-STRING-SET-LENGTH`](#api-cffi-function-tcl-d-string-set-length_1DBBEEF5D586E21623E27001E260A9A4)
         1. [CFFI-FUNCTION: `TCL-D-STRING-START-SUBLIST`](#api-cffi-function-tcl-d-string-start-sublist_034953EFBF0CC84BDB1A5D7205DE05E0)
         1. [CFFI-FUNCTION: `TCL-D-STRING-TO-OBJ`](#api-cffi-function-tcl-d-string-to-obj_E86374CDA68422D2087A48E9E99F1C29)
         1. [CFFI-FUNCTION: `TCL-DB-CKALLOC`](#api-cffi-function-tcl-db-ckalloc_0B2D5297F0C773F94AE6C984F8C4E757)
         1. [CFFI-FUNCTION: `TCL-DB-CKFREE`](#api-cffi-function-tcl-db-ckfree_86F6E990D0C77938250C9B78C91D1DB9)
         1. [CFFI-FUNCTION: `TCL-DB-CKREALLOC`](#api-cffi-function-tcl-db-ckrealloc_0AEB81EB60A857314326E82B957CCD3E)
         1. [CFFI-FUNCTION: `TCL-DB-DECR-REF-COUNT`](#api-cffi-function-tcl-db-decr-ref-count_3778E0FE047A1118306DFBA419C8FA5D)
         1. [CFFI-FUNCTION: `TCL-DB-INCR-REF-COUNT`](#api-cffi-function-tcl-db-incr-ref-count_120FB7A6C38781F4628AC4EF7FF3CB8B)
         1. [CFFI-FUNCTION: `TCL-DB-IS-SHARED`](#api-cffi-function-tcl-db-is-shared_3373D7DC77EA2A3718726EC1CD800383)
         1. [CFFI-FUNCTION: `TCL-DB-NEW-BIGNUM-OBJ`](#api-cffi-function-tcl-db-new-bignum-obj_0E01B5D7018F67CE9C229B660E244669)
         1. [CFFI-FUNCTION: `TCL-DB-NEW-BYTE-ARRAY-OBJ`](#api-cffi-function-tcl-db-new-byte-array-obj_D767BCBCDAFC0B472D576253A2C19363)
         1. [CFFI-FUNCTION: `TCL-DB-NEW-DICT-OBJ`](#api-cffi-function-tcl-db-new-dict-obj_F40448DEE5612527CDE978E3AFA8D302)
         1. [CFFI-FUNCTION: `TCL-DB-NEW-DOUBLE-OBJ`](#api-cffi-function-tcl-db-new-double-obj_82FD2DC145BCD88240F03F73631AC3B1)
         1. [CFFI-FUNCTION: `TCL-DB-NEW-LIST-OBJ`](#api-cffi-function-tcl-db-new-list-obj_1281533E14F97938F07E2AA2F829ACE2)
         1. [CFFI-FUNCTION: `TCL-DB-NEW-OBJ`](#api-cffi-function-tcl-db-new-obj_0E8C2ABE75754E27FAB536652E89E81A)
         1. [CFFI-FUNCTION: `TCL-DB-NEW-STRING-OBJ`](#api-cffi-function-tcl-db-new-string-obj_772DCC013C654CE13F8BFF262754E098)
         1. [CFFI-FUNCTION: `TCL-DB-NEW-WIDE-INT-OBJ`](#api-cffi-function-tcl-db-new-wide-int-obj_7349A82DFA0B2E4ACAFFCF0823EDE0B1)
         1. [CFFI-FUNCTION: `TCL-DECR-REF-COUNT`](#api-cffi-function-tcl-decr-ref-count_4BE5DAD3B6C62212DB73C4EF5DBCF1B2)
         1. [CFFI-FUNCTION: `TCL-DELETE-ASSOC-DATA`](#api-cffi-function-tcl-delete-assoc-data_301B00566E7C3A83E2DA779E88A760F0)
         1. [CFFI-FUNCTION: `TCL-DELETE-CHANNEL-HANDLER`](#api-cffi-function-tcl-delete-channel-handler_5E084CFFA84875FFB2CE4AF2C4B64C9B)
         1. [CFFI-FUNCTION: `TCL-DELETE-CLOSE-HANDLER`](#api-cffi-function-tcl-delete-close-handler_9AEAFA61153CA04AD2D7C9D0B81E2D34)
         1. [CFFI-FUNCTION: `TCL-DELETE-COMMAND-FROM-TOKEN`](#api-cffi-function-tcl-delete-command-from-token_C0C0C5DD98D64EAD332055710965A12E)
         1. [CFFI-FUNCTION: `TCL-DELETE-COMMAND`](#api-cffi-function-tcl-delete-command_1A7090A7FA56488DA880497A73F89A37)
         1. [CFFI-FUNCTION: `TCL-DELETE-EVENT-SOURCE`](#api-cffi-function-tcl-delete-event-source_ADA3B8F90251AE5E25A5E660D0352F31)
         1. [CFFI-FUNCTION: `TCL-DELETE-EVENTS`](#api-cffi-function-tcl-delete-events_80873D915F2E749D13E93381A43849C7)
         1. [CFFI-FUNCTION: `TCL-DELETE-EXIT-HANDLER`](#api-cffi-function-tcl-delete-exit-handler_7D4FDF06C163E240EEEB0E5E7DC366AD)
         1. [CFFI-FUNCTION: `TCL-DELETE-FILE-HANDLER`](#api-cffi-function-tcl-delete-file-handler_A3B21763AE0F20B4E23FFD3C0B4F1386)
         1. [CFFI-FUNCTION: `TCL-DELETE-HASH-ENTRY`](#api-cffi-function-tcl-delete-hash-entry_8F39B9949C2E2367262A1A3197D8A565)
         1. [CFFI-FUNCTION: `TCL-DELETE-HASH-TABLE`](#api-cffi-function-tcl-delete-hash-table_825BFBC0EEC306AA826FCF93AE5AC3BB)
         1. [CFFI-FUNCTION: `TCL-DELETE-INTERP*`](#api-cffi-function-tcl-delete-interp_DC3BD5465136E59E23E2A514A140C691)
         1. [CFFI-FUNCTION: `TCL-DELETE-INTERP`](#api-cffi-function-tcl-delete-interp_ED4799017B3F6F63522E5D34DDA1DD95)
         1. [CFFI-FUNCTION: `TCL-DELETE-NAMESPACE`](#api-cffi-function-tcl-delete-namespace_0211BAB327D51802B39E8221877D2A1D)
         1. [CFFI-FUNCTION: `TCL-DELETE-THREAD-EXIT-HANDLER`](#api-cffi-function-tcl-delete-thread-exit-handler_87701328CA18C7A603E1358B7C08E662)
         1. [CFFI-FUNCTION: `TCL-DELETE-TIMER-HANDLER`](#api-cffi-function-tcl-delete-timer-handler_0EAEA0BC06121F6EBD777081BE40FC5B)
         1. [CFFI-FUNCTION: `TCL-DELETE-TRACE`](#api-cffi-function-tcl-delete-trace_602D96319BBE17BA01AA9B862D9F4A16)
         1. [CFFI-FUNCTION: `TCL-DETACH-CHANNEL`](#api-cffi-function-tcl-detach-channel_10B95523FAA3780DF9ABEFD863CD43B0)
         1. [CFFI-FUNCTION: `TCL-DETACH-PIDS`](#api-cffi-function-tcl-detach-pids_ADE4600DA05C6722666E92EC01E52E5E)
         1. [CFFI-FUNCTION: `TCL-DICT-OBJ-DONE`](#api-cffi-function-tcl-dict-obj-done_B6408236F3EEE98FE1D2D15419A8D10E)
         1. [CFFI-FUNCTION: `TCL-DICT-OBJ-FIRST`](#api-cffi-function-tcl-dict-obj-first_C83202B1890AA13772343E58677862FD)
         1. [CFFI-FUNCTION: `TCL-DICT-OBJ-GET`](#api-cffi-function-tcl-dict-obj-get_3E33CEB76A902B6BCC5D517F0645DEE7)
         1. [CFFI-FUNCTION: `TCL-DICT-OBJ-NEXT`](#api-cffi-function-tcl-dict-obj-next_4E8E6FB505A90ED710AEAA37D4FAB9C6)
         1. [CFFI-FUNCTION: `TCL-DICT-OBJ-PUT-KEY-LIST`](#api-cffi-function-tcl-dict-obj-put-key-list_9BCBE5AEB742C64874F8953C6AA11D6D)
         1. [CFFI-FUNCTION: `TCL-DICT-OBJ-PUT`](#api-cffi-function-tcl-dict-obj-put_6FEC36590D4DC26E9CB19CD12AC37282)
         1. [CFFI-FUNCTION: `TCL-DICT-OBJ-REMOVE-KEY-LIST`](#api-cffi-function-tcl-dict-obj-remove-key-list_217F1324F1E2D5937EFC3E5B5007F4FF)
         1. [CFFI-FUNCTION: `TCL-DICT-OBJ-REMOVE`](#api-cffi-function-tcl-dict-obj-remove_D6AE9D9B5E8B89885CEB3AA01D46399B)
         1. [CFFI-FUNCTION: `TCL-DICT-OBJ-SIZE`](#api-cffi-function-tcl-dict-obj-size_3FD0374EF88DE02956DBE1E4A35620AE)
         1. [CFFI-FUNCTION: `TCL-DISCARD-INTERP-STATE`](#api-cffi-function-tcl-discard-interp-state_CCE1B201B192A1589C59DD4F12CD87AB)
         1. [CFFI-FUNCTION: `TCL-DO-ONE-EVENT`](#api-cffi-function-tcl-do-one-event_DE7EC418130B522741DA78A19B881979)
         1. [CFFI-FUNCTION: `TCL-DO-WHEN-IDLE`](#api-cffi-function-tcl-do-when-idle_01B3D04F30BAE385EC95F8B3774A0E23)
         1. [CFFI-FUNCTION: `TCL-DONT-CALL-WHEN-DELETED`](#api-cffi-function-tcl-dont-call-when-deleted_4A3B2E7FCCC07C7D9A67865AA8EC9414)
         1. [CFFI-FUNCTION: `TCL-DUMP-ACTIVE-MEMORY`](#api-cffi-function-tcl-dump-active-memory_DDC8150D63316D4C5A42F38D03D131C9)
         1. [CFFI-FUNCTION: `TCL-DUPLICATE-OBJ`](#api-cffi-function-tcl-duplicate-obj_68ED9FF3D592AB5D867AD04425761350)
         1. [CFFI-FUNCTION: `TCL-EOF`](#api-cffi-function-tcl-eof_844670BB3E8069A8978CF01236936A2A)
         1. [CFFI-FUNCTION: `TCL-ERRNO-ID`](#api-cffi-function-tcl-errno-id_04FD134CF88CF95A8C64B9063323BB0B)
         1. [CFFI-FUNCTION: `TCL-ERRNO-MSG`](#api-cffi-function-tcl-errno-msg_A6A41B4EDB061D0E0FDB4DA1920A7C08)
         1. [CFFI-FUNCTION: `TCL-EVAL-EX*`](#api-cffi-function-tcl-eval-ex_6F2483F35046D22AFF798836B6E4F146)
         1. [CFFI-FUNCTION: `TCL-EVAL-EX`](#api-cffi-function-tcl-eval-ex_F5926BA9EEC40F3F6C12996373F0D459)
         1. [CFFI-FUNCTION: `TCL-EVAL-FILE`](#api-cffi-function-tcl-eval-file_D823A912465CA750F1C937F890E02CC4)
         1. [CFFI-FUNCTION: `TCL-EVAL-OBJ-EX`](#api-cffi-function-tcl-eval-obj-ex_B53BCB9B7B5ABEE1354C59BEEA663FD2)
         1. [CFFI-FUNCTION: `TCL-EVAL-OBJV`](#api-cffi-function-tcl-eval-objv_F0DB0C505D17E2238F38F9BB6EDB9C08)
         1. [CFFI-FUNCTION: `TCL-EVAL-TOKENS-STANDARD`](#api-cffi-function-tcl-eval-tokens-standard_70740C79B60D396D7C12B7EEDC3C1EC7)
         1. [CFFI-FUNCTION: `TCL-EVENTUALLY-FREE`](#api-cffi-function-tcl-eventually-free_F1EE1DE967E723CF73C953C5E3CD4529)
         1. [CFFI-FUNCTION: `TCL-EXIT-THREAD`](#api-cffi-function-tcl-exit-thread_1D069FDB6CDC49374A031AB112A376F0)
         1. [CFFI-FUNCTION: `TCL-EXIT`](#api-cffi-function-tcl-exit_02CE9CABC7B01EC7480E4B8EC6FBEE1E)
         1. [CFFI-FUNCTION: `TCL-EXPORT`](#api-cffi-function-tcl-export_B70418371B4F335CE86A472338579FC1)
         1. [CFFI-FUNCTION: `TCL-EXPOSE-COMMAND`](#api-cffi-function-tcl-expose-command_CB6BD7DDC2CEDB0FE052838837A9C320)
         1. [CFFI-FUNCTION: `TCL-EXPR-BOOLEAN-OBJ`](#api-cffi-function-tcl-expr-boolean-obj_29105CD6FD0EEC63F3D398214AB607A1)
         1. [CFFI-FUNCTION: `TCL-EXPR-BOOLEAN`](#api-cffi-function-tcl-expr-boolean_123C16CFDA161EF93FAA7CC60E6983E0)
         1. [CFFI-FUNCTION: `TCL-EXPR-DOUBLE-OBJ`](#api-cffi-function-tcl-expr-double-obj_765630E75D2858942751CC0DC8555D2E)
         1. [CFFI-FUNCTION: `TCL-EXPR-DOUBLE`](#api-cffi-function-tcl-expr-double_138CD235A136C5E5758D488631C85D12)
         1. [CFFI-FUNCTION: `TCL-EXPR-LONG-OBJ`](#api-cffi-function-tcl-expr-long-obj_E24EF213C92B7414854776AC6BBF6E26)
         1. [CFFI-FUNCTION: `TCL-EXPR-LONG`](#api-cffi-function-tcl-expr-long_003360D54B6F46F1B2D8D7202EB274A1)
         1. [CFFI-FUNCTION: `TCL-EXPR-OBJ`](#api-cffi-function-tcl-expr-obj_EA85A59B80A7D680E0A2D113E34A275E)
         1. [CFFI-FUNCTION: `TCL-EXPR-STRING`](#api-cffi-function-tcl-expr-string_EDDE8E10DEF4AF5DDECE4CE5EC724DDC)
         1. [CFFI-FUNCTION: `TCL-EXTERNAL-TO-UTF-D-STRING-EX`](#api-cffi-function-tcl-external-to-utf-d-string-ex_21B19DE14E362E7CF8ACCA342ABA9DAF)
         1. [CFFI-FUNCTION: `TCL-EXTERNAL-TO-UTF-D-STRING`](#api-cffi-function-tcl-external-to-utf-d-string_2CFBA7D06C8F3E78DB68DB67FEB26054)
         1. [CFFI-FUNCTION: `TCL-EXTERNAL-TO-UTF`](#api-cffi-function-tcl-external-to-utf_637B28297777EA97229733DDD41D9F1F)
         1. [CFFI-FUNCTION: `TCL-FETCH-INTERNAL-REP`](#api-cffi-function-tcl-fetch-internal-rep_AFA8937EFE8F5C3A35619E05AF10E183)
         1. [CFFI-FUNCTION: `TCL-FINALIZE-NOTIFIER`](#api-cffi-function-tcl-finalize-notifier_96BBE37B616B67003AD2D8A618F02F89)
         1. [CFFI-FUNCTION: `TCL-FINALIZE-THREAD`](#api-cffi-function-tcl-finalize-thread_669D856B401275762B5414AC76A61A0D)
         1. [CFFI-FUNCTION: `TCL-FINALIZE`](#api-cffi-function-tcl-finalize_61347D0FA27208EB36B601D9D6636A7D)
         1. [CFFI-FUNCTION: `TCL-FIND-COMMAND`](#api-cffi-function-tcl-find-command_9EED9A84162DF0FA80343AAEDAEEFA8B)
         1. [CFFI-FUNCTION: `TCL-FIND-ENSEMBLE`](#api-cffi-function-tcl-find-ensemble_A259BA5C8FE07258AA3FA0767AEE8D15)
         1. [CFFI-FUNCTION: `TCL-FIND-EXECUTABLE`](#api-cffi-function-tcl-find-executable_C45E2492685D4F7EEEDA150DB8C5DB2B)
         1. [CFFI-FUNCTION: `TCL-FIND-NAMESPACE`](#api-cffi-function-tcl-find-namespace_3F8B13CF38E643F655BBE1B87936B8E3)
         1. [CFFI-FUNCTION: `TCL-FIND-SYMBOL`](#api-cffi-function-tcl-find-symbol_6E5902F8C404A083383BDF4BAC3A50B0)
         1. [CFFI-FUNCTION: `TCL-FIRST-HASH-ENTRY`](#api-cffi-function-tcl-first-hash-entry_04CCB15CF8697FDDFEC0DC1775844F6E)
         1. [CFFI-FUNCTION: `TCL-FLUSH`](#api-cffi-function-tcl-flush_E35474D5F8EABF93AD024357DABBAE4D)
         1. [CFFI-FUNCTION: `TCL-FORGET-IMPORT`](#api-cffi-function-tcl-forget-import_C92F26EF822D2444CCBABCDCC748D302)
         1. [CFFI-FUNCTION: `TCL-FORMAT`](#api-cffi-function-tcl-format_56FC4E4DB6D50D9A9A85B919AFCD54FE)
         1. [CFFI-FUNCTION: `TCL-FREE-ENCODING`](#api-cffi-function-tcl-free-encoding_64C6AC79DB16ABA1DEA964A3FD2E190C)
         1. [CFFI-FUNCTION: `TCL-FREE-INTERNAL-REP`](#api-cffi-function-tcl-free-internal-rep_96398BC4E77B7C8934ECC0DA9B3873CF)
         1. [CFFI-FUNCTION: `TCL-FREE-OBJ`](#api-cffi-function-tcl-free-obj_1B182F2A051528577B0D7F0CB84FE426)
         1. [CFFI-FUNCTION: `TCL-FREE-PARSE`](#api-cffi-function-tcl-free-parse_A0FF591473DDBD880CC5B4D927EFFD1E)
         1. [CFFI-FUNCTION: `TCL-FREE`](#api-cffi-function-tcl-free_7F6CC801276AC2B8F8BF6FC814A0D2FC)
         1. [CFFI-FUNCTION: `TCL-FS-ACCESS`](#api-cffi-function-tcl-fs-access_73DD525058B7CBAB633F32FFC5A0C559)
         1. [CFFI-FUNCTION: `TCL-FS-CHDIR`](#api-cffi-function-tcl-fs-chdir_3FFF8B19ECF569DC98CF11061A2D1375)
         1. [CFFI-FUNCTION: `TCL-FS-CONVERT-TO-PATH-TYPE`](#api-cffi-function-tcl-fs-convert-to-path-type_D6B5665BEED102D24D7DCC8F0516F808)
         1. [CFFI-FUNCTION: `TCL-FS-COPY-DIRECTORY`](#api-cffi-function-tcl-fs-copy-directory_E8F7EADA09D7F40B721974AF2959A364)
         1. [CFFI-FUNCTION: `TCL-FS-COPY-FILE`](#api-cffi-function-tcl-fs-copy-file_1F44DDA480355B67AEAB4CB6143164D1)
         1. [CFFI-FUNCTION: `TCL-FS-DATA`](#api-cffi-function-tcl-fs-data_2098A174197FE9992E7F56B551F64AB2)
         1. [CFFI-FUNCTION: `TCL-FS-DELETE-FILE`](#api-cffi-function-tcl-fs-delete-file_B5759705339CBBFB2355DB4C140E781F)
         1. [CFFI-FUNCTION: `TCL-FS-EQUAL-PATHS`](#api-cffi-function-tcl-fs-equal-paths_6EA593B30BB070E032AAFC532B2C59A5)
         1. [CFFI-FUNCTION: `TCL-FS-EVAL-FILE-EX`](#api-cffi-function-tcl-fs-eval-file-ex_96FFDC4046814C734C844607C9B84366)
         1. [CFFI-FUNCTION: `TCL-FS-EVAL-FILE`](#api-cffi-function-tcl-fs-eval-file_BDF0EE20A2C83E02908FA4652CDA73C9)
         1. [CFFI-FUNCTION: `TCL-FS-FILE-ATTR-STRINGS`](#api-cffi-function-tcl-fs-file-attr-strings_D16CEDAB099D5C038DA6AAA9ACB2A68D)
         1. [CFFI-FUNCTION: `TCL-FS-FILE-ATTRS-GET`](#api-cffi-function-tcl-fs-file-attrs-get_4FE770EF3E9E19711B56C6FAA7154234)
         1. [CFFI-FUNCTION: `TCL-FS-FILE-ATTRS-SET`](#api-cffi-function-tcl-fs-file-attrs-set_23903E1835DE3EDB4AB80CD8D33C6BE2)
         1. [CFFI-FUNCTION: `TCL-FS-FILE-SYSTEM-INFO`](#api-cffi-function-tcl-fs-file-system-info_4DDAD3AD3D0050AC0314DD4011D9C4E3)
         1. [CFFI-FUNCTION: `TCL-FS-GET-CWD`](#api-cffi-function-tcl-fs-get-cwd_D6586B7C9DD2E74A5BDA9F6E37A8C41E)
         1. [CFFI-FUNCTION: `TCL-FS-GET-FILE-SYSTEM-FOR-PATH`](#api-cffi-function-tcl-fs-get-file-system-for-path_9F54BC2DD462674B321F13645EA3540A)
         1. [CFFI-FUNCTION: `TCL-FS-GET-INTERNAL-REP`](#api-cffi-function-tcl-fs-get-internal-rep_40F38A430AE9F5D8806EC9D216AD37EA)
         1. [CFFI-FUNCTION: `TCL-FS-GET-NATIVE-PATH`](#api-cffi-function-tcl-fs-get-native-path_78899E0413041C0BA5AED17F5B6BDD71)
         1. [CFFI-FUNCTION: `TCL-FS-GET-NORMALIZED-PATH`](#api-cffi-function-tcl-fs-get-normalized-path_BFDA6E0C4A9E5EE4053A07188858A3CE)
         1. [CFFI-FUNCTION: `TCL-FS-GET-PATH-TYPE`](#api-cffi-function-tcl-fs-get-path-type_ADAA938857D7ECC35C604E8BACA4F3A6)
         1. [CFFI-FUNCTION: `TCL-FS-GET-TRANSLATED-PATH`](#api-cffi-function-tcl-fs-get-translated-path_F1E6192E19C8BB79D0EC7B02AE2728ED)
         1. [CFFI-FUNCTION: `TCL-FS-GET-TRANSLATED-STRING-PATH`](#api-cffi-function-tcl-fs-get-translated-string-path_A0C0A834AAF836CEE42ED96B4BEDCD18)
         1. [CFFI-FUNCTION: `TCL-FS-JOIN-PATH`](#api-cffi-function-tcl-fs-join-path_610681866F3F2CFA91FFB2A8AEE8B21F)
         1. [CFFI-FUNCTION: `TCL-FS-JOIN-TO-PATH`](#api-cffi-function-tcl-fs-join-to-path_503FA44963EE83917610792E24511F73)
         1. [CFFI-FUNCTION: `TCL-FS-LINK`](#api-cffi-function-tcl-fs-link_121A524F536B6D964256394C10E86CEF)
         1. [CFFI-FUNCTION: `TCL-FS-LIST-VOLUMES`](#api-cffi-function-tcl-fs-list-volumes_1D560F86F6179A28386CD90BA92FE8FF)
         1. [CFFI-FUNCTION: `TCL-FS-LOAD-FILE`](#api-cffi-function-tcl-fs-load-file_F221D8FFEF07D244B6B85C3FC3361DEB)
         1. [CFFI-FUNCTION: `TCL-FS-LSTAT`](#api-cffi-function-tcl-fs-lstat_9C548B6EA1BAFFE4B6CEC9B5F283C96D)
         1. [CFFI-FUNCTION: `TCL-FS-MATCH-IN-DIRECTORY`](#api-cffi-function-tcl-fs-match-in-directory_75DEBEC1CD534689FB982FCBDECA4D1C)
         1. [CFFI-FUNCTION: `TCL-FS-MOUNTS-CHANGED`](#api-cffi-function-tcl-fs-mounts-changed_A55CA9ACFCAD211E084307715451A37F)
         1. [CFFI-FUNCTION: `TCL-FS-NEW-NATIVE-PATH`](#api-cffi-function-tcl-fs-new-native-path_7DCCC4B1A43A9F9CD8766E7B1EC2C364)
         1. [CFFI-FUNCTION: `TCL-FS-OPEN-FILE-CHANNEL`](#api-cffi-function-tcl-fs-open-file-channel_5B6EA6AF0D16C93A008F01FB81F08728)
         1. [CFFI-FUNCTION: `TCL-FS-PATH-SEPARATOR`](#api-cffi-function-tcl-fs-path-separator_B709FDC1F628F0ADABFA3D6A27F68AB9)
         1. [CFFI-FUNCTION: `TCL-FS-REGISTER`](#api-cffi-function-tcl-fs-register_1E442DD872B95E3EEDAD67ABDED469F9)
         1. [CFFI-FUNCTION: `TCL-FS-REMOVE-DIRECTORY`](#api-cffi-function-tcl-fs-remove-directory_F5F89587EF1BB7D77720F9EB9A8CD43A)
         1. [CFFI-FUNCTION: `TCL-FS-RENAME-FILE`](#api-cffi-function-tcl-fs-rename-file_8705B6F81AF4ED0D7EACB319D491E6D5)
         1. [CFFI-FUNCTION: `TCL-FS-SPLIT-PATH`](#api-cffi-function-tcl-fs-split-path_6F05782FEDC5503EE7D2C133AAF35F22)
         1. [CFFI-FUNCTION: `TCL-FS-STAT`](#api-cffi-function-tcl-fs-stat_0DF0A2FD67334C09EC317952391D683E)
         1. [CFFI-FUNCTION: `TCL-FS-TILDE-EXPAND`](#api-cffi-function-tcl-fs-tilde-expand_40C4D6F724E7343E1F94601C18A2D961)
         1. [CFFI-FUNCTION: `TCL-FS-UNLOAD-FILE`](#api-cffi-function-tcl-fs-unload-file_9D0BFA602D87BE954526A0BA6CC45EC8)
         1. [CFFI-FUNCTION: `TCL-FS-UNREGISTER`](#api-cffi-function-tcl-fs-unregister_621F252C8D658A93B7827AE3D7F4718E)
         1. [CFFI-FUNCTION: `TCL-FS-UTIME`](#api-cffi-function-tcl-fs-utime_B22F328DFC5E6435911134069ECFD02D)
         1. [CFFI-FUNCTION: `TCL-GET-ACCESS-TIME-FROM-STAT`](#api-cffi-function-tcl-get-access-time-from-stat_AB314096512B493F368AFD29F521B20F)
         1. [CFFI-FUNCTION: `TCL-GET-ALIAS-OBJ`](#api-cffi-function-tcl-get-alias-obj_7B476688A573C28B95177770ED5D82F0)
         1. [CFFI-FUNCTION: `TCL-GET-ALLOC-MUTEX`](#api-cffi-function-tcl-get-alloc-mutex_1705F64EA0890A1E95B9405D74162A22)
         1. [CFFI-FUNCTION: `TCL-GET-ASSOC-DATA`](#api-cffi-function-tcl-get-assoc-data_2B974B36C96FEE87B2E6A594B256C031)
         1. [CFFI-FUNCTION: `TCL-GET-BIGNUM-FROM-OBJ`](#api-cffi-function-tcl-get-bignum-from-obj_1108E95E5A15281440B8BB6162AA8DDA)
         1. [CFFI-FUNCTION: `TCL-GET-BLOCK-SIZE-FROM-STAT`](#api-cffi-function-tcl-get-block-size-from-stat_92E8C544716351D150618263D99F5CBB)
         1. [CFFI-FUNCTION: `TCL-GET-BLOCKS-FROM-STAT`](#api-cffi-function-tcl-get-blocks-from-stat_D2603C2F68E05938073175BF8DB41689)
         1. [CFFI-FUNCTION: `TCL-GET-BOOL-FROM-OBJ`](#api-cffi-function-tcl-get-bool-from-obj_0F19BA76F2B8805F3D7C24C97C5FC26D)
         1. [CFFI-FUNCTION: `TCL-GET-BOOL`](#api-cffi-function-tcl-get-bool_0F4CC8020C3A616A288A39B305A5E540)
         1. [CFFI-FUNCTION: `TCL-GET-BOOLEAN-FROM-OBJ`](#api-cffi-function-tcl-get-boolean-from-obj_0A3361D3E514DB8E9D2257CCDA0ABBE6)
         1. [CFFI-FUNCTION: `TCL-GET-BOOLEAN`](#api-cffi-function-tcl-get-boolean_890570D03363058901799E0B1DEF8657)
         1. [CFFI-FUNCTION: `TCL-GET-BYTES-FROM-OBJ`](#api-cffi-function-tcl-get-bytes-from-obj_810083B44F603177CEF020F86A590B55)
         1. [CFFI-FUNCTION: `TCL-GET-CHANGE-TIME-FROM-STAT`](#api-cffi-function-tcl-get-change-time-from-stat_5C86E9B30A6B5805E7D11267B5396F77)
         1. [CFFI-FUNCTION: `TCL-GET-CHANNEL-BUFFER-SIZE`](#api-cffi-function-tcl-get-channel-buffer-size_3C0F3291F226DCCE9C6985FDBE47DC17)
         1. [CFFI-FUNCTION: `TCL-GET-CHANNEL-ERROR-INTERP`](#api-cffi-function-tcl-get-channel-error-interp_DBA15BA281A0A2662804ECFF3385B92B)
         1. [CFFI-FUNCTION: `TCL-GET-CHANNEL-ERROR`](#api-cffi-function-tcl-get-channel-error_282337426343153144716CC8AEE13C41)
         1. [CFFI-FUNCTION: `TCL-GET-CHANNEL-HANDLE`](#api-cffi-function-tcl-get-channel-handle_147457CAF744DBCE92F458D6B0ECB5B0)
         1. [CFFI-FUNCTION: `TCL-GET-CHANNEL-INSTANCE-DATA`](#api-cffi-function-tcl-get-channel-instance-data_99707D247410930174F608FD6BA01F55)
         1. [CFFI-FUNCTION: `TCL-GET-CHANNEL-MODE`](#api-cffi-function-tcl-get-channel-mode_13CC8D04BBC65C99B1ACEBEC3351702D)
         1. [CFFI-FUNCTION: `TCL-GET-CHANNEL-NAME`](#api-cffi-function-tcl-get-channel-name_81E0EC28BE5FB706D76DD9A05631908F)
         1. [CFFI-FUNCTION: `TCL-GET-CHANNEL-NAMES-EX`](#api-cffi-function-tcl-get-channel-names-ex_5C20FFC40EADAB716A96B0BD3DDAE0CE)
         1. [CFFI-FUNCTION: `TCL-GET-CHANNEL-NAMES`](#api-cffi-function-tcl-get-channel-names_A295574DE5A584CA6BBC3ABBDD101EF8)
         1. [CFFI-FUNCTION: `TCL-GET-CHANNEL-OPTION`](#api-cffi-function-tcl-get-channel-option_F175F8E6E7E3CF65189D986AADA2A785)
         1. [CFFI-FUNCTION: `TCL-GET-CHANNEL-THREAD`](#api-cffi-function-tcl-get-channel-thread_86BDA93E676799661322777851F644BB)
         1. [CFFI-FUNCTION: `TCL-GET-CHANNEL-TYPE`](#api-cffi-function-tcl-get-channel-type_88939B9AFA764B8DB55D19ABB160C0C4)
         1. [CFFI-FUNCTION: `TCL-GET-CHANNEL`](#api-cffi-function-tcl-get-channel_76F0EA16733D54BC095C87B40AED78E2)
         1. [CFFI-FUNCTION: `TCL-GET-CHAR-LENGTH`](#api-cffi-function-tcl-get-char-length_F386B4DBEDE55F64261B7D32B393F4E1)
         1. [CFFI-FUNCTION: `TCL-GET-CHILD`](#api-cffi-function-tcl-get-child_B26C65B9E71F6585FE637A04A4D88832)
         1. [CFFI-FUNCTION: `TCL-GET-COMMAND-FROM-OBJ`](#api-cffi-function-tcl-get-command-from-obj_6BCFDFD986CBCF2F5DA581B65E13F64D)
         1. [CFFI-FUNCTION: `TCL-GET-COMMAND-FULL-NAME`](#api-cffi-function-tcl-get-command-full-name_F2757C08020A09C184251BCEF189D001)
         1. [CFFI-FUNCTION: `TCL-GET-COMMAND-INFO-FROM-TOKEN`](#api-cffi-function-tcl-get-command-info-from-token_8EE0B5C2B249F0808FB911C33BA9620C)
         1. [CFFI-FUNCTION: `TCL-GET-COMMAND-INFO`](#api-cffi-function-tcl-get-command-info_4DD1A29D0F2AF06A2F547167F4E3E921)
         1. [CFFI-FUNCTION: `TCL-GET-COMMAND-NAME`](#api-cffi-function-tcl-get-command-name_45C2AB7F26521BA8EA04ACFBEE725FFF)
         1. [CFFI-FUNCTION: `TCL-GET-CURRENT-NAMESPACE`](#api-cffi-function-tcl-get-current-namespace_375E77D30C05C2556308C7CA17F77802)
         1. [CFFI-FUNCTION: `TCL-GET-CURRENT-THREAD`](#api-cffi-function-tcl-get-current-thread_68EC9636A5059A57956EEF597E0991CC)
         1. [CFFI-FUNCTION: `TCL-GET-CWD`](#api-cffi-function-tcl-get-cwd_BA68928912A30C413C8EC942C98DEC1A)
         1. [CFFI-FUNCTION: `TCL-GET-DEVICE-TYPE-FROM-STAT`](#api-cffi-function-tcl-get-device-type-from-stat_DCC1A58178D3A3FA6AF1302F8FA7771D)
         1. [CFFI-FUNCTION: `TCL-GET-DOUBLE-FROM-OBJ`](#api-cffi-function-tcl-get-double-from-obj_75B1DDC2B6F2F330C9962FF9612153FA)
         1. [CFFI-FUNCTION: `TCL-GET-DOUBLE`](#api-cffi-function-tcl-get-double_DB194FDB108FF9C9B2A858BDCE60ABFA)
         1. [CFFI-FUNCTION: `TCL-GET-ENCODING-FROM-OBJ`](#api-cffi-function-tcl-get-encoding-from-obj_CFC34CF4A6A6426C93A1C5824547B0DB)
         1. [CFFI-FUNCTION: `TCL-GET-ENCODING-NAME-FROM-ENVIRONMENT`](#api-cffi-function-tcl-get-encoding-name-from-environment_1D5536829E6701B6F18FFE03E3C1C160)
         1. [CFFI-FUNCTION: `TCL-GET-ENCODING-NAME`](#api-cffi-function-tcl-get-encoding-name_6C1BABFA84AFF6B438D1DC2027370061)
         1. [CFFI-FUNCTION: `TCL-GET-ENCODING-NAMES`](#api-cffi-function-tcl-get-encoding-names_704B7FFA7439C3E53B647AAF26B96779)
         1. [CFFI-FUNCTION: `TCL-GET-ENCODING-NUL-LENGTH`](#api-cffi-function-tcl-get-encoding-nul-length_B3E4C8D9BD678267DD77AA0D89A0E0E6)
         1. [CFFI-FUNCTION: `TCL-GET-ENCODING-SEARCH-PATH`](#api-cffi-function-tcl-get-encoding-search-path_5A9FED4C0C4A94EF3B8572CD77211CF0)
         1. [CFFI-FUNCTION: `TCL-GET-ENCODING`](#api-cffi-function-tcl-get-encoding_C139D110031FA2B786925C51ACDED835)
         1. [CFFI-FUNCTION: `TCL-GET-ENSEMBLE-FLAGS`](#api-cffi-function-tcl-get-ensemble-flags_DB8DDD9758B642C64BDE11C17BF17ABA)
         1. [CFFI-FUNCTION: `TCL-GET-ENSEMBLE-MAPPING-DICT`](#api-cffi-function-tcl-get-ensemble-mapping-dict_968748298C59B6A508282624D2AA5F42)
         1. [CFFI-FUNCTION: `TCL-GET-ENSEMBLE-NAMESPACE`](#api-cffi-function-tcl-get-ensemble-namespace_B5CDED58454A9504F56AE14DFCD5E87B)
         1. [CFFI-FUNCTION: `TCL-GET-ENSEMBLE-PARAMETER-LIST`](#api-cffi-function-tcl-get-ensemble-parameter-list_AD3A01C2C740B6EB89CE10BF66621D2A)
         1. [CFFI-FUNCTION: `TCL-GET-ENSEMBLE-SUBCOMMAND-LIST`](#api-cffi-function-tcl-get-ensemble-subcommand-list_A3DC3E0DACC13D62F1C5393F3D3F241F)
         1. [CFFI-FUNCTION: `TCL-GET-ENSEMBLE-UNKNOWN-HANDLER`](#api-cffi-function-tcl-get-ensemble-unknown-handler_234A5E5F11F1CEFEA3438B0593CD3371)
         1. [CFFI-FUNCTION: `TCL-GET-ERRNO`](#api-cffi-function-tcl-get-errno_0DD00A60AF57DDE9642511FAC2277E12)
         1. [CFFI-FUNCTION: `TCL-GET-ERROR-LINE`](#api-cffi-function-tcl-get-error-line_B80F09C6187B417F3782723B68A7F8EE)
         1. [CFFI-FUNCTION: `TCL-GET-FS-DEVICE-FROM-STAT`](#api-cffi-function-tcl-get-fs-device-from-stat_1F340725D2A392AAFBE51432FE3A2D08)
         1. [CFFI-FUNCTION: `TCL-GET-FS-INODE-FROM-STAT`](#api-cffi-function-tcl-get-fs-inode-from-stat_AF70457DC953F7D6F723BBAAEBF6AA14)
         1. [CFFI-FUNCTION: `TCL-GET-GLOBAL-NAMESPACE`](#api-cffi-function-tcl-get-global-namespace_64CFDF794C2EAE15A8BEC9DCABCBAA2E)
         1. [CFFI-FUNCTION: `TCL-GET-GROUP-ID-FROM-STAT`](#api-cffi-function-tcl-get-group-id-from-stat_5FB423203A86FB3F95E9EA1BD6248B4A)
         1. [CFFI-FUNCTION: `TCL-GET-HOST-NAME`](#api-cffi-function-tcl-get-host-name_546C719C2B932D5982B1DCA0752588D5)
         1. [CFFI-FUNCTION: `TCL-GET-INDEX-FROM-OBJ-STRUCT`](#api-cffi-function-tcl-get-index-from-obj-struct_AB3BAB69CB6B175E74397C53B1A7CB68)
         1. [CFFI-FUNCTION: `TCL-GET-INT-FOR-INDEX`](#api-cffi-function-tcl-get-int-for-index_A7F40791F36316CC862F06D3454529E2)
         1. [CFFI-FUNCTION: `TCL-GET-INT-FROM-OBJ`](#api-cffi-function-tcl-get-int-from-obj_2CBB3A3B9AC875B5B6FDBF0AF9BA1B27)
         1. [CFFI-FUNCTION: `TCL-GET-INT`](#api-cffi-function-tcl-get-int_6848C77177A3CD3AFEBAC9557D9DD94C)
         1. [CFFI-FUNCTION: `TCL-GET-INTERP-PATH`](#api-cffi-function-tcl-get-interp-path_E77408A1318BE0BA7135D7902EF72C15)
         1. [CFFI-FUNCTION: `TCL-GET-LINK-COUNT-FROM-STAT`](#api-cffi-function-tcl-get-link-count-from-stat_575AECBC76786FAE89067715839E2795)
         1. [CFFI-FUNCTION: `TCL-GET-LONG-FROM-OBJ`](#api-cffi-function-tcl-get-long-from-obj_28CC1E92A3BFEAE7A92E1B97705D64F8)
         1. [CFFI-FUNCTION: `TCL-GET-MEMORY-INFO`](#api-cffi-function-tcl-get-memory-info_4F4B7C984AB2231E2AEFDD66B6C6270F)
         1. [CFFI-FUNCTION: `TCL-GET-MODE-FROM-STAT`](#api-cffi-function-tcl-get-mode-from-stat_757EC80F27A708436E7232DF5659159E)
         1. [CFFI-FUNCTION: `TCL-GET-MODIFICATION-TIME-FROM-STAT`](#api-cffi-function-tcl-get-modification-time-from-stat_B60711FBD21AB76C1593D9FE6A902295)
         1. [CFFI-FUNCTION: `TCL-GET-NAME-OF-EXECUTALBLE`](#api-cffi-function-tcl-get-name-of-executalble_00050363976CF1C1F3DE9FDB7A2AB391)
         1. [CFFI-FUNCTION: `TCL-GET-NAMESPACE-UNKNOWN-HANDLER`](#api-cffi-function-tcl-get-namespace-unknown-handler_245803192FA076E62F41B55E3A882148)
         1. [CFFI-FUNCTION: `TCL-GET-NUMBER-FROM-OBJ`](#api-cffi-function-tcl-get-number-from-obj_AB2460F7B7858AC8B40388CBA730D07E)
         1. [CFFI-FUNCTION: `TCL-GET-NUMBER`](#api-cffi-function-tcl-get-number_3C91D532A0A9A89F8576D09AC17C1F38)
         1. [CFFI-FUNCTION: `TCL-GET-OBJ-RESULT*`](#api-cffi-function-tcl-get-obj-result_E186A2EB4E97DB89FA547981E004455F)
         1. [CFFI-FUNCTION: `TCL-GET-OBJ-RESULT`](#api-cffi-function-tcl-get-obj-result_939657BCAD9EDAFB462EDF3E84EA8B1D)
         1. [CFFI-FUNCTION: `TCL-GET-OBJ-TYPE`](#api-cffi-function-tcl-get-obj-type_42DB90673AFAC49D525731FDC99D3D6C)
         1. [CFFI-FUNCTION: `TCL-GET-OPEN-FILE`](#api-cffi-function-tcl-get-open-file_E3110A6A0F5F538DA9339ED39038FB78)
         1. [CFFI-FUNCTION: `TCL-GET-PARENT`](#api-cffi-function-tcl-get-parent_869F901B6B56C37A5FC334DEF6BC8C05)
         1. [CFFI-FUNCTION: `TCL-GET-PATH-TYPE`](#api-cffi-function-tcl-get-path-type_7F0E6CAEB5955346803CE9DA5BFCFD32)
         1. [CFFI-FUNCTION: `TCL-GET-RANGE`](#api-cffi-function-tcl-get-range_211B6D2D7C968FF1EB932451B419E4E4)
         1. [CFFI-FUNCTION: `TCL-GET-REG-EXP-FROM-OBJ`](#api-cffi-function-tcl-get-reg-exp-from-obj_653E5B291FA072AB27C5813171066E59)
         1. [CFFI-FUNCTION: `TCL-GET-RETURN-OPTIONS`](#api-cffi-function-tcl-get-return-options_CC83AF6F6113FFD9DE5E6BA1992C59D7)
         1. [CFFI-FUNCTION: `TCL-GET-SERVICE-MODE`](#api-cffi-function-tcl-get-service-mode_02B608CC4B5B54266A5A59093BB22662)
         1. [CFFI-FUNCTION: `TCL-GET-SIZE-FROM-STAT`](#api-cffi-function-tcl-get-size-from-stat_9CFE0EC7737F831B83B3BCB228FF4225)
         1. [CFFI-FUNCTION: `TCL-GET-SIZE-INT-FROM-OBJ`](#api-cffi-function-tcl-get-size-int-from-obj_C8049C3B9DDE3DF741293CB7807EDC18)
         1. [CFFI-FUNCTION: `TCL-GET-STACKED-CHANNEL`](#api-cffi-function-tcl-get-stacked-channel_6C5B31264E7CB7B2C1347245D77F6D2A)
         1. [CFFI-FUNCTION: `TCL-GET-STARTUP-SCRIPT`](#api-cffi-function-tcl-get-startup-script_6EAEACE3724BDA12F9BE4AED42AA6FDA)
         1. [CFFI-FUNCTION: `TCL-GET-STD-CHANNEL`](#api-cffi-function-tcl-get-std-channel_C58DF4ABE29C5C509B341146FF847D01)
         1. [CFFI-FUNCTION: `TCL-GET-STRING*`](#api-cffi-function-tcl-get-string_52C31253C446EFE2E9895875732A9311)
         1. [CFFI-FUNCTION: `TCL-GET-STRING-FROM-OBJ/CHAR*`](#api-cffi-function-tcl-get-string-from-objchar_3281F865F0494001A3C940F9B6E78D52)
         1. [CFFI-FUNCTION: `TCL-GET-STRING-FROM-OBJ`](#api-cffi-function-tcl-get-string-from-obj_20D009FB21D6106FCC23847B876207A4)
         1. [CFFI-FUNCTION: `TCL-GET-STRING`](#api-cffi-function-tcl-get-string_45FF8E1D79B7646065D51EE26AA8E382)
         1. [CFFI-FUNCTION: `TCL-GET-THREAD-DATA`](#api-cffi-function-tcl-get-thread-data_B4FD386483FB5A4C095AD885ADCB092F)
         1. [CFFI-FUNCTION: `TCL-GET-TIME`](#api-cffi-function-tcl-get-time_F8F37879BE5C0CFCFE00FC5485814504)
         1. [CFFI-FUNCTION: `TCL-GET-TOP-CHANNEL`](#api-cffi-function-tcl-get-top-channel_06428ACD40DB885D4480FA55B43E7A18)
         1. [CFFI-FUNCTION: `TCL-GET-UNI-CHAR`](#api-cffi-function-tcl-get-uni-char_C5EC582EFAC1F9283BD289E84D4C4A12)
         1. [CFFI-FUNCTION: `TCL-GET-UNICODE-FROM-OBJ`](#api-cffi-function-tcl-get-unicode-from-obj_A2E170838F6140F08681C7F1AB8CE26E)
         1. [CFFI-FUNCTION: `TCL-GET-USER-ID-FROM-STAT`](#api-cffi-function-tcl-get-user-id-from-stat_88EA6ADB091CEA0F3793ED1C4E6287EF)
         1. [CFFI-FUNCTION: `TCL-GET-VAR2*`](#api-cffi-function-tcl-get-var2_EB03F90F33F9F3EAE4400615394CC8F0)
         1. [CFFI-FUNCTION: `TCL-GET-VAR2-EX`](#api-cffi-function-tcl-get-var2-ex_A057343EAB534D88A853CDA3D62E1B65)
         1. [CFFI-FUNCTION: `TCL-GET-VAR2`](#api-cffi-function-tcl-get-var2_68BA123F47B09B2E8671B43CAB273274)
         1. [CFFI-FUNCTION: `TCL-GET-VERSION`](#api-cffi-function-tcl-get-version_7FF5C5F73C60B5339BE6051E2BC0D1AF)
         1. [CFFI-FUNCTION: `TCL-GET-WIDE-INT-FROM-OBJ`](#api-cffi-function-tcl-get-wide-int-from-obj_D76F63D4CE7C652B92CDC8B9D010B403)
         1. [CFFI-FUNCTION: `TCL-GET-WIDE-U-INT-FROM-OBJ`](#api-cffi-function-tcl-get-wide-u-int-from-obj_A4503E218E27CE9236D1D20677CF8490)
         1. [CFFI-FUNCTION: `TCL-GETS-OBJ`](#api-cffi-function-tcl-gets-obj_517BF2AEA0F62FFD2FB0A8F795030886)
         1. [CFFI-FUNCTION: `TCL-GETS`](#api-cffi-function-tcl-gets_9B104BC99DD3BA7E3EB31C5F3B272057)
         1. [CFFI-FUNCTION: `TCL-HAS-STRING-REP`](#api-cffi-function-tcl-has-string-rep_D190C6DBC0CBB4C571926496BB4B22E6)
         1. [CFFI-FUNCTION: `TCL-HASH-STATS`](#api-cffi-function-tcl-hash-stats_852A9EB619201CAB09EDD5B664E88831)
         1. [CFFI-FUNCTION: `TCL-HIDE-COMMAND`](#api-cffi-function-tcl-hide-command_9AEB0F525C81C239CAF9D3D8CF2E2604)
         1. [CFFI-FUNCTION: `TCL-IMPORT`](#api-cffi-function-tcl-import_5C88E979C880D43E82D532B2443631D3)
         1. [CFFI-FUNCTION: `TCL-INCR-REF-COUNT`](#api-cffi-function-tcl-incr-ref-count_282463370BFF4481C6530B83FE4B1EBA)
         1. [CFFI-FUNCTION: `TCL-INIT*`](#api-cffi-function-tcl-init_A7E209984D65BC77BD8F07D2241CD787)
         1. [CFFI-FUNCTION: `TCL-INIT-BIGNUM-FROM-DOUBLE`](#api-cffi-function-tcl-init-bignum-from-double_FFF4DDB09D7909F536D284DE8ECB8D92)
         1. [CFFI-FUNCTION: `TCL-INIT-CUSTOM-HASH-TABLE`](#api-cffi-function-tcl-init-custom-hash-table_9BE2A17A1E139AFBEB06FE8E120D5E2E)
         1. [CFFI-FUNCTION: `TCL-INIT-HASH-TABLE`](#api-cffi-function-tcl-init-hash-table_389B76A8B778E6D17F086E36DD26F89B)
         1. [CFFI-FUNCTION: `TCL-INIT-MEMORY`](#api-cffi-function-tcl-init-memory_5F42EEF1E692C7ED25BC3531046FAC5F)
         1. [CFFI-FUNCTION: `TCL-INIT-NOTIFIER`](#api-cffi-function-tcl-init-notifier_203BABBF241523201A7769CC22AD4DEF)
         1. [CFFI-FUNCTION: `TCL-INIT-OBJ-HASH-TABLE`](#api-cffi-function-tcl-init-obj-hash-table_6DCD9D78FA2F3477E8EA296803D2AD17)
         1. [CFFI-FUNCTION: `TCL-INIT-STRING-REP`](#api-cffi-function-tcl-init-string-rep_FA9AC19F1B22CDA147ECF39F63867EB8)
         1. [CFFI-FUNCTION: `TCL-INIT-STUB-TABLE`](#api-cffi-function-tcl-init-stub-table_932BFBD14433E4D67DF5B208D2E72E15)
         1. [CFFI-FUNCTION: `TCL-INIT-STUBS`](#api-cffi-function-tcl-init-stubs_8AFD999AC49B0312D58D7B2DD1324096)
         1. [CFFI-FUNCTION: `TCL-INIT-SUBSYSTEMS`](#api-cffi-function-tcl-init-subsystems_F0A5B153BDDBAAA0CF4753EE8ACC203E)
         1. [CFFI-FUNCTION: `TCL-INIT`](#api-cffi-function-tcl-init_A1B38E7B50F3A541B2CD4622BF8831E1)
         1. [CFFI-FUNCTION: `TCL-INPUT-BLOCKED`](#api-cffi-function-tcl-input-blocked_ABEAEF504607AFB2446A20C04D79B2B4)
         1. [CFFI-FUNCTION: `TCL-INPUT-BUFFERED`](#api-cffi-function-tcl-input-buffered_BE5700EBC7D6093899867CADCE047C11)
         1. [CFFI-FUNCTION: `TCL-INTERP-ACTIVE`](#api-cffi-function-tcl-interp-active_999343CF11BE291804D19E920D8CAC62)
         1. [CFFI-FUNCTION: `TCL-INTERP-DELETED`](#api-cffi-function-tcl-interp-deleted_F354830B390941DF0B1281969D086E96)
         1. [CFFI-FUNCTION: `TCL-INVALIDATE-STRING-REP`](#api-cffi-function-tcl-invalidate-string-rep_6B8AF9AF6E342AD78704D5DFF60338FC)
         1. [CFFI-FUNCTION: `TCL-IS-CHANNEL-EXISTING`](#api-cffi-function-tcl-is-channel-existing_444236416227FE0736F6D0ACF3DEDA40)
         1. [CFFI-FUNCTION: `TCL-IS-CHANNEL-REGISTERED`](#api-cffi-function-tcl-is-channel-registered_B3A9429452254D0FDD1FC96FD854E304)
         1. [CFFI-FUNCTION: `TCL-IS-CHANNEL-SHARED`](#api-cffi-function-tcl-is-channel-shared_C111CA67EA103B0FCAB09DADB2BC3037)
         1. [CFFI-FUNCTION: `TCL-IS-ENSEMBLE`](#api-cffi-function-tcl-is-ensemble_2A10C2EF161EC6D5840763494B9F6C23)
         1. [CFFI-FUNCTION: `TCL-IS-SAFE`](#api-cffi-function-tcl-is-safe_AD01DE56B5C6A07625B82538465FE451)
         1. [CFFI-FUNCTION: `TCL-IS-SHARED`](#api-cffi-function-tcl-is-shared_0BD95309329C9E4C2E61F614E8B6C1DA)
         1. [CFFI-FUNCTION: `TCL-IS-STANDARD-CHANNEL`](#api-cffi-function-tcl-is-standard-channel_440C7BCE364CDA42C14EF12639B8A6B2)
         1. [CFFI-FUNCTION: `TCL-JOIN-PATH`](#api-cffi-function-tcl-join-path_86602C61EC0A4FC519AC000AA04893F3)
         1. [CFFI-FUNCTION: `TCL-JOIN-THREAD`](#api-cffi-function-tcl-join-thread_A6D1861CD82E441B526F774304C5900B)
         1. [CFFI-FUNCTION: `TCL-LIMIT-ADD-HANDLER`](#api-cffi-function-tcl-limit-add-handler_1BF746CD96A8B87C48BE670EF1D33DE7)
         1. [CFFI-FUNCTION: `TCL-LIMIT-CHECK`](#api-cffi-function-tcl-limit-check_7216994BA379925B93034F2CA5CDE012)
         1. [CFFI-FUNCTION: `TCL-LIMIT-EXCEEDED`](#api-cffi-function-tcl-limit-exceeded_4FC830F9969FF7784C51C42EE0573981)
         1. [CFFI-FUNCTION: `TCL-LIMIT-GET-COMMANDS`](#api-cffi-function-tcl-limit-get-commands_35852662B20A296310806A06DE46EC5B)
         1. [CFFI-FUNCTION: `TCL-LIMIT-GET-GRANULARITY`](#api-cffi-function-tcl-limit-get-granularity_E64514FF7D88BE870F0B10CA3C9D1F2F)
         1. [CFFI-FUNCTION: `TCL-LIMIT-GET-TIME`](#api-cffi-function-tcl-limit-get-time_01EA6BBC04A01E79A72D9EFF96033EAE)
         1. [CFFI-FUNCTION: `TCL-LIMIT-READY`](#api-cffi-function-tcl-limit-ready_8BEDA0E6137F1C4D3EAD76332B2658AF)
         1. [CFFI-FUNCTION: `TCL-LIMIT-REMOVE-HANDLER`](#api-cffi-function-tcl-limit-remove-handler_BC879AFD195C0513E1A6C92FF4125C21)
         1. [CFFI-FUNCTION: `TCL-LIMIT-SET-COMMANDS`](#api-cffi-function-tcl-limit-set-commands_4CE4C8309E950D4DEEB289056A6E0692)
         1. [CFFI-FUNCTION: `TCL-LIMIT-SET-GRANULARITY`](#api-cffi-function-tcl-limit-set-granularity_1EA1AB25C5F06C1D98E30245B3036402)
         1. [CFFI-FUNCTION: `TCL-LIMIT-SET-TIME`](#api-cffi-function-tcl-limit-set-time_C4A7F62FEF6083E7ABD7F06C848DE582)
         1. [CFFI-FUNCTION: `TCL-LIMIT-TYPE-ENABLED`](#api-cffi-function-tcl-limit-type-enabled_E9B9730276646B45017DF2C285CAA856)
         1. [CFFI-FUNCTION: `TCL-LIMIT-TYPE-EXCEEDED`](#api-cffi-function-tcl-limit-type-exceeded_8B225BCB836CE3B36276994131328E41)
         1. [CFFI-FUNCTION: `TCL-LIMIT-TYPE-RESET`](#api-cffi-function-tcl-limit-type-reset_877CF22441D53F6EAE938ED3E3F3FEEC)
         1. [CFFI-FUNCTION: `TCL-LIMIT-TYPE-SET`](#api-cffi-function-tcl-limit-type-set_DDF6D922E4D24C43A41449D744821A41)
         1. [CFFI-FUNCTION: `TCL-LINK-ARRAY`](#api-cffi-function-tcl-link-array_B72952170CEB03942A505EB20ADEE0CB)
         1. [CFFI-FUNCTION: `TCL-LINK-VAR`](#api-cffi-function-tcl-link-var_3F415064940B8F01E6B89CAAF8BD274B)
         1. [CFFI-FUNCTION: `TCL-LIST-OBJ-APPEND-ELEMENT`](#api-cffi-function-tcl-list-obj-append-element_AB96704D1AFFDCA1245FA302C28FBAEE)
         1. [CFFI-FUNCTION: `TCL-LIST-OBJ-APPEND-LIST`](#api-cffi-function-tcl-list-obj-append-list_42FC7C17ABC190BB7FE78090AE323BDF)
         1. [CFFI-FUNCTION: `TCL-LIST-OBJ-GET-ELEMENTS`](#api-cffi-function-tcl-list-obj-get-elements_C7A82159E569538F115B43958AE843B0)
         1. [CFFI-FUNCTION: `TCL-LIST-OBJ-INDEX`](#api-cffi-function-tcl-list-obj-index_8407CE78969B0E9A203A6B88DF591261)
         1. [CFFI-FUNCTION: `TCL-LIST-OBJ-LENGTH`](#api-cffi-function-tcl-list-obj-length_845BDC8929F2D10D8A33F1FE76C10DD2)
         1. [CFFI-FUNCTION: `TCL-LIST-OBJ-REPLACE`](#api-cffi-function-tcl-list-obj-replace_1E4F1E444DB79DA00B3ABBDF8E34EBFB)
         1. [CFFI-FUNCTION: `TCL-LOAD-FILE`](#api-cffi-function-tcl-load-file_0D38D39F0952213B856CA0D33EDA837D)
         1. [CFFI-FUNCTION: `TCL-LOG-COMMAND-INFO`](#api-cffi-function-tcl-log-command-info_1F633E3B428EB603B0EF987B6012844A)
         1. [CFFI-FUNCTION: `TCL-MAIN-EX`](#api-cffi-function-tcl-main-ex_C9BF34116141872BFFDBF88894C00DD3)
         1. [CFFI-FUNCTION: `TCL-MAKE-FILE-CHANNEL`](#api-cffi-function-tcl-make-file-channel_83758C9415423B776588998225B99FBD)
         1. [CFFI-FUNCTION: `TCL-MAKE-TCP-CLIENT-CHANNEL`](#api-cffi-function-tcl-make-tcp-client-channel_C77009C363D78B7561751CF6C6DAFAAC)
         1. [CFFI-FUNCTION: `TCL-MERGE`](#api-cffi-function-tcl-merge_ED1A21F2E6496E7B08A85248F5F08F08)
         1. [CFFI-FUNCTION: `TCL-MUTEX-FINALIZE`](#api-cffi-function-tcl-mutex-finalize_25B6FA09152D753CC132F2D0FF0FF6C6)
         1. [CFFI-FUNCTION: `TCL-MUTEX-LOCK`](#api-cffi-function-tcl-mutex-lock_00883E87475ECEB92AACF46C6EF7AC1F)
         1. [CFFI-FUNCTION: `TCL-MUTEX-UNLOCK`](#api-cffi-function-tcl-mutex-unlock_63783E426DE7C7ECAC9EA21F202E6D76)
         1. [CFFI-FUNCTION: `TCL-NEW-BIGNUM-OBJ`](#api-cffi-function-tcl-new-bignum-obj_1683958F3BD9EDD16A18B81E5E121CBC)
         1. [CFFI-FUNCTION: `TCL-NEW-BYTE-ARRAY-OBJ`](#api-cffi-function-tcl-new-byte-array-obj_C9DAF3CA76165A8BD9002A0952ED0F9A)
         1. [CFFI-FUNCTION: `TCL-NEW-DICT-OBJ`](#api-cffi-function-tcl-new-dict-obj_E3ED6B5C3182E76F2CCBC5B477A5A764)
         1. [CFFI-FUNCTION: `TCL-NEW-DOUBLE-OBJ`](#api-cffi-function-tcl-new-double-obj_8B4883347B8ABB6ADF14B1732852EE5B)
         1. [CFFI-FUNCTION: `TCL-NEW-LIST-OBJ`](#api-cffi-function-tcl-new-list-obj_AC6967689E82E03926477512B902928A)
         1. [CFFI-FUNCTION: `TCL-NEW-OBJ`](#api-cffi-function-tcl-new-obj_81F434635A67A86E98E086C84C8E56D6)
         1. [CFFI-FUNCTION: `TCL-NEW-STRING-OBJ`](#api-cffi-function-tcl-new-string-obj_855EA11B31C716F3427403C4F7C63627)
         1. [CFFI-FUNCTION: `TCL-NEW-UNICODE-OBJ`](#api-cffi-function-tcl-new-unicode-obj_E00EE90BC738B47BD703588FF8A2D4A6)
         1. [CFFI-FUNCTION: `TCL-NEW-WIDE-INT-OBJ`](#api-cffi-function-tcl-new-wide-int-obj_DD76D01C6CB9B0647A3B2F8484369747)
         1. [CFFI-FUNCTION: `TCL-NEW-WIDE-U-INT-OBJ`](#api-cffi-function-tcl-new-wide-u-int-obj_7AED9E71FFF9BB160473BAC5EC622CE7)
         1. [CFFI-FUNCTION: `TCL-NEXT-HASH-ENTRY`](#api-cffi-function-tcl-next-hash-entry_0F45FD21A6610845AC1869F92F5D4174)
         1. [CFFI-FUNCTION: `TCL-NOTIFY-CHANNEL`](#api-cffi-function-tcl-notify-channel_1F67CF998F3B6212B41AD3B14B1E045E)
         1. [CFFI-FUNCTION: `TCL-NR-ADD-CALLBACK`](#api-cffi-function-tcl-nr-add-callback_10953A620628A5F1CF6BE208A453CA11)
         1. [CFFI-FUNCTION: `TCL-NR-CALL-OBJ-PROC2`](#api-cffi-function-tcl-nr-call-obj-proc2_F6F7498E0BAD21C70C89B7E4A0367486)
         1. [CFFI-FUNCTION: `TCL-NR-CALL-OBJ-PROC`](#api-cffi-function-tcl-nr-call-obj-proc_B0E8EF2B2AEFAE8B8F5983B823F8DC9D)
         1. [CFFI-FUNCTION: `TCL-NR-CMD-SWAP`](#api-cffi-function-tcl-nr-cmd-swap_2115FB2D7DDB4E1C9B0233B4FB0BC91B)
         1. [CFFI-FUNCTION: `TCL-NR-CREATE-COMMAND2`](#api-cffi-function-tcl-nr-create-command2_6BE614A121003574A0011E2C458386AB)
         1. [CFFI-FUNCTION: `TCL-NR-CREATE-COMMAND`](#api-cffi-function-tcl-nr-create-command_ED9EA27D808D6DF9D2D2823BB9084963)
         1. [CFFI-FUNCTION: `TCL-NR-EVAL-OBJ`](#api-cffi-function-tcl-nr-eval-obj_E7DF9234C51FFF6B2B68BBE0CE4542DA)
         1. [CFFI-FUNCTION: `TCL-NR-EVAL-OBJV`](#api-cffi-function-tcl-nr-eval-objv_0561542BBF4E9AE0D55BFD5F74BD4249)
         1. [CFFI-FUNCTION: `TCL-NR-EXPR-OBJ`](#api-cffi-function-tcl-nr-expr-obj_ACFD89E8D90E8E320FD27B54B263E9EB)
         1. [CFFI-FUNCTION: `TCL-NR-SUBST-OBJ`](#api-cffi-function-tcl-nr-subst-obj_2AC9698A5A796D7EC915044069A87420)
         1. [CFFI-FUNCTION: `TCL-NUM-UTF-CHARS`](#api-cffi-function-tcl-num-utf-chars_C5D57FC0291DDB56D34312611D7DA83C)
         1. [CFFI-FUNCTION: `TCL-OBJ-GET-VAR2`](#api-cffi-function-tcl-obj-get-var2_30258916978B98B47128F0A6F285F10E)
         1. [CFFI-FUNCTION: `TCL-OBJ-PRINTF`](#api-cffi-function-tcl-obj-printf_E24E17480B9808F20DB3405A6483D8E2)
         1. [CFFI-FUNCTION: `TCL-OBJ-SET-VAR2`](#api-cffi-function-tcl-obj-set-var2_83EC5D9398E51CE045291951D34404D1)
         1. [CFFI-FUNCTION: `TCL-OPEN-COMMAND-CHANNEL`](#api-cffi-function-tcl-open-command-channel_B387DE7703D5D40FEC33542CCE65D0E3)
         1. [CFFI-FUNCTION: `TCL-OPEN-FILE-CHANNEL`](#api-cffi-function-tcl-open-file-channel_47E40A083A4C7B0440D4F17E8CD9E1AC)
         1. [CFFI-FUNCTION: `TCL-OPEN-TCP-CLIENT`](#api-cffi-function-tcl-open-tcp-client_0F12C75B6244F21E8B381E48E56BA67F)
         1. [CFFI-FUNCTION: `TCL-OPEN-TCP-SERVER-EX`](#api-cffi-function-tcl-open-tcp-server-ex_C0AD6BAD78ACE1785817AB00E9AECE12)
         1. [CFFI-FUNCTION: `TCL-OPEN-TCP-SERVER`](#api-cffi-function-tcl-open-tcp-server_9DB3242C0123DF16A3E63CF69EE1989F)
         1. [CFFI-FUNCTION: `TCL-OUTPUT-BUFFERED`](#api-cffi-function-tcl-output-buffered_6C9D80F1ADD1BFC2342419FA9D23A9A1)
         1. [CFFI-FUNCTION: `TCL-PANIC`](#api-cffi-function-tcl-panic_1B8558446BF9946763CF1F9110DDF082)
         1. [CFFI-FUNCTION: `TCL-PARSE-ARGS-OBJV`](#api-cffi-function-tcl-parse-args-objv_D8666EAF6826B3D5041A7B851B058781)
         1. [CFFI-FUNCTION: `TCL-PARSE-BRACES`](#api-cffi-function-tcl-parse-braces_D9BBD2AC5047C7C531DC605BAFA99AB3)
         1. [CFFI-FUNCTION: `TCL-PARSE-COMMAND`](#api-cffi-function-tcl-parse-command_0602514D0F211A675A8E7D2AC6C67616)
         1. [CFFI-FUNCTION: `TCL-PARSE-EXPR`](#api-cffi-function-tcl-parse-expr_C6E8581D092F9C5E5CDF28B66E112516)
         1. [CFFI-FUNCTION: `TCL-PARSE-QUOTED-STRING`](#api-cffi-function-tcl-parse-quoted-string_E013BFB765117A71AD433B8D096FC6A7)
         1. [CFFI-FUNCTION: `TCL-PARSE-VAR-NAME`](#api-cffi-function-tcl-parse-var-name_3261147394BCC4D3EA70D7F8140E3989)
         1. [CFFI-FUNCTION: `TCL-PARSE-VAR`](#api-cffi-function-tcl-parse-var_FC000B8D6A30BE12EF6DC9F19A3F8718)
         1. [CFFI-FUNCTION: `TCL-PKG-INIT-STUBS-CHECK`](#api-cffi-function-tcl-pkg-init-stubs-check_F1E2C7690B30D94828054AC6F81CCFCE)
         1. [CFFI-FUNCTION: `TCL-PKG-PRESENT-EX`](#api-cffi-function-tcl-pkg-present-ex_A06D49808781A957703D690BF5EA7DFC)
         1. [CFFI-FUNCTION: `TCL-PKG-PROVIDE-EX`](#api-cffi-function-tcl-pkg-provide-ex_588DEF72B00883736E4BC4E361E33D49)
         1. [CFFI-FUNCTION: `TCL-PKG-REQUIRE-EX`](#api-cffi-function-tcl-pkg-require-ex_BC3EDF643156F576E645C758CF96707F)
         1. [CFFI-FUNCTION: `TCL-PKG-REQUIRE-PROC`](#api-cffi-function-tcl-pkg-require-proc_F612CDF88CE3BCA53176FDCD62ACAD0B)
         1. [CFFI-FUNCTION: `TCL-POSIX-ERROR`](#api-cffi-function-tcl-posix-error_7CAB01F9F7FC8D4D1F1ADC42706A7400)
         1. [CFFI-FUNCTION: `TCL-PRESERVE`](#api-cffi-function-tcl-preserve_4B12609B1FE614440F3C5AAEEBCE9435)
         1. [CFFI-FUNCTION: `TCL-PRINT-DOUBLE`](#api-cffi-function-tcl-print-double_DC11344CB084B750206B6DE2E27BA3BE)
         1. [CFFI-FUNCTION: `TCL-PROC-OBJ-CMD`](#api-cffi-function-tcl-proc-obj-cmd_52AD3C13B7C283E174CCFB6AFB476213)
         1. [CFFI-FUNCTION: `TCL-PUT-ENV`](#api-cffi-function-tcl-put-env_58516949BDE4DE7571A815444C9D1382)
         1. [CFFI-FUNCTION: `TCL-QUERY-TIME-PROC`](#api-cffi-function-tcl-query-time-proc_E6B0EED3394B19C2A789C55642DE5E21)
         1. [CFFI-FUNCTION: `TCL-QUEUE-EVENT`](#api-cffi-function-tcl-queue-event_543DE32F04E0034D8C50AB7644432AEF)
         1. [CFFI-FUNCTION: `TCL-READ-CHARS`](#api-cffi-function-tcl-read-chars_9C98DD97881BCDC58D4BA30748BFF417)
         1. [CFFI-FUNCTION: `TCL-READ-RAW`](#api-cffi-function-tcl-read-raw_89176BB66C1CDC800273C905B0ABAF07)
         1. [CFFI-FUNCTION: `TCL-READ`](#api-cffi-function-tcl-read_C4ED3C7D4DCA9340574D93DBAC0081F1)
         1. [CFFI-FUNCTION: `TCL-REALLOC`](#api-cffi-function-tcl-realloc_FE09BCACD2188C0D97059785B4B9BCA5)
         1. [CFFI-FUNCTION: `TCL-REAP-DETACHED-PROCS`](#api-cffi-function-tcl-reap-detached-procs_C14EA5FC33FEEEF8A1AE133F79214FF0)
         1. [CFFI-FUNCTION: `TCL-RECORD-AND-EVAL-OBJ`](#api-cffi-function-tcl-record-and-eval-obj_AC833EE42844EC962C9B54184014EB23)
         1. [CFFI-FUNCTION: `TCL-RECORD-AND-EVAL`](#api-cffi-function-tcl-record-and-eval_C7AF5C63278108ACE6806DA04E5B9681)
         1. [CFFI-FUNCTION: `TCL-REG-EXP-COMPILE`](#api-cffi-function-tcl-reg-exp-compile_F4E15E6A83B3AE0689541B93884A929F)
         1. [CFFI-FUNCTION: `TCL-REG-EXP-EXEC-OBJ`](#api-cffi-function-tcl-reg-exp-exec-obj_39145E0813920030BA6BF56F44A181C4)
         1. [CFFI-FUNCTION: `TCL-REG-EXP-EXEC`](#api-cffi-function-tcl-reg-exp-exec_84E4CB9F96CCAB0FFFB276A23A955382)
         1. [CFFI-FUNCTION: `TCL-REG-EXP-GET-INFO`](#api-cffi-function-tcl-reg-exp-get-info_6F6C9AC9EB8CAA1BDA43E65ED45CAE74)
         1. [CFFI-FUNCTION: `TCL-REG-EXP-MATCH-OBJ`](#api-cffi-function-tcl-reg-exp-match-obj_453B54610089FFE339F25E005FF27169)
         1. [CFFI-FUNCTION: `TCL-REG-EXP-MATCH`](#api-cffi-function-tcl-reg-exp-match_5DEAB071F299A6833EEC691BF36E38F1)
         1. [CFFI-FUNCTION: `TCL-REG-EXP-RANGE`](#api-cffi-function-tcl-reg-exp-range_42186E81A055F9FEB044F93B02A51357)
         1. [CFFI-FUNCTION: `TCL-REGISTER-CHANNEL`](#api-cffi-function-tcl-register-channel_8C3C30382180A35CFE136B90BADECAD0)
         1. [CFFI-FUNCTION: `TCL-REGISTER-CONFIG`](#api-cffi-function-tcl-register-config_ECC4D0258A787FA82913F7510B4378B7)
         1. [CFFI-FUNCTION: `TCL-REGISTER-OBJ-TYPE`](#api-cffi-function-tcl-register-obj-type_85906F296F716A902788FF967DBF5340)
         1. [CFFI-FUNCTION: `TCL-RELEASE`](#api-cffi-function-tcl-release_3065620DC44F74CE6F3CB83678ECD4DB)
         1. [CFFI-FUNCTION: `TCL-REMOVE-CHANNEL-MODE`](#api-cffi-function-tcl-remove-channel-mode_A9D3A5089DFF5A1AC37F38FFBCDB22D8)
         1. [CFFI-FUNCTION: `TCL-RESET-RESULT`](#api-cffi-function-tcl-reset-result_93A60C54E8313565B7349D0B16C4FEB3)
         1. [CFFI-FUNCTION: `TCL-RESTORE-INTERP-STATE`](#api-cffi-function-tcl-restore-interp-state_2D5026AB18BD6E90FE165DB5C0702E26)
         1. [CFFI-FUNCTION: `TCL-SAVE-INTERP-STATE`](#api-cffi-function-tcl-save-interp-state_930CE2230D37C1345D3B1EC0021639F3)
         1. [CFFI-FUNCTION: `TCL-SCAN-COUNTED-ELEMENT`](#api-cffi-function-tcl-scan-counted-element_36D03BE119A094E805DA28E0E1AABB50)
         1. [CFFI-FUNCTION: `TCL-SCAN-ELEMENT`](#api-cffi-function-tcl-scan-element_7231DF4BBF490B3EB32536DCB3EC3645)
         1. [CFFI-FUNCTION: `TCL-SEEK`](#api-cffi-function-tcl-seek_BD747F42C3BF8BEA712F666BD16ED4FA)
         1. [CFFI-FUNCTION: `TCL-SERVICE-ALL`](#api-cffi-function-tcl-service-all_FDEA324079DAD453AE6E9E4468F8D18A)
         1. [CFFI-FUNCTION: `TCL-SERVICE-EVENT`](#api-cffi-function-tcl-service-event_2177B681545FB1A0A2D64A87F3C11B90)
         1. [CFFI-FUNCTION: `TCL-SERVICE-MODE-HOOK`](#api-cffi-function-tcl-service-mode-hook_1A322EFEF9C1571B5401EAC59A97874D)
         1. [CFFI-FUNCTION: `TCL-SET-ASSOC-DATA`](#api-cffi-function-tcl-set-assoc-data_B3795AB0A4546886C29EB96875F78B12)
         1. [CFFI-FUNCTION: `TCL-SET-BIGNUM-OBJ`](#api-cffi-function-tcl-set-bignum-obj_1D9EDB1480D0869AD5C9E406BDDB56A7)
         1. [CFFI-FUNCTION: `TCL-SET-BYTE-ARRAY-LENGTH`](#api-cffi-function-tcl-set-byte-array-length_E1F8208F1A5B9C9EA15F91542F3475C5)
         1. [CFFI-FUNCTION: `TCL-SET-BYTE-ARRAY-OBJ`](#api-cffi-function-tcl-set-byte-array-obj_C5359D6D392DBF1326C02FFEC8BFA263)
         1. [CFFI-FUNCTION: `TCL-SET-CHANNEL-BUFFER-SIZE`](#api-cffi-function-tcl-set-channel-buffer-size_A8F6A12F64C1C229944F431C79D9DF60)
         1. [CFFI-FUNCTION: `TCL-SET-CHANNEL-ERROR-INTERP`](#api-cffi-function-tcl-set-channel-error-interp_1A959AC2590EB61BFDFB065DC94A5D94)
         1. [CFFI-FUNCTION: `TCL-SET-CHANNEL-ERROR`](#api-cffi-function-tcl-set-channel-error_E082330C1986CB234AC474E091F8C917)
         1. [CFFI-FUNCTION: `TCL-SET-CHANNEL-OPTION`](#api-cffi-function-tcl-set-channel-option_7C99A13B3B3E2B755BFF4E797AF30A29)
         1. [CFFI-FUNCTION: `TCL-SET-COMMAND-INFO-FROM-TOKEN`](#api-cffi-function-tcl-set-command-info-from-token_47B07C76360BB8D4E0A83309DAB2D3C4)
         1. [CFFI-FUNCTION: `TCL-SET-COMMAND-INFO`](#api-cffi-function-tcl-set-command-info_4D0921BB2CA8E439488447629D108F2E)
         1. [CFFI-FUNCTION: `TCL-SET-DOUBLE-OBJ`](#api-cffi-function-tcl-set-double-obj_8D524CE330E4D747FC2FC67EF6C67841)
         1. [CFFI-FUNCTION: `TCL-SET-ENCODING-SEARCH-PATH`](#api-cffi-function-tcl-set-encoding-search-path_CD110A7C35F42C8F869AECDD6EA88A00)
         1. [CFFI-FUNCTION: `TCL-SET-ENSEMBLE-FLAGS`](#api-cffi-function-tcl-set-ensemble-flags_8FAEE83431F325673C795615D9DE9C87)
         1. [CFFI-FUNCTION: `TCL-SET-ENSEMBLE-MAPPING-DICT`](#api-cffi-function-tcl-set-ensemble-mapping-dict_D4FBB0B4C9B6694CE154E661E93441B0)
         1. [CFFI-FUNCTION: `TCL-SET-ENSEMBLE-PARAMETER-LIST`](#api-cffi-function-tcl-set-ensemble-parameter-list_61DA83DC214C7DB5ED572F049385005A)
         1. [CFFI-FUNCTION: `TCL-SET-ENSEMBLE-SUBCOMMAND-LIST`](#api-cffi-function-tcl-set-ensemble-subcommand-list_EB50188AC1CDFEEFF0836BD07D2F9BCF)
         1. [CFFI-FUNCTION: `TCL-SET-ENSEMBLE-UNKNOWN-HANDLER`](#api-cffi-function-tcl-set-ensemble-unknown-handler_7775BD4DB349CF5D3D386C8904F21E38)
         1. [CFFI-FUNCTION: `TCL-SET-ERRNO`](#api-cffi-function-tcl-set-errno_04326A57BCFC082AD8FC006A1F7E1A54)
         1. [CFFI-FUNCTION: `TCL-SET-ERROR-CODE`](#api-cffi-function-tcl-set-error-code_5BC77DBE3610BC4B51D3CD0EA4915B65)
         1. [CFFI-FUNCTION: `TCL-SET-ERROR-LINE`](#api-cffi-function-tcl-set-error-line_7A6D1FFA57DC79269A3E482F26EC6102)
         1. [CFFI-FUNCTION: `TCL-SET-LIST-OBJ`](#api-cffi-function-tcl-set-list-obj_7FD009F0C756B810530E57FBD2442043)
         1. [CFFI-FUNCTION: `TCL-SET-MAIN-LOOP`](#api-cffi-function-tcl-set-main-loop_EA8326B8712EC64E9CDC9B3E10267BAE)
         1. [CFFI-FUNCTION: `TCL-SET-MAX-BLOCK-TIME`](#api-cffi-function-tcl-set-max-block-time_F15EB98DE182D9229482CDB80871B183)
         1. [CFFI-FUNCTION: `TCL-SET-NAMESPACE-UNKNOWN-HANDLER`](#api-cffi-function-tcl-set-namespace-unknown-handler_E9F1918F403541801D0A52BAF24CFED7)
         1. [CFFI-FUNCTION: `TCL-SET-NOTIFIER`](#api-cffi-function-tcl-set-notifier_CC10E4E11CED3DC16947F6C5C32E0B32)
         1. [CFFI-FUNCTION: `TCL-SET-OBJ-ERROR-CODE`](#api-cffi-function-tcl-set-obj-error-code_9A6120161575901E36F6CC0E92832235)
         1. [CFFI-FUNCTION: `TCL-SET-OBJ-LENGTH`](#api-cffi-function-tcl-set-obj-length_3519D3065702E49F509A1009EF60212E)
         1. [CFFI-FUNCTION: `TCL-SET-OBJ-NAME-OF-EXECUTABLE`](#api-cffi-function-tcl-set-obj-name-of-executable_30E52928CA6EA1F29A5026590A656C91)
         1. [CFFI-FUNCTION: `TCL-SET-OBJ-RESULT`](#api-cffi-function-tcl-set-obj-result_870EB62E032D0B18E82E9E36A653ADBF)
         1. [CFFI-FUNCTION: `TCL-SET-PANIC-PROC`](#api-cffi-function-tcl-set-panic-proc_0FC4BD3B0E35DEE5A2C9D06406E5BAE4)
         1. [CFFI-FUNCTION: `TCL-SET-PRE-INIT-SCRIPT`](#api-cffi-function-tcl-set-pre-init-script_0832618916CB3DD84F3F49FC513CBD2A)
         1. [CFFI-FUNCTION: `TCL-SET-RECURSION-LIMIT`](#api-cffi-function-tcl-set-recursion-limit_4E6301DDBCA85725B836F3F39A5E4A11)
         1. [CFFI-FUNCTION: `TCL-SET-RETURN-OPTIONS`](#api-cffi-function-tcl-set-return-options_52745784576B0651EE3C3CD98AD3DBF8)
         1. [CFFI-FUNCTION: `TCL-SET-SERVICE-MODE`](#api-cffi-function-tcl-set-service-mode_1101D7A76C26E5A73F571CAF229D3EA2)
         1. [CFFI-FUNCTION: `TCL-SET-STARTUP-SCRIPT`](#api-cffi-function-tcl-set-startup-script_D611B0CA85E71D24178B9B3060B92538)
         1. [CFFI-FUNCTION: `TCL-SET-STD-CHANNEL`](#api-cffi-function-tcl-set-std-channel_1AAAE3191C635409ED35BEA39D27F9BB)
         1. [CFFI-FUNCTION: `TCL-SET-STRING-OBJ`](#api-cffi-function-tcl-set-string-obj_05937AA5965EB57FB55843233A49C9EF)
         1. [CFFI-FUNCTION: `TCL-SET-SYSTEM-ENCODING`](#api-cffi-function-tcl-set-system-encoding_8523B5C419798DC0422C96EF3BF19761)
         1. [CFFI-FUNCTION: `TCL-SET-TIME-PROC`](#api-cffi-function-tcl-set-time-proc_18C8F8C86A0308094CAC4C3D9EE46A53)
         1. [CFFI-FUNCTION: `TCL-SET-TIMER`](#api-cffi-function-tcl-set-timer_F8728D0A25C4DEEAB0DA80741D714FB5)
         1. [CFFI-FUNCTION: `TCL-SET-UNICODE-OBJ`](#api-cffi-function-tcl-set-unicode-obj_BDFF26719F363DA3343F5ED71C997E60)
         1. [CFFI-FUNCTION: `TCL-SET-VAR2-EX`](#api-cffi-function-tcl-set-var2-ex_7FA9A89691325E5BC0D8859090BA4DDB)
         1. [CFFI-FUNCTION: `TCL-SET-VAR2`](#api-cffi-function-tcl-set-var2_ECDD836416F2B062FE684896DF949F13)
         1. [CFFI-FUNCTION: `TCL-SET-WIDE-INT-OBJ`](#api-cffi-function-tcl-set-wide-int-obj_431C85AC2DE9AB1FE3E48780DC9140F7)
         1. [CFFI-FUNCTION: `TCL-SET-WIDE-U-INT-OBJ`](#api-cffi-function-tcl-set-wide-u-int-obj_AB3441F2990816FA2C0117A0F4D62306)
         1. [CFFI-FUNCTION: `TCL-SIGNAL-ID`](#api-cffi-function-tcl-signal-id_F54DA072FF4FA2A3F7913BCC2033B6CF)
         1. [CFFI-FUNCTION: `TCL-SIGNAL-MSG`](#api-cffi-function-tcl-signal-msg_6AA31132CEC25EB7EED93B5106C6551E)
         1. [CFFI-FUNCTION: `TCL-SLEEP`](#api-cffi-function-tcl-sleep_D77CB00902B8ED4B117987C301B2243B)
         1. [CFFI-FUNCTION: `TCL-SOURCE-RC-FILE`](#api-cffi-function-tcl-source-rc-file_6421511C26717279483DF157E5391263)
         1. [CFFI-FUNCTION: `TCL-SPLICE-CHANNEL`](#api-cffi-function-tcl-splice-channel_C7F9862D4A41A00A980D40F4C343553A)
         1. [CFFI-FUNCTION: `TCL-SPLIT-LIST`](#api-cffi-function-tcl-split-list_ED32E1AFBCCDFA602AA7178A4565055D)
         1. [CFFI-FUNCTION: `TCL-SPLIT-PATH`](#api-cffi-function-tcl-split-path_3B18329B31EA354B19813F423D482F02)
         1. [CFFI-FUNCTION: `TCL-STACK-CHANNEL`](#api-cffi-function-tcl-stack-channel_583CBDE04C7AD62FA33F929D0AEEE031)
         1. [CFFI-FUNCTION: `TCL-STAT`](#api-cffi-function-tcl-stat_C5ADC77E93FBDBD96D54A23D073C22D7)
         1. [CFFI-FUNCTION: `TCL-STATIC-LIBRARY`](#api-cffi-function-tcl-static-library_6539AFB9BEE7C66CD2C730F33AE53418)
         1. [CFFI-FUNCTION: `TCL-STORE-INTERNAL-REP`](#api-cffi-function-tcl-store-internal-rep_4CCC80DBE1BC10FDC10C70647F06A9AF)
         1. [CFFI-FUNCTION: `TCL-STRING-CASE-MATCH`](#api-cffi-function-tcl-string-case-match_FC4A9278D6E6A85FDC1EA07F248258B3)
         1. [CFFI-FUNCTION: `TCL-STUB-CALL`](#api-cffi-function-tcl-stub-call_B6F3A0E2EA0D9BD9073C2604CF1E0DA7)
         1. [CFFI-FUNCTION: `TCL-SUBST-OBJ`](#api-cffi-function-tcl-subst-obj_912F964B8662DB6D0C73BBCA46753933)
         1. [CFFI-FUNCTION: `TCL-TAKE-BIGNUM-FROM-OBJ`](#api-cffi-function-tcl-take-bignum-from-obj_79DD527A8B1CE6B97F895B418B9EEB37)
         1. [CFFI-FUNCTION: `TCL-TELL`](#api-cffi-function-tcl-tell_35ADFDDD44F5F8A86651164B7BA05A58)
         1. [CFFI-FUNCTION: `TCL-THREAD-ALERT`](#api-cffi-function-tcl-thread-alert_BC7D98DF313D17F94CD71E0E1BCA740D)
         1. [CFFI-FUNCTION: `TCL-THREAD-QUEUE-EVENT`](#api-cffi-function-tcl-thread-queue-event_A13E8679E486A8ED912EFADE78F4B5B9)
         1. [CFFI-FUNCTION: `TCL-TOM-MATH-INITIALIZE-STUBS`](#api-cffi-function-tcl-tom-math-initialize-stubs_6A321361F2DB7FE365C14C27D0FBDDBB)
         1. [CFFI-FUNCTION: `TCL-TRACE-COMMAND`](#api-cffi-function-tcl-trace-command_A04A04850A6AC9D059EDC09815AD5BF7)
         1. [CFFI-FUNCTION: `TCL-TRACE-VAR2`](#api-cffi-function-tcl-trace-var2_6690387CAEF66B6AED4DE85A7333CC50)
         1. [CFFI-FUNCTION: `TCL-TRANSFER-RESULT`](#api-cffi-function-tcl-transfer-result_5DA6A072D7906907BC59D703D733A32D)
         1. [CFFI-FUNCTION: `TCL-TRANSLATE-FILE-NAME`](#api-cffi-function-tcl-translate-file-name_D73D9005102BA717E5A33C067814AC67)
         1. [CFFI-FUNCTION: `TCL-TRUNCATE-CHANNEL`](#api-cffi-function-tcl-truncate-channel_EEC47ACA518F19E5491AFD94A0943C7D)
         1. [CFFI-FUNCTION: `TCL-UNGETS`](#api-cffi-function-tcl-ungets_B2A845489155FB83D97CFAE7620701A8)
         1. [CFFI-FUNCTION: `TCL-UNI-CHAR-AT-INDEX`](#api-cffi-function-tcl-uni-char-at-index_72C62496B6AD19C36F9A597217997D77)
         1. [CFFI-FUNCTION: `TCL-UNI-CHAR-IS-ALNUM`](#api-cffi-function-tcl-uni-char-is-alnum_8F7E31845B2D865302990758B6D23E38)
         1. [CFFI-FUNCTION: `TCL-UNI-CHAR-IS-ALPHA`](#api-cffi-function-tcl-uni-char-is-alpha_AB85187BB12AF16E626F1322228955A2)
         1. [CFFI-FUNCTION: `TCL-UNI-CHAR-IS-CONTROL`](#api-cffi-function-tcl-uni-char-is-control_456B3D520FCB2A14054CC9660C83E6D9)
         1. [CFFI-FUNCTION: `TCL-UNI-CHAR-IS-DIGIT`](#api-cffi-function-tcl-uni-char-is-digit_69195C77666AE4A86439954DD050DB07)
         1. [CFFI-FUNCTION: `TCL-UNI-CHAR-IS-GRAPH`](#api-cffi-function-tcl-uni-char-is-graph_42F9EB8AC57DE0CA409645326C25A9E1)
         1. [CFFI-FUNCTION: `TCL-UNI-CHAR-IS-LOWER`](#api-cffi-function-tcl-uni-char-is-lower_2442E9E855D75C5F93E111C5795CD6D3)
         1. [CFFI-FUNCTION: `TCL-UNI-CHAR-IS-PRINT`](#api-cffi-function-tcl-uni-char-is-print_7F5E60FCE22CB96DF24BA42925DB4FE5)
         1. [CFFI-FUNCTION: `TCL-UNI-CHAR-IS-PUNCT`](#api-cffi-function-tcl-uni-char-is-punct_84A49580D2616613D1575488467DBB3E)
         1. [CFFI-FUNCTION: `TCL-UNI-CHAR-IS-SPACE`](#api-cffi-function-tcl-uni-char-is-space_27EB5A39759235BE43B4F08C5735B0B3)
         1. [CFFI-FUNCTION: `TCL-UNI-CHAR-IS-UPPER`](#api-cffi-function-tcl-uni-char-is-upper_EAA4632951081A5622CA3E80BE9F167C)
         1. [CFFI-FUNCTION: `TCL-UNI-CHAR-IS-WORD-CHAR`](#api-cffi-function-tcl-uni-char-is-word-char_C1451D89953A0E27C6E69F25EE28ABC9)
         1. [CFFI-FUNCTION: `TCL-UNI-CHAR-LEN`](#api-cffi-function-tcl-uni-char-len_F248C387A0DBFA36284562BE6AC41725)
         1. [CFFI-FUNCTION: `TCL-UNI-CHAR-TO-LOWER`](#api-cffi-function-tcl-uni-char-to-lower_D00D0FDF76766A8A432C014C0F8592B7)
         1. [CFFI-FUNCTION: `TCL-UNI-CHAR-TO-TITLE`](#api-cffi-function-tcl-uni-char-to-title_86E29566270809A263E2345F99D96CB4)
         1. [CFFI-FUNCTION: `TCL-UNI-CHAR-TO-UPPER`](#api-cffi-function-tcl-uni-char-to-upper_6CCE2B550E733E53DDBBBAFCD2EED531)
         1. [CFFI-FUNCTION: `TCL-UNI-CHAR-TO-UTF-D-STRING`](#api-cffi-function-tcl-uni-char-to-utf-d-string_705C82E746DAE8B632D1E23854E496D5)
         1. [CFFI-FUNCTION: `TCL-UNI-CHAR-TO-UTF`](#api-cffi-function-tcl-uni-char-to-utf_7FEC30972D0688C5F9F2D69E97C6027B)
         1. [CFFI-FUNCTION: `TCL-UNLINK-VAR`](#api-cffi-function-tcl-unlink-var_2A39C0C71F0A0E8B0E731BAACBD677D2)
         1. [CFFI-FUNCTION: `TCL-UNREGISTER-CHANNEL`](#api-cffi-function-tcl-unregister-channel_E8937B6A1DC229F45820E9073249CF2F)
         1. [CFFI-FUNCTION: `TCL-UNSET-VAR2`](#api-cffi-function-tcl-unset-var2_C94F7FB2F64C272237B20B6A0BA2425F)
         1. [CFFI-FUNCTION: `TCL-UNSTACK-CHANNEL`](#api-cffi-function-tcl-unstack-channel_2DD99903EAD950BEFF1EE2C74554B8F2)
         1. [CFFI-FUNCTION: `TCL-UNTRACE-COMMAND`](#api-cffi-function-tcl-untrace-command_7B89E29FF35779C2F0300B9991685134)
         1. [CFFI-FUNCTION: `TCL-UNTRACE-VAR2`](#api-cffi-function-tcl-untrace-var2_7EAF66F38481C08475B63B709181D9CF)
         1. [CFFI-FUNCTION: `TCL-UNUSED-STUB-ENTRY`](#api-cffi-function-tcl-unused-stub-entry_A175A128C8179685480C5C0DE662B45F)
         1. [CFFI-FUNCTION: `TCL-UP-VAR2`](#api-cffi-function-tcl-up-var2_0CED86B993097935E64C3A5217D06C90)
         1. [CFFI-FUNCTION: `TCL-UPDATE-LINKED-VAR`](#api-cffi-function-tcl-update-linked-var_675A925532CFE24693E00312482747FD)
         1. [CFFI-FUNCTION: `TCL-UTF-AT-INDEX`](#api-cffi-function-tcl-utf-at-index_D56F90CF67D409B578B06E3D70FF9F61)
         1. [CFFI-FUNCTION: `TCL-UTF-BACKSLASH*`](#api-cffi-function-tcl-utf-backslash_B565992195E5BF43149B8253F7ED50E8)
         1. [CFFI-FUNCTION: `TCL-UTF-BACKSLASH`](#api-cffi-function-tcl-utf-backslash_D8685718E7BB76E746D38FC50BCAF06A)
         1. [CFFI-FUNCTION: `TCL-UTF-CHAR-COMPLETE`](#api-cffi-function-tcl-utf-char-complete_AE26827FAFC604D1895D8F5722613F8E)
         1. [CFFI-FUNCTION: `TCL-UTF-FIND-FIRST`](#api-cffi-function-tcl-utf-find-first_B18C8F73AB94A71308C745D5B41A4DF7)
         1. [CFFI-FUNCTION: `TCL-UTF-FIND-LAST`](#api-cffi-function-tcl-utf-find-last_DC19EE3641566FA3D23166AD4B529B07)
         1. [CFFI-FUNCTION: `TCL-UTF-NCASECMP`](#api-cffi-function-tcl-utf-ncasecmp_821D3217A02FB5E3B1A96BA5E9F434A7)
         1. [CFFI-FUNCTION: `TCL-UTF-NCMP`](#api-cffi-function-tcl-utf-ncmp_5DE76B7D46270125CA2C7BDADA9EA550)
         1. [CFFI-FUNCTION: `TCL-UTF-NEXT`](#api-cffi-function-tcl-utf-next_A569C2FA738C71B51EF501ECCD4D30D2)
         1. [CFFI-FUNCTION: `TCL-UTF-PREV`](#api-cffi-function-tcl-utf-prev_E6F97AB7B0F809C613477350EB5E8DB5)
         1. [CFFI-FUNCTION: `TCL-UTF-TO-CHAR16-D-STRING`](#api-cffi-function-tcl-utf-to-char16-d-string_D99859790934C5DED790255E7890DDB8)
         1. [CFFI-FUNCTION: `TCL-UTF-TO-CHAR16`](#api-cffi-function-tcl-utf-to-char16_0F6951385336DD676101918F82610788)
         1. [CFFI-FUNCTION: `TCL-UTF-TO-EXTERNAL-D-STRING-EX`](#api-cffi-function-tcl-utf-to-external-d-string-ex_DA6C6873A260181E90B55D2F62907800)
         1. [CFFI-FUNCTION: `TCL-UTF-TO-EXTERNAL-D-STRING`](#api-cffi-function-tcl-utf-to-external-d-string_78E50A0375AF5340B1E031F268A192F4)
         1. [CFFI-FUNCTION: `TCL-UTF-TO-EXTERNAL`](#api-cffi-function-tcl-utf-to-external_8B683D8517A612DC4CC2350CCB2FB6E5)
         1. [CFFI-FUNCTION: `TCL-UTF-TO-LOWER`](#api-cffi-function-tcl-utf-to-lower_1387719C208D512ABD1F855E6029CDC8)
         1. [CFFI-FUNCTION: `TCL-UTF-TO-TITLE`](#api-cffi-function-tcl-utf-to-title_58376C76BF963B61F17ACD5E85E4045B)
         1. [CFFI-FUNCTION: `TCL-UTF-TO-UNI-CHAR-D-STRING`](#api-cffi-function-tcl-utf-to-uni-char-d-string_E21B9FE83624EE3A8BF5C9DF10865081)
         1. [CFFI-FUNCTION: `TCL-UTF-TO-UNI-CHAR`](#api-cffi-function-tcl-utf-to-uni-char_5C48803CA078E83190ED8E5093A81390)
         1. [CFFI-FUNCTION: `TCL-UTF-TO-UPPER`](#api-cffi-function-tcl-utf-to-upper_7F654C38B36D39011BCE833260874F6E)
         1. [CFFI-FUNCTION: `TCL-VALIDATE-ALL-MEMORY`](#api-cffi-function-tcl-validate-all-memory_9B97D8890AB3928A95E419C1C04BD7B4)
         1. [CFFI-FUNCTION: `TCL-VAR-EVAL`](#api-cffi-function-tcl-var-eval_C0DBA4C3BD64A50FB795C54425E3EE33)
         1. [CFFI-FUNCTION: `TCL-VAR-TRACE-INFO2`](#api-cffi-function-tcl-var-trace-info2_BF8B23E93E26A55998EFE8BD35F6288C)
         1. [CFFI-FUNCTION: `TCL-WAIT-FOR-EVENT`](#api-cffi-function-tcl-wait-for-event_D9AC7531610CD031D943AACEEB8C6FA8)
         1. [CFFI-FUNCTION: `TCL-WAIT-PID`](#api-cffi-function-tcl-wait-pid_8753E4411B44C0C294B77B490B2F070E)
         1. [CFFI-FUNCTION: `TCL-WRITE-CHARS`](#api-cffi-function-tcl-write-chars_11EEABC9A3D8473AFA8D63B018D281C9)
         1. [CFFI-FUNCTION: `TCL-WRITE-OBJ`](#api-cffi-function-tcl-write-obj_018BEC87981E056EF6A0A1E9A4195769)
         1. [CFFI-FUNCTION: `TCL-WRITE-RAW`](#api-cffi-function-tcl-write-raw_E8D7F7BE88184C5BF150A6B5DDC6F0CC)
         1. [CFFI-FUNCTION: `TCL-WRITE`](#api-cffi-function-tcl-write_7DDF85091724F33678995A3B6B7EEB1C)
         1. [CFFI-FUNCTION: `TCL-WRONG-NUM-ARGS`](#api-cffi-function-tcl-wrong-num-args_47059D735B850B3A5DA42ED5BFA1F474)
         1. [CFFI-FUNCTION: `TCL-ZIPFS-MOUNT-BUFFER`](#api-cffi-function-tcl-zipfs-mount-buffer_BD52691D51D11FC2151D7673D90DE5B3)
         1. [CFFI-FUNCTION: `TCL-ZIPFS-MOUNT`](#api-cffi-function-tcl-zipfs-mount_07BE568556BD01BB6EC6F0C7FE351AA2)
         1. [CFFI-FUNCTION: `TCL-ZIPFS-TCL-LIBRARY`](#api-cffi-function-tcl-zipfs-tcl-library_33FA4EBA864F59991526338926A7BF67)
         1. [CFFI-FUNCTION: `TCL-ZIPFS-UNMOUNT`](#api-cffi-function-tcl-zipfs-unmount_0C475CDC89E1F3BFD928D1D75AF6C43B)
         1. [CFFI-FUNCTION: `TCL-ZLIB-ADLER32`](#api-cffi-function-tcl-zlib-adler32_762C6F5C26BD3403D160D40C75382280)
         1. [CFFI-FUNCTION: `TCL-ZLIB-CRC32`](#api-cffi-function-tcl-zlib-crc32_28395906C1D68BF01FBE6094E2EEFCB4)
         1. [CFFI-FUNCTION: `TCL-ZLIB-DEFLATE`](#api-cffi-function-tcl-zlib-deflate_E8F5D0793C4B78B81ECE70A1770A6855)
         1. [CFFI-FUNCTION: `TCL-ZLIB-INFLATE`](#api-cffi-function-tcl-zlib-inflate_B4DF6E270C42CE7A1DCFAD41B9FAAACC)
         1. [CFFI-FUNCTION: `TCL-ZLIB-STREAM-CHECKSUM`](#api-cffi-function-tcl-zlib-stream-checksum_63EC37410BDC513AB88129021532877A)
         1. [CFFI-FUNCTION: `TCL-ZLIB-STREAM-CLOSE`](#api-cffi-function-tcl-zlib-stream-close_C63F6999736AD9FEBB169502A02AABFC)
         1. [CFFI-FUNCTION: `TCL-ZLIB-STREAM-EOF`](#api-cffi-function-tcl-zlib-stream-eof_BF84520BA67B69DC09E7090CBC6DD6F3)
         1. [CFFI-FUNCTION: `TCL-ZLIB-STREAM-GET-COMMAND-NAME`](#api-cffi-function-tcl-zlib-stream-get-command-name_7323EB396684C34D977B202400FA97B6)
         1. [CFFI-FUNCTION: `TCL-ZLIB-STREAM-GET`](#api-cffi-function-tcl-zlib-stream-get_D8B72CFC0F996C36905BFC65CB6820CD)
         1. [CFFI-FUNCTION: `TCL-ZLIB-STREAM-INIT`](#api-cffi-function-tcl-zlib-stream-init_2F6E65F2F8BCB8B6982B856748BB0F6A)
         1. [CFFI-FUNCTION: `TCL-ZLIB-STREAM-PUT`](#api-cffi-function-tcl-zlib-stream-put_41CA6E5035ED2839BFB1DE3FE498AC8A)
         1. [CFFI-FUNCTION: `TCL-ZLIB-STREAM-RESET`](#api-cffi-function-tcl-zlib-stream-reset_B2C0257105A7A8FA1EB0D57E4F25CB11)
         1. [CFFI-FUNCTION: `TCL-ZLIB-STREAM-SET-COMPRESSION-DICTIONARY`](#api-cffi-function-tcl-zlib-stream-set-compression-dictionary_95E3A7842C3493D6919E2D2EC3BD73D6)
         1. [CFFI-FUNCTION: `TCL_DICT-OBJ-SIZE`](#api-cffi-function-tcldict-obj-size_A25E3DC1B79C75D2C101184877A83FCF)
         1. [CFFI-FUNCTION: `TCL_FS-SPLIT-PATH`](#api-cffi-function-tclfs-split-path_A9F903FFA690548F830A3D0244F2E308)
         1. [CFFI-FUNCTION: `TCL_FSCREATEDIRECTORY`](#api-cffi-function-tclfscreatedirectory_6AF4ADF33E0A2DCB8A8C05A3E56D1A01)
         1. [CFFI-FUNCTION: `TCL_GET-ALIAS-OBJ`](#api-cffi-function-tclget-alias-obj_EDA31E8D717DED9B8247F4A7A7196558)
         1. [CFFI-FUNCTION: `TCL_GET-BYTES-FROM-OBJ`](#api-cffi-function-tclget-bytes-from-obj_A92D0EB19EDBA3546F0B36A0EE6DDD61)
         1. [CFFI-FUNCTION: `TCL_GET-CHAR-LENGTH`](#api-cffi-function-tclget-char-length_89F536D796AFA765EDAA26B575F99ECC)
         1. [CFFI-FUNCTION: `TCL_GET-RANGE`](#api-cffi-function-tclget-range_56FB2FAD59FC437B36DDFF5FFC0C7E01)
         1. [CFFI-FUNCTION: `TCL_GET-STRING-FROM-OBJ`](#api-cffi-function-tclget-string-from-obj_0CE13A6488EACF9CF275F01D5C056920)
         1. [CFFI-FUNCTION: `TCL_GET-UNI-CHAR`](#api-cffi-function-tclget-uni-char_55F93A24C3CCAF15C8CBFE81370C0D74)
         1. [CFFI-FUNCTION: `TCL_GET-UNICODE-FROM-OBJ`](#api-cffi-function-tclget-unicode-from-obj_1AE9E96C46D428D35B58679C5F540587)
         1. [CFFI-FUNCTION: `TCL_LIST-OBJ-GET-ELEMENTS`](#api-cffi-function-tcllist-obj-get-elements_B917A007E923810853D9FF70D408F6FA)
         1. [CFFI-FUNCTION: `TCL_LIST-OBJ-LENGTH`](#api-cffi-function-tcllist-obj-length_E4557D84324DCA4D9FD1729BB967F802)
         1. [CFFI-FUNCTION: `TCL_NUM-UTF-CHARS`](#api-cffi-function-tclnum-utf-chars_C2D1E450DD7B3EDA090F9218A699BE02)
         1. [CFFI-FUNCTION: `TCL_PARSE-ARGS-OBJV`](#api-cffi-function-tclparse-args-objv_8A2B8AF0B1F8F435C3D09DBE45BD84F5)
         1. [CFFI-FUNCTION: `TCL_SPLIT-LIST`](#api-cffi-function-tclsplit-list_4E5F8C543A230760A255AE69238FA9F6)
         1. [CFFI-FUNCTION: `TCL_SPLIT-PATH`](#api-cffi-function-tclsplit-path_41254C7C54E2AEBDAB9465E66DE4814A)
         1. [CFFI-FUNCTION: `TCL_UTF-AT-INDEX`](#api-cffi-function-tclutf-at-index_E760868232BF8C446A89A108925DE3FE)
         1. [CFFI-FUNCTION: `TCL_UTF-CHAR-COMPLETE`](#api-cffi-function-tclutf-char-complete_80A8A4125130335C66EF2E1E73BBC26F)
         1. [CFFI-FUNCTION: `TCL_UTF-NCASECMP`](#api-cffi-function-tclutf-ncasecmp_216CB83D945BD3B13F68940C91FBEEFE)
         1. [CFFI-FUNCTION: `TCL_UTF-NCMP`](#api-cffi-function-tclutf-ncmp_33E9C816399249171FCDE55820EEA34E)
         1. [CFFI-FUNCTION: `TCL_UTF-NEXT`](#api-cffi-function-tclutf-next_784A64A77E61AA09C8934FAB9F4135CD)
         1. [CFFI-FUNCTION: `TCL_UTF-PREV`](#api-cffi-function-tclutf-prev_837C61E63F779E6397FCA3ADDE6CACF3)
         1. [CFFI-FUNCTION: `TK-CREATE-CONSOLE-WINDOW`](#api-cffi-function-tk-create-console-window_53E38A102AEC57E3D606EC36EFB6F470)
         1. [CFFI-FUNCTION: `TK-INIT`](#api-cffi-function-tk-init_AB4CBDDFA845E83CCA52B712B543F44B)
         1. [CFFI-FUNCTION: `TK-MAIN-LOOP`](#api-cffi-function-tk-main-loop_6F29D8537B321BF1B7ECF45F16B5A84D)
         1. [CFFI-FUNCTION: `TK-SAFE-INIT`](#api-cffi-function-tk-safe-init_5165D5293F0FDCBDFDFE342BE8ED6995)
         1. [CFFI-STRUCT: `TCL-ARGV-INFO`](#api-cffi-struct-tcl-argv-info_33E64560CBB5F30EEB138ADBE47A68AA)
         1. [CFFI-STRUCT: `TCL-CALL-FRAME`](#api-cffi-struct-tcl-call-frame_49727D2E3CA6994F9B51B76CF253D4A1)
         1. [CFFI-STRUCT: `TCL-CHANNEL-TYPE`](#api-cffi-struct-tcl-channel-type_644ECB5F4EECCF840521EEF25E24AAEE)
         1. [CFFI-STRUCT: `TCL-CMD-INFO`](#api-cffi-struct-tcl-cmd-info_9365DF6E253E06FABA3A8E19EAF4055E)
         1. [CFFI-STRUCT: `TCL-CONFIG`](#api-cffi-struct-tcl-config_4CCF2F0C21364617A5CA32F83E98449F)
         1. [CFFI-STRUCT: `TCL-D-STRING`](#api-cffi-struct-tcl-d-string_39B84F902F44F27FF3D8C34533B3D020)
         1. [CFFI-STRUCT: `TCL-DICT-SEARCH`](#api-cffi-struct-tcl-dict-search_5826526231384E62251BA1A5624E3154)
         1. [CFFI-STRUCT: `TCL-ENCODING-TYPE`](#api-cffi-struct-tcl-encoding-type_2167FD8F9E6E7AB315B1F0F494E8C3E2)
         1. [CFFI-STRUCT: `TCL-EVENT`](#api-cffi-struct-tcl-event_FEBF69945E1E8A4E3CB2B01A2748DF93)
         1. [CFFI-STRUCT: `TCL-FILESYSTEM`](#api-cffi-struct-tcl-filesystem_5004046EB0F062CF2C31BE278D9FEF2D)
         1. [CFFI-STRUCT: `TCL-GLOB-TYPE-DATA`](#api-cffi-struct-tcl-glob-type-data_0FAFF43E1699D2BD6A42398254AB0ADB)
         1. [CFFI-STRUCT: `TCL-HASH-ENTRY`](#api-cffi-struct-tcl-hash-entry_79E515003DFB21F6CD25A1CA9ACBE03C)
         1. [CFFI-STRUCT: `TCL-HASH-KEY-TYPE`](#api-cffi-struct-tcl-hash-key-type_711B7855F8D752AA282F9A7E4633095C)
         1. [CFFI-STRUCT: `TCL-HASH-SEARCH`](#api-cffi-struct-tcl-hash-search_19015DB2C3B32326F13C27157983A05D)
         1. [CFFI-STRUCT: `TCL-HASH-TABLE`](#api-cffi-struct-tcl-hash-table_8A1E791A608397A157DDE188679BEF63)
         1. [CFFI-STRUCT: `TCL-NAMESPACE`](#api-cffi-struct-tcl-namespace_64844693206AFF93FCC22698BE3A2F63)
         1. [CFFI-STRUCT: `TCL-NOTIFIER-PROCS`](#api-cffi-struct-tcl-notifier-procs_87CE6F9346EA9E1B779DD39CD98A6806)
         1. [CFFI-STRUCT: `TCL-OBJ-INTERNAL-REP/PTR-AND-LONG-REP`](#api-cffi-struct-tcl-obj-internal-repptr-and-long-rep_323BF78B8A8ADD199F3859BEC38E4476)
         1. [CFFI-STRUCT: `TCL-OBJ-INTERNAL-REP/PTR-AND-SIZE`](#api-cffi-struct-tcl-obj-internal-repptr-and-size_8B58CBB2CBBEB9AD0B1394DCC76870F2)
         1. [CFFI-STRUCT: `TCL-OBJ-INTERNAL-REP/TWO-PTR-VALUE`](#api-cffi-struct-tcl-obj-internal-reptwo-ptr-value_34AC3D7E8941D2253BE907AA6F582E39)
         1. [CFFI-STRUCT: `TCL-OBJ-TYPE`](#api-cffi-struct-tcl-obj-type_5999DD0989035B69B87CD8C8D71D1A41)
         1. [CFFI-STRUCT: `TCL-OBJ`](#api-cffi-struct-tcl-obj_974A467D239BA884AF3F575AEBE1567D)
         1. [CFFI-STRUCT: `TCL-PARSE`](#api-cffi-struct-tcl-parse_1E3CA7E39E3D060FEE706FF576EFCE5A)
         1. [CFFI-STRUCT: `TCL-REG-EXP-INDICES`](#api-cffi-struct-tcl-reg-exp-indices_4055BBC023FF564B4207DB1F7AE584A9)
         1. [CFFI-STRUCT: `TCL-REG-EXP-INFO`](#api-cffi-struct-tcl-reg-exp-info_1A7A82FE7D5F64585BC37924BB72A56B)
         1. [CFFI-STRUCT: `TCL-TIME`](#api-cffi-struct-tcl-time_F1DCAB6B5E08BC92452FFD44131CE49F)
         1. [CFFI-STRUCT: `TCL-TOKEN`](#api-cffi-struct-tcl-token_EE4BBE9C916D4845AE6D9F123C1B96AA)
         1. [CFFI-TYPE: `CLIENT-DATA`](#api-cffi-type-client-data_B82E393B433D7D19C0AD98D0169CDEEE)
         1. [CFFI-TYPE: `MP-INT-PTR`](#api-cffi-type-mp-int-ptr_75F8F0E4CE1C7E7F1580B585397898C6)
         1. [CFFI-TYPE: `TCL-ALERT-NOTIFIER-PROC`](#api-cffi-type-tcl-alert-notifier-proc_06F7E70F10B4187BC8E2EC6D80F6B019)
         1. [CFFI-TYPE: `TCL-ALLOC-HASH-ENTRY-PROC`](#api-cffi-type-tcl-alloc-hash-entry-proc_90FE2BF9B1F14143E784722E19A678EB)
         1. [CFFI-TYPE: `TCL-APP-INIT-PROC`](#api-cffi-type-tcl-app-init-proc_5F61D3D06F7D5DB485A59FF14CCD7F5D)
         1. [CFFI-TYPE: `TCL-ARGV-INFO-PTR`](#api-cffi-type-tcl-argv-info-ptr_332B02F7DEF6AE774CAC7FE28BEA7F29)
         1. [CFFI-TYPE: `TCL-ASYNC-HANDLER`](#api-cffi-type-tcl-async-handler_4D578FA3BC26377018B1D049BD896FBD)
         1. [CFFI-TYPE: `TCL-ASYNC-PROC`](#api-cffi-type-tcl-async-proc_7F7E75FAD957614596AA09237DEA48DF)
         1. [CFFI-TYPE: `TCL-CHANNEL-PROC`](#api-cffi-type-tcl-channel-proc_2E60B21986B20B97C4771BC57A9B18AC)
         1. [CFFI-TYPE: `TCL-CHANNEL-TYPE-PTR`](#api-cffi-type-tcl-channel-type-ptr_614EB9E552AC092B9F84F6DBFD43FABA)
         1. [CFFI-TYPE: `TCL-CHANNEL-TYPE-VERSION`](#api-cffi-type-tcl-channel-type-version_B3BAA7B61FDA7654795D6D919B46D211)
         1. [CFFI-TYPE: `TCL-CHANNEL`](#api-cffi-type-tcl-channel_3E299AD1027BFE1DD33DBD79064B008F)
         1. [CFFI-TYPE: `TCL-CLOSE-PROC`](#api-cffi-type-tcl-close-proc_6AA00732812944CB5605B42E13C0FE71)
         1. [CFFI-TYPE: `TCL-CMD-DELETE-PROC`](#api-cffi-type-tcl-cmd-delete-proc_0EAB9B04DF411EEAE515AF8BAF9D1FFC)
         1. [CFFI-TYPE: `TCL-CMD-INFO-PTR`](#api-cffi-type-tcl-cmd-info-ptr_C0133C94D2ABA9C520C5ACBF38F04673)
         1. [CFFI-TYPE: `TCL-CMD-OBJ-TRACE-DELETE-PROC`](#api-cffi-type-tcl-cmd-obj-trace-delete-proc_B0AAB9D94F6D2CD25BD8E5CDCDDBBD50)
         1. [CFFI-TYPE: `TCL-CMD-OBJ-TRACE-PROC2`](#api-cffi-type-tcl-cmd-obj-trace-proc2_C8E6E3F5B1E33588F4BBA7D655C5E65D)
         1. [CFFI-TYPE: `TCL-CMD-OBJ-TRACE-PROC`](#api-cffi-type-tcl-cmd-obj-trace-proc_F0A10C289C903B80C2FAA56A8176E9A1)
         1. [CFFI-TYPE: `TCL-CMD-PROC`](#api-cffi-type-tcl-cmd-proc_54E23DE102094C41FADC01D894322373)
         1. [CFFI-TYPE: `TCL-CMD-TRACE-PROC`](#api-cffi-type-tcl-cmd-trace-proc_9A1C87136E00E8EA0D23F1CFDDA5202E)
         1. [CFFI-TYPE: `TCL-COMMAND-TRACE-PROC`](#api-cffi-type-tcl-command-trace-proc_286F734F7BC9AE8D6FDA1226BC6DFBCF)
         1. [CFFI-TYPE: `TCL-COMMAND`](#api-cffi-type-tcl-command_EE2A410BE8322F9CDA8FA33248DD2799)
         1. [CFFI-TYPE: `TCL-COMPARE-HASH-KEYS-PROC`](#api-cffi-type-tcl-compare-hash-keys-proc_3628D4D3761499621530399E83167577)
         1. [CFFI-TYPE: `TCL-CONDITION-PTR`](#api-cffi-type-tcl-condition-ptr_91CB3BAFEC64201E60F370716F3F7225)
         1. [CFFI-TYPE: `TCL-CONFIG-PTR`](#api-cffi-type-tcl-config-ptr_0FFEA609498947724B25E0CFB3D25FEA)
         1. [CFFI-TYPE: `TCL-CREATE-FILE-HANDLER-PROC`](#api-cffi-type-tcl-create-file-handler-proc_6A25ABD073DB14F280A2D3CE890979AA)
         1. [CFFI-TYPE: `TCL-D-STRING-PTR`](#api-cffi-type-tcl-d-string-ptr_644CA7C165BEE677C8DDBE5B51C1C4D0)
         1. [CFFI-TYPE: `TCL-DELETE-FILE-HANDLER-PROC`](#api-cffi-type-tcl-delete-file-handler-proc_3D565EC0B6DB9D27DD45AFB09EB51AE2)
         1. [CFFI-TYPE: `TCL-DICT-PTR`](#api-cffi-type-tcl-dict-ptr_6EF14458D85D213EE83108FF7DC174D2)
         1. [CFFI-TYPE: `TCL-DICT-SEARCH-PTR`](#api-cffi-type-tcl-dict-search-ptr_62B6A0A16CB5FB6D1250F01E89BBED8B)
         1. [CFFI-TYPE: `TCL-DICT`](#api-cffi-type-tcl-dict_C60AF2D7D221F9F8DBFAE4D9F9D7FC2B)
         1. [CFFI-TYPE: `TCL-DRIVER-BLOCK-MODE-PROC`](#api-cffi-type-tcl-driver-block-mode-proc_BA8210442D5A316835EC06D3FEBFA182)
         1. [CFFI-TYPE: `TCL-DRIVER-CLOSE-PROC`](#api-cffi-type-tcl-driver-close-proc_D687AA52DF7B01F3B1837368B9F74501)
         1. [CFFI-TYPE: `TCL-DRIVER-CLOSE2-PROC`](#api-cffi-type-tcl-driver-close2-proc_1CC6E4F6532304B38524AA59F0BE3A92)
         1. [CFFI-TYPE: `TCL-DRIVER-FLUSH-PROC`](#api-cffi-type-tcl-driver-flush-proc_4EE63572B58A4A8D0D02544DC49E80CE)
         1. [CFFI-TYPE: `TCL-DRIVER-GET-HANDLE-PROC`](#api-cffi-type-tcl-driver-get-handle-proc_5EF079A782AF3DD787F516D5A0A6FA24)
         1. [CFFI-TYPE: `TCL-DRIVER-GET-OPTION-PROC`](#api-cffi-type-tcl-driver-get-option-proc_871575F529691B02A37B1F53FA4E060F)
         1. [CFFI-TYPE: `TCL-DRIVER-HANDLER-PROC`](#api-cffi-type-tcl-driver-handler-proc_E1AEEE2EFFB5FA59FA57C111A3F749D2)
         1. [CFFI-TYPE: `TCL-DRIVER-INPUT-PROC`](#api-cffi-type-tcl-driver-input-proc_2DFC751CA82FB3983A5EC1BA3102256E)
         1. [CFFI-TYPE: `TCL-DRIVER-OUTPUT-PROC`](#api-cffi-type-tcl-driver-output-proc_6351317993DE30692E1EC3808F29347A)
         1. [CFFI-TYPE: `TCL-DRIVER-SEEK-PROC`](#api-cffi-type-tcl-driver-seek-proc_B6A8F3A10C323AEE784BFEB31138B7C2)
         1. [CFFI-TYPE: `TCL-DRIVER-SET-OPTION-PROC`](#api-cffi-type-tcl-driver-set-option-proc_3E2E7330FB2E31B3F3EB104BFD24CC7B)
         1. [CFFI-TYPE: `TCL-DRIVER-THREAD-ACTION-PROC`](#api-cffi-type-tcl-driver-thread-action-proc_98E9D2C88D9329CB04EA08F5F74C63A3)
         1. [CFFI-TYPE: `TCL-DRIVER-TRUNCATE-PROC`](#api-cffi-type-tcl-driver-truncate-proc_B5FCA46D4C6C2940A8FB7A3B92D185ED)
         1. [CFFI-TYPE: `TCL-DRIVER-WATCH-PROC`](#api-cffi-type-tcl-driver-watch-proc_AA79999E8A61DD6355AEA932EBA6B028)
         1. [CFFI-TYPE: `TCL-DRIVER-WIDE-SEEK-PROC`](#api-cffi-type-tcl-driver-wide-seek-proc_CB82CF5131C20FF9BCCDFEC3B1C9524A)
         1. [CFFI-TYPE: `TCL-DUP-INTERNAL-REP-PROC`](#api-cffi-type-tcl-dup-internal-rep-proc_1483E8D164B75FC42E9D4D381A7EA7CD)
         1. [CFFI-TYPE: `TCL-ENCODING-CONVERT-PROC`](#api-cffi-type-tcl-encoding-convert-proc_993DA888A0F45530E8C94AB8AD242563)
         1. [CFFI-TYPE: `TCL-ENCODING-FREE-PROC`](#api-cffi-type-tcl-encoding-free-proc_AEE6B12C64BB1BB8E5D7F158D3E28DC0)
         1. [CFFI-TYPE: `TCL-ENCODING-PTR`](#api-cffi-type-tcl-encoding-ptr_8D2946E891BB8435B76C04FCACC5006D)
         1. [CFFI-TYPE: `TCL-ENCODING-STATE-PTR`](#api-cffi-type-tcl-encoding-state-ptr_8CFE670CCAC042141110A7243172C82A)
         1. [CFFI-TYPE: `TCL-ENCODING-TYPE-PTR`](#api-cffi-type-tcl-encoding-type-ptr_E52BE0959F54395CEA83D29E2B1215FC)
         1. [CFFI-TYPE: `TCL-ENCODING`](#api-cffi-type-tcl-encoding_CE0D69468E6978A947920029677BCA07)
         1. [CFFI-TYPE: `TCL-EVENT-CHECK-PROC`](#api-cffi-type-tcl-event-check-proc_5A1C49CD345911E1C2152FAD0F5E42FC)
         1. [CFFI-TYPE: `TCL-EVENT-DELETE-PROC`](#api-cffi-type-tcl-event-delete-proc_F4C1D465FFAE11645DA3C9C11C577BE9)
         1. [CFFI-TYPE: `TCL-EVENT-PROC`](#api-cffi-type-tcl-event-proc_E647B16C2F7A5A783DDF5C1EB72F9A8B)
         1. [CFFI-TYPE: `TCL-EVENT-PTR`](#api-cffi-type-tcl-event-ptr_53E93ED4B957DEBCB42F2FFDEC258C5A)
         1. [CFFI-TYPE: `TCL-EVENT-SETUP-PROC`](#api-cffi-type-tcl-event-setup-proc_B52EBF0A8A2820C07D37B96524E05F22)
         1. [CFFI-TYPE: `TCL-EXIT-PROC`](#api-cffi-type-tcl-exit-proc_41323AFA5B523ED5158489C4F5D0506E)
         1. [CFFI-TYPE: `TCL-FILE-FREE-PROC`](#api-cffi-type-tcl-file-free-proc_3D8C553E93DE7B61F490D971A1F602A4)
         1. [CFFI-TYPE: `TCL-FILE-PROC`](#api-cffi-type-tcl-file-proc_C99A71B1933C119AB1B0E727E34263CD)
         1. [CFFI-TYPE: `TCL-FILESYSTEM-PTR`](#api-cffi-type-tcl-filesystem-ptr_B28D7757A247BD243BD3317D4A687A73)
         1. [CFFI-TYPE: `TCL-FINALIZE-NOTIFIER-PROC`](#api-cffi-type-tcl-finalize-notifier-proc_DAE731C07FEB8762C390A6554DADD562)
         1. [CFFI-TYPE: `TCL-FREE-HASH-ENTRY-PROC`](#api-cffi-type-tcl-free-hash-entry-proc_F99C24559EF57C492FED94FBA69A4AA5)
         1. [CFFI-TYPE: `TCL-FREE-INTERNAL-REP-PROC`](#api-cffi-type-tcl-free-internal-rep-proc_57D1BDCC7E4D4B640494C157ACDB4455)
         1. [CFFI-TYPE: `TCL-FREE-PROC`](#api-cffi-type-tcl-free-proc_54950AB7FE0B5B244ECCDC86D07B49D1)
         1. [CFFI-TYPE: `TCL-FS-ACCESS-PROC`](#api-cffi-type-tcl-fs-access-proc_6BC4661F1E73788043DF1F4027AAA905)
         1. [CFFI-TYPE: `TCL-FS-CHDIR-PROC`](#api-cffi-type-tcl-fs-chdir-proc_C3175408CEADA90ABF6F1B3919A36C91)
         1. [CFFI-TYPE: `TCL-FS-COPY-DIRECTORY-PROC`](#api-cffi-type-tcl-fs-copy-directory-proc_24DDA17C921DB7BE2AD74E7570483ACB)
         1. [CFFI-TYPE: `TCL-FS-COPY-FILE-PROC`](#api-cffi-type-tcl-fs-copy-file-proc_A445C1376F04B2D460EE61A9288F6832)
         1. [CFFI-TYPE: `TCL-FS-CREATE-DIRECTORY-PROC`](#api-cffi-type-tcl-fs-create-directory-proc_E3E8E25E0BCCED99FB4101BAC5F83463)
         1. [CFFI-TYPE: `TCL-FS-CREATE-INTERNAL-REP-PROC`](#api-cffi-type-tcl-fs-create-internal-rep-proc_344A834D38EF71930466FD23ADD1D05C)
         1. [CFFI-TYPE: `TCL-FS-DELETE-FILE-PROC`](#api-cffi-type-tcl-fs-delete-file-proc_4C2FD4C8F859E7A1D23DEBF4FD46D969)
         1. [CFFI-TYPE: `TCL-FS-DUP-INTERNAL-REP-PROC`](#api-cffi-type-tcl-fs-dup-internal-rep-proc_8B138379796F944C01C31974660E59F0)
         1. [CFFI-TYPE: `TCL-FS-FILE-ATTR-STRINGS-PROC`](#api-cffi-type-tcl-fs-file-attr-strings-proc_331FDDD2855B7705A7254FF625A4620E)
         1. [CFFI-TYPE: `TCL-FS-FILE-ATTRS-GET-PROC`](#api-cffi-type-tcl-fs-file-attrs-get-proc_0821A32CFADA0A0CBEE738488C626362)
         1. [CFFI-TYPE: `TCL-FS-FILE-ATTRS-SET-PROC`](#api-cffi-type-tcl-fs-file-attrs-set-proc_B4B4BC7AFE449C555058F2A30A70B31A)
         1. [CFFI-TYPE: `TCL-FS-FILESYSTEM-PATH-TYPE-PROC`](#api-cffi-type-tcl-fs-filesystem-path-type-proc_38B99128ACCBAE172CEA25B4D74CC2FE)
         1. [CFFI-TYPE: `TCL-FS-FILESYSTEM-SEPARATOR-PROC`](#api-cffi-type-tcl-fs-filesystem-separator-proc_A24601BE1E1591D23DF3A27A24671495)
         1. [CFFI-TYPE: `TCL-FS-FREE-INTERNAL-REP-PROC`](#api-cffi-type-tcl-fs-free-internal-rep-proc_B48B9F184482B73B0752C1C88BA0D0D0)
         1. [CFFI-TYPE: `TCL-FS-GET-CWD-PROC`](#api-cffi-type-tcl-fs-get-cwd-proc_E7EAA02B1873CA41AC42C18DEB1A7514)
         1. [CFFI-TYPE: `TCL-FS-INTERNAL-TO-NORMALIZED-PROC`](#api-cffi-type-tcl-fs-internal-to-normalized-proc_416C62532373B384F2C504CE40CE68C2)
         1. [CFFI-TYPE: `TCL-FS-LINK-PROC`](#api-cffi-type-tcl-fs-link-proc_4E1F81B9FB5659AAA215D6C9D6E513A2)
         1. [CFFI-TYPE: `TCL-FS-LIST-VOLUMES-PROC`](#api-cffi-type-tcl-fs-list-volumes-proc_8D0528692E4C8C3A872118C7854C5479)
         1. [CFFI-TYPE: `TCL-FS-LOAD-FILE-PROC`](#api-cffi-type-tcl-fs-load-file-proc_8E9646A375C03A3C62058AD8F48CAE3E)
         1. [CFFI-TYPE: `TCL-FS-LSTAT-PROC`](#api-cffi-type-tcl-fs-lstat-proc_3A95C36147D5F48AC7480B740DDF207A)
         1. [CFFI-TYPE: `TCL-FS-MATCH-IN-DIRECTORY-PROC`](#api-cffi-type-tcl-fs-match-in-directory-proc_B4271EA5DE2C2D1A5723D229145B99C7)
         1. [CFFI-TYPE: `TCL-FS-NORMALIZE-PATH-PROC`](#api-cffi-type-tcl-fs-normalize-path-proc_719F26FAF0FCEA6A67B5A580891BD469)
         1. [CFFI-TYPE: `TCL-FS-OPEN-FILE-CHANNEL-PROC`](#api-cffi-type-tcl-fs-open-file-channel-proc_F7B14A9DF1BD1B5F85A10BE82D54BAAF)
         1. [CFFI-TYPE: `TCL-FS-PATH-IN-FILESYSTEM-PROC`](#api-cffi-type-tcl-fs-path-in-filesystem-proc_192176CFC02D570B61241CDF829C818B)
         1. [CFFI-TYPE: `TCL-FS-REMOVE-DIRECTORY-PROC`](#api-cffi-type-tcl-fs-remove-directory-proc_491F7B3538FAF3295030851BD8DE7E90)
         1. [CFFI-TYPE: `TCL-FS-RENAME-FILE-PROC`](#api-cffi-type-tcl-fs-rename-file-proc_6CC65A9653A0859E94B3078975575F79)
         1. [CFFI-TYPE: `TCL-FS-STAT-PROC`](#api-cffi-type-tcl-fs-stat-proc_B31A247EFA3115B96195DDFC9C09ACE7)
         1. [CFFI-TYPE: `TCL-FS-UNLOAD-FILE-PROC`](#api-cffi-type-tcl-fs-unload-file-proc_B87B7A1C98E4C8BF939337000FE73DFB)
         1. [CFFI-TYPE: `TCL-FS-UNLOAD-FILE-PROC`](#api-cffi-type-tcl-fs-unload-file-proc_B87B7A1C98E4C8BF939337000FE73DFB)
         1. [CFFI-TYPE: `TCL-FS-UTIME-PROC`](#api-cffi-type-tcl-fs-utime-proc_2E0DB820707053C82EC59045779C3B56)
         1. [CFFI-TYPE: `TCL-FS-VERSION`](#api-cffi-type-tcl-fs-version_F0F331CFB82EA73B361696253D1BBC68)
         1. [CFFI-TYPE: `TCL-GET-TIME-PROC`](#api-cffi-type-tcl-get-time-proc_73F65C70135736CEAD2568781089A1FE)
         1. [CFFI-TYPE: `TCL-GLOB-TYPE-DATA-PTR`](#api-cffi-type-tcl-glob-type-data-ptr_1CB187BDD5DE231779CFFCFCB6E5F6E9)
         1. [CFFI-TYPE: `TCL-HASH-ENTRY-PTR`](#api-cffi-type-tcl-hash-entry-ptr_8A918A65D5F3FB9B6A31DF32F63259D8)
         1. [CFFI-TYPE: `TCL-HASH-KEY-PROC`](#api-cffi-type-tcl-hash-key-proc_E869E0765854CD3E4E330F03B0520E1C)
         1. [CFFI-TYPE: `TCL-HASH-KEY-TYPE-PTR`](#api-cffi-type-tcl-hash-key-type-ptr_682FE13083B33EF59E22DE13D47F3582)
         1. [CFFI-TYPE: `TCL-HASH-SEARCH-PTR`](#api-cffi-type-tcl-hash-search-ptr_4430C5037FCB0D69DB977B604D58A9ED)
         1. [CFFI-TYPE: `TCL-HASH-TABLE-PTR`](#api-cffi-type-tcl-hash-table-ptr_0C7B796FBE23B42F5FA10332D7C10949)
         1. [CFFI-TYPE: `TCL-HASH-TYPE`](#api-cffi-type-tcl-hash-type_BAEF3082902670CBD8CFE59D7D37A813)
         1. [CFFI-TYPE: `TCL-IDLE-PROC`](#api-cffi-type-tcl-idle-proc_D77E01E100B8A8874FBB3AB07737D428)
         1. [CFFI-TYPE: `TCL-INIT-NOTIFIER-PROC`](#api-cffi-type-tcl-init-notifier-proc_468D6D696027DE1BF21E5C5CB82872E8)
         1. [CFFI-TYPE: `TCL-INTERP-DELETE-PROC`](#api-cffi-type-tcl-interp-delete-proc_8CEEACF87C243922B3EBDE1DA379CA88)
         1. [CFFI-TYPE: `TCL-INTERP-PTR`](#api-cffi-type-tcl-interp-ptr_65AD6F9977BABAE12E24BE7C0A631918)
         1. [CFFI-TYPE: `TCL-INTERP-STATE`](#api-cffi-type-tcl-interp-state_761A7BDC21AB9FBE5EBEE1CB9B62E0F5)
         1. [CFFI-TYPE: `TCL-LIBRARY-INIT-PROC`](#api-cffi-type-tcl-library-init-proc_F28694408BEBEE8601D48F7ECB3461F1)
         1. [CFFI-TYPE: `TCL-LIBRARY-UNLOAD-PROC`](#api-cffi-type-tcl-library-unload-proc_3C35ACD26065AECBE56F37E45A307380)
         1. [CFFI-TYPE: `TCL-LIMIT-HANDLER-DELETE-PROC`](#api-cffi-type-tcl-limit-handler-delete-proc_F047590C6B758EF6DF96FBF97718826C)
         1. [CFFI-TYPE: `TCL-LIMIT-HANDLER-PROC`](#api-cffi-type-tcl-limit-handler-proc_5B52436C2880C1000B0B82FD20FA0E3A)
         1. [CFFI-TYPE: `TCL-LOAD-HANDLE-PTR`](#api-cffi-type-tcl-load-handle-ptr_05AD3DA980F88240802120CB41BB6CCD)
         1. [CFFI-TYPE: `TCL-LOAD-HANDLE`](#api-cffi-type-tcl-load-handle_CE4F65D0671E1C0809A4E0EAD6FF42F9)
         1. [CFFI-TYPE: `TCL-MAIN-LOOP-PROC`](#api-cffi-type-tcl-main-loop-proc_8905DF0BBE7E7C9F2F16FF2D5389A0F8)
         1. [CFFI-TYPE: `TCL-MATH-PROC`](#api-cffi-type-tcl-math-proc_D493AA18709C9060C00DDA55A13A701D)
         1. [CFFI-TYPE: `TCL-MUTEX-PTR`](#api-cffi-type-tcl-mutex-ptr_0EAA12FD58EB7B221F4473214BCB9EFC)
         1. [CFFI-TYPE: `TCL-NAMESPACE-DELETE-PROC`](#api-cffi-type-tcl-namespace-delete-proc_645A95FB36DE05FBCACC7B7831E48F04)
         1. [CFFI-TYPE: `TCL-NAMESPACE-PTR`](#api-cffi-type-tcl-namespace-ptr_9185B329F7363310D8A0006CDDD1277D)
         1. [CFFI-TYPE: `TCL-NOTIFIER-PROCS-PTR`](#api-cffi-type-tcl-notifier-procs-ptr_FE3A668A88F96CE9C3D5B5246A895558)
         1. [CFFI-TYPE: `TCL-NR-POST-PROC`](#api-cffi-type-tcl-nr-post-proc_D25C193060D35B7E6D12305A3FDC2B9E)
         1. [CFFI-TYPE: `TCL-OBJ-CMD-PROC2`](#api-cffi-type-tcl-obj-cmd-proc2_6D6331D23D0F6D8145D655629FACCA0F)
         1. [CFFI-TYPE: `TCL-OBJ-CMD-PROC`](#api-cffi-type-tcl-obj-cmd-proc_9CC44ED2827011D440997670860C6FD6)
         1. [CFFI-TYPE: `TCL-OBJ-INTERNAL-REP-PTR`](#api-cffi-type-tcl-obj-internal-rep-ptr_118D2C106EDD116C7093ED598C6C631F)
         1. [CFFI-TYPE: `TCL-OBJ-PTR`](#api-cffi-type-tcl-obj-ptr_16AEDB4D44EF9B33DB378BF37750610D)
         1. [CFFI-TYPE: `TCL-OBJ-TYPE-GET-ELEMENTS`](#api-cffi-type-tcl-obj-type-get-elements_19220EF3966F9FBFB7472E14EC6BD17C)
         1. [CFFI-TYPE: `TCL-OBJ-TYPE-IN-OPERATOR-PROC`](#api-cffi-type-tcl-obj-type-in-operator-proc_D76206E799C6EFE9871DD4AE73C096EA)
         1. [CFFI-TYPE: `TCL-OBJ-TYPE-INDEX-PROC`](#api-cffi-type-tcl-obj-type-index-proc_6D55C4B0FB58BF8A3FC80CEE03962C87)
         1. [CFFI-TYPE: `TCL-OBJ-TYPE-LENGTH-PROC`](#api-cffi-type-tcl-obj-type-length-proc_359E7C8A89FDE5BE4066B694A3A78012)
         1. [CFFI-TYPE: `TCL-OBJ-TYPE-PTR`](#api-cffi-type-tcl-obj-type-ptr_706CDD544D8E1080C0DE92BDD9C903D4)
         1. [CFFI-TYPE: `TCL-OBJ-TYPE-REPLACE-PROC`](#api-cffi-type-tcl-obj-type-replace-proc_42047E0254035654497644C973CA9C3C)
         1. [CFFI-TYPE: `TCL-OBJ-TYPE-REVERSE-PROC`](#api-cffi-type-tcl-obj-type-reverse-proc_E4083DC76FCA5051EDC4DC698316CA59)
         1. [CFFI-TYPE: `TCL-OBJ-TYPE-SET-ELEMENT`](#api-cffi-type-tcl-obj-type-set-element_9968D413F6E9A10945DD4B81322A9A8C)
         1. [CFFI-TYPE: `TCL-OBJ-TYPE-SLICE-PROC`](#api-cffi-type-tcl-obj-type-slice-proc_12DA327EAC43FD7E3D33BC0F7A8114DD)
         1. [CFFI-TYPE: `TCL-PACKAGE-INIT-PROC`](#api-cffi-type-tcl-package-init-proc_8B221263E3FC2C5D2879B946C93CCCAB)
         1. [CFFI-TYPE: `TCL-PANIC-PROC`](#api-cffi-type-tcl-panic-proc_63BF350550023CE7711BF3B86549A9B1)
         1. [CFFI-TYPE: `TCL-PARSE-PTR`](#api-cffi-type-tcl-parse-ptr_8F890C3CDCFFCCB5DBBC16ECA8955F6B)
         1. [CFFI-TYPE: `TCL-PID-PTR`](#api-cffi-type-tcl-pid-ptr_C48B17834B60C71CED7ACB8D47D2B018)
         1. [CFFI-TYPE: `TCL-PID`](#api-cffi-type-tcl-pid_F94F78179FD897EF2E2CAED7041B57F0)
         1. [CFFI-TYPE: `TCL-REG-EXP-INDICES-PTR`](#api-cffi-type-tcl-reg-exp-indices-ptr_E0EA8060B164865832C35F794815A754)
         1. [CFFI-TYPE: `TCL-REG-EXP-INFO-PTR`](#api-cffi-type-tcl-reg-exp-info-ptr_8C7DF9E0FA11C75BC78C16A034862812)
         1. [CFFI-TYPE: `TCL-REG-EXP`](#api-cffi-type-tcl-reg-exp_9B3237079576349B792C6B450C8096FF)
         1. [CFFI-TYPE: `TCL-SAVED-RESULT-PTR`](#api-cffi-type-tcl-saved-result-ptr_0A96401A4B0C310296943F5B6DDF013A)
         1. [CFFI-TYPE: `TCL-SCALE-TIME-PROC`](#api-cffi-type-tcl-scale-time-proc_B421E3CC31034E610CB35AC7CD854412)
         1. [CFFI-TYPE: `TCL-SERVICE-MODE-HOOK-PROC`](#api-cffi-type-tcl-service-mode-hook-proc_F007F8C8EDC805F893DCC4A0CFA54026)
         1. [CFFI-TYPE: `TCL-SET-FROM-ANY-PROC`](#api-cffi-type-tcl-set-from-any-proc_3A48C1B3E32E5C9FBFA921EB1A91EEB9)
         1. [CFFI-TYPE: `TCL-SET-TIMER-PROC`](#api-cffi-type-tcl-set-timer-proc_A26A5EEECDCD07D30C28695AA70D2781)
         1. [CFFI-TYPE: `TCL-SIZE-PTR`](#api-cffi-type-tcl-size-ptr_CFCE6B802932E1E820C885DBD5D5F573)
         1. [CFFI-TYPE: `TCL-SIZE`](#api-cffi-type-tcl-size_8FD21B10CA520889D5078CF1058E0837)
         1. [CFFI-TYPE: `TCL-STAT-BUF-PTR`](#api-cffi-type-tcl-stat-buf-ptr_A624A3381DA93A439FA8B05EB6C848C7)
         1. [CFFI-TYPE: `TCL-TCP-ACCEPT-PROC`](#api-cffi-type-tcl-tcp-accept-proc_94451C19A7306D4BE89FD9EF61747CB2)
         1. [CFFI-TYPE: `TCL-THREAD-CREATE-PROC`](#api-cffi-type-tcl-thread-create-proc_3C5E6C870EC82BF43ECEF84DB8CD9EE6)
         1. [CFFI-TYPE: `TCL-THREAD-DATA-KEY-PTR`](#api-cffi-type-tcl-thread-data-key-ptr_8E8355EC8692C3831A9847760B1BFC0B)
         1. [CFFI-TYPE: `TCL-THREAD-ID-PTR`](#api-cffi-type-tcl-thread-id-ptr_CA99670D9BB2541DCB6C49C407F6DF4E)
         1. [CFFI-TYPE: `TCL-THREAD-ID`](#api-cffi-type-tcl-thread-id_3A614D7F14C71759E2B226607D07735B)
         1. [CFFI-TYPE: `TCL-TIME-PTR`](#api-cffi-type-tcl-time-ptr_B6544038AFA7886B9385DD1FB2BF8D01)
         1. [CFFI-TYPE: `TCL-TIMER-PROC`](#api-cffi-type-tcl-timer-proc_07AF44DDE5CCF1D8DE9FFDCE300EADE1)
         1. [CFFI-TYPE: `TCL-TIMER-TOKEN`](#api-cffi-type-tcl-timer-token_D83D16012E4336099E5BE5901D27D410)
         1. [CFFI-TYPE: `TCL-TOKEN-PTR`](#api-cffi-type-tcl-token-ptr_0FEF797F23356A83C254AD7C4613F28A)
         1. [CFFI-TYPE: `TCL-TRACE`](#api-cffi-type-tcl-trace_FEC3ED385B6FBB5AA73974FFA8211646)
         1. [CFFI-TYPE: `TCL-UNI-CHAR-PTR`](#api-cffi-type-tcl-uni-char-ptr_84E09288539040FD47CA8A663A105A79)
         1. [CFFI-TYPE: `TCL-UNI-CHAR`](#api-cffi-type-tcl-uni-char_FD1A0FF2A3BB8AFCD30569D03658F8B3)
         1. [CFFI-TYPE: `TCL-UNI-CHAR`](#api-cffi-type-tcl-uni-char_FD1A0FF2A3BB8AFCD30569D03658F8B3)
         1. [CFFI-TYPE: `TCL-UPDATE-STRING-PROC`](#api-cffi-type-tcl-update-string-proc_0D0A6DC2068A47F8746941B9A78DB577)
         1. [CFFI-TYPE: `TCL-VALUE-TYPE-PTR`](#api-cffi-type-tcl-value-type-ptr_E4E16D89BC70D515A405819245554CB7)
         1. [CFFI-TYPE: `TCL-VAR-TRACE-PROC`](#api-cffi-type-tcl-var-trace-proc_B201316403E075777A47E17534810695)
         1. [CFFI-TYPE: `TCL-VAR`](#api-cffi-type-tcl-var_C8DF8B485AC816F287BA6706475206E4)
         1. [CFFI-TYPE: `TCL-WAIT-FOR-EVENT-PROC`](#api-cffi-type-tcl-wait-for-event-proc_8D81350DD65FFE9B596D026DAF12552B)
         1. [CFFI-TYPE: `TCL-WIDE-INT`](#api-cffi-type-tcl-wide-int_E03D4CB3D5B35C80F8A6D0B51B1845E5)
         1. [CFFI-TYPE: `TCL-WIDE-INT`](#api-cffi-type-tcl-wide-int_E03D4CB3D5B35C80F8A6D0B51B1845E5)
         1. [CFFI-TYPE: `TCL-WIDE-UINT`](#api-cffi-type-tcl-wide-uint_BA33A99DB7E7F36DB46C063EE3AAB75D)
         1. [CFFI-TYPE: `TCL-WIDE-UINT`](#api-cffi-type-tcl-wide-uint_BA33A99DB7E7F36DB46C063EE3AAB75D)
         1. [CFFI-TYPE: `TCL-ZLIB-STREAM-PTR`](#api-cffi-type-tcl-zlib-stream-ptr_8A598472121059B8C4B8A67220726629)
         1. [CFFI-UNION: `TCL-HASH-ENTRY/KEY`](#api-cffi-union-tcl-hash-entrykey_34CDF83626DA2474F26ABD4D3D0658D9)
         1. [CFFI-UNION: `TCL-OBJ-INTERNAL-REP`](#api-cffi-union-tcl-obj-internal-rep_1ED057FDAD7A780B060ADB6ADB7F85D0)
         1. [CLASS: `TCL-ARGV-INFO-TCLASS`](#api-class-tcl-argv-info-tclass_AB28DFB41462E89F67E8D309046A5624)
         1. [CLASS: `TCL-CALL-FRAME-TCLASS`](#api-class-tcl-call-frame-tclass_4CB18C45613A7654960E9D1D7C5066DF)
         1. [CLASS: `TCL-CHANNEL-TYPE-TCLASS`](#api-class-tcl-channel-type-tclass_CA50F920284694AA3C689BA20207A282)
         1. [CLASS: `TCL-CMD-INFO-TCLASS`](#api-class-tcl-cmd-info-tclass_8060827B13FD83B66C67282DE2091E8A)
         1. [CLASS: `TCL-CONFIG-TCLASS`](#api-class-tcl-config-tclass_FC0FF94CBD711AC9A83061D22334D2D3)
         1. [CLASS: `TCL-D-STRING-TCLASS`](#api-class-tcl-d-string-tclass_4ED16CF0955924C7586F484B0DF3E39F)
         1. [CLASS: `TCL-DICT-SEARCH-TCLASS`](#api-class-tcl-dict-search-tclass_78696FBBBFE565DED34E79C264C17BF7)
         1. [CLASS: `TCL-ENCODING-TYPE-TCLASS`](#api-class-tcl-encoding-type-tclass_F64EC6DB5BB44FBE7F319710246AA9EB)
         1. [CLASS: `TCL-EVENT-TCLASS`](#api-class-tcl-event-tclass_FA44C16DC986730E00EBA5E432FE482D)
         1. [CLASS: `TCL-FILESYSTEM-TCLASS`](#api-class-tcl-filesystem-tclass_E63B0700C958BC08CAD0AE93C35962DE)
         1. [CLASS: `TCL-GLOB-TYPE-DATA-TCLASS`](#api-class-tcl-glob-type-data-tclass_3CEB8ADA256027730308A82CE0A77DD0)
         1. [CLASS: `TCL-HASH-ENTRY-TCLASS`](#api-class-tcl-hash-entry-tclass_F1AB7F7E63FF8B527451EFF70C23AFBE)
         1. [CLASS: `TCL-HASH-KEY-TYPE-TCLASS`](#api-class-tcl-hash-key-type-tclass_6A6E3CFC233C25A16D4EE328421E34BA)
         1. [CLASS: `TCL-HASH-SEARCH-TCLASS`](#api-class-tcl-hash-search-tclass_FC73B65E4F387385F2D69F1B1E75369B)
         1. [CLASS: `TCL-HASH-TABLE-TCLASS`](#api-class-tcl-hash-table-tclass_7206B7C5512982726B69ADAEE2BE193A)
         1. [CLASS: `TCL-NAMESPACE-TCLASS`](#api-class-tcl-namespace-tclass_1EA9A432F25F9310B57D3C07B2E9A4EC)
         1. [CLASS: `TCL-NOTIFIER-PROCS-TCLASS`](#api-class-tcl-notifier-procs-tclass_11D67D1349A0720C7A4615F13579928C)
         1. [CLASS: `TCL-OBJ-INTERNAL-REP/PTR-AND-LONG-REP-TCLASS`](#api-class-tcl-obj-internal-repptr-and-long-rep-tclass_788B99DBD599FE414BEFFD4E3BC1DA89)
         1. [CLASS: `TCL-OBJ-INTERNAL-REP/PTR-AND-SIZE-TCLASS`](#api-class-tcl-obj-internal-repptr-and-size-tclass_65385EB8F5F228E6B8500413AF707335)
         1. [CLASS: `TCL-OBJ-INTERNAL-REP/TWO-PTR-VALUE-TCLASS`](#api-class-tcl-obj-internal-reptwo-ptr-value-tclass_AFB3F25132FC7D131F5AEB258A1B3043)
         1. [CLASS: `TCL-OBJ-TCLASS`](#api-class-tcl-obj-tclass_F217059EB49CC12286CD2107E1B414D5)
         1. [CLASS: `TCL-OBJ-TYPE-TCLASS`](#api-class-tcl-obj-type-tclass_E2DE9D4DDADDA25F6968999244C382A0)
         1. [CLASS: `TCL-PARSE-TCLASS`](#api-class-tcl-parse-tclass_7B3FF8689E587C7C77C46432CE868A08)
         1. [CLASS: `TCL-REG-EXP-INDICES-TCLASS`](#api-class-tcl-reg-exp-indices-tclass_5C77D07CE7C641D2DC9B88A56CA33D8A)
         1. [CLASS: `TCL-REG-EXP-INFO-TCLASS`](#api-class-tcl-reg-exp-info-tclass_BFADA7896840F38E0471FC20ED0C281A)
         1. [CLASS: `TCL-TIME-TCLASS`](#api-class-tcl-time-tclass_04C83CE09DEEEC02E3495C29BC859B44)
         1. [CLASS: `TCL-TOKEN-TCLASS`](#api-class-tcl-token-tclass_198FD22C13CFEA5C5A43940F016F1C10)
         1. [FUNCTION: `%TCL-ADD-ERROR-INFO`](#api-function-tcl-add-error-info_E230650BC793ADB3BCFCD6F315878658)
         1. [FUNCTION: `%TCL-ADD-OBJ-ERROR-INFO`](#api-function-tcl-add-obj-error-info_9BD9558F64BEF48AF8BC8E469B6462DD)
         1. [FUNCTION: `%TCL-BACKGROUND-ERROR`](#api-function-tcl-background-error_FFC511BAA275FFF2011A4E9F15538042)
         1. [FUNCTION: `%TCL-BACKSLASH`](#api-function-tcl-backslash_CA4967B455B84521215669D90186F7D5)
         1. [FUNCTION: `%TCL-CLOSE`](#api-function-tcl-close_42DD13BE5D5BE372C9CBAFB80A4B3E93)
         1. [FUNCTION: `%TCL-CREATE-MATH-FUNC`](#api-function-tcl-create-math-func_9FD3F78F9E5CACD9DFF61FDBD40B49DD)
         1. [FUNCTION: `%TCL-DB-NEW-BOOLEAN-OBJ`](#api-function-tcl-db-new-boolean-obj_581BAB599CE264F5FE622600B4B1DDD5)
         1. [FUNCTION: `%TCL-DB-NEW-LONG-OBJ`](#api-function-tcl-db-new-long-obj_81D68DBAE13C66419AA5117E595EBBC4)
         1. [FUNCTION: `%TCL-DISCARD-RESULT`](#api-function-tcl-discard-result_A4C1B3C696BA1952DBC82E470E539BDD)
         1. [FUNCTION: `%TCL-EVAL-OBJ`](#api-function-tcl-eval-obj_2B0C061DE0CF3FB9F9C283F67C4FC7BB)
         1. [FUNCTION: `%TCL-EVAL`](#api-function-tcl-eval_19716AAA096EC24D284E891557DCABF7)
         1. [FUNCTION: `%TCL-FIND-EXECUTABLE`](#api-function-tcl-find-executable_2B33D340C35FF4CEA10E1CC2E9422AB9)
         1. [FUNCTION: `%TCL-FREE-RESULT`](#api-function-tcl-free-result_02FAFF2976E6C3EE33B8590DFD0143F6)
         1. [FUNCTION: `%TCL-GET-ALIAS`](#api-function-tcl-get-alias_FF10214225E926E25409064637360D4A)
         1. [FUNCTION: `%TCL-GET-BYTE-ARRAY-FROM-OBJ`](#api-function-tcl-get-byte-array-from-obj_A95C2F4C211065DBC8248F416A87082E)
         1. [FUNCTION: `%TCL-GET-INDEX-FROM-OBJ`](#api-function-tcl-get-index-from-obj_3A5DB5A730436A4978509FA8CE9B2713)
         1. [FUNCTION: `%TCL-GET-STRING-RESULT`](#api-function-tcl-get-string-result_432149E5779229DC97B4EE8E877DF77E)
         1. [FUNCTION: `%TCL-GET-VAR`](#api-function-tcl-get-var_8258F599DE4B505BEAF1B6FA280129A3)
         1. [FUNCTION: `%TCL-GLOBAL-EVAL-OBJ`](#api-function-tcl-global-eval-obj_5F3694E7999D70DDB9D9BA933156424C)
         1. [FUNCTION: `%TCL-GLOBAL-EVAL`](#api-function-tcl-global-eval_9E8AF2E1A274ED328E314C21D134BA09)
         1. [FUNCTION: `%TCL-MAKE-SAFE`](#api-function-tcl-make-safe_CBE43B668E4D38AC41B8674B8C3043A0)
         1. [FUNCTION: `%TCL-NEW-BOOLEAN-OBJ`](#api-function-tcl-new-boolean-obj_A33CFCF45C4AB0AE6B72CD70370CFB3D)
         1. [FUNCTION: `%TCL-NEW-INT-OBJ`](#api-function-tcl-new-int-obj_B87BDD6B13B0B9E05CAB8822B5C66F16)
         1. [FUNCTION: `%TCL-NEW-LONG-OBJ`](#api-function-tcl-new-long-obj_255E4A4D46CD1D5129EE448EC2ED1392)
         1. [FUNCTION: `%TCL-PKG-PRESENT`](#api-function-tcl-pkg-present_70A2DA6D7B3C3D646BEA44B3157FF095)
         1. [FUNCTION: `%TCL-PKG-PROVIDE`](#api-function-tcl-pkg-provide_05DEB6D2C8ACB9CD5A084481318AD5DC)
         1. [FUNCTION: `%TCL-PKG-REQUIRE`](#api-function-tcl-pkg-require_9D1992E67A9BFA4B624B17BC96F0A2AD)
         1. [FUNCTION: `%TCL-SEEK-OLD`](#api-function-tcl-seek-old_7166E35DE38F662DFAFE5C06D35315A4)
         1. [FUNCTION: `%TCL-SET-BOOLEAN-OBJ`](#api-function-tcl-set-boolean-obj_1EEADFE0F8DBDE4A5D563ADAA5B2DD01)
         1. [FUNCTION: `%TCL-SET-INT-OBJ`](#api-function-tcl-set-int-obj_F491989BE32589CB1FB1533B19277AD1)
         1. [FUNCTION: `%TCL-SET-LONG-OBJ`](#api-function-tcl-set-long-obj_9EF7BD021C8CA42B67D8602B339B7D70)
         1. [FUNCTION: `%TCL-SET-PANIC-PROC`](#api-function-tcl-set-panic-proc_8E354BB02301291BC73189784A780D68)
         1. [FUNCTION: `%TCL-SET-RESULT`](#api-function-tcl-set-result_5702C4B5DDB541FF8BAFC7C5F5096E82)
         1. [FUNCTION: `%TCL-SET-VAR`](#api-function-tcl-set-var_518505C60AD21637075D6759D0255AE7)
         1. [FUNCTION: `%TCL-STATIC-PACKAGE`](#api-function-tcl-static-package_4BDD2E34EF7D3ADA66FC4D6295F1FFF1)
         1. [FUNCTION: `%TCL-STRING-MATCH`](#api-function-tcl-string-match_12BE216854F446BB5446C8CF6F7B89B0)
         1. [FUNCTION: `%TCL-TELL-OLD`](#api-function-tcl-tell-old_1A2872E174059866A7B41CBDFC329972)
         1. [FUNCTION: `%TCL-TRACE-VAR`](#api-function-tcl-trace-var_8C03583A24DCBC359304873CD10CD064)
         1. [FUNCTION: `%TCL-UNSET-VAR`](#api-function-tcl-unset-var_D0FB379627076E05929DFEEEB0371F21)
         1. [FUNCTION: `%TCL-UNTRACE-VAR`](#api-function-tcl-untrace-var_6517CFDBBA4CE5B90024860F613CDA98)
         1. [FUNCTION: `%TCL-UP-VAR`](#api-function-tcl-up-var_14EAACA8AB20936B4F394A49FC3270D3)
         1. [FUNCTION: `%TCL_VARTRACEINFO`](#api-function-tclvartraceinfo_AF6CBE598E2FF80CE9DBF71EF544121D)
         1. [FUNCTION: `FIX-ARGV0`](#api-function-fix-argv0_2857A77A521E744EE842B8DFE18037BD)
         1. [FUNCTION: `GET-TCL-UTF-MAX`](#api-function-get-tcl-utf-max_B0BBAA36EAED3027043FF015BBCF31D9)
         1. [FUNCTION: `TCL-ACCESS`](#api-function-tcl-access_6B1AFA44B5BED09B85A0218700FB9870)
         1. [FUNCTION: `TCL-ADD-ERROR-INFO`](#api-function-tcl-add-error-info_E0EF90375F10905A094D569C13FCD646)
         1. [FUNCTION: `TCL-ADD-OBJ-ERROR-INFO`](#api-function-tcl-add-obj-error-info_8BEFC6030ACE17C0843464B1D7E04155)
         1. [FUNCTION: `TCL-ALERT-NOTIFIER`](#api-function-tcl-alert-notifier_F389C270C7C1B237C3DA8F8C84629467)
         1. [FUNCTION: `TCL-ALLOC`](#api-function-tcl-alloc_E103A7E8A460B709C5A10690528A4A86)
         1. [FUNCTION: `TCL-ALLOW-EXCEPTIONS`](#api-function-tcl-allow-exceptions_0C5C985D6CD2443DAFC6ACEFD1AD5C7E)
         1. [FUNCTION: `TCL-APPEND-ALL-OBJ-TYPES`](#api-function-tcl-append-all-obj-types_DBCDE670D5E87447752E3870C3AA2C2E)
         1. [FUNCTION: `TCL-APPEND-ELEMENT`](#api-function-tcl-append-element_4005EFAB5C968D9228EB49D9E90CC697)
         1. [FUNCTION: `TCL-APPEND-EXPORT-LIST`](#api-function-tcl-append-export-list_695C21BADDF6F66ACE880C953C2EA8F4)
         1. [FUNCTION: `TCL-APPEND-FORMAT-TO-OBJ`](#api-function-tcl-append-format-to-obj_FC9DA2D525C23BEAEADC834A2F6C1B2F)
         1. [FUNCTION: `TCL-APPEND-LIMITED-TO-OBJ`](#api-function-tcl-append-limited-to-obj_D5E92C34F75670CA22FA83FC20D1FE3B)
         1. [FUNCTION: `TCL-APPEND-OBJ-TO-ERROR-INFO`](#api-function-tcl-append-obj-to-error-info_94863A3455667DE491EF26D084AD9BC9)
         1. [FUNCTION: `TCL-APPEND-OBJ-TO-OBJ`](#api-function-tcl-append-obj-to-obj_BCB8F53BD535C7EF90F628716431D69F)
         1. [FUNCTION: `TCL-APPEND-TO-OBJ`](#api-function-tcl-append-to-obj_C34F43C7F4D995ED01B75E20A4B8874D)
         1. [FUNCTION: `TCL-APPEND-UNICODE-TO-OBJ`](#api-function-tcl-append-unicode-to-obj_93D8A645BC26B256A6A3FDB341365115)
         1. [FUNCTION: `TCL-ASYNC-CREATE`](#api-function-tcl-async-create_5152A09287CE557CDA28674A088111C8)
         1. [FUNCTION: `TCL-ASYNC-DELETE`](#api-function-tcl-async-delete_F72A81EE14CB7B62AD758A010CD5DF31)
         1. [FUNCTION: `TCL-ASYNC-INVOKE`](#api-function-tcl-async-invoke_3A9BDA6ABB7C063D755B80338942FC4B)
         1. [FUNCTION: `TCL-ASYNC-MARK-FROM-SIGNAL`](#api-function-tcl-async-mark-from-signal_2E47312CAA90B9555459C581ACB3CF29)
         1. [FUNCTION: `TCL-ASYNC-MARK`](#api-function-tcl-async-mark_D12D28A9397E847EA62E1F69D65CCAED)
         1. [FUNCTION: `TCL-ATTEMPT-ALLOC`](#api-function-tcl-attempt-alloc_58165B255F6E1973677C6005AA294453)
         1. [FUNCTION: `TCL-ATTEMPT-DB-CKALLOC`](#api-function-tcl-attempt-db-ckalloc_7C36763740E80AF8075F46C739FB178C)
         1. [FUNCTION: `TCL-ATTEMPT-DB-CKREALLOC`](#api-function-tcl-attempt-db-ckrealloc_1A581985E28562C7B38FAA113C674883)
         1. [FUNCTION: `TCL-ATTEMPT-REALLOC`](#api-function-tcl-attempt-realloc_70067A312CD0F8E7FC9DDBA2E2E44C01)
         1. [FUNCTION: `TCL-ATTEMPT-SET-OBJ-LENGTH`](#api-function-tcl-attempt-set-obj-length_3C9053AE6F7F89F2CDB66D83CD362FB1)
         1. [FUNCTION: `TCL-BACKGROUND-ERROR`](#api-function-tcl-background-error_15755E3BAEEE7E6186E451F0904F73C1)
         1. [FUNCTION: `TCL-BACKGROUND-EXCEPTION`](#api-function-tcl-background-exception_7D3A479CE05753424938A49EF3B00373)
         1. [FUNCTION: `TCL-BAD-CHANNEL-OPTION`](#api-function-tcl-bad-channel-option_8CAFEB26EA08B26311B263F7DD31D938)
         1. [FUNCTION: `TCL-BOUNCE-REF-COUNT`](#api-function-tcl-bounce-ref-count_28AB89A27D4F9E23669AB87BA4914759)
         1. [FUNCTION: `TCL-CALL-WHEN-DELETED`](#api-function-tcl-call-when-deleted_E62481CA0FD1B108D82B8275EFEC9E71)
         1. [FUNCTION: `TCL-CANCEL-EVAL`](#api-function-tcl-cancel-eval_7455C0DAEE29E919FE53242ED21ACCF9)
         1. [FUNCTION: `TCL-CANCEL-IDLE-CALL`](#api-function-tcl-cancel-idle-call_4BFFF81BB69219581FE059BB1807DD36)
         1. [FUNCTION: `TCL-CANCELED`](#api-function-tcl-canceled_25D0A624FCE49990F1A1A396CE09A502)
         1. [FUNCTION: `TCL-CHANNEL-BLOCK-MODE-PROC`](#api-function-tcl-channel-block-mode-proc_5FCDFA2B0731C5D2955FD693BA4F1D94)
         1. [FUNCTION: `TCL-CHANNEL-BUFFERED`](#api-function-tcl-channel-buffered_A8369D63C6C65EAFE5351CFE6C44C07A)
         1. [FUNCTION: `TCL-CHANNEL-CLOSE2-PROC`](#api-function-tcl-channel-close2-proc_3AE3DAD62F2B4EF0C2C607A08E67DA42)
         1. [FUNCTION: `TCL-CHANNEL-FLUSH-PROC`](#api-function-tcl-channel-flush-proc_5DE652B758EDDF82E982B1A52AABA930)
         1. [FUNCTION: `TCL-CHANNEL-GET-HANDLE-PROC`](#api-function-tcl-channel-get-handle-proc_4DF26BB619FE90FB1995FAA450577667)
         1. [FUNCTION: `TCL-CHANNEL-GET-OPTION-PROC`](#api-function-tcl-channel-get-option-proc_3827427FA6647487DC0F5CB808CCFD8A)
         1. [FUNCTION: `TCL-CHANNEL-HANDLER-PROC`](#api-function-tcl-channel-handler-proc_ABB21FE6EFEE7390CC717770283D658B)
         1. [FUNCTION: `TCL-CHANNEL-INPUT-PROC`](#api-function-tcl-channel-input-proc_65531066AA923520D1303477A2A461CC)
         1. [FUNCTION: `TCL-CHANNEL-NAME`](#api-function-tcl-channel-name_C6CC6C07CDD2D5BFC725D97AE4B78C39)
         1. [FUNCTION: `TCL-CHANNEL-OUTPUT-PROC`](#api-function-tcl-channel-output-proc_1A2C44F45D8C4F3CDC7E4E59A4FDA900)
         1. [FUNCTION: `TCL-CHANNEL-SET-OPTION-PROC`](#api-function-tcl-channel-set-option-proc_D21710C3F48FE22E01428AB3AC1E7484)
         1. [FUNCTION: `TCL-CHANNEL-THREAD-ACTION-PROC`](#api-function-tcl-channel-thread-action-proc_E41563CB703DEECB406C64EEED4813D9)
         1. [FUNCTION: `TCL-CHANNEL-TRUNCATE-PROC`](#api-function-tcl-channel-truncate-proc_B2277CB7FBDAE21F8B19C8FAF8D8E49B)
         1. [FUNCTION: `TCL-CHANNEL-VERSION`](#api-function-tcl-channel-version_90AFD02BE1A49DAA8BA07CF800D2A71F)
         1. [FUNCTION: `TCL-CHANNEL-WATCH-PROC`](#api-function-tcl-channel-watch-proc_729DB4751D47BEB70A010401C9476946)
         1. [FUNCTION: `TCL-CHANNEL-WIDE-SEEK-PROC`](#api-function-tcl-channel-wide-seek-proc_8679CB1E431EBE0070B25BF4B0EB3364)
         1. [FUNCTION: `TCL-CHAR16-LEN`](#api-function-tcl-char16-len_57F0161D6AEF4312318D91DC3ACCF82E)
         1. [FUNCTION: `TCL-CHAR16-TO-UTF-D-STRING`](#api-function-tcl-char16-to-utf-d-string_ADAE882A1CDFA286B08CDD9DB7EE6C73)
         1. [FUNCTION: `TCL-CHDIR`](#api-function-tcl-chdir_046BED12E68B31073B71DF4B0BD001FF)
         1. [FUNCTION: `TCL-CLEAR-CHANNEL-HANDLERS`](#api-function-tcl-clear-channel-handlers_B5AE029B0135096475D34B7F732DEFB7)
         1. [FUNCTION: `TCL-CLOSE-EX`](#api-function-tcl-close-ex_FEF823C8DFF36437CACE161A04AC9F39)
         1. [FUNCTION: `TCL-CLOSE`](#api-function-tcl-close_CA43390C85327B8341FBCA12869C05AD)
         1. [FUNCTION: `TCL-COMMAND-COMPLETE`](#api-function-tcl-command-complete_4F5E75BBD2A6E3C0D875C879E9C1D7F0)
         1. [FUNCTION: `TCL-COMMAND-TRACE-INFO`](#api-function-tcl-command-trace-info_5364F1241E34289670911063F5F155B1)
         1. [FUNCTION: `TCL-CONCAT-OBJ`](#api-function-tcl-concat-obj_8E0DA8FFD581B8D3C52C4F654BC51217)
         1. [FUNCTION: `TCL-CONCAT`](#api-function-tcl-concat_59271C5ED48D58F3392911D3F1284CC8)
         1. [FUNCTION: `TCL-CONDITION-FINALIZE`](#api-function-tcl-condition-finalize_094DFB0E94735A026B9FFDEF15809C99)
         1. [FUNCTION: `TCL-CONDITION-NOTIFY`](#api-function-tcl-condition-notify_9ECB36DE4929A2B7981A1C42D09B23EE)
         1. [FUNCTION: `TCL-CONDITION-WAIT`](#api-function-tcl-condition-wait_3816602F91E4BD193BEEDAF69C74667C)
         1. [FUNCTION: `TCL-CONVERT-COUNTER-ELEMENT`](#api-function-tcl-convert-counter-element_2242AC73E2040D06CB5A38BFE0B55EC2)
         1. [FUNCTION: `TCL-CONVERT-ELEMENT`](#api-function-tcl-convert-element_67DA914A78935B7B9E3BEB3BBDA516EA)
         1. [FUNCTION: `TCL-CONVERT-TO-TYPE`](#api-function-tcl-convert-to-type_1AD6F13A8E812499E328D2BF2DA1A221)
         1. [FUNCTION: `TCL-CREATE-ALIAS-OBJ`](#api-function-tcl-create-alias-obj_3F0396D3C746163D2DEA7D2BAB13F8D1)
         1. [FUNCTION: `TCL-CREATE-ALIAS`](#api-function-tcl-create-alias_3C42086B1161273640D5715D38ED5457)
         1. [FUNCTION: `TCL-CREATE-CHANNEL-HANDLER`](#api-function-tcl-create-channel-handler_D0CD54B9F4BA3B380A463BB63B45DAB7)
         1. [FUNCTION: `TCL-CREATE-CHANNEL`](#api-function-tcl-create-channel_0432048197F1C9C1F90D3F9AC1A2D0A0)
         1. [FUNCTION: `TCL-CREATE-CHILD`](#api-function-tcl-create-child_74C6CE26114F318D1C3E66F5CDA4CA7C)
         1. [FUNCTION: `TCL-CREATE-CLOSE-HANDLER`](#api-function-tcl-create-close-handler_0B2D6D3DD6544ED63675E96C08AE03A0)
         1. [FUNCTION: `TCL-CREATE-COMMAND`](#api-function-tcl-create-command_54B1B8CA64B3A4759E044D20857E21E9)
         1. [FUNCTION: `TCL-CREATE-ENCODING`](#api-function-tcl-create-encoding_2B9A0A4438B1BDB571D8BFD60DA39FD4)
         1. [FUNCTION: `TCL-CREATE-ENSEMBLE`](#api-function-tcl-create-ensemble_AE5CA5DD64656501B79EB6A04C0160C0)
         1. [FUNCTION: `TCL-CREATE-EVENT-SOURCE`](#api-function-tcl-create-event-source_9A745C52C6EF5073418CBDA74BDC72EA)
         1. [FUNCTION: `TCL-CREATE-EXIT-HANDLER`](#api-function-tcl-create-exit-handler_60C2F921123D34F75D7092E71A9C6021)
         1. [FUNCTION: `TCL-CREATE-FILE-HANDLER`](#api-function-tcl-create-file-handler_9C52964F46D445C7FE475CBFAC7EB223)
         1. [FUNCTION: `TCL-CREATE-NAMESPACE`](#api-function-tcl-create-namespace_C3B7AAB06C2F79F745B1FB28036F13E2)
         1. [FUNCTION: `TCL-CREATE-OBJ-COMMAND2`](#api-function-tcl-create-obj-command2_9BBC749F9581A2ECDD8AB3AA5A4664EF)
         1. [FUNCTION: `TCL-CREATE-OBJ-COMMAND`](#api-function-tcl-create-obj-command_D745AE5C0CC104803419BE8BBB081B72)
         1. [FUNCTION: `TCL-CREATE-OBJ-TRACE2`](#api-function-tcl-create-obj-trace2_14F39EDA222C55A69D586535197DF439)
         1. [FUNCTION: `TCL-CREATE-OBJ-TRACE`](#api-function-tcl-create-obj-trace_9533853102BBBDF84A1032FE2E27074F)
         1. [FUNCTION: `TCL-CREATE-PIPE`](#api-function-tcl-create-pipe_3C96273E6C38BE22A6F155D2AD5224C3)
         1. [FUNCTION: `TCL-CREATE-THREAD-EXIT-HANDLER`](#api-function-tcl-create-thread-exit-handler_CE85F04A06B87D5AF06B104E820FF984)
         1. [FUNCTION: `TCL-CREATE-THREAD`](#api-function-tcl-create-thread_9FDBB599556BE37299ED5166E44248A6)
         1. [FUNCTION: `TCL-CREATE-TIMER-HANDLER`](#api-function-tcl-create-timer-handler_4AC3F87A1F1663CCBB4982A2FA9E2452)
         1. [FUNCTION: `TCL-CREATE-TRACE`](#api-function-tcl-create-trace_75CAFA2F3832807779A4499CD6E07612)
         1. [FUNCTION: `TCL-CUT-CHANNEL`](#api-function-tcl-cut-channel_EEC89064A4445564DDEB201F7F75AFF6)
         1. [FUNCTION: `TCL-D-STRING-APPEND-ELEMENT`](#api-function-tcl-d-string-append-element_A71114706FA5144C1A86696E8EF1D122)
         1. [FUNCTION: `TCL-D-STRING-APPEND`](#api-function-tcl-d-string-append_354BE93E06EA077E6EC6E7CAED06EB80)
         1. [FUNCTION: `TCL-D-STRING-END-SUBLIST`](#api-function-tcl-d-string-end-sublist_F26CF0F2EEE2329A90272A29D27A6B4F)
         1. [FUNCTION: `TCL-D-STRING-FREE`](#api-function-tcl-d-string-free_4EA6A5F9643CC9BB3A985703FB71D6A5)
         1. [FUNCTION: `TCL-D-STRING-GET-RESULT`](#api-function-tcl-d-string-get-result_56BE2B92FDF254019ED68614C6F29304)
         1. [FUNCTION: `TCL-D-STRING-INIT`](#api-function-tcl-d-string-init_FA9ABABC12B192A000B0862B116CEE74)
         1. [FUNCTION: `TCL-D-STRING-RESULT`](#api-function-tcl-d-string-result_CB994BB62EFA371F5713451401DDEA15)
         1. [FUNCTION: `TCL-D-STRING-SET-LENGTH`](#api-function-tcl-d-string-set-length_42F0BA5C86B0C1C7C9A76178A88C3B7A)
         1. [FUNCTION: `TCL-D-STRING-START-SUBLIST`](#api-function-tcl-d-string-start-sublist_2FCF145F290E5359F1662BC813AF9B0D)
         1. [FUNCTION: `TCL-D-STRING-TO-OBJ`](#api-function-tcl-d-string-to-obj_C925DA75CD1370C82FE45AC40EBE09F0)
         1. [FUNCTION: `TCL-DB-CKALLOC`](#api-function-tcl-db-ckalloc_3ED23A6278BDF6F88B5AE6A551E1AE6C)
         1. [FUNCTION: `TCL-DB-CKFREE`](#api-function-tcl-db-ckfree_7836ADAC786F81503CCBB22A12EAF852)
         1. [FUNCTION: `TCL-DB-CKREALLOC`](#api-function-tcl-db-ckrealloc_86534ABDBCA1D9D96089CD85D1E562DA)
         1. [FUNCTION: `TCL-DB-DECR-REF-COUNT`](#api-function-tcl-db-decr-ref-count_CCA636AABBBECCE6077A0EC8DCD13C6B)
         1. [FUNCTION: `TCL-DB-INCR-REF-COUNT`](#api-function-tcl-db-incr-ref-count_BF58DA7033E6780EE3EBB9F6E18F5C9C)
         1. [FUNCTION: `TCL-DB-IS-SHARED`](#api-function-tcl-db-is-shared_5EA2BE5CB779B59082901CE0105CA02F)
         1. [FUNCTION: `TCL-DB-NEW-BIGNUM-OBJ`](#api-function-tcl-db-new-bignum-obj_19B00F5FBC96ACB5BBC773C0FBEE133D)
         1. [FUNCTION: `TCL-DB-NEW-BOOLEAN-OBJ`](#api-function-tcl-db-new-boolean-obj_1E64298C830AD792E90512B6D9A534C1)
         1. [FUNCTION: `TCL-DB-NEW-BYTE-ARRAY-OBJ`](#api-function-tcl-db-new-byte-array-obj_85D9D506434B2F2D78C0903CF4BEC75F)
         1. [FUNCTION: `TCL-DB-NEW-DICT-OBJ`](#api-function-tcl-db-new-dict-obj_BDB8B8FAEB08AA901EAC38F8574ED4A1)
         1. [FUNCTION: `TCL-DB-NEW-DOUBLE-OBJ`](#api-function-tcl-db-new-double-obj_D3EA7B1AA82D3B6A1548A74A6B4312C6)
         1. [FUNCTION: `TCL-DB-NEW-LIST-OBJ`](#api-function-tcl-db-new-list-obj_AAF6A042BE617A1C97BA24F0422C48E0)
         1. [FUNCTION: `TCL-DB-NEW-LONG-OBJ`](#api-function-tcl-db-new-long-obj_4DAED8849DA7790577831F356A6F29DE)
         1. [FUNCTION: `TCL-DB-NEW-OBJ`](#api-function-tcl-db-new-obj_9D80A3F14D3BBA3FB6FED6038DFC620B)
         1. [FUNCTION: `TCL-DB-NEW-STRING-OBJ`](#api-function-tcl-db-new-string-obj_ADC17155248B4D60C95E4C54AAD1429F)
         1. [FUNCTION: `TCL-DB-NEW-WIDE-INT-OBJ`](#api-function-tcl-db-new-wide-int-obj_4A7FDDA8B0509614D4F6C5485FBCBE8F)
         1. [FUNCTION: `TCL-DECR-REF-COUNT*`](#api-function-tcl-decr-ref-count_E48BAFEA3B88B3F564DEAE3CA61EEEDE)
         1. [FUNCTION: `TCL-DECR-REF-COUNT`](#api-function-tcl-decr-ref-count_F9931F1440C3883E804FACEA9B475163)
         1. [FUNCTION: `TCL-DELETE-ASSOC-DATA`](#api-function-tcl-delete-assoc-data_FB429449A5A7BFFF86E70C9098290A95)
         1. [FUNCTION: `TCL-DELETE-CHANNEL-HANDLER`](#api-function-tcl-delete-channel-handler_7329A13608E8FE0A3BC2158F5D460863)
         1. [FUNCTION: `TCL-DELETE-CLOSE-HANDLER`](#api-function-tcl-delete-close-handler_53CE31749BA08F19198AD7221ADAA449)
         1. [FUNCTION: `TCL-DELETE-COMMAND-FROM-TOKEN`](#api-function-tcl-delete-command-from-token_41678CE54D0BB80961CC70CCD9277329)
         1. [FUNCTION: `TCL-DELETE-COMMAND`](#api-function-tcl-delete-command_4CA53C2D7E71F1860D1E195D0AB88071)
         1. [FUNCTION: `TCL-DELETE-EVENT-SOURCE`](#api-function-tcl-delete-event-source_20A84300D6EC1E64622CB76A5DD8570F)
         1. [FUNCTION: `TCL-DELETE-EVENTS`](#api-function-tcl-delete-events_D504FEBB3D56D9BF5E8A606A1A93E43E)
         1. [FUNCTION: `TCL-DELETE-EXIT-HANDLER`](#api-function-tcl-delete-exit-handler_FFEDC9FA033B37B1CFFF5CF28EDFF346)
         1. [FUNCTION: `TCL-DELETE-FILE-HANDLER`](#api-function-tcl-delete-file-handler_68DE3F4E112C2848CEA5840F113BA6FE)
         1. [FUNCTION: `TCL-DELETE-HASH-ENTRY`](#api-function-tcl-delete-hash-entry_6BA2FDA40CA0EF3D659F79399A7D203A)
         1. [FUNCTION: `TCL-DELETE-HASH-TABLE`](#api-function-tcl-delete-hash-table_ABF9C6623BF2AB6A00203584BAA70ECC)
         1. [FUNCTION: `TCL-DELETE-INTERP*`](#api-function-tcl-delete-interp_A7CAB9052960C8D79740A3FCB898F0BD)
         1. [FUNCTION: `TCL-DELETE-INTERP`](#api-function-tcl-delete-interp_A32C222335C9C4E64D86893753BB60DA)
         1. [FUNCTION: `TCL-DELETE-NAMESPACE`](#api-function-tcl-delete-namespace_9C1CEC9EC052E625AA9DD46ED6945D9B)
         1. [FUNCTION: `TCL-DELETE-THREAD-EXIT-HANDLER`](#api-function-tcl-delete-thread-exit-handler_8CC9F7581B931B72222C325DDFEB61E7)
         1. [FUNCTION: `TCL-DELETE-TIMER-HANDLER`](#api-function-tcl-delete-timer-handler_663EBBB192441CA5E97C0E77966C3937)
         1. [FUNCTION: `TCL-DELETE-TRACE`](#api-function-tcl-delete-trace_41F44B86484618DA7048C0D5173B83E6)
         1. [FUNCTION: `TCL-DETACH-CHANNEL`](#api-function-tcl-detach-channel_223838412F07E456DA6C213370A4E286)
         1. [FUNCTION: `TCL-DETACH-PIDS`](#api-function-tcl-detach-pids_8A31D0169EA5461C51E695982D1DD06C)
         1. [FUNCTION: `TCL-DICT-OBJ-DONE`](#api-function-tcl-dict-obj-done_55C8ABF06454677882FE2B20291237B4)
         1. [FUNCTION: `TCL-DICT-OBJ-FIRST`](#api-function-tcl-dict-obj-first_72E4EEEE02939EAB17286B262B1151AE)
         1. [FUNCTION: `TCL-DICT-OBJ-GET`](#api-function-tcl-dict-obj-get_2FB4A6C722E92A6F27ACFE797943EDE2)
         1. [FUNCTION: `TCL-DICT-OBJ-NEXT`](#api-function-tcl-dict-obj-next_2A8E8D6163571582E9FAC668A321E2D9)
         1. [FUNCTION: `TCL-DICT-OBJ-PUT-KEY-LIST`](#api-function-tcl-dict-obj-put-key-list_D05FFA0408668E876C3D56B9DB7AFC1A)
         1. [FUNCTION: `TCL-DICT-OBJ-PUT`](#api-function-tcl-dict-obj-put_96DBB4A8E4FA6888CB2EA1F3B806E878)
         1. [FUNCTION: `TCL-DICT-OBJ-REMOVE-KEY-LIST`](#api-function-tcl-dict-obj-remove-key-list_39D4731A7298B7D14557C36D999F715B)
         1. [FUNCTION: `TCL-DICT-OBJ-REMOVE`](#api-function-tcl-dict-obj-remove_A4AD8641035B39BA0E486FCBA16C13F9)
         1. [FUNCTION: `TCL-DICT-OBJ-SIZE`](#api-function-tcl-dict-obj-size_C9CCB456550E3AC365ACB3F88799C87D)
         1. [FUNCTION: `TCL-DISCARD-INTERP-STATE`](#api-function-tcl-discard-interp-state_09F87BB71FD8167FAA5C38256D61D11E)
         1. [FUNCTION: `TCL-DO-ONE-EVENT`](#api-function-tcl-do-one-event_AC8C9E0D9357A831A3C22C54EC116B6A)
         1. [FUNCTION: `TCL-DO-WHEN-IDLE`](#api-function-tcl-do-when-idle_F90F534497C8D7248C84BDFD134557D9)
         1. [FUNCTION: `TCL-DONT-CALL-WHEN-DELETED`](#api-function-tcl-dont-call-when-deleted_CE7CD63841FF08DB14034630908CEDDE)
         1. [FUNCTION: `TCL-DUMP-ACTIVE-MEMORY`](#api-function-tcl-dump-active-memory_EF9D135CF27B330E1476BB8F298A9A01)
         1. [FUNCTION: `TCL-DUPLICATE-OBJ`](#api-function-tcl-duplicate-obj_ECBF5FD58E3C00AB52116ACC9911F23F)
         1. [FUNCTION: `TCL-EOF`](#api-function-tcl-eof_658407D8FDB13F57F47D9736EEBF0B45)
         1. [FUNCTION: `TCL-ERRNO-MSG`](#api-function-tcl-errno-msg_AE0268C3E8873A667957283DBFF3D42B)
         1. [FUNCTION: `TCL-EVAL*`](#api-function-tcl-eval_2CF1E63B39C13DCA243743F633C97137)
         1. [FUNCTION: `TCL-EVAL-EX*`](#api-function-tcl-eval-ex_A250CE4E0B171CCD128EA8C3265559AA)
         1. [FUNCTION: `TCL-EVAL-EX`](#api-function-tcl-eval-ex_131EB786CBDDBB29A159DB3AAABA8236)
         1. [FUNCTION: `TCL-EVAL-FILE`](#api-function-tcl-eval-file_57A0AD2C7657F846BF727707D5C8549F)
         1. [FUNCTION: `TCL-EVAL-OBJ-EX`](#api-function-tcl-eval-obj-ex_4436271D18B871ED74F58E6B3F21232E)
         1. [FUNCTION: `TCL-EVAL-OBJ`](#api-function-tcl-eval-obj_EB950CF82629AE4F0EA81D4999614B86)
         1. [FUNCTION: `TCL-EVAL-OBJV`](#api-function-tcl-eval-objv_B3BA10B0FEC181DD44C6023621482A0A)
         1. [FUNCTION: `TCL-EVAL-TOKENS-STANDARD`](#api-function-tcl-eval-tokens-standard_139E39EB562674E60C3AE9E2C9DF7EDF)
         1. [FUNCTION: `TCL-EVAL`](#api-function-tcl-eval_DF6381299E65F4B1DFC080C8E77C5A10)
         1. [FUNCTION: `TCL-EVENTUALLY-FREE`](#api-function-tcl-eventually-free_CF70A41D4D54E2186C8E2C02A1065ACC)
         1. [FUNCTION: `TCL-EXIT-THREAD`](#api-function-tcl-exit-thread_618F1C90082BF18CDF25AFCA766F3CF3)
         1. [FUNCTION: `TCL-EXIT`](#api-function-tcl-exit_2B02D55CD208F90AE84D62376B2E21D7)
         1. [FUNCTION: `TCL-EXPORT`](#api-function-tcl-export_92BF7E46697F7FB49EAC3A9AE9A4148D)
         1. [FUNCTION: `TCL-EXPOSE-COMMAND`](#api-function-tcl-expose-command_D36F2FA324158EF561569C5B79FE0748)
         1. [FUNCTION: `TCL-EXPR-BOOLEAN-OBJ`](#api-function-tcl-expr-boolean-obj_A44F6C4993C3C64AE93E0064524D14AA)
         1. [FUNCTION: `TCL-EXPR-BOOLEAN`](#api-function-tcl-expr-boolean_D16414513339C9E8407F6063750703F8)
         1. [FUNCTION: `TCL-EXPR-DOUBLE-OBJ`](#api-function-tcl-expr-double-obj_CF5F2924587372AC7227A51846456777)
         1. [FUNCTION: `TCL-EXPR-DOUBLE`](#api-function-tcl-expr-double_CFB2E51E12701784512939F29FB332FB)
         1. [FUNCTION: `TCL-EXPR-LONG-OBJ`](#api-function-tcl-expr-long-obj_9B4F7E1E4EDC0CE61582945DF6D0CFC2)
         1. [FUNCTION: `TCL-EXPR-LONG`](#api-function-tcl-expr-long_6B21043A96312F18A32EEBA8582E0F11)
         1. [FUNCTION: `TCL-EXPR-OBJ`](#api-function-tcl-expr-obj_0D62A00104C388E2010B50F70BC70B6A)
         1. [FUNCTION: `TCL-EXPR-STRING`](#api-function-tcl-expr-string_DBC83D47D589655754D84C3D357BB9C4)
         1. [FUNCTION: `TCL-EXTERNAL-TO-UTF-D-STRING-EX`](#api-function-tcl-external-to-utf-d-string-ex_9A025D1811C910BE36D7CA8B86BF2D9A)
         1. [FUNCTION: `TCL-EXTERNAL-TO-UTF-D-STRING`](#api-function-tcl-external-to-utf-d-string_C37E336C9FFD19866AFAB685C96ED44F)
         1. [FUNCTION: `TCL-EXTERNAL-TO-UTF`](#api-function-tcl-external-to-utf_FD83A261F04291D260CC256257CCEEA1)
         1. [FUNCTION: `TCL-FETCH-INTERNAL-REP`](#api-function-tcl-fetch-internal-rep_FC938230E08802D84F8F35C5849004F6)
         1. [FUNCTION: `TCL-FINALIZE-NOTIFIER`](#api-function-tcl-finalize-notifier_FE06581EF328D16DC2A07A95B7553E3B)
         1. [FUNCTION: `TCL-FIND-COMMAND`](#api-function-tcl-find-command_29F6474FAAF6D4A7B6E48097BEC13E27)
         1. [FUNCTION: `TCL-FIND-ENSEMBLE`](#api-function-tcl-find-ensemble_BECEA03C052BA0E158BA7A95428B7698)
         1. [FUNCTION: `TCL-FIND-EXECUTABLE`](#api-function-tcl-find-executable_2BB8AFB437BD9B2939F316502BC62BF3)
         1. [FUNCTION: `TCL-FIND-NAMESPACE`](#api-function-tcl-find-namespace_2971372040F7D95CCFB47961A2715F05)
         1. [FUNCTION: `TCL-FIND-SYMBOL`](#api-function-tcl-find-symbol_051E7EBBEFAD9B044CED06B393B58593)
         1. [FUNCTION: `TCL-FIRST-HASH-ENTRY`](#api-function-tcl-first-hash-entry_36F71EB5809EAEE7B239CBB47E950536)
         1. [FUNCTION: `TCL-FLUSH`](#api-function-tcl-flush_493FA2AD29FFF214A1B4925CE85BB620)
         1. [FUNCTION: `TCL-FORGET-IMPORT`](#api-function-tcl-forget-import_96B9AF58F5E80E6F31CA0B297BE98BBE)
         1. [FUNCTION: `TCL-FORMAT`](#api-function-tcl-format_06187754B4DAD70D446F05AACDAD7307)
         1. [FUNCTION: `TCL-FREE-ENCODING`](#api-function-tcl-free-encoding_EFF91938CC4A70AECA2F53B1E2456126)
         1. [FUNCTION: `TCL-FREE-INTERNAL-REP`](#api-function-tcl-free-internal-rep_000B2D28C6179475BFD9EFA50FDAB3D3)
         1. [FUNCTION: `TCL-FREE-OBJ`](#api-function-tcl-free-obj_36BB16F039343ACB3E505927F68CB5A4)
         1. [FUNCTION: `TCL-FREE-PARSE`](#api-function-tcl-free-parse_FF73DC198A25AF714FA22B4669D5CD12)
         1. [FUNCTION: `TCL-FREE`](#api-function-tcl-free_8FB9C636FED32C8F689BE375656AF5FA)
         1. [FUNCTION: `TCL-FS-ACCESS`](#api-function-tcl-fs-access_73D3A7110CAF1FD411190381F6E49BDE)
         1. [FUNCTION: `TCL-FS-CHDIR`](#api-function-tcl-fs-chdir_8DB4B51F03CDB9533210DCD5B2A4584A)
         1. [FUNCTION: `TCL-FS-CONVERT-TO-PATH-TYPE`](#api-function-tcl-fs-convert-to-path-type_F7EF2442B363033AAE465DB5B03DE03A)
         1. [FUNCTION: `TCL-FS-COPY-DIRECTORY`](#api-function-tcl-fs-copy-directory_8396BA50DADBBC22996C82CCF94401B7)
         1. [FUNCTION: `TCL-FS-COPY-FILE`](#api-function-tcl-fs-copy-file_33F2D28EE098FA2247ECA992D721F40B)
         1. [FUNCTION: `TCL-FS-DATA`](#api-function-tcl-fs-data_4D10FEDC6FAC31D0F837ED6242DE9789)
         1. [FUNCTION: `TCL-FS-DELETE-FILE`](#api-function-tcl-fs-delete-file_A89C07580E29EAD5FA0ED653D31680DD)
         1. [FUNCTION: `TCL-FS-EQUAL-PATHS`](#api-function-tcl-fs-equal-paths_578798F08B39F91DDA4FCAE1B3FFA742)
         1. [FUNCTION: `TCL-FS-EVAL-FILE-EX`](#api-function-tcl-fs-eval-file-ex_1AF92B026BC9CDC10D21DA424227AD3C)
         1. [FUNCTION: `TCL-FS-EVAL-FILE`](#api-function-tcl-fs-eval-file_69407C49E0CACD515A0DEE2F44341E64)
         1. [FUNCTION: `TCL-FS-FILE-ATTR-STRINGS`](#api-function-tcl-fs-file-attr-strings_17218030419F55714DFB97B81B2CF357)
         1. [FUNCTION: `TCL-FS-FILE-ATTRS-GET`](#api-function-tcl-fs-file-attrs-get_DB03419AFE9CDC5877D924B2EBA04AA2)
         1. [FUNCTION: `TCL-FS-FILE-ATTRS-SET`](#api-function-tcl-fs-file-attrs-set_8F8C54C908AE11B9E89D7A4D8A8C0B1A)
         1. [FUNCTION: `TCL-FS-FILE-SYSTEM-INFO`](#api-function-tcl-fs-file-system-info_0F4615555F3599E9B5A12776BFF673D1)
         1. [FUNCTION: `TCL-FS-GET-CWD`](#api-function-tcl-fs-get-cwd_75220E831A179DA7DB8D1E93967A449C)
         1. [FUNCTION: `TCL-FS-GET-FILE-SYSTEM-FOR-PATH`](#api-function-tcl-fs-get-file-system-for-path_CB8875E8D4B91D226C532C0EA176A0AD)
         1. [FUNCTION: `TCL-FS-GET-INTERNAL-REP`](#api-function-tcl-fs-get-internal-rep_10CF2A7AA0987734211D83C34CCDD84C)
         1. [FUNCTION: `TCL-FS-GET-NATIVE-PATH`](#api-function-tcl-fs-get-native-path_C485613D7A04FACEC25FEED2627A7E5A)
         1. [FUNCTION: `TCL-FS-GET-NORMALIZED-PATH`](#api-function-tcl-fs-get-normalized-path_8DDCA90613DDFEE9CAE5EFBCBD7EB3A9)
         1. [FUNCTION: `TCL-FS-GET-PATH-TYPE`](#api-function-tcl-fs-get-path-type_0644873B5206795FF0120624929179CE)
         1. [FUNCTION: `TCL-FS-GET-TRANSLATED-PATH`](#api-function-tcl-fs-get-translated-path_77CE2A2F7D6D4E2F6A476B2E82773AD2)
         1. [FUNCTION: `TCL-FS-GET-TRANSLATED-STRING-PATH`](#api-function-tcl-fs-get-translated-string-path_4F3E227D3D132849AF2C679409209FEB)
         1. [FUNCTION: `TCL-FS-JOIN-PATH`](#api-function-tcl-fs-join-path_B2483686E7EA233B8D0FD02A3F6815BC)
         1. [FUNCTION: `TCL-FS-JOIN-TO-PATH`](#api-function-tcl-fs-join-to-path_24C869A5D1273AB3373CB7EC690A21AF)
         1. [FUNCTION: `TCL-FS-LINK`](#api-function-tcl-fs-link_E055B554265054105D7FAFA9F4BFA9AB)
         1. [FUNCTION: `TCL-FS-LOAD-FILE`](#api-function-tcl-fs-load-file_6AB77E7928E78CA2D566CB49AF3040E9)
         1. [FUNCTION: `TCL-FS-LSTAT`](#api-function-tcl-fs-lstat_6FF88E862CCB2F3977B57DF672713991)
         1. [FUNCTION: `TCL-FS-MATCH-IN-DIRECTORY`](#api-function-tcl-fs-match-in-directory_BA0AD85E9DA997D1E88B7414B4D7E423)
         1. [FUNCTION: `TCL-FS-MOUNTS-CHANGED`](#api-function-tcl-fs-mounts-changed_AEF5D3C6559C098F5D1AB010B71F17DD)
         1. [FUNCTION: `TCL-FS-NEW-NATIVE-PATH`](#api-function-tcl-fs-new-native-path_B2E952559407612717AE078964891EC2)
         1. [FUNCTION: `TCL-FS-OPEN-FILE-CHANNEL`](#api-function-tcl-fs-open-file-channel_1FD046D75032822C6F7BA7719050915A)
         1. [FUNCTION: `TCL-FS-PATH-SEPARATOR`](#api-function-tcl-fs-path-separator_0CF17E6443A9360DFF3FE127A3317F01)
         1. [FUNCTION: `TCL-FS-REGISTER`](#api-function-tcl-fs-register_B928342F24996092D1E21B47CA65C59E)
         1. [FUNCTION: `TCL-FS-REMOVE-DIRECTORY`](#api-function-tcl-fs-remove-directory_DC6C32CD0E8F6A7426714ECC2BF81E4D)
         1. [FUNCTION: `TCL-FS-RENAME-FILE`](#api-function-tcl-fs-rename-file_A7C5DB47BBD5F0B199E14641DA80E912)
         1. [FUNCTION: `TCL-FS-SPLIT-PATH`](#api-function-tcl-fs-split-path_446ED88B199F819D8C389AB97AFBB261)
         1. [FUNCTION: `TCL-FS-STAT`](#api-function-tcl-fs-stat_41FCE86D2A530721589F995404016650)
         1. [FUNCTION: `TCL-FS-TILDE-EXPAND`](#api-function-tcl-fs-tilde-expand_C21DF381982B9D4714DCAAF32BC15887)
         1. [FUNCTION: `TCL-FS-UNLOAD-FILE`](#api-function-tcl-fs-unload-file_51F5319D0FB84501419223FF5B277ACE)
         1. [FUNCTION: `TCL-FS-UNREGISTER`](#api-function-tcl-fs-unregister_CB4994A436091CFF644E2F5E5E9000BD)
         1. [FUNCTION: `TCL-FS-UTIME`](#api-function-tcl-fs-utime_9C25306F4C7C929E0D4F48CB48E1792B)
         1. [FUNCTION: `TCL-GET-ACCESS-TIME-FROM-STAT`](#api-function-tcl-get-access-time-from-stat_F04C546041EFA30691C696B15794CD1D)
         1. [FUNCTION: `TCL-GET-ALIAS-OBJ`](#api-function-tcl-get-alias-obj_39D2E3A3C05AB35B16A93B1541257D39)
         1. [FUNCTION: `TCL-GET-ASSOC-DATA`](#api-function-tcl-get-assoc-data_8A33272DEE926BB9F37ED454269B8F51)
         1. [FUNCTION: `TCL-GET-BIGNUM-FROM-OBJ`](#api-function-tcl-get-bignum-from-obj_B0DDDAF9E0F9F0CDA6082823D91DB991)
         1. [FUNCTION: `TCL-GET-BLOCK-SIZE-FROM-STAT`](#api-function-tcl-get-block-size-from-stat_DC66BE64E88948CD2538067E10293056)
         1. [FUNCTION: `TCL-GET-BLOCKS-FROM-STAT`](#api-function-tcl-get-blocks-from-stat_35EA9991B871BE0818C8791427E4581A)
         1. [FUNCTION: `TCL-GET-BOOL-FROM-OBJ`](#api-function-tcl-get-bool-from-obj_EC7E4481A7EF2747A5531D407187B1C0)
         1. [FUNCTION: `TCL-GET-BOOL`](#api-function-tcl-get-bool_337289ADA2AEFDE83690195146831E47)
         1. [FUNCTION: `TCL-GET-BOOLEAN-FROM-OBJ`](#api-function-tcl-get-boolean-from-obj_C52F020AF6D6D90739E099586BD991FE)
         1. [FUNCTION: `TCL-GET-BOOLEAN`](#api-function-tcl-get-boolean_14244B95815617584500EAF50AF9DDB9)
         1. [FUNCTION: `TCL-GET-BYTE-ARRAY-FROM-OBJ`](#api-function-tcl-get-byte-array-from-obj_093A51147209C3B47D7058EA80D2ED79)
         1. [FUNCTION: `TCL-GET-BYTES-FROM-OBJ`](#api-function-tcl-get-bytes-from-obj_9359F8AED5CBEF84C95F5BBEDA130680)
         1. [FUNCTION: `TCL-GET-CHANGE-TIME-FROM-STAT`](#api-function-tcl-get-change-time-from-stat_D43C414E9E4E974EE8B501684BC7561C)
         1. [FUNCTION: `TCL-GET-CHANNEL-BUFFER-SIZE`](#api-function-tcl-get-channel-buffer-size_2F8BE6B6DC1B9B2478C12E407947A7E0)
         1. [FUNCTION: `TCL-GET-CHANNEL-ERROR-INTERP`](#api-function-tcl-get-channel-error-interp_EF3A84471B074671FD57C7877801651B)
         1. [FUNCTION: `TCL-GET-CHANNEL-ERROR`](#api-function-tcl-get-channel-error_0DF5954B44A0194FCC5D7A7F122053A0)
         1. [FUNCTION: `TCL-GET-CHANNEL-HANDLE`](#api-function-tcl-get-channel-handle_74644B74433A4EDD8901AC0A5B2F830F)
         1. [FUNCTION: `TCL-GET-CHANNEL-INSTANCE-DATA`](#api-function-tcl-get-channel-instance-data_39C6BF82C3688E2907557A6D814BFF76)
         1. [FUNCTION: `TCL-GET-CHANNEL-MODE`](#api-function-tcl-get-channel-mode_EE4002F1A3A9E42B1FE042E340CE9656)
         1. [FUNCTION: `TCL-GET-CHANNEL-NAME`](#api-function-tcl-get-channel-name_AC1FA36285912DD7BF6538CEA9FF58A4)
         1. [FUNCTION: `TCL-GET-CHANNEL-NAMES-EX`](#api-function-tcl-get-channel-names-ex_C0EE965D178E542B80DDF3315CCE6F76)
         1. [FUNCTION: `TCL-GET-CHANNEL-NAMES`](#api-function-tcl-get-channel-names_1BAC918A6C6E11382A6DCBC3A4859B7B)
         1. [FUNCTION: `TCL-GET-CHANNEL-OPTION`](#api-function-tcl-get-channel-option_731F6FE0EB2C83875CD996D8EF229F20)
         1. [FUNCTION: `TCL-GET-CHANNEL-THREAD`](#api-function-tcl-get-channel-thread_44084444CA234B38F2D18C1C16C09D1A)
         1. [FUNCTION: `TCL-GET-CHANNEL-TYPE`](#api-function-tcl-get-channel-type_2B195B3DC9A475224F8B9249F2BCB791)
         1. [FUNCTION: `TCL-GET-CHANNEL`](#api-function-tcl-get-channel_3762933B737B4C35C8FFF1855F5E2D29)
         1. [FUNCTION: `TCL-GET-CHAR-LENGTH`](#api-function-tcl-get-char-length_8250E3B62D523AF73A923C2177F773DB)
         1. [FUNCTION: `TCL-GET-CHILD`](#api-function-tcl-get-child_1E41251EAC331764A5BD4744D16632E4)
         1. [FUNCTION: `TCL-GET-COMMAND-FROM-OBJ`](#api-function-tcl-get-command-from-obj_C9AF6180FDBCE9BFD58102823F86088C)
         1. [FUNCTION: `TCL-GET-COMMAND-FULL-NAME`](#api-function-tcl-get-command-full-name_199823CFB1B06DB3C2AE14B093EEBFDB)
         1. [FUNCTION: `TCL-GET-COMMAND-INFO-FROM-TOKEN`](#api-function-tcl-get-command-info-from-token_F1F98F3F774BC84BF6968AAFF00482BF)
         1. [FUNCTION: `TCL-GET-COMMAND-INFO`](#api-function-tcl-get-command-info_41B8364E9FA844F44863FF6F61687028)
         1. [FUNCTION: `TCL-GET-COMMAND-NAME`](#api-function-tcl-get-command-name_F7AB1C787EBCFAC4245761F4A8E247F9)
         1. [FUNCTION: `TCL-GET-CURRENT-NAMESPACE`](#api-function-tcl-get-current-namespace_4FE35F8ED2C9E1734ABBB83DBB1D0867)
         1. [FUNCTION: `TCL-GET-CWD`](#api-function-tcl-get-cwd_BF63355289BA85866C20CCEA1B97CF63)
         1. [FUNCTION: `TCL-GET-DEVICE-TYPE-FROM-STAT`](#api-function-tcl-get-device-type-from-stat_6C71D488E97F96561904E7EC0830F445)
         1. [FUNCTION: `TCL-GET-DOUBLE-FROM-OBJ`](#api-function-tcl-get-double-from-obj_0800A7088E4BD525286F00A2B19500CC)
         1. [FUNCTION: `TCL-GET-DOUBLE`](#api-function-tcl-get-double_51834678D0054D740284520E37AD4266)
         1. [FUNCTION: `TCL-GET-ENCODING-FROM-OBJ`](#api-function-tcl-get-encoding-from-obj_5012B56F4C0DBDADE0438323143B3A95)
         1. [FUNCTION: `TCL-GET-ENCODING-NAME-FROM-ENVIRONMENT`](#api-function-tcl-get-encoding-name-from-environment_B7262CCE7CFBCF69C4606BB83C2F8682)
         1. [FUNCTION: `TCL-GET-ENCODING-NAME`](#api-function-tcl-get-encoding-name_EDF34C256805A0825F8EBC492A2F182B)
         1. [FUNCTION: `TCL-GET-ENCODING-NAMES`](#api-function-tcl-get-encoding-names_1855A953568D37A14B33C73FAD0F48AB)
         1. [FUNCTION: `TCL-GET-ENCODING-NUL-LENGTH`](#api-function-tcl-get-encoding-nul-length_412D2C62B3455C6CF13087692DFCCB37)
         1. [FUNCTION: `TCL-GET-ENCODING`](#api-function-tcl-get-encoding_9BEAEF349FEC7003BA3E968675EA9E94)
         1. [FUNCTION: `TCL-GET-ENSEMBLE-FLAGS`](#api-function-tcl-get-ensemble-flags_438FD49C8AE5AFD0C6783DEB1B1364A6)
         1. [FUNCTION: `TCL-GET-ENSEMBLE-MAPPING-DICT`](#api-function-tcl-get-ensemble-mapping-dict_A136EB3936CB8646EFA3365752CFE2EC)
         1. [FUNCTION: `TCL-GET-ENSEMBLE-NAMESPACE`](#api-function-tcl-get-ensemble-namespace_D79087A386E31CB6DA6FD9E815C8BAC3)
         1. [FUNCTION: `TCL-GET-ENSEMBLE-PARAMETER-LIST`](#api-function-tcl-get-ensemble-parameter-list_CB99ACC939D6DFAD21F7C733F0C49BAB)
         1. [FUNCTION: `TCL-GET-ENSEMBLE-SUBCOMMAND-LIST`](#api-function-tcl-get-ensemble-subcommand-list_0BCCC9B633E45FC6447240D0D6610149)
         1. [FUNCTION: `TCL-GET-ENSEMBLE-UNKNOWN-HANDLER`](#api-function-tcl-get-ensemble-unknown-handler_7D2F7A11BE2C86C4BF81AE393753D8D8)
         1. [FUNCTION: `TCL-GET-ERROR-LINE`](#api-function-tcl-get-error-line_797D205F901A850910528F14C33DDD44)
         1. [FUNCTION: `TCL-GET-FS-DEVICE-FROM-STAT`](#api-function-tcl-get-fs-device-from-stat_1AE6E186668F8C88721047C3778A9CDB)
         1. [FUNCTION: `TCL-GET-FS-INODE-FROM-STAT`](#api-function-tcl-get-fs-inode-from-stat_F6F1231C6535CC9C049940083CB6078A)
         1. [FUNCTION: `TCL-GET-GLOBAL-NAMESPACE`](#api-function-tcl-get-global-namespace_BE92378C119EA1B61320002525934B3A)
         1. [FUNCTION: `TCL-GET-GROUP-ID-FROM-STAT`](#api-function-tcl-get-group-id-from-stat_6EEEA8B28CA95B77E418F7E589F745D5)
         1. [FUNCTION: `TCL-GET-INDEX-FROM-OBJ-STRUCT`](#api-function-tcl-get-index-from-obj-struct_CA636C8823C952B9E048CDA4498DCC3F)
         1. [FUNCTION: `TCL-GET-INDEX-FROM-OBJ`](#api-function-tcl-get-index-from-obj_F373DE381301BFC40B86BA0D3980FE3B)
         1. [FUNCTION: `TCL-GET-INT-FOR-INDEX`](#api-function-tcl-get-int-for-index_175F8181B2FB905535060E09CAF5013A)
         1. [FUNCTION: `TCL-GET-INT-FROM-OBJ`](#api-function-tcl-get-int-from-obj_984DED2B628805AA7DDB02E17C8F23F8)
         1. [FUNCTION: `TCL-GET-INT`](#api-function-tcl-get-int_7F613795580B708953ABD8984B67A922)
         1. [FUNCTION: `TCL-GET-INTERP-PATH`](#api-function-tcl-get-interp-path_049AAB8DE1827A3E5DC0C9A09A2E47DF)
         1. [FUNCTION: `TCL-GET-LINK-COUNT-FROM-STAT`](#api-function-tcl-get-link-count-from-stat_66D43E4B00D4CB2737AFA09858B7B271)
         1. [FUNCTION: `TCL-GET-LONG-FROM-OBJ`](#api-function-tcl-get-long-from-obj_E8CD5036079806C4E118F399DE1175E3)
         1. [FUNCTION: `TCL-GET-MEMORY-INFO`](#api-function-tcl-get-memory-info_F255B4DB2441062915315275EF65DC01)
         1. [FUNCTION: `TCL-GET-MODE-FROM-STAT`](#api-function-tcl-get-mode-from-stat_2D7A29EC6E834F76734DBACDEBEB3C97)
         1. [FUNCTION: `TCL-GET-MODIFICATION-TIME-FROM-STAT`](#api-function-tcl-get-modification-time-from-stat_C208501C9352B317C514EE3F0D63FB48)
         1. [FUNCTION: `TCL-GET-NAMESPACE-UNKNOWN-HANDLER`](#api-function-tcl-get-namespace-unknown-handler_E469A1C86D4C036CE5283E8CA48BB1EB)
         1. [FUNCTION: `TCL-GET-NUMBER-FROM-OBJ`](#api-function-tcl-get-number-from-obj_DE78F0728CBE10C45561329D4EA65EE5)
         1. [FUNCTION: `TCL-GET-NUMBER`](#api-function-tcl-get-number_DDC6F39ECC58B0082F3F658AA1E679D9)
         1. [FUNCTION: `TCL-GET-OBJ-RESULT*`](#api-function-tcl-get-obj-result_A30495481DB5D2510E861A802DA0D620)
         1. [FUNCTION: `TCL-GET-OBJ-RESULT`](#api-function-tcl-get-obj-result_F0123C5A8CFFF6EDD00E9FDFC7CFF4D8)
         1. [FUNCTION: `TCL-GET-OBJ-TYPE`](#api-function-tcl-get-obj-type_F391235C8DBDB9E6086C8ACEA2779589)
         1. [FUNCTION: `TCL-GET-OPEN-FILE`](#api-function-tcl-get-open-file_4B45D8AEAD85660A826D6109D6E1B5F4)
         1. [FUNCTION: `TCL-GET-PARENT`](#api-function-tcl-get-parent_61150FAFD00DCBAF6890E9ACBD08709F)
         1. [FUNCTION: `TCL-GET-PATH-TYPE`](#api-function-tcl-get-path-type_84EBAC55100781F2218EA8DD1C2F83AB)
         1. [FUNCTION: `TCL-GET-RANGE`](#api-function-tcl-get-range_92C0F0CCCB2A76EA44AA0358198ADAB6)
         1. [FUNCTION: `TCL-GET-REG-EXP-FROM-OBJ`](#api-function-tcl-get-reg-exp-from-obj_6CA45B06F88B0CB32B88D088ABF18FD0)
         1. [FUNCTION: `TCL-GET-RETURN-OPTIONS`](#api-function-tcl-get-return-options_9650BFA6A4A9087579108DBD832FAFCF)
         1. [FUNCTION: `TCL-GET-SIZE-FROM-STAT`](#api-function-tcl-get-size-from-stat_97AF997A5236C7F91C0855EA85175080)
         1. [FUNCTION: `TCL-GET-SIZE-INT-FROM-OBJ`](#api-function-tcl-get-size-int-from-obj_43B7B69CAD30DFE02E9C4F2EC99591F3)
         1. [FUNCTION: `TCL-GET-STACKED-CHANNEL`](#api-function-tcl-get-stacked-channel_06BB8E711DE2CBB7A8531D709306FF92)
         1. [FUNCTION: `TCL-GET-STARTUP-SCRIPT`](#api-function-tcl-get-startup-script_4795253A3D3FF305342CD9C35CF823CE)
         1. [FUNCTION: `TCL-GET-STD-CHANNEL`](#api-function-tcl-get-std-channel_DB0B6BEB1F48BC9F2B7AB3211204AC2B)
         1. [FUNCTION: `TCL-GET-STRING*`](#api-function-tcl-get-string_6FAD3B89BAF78F7D88B8F2688ADAD658)
         1. [FUNCTION: `TCL-GET-STRING-FROM-OBJ/CHAR*`](#api-function-tcl-get-string-from-objchar_9AD7D47E0CEE48139A9CDA12AD6EEB36)
         1. [FUNCTION: `TCL-GET-STRING-FROM-OBJ`](#api-function-tcl-get-string-from-obj_D03E82DEC85907E7CF34DD34E88632EE)
         1. [FUNCTION: `TCL-GET-STRING-RESULT*`](#api-function-tcl-get-string-result_10320B14B4AD082F8C61F91780C7C680)
         1. [FUNCTION: `TCL-GET-STRING-RESULT`](#api-function-tcl-get-string-result_FB78F84E22912E0923F6A8481312D269)
         1. [FUNCTION: `TCL-GET-STRING`](#api-function-tcl-get-string_48C1154F94F36D83518E66B650B8A909)
         1. [FUNCTION: `TCL-GET-THREAD-DATA`](#api-function-tcl-get-thread-data_38F48803535946667547DD3EB7884212)
         1. [FUNCTION: `TCL-GET-TIME`](#api-function-tcl-get-time_FDD7B54C08D3F0B47E4716679307A63D)
         1. [FUNCTION: `TCL-GET-TOP-CHANNEL`](#api-function-tcl-get-top-channel_498EE5C25A2280EB064D47180E68977F)
         1. [FUNCTION: `TCL-GET-UNI-CHAR`](#api-function-tcl-get-uni-char_CDAE16DC3C11454C0AD754B6A890497F)
         1. [FUNCTION: `TCL-GET-UNICODE-FROM-OBJ`](#api-function-tcl-get-unicode-from-obj_2C9FC42F6A7778C8EE786871957B7F5C)
         1. [FUNCTION: `TCL-GET-UNICODE`](#api-function-tcl-get-unicode_F874704C37E10F1665BC17F59DA7D22B)
         1. [FUNCTION: `TCL-GET-USER-ID-FROM-STAT`](#api-function-tcl-get-user-id-from-stat_70AB2CE6EDA639346B5B7A226FC786E8)
         1. [FUNCTION: `TCL-GET-VAR*`](#api-function-tcl-get-var_CB56D1EE5B7104CF30594B23314FD7CE)
         1. [FUNCTION: `TCL-GET-VAR2*`](#api-function-tcl-get-var2_B26ACA7C7F41B1874C3C274BA772ABDA)
         1. [FUNCTION: `TCL-GET-VAR2-EX`](#api-function-tcl-get-var2-ex_68E9A386E943F68793BCE9B05CDF2605)
         1. [FUNCTION: `TCL-GET-VAR2`](#api-function-tcl-get-var2_BC8C1F08DBDA45CD8155A29F6160CAA0)
         1. [FUNCTION: `TCL-GET-VAR`](#api-function-tcl-get-var_9C167D12BE44F09B4F959E641C0A93F1)
         1. [FUNCTION: `TCL-GET-VERSION`](#api-function-tcl-get-version_26BC56AC820BA438D54847F55B549A60)
         1. [FUNCTION: `TCL-GET-WIDE-INT-FROM-OBJ`](#api-function-tcl-get-wide-int-from-obj_537A513F941EA48DEB5C80BB5AEC43D3)
         1. [FUNCTION: `TCL-GET-WIDE-U-INT-FROM-OBJ`](#api-function-tcl-get-wide-u-int-from-obj_0C77DB408F0526EAEF99F2E9A9289905)
         1. [FUNCTION: `TCL-GETS-OBJ`](#api-function-tcl-gets-obj_AC229F3ED36D0D09B19B9E258F5FA2EB)
         1. [FUNCTION: `TCL-GETS`](#api-function-tcl-gets_B483B69C481707979F4E0D37DB9DC34D)
         1. [FUNCTION: `TCL-GLOBAL-EVAL-OBJ`](#api-function-tcl-global-eval-obj_48CC77133753A7B0913D93AFF03D8A55)
         1. [FUNCTION: `TCL-GLOBAL-EVAL`](#api-function-tcl-global-eval_B1609D9B734B1E1C2A5C2497D361FAB3)
         1. [FUNCTION: `TCL-HAS-STRING-REP`](#api-function-tcl-has-string-rep_D492A0D2840D28EB67F73FEC32D91D56)
         1. [FUNCTION: `TCL-HASH-STATS`](#api-function-tcl-hash-stats_AD177CA56F69457798704E80F86B360D)
         1. [FUNCTION: `TCL-HIDE-COMMAND`](#api-function-tcl-hide-command_9CA29B63BF03A2766C4424BCDA0B7FB4)
         1. [FUNCTION: `TCL-IMPORT`](#api-function-tcl-import_45F6A0067038DDADE2498A7F5A1EEB53)
         1. [FUNCTION: `TCL-INCR-REF-COUNT*`](#api-function-tcl-incr-ref-count_8695DB3519AB81126ED023D5BA29DAB5)
         1. [FUNCTION: `TCL-INCR-REF-COUNT`](#api-function-tcl-incr-ref-count_2A1D01C03BE4A947ED409AB70BBB5C9E)
         1. [FUNCTION: `TCL-INIT*`](#api-function-tcl-init_C279A8849447A1C06E945AE358493368)
         1. [FUNCTION: `TCL-INIT-BIGNUM-FROM-DOUBLE`](#api-function-tcl-init-bignum-from-double_2A75C935AAEAAB65EE6861EA224FDAA7)
         1. [FUNCTION: `TCL-INIT-CUSTOM-HASH-TABLE`](#api-function-tcl-init-custom-hash-table_CF839338B129E078C0BB238EF2AD31A9)
         1. [FUNCTION: `TCL-INIT-HASH-TABLE`](#api-function-tcl-init-hash-table_4CBF19BC355C75AE441C9B770B10255D)
         1. [FUNCTION: `TCL-INIT-MEMORY`](#api-function-tcl-init-memory_9761AB5505B1D9E5562EBB806B4663C9)
         1. [FUNCTION: `TCL-INIT-OBJ-HASH-TABLE`](#api-function-tcl-init-obj-hash-table_876CA1851F4E61AC8ACCBEC1845181BA)
         1. [FUNCTION: `TCL-INIT-STRING-REP`](#api-function-tcl-init-string-rep_A3FCA3EF36A2350B5BC4FA98E8AD0821)
         1. [FUNCTION: `TCL-INIT-STUB-TABLE`](#api-function-tcl-init-stub-table_B945C53BB8E09399B5807BB4462750F7)
         1. [FUNCTION: `TCL-INIT-STUBS`](#api-function-tcl-init-stubs_4CC5891EBEE4E5285A53E5E72C71B8FF)
         1. [FUNCTION: `TCL-INIT`](#api-function-tcl-init_85B65C002BF33B5B91E786A2AA2A34CB)
         1. [FUNCTION: `TCL-INPUT-BLOCKED`](#api-function-tcl-input-blocked_B2714BF200EC9CE22EC22D24FBC358CF)
         1. [FUNCTION: `TCL-INPUT-BUFFERED`](#api-function-tcl-input-buffered_DDEDFE861690E87E3812D1E3FB5DAC37)
         1. [FUNCTION: `TCL-INTERP-ACTIVE`](#api-function-tcl-interp-active_A9EC42BFEC1FA688851350298572B67A)
         1. [FUNCTION: `TCL-INTERP-DELETED`](#api-function-tcl-interp-deleted_41364DF83BF146921DDFF4901659AC3D)
         1. [FUNCTION: `TCL-INVALIDATE-STRING-REP`](#api-function-tcl-invalidate-string-rep_1A0A3C9CE060A2FC0F9224E4E2B31F5E)
         1. [FUNCTION: `TCL-IS-CHANNEL-EXISTING`](#api-function-tcl-is-channel-existing_E5F7E2851F69F06D8704D5A36FB767F7)
         1. [FUNCTION: `TCL-IS-CHANNEL-REGISTERED`](#api-function-tcl-is-channel-registered_9F94EB6B364D87FDB89A6FED9298A105)
         1. [FUNCTION: `TCL-IS-CHANNEL-SHARED`](#api-function-tcl-is-channel-shared_2C24EE72CF8024BD9A93FAF2EBF0D900)
         1. [FUNCTION: `TCL-IS-ENSEMBLE`](#api-function-tcl-is-ensemble_C988F79A57ADBB8268D3354801CF596B)
         1. [FUNCTION: `TCL-IS-SAFE`](#api-function-tcl-is-safe_BE4B25EEB93D73EDF75B2A28427E9967)
         1. [FUNCTION: `TCL-IS-SHARED*`](#api-function-tcl-is-shared_0B4BC60E8621631079D817C9E0A328F0)
         1. [FUNCTION: `TCL-IS-SHARED`](#api-function-tcl-is-shared_FAD91529F5928009AA79F4FF62E58894)
         1. [FUNCTION: `TCL-IS-STANDARD-CHANNEL`](#api-function-tcl-is-standard-channel_1BD8498A39FC45B592014C7B75882A74)
         1. [FUNCTION: `TCL-JOIN-PATH`](#api-function-tcl-join-path_17E8D998BC48055F5E5BB71970C4E50B)
         1. [FUNCTION: `TCL-JOIN-THREAD`](#api-function-tcl-join-thread_FE1115FBEC8C8F8C7447359FE0D3421B)
         1. [FUNCTION: `TCL-LIMIT-ADD-HANDLER`](#api-function-tcl-limit-add-handler_9EEE584791667D5DDD444AD804FC0A4D)
         1. [FUNCTION: `TCL-LIMIT-CHECK`](#api-function-tcl-limit-check_EBFD713E63F54C51788E7B5B42460A98)
         1. [FUNCTION: `TCL-LIMIT-EXCEEDED`](#api-function-tcl-limit-exceeded_5996C893AB590035F85D0B751F9379FD)
         1. [FUNCTION: `TCL-LIMIT-GET-COMMANDS`](#api-function-tcl-limit-get-commands_E49A479AE7A2D6ED9C23316986241924)
         1. [FUNCTION: `TCL-LIMIT-GET-GRANULARITY`](#api-function-tcl-limit-get-granularity_D006E0661E18A74E087A2AD8ED7D33CC)
         1. [FUNCTION: `TCL-LIMIT-GET-TIME`](#api-function-tcl-limit-get-time_600075DC861979C191DA1E9A077FBAB6)
         1. [FUNCTION: `TCL-LIMIT-READY`](#api-function-tcl-limit-ready_E155CC84E84FD79F916CDA3E5976F9E6)
         1. [FUNCTION: `TCL-LIMIT-REMOVE-HANDLER`](#api-function-tcl-limit-remove-handler_8BEA5E01BEEA520589317080D44ADD11)
         1. [FUNCTION: `TCL-LIMIT-SET-COMMANDS`](#api-function-tcl-limit-set-commands_2454A49EA61E0A144C9E7535C6DE7DE9)
         1. [FUNCTION: `TCL-LIMIT-SET-GRANULARITY`](#api-function-tcl-limit-set-granularity_29E8C5A29BF5E2A82C0FA0598A21B8AF)
         1. [FUNCTION: `TCL-LIMIT-SET-TIME`](#api-function-tcl-limit-set-time_FB1C8670F621637C0E7EA3B5A527F816)
         1. [FUNCTION: `TCL-LIMIT-TYPE-ENABLED`](#api-function-tcl-limit-type-enabled_66F97ADAA626E4E4C67901C9243BC688)
         1. [FUNCTION: `TCL-LIMIT-TYPE-EXCEEDED`](#api-function-tcl-limit-type-exceeded_6351D3794EA70D394610747C236C2AC4)
         1. [FUNCTION: `TCL-LIMIT-TYPE-RESET`](#api-function-tcl-limit-type-reset_1E7603D8261D098D2BA2A84BC77B8C14)
         1. [FUNCTION: `TCL-LIMIT-TYPE-SET`](#api-function-tcl-limit-type-set_CB9BC00B7B63D8454EEE24955F907DCF)
         1. [FUNCTION: `TCL-LINK-ARRAY`](#api-function-tcl-link-array_5FB0329C078D2A6B3E2835B195AFCF0E)
         1. [FUNCTION: `TCL-LINK-VAR`](#api-function-tcl-link-var_27E760F1574DC738E8C232108B677157)
         1. [FUNCTION: `TCL-LIST-OBJ-APPEND-ELEMENT`](#api-function-tcl-list-obj-append-element_A4DCB93BB4745BF4D570E6D5001DBC63)
         1. [FUNCTION: `TCL-LIST-OBJ-APPEND-LIST`](#api-function-tcl-list-obj-append-list_D86F7F831EDDF6BB07D8F002E76F8D4B)
         1. [FUNCTION: `TCL-LIST-OBJ-GET-ELEMENTS`](#api-function-tcl-list-obj-get-elements_1701C94E4B1C11767DC7F3633C70C78C)
         1. [FUNCTION: `TCL-LIST-OBJ-INDEX`](#api-function-tcl-list-obj-index_EFBF06FE58E93AF49929EE781A4D478A)
         1. [FUNCTION: `TCL-LIST-OBJ-LENGTH`](#api-function-tcl-list-obj-length_4BC4A852DF839F468BA90E74C9BF3D37)
         1. [FUNCTION: `TCL-LIST-OBJ-REPLACE`](#api-function-tcl-list-obj-replace_9E9493B55CAA023DECF75473F4402D7B)
         1. [FUNCTION: `TCL-LOAD-FILE`](#api-function-tcl-load-file_F7820322DBDA07762CA6E4CC48248239)
         1. [FUNCTION: `TCL-LOG-COMMAND-INFO`](#api-function-tcl-log-command-info_6BA2BD1B4F4F5D1E1F34D4198A4EDDB8)
         1. [FUNCTION: `TCL-MAIN-EX`](#api-function-tcl-main-ex_06B5EE9E8B90A9B0F8B593465D26F6BD)
         1. [FUNCTION: `TCL-MAKE-FILE-CHANNEL`](#api-function-tcl-make-file-channel_34BD79CB250734DECCE842E6F15BE40A)
         1. [FUNCTION: `TCL-MAKE-TCP-CLIENT-CHANNEL`](#api-function-tcl-make-tcp-client-channel_3D4BF4E3F320D3EA80A94826C900EB84)
         1. [FUNCTION: `TCL-MERGE`](#api-function-tcl-merge_B4104A3BC8728058D1C87654D38E69DA)
         1. [FUNCTION: `TCL-MUTEX-FINALIZE`](#api-function-tcl-mutex-finalize_919E5D9D2F2C5162D215795E1B5E8CD4)
         1. [FUNCTION: `TCL-MUTEX-LOCK`](#api-function-tcl-mutex-lock_BB3598824F24F2B9064E261210130443)
         1. [FUNCTION: `TCL-MUTEX-UNLOCK`](#api-function-tcl-mutex-unlock_A604FDA0B035D887D9E036B887FF761E)
         1. [FUNCTION: `TCL-NEW-BIGNUM-OBJ`](#api-function-tcl-new-bignum-obj_0C761806FC8616F1873E37A3650F7B41)
         1. [FUNCTION: `TCL-NEW-BOOLEAN-OBJ`](#api-function-tcl-new-boolean-obj_C2879A7695490224530CB71E11DCC76F)
         1. [FUNCTION: `TCL-NEW-BYTE-ARRAY-OBJ`](#api-function-tcl-new-byte-array-obj_11ED7E92F4A471910571B72460639626)
         1. [FUNCTION: `TCL-NEW-DOUBLE-OBJ`](#api-function-tcl-new-double-obj_32F848D1CB5C326346386AAE4917A2BD)
         1. [FUNCTION: `TCL-NEW-INT-OBJ`](#api-function-tcl-new-int-obj_D19B0CBF1A526320C711EDF2C7C4665D)
         1. [FUNCTION: `TCL-NEW-LIST-OBJ`](#api-function-tcl-new-list-obj_28055292E664F074ACB818686EE74291)
         1. [FUNCTION: `TCL-NEW-LONG-OBJ`](#api-function-tcl-new-long-obj_87A821636FAA254559726C499A2A027C)
         1. [FUNCTION: `TCL-NEW-STRING-OBJ`](#api-function-tcl-new-string-obj_1DBCAD1F82D59079F2A93748469C2594)
         1. [FUNCTION: `TCL-NEW-UNICODE-OBJ`](#api-function-tcl-new-unicode-obj_B0E1E3A6DE101743977C3C870E2E9CD6)
         1. [FUNCTION: `TCL-NEW-WIDE-INT-OBJ`](#api-function-tcl-new-wide-int-obj_DE96E3F55D2234D5C6A366CC973B0269)
         1. [FUNCTION: `TCL-NEW-WIDE-U-INT-OBJ`](#api-function-tcl-new-wide-u-int-obj_123BCE596E4FB7880A067EA897946821)
         1. [FUNCTION: `TCL-NEXT-HASH-ENTRY`](#api-function-tcl-next-hash-entry_CF5AC91DFC5031CB2D32040982734087)
         1. [FUNCTION: `TCL-NOTIFY-CHANNEL`](#api-function-tcl-notify-channel_33B794154D62E775CAE120310FD46319)
         1. [FUNCTION: `TCL-NR-ADD-CALLBACK`](#api-function-tcl-nr-add-callback_838184AE34F79B309C3B7DFFC3530812)
         1. [FUNCTION: `TCL-NR-CALL-OBJ-PROC2`](#api-function-tcl-nr-call-obj-proc2_4574A047766AC930CCF47A2143D2C9F6)
         1. [FUNCTION: `TCL-NR-CALL-OBJ-PROC`](#api-function-tcl-nr-call-obj-proc_BFEB7962C689FB02DDAF914700851C20)
         1. [FUNCTION: `TCL-NR-CMD-SWAP`](#api-function-tcl-nr-cmd-swap_F50E8992DB8C58577011458D0AB3A7B6)
         1. [FUNCTION: `TCL-NR-CREATE-COMMAND2`](#api-function-tcl-nr-create-command2_04DAB72BD518C5274172AA9B0091A782)
         1. [FUNCTION: `TCL-NR-CREATE-COMMAND`](#api-function-tcl-nr-create-command_2DAD06E31F6F83B037816A02F617A965)
         1. [FUNCTION: `TCL-NR-EVAL-OBJ`](#api-function-tcl-nr-eval-obj_682B4463697A2ADEB3DCB4BCA215C417)
         1. [FUNCTION: `TCL-NR-EVAL-OBJV`](#api-function-tcl-nr-eval-objv_26DB9642635691CB951184654B2BA42C)
         1. [FUNCTION: `TCL-NR-EXPR-OBJ`](#api-function-tcl-nr-expr-obj_C5CA90D979D29A7CC93DD3B0AFA20E50)
         1. [FUNCTION: `TCL-NR-SUBST-OBJ`](#api-function-tcl-nr-subst-obj_4E59AE68E387B6E67B3E78DB457BE0FC)
         1. [FUNCTION: `TCL-NUM-UTF-CHARS`](#api-function-tcl-num-utf-chars_C6A6469FDF31192C179544C68CAFFA2B)
         1. [FUNCTION: `TCL-OBJ-GET-VAR2`](#api-function-tcl-obj-get-var2_D3276FBC3CCDE84521E6414A72D6402D)
         1. [FUNCTION: `TCL-OBJ-SET-VAR2`](#api-function-tcl-obj-set-var2_DAEE89A1772BC211BC45659E88D42D64)
         1. [FUNCTION: `TCL-OPEN-COMMAND-CHANNEL`](#api-function-tcl-open-command-channel_1EF966F8EE1FB57DC9B0EDF493749F51)
         1. [FUNCTION: `TCL-OPEN-FILE-CHANNEL`](#api-function-tcl-open-file-channel_BA6A9D43D5DEEAE0D6289811CD72C79C)
         1. [FUNCTION: `TCL-OPEN-TCP-CLIENT`](#api-function-tcl-open-tcp-client_8A0C7E1EC9601727DFE5C1EF901A65DD)
         1. [FUNCTION: `TCL-OPEN-TCP-SERVER-EX`](#api-function-tcl-open-tcp-server-ex_43A392B4B3127C2253F9217F14C47CC2)
         1. [FUNCTION: `TCL-OPEN-TCP-SERVER`](#api-function-tcl-open-tcp-server_6E9E301214D69165CA353EADCCCF5A10)
         1. [FUNCTION: `TCL-OUTPUT-BUFFERED`](#api-function-tcl-output-buffered_450A9AD2AF1105136788027848A43578)
         1. [FUNCTION: `TCL-PARSE-ARGS-OBJV`](#api-function-tcl-parse-args-objv_BDD9EA4BA73622996C944EAD1075E001)
         1. [FUNCTION: `TCL-PARSE-BRACES`](#api-function-tcl-parse-braces_4338B826B912A3B15517AD0FCA264404)
         1. [FUNCTION: `TCL-PARSE-COMMAND`](#api-function-tcl-parse-command_4BDC34DABE69D34D4AC4F7F0319673CB)
         1. [FUNCTION: `TCL-PARSE-EXPR`](#api-function-tcl-parse-expr_75FFB34B24E497C192E09D3845CCC38E)
         1. [FUNCTION: `TCL-PARSE-QUOTED-STRING`](#api-function-tcl-parse-quoted-string_62E83E5E4BBFB97EA3D4E72B263AB5E8)
         1. [FUNCTION: `TCL-PARSE-VAR-NAME`](#api-function-tcl-parse-var-name_4737F2B19B185196EC41BEE90C27EA4C)
         1. [FUNCTION: `TCL-PARSE-VAR`](#api-function-tcl-parse-var_F725CB280F819C3DA36C75D45547A03F)
         1. [FUNCTION: `TCL-PKG-INIT-STUBS-CHECK`](#api-function-tcl-pkg-init-stubs-check_36E2BD97D99A1A8C221563F5F17CDCB9)
         1. [FUNCTION: `TCL-PKG-PRESENT-EX`](#api-function-tcl-pkg-present-ex_F40629F8F2A2FC8C60E6DEE202931962)
         1. [FUNCTION: `TCL-PKG-PRESENT`](#api-function-tcl-pkg-present_B6B0A8262E00993F33B327A5C251F137)
         1. [FUNCTION: `TCL-PKG-PROVIDE-EX`](#api-function-tcl-pkg-provide-ex_4A9D924F1266FA508D7E69470F94E675)
         1. [FUNCTION: `TCL-PKG-PROVIDE`](#api-function-tcl-pkg-provide_8779CC3FE854739214F58CE30D909E7F)
         1. [FUNCTION: `TCL-PKG-REQUIRE-EX`](#api-function-tcl-pkg-require-ex_09213765CD031C7D7FF9666BCC19CA42)
         1. [FUNCTION: `TCL-PKG-REQUIRE-PROC`](#api-function-tcl-pkg-require-proc_7B604F49DDD25824A250A1809E967F45)
         1. [FUNCTION: `TCL-PKG-REQUIRE`](#api-function-tcl-pkg-require_46716B0DE4B5D56E6347DDD2BD281392)
         1. [FUNCTION: `TCL-POSIX-ERROR`](#api-function-tcl-posix-error_F4EDDE5120F21D28B23BE9AA9491B10D)
         1. [FUNCTION: `TCL-PRESERVE`](#api-function-tcl-preserve_8BAC44456A8585A7F9EAB406BB0B422D)
         1. [FUNCTION: `TCL-PRINT-DOUBLE`](#api-function-tcl-print-double_86691BCD53E3959FEE8AD748814DB268)
         1. [FUNCTION: `TCL-PROC-OBJ-CMD`](#api-function-tcl-proc-obj-cmd_2A17BA0A770AD93F05D8AE6895AC08CC)
         1. [FUNCTION: `TCL-PUT-ENV`](#api-function-tcl-put-env_856068A92CF2A241B6FF44E8DA8EC1AB)
         1. [FUNCTION: `TCL-QUERY-TIME-PROC`](#api-function-tcl-query-time-proc_78E7E7E58E6F189A091A32F2AB90FE33)
         1. [FUNCTION: `TCL-QUEUE-EVENT`](#api-function-tcl-queue-event_AF2306561893B2474CF0D56EAB0AACCC)
         1. [FUNCTION: `TCL-READ-CHARS`](#api-function-tcl-read-chars_D7CC108E67C064F50B29182FF9C1DFE1)
         1. [FUNCTION: `TCL-READ-RAW`](#api-function-tcl-read-raw_CDD9C1D03BF7440B1C1E7EE69A5EA48F)
         1. [FUNCTION: `TCL-READ`](#api-function-tcl-read_A451B06A1B3119C8CA125A7DF3B35793)
         1. [FUNCTION: `TCL-REALLOC`](#api-function-tcl-realloc_BAD92074F58755F7E605A75FDC6D448C)
         1. [FUNCTION: `TCL-RECORD-AND-EVAL-OBJ`](#api-function-tcl-record-and-eval-obj_D9CC3DF6171E909A712F3342309C4A63)
         1. [FUNCTION: `TCL-RECORD-AND-EVAL`](#api-function-tcl-record-and-eval_4A7076F57FDF2F50BF022CB8C2BAC0FC)
         1. [FUNCTION: `TCL-REG-EXP-COMPILE`](#api-function-tcl-reg-exp-compile_52B357553BDC6BA9A4A21AABEBDA384C)
         1. [FUNCTION: `TCL-REG-EXP-EXEC-OBJ`](#api-function-tcl-reg-exp-exec-obj_52893109CC16892B7070E9D068C89883)
         1. [FUNCTION: `TCL-REG-EXP-EXEC`](#api-function-tcl-reg-exp-exec_0638612C9C247354F811520E27643936)
         1. [FUNCTION: `TCL-REG-EXP-GET-INFO`](#api-function-tcl-reg-exp-get-info_46D9D7DEAA375A37471E43E07B84EEBA)
         1. [FUNCTION: `TCL-REG-EXP-MATCH-OBJ`](#api-function-tcl-reg-exp-match-obj_AC14D55049A21324128EE0D4481361DC)
         1. [FUNCTION: `TCL-REG-EXP-MATCH`](#api-function-tcl-reg-exp-match_CAB8CAFCCBBF016566DE59B92CA824AE)
         1. [FUNCTION: `TCL-REG-EXP-RANGE`](#api-function-tcl-reg-exp-range_52783409C0181A15C8F3C942F708ED63)
         1. [FUNCTION: `TCL-REGISTER-CHANNEL`](#api-function-tcl-register-channel_E704933EBE18F9C8D4AFE3072F29C4F0)
         1. [FUNCTION: `TCL-REGISTER-CONFIG`](#api-function-tcl-register-config_8A63518588B6A948AB9FB0933E6EE79A)
         1. [FUNCTION: `TCL-REGISTER-OBJ-TYPE`](#api-function-tcl-register-obj-type_F23BF7285DAC015D80A88DE85F667CC6)
         1. [FUNCTION: `TCL-RELEASE`](#api-function-tcl-release_7127EA2D536E88173E056C684ECC4BBC)
         1. [FUNCTION: `TCL-REMOVE-CHANNEL-MODE`](#api-function-tcl-remove-channel-mode_32BD004E56D12832FF6DA5F003764851)
         1. [FUNCTION: `TCL-RESET-RESULT`](#api-function-tcl-reset-result_83000F361C6DACEF25C36E6FF67CFD1E)
         1. [FUNCTION: `TCL-RESTORE-INTERP-STATE`](#api-function-tcl-restore-interp-state_2DC93D4BE1BA2305ECE779D4B8619FD9)
         1. [FUNCTION: `TCL-SAVE-INTERP-STATE`](#api-function-tcl-save-interp-state_B86B36A6F6EF4FD04D9DC619746D16EA)
         1. [FUNCTION: `TCL-SCAN-COUNTED-ELEMENT`](#api-function-tcl-scan-counted-element_F9030807F9F2BAA4D36B98B5A72729DD)
         1. [FUNCTION: `TCL-SCAN-ELEMENT`](#api-function-tcl-scan-element_A18229B10DAA3BD37569198A8F1C48E0)
         1. [FUNCTION: `TCL-SEEK`](#api-function-tcl-seek_8A9AAF550D6145F71160E8BFBCD95619)
         1. [FUNCTION: `TCL-SERVICE-EVENT`](#api-function-tcl-service-event_4D8B1195FC62FFE98C63D2C95C99F1ED)
         1. [FUNCTION: `TCL-SERVICE-MODE-HOOK`](#api-function-tcl-service-mode-hook_2ED5BD3E2B26125AB119B38CE3FE1B89)
         1. [FUNCTION: `TCL-SET-ASSOC-DATA`](#api-function-tcl-set-assoc-data_17BF69433A293A7EEA8EAC5C811C3FE6)
         1. [FUNCTION: `TCL-SET-BIGNUM-OBJ`](#api-function-tcl-set-bignum-obj_625F4EB6090CC5F036912D152FBE37EB)
         1. [FUNCTION: `TCL-SET-BOOLEAN-OBJ`](#api-function-tcl-set-boolean-obj_C604B7CE829374334C71101C35B7A47A)
         1. [FUNCTION: `TCL-SET-BYTE-ARRAY-LENGTH`](#api-function-tcl-set-byte-array-length_5A15433B3442C744CFDB11DEDB234C8F)
         1. [FUNCTION: `TCL-SET-BYTE-ARRAY-OBJ`](#api-function-tcl-set-byte-array-obj_F3B51567F89A262FFEBD9F0A969F14C6)
         1. [FUNCTION: `TCL-SET-CHANNEL-BUFFER-SIZE`](#api-function-tcl-set-channel-buffer-size_B8C69787E728CD7DE7D0C3C66EA3A23A)
         1. [FUNCTION: `TCL-SET-CHANNEL-ERROR-INTERP`](#api-function-tcl-set-channel-error-interp_7F19C6007DDE265001F8F548EC0BB320)
         1. [FUNCTION: `TCL-SET-CHANNEL-ERROR`](#api-function-tcl-set-channel-error_8CEF2A0FA018AC9512E5A80387CDF25A)
         1. [FUNCTION: `TCL-SET-CHANNEL-OPTION`](#api-function-tcl-set-channel-option_92A8EC8CCBDE49773D7DA05559A40B80)
         1. [FUNCTION: `TCL-SET-COMMAND-INFO-FROM-TOKEN`](#api-function-tcl-set-command-info-from-token_0DA53AD23B30C8CC0450580C13BC07EE)
         1. [FUNCTION: `TCL-SET-COMMAND-INFO`](#api-function-tcl-set-command-info_42855946F4C29D4A444F46974FCBBC5B)
         1. [FUNCTION: `TCL-SET-DOUBLE-OBJ`](#api-function-tcl-set-double-obj_CC0ED5F9438C909363FEC137C038BC78)
         1. [FUNCTION: `TCL-SET-ENCODING-SEARCH-PATH`](#api-function-tcl-set-encoding-search-path_8E11986EC94BD0637E43DC2D88D9D2DA)
         1. [FUNCTION: `TCL-SET-ENSEMBLE-FLAGS`](#api-function-tcl-set-ensemble-flags_DB25CD1A6E28A2299FAF936662B1E5F1)
         1. [FUNCTION: `TCL-SET-ENSEMBLE-MAPPING-DICT`](#api-function-tcl-set-ensemble-mapping-dict_52622FA1AB479494A0B0D462355498FD)
         1. [FUNCTION: `TCL-SET-ENSEMBLE-PARAMETER-LIST`](#api-function-tcl-set-ensemble-parameter-list_1DCF982D74F9D7A9CEE04AB3F3A4465B)
         1. [FUNCTION: `TCL-SET-ENSEMBLE-SUBCOMMAND-LIST`](#api-function-tcl-set-ensemble-subcommand-list_784F82A5AED2A21383EFDCC5F46041A9)
         1. [FUNCTION: `TCL-SET-ENSEMBLE-UNKNOWN-HANDLER`](#api-function-tcl-set-ensemble-unknown-handler_5EA2ADAAFFFC59799EFF3D4161C3BF19)
         1. [FUNCTION: `TCL-SET-ERRNO`](#api-function-tcl-set-errno_6B1B00C6A386B29CB48697AD104E18F1)
         1. [FUNCTION: `TCL-SET-ERROR-LINE`](#api-function-tcl-set-error-line_97EC2EA0211CD5323A413145BE17C15D)
         1. [FUNCTION: `TCL-SET-INT-OBJ`](#api-function-tcl-set-int-obj_99DEA31BB1B883E7026627BCB895B6A3)
         1. [FUNCTION: `TCL-SET-LIST-OBJ`](#api-function-tcl-set-list-obj_35231A3457970A2E1DE9AAECA8987AA5)
         1. [FUNCTION: `TCL-SET-LONG-OBJ`](#api-function-tcl-set-long-obj_1C94DE270C07990C639EF807C7013A47)
         1. [FUNCTION: `TCL-SET-MAIN-LOOP`](#api-function-tcl-set-main-loop_2D2042A330741AEF324D70AC70F2A330)
         1. [FUNCTION: `TCL-SET-MAX-BLOCK-TIME`](#api-function-tcl-set-max-block-time_02D35B8BA60B2B4135F1FA55D87C3FDC)
         1. [FUNCTION: `TCL-SET-NAMESPACE-UNKNOWN-HANDLER`](#api-function-tcl-set-namespace-unknown-handler_0F5DA2962EC091C7AD23DE009D0BD4DB)
         1. [FUNCTION: `TCL-SET-NOTIFIER`](#api-function-tcl-set-notifier_00730F54D4B221006047C17393567120)
         1. [FUNCTION: `TCL-SET-OBJ-ERROR-CODE`](#api-function-tcl-set-obj-error-code_5BF38A06ABEFF760CC7FE7D143D450EF)
         1. [FUNCTION: `TCL-SET-OBJ-LENGTH`](#api-function-tcl-set-obj-length_B4E21766F9F5228AE5E5882AC7BB2D4C)
         1. [FUNCTION: `TCL-SET-OBJ-NAME-OF-EXECUTABLE`](#api-function-tcl-set-obj-name-of-executable_59570B98BCF1A15422BFE30F108ED200)
         1. [FUNCTION: `TCL-SET-OBJ-RESULT`](#api-function-tcl-set-obj-result_FD0EEA2047E3F7A169D7FBCE61816363)
         1. [FUNCTION: `TCL-SET-PANIC-PROC`](#api-function-tcl-set-panic-proc_B4E0B2D4BBB9819CFAD23519D09C0C6F)
         1. [FUNCTION: `TCL-SET-PRE-INIT-SCRIPT`](#api-function-tcl-set-pre-init-script_8EC47C54A6C9BE98300DF8C5712EC39C)
         1. [FUNCTION: `TCL-SET-RECURSION-LIMIT`](#api-function-tcl-set-recursion-limit_E5F244E98F0D8E14A5BBFC57C6CB554E)
         1. [FUNCTION: `TCL-SET-RESULT`](#api-function-tcl-set-result_F202CC768931F8FF1F70D022C25EECF4)
         1. [FUNCTION: `TCL-SET-RETURN-OPTIONS`](#api-function-tcl-set-return-options_AF53917230994BBC93057833083FB153)
         1. [FUNCTION: `TCL-SET-SERVICE-MODE`](#api-function-tcl-set-service-mode_FD9AD7F89EA810ACD25F02D822303ABC)
         1. [FUNCTION: `TCL-SET-STARTUP-SCRIPT`](#api-function-tcl-set-startup-script_FF6939ECBAF4DD9DFEE471039F178F1E)
         1. [FUNCTION: `TCL-SET-STD-CHANNEL`](#api-function-tcl-set-std-channel_D8420222F96112D884EAD349D52CC08C)
         1. [FUNCTION: `TCL-SET-STRING-OBJ`](#api-function-tcl-set-string-obj_1A94675A95A0D04389ACE159D02E8514)
         1. [FUNCTION: `TCL-SET-SYSTEM-ENCODING`](#api-function-tcl-set-system-encoding_4A3367178B2E1319FCBBC8958F2230CC)
         1. [FUNCTION: `TCL-SET-TIME-PROC`](#api-function-tcl-set-time-proc_6D654674B39CC2FCCB500637550B75DC)
         1. [FUNCTION: `TCL-SET-TIMER`](#api-function-tcl-set-timer_0B9155D119A8CCB27DE9A449DF02BD1A)
         1. [FUNCTION: `TCL-SET-UNICODE-OBJ`](#api-function-tcl-set-unicode-obj_90DC373A16C9482753A77B84DB8D3BF7)
         1. [FUNCTION: `TCL-SET-VAR2-EX`](#api-function-tcl-set-var2-ex_627EB384A8929CB690934C0409385275)
         1. [FUNCTION: `TCL-SET-VAR2`](#api-function-tcl-set-var2_94A7E349DE7144097720EA49F2C21ADB)
         1. [FUNCTION: `TCL-SET-VAR`](#api-function-tcl-set-var_1EA3AA2DCFF3B96E20A214C0AC327059)
         1. [FUNCTION: `TCL-SET-WIDE-INT-OBJ`](#api-function-tcl-set-wide-int-obj_25522A3C691B651F5FDA0878F61211E9)
         1. [FUNCTION: `TCL-SET-WIDE-U-INT-OBJ`](#api-function-tcl-set-wide-u-int-obj_7CC68BE0AF19CD3D33B201695AB96A59)
         1. [FUNCTION: `TCL-SIGNAL-ID`](#api-function-tcl-signal-id_192A401897150F87BDE9302D53878489)
         1. [FUNCTION: `TCL-SIGNAL-MSG`](#api-function-tcl-signal-msg_526583F286C4A1B2AC08E1161D0BF821)
         1. [FUNCTION: `TCL-SLEEP`](#api-function-tcl-sleep_51BDAFE8AFCF0444D8D84E1A27AB5042)
         1. [FUNCTION: `TCL-SOURCE-RC-FILE`](#api-function-tcl-source-rc-file_1EA5E5BDA421A9FE8F0757D20BFFD9A9)
         1. [FUNCTION: `TCL-SPLICE-CHANNEL`](#api-function-tcl-splice-channel_50A0CBAD6B9808D37A90F25E030BC82C)
         1. [FUNCTION: `TCL-SPLIT-LIST`](#api-function-tcl-split-list_2461CE263C8181008BDFD5A5023103B9)
         1. [FUNCTION: `TCL-SPLIT-PATH`](#api-function-tcl-split-path_87D84F938606511D026A2B22A5C56AF8)
         1. [FUNCTION: `TCL-STACK-CHANNEL`](#api-function-tcl-stack-channel_C9EBD8841E85ED50A07C6ED2ED244788)
         1. [FUNCTION: `TCL-STAT`](#api-function-tcl-stat_9CF871AE44D842961815ED5402370DAE)
         1. [FUNCTION: `TCL-STATIC-LIBRARY`](#api-function-tcl-static-library_650F6DDF751E2A1FC7E04F510CD2899F)
         1. [FUNCTION: `TCL-STORE-INTERNAL-REP`](#api-function-tcl-store-internal-rep_758BE08F73309FA8A316BA004543CC8E)
         1. [FUNCTION: `TCL-STRING-CASE-MATCH`](#api-function-tcl-string-case-match_F7F1BB8422D30342278023CEC22D72DB)
         1. [FUNCTION: `TCL-STRING-MATCH`](#api-function-tcl-string-match_1AE798AE958C1A9AA087632EE46D0AA0)
         1. [FUNCTION: `TCL-STUB-CALL`](#api-function-tcl-stub-call_7D5D6B9AED5FEBAF6AE541BDC7DA5995)
         1. [FUNCTION: `TCL-SUBST-OBJ`](#api-function-tcl-subst-obj_0BE8B7478483E01689BB3859421BDDD1)
         1. [FUNCTION: `TCL-TAKE-BIGNUM-FROM-OBJ`](#api-function-tcl-take-bignum-from-obj_FEE50E25B03EC12A1BF607DF1B57F513)
         1. [FUNCTION: `TCL-TELL`](#api-function-tcl-tell_FD776D2D2C36FF067CBEDA47504BBD93)
         1. [FUNCTION: `TCL-THREAD-ALERT`](#api-function-tcl-thread-alert_81765DD9867DBEE9460D0A89AC303247)
         1. [FUNCTION: `TCL-THREAD-QUEUE-EVENT`](#api-function-tcl-thread-queue-event_51247883145089591456E69369B91078)
         1. [FUNCTION: `TCL-TOM-MATH-INITIALIZE-STUBS`](#api-function-tcl-tom-math-initialize-stubs_290BE48AF0AA2CC74FE9227FC2BFCB21)
         1. [FUNCTION: `TCL-TRACE-COMMAND`](#api-function-tcl-trace-command_C402374F2AF675DF2EF9CDA937B7F30A)
         1. [FUNCTION: `TCL-TRACE-VAR2`](#api-function-tcl-trace-var2_FD43ED4DE45E3D55C4BE7EE8DF928B7C)
         1. [FUNCTION: `TCL-TRACE-VAR`](#api-function-tcl-trace-var_EA702A0C76B50B2AE5BB770EC9BAA20A)
         1. [FUNCTION: `TCL-TRANSFER-RESULT`](#api-function-tcl-transfer-result_FDD83B1B7161430C5088D388EAEE9F6B)
         1. [FUNCTION: `TCL-TRANSLATE-FILE-NAME`](#api-function-tcl-translate-file-name_3F2FEFADEF4D1F2F4C421F8663F4D930)
         1. [FUNCTION: `TCL-TRUNCATE-CHANNEL`](#api-function-tcl-truncate-channel_38372B1738C1FAA2575039CBC6B2D709)
         1. [FUNCTION: `TCL-UNGETS`](#api-function-tcl-ungets_93078B960ACCD1A3D75AD6903120FC26)
         1. [FUNCTION: `TCL-UNI-CHAR-AT-INDEX`](#api-function-tcl-uni-char-at-index_70D7B3989E4AB8FD5ABCFA0FE7A7F0B8)
         1. [FUNCTION: `TCL-UNI-CHAR-IS-ALNUM`](#api-function-tcl-uni-char-is-alnum_1B86F182C4DDCDA556CD7B4D96940832)
         1. [FUNCTION: `TCL-UNI-CHAR-IS-ALPHA`](#api-function-tcl-uni-char-is-alpha_CA6DCFAAB2A37AF0259125D271A9FC85)
         1. [FUNCTION: `TCL-UNI-CHAR-IS-CONTROL`](#api-function-tcl-uni-char-is-control_0C8500E7D8105EFBDC1C8C4C7CCF0E06)
         1. [FUNCTION: `TCL-UNI-CHAR-IS-DIGIT`](#api-function-tcl-uni-char-is-digit_46C8D886C821CF1534CB4441C88AF3FD)
         1. [FUNCTION: `TCL-UNI-CHAR-IS-GRAPH`](#api-function-tcl-uni-char-is-graph_F7B20DE27095664E45BD04248AF56704)
         1. [FUNCTION: `TCL-UNI-CHAR-IS-LOWER`](#api-function-tcl-uni-char-is-lower_71FC8F5C9BAA3D747FB5A195BBAAC62E)
         1. [FUNCTION: `TCL-UNI-CHAR-IS-PRINT`](#api-function-tcl-uni-char-is-print_75C62BD15DDE9948AE066FAC2245F1D3)
         1. [FUNCTION: `TCL-UNI-CHAR-IS-PUNCT`](#api-function-tcl-uni-char-is-punct_A5A42DE41D4B24C8BD3125EF76B009E6)
         1. [FUNCTION: `TCL-UNI-CHAR-IS-SPACE`](#api-function-tcl-uni-char-is-space_A4EDC24A502D409F2E8D3E495B85658D)
         1. [FUNCTION: `TCL-UNI-CHAR-IS-UPPER`](#api-function-tcl-uni-char-is-upper_0F04586349366694A734ACE23633E4E0)
         1. [FUNCTION: `TCL-UNI-CHAR-IS-WORD-CHAR`](#api-function-tcl-uni-char-is-word-char_80DB3AA5D2D47C2262AE979604707DC7)
         1. [FUNCTION: `TCL-UNI-CHAR-LEN`](#api-function-tcl-uni-char-len_EA98542E23AD90B024B3D2B460729FB0)
         1. [FUNCTION: `TCL-UNI-CHAR-TO-LOWER`](#api-function-tcl-uni-char-to-lower_CF6D7009B9DF288BB2123F85CB176A94)
         1. [FUNCTION: `TCL-UNI-CHAR-TO-TITLE`](#api-function-tcl-uni-char-to-title_0C830D0977ED48DA2246B46C449AE7A7)
         1. [FUNCTION: `TCL-UNI-CHAR-TO-UPPER`](#api-function-tcl-uni-char-to-upper_A15C36C8FEFA6F81593826404029542D)
         1. [FUNCTION: `TCL-UNI-CHAR-TO-UTF-D-STRING`](#api-function-tcl-uni-char-to-utf-d-string_4B2C83AAC1F2594C4E4908BCFE715622)
         1. [FUNCTION: `TCL-UNI-CHAR-TO-UTF`](#api-function-tcl-uni-char-to-utf_B804DF1250CBB2C0F3AD4B6751D34F5D)
         1. [FUNCTION: `TCL-UNLINK-VAR`](#api-function-tcl-unlink-var_D1DDAACC676EE4B18D31DC5B8B0D8253)
         1. [FUNCTION: `TCL-UNREGISTER-CHANNEL`](#api-function-tcl-unregister-channel_461CBA68FFDDDE52EDAE5282904B9A2D)
         1. [FUNCTION: `TCL-UNSET-VAR2`](#api-function-tcl-unset-var2_524E735DB71076403BC4FD092BF8AECF)
         1. [FUNCTION: `TCL-UNSET-VAR`](#api-function-tcl-unset-var_1FDAF2E64AC0A560A2A90A77119884FF)
         1. [FUNCTION: `TCL-UNSTACK-CHANNEL`](#api-function-tcl-unstack-channel_185C0EF81C2DD891E412BA308FC63018)
         1. [FUNCTION: `TCL-UNTRACE-COMMAND`](#api-function-tcl-untrace-command_CCBC93656A9A25BC77D05E397013B228)
         1. [FUNCTION: `TCL-UNTRACE-VAR2`](#api-function-tcl-untrace-var2_CF7444786757A09E0896EEE079512E60)
         1. [FUNCTION: `TCL-UNTRACE-VAR`](#api-function-tcl-untrace-var_5BCAA3F3E9C9CB5CBE6F68BBFA0D0E3B)
         1. [FUNCTION: `TCL-UP-VAR2`](#api-function-tcl-up-var2_ADA13FD9B24CB00F27D48D2B27EFA2DF)
         1. [FUNCTION: `TCL-UP-VAR`](#api-function-tcl-up-var_F4C58D9BDCECBE128E205C432807898E)
         1. [FUNCTION: `TCL-UPDATE-LINKED-VAR`](#api-function-tcl-update-linked-var_1CA30DBB019E90B55B725C481D294FFE)
         1. [FUNCTION: `TCL-UTF-AT-INDEX`](#api-function-tcl-utf-at-index_D3A6B4C2B0AD85A8D62BE91A2706CA5D)
         1. [FUNCTION: `TCL-UTF-BACKSLASH*`](#api-function-tcl-utf-backslash_DCE23598DD6A2FD07EABD4D8C2AC8B92)
         1. [FUNCTION: `TCL-UTF-BACKSLASH`](#api-function-tcl-utf-backslash_EFB001E6EABD303BB1ACDF446DBCE532)
         1. [FUNCTION: `TCL-UTF-CHAR-COMPLETE`](#api-function-tcl-utf-char-complete_41BFB4677D787DBA4071434EBC09F9BA)
         1. [FUNCTION: `TCL-UTF-FIND-FIRST`](#api-function-tcl-utf-find-first_256FECEE0097A00EDA176B9AEB37297A)
         1. [FUNCTION: `TCL-UTF-FIND-LAST`](#api-function-tcl-utf-find-last_A5F80B7DEC7F44E7A5FE0E652DA82D47)
         1. [FUNCTION: `TCL-UTF-NCASECMP`](#api-function-tcl-utf-ncasecmp_20B3D42829014B3C060BCA36901287FB)
         1. [FUNCTION: `TCL-UTF-NCMP`](#api-function-tcl-utf-ncmp_A73D8BC88B03C3BEB71ED02A28FD69CA)
         1. [FUNCTION: `TCL-UTF-NEXT`](#api-function-tcl-utf-next_D481A578E0DBCA387792502FB431584A)
         1. [FUNCTION: `TCL-UTF-PREV`](#api-function-tcl-utf-prev_4BB26666A0D702FDAE41F1CEFC382563)
         1. [FUNCTION: `TCL-UTF-TO-CHAR16-D-STRING`](#api-function-tcl-utf-to-char16-d-string_B714109C4CE7F072DADC971645DB4A30)
         1. [FUNCTION: `TCL-UTF-TO-CHAR16`](#api-function-tcl-utf-to-char16_EA474C4D57FA4E23CAD8312284F4B1F3)
         1. [FUNCTION: `TCL-UTF-TO-EXTERNAL-D-STRING-EX`](#api-function-tcl-utf-to-external-d-string-ex_6F305657764C13F9864DE6CA356E59C3)
         1. [FUNCTION: `TCL-UTF-TO-EXTERNAL-D-STRING`](#api-function-tcl-utf-to-external-d-string_1DFF90D4E55EF412F8A4B591F9C80915)
         1. [FUNCTION: `TCL-UTF-TO-EXTERNAL`](#api-function-tcl-utf-to-external_499EED6B10C6B5507F0B4542777CD4DC)
         1. [FUNCTION: `TCL-UTF-TO-LOWER`](#api-function-tcl-utf-to-lower_39D2A26F2B21EEE3155BF36EF56B82B7)
         1. [FUNCTION: `TCL-UTF-TO-TITLE`](#api-function-tcl-utf-to-title_DB70F4DDFF5F6DB6BEEEC3221662E2A2)
         1. [FUNCTION: `TCL-UTF-TO-UNI-CHAR-D-STRING`](#api-function-tcl-utf-to-uni-char-d-string_6DEACE727434A93052AD848F67528D68)
         1. [FUNCTION: `TCL-UTF-TO-UNI-CHAR`](#api-function-tcl-utf-to-uni-char_3B7B4F6A31ADDB70DE17C570C59CD238)
         1. [FUNCTION: `TCL-UTF-TO-UPPER`](#api-function-tcl-utf-to-upper_D99E718EBFEB5757D8844AF22D967F8A)
         1. [FUNCTION: `TCL-VALIDATE-ALL-MEMORY`](#api-function-tcl-validate-all-memory_59FE1EFBBCA97FD4A06C6F43066D4B0F)
         1. [FUNCTION: `TCL-VAR-TRACE-INFO2`](#api-function-tcl-var-trace-info2_ABFFFD78452DED9C301A4739A8AEC312)
         1. [FUNCTION: `TCL-VAR-TRACE-INFO`](#api-function-tcl-var-trace-info_D602F810D839B934A1813F8EBA27EEE5)
         1. [FUNCTION: `TCL-WAIT-FOR-EVENT`](#api-function-tcl-wait-for-event_2662AD83940955EE77B56FF48E8E918E)
         1. [FUNCTION: `TCL-WAIT-PID`](#api-function-tcl-wait-pid_9CC00639CD09B1CBF07F53A062FE3CEA)
         1. [FUNCTION: `TCL-WRITE-CHARS`](#api-function-tcl-write-chars_24D5ED2DA10005675EFCF24750761A5C)
         1. [FUNCTION: `TCL-WRITE-OBJ`](#api-function-tcl-write-obj_87E06849D3A17BD9CA066378C120A782)
         1. [FUNCTION: `TCL-WRITE-RAW`](#api-function-tcl-write-raw_59711ED5FA87A0B2262DA1BF8E4B3732)
         1. [FUNCTION: `TCL-WRITE`](#api-function-tcl-write_51E75B51F2D892F358FA440C17A7377E)
         1. [FUNCTION: `TCL-WRONG-NUM-ARGS`](#api-function-tcl-wrong-num-args_C7A1880B7191393AAC1049A4075F31F5)
         1. [FUNCTION: `TCL-ZIPFS-MOUNT-BUFFER`](#api-function-tcl-zipfs-mount-buffer_68D1509793C6784D14F87C46156C077E)
         1. [FUNCTION: `TCL-ZIPFS-MOUNT`](#api-function-tcl-zipfs-mount_24016134C63581B2D4602A4332C84CE0)
         1. [FUNCTION: `TCL-ZIPFS-UNMOUNT`](#api-function-tcl-zipfs-unmount_F089284AA2E48CB0262BAE0E3B5210EF)
         1. [FUNCTION: `TCL-ZLIB-ADLER32`](#api-function-tcl-zlib-adler32_ED1B19932D2F60E29CA3A22A0D643576)
         1. [FUNCTION: `TCL-ZLIB-CRC32`](#api-function-tcl-zlib-crc32_0C7BC5D2266D2EC13C077D925755B44B)
         1. [FUNCTION: `TCL-ZLIB-DEFLATE`](#api-function-tcl-zlib-deflate_58B752334E9E1BA848B277928248ACA3)
         1. [FUNCTION: `TCL-ZLIB-INFLATE`](#api-function-tcl-zlib-inflate_4BE92A778143B264440B8104865C8E0D)
         1. [FUNCTION: `TCL-ZLIB-STREAM-CHECKSUM`](#api-function-tcl-zlib-stream-checksum_FF93E32640972B7124D830DFAD2D86E2)
         1. [FUNCTION: `TCL-ZLIB-STREAM-CLOSE`](#api-function-tcl-zlib-stream-close_199526A1357578A494F7CA93077D4A97)
         1. [FUNCTION: `TCL-ZLIB-STREAM-EOF`](#api-function-tcl-zlib-stream-eof_FE5A5DC6392307622B98742BAB0783E6)
         1. [FUNCTION: `TCL-ZLIB-STREAM-GET-COMMAND-NAME`](#api-function-tcl-zlib-stream-get-command-name_9F305F215AFF2C85F05B252103BF8712)
         1. [FUNCTION: `TCL-ZLIB-STREAM-GET`](#api-function-tcl-zlib-stream-get_4B30E8CF1F3835238E9DB6A4D6E5E6F2)
         1. [FUNCTION: `TCL-ZLIB-STREAM-INIT`](#api-function-tcl-zlib-stream-init_FA3CFDFF278F228E8CA07496230A4064)
         1. [FUNCTION: `TCL-ZLIB-STREAM-PUT`](#api-function-tcl-zlib-stream-put_1A69CD2B74A63070947C6D0B593F28E9)
         1. [FUNCTION: `TCL-ZLIB-STREAM-RESET`](#api-function-tcl-zlib-stream-reset_31DA168626142C1B4BC5A5217DF653E8)
         1. [FUNCTION: `TCL-ZLIB-STREAM-SET-COMPRESSION-DICTIONARY`](#api-function-tcl-zlib-stream-set-compression-dictionary_19EC77E1FCC92C87C9537211304C24E5)
         1. [FUNCTION: `TCL_DICT-OBJ-SIZE`](#api-function-tcldict-obj-size_407087EE4941E63AF0A1C1726A556CBD)
         1. [FUNCTION: `TCL_FS-SPLIT-PATH`](#api-function-tclfs-split-path_84BB63B920B8E228B9872E2535242CBB)
         1. [FUNCTION: `TCL_FSCREATEDIRECTORY`](#api-function-tclfscreatedirectory_096D7B7F9240A391FEE4EB23EA34BB90)
         1. [FUNCTION: `TCL_GET-ALIAS-OBJ`](#api-function-tclget-alias-obj_6E8551B38FB90265E75931FCD3D959A9)
         1. [FUNCTION: `TCL_GET-BYTES-FROM-OBJ`](#api-function-tclget-bytes-from-obj_B0BBF8C56B66F6845DE74D9583098E06)
         1. [FUNCTION: `TCL_GET-CHAR-LENGTH`](#api-function-tclget-char-length_627D76024CA7A29B59EBAF90060B64D9)
         1. [FUNCTION: `TCL_GET-RANGE`](#api-function-tclget-range_1B1785CFE613873D55B6C25C9BEAC4DC)
         1. [FUNCTION: `TCL_GET-STRING-FROM-OBJ`](#api-function-tclget-string-from-obj_D45EC34B4B2A8D408CFE9A8FC8FD2458)
         1. [FUNCTION: `TCL_GET-UNI-CHAR`](#api-function-tclget-uni-char_8002CB3DCB8F13904C1F074586CAA081)
         1. [FUNCTION: `TCL_GET-UNICODE-FROM-OBJ`](#api-function-tclget-unicode-from-obj_7671CF0D96309943AB8980A2D90DC8CA)
         1. [FUNCTION: `TCL_LIST-OBJ-GET-ELEMENTS`](#api-function-tcllist-obj-get-elements_ACDAB2D23871D262A9135F4B6F50A90E)
         1. [FUNCTION: `TCL_LIST-OBJ-LENGTH`](#api-function-tcllist-obj-length_4DCAF440026DB1C398CDAF596BC86E45)
         1. [FUNCTION: `TCL_NUM-UTF-CHARS`](#api-function-tclnum-utf-chars_BEA04CB570C4521A5E10841CB8AB2C8A)
         1. [FUNCTION: `TCL_PARSE-ARGS-OBJV`](#api-function-tclparse-args-objv_2D6A8CEE8668DFA63633A752DC281919)
         1. [FUNCTION: `TCL_SPLIT-LIST`](#api-function-tclsplit-list_24C8245BDE9E4433121D5D91F1E78D79)
         1. [FUNCTION: `TCL_SPLIT-PATH`](#api-function-tclsplit-path_41B92AB773A78D4892EAE16E358738E2)
         1. [FUNCTION: `TCL_UTF-AT-INDEX`](#api-function-tclutf-at-index_61D4503F57D8CBEF91576FB152A93580)
         1. [FUNCTION: `TCL_UTF-CHAR-COMPLETE`](#api-function-tclutf-char-complete_587614D82A0EC7A7C3F0F5BA19CBB423)
         1. [FUNCTION: `TCL_UTF-NCASECMP`](#api-function-tclutf-ncasecmp_7DB98799A636FA019858EAD56ED36D77)
         1. [FUNCTION: `TCL_UTF-NCMP`](#api-function-tclutf-ncmp_A8A3222C9C9AB5B93ADDAB7643CD767B)
         1. [FUNCTION: `TCL_UTF-NEXT`](#api-function-tclutf-next_B8C41AE36995A3A58B850D756C24F598)
         1. [FUNCTION: `TCL_UTF-PREV`](#api-function-tclutf-prev_7241B8109C69C06246784D5548D0E3EA)
         1. [FUNCTION: `TK-CREATE-CONSOLE-WINDOW`](#api-function-tk-create-console-window_85EEF8A7A34BE21B35B07A93FCF8F13A)
         1. [FUNCTION: `TK-INIT`](#api-function-tk-init_33E63E67AF3045A519EE86147D0AC920)
         1. [FUNCTION: `TK-SAFE-INIT`](#api-function-tk-safe-init_F640388FFE5FDE3334FE15FA3676E607)
         1. [MACRO: `OVERWRITE-FUNC`](#api-macro-overwrite-func_484E73874D3E255FE03F01BF26A06A53)
         1. [MACRO: `TCL-APPEND-PRINTF-TO-OBJ`](#api-macro-tcl-append-printf-to-obj_680E0354D6AEC37ADF79443F490CD584)
         1. [MACRO: `TCL-APPEND-RESULT`](#api-macro-tcl-append-result_1175997EEA639F1BBF2D9E346606F0D9)
         1. [MACRO: `TCL-APPEND-STRINGS-TO-OBJ`](#api-macro-tcl-append-strings-to-obj_BA27E5DCC1308BE9C80A5AB95408C312)
         1. [MACRO: `TCL-CONSOLE-PANIC`](#api-macro-tcl-console-panic_3573C3812F94E876672BE9D955370923)
         1. [MACRO: `TCL-OBJ-PRINTF`](#api-macro-tcl-obj-printf_52872E44BD420936BB6C1274EFE20B39)
         1. [MACRO: `TCL-PANIC`](#api-macro-tcl-panic_B1311C083BA12D464512A67233C72881)
         1. [MACRO: `TCL-SET-ERROR-CODE`](#api-macro-tcl-set-error-code_58A53B7228910F187A90ED8D8FA95887)
         1. [MACRO: `TCL-VAR-EVAL`](#api-macro-tcl-var-eval_34B00822AD74FF5AAF7D784F0BE60AFB)
         1. [VARIABLE: `%CFFI+TCL--WIDE-INT-P_TCL`](#api-variable-cffitcl-wide-int-ptcl_9396246E5DAAD3CAAE1706B75196092D)
         1. [VARIABLE: `*INITED*`](#api-variable-inited_0E6A7B3FD1097156F0826C0FB1545E71)
         1. [VARIABLE: `+NUM-STATIC-TOKENS+`](#api-variable-num-static-tokens_22A85C142C376F7484C68F6526ACCFF0)
         1. [VARIABLE: `+TCL-ALL-EVENTS+`](#api-variable-tcl-all-events_771C633C5F487D48338049304AA22723)
         1. [VARIABLE: `+TCL-ALLOW-INLINE-COMPILATION+`](#api-variable-tcl-allow-inline-compilation_AE8416DF9C096D5C87B402A474344CFF)
         1. [VARIABLE: `+TCL-ALPHA-RELEASE+`](#api-variable-tcl-alpha-release_0747F0ED6BAB51E046ABFBC1849B1CFE)
         1. [VARIABLE: `+TCL-APPEND-VALUE+`](#api-variable-tcl-append-value_5AD77509036A7042FDB0EE7FE69B79E9)
         1. [VARIABLE: `+TCL-ARGV-CONSTANT+`](#api-variable-tcl-argv-constant_46AF2600FA52FC3D4416D587C1A2A086)
         1. [VARIABLE: `+TCL-ARGV-END+`](#api-variable-tcl-argv-end_236167C8FB93A612C314F2A1BBDFED8B)
         1. [VARIABLE: `+TCL-ARGV-FLOAT+`](#api-variable-tcl-argv-float_3FB8BF2E21FDA8BC132F7DDCF6747E4A)
         1. [VARIABLE: `+TCL-ARGV-FUNC+`](#api-variable-tcl-argv-func_FD85FE78CACA5BF12CF1F7BE45D160C0)
         1. [VARIABLE: `+TCL-ARGV-GENFUNC+`](#api-variable-tcl-argv-genfunc_8F519C50E7A8EA025DD1427BD7C44700)
         1. [VARIABLE: `+TCL-ARGV-HELP+`](#api-variable-tcl-argv-help_4C792D2B48161BE332B21FDAE925136C)
         1. [VARIABLE: `+TCL-ARGV-INT+`](#api-variable-tcl-argv-int_9E5E38BA3F46D6F6A135B5061AF8A707)
         1. [VARIABLE: `+TCL-ARGV-REST+`](#api-variable-tcl-argv-rest_642B91C4FA5C41235800473FEAE5DE70)
         1. [VARIABLE: `+TCL-ARGV-STRING+`](#api-variable-tcl-argv-string_952AEC1107C2185FBE8D61B6DD2C31CE)
         1. [VARIABLE: `+TCL-AUTO-LENGTH+`](#api-variable-tcl-auto-length_28976F888BE855144569F86F3D948CA7)
         1. [VARIABLE: `+TCL-BETA-RELEASE+`](#api-variable-tcl-beta-release_89AD34E6591851B633D18D5C1F2F38A2)
         1. [VARIABLE: `+TCL-BREAK+`](#api-variable-tcl-break_3DF93D972E33AB6B4DBF96A76C649DC5)
         1. [VARIABLE: `+TCL-CANCEL-UNWIND+`](#api-variable-tcl-cancel-unwind_D68CBDE1A07A831223120ED826B297C1)
         1. [VARIABLE: `+TCL-CHANNEL-THREAD-INSERT+`](#api-variable-tcl-channel-thread-insert_47097B953EEAACBF6D4089A11310CCE6)
         1. [VARIABLE: `+TCL-CHANNEL-THREAD-REMOVE+`](#api-variable-tcl-channel-thread-remove_2D1ED69D2E1DAFFC3022EFBE8A61CE22)
         1. [VARIABLE: `+TCL-CHANNEL-VERSION-1+`](#api-variable-tcl-channel-version-1_22930EA5FF6E4C25CBA334EB13CFAE48)
         1. [VARIABLE: `+TCL-CHANNEL-VERSION-2+`](#api-variable-tcl-channel-version-2_24C7E8A7D70252DE4B9E07DA75E98DA0)
         1. [VARIABLE: `+TCL-CHANNEL-VERSION-3+`](#api-variable-tcl-channel-version-3_360BDB276B7EDCAB60799B5C2776C4D4)
         1. [VARIABLE: `+TCL-CHANNEL-VERSION-4+`](#api-variable-tcl-channel-version-4_3C367F17AEAEF2134825CA97ED7EB553)
         1. [VARIABLE: `+TCL-CHANNEL-VERSION-5+`](#api-variable-tcl-channel-version-5_1B3B5CE1F4AF7CE6EAD00D1ADCFE42D2)
         1. [VARIABLE: `+TCL-CLOSE-READ+`](#api-variable-tcl-close-read_C215A4A7FC07A96F9C1E25BED538C64B)
         1. [VARIABLE: `+TCL-CLOSE-WRITE+`](#api-variable-tcl-close-write_78EFA356D06E36C8D8FD9D55A4DB7422)
         1. [VARIABLE: `+TCL-CLOSE2PROC+`](#api-variable-tcl-close2proc_7033D8628DDF00DDFAFE525A2E291448)
         1. [VARIABLE: `+TCL-CODE-USER-MAX+`](#api-variable-tcl-code-user-max_E11400B6CE668C78AD10E0B424189315)
         1. [VARIABLE: `+TCL-CODE-USER-MIN+`](#api-variable-tcl-code-user-min_39916290D5526D42BA2BF7275698FC07)
         1. [VARIABLE: `+TCL-COMBINE+`](#api-variable-tcl-combine_9FC32D98230A22CA84CB3885A9FFF776)
         1. [VARIABLE: `+TCL-CONTINUE+`](#api-variable-tcl-continue_558EF469F19B772A61B03907AF327FC3)
         1. [VARIABLE: `+TCL-CONVERT-MULTIBYTE+`](#api-variable-tcl-convert-multibyte_AC091BA86E758E0FACEC78AD99E0FC35)
         1. [VARIABLE: `+TCL-CONVERT-NOSPACE+`](#api-variable-tcl-convert-nospace_376B31737AD856DAF78248A204573960)
         1. [VARIABLE: `+TCL-CONVERT-SYNTAX+`](#api-variable-tcl-convert-syntax_06FB4D768688C8679AD1002023430CE0)
         1. [VARIABLE: `+TCL-CONVERT-UNKNOWN+`](#api-variable-tcl-convert-unknown_3603BD59F2DCFEB08850245A5053BD47)
         1. [VARIABLE: `+TCL-CREATE-HARD-LINK+`](#api-variable-tcl-create-hard-link_8818F0B48E57667C082461B1FA7D4F88)
         1. [VARIABLE: `+TCL-CREATE-SYMBOLIC-LINK+`](#api-variable-tcl-create-symbolic-link_4A4EF8C4853F992C4CC9E299AEAAE39F)
         1. [VARIABLE: `+TCL-CUSTOM-PTR-KEYS+`](#api-variable-tcl-custom-ptr-keys_6184C406B15C3CBC228C34E21F4066AF)
         1. [VARIABLE: `+TCL-CUSTOM-TYPE-KEYS+`](#api-variable-tcl-custom-type-keys_6199F6F962A2B6A9A88BB1E9293F548B)
         1. [VARIABLE: `+TCL-D-STRING-STATIC-SIZE+`](#api-variable-tcl-d-string-static-size_BA048EC0CA2FACEF425A6AA41B9F9211)
         1. [VARIABLE: `+TCL-DONT-QUOTE-HASH+`](#api-variable-tcl-dont-quote-hash_726A2B8B275A47D0F47C10CCFE51A339)
         1. [VARIABLE: `+TCL-DONT-USE-BRACES+`](#api-variable-tcl-dont-use-braces_E05F3A11F4FE435C4C262393DEA7CFE2)
         1. [VARIABLE: `+TCL-DONT-WAIT+`](#api-variable-tcl-dont-wait_57347BC73B92D72FC4729239E6758ACD)
         1. [VARIABLE: `+TCL-DOUBLE-SPACE+`](#api-variable-tcl-double-space_E66FA6AB09521D27EFED1BBE2B58EB98)
         1. [VARIABLE: `+TCL-DYNAMIC+`](#api-variable-tcl-dynamic_40F71E7BD943D98517CB7BB01C195A9E)
         1. [VARIABLE: `+TCL-ENCODING-CHAR-LIMIT+`](#api-variable-tcl-encoding-char-limit_BCD698C7CAE9C23C9E19577052DEBDC8)
         1. [VARIABLE: `+TCL-ENCODING-END+`](#api-variable-tcl-encoding-end_8A747B93B310A62D54B63F06D82DF903)
         1. [VARIABLE: `+TCL-ENCODING-INTERNAL-USE-MASK+`](#api-variable-tcl-encoding-internal-use-mask_00D07C2742DEC1F5A9514B473DF05F74)
         1. [VARIABLE: `+TCL-ENCODING-NO-TERMINATE+`](#api-variable-tcl-encoding-no-terminate_F8120ED72565CCEE457BE4CF40B20D63)
         1. [VARIABLE: `+TCL-ENCODING-PROFILE-REPLACE+`](#api-variable-tcl-encoding-profile-replace_E2842F0376470D38F372BBA10928D9DF)
         1. [VARIABLE: `+TCL-ENCODING-PROFILE-STRICT+`](#api-variable-tcl-encoding-profile-strict_DE2E9EB7180A6E1C8B027B29B3A42D34)
         1. [VARIABLE: `+TCL-ENCODING-PROFILE-TCL8+`](#api-variable-tcl-encoding-profile-tcl8_A42EEFFDEDAD108DF1252E43DA1F00F9)
         1. [VARIABLE: `+TCL-ENCODING-START+`](#api-variable-tcl-encoding-start_363AA1D538BD85D0661514644BF18A81)
         1. [VARIABLE: `+TCL-ENCODING-STOPONERROR+`](#api-variable-tcl-encoding-stoponerror_5A083128B1D2DC9CDEAFF1707C2DE167)
         1. [VARIABLE: `+TCL-ENFORCE-MODE+`](#api-variable-tcl-enforce-mode_BDDE963A9186A65350BC90F5F4C507AF)
         1. [VARIABLE: `+TCL-ENSEMBLE-PREFIX+`](#api-variable-tcl-ensemble-prefix_28DAB753636F9E548C26A21F588529A8)
         1. [VARIABLE: `+TCL-ERROR+`](#api-variable-tcl-error_783EE0EEE7397EEDA126154F6B667264)
         1. [VARIABLE: `+TCL-EVAL-DIRECT+`](#api-variable-tcl-eval-direct_57E9AFDED466F35DB07A5C0D2B54504F)
         1. [VARIABLE: `+TCL-EVAL-GLOBAL+`](#api-variable-tcl-eval-global_586E7EE49F9B3648C3C2A4A719001476)
         1. [VARIABLE: `+TCL-EVAL-INVOKE+`](#api-variable-tcl-eval-invoke_B751FC88D00379654B5B208A8956B3BC)
         1. [VARIABLE: `+TCL-EVAL-NOERR+`](#api-variable-tcl-eval-noerr_1F97DC675FE063A35C98A208C81B7CF2)
         1. [VARIABLE: `+TCL-EXACT+`](#api-variable-tcl-exact_4F593FFE5831570C801A330DB79103FB)
         1. [VARIABLE: `+TCL-EXCEPTION+`](#api-variable-tcl-exception_C1D77A11986CFD35AC26B4EE22D62B44)
         1. [VARIABLE: `+TCL-F-OK+`](#api-variable-tcl-f-ok_22028A28C13E5F63114AB2B4278D6EC7)
         1. [VARIABLE: `+TCL-FILE-EVENTS+`](#api-variable-tcl-file-events_F8B33A990B85F82362E11262C455B898)
         1. [VARIABLE: `+TCL-FILESYSTEM-VERSION-1+`](#api-variable-tcl-filesystem-version-1_7806DA02260120063B8FC43A389AACFD)
         1. [VARIABLE: `+TCL-FINAL-RELEASE+`](#api-variable-tcl-final-release_A113ABD51C5BE4D3BB38501499C9704B)
         1. [VARIABLE: `+TCL-GLOB-PERM-HIDDEN+`](#api-variable-tcl-glob-perm-hidden_0ABA53B62D3091725D3723F7DA478639)
         1. [VARIABLE: `+TCL-GLOB-PERM-R+`](#api-variable-tcl-glob-perm-r_0C130213021C0A280F93A0839706EA1D)
         1. [VARIABLE: `+TCL-GLOB-PERM-RONLY+`](#api-variable-tcl-glob-perm-ronly_4C4D965AC1FF3C48DE27C860E743118B)
         1. [VARIABLE: `+TCL-GLOB-PERM-W+`](#api-variable-tcl-glob-perm-w_EA9D79BF08F33D3E2B198F34B70CCC4B)
         1. [VARIABLE: `+TCL-GLOB-PERM-X+`](#api-variable-tcl-glob-perm-x_DAE815C546826C807D68F965135DED84)
         1. [VARIABLE: `+TCL-GLOB-TYPE-BLOCK+`](#api-variable-tcl-glob-type-block_ABBA8390F108DB081F5CF0ED1154F4E7)
         1. [VARIABLE: `+TCL-GLOB-TYPE-CHAR+`](#api-variable-tcl-glob-type-char_E396D8902158BF75DF1F2852903F5E22)
         1. [VARIABLE: `+TCL-GLOB-TYPE-DIR+`](#api-variable-tcl-glob-type-dir_0CCF0F4AE3FBE7A56C8499BC3468CC95)
         1. [VARIABLE: `+TCL-GLOB-TYPE-FILE+`](#api-variable-tcl-glob-type-file_80A1E03B22660D69D59189464DDC3032)
         1. [VARIABLE: `+TCL-GLOB-TYPE-LINK+`](#api-variable-tcl-glob-type-link_D673CA96334D3F2AECFB907801C04444)
         1. [VARIABLE: `+TCL-GLOB-TYPE-MOUNT+`](#api-variable-tcl-glob-type-mount_9A2E72F6F0339251B0A01C96F5948DCA)
         1. [VARIABLE: `+TCL-GLOB-TYPE-PIPE+`](#api-variable-tcl-glob-type-pipe_4C4556886286FC36E8D80AAD2E9EA06C)
         1. [VARIABLE: `+TCL-GLOB-TYPE-SOCK+`](#api-variable-tcl-glob-type-sock_1A47DF47D9F9F36E79D71FC2C3716164)
         1. [VARIABLE: `+TCL-GLOBAL-ONLY+`](#api-variable-tcl-global-only_E2F974F469D6E58CC5CBDD7C9438C8C0)
         1. [VARIABLE: `+TCL-HASH-KEY-DIRECT-COMPARE+`](#api-variable-tcl-hash-key-direct-compare_0979762E2B8FA6A9672037B493B24260)
         1. [VARIABLE: `+TCL-HASH-KEY-RANDOMIZE-HASH+`](#api-variable-tcl-hash-key-randomize-hash_FC2A3CC986BF0BB418ED10D3145ADA94)
         1. [VARIABLE: `+TCL-HASH-KEY-SYSTEM-HASH+`](#api-variable-tcl-hash-key-system-hash_5C647D15F5864E8BC2B951E2922426D3)
         1. [VARIABLE: `+TCL-HASH-KEY-TYPE-VERSION+`](#api-variable-tcl-hash-key-type-version_246FE7597C3C35189198466E5E569A79)
         1. [VARIABLE: `+TCL-IDLE-EVENTS+`](#api-variable-tcl-idle-events_C1F97A9301A632850D3D12C18A9DD50D)
         1. [VARIABLE: `+TCL-INDEX-NONE+`](#api-variable-tcl-index-none_9F364C885F05C4A54E92A1DE3A6A5794)
         1. [VARIABLE: `+TCL-INDEX-TEMP-TABLE+`](#api-variable-tcl-index-temp-table_766E41F4AEA101BCFF76ADB16F03B74B)
         1. [VARIABLE: `+TCL-INTEGER-SPACE+`](#api-variable-tcl-integer-space_9CF59A68AA8AFE61F35024E9081F8DFB)
         1. [VARIABLE: `+TCL-INTERP-DESTROYED+`](#api-variable-tcl-interp-destroyed_A2DA49B9629F46E91FDFE27229188A7B)
         1. [VARIABLE: `+TCL-IO-FAILURE+`](#api-variable-tcl-io-failure_4C69EEC82D6B48FB19419844C41BB3B7)
         1. [VARIABLE: `+TCL-LEAVE-ERR-MSG+`](#api-variable-tcl-leave-err-msg_7BB1240C1440E0404436189146BD8B40)
         1. [VARIABLE: `+TCL-LIMIT-COMMANDS+`](#api-variable-tcl-limit-commands_3AFB2BCB11431A4938A22A9E88474BC4)
         1. [VARIABLE: `+TCL-LIMIT-TIME+`](#api-variable-tcl-limit-time_206F40500C94982A806B28B99BA43DD8)
         1. [VARIABLE: `+TCL-LINK-BINARY+`](#api-variable-tcl-link-binary_078C91EDEC0ABB788EAA5D2F1C2C56CB)
         1. [VARIABLE: `+TCL-LINK-BOOLEAN+`](#api-variable-tcl-link-boolean_43FC66FD63A6E9CD776A20524286F38C)
         1. [VARIABLE: `+TCL-LINK-CHAR+`](#api-variable-tcl-link-char_3805D2B932D22149552BDB9979F0ED52)
         1. [VARIABLE: `+TCL-LINK-CHARS+`](#api-variable-tcl-link-chars_D73ED6B3ACF8F9BD52917A8A1FD88E1F)
         1. [VARIABLE: `+TCL-LINK-DOUBLE+`](#api-variable-tcl-link-double_B32FA9CDBBC24BD4B586DC952AC16687)
         1. [VARIABLE: `+TCL-LINK-FLOAT+`](#api-variable-tcl-link-float_118C5CF010E12724FB1DE217BE0691DF)
         1. [VARIABLE: `+TCL-LINK-INT+`](#api-variable-tcl-link-int_F8AE00442F7C6702E3454F800CBF7CEE)
         1. [VARIABLE: `+TCL-LINK-LONG+`](#api-variable-tcl-link-long_284D4D1AED42EE4274ADEA71908E9CBD)
         1. [VARIABLE: `+TCL-LINK-READ-ONLY+`](#api-variable-tcl-link-read-only_1BA3B05F5C9B6071584986ABDF2D5030)
         1. [VARIABLE: `+TCL-LINK-SHORT+`](#api-variable-tcl-link-short_52793124FC89277FDB336DFC14CF5639)
         1. [VARIABLE: `+TCL-LINK-STRING+`](#api-variable-tcl-link-string_BEAE50B5A55551EB05874861F488EDBE)
         1. [VARIABLE: `+TCL-LINK-UCHAR+`](#api-variable-tcl-link-uchar_5FBF2915A9154BD1AC8E71FC72240138)
         1. [VARIABLE: `+TCL-LINK-UINT+`](#api-variable-tcl-link-uint_971A7EEFEAFC829CF99E1078DFF000CF)
         1. [VARIABLE: `+TCL-LINK-ULONG+`](#api-variable-tcl-link-ulong_05DC3B023E6F6905E14CAC2F354C0156)
         1. [VARIABLE: `+TCL-LINK-USHORT+`](#api-variable-tcl-link-ushort_7F1BACA9F0BC60B159383514FE778F06)
         1. [VARIABLE: `+TCL-LINK-WIDE-INT+`](#api-variable-tcl-link-wide-int_E3E394A5FA0BF7F71B2344F4F553EA94)
         1. [VARIABLE: `+TCL-LINK-WIDE-UINT+`](#api-variable-tcl-link-wide-uint_B3C1653C1F685F9854A81BD457FB5A43)
         1. [VARIABLE: `+TCL-LIST-ELEMENT+`](#api-variable-tcl-list-element_37AB74966164AA5204A7E718E98BF5A7)
         1. [VARIABLE: `+TCL-LOAD-GLOBAL+`](#api-variable-tcl-load-global_6D84BC6ECF160B01FF71D06D546CD8ED)
         1. [VARIABLE: `+TCL-LOAD-LAZY+`](#api-variable-tcl-load-lazy_BD04F3A04FBFC069E36954F4E419A562)
         1. [VARIABLE: `+TCL-MATCH-NOCASE+`](#api-variable-tcl-match-nocase_5AB828160C6169CBCA619CDC1FF07C55)
         1. [VARIABLE: `+TCL-MAX-PREC+`](#api-variable-tcl-max-prec_DE50BF697359FC074C30D49F78706CF9)
         1. [VARIABLE: `+TCL-MODE-BLOCKING+`](#api-variable-tcl-mode-blocking_55F81F9C4E2B94E2A3BF16172A54FCF0)
         1. [VARIABLE: `+TCL-MODE-NONBLOCKING+`](#api-variable-tcl-mode-nonblocking_4298F69C6014532C18A0A0723125D9FF)
         1. [VARIABLE: `+TCL-NAMESPACE-ONLY+`](#api-variable-tcl-namespace-only_E4C19C770826540E9322D401108B5FD8)
         1. [VARIABLE: `+TCL-NO-EVAL+`](#api-variable-tcl-no-eval_08004AE3EF54B3136BBB61AFFC0D9B7C)
         1. [VARIABLE: `+TCL-NULL-OK+`](#api-variable-tcl-null-ok_CB18D86FD66B03243312AA7592B1DDF1)
         1. [VARIABLE: `+TCL-NUMBER-BIG+`](#api-variable-tcl-number-big_8499607B4B6DD6D1EC140E5055270F27)
         1. [VARIABLE: `+TCL-NUMBER-DOUBLE+`](#api-variable-tcl-number-double_C516FF4A10BA1C5B3176BB32F2225030)
         1. [VARIABLE: `+TCL-NUMBER-INT+`](#api-variable-tcl-number-int_911CFD07C75B25BE4CA3CDB583F436BF)
         1. [VARIABLE: `+TCL-NUMBER-NAN+`](#api-variable-tcl-number-nan_D6C8DE85F5E941687D0235AD3D5BBC93)
         1. [VARIABLE: `+TCL-OK+*`](#api-variable-tcl-ok_43789D88635A0FEA0EB0852F59B3BE67)
         1. [VARIABLE: `+TCL-OK+`](#api-variable-tcl-ok_1185E5504BF5EDEDFBF5F8E7E5132F4D)
         1. [VARIABLE: `+TCL-ONE-WORD-KEYS+`](#api-variable-tcl-one-word-keys_6C56AAC5C88ECC0D1B4A4DECC8D09C74)
         1. [VARIABLE: `+TCL-PARSE-BAD-NUMBER+`](#api-variable-tcl-parse-bad-number_84359531E470CF87D21D2C3A60C5B2A9)
         1. [VARIABLE: `+TCL-PARSE-BRACE-EXTRA+`](#api-variable-tcl-parse-brace-extra_816AE27FDDCDB42739E94A0DC7D623EB)
         1. [VARIABLE: `+TCL-PARSE-MISSING-BRACE+`](#api-variable-tcl-parse-missing-brace_2DD4DE32724616FE075648F317A91B53)
         1. [VARIABLE: `+TCL-PARSE-MISSING-BRACKET+`](#api-variable-tcl-parse-missing-bracket_EABD048CD1DC5B0CD06BD834C3A42DCC)
         1. [VARIABLE: `+TCL-PARSE-MISSING-PAREN+`](#api-variable-tcl-parse-missing-paren_6E775DD361EA177910F459F1845BBB30)
         1. [VARIABLE: `+TCL-PARSE-MISSING-QUOTE+`](#api-variable-tcl-parse-missing-quote_4422CF70FA4B451DCBAB3BC0B49A6990)
         1. [VARIABLE: `+TCL-PARSE-MISSING-VAR-BRACE+`](#api-variable-tcl-parse-missing-var-brace_7DCF923B464847CEF60FE94263AD3D66)
         1. [VARIABLE: `+TCL-PARSE-QUOTE-EXTRA+`](#api-variable-tcl-parse-quote-extra_DE38A09853C0F7638BFB0D9E08A69FF8)
         1. [VARIABLE: `+TCL-PARSE-SUCCESS+`](#api-variable-tcl-parse-success_E980D7A1D2B85013DF032467E70331AA)
         1. [VARIABLE: `+TCL-PARSE-SYNTAX+`](#api-variable-tcl-parse-syntax_33E7255796450B8193C1BFBB2510F9E3)
         1. [VARIABLE: `+TCL-R-OK+`](#api-variable-tcl-r-ok_76BCDB7F6CCAA4F211A6D8485391678A)
         1. [VARIABLE: `+TCL-READABLE+`](#api-variable-tcl-readable_57B4A8FEF0546AF183774210E5830D9C)
         1. [VARIABLE: `+TCL-REG-ADVANCED+`](#api-variable-tcl-reg-advanced_34F1B5AE78BD0647638003B327AEC0BE)
         1. [VARIABLE: `+TCL-REG-ADVF+`](#api-variable-tcl-reg-advf_4C4CDCA9853206EAE4930CCE718FA242)
         1. [VARIABLE: `+TCL-REG-BASIC+`](#api-variable-tcl-reg-basic_26574FD36FA4D254E3F939967A73BC78)
         1. [VARIABLE: `+TCL-REG-CANMATCH+`](#api-variable-tcl-reg-canmatch_007C872C296AD0C77AEE9AE088A21155)
         1. [VARIABLE: `+TCL-REG-EXPANDED+`](#api-variable-tcl-reg-expanded_61410C7C55ED5F5CB7F0AB740DD516CE)
         1. [VARIABLE: `+TCL-REG-EXTENDED+`](#api-variable-tcl-reg-extended_EE21226A0A588131263904290F9EA190)
         1. [VARIABLE: `+TCL-REG-NEWLINE+`](#api-variable-tcl-reg-newline_2697A676AC6343B6C85583E97CD62C33)
         1. [VARIABLE: `+TCL-REG-NLANCH+`](#api-variable-tcl-reg-nlanch_7CBD2DC61536E50AFB892F19EAE11E44)
         1. [VARIABLE: `+TCL-REG-NLSTOP+`](#api-variable-tcl-reg-nlstop_CA568E949E34158041D2E07A8F15ACD6)
         1. [VARIABLE: `+TCL-REG-NOCASE+`](#api-variable-tcl-reg-nocase_FA8DA92789FDC7ADA3E2012DC46AD394)
         1. [VARIABLE: `+TCL-REG-NOSUB+`](#api-variable-tcl-reg-nosub_B758E4EB435DE9B5F4D43BDE9239CB6A)
         1. [VARIABLE: `+TCL-REG-NOTBOL+`](#api-variable-tcl-reg-notbol_CC522D1A8758E62D6B20E3286614CE56)
         1. [VARIABLE: `+TCL-REG-NOTEOL+`](#api-variable-tcl-reg-noteol_83192C3D438E46EE3D37E1196CB63FE8)
         1. [VARIABLE: `+TCL-REG-QUOTE+`](#api-variable-tcl-reg-quote_999309318D2F483E629963E05B45841A)
         1. [VARIABLE: `+TCL-RESULT-SIZE+`](#api-variable-tcl-result-size_83E90F9F352874B7DA5C3C3AB3855698)
         1. [VARIABLE: `+TCL-RETURN+`](#api-variable-tcl-return_5B6DFA1F96C6BC962560A9A7683986C0)
         1. [VARIABLE: `+TCL-SERVICE-ALL+`](#api-variable-tcl-service-all_CE0B0AEDD190DD32EB2EDA3979CA58E0)
         1. [VARIABLE: `+TCL-SERVICE-NONE+`](#api-variable-tcl-service-none_BF8ADCAE2AF46AABD31E96702DF087F3)
         1. [VARIABLE: `+TCL-SMALL-HASH-TABLE+`](#api-variable-tcl-small-hash-table_A35E9F7F0BB22D67BC89677A71D17A76)
         1. [VARIABLE: `+TCL-STATIC+`](#api-variable-tcl-static_63F2CFDDD10E53E4DDAE5CDB44387EF2)
         1. [VARIABLE: `+TCL-STDERR+`](#api-variable-tcl-stderr_1B8787965E99797441FAD7A89C23E60A)
         1. [VARIABLE: `+TCL-STDIN+`](#api-variable-tcl-stdin_0CD02C10D5644575CC79C917113BDD5C)
         1. [VARIABLE: `+TCL-STDOUT+`](#api-variable-tcl-stdout_A5CC144E4C3F56FB91E084B97308CE5F)
         1. [VARIABLE: `+TCL-STRING-KEYS+`](#api-variable-tcl-string-keys_E8363B6ED14BF91B1F74A4176F54D808)
         1. [VARIABLE: `+TCL-STUB-MAGIC+`](#api-variable-tcl-stub-magic_EC48ACC2EC9C4F00AA1EEFBB5442BDE7)
         1. [VARIABLE: `+TCL-SUBST-ALL+`](#api-variable-tcl-subst-all_3816A997B099085CA480D8BB1A643AB2)
         1. [VARIABLE: `+TCL-SUBST-BACKSLASHES+`](#api-variable-tcl-subst-backslashes_381F89DCD8F101EEA11836F88D8DDB2D)
         1. [VARIABLE: `+TCL-SUBST-COMMANDS+`](#api-variable-tcl-subst-commands_5124EAABF50414E43332DAFC3E42FFF2)
         1. [VARIABLE: `+TCL-SUBST-VARIABLES+`](#api-variable-tcl-subst-variables_7B0DFF80D828C81D00C597C47E733B61)
         1. [VARIABLE: `+TCL-TCPSERVER-REUSEADDR+`](#api-variable-tcl-tcpserver-reuseaddr_365E295F6FD93642A577136C8D6C2D0E)
         1. [VARIABLE: `+TCL-TCPSERVER-REUSEPORT+`](#api-variable-tcl-tcpserver-reuseport_92B36588DB18017EEE08642DB39135E6)
         1. [VARIABLE: `+TCL-THREAD-JOINABLE+`](#api-variable-tcl-thread-joinable_A5E4B04429B2D2974E5E2E89F235C9D3)
         1. [VARIABLE: `+TCL-THREAD-NOFLAGS+`](#api-variable-tcl-thread-noflags_14DC2E064A297D8C181A8592D637D4F8)
         1. [VARIABLE: `+TCL-THREAD-STACK-DEFAULT+`](#api-variable-tcl-thread-stack-default_BA902E47AAEE3D8AAEC9B7D3EFDC1503)
         1. [VARIABLE: `+TCL-TIMER-EVENTS+`](#api-variable-tcl-timer-events_EDAAF5BC977EF9211A06F2BB77D7C144)
         1. [VARIABLE: `+TCL-TOKEN-BS+`](#api-variable-tcl-token-bs_37808C77A6D246930AFBDE1B35C8D28F)
         1. [VARIABLE: `+TCL-TOKEN-COMMAND+`](#api-variable-tcl-token-command_FEF13AB616E559B6A696CEA3575EC125)
         1. [VARIABLE: `+TCL-TOKEN-EXPAND-WORD+`](#api-variable-tcl-token-expand-word_554515D7BA4AC8284AD88476D55662CB)
         1. [VARIABLE: `+TCL-TOKEN-OPERATOR+`](#api-variable-tcl-token-operator_348D1D68FCCF1D1230CB4AB69A01312E)
         1. [VARIABLE: `+TCL-TOKEN-SIMPLE-WORD+`](#api-variable-tcl-token-simple-word_795BFD4368FFB1151036CBF445A9FBFA)
         1. [VARIABLE: `+TCL-TOKEN-SUB-EXPR+`](#api-variable-tcl-token-sub-expr_0848CE0B99912E9DC65EE8705762D35B)
         1. [VARIABLE: `+TCL-TOKEN-TEXT+`](#api-variable-tcl-token-text_BC835CA187A3713B5E792159CD4A7B6D)
         1. [VARIABLE: `+TCL-TOKEN-VARIABLE+`](#api-variable-tcl-token-variable_9A9C3B62C8CBDCA4246737BF5C10F384)
         1. [VARIABLE: `+TCL-TOKEN-WORD+`](#api-variable-tcl-token-word_C7DAB813D2AAD5B0CF2AD7A65D1A0BF2)
         1. [VARIABLE: `+TCL-TRACE-ARRAY+`](#api-variable-tcl-trace-array_17775F335AB082E0B836ACDF569928DC)
         1. [VARIABLE: `+TCL-TRACE-DELETE+`](#api-variable-tcl-trace-delete_D7DC8E8E9A59F76A80CF69147752E2B8)
         1. [VARIABLE: `+TCL-TRACE-DESTROYED+`](#api-variable-tcl-trace-destroyed_6EA1DB6E6556989BAEAA3F4E3D9F6ED9)
         1. [VARIABLE: `+TCL-TRACE-ENTER-EXEC+`](#api-variable-tcl-trace-enter-exec_FC7B6ED63F5A7CED198BF5A6881FEF66)
         1. [VARIABLE: `+TCL-TRACE-LEAVE-EXEC+`](#api-variable-tcl-trace-leave-exec_673B69D68E8580223EB5AF6EB83C2521)
         1. [VARIABLE: `+TCL-TRACE-OLD-STYLE+`](#api-variable-tcl-trace-old-style_7C47EB2CFD7FED021726D6A2AA35BB0C)
         1. [VARIABLE: `+TCL-TRACE-READS+`](#api-variable-tcl-trace-reads_B99400018316C7E4D0232F1141175ED7)
         1. [VARIABLE: `+TCL-TRACE-RENAME+`](#api-variable-tcl-trace-rename_65F3FDAB2AC25FC297185B8ECCF0ADA6)
         1. [VARIABLE: `+TCL-TRACE-RESULT-DYNAMIC+`](#api-variable-tcl-trace-result-dynamic_E68F104ED98346279DC64AE147287211)
         1. [VARIABLE: `+TCL-TRACE-RESULT-OBJECT+`](#api-variable-tcl-trace-result-object_08A4B712DE16D5E33347AC3BD9F48E68)
         1. [VARIABLE: `+TCL-TRACE-UNSETS+`](#api-variable-tcl-trace-unsets_FD55106D446B71B0F629FBE6C6CE0D8F)
         1. [VARIABLE: `+TCL-TRACE-WRITES+`](#api-variable-tcl-trace-writes_73ED239A06B63120FE601C55CBC32E0F)
         1. [VARIABLE: `+TCL-UNLOAD-DETACH-FROM-INTERPRETER+`](#api-variable-tcl-unload-detach-from-interpreter_21482D75A40E4EBBB6D14B4BA1688DDF)
         1. [VARIABLE: `+TCL-UNLOAD-DETACH-FROM-PROCESS+`](#api-variable-tcl-unload-detach-from-process_D84B0B3935B1670A68CF3954ED9B79E1)
         1. [VARIABLE: `+TCL-UTF-MAX+`](#api-variable-tcl-utf-max_8A13068E1A8E0A6835B52D885813BF4D)
         1. [VARIABLE: `+TCL-VOLATILE+`](#api-variable-tcl-volatile_4E8E0B19BB7D1EC2041505559DE6751E)
         1. [VARIABLE: `+TCL-W-OK+`](#api-variable-tcl-w-ok_5D9974877203C743F6E57F9931A01275)
         1. [VARIABLE: `+TCL-WINDOW-EVENTS+`](#api-variable-tcl-window-events_94DEDE9D7DD1611DD48D6B792973A220)
         1. [VARIABLE: `+TCL-WRITABLE+`](#api-variable-tcl-writable_1889C879E2472144D76875071580F8C8)
         1. [VARIABLE: `+TCL-X-OK+`](#api-variable-tcl-x-ok_9134F543174060789025C8FA4B6D423A)
         1. [VARIABLE: `+TCL-ZLIB-COMPRESS-BEST+`](#api-variable-tcl-zlib-compress-best_EBED48FE5FF26D3BD9FF0DCE228F8617)
         1. [VARIABLE: `+TCL-ZLIB-COMPRESS-DEFAULT+`](#api-variable-tcl-zlib-compress-default_39E663F1EF308687A5D5FBE8DB4B9980)
         1. [VARIABLE: `+TCL-ZLIB-COMPRESS-FAST+`](#api-variable-tcl-zlib-compress-fast_53FE6B7A5877655BE8F14F6B7A29477B)
         1. [VARIABLE: `+TCL-ZLIB-COMPRESS-NONE+`](#api-variable-tcl-zlib-compress-none_DEFB332DFFABAC9C27869E1468826AAF)
         1. [VARIABLE: `+TCL-ZLIB-FINALIZE+`](#api-variable-tcl-zlib-finalize_3C8250656476BFEE63EC4067E75EEF26)
         1. [VARIABLE: `+TCL-ZLIB-FLUSH+`](#api-variable-tcl-zlib-flush_A71F02491F0EFA7A4C882069ADA1FEB8)
         1. [VARIABLE: `+TCL-ZLIB-FORMAT-AUTO+`](#api-variable-tcl-zlib-format-auto_85D92A1BAF559A067D8065E519F330E2)
         1. [VARIABLE: `+TCL-ZLIB-FORMAT-GZIP+`](#api-variable-tcl-zlib-format-gzip_19CE68E1543E9D961086E55B5BD8CD58)
         1. [VARIABLE: `+TCL-ZLIB-FORMAT-RAW+`](#api-variable-tcl-zlib-format-raw_17BCBDE5661A2CDE84F971FB46F0AF82)
         1. [VARIABLE: `+TCL-ZLIB-FORMAT-ZLIB+`](#api-variable-tcl-zlib-format-zlib_6A260DD6883309E1279B5AA785535C32)
         1. [VARIABLE: `+TCL-ZLIB-FULLFLUSH+`](#api-variable-tcl-zlib-fullflush_611C83EA0E09D7A0E5FD1A70BCD5A946)
         1. [VARIABLE: `+TCL-ZLIB-NO-FLUSH+`](#api-variable-tcl-zlib-no-flush_991978EA3AC7189760BE064D23C7E1B7)
         1. [VARIABLE: `+TCL-ZLIB-STREAM-DEFLATE+`](#api-variable-tcl-zlib-stream-deflate_2B91ACFCC6FC72EEAC9A3305FABC4292)
         1. [VARIABLE: `+TCL-ZLIB-STREAM-INFLATE+`](#api-variable-tcl-zlib-stream-inflate_494266C29E2454BC5A1F2F3A419AAA06)

<a name="src02-supportmd_FBD3A3A997C645ED7BD27AF5F2A8C684"></a>

## Supporting

Enjoying this project? Consider supporting its growth via the Ethereum
address in [my profile](https://github.com/ageldama).

<a name="src03-licensemd_F1D6E1209BCE79BB56C1162561D8C7BB"></a>

## License

[Licensed under the MIT License](https://opensource.org/license/mit)

Please read the [./LICENSE](./LICENSE)

<a name="api-refs_523EACBA8CE3897B5EE91337B062B676"></a>
# APIs

<a name="api-package-raw-cffi-tcl9_91D014E58231F3ED0681213DC83C9019"></a>
## PACKAGE: `RAW-CFFI-TCL9`

<a name="api-cffi-enum-tcl-path-type_5C592BD387898E4C549A6CC13B588715"></a>
### CFFI-ENUM: `TCL-PATH-TYPE`

- SCOPE: EXTERNAL
- VARIANTS: `NIL`


<a name="api-cffi-enum-tcl-queue-position_C321D10BF154588515E6E63EBEA7212C"></a>
### CFFI-ENUM: `TCL-QUEUE-POSITION`

- SCOPE: EXTERNAL
- VARIANTS: `NIL`


<a name="api-cffi-enum-tcl-value-type_EC8EF1FA4E56E8A7A8AD99D7952ED452"></a>
### CFFI-ENUM: `TCL-VALUE-TYPE`

- SCOPE: EXTERNAL
- VARIANTS: `NIL`


<a name="api-cffi-function-tcl-add-error-info_7203EF289B4433434E604275EBDC93F7"></a>
### CFFI-FUNCTION: `%TCL-ADD-ERROR-INFO`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_AddErrorInfo`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::MESSAGE :STRING))`
- SETF? `NIL`

/* Slot 66 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-add-obj-error-info_F5E5A0BF6DBEED26EDCE766A2BBF5E90"></a>
### CFFI-FUNCTION: `%TCL-ADD-OBJ-ERROR-INFO`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_AddObjErrorInfo`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::MESSAGE :STRING) (LENGTH :INT))`
- SETF? `NIL`

/* Slot 67 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-background-error_6EFD345B94439FC6AC1C69AFFBF23696"></a>
### CFFI-FUNCTION: `%TCL-BACKGROUND-ERROR`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_BackgroundError`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`

/* Slot 76 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-backslash_2713AF7DDFFB2318DC0C3F998DCEFC37"></a>
### CFFI-FUNCTION: `%TCL-BACKSLASH`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_Backslash`
- CFFI RETURN-TYPE: `CHAR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC :STRING) (RAW-CFFI-TCL9::READ-PTR (:POINTER :INT)))`
- SETF? `NIL`

/* Slot 77 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-close_9D9284043804DFF39AD5B2E9E41F52BD"></a>
### CFFI-FUNCTION: `%TCL-CLOSE`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_Close`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL))`
- SETF? `NIL`

/* 81 */ EXTERN int
Tcl_Close(Tcl_Interp *interp, Tcl_Channel chan);

<a name="api-cffi-function-tcl-create-math-func_0DB274FBBD42C2A5E90A23C53759CC42"></a>
### CFFI-FUNCTION: `%TCL-CREATE-MATH-FUNC`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_CreateMathFunc`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::NAME :STRING) (RAW-CFFI-TCL9::NUM-ARGS :INT)
 (RAW-CFFI-TCL9::ARG-TYPES RAW-CFFI-TCL9:TCL-VALUE-TYPE-PTR)
 (RAW-CFFI-TCL9::MATH-PROC RAW-CFFI-TCL9:TCL-MATH-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* Slot 95 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-db-new-boolean-obj_2B233C8F25DF9667247E2CA0C50BAE51"></a>
### CFFI-FUNCTION: `%TCL-DB-NEW-BOOLEAN-OBJ`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_DbNewBooleanObj`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INT-VAL :INT) (RAW-CFFI-TCL9::FILE :STRING)
 (RAW-CFFI-TCL9::LINE :INT))`
- SETF? `NIL`

/* Slot 22 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-db-new-long-obj_909121FF16EA312C86152A418E656376"></a>
### CFFI-FUNCTION: `%TCL-DB-NEW-LONG-OBJ`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_DbNewLongObj`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::LONG-VAL :LONG) (RAW-CFFI-TCL9::FILE :STRING)
 (RAW-CFFI-TCL9::LINE :INT))`
- SETF? `NIL`

/* Slot 26 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-discard-result_B7AEF1AF4BB79DAAC43FC520D8E1B99E"></a>
### CFFI-FUNCTION: `%TCL-DISCARD-RESULT`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_DiscardResult`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::STATE-PTR RAW-CFFI-TCL9:TCL-SAVED-RESULT-PTR))`
- SETF? `NIL`

/* Slot 290 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-eval-obj_3F0DBA6493793614210A3C8C2E0E8E4D"></a>
### CFFI-FUNCTION: `%TCL-EVAL-OBJ`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_EvalObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR :POINTER))`
- SETF? `NIL`

/* Slot 131 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-eval_65DF61B1ABC81C546CE693251FA93F71"></a>
### CFFI-FUNCTION: `%TCL-EVAL`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_Eval`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::SCRIPT :STRING))`
- SETF? `NIL`

/* Slot 129 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-find-executable_C758C4048AEAACD4EA12865C7396E7DE"></a>
### CFFI-FUNCTION: `%TCL-FIND-EXECUTABLE`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_FindExecutable`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ARGV0 :STRING))`
- SETF? `NIL`

/* Slot 144 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-free-result_382AF0F1B7149078B265E8E2B879E3B4"></a>
### CFFI-FUNCTION: `%TCL-FREE-RESULT`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_FreeResult`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`

/* Slot 147 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-get-alias_E385AEAE84CB87707FB2EAE42895FDDD"></a>
### CFFI-FUNCTION: `%TCL-GET-ALIAS`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_GetAlias`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CHILD-CMD :STRING)
 (RAW-CFFI-TCL9::TARGET-INTERP-PTR-PTR (:POINTER RAW-CFFI-TCL9:TCL-INTERP-PTR))
 (RAW-CFFI-TCL9::TARGET-CMD-PTR (:POINTER (:POINTER :CHAR)))
 (RAW-CFFI-TCL9::ARGC-PTR (:POINTER :INT))
 (RAW-CFFI-TCL9::ARGV-PTR (:POINTER (:POINTER (:POINTER :CHAR)))))`
- SETF? `NIL`

/* Slot 148 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-get-byte-array-from-obj_BC9C678C95DD5FC28ABD450957440832"></a>
### CFFI-FUNCTION: `%TCL-GET-BYTE-ARRAY-FROM-OBJ`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_GetByteArrayFromObj`
- CFFI RETURN-TYPE: `(POINTER UCHAR)`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::NUM-BYTES-PTR RAW-CFFI-TCL9:TCL-SIZE-PTR))`
- SETF? `NIL`

/* 33 */ EXTERN unsigned char *
Tcl_GetByteArrayFromObj(Tcl_Obj *objPtr, Tcl_Size *numBytesPtr);

<a name="api-cffi-function-tcl-get-index-from-obj_DA7F547A6477B71F4114B444188D181E"></a>
### CFFI-FUNCTION: `%TCL-GET-INDEX-FROM-OBJ`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_GetIndexFromObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::TABLE-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::MSG :STRING) (RAW-CFFI-TCL9::FLAGS :INT)
 (RAW-CFFI-TCL9::IDX-PTR (:POINTER :INT)))`
- SETF? `NIL`

/* Slot 36 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-get-string-result_CA069B8780816CAF1D0BDD7EBF4B509D"></a>
### CFFI-FUNCTION: `%TCL-GET-STRING-RESULT`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_GetStringResult`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`

/* Slot 174 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-get-var_5468585500F177C667EFFAD99EF0FF7F"></a>
### CFFI-FUNCTION: `%TCL-GET-VAR`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_GetVar`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::VAR-NAME :STRING) (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* Slot 175 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-global-eval-obj_C4C88D973731E0D2527925C8139FB21B"></a>
### CFFI-FUNCTION: `%TCL-GLOBAL-EVAL-OBJ`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_GlobalEvalObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* Slot 178 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-global-eval_1A99A786AF3D5BFB21702FC479BCCC04"></a>
### CFFI-FUNCTION: `%TCL-GLOBAL-EVAL`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_GlobalEval`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::COMMAND :STRING))`
- SETF? `NIL`

/* Slot 177 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-make-safe_3395693A5D26BDA4B070FCCFB1C3A961"></a>
### CFFI-FUNCTION: `%TCL-MAKE-SAFE`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_MakeSafe`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`

/* Slot 190 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-new-boolean-obj_00BF6EC587D161EDE6393E636359A3E6"></a>
### CFFI-FUNCTION: `%TCL-NEW-BOOLEAN-OBJ`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_NewBooleanObj`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INT-VAL :INT))`
- SETF? `NIL`

/* Slot 49 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-new-int-obj_1238B55100ED95BC07CA9B4870761E74"></a>
### CFFI-FUNCTION: `%TCL-NEW-INT-OBJ`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_NewIntObj`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INT-VAL :INT))`
- SETF? `NIL`

/* Slot 52 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-new-long-obj_2CFFA41206D472F139AB37666FE9AEFF"></a>
### CFFI-FUNCTION: `%TCL-NEW-LONG-OBJ`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_NewLongObj`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::LONG-VAL :LONG))`
- SETF? `NIL`

/* Slot 54 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-pkg-present_91D901C78B78E44A2B8205D6F8A3BE6E"></a>
### CFFI-FUNCTION: `%TCL-PKG-PRESENT`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_PkgPresent`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::NAME :STRING) (RAW-CFFI-TCL9:VERSION :STRING)
 (RAW-CFFI-TCL9::EXACT :INT))`
- SETF? `NIL`

/* Slot 271 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-pkg-provide_6E2549B5B9588598DBC1570AC81A7903"></a>
### CFFI-FUNCTION: `%TCL-PKG-PROVIDE`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_PkgProvide`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::NAME :STRING) (RAW-CFFI-TCL9:VERSION :STRING))`
- SETF? `NIL`

/* Slot 273 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-pkg-require_9CB6CDE3B31C49AE93AAFAA16D30F59E"></a>
### CFFI-FUNCTION: `%TCL-PKG-REQUIRE`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_PkgRequire`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::NAME :STRING) (RAW-CFFI-TCL9:VERSION :STRING)
 (RAW-CFFI-TCL9::EXACT :INT))`
- SETF? `NIL`

/* Slot 274 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-seek-old_B79B4608BB876591061C395ADDD496CA"></a>
### CFFI-FUNCTION: `%TCL-SEEK-OLD`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_SeekOld`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN :POINTER) (RAW-CFFI-TCL9::OFFSET :INT)
 (RAW-CFFI-TCL9::MODE :INT))`
- SETF? `NIL`

/* Slot 220 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-set-boolean-obj_9B78267EA4750D08CF0C2E6D1D112D34"></a>
### CFFI-FUNCTION: `%TCL-SET-BOOLEAN-OBJ`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_SetBooleanObj`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::INT-VAL :INT))`
- SETF? `NIL`

/* Slot 57 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-set-int-obj_6F53E89684AA7063058F5A75C609F454"></a>
### CFFI-FUNCTION: `%TCL-SET-INT-OBJ`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_SetIntObj`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::INT-VAL :INT))`
- SETF? `NIL`

/* Slot 61 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-set-long-obj_3B5CD49449A1F3F53E64FDC54B5A84E2"></a>
### CFFI-FUNCTION: `%TCL-SET-LONG-OBJ`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_SetLongObj`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::LONG-VAL :LONG))`
- SETF? `NIL`

/* Slot 63 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-set-panic-proc_400DD4687D688C0D86CD76B553A6067C"></a>
### CFFI-FUNCTION: `%TCL-SET-PANIC-PROC`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_SetPanicProc`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PANIC-PROC RAW-CFFI-TCL9:TCL-PANIC-PROC))`
- SETF? `NIL`

/* Slot 230 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-set-result_909EA957ABF1BF5AF0B7F64046112756"></a>
### CFFI-FUNCTION: `%TCL-SET-RESULT`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_SetResult`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::RESULT :STRING)
 (RAW-CFFI-TCL9::FREE-PROC RAW-CFFI-TCL9:TCL-FREE-PROC))`
- SETF? `NIL`

/* Slot 232 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-set-var_F0E78838C50173FA829305CB8317E9D4"></a>
### CFFI-FUNCTION: `%TCL-SET-VAR`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_SetVar`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::VAR-NAME :STRING) (RAW-CFFI-TCL9::NEW-VALUE :STRING)
 (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* Slot 237 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-static-package_14365A93EADA445000FE31205FE1351E"></a>
### CFFI-FUNCTION: `%TCL-STATIC-PACKAGE`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_StaticPackage`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::PREFIX :STRING)
 (RAW-CFFI-TCL9::PKG-INIT-PROC RAW-CFFI-TCL9:TCL-PACKAGE-INIT-PROC)
 (RAW-CFFI-TCL9::SAFE-PKG-INIT-PROC RAW-CFFI-TCL9:TCL-PACKAGE-INIT-PROC))`
- SETF? `NIL`

/* Slot 244 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-string-match_91B9558690B3C5AE1AB7DEB953DD3B08"></a>
### CFFI-FUNCTION: `%TCL-STRING-MATCH`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_StringMatch`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::STR :STRING) (RAW-CFFI-TCL9::PATTERN :STRING))`
- SETF? `NIL`

/* Slot 245 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-tell-old_AED685973AA3D8826E2123F87113CA86"></a>
### CFFI-FUNCTION: `%TCL-TELL-OLD`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_TellOld`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL))`
- SETF? `NIL`

/* Slot 246 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-trace-var_3665E2A2F94FE0837BBE5082D28179B8"></a>
### CFFI-FUNCTION: `%TCL-TRACE-VAR`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_TraceVar`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::VAR-NAME :STRING) (RAW-CFFI-TCL9::FLAGS :INT)
 (RAW-CFFI-TCL9::VAR-TRACE-PROC RAW-CFFI-TCL9:TCL-VAR-TRACE-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* Slot 247 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-unset-var_EE771CCBA97D51E260C68EC5B530DEAE"></a>
### CFFI-FUNCTION: `%TCL-UNSET-VAR`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_UnsetVar`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::VAR-NAME :STRING) (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* Slot 253 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-untrace-var_7704AEE111829D1580785B2CAAF3BA9E"></a>
### CFFI-FUNCTION: `%TCL-UNTRACE-VAR`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_UntraceVar`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::VAR-NAME :STRING) (RAW-CFFI-TCL9::FLAGS :INT)
 (RAW-CFFI-TCL9::VAR-TRACE-PROC RAW-CFFI-TCL9:TCL-VAR-TRACE-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* Slot 255 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-up-var_373EF3C7B5D8F31A3A19311947B10925"></a>
### CFFI-FUNCTION: `%TCL-UP-VAR`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_UpVar`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::FRAME-NAME :STRING) (RAW-CFFI-TCL9::VAR-NAME :STRING)
 (RAW-CFFI-TCL9::LOCAL-NAME :STRING) (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* Slot 258 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tclvartraceinfo_A09EF491511DE853B92D7C7E25E62D9C"></a>
### CFFI-FUNCTION: `%TCL_VARTRACEINFO`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_VarTraceInfo`
- CFFI RETURN-TYPE: `CLIENT-DATA`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::VAR-NAME :STRING) (RAW-CFFI-TCL9::FLAGS :INT)
 (RAW-CFFI-TCL9::VAR-TRACE-PROC RAW-CFFI-TCL9:TCL-VAR-TRACE-PROC)
 (RAW-CFFI-TCL9::PREV-CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* Slot 261 is reserved */ DEPRECATED 9.0

<a name="api-cffi-function-tcl-access_A578095C898D55D1F18206FB189C756C"></a>
### CFFI-FUNCTION: `TCL-ACCESS`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Access`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PATH :STRING) (RAW-CFFI-TCL9::MODE :INT))`
- SETF? `NIL`

/* 367 */ EXTERN int Tcl_Access(const char *path, int mode);

<a name="api-cffi-function-tcl-alert-notifier_DE800CF99F338705AB44773F5C9EF0EA"></a>
### CFFI-FUNCTION: `TCL-ALERT-NOTIFIER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_AlertNotifier`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 343 */ EXTERN void Tcl_AlertNotifier(void *clientData);

<a name="api-cffi-function-tcl-alloc-stat-buf_F3C13BD01B49CB4FB9A521E4AD1FEED8"></a>
### CFFI-FUNCTION: `TCL-ALLOC-STAT-BUF`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_AllocStatBuf`
- CFFI RETURN-TYPE: `TCL-STAT-BUF-PTR`
- LAMBDA LIST: `NIL`
- SETF? `NIL`

/* 490 */ EXTERN Tcl_StatBuf * Tcl_AllocStatBuf(void);

<a name="api-cffi-function-tcl-alloc_EDB2FE4708CE48B90115B9224CEBA631"></a>
### CFFI-FUNCTION: `TCL-ALLOC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Alloc`
- CFFI RETURN-TYPE: `POINTER`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SIZE RAW-CFFI-TCL9:TCL-HASH-TYPE))`
- SETF? `NIL`

/* 3 */ EXTERN void *
Tcl_Alloc(TCL_HASH_TYPE size);

<a name="api-cffi-function-tcl-allow-exceptions_441E9450A7EB5DAB53AA32B16FAC8DF7"></a>
### CFFI-FUNCTION: `TCL-ALLOW-EXCEPTIONS`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_AllowExceptions`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`

/* 68 */ EXTERN void
Tcl_AllowExceptions(Tcl_Interp *interp);

<a name="api-cffi-function-tcl-append-all-obj-types_F0787F41655A217325AAE0D7A2522C08"></a>
### CFFI-FUNCTION: `TCL-APPEND-ALL-OBJ-TYPES`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_AppendAllObjTypes`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 14 */ EXTERN int
Tcl_AppendAllObjTypes(Tcl_Interp *interp, Tcl_Obj *objPtr);

<a name="api-cffi-function-tcl-append-element_9443FC706E96DB398A3EFF8EF98E236C"></a>
### CFFI-FUNCTION: `TCL-APPEND-ELEMENT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_AppendElement`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::ELEMENT (:POINTER :CHAR)))`
- SETF? `NIL`

/* 69 */ EXTERN void
Tcl_AppendElement(Tcl_Interp *interp, const char *element);

<a name="api-cffi-function-tcl-append-export-list_E0A9C491EA4678395F620A70B08EE660"></a>
### CFFI-FUNCTION: `TCL-APPEND-EXPORT-LIST`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_AppendExportList`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::NS-PTR RAW-CFFI-TCL9:TCL-NAMESPACE-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 508 */ EXTERN int
Tcl_AppendExportList(Tcl_Interp *interp, Tcl_Namespace *nsPtr, Tcl_Obj *objPtr);

<a name="api-cffi-function-tcl-append-format-to-obj_39128B8D18345D22DB27277CF24EF926"></a>
### CFFI-FUNCTION: `TCL-APPEND-FORMAT-TO-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_AppendFormatToObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR) (FORMAT :STRING)
 (RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::OBJV (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR)))`
- SETF? `NIL`

/* 577 */ EXTERN int
Tcl_AppendFormatToObj(
  Tcl_Interp *interp, Tcl_Obj *objPtr, const char *format,
  Tcl_Size objc, Tcl_Obj *const objv[]);

<a name="api-cffi-function-tcl-append-limited-to-obj_E6C832FCB36A6B9977003EE5A3E81AB8"></a>
### CFFI-FUNCTION: `TCL-APPEND-LIMITED-TO-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_AppendLimitedToObj`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::BYTES (:POINTER :CHAR)) (LENGTH RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::LIMIT RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::ELLIPSIS (:POINTER :CHAR)))`
- SETF? `NIL`

/* 575 */ EXTERN void
Tcl_AppendLimitedToObj(
  Tcl_Obj *objPtr,
  const char *bytes, Tcl_Size length,
  Tcl_Size limit, const char *ellipsis);

<a name="api-cffi-function-tcl-append-obj-to-error-info_CA06C339155CCEFE8B263A60F4071E62"></a>
### CFFI-FUNCTION: `TCL-APPEND-OBJ-TO-ERROR-INFO`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_AppendObjToErrorInfo`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 574 */ EXTERN void
Tcl_AppendObjToErrorInfo(Tcl_Interp *interp, Tcl_Obj *objPtr);

<a name="api-cffi-function-tcl-append-obj-to-obj_1E6DDFB606B745C69CAA83D8F798EDB2"></a>
### CFFI-FUNCTION: `TCL-APPEND-OBJ-TO-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_AppendObjToObj`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::APPEND-OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 286 */ EXTERN void
Tcl_AppendObjToObj(Tcl_Obj *objPtr, Tcl_Obj *appendObjPtr);

<a name="api-cffi-function-tcl-append-printf-to-obj_DA3EB7151EECF83625C4D4B878E1577C"></a>
### CFFI-FUNCTION: `TCL-APPEND-PRINTF-TO-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_AppendPrintfToObj`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR) (FORMAT :STRING) &REST)`
- SETF? `NIL`

/* 579 */ EXTERN void
Tcl_AppendPrintfToObj(Tcl_Obj *objPtr, const char *format, ...) TCL_FORMAT_PRINTF(2, 3);

<a name="api-cffi-function-tcl-append-result_1DBE84A6CB89DD3DCE610118A9CC1C10"></a>
### CFFI-FUNCTION: `TCL-APPEND-RESULT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_AppendResult`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR) &REST)`
- SETF? `NIL`

/* 70 */ EXTERN void
Tcl_AppendResult(Tcl_Interp *interp, ...);

<a name="api-cffi-function-tcl-append-strings-to-obj_748F2E5706C7CDFC04D1821921F258F4"></a>
### CFFI-FUNCTION: `TCL-APPEND-STRINGS-TO-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_AppendStringsToObj`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR) &REST)`
- SETF? `NIL`

/* 15 */ EXTERN void
Tcl_AppendStringsToObj(Tcl_Obj *objPtr, ...);

<a name="api-cffi-function-tcl-append-to-obj_9727BAC4DD4C7CF01D2DC526CCE13872"></a>
### CFFI-FUNCTION: `TCL-APPEND-TO-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_AppendToObj`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::BYTES (:POINTER :CHAR)) (LENGTH RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 16 */ EXTERN void
Tcl_AppendToObj(
  Tcl_Obj *objPtr, const char *bytes, Tcl_Size length);

<a name="api-cffi-function-tcl-append-unicode-to-obj_FA6CCD62DB5007CA5A0550921FC1549C"></a>
### CFFI-FUNCTION: `TCL-APPEND-UNICODE-TO-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_AppendUnicodeToObj`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::UNICODE RAW-CFFI-TCL9:TCL-UNI-CHAR-PTR)
 (LENGTH RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 384 */ EXTERN void
Tcl_AppendUnicodeToObj(Tcl_Obj *objPtr, const Tcl_UniChar *unicode, Tcl_Size length);

<a name="api-cffi-function-tcl-async-create_8E46767CCB0C419BB2D0B1597EFB6E6E"></a>
### CFFI-FUNCTION: `TCL-ASYNC-CREATE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_AsyncCreate`
- CFFI RETURN-TYPE: `TCL-ASYNC-HANDLER`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ASYNC-PROC RAW-CFFI-TCL9:TCL-ASYNC-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 71 */ EXTERN Tcl_AsyncHandler
Tcl_AsyncCreate(Tcl_AsyncProc *proc, void *clientData);

<a name="api-cffi-function-tcl-async-delete_7984FB1C22DDC6D0E39A3973202A8A75"></a>
### CFFI-FUNCTION: `TCL-ASYNC-DELETE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_AsyncDelete`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ASYNC-HANDLER RAW-CFFI-TCL9:TCL-ASYNC-HANDLER))`
- SETF? `NIL`

/* 72 */ EXTERN void
Tcl_AsyncDelete(Tcl_AsyncHandler async);

<a name="api-cffi-function-tcl-async-invoke_D1E3532DE2C66F9606B1584D61489EAC"></a>
### CFFI-FUNCTION: `TCL-ASYNC-INVOKE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_AsyncInvoke`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CODE :INT))`
- SETF? `NIL`

/* 73 */ EXTERN int
Tcl_AsyncInvoke(Tcl_Interp *interp, int code);

<a name="api-cffi-function-tcl-async-mark-from-signal_83943AC2E1C2DB7B560AD3EC7BF31B32"></a>
### CFFI-FUNCTION: `TCL-ASYNC-MARK-FROM-SIGNAL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_AsyncMarkFromSignal`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ASYNC RAW-CFFI-TCL9:TCL-ASYNC-HANDLER)
 (RAW-CFFI-TCL9::SIG-NR :INT))`
- SETF? `NIL`

/* 660 */ EXTERN int Tcl_AsyncMarkFromSignal(
  Tcl_AsyncHandler async, int sigNumber);

<a name="api-cffi-function-tcl-async-mark_E42C3505B2C3BA8E596739C9AA187C41"></a>
### CFFI-FUNCTION: `TCL-ASYNC-MARK`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_AsyncMark`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ASYNC-HANDLER RAW-CFFI-TCL9:TCL-ASYNC-HANDLER))`
- SETF? `NIL`

/* 74 */ EXTERN void
Tcl_AsyncMark(Tcl_AsyncHandler async);

<a name="api-cffi-function-tcl-async-ready_55E1EF29FC70C7B9C7EFFED7AA8609D1"></a>
### CFFI-FUNCTION: `TCL-ASYNC-READY`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_AsyncReady`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `NIL`
- SETF? `NIL`

/* 75 */ EXTERN int
Tcl_AsyncReady(void);

<a name="api-cffi-function-tcl-attempt-alloc_9224F5E1CB832378698FE8DB3B7FF6ED"></a>
### CFFI-FUNCTION: `TCL-ATTEMPT-ALLOC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_AttemptAlloc`
- CFFI RETURN-TYPE: `POINTER`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SIZE RAW-CFFI-TCL9:TCL-HASH-TYPE))`
- SETF? `NIL`

/* 428 */ EXTERN void * Tcl_AttemptAlloc(TCL_HASH_TYPE size);

<a name="api-cffi-function-tcl-attempt-db-ckalloc_EC05F80CFB9935EB641A8180DE0681B5"></a>
### CFFI-FUNCTION: `TCL-ATTEMPT-DB-CKALLOC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_AttemptDbCkalloc`
- CFFI RETURN-TYPE: `POINTER`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SIZE RAW-CFFI-TCL9:TCL-HASH-TYPE)
 (RAW-CFFI-TCL9::FILE :STRING) (RAW-CFFI-TCL9::LINE :INT))`
- SETF? `NIL`

/* 429 */ EXTERN void *
Tcl_AttemptDbCkalloc(TCL_HASH_TYPE size, const char *file, int line);

<a name="api-cffi-function-tcl-attempt-db-ckrealloc_2E17412D2B27D96C771277A0D4385657"></a>
### CFFI-FUNCTION: `TCL-ATTEMPT-DB-CKREALLOC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_AttemptDbCkrealloc`
- CFFI RETURN-TYPE: `POINTER`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PTR :POINTER)
 (RAW-CFFI-TCL9::SIZE RAW-CFFI-TCL9:TCL-HASH-TYPE)
 (RAW-CFFI-TCL9::FILE :STRING) (RAW-CFFI-TCL9::LINE :INT))`
- SETF? `NIL`

/* 431 */ EXTERN void *
Tcl_AttemptDbCkrealloc(
  void *ptr, TCL_HASH_TYPE size, const char *file, int line);

<a name="api-cffi-function-tcl-attempt-realloc_A5E3D1CBEC98C31138F53FE8397045FC"></a>
### CFFI-FUNCTION: `TCL-ATTEMPT-REALLOC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_AttemptRealloc`
- CFFI RETURN-TYPE: `POINTER`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PTR :POINTER)
 (RAW-CFFI-TCL9::SIZE RAW-CFFI-TCL9:TCL-HASH-TYPE))`
- SETF? `NIL`

/* 430 */ EXTERN void *
Tcl_AttemptRealloc(void *ptr, TCL_HASH_TYPE size);

<a name="api-cffi-function-tcl-attempt-set-obj-length_F4D24ADA1DB50BB2C2A4DAC568185818"></a>
### CFFI-FUNCTION: `TCL-ATTEMPT-SET-OBJ-LENGTH`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_AttemptSetObjLength`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (LENGTH RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 432 */ EXTERN int
Tcl_AttemptSetObjLength(Tcl_Obj *objPtr, Tcl_Size length);

<a name="api-cffi-function-tcl-background-exception_19D688E2A102FB4553A6F18B3C9C3F6E"></a>
### CFFI-FUNCTION: `TCL-BACKGROUND-EXCEPTION`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_BackgroundException`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CODE :INT))`
- SETF? `NIL`

/* 609 */ EXTERN void
Tcl_BackgroundException(Tcl_Interp *interp, int code);

<a name="api-cffi-function-tcl-bad-channel-option_D5BB5F34495B9ACE2212E2E6F8678DA8"></a>
### CFFI-FUNCTION: `TCL-BAD-CHANNEL-OPTION`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_BadChannelOption`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OPTION-NAME :STRING) (RAW-CFFI-TCL9::OPTION-LIST :STRING))`
- SETF? `NIL`

/* 78 */ EXTERN int
Tcl_BadChannelOption(
  Tcl_Interp *interp, const char *optionName, const char *optionList);

<a name="api-cffi-function-tcl-call-when-deleted_EB43D8F7C5AC9F3539CC7D90B7698CAC"></a>
### CFFI-FUNCTION: `TCL-CALL-WHEN-DELETED`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CallWhenDeleted`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::INTERP-DELETE-PROC RAW-CFFI-TCL9:TCL-INTERP-DELETE-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 79 */ EXTERN void
Tcl_CallWhenDeleted(
  Tcl_Interp *interp, Tcl_InterpDeleteProc *proc, void *clientData);

<a name="api-cffi-function-tcl-cancel-eval_50D6BB5B7A4CE2349F9F933E33E4107B"></a>
### CFFI-FUNCTION: `TCL-CANCEL-EVAL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CancelEval`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::RESULT-OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA)
 (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 580 */ EXTERN int
Tcl_CancelEval(
  Tcl_Interp *interp, Tcl_Obj *resultObjPtr, void *clientData, int flags);

<a name="api-cffi-function-tcl-cancel-idle-call_413655A1179A38AFC0A59E4E16EBC145"></a>
### CFFI-FUNCTION: `TCL-CANCEL-IDLE-CALL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CancelIdleCall`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::IDLE-PROC RAW-CFFI-TCL9:TCL-IDLE-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 80 */ EXTERN void
Tcl_CancelIdleCall(Tcl_IdleProc *idleProc, void *clientData);

<a name="api-cffi-function-tcl-canceled_5E63E1E82196F5C20402738945E2AF39"></a>
### CFFI-FUNCTION: `TCL-CANCELED`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Canceled`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 581 */ EXTERN int Tcl_Canceled(Tcl_Interp *interp, int flags);

<a name="api-cffi-function-tcl-channel-block-mode-proc_DFB2AC0A81FB8B7C7407EB83A568B3AE"></a>
### CFFI-FUNCTION: `TCL-CHANNEL-BLOCK-MODE-PROC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ChannelBlockModeProc`
- CFFI RETURN-TYPE: `TCL-DRIVER-BLOCK-MODE-PROC`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN-TYPE-PTR RAW-CFFI-TCL9:TCL-CHANNEL-TYPE-PTR))`
- SETF? `NIL`

/* 400 */ EXTERN Tcl_DriverBlockModeProc *
Tcl_ChannelBlockModeProc(const Tcl_ChannelType *chanTypePtr);

<a name="api-cffi-function-tcl-channel-buffered_C7102482EDAB166F0746AF0A96D7FD3D"></a>
### CFFI-FUNCTION: `TCL-CHANNEL-BUFFERED`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ChannelBuffered`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL))`
- SETF? `NIL`

/* 397 */ EXTERN int Tcl_ChannelBuffered(Tcl_Channel chan);

<a name="api-cffi-function-tcl-channel-close2-proc_92019D5EA2117CC56A31B9FE5F619B96"></a>
### CFFI-FUNCTION: `TCL-CHANNEL-CLOSE2-PROC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ChannelClose2Proc`
- CFFI RETURN-TYPE: `TCL-DRIVER-CLOSE2-PROC`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN-TYPE-PTR RAW-CFFI-TCL9:TCL-CHANNEL-TYPE-PTR))`
- SETF? `NIL`

/* 402 */ EXTERN Tcl_DriverClose2Proc *
Tcl_ChannelClose2Proc(const Tcl_ChannelType *chanTypePtr);

<a name="api-cffi-function-tcl-channel-flush-proc_3032A16A28F73A0FFC66ACD8643DEF96"></a>
### CFFI-FUNCTION: `TCL-CHANNEL-FLUSH-PROC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ChannelFlushProc`
- CFFI RETURN-TYPE: `TCL-DRIVER-FLUSH-PROC`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN-TYPE-PTR RAW-CFFI-TCL9:TCL-CHANNEL-TYPE-PTR))`
- SETF? `NIL`

/* 410 */ EXTERN Tcl_DriverFlushProc *
Tcl_ChannelFlushProc(const Tcl_ChannelType *chanTypePtr);

<a name="api-cffi-function-tcl-channel-get-handle-proc_342A6202EE985033F6C06FE93CCDF5A1"></a>
### CFFI-FUNCTION: `TCL-CHANNEL-GET-HANDLE-PROC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ChannelGetHandleProc`
- CFFI RETURN-TYPE: `TCL-DRIVER-GET-HANDLE-PROC`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN-TYPE-PTR RAW-CFFI-TCL9:TCL-CHANNEL-TYPE-PTR))`
- SETF? `NIL`

/* 409 */ EXTERN Tcl_DriverGetHandleProc *
Tcl_ChannelGetHandleProc(const Tcl_ChannelType *chanTypePtr);

<a name="api-cffi-function-tcl-channel-get-option-proc_31D8806CFF4BBB6265BF1E701516145F"></a>
### CFFI-FUNCTION: `TCL-CHANNEL-GET-OPTION-PROC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ChannelGetOptionProc`
- CFFI RETURN-TYPE: `TCL-DRIVER-GET-OPTION-PROC`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN-TYPE-PTR RAW-CFFI-TCL9:TCL-CHANNEL-TYPE-PTR))`
- SETF? `NIL`

/* 407 */ EXTERN Tcl_DriverGetOptionProc *
Tcl_ChannelGetOptionProc(const Tcl_ChannelType *chanTypePtr);

<a name="api-cffi-function-tcl-channel-handler-proc_C3ACF4EC6ABFE62D74F0C70AA57CC194"></a>
### CFFI-FUNCTION: `TCL-CHANNEL-HANDLER-PROC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ChannelHandlerProc`
- CFFI RETURN-TYPE: `TCL-DRIVER-HANDLER-PROC`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN-TYPE-PTR RAW-CFFI-TCL9:TCL-CHANNEL-TYPE-PTR))`
- SETF? `NIL`

/* 411 */ EXTERN Tcl_DriverHandlerProc *
Tcl_ChannelHandlerProc(const Tcl_ChannelType *chanTypePtr);

<a name="api-cffi-function-tcl-channel-input-proc_BC2D5C73E6CE7CF30C8E1E791EB0F3B6"></a>
### CFFI-FUNCTION: `TCL-CHANNEL-INPUT-PROC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ChannelInputProc`
- CFFI RETURN-TYPE: `TCL-DRIVER-INPUT-PROC`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN-TYPE-PTR RAW-CFFI-TCL9:TCL-CHANNEL-TYPE-PTR))`
- SETF? `NIL`

/* 403 */ EXTERN Tcl_DriverInputProc *
Tcl_ChannelInputProc(const Tcl_ChannelType *chanTypePtr);

<a name="api-cffi-function-tcl-channel-name_54F91D87F10DCC6A079F3E39F9CFB7BA"></a>
### CFFI-FUNCTION: `TCL-CHANNEL-NAME`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ChannelName`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN-TYPE-PTR RAW-CFFI-TCL9:TCL-CHANNEL-TYPE-PTR))`
- SETF? `NIL`

/* 398 */ EXTERN const char * Tcl_ChannelName(const Tcl_ChannelType *chanTypePtr);

<a name="api-cffi-function-tcl-channel-output-proc_393843971B5ED5CAB4AD586B47B292B2"></a>
### CFFI-FUNCTION: `TCL-CHANNEL-OUTPUT-PROC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ChannelOutputProc`
- CFFI RETURN-TYPE: `TCL-DRIVER-OUTPUT-PROC`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN-TYPE-PTR RAW-CFFI-TCL9:TCL-CHANNEL-TYPE-PTR))`
- SETF? `NIL`

/* 404 */ EXTERN Tcl_DriverOutputProc *
Tcl_ChannelOutputProc(const Tcl_ChannelType *chanTypePtr);

<a name="api-cffi-function-tcl-channel-set-option-proc_496BF1B8C2F1E5F617ACE8C5D6BB1FF4"></a>
### CFFI-FUNCTION: `TCL-CHANNEL-SET-OPTION-PROC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ChannelSetOptionProc`
- CFFI RETURN-TYPE: `TCL-DRIVER-SET-OPTION-PROC`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN-TYPE-PTR RAW-CFFI-TCL9:TCL-CHANNEL-TYPE-PTR))`
- SETF? `NIL`

/* 406 */ EXTERN Tcl_DriverSetOptionProc *
Tcl_ChannelSetOptionProc(const Tcl_ChannelType *chanTypePtr);

<a name="api-cffi-function-tcl-channel-thread-action-proc_0A27F31D13C22AD2081F5B1CAC7BC33A"></a>
### CFFI-FUNCTION: `TCL-CHANNEL-THREAD-ACTION-PROC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ChannelThreadActionProc`
- CFFI RETURN-TYPE: `TCL-DRIVER-THREAD-ACTION-PROC`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN-TYPE-PTR RAW-CFFI-TCL9:TCL-CHANNEL-TYPE-PTR))`
- SETF? `NIL`

/* 554 */ EXTERN Tcl_DriverThreadActionProc *
Tcl_ChannelThreadActionProc(const Tcl_ChannelType *chanTypePtr);

<a name="api-cffi-function-tcl-channel-truncate-proc_CEC02401A6F63E0D0C3794C21BF154BF"></a>
### CFFI-FUNCTION: `TCL-CHANNEL-TRUNCATE-PROC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ChannelTruncateProc`
- CFFI RETURN-TYPE: `TCL-DRIVER-THREAD-ACTION-PROC`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN-TYPE-PTR RAW-CFFI-TCL9:TCL-CHANNEL-TYPE-PTR))`
- SETF? `NIL`

/* 561 */ EXTERN Tcl_DriverTruncateProc *
Tcl_ChannelTruncateProc(const Tcl_ChannelType *chanTypePtr);

<a name="api-cffi-function-tcl-channel-version_D83797839FCD9AA2D8AEE9C50376F24A"></a>
### CFFI-FUNCTION: `TCL-CHANNEL-VERSION`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ChannelVersion`
- CFFI RETURN-TYPE: `TCL-CHANNEL-TYPE-VERSION`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN-TYPE-PTR RAW-CFFI-TCL9:TCL-CHANNEL-TYPE-PTR))`
- SETF? `NIL`

/* 399 */ EXTERN Tcl_ChannelTypeVersion
Tcl_ChannelVersion(const Tcl_ChannelType *chanTypePtr);

<a name="api-cffi-function-tcl-channel-watch-proc_082BE5A9702A2B5039E84A9405CE3C89"></a>
### CFFI-FUNCTION: `TCL-CHANNEL-WATCH-PROC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ChannelWatchProc`
- CFFI RETURN-TYPE: `TCL-DRIVER-WATCH-PROC`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN-TYPE-PTR RAW-CFFI-TCL9:TCL-CHANNEL-TYPE-PTR))`
- SETF? `NIL`

/* 408 */ EXTERN Tcl_DriverWatchProc *
Tcl_ChannelWatchProc(const Tcl_ChannelType *chanTypePtr);

<a name="api-cffi-function-tcl-channel-wide-seek-proc_BE539FE8967B8147DE04ADFCBF4B310C"></a>
### CFFI-FUNCTION: `TCL-CHANNEL-WIDE-SEEK-PROC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ChannelWideSeekProc`
- CFFI RETURN-TYPE: `TCL-DRIVER-WIDE-SEEK-PROC`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN-TYPE-PTR RAW-CFFI-TCL9:TCL-CHANNEL-TYPE-PTR))`
- SETF? `NIL`

/* 493 */ EXTERN Tcl_DriverWideSeekProc *
Tcl_ChannelWideSeekProc(const Tcl_ChannelType *chanTypePtr);

<a name="api-cffi-function-tcl-char16-len_5136BEFC63F9D170DBA018C639B9FF5A"></a>
### CFFI-FUNCTION: `TCL-CHAR16-LEN`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Char16Len`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::UNI-STR (:POINTER :USHORT)))`
- SETF? `NIL`

/* 352 */ EXTERN Tcl_Size Tcl_Char16Len(const unsigned short *uniStr);

<a name="api-cffi-function-tcl-char16-to-utf-d-string_9A0BA290D153DEF04A71B2BC749882CB"></a>
### CFFI-FUNCTION: `TCL-CHAR16-TO-UTF-D-STRING`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Char16ToUtfDString`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::UNI-STR (:POINTER :USHORT))
 (RAW-CFFI-TCL9::UNI-LENGTH RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::DS-PTR RAW-CFFI-TCL9:TCL-D-STRING-PTR))`
- SETF? `NIL`

/* 354 */ EXTERN char *
Tcl_Char16ToUtfDString(
  const unsigned short *uniStr, Tcl_Size uniLength, Tcl_DString *dsPtr);

<a name="api-cffi-function-tcl-chdir_4B819113BD0817A7B72BCDF79586500B"></a>
### CFFI-FUNCTION: `TCL-CHDIR`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Chdir`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::DIR-NAME :STRING))`
- SETF? `NIL`

/* 366 */ EXTERN int Tcl_Chdir(const char *dirName);

<a name="api-cffi-function-tcl-clear-channel-handlers_CF27A5FB166BAF4FF6B5458350C49545"></a>
### CFFI-FUNCTION: `TCL-CLEAR-CHANNEL-HANDLERS`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ClearChannelHandlers`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL))`
- SETF? `NIL`

/* 417 */ EXTERN void Tcl_ClearChannelHandlers(Tcl_Channel channel);

<a name="api-cffi-function-tcl-close-ex_CB75658A4A12ECBC567FD9BD242DEE52"></a>
### CFFI-FUNCTION: `TCL-CLOSE-EX`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CloseEx`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL) (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 624 */ EXTERN int
Tcl_CloseEx(Tcl_Interp *interp, Tcl_Channel chan, int flags);

<a name="api-cffi-function-tcl-command-complete_9F63F21C99888452883A072078A9C8AE"></a>
### CFFI-FUNCTION: `TCL-COMMAND-COMPLETE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CommandComplete`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CMD :STRING))`
- SETF? `NIL`

/* 82 */ EXTERN int
Tcl_CommandComplete(const char *cmd);

<a name="api-cffi-function-tcl-command-trace-info_70DA7F31BDC041B54DC9B96474B90F23"></a>
### CFFI-FUNCTION: `TCL-COMMAND-TRACE-INFO`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CommandTraceInfo`
- CFFI RETURN-TYPE: `CLIENT-DATA`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::VAR-NAME :STRING) (RAW-CFFI-TCL9::FLAGS :INT)
 (RAW-CFFI-TCL9::CMD-TRACE-PROC RAW-CFFI-TCL9:TCL-CMD-TRACE-PROC)
 (RAW-CFFI-TCL9::PREV-CLIENT-DATE RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 425 */ EXTERN void *
Tcl_CommandTraceInfo(
  Tcl_Interp *interp, const char *varName, int flags,
  Tcl_CommandTraceProc *procPtr, void *prevClientData);

<a name="api-cffi-function-tcl-concat-obj_E186BD3111AE20820C2BDA23939E06E3"></a>
### CFFI-FUNCTION: `TCL-CONCAT-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ConcatObj`
- CFFI RETURN-TYPE: `POINTER`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::OBJV (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR)))`
- SETF? `NIL`

/* 17 */ EXTERN Tcl_Obj *
Tcl_ConcatObj(Tcl_Size objc, Tcl_Obj *const objv[]);

<a name="api-cffi-function-tcl-concat_8F4ABFD4C396794361F51D2E1D0D2CA9"></a>
### CFFI-FUNCTION: `TCL-CONCAT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Concat`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ARGC RAW-CFFI-TCL9:TCL-SIZE) (RAW-CFFI-TCL9::ARGV :STRING))`
- SETF? `NIL`

/* 83 */ EXTERN char *
Tcl_Concat(Tcl_Size argc, const char *const *argv);

<a name="api-cffi-function-tcl-condition-finalize_AE34946C19F94CE7AC1886273304AE65"></a>
### CFFI-FUNCTION: `TCL-CONDITION-FINALIZE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ConditionFinalize`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::COND-PTR RAW-CFFI-TCL9:TCL-CONDITION-PTR))`
- SETF? `NIL`

/* 391 */ EXTERN void Tcl_ConditionFinalize(Tcl_Condition *condPtr);

<a name="api-cffi-function-tcl-condition-notify_D827A702515B0D0B5C5DE492598BE3F7"></a>
### CFFI-FUNCTION: `TCL-CONDITION-NOTIFY`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ConditionNotify`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::COND-PTR RAW-CFFI-TCL9:TCL-CONDITION-PTR))`
- SETF? `NIL`

/* 310 */ EXTERN void Tcl_ConditionNotify(Tcl_Condition *condPtr);

<a name="api-cffi-function-tcl-condition-wait_9C850A8824874FF03C010B02278A60C1"></a>
### CFFI-FUNCTION: `TCL-CONDITION-WAIT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ConditionWait`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::COND-PTR RAW-CFFI-TCL9:TCL-CONDITION-PTR)
 (RAW-CFFI-TCL9::MUTEX-PTR RAW-CFFI-TCL9:TCL-MUTEX-PTR)
 (RAW-CFFI-TCL9::TIME-PTR RAW-CFFI-TCL9:TCL-TIME-PTR))`
- SETF? `NIL`

/* 311 */ EXTERN void
Tcl_ConditionWait(
  Tcl_Condition *condPtr, Tcl_Mutex *mutexPtr, const Tcl_Time *timePtr);

<a name="api-cffi-function-tcl-console-panic_B6B18065634D228F65356BF36827AE4B"></a>
### CFFI-FUNCTION: `TCL-CONSOLE-PANIC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ConsolePanic`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::FMT :STRING) &REST)`
- SETF? `NIL`

(OR) #define Tcl_ConsolePanic ((Tcl_PanicProc *)NULL)

<a name="api-cffi-function-tcl-convert-counter-element_EA9CD07B07B6D092B713E1C4B4E8BFAC"></a>
### CFFI-FUNCTION: `TCL-CONVERT-COUNTER-ELEMENT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ConvertCountedElement`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC :STRING) (LENGTH RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::DST :STRING) (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 85 */ EXTERN Tcl_Size
Tcl_ConvertCountedElement(
  const char *src, Tcl_Size length, char *dst, int flags);

<a name="api-cffi-function-tcl-convert-element_16607AFF79C6B12D121A102591C99F4B"></a>
### CFFI-FUNCTION: `TCL-CONVERT-ELEMENT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ConvertElement`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC :STRING) (RAW-CFFI-TCL9::DST :STRING)
 (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 84 */ EXTERN Tcl_Size
Tcl_ConvertElement(const char *src, char *dst, int flags);

<a name="api-cffi-function-tcl-convert-to-type_AE492191681221EA7024E96EB8E38177"></a>
### CFFI-FUNCTION: `TCL-CONVERT-TO-TYPE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ConvertToType`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::TYPE-PTR RAW-CFFI-TCL9:TCL-OBJ-TYPE-PTR))`
- SETF? `NIL`

/* 18 */ EXTERN int
Tcl_ConvertToType(
  Tcl_Interp *interp, Tcl_Obj *objPtr,
  const Tcl_ObjType *typePtr);

<a name="api-cffi-function-tcl-create-alias-obj_FA552BE22D7539EA792EDD4E55407AEE"></a>
### CFFI-FUNCTION: `TCL-CREATE-ALIAS-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CreateAliasObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHILD-INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CHILD-CMD :STRING)
 (RAW-CFFI-TCL9::TARGET RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::TARGET-CMD :STRING)
 (RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::OBJV (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR)))`
- SETF? `NIL`

/* 87 */ EXTERN int
Tcl_CreateAliasObj(
  Tcl_Interp *childInterp,
  const char *childCmd, Tcl_Interp *target,
  const char *targetCmd, Tcl_Size objc,
  Tcl_Obj *const objv[]);

<a name="api-cffi-function-tcl-create-alias_F06EAC857ADBD9F439F16D838C56B0FC"></a>
### CFFI-FUNCTION: `TCL-CREATE-ALIAS`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CreateAlias`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHILD-INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CHILD-CMD :STRING)
 (RAW-CFFI-TCL9::TARGET RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::TARGET-CMD :STRING)
 (RAW-CFFI-TCL9::ARGC RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::ARGV (:POINTER (:POINTER :CHAR))))`
- SETF? `NIL`

/* 86 */ EXTERN int
Tcl_CreateAlias(
  Tcl_Interp *childInterp,
  const char *childCmd, Tcl_Interp *target,
  const char *targetCmd, Tcl_Size argc,
  const char *const *argv);

<a name="api-cffi-function-tcl-create-channel-handler_A7BC480F5229AEFABAD3CD8362006356"></a>
### CFFI-FUNCTION: `TCL-CREATE-CHANNEL-HANDLER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CreateChannelHandler`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL) (RAW-CFFI-TCL9::MASK :INT)
 (RAW-CFFI-TCL9::CHAN-PROC RAW-CFFI-TCL9:TCL-CHANNEL-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 89 */ EXTERN void
Tcl_CreateChannelHandler(
  Tcl_Channel chan, int mask, Tcl_ChannelProc *proc, void *clientData);

<a name="api-cffi-function-tcl-create-channel_9D21317C099CC287A409ABB47AC1D203"></a>
### CFFI-FUNCTION: `TCL-CREATE-CHANNEL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CreateChannel`
- CFFI RETURN-TYPE: `TCL-CHANNEL`
- LAMBDA LIST: `((RAW-CFFI-TCL9::TYPE-PTR RAW-CFFI-TCL9:TCL-CHANNEL-TYPE-PTR)
 (RAW-CFFI-TCL9::CHAN-NAME :STRING)
 (RAW-CFFI-TCL9::INSTANCE-DATA RAW-CFFI-TCL9::CLIENT-DATA)
 (RAW-CFFI-TCL9::MASK :INT))`
- SETF? `NIL`

/* 88 */ EXTERN Tcl_Channel
Tcl_CreateChannel(
  const Tcl_ChannelType *typePtr,
  const char *chanName, void *instanceData, int mask);

<a name="api-cffi-function-tcl-create-child_D7508430EAAE787D228C273B75C15063"></a>
### CFFI-FUNCTION: `TCL-CREATE-CHILD`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CreateChild`
- CFFI RETURN-TYPE: `TCL-INTERP-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::NAME :STRING) (RAW-CFFI-TCL9::IS-SAFE :INT))`
- SETF? `NIL`

/* 97 */ EXTERN Tcl_Interp *
Tcl_CreateChild(
  Tcl_Interp *interp, const char *name, int isSafe);

<a name="api-cffi-function-tcl-create-close-handler_4D2E85821DEACDEB7828EBADD020E6BA"></a>
### CFFI-FUNCTION: `TCL-CREATE-CLOSE-HANDLER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CreateCloseHandler`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL)
 (RAW-CFFI-TCL9:CLOSE-PROC RAW-CFFI-TCL9:TCL-CLOSE-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 90 */ EXTERN void
Tcl_CreateCloseHandler(
  Tcl_Channel chan,Tcl_CloseProc *proc, void *clientData);

<a name="api-cffi-function-tcl-create-command_AF0115E1BF956B80DE2E46DA0218F964"></a>
### CFFI-FUNCTION: `TCL-CREATE-COMMAND`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CreateCommand`
- CFFI RETURN-TYPE: `TCL-COMMAND`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CMD-NAME :STRING)
 (RAW-CFFI-TCL9::CMD-PROC RAW-CFFI-TCL9:TCL-CMD-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA)
 (RAW-CFFI-TCL9::CMD-DELETE-PROC RAW-CFFI-TCL9:TCL-CMD-DELETE-PROC))`
- SETF? `NIL`

/* 91 */ EXTERN Tcl_Command
Tcl_CreateCommand(
  Tcl_Interp *interp,
  const char *cmdName, Tcl_CmdProc *proc,
  void *clientData, Tcl_CmdDeleteProc *deleteProc);

<a name="api-cffi-function-tcl-create-encoding_AC06D294232267F4C68EDFE128F5162C"></a>
### CFFI-FUNCTION: `TCL-CREATE-ENCODING`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CreateEncoding`
- CFFI RETURN-TYPE: `TCL-ENCODING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::TYPE-PTR RAW-CFFI-TCL9:TCL-ENCODING-TYPE-PTR))`
- SETF? `NIL`

/* 287 */ EXTERN Tcl_Encoding
Tcl_CreateEncoding(const Tcl_EncodingType *typePtr);

<a name="api-cffi-function-tcl-create-ensemble_58E7637A49579EB6892BED6A8FA9266D"></a>
### CFFI-FUNCTION: `TCL-CREATE-ENSEMBLE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CreateEnsemble`
- CFFI RETURN-TYPE: `TCL-COMMAND`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::NAME :STRING)
 (RAW-CFFI-TCL9::NAMESPACE-PTR RAW-CFFI-TCL9:TCL-NAMESPACE-PTR)
 (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 541 */ EXTERN Tcl_Command
Tcl_CreateEnsemble(
  Tcl_Interp *interp, const char *name, Tcl_Namespace *namespacePtr, int flags);

<a name="api-cffi-function-tcl-create-event-source_6964157EED3D360CEEC1713FC274CE22"></a>
### CFFI-FUNCTION: `TCL-CREATE-EVENT-SOURCE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CreateEventSource`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SETUP-PROC RAW-CFFI-TCL9:TCL-EVENT-SETUP-PROC)
 (RAW-CFFI-TCL9::CHECK-PROC RAW-CFFI-TCL9:TCL-EVENT-CHECK-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 92 */ EXTERN void
Tcl_CreateEventSource(
  Tcl_EventSetupProc *setupProc,
  Tcl_EventCheckProc *checkProc,
  void *clientData);

<a name="api-cffi-function-tcl-create-exit-handler_D76DE1EA98BD29A2907D5B0C24E380D4"></a>
### CFFI-FUNCTION: `TCL-CREATE-EXIT-HANDLER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CreateExitHandler`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::EXIT-PROC RAW-CFFI-TCL9:TCL-EXIT-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 93 */ EXTERN void
Tcl_CreateExitHandler(Tcl_ExitProc *proc, void *clientData);

<a name="api-cffi-function-tcl-create-file-handler_EDB669D445003F32CE2C888A9667A174"></a>
### CFFI-FUNCTION: `TCL-CREATE-FILE-HANDLER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CreateFileHandler`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::FD :INT) (RAW-CFFI-TCL9::MASK :INT)
 (RAW-CFFI-TCL9::FILE-PROC RAW-CFFI-TCL9:TCL-FILE-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 9 */ EXTERN void
Tcl_CreateFileHandler(
  int fd, int mask, Tcl_FileProc *proc, void *clientData);

<a name="api-cffi-function-tcl-create-interp_5E807FC874ACB5A095F61269DF307FBF"></a>
### CFFI-FUNCTION: `TCL-CREATE-INTERP*`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CreateInterp`
- CFFI RETURN-TYPE: `POINTER`
- LAMBDA LIST: `NIL`
- SETF? `NIL`


<a name="api-cffi-function-tcl-create-interp_DAE18DEED8F7AAE51AC42EBBE9F13BCD"></a>
### CFFI-FUNCTION: `TCL-CREATE-INTERP`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CreateInterp`
- CFFI RETURN-TYPE: `TCL-INTERP-PTR`
- LAMBDA LIST: `NIL`
- SETF? `NIL`

/* 94 */ EXTERN Tcl_Interp * Tcl_CreateInterp(void);

<a name="api-cffi-function-tcl-create-namespace_B0E6E17EC1E358349B487C8299EEBDED"></a>
### CFFI-FUNCTION: `TCL-CREATE-NAMESPACE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CreateNamespace`
- CFFI RETURN-TYPE: `TCL-NAMESPACE-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::NAME :STRING)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA)
 (RAW-CFFI-TCL9::NAMESPACE-DELETE-PROC RAW-CFFI-TCL9:TCL-NAMESPACE-DELETE-PROC))`
- SETF? `NIL`

/* 506 */ EXTERN Tcl_Namespace *
Tcl_CreateNamespace(
  Tcl_Interp *interp, const char *name, void *clientData,
  Tcl_NamespaceDeleteProc *deleteProc);

<a name="api-cffi-function-tcl-create-obj-command2_68BD9CF1CC20FCFE1239E38624EE2CAB"></a>
### CFFI-FUNCTION: `TCL-CREATE-OBJ-COMMAND2`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CreateObjCommand2`
- CFFI RETURN-TYPE: `TCL-COMMAND`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CMD-NAME :STRING)
 (RAW-CFFI-TCL9::PROC2 RAW-CFFI-TCL9:TCL-OBJ-CMD-PROC2)
 (RAW-CFFI-TCL9::CLIENT-DATA :POINTER)
 (RAW-CFFI-TCL9::DELETE-PROC RAW-CFFI-TCL9:TCL-CMD-DELETE-PROC))`
- SETF? `NIL`

/* 676 */ EXTERN Tcl_Command
Tcl_CreateObjCommand2(
  Tcl_Interp *interp, const char *cmdName, Tcl_ObjCmdProc2 *proc2,
  void *clientData, Tcl_CmdDeleteProc *deleteProc);

<a name="api-cffi-function-tcl-create-obj-command_B764DB0C0586348C155A0B6CA048C189"></a>
### CFFI-FUNCTION: `TCL-CREATE-OBJ-COMMAND`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CreateObjCommand`
- CFFI RETURN-TYPE: `TCL-COMMAND`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CMD-NAME :STRING)
 (RAW-CFFI-TCL9::OBJ-CMD-PROC RAW-CFFI-TCL9:TCL-OBJ-CMD-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA)
 (RAW-CFFI-TCL9::CMD-DELETE-PROC RAW-CFFI-TCL9:TCL-CMD-DELETE-PROC))`
- SETF? `NIL`

/* 96 */ EXTERN Tcl_Command
Tcl_CreateObjCommand(
  Tcl_Interp *interp,
  const char *cmdName, Tcl_ObjCmdProc *proc,
  void *clientData,
  Tcl_CmdDeleteProc *deleteProc);

<a name="api-cffi-function-tcl-create-obj-trace2_ACD353CBC08D0E1181E2DAF85DEEC15A"></a>
### CFFI-FUNCTION: `TCL-CREATE-OBJ-TRACE2`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CreateObjTrace2`
- CFFI RETURN-TYPE: `TCL-TRACE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::LEVEL RAW-CFFI-TCL9:TCL-SIZE) (RAW-CFFI-TCL9::FLAGS :INT)
 (RAW-CFFI-TCL9::OBJ-PROC2 RAW-CFFI-TCL9:TCL-CMD-OBJ-TRACE-PROC2)
 (RAW-CFFI-TCL9::CLIENT-DATA :POINTER)
 (RAW-CFFI-TCL9::DEL-PROC RAW-CFFI-TCL9:TCL-CMD-OBJ-TRACE-DELETE-PROC))`
- SETF? `NIL`

/* 677 */ EXTERN Tcl_Trace
Tcl_CreateObjTrace2(
  Tcl_Interp *interp, Tcl_Size level, int flags,
  Tcl_CmdObjTraceProc2 *objProc2, void *clientData,
  Tcl_CmdObjTraceDeleteProc *delProc);

<a name="api-cffi-function-tcl-create-obj-trace_43234CF25A476DC576B2EC0670723011"></a>
### CFFI-FUNCTION: `TCL-CREATE-OBJ-TRACE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CreateObjTrace`
- CFFI RETURN-TYPE: `TCL-TRACE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::LEVEL RAW-CFFI-TCL9:TCL-SIZE) (RAW-CFFI-TCL9::FLAGS :INT)
 (RAW-CFFI-TCL9::OBJ-PROC RAW-CFFI-TCL9:TCL-CMD-OBJ-TRACE-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA)
 (RAW-CFFI-TCL9::DEL-PROC RAW-CFFI-TCL9:TCL-CMD-OBJ-TRACE-DELETE-PROC))`
- SETF? `NIL`

/* 483 */ EXTERN Tcl_Trace
Tcl_CreateObjTrace(
  Tcl_Interp *interp, Tcl_Size level, int flags,
  Tcl_CmdObjTraceProc *objProc, void *clientData,
  Tcl_CmdObjTraceDeleteProc *delProc);

<a name="api-cffi-function-tcl-create-pipe_755BA51EC54768927475180FFA85BA94"></a>
### CFFI-FUNCTION: `TCL-CREATE-PIPE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CreatePipe`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::RCHAN (:POINTER RAW-CFFI-TCL9:TCL-CHANNEL))
 (RAW-CFFI-TCL9::WCHAN (:POINTER RAW-CFFI-TCL9:TCL-CHANNEL))
 (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 582 */ EXTERN int
Tcl_CreatePipe(
  Tcl_Interp *interp, Tcl_Channel *rchan, Tcl_Channel *wchan, int flags);

<a name="api-cffi-function-tcl-create-thread-exit-handler_DB662628A1F22DF6287BAECDEADFBD31"></a>
### CFFI-FUNCTION: `TCL-CREATE-THREAD-EXIT-HANDLER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CreateThreadExitHandler`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::EXIT-PROC RAW-CFFI-TCL9:TCL-EXIT-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 288 */ EXTERN void
Tcl_CreateThreadExitHandler(Tcl_ExitProc *proc, void *clientData);

<a name="api-cffi-function-tcl-create-thread_CFEDC560FDCCC7DB79A5263E26C4D46B"></a>
### CFFI-FUNCTION: `TCL-CREATE-THREAD`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CreateThread`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ID-PTR RAW-CFFI-TCL9:TCL-THREAD-ID-PTR)
 (RAW-CFFI-TCL9::PROC RAW-CFFI-TCL9:TCL-THREAD-CREATE-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA)
 (RAW-CFFI-TCL9::STACK-SIZE RAW-CFFI-TCL9:TCL-HASH-TYPE)
 (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 393 */ EXTERN int
Tcl_CreateThread(
  Tcl_ThreadId *idPtr, Tcl_ThreadCreateProc *proc, void *clientData,
  TCL_HASH_TYPE stackSize, int flags);

<a name="api-cffi-function-tcl-create-timer-handler_071055D17FFDC98E274B88B2EA33CAAC"></a>
### CFFI-FUNCTION: `TCL-CREATE-TIMER-HANDLER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CreateTimerHandler`
- CFFI RETURN-TYPE: `TCL-TIMER-TOKEN`
- LAMBDA LIST: `((RAW-CFFI-TCL9::MILLISECONDS :INT)
 (RAW-CFFI-TCL9::TIMER-PROC RAW-CFFI-TCL9:TCL-TIMER-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 98 */ EXTERN Tcl_TimerToken
Tcl_CreateTimerHandler(
  int milliseconds, Tcl_TimerProc *proc, void *clientData);

<a name="api-cffi-function-tcl-create-trace_FB2EA432864FEB2DD67229A0302A65B0"></a>
### CFFI-FUNCTION: `TCL-CREATE-TRACE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CreateTrace`
- CFFI RETURN-TYPE: `TCL-TRACE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::LEVEL RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::CMD-TRACE-PROC RAW-CFFI-TCL9:TCL-CMD-TRACE-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 99 */ EXTERN Tcl_Trace
Tcl_CreateTrace(
  Tcl_Interp *interp, Tcl_Size level,
  Tcl_CmdTraceProc *proc, void *clientData);

<a name="api-cffi-function-tcl-cut-channel_7A421E579B874FE4DD0D476EFB488E18"></a>
### CFFI-FUNCTION: `TCL-CUT-CHANNEL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_CutChannel`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL))`
- SETF? `NIL`

/* 415 */ EXTERN void Tcl_CutChannel(Tcl_Channel channel);

<a name="api-cffi-function-tcl-d-string-append-element_D528D3C71386BDEE641A5631C2D32C85"></a>
### CFFI-FUNCTION: `TCL-D-STRING-APPEND-ELEMENT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DStringAppendElement`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::DS-PTR RAW-CFFI-TCL9:TCL-D-STRING-PTR)
 (RAW-CFFI-TCL9::ELEMENT (:POINTER :CHAR)))`
- SETF? `NIL`

/* 118 */ EXTERN char *
Tcl_DStringAppendElement(Tcl_DString *dsPtr, const char *element);

<a name="api-cffi-function-tcl-d-string-append_666D52C99130577730595F2F0A37C7C4"></a>
### CFFI-FUNCTION: `TCL-D-STRING-APPEND`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DStringAppend`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::DS-PTR RAW-CFFI-TCL9:TCL-D-STRING-PTR)
 (RAW-CFFI-TCL9::BYTES (:POINTER :CHAR)) (LENGTH RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 117 */ EXTERN char *
Tcl_DStringAppend(
  Tcl_DString *dsPtr, const char *bytes, Tcl_Size length);

<a name="api-cffi-function-tcl-d-string-end-sublist_34CC2E354279BB323EE718082B8F0300"></a>
### CFFI-FUNCTION: `TCL-D-STRING-END-SUBLIST`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DStringEndSublist`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::DS-PTR RAW-CFFI-TCL9:TCL-D-STRING-PTR))`
- SETF? `NIL`

/* 119 */ EXTERN void
Tcl_DStringEndSublist(Tcl_DString *dsPtr);

<a name="api-cffi-function-tcl-d-string-free_917F82CF9C7F8518D0DF88D44A085109"></a>
### CFFI-FUNCTION: `TCL-D-STRING-FREE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DStringFree`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::DS-PTR RAW-CFFI-TCL9:TCL-D-STRING-PTR))`
- SETF? `NIL`

/* 120 */ EXTERN void Tcl_DStringFree(Tcl_DString *dsPtr);

<a name="api-cffi-function-tcl-d-string-get-result_DFB3C96369118D3042489A54EA2420A2"></a>
### CFFI-FUNCTION: `TCL-D-STRING-GET-RESULT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DStringGetResult`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::DS-PTR RAW-CFFI-TCL9:TCL-D-STRING-PTR))`
- SETF? `NIL`

/* 121 */ EXTERN void
Tcl_DStringGetResult(Tcl_Interp *interp, Tcl_DString *dsPtr);

<a name="api-cffi-function-tcl-d-string-init_570C6E55980D6FD5CE67EB1DFCF5F2EB"></a>
### CFFI-FUNCTION: `TCL-D-STRING-INIT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DStringInit`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::DS-PTR RAW-CFFI-TCL9:TCL-D-STRING-PTR))`
- SETF? `NIL`

/* 122 */ EXTERN void Tcl_DStringInit(Tcl_DString *dsPtr);

<a name="api-cffi-function-tcl-d-string-result_F000AFAB6680FDF3A664BA600DDBAF7B"></a>
### CFFI-FUNCTION: `TCL-D-STRING-RESULT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DStringResult`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::DS-PTR RAW-CFFI-TCL9:TCL-D-STRING-PTR))`
- SETF? `NIL`

/* 123 */ EXTERN void
Tcl_DStringResult(Tcl_Interp *interp, Tcl_DString *dsPtr);

<a name="api-cffi-function-tcl-d-string-set-length_1DBBEEF5D586E21623E27001E260A9A4"></a>
### CFFI-FUNCTION: `TCL-D-STRING-SET-LENGTH`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DStringSetLength`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::DS-PTR RAW-CFFI-TCL9:TCL-D-STRING-PTR)
 (LENGTH RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 124 */ EXTERN void
Tcl_DStringSetLength(Tcl_DString *dsPtr, Tcl_Size length);

<a name="api-cffi-function-tcl-d-string-start-sublist_034953EFBF0CC84BDB1A5D7205DE05E0"></a>
### CFFI-FUNCTION: `TCL-D-STRING-START-SUBLIST`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DStringStartSublist`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::DS-PTR RAW-CFFI-TCL9:TCL-D-STRING-PTR))`
- SETF? `NIL`

/* 125 */ EXTERN void
Tcl_DStringStartSublist(Tcl_DString *dsPtr);

<a name="api-cffi-function-tcl-d-string-to-obj_E86374CDA68422D2087A48E9E99F1C29"></a>
### CFFI-FUNCTION: `TCL-D-STRING-TO-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DStringToObj`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::DS-PTR RAW-CFFI-TCL9:TCL-D-STRING-PTR))`
- SETF? `NIL`

/* 685 */ EXTERN Tcl_Obj * Tcl_DStringToObj(Tcl_DString *dsPtr);

<a name="api-cffi-function-tcl-db-ckalloc_0B2D5297F0C773F94AE6C984F8C4E757"></a>
### CFFI-FUNCTION: `TCL-DB-CKALLOC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DbCkalloc`
- CFFI RETURN-TYPE: `POINTER`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SIZE RAW-CFFI-TCL9:TCL-HASH-TYPE)
 (RAW-CFFI-TCL9::FILE :STRING) (RAW-CFFI-TCL9::LINE :INT))`
- SETF? `NIL`

/* 6 */ EXTERN void *
Tcl_DbCkalloc(TCL_HASH_TYPE size, const char *file, int line);

<a name="api-cffi-function-tcl-db-ckfree_86F6E990D0C77938250C9B78C91D1DB9"></a>
### CFFI-FUNCTION: `TCL-DB-CKFREE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DbCkfree`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PTR :POINTER) (RAW-CFFI-TCL9::FILE :STRING)
 (RAW-CFFI-TCL9::LINE :INT))`
- SETF? `NIL`

/* 7 */ EXTERN void
Tcl_DbCkfree(void *ptr, const char *file, int line);

<a name="api-cffi-function-tcl-db-ckrealloc_0AEB81EB60A857314326E82B957CCD3E"></a>
### CFFI-FUNCTION: `TCL-DB-CKREALLOC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DbCkrealloc`
- CFFI RETURN-TYPE: `POINTER`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PTR :POINTER)
 (RAW-CFFI-TCL9::SIZE RAW-CFFI-TCL9:TCL-HASH-TYPE)
 (RAW-CFFI-TCL9::FILE :STRING) (RAW-CFFI-TCL9::LINE :INT))`
- SETF? `NIL`

/* 8 */ EXTERN void *
Tcl_DbCkrealloc(void *ptr, TCL_HASH_TYPE size, const char *file, int line);

<a name="api-cffi-function-tcl-db-decr-ref-count_3778E0FE047A1118306DFBA419C8FA5D"></a>
### CFFI-FUNCTION: `TCL-DB-DECR-REF-COUNT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DbDecrRefCount`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::FILE :STRING) (RAW-CFFI-TCL9::LINE :INT))`
- SETF? `NIL`

/* 19 */ EXTERN void
Tcl_DbDecrRefCount(
Tcl_Obj *objPtr, const char *file, int line);

<a name="api-cffi-function-tcl-db-incr-ref-count_120FB7A6C38781F4628AC4EF7FF3CB8B"></a>
### CFFI-FUNCTION: `TCL-DB-INCR-REF-COUNT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DbIncrRefCount`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::FILE :STRING) (RAW-CFFI-TCL9::LINE :INT))`
- SETF? `NIL`

/* 20 */ EXTERN void
Tcl_DbIncrRefCount(
  Tcl_Obj *objPtr, const char *file, int line);

<a name="api-cffi-function-tcl-db-is-shared_3373D7DC77EA2A3718726EC1CD800383"></a>
### CFFI-FUNCTION: `TCL-DB-IS-SHARED`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DbIsShared`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::FILE :STRING) (RAW-CFFI-TCL9::LINE :INT))`
- SETF? `NIL`

/* 21 */ EXTERN int
Tcl_DbIsShared(
  Tcl_Obj *objPtr, const char *file, int line);

<a name="api-cffi-function-tcl-db-new-bignum-obj_0E01B5D7018F67CE9C229B660E244669"></a>
### CFFI-FUNCTION: `TCL-DB-NEW-BIGNUM-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DbNewBignumObj`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::VALUE RAW-CFFI-TCL9::MP-INT-PTR) (RAW-CFFI-TCL9::FILE :STRING)
 (RAW-CFFI-TCL9::LINE :INT))`
- SETF? `NIL`

/* 556 */ EXTERN Tcl_Obj *
Tcl_DbNewBignumObj(void *value, const char *file, int line);

<a name="api-cffi-function-tcl-db-new-byte-array-obj_D767BCBCDAFC0B472D576253A2C19363"></a>
### CFFI-FUNCTION: `TCL-DB-NEW-BYTE-ARRAY-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DbNewByteArrayObj`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::BYTES (:POINTER :UCHAR)) (LENGTH RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::FILE :STRING) (RAW-CFFI-TCL9::LINE :INT))`
- SETF? `NIL`

/* 23 */ EXTERN Tcl_Obj *
Tcl_DbNewByteArrayObj(
  const unsigned char *bytes, Tcl_Size numBytes,
  const char *file, int line);

<a name="api-cffi-function-tcl-db-new-dict-obj_F40448DEE5612527CDE978E3AFA8D302"></a>
### CFFI-FUNCTION: `TCL-DB-NEW-DICT-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DbNewDictObj`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::FILE :STRING) (RAW-CFFI-TCL9::LINE :INT))`
- SETF? `NIL`

/* 504 */ EXTERN Tcl_Obj * Tcl_DbNewDictObj(const char *file, int line);

<a name="api-cffi-function-tcl-db-new-double-obj_82FD2DC145BCD88240F03F73631AC3B1"></a>
### CFFI-FUNCTION: `TCL-DB-NEW-DOUBLE-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DbNewDoubleObj`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::DOUBLE-VAL :DOUBLE) (RAW-CFFI-TCL9::FILE :STRING)
 (RAW-CFFI-TCL9::LINE :INT))`
- SETF? `NIL`

/* 24 */ EXTERN Tcl_Obj *
Tcl_DbNewDoubleObj(
  double doubleValue, const char *file, int line);

<a name="api-cffi-function-tcl-db-new-list-obj_1281533E14F97938F07E2AA2F829ACE2"></a>
### CFFI-FUNCTION: `TCL-DB-NEW-LIST-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DbNewListObj`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::OBJV (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR))
 (RAW-CFFI-TCL9::FILE :STRING) (RAW-CFFI-TCL9::LINE :INT))`
- SETF? `NIL`

/* 25 */ EXTERN Tcl_Obj *
Tcl_DbNewListObj(
  Tcl_Size objc, Tcl_Obj *const *objv,
  const char *file, int line);

<a name="api-cffi-function-tcl-db-new-obj_0E8C2ABE75754E27FAB536652E89E81A"></a>
### CFFI-FUNCTION: `TCL-DB-NEW-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DbNewObj`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::FILE :STRING) (RAW-CFFI-TCL9::LINE :INT))`
- SETF? `NIL`

/* 27 */ EXTERN Tcl_Obj *
Tcl_DbNewObj(const char *file, int line);

<a name="api-cffi-function-tcl-db-new-string-obj_772DCC013C654CE13F8BFF262754E098"></a>
### CFFI-FUNCTION: `TCL-DB-NEW-STRING-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DbNewStringObj`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::BYTES (:POINTER :CHAR)) (LENGTH RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::FILE :STRING) (RAW-CFFI-TCL9::LINE :INT))`
- SETF? `NIL`

/* 28 */ EXTERN Tcl_Obj *
Tcl_DbNewStringObj(
  const char *bytes, Tcl_Size length,
  const char *file, int line);

<a name="api-cffi-function-tcl-db-new-wide-int-obj_7349A82DFA0B2E4ACAFFCF0823EDE0B1"></a>
### CFFI-FUNCTION: `TCL-DB-NEW-WIDE-INT-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DbNewWideIntObj`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::WIDE-VALUE RAW-CFFI-TCL9:TCL-WIDE-INT)
 (RAW-CFFI-TCL9::FILE :STRING) (RAW-CFFI-TCL9::LINE :INT))`
- SETF? `NIL`

/* 486 */ EXTERN Tcl_Obj *
Tcl_DbNewWideIntObj(Tcl_WideInt wideValue, const char *file, int line);

<a name="api-cffi-function-tcl-decr-ref-count_4BE5DAD3B6C62212DB73C4EF5DBCF1B2"></a>
### CFFI-FUNCTION: `TCL-DECR-REF-COUNT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DecrRefCount`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 642 */ EXTERN void Tcl_DecrRefCount(Tcl_Obj *objPtr);

<a name="api-cffi-function-tcl-delete-assoc-data_301B00566E7C3A83E2DA779E88A760F0"></a>
### CFFI-FUNCTION: `TCL-DELETE-ASSOC-DATA`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DeleteAssocData`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::NAME :STRING))`
- SETF? `NIL`

/* 100 */ EXTERN void
Tcl_DeleteAssocData(Tcl_Interp *interp, const char *name);

<a name="api-cffi-function-tcl-delete-channel-handler_5E084CFFA84875FFB2CE4AF2C4B64C9B"></a>
### CFFI-FUNCTION: `TCL-DELETE-CHANNEL-HANDLER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DeleteChannelHandler`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL)
 (RAW-CFFI-TCL9::CHAN-PROC RAW-CFFI-TCL9:TCL-CHANNEL-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 101 */ EXTERN void
Tcl_DeleteChannelHandler(
  Tcl_Channel chan, Tcl_ChannelProc *proc, void *clientData);

<a name="api-cffi-function-tcl-delete-close-handler_9AEAFA61153CA04AD2D7C9D0B81E2D34"></a>
### CFFI-FUNCTION: `TCL-DELETE-CLOSE-HANDLER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DeleteCloseHandler`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL)
 (RAW-CFFI-TCL9:CLOSE-PROC RAW-CFFI-TCL9:TCL-CLOSE-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 102 */ EXTERN void
Tcl_DeleteCloseHandler(
  Tcl_Channel chan, Tcl_CloseProc *proc, void *clientData);

<a name="api-cffi-function-tcl-delete-command-from-token_C0C0C5DD98D64EAD332055710965A12E"></a>
### CFFI-FUNCTION: `TCL-DELETE-COMMAND-FROM-TOKEN`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DeleteCommandFromToken`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::COMMAND RAW-CFFI-TCL9:TCL-COMMAND))`
- SETF? `NIL`

/* 104 */ EXTERN int
Tcl_DeleteCommandFromToken(Tcl_Interp *interp, Tcl_Command command);

<a name="api-cffi-function-tcl-delete-command_1A7090A7FA56488DA880497A73F89A37"></a>
### CFFI-FUNCTION: `TCL-DELETE-COMMAND`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DeleteCommand`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CMD-NAME :STRING))`
- SETF? `NIL`

/* 103 */ EXTERN int
Tcl_DeleteCommand(Tcl_Interp *interp, const char *cmdName);

<a name="api-cffi-function-tcl-delete-event-source_ADA3B8F90251AE5E25A5E660D0352F31"></a>
### CFFI-FUNCTION: `TCL-DELETE-EVENT-SOURCE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DeleteEventSource`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::EVT-SETUP-PROC RAW-CFFI-TCL9:TCL-EVENT-SETUP-PROC)
 (RAW-CFFI-TCL9::EVT-CHECK-PROC RAW-CFFI-TCL9:TCL-EVENT-CHECK-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 106 */ EXTERN void
Tcl_DeleteEventSource(
  Tcl_EventSetupProc *setupProc,
  Tcl_EventCheckProc *checkProc,
  void *clientData);

<a name="api-cffi-function-tcl-delete-events_80873D915F2E749D13E93381A43849C7"></a>
### CFFI-FUNCTION: `TCL-DELETE-EVENTS`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DeleteEvents`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::EVT-DELETE-PROC RAW-CFFI-TCL9:TCL-EVENT-DELETE-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 105 */ EXTERN void
Tcl_DeleteEvents(Tcl_EventDeleteProc *proc, void *clientData);

<a name="api-cffi-function-tcl-delete-exit-handler_7D4FDF06C163E240EEEB0E5E7DC366AD"></a>
### CFFI-FUNCTION: `TCL-DELETE-EXIT-HANDLER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DeleteExitHandler`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::EXIT-PROC RAW-CFFI-TCL9:TCL-EXIT-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 107 */ EXTERN void
Tcl_DeleteExitHandler(Tcl_ExitProc *proc, void *clientData);

<a name="api-cffi-function-tcl-delete-file-handler_A3B21763AE0F20B4E23FFD3C0B4F1386"></a>
### CFFI-FUNCTION: `TCL-DELETE-FILE-HANDLER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DeleteFileHandler`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::FD :INT))`
- SETF? `NIL`

/* 10 */ EXTERN void
Tcl_DeleteFileHandler(int fd);

<a name="api-cffi-function-tcl-delete-hash-entry_8F39B9949C2E2367262A1A3197D8A565"></a>
### CFFI-FUNCTION: `TCL-DELETE-HASH-ENTRY`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DeleteHashEntry`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::HASH-ENTRY-PTR RAW-CFFI-TCL9:TCL-HASH-ENTRY-PTR))`
- SETF? `NIL`

/* 108 */ EXTERN void
Tcl_DeleteHashEntry(Tcl_HashEntry *entryPtr);

<a name="api-cffi-function-tcl-delete-hash-table_825BFBC0EEC306AA826FCF93AE5AC3BB"></a>
### CFFI-FUNCTION: `TCL-DELETE-HASH-TABLE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DeleteHashTable`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::HASH-TABLE-PTR RAW-CFFI-TCL9:TCL-HASH-TABLE-PTR))`
- SETF? `NIL`

/* 109 */ EXTERN void
Tcl_DeleteHashTable(Tcl_HashTable *tablePtr);

<a name="api-cffi-function-tcl-delete-interp_DC3BD5465136E59E23E2A514A140C691"></a>
### CFFI-FUNCTION: `TCL-DELETE-INTERP*`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DeleteInterp`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR :POINTER))`
- SETF? `NIL`


<a name="api-cffi-function-tcl-delete-interp_ED4799017B3F6F63522E5D34DDA1DD95"></a>
### CFFI-FUNCTION: `TCL-DELETE-INTERP`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DeleteInterp`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`

/* 110 */ EXTERN void Tcl_DeleteInterp(Tcl_Interp *interp);

<a name="api-cffi-function-tcl-delete-namespace_0211BAB327D51802B39E8221877D2A1D"></a>
### CFFI-FUNCTION: `TCL-DELETE-NAMESPACE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DeleteNamespace`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::NS-PTR RAW-CFFI-TCL9:TCL-NAMESPACE-PTR))`
- SETF? `NIL`

/* 507 */ EXTERN void Tcl_DeleteNamespace(Tcl_Namespace *nsPtr);

<a name="api-cffi-function-tcl-delete-thread-exit-handler_87701328CA18C7A603E1358B7C08E662"></a>
### CFFI-FUNCTION: `TCL-DELETE-THREAD-EXIT-HANDLER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DeleteThreadExitHandler`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::EXIT-PROC RAW-CFFI-TCL9:TCL-EXIT-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 289 */ EXTERN void
Tcl_DeleteThreadExitHandler(Tcl_ExitProc *proc, void *clientData);

<a name="api-cffi-function-tcl-delete-timer-handler_0EAEA0BC06121F6EBD777081BE40FC5B"></a>
### CFFI-FUNCTION: `TCL-DELETE-TIMER-HANDLER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DeleteTimerHandler`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::TIMER-TOKEN RAW-CFFI-TCL9:TCL-TIMER-TOKEN))`
- SETF? `NIL`

/* 112 */ EXTERN void
Tcl_DeleteTimerHandler(Tcl_TimerToken token);

<a name="api-cffi-function-tcl-delete-trace_602D96319BBE17BA01AA9B862D9F4A16"></a>
### CFFI-FUNCTION: `TCL-DELETE-TRACE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DeleteTrace`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (TRACE RAW-CFFI-TCL9:TCL-TRACE))`
- SETF? `NIL`

/* 113 */ EXTERN void
Tcl_DeleteTrace(Tcl_Interp *interp, Tcl_Trace trace);

<a name="api-cffi-function-tcl-detach-channel_10B95523FAA3780DF9ABEFD863CD43B0"></a>
### CFFI-FUNCTION: `TCL-DETACH-CHANNEL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DetachChannel`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL))`
- SETF? `NIL`

/* 438 */ EXTERN int
Tcl_DetachChannel(Tcl_Interp *interp, Tcl_Channel channel);

<a name="api-cffi-function-tcl-detach-pids_ADE4600DA05C6722666E92EC01E52E5E"></a>
### CFFI-FUNCTION: `TCL-DETACH-PIDS`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DetachPids`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::NUM-PIDS RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::PID-PTR RAW-CFFI-TCL9:TCL-PID-PTR))`
- SETF? `NIL`

/* 111 */ EXTERN void
Tcl_DetachPids(Tcl_Size numPids, Tcl_Pid *pidPtr);

<a name="api-cffi-function-tcl-dict-obj-done_B6408236F3EEE98FE1D2D15419A8D10E"></a>
### CFFI-FUNCTION: `TCL-DICT-OBJ-DONE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DictObjDone`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SEARCH-PTR RAW-CFFI-TCL9:TCL-DICT-SEARCH-PTR))`
- SETF? `NIL`

/* 500 */ EXTERN void Tcl_DictObjDone(Tcl_DictSearch *searchPtr);

<a name="api-cffi-function-tcl-dict-obj-first_C83202B1890AA13772343E58677862FD"></a>
### CFFI-FUNCTION: `TCL-DICT-OBJ-FIRST`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DictObjFirst`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::DICT-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::SEARCH-PTR RAW-CFFI-TCL9:TCL-DICT-SEARCH-PTR)
 (RAW-CFFI-TCL9::KEY-PTR-PTR (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR))
 (RAW-CFFI-TCL9::VALUE-PTR-PTR (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR))
 (RAW-CFFI-TCL9::DONE-PTR (:POINTER :INT)))`
- SETF? `NIL`

/* 498 */ EXTERN int
Tcl_DictObjFirst(
  Tcl_Interp *interp,
  Tcl_Obj *dictPtr, Tcl_DictSearch *searchPtr,
  Tcl_Obj **keyPtrPtr, Tcl_Obj **valuePtrPtr,
  int *donePtr);

<a name="api-cffi-function-tcl-dict-obj-get_3E33CEB76A902B6BCC5D517F0645DEE7"></a>
### CFFI-FUNCTION: `TCL-DICT-OBJ-GET`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DictObjGet`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::DICT-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::KEY-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::VALUE-PTR-PTR (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR)))`
- SETF? `NIL`

/* 495 */ EXTERN int
Tcl_DictObjGet(
  Tcl_Interp *interp, Tcl_Obj *dictPtr,
  Tcl_Obj *keyPtr, Tcl_Obj **valuePtrPtr);

<a name="api-cffi-function-tcl-dict-obj-next_4E8E6FB505A90ED710AEAA37D4FAB9C6"></a>
### CFFI-FUNCTION: `TCL-DICT-OBJ-NEXT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DictObjNext`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SEARCH-PTR RAW-CFFI-TCL9:TCL-DICT-SEARCH-PTR)
 (RAW-CFFI-TCL9::KEY-PTR-PTR (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR))
 (RAW-CFFI-TCL9::VALUE-PTR-PTR (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR))
 (RAW-CFFI-TCL9::DONE-PTR (:POINTER :INT)))`
- SETF? `NIL`

/* 499 */ EXTERN void
Tcl_DictObjNext(
  Tcl_DictSearch *searchPtr, Tcl_Obj **keyPtrPtr, Tcl_Obj **valuePtrPtr,
  int *donePtr);

<a name="api-cffi-function-tcl-dict-obj-put-key-list_9BCBE5AEB742C64874F8953C6AA11D6D"></a>
### CFFI-FUNCTION: `TCL-DICT-OBJ-PUT-KEY-LIST`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DictObjPutKeyList`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::DICT-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::KEYC RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::KEYV (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR))
 (RAW-CFFI-TCL9::VALUE-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 501 */ EXTERN int
Tcl_DictObjPutKeyList(
  Tcl_Interp *interp, Tcl_Obj *dictPtr, Tcl_Size keyc,
  Tcl_Obj *const *keyv, Tcl_Obj *valuePtr);

<a name="api-cffi-function-tcl-dict-obj-put_6FEC36590D4DC26E9CB19CD12AC37282"></a>
### CFFI-FUNCTION: `TCL-DICT-OBJ-PUT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DictObjPut`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::DICT-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::KEY-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::VALUE-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 494 */ EXTERN int
Tcl_DictObjPut(
  Tcl_Interp *interp, Tcl_Obj *dictPtr, Tcl_Obj *keyPtr, Tcl_Obj *valuePtr);

<a name="api-cffi-function-tcl-dict-obj-remove-key-list_217F1324F1E2D5937EFC3E5B5007F4FF"></a>
### CFFI-FUNCTION: `TCL-DICT-OBJ-REMOVE-KEY-LIST`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DictObjRemoveKeyList`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::DICT-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::KEYC RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::KEYV (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR)))`
- SETF? `NIL`

/* 502 */ EXTERN int
Tcl_DictObjRemoveKeyList(
  Tcl_Interp *interp, Tcl_Obj *dictPtr,
  Tcl_Size keyc, Tcl_Obj *const *keyv);

<a name="api-cffi-function-tcl-dict-obj-remove_D6AE9D9B5E8B89885CEB3AA01D46399B"></a>
### CFFI-FUNCTION: `TCL-DICT-OBJ-REMOVE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DictObjRemove`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::DICT-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::KEY-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 496 */ EXTERN int
Tcl_DictObjRemove(Tcl_Interp *interp, Tcl_Obj *dictPtr, Tcl_Obj *keyPtr);

<a name="api-cffi-function-tcl-dict-obj-size_3FD0374EF88DE02956DBE1E4A35620AE"></a>
### CFFI-FUNCTION: `TCL-DICT-OBJ-SIZE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DictObjSize`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::DICT-OBJ RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::SIZE-PTR RAW-CFFI-TCL9:TCL-SIZE-PTR))`
- SETF? `NIL`

/* 663 */ EXTERN int
Tcl_DictObjSize(Tcl_Interp *interp, Tcl_Obj *dictPtr, Tcl_Size *sizePtr);

<a name="api-cffi-function-tcl-discard-interp-state_CCE1B201B192A1589C59DD4F12CD87AB"></a>
### CFFI-FUNCTION: `TCL-DISCARD-INTERP-STATE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DiscardInterpState`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::STATE RAW-CFFI-TCL9:TCL-INTERP-STATE))`
- SETF? `NIL`

/* 537 */ EXTERN void Tcl_DiscardInterpState(Tcl_InterpState state);

<a name="api-cffi-function-tcl-do-one-event_DE7EC418130B522741DA78A19B881979"></a>
### CFFI-FUNCTION: `TCL-DO-ONE-EVENT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DoOneEvent`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 115 */ EXTERN int Tcl_DoOneEvent(int flags);

<a name="api-cffi-function-tcl-do-when-idle_01B3D04F30BAE385EC95F8B3774A0E23"></a>
### CFFI-FUNCTION: `TCL-DO-WHEN-IDLE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DoWhenIdle`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::IDLE-PROC RAW-CFFI-TCL9:TCL-IDLE-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 116 */ EXTERN void
Tcl_DoWhenIdle(Tcl_IdleProc *proc, void *clientData);

<a name="api-cffi-function-tcl-dont-call-when-deleted_4A3B2E7FCCC07C7D9A67865AA8EC9414"></a>
### CFFI-FUNCTION: `TCL-DONT-CALL-WHEN-DELETED`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DontCallWhenDeleted`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::INTERP-DELETE-PROC RAW-CFFI-TCL9:TCL-INTERP-DELETE-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 114 */ EXTERN void
Tcl_DontCallWhenDeleted(
  Tcl_Interp *interp, Tcl_InterpDeleteProc *proc, void *clientData);

<a name="api-cffi-function-tcl-dump-active-memory_DDC8150D63316D4C5A42F38D03D131C9"></a>
### CFFI-FUNCTION: `TCL-DUMP-ACTIVE-MEMORY`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DumpActiveMemory`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::FILE-NAME :STRING))`
- SETF? `NIL`

/* 265 */ EXTERN int Tcl_DumpActiveMemory(const char *fileName);

<a name="api-cffi-function-tcl-duplicate-obj_68ED9FF3D592AB5D867AD04425761350"></a>
### CFFI-FUNCTION: `TCL-DUPLICATE-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_DuplicateObj`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 29 */ EXTERN Tcl_Obj *
Tcl_DuplicateObj(Tcl_Obj *objPtr);

<a name="api-cffi-function-tcl-eof_844670BB3E8069A8978CF01236936A2A"></a>
### CFFI-FUNCTION: `TCL-EOF`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Eof`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL))`
- SETF? `NIL`

/* 126 */ EXTERN int
Tcl_Eof(Tcl_Channel chan);

<a name="api-cffi-function-tcl-errno-id_04FD134CF88CF95A8C64B9063323BB0B"></a>
### CFFI-FUNCTION: `TCL-ERRNO-ID`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ErrnoId`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `NIL`
- SETF? `NIL`

/* 127 */ EXTERN const char * Tcl_ErrnoId(void);

<a name="api-cffi-function-tcl-errno-msg_A6A41B4EDB061D0E0FDB4DA1920A7C08"></a>
### CFFI-FUNCTION: `TCL-ERRNO-MSG`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ErrnoMsg`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ERR :INT))`
- SETF? `NIL`

/* 128 */ EXTERN const char * Tcl_ErrnoMsg(int err);

<a name="api-cffi-function-tcl-eval-ex_6F2483F35046D22AFF798836B6E4F146"></a>
### CFFI-FUNCTION: `TCL-EVAL-EX*`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_EvalEx`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR :POINTER) (RAW-CFFI-TCL9::SCRIPT :STRING)
 (RAW-CFFI-TCL9::NUM-BYTES :PTRDIFF) (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`


<a name="api-cffi-function-tcl-eval-ex_F5926BA9EEC40F3F6C12996373F0D459"></a>
### CFFI-FUNCTION: `TCL-EVAL-EX`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_EvalEx`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::SCRIPT :STRING)
 (RAW-CFFI-TCL9::NUM-BYTES RAW-CFFI-TCL9:TCL-SIZE) (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 291 */ EXTERN int
Tcl_EvalEx(Tcl_Interp *interp, const char *script, Tcl_Size numBytes, int flags);

<a name="api-cffi-function-tcl-eval-file_D823A912465CA750F1C937F890E02CC4"></a>
### CFFI-FUNCTION: `TCL-EVAL-FILE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_EvalFile`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::FILE-NAME :STRING))`
- SETF? `NIL`

/* 130 */ EXTERN int
Tcl_EvalFile(Tcl_Interp *interp, const char *fileName);

<a name="api-cffi-function-tcl-eval-obj-ex_B53BCB9B7B5ABEE1354C59BEEA663FD2"></a>
### CFFI-FUNCTION: `TCL-EVAL-OBJ-EX`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_EvalObjEx`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR) (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 293 */ EXTERN int
Tcl_EvalObjEx(Tcl_Interp *interp, Tcl_Obj *objPtr, int flags);

<a name="api-cffi-function-tcl-eval-objv_F0DB0C505D17E2238F38F9BB6EDB9C08"></a>
### CFFI-FUNCTION: `TCL-EVAL-OBJV`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_EvalObjv`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::OBJV (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR))
 (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 292 */ EXTERN int
Tcl_EvalObjv(Tcl_Interp *interp, Tcl_Size objc, Tcl_Obj *const objv[], int flags);

<a name="api-cffi-function-tcl-eval-tokens-standard_70740C79B60D396D7C12B7EEDC3C1EC7"></a>
### CFFI-FUNCTION: `TCL-EVAL-TOKENS-STANDARD`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_EvalTokensStandard`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::TOKEN-PTR RAW-CFFI-TCL9:TCL-TOKEN-PTR)
 (COUNT RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 481 */ EXTERN int
Tcl_EvalTokensStandard(Tcl_Interp *interp, Tcl_Token *tokenPtr, Tcl_Size count);

<a name="api-cffi-function-tcl-eventually-free_F1EE1DE967E723CF73C953C5E3CD4529"></a>
### CFFI-FUNCTION: `TCL-EVENTUALLY-FREE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_EventuallyFree`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA)
 (RAW-CFFI-TCL9::FREE-PROC RAW-CFFI-TCL9:TCL-FREE-PROC))`
- SETF? `NIL`

/* 132 */ EXTERN void
Tcl_EventuallyFree(void *clientData, Tcl_FreeProc *freeProc);

<a name="api-cffi-function-tcl-exit-thread_1D069FDB6CDC49374A031AB112A376F0"></a>
### CFFI-FUNCTION: `TCL-EXIT-THREAD`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ExitThread`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::STATUS :INT))`
- SETF? `NIL`

/* 294 */ EXTERN TCL_NORETURN void Tcl_ExitThread(int status);

<a name="api-cffi-function-tcl-exit_02CE9CABC7B01EC7480E4B8EC6FBEE1E"></a>
### CFFI-FUNCTION: `TCL-EXIT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Exit`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::STATUS :INT))`
- SETF? `NIL`

/* 133 */ EXTERN TCL_NORETURN void Tcl_Exit(int status);

<a name="api-cffi-function-tcl-export_B70418371B4F335CE86A472338579FC1"></a>
### CFFI-FUNCTION: `TCL-EXPORT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Export`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::NS-PTR RAW-CFFI-TCL9:TCL-NAMESPACE-PTR)
 (RAW-CFFI-TCL9::PATTERN :STRING) (RAW-CFFI-TCL9::RESET-LIST-FIRST :INT))`
- SETF? `NIL`

/* 509 */ EXTERN int
Tcl_Export(
  Tcl_Interp *interp, Tcl_Namespace *nsPtr, const char *pattern, int resetListFirst);

<a name="api-cffi-function-tcl-expose-command_CB6BD7DDC2CEDB0FE052838837A9C320"></a>
### CFFI-FUNCTION: `TCL-EXPOSE-COMMAND`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ExposeCommand`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::HIDDEN-CMD-TOKEN :STRING) (RAW-CFFI-TCL9::CMD-NAME :STRING))`
- SETF? `NIL`

/* 134 */ EXTERN int
Tcl_ExposeCommand(
  Tcl_Interp *interp, const char *hiddenCmdToken, const char *cmdName);

<a name="api-cffi-function-tcl-expr-boolean-obj_29105CD6FD0EEC63F3D398214AB607A1"></a>
### CFFI-FUNCTION: `TCL-EXPR-BOOLEAN-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ExprBooleanObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::PTR (:POINTER :INT)))`
- SETF? `NIL`

/* 136 */ EXTERN int
Tcl_ExprBooleanObj(Tcl_Interp *interp, Tcl_Obj *objPtr, int *ptr);

<a name="api-cffi-function-tcl-expr-boolean_123C16CFDA161EF93FAA7CC60E6983E0"></a>
### CFFI-FUNCTION: `TCL-EXPR-BOOLEAN`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ExprBoolean`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::EXPR :STRING) (RAW-CFFI-TCL9::PTR (:POINTER :INT)))`
- SETF? `NIL`

/* 135 */ EXTERN int
Tcl_ExprBoolean(Tcl_Interp *interp, const char *expr, int *ptr);

<a name="api-cffi-function-tcl-expr-double-obj_765630E75D2858942751CC0DC8555D2E"></a>
### CFFI-FUNCTION: `TCL-EXPR-DOUBLE-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ExprDoubleObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::PTR (:POINTER :DOUBLE)))`
- SETF? `NIL`

/* 138 */ EXTERN int
Tcl_ExprDoubleObj(Tcl_Interp *interp, Tcl_Obj *objPtr, double *ptr);

<a name="api-cffi-function-tcl-expr-double_138CD235A136C5E5758D488631C85D12"></a>
### CFFI-FUNCTION: `TCL-EXPR-DOUBLE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ExprDouble`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::EXPR :STRING) (RAW-CFFI-TCL9::PTR (:POINTER :DOUBLE)))`
- SETF? `NIL`

/* 137 */ EXTERN int
Tcl_ExprDouble(Tcl_Interp *interp, const char *expr, double *ptr);

<a name="api-cffi-function-tcl-expr-long-obj_E24EF213C92B7414854776AC6BBF6E26"></a>
### CFFI-FUNCTION: `TCL-EXPR-LONG-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ExprLongObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::PTR (:POINTER :LONG)))`
- SETF? `NIL`

/* 140 */ EXTERN int
Tcl_ExprLongObj(Tcl_Interp *interp, Tcl_Obj *objPtr, long *ptr);

<a name="api-cffi-function-tcl-expr-long_003360D54B6F46F1B2D8D7202EB274A1"></a>
### CFFI-FUNCTION: `TCL-EXPR-LONG`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ExprLong`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::EXPR :STRING) (RAW-CFFI-TCL9::PTR (:POINTER :LONG)))`
- SETF? `NIL`

/* 139 */ EXTERN int
Tcl_ExprLong(Tcl_Interp *interp, const char *expr, long *ptr);

<a name="api-cffi-function-tcl-expr-obj_EA85A59B80A7D680E0A2D113E34A275E"></a>
### CFFI-FUNCTION: `TCL-EXPR-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ExprObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::RESULT-PTR-PTR (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR)))`
- SETF? `NIL`

/* 141 */ EXTERN int
Tcl_ExprObj(Tcl_Interp *interp, Tcl_Obj *objPtr, Tcl_Obj **resultPtrPtr);

<a name="api-cffi-function-tcl-expr-string_EDDE8E10DEF4AF5DDECE4CE5EC724DDC"></a>
### CFFI-FUNCTION: `TCL-EXPR-STRING`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ExprString`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::EXPR :STRING))`
- SETF? `NIL`

/* 142 */ EXTERN int
Tcl_ExprString(Tcl_Interp *interp, const char *expr);

<a name="api-cffi-function-tcl-external-to-utf-d-string-ex_21B19DE14E362E7CF8ACCA342ABA9DAF"></a>
### CFFI-FUNCTION: `TCL-EXTERNAL-TO-UTF-D-STRING-EX`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ExternalToUtfDStringEx`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::ENCODING RAW-CFFI-TCL9:TCL-ENCODING)
 (RAW-CFFI-TCL9::SRC (:POINTER :CHAR))
 (RAW-CFFI-TCL9::SRC-LEN RAW-CFFI-TCL9:TCL-SIZE) (RAW-CFFI-TCL9::FLAGS :INT)
 (RAW-CFFI-TCL9::DS-PTR RAW-CFFI-TCL9:TCL-D-STRING-PTR)
 (RAW-CFFI-TCL9::ERR-LOC-PTR RAW-CFFI-TCL9:TCL-SIZE-PTR))`
- SETF? `NIL`

/* 658 */ EXTERN int
Tcl_ExternalToUtfDStringEx(
  Tcl_Interp *interp,
  Tcl_Encoding encoding, const char *src,
  Tcl_Size srcLen, int flags,
  Tcl_DString *dsPtr,
  Tcl_Size *errorLocationPtr);

<a name="api-cffi-function-tcl-external-to-utf-d-string_2CFBA7D06C8F3E78DB68DB67FEB26054"></a>
### CFFI-FUNCTION: `TCL-EXTERNAL-TO-UTF-D-STRING`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ExternalToUtfDString`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ENCODING RAW-CFFI-TCL9:TCL-ENCODING)
 (RAW-CFFI-TCL9::SRC (:POINTER :CHAR))
 (RAW-CFFI-TCL9::SRC-LEN RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::DS-PTR RAW-CFFI-TCL9:TCL-D-STRING-PTR))`
- SETF? `NIL`

/* 296 */ EXTERN char *
Tcl_ExternalToUtfDString(
  Tcl_Encoding encoding, const char *src, Tcl_Size srcLen, Tcl_DString *dsPtr);

<a name="api-cffi-function-tcl-external-to-utf_637B28297777EA97229733DDD41D9F1F"></a>
### CFFI-FUNCTION: `TCL-EXTERNAL-TO-UTF`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ExternalToUtf`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::ENCODING RAW-CFFI-TCL9:TCL-ENCODING)
 (RAW-CFFI-TCL9::SRC (:POINTER :CHAR))
 (RAW-CFFI-TCL9::SRC-LEN RAW-CFFI-TCL9:TCL-SIZE) (RAW-CFFI-TCL9::FLAGS :INT)
 (RAW-CFFI-TCL9::STATE-PTR RAW-CFFI-TCL9:TCL-ENCODING-STATE-PTR)
 (RAW-CFFI-TCL9::DST (:POINTER :CHAR))
 (RAW-CFFI-TCL9::DST-LEN RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::SRC-READ-PTR (:POINTER :INT))
 (RAW-CFFI-TCL9::DST-WROTE-PTR (:POINTER :INT))
 (RAW-CFFI-TCL9::DST-CHARS-PTR (:POINTER :INT)))`
- SETF? `NIL`

/* 295 */ EXTERN int
Tcl_ExternalToUtf(
  Tcl_Interp *interp, Tcl_Encoding encoding, const char *src,
  Tcl_Size srcLen, int flags,
  Tcl_EncodingState *statePtr, char *dst,
  Tcl_Size dstLen, int *srcReadPtr,
  int *dstWrotePtr, int *dstCharsPtr);

<a name="api-cffi-function-tcl-fetch-internal-rep_AFA8937EFE8F5C3A35619E05AF10E183"></a>
### CFFI-FUNCTION: `TCL-FETCH-INTERNAL-REP`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FetchInternalRep`
- CFFI RETURN-TYPE: `TCL-OBJ-INTERNAL-REP-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::TYPE-PTR RAW-CFFI-TCL9:TCL-OBJ-TYPE-PTR))`
- SETF? `NIL`

/* 638 */ EXTERN Tcl_ObjInternalRep *
Tcl_FetchInternalRep(Tcl_Obj *objPtr, const Tcl_ObjType *typePtr);

<a name="api-cffi-function-tcl-finalize-notifier_96BBE37B616B67003AD2D8A618F02F89"></a>
### CFFI-FUNCTION: `TCL-FINALIZE-NOTIFIER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FinalizeNotifier`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CLIENT-DATA :POINTER))`
- SETF? `NIL`

/* 298 */ EXTERN void Tcl_FinalizeNotifier(void *clientData);

<a name="api-cffi-function-tcl-finalize-thread_669D856B401275762B5414AC76A61A0D"></a>
### CFFI-FUNCTION: `TCL-FINALIZE-THREAD`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FinalizeThread`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `NIL`
- SETF? `NIL`

/* 297 */ EXTERN void Tcl_FinalizeThread(void);

<a name="api-cffi-function-tcl-finalize_61347D0FA27208EB36B601D9D6636A7D"></a>
### CFFI-FUNCTION: `TCL-FINALIZE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Finalize`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `NIL`
- SETF? `NIL`

/* 143 */ EXTERN void Tcl_Finalize(void);

<a name="api-cffi-function-tcl-find-command_9EED9A84162DF0FA80343AAEDAEEFA8B"></a>
### CFFI-FUNCTION: `TCL-FIND-COMMAND`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FindCommand`
- CFFI RETURN-TYPE: `TCL-COMMAND`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::NAME :STRING)
 (RAW-CFFI-TCL9::CONTEXT-NS-PTR RAW-CFFI-TCL9:TCL-NAMESPACE-PTR)
 (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 515 */ EXTERN Tcl_Command
Tcl_FindCommand(
  Tcl_Interp *interp, const char *name,
  Tcl_Namespace *contextNsPtr, int flags);

<a name="api-cffi-function-tcl-find-ensemble_A259BA5C8FE07258AA3FA0767AEE8D15"></a>
### CFFI-FUNCTION: `TCL-FIND-ENSEMBLE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FindEnsemble`
- CFFI RETURN-TYPE: `TCL-COMMAND`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CMD-NAME-OBJ RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 542 */ EXTERN Tcl_Command
Tcl_FindEnsemble(Tcl_Interp *interp, Tcl_Obj *cmdNameObj, int flags);

<a name="api-cffi-function-tcl-find-executable_C45E2492685D4F7EEEDA150DB8C5DB2B"></a>
### CFFI-FUNCTION: `TCL-FIND-EXECUTABLE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FindExecutable`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ARGV0 :STRING))`
- SETF? `NIL`


<a name="api-cffi-function-tcl-find-namespace_3F8B13CF38E643F655BBE1B87936B8E3"></a>
### CFFI-FUNCTION: `TCL-FIND-NAMESPACE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FindNamespace`
- CFFI RETURN-TYPE: `TCL-NAMESPACE-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::NAME :STRING)
 (RAW-CFFI-TCL9::CONTEXT-NS-PTR RAW-CFFI-TCL9:TCL-NAMESPACE-PTR)
 (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 514 */ EXTERN Tcl_Namespace *
Tcl_FindNamespace(
  Tcl_Interp *interp, const char *name, Tcl_Namespace *contextNsPtr, int flags);

<a name="api-cffi-function-tcl-find-symbol_6E5902F8C404A083383BDF4BAC3A50B0"></a>
### CFFI-FUNCTION: `TCL-FIND-SYMBOL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FindSymbol`
- CFFI RETURN-TYPE: `POINTER`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::HANDLE RAW-CFFI-TCL9:TCL-LOAD-HANDLE) (SYMBOL :STRING))`
- SETF? `NIL`

/* 628 */ EXTERN void *
Tcl_FindSymbol(Tcl_Interp *interp, Tcl_LoadHandle handle, const char *symbol);

<a name="api-cffi-function-tcl-first-hash-entry_04CCB15CF8697FDDFEC0DC1775844F6E"></a>
### CFFI-FUNCTION: `TCL-FIRST-HASH-ENTRY`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FirstHashEntry`
- CFFI RETURN-TYPE: `TCL-HASH-ENTRY-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::TABLE-PTR RAW-CFFI-TCL9:TCL-HASH-TABLE-PTR)
 (RAW-CFFI-TCL9::SEARCH-PTR RAW-CFFI-TCL9:TCL-HASH-SEARCH-PTR))`
- SETF? `NIL`

/* 145 */ EXTERN Tcl_HashEntry *
Tcl_FirstHashEntry(Tcl_HashTable *tablePtr, Tcl_HashSearch *searchPtr);

<a name="api-cffi-function-tcl-flush_E35474D5F8EABF93AD024357DABBAE4D"></a>
### CFFI-FUNCTION: `TCL-FLUSH`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Flush`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL))`
- SETF? `NIL`

/* 146 */ EXTERN int Tcl_Flush(Tcl_Channel chan);

<a name="api-cffi-function-tcl-forget-import_C92F26EF822D2444CCBABCDCC748D302"></a>
### CFFI-FUNCTION: `TCL-FORGET-IMPORT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ForgetImport`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::NS-PTR RAW-CFFI-TCL9:TCL-NAMESPACE-PTR)
 (RAW-CFFI-TCL9::PATTERN :STRING))`
- SETF? `NIL`

/* 511 */ EXTERN int
Tcl_ForgetImport(Tcl_Interp *interp, Tcl_Namespace *nsPtr, const char *pattern);

<a name="api-cffi-function-tcl-format_56FC4E4DB6D50D9A9A85B919AFCD54FE"></a>
### CFFI-FUNCTION: `TCL-FORMAT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Format`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR) (FORMAT :STRING)
 (RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::OBJV (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR)))`
- SETF? `NIL`

/* 576 */ EXTERN Tcl_Obj *
Tcl_Format(
  Tcl_Interp *interp, const char *format,
  Tcl_Size objc, Tcl_Obj *const objv[]);

<a name="api-cffi-function-tcl-free-encoding_64C6AC79DB16ABA1DEA964A3FD2E190C"></a>
### CFFI-FUNCTION: `TCL-FREE-ENCODING`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FreeEncoding`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ENCODING RAW-CFFI-TCL9:TCL-ENCODING))`
- SETF? `NIL`

/* 299 */ EXTERN void Tcl_FreeEncoding(Tcl_Encoding encoding);

<a name="api-cffi-function-tcl-free-internal-rep_96398BC4E77B7C8934ECC0DA9B3873CF"></a>
### CFFI-FUNCTION: `TCL-FREE-INTERNAL-REP`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FreeInternalRep`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 636 */ EXTERN void Tcl_FreeInternalRep(Tcl_Obj *objPtr);

<a name="api-cffi-function-tcl-free-obj_1B182F2A051528577B0D7F0CB84FE426"></a>
### CFFI-FUNCTION: `TCL-FREE-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `TclFreeObj`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR :POINTER))`
- SETF? `NIL`


<a name="api-cffi-function-tcl-free-parse_A0FF591473DDBD880CC5B4D927EFFD1E"></a>
### CFFI-FUNCTION: `TCL-FREE-PARSE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FreeParse`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PARSE-PTR RAW-CFFI-TCL9:TCL-PARSE-PTR))`
- SETF? `NIL`

/* 358 */ EXTERN void Tcl_FreeParse(Tcl_Parse *parsePtr);

<a name="api-cffi-function-tcl-free_7F6CC801276AC2B8F8BF6FC814A0D2FC"></a>
### CFFI-FUNCTION: `TCL-FREE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Free`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PTR :POINTER))`
- SETF? `NIL`

/* 4 */ EXTERN void
Tcl_Free(void *ptr);

<a name="api-cffi-function-tcl-fs-access_73DD525058B7CBAB633F32FFC5A0C559"></a>
### CFFI-FUNCTION: `TCL-FS-ACCESS`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSAccess`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR) (RAW-CFFI-TCL9::MODE :INT))`
- SETF? `NIL`

/* 455 */ EXTERN int Tcl_FSAccess(Tcl_Obj *pathPtr, int mode);

<a name="api-cffi-function-tcl-fs-chdir_3FFF8B19ECF569DC98CF11061A2D1375"></a>
### CFFI-FUNCTION: `TCL-FS-CHDIR`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSChdir`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 458 */ EXTERN int Tcl_FSChdir(Tcl_Obj *pathPtr);

<a name="api-cffi-function-tcl-fs-convert-to-path-type_D6B5665BEED102D24D7DCC8F0516F808"></a>
### CFFI-FUNCTION: `TCL-FS-CONVERT-TO-PATH-TYPE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSConvertToPathType`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 459 */ EXTERN int
Tcl_FSConvertToPathType(Tcl_Interp *interp, Tcl_Obj *pathPtr);

<a name="api-cffi-function-tcl-fs-copy-directory_E8F7EADA09D7F40B721974AF2959A364"></a>
### CFFI-FUNCTION: `TCL-FS-COPY-DIRECTORY`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSCopyDirectory`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC-PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::DEST-PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::ERROR-PTR (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR)))`
- SETF? `NIL`

/* 441 */ EXTERN int
Tcl_FSCopyDirectory(Tcl_Obj *srcPathPtr, Tcl_Obj *destPathPtr, Tcl_Obj **errorPtr);

<a name="api-cffi-function-tcl-fs-copy-file_1F44DDA480355B67AEAB4CB6143164D1"></a>
### CFFI-FUNCTION: `TCL-FS-COPY-FILE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSCopyFile`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC-PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::DEST-PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 440 */ EXTERN int
Tcl_FSCopyFile(Tcl_Obj *srcPathPtr, Tcl_Obj *destPathPtr);

<a name="api-cffi-function-tcl-fs-data_2098A174197FE9992E7F56B551F64AB2"></a>
### CFFI-FUNCTION: `TCL-FS-DATA`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSData`
- CFFI RETURN-TYPE: `CLIENT-DATA`
- LAMBDA LIST: `((RAW-CFFI-TCL9::FS-PTR RAW-CFFI-TCL9:TCL-FILESYSTEM-PTR))`
- SETF? `NIL`

/* 475 */ EXTERN void * Tcl_FSData(const Tcl_Filesystem *fsPtr);

<a name="api-cffi-function-tcl-fs-delete-file_B5759705339CBBFB2355DB4C140E781F"></a>
### CFFI-FUNCTION: `TCL-FS-DELETE-FILE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSDeleteFile`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 443 */ EXTERN int Tcl_FSDeleteFile(Tcl_Obj *pathPtr);

<a name="api-cffi-function-tcl-fs-equal-paths_6EA593B30BB070E032AAFC532B2C59A5"></a>
### CFFI-FUNCTION: `TCL-FS-EQUAL-PATHS`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSEqualPaths`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::FIRST-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::SECOND-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 462 */ EXTERN int Tcl_FSEqualPaths(Tcl_Obj *firstPtr, Tcl_Obj *secondPtr);

<a name="api-cffi-function-tcl-fs-eval-file-ex_96FFDC4046814C734C844607C9B84366"></a>
### CFFI-FUNCTION: `TCL-FS-EVAL-FILE-EX`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSEvalFileEx`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::FILE-NAME RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::ENCODING-NAME :STRING))`
- SETF? `NIL`

/* 518 */ EXTERN int
Tcl_FSEvalFileEx(Tcl_Interp *interp, Tcl_Obj *fileName, const char *encodingName);

<a name="api-cffi-function-tcl-fs-eval-file_BDF0EE20A2C83E02908FA4652CDA73C9"></a>
### CFFI-FUNCTION: `TCL-FS-EVAL-FILE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSEvalFile`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::FILE-NAME RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 467 */ EXTERN int
Tcl_FSEvalFile(Tcl_Interp *interp, Tcl_Obj *fileName);

<a name="api-cffi-function-tcl-fs-file-attr-strings_D16CEDAB099D5C038DA6AAA9ACB2A68D"></a>
### CFFI-FUNCTION: `TCL-FS-FILE-ATTR-STRINGS`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSFileAttrStrings`
- CFFI RETURN-TYPE: `(POINTER (POINTER CHAR))`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR)))`
- SETF? `NIL`

/* 453 */ EXTERN const char *const *
 Tcl_FSFileAttrStrings(Tcl_Obj *pathPtr, Tcl_Obj **objPtrRef);

<a name="api-cffi-function-tcl-fs-file-attrs-get_4FE770EF3E9E19711B56C6FAA7154234"></a>
### CFFI-FUNCTION: `TCL-FS-FILE-ATTRS-GET`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSFileAttrsGet`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::INDEX :INT)
 (RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR-REF (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR)))`
- SETF? `NIL`

/* 451 */ EXTERN int
Tcl_FSFileAttrsGet(
  Tcl_Interp *interp, int index, Tcl_Obj *pathPtr, Tcl_Obj **objPtrRef);

<a name="api-cffi-function-tcl-fs-file-attrs-set_23903E1835DE3EDB4AB80CD8D33C6BE2"></a>
### CFFI-FUNCTION: `TCL-FS-FILE-ATTRS-SET`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSFileAttrsSet`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::INDEX :INT)
 (RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 452 */ EXTERN int
Tcl_FSFileAttrsSet(
  Tcl_Interp *interp, int index, Tcl_Obj *pathPtr, Tcl_Obj *objPtr);

<a name="api-cffi-function-tcl-fs-file-system-info_4DDAD3AD3D0050AC0314DD4011D9C4E3"></a>
### CFFI-FUNCTION: `TCL-FS-FILE-SYSTEM-INFO`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSFileSystemInfo`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 470 */ EXTERN Tcl_Obj * Tcl_FSFileSystemInfo(Tcl_Obj *pathPtr);

<a name="api-cffi-function-tcl-fs-get-cwd_D6586B7C9DD2E74A5BDA9F6E37A8C41E"></a>
### CFFI-FUNCTION: `TCL-FS-GET-CWD`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSGetCwd`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`

/* 457 */ EXTERN Tcl_Obj * Tcl_FSGetCwd(Tcl_Interp *interp);

<a name="api-cffi-function-tcl-fs-get-file-system-for-path_9F54BC2DD462674B321F13645EA3540A"></a>
### CFFI-FUNCTION: `TCL-FS-GET-FILE-SYSTEM-FOR-PATH`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSGetFileSystemForPath`
- CFFI RETURN-TYPE: `TCL-FILESYSTEM-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 477 */ EXTERN const Tcl_Filesystem *
Tcl_FSGetFileSystemForPath(Tcl_Obj *pathPtr);

<a name="api-cffi-function-tcl-fs-get-internal-rep_40F38A430AE9F5D8806EC9D216AD37EA"></a>
### CFFI-FUNCTION: `TCL-FS-GET-INTERNAL-REP`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSGetInternalRep`
- CFFI RETURN-TYPE: `CLIENT-DATA`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::FS-PTR RAW-CFFI-TCL9:TCL-FILESYSTEM-PTR))`
- SETF? `NIL`

/* 465 */ EXTERN void *
Tcl_FSGetInternalRep(Tcl_Obj *pathPtr, const Tcl_Filesystem *fsPtr);

<a name="api-cffi-function-tcl-fs-get-native-path_78899E0413041C0BA5AED17F5B6BDD71"></a>
### CFFI-FUNCTION: `TCL-FS-GET-NATIVE-PATH`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSGetNativePath`
- CFFI RETURN-TYPE: `POINTER`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 469 */ EXTERN const void * Tcl_FSGetNativePath(Tcl_Obj *pathPtr);

<a name="api-cffi-function-tcl-fs-get-normalized-path_BFDA6E0C4A9E5EE4053A07188858A3CE"></a>
### CFFI-FUNCTION: `TCL-FS-GET-NORMALIZED-PATH`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSGetNormalizedPath`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 463 */ EXTERN Tcl_Obj *
Tcl_FSGetNormalizedPath(Tcl_Interp *interp, Tcl_Obj *pathPtr);

<a name="api-cffi-function-tcl-fs-get-path-type_ADAA938857D7ECC35C604E8BACA4F3A6"></a>
### CFFI-FUNCTION: `TCL-FS-GET-PATH-TYPE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSGetPathType`
- CFFI RETURN-TYPE: `TCL-PATH-TYPE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 478 */ EXTERN Tcl_PathType Tcl_FSGetPathType(Tcl_Obj *pathPtr);

<a name="api-cffi-function-tcl-fs-get-translated-path_F1E6192E19C8BB79D0EC7B02AE2728ED"></a>
### CFFI-FUNCTION: `TCL-FS-GET-TRANSLATED-PATH`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSGetTranslatedPath`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 466 */ EXTERN Tcl_Obj *
Tcl_FSGetTranslatedPath(Tcl_Interp *interp, Tcl_Obj *pathPtr);

<a name="api-cffi-function-tcl-fs-get-translated-string-path_A0C0A834AAF836CEE42ED96B4BEDCD18"></a>
### CFFI-FUNCTION: `TCL-FS-GET-TRANSLATED-STRING-PATH`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSGetTranslatedStringPath`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 476 */ EXTERN const char *
Tcl_FSGetTranslatedStringPath(
  Tcl_Interp *interp, Tcl_Obj *pathPtr);

<a name="api-cffi-function-tcl-fs-join-path_610681866F3F2CFA91FFB2A8AEE8B21F"></a>
### CFFI-FUNCTION: `TCL-FS-JOIN-PATH`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSJoinPath`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::LIST-OBJ RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::ELEMENTS RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 460 */ EXTERN Tcl_Obj *
Tcl_FSJoinPath(Tcl_Obj *listObj, Tcl_Size elements);

<a name="api-cffi-function-tcl-fs-join-to-path_503FA44963EE83917610792E24511F73"></a>
### CFFI-FUNCTION: `TCL-FS-JOIN-TO-PATH`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSJoinToPath`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::OBJV (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR)))`
- SETF? `NIL`

/* 464 */ EXTERN Tcl_Obj *
Tcl_FSJoinToPath(Tcl_Obj *pathPtr, Tcl_Size objc, Tcl_Obj *const objv[]);

<a name="api-cffi-function-tcl-fs-link_121A524F536B6D964256394C10E86CEF"></a>
### CFFI-FUNCTION: `TCL-FS-LINK`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSLink`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::TO-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::LINK-ACTION :INT))`
- SETF? `NIL`

/* 446 */ EXTERN Tcl_Obj *
Tcl_FSLink(Tcl_Obj *pathPtr, Tcl_Obj *toPtr, int linkAction);

<a name="api-cffi-function-tcl-fs-list-volumes_1D560F86F6179A28386CD90BA92FE8FF"></a>
### CFFI-FUNCTION: `TCL-FS-LIST-VOLUMES`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSListVolumes`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `NIL`
- SETF? `NIL`

/* 472 */ EXTERN Tcl_Obj * Tcl_FSListVolumes(void);

<a name="api-cffi-function-tcl-fs-load-file_F221D8FFEF07D244B6B85C3FC3361DEB"></a>
### CFFI-FUNCTION: `TCL-FS-LOAD-FILE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSLoadFile`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::SYM-1 :STRING) (RAW-CFFI-TCL9::SYM-2 :STRING)
 (RAW-CFFI-TCL9::PROC-1-PTR (:POINTER RAW-CFFI-TCL9:TCL-LIBRARY-INIT-PROC))
 (RAW-CFFI-TCL9::PROC-2-PTR (:POINTER RAW-CFFI-TCL9:TCL-LIBRARY-INIT-PROC))
 (RAW-CFFI-TCL9::LOAD-HANDLE-PTR RAW-CFFI-TCL9:TCL-LOAD-HANDLE-PTR)
 (RAW-CFFI-TCL9::UNLOAD-PROC (:POINTER RAW-CFFI-TCL9:TCL-FS-UNLOAD-FILE-PROC)))`
- SETF? `NIL`

/* 444 */ EXTERN int
Tcl_FSLoadFile(
  Tcl_Interp *interp, Tcl_Obj *pathPtr,
  const char *sym1, const char *sym2,
  Tcl_LibraryInitProc **proc1Ptr,
  Tcl_LibraryInitProc **proc2Ptr,
  Tcl_LoadHandle *handlePtr,
  Tcl_FSUnloadFileProc **unloadProcPtr);

<a name="api-cffi-function-tcl-fs-lstat_9C548B6EA1BAFFE4B6CEC9B5F283C96D"></a>
### CFFI-FUNCTION: `TCL-FS-LSTAT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSLstat`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::BUF RAW-CFFI-TCL9:TCL-STAT-BUF-PTR))`
- SETF? `NIL`

/* 449 */ EXTERN int Tcl_FSLstat(Tcl_Obj *pathPtr, Tcl_StatBuf *buf);

<a name="api-cffi-function-tcl-fs-match-in-directory_75DEBEC1CD534689FB982FCBDECA4D1C"></a>
### CFFI-FUNCTION: `TCL-FS-MATCH-IN-DIRECTORY`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSMatchInDirectory`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::RESULT RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::PATTERN :STRING)
 (RAW-CFFI-TCL9::TYPES RAW-CFFI-TCL9:TCL-GLOB-TYPE-DATA-PTR))`
- SETF? `NIL`

/* 445 */ EXTERN int
Tcl_FSMatchInDirectory(
  Tcl_Interp *interp, Tcl_Obj *result, Tcl_Obj *pathPtr,
  const char *pattern, Tcl_GlobTypeData *types);

<a name="api-cffi-function-tcl-fs-mounts-changed_A55CA9ACFCAD211E084307715451A37F"></a>
### CFFI-FUNCTION: `TCL-FS-MOUNTS-CHANGED`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSMountsChanged`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::FS-PTR RAW-CFFI-TCL9:TCL-FILESYSTEM-PTR))`
- SETF? `NIL`

/* 480 */ EXTERN void Tcl_FSMountsChanged(const Tcl_Filesystem *fsPtr);

<a name="api-cffi-function-tcl-fs-new-native-path_7DCCC4B1A43A9F9CD8766E7B1EC2C364"></a>
### CFFI-FUNCTION: `TCL-FS-NEW-NATIVE-PATH`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSNewNativePath`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::FROM-FILESYSTEM RAW-CFFI-TCL9:TCL-FILESYSTEM-PTR)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 468 */ EXTERN Tcl_Obj *
Tcl_FSNewNativePath(
  const Tcl_Filesystem *fromFilesystem, void *clientData);

<a name="api-cffi-function-tcl-fs-open-file-channel_5B6EA6AF0D16C93A008F01FB81F08728"></a>
### CFFI-FUNCTION: `TCL-FS-OPEN-FILE-CHANNEL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSOpenFileChannel`
- CFFI RETURN-TYPE: `TCL-CHANNEL`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::MODE-STRING :STRING) (RAW-CFFI-TCL9::PERMISSIONS :INT))`
- SETF? `NIL`

/* 456 */ EXTERN Tcl_Channel
Tcl_FSOpenFileChannel(
  Tcl_Interp *interp, Tcl_Obj *pathPtr, const char *modeString, int permissions);

<a name="api-cffi-function-tcl-fs-path-separator_B709FDC1F628F0ADABFA3D6A27F68AB9"></a>
### CFFI-FUNCTION: `TCL-FS-PATH-SEPARATOR`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSPathSeparator`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 471 */ EXTERN Tcl_Obj * Tcl_FSPathSeparator(Tcl_Obj *pathPtr);

<a name="api-cffi-function-tcl-fs-register_1E442DD872B95E3EEDAD67ABDED469F9"></a>
### CFFI-FUNCTION: `TCL-FS-REGISTER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSRegister`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA)
 (RAW-CFFI-TCL9::FS-PTR RAW-CFFI-TCL9:TCL-FILESYSTEM-PTR))`
- SETF? `NIL`

/* 473 */ EXTERN int Tcl_FSRegister(void *clientData, const Tcl_Filesystem *fsPtr);

<a name="api-cffi-function-tcl-fs-remove-directory_F5F89587EF1BB7D77720F9EB9A8CD43A"></a>
### CFFI-FUNCTION: `TCL-FS-REMOVE-DIRECTORY`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSRemoveDirectory`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::RECURSIVE :INT)
 (RAW-CFFI-TCL9::ERROR-PTR (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR)))`
- SETF? `NIL`

/* 447 */ EXTERN int
Tcl_FSRemoveDirectory(Tcl_Obj *pathPtr, int recursive, Tcl_Obj **errorPtr);

<a name="api-cffi-function-tcl-fs-rename-file_8705B6F81AF4ED0D7EACB319D491E6D5"></a>
### CFFI-FUNCTION: `TCL-FS-RENAME-FILE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSRenameFile`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC-PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::DEST-PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 448 */ EXTERN int
Tcl_FSRenameFile(Tcl_Obj *srcPathPtr, Tcl_Obj *destPathPtr);

<a name="api-cffi-function-tcl-fs-split-path_6F05782FEDC5503EE7D2C133AAF35F22"></a>
### CFFI-FUNCTION: `TCL-FS-SPLIT-PATH`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSSplitPath`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::LEN-PTR RAW-CFFI-TCL9:TCL-SIZE-PTR))`
- SETF? `NIL`

/* 666 */ EXTERN Tcl_Obj * Tcl_FSSplitPath(Tcl_Obj *pathPtr, Tcl_Size *lenPtr);

<a name="api-cffi-function-tcl-fs-stat_0DF0A2FD67334C09EC317952391D683E"></a>
### CFFI-FUNCTION: `TCL-FS-STAT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSStat`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::BUF RAW-CFFI-TCL9:TCL-STAT-BUF-PTR))`
- SETF? `NIL`

/* 454 */ EXTERN int Tcl_FSStat(Tcl_Obj *pathPtr, Tcl_StatBuf *buf);

<a name="api-cffi-function-tcl-fs-tilde-expand_40C4D6F724E7343E1F94601C18A2D961"></a>
### CFFI-FUNCTION: `TCL-FS-TILDE-EXPAND`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSTildeExpand`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::PATH :STRING)
 (RAW-CFFI-TCL9::DS-PTR RAW-CFFI-TCL9:TCL-D-STRING-PTR))`
- SETF? `NIL`

/* 657 */ EXTERN int
Tcl_FSTildeExpand(Tcl_Interp *interp, const char *path, Tcl_DString *dsPtr);

<a name="api-cffi-function-tcl-fs-unload-file_9D0BFA602D87BE954526A0BA6CC45EC8"></a>
### CFFI-FUNCTION: `TCL-FS-UNLOAD-FILE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSUnloadFile`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::LOAD-HANDLE RAW-CFFI-TCL9:TCL-LOAD-HANDLE))`
- SETF? `NIL`

/* 629 */ EXTERN int
Tcl_FSUnloadFile(Tcl_Interp *interp, Tcl_LoadHandle handlePtr);

<a name="api-cffi-function-tcl-fs-unregister_621F252C8D658A93B7827AE3D7F4718E"></a>
### CFFI-FUNCTION: `TCL-FS-UNREGISTER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSUnregister`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::FS-PTR RAW-CFFI-TCL9:TCL-FILESYSTEM-PTR))`
- SETF? `NIL`

/* 474 */ EXTERN int Tcl_FSUnregister(const Tcl_Filesystem *fsPtr);

<a name="api-cffi-function-tcl-fs-utime_B22F328DFC5E6435911134069ECFD02D"></a>
### CFFI-FUNCTION: `TCL-FS-UTIME`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSUtime`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::TVAL :POINTER))`
- SETF? `NIL`

/* 450 */ EXTERN int Tcl_FSUtime(Tcl_Obj *pathPtr, struct utimbuf *tval);

<a name="api-cffi-function-tcl-get-access-time-from-stat_AB314096512B493F368AFD29F521B20F"></a>
### CFFI-FUNCTION: `TCL-GET-ACCESS-TIME-FROM-STAT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetAccessTimeFromStat`
- CFFI RETURN-TYPE: `LONG-LONG`
- LAMBDA LIST: `((RAW-CFFI-TCL9::STAT-PTR RAW-CFFI-TCL9:TCL-STAT-BUF-PTR))`
- SETF? `NIL`

/* 596 */ EXTERN long long Tcl_GetAccessTimeFromStat(const Tcl_StatBuf *statPtr);

<a name="api-cffi-function-tcl-get-alias-obj_7B476688A573C28B95177770ED5D82F0"></a>
### CFFI-FUNCTION: `TCL-GET-ALIAS-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetAliasObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CHILD-CMD :STRING)
 (RAW-CFFI-TCL9::TARGET-INTERP-PTR (:POINTER RAW-CFFI-TCL9:TCL-INTERP-PTR))
 (RAW-CFFI-TCL9::TARGET-CMD-PTR (:POINTER (:POINTER :CHAR)))
 (RAW-CFFI-TCL9::OBJC-PTR RAW-CFFI-TCL9:TCL-SIZE-PTR)
 (RAW-CFFI-TCL9::OBJV-PTR (:POINTER (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR))))`
- SETF? `NIL`

/* 285 */ EXTERN int
Tcl_GetAliasObj(
  Tcl_Interp *interp, const char *childCmd,
  Tcl_Interp **targetInterpPtr, const char **targetCmdPtr,
  Tcl_Size *objcPtr, Tcl_Obj ***objvPtr);

<a name="api-cffi-function-tcl-get-alloc-mutex_1705F64EA0890A1E95B9405D74162A22"></a>
### CFFI-FUNCTION: `TCL-GET-ALLOC-MUTEX`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetAllocMutex`
- CFFI RETURN-TYPE: `TCL-MUTEX-PTR`
- LAMBDA LIST: `NIL`
- SETF? `NIL`

/* 387 */ EXTERN Tcl_Mutex * Tcl_GetAllocMutex(void);

<a name="api-cffi-function-tcl-get-assoc-data_2B974B36C96FEE87B2E6A594B256C031"></a>
### CFFI-FUNCTION: `TCL-GET-ASSOC-DATA`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetAssocData`
- CFFI RETURN-TYPE: `CLIENT-DATA`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::NAME :STRING)
 (RAW-CFFI-TCL9::INTERP-DELETE-PROC
  (:POINTER RAW-CFFI-TCL9:TCL-INTERP-DELETE-PROC)))`
- SETF? `NIL`

/* 150 */ EXTERN void *
Tcl_GetAssocData(
  Tcl_Interp *interp, const char *name, Tcl_InterpDeleteProc **procPtr);

<a name="api-cffi-function-tcl-get-bignum-from-obj_1108E95E5A15281440B8BB6162AA8DDA"></a>
### CFFI-FUNCTION: `TCL-GET-BIGNUM-FROM-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetBignumFromObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ RAW-CFFI-TCL9:TCL-OBJ-PTR) (RAW-CFFI-TCL9::VALUE :POINTER))`
- SETF? `NIL`

/* 558 */ EXTERN int
Tcl_GetBignumFromObj(Tcl_Interp *interp, Tcl_Obj *obj, void *value);

<a name="api-cffi-function-tcl-get-block-size-from-stat_92E8C544716351D150618263D99F5CBB"></a>
### CFFI-FUNCTION: `TCL-GET-BLOCK-SIZE-FROM-STAT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetBlockSizeFromStat`
- CFFI RETURN-TYPE: `UINT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::STAT-PTR RAW-CFFI-TCL9:TCL-STAT-BUF-PTR))`
- SETF? `NIL`

/* 601 */ EXTERN unsigned Tcl_GetBlockSizeFromStat(const Tcl_StatBuf *statPtr);

<a name="api-cffi-function-tcl-get-blocks-from-stat_D2603C2F68E05938073175BF8DB41689"></a>
### CFFI-FUNCTION: `TCL-GET-BLOCKS-FROM-STAT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetBlocksFromStat`
- CFFI RETURN-TYPE: `UNSIGNED-LONG-LONG`
- LAMBDA LIST: `((RAW-CFFI-TCL9::STAT-PTR RAW-CFFI-TCL9:TCL-STAT-BUF-PTR))`
- SETF? `NIL`

/* 600 */ EXTERN unsigned long long Tcl_GetBlocksFromStat(const Tcl_StatBuf *statPtr);

<a name="api-cffi-function-tcl-get-bool-from-obj_0F19BA76F2B8805F3D7C24C97C5FC26D"></a>
### CFFI-FUNCTION: `TCL-GET-BOOL-FROM-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetBoolFromObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR) (RAW-CFFI-TCL9::FLAGS :INT)
 (RAW-CFFI-TCL9::CHAR-PTR (:POINTER :CHAR)))`
- SETF? `NIL`

/* 675 */ EXTERN int
Tcl_GetBoolFromObj(Tcl_Interp *interp, Tcl_Obj *objPtr, int flags, char *charPtr);

<a name="api-cffi-function-tcl-get-bool_0F4CC8020C3A616A288A39B305A5E540"></a>
### CFFI-FUNCTION: `TCL-GET-BOOL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetBool`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::SRC (:POINTER :CHAR)) (RAW-CFFI-TCL9::FLAGS :INT)
 (RAW-CFFI-TCL9::CHAR-PTR (:POINTER :CHAR)))`
- SETF? `NIL`

/* 674 */ EXTERN int
Tcl_GetBool(Tcl_Interp *interp, const char *src, int flags, char *charPtr);

<a name="api-cffi-function-tcl-get-boolean-from-obj_0A3361D3E514DB8E9D2257CCDA0ABBE6"></a>
### CFFI-FUNCTION: `TCL-GET-BOOLEAN-FROM-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetBooleanFromObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::INT-PTR (:POINTER :INT)))`
- SETF? `NIL`

/* 32 */ EXTERN int
Tcl_GetBooleanFromObj(
  Tcl_Interp *interp, Tcl_Obj *objPtr, int *intPtr);

<a name="api-cffi-function-tcl-get-boolean_890570D03363058901799E0B1DEF8657"></a>
### CFFI-FUNCTION: `TCL-GET-BOOLEAN`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetBoolean`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::SRC :STRING) (RAW-CFFI-TCL9::INT-PTR (:POINTER :INT)))`
- SETF? `NIL`

/* 31 */ EXTERN int
Tcl_GetBoolean(
  Tcl_Interp *interp, const char *src, int *intPtr);

<a name="api-cffi-function-tcl-get-bytes-from-obj_810083B44F603177CEF020F86A590B55"></a>
### CFFI-FUNCTION: `TCL-GET-BYTES-FROM-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetBytesFromObj`
- CFFI RETURN-TYPE: `(POINTER UCHAR)`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::NUM-BYTES-PTR RAW-CFFI-TCL9:TCL-SIZE-PTR))`
- SETF? `NIL`

/* 650 */ EXTERN unsigned char *
Tcl_GetBytesFromObj(Tcl_Interp *interp, Tcl_Obj *objPtr, Tcl_Size *numBytesPtr);

<a name="api-cffi-function-tcl-get-change-time-from-stat_5C86E9B30A6B5805E7D11267B5396F77"></a>
### CFFI-FUNCTION: `TCL-GET-CHANGE-TIME-FROM-STAT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetChangeTimeFromStat`
- CFFI RETURN-TYPE: `LONG-LONG`
- LAMBDA LIST: `((RAW-CFFI-TCL9::STAT-PTR RAW-CFFI-TCL9:TCL-STAT-BUF-PTR))`
- SETF? `NIL`

/* 598 */ EXTERN long long Tcl_GetChangeTimeFromStat(const Tcl_StatBuf *statPtr);

<a name="api-cffi-function-tcl-get-channel-buffer-size_3C0F3291F226DCCE9C6985FDBE47DC17"></a>
### CFFI-FUNCTION: `TCL-GET-CHANNEL-BUFFER-SIZE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetChannelBufferSize`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL))`
- SETF? `NIL`

/* 152 */ EXTERN Tcl_Size
Tcl_GetChannelBufferSize(Tcl_Channel chan);

<a name="api-cffi-function-tcl-get-channel-error-interp_DBA15BA281A0A2662804ECFF3385B92B"></a>
### CFFI-FUNCTION: `TCL-GET-CHANNEL-ERROR-INTERP`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetChannelErrorInterp`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::MSG (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR)))`
- SETF? `NIL`

/* 563 */ EXTERN void
Tcl_GetChannelErrorInterp(Tcl_Interp *interp, Tcl_Obj **msg);

<a name="api-cffi-function-tcl-get-channel-error_282337426343153144716CC8AEE13C41"></a>
### CFFI-FUNCTION: `TCL-GET-CHANNEL-ERROR`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetChannelError`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL)
 (RAW-CFFI-TCL9::MSG (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR)))`
- SETF? `NIL`

/* 565 */ EXTERN void Tcl_GetChannelError(Tcl_Channel chan, Tcl_Obj **msg);

<a name="api-cffi-function-tcl-get-channel-handle_147457CAF744DBCE92F458D6B0ECB5B0"></a>
### CFFI-FUNCTION: `TCL-GET-CHANNEL-HANDLE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetChannelHandle`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL)
 (RAW-CFFI-TCL9::DIRECTION :INT)
 (RAW-CFFI-TCL9::HANDLE-PTR (:POINTER :POINTER)))`
- SETF? `NIL`

/* 153 */ EXTERN int
Tcl_GetChannelHandle(Tcl_Channel chan, int direction, void **handlePtr);

<a name="api-cffi-function-tcl-get-channel-instance-data_99707D247410930174F608FD6BA01F55"></a>
### CFFI-FUNCTION: `TCL-GET-CHANNEL-INSTANCE-DATA`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetChannelInstanceData`
- CFFI RETURN-TYPE: `CLIENT-DATA`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL))`
- SETF? `NIL`

/* 154 */ EXTERN void * Tcl_GetChannelInstanceData(Tcl_Channel chan);

<a name="api-cffi-function-tcl-get-channel-mode_13CC8D04BBC65C99B1ACEBEC3351702D"></a>
### CFFI-FUNCTION: `TCL-GET-CHANNEL-MODE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetChannelMode`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL))`
- SETF? `NIL`

/* 155 */ EXTERN int Tcl_GetChannelMode(Tcl_Channel chan);

<a name="api-cffi-function-tcl-get-channel-name_81E0EC28BE5FB706D76DD9A05631908F"></a>
### CFFI-FUNCTION: `TCL-GET-CHANNEL-NAME`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetChannelName`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL))`
- SETF? `NIL`

/* 156 */ EXTERN const char * Tcl_GetChannelName(Tcl_Channel chan);

<a name="api-cffi-function-tcl-get-channel-names-ex_5C20FFC40EADAB716A96B0BD3DDAE0CE"></a>
### CFFI-FUNCTION: `TCL-GET-CHANNEL-NAMES-EX`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetChannelNamesEx`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::PATTERN :STRING))`
- SETF? `NIL`

/* 389 */ EXTERN int
Tcl_GetChannelNamesEx(Tcl_Interp *interp, const char *pattern);

<a name="api-cffi-function-tcl-get-channel-names_A295574DE5A584CA6BBC3ABBDD101EF8"></a>
### CFFI-FUNCTION: `TCL-GET-CHANNEL-NAMES`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetChannelNames`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`

/* 388 */ EXTERN int Tcl_GetChannelNames(Tcl_Interp *interp);

<a name="api-cffi-function-tcl-get-channel-option_F175F8E6E7E3CF65189D986AADA2A785"></a>
### CFFI-FUNCTION: `TCL-GET-CHANNEL-OPTION`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetChannelOption`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL)
 (RAW-CFFI-TCL9::OPTION-NAME :STRING)
 (RAW-CFFI-TCL9::DS-PTR RAW-CFFI-TCL9:TCL-D-STRING-PTR))`
- SETF? `NIL`

/* 157 */ EXTERN int
Tcl_GetChannelOption(
  Tcl_Interp *interp, Tcl_Channel chan,
  const char *optionName, Tcl_DString *dsPtr);

<a name="api-cffi-function-tcl-get-channel-thread_86BDA93E676799661322777851F644BB"></a>
### CFFI-FUNCTION: `TCL-GET-CHANNEL-THREAD`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetChannelThread`
- CFFI RETURN-TYPE: `TCL-THREAD-ID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL))`
- SETF? `NIL`

/* 433 */ EXTERN Tcl_ThreadId Tcl_GetChannelThread(Tcl_Channel channel);

<a name="api-cffi-function-tcl-get-channel-type_88939B9AFA764B8DB55D19ABB160C0C4"></a>
### CFFI-FUNCTION: `TCL-GET-CHANNEL-TYPE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetChannelType`
- CFFI RETURN-TYPE: `TCL-CHANNEL-TYPE-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL))`
- SETF? `NIL`

/* 158 */ EXTERN const Tcl_ChannelType *
Tcl_GetChannelType(Tcl_Channel chan);

<a name="api-cffi-function-tcl-get-channel_76F0EA16733D54BC095C87B40AED78E2"></a>
### CFFI-FUNCTION: `TCL-GET-CHANNEL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetChannel`
- CFFI RETURN-TYPE: `TCL-CHANNEL`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CHAN-NAME :STRING) (RAW-CFFI-TCL9::MOD-PTR (:POINTER :INT)))`
- SETF? `NIL`

/* 151 */ EXTERN Tcl_Channel
Tcl_GetChannel(Tcl_Interp *interp, const char *chanName, int *modePtr);

<a name="api-cffi-function-tcl-get-char-length_F386B4DBEDE55F64261B7D32B393F4E1"></a>
### CFFI-FUNCTION: `TCL-GET-CHAR-LENGTH`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetCharLength`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 670 */ EXTERN Tcl_Size Tcl_GetCharLength(Tcl_Obj *objPtr);

<a name="api-cffi-function-tcl-get-child_B26C65B9E71F6585FE637A04A4D88832"></a>
### CFFI-FUNCTION: `TCL-GET-CHILD`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetChild`
- CFFI RETURN-TYPE: `TCL-INTERP-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::NAME :STRING))`
- SETF? `NIL`

/* 172 */ EXTERN Tcl_Interp *
Tcl_GetChild(Tcl_Interp *interp, const char *name);

<a name="api-cffi-function-tcl-get-command-from-obj_6BCFDFD986CBCF2F5DA581B65E13F64D"></a>
### CFFI-FUNCTION: `TCL-GET-COMMAND-FROM-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetCommandFromObj`
- CFFI RETURN-TYPE: `TCL-COMMAND`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 516 */ EXTERN Tcl_Command
Tcl_GetCommandFromObj(Tcl_Interp *interp, Tcl_Obj *objPtr);

<a name="api-cffi-function-tcl-get-command-full-name_F2757C08020A09C184251BCEF189D001"></a>
### CFFI-FUNCTION: `TCL-GET-COMMAND-FULL-NAME`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetCommandFullName`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::COMMAND RAW-CFFI-TCL9:TCL-COMMAND)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 517 */ EXTERN void
Tcl_GetCommandFullName(Tcl_Interp *interp, Tcl_Command command, Tcl_Obj *objPtr);

<a name="api-cffi-function-tcl-get-command-info-from-token_8EE0B5C2B249F0808FB911C33BA9620C"></a>
### CFFI-FUNCTION: `TCL-GET-COMMAND-INFO-FROM-TOKEN`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetCommandInfoFromToken`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::TOKEN RAW-CFFI-TCL9:TCL-COMMAND)
 (RAW-CFFI-TCL9::CMD-INFO-PTR RAW-CFFI-TCL9:TCL-CMD-INFO-PTR))`
- SETF? `NIL`

/* 484 */ EXTERN int
Tcl_GetCommandInfoFromToken(Tcl_Command token, Tcl_CmdInfo *infoPtr);

<a name="api-cffi-function-tcl-get-command-info_4DD1A29D0F2AF06A2F547167F4E3E921"></a>
### CFFI-FUNCTION: `TCL-GET-COMMAND-INFO`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetCommandInfo`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CMD-NAME :STRING)
 (RAW-CFFI-TCL9::INFO-PTR RAW-CFFI-TCL9:TCL-CMD-INFO-PTR))`
- SETF? `NIL`

/* 159 */ EXTERN int
Tcl_GetCommandInfo(
  Tcl_Interp *interp, const char *cmdName, Tcl_CmdInfo *infoPtr);

<a name="api-cffi-function-tcl-get-command-name_45C2AB7F26521BA8EA04ACFBEE725FFF"></a>
### CFFI-FUNCTION: `TCL-GET-COMMAND-NAME`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetCommandName`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::COMMAND RAW-CFFI-TCL9:TCL-COMMAND))`
- SETF? `NIL`

/* 160 */ EXTERN const char *
Tcl_GetCommandName(Tcl_Interp *interp, Tcl_Command command);

<a name="api-cffi-function-tcl-get-current-namespace_375E77D30C05C2556308C7CA17F77802"></a>
### CFFI-FUNCTION: `TCL-GET-CURRENT-NAMESPACE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetCurrentNamespace`
- CFFI RETURN-TYPE: `TCL-NAMESPACE-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`

/* 512 */ EXTERN Tcl_Namespace * Tcl_GetCurrentNamespace(Tcl_Interp *interp);

<a name="api-cffi-function-tcl-get-current-thread_68EC9636A5059A57956EEF597E0991CC"></a>
### CFFI-FUNCTION: `TCL-GET-CURRENT-THREAD`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetCurrentThread`
- CFFI RETURN-TYPE: `TCL-THREAD-ID`
- LAMBDA LIST: `NIL`
- SETF? `NIL`

/* 300 */ EXTERN Tcl_ThreadId Tcl_GetCurrentThread(void);

<a name="api-cffi-function-tcl-get-cwd_BA68928912A30C413C8EC942C98DEC1A"></a>
### CFFI-FUNCTION: `TCL-GET-CWD`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetCwd`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CWD-PTR RAW-CFFI-TCL9:TCL-D-STRING-PTR))`
- SETF? `NIL`

/* 365 */ EXTERN char * Tcl_GetCwd(Tcl_Interp *interp, Tcl_DString *cwdPtr);

<a name="api-cffi-function-tcl-get-device-type-from-stat_DCC1A58178D3A3FA6AF1302F8FA7771D"></a>
### CFFI-FUNCTION: `TCL-GET-DEVICE-TYPE-FROM-STAT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetDeviceTypeFromStat`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::STAT-PTR RAW-CFFI-TCL9:TCL-STAT-BUF-PTR))`
- SETF? `NIL`

/* 595 */ EXTERN int Tcl_GetDeviceTypeFromStat(const Tcl_StatBuf *statPtr);

<a name="api-cffi-function-tcl-get-double-from-obj_75B1DDC2B6F2F330C9962FF9612153FA"></a>
### CFFI-FUNCTION: `TCL-GET-DOUBLE-FROM-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetDoubleFromObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::DOUBLE-PTR (:POINTER :DOUBLE)))`
- SETF? `NIL`

/* 35 */ EXTERN int
Tcl_GetDoubleFromObj(
  Tcl_Interp *interp, Tcl_Obj *objPtr, double *doublePtr);

<a name="api-cffi-function-tcl-get-double_DB194FDB108FF9C9B2A858BDCE60ABFA"></a>
### CFFI-FUNCTION: `TCL-GET-DOUBLE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetDouble`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::SRC :STRING) (RAW-CFFI-TCL9::DOUBLE-PTR (:POINTER :DOUBLE)))`
- SETF? `NIL`

/* 34 */ EXTERN int
Tcl_GetDouble(Tcl_Interp *interp, const char *src, double *doublePtr);

<a name="api-cffi-function-tcl-get-encoding-from-obj_CFC34CF4A6A6426C93A1C5824547B0DB"></a>
### CFFI-FUNCTION: `TCL-GET-ENCODING-FROM-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetEncodingFromObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::ENCODING-PTR RAW-CFFI-TCL9:TCL-ENCODING-PTR))`
- SETF? `NIL`

/* 569 */ EXTERN int
Tcl_GetEncodingFromObj(
  Tcl_Interp *interp, Tcl_Obj *objPtr, Tcl_Encoding *encodingPtr);

<a name="api-cffi-function-tcl-get-encoding-name-from-environment_1D5536829E6701B6F18FFE03E3C1C160"></a>
### CFFI-FUNCTION: `TCL-GET-ENCODING-NAME-FROM-ENVIRONMENT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetEncodingNameFromEnvironment`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::BUF-PTR RAW-CFFI-TCL9:TCL-D-STRING-PTR))`
- SETF? `NIL`

/* 572 */ EXTERN const char *
Tcl_GetEncodingNameFromEnvironment(Tcl_DString *bufPtr);

<a name="api-cffi-function-tcl-get-encoding-name_6C1BABFA84AFF6B438D1DC2027370061"></a>
### CFFI-FUNCTION: `TCL-GET-ENCODING-NAME`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetEncodingName`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ENCODING RAW-CFFI-TCL9:TCL-ENCODING))`
- SETF? `NIL`

/* 302 */ EXTERN const char * Tcl_GetEncodingName(Tcl_Encoding encoding);

<a name="api-cffi-function-tcl-get-encoding-names_704B7FFA7439C3E53B647AAF26B96779"></a>
### CFFI-FUNCTION: `TCL-GET-ENCODING-NAMES`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetEncodingNames`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`

/* 303 */ EXTERN void Tcl_GetEncodingNames(Tcl_Interp *interp);

<a name="api-cffi-function-tcl-get-encoding-nul-length_B3E4C8D9BD678267DD77AA0D89A0E0E6"></a>
### CFFI-FUNCTION: `TCL-GET-ENCODING-NUL-LENGTH`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetEncodingNulLength`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ENCODING RAW-CFFI-TCL9:TCL-ENCODING))`
- SETF? `NIL`

/* 683 */ EXTERN Tcl_Size Tcl_GetEncodingNulLength(Tcl_Encoding encoding);

<a name="api-cffi-function-tcl-get-encoding-search-path_5A9FED4C0C4A94EF3B8572CD77211CF0"></a>
### CFFI-FUNCTION: `TCL-GET-ENCODING-SEARCH-PATH`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetEncodingSearchPath`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `NIL`
- SETF? `NIL`

/* 570 */ EXTERN Tcl_Obj * Tcl_GetEncodingSearchPath(void);

<a name="api-cffi-function-tcl-get-encoding_C139D110031FA2B786925C51ACDED835"></a>
### CFFI-FUNCTION: `TCL-GET-ENCODING`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetEncoding`
- CFFI RETURN-TYPE: `TCL-ENCODING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::NAME :STRING))`
- SETF? `NIL`

/* 301 */ EXTERN Tcl_Encoding
Tcl_GetEncoding(Tcl_Interp *interp, const char *name);

<a name="api-cffi-function-tcl-get-ensemble-flags_DB8DDD9758B642C64BDE11C17BF17ABA"></a>
### CFFI-FUNCTION: `TCL-GET-ENSEMBLE-FLAGS`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetEnsembleFlags`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::TOKEN RAW-CFFI-TCL9:TCL-COMMAND)
 (RAW-CFFI-TCL9::FLAGS-PTR (:POINTER :INT)))`
- SETF? `NIL`

/* 550 */ EXTERN int
Tcl_GetEnsembleFlags(Tcl_Interp *interp, Tcl_Command token, int *flagsPtr);

<a name="api-cffi-function-tcl-get-ensemble-mapping-dict_968748298C59B6A508282624D2AA5F42"></a>
### CFFI-FUNCTION: `TCL-GET-ENSEMBLE-MAPPING-DICT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetEnsembleMappingDict`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::TOKEN RAW-CFFI-TCL9:TCL-COMMAND)
 (RAW-CFFI-TCL9::MAP-DICT-PTR (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR)))`
- SETF? `NIL`

/* 548 */ EXTERN int
Tcl_GetEnsembleMappingDict(
  Tcl_Interp *interp, Tcl_Command token, Tcl_Obj **mapDictPtr);

<a name="api-cffi-function-tcl-get-ensemble-namespace_B5CDED58454A9504F56AE14DFCD5E87B"></a>
### CFFI-FUNCTION: `TCL-GET-ENSEMBLE-NAMESPACE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetEnsembleNamespace`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::TOKEN RAW-CFFI-TCL9:TCL-COMMAND)
 (RAW-CFFI-TCL9::NAMESPACE-PTR (:POINTER RAW-CFFI-TCL9:TCL-NAMESPACE-PTR)))`
- SETF? `NIL`

/* 551 */ EXTERN int
Tcl_GetEnsembleNamespace(
  Tcl_Interp *interp, Tcl_Command token, Tcl_Namespace **namespacePtrPtr);

<a name="api-cffi-function-tcl-get-ensemble-parameter-list_AD3A01C2C740B6EB89CE10BF66621D2A"></a>
### CFFI-FUNCTION: `TCL-GET-ENSEMBLE-PARAMETER-LIST`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetEnsembleParameterList`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::TOKEN RAW-CFFI-TCL9:TCL-COMMAND)
 (RAW-CFFI-TCL9::PARAM-LIST (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR)))`
- SETF? `NIL`

/* 603 */ EXTERN int
Tcl_GetEnsembleParameterList(
  Tcl_Interp *interp, Tcl_Command token, Tcl_Obj **paramListPtr);

<a name="api-cffi-function-tcl-get-ensemble-subcommand-list_A3DC3E0DACC13D62F1C5393F3D3F241F"></a>
### CFFI-FUNCTION: `TCL-GET-ENSEMBLE-SUBCOMMAND-LIST`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetEnsembleSubcommandList`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::TOKEN RAW-CFFI-TCL9:TCL-COMMAND)
 (RAW-CFFI-TCL9::SUBCMD-LIST-PTR (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR)))`
- SETF? `NIL`

/* 547 */ EXTERN int
Tcl_GetEnsembleSubcommandList(
  Tcl_Interp *interp, Tcl_Command token, Tcl_Obj **subcmdListPtr);

<a name="api-cffi-function-tcl-get-ensemble-unknown-handler_234A5E5F11F1CEFEA3438B0593CD3371"></a>
### CFFI-FUNCTION: `TCL-GET-ENSEMBLE-UNKNOWN-HANDLER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetEnsembleUnknownHandler`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::TOKEN RAW-CFFI-TCL9:TCL-COMMAND)
 (RAW-CFFI-TCL9::UNKNOWN-LIST-PTR (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR)))`
- SETF? `NIL`

/* 549 */ EXTERN int
Tcl_GetEnsembleUnknownHandler(
  Tcl_Interp *interp, Tcl_Command token, Tcl_Obj **unknownListPtr);

<a name="api-cffi-function-tcl-get-errno_0DD00A60AF57DDE9642511FAC2277E12"></a>
### CFFI-FUNCTION: `TCL-GET-ERRNO`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetErrno`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `NIL`
- SETF? `NIL`

/* 161 */ EXTERN int Tcl_GetErrno(void);

<a name="api-cffi-function-tcl-get-error-line_B80F09C6187B417F3782723B68A7F8EE"></a>
### CFFI-FUNCTION: `TCL-GET-ERROR-LINE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetErrorLine`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`

/* 605 */ EXTERN int Tcl_GetErrorLine(Tcl_Interp *interp);

<a name="api-cffi-function-tcl-get-fs-device-from-stat_1F340725D2A392AAFBE51432FE3A2D08"></a>
### CFFI-FUNCTION: `TCL-GET-FS-DEVICE-FROM-STAT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetFSDeviceFromStat`
- CFFI RETURN-TYPE: `UINT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::STAT-PTR RAW-CFFI-TCL9:TCL-STAT-BUF-PTR))`
- SETF? `NIL`

/* 589 */ EXTERN unsigned
  Tcl_GetFSDeviceFromStat(const Tcl_StatBuf *statPtr);

<a name="api-cffi-function-tcl-get-fs-inode-from-stat_AF70457DC953F7D6F723BBAAEBF6AA14"></a>
### CFFI-FUNCTION: `TCL-GET-FS-INODE-FROM-STAT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetFSInodeFromStat`
- CFFI RETURN-TYPE: `UINT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::STAT-PTR RAW-CFFI-TCL9:TCL-STAT-BUF-PTR))`
- SETF? `NIL`

/* 590 */ EXTERN unsigned Tcl_GetFSInodeFromStat(const Tcl_StatBuf *statPtr);

<a name="api-cffi-function-tcl-get-global-namespace_64CFDF794C2EAE15A8BEC9DCABCBAA2E"></a>
### CFFI-FUNCTION: `TCL-GET-GLOBAL-NAMESPACE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetGlobalNamespace`
- CFFI RETURN-TYPE: `TCL-NAMESPACE-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`

/* 513 */ EXTERN Tcl_Namespace * Tcl_GetGlobalNamespace(Tcl_Interp *interp);

<a name="api-cffi-function-tcl-get-group-id-from-stat_5FB423203A86FB3F95E9EA1BD6248B4A"></a>
### CFFI-FUNCTION: `TCL-GET-GROUP-ID-FROM-STAT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetGroupIdFromStat`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::STAT-PTR RAW-CFFI-TCL9:TCL-STAT-BUF-PTR))`
- SETF? `NIL`

/* 594 */ EXTERN int Tcl_GetGroupIdFromStat(const Tcl_StatBuf *statPtr);

<a name="api-cffi-function-tcl-get-host-name_546C719C2B932D5982B1DCA0752588D5"></a>
### CFFI-FUNCTION: `TCL-GET-HOST-NAME`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetHostName`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `NIL`
- SETF? `NIL`

/* 162 */ EXTERN const char * Tcl_GetHostName(void);

<a name="api-cffi-function-tcl-get-index-from-obj-struct_AB3BAB69CB6B175E74397C53B1A7CB68"></a>
### CFFI-FUNCTION: `TCL-GET-INDEX-FROM-OBJ-STRUCT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetIndexFromObjStruct`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::TABLE-PTR :POINTER)
 (RAW-CFFI-TCL9::OFFSET RAW-CFFI-TCL9:TCL-SIZE) (RAW-CFFI-TCL9::MSG :STRING)
 (RAW-CFFI-TCL9::FLAGS :INT) (RAW-CFFI-TCL9::INDEX-PTR :POINTER))`
- SETF? `NIL`

/* 304 */ EXTERN int
Tcl_GetIndexFromObjStruct(
  Tcl_Interp *interp, Tcl_Obj *objPtr, const void *tablePtr,
  Tcl_Size offset, const char *msg, int flags, void *indexPtr);

<a name="api-cffi-function-tcl-get-int-for-index_A7F40791F36316CC862F06D3454529E2"></a>
### CFFI-FUNCTION: `TCL-GET-INT-FOR-INDEX`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetIntForIndex`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::END-VALUE RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::INDEX-PTR RAW-CFFI-TCL9:TCL-SIZE-PTR))`
- SETF? `NIL`

/* 645 */ EXTERN int
Tcl_GetIntForIndex(
  Tcl_Interp *interp, Tcl_Obj *objPtr, Tcl_Size endValue, Tcl_Size *indexPtr);

<a name="api-cffi-function-tcl-get-int-from-obj_2CBB3A3B9AC875B5B6FDBF0AF9BA1B27"></a>
### CFFI-FUNCTION: `TCL-GET-INT-FROM-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetIntFromObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::INT-PTR (:POINTER :INT)))`
- SETF? `NIL`

/* 38 */ EXTERN int
Tcl_GetIntFromObj(Tcl_Interp *interp, Tcl_Obj *objPtr, int *intPtr);

<a name="api-cffi-function-tcl-get-int_6848C77177A3CD3AFEBAC9557D9DD94C"></a>
### CFFI-FUNCTION: `TCL-GET-INT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetInt`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::SRC :STRING) (RAW-CFFI-TCL9::INT-PTR (:POINTER :INT)))`
- SETF? `NIL`

/* 37 */ EXTERN int
Tcl_GetInt(
  Tcl_Interp *interp, const char *src, int *intPtr);

<a name="api-cffi-function-tcl-get-interp-path_E77408A1318BE0BA7135D7902EF72C15"></a>
### CFFI-FUNCTION: `TCL-GET-INTERP-PATH`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetInterpPath`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CHILD-INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`

/* 163 */ EXTERN int
Tcl_GetInterpPath(Tcl_Interp *interp, Tcl_Interp *childInterp);

<a name="api-cffi-function-tcl-get-link-count-from-stat_575AECBC76786FAE89067715839E2795"></a>
### CFFI-FUNCTION: `TCL-GET-LINK-COUNT-FROM-STAT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetLinkCountFromStat`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::STAT-PTR RAW-CFFI-TCL9:TCL-STAT-BUF-PTR))`
- SETF? `NIL`

/* 592 */ EXTERN int Tcl_GetLinkCountFromStat(const Tcl_StatBuf *statPtr);

<a name="api-cffi-function-tcl-get-long-from-obj_28CC1E92A3BFEAE7A92E1B97705D64F8"></a>
### CFFI-FUNCTION: `TCL-GET-LONG-FROM-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetLongFromObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::LONG-PTR (:POINTER :LONG)))`
- SETF? `NIL`

/* 39 */ EXTERN int
Tcl_GetLongFromObj(
Tcl_Interp *interp, Tcl_Obj *objPtr, long *longPtr);

<a name="api-cffi-function-tcl-get-memory-info_4F4B7C984AB2231E2AEFDD66B6C6270F"></a>
### CFFI-FUNCTION: `TCL-GET-MEMORY-INFO`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetMemoryInfo`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::DS-PTR RAW-CFFI-TCL9:TCL-D-STRING-PTR))`
- SETF? `NIL`


<a name="api-cffi-function-tcl-get-mode-from-stat_757EC80F27A708436E7232DF5659159E"></a>
### CFFI-FUNCTION: `TCL-GET-MODE-FROM-STAT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetModeFromStat`
- CFFI RETURN-TYPE: `UINT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::STAT-PTR RAW-CFFI-TCL9:TCL-STAT-BUF-PTR))`
- SETF? `NIL`

/* 591 */ EXTERN unsigned Tcl_GetModeFromStat(const Tcl_StatBuf *statPtr);

<a name="api-cffi-function-tcl-get-modification-time-from-stat_B60711FBD21AB76C1593D9FE6A902295"></a>
### CFFI-FUNCTION: `TCL-GET-MODIFICATION-TIME-FROM-STAT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetModificationTimeFromStat`
- CFFI RETURN-TYPE: `LONG-LONG`
- LAMBDA LIST: `((RAW-CFFI-TCL9::STAT-PTR RAW-CFFI-TCL9:TCL-STAT-BUF-PTR))`
- SETF? `NIL`

/* 597 */ EXTERN long long
Tcl_GetModificationTimeFromStat(const Tcl_StatBuf *statPtr);

<a name="api-cffi-function-tcl-get-name-of-executalble_00050363976CF1C1F3DE9FDB7A2AB391"></a>
### CFFI-FUNCTION: `TCL-GET-NAME-OF-EXECUTALBLE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetNameOfExecutable`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `NIL`
- SETF? `NIL`

/* 165 */ EXTERN const char * Tcl_GetNameOfExecutable(void);

<a name="api-cffi-function-tcl-get-namespace-unknown-handler_245803192FA076E62F41B55E3A882148"></a>
### CFFI-FUNCTION: `TCL-GET-NAMESPACE-UNKNOWN-HANDLER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetNamespaceUnknownHandler`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::NS-PTR RAW-CFFI-TCL9:TCL-NAMESPACE-PTR))`
- SETF? `NIL`

/* 567 */ EXTERN Tcl_Obj *
Tcl_GetNamespaceUnknownHandler(Tcl_Interp *interp, Tcl_Namespace *nsPtr);

<a name="api-cffi-function-tcl-get-number-from-obj_AB2460F7B7858AC8B40388CBA730D07E"></a>
### CFFI-FUNCTION: `TCL-GET-NUMBER-FROM-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetNumberFromObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::CLIENT-DATA-PTR (:POINTER :POINTER))
 (RAW-CFFI-TCL9::TYPE-PTR (:POINTER :INT)))`
- SETF? `NIL`

/* 680 */ EXTERN int
Tcl_GetNumberFromObj(
  Tcl_Interp *interp, Tcl_Obj *objPtr, void **clientDataPtr, int *typePtr);

<a name="api-cffi-function-tcl-get-number_3C91D532A0A9A89F8576D09AC17C1F38"></a>
### CFFI-FUNCTION: `TCL-GET-NUMBER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetNumber`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::BYTES (:POINTER :CHAR))
 (RAW-CFFI-TCL9::NUM-BYTES RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::CLIENT-DATA-PTR (:POINTER :POINTER))
 (RAW-CFFI-TCL9::TYPE-PTR (:POINTER :INT)))`
- SETF? `NIL`

/* 681 */ EXTERN int
Tcl_GetNumber(
  Tcl_Interp *interp, const char *bytes,
  Tcl_Size numBytes, void **clientDataPtr, int *typePtr);

<a name="api-cffi-function-tcl-get-obj-result_E186A2EB4E97DB89FA547981E004455F"></a>
### CFFI-FUNCTION: `TCL-GET-OBJ-RESULT*`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_GetObjResult`
- CFFI RETURN-TYPE: `POINTER`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR :POINTER))`
- SETF? `NIL`


<a name="api-cffi-function-tcl-get-obj-result_939657BCAD9EDAFB462EDF3E84EA8B1D"></a>
### CFFI-FUNCTION: `TCL-GET-OBJ-RESULT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetObjResult`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`

/* 166 */ EXTERN Tcl_Obj * Tcl_GetObjResult(Tcl_Interp *interp);

<a name="api-cffi-function-tcl-get-obj-type_42DB90673AFAC49D525731FDC99D3D6C"></a>
### CFFI-FUNCTION: `TCL-GET-OBJ-TYPE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetObjType`
- CFFI RETURN-TYPE: `TCL-OBJ-TYPE-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9:TYPE-NAME :STRING))`
- SETF? `NIL`

/* 40 */ EXTERN const Tcl_ObjType *
Tcl_GetObjType(const char *typeName);

<a name="api-cffi-function-tcl-get-open-file_E3110A6A0F5F538DA9339ED39038FB78"></a>
### CFFI-FUNCTION: `TCL-GET-OPEN-FILE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetOpenFile`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CHAN-ID :STRING) (RAW-CFFI-TCL9::FOR-WRITING :INT)
 (RAW-CFFI-TCL9::CHECK-USAGE :INT)
 (RAW-CFFI-TCL9::CLIENT-DATA (:POINTER RAW-CFFI-TCL9::CLIENT-DATA)))`
- SETF? `NIL`

/* 167 */ EXTERN int
Tcl_GetOpenFile(
  Tcl_Interp *interp, const char *chanID,
  int forWriting, int checkUsage, void **filePtr);

<a name="api-cffi-function-tcl-get-parent_869F901B6B56C37A5FC334DEF6BC8C05"></a>
### CFFI-FUNCTION: `TCL-GET-PARENT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetParent`
- CFFI RETURN-TYPE: `TCL-INTERP-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`

/* 164 */ EXTERN Tcl_Interp * Tcl_GetParent(Tcl_Interp *interp);

<a name="api-cffi-function-tcl-get-path-type_7F0E6CAEB5955346803CE9DA5BFCFD32"></a>
### CFFI-FUNCTION: `TCL-GET-PATH-TYPE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetPathType`
- CFFI RETURN-TYPE: `TCL-PATH-TYPE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PATH :STRING))`
- SETF? `NIL`

/* 168 */ EXTERN Tcl_PathType Tcl_GetPathType(const char *path);

<a name="api-cffi-function-tcl-get-range_211B6D2D7C968FF1EB932451B419E4E4"></a>
### CFFI-FUNCTION: `TCL-GET-RANGE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetRange`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (FIRST RAW-CFFI-TCL9:TCL-SIZE) (LAST RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 672 */ EXTERN Tcl_Obj *
Tcl_GetRange(Tcl_Obj *objPtr, Tcl_Size first, Tcl_Size last);

<a name="api-cffi-function-tcl-get-reg-exp-from-obj_653E5B291FA072AB27C5813171066E59"></a>
### CFFI-FUNCTION: `TCL-GET-REG-EXP-FROM-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetRegExpFromObj`
- CFFI RETURN-TYPE: `TCL-REG-EXP`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::PAT-OBJ RAW-CFFI-TCL9:TCL-OBJ-PTR) (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 356 */ EXTERN Tcl_RegExp
Tcl_GetRegExpFromObj(Tcl_Interp *interp, Tcl_Obj *patObj, int flags);

<a name="api-cffi-function-tcl-get-return-options_CC83AF6F6113FFD9DE5E6BA1992C59D7"></a>
### CFFI-FUNCTION: `TCL-GET-RETURN-OPTIONS`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetReturnOptions`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::RESULT :INT))`
- SETF? `NIL`

/* 539 */ EXTERN Tcl_Obj *
Tcl_GetReturnOptions(Tcl_Interp *interp, int result);

<a name="api-cffi-function-tcl-get-service-mode_02B608CC4B5B54266A5A59093BB22662"></a>
### CFFI-FUNCTION: `TCL-GET-SERVICE-MODE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetServiceMode`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `NIL`
- SETF? `NIL`

/* 171 */ EXTERN int Tcl_GetServiceMode(void);

<a name="api-cffi-function-tcl-get-size-from-stat_9CFE0EC7737F831B83B3BCB228FF4225"></a>
### CFFI-FUNCTION: `TCL-GET-SIZE-FROM-STAT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetSizeFromStat`
- CFFI RETURN-TYPE: `UNSIGNED-LONG-LONG`
- LAMBDA LIST: `((RAW-CFFI-TCL9::STAT-PTR RAW-CFFI-TCL9:TCL-STAT-BUF-PTR))`
- SETF? `NIL`

/* 599 */ EXTERN unsigned long long Tcl_GetSizeFromStat(const Tcl_StatBuf *statPtr);

<a name="api-cffi-function-tcl-get-size-int-from-obj_C8049C3B9DDE3DF741293CB7807EDC18"></a>
### CFFI-FUNCTION: `TCL-GET-SIZE-INT-FROM-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetSizeIntFromObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::SIZE-PTR RAW-CFFI-TCL9:TCL-SIZE-PTR))`
- SETF? `NIL`

/* 653 */ EXTERN int
Tcl_GetSizeIntFromObj(Tcl_Interp *interp, Tcl_Obj *objPtr, Tcl_Size *sizePtr);

<a name="api-cffi-function-tcl-get-stacked-channel_6C5B31264E7CB7B2C1347245D77F6D2A"></a>
### CFFI-FUNCTION: `TCL-GET-STACKED-CHANNEL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetStackedChannel`
- CFFI RETURN-TYPE: `TCL-CHANNEL`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL))`
- SETF? `NIL`

/* 283 */ EXTERN Tcl_Channel Tcl_GetStackedChannel(Tcl_Channel chan);

<a name="api-cffi-function-tcl-get-startup-script_6EAEACE3724BDA12F9BE4AED42AA6FDA"></a>
### CFFI-FUNCTION: `TCL-GET-STARTUP-SCRIPT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetStartupScript`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ENCODING-PTR (:POINTER (:POINTER :CHAR))))`
- SETF? `NIL`

/* 623 */ EXTERN Tcl_Obj * Tcl_GetStartupScript(const char **encodingPtr);

<a name="api-cffi-function-tcl-get-std-channel_C58DF4ABE29C5C509B341146FF847D01"></a>
### CFFI-FUNCTION: `TCL-GET-STD-CHANNEL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetStdChannel`
- CFFI RETURN-TYPE: `TCL-CHANNEL`
- LAMBDA LIST: `((TYPE :INT))`
- SETF? `NIL`

/* 173 */ EXTERN Tcl_Channel Tcl_GetStdChannel(int type);

<a name="api-cffi-function-tcl-get-string_52C31253C446EFE2E9895875732A9311"></a>
### CFFI-FUNCTION: `TCL-GET-STRING*`

- SCOPE: INTERNAL
- CFFI NAME: `Tcl_GetString`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR :POINTER))`
- SETF? `NIL`


<a name="api-cffi-function-tcl-get-string-from-objchar_3281F865F0494001A3C940F9B6E78D52"></a>
### CFFI-FUNCTION: `TCL-GET-STRING-FROM-OBJ/CHAR*`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetStringFromObj`
- CFFI RETURN-TYPE: `(POINTER CHAR)`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::LENGTH-PTR RAW-CFFI-TCL9:TCL-SIZE-PTR))`
- SETF? `NIL`

/* 651 */ EXTERN char *
Tcl_GetStringFromObj(Tcl_Obj *objPtr, Tcl_Size *lengthPtr);

<a name="api-cffi-function-tcl-get-string-from-obj_20D009FB21D6106FCC23847B876207A4"></a>
### CFFI-FUNCTION: `TCL-GET-STRING-FROM-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetStringFromObj`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::LENGTH-PTR RAW-CFFI-TCL9:TCL-SIZE-PTR))`
- SETF? `NIL`

/* 651 */ EXTERN char *
Tcl_GetStringFromObj(Tcl_Obj *objPtr, Tcl_Size *lengthPtr);

<a name="api-cffi-function-tcl-get-string_45FF8E1D79B7646065D51EE26AA8E382"></a>
### CFFI-FUNCTION: `TCL-GET-STRING`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetString`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 340 */ EXTERN char * Tcl_GetString(Tcl_Obj *objPtr);

<a name="api-cffi-function-tcl-get-thread-data_B4FD386483FB5A4C095AD885ADCB092F"></a>
### CFFI-FUNCTION: `TCL-GET-THREAD-DATA`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetThreadData`
- CFFI RETURN-TYPE: `POINTER`
- LAMBDA LIST: `((RAW-CFFI-TCL9::THREAD-DATA-KEY-PTR RAW-CFFI-TCL9:TCL-THREAD-DATA-KEY-PTR)
 (RAW-CFFI-TCL9::SIZE RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 305 */ EXTERN void * Tcl_GetThreadData(Tcl_ThreadDataKey *keyPtr, Tcl_Size size);

<a name="api-cffi-function-tcl-get-time_F8F37879BE5C0CFCFE00FC5485814504"></a>
### CFFI-FUNCTION: `TCL-GET-TIME`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetTime`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::TIME-BUF RAW-CFFI-TCL9:TCL-TIME-PTR))`
- SETF? `NIL`

/* 482 */ EXTERN void Tcl_GetTime(Tcl_Time *timeBuf);

<a name="api-cffi-function-tcl-get-top-channel_06428ACD40DB885D4480FA55B43E7A18"></a>
### CFFI-FUNCTION: `TCL-GET-TOP-CHANNEL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetTopChannel`
- CFFI RETURN-TYPE: `TCL-CHANNEL`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL))`
- SETF? `NIL`

/* 396 */ EXTERN Tcl_Channel Tcl_GetTopChannel(Tcl_Channel chan);

<a name="api-cffi-function-tcl-get-uni-char_C5EC582EFAC1F9283BD289E84D4C4A12"></a>
### CFFI-FUNCTION: `TCL-GET-UNI-CHAR`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetUniChar`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::INDEX RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 673 */ EXTERN int Tcl_GetUniChar(Tcl_Obj *objPtr, Tcl_Size index);

<a name="api-cffi-function-tcl-get-unicode-from-obj_A2E170838F6140F08681C7F1AB8CE26E"></a>
### CFFI-FUNCTION: `TCL-GET-UNICODE-FROM-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetUnicodeFromObj`
- CFFI RETURN-TYPE: `TCL-UNI-CHAR-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::LENGTH-PTR RAW-CFFI-TCL9:TCL-SIZE-PTR))`
- SETF? `NIL`

/* 652 */ EXTERN Tcl_UniChar *
Tcl_GetUnicodeFromObj(Tcl_Obj *objPtr, Tcl_Size *lengthPtr);

<a name="api-cffi-function-tcl-get-user-id-from-stat_88EA6ADB091CEA0F3793ED1C4E6287EF"></a>
### CFFI-FUNCTION: `TCL-GET-USER-ID-FROM-STAT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetUserIdFromStat`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::STAT-PTR RAW-CFFI-TCL9:TCL-STAT-BUF-PTR))`
- SETF? `NIL`

/* 593 */ EXTERN int Tcl_GetUserIdFromStat(const Tcl_StatBuf *statPtr);

<a name="api-cffi-function-tcl-get-var2_EB03F90F33F9F3EAE4400615394CC8F0"></a>
### CFFI-FUNCTION: `TCL-GET-VAR2*`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetVar2`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR :POINTER) (RAW-CFFI-TCL9::PART1 :STRING)
 (RAW-CFFI-TCL9::PART2 :STRING) (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

`flags'은 `TCL_GLOBAL_ONLY'(=1) 등이 가능.

<a name="api-cffi-function-tcl-get-var2-ex_A057343EAB534D88A853CDA3D62E1B65"></a>
### CFFI-FUNCTION: `TCL-GET-VAR2-EX`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetVar2Ex`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::PART-1 :STRING) (RAW-CFFI-TCL9::PART-2 :STRING)
 (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 306 */ EXTERN Tcl_Obj *
  Tcl_GetVar2Ex(Tcl_Interp *interp, const char *part1, const char *part2, int flags);

<a name="api-cffi-function-tcl-get-var2_68BA123F47B09B2E8671B43CAB273274"></a>
### CFFI-FUNCTION: `TCL-GET-VAR2`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetVar2`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::PART1 :STRING) (RAW-CFFI-TCL9::PART2 :STRING)
 (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 176 */ EXTERN const char *
Tcl_GetVar2(Tcl_Interp *interp, const char *part1, const char *part2, int flags);

<a name="api-cffi-function-tcl-get-version_7FF5C5F73C60B5339BE6051E2BC0D1AF"></a>
### CFFI-FUNCTION: `TCL-GET-VERSION`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetVersion`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::MAJOR (:POINTER :INT)) (RAW-CFFI-TCL9::MINOR (:POINTER :INT))
 (RAW-CFFI-TCL9::PATCH-LEVEL (:POINTER :INT)) (TYPE (:POINTER :INT)))`
- SETF? `NIL`

/* 279 */ EXTERN void
Tcl_GetVersion(int *major, int *minor, int *patchLevel, int *type);

<a name="api-cffi-function-tcl-get-wide-int-from-obj_D76F63D4CE7C652B92CDC8B9D010B403"></a>
### CFFI-FUNCTION: `TCL-GET-WIDE-INT-FROM-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetWideIntFromObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::WIDE-PTR (:POINTER RAW-CFFI-TCL9:TCL-WIDE-INT)))`
- SETF? `NIL`

/* 487 */ EXTERN int
Tcl_GetWideIntFromObj(Tcl_Interp *interp, Tcl_Obj *objPtr, Tcl_WideInt *widePtr);

<a name="api-cffi-function-tcl-get-wide-u-int-from-obj_A4503E218E27CE9236D1D20677CF8490"></a>
### CFFI-FUNCTION: `TCL-GET-WIDE-U-INT-FROM-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetWideUIntFromObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::UWIDE-PTR (:POINTER RAW-CFFI-TCL9:TCL-WIDE-UINT)))`
- SETF? `NIL`

/* 684 */ EXTERN int
Tcl_GetWideUIntFromObj(
  Tcl_Interp *interp, Tcl_Obj *objPtr, Tcl_WideUInt *uwidePtr);

<a name="api-cffi-function-tcl-gets-obj_517BF2AEA0F62FFD2FB0A8F795030886"></a>
### CFFI-FUNCTION: `TCL-GETS-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_GetsObj`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 170 */ EXTERN Tcl_Size Tcl_GetsObj(Tcl_Channel chan, Tcl_Obj *objPtr);

<a name="api-cffi-function-tcl-gets_9B104BC99DD3BA7E3EB31C5F3B272057"></a>
### CFFI-FUNCTION: `TCL-GETS`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Gets`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL)
 (RAW-CFFI-TCL9::DS-PTR RAW-CFFI-TCL9:TCL-D-STRING-PTR))`
- SETF? `NIL`

/* 169 */ EXTERN Tcl_Size Tcl_Gets(Tcl_Channel chan, Tcl_DString *dsPtr);

<a name="api-cffi-function-tcl-has-string-rep_D190C6DBC0CBB4C571926496BB4B22E6"></a>
### CFFI-FUNCTION: `TCL-HAS-STRING-REP`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_HasStringRep`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 640 */ EXTERN int Tcl_HasStringRep(Tcl_Obj *objPtr);

<a name="api-cffi-function-tcl-hash-stats_852A9EB619201CAB09EDD5B664E88831"></a>
### CFFI-FUNCTION: `TCL-HASH-STATS`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_HashStats`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::TABLE-PTR RAW-CFFI-TCL9:TCL-HASH-TABLE-PTR))`
- SETF? `NIL`

/* 269 */ EXTERN char * Tcl_HashStats(Tcl_HashTable *tablePtr);

<a name="api-cffi-function-tcl-hide-command_9AEB0F525C81C239CAF9D3D8CF2E2604"></a>
### CFFI-FUNCTION: `TCL-HIDE-COMMAND`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_HideCommand`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CMD-NAME :STRING) (RAW-CFFI-TCL9::HIDDEN-CMD-TOKEN :STRING))`
- SETF? `NIL`

/* 179 */ EXTERN int
Tcl_HideCommand(
  Tcl_Interp *interp, const char *cmdName, const char *hiddenCmdToken);

<a name="api-cffi-function-tcl-import_5C88E979C880D43E82D532B2443631D3"></a>
### CFFI-FUNCTION: `TCL-IMPORT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Import`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::NS-PTR RAW-CFFI-TCL9:TCL-NAMESPACE-PTR)
 (RAW-CFFI-TCL9::PATTERN :STRING) (RAW-CFFI-TCL9::ALLOW-OVERWRITE :INT))`
- SETF? `NIL`

/* 510 */ EXTERN int
Tcl_Import(
  Tcl_Interp *interp, Tcl_Namespace *nsPtr, const char *pattern, int allowOverwrite);

<a name="api-cffi-function-tcl-incr-ref-count_282463370BFF4481C6530B83FE4B1EBA"></a>
### CFFI-FUNCTION: `TCL-INCR-REF-COUNT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_IncrRefCount`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 641 */ EXTERN void Tcl_IncrRefCount(Tcl_Obj *objPtr);

<a name="api-cffi-function-tcl-init_A7E209984D65BC77BD8F07D2241CD787"></a>
### CFFI-FUNCTION: `TCL-INIT*`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Init`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR :POINTER))`
- SETF? `NIL`

=`TCL_OK'(0)

<a name="api-cffi-function-tcl-init-bignum-from-double_FFF4DDB09D7909F536D284DE8ECB8D92"></a>
### CFFI-FUNCTION: `TCL-INIT-BIGNUM-FROM-DOUBLE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_InitBignumFromDouble`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::INITVAL :DOUBLE) (RAW-CFFI-TCL9::TO-INIT :POINTER))`
- SETF? `NIL`

/* 566 */ EXTERN int
Tcl_InitBignumFromDouble(Tcl_Interp *interp, double initval, void *toInit);

<a name="api-cffi-function-tcl-init-custom-hash-table_9BE2A17A1E139AFBEB06FE8E120D5E2E"></a>
### CFFI-FUNCTION: `TCL-INIT-CUSTOM-HASH-TABLE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_InitCustomHashTable`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::TABLE-PTR RAW-CFFI-TCL9:TCL-HASH-TABLE-PTR)
 (RAW-CFFI-TCL9::KEY-TYPE :INT)
 (RAW-CFFI-TCL9::TYPE-PTR RAW-CFFI-TCL9:TCL-HASH-KEY-TYPE-PTR))`
- SETF? `NIL`

/* 423 */ EXTERN void
Tcl_InitCustomHashTable(
  Tcl_HashTable *tablePtr,
  int keyType, const Tcl_HashKeyType *typePtr);

<a name="api-cffi-function-tcl-init-hash-table_389B76A8B778E6D17F086E36DD26F89B"></a>
### CFFI-FUNCTION: `TCL-INIT-HASH-TABLE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_InitHashTable`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::TABLE-PTR RAW-CFFI-TCL9:TCL-HASH-TABLE-PTR)
 (RAW-CFFI-TCL9::KEY-TYPE :INT))`
- SETF? `NIL`

/* 181 */ EXTERN void Tcl_InitHashTable(Tcl_HashTable *tablePtr, int keyType);

<a name="api-cffi-function-tcl-init-memory_5F42EEF1E692C7ED25BC3531046FAC5F"></a>
### CFFI-FUNCTION: `TCL-INIT-MEMORY`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_InitMemory`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`

/* 280 */ EXTERN void Tcl_InitMemory(Tcl_Interp *interp);

<a name="api-cffi-function-tcl-init-notifier_203BABBF241523201A7769CC22AD4DEF"></a>
### CFFI-FUNCTION: `TCL-INIT-NOTIFIER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_InitNotifier`
- CFFI RETURN-TYPE: `CLIENT-DATA`
- LAMBDA LIST: `NIL`
- SETF? `NIL`

/* 307 */ EXTERN void * Tcl_InitNotifier(void);

<a name="api-cffi-function-tcl-init-obj-hash-table_6DCD9D78FA2F3477E8EA296803D2AD17"></a>
### CFFI-FUNCTION: `TCL-INIT-OBJ-HASH-TABLE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_InitObjHashTable`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::TABLE-PTR RAW-CFFI-TCL9:TCL-HASH-TABLE-PTR))`
- SETF? `NIL`

/* 424 */ EXTERN void Tcl_InitObjHashTable(Tcl_HashTable *tablePtr);

<a name="api-cffi-function-tcl-init-string-rep_FA9AC19F1B22CDA147ECF39F63867EB8"></a>
### CFFI-FUNCTION: `TCL-INIT-STRING-REP`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_InitStringRep`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::BYTES (:POINTER :CHAR))
 (RAW-CFFI-TCL9::NUM-BYTES RAW-CFFI-TCL9:TCL-HASH-TYPE))`
- SETF? `NIL`

/* 637 */ EXTERN char *
Tcl_InitStringRep(Tcl_Obj *objPtr, const char *bytes, TCL_HASH_TYPE numBytes);

<a name="api-cffi-function-tcl-init-stub-table_932BFBD14433E4D67DF5B208D2E72E15"></a>
### CFFI-FUNCTION: `TCL-INIT-STUB-TABLE`

- SCOPE: EXTERNAL
- CFFI NAME: `TclInitStubTable`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9:VERSION :STRING))`
- SETF? `NIL`


<a name="api-cffi-function-tcl-init-stubs_8AFD999AC49B0312D58D7B2DD1324096"></a>
### CFFI-FUNCTION: `TCL-INIT-STUBS`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_InitStubs`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9:VERSION :STRING) (RAW-CFFI-TCL9::MAGIC :INT))`
- SETF? `NIL`


<a name="api-cffi-function-tcl-init-subsystems_F0A5B153BDDBAAA0CF4753EE8ACC203E"></a>
### CFFI-FUNCTION: `TCL-INIT-SUBSYSTEMS`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_InitSubsystems`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `NIL`
- SETF? `NIL`


<a name="api-cffi-function-tcl-init_A1B38E7B50F3A541B2CD4622BF8831E1"></a>
### CFFI-FUNCTION: `TCL-INIT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Init`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`

/* 180 */ EXTERN int Tcl_Init(Tcl_Interp *interp);

<a name="api-cffi-function-tcl-input-blocked_ABEAEF504607AFB2446A20C04D79B2B4"></a>
### CFFI-FUNCTION: `TCL-INPUT-BLOCKED`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_InputBlocked`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL))`
- SETF? `NIL`

/* 182 */ EXTERN int Tcl_InputBlocked(Tcl_Channel chan);

<a name="api-cffi-function-tcl-input-buffered_BE5700EBC7D6093899867CADCE047C11"></a>
### CFFI-FUNCTION: `TCL-INPUT-BUFFERED`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_InputBuffered`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL))`
- SETF? `NIL`

/* 183 */ EXTERN int Tcl_InputBuffered(Tcl_Channel chan);

<a name="api-cffi-function-tcl-interp-active_999343CF11BE291804D19E920D8CAC62"></a>
### CFFI-FUNCTION: `TCL-INTERP-ACTIVE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_InterpActive`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`

/* 608 */ EXTERN int Tcl_InterpActive(Tcl_Interp *interp);

<a name="api-cffi-function-tcl-interp-deleted_F354830B390941DF0B1281969D086E96"></a>
### CFFI-FUNCTION: `TCL-INTERP-DELETED`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_InterpDeleted`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`

/* 184 */ EXTERN int Tcl_InterpDeleted(Tcl_Interp *interp);

<a name="api-cffi-function-tcl-invalidate-string-rep_6B8AF9AF6E342AD78704D5DFF60338FC"></a>
### CFFI-FUNCTION: `TCL-INVALIDATE-STRING-REP`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_InvalidateStringRep`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 42 */ EXTERN void
Tcl_InvalidateStringRep(Tcl_Obj *objPtr);

<a name="api-cffi-function-tcl-is-channel-existing_444236416227FE0736F6D0ACF3DEDA40"></a>
### CFFI-FUNCTION: `TCL-IS-CHANNEL-EXISTING`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_IsChannelExisting`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN-NAME :STRING))`
- SETF? `NIL`

/* 418 */ EXTERN int Tcl_IsChannelExisting(const char *channelName);

<a name="api-cffi-function-tcl-is-channel-registered_B3A9429452254D0FDD1FC96FD854E304"></a>
### CFFI-FUNCTION: `TCL-IS-CHANNEL-REGISTERED`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_IsChannelRegistered`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL))`
- SETF? `NIL`

/* 414 */ EXTERN int
Tcl_IsChannelRegistered(Tcl_Interp *interp, Tcl_Channel channel);

<a name="api-cffi-function-tcl-is-channel-shared_C111CA67EA103B0FCAB09DADB2BC3037"></a>
### CFFI-FUNCTION: `TCL-IS-CHANNEL-SHARED`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_IsChannelShared`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL))`
- SETF? `NIL`

/* 413 */ EXTERN int Tcl_IsChannelShared(Tcl_Channel channel);

<a name="api-cffi-function-tcl-is-ensemble_2A10C2EF161EC6D5840763494B9F6C23"></a>
### CFFI-FUNCTION: `TCL-IS-ENSEMBLE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_IsEnsemble`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::TOKEN RAW-CFFI-TCL9:TCL-COMMAND))`
- SETF? `NIL`

/* 540 */ EXTERN int Tcl_IsEnsemble(Tcl_Command token);

<a name="api-cffi-function-tcl-is-safe_AD01DE56B5C6A07625B82538465FE451"></a>
### CFFI-FUNCTION: `TCL-IS-SAFE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_IsSafe`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`

/* 185 */ EXTERN int Tcl_IsSafe(Tcl_Interp *interp);

<a name="api-cffi-function-tcl-is-shared_0BD95309329C9E4C2E61F614E8B6C1DA"></a>
### CFFI-FUNCTION: `TCL-IS-SHARED`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_IsShared`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 643 */ EXTERN int Tcl_IsShared(Tcl_Obj *objPtr);

<a name="api-cffi-function-tcl-is-standard-channel_440C7BCE364CDA42C14EF12639B8A6B2"></a>
### CFFI-FUNCTION: `TCL-IS-STANDARD-CHANNEL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_IsStandardChannel`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL))`
- SETF? `NIL`

/* 439 */ EXTERN int Tcl_IsStandardChannel(Tcl_Channel channel);

<a name="api-cffi-function-tcl-join-path_86602C61EC0A4FC519AC000AA04893F3"></a>
### CFFI-FUNCTION: `TCL-JOIN-PATH`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_JoinPath`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ARGC RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::ARGV (:POINTER (:POINTER :CHAR)))
 (RAW-CFFI-TCL9::RESULT-PTR RAW-CFFI-TCL9:TCL-D-STRING-PTR))`
- SETF? `NIL`

/* 186 */ EXTERN char *
Tcl_JoinPath(
  Tcl_Size argc, const char *const *argv, Tcl_DString *resultPtr);


<a name="api-cffi-function-tcl-join-thread_A6D1861CD82E441B526F774304C5900B"></a>
### CFFI-FUNCTION: `TCL-JOIN-THREAD`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_JoinThread`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::THREAD-ID RAW-CFFI-TCL9:TCL-THREAD-ID)
 (RAW-CFFI-TCL9::RESULT (:POINTER :INT)))`
- SETF? `NIL`

/* 412 */ EXTERN int Tcl_JoinThread(Tcl_ThreadId threadId, int *result);

<a name="api-cffi-function-tcl-limit-add-handler_1BF746CD96A8B87C48BE670EF1D33DE7"></a>
### CFFI-FUNCTION: `TCL-LIMIT-ADD-HANDLER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_LimitAddHandler`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR) (TYPE :INT)
 (RAW-CFFI-TCL9:HANDLER-PROC RAW-CFFI-TCL9:TCL-LIMIT-HANDLER-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA)
 (RAW-CFFI-TCL9::DELETE-PROC RAW-CFFI-TCL9:TCL-LIMIT-HANDLER-DELETE-PROC))`
- SETF? `NIL`

/* 520 */ EXTERN void
Tcl_LimitAddHandler(
  Tcl_Interp *interp, int type,
  Tcl_LimitHandlerProc *handlerProc,
  void *clientData,
  Tcl_LimitHandlerDeleteProc *deleteProc);

<a name="api-cffi-function-tcl-limit-check_7216994BA379925B93034F2CA5CDE012"></a>
### CFFI-FUNCTION: `TCL-LIMIT-CHECK`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_LimitCheck`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`

/* 523 */ EXTERN int Tcl_LimitCheck(Tcl_Interp *interp);

<a name="api-cffi-function-tcl-limit-exceeded_4FC830F9969FF7784C51C42EE0573981"></a>
### CFFI-FUNCTION: `TCL-LIMIT-EXCEEDED`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_LimitExceeded`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`

/* 524 */ EXTERN int Tcl_LimitExceeded(Tcl_Interp *interp);

<a name="api-cffi-function-tcl-limit-get-commands_35852662B20A296310806A06DE46EC5B"></a>
### CFFI-FUNCTION: `TCL-LIMIT-GET-COMMANDS`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_LimitGetCommands`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`

/* 532 */ EXTERN int Tcl_LimitGetCommands(Tcl_Interp *interp);

<a name="api-cffi-function-tcl-limit-get-granularity_E64514FF7D88BE870F0B10CA3C9D1F2F"></a>
### CFFI-FUNCTION: `TCL-LIMIT-GET-GRANULARITY`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_LimitGetGranularity`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR) (TYPE :INT))`
- SETF? `NIL`

/* 534 */ EXTERN int Tcl_LimitGetGranularity(Tcl_Interp *interp, int type);

<a name="api-cffi-function-tcl-limit-get-time_01EA6BBC04A01E79A72D9EFF96033EAE"></a>
### CFFI-FUNCTION: `TCL-LIMIT-GET-TIME`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_LimitGetTime`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::TIME-LIMIT-PTR RAW-CFFI-TCL9:TCL-TIME-PTR))`
- SETF? `NIL`

/* 533 */ EXTERN void Tcl_LimitGetTime(Tcl_Interp *interp, Tcl_Time *timeLimitPtr);

<a name="api-cffi-function-tcl-limit-ready_8BEDA0E6137F1C4D3EAD76332B2658AF"></a>
### CFFI-FUNCTION: `TCL-LIMIT-READY`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_LimitReady`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`

/* 522 */ EXTERN int Tcl_LimitReady(Tcl_Interp *interp);

<a name="api-cffi-function-tcl-limit-remove-handler_BC879AFD195C0513E1A6C92FF4125C21"></a>
### CFFI-FUNCTION: `TCL-LIMIT-REMOVE-HANDLER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_LimitRemoveHandler`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR) (TYPE :INT)
 (RAW-CFFI-TCL9:HANDLER-PROC RAW-CFFI-TCL9:TCL-LIMIT-HANDLER-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 521 */ EXTERN void
Tcl_LimitRemoveHandler(
  Tcl_Interp *interp, int type,
  Tcl_LimitHandlerProc *handlerProc, void *clientData);

<a name="api-cffi-function-tcl-limit-set-commands_4CE4C8309E950D4DEEB289056A6E0692"></a>
### CFFI-FUNCTION: `TCL-LIMIT-SET-COMMANDS`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_LimitSetCommands`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::COMMAND-LIMIT RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 525 */ EXTERN void
Tcl_LimitSetCommands(Tcl_Interp *interp, Tcl_Size commandLimit);

<a name="api-cffi-function-tcl-limit-set-granularity_1EA1AB25C5F06C1D98E30245B3036402"></a>
### CFFI-FUNCTION: `TCL-LIMIT-SET-GRANULARITY`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_LimitSetGranularity`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR) (TYPE :INT)
 (RAW-CFFI-TCL9::GRANULARITY :INT))`
- SETF? `NIL`

/* 527 */ EXTERN void
Tcl_LimitSetGranularity(Tcl_Interp *interp, int type, int granularity);

<a name="api-cffi-function-tcl-limit-set-time_C4A7F62FEF6083E7ABD7F06C848DE582"></a>
### CFFI-FUNCTION: `TCL-LIMIT-SET-TIME`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_LimitSetTime`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::TIME-LIMIT-PTR RAW-CFFI-TCL9:TCL-TIME-PTR))`
- SETF? `NIL`

/* 526 */ EXTERN void
Tcl_LimitSetTime(Tcl_Interp *interp, Tcl_Time *timeLimitPtr);

<a name="api-cffi-function-tcl-limit-type-enabled_E9B9730276646B45017DF2C285CAA856"></a>
### CFFI-FUNCTION: `TCL-LIMIT-TYPE-ENABLED`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_LimitTypeEnabled`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR) (TYPE :INT))`
- SETF? `NIL`

/* 528 */ EXTERN int Tcl_LimitTypeEnabled(Tcl_Interp *interp, int type);

<a name="api-cffi-function-tcl-limit-type-exceeded_8B225BCB836CE3B36276994131328E41"></a>
### CFFI-FUNCTION: `TCL-LIMIT-TYPE-EXCEEDED`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_LimitTypeExceeded`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR) (TYPE :INT))`
- SETF? `NIL`

/* 529 */ EXTERN int Tcl_LimitTypeExceeded(Tcl_Interp *interp, int type);

<a name="api-cffi-function-tcl-limit-type-reset_877CF22441D53F6EAE938ED3E3F3FEEC"></a>
### CFFI-FUNCTION: `TCL-LIMIT-TYPE-RESET`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_LimitTypeReset`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR) (TYPE :INT))`
- SETF? `NIL`

/* 531 */ EXTERN void Tcl_LimitTypeReset(Tcl_Interp *interp, int type);

<a name="api-cffi-function-tcl-limit-type-set_DDF6D922E4D24C43A41449D744821A41"></a>
### CFFI-FUNCTION: `TCL-LIMIT-TYPE-SET`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_LimitTypeSet`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR) (TYPE :INT))`
- SETF? `NIL`

/* 530 */ EXTERN void Tcl_LimitTypeSet(Tcl_Interp *interp, int type);

<a name="api-cffi-function-tcl-link-array_B72952170CEB03942A505EB20ADEE0CB"></a>
### CFFI-FUNCTION: `TCL-LINK-ARRAY`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_LinkArray`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::VAR-NAME :STRING) (RAW-CFFI-TCL9::ADDR :POINTER) (TYPE :INT)
 (RAW-CFFI-TCL9::SIZE RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 644 */ EXTERN int
Tcl_LinkArray(
  Tcl_Interp *interp, const char *varName, void *addr, int type, Tcl_Size size);

<a name="api-cffi-function-tcl-link-var_3F415064940B8F01E6B89CAAF8BD274B"></a>
### CFFI-FUNCTION: `TCL-LINK-VAR`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_LinkVar`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::VAR-NAME :STRING) (RAW-CFFI-TCL9::ADDR :STRING) (TYPE :INT))`
- SETF? `NIL`

/* 187 */ EXTERN int
Tcl_LinkVar(Tcl_Interp *interp, const char *varName, void *addr, int type);

<a name="api-cffi-function-tcl-list-obj-append-element_AB96704D1AFFDCA1245FA302C28FBAEE"></a>
### CFFI-FUNCTION: `TCL-LIST-OBJ-APPEND-ELEMENT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ListObjAppendElement`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::LIST-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 44 */ EXTERN int
Tcl_ListObjAppendElement(
  Tcl_Interp *interp, Tcl_Obj *listPtr, Tcl_Obj *objPtr);

<a name="api-cffi-function-tcl-list-obj-append-list_42FC7C17ABC190BB7FE78090AE323BDF"></a>
### CFFI-FUNCTION: `TCL-LIST-OBJ-APPEND-LIST`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ListObjAppendList`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::LIST-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::ELEM-LIST-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 43 */ EXTERN int
Tcl_ListObjAppendList(
  Tcl_Interp *interp, Tcl_Obj *listPtr, Tcl_Obj *elemListPtr);

<a name="api-cffi-function-tcl-list-obj-get-elements_C7A82159E569538F115B43958AE843B0"></a>
### CFFI-FUNCTION: `TCL-LIST-OBJ-GET-ELEMENTS`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ListObjGetElements`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::LIST-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::OBJC-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::OBJV-PTR (:POINTER (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR))))`
- SETF? `NIL`

/* 661 */ EXTERN int
Tcl_ListObjGetElements(
  Tcl_Interp *interp, Tcl_Obj *listPtr, Tcl_Size *objcPtr, Tcl_Obj ***objvPtr);

<a name="api-cffi-function-tcl-list-obj-index_8407CE78969B0E9A203A6B88DF591261"></a>
### CFFI-FUNCTION: `TCL-LIST-OBJ-INDEX`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ListObjIndex`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::LIST-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::INDEX RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::OBJ-PTR-PTR (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR)))`
- SETF? `NIL`

/* 46 */ EXTERN int
Tcl_ListObjIndex(
  Tcl_Interp *interp,
  Tcl_Obj *listPtr, Tcl_Size index,
  Tcl_Obj **objPtrPtr);

<a name="api-cffi-function-tcl-list-obj-length_845BDC8929F2D10D8A33F1FE76C10DD2"></a>
### CFFI-FUNCTION: `TCL-LIST-OBJ-LENGTH`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ListObjLength`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::LIST-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::LENGTH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 662 */ EXTERN int
Tcl_ListObjLength(Tcl_Interp *interp, Tcl_Obj *listPtr, Tcl_Size *lengthPtr);

<a name="api-cffi-function-tcl-list-obj-replace_1E4F1E444DB79DA00B3ABBDF8E34EBFB"></a>
### CFFI-FUNCTION: `TCL-LIST-OBJ-REPLACE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ListObjReplace`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::LIST-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (FIRST RAW-CFFI-TCL9:TCL-SIZE) (COUNT RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::OBJV (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR)))`
- SETF? `NIL`

/* 48 */ EXTERN int
Tcl_ListObjReplace(
  Tcl_Interp *interp,
  Tcl_Obj *listPtr, Tcl_Size first,
  Tcl_Size count, Tcl_Size objc,
  Tcl_Obj *const objv[]);

<a name="api-cffi-function-tcl-load-file_0D38D39F0952213B856CA0D33EDA837D"></a>
### CFFI-FUNCTION: `TCL-LOAD-FILE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_LoadFile`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::SYMV (:POINTER (:POINTER :CHAR))) (RAW-CFFI-TCL9::FLAGS :INT)
 (RAW-CFFI-TCL9::PROC-PTRS :POINTER)
 (RAW-CFFI-TCL9::HANDLE-PTR RAW-CFFI-TCL9:TCL-LOAD-HANDLE-PTR))`
- SETF? `NIL`

/* 627 */ EXTERN int
Tcl_LoadFile(
  Tcl_Interp *interp, Tcl_Obj *pathPtr,
  const char *const symv[], int flags,
  void *procPtrs, Tcl_LoadHandle *handlePtr);

<a name="api-cffi-function-tcl-log-command-info_1F633E3B428EB603B0EF987B6012844A"></a>
### CFFI-FUNCTION: `TCL-LOG-COMMAND-INFO`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_LogCommandInfo`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::SCRIPT :STRING) (RAW-CFFI-TCL9::COMMAND :STRING)
 (LENGTH RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 359 */ EXTERN void
Tcl_LogCommandInfo(
  Tcl_Interp *interp, const char *script, const char *command, Tcl_Size length);

<a name="api-cffi-function-tcl-main-ex_C9BF34116141872BFFDBF88894C00DD3"></a>
### CFFI-FUNCTION: `TCL-MAIN-EX`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_MainEx`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ARGC RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::ARGV (:POINTER (:POINTER :CHAR)))
 (RAW-CFFI-TCL9::APP-INIT-PROC RAW-CFFI-TCL9:TCL-APP-INIT-PROC)
 (RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`


<a name="api-cffi-function-tcl-make-file-channel_83758C9415423B776588998225B99FBD"></a>
### CFFI-FUNCTION: `TCL-MAKE-FILE-CHANNEL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_MakeFileChannel`
- CFFI RETURN-TYPE: `TCL-CHANNEL`
- LAMBDA LIST: `((RAW-CFFI-TCL9::HANDLE RAW-CFFI-TCL9::CLIENT-DATA) (RAW-CFFI-TCL9::MODE :INT))`
- SETF? `NIL`

/* 189 */ EXTERN Tcl_Channel Tcl_MakeFileChannel(void *handle, int mode);

<a name="api-cffi-function-tcl-make-tcp-client-channel_C77009C363D78B7561751CF6C6DAFAAC"></a>
### CFFI-FUNCTION: `TCL-MAKE-TCP-CLIENT-CHANNEL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_MakeTcpClientChannel`
- CFFI RETURN-TYPE: `TCL-CHANNEL`
- LAMBDA LIST: `((RAW-CFFI-TCL9:TCL-SOCKET RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 191 */ EXTERN Tcl_Channel	Tcl_MakeTcpClientChannel(void *tcpSocket);

<a name="api-cffi-function-tcl-merge_ED1A21F2E6496E7B08A85248F5F08F08"></a>
### CFFI-FUNCTION: `TCL-MERGE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Merge`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ARGC RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::ARGV (:POINTER (:POINTER :CHAR))))`
- SETF? `NIL`

/* 192 */ EXTERN char * Tcl_Merge(Tcl_Size argc, const char *const *argv);

<a name="api-cffi-function-tcl-mutex-finalize_25B6FA09152D753CC132F2D0FF0FF6C6"></a>
### CFFI-FUNCTION: `TCL-MUTEX-FINALIZE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_MutexFinalize`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::MUTEX-PTR RAW-CFFI-TCL9:TCL-MUTEX-PTR))`
- SETF? `NIL`

/* 392 */ EXTERN void Tcl_MutexFinalize(Tcl_Mutex *mutex);

<a name="api-cffi-function-tcl-mutex-lock_00883E87475ECEB92AACF46C6EF7AC1F"></a>
### CFFI-FUNCTION: `TCL-MUTEX-LOCK`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_MutexLock`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::MUTEX-PTR RAW-CFFI-TCL9:TCL-MUTEX-PTR))`
- SETF? `NIL`

/* 308 */ EXTERN void Tcl_MutexLock(Tcl_Mutex *mutexPtr);

<a name="api-cffi-function-tcl-mutex-unlock_63783E426DE7C7ECAC9EA21F202E6D76"></a>
### CFFI-FUNCTION: `TCL-MUTEX-UNLOCK`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_MutexUnlock`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::MUTEX-PTR RAW-CFFI-TCL9:TCL-MUTEX-PTR))`
- SETF? `NIL`

/* 309 */ EXTERN void Tcl_MutexUnlock(Tcl_Mutex *mutexPtr);

<a name="api-cffi-function-tcl-new-bignum-obj_1683958F3BD9EDD16A18B81E5E121CBC"></a>
### CFFI-FUNCTION: `TCL-NEW-BIGNUM-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_NewBignumObj`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::VALUE RAW-CFFI-TCL9::MP-INT-PTR))`
- SETF? `NIL`

/* 555 */ EXTERN Tcl_Obj * Tcl_NewBignumObj(void *value);

<a name="api-cffi-function-tcl-new-byte-array-obj_C9DAF3CA76165A8BD9002A0952ED0F9A"></a>
### CFFI-FUNCTION: `TCL-NEW-BYTE-ARRAY-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_NewByteArrayObj`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::BYTES (:POINTER :UCHAR)
  (RAW-CFFI-TCL9::NUM-BYTES RAW-CFFI-TCL9:TCL-SIZE)))`
- SETF? `NIL`

/* 50 */ EXTERN Tcl_Obj *
Tcl_NewByteArrayObj(
  const unsigned char *bytes, Tcl_Size numBytes);

<a name="api-cffi-function-tcl-new-dict-obj_E3ED6B5C3182E76F2CCBC5B477A5A764"></a>
### CFFI-FUNCTION: `TCL-NEW-DICT-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_NewDictObj`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `NIL`
- SETF? `NIL`

/* 503 */ EXTERN Tcl_Obj * Tcl_NewDictObj(void);

<a name="api-cffi-function-tcl-new-double-obj_8B4883347B8ABB6ADF14B1732852EE5B"></a>
### CFFI-FUNCTION: `TCL-NEW-DOUBLE-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_NewDoubleObj`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::DOUBLE-VAL :DOUBLE))`
- SETF? `NIL`

/* 51 */ EXTERN Tcl_Obj *
Tcl_NewDoubleObj(double doubleValue);

<a name="api-cffi-function-tcl-new-list-obj_AC6967689E82E03926477512B902928A"></a>
### CFFI-FUNCTION: `TCL-NEW-LIST-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_NewListObj`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::OBJV (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR)))`
- SETF? `NIL`

/* 53 */ EXTERN Tcl_Obj *
Tcl_NewListObj(Tcl_Size objc, Tcl_Obj *const objv[]);

<a name="api-cffi-function-tcl-new-obj_81F434635A67A86E98E086C84C8E56D6"></a>
### CFFI-FUNCTION: `TCL-NEW-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_NewObj`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `NIL`
- SETF? `NIL`

/* 55 */ EXTERN Tcl_Obj *
Tcl_NewObj(void);

<a name="api-cffi-function-tcl-new-string-obj_855EA11B31C716F3427403C4F7C63627"></a>
### CFFI-FUNCTION: `TCL-NEW-STRING-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_NewStringObj`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::BYTES (:POINTER :CHAR)) (LENGTH RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 56 */ EXTERN Tcl_Obj *
Tcl_NewStringObj(const char *bytes, Tcl_Size length);

<a name="api-cffi-function-tcl-new-unicode-obj_E00EE90BC738B47BD703588FF8A2D4A6"></a>
### CFFI-FUNCTION: `TCL-NEW-UNICODE-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_NewUnicodeObj`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::UNICODE RAW-CFFI-TCL9:TCL-UNI-CHAR-PTR)
 (RAW-CFFI-TCL9::NUM-CHARS RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 378 */ EXTERN Tcl_Obj *
Tcl_NewUnicodeObj(const Tcl_UniChar *unicode, Tcl_Size numChars);


<a name="api-cffi-function-tcl-new-wide-int-obj_DD76D01C6CB9B0647A3B2F8484369747"></a>
### CFFI-FUNCTION: `TCL-NEW-WIDE-INT-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_NewWideIntObj`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::WIDE-VALUE RAW-CFFI-TCL9:TCL-WIDE-INT))`
- SETF? `NIL`

/* 488 */ EXTERN Tcl_Obj * Tcl_NewWideIntObj(Tcl_WideInt wideValue);

<a name="api-cffi-function-tcl-new-wide-u-int-obj_7AED9E71FFF9BB160473BAC5EC622CE7"></a>
### CFFI-FUNCTION: `TCL-NEW-WIDE-U-INT-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_NewWideUIntObj`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::WIDE-VALUE RAW-CFFI-TCL9:TCL-WIDE-UINT))`
- SETF? `NIL`

/* 688 */ EXTERN Tcl_Obj * Tcl_NewWideUIntObj(Tcl_WideUInt wideValue);

<a name="api-cffi-function-tcl-next-hash-entry_0F45FD21A6610845AC1869F92F5D4174"></a>
### CFFI-FUNCTION: `TCL-NEXT-HASH-ENTRY`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_NextHashEntry`
- CFFI RETURN-TYPE: `TCL-HASH-ENTRY-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SEARCH-PTR RAW-CFFI-TCL9:TCL-HASH-SEARCH-PTR))`
- SETF? `NIL`

/* 193 */ EXTERN Tcl_HashEntry *
Tcl_NextHashEntry(Tcl_HashSearch *searchPtr);

<a name="api-cffi-function-tcl-notify-channel_1F67CF998F3B6212B41AD3B14B1E045E"></a>
### CFFI-FUNCTION: `TCL-NOTIFY-CHANNEL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_NotifyChannel`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL) (RAW-CFFI-TCL9::MASK :INT))`
- SETF? `NIL`

/* 194 */ EXTERN void Tcl_NotifyChannel(Tcl_Channel channel, int mask);

<a name="api-cffi-function-tcl-nr-add-callback_10953A620628A5F1CF6BE208A453CA11"></a>
### CFFI-FUNCTION: `TCL-NR-ADD-CALLBACK`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_NRAddCallback`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::POST-PROC-PTR RAW-CFFI-TCL9:TCL-NR-POST-PROC)
 (RAW-CFFI-TCL9::DATA-0 RAW-CFFI-TCL9::CLIENT-DATA)
 (RAW-CFFI-TCL9::DATA-1 RAW-CFFI-TCL9::CLIENT-DATA)
 (RAW-CFFI-TCL9::DATA-2 RAW-CFFI-TCL9::CLIENT-DATA)
 (RAW-CFFI-TCL9::DATA-3 RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 587 */ EXTERN void
Tcl_NRAddCallback(
  Tcl_Interp *interp,
  Tcl_NRPostProc *postProcPtr, void *data0,
  void *data1, void *data2, void *data3);

<a name="api-cffi-function-tcl-nr-call-obj-proc2_F6F7498E0BAD21C70C89B7E4A0367486"></a>
### CFFI-FUNCTION: `TCL-NR-CALL-OBJ-PROC2`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_NRCallObjProc2`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PROC2 RAW-CFFI-TCL9:TCL-OBJ-CMD-PROC2)
 (RAW-CFFI-TCL9::CLIENT-DATA :POINTER)
 (RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::OBJV (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR)))`
- SETF? `NIL`

/* 679 */ EXTERN int
Tcl_NRCallObjProc2(
  Tcl_Interp *interp, Tcl_ObjCmdProc2 *objProc2, void *clientData,
  Tcl_Size objc, Tcl_Obj *const objv[]);

<a name="api-cffi-function-tcl-nr-call-obj-proc_B0E8EF2B2AEFAE8B8F5983B823F8DC9D"></a>
### CFFI-FUNCTION: `TCL-NR-CALL-OBJ-PROC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_NRCallObjProc`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PROC RAW-CFFI-TCL9:TCL-OBJ-CMD-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA)
 (RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::OBJV (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR)))`
- SETF? `NIL`

/* 588 */ EXTERN int
Tcl_NRCallObjProc(
  Tcl_Interp *interp,
  Tcl_ObjCmdProc *objProc, void *clientData,
  Tcl_Size objc, Tcl_Obj *const objv[]);

<a name="api-cffi-function-tcl-nr-cmd-swap_2115FB2D7DDB4E1C9B0233B4FB0BC91B"></a>
### CFFI-FUNCTION: `TCL-NR-CMD-SWAP`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_NRCmdSwap`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CMD RAW-CFFI-TCL9:TCL-COMMAND)
 (RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::OBJV (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR))
 (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 586 */ EXTERN int
Tcl_NRCmdSwap(
  Tcl_Interp *interp, Tcl_Command cmd,
  Tcl_Size objc, Tcl_Obj *const objv[],
  int flags);

<a name="api-cffi-function-tcl-nr-create-command2_6BE614A121003574A0011E2C458386AB"></a>
### CFFI-FUNCTION: `TCL-NR-CREATE-COMMAND2`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_NRCreateCommand2`
- CFFI RETURN-TYPE: `TCL-COMMAND`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CMD-NAME :STRING)
 (RAW-CFFI-TCL9::PROC RAW-CFFI-TCL9:TCL-OBJ-CMD-PROC2)
 (RAW-CFFI-TCL9::NRE-PROC2 RAW-CFFI-TCL9:TCL-OBJ-CMD-PROC2)
 (RAW-CFFI-TCL9::CLIENT-DATA :POINTER)
 (RAW-CFFI-TCL9::DELETE-PROC RAW-CFFI-TCL9:TCL-CMD-DELETE-PROC))`
- SETF? `NIL`

/* 678 */ EXTERN Tcl_Command
Tcl_NRCreateCommand2(
  Tcl_Interp *interp, const char *cmdName, Tcl_ObjCmdProc2 *proc,
  Tcl_ObjCmdProc2 *nreProc2, void *clientData, Tcl_CmdDeleteProc *deleteProc);

<a name="api-cffi-function-tcl-nr-create-command_ED9EA27D808D6DF9D2D2823BB9084963"></a>
### CFFI-FUNCTION: `TCL-NR-CREATE-COMMAND`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_NRCreateCommand`
- CFFI RETURN-TYPE: `TCL-COMMAND`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CMD-NAME :STRING)
 (RAW-CFFI-TCL9::PROC RAW-CFFI-TCL9:TCL-OBJ-CMD-PROC)
 (RAW-CFFI-TCL9::NRE-PROC RAW-CFFI-TCL9:TCL-OBJ-CMD-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA)
 (RAW-CFFI-TCL9::DELETE-PROC RAW-CFFI-TCL9:TCL-CMD-DELETE-PROC))`
- SETF? `NIL`

/* 583 */ EXTERN Tcl_Command
Tcl_NRCreateCommand(
  Tcl_Interp *interp, const char *cmdName,
  Tcl_ObjCmdProc *proc, Tcl_ObjCmdProc *nreProc,
  void *clientData, Tcl_CmdDeleteProc *deleteProc);

<a name="api-cffi-function-tcl-nr-eval-obj_E7DF9234C51FFF6B2B68BBE0CE4542DA"></a>
### CFFI-FUNCTION: `TCL-NR-EVAL-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_NREvalObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR) (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 584 */ EXTERN int
Tcl_NREvalObj(Tcl_Interp *interp, Tcl_Obj *objPtr, int flags);

<a name="api-cffi-function-tcl-nr-eval-objv_0561542BBF4E9AE0D55BFD5F74BD4249"></a>
### CFFI-FUNCTION: `TCL-NR-EVAL-OBJV`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_NREvalObjv`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::OBJV (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR))
 (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 585 */ EXTERN int
Tcl_NREvalObjv(Tcl_Interp *interp, Tcl_Size objc, Tcl_Obj *const objv[], int flags);

<a name="api-cffi-function-tcl-nr-expr-obj_ACFD89E8D90E8E320FD27B54B263E9EB"></a>
### CFFI-FUNCTION: `TCL-NR-EXPR-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_NRExprObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::RESULT-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 625 */ EXTERN int
Tcl_NRExprObj(Tcl_Interp *interp, Tcl_Obj *objPtr, Tcl_Obj *resultPtr);

<a name="api-cffi-function-tcl-nr-subst-obj_2AC9698A5A796D7EC915044069A87420"></a>
### CFFI-FUNCTION: `TCL-NR-SUBST-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_NRSubstObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR) (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 626 */ EXTERN int
Tcl_NRSubstObj(Tcl_Interp *interp, Tcl_Obj *objPtr, int flags);

<a name="api-cffi-function-tcl-num-utf-chars_C5D57FC0291DDB56D34312611D7DA83C"></a>
### CFFI-FUNCTION: `TCL-NUM-UTF-CHARS`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_NumUtfChars`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC (:POINTER :CHAR)) (LENGTH RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 669 */ EXTERN Tcl_Size Tcl_NumUtfChars(const char *src, Tcl_Size length);

<a name="api-cffi-function-tcl-obj-get-var2_30258916978B98B47128F0A6F285F10E"></a>
### CFFI-FUNCTION: `TCL-OBJ-GET-VAR2`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ObjGetVar2`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::PART-1-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::PART-2-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 195 */ EXTERN Tcl_Obj *
Tcl_ObjGetVar2(Tcl_Interp *interp, Tcl_Obj *part1Ptr, Tcl_Obj *part2Ptr, int flags);

<a name="api-cffi-function-tcl-obj-printf_E24E17480B9808F20DB3405A6483D8E2"></a>
### CFFI-FUNCTION: `TCL-OBJ-PRINTF`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ObjPrintf`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((FORMAT :STRING) &REST)`
- SETF? `NIL`

/* 578 */ EXTERN Tcl_Obj *
Tcl_ObjPrintf(const char *format, ...) TCL_FORMAT_PRINTF(1, 2);

<a name="api-cffi-function-tcl-obj-set-var2_83EC5D9398E51CE045291951D34404D1"></a>
### CFFI-FUNCTION: `TCL-OBJ-SET-VAR2`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ObjSetVar2`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::PART-1-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::PART-2-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::NEW-VAL-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 196 */ EXTERN Tcl_Obj *
Tcl_ObjSetVar2(
  Tcl_Interp *interp, Tcl_Obj *part1Ptr,
  Tcl_Obj *part2Ptr, Tcl_Obj *newValuePtr,
  int flags);

<a name="api-cffi-function-tcl-open-command-channel_B387DE7703D5D40FEC33542CCE65D0E3"></a>
### CFFI-FUNCTION: `TCL-OPEN-COMMAND-CHANNEL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_OpenCommandChannel`
- CFFI RETURN-TYPE: `TCL-CHANNEL`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::ARGC RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::ARGV (:POINTER (:POINTER :CHAR))) (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 197 */ EXTERN Tcl_Channel
Tcl_OpenCommandChannel(
  Tcl_Interp *interp, Tcl_Size argc, const char **argv, int flags);

<a name="api-cffi-function-tcl-open-file-channel_47E40A083A4C7B0440D4F17E8CD9E1AC"></a>
### CFFI-FUNCTION: `TCL-OPEN-FILE-CHANNEL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_OpenFileChannel`
- CFFI RETURN-TYPE: `TCL-CHANNEL`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::FILE-NAME :STRING) (RAW-CFFI-TCL9::MODE-STRING :STRING)
 (RAW-CFFI-TCL9::PERMISSIONS :INT))`
- SETF? `NIL`

/* 198 */ EXTERN Tcl_Channel
Tcl_OpenFileChannel(
  Tcl_Interp *interp, const char *fileName,
  const char *modeString, int permissions);

<a name="api-cffi-function-tcl-open-tcp-client_0F12C75B6244F21E8B381E48E56BA67F"></a>
### CFFI-FUNCTION: `TCL-OPEN-TCP-CLIENT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_OpenTcpClient`
- CFFI RETURN-TYPE: `TCL-CHANNEL`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::PORT :INT) (RAW-CFFI-TCL9::ADDRESS :STRING)
 (RAW-CFFI-TCL9::MY-ADDR :STRING) (RAW-CFFI-TCL9::MY-PORT :INT)
 (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 199 */ EXTERN Tcl_Channel
Tcl_OpenTcpClient(
  Tcl_Interp *interp, int port,
  const char *address, const char *myaddr,
  int myport, int flags);

<a name="api-cffi-function-tcl-open-tcp-server-ex_C0AD6BAD78ACE1785817AB00E9AECE12"></a>
### CFFI-FUNCTION: `TCL-OPEN-TCP-SERVER-EX`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_OpenTcpServerEx`
- CFFI RETURN-TYPE: `TCL-CHANNEL`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::SERVICE :STRING) (RAW-CFFI-TCL9::HOST :STRING)
 (RAW-CFFI-TCL9::FLAGS :INT) (RAW-CFFI-TCL9::BACKLOG :INT)
 (RAW-CFFI-TCL9::ACCEPT-PROC RAW-CFFI-TCL9:TCL-TCP-ACCEPT-PROC)
 (RAW-CFFI-TCL9::CALLBACK-DATA :POINTER))`
- SETF? `NIL`

/* 631 */ EXTERN Tcl_Channel
Tcl_OpenTcpServerEx(
  Tcl_Interp *interp,
  const char *service, const char *host,
  unsigned int flags, int backlog,
  Tcl_TcpAcceptProc *acceptProc,
  void *callbackData);

<a name="api-cffi-function-tcl-open-tcp-server_9DB3242C0123DF16A3E63CF69EE1989F"></a>
### CFFI-FUNCTION: `TCL-OPEN-TCP-SERVER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_OpenTcpServer`
- CFFI RETURN-TYPE: `TCL-CHANNEL`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::PORT :INT) (RAW-CFFI-TCL9::HOST :STRING)
 (RAW-CFFI-TCL9::ACCEPT-PROC RAW-CFFI-TCL9:TCL-TCP-ACCEPT-PROC)
 (RAW-CFFI-TCL9::CALLBACK-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 200 */ EXTERN Tcl_Channel
Tcl_OpenTcpServer(
  Tcl_Interp *interp, int port, const char *host,
  Tcl_TcpAcceptProc *acceptProc, void *callbackData);

<a name="api-cffi-function-tcl-output-buffered_6C9D80F1ADD1BFC2342419FA9D23A9A1"></a>
### CFFI-FUNCTION: `TCL-OUTPUT-BUFFERED`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_OutputBuffered`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL))`
- SETF? `NIL`

/* 479 */ EXTERN int Tcl_OutputBuffered(Tcl_Channel chan);

<a name="api-cffi-function-tcl-panic_1B8558446BF9946763CF1F9110DDF082"></a>
### CFFI-FUNCTION: `TCL-PANIC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Panic`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((FORMAT :STRING) &REST)`
- SETF? `NIL`

/* 2 */ EXTERN TCL_NORETURN
void Tcl_Panic(const char *format, ...)
TCL_FORMAT_PRINTF(1, 2);

<a name="api-cffi-function-tcl-parse-args-objv_D8666EAF6826B3D5041A7B851B058781"></a>
### CFFI-FUNCTION: `TCL-PARSE-ARGS-OBJV`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ParseArgsObjv`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::ARG-TABLE RAW-CFFI-TCL9:TCL-ARGV-INFO-PTR)
 (RAW-CFFI-TCL9::OBJC-PTR RAW-CFFI-TCL9:TCL-SIZE-PTR)
 (RAW-CFFI-TCL9::OBJV (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR))
 (RAW-CFFI-TCL9::REM-OBJV (:POINTER (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR))))`
- SETF? `NIL`

/* 667 */ EXTERN int
Tcl_ParseArgsObjv(
  Tcl_Interp *interp,
  const Tcl_ArgvInfo *argTable,
  Tcl_Size *objcPtr, Tcl_Obj *const *objv,
  Tcl_Obj ***remObjv);

<a name="api-cffi-function-tcl-parse-braces_D9BBD2AC5047C7C531DC605BAFA99AB3"></a>
### CFFI-FUNCTION: `TCL-PARSE-BRACES`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ParseBraces`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::START (:POINTER :CHAR))
 (RAW-CFFI-TCL9::NUM-BYTES RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::PARSE-PTR RAW-CFFI-TCL9:TCL-PARSE-PTR) (APPEND :INT)
 (RAW-CFFI-TCL9::TERM-PTR (:POINTER (:POINTER :CHAR))))`
- SETF? `NIL`

/* 360 */ EXTERN int
Tcl_ParseBraces(
  Tcl_Interp *interp, const char *start, Tcl_Size numBytes,
  Tcl_Parse *parsePtr, int append, const char **termPtr);

<a name="api-cffi-function-tcl-parse-command_0602514D0F211A675A8E7D2AC6C67616"></a>
### CFFI-FUNCTION: `TCL-PARSE-COMMAND`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ParseCommand`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::START (:POINTER :CHAR))
 (RAW-CFFI-TCL9::NUM-BYTES RAW-CFFI-TCL9:TCL-SIZE) (RAW-CFFI-TCL9::NESTED :INT)
 (RAW-CFFI-TCL9::PARSE-PTR RAW-CFFI-TCL9:TCL-PARSE-PTR))`
- SETF? `NIL`

/* 361 */ EXTERN int
Tcl_ParseCommand(
  Tcl_Interp *interp, const char *start, Tcl_Size numBytes,
  int nested, Tcl_Parse *parsePtr);

<a name="api-cffi-function-tcl-parse-expr_C6E8581D092F9C5E5CDF28B66E112516"></a>
### CFFI-FUNCTION: `TCL-PARSE-EXPR`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ParseExpr`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::START (:POINTER :CHAR))
 (RAW-CFFI-TCL9::NUM-BYTES RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::PARSE-PTR RAW-CFFI-TCL9:TCL-PARSE-PTR))`
- SETF? `NIL`

/* 362 */ EXTERN int
Tcl_ParseExpr(
  Tcl_Interp *interp, const char *start,
  Tcl_Size numBytes, Tcl_Parse *parsePtr);

<a name="api-cffi-function-tcl-parse-quoted-string_E013BFB765117A71AD433B8D096FC6A7"></a>
### CFFI-FUNCTION: `TCL-PARSE-QUOTED-STRING`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ParseQuotedString`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::START (:POINTER :CHAR))
 (RAW-CFFI-TCL9::NUM-BYTES RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::PARSE-PTR RAW-CFFI-TCL9:TCL-PARSE-PTR) (APPEND :INT)
 (RAW-CFFI-TCL9::TERM-PTR (:POINTER (:POINTER :CHAR))))`
- SETF? `NIL`

/* 363 */ EXTERN int
Tcl_ParseQuotedString(
  Tcl_Interp *interp, const char *start, Tcl_Size numBytes,
  Tcl_Parse *parsePtr, int append, const char **termPtr);

<a name="api-cffi-function-tcl-parse-var-name_3261147394BCC4D3EA70D7F8140E3989"></a>
### CFFI-FUNCTION: `TCL-PARSE-VAR-NAME`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ParseVarName`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::START (:POINTER :CHAR))
 (RAW-CFFI-TCL9::NUM-BYTES RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::PARSE-PTR RAW-CFFI-TCL9:TCL-PARSE-PTR) (APPEND :INT))`
- SETF? `NIL`

/* 364 */ EXTERN int
Tcl_ParseVarName(
  Tcl_Interp *interp, const char *start, Tcl_Size numBytes,
  Tcl_Parse *parsePtr, int append);

<a name="api-cffi-function-tcl-parse-var_FC000B8D6A30BE12EF6DC9F19A3F8718"></a>
### CFFI-FUNCTION: `TCL-PARSE-VAR`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ParseVar`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::START :STRING)
 (RAW-CFFI-TCL9::TERM-PTR (:POINTER (:POINTER :CHAR))))`
- SETF? `NIL`

/* 270 */ EXTERN const char *
Tcl_ParseVar(Tcl_Interp *interp, const char *start, const char **termPtr);

<a name="api-cffi-function-tcl-pkg-init-stubs-check_F1E2C7690B30D94828054AC6F81CCFCE"></a>
### CFFI-FUNCTION: `TCL-PKG-INIT-STUBS-CHECK`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_PkgInitStubsCheck`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9:VERSION :STRING) (RAW-CFFI-TCL9::EXACT :INT))`
- SETF? `NIL`


<a name="api-cffi-function-tcl-pkg-present-ex_A06D49808781A957703D690BF5EA7DFC"></a>
### CFFI-FUNCTION: `TCL-PKG-PRESENT-EX`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_PkgPresentEx`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::NAME :STRING) (RAW-CFFI-TCL9:VERSION :STRING)
 (RAW-CFFI-TCL9::EXACT :INT)
 (RAW-CFFI-TCL9::CLIENT-DATA-PTR RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 272 */ EXTERN const char *
Tcl_PkgPresentEx(
  Tcl_Interp *interp, const char *name, const char *version,
  int exact, void *clientDataPtr);

<a name="api-cffi-function-tcl-pkg-provide-ex_588DEF72B00883736E4BC4E361E33D49"></a>
### CFFI-FUNCTION: `TCL-PKG-PROVIDE-EX`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_PkgProvideEx`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::NAME :STRING) (RAW-CFFI-TCL9:VERSION :STRING)
 (RAW-CFFI-TCL9::CLIENT-DATA :POINTER))`
- SETF? `NIL`

/* 0 */ EXTERN int
Tcl_PkgProvideEx(Tcl_Interp *interp,
                 const char *name, const char *version,
                 const void *clientData);

<a name="api-cffi-function-tcl-pkg-require-ex_BC3EDF643156F576E645C758CF96707F"></a>
### CFFI-FUNCTION: `TCL-PKG-REQUIRE-EX`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_PkgRequireEx`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::NAME :STRING) (RAW-CFFI-TCL9:VERSION :STRING)
 (RAW-CFFI-TCL9::EXACT :INT) (RAW-CFFI-TCL9::CLIENT-DATA :POINTER))`
- SETF? `NIL`

/* 1 */ EXTERN const char *
Tcl_PkgRequireEx(
  Tcl_Interp *interp,
  const char *name, const char *version,
  int exact, void *clientDataPtr);

<a name="api-cffi-function-tcl-pkg-require-proc_F612CDF88CE3BCA53176FDCD62ACAD0B"></a>
### CFFI-FUNCTION: `TCL-PKG-REQUIRE-PROC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_PkgRequireProc`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::NAME :STRING) (RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::OBJV (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR))
 (RAW-CFFI-TCL9::CLIENT-DATA-PTR :POINTER))`
- SETF? `NIL`

/* 573 */ EXTERN int
Tcl_PkgRequireProc(
  Tcl_Interp *interp, const char *name, Tcl_Size objc,
  Tcl_Obj *const objv[], void *clientDataPtr);

<a name="api-cffi-function-tcl-posix-error_7CAB01F9F7FC8D4D1F1ADC42706A7400"></a>
### CFFI-FUNCTION: `TCL-POSIX-ERROR`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_PosixError`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`

/* 204 */ EXTERN const char * Tcl_PosixError(Tcl_Interp *interp);

<a name="api-cffi-function-tcl-preserve_4B12609B1FE614440F3C5AAEEBCE9435"></a>
### CFFI-FUNCTION: `TCL-PRESERVE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Preserve`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 201 */ EXTERN void Tcl_Preserve(void *data);

<a name="api-cffi-function-tcl-print-double_DC11344CB084B750206B6DE2E27BA3BE"></a>
### CFFI-FUNCTION: `TCL-PRINT-DOUBLE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_PrintDouble`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::VALUE :DOUBLE) (RAW-CFFI-TCL9::DST :STRING))`
- SETF? `NIL`

/* 202 */ EXTERN void
Tcl_PrintDouble(Tcl_Interp *interp, double value, char *dst);

<a name="api-cffi-function-tcl-proc-obj-cmd_52AD3C13B7C283E174CCFB6AFB476213"></a>
### CFFI-FUNCTION: `TCL-PROC-OBJ-CMD`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ProcObjCmd`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA)
 (RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::OBJV (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR)))`
- SETF? `NIL`

/* 390 */ EXTERN int
Tcl_ProcObjCmd(
  void *clientData, Tcl_Interp *interp,
  Tcl_Size objc, Tcl_Obj *const objv[]);

<a name="api-cffi-function-tcl-put-env_58516949BDE4DE7571A815444C9D1382"></a>
### CFFI-FUNCTION: `TCL-PUT-ENV`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_PutEnv`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ASSIGNMENT :STRING))`
- SETF? `NIL`

/* 203 */ EXTERN int Tcl_PutEnv(const char *assignment);

<a name="api-cffi-function-tcl-query-time-proc_E6B0EED3394B19C2A789C55642DE5E21"></a>
### CFFI-FUNCTION: `TCL-QUERY-TIME-PROC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_QueryTimeProc`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::GET-TIME-PROC-PTR (:POINTER RAW-CFFI-TCL9:TCL-GET-TIME-PROC))
 (RAW-CFFI-TCL9::SCALE-TIME-PROC-PTR
  (:POINTER RAW-CFFI-TCL9:TCL-SCALE-TIME-PROC))
 (RAW-CFFI-TCL9::CLIENT-DATA (:POINTER RAW-CFFI-TCL9::CLIENT-DATA)))`
- SETF? `NIL`

/* 553 */ EXTERN void
Tcl_QueryTimeProc(
  Tcl_GetTimeProc **getProc, Tcl_ScaleTimeProc **scaleProc, void **clientData);

<a name="api-cffi-function-tcl-queue-event_543DE32F04E0034D8C50AB7644432AEF"></a>
### CFFI-FUNCTION: `TCL-QUEUE-EVENT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_QueueEvent`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::EV-PTR RAW-CFFI-TCL9:TCL-EVENT-PTR) (POSITION :INT))`
- SETF? `NIL`

/* 205 */ EXTERN void Tcl_QueueEvent(Tcl_Event *evPtr, int position);

<a name="api-cffi-function-tcl-read-chars_9C98DD97881BCDC58D4BA30748BFF417"></a>
### CFFI-FUNCTION: `TCL-READ-CHARS`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ReadChars`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::CHARS-TO-READ RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::APPEND-FLAG :INT))`
- SETF? `NIL`

/* 313 */ EXTERN Tcl_Size
Tcl_ReadChars(
  Tcl_Channel channel, Tcl_Obj *objPtr,
  Tcl_Size charsToRead, int appendFlag);

<a name="api-cffi-function-tcl-read-raw_89176BB66C1CDC800273C905B0ABAF07"></a>
### CFFI-FUNCTION: `TCL-READ-RAW`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ReadRaw`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL)
 (RAW-CFFI-TCL9::DST (:POINTER :CHAR))
 (RAW-CFFI-TCL9::BYTES-TO-READ RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 394 */ EXTERN Tcl_Size
Tcl_ReadRaw(Tcl_Channel chan, char *dst, Tcl_Size bytesToRead);

<a name="api-cffi-function-tcl-read_C4ED3C7D4DCA9340574D93DBAC0081F1"></a>
### CFFI-FUNCTION: `TCL-READ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Read`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL)
 (RAW-CFFI-TCL9::BUF-PTR (:POINTER :CHAR))
 (RAW-CFFI-TCL9::TO-RAD RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 206 */ EXTERN Tcl_Size
Tcl_Read(Tcl_Channel chan, char *bufPtr, Tcl_Size toRead);

<a name="api-cffi-function-tcl-realloc_FE09BCACD2188C0D97059785B4B9BCA5"></a>
### CFFI-FUNCTION: `TCL-REALLOC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Realloc`
- CFFI RETURN-TYPE: `POINTER`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PTR :POINTER)
 (RAW-CFFI-TCL9::SIZE RAW-CFFI-TCL9:TCL-HASH-TYPE))`
- SETF? `NIL`

/* 5 */ EXTERN void *
Tcl_Realloc(void *ptr, TCL_HASH_TYPE size);

<a name="api-cffi-function-tcl-reap-detached-procs_C14EA5FC33FEEEF8A1AE133F79214FF0"></a>
### CFFI-FUNCTION: `TCL-REAP-DETACHED-PROCS`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ReapDetachedProcs`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `NIL`
- SETF? `NIL`

/* 207 */ EXTERN void Tcl_ReapDetachedProcs(void);

<a name="api-cffi-function-tcl-record-and-eval-obj_AC833EE42844EC962C9B54184014EB23"></a>
### CFFI-FUNCTION: `TCL-RECORD-AND-EVAL-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_RecordAndEvalObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CMD-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR) (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 209 */ EXTERN int
Tcl_RecordAndEvalObj(Tcl_Interp *interp, Tcl_Obj *cmdPtr, int flags);

<a name="api-cffi-function-tcl-record-and-eval_C7AF5C63278108ACE6806DA04E5B9681"></a>
### CFFI-FUNCTION: `TCL-RECORD-AND-EVAL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_RecordAndEval`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CMD :STRING) (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 208 */ EXTERN int
Tcl_RecordAndEval(Tcl_Interp *interp, const char *cmd, int flags);

<a name="api-cffi-function-tcl-reg-exp-compile_F4E15E6A83B3AE0689541B93884A929F"></a>
### CFFI-FUNCTION: `TCL-REG-EXP-COMPILE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_RegExpCompile`
- CFFI RETURN-TYPE: `TCL-REG-EXP`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::PATTER :STRING))`
- SETF? `NIL`

/* 212 */ EXTERN Tcl_RegExp
Tcl_RegExpCompile(Tcl_Interp *interp, const char *pattern);

<a name="api-cffi-function-tcl-reg-exp-exec-obj_39145E0813920030BA6BF56F44A181C4"></a>
### CFFI-FUNCTION: `TCL-REG-EXP-EXEC-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_RegExpExecObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::REGEXP RAW-CFFI-TCL9:TCL-REG-EXP)
 (RAW-CFFI-TCL9::TEXT-OBJ RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::OFFSET RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::NMATCHES RAW-CFFI-TCL9:TCL-SIZE) (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 376 */ EXTERN int
Tcl_RegExpExecObj(
  Tcl_Interp *interp, Tcl_RegExp regexp, Tcl_Obj *textObj,
  Tcl_Size offset, Tcl_Size nmatches, int flags);

<a name="api-cffi-function-tcl-reg-exp-exec_84E4CB9F96CCAB0FFFB276A23A955382"></a>
### CFFI-FUNCTION: `TCL-REG-EXP-EXEC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_RegExpExec`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::REGEXP RAW-CFFI-TCL9:TCL-REG-EXP)
 (RAW-CFFI-TCL9::TEXT (:POINTER :CHAR)) (RAW-CFFI-TCL9::START (:POINTER :CHAR)))`
- SETF? `NIL`

/* 213 */ EXTERN int
Tcl_RegExpExec(
  Tcl_Interp *interp, Tcl_RegExp regexp, const char *text, const char *start);

<a name="api-cffi-function-tcl-reg-exp-get-info_6F6C9AC9EB8CAA1BDA43E65ED45CAE74"></a>
### CFFI-FUNCTION: `TCL-REG-EXP-GET-INFO`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_RegExpGetInfo`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::REGEXP RAW-CFFI-TCL9:TCL-REG-EXP)
 (RAW-CFFI-TCL9::INFO-PTR RAW-CFFI-TCL9:TCL-REG-EXP-INFO-PTR))`
- SETF? `NIL`

/* 377 */ EXTERN void
Tcl_RegExpGetInfo(Tcl_RegExp regexp, Tcl_RegExpInfo *infoPtr);

<a name="api-cffi-function-tcl-reg-exp-match-obj_453B54610089FFE339F25E005FF27169"></a>
### CFFI-FUNCTION: `TCL-REG-EXP-MATCH-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_RegExpMatchObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::TEXT-OBJ RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::PATTERN-OBJ RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 385 */ EXTERN int
Tcl_RegExpMatchObj(Tcl_Interp *interp, Tcl_Obj *textObj, Tcl_Obj *patternObj);

<a name="api-cffi-function-tcl-reg-exp-match_5DEAB071F299A6833EEC691BF36E38F1"></a>
### CFFI-FUNCTION: `TCL-REG-EXP-MATCH`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_RegExpMatch`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::TEXT :STRING) (RAW-CFFI-TCL9::PATTERN :STRING))`
- SETF? `NIL`

/* 214 */ EXTERN int
Tcl_RegExpMatch(Tcl_Interp *interp, const char *text, const char *pattern);

<a name="api-cffi-function-tcl-reg-exp-range_42186E81A055F9FEB044F93B02A51357"></a>
### CFFI-FUNCTION: `TCL-REG-EXP-RANGE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_RegExpRange`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::INDEX RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::START-PTR (:POINTER (:POINTER :CHAR)))
 (RAW-CFFI-TCL9::END-PTR (:POINTER (:POINTER :CHAR))))`
- SETF? `NIL`

/* 215 */ EXTERN void
Tcl_RegExpRange(
  Tcl_RegExp regexp, Tcl_Size index,
  const char **startPtr, const char **endPtr);

<a name="api-cffi-function-tcl-register-channel_8C3C30382180A35CFE136B90BADECAD0"></a>
### CFFI-FUNCTION: `TCL-REGISTER-CHANNEL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_RegisterChannel`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL))`
- SETF? `NIL`

/* 210 */ EXTERN void
Tcl_RegisterChannel(Tcl_Interp *interp, Tcl_Channel chan);

<a name="api-cffi-function-tcl-register-config_ECC4D0258A787FA82913F7510B4378B7"></a>
### CFFI-FUNCTION: `TCL-REGISTER-CONFIG`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_RegisterConfig`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::PKG-NAME :STRING)
 (RAW-CFFI-TCL9::CONFIGURATION RAW-CFFI-TCL9:TCL-CONFIG-PTR)
 (RAW-CFFI-TCL9::VAL-ENCODING :STRING))`
- SETF? `NIL`

/* 505 */ EXTERN void
Tcl_RegisterConfig(
  Tcl_Interp *interp, const char *pkgName,
  const Tcl_Config *configuration, const char *valEncoding);

<a name="api-cffi-function-tcl-register-obj-type_85906F296F716A902788FF967DBF5340"></a>
### CFFI-FUNCTION: `TCL-REGISTER-OBJ-TYPE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_RegisterObjType`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::TYPE-PTR RAW-CFFI-TCL9:TCL-OBJ-TYPE-PTR))`
- SETF? `NIL`

/* 211 */ EXTERN void Tcl_RegisterObjType(const Tcl_ObjType *typePtr);

<a name="api-cffi-function-tcl-release_3065620DC44F74CE6F3CB83678ECD4DB"></a>
### CFFI-FUNCTION: `TCL-RELEASE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Release`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 216 */ EXTERN void Tcl_Release(void *clientData);

<a name="api-cffi-function-tcl-remove-channel-mode_A9D3A5089DFF5A1AC37F38FFBCDB22D8"></a>
### CFFI-FUNCTION: `TCL-REMOVE-CHANNEL-MODE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_RemoveChannelMode`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL) (MOD :INT))`
- SETF? `NIL`

/* 682 */ EXTERN int
Tcl_RemoveChannelMode(Tcl_Interp *interp, Tcl_Channel chan, int mode);

<a name="api-cffi-function-tcl-reset-result_93A60C54E8313565B7349D0B16C4FEB3"></a>
### CFFI-FUNCTION: `TCL-RESET-RESULT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ResetResult`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`

/* 217 */ EXTERN void Tcl_ResetResult(Tcl_Interp *interp);

<a name="api-cffi-function-tcl-restore-interp-state_2D5026AB18BD6E90FE165DB5C0702E26"></a>
### CFFI-FUNCTION: `TCL-RESTORE-INTERP-STATE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_RestoreInterpState`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::STATE RAW-CFFI-TCL9:TCL-INTERP-STATE))`
- SETF? `NIL`

/* 536 */ EXTERN int
Tcl_RestoreInterpState(Tcl_Interp *interp, Tcl_InterpState state);

<a name="api-cffi-function-tcl-save-interp-state_930CE2230D37C1345D3B1EC0021639F3"></a>
### CFFI-FUNCTION: `TCL-SAVE-INTERP-STATE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SaveInterpState`
- CFFI RETURN-TYPE: `TCL-INTERP-STATE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::STATUS :INT))`
- SETF? `NIL`

/* 535 */ EXTERN Tcl_InterpState
Tcl_SaveInterpState(Tcl_Interp *interp, int status);

<a name="api-cffi-function-tcl-scan-counted-element_36D03BE119A094E805DA28E0E1AABB50"></a>
### CFFI-FUNCTION: `TCL-SCAN-COUNTED-ELEMENT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ScanCountedElement`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC :STRING) (LENGTH RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::FLAG-PTR (:POINTER :INT)))`
- SETF? `NIL`

/* 219 */ EXTERN Tcl_Size
Tcl_ScanCountedElement(const char *src, Tcl_Size length, int *flagPtr);

<a name="api-cffi-function-tcl-scan-element_7231DF4BBF490B3EB32536DCB3EC3645"></a>
### CFFI-FUNCTION: `TCL-SCAN-ELEMENT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ScanElement`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC :STRING) (RAW-CFFI-TCL9::FLAG-PTR (:POINTER :INT)))`
- SETF? `NIL`

/* 218 */ EXTERN Tcl_Size Tcl_ScanElement(const char *src, int *flagPtr);

<a name="api-cffi-function-tcl-seek_BD747F42C3BF8BEA712F666BD16ED4FA"></a>
### CFFI-FUNCTION: `TCL-SEEK`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Seek`
- CFFI RETURN-TYPE: `LONG-LONG`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL)
 (RAW-CFFI-TCL9::OFFSET :LONG-LONG) (RAW-CFFI-TCL9::MODE :INT))`
- SETF? `NIL`

/* 491 */ EXTERN long long
Tcl_Seek(Tcl_Channel chan, long long offset, int mode);

<a name="api-cffi-function-tcl-service-all_FDEA324079DAD453AE6E9E4468F8D18A"></a>
### CFFI-FUNCTION: `TCL-SERVICE-ALL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ServiceAll`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `NIL`
- SETF? `NIL`

/* 221 */ EXTERN int Tcl_ServiceAll(void);

<a name="api-cffi-function-tcl-service-event_2177B681545FB1A0A2D64A87F3C11B90"></a>
### CFFI-FUNCTION: `TCL-SERVICE-EVENT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ServiceEvent`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 222 */ EXTERN int Tcl_ServiceEvent(int flags);

<a name="api-cffi-function-tcl-service-mode-hook_1A322EFEF9C1571B5401EAC59A97874D"></a>
### CFFI-FUNCTION: `TCL-SERVICE-MODE-HOOK`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ServiceModeHook`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::MODE :INT))`
- SETF? `NIL`

/* 344 */ EXTERN void Tcl_ServiceModeHook(int mode);

<a name="api-cffi-function-tcl-set-assoc-data_B3795AB0A4546886C29EB96875F78B12"></a>
### CFFI-FUNCTION: `TCL-SET-ASSOC-DATA`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetAssocData`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::NAME :STRING)
 (RAW-CFFI-TCL9::INTERP-DELETE-PROC RAW-CFFI-TCL9:TCL-INTERP-DELETE-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 223 */ EXTERN void
Tcl_SetAssocData(
  Tcl_Interp *interp, const char *name,
  Tcl_InterpDeleteProc *proc, void *clientData);

<a name="api-cffi-function-tcl-set-bignum-obj_1D9EDB1480D0869AD5C9E406BDDB56A7"></a>
### CFFI-FUNCTION: `TCL-SET-BIGNUM-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetBignumObj`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ RAW-CFFI-TCL9:TCL-OBJ-PTR) (RAW-CFFI-TCL9::VALUE :POINTER))`
- SETF? `NIL`

/* 557 */ EXTERN void Tcl_SetBignumObj(Tcl_Obj *obj, void *value);

<a name="api-cffi-function-tcl-set-byte-array-length_E1F8208F1A5B9C9EA15F91542F3475C5"></a>
### CFFI-FUNCTION: `TCL-SET-BYTE-ARRAY-LENGTH`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetByteArrayLength`
- CFFI RETURN-TYPE: `(POINTER UCHAR)`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::NUM-BYTES RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 58 */ EXTERN unsigned char *
Tcl_SetByteArrayLength(
  Tcl_Obj *objPtr, Tcl_Size numBytes);

<a name="api-cffi-function-tcl-set-byte-array-obj_C5359D6D392DBF1326C02FFEC8BFA263"></a>
### CFFI-FUNCTION: `TCL-SET-BYTE-ARRAY-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetByteArrayObj`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::BYTES (:POINTER :UCHAR))
 (RAW-CFFI-TCL9::NUM-BYTES RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 59 */ EXTERN void
Tcl_SetByteArrayObj(
  Tcl_Obj *objPtr, const unsigned char *bytes, Tcl_Size numBytes);

<a name="api-cffi-function-tcl-set-channel-buffer-size_A8F6A12F64C1C229944F431C79D9DF60"></a>
### CFFI-FUNCTION: `TCL-SET-CHANNEL-BUFFER-SIZE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetChannelBufferSize`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL)
 (RAW-CFFI-TCL9::SZ RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 224 */  EXTERN void Tcl_SetChannelBufferSize(Tcl_Channel chan, Tcl_Size sz);

<a name="api-cffi-function-tcl-set-channel-error-interp_1A959AC2590EB61BFDFB065DC94A5D94"></a>
### CFFI-FUNCTION: `TCL-SET-CHANNEL-ERROR-INTERP`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetChannelErrorInterp`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::MSG RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 562 */ EXTERN void
Tcl_SetChannelErrorInterp(Tcl_Interp *interp, Tcl_Obj *msg);

<a name="api-cffi-function-tcl-set-channel-error_E082330C1986CB234AC474E091F8C917"></a>
### CFFI-FUNCTION: `TCL-SET-CHANNEL-ERROR`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetChannelError`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL)
 (RAW-CFFI-TCL9::MSG RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 564 */ EXTERN void Tcl_SetChannelError(Tcl_Channel chan, Tcl_Obj *msg);

<a name="api-cffi-function-tcl-set-channel-option_7C99A13B3B3E2B755BFF4E797AF30A29"></a>
### CFFI-FUNCTION: `TCL-SET-CHANNEL-OPTION`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetChannelOption`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL)
 (RAW-CFFI-TCL9::OPTION-NAME :STRING) (RAW-CFFI-TCL9::NEW-VALUE :STRING))`
- SETF? `NIL`

/* 225 */ EXTERN int
Tcl_SetChannelOption(
  Tcl_Interp *interp, Tcl_Channel chan,
  const char *optionName, const char *newValue);

<a name="api-cffi-function-tcl-set-command-info-from-token_47B07C76360BB8D4E0A83309DAB2D3C4"></a>
### CFFI-FUNCTION: `TCL-SET-COMMAND-INFO-FROM-TOKEN`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetCommandInfoFromToken`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::TOKEN RAW-CFFI-TCL9:TCL-COMMAND)
 (RAW-CFFI-TCL9::CMD-INFO-PTR RAW-CFFI-TCL9:TCL-CMD-INFO-PTR))`
- SETF? `NIL`

/* 485 */ EXTERN int
Tcl_SetCommandInfoFromToken(Tcl_Command token, const Tcl_CmdInfo *infoPtr);

<a name="api-cffi-function-tcl-set-command-info_4D0921BB2CA8E439488447629D108F2E"></a>
### CFFI-FUNCTION: `TCL-SET-COMMAND-INFO`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetCommandInfo`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CMD-NAME :STRING)
 (RAW-CFFI-TCL9::INFO-PTR RAW-CFFI-TCL9:TCL-CMD-INFO-PTR))`
- SETF? `NIL`

/* 226 */ EXTERN int
Tcl_SetCommandInfo(
  Tcl_Interp *interp, const char *cmdName, const Tcl_CmdInfo *infoPtr);

<a name="api-cffi-function-tcl-set-double-obj_8D524CE330E4D747FC2FC67EF6C67841"></a>
### CFFI-FUNCTION: `TCL-SET-DOUBLE-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetDoubleObj`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::DOUBLE-VAL :DOUBLE))`
- SETF? `NIL`

/* 60 */ EXTERN void
Tcl_SetDoubleObj(Tcl_Obj *objPtr, double doubleValue);

<a name="api-cffi-function-tcl-set-encoding-search-path_CD110A7C35F42C8F869AECDD6EA88A00"></a>
### CFFI-FUNCTION: `TCL-SET-ENCODING-SEARCH-PATH`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetEncodingSearchPath`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SEARCH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 571 */ EXTERN int Tcl_SetEncodingSearchPath(Tcl_Obj *searchPath);

<a name="api-cffi-function-tcl-set-ensemble-flags_8FAEE83431F325673C795615D9DE9C87"></a>
### CFFI-FUNCTION: `TCL-SET-ENSEMBLE-FLAGS`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetEnsembleFlags`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::TOKEN RAW-CFFI-TCL9:TCL-COMMAND) (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 546 */ EXTERN int
Tcl_SetEnsembleFlags(Tcl_Interp *interp, Tcl_Command token, int flags);

<a name="api-cffi-function-tcl-set-ensemble-mapping-dict_D4FBB0B4C9B6694CE154E661E93441B0"></a>
### CFFI-FUNCTION: `TCL-SET-ENSEMBLE-MAPPING-DICT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetEnsembleMappingDict`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::TOKEN RAW-CFFI-TCL9:TCL-COMMAND)
 (RAW-CFFI-TCL9::MAP-DICT RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 544 */ EXTERN int
Tcl_SetEnsembleMappingDict(Tcl_Interp *interp, Tcl_Command token, Tcl_Obj *mapDict);

<a name="api-cffi-function-tcl-set-ensemble-parameter-list_61DA83DC214C7DB5ED572F049385005A"></a>
### CFFI-FUNCTION: `TCL-SET-ENSEMBLE-PARAMETER-LIST`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetEnsembleParameterList`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::TOKEN RAW-CFFI-TCL9:TCL-COMMAND)
 (RAW-CFFI-TCL9::PARAM-LIST RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 602 */ EXTERN int
Tcl_SetEnsembleParameterList(Tcl_Interp *interp, Tcl_Command token, Tcl_Obj *paramList);

<a name="api-cffi-function-tcl-set-ensemble-subcommand-list_EB50188AC1CDFEEFF0836BD07D2F9BCF"></a>
### CFFI-FUNCTION: `TCL-SET-ENSEMBLE-SUBCOMMAND-LIST`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetEnsembleSubcommandList`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::TOKEN RAW-CFFI-TCL9:TCL-COMMAND)
 (RAW-CFFI-TCL9::SUBCMD-LIST RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 543 */ EXTERN int
Tcl_SetEnsembleSubcommandList(
  Tcl_Interp *interp,Tcl_Command token, Tcl_Obj *subcmdList);

<a name="api-cffi-function-tcl-set-ensemble-unknown-handler_7775BD4DB349CF5D3D386C8904F21E38"></a>
### CFFI-FUNCTION: `TCL-SET-ENSEMBLE-UNKNOWN-HANDLER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetEnsembleUnknownHandler`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::TOKEN RAW-CFFI-TCL9:TCL-COMMAND)
 (RAW-CFFI-TCL9::UNKNOWN-LIST RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 545 */ EXTERN int
Tcl_SetEnsembleUnknownHandler(
  Tcl_Interp *interp, Tcl_Command token, Tcl_Obj *unknownList);

<a name="api-cffi-function-tcl-set-errno_04326A57BCFC082AD8FC006A1F7E1A54"></a>
### CFFI-FUNCTION: `TCL-SET-ERRNO`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetErrno`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ERR :INT))`
- SETF? `NIL`

/* 227 */ EXTERN void Tcl_SetErrno(int err);

<a name="api-cffi-function-tcl-set-error-code_5BC77DBE3610BC4B51D3CD0EA4915B65"></a>
### CFFI-FUNCTION: `TCL-SET-ERROR-CODE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetErrorCode`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR) &REST)`
- SETF? `NIL`

/* 228 */ EXTERN void Tcl_SetErrorCode(Tcl_Interp *interp, ...);

<a name="api-cffi-function-tcl-set-error-line_7A6D1FFA57DC79269A3E482F26EC6102"></a>
### CFFI-FUNCTION: `TCL-SET-ERROR-LINE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetErrorLine`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::LINE-NUM :INT))`
- SETF? `NIL`

/* 606 */ EXTERN void Tcl_SetErrorLine(Tcl_Interp *interp, int lineNum);

<a name="api-cffi-function-tcl-set-list-obj_7FD009F0C756B810530E57FBD2442043"></a>
### CFFI-FUNCTION: `TCL-SET-LIST-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetListObj`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::OBJV (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR)))`
- SETF? `NIL`

/* 62 */ EXTERN void
Tcl_SetListObj(
  Tcl_Obj *objPtr, Tcl_Size objc, Tcl_Obj *const objv[]);

<a name="api-cffi-function-tcl-set-main-loop_EA8326B8712EC64E9CDC9B3E10267BAE"></a>
### CFFI-FUNCTION: `TCL-SET-MAIN-LOOP`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetMainLoop`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::MAIN-LOOP-PROC RAW-CFFI-TCL9:TCL-MAIN-LOOP-PROC))`
- SETF? `NIL`

/* 284 */ EXTERN void Tcl_SetMainLoop(Tcl_MainLoopProc *proc);

<a name="api-cffi-function-tcl-set-max-block-time_F15EB98DE182D9229482CDB80871B183"></a>
### CFFI-FUNCTION: `TCL-SET-MAX-BLOCK-TIME`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetMaxBlockTime`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::TIME-PTR RAW-CFFI-TCL9:TCL-TIME-PTR))`
- SETF? `NIL`

/* 229 */ EXTERN void Tcl_SetMaxBlockTime(const Tcl_Time *timePtr);

<a name="api-cffi-function-tcl-set-namespace-unknown-handler_E9F1918F403541801D0A52BAF24CFED7"></a>
### CFFI-FUNCTION: `TCL-SET-NAMESPACE-UNKNOWN-HANDLER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetNamespaceUnknownHandler`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::NS-PTR RAW-CFFI-TCL9:TCL-NAMESPACE-PTR)
 (RAW-CFFI-TCL9::HANDLER-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 568 */ EXTERN int
Tcl_SetNamespaceUnknownHandler(
  Tcl_Interp *interp, Tcl_Namespace *nsPtr, Tcl_Obj *handlerPtr);

<a name="api-cffi-function-tcl-set-notifier_CC10E4E11CED3DC16947F6C5C32E0B32"></a>
### CFFI-FUNCTION: `TCL-SET-NOTIFIER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetNotifier`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::NOTIFIER-PROC-PTR RAW-CFFI-TCL9:TCL-NOTIFIER-PROCS-PTR))`
- SETF? `NIL`

/* 386 */ EXTERN void Tcl_SetNotifier(const Tcl_NotifierProcs *notifierProcPtr);

<a name="api-cffi-function-tcl-set-obj-error-code_9A6120161575901E36F6CC0E92832235"></a>
### CFFI-FUNCTION: `TCL-SET-OBJ-ERROR-CODE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetObjErrorCode`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::ERROR-OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 234 */ EXTERN void
Tcl_SetObjErrorCode(Tcl_Interp *interp, Tcl_Obj *errorObjPtr);

<a name="api-cffi-function-tcl-set-obj-length_3519D3065702E49F509A1009EF60212E"></a>
### CFFI-FUNCTION: `TCL-SET-OBJ-LENGTH`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetObjLength`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (LENGTH RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 64 */ EXTERN void
Tcl_SetObjLength(Tcl_Obj *objPtr, Tcl_Size length);

<a name="api-cffi-function-tcl-set-obj-name-of-executable_30E52928CA6EA1F29A5026590A656C91"></a>
### CFFI-FUNCTION: `TCL-SET-OBJ-NAME-OF-EXECUTABLE`

- SCOPE: EXTERNAL
- CFFI NAME: `TclSetObjNameOfExecutable`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::NAME RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::ENC RAW-CFFI-TCL9:TCL-ENCODING))`
- SETF? `NIL`


<a name="api-cffi-function-tcl-set-obj-result_870EB62E032D0B18E82E9E36A653ADBF"></a>
### CFFI-FUNCTION: `TCL-SET-OBJ-RESULT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetObjResult`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::RESULT-OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 235 */ EXTERN void
Tcl_SetObjResult(Tcl_Interp *interp, Tcl_Obj *resultObjPtr);

<a name="api-cffi-function-tcl-set-panic-proc_0FC4BD3B0E35DEE5A2C9D06406E5BAE4"></a>
### CFFI-FUNCTION: `TCL-SET-PANIC-PROC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetPanicProc`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PANIC-PROC RAW-CFFI-TCL9:TCL-PANIC-PROC))`
- SETF? `NIL`


<a name="api-cffi-function-tcl-set-pre-init-script_0832618916CB3DD84F3F49FC513CBD2A"></a>
### CFFI-FUNCTION: `TCL-SET-PRE-INIT-SCRIPT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetPreInitScript`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((STRING :STRING))`
- SETF? `NIL`


<a name="api-cffi-function-tcl-set-recursion-limit_4E6301DDBCA85725B836F3F39A5E4A11"></a>
### CFFI-FUNCTION: `TCL-SET-RECURSION-LIMIT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetRecursionLimit`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::DEPTH RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 231 */ EXTERN Tcl_Size
Tcl_SetRecursionLimit(Tcl_Interp *interp, Tcl_Size depth);

<a name="api-cffi-function-tcl-set-return-options_52745784576B0651EE3C3CD98AD3DBF8"></a>
### CFFI-FUNCTION: `TCL-SET-RETURN-OPTIONS`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetReturnOptions`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OPTIONS RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 538 */ EXTERN int
Tcl_SetReturnOptions(Tcl_Interp *interp, Tcl_Obj *options);

<a name="api-cffi-function-tcl-set-service-mode_1101D7A76C26E5A73F571CAF229D3EA2"></a>
### CFFI-FUNCTION: `TCL-SET-SERVICE-MODE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetServiceMode`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::MODE :INT))`
- SETF? `NIL`

/* 233 */ EXTERN int Tcl_SetServiceMode(int mode);

<a name="api-cffi-function-tcl-set-startup-script_D611B0CA85E71D24178B9B3060B92538"></a>
### CFFI-FUNCTION: `TCL-SET-STARTUP-SCRIPT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetStartupScript`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PATH RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::ENCODING :STRING))`
- SETF? `NIL`

/* 622 */ EXTERN void Tcl_SetStartupScript(Tcl_Obj *path, const char *encoding);

<a name="api-cffi-function-tcl-set-std-channel_1AAAE3191C635409ED35BEA39D27F9BB"></a>
### CFFI-FUNCTION: `TCL-SET-STD-CHANNEL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetStdChannel`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL) (TYPE :INT))`
- SETF? `NIL`

/* 236 */ EXTERN void Tcl_SetStdChannel(Tcl_Channel channel, int type);

<a name="api-cffi-function-tcl-set-string-obj_05937AA5965EB57FB55843233A49C9EF"></a>
### CFFI-FUNCTION: `TCL-SET-STRING-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetStringObj`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::BYTES (:POINTER :CHAR)) (LENGTH RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 65 */ EXTERN void
Tcl_SetStringObj(
  Tcl_Obj *objPtr, const char *bytes, Tcl_Size length);

<a name="api-cffi-function-tcl-set-system-encoding_8523B5C419798DC0422C96EF3BF19761"></a>
### CFFI-FUNCTION: `TCL-SET-SYSTEM-ENCODING`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetSystemEncoding`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::NAME :STRING))`
- SETF? `NIL`

/* 316 */ EXTERN int Tcl_SetSystemEncoding(Tcl_Interp *interp, const char *name);

<a name="api-cffi-function-tcl-set-time-proc_18C8F8C86A0308094CAC4C3D9EE46A53"></a>
### CFFI-FUNCTION: `TCL-SET-TIME-PROC`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetTimeProc`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::GET-TIME-PROC RAW-CFFI-TCL9:TCL-GET-TIME-PROC)
 (RAW-CFFI-TCL9::SCALE-TIME-PROC RAW-CFFI-TCL9:TCL-SCALE-TIME-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 552 */ EXTERN void
Tcl_SetTimeProc(
  Tcl_GetTimeProc *getProc,
  Tcl_ScaleTimeProc *scaleProc,
  void *clientData);


<a name="api-cffi-function-tcl-set-timer_F8728D0A25C4DEEAB0DA80741D714FB5"></a>
### CFFI-FUNCTION: `TCL-SET-TIMER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetTimer`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::TIME-PTR RAW-CFFI-TCL9:TCL-TIME-PTR))`
- SETF? `NIL`

/* 11 */ EXTERN void
Tcl_SetTimer(const Tcl_Time *timePtr);

<a name="api-cffi-function-tcl-set-unicode-obj_BDFF26719F363DA3343F5ED71C997E60"></a>
### CFFI-FUNCTION: `TCL-SET-UNICODE-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetUnicodeObj`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::UNICODE RAW-CFFI-TCL9:TCL-UNI-CHAR-PTR)
 (RAW-CFFI-TCL9::NUM-CHARS RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 379 */ EXTERN void
Tcl_SetUnicodeObj(
  Tcl_Obj *objPtr, const Tcl_UniChar *unicode, Tcl_Size numChars);

<a name="api-cffi-function-tcl-set-var2-ex_7FA9A89691325E5BC0D8859090BA4DDB"></a>
### CFFI-FUNCTION: `TCL-SET-VAR2-EX`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetVar2Ex`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::PART-1 :STRING) (RAW-CFFI-TCL9::PART-2 :STRING)
 (RAW-CFFI-TCL9::NEW-VALUE-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 317 */ EXTERN Tcl_Obj *
Tcl_SetVar2Ex(
  Tcl_Interp *interp, const char *part1, const char *part2,
  Tcl_Obj *newValuePtr, int flags);

<a name="api-cffi-function-tcl-set-var2_ECDD836416F2B062FE684896DF949F13"></a>
### CFFI-FUNCTION: `TCL-SET-VAR2`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetVar2`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::PART-1 :STRING) (RAW-CFFI-TCL9::PART-2 :STRING)
 (RAW-CFFI-TCL9::NEW-VALUE :STRING) (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 238 */ EXTERN const char *
Tcl_SetVar2(
  Tcl_Interp *interp, const char *part1,
  const char *part2, const char *newValue, int flags);

<a name="api-cffi-function-tcl-set-wide-int-obj_431C85AC2DE9AB1FE3E48780DC9140F7"></a>
### CFFI-FUNCTION: `TCL-SET-WIDE-INT-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetWideIntObj`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::WIDE-VALUE RAW-CFFI-TCL9:TCL-WIDE-INT))`
- SETF? `NIL`

/* 489 */ EXTERN void Tcl_SetWideIntObj(Tcl_Obj *objPtr, Tcl_WideInt wideValue);

<a name="api-cffi-function-tcl-set-wide-u-int-obj_AB3441F2990816FA2C0117A0F4D62306"></a>
### CFFI-FUNCTION: `TCL-SET-WIDE-U-INT-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SetWideUIntObj`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::UWIDE-VALUE RAW-CFFI-TCL9:TCL-WIDE-UINT))`
- SETF? `NIL`

/* 689 */ EXTERN void
Tcl_SetWideUIntObj(Tcl_Obj *objPtr, Tcl_WideUInt uwideValue);

<a name="api-cffi-function-tcl-signal-id_F54DA072FF4FA2A3F7913BCC2033B6CF"></a>
### CFFI-FUNCTION: `TCL-SIGNAL-ID`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SignalId`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SIG :INT))`
- SETF? `NIL`

/* 239 */ EXTERN const char * Tcl_SignalId(int sig);

<a name="api-cffi-function-tcl-signal-msg_6AA31132CEC25EB7EED93B5106C6551E"></a>
### CFFI-FUNCTION: `TCL-SIGNAL-MSG`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SignalMsg`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SIG :INT))`
- SETF? `NIL`

/* 240 */ EXTERN const char * Tcl_SignalMsg(int sig);

<a name="api-cffi-function-tcl-sleep_D77CB00902B8ED4B117987C301B2243B"></a>
### CFFI-FUNCTION: `TCL-SLEEP`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Sleep`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::MS :INT))`
- SETF? `NIL`

/* 12 */ EXTERN void
Tcl_Sleep(int ms);

<a name="api-cffi-function-tcl-source-rc-file_6421511C26717279483DF157E5391263"></a>
### CFFI-FUNCTION: `TCL-SOURCE-RC-FILE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SourceRCFile`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`

/* 241 */ EXTERN void Tcl_SourceRCFile(Tcl_Interp *interp);

<a name="api-cffi-function-tcl-splice-channel_C7F9862D4A41A00A980D40F4C343553A"></a>
### CFFI-FUNCTION: `TCL-SPLICE-CHANNEL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SpliceChannel`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL))`
- SETF? `NIL`

/* 416 */ EXTERN void Tcl_SpliceChannel(Tcl_Channel channel);

<a name="api-cffi-function-tcl-split-list_ED32E1AFBCCDFA602AA7178A4565055D"></a>
### CFFI-FUNCTION: `TCL-SPLIT-LIST`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SplitList`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::LIST-STR :STRING)
 (RAW-CFFI-TCL9::ARGC-PTR RAW-CFFI-TCL9:TCL-SIZE-PTR)
 (RAW-CFFI-TCL9::ARGV-PTR (:POINTER (:POINTER (:POINTER :CHAR)))))`
- SETF? `NIL`

/* 664 */ EXTERN int
Tcl_SplitList(
  Tcl_Interp *interp,
  const char *listStr, Tcl_Size *argcPtr,
  const char ***argvPtr);

<a name="api-cffi-function-tcl-split-path_3B18329B31EA354B19813F423D482F02"></a>
### CFFI-FUNCTION: `TCL-SPLIT-PATH`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SplitPath`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PATH :STRING)
 (RAW-CFFI-TCL9::ARGC-PTR RAW-CFFI-TCL9:TCL-SIZE-PTR)
 (RAW-CFFI-TCL9::ARGV-PTR (:POINTER (:POINTER (:POINTER :CHAR)))))`
- SETF? `NIL`

/* 665 */ EXTERN void
Tcl_SplitPath(const char *path, Tcl_Size *argcPtr, const char ***argvPtr);

<a name="api-cffi-function-tcl-stack-channel_583CBDE04C7AD62FA33F929D0AEEE031"></a>
### CFFI-FUNCTION: `TCL-STACK-CHANNEL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_StackChannel`
- CFFI RETURN-TYPE: `TCL-CHANNEL`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::TYPE-PTR RAW-CFFI-TCL9:TCL-CHANNEL-TYPE-PTR)
 (RAW-CFFI-TCL9::INSTANCE-DATA RAW-CFFI-TCL9::CLIENT-DATA)
 (RAW-CFFI-TCL9::MASK :INT)
 (RAW-CFFI-TCL9::PREV-CHAN RAW-CFFI-TCL9:TCL-CHANNEL))`
- SETF? `NIL`

/* 281 */ EXTERN Tcl_Channel
Tcl_StackChannel(
  Tcl_Interp *interp, const Tcl_ChannelType *typePtr,
  void *instanceData, int mask, Tcl_Channel prevChan);

<a name="api-cffi-function-tcl-stat_C5ADC77E93FBDBD96D54A23D073C22D7"></a>
### CFFI-FUNCTION: `TCL-STAT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Stat`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PATH :STRING) (RAW-CFFI-TCL9::BUF-PTR :POINTER))`
- SETF? `NIL`

/* 368 */ EXTERN int Tcl_Stat(const char *path, struct stat *bufPtr);

<a name="api-cffi-function-tcl-static-library_6539AFB9BEE7C66CD2C730F33AE53418"></a>
### CFFI-FUNCTION: `TCL-STATIC-LIBRARY`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_StaticLibrary`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::PREFIX :STRING)
 (RAW-CFFI-TCL9::INIT-PROC RAW-CFFI-TCL9:TCL-LIBRARY-INIT-PROC)
 (RAW-CFFI-TCL9::SAFE-INIT-PROC RAW-CFFI-TCL9:TCL-LIBRARY-INIT-PROC))`
- SETF? `NIL`


<a name="api-cffi-function-tcl-store-internal-rep_4CCC80DBE1BC10FDC10C70647F06A9AF"></a>
### CFFI-FUNCTION: `TCL-STORE-INTERNAL-REP`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_StoreInternalRep`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::TYPE-PTR RAW-CFFI-TCL9:TCL-OBJ-TYPE-PTR)
 (RAW-CFFI-TCL9::IR-PTR RAW-CFFI-TCL9:TCL-OBJ-INTERNAL-REP-PTR))`
- SETF? `NIL`

/* 639 */ EXTERN void
Tcl_StoreInternalRep(
  Tcl_Obj *objPtr, const Tcl_ObjType *typePtr, const Tcl_ObjInternalRep *irPtr);

<a name="api-cffi-function-tcl-string-case-match_FC4A9278D6E6A85FDC1EA07F248258B3"></a>
### CFFI-FUNCTION: `TCL-STRING-CASE-MATCH`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_StringCaseMatch`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::STR :STRING) (RAW-CFFI-TCL9::PATTERN :STRING)
 (RAW-CFFI-TCL9::NOCASE :INT))`
- SETF? `NIL`

/* 371 */ EXTERN int
Tcl_StringCaseMatch(const char *str, const char *pattern, int nocase);

<a name="api-cffi-function-tcl-stub-call_B6F3A0E2EA0D9BD9073C2604CF1E0DA7"></a>
### CFFI-FUNCTION: `TCL-STUB-CALL`

- SCOPE: EXTERNAL
- CFFI NAME: `TclStubCall`
- CFFI RETURN-TYPE: `POINTER`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ARG :POINTER))`
- SETF? `NIL`


<a name="api-cffi-function-tcl-subst-obj_912F964B8662DB6D0C73BBCA46753933"></a>
### CFFI-FUNCTION: `TCL-SUBST-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_SubstObj`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR) (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 437 */ EXTERN Tcl_Obj *
Tcl_SubstObj(Tcl_Interp *interp, Tcl_Obj *objPtr, int flags);

<a name="api-cffi-function-tcl-take-bignum-from-obj_79DD527A8B1CE6B97F895B418B9EEB37"></a>
### CFFI-FUNCTION: `TCL-TAKE-BIGNUM-FROM-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_TakeBignumFromObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ RAW-CFFI-TCL9:TCL-OBJ-PTR) (RAW-CFFI-TCL9::VALUE :POINTER))`
- SETF? `NIL`

/* 559 */ EXTERN int
Tcl_TakeBignumFromObj(Tcl_Interp *interp, Tcl_Obj *obj, void *value);

<a name="api-cffi-function-tcl-tell_35ADFDDD44F5F8A86651164B7BA05A58"></a>
### CFFI-FUNCTION: `TCL-TELL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Tell`
- CFFI RETURN-TYPE: `LONG-LONG`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL))`
- SETF? `NIL`

/* 492 */ EXTERN long long Tcl_Tell(Tcl_Channel chan);

<a name="api-cffi-function-tcl-thread-alert_BC7D98DF313D17F94CD71E0E1BCA740D"></a>
### CFFI-FUNCTION: `TCL-THREAD-ALERT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ThreadAlert`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::THREAD-ID RAW-CFFI-TCL9:TCL-THREAD-ID))`
- SETF? `NIL`

/* 318 */ EXTERN void Tcl_ThreadAlert(Tcl_ThreadId threadId);

<a name="api-cffi-function-tcl-thread-queue-event_A13E8679E486A8ED912EFADE78F4B5B9"></a>
### CFFI-FUNCTION: `TCL-THREAD-QUEUE-EVENT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ThreadQueueEvent`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::THREAD-ID RAW-CFFI-TCL9:TCL-THREAD-ID)
 (RAW-CFFI-TCL9::EV-PTR RAW-CFFI-TCL9:TCL-EVENT-PTR) (POSITION :INT))`
- SETF? `NIL`

/* 319 */ EXTERN void
Tcl_ThreadQueueEvent(Tcl_ThreadId threadId, Tcl_Event *evPtr, int position);

<a name="api-cffi-function-tcl-tom-math-initialize-stubs_6A321361F2DB7FE365C14C27D0FBDDBB"></a>
### CFFI-FUNCTION: `TCL-TOM-MATH-INITIALIZE-STUBS`

- SCOPE: EXTERNAL
- CFFI NAME: `TclTomMathInitializeStubs`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9:VERSION :STRING) (RAW-CFFI-TCL9::EPOCH :INT)
 (RAW-CFFI-TCL9::REVISION :INT))`
- SETF? `NIL`


<a name="api-cffi-function-tcl-trace-command_A04A04850A6AC9D059EDC09815AD5BF7"></a>
### CFFI-FUNCTION: `TCL-TRACE-COMMAND`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_TraceCommand`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::VAR-NAME :STRING) (RAW-CFFI-TCL9::FLAGS :INT)
 (RAW-CFFI-TCL9::CMD-TRACE-PROC RAW-CFFI-TCL9:TCL-CMD-TRACE-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 426 */ EXTERN int
Tcl_TraceCommand(
  Tcl_Interp *interp, const char *varName, int flags,
  Tcl_CommandTraceProc *proc, void *clientData);

<a name="api-cffi-function-tcl-trace-var2_6690387CAEF66B6AED4DE85A7333CC50"></a>
### CFFI-FUNCTION: `TCL-TRACE-VAR2`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_TraceVar2`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::PART-1 :STRING) (RAW-CFFI-TCL9::PART-2 :STRING)
 (RAW-CFFI-TCL9::FLAGS :INT)
 (RAW-CFFI-TCL9::VAR-TRACE-PROC RAW-CFFI-TCL9:TCL-VAR-TRACE-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 248 */ EXTERN int
Tcl_TraceVar2(
  Tcl_Interp *interp, const char *part1,
  const char *part2, int flags,
  Tcl_VarTraceProc *proc, void *clientData);

<a name="api-cffi-function-tcl-transfer-result_5DA6A072D7906907BC59D703D733A32D"></a>
### CFFI-FUNCTION: `TCL-TRANSFER-RESULT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_TransferResult`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC-INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CODE :INT)
 (RAW-CFFI-TCL9::TARGET-INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`

/* 607 */ EXTERN void
Tcl_TransferResult(Tcl_Interp *sourceInterp, int code, Tcl_Interp *targetInterp);

<a name="api-cffi-function-tcl-translate-file-name_D73D9005102BA717E5A33C067814AC67"></a>
### CFFI-FUNCTION: `TCL-TRANSLATE-FILE-NAME`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_TranslateFileName`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::NAME :STRING)
 (RAW-CFFI-TCL9::BUFFER-PTR RAW-CFFI-TCL9:TCL-D-STRING-PTR))`
- SETF? `NIL`

/* 249 */ EXTERN char *
Tcl_TranslateFileName(
  Tcl_Interp *interp, const char *name, Tcl_DString *bufferPtr);

<a name="api-cffi-function-tcl-truncate-channel_EEC47ACA518F19E5491AFD94A0943C7D"></a>
### CFFI-FUNCTION: `TCL-TRUNCATE-CHANNEL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_TruncateChannel`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL) (LENGTH :LONG-LONG))`
- SETF? `NIL`

/* 560 */ EXTERN int
Tcl_TruncateChannel(Tcl_Channel chan, long long length);

<a name="api-cffi-function-tcl-ungets_B2A845489155FB83D97CFAE7620701A8"></a>
### CFFI-FUNCTION: `TCL-UNGETS`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Ungets`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL) (RAW-CFFI-TCL9::STR :STRING)
 (RAW-CFFI-TCL9::LEN RAW-CFFI-TCL9:TCL-SIZE) (RAW-CFFI-TCL9::AT-HEAD :INT))`
- SETF? `NIL`

/* 250 */ EXTERN Tcl_Size
Tcl_Ungets(Tcl_Channel chan, const char *str, Tcl_Size len, int atHead);

<a name="api-cffi-function-tcl-uni-char-at-index_72C62496B6AD19C36F9A597217997D77"></a>
### CFFI-FUNCTION: `TCL-UNI-CHAR-AT-INDEX`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UniCharAtIndex`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC :STRING) (RAW-CFFI-TCL9::INDEX RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 320 */  EXTERN int Tcl_UniCharAtIndex(const char *src, Tcl_Size index);

<a name="api-cffi-function-tcl-uni-char-is-alnum_8F7E31845B2D865302990758B6D23E38"></a>
### CFFI-FUNCTION: `TCL-UNI-CHAR-IS-ALNUM`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UniCharIsAlnum`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CH :INT))`
- SETF? `NIL`

/* 345 */ EXTERN int Tcl_UniCharIsAlnum(int ch);

<a name="api-cffi-function-tcl-uni-char-is-alpha_AB85187BB12AF16E626F1322228955A2"></a>
### CFFI-FUNCTION: `TCL-UNI-CHAR-IS-ALPHA`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UniCharIsAlpha`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CH :INT))`
- SETF? `NIL`

/* 346 */ EXTERN int Tcl_UniCharIsAlpha(int ch);

<a name="api-cffi-function-tcl-uni-char-is-control_456B3D520FCB2A14054CC9660C83E6D9"></a>
### CFFI-FUNCTION: `TCL-UNI-CHAR-IS-CONTROL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UniCharIsControl`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CH :INT))`
- SETF? `NIL`

/* 372 */ EXTERN int Tcl_UniCharIsControl(int ch);

<a name="api-cffi-function-tcl-uni-char-is-digit_69195C77666AE4A86439954DD050DB07"></a>
### CFFI-FUNCTION: `TCL-UNI-CHAR-IS-DIGIT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UniCharIsDigit`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CH :INT))`
- SETF? `NIL`

/* 347 */ EXTERN int Tcl_UniCharIsDigit(int ch);

<a name="api-cffi-function-tcl-uni-char-is-graph_42F9EB8AC57DE0CA409645326C25A9E1"></a>
### CFFI-FUNCTION: `TCL-UNI-CHAR-IS-GRAPH`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UniCharIsGraph`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CH :INT))`
- SETF? `NIL`

/* 373 */ EXTERN int Tcl_UniCharIsGraph(int ch);

<a name="api-cffi-function-tcl-uni-char-is-lower_2442E9E855D75C5F93E111C5795CD6D3"></a>
### CFFI-FUNCTION: `TCL-UNI-CHAR-IS-LOWER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UniCharIsLower`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CH :INT))`
- SETF? `NIL`

/* 348 */ EXTERN int Tcl_UniCharIsLower(int ch);

<a name="api-cffi-function-tcl-uni-char-is-print_7F5E60FCE22CB96DF24BA42925DB4FE5"></a>
### CFFI-FUNCTION: `TCL-UNI-CHAR-IS-PRINT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UniCharIsPrint`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CH :INT))`
- SETF? `NIL`

/* 374 */ EXTERN int Tcl_UniCharIsPrint(int ch);

<a name="api-cffi-function-tcl-uni-char-is-punct_84A49580D2616613D1575488467DBB3E"></a>
### CFFI-FUNCTION: `TCL-UNI-CHAR-IS-PUNCT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UniCharIsPunct`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CH :INT))`
- SETF? `NIL`

/* 375 */ EXTERN int Tcl_UniCharIsPunct(int ch);

<a name="api-cffi-function-tcl-uni-char-is-space_27EB5A39759235BE43B4F08C5735B0B3"></a>
### CFFI-FUNCTION: `TCL-UNI-CHAR-IS-SPACE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UniCharIsSpace`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CH :INT))`
- SETF? `NIL`

/* 349 */ EXTERN int Tcl_UniCharIsSpace(int ch);

<a name="api-cffi-function-tcl-uni-char-is-upper_EAA4632951081A5622CA3E80BE9F167C"></a>
### CFFI-FUNCTION: `TCL-UNI-CHAR-IS-UPPER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UniCharIsUpper`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CH :INT))`
- SETF? `NIL`

/* 350 */ EXTERN int Tcl_UniCharIsUpper(int ch);

<a name="api-cffi-function-tcl-uni-char-is-word-char_C1451D89953A0E27C6E69F25EE28ABC9"></a>
### CFFI-FUNCTION: `TCL-UNI-CHAR-IS-WORD-CHAR`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UniCharIsWordChar`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CH :INT))`
- SETF? `NIL`

/* 351 */ EXTERN int Tcl_UniCharIsWordChar(int ch);

<a name="api-cffi-function-tcl-uni-char-len_F248C387A0DBFA36284562BE6AC41725"></a>
### CFFI-FUNCTION: `TCL-UNI-CHAR-LEN`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UniCharLen`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::UNI-STR (:POINTER :INT)))`
- SETF? `NIL`

/* 668 */ EXTERN Tcl_Size Tcl_UniCharLen(const int *uniStr);

<a name="api-cffi-function-tcl-uni-char-to-lower_D00D0FDF76766A8A432C014C0F8592B7"></a>
### CFFI-FUNCTION: `TCL-UNI-CHAR-TO-LOWER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UniCharToLower`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CH :INT))`
- SETF? `NIL`

/* 321 */ EXTERN int Tcl_UniCharToLower(int ch);

<a name="api-cffi-function-tcl-uni-char-to-title_86E29566270809A263E2345F99D96CB4"></a>
### CFFI-FUNCTION: `TCL-UNI-CHAR-TO-TITLE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UniCharToTitle`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CH :INT))`
- SETF? `NIL`

/* 322 */ EXTERN int Tcl_UniCharToTitle(int ch);

<a name="api-cffi-function-tcl-uni-char-to-upper_6CCE2B550E733E53DDBBBAFCD2EED531"></a>
### CFFI-FUNCTION: `TCL-UNI-CHAR-TO-UPPER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UniCharToUpper`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CH :INT))`
- SETF? `NIL`

/* 323 */ EXTERN int Tcl_UniCharToUpper(int ch);

<a name="api-cffi-function-tcl-uni-char-to-utf-d-string_705C82E746DAE8B632D1E23854E496D5"></a>
### CFFI-FUNCTION: `TCL-UNI-CHAR-TO-UTF-D-STRING`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UniCharToUtfDString`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::UNI-STR (:POINTER :INT))
 (RAW-CFFI-TCL9::UNI-LEN RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::DS-PTR RAW-CFFI-TCL9:TCL-D-STRING-PTR))`
- SETF? `NIL`

/* 647 */ EXTERN char *
Tcl_UniCharToUtfDString(const int *uniStr, Tcl_Size uniLength, Tcl_DString *dsPtr);

<a name="api-cffi-function-tcl-uni-char-to-utf_7FEC30972D0688C5F9F2D69E97C6027B"></a>
### CFFI-FUNCTION: `TCL-UNI-CHAR-TO-UTF`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UniCharToUtf`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CH :INT) (RAW-CFFI-TCL9::BUF (:POINTER :CHAR)))`
- SETF? `NIL`

/* 324 */ EXTERN Tcl_Size Tcl_UniCharToUtf(int ch, char *buf);

<a name="api-cffi-function-tcl-unlink-var_2A39C0C71F0A0E8B0E731BAACBD677D2"></a>
### CFFI-FUNCTION: `TCL-UNLINK-VAR`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UnlinkVar`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::VAR-NAME :STRING))`
- SETF? `NIL`

/* 251 */ EXTERN void Tcl_UnlinkVar(Tcl_Interp *interp, const char *varName);

<a name="api-cffi-function-tcl-unregister-channel_E8937B6A1DC229F45820E9073249CF2F"></a>
### CFFI-FUNCTION: `TCL-UNREGISTER-CHANNEL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UnregisterChannel`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL))`
- SETF? `NIL`

/* 252 */ EXTERN int
Tcl_UnregisterChannel(Tcl_Interp *interp, Tcl_Channel chan);

<a name="api-cffi-function-tcl-unset-var2_C94F7FB2F64C272237B20B6A0BA2425F"></a>
### CFFI-FUNCTION: `TCL-UNSET-VAR2`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UnsetVar2`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::PART-1 :STRING) (RAW-CFFI-TCL9::PART-2 :STRING)
 (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 254 */ EXTERN int
Tcl_UnsetVar2(
  Tcl_Interp *interp, const char *part1, const char *part2, int flags);

<a name="api-cffi-function-tcl-unstack-channel_2DD99903EAD950BEFF1EE2C74554B8F2"></a>
### CFFI-FUNCTION: `TCL-UNSTACK-CHANNEL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UnstackChannel`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL))`
- SETF? `NIL`

/* 282 */ EXTERN int
Tcl_UnstackChannel(Tcl_Interp *interp, Tcl_Channel chan);

<a name="api-cffi-function-tcl-untrace-command_7B89E29FF35779C2F0300B9991685134"></a>
### CFFI-FUNCTION: `TCL-UNTRACE-COMMAND`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UntraceCommand`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::VAR-NAME :STRING) (RAW-CFFI-TCL9::FLAGS :INT)
 (RAW-CFFI-TCL9::CMD-TRACE-PROC RAW-CFFI-TCL9:TCL-CMD-TRACE-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 427 */ EXTERN void
Tcl_UntraceCommand(
  Tcl_Interp *interp, const char *varName, int flags,
  Tcl_CommandTraceProc *proc, void *clientData);

<a name="api-cffi-function-tcl-untrace-var2_7EAF66F38481C08475B63B709181D9CF"></a>
### CFFI-FUNCTION: `TCL-UNTRACE-VAR2`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UntraceVar2`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::PART-1 :STRING) (RAW-CFFI-TCL9::PART-2 :STRING)
 (RAW-CFFI-TCL9::FLAGS :INT)
 (RAW-CFFI-TCL9::VAR-TRACE-PROC RAW-CFFI-TCL9:TCL-VAR-TRACE-PROC)
 (RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 256 */ EXTERN void
Tcl_UntraceVar2(
  Tcl_Interp *interp, const char *part1, const char *part2,
  int flags, Tcl_VarTraceProc *proc,
  void *clientData);

<a name="api-cffi-function-tcl-unused-stub-entry_A175A128C8179685480C5C0DE662B45F"></a>
### CFFI-FUNCTION: `TCL-UNUSED-STUB-ENTRY`

- SCOPE: EXTERNAL
- CFFI NAME: `TclUnusedStubEntry`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `NIL`
- SETF? `NIL`

/* 690 */ EXTERN void TclUnusedStubEntry(void);

<a name="api-cffi-function-tcl-up-var2_0CED86B993097935E64C3A5217D06C90"></a>
### CFFI-FUNCTION: `TCL-UP-VAR2`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UpVar2`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::FRAME-NAME :STRING) (RAW-CFFI-TCL9::PART-1 :STRING)
 (RAW-CFFI-TCL9::PART-2 :STRING) (RAW-CFFI-TCL9::LOCAL-NAME :STRING)
 (RAW-CFFI-TCL9::FLAGS :INT))`
- SETF? `NIL`

/* 259 */ EXTERN int
Tcl_UpVar2(
  Tcl_Interp *interp, const char *frameName,
  const char *part1, const char *part2,
  const char *localName, int flags);

<a name="api-cffi-function-tcl-update-linked-var_675A925532CFE24693E00312482747FD"></a>
### CFFI-FUNCTION: `TCL-UPDATE-LINKED-VAR`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UpdateLinkedVar`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::VAR-NAME :STRING))`
- SETF? `NIL`

/* 257 */ EXTERN void
Tcl_UpdateLinkedVar(Tcl_Interp *interp, const char *varName);

<a name="api-cffi-function-tcl-utf-at-index_D56F90CF67D409B578B06E3D70FF9F61"></a>
### CFFI-FUNCTION: `TCL-UTF-AT-INDEX`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UtfAtIndex`
- CFFI RETURN-TYPE: `(POINTER CHAR)`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC (:POINTER :CHAR))
 (RAW-CFFI-TCL9::INDEX RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 671 */ EXTERN const char * Tcl_UtfAtIndex(const char *src, Tcl_Size index);

<a name="api-cffi-function-tcl-utf-backslash_B565992195E5BF43149B8253F7ED50E8"></a>
### CFFI-FUNCTION: `TCL-UTF-BACKSLASH*`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UtfBackslash`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC :STRING) (RAW-CFFI-TCL9::READ-PTR :POINTER)
 (RAW-CFFI-TCL9::DST :POINTER))`
- SETF? `NIL`


<a name="api-cffi-function-tcl-utf-backslash_D8685718E7BB76E746D38FC50BCAF06A"></a>
### CFFI-FUNCTION: `TCL-UTF-BACKSLASH`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UtfBackslash`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC (:POINTER :CHAR))
 (RAW-CFFI-TCL9::READ-PTR (:POINTER :INT))
 (RAW-CFFI-TCL9::DST (:POINTER :CHAR)))`
- SETF? `NIL`

/* 327 */ EXTERN Tcl_Size Tcl_UtfBackslash(const char *src, int *readPtr, char *dst);

<a name="api-cffi-function-tcl-utf-char-complete_AE26827FAFC604D1895D8F5722613F8E"></a>
### CFFI-FUNCTION: `TCL-UTF-CHAR-COMPLETE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UtfCharComplete`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC (:POINTER :CHAR))
 (RAW-CFFI-TCL9::LEN RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 654 */ EXTERN int Tcl_UtfCharComplete(const char *src, Tcl_Size length);

<a name="api-cffi-function-tcl-utf-find-first_B18C8F73AB94A71308C745D5B41A4DF7"></a>
### CFFI-FUNCTION: `TCL-UTF-FIND-FIRST`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UtfFindFirst`
- CFFI RETURN-TYPE: `(POINTER CHAR)`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC (:POINTER :CHAR)) (RAW-CFFI-TCL9::CH :INT))`
- SETF? `NIL`

/* 328 */ EXTERN const char * Tcl_UtfFindFirst(const char *src, int ch);

<a name="api-cffi-function-tcl-utf-find-last_DC19EE3641566FA3D23166AD4B529B07"></a>
### CFFI-FUNCTION: `TCL-UTF-FIND-LAST`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UtfFindLast`
- CFFI RETURN-TYPE: `(POINTER CHAR)`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC (:POINTER :CHAR)) (RAW-CFFI-TCL9::CH :INT))`
- SETF? `NIL`

/* 329 */ EXTERN const char * Tcl_UtfFindLast(const char *src, int ch);

<a name="api-cffi-function-tcl-utf-ncasecmp_821D3217A02FB5E3B1A96BA5E9F434A7"></a>
### CFFI-FUNCTION: `TCL-UTF-NCASECMP`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UtfNcasecmp`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::S1 :STRING) (RAW-CFFI-TCL9::S2 :STRING)
 (RAW-CFFI-TCL9::N :SIZE))`
- SETF? `NIL`

/* 687 */ EXTERN int
Tcl_UtfNcasecmp(const char *s1, const char *s2, size_t n);

<a name="api-cffi-function-tcl-utf-ncmp_5DE76B7D46270125CA2C7BDADA9EA550"></a>
### CFFI-FUNCTION: `TCL-UTF-NCMP`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UtfNcmp`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::S1 :STRING) (RAW-CFFI-TCL9::S2 :STRING)
 (RAW-CFFI-TCL9::N :SIZE))`
- SETF? `NIL`

/* 686 */ EXTERN int
Tcl_UtfNcmp(const char *s1, const char *s2, size_t n);

<a name="api-cffi-function-tcl-utf-next_A569C2FA738C71B51EF501ECCD4D30D2"></a>
### CFFI-FUNCTION: `TCL-UTF-NEXT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UtfNext`
- CFFI RETURN-TYPE: `(POINTER CHAR)`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC (:POINTER :CHAR)))`
- SETF? `NIL`

/* 655 */ EXTERN const char * Tcl_UtfNext(const char *src);

<a name="api-cffi-function-tcl-utf-prev_E6F97AB7B0F809C613477350EB5E8DB5"></a>
### CFFI-FUNCTION: `TCL-UTF-PREV`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UtfPrev`
- CFFI RETURN-TYPE: `(POINTER CHAR)`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC (:POINTER :CHAR)) (RAW-CFFI-TCL9::START (:POINTER :CHAR)))`
- SETF? `NIL`

/* 656 */ EXTERN const char * Tcl_UtfPrev(const char *src, const char *start);

<a name="api-cffi-function-tcl-utf-to-char16-d-string_D99859790934C5DED790255E7890DDB8"></a>
### CFFI-FUNCTION: `TCL-UTF-TO-CHAR16-D-STRING`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UtfToChar16DString`
- CFFI RETURN-TYPE: `(POINTER USHORT)`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC (:POINTER :CHAR)) (LENGTH RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::DS-PTR RAW-CFFI-TCL9:TCL-D-STRING-PTR))`
- SETF? `NIL`

/* 355 */ EXTERN unsigned short *
Tcl_UtfToChar16DString(const char *src, Tcl_Size length, Tcl_DString *dsPtr);

<a name="api-cffi-function-tcl-utf-to-char16_0F6951385336DD676101918F82610788"></a>
### CFFI-FUNCTION: `TCL-UTF-TO-CHAR16`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UtfToChar16`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC (:POINTER :CHAR))
 (RAW-CFFI-TCL9::CH-PTR (:POINTER :USHORT)))`
- SETF? `NIL`

/* 336 */ EXTERN Tcl_Size Tcl_UtfToChar16(const char *src, unsigned short *chPtr);

<a name="api-cffi-function-tcl-utf-to-external-d-string-ex_DA6C6873A260181E90B55D2F62907800"></a>
### CFFI-FUNCTION: `TCL-UTF-TO-EXTERNAL-D-STRING-EX`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UtfToExternalDStringEx`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::ENCODING RAW-CFFI-TCL9:TCL-ENCODING)
 (RAW-CFFI-TCL9::SRC (:POINTER :CHAR))
 (RAW-CFFI-TCL9::SRC-LEN RAW-CFFI-TCL9:TCL-SIZE) (RAW-CFFI-TCL9::FLAGS :INT)
 (RAW-CFFI-TCL9::DS-PTR RAW-CFFI-TCL9:TCL-D-STRING-PTR)
 (RAW-CFFI-TCL9::ERR-LOC-PTR RAW-CFFI-TCL9:TCL-SIZE-PTR))`
- SETF? `NIL`

/* 659 */ EXTERN int
Tcl_UtfToExternalDStringEx(
  Tcl_Interp *interp,
  Tcl_Encoding encoding, const char *src,
  Tcl_Size srcLen, int flags,
  Tcl_DString *dsPtr,
  Tcl_Size *errorLocationPtr);

<a name="api-cffi-function-tcl-utf-to-external-d-string_78E50A0375AF5340B1E031F268A192F4"></a>
### CFFI-FUNCTION: `TCL-UTF-TO-EXTERNAL-D-STRING`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UtfToExternalDString`
- CFFI RETURN-TYPE: `(POINTER CHAR)`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ENCODING RAW-CFFI-TCL9:TCL-ENCODING)
 (RAW-CFFI-TCL9::SRC (:POINTER :CHAR))
 (RAW-CFFI-TCL9::SRC-LEN RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::DS-PTR RAW-CFFI-TCL9:TCL-D-STRING-PTR))`
- SETF? `NIL`

/* 333 */ EXTERN char *
Tcl_UtfToExternalDString(
  Tcl_Encoding encoding, const char *src, Tcl_Size srcLen, Tcl_DString *dsPtr);

<a name="api-cffi-function-tcl-utf-to-external_8B683D8517A612DC4CC2350CCB2FB6E5"></a>
### CFFI-FUNCTION: `TCL-UTF-TO-EXTERNAL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UtfToExternal`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::ENCODING RAW-CFFI-TCL9:TCL-ENCODING)
 (RAW-CFFI-TCL9::SRC (:POINTER :CHAR))
 (RAW-CFFI-TCL9::SRC-LEN RAW-CFFI-TCL9:TCL-SIZE) (RAW-CFFI-TCL9::FLAGS :INT)
 (RAW-CFFI-TCL9::STATE-PTR RAW-CFFI-TCL9:TCL-ENCODING-STATE-PTR)
 (RAW-CFFI-TCL9::DST (:POINTER :CHAR))
 (RAW-CFFI-TCL9::DST-LEN RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::SRC-READ-PTR (:POINTER :INT))
 (RAW-CFFI-TCL9::DST-WROTE-PTR (:POINTER :INT))
 (RAW-CFFI-TCL9::DST-CHARS-PTR (:POINTER :INT)))`
- SETF? `NIL`

/* 332 */ EXTERN int
Tcl_UtfToExternal(
  Tcl_Interp *interp, Tcl_Encoding encoding,
  const char *src, Tcl_Size srcLen,
  int flags, Tcl_EncodingState *statePtr,
  char *dst, Tcl_Size dstLen,
  int *srcReadPtr,
  int *dstWrotePtr, int *dstCharsPtr);


<a name="api-cffi-function-tcl-utf-to-lower_1387719C208D512ABD1F855E6029CDC8"></a>
### CFFI-FUNCTION: `TCL-UTF-TO-LOWER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UtfToLower`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC :STRING))`
- SETF? `NIL`

/* 334 */ EXTERN Tcl_Size Tcl_UtfToLower(char *src);

<a name="api-cffi-function-tcl-utf-to-title_58376C76BF963B61F17ACD5E85E4045B"></a>
### CFFI-FUNCTION: `TCL-UTF-TO-TITLE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UtfToTitle`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC :STRING))`
- SETF? `NIL`

/* 335 */ EXTERN Tcl_Size Tcl_UtfToTitle(char *src);

<a name="api-cffi-function-tcl-utf-to-uni-char-d-string_E21B9FE83624EE3A8BF5C9DF10865081"></a>
### CFFI-FUNCTION: `TCL-UTF-TO-UNI-CHAR-D-STRING`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UtfToUniCharDString`
- CFFI RETURN-TYPE: `(POINTER INT)`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC (:POINTER :CHAR))
 (RAW-CFFI-TCL9::LEN RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::DS-PTR RAW-CFFI-TCL9:TCL-D-STRING-PTR))`
- SETF? `NIL`

/* 648 */ EXTERN int *
Tcl_UtfToUniCharDString(const char *src, Tcl_Size length, Tcl_DString *dsPtr);

<a name="api-cffi-function-tcl-utf-to-uni-char_5C48803CA078E83190ED8E5093A81390"></a>
### CFFI-FUNCTION: `TCL-UTF-TO-UNI-CHAR`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UtfToUniChar`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC :STRING) (RAW-CFFI-TCL9::CH-PTR (:POINTER :INT)))`
- SETF? `NIL`

/* 646 */ EXTERN Tcl_Size Tcl_UtfToUniChar(const char *src, int *chPtr);

<a name="api-cffi-function-tcl-utf-to-upper_7F654C38B36D39011BCE833260874F6E"></a>
### CFFI-FUNCTION: `TCL-UTF-TO-UPPER`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_UtfToUpper`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC :STRING))`
- SETF? `NIL`

/* 337 */ EXTERN Tcl_Size Tcl_UtfToUpper(char *src);

<a name="api-cffi-function-tcl-validate-all-memory_9B97D8890AB3928A95E419C1C04BD7B4"></a>
### CFFI-FUNCTION: `TCL-VALIDATE-ALL-MEMORY`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ValidateAllMemory`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::FILE-NAME :STRING) (RAW-CFFI-TCL9::LINE :INT))`
- SETF? `NIL`

/* 266 */ EXTERN void Tcl_ValidateAllMemory(const char *file, int line);

<a name="api-cffi-function-tcl-var-eval_C0DBA4C3BD64A50FB795C54425E3EE33"></a>
### CFFI-FUNCTION: `TCL-VAR-EVAL`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_VarEval`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR) &REST)`
- SETF? `NIL`

/* 260 */ EXTERN int Tcl_VarEval(Tcl_Interp *interp, ...);

<a name="api-cffi-function-tcl-var-trace-info2_BF8B23E93E26A55998EFE8BD35F6288C"></a>
### CFFI-FUNCTION: `TCL-VAR-TRACE-INFO2`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_VarTraceInfo2`
- CFFI RETURN-TYPE: `CLIENT-DATA`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::PART-1 :STRING) (RAW-CFFI-TCL9::PART-2 :STRING)
 (RAW-CFFI-TCL9::FLAGS :INT)
 (RAW-CFFI-TCL9::VAR-TRACE-PROC RAW-CFFI-TCL9:TCL-VAR-TRACE-PROC)
 (RAW-CFFI-TCL9::PREV-CLIENT-DATA RAW-CFFI-TCL9::CLIENT-DATA))`
- SETF? `NIL`

/* 262 */ EXTERN void *
Tcl_VarTraceInfo2(
  Tcl_Interp *interp, const char *part1, const char *part2,
  int flags, Tcl_VarTraceProc *procPtr, void *prevClientData);

<a name="api-cffi-function-tcl-wait-for-event_D9AC7531610CD031D943AACEEB8C6FA8"></a>
### CFFI-FUNCTION: `TCL-WAIT-FOR-EVENT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_WaitForEvent`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::TIME-PTR RAW-CFFI-TCL9:TCL-TIME-PTR))`
- SETF? `NIL`

/* 13 */ EXTERN int
Tcl_WaitForEvent(const Tcl_Time *timePtr);

<a name="api-cffi-function-tcl-wait-pid_8753E4411B44C0C294B77B490B2F070E"></a>
### CFFI-FUNCTION: `TCL-WAIT-PID`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_WaitPid`
- CFFI RETURN-TYPE: `TCL-PID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PID RAW-CFFI-TCL9:TCL-PID)
 (RAW-CFFI-TCL9::STAT-PTR (:POINTER :INT)) (RAW-CFFI-TCL9::OPTIONS :INT))`
- SETF? `NIL`

/* 277 */ EXTERN Tcl_Pid Tcl_WaitPid(Tcl_Pid pid, int *statPtr, int options);

<a name="api-cffi-function-tcl-write-chars_11EEABC9A3D8473AFA8D63B018D281C9"></a>
### CFFI-FUNCTION: `TCL-WRITE-CHARS`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_WriteChars`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL)
 (RAW-CFFI-TCL9::SRC (:POINTER :CHAR))
 (RAW-CFFI-TCL9::SRC-LEN RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 338 */ EXTERN Tcl_Size
Tcl_WriteChars(Tcl_Channel chan, const char *src, Tcl_Size srcLen);

<a name="api-cffi-function-tcl-write-obj_018BEC87981E056EF6A0A1E9A4195769"></a>
### CFFI-FUNCTION: `TCL-WRITE-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_WriteObj`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL)
 (RAW-CFFI-TCL9::OBJ-PTR :POINTER))`
- SETF? `NIL`

/* 339 */ EXTERN Tcl_Size Tcl_WriteObj(Tcl_Channel chan, Tcl_Obj *objPtr);

<a name="api-cffi-function-tcl-write-raw_E8D7F7BE88184C5BF150A6B5DDC6F0CC"></a>
### CFFI-FUNCTION: `TCL-WRITE-RAW`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_WriteRaw`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL)
 (RAW-CFFI-TCL9::SRC (:POINTER :CHAR))
 (RAW-CFFI-TCL9::SRC-LEN RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 395 */ EXTERN Tcl_Size
Tcl_WriteRaw(Tcl_Channel chan, const char *src, Tcl_Size srcLen);

<a name="api-cffi-function-tcl-write_7DDF85091724F33678995A3B6B7EEB1C"></a>
### CFFI-FUNCTION: `TCL-WRITE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_Write`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:TCL-CHANNEL) (RAW-CFFI-TCL9::S :STRING)
 (RAW-CFFI-TCL9::SLEN RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 263 */ EXTERN Tcl_Size
Tcl_Write(Tcl_Channel chan, const char *s, Tcl_Size slen);

<a name="api-cffi-function-tcl-wrong-num-args_47059D735B850B3A5DA42ED5BFA1F474"></a>
### CFFI-FUNCTION: `TCL-WRONG-NUM-ARGS`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_WrongNumArgs`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::OBJV (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR))
 (RAW-CFFI-TCL9::MESSAGE :STRING))`
- SETF? `NIL`

/* 264 */ EXTERN void
Tcl_WrongNumArgs(
  Tcl_Interp *interp, Tcl_Size objc,
  Tcl_Obj *const objv[], const char *message);

<a name="api-cffi-function-tcl-zipfs-mount-buffer_BD52691D51D11FC2151D7673D90DE5B3"></a>
### CFFI-FUNCTION: `TCL-ZIPFS-MOUNT-BUFFER`

- SCOPE: EXTERNAL
- CFFI NAME: `TclZipfs_MountBuffer`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::DATA :POINTER) (RAW-CFFI-TCL9::DATALEN :SIZE)
 (RAW-CFFI-TCL9::MOUNT-POINT :STRING) (RAW-CFFI-TCL9::COPY :INT))`
- SETF? `NIL`

/* 635 */ EXTERN int
TclZipfs_MountBuffer(
  Tcl_Interp *interp, const void *data, size_t datalen,
  const char *mountPoint, int copy);

<a name="api-cffi-function-tcl-zipfs-mount_07BE568556BD01BB6EC6F0C7FE351AA2"></a>
### CFFI-FUNCTION: `TCL-ZIPFS-MOUNT`

- SCOPE: EXTERNAL
- CFFI NAME: `TclZipfs_Mount`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::ZIPNAME :STRING) (RAW-CFFI-TCL9::MOUNT-POINT :STRING)
 (RAW-CFFI-TCL9::PASSWD :STRING))`
- SETF? `NIL`

/* 632 */ EXTERN int
TclZipfs_Mount(
  Tcl_Interp *interp, const char *zipname, const char *mountPoint,
  const char *passwd);

<a name="api-cffi-function-tcl-zipfs-tcl-library_33FA4EBA864F59991526338926A7BF67"></a>
### CFFI-FUNCTION: `TCL-ZIPFS-TCL-LIBRARY`

- SCOPE: EXTERNAL
- CFFI NAME: `TclZipfs_TclLibrary`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `NIL`
- SETF? `NIL`

/* 634 */ EXTERN Tcl_Obj * TclZipfs_TclLibrary(void);

<a name="api-cffi-function-tcl-zipfs-unmount_0C475CDC89E1F3BFD928D1D75AF6C43B"></a>
### CFFI-FUNCTION: `TCL-ZIPFS-UNMOUNT`

- SCOPE: EXTERNAL
- CFFI NAME: `TclZipfs_Unmount`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::MOUNT-POINT :STRING))`
- SETF? `NIL`

/* 633 */ EXTERN int
TclZipfs_Unmount(
  Tcl_Interp *interp, const char *mountPoint);

<a name="api-cffi-function-tcl-zlib-adler32_762C6F5C26BD3403D160D40C75382280"></a>
### CFFI-FUNCTION: `TCL-ZLIB-ADLER32`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ZlibAdler32`
- CFFI RETURN-TYPE: `UINT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ADLER :UINT) (RAW-CFFI-TCL9::BUF (:POINTER :UCHAR))
 (RAW-CFFI-TCL9::LEN RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 613 */ EXTERN unsigned int
Tcl_ZlibAdler32(unsigned int adler, const unsigned char *buf, Tcl_Size len);

<a name="api-cffi-function-tcl-zlib-crc32_28395906C1D68BF01FBE6094E2EEFCB4"></a>
### CFFI-FUNCTION: `TCL-ZLIB-CRC32`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ZlibCRC32`
- CFFI RETURN-TYPE: `UINT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::CRC :UINT) (RAW-CFFI-TCL9::BUF (:POINTER :UCHAR))
 (RAW-CFFI-TCL9::LEN RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 612 */ EXTERN unsigned int
Tcl_ZlibCRC32(unsigned int crc, const unsigned char *buf, Tcl_Size len);

<a name="api-cffi-function-tcl-zlib-deflate_E8F5D0793C4B78B81ECE70A1770A6855"></a>
### CFFI-FUNCTION: `TCL-ZLIB-DEFLATE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ZlibDeflate`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR) (FORMAT :INT)
 (RAW-CFFI-TCL9::DATA RAW-CFFI-TCL9:TCL-OBJ-PTR) (RAW-CFFI-TCL9::LEVEL :INT)
 (RAW-CFFI-TCL9::GZIP-HEADER-DICT-OBJ RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 610 */ EXTERN int
Tcl_ZlibDeflate(
  Tcl_Interp *interp, int format,
  Tcl_Obj *data, int level, Tcl_Obj *gzipHeaderDictObj);

<a name="api-cffi-function-tcl-zlib-inflate_B4DF6E270C42CE7A1DCFAD41B9FAAACC"></a>
### CFFI-FUNCTION: `TCL-ZLIB-INFLATE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ZlibInflate`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR) (FORMAT :INT)
 (RAW-CFFI-TCL9::DATA RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::BUFFER-SIZE RAW-CFFI-TCL9:TCL-SIZE)
 (RAW-CFFI-TCL9::GZIP-HEADER-DICT-OBJ RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 611 */ EXTERN int
Tcl_ZlibInflate(
  Tcl_Interp *interp, int format,
  Tcl_Obj *data, Tcl_Size buffersize,
  Tcl_Obj *gzipHeaderDictObj);

<a name="api-cffi-function-tcl-zlib-stream-checksum_63EC37410BDC513AB88129021532877A"></a>
### CFFI-FUNCTION: `TCL-ZLIB-STREAM-CHECKSUM`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ZlibStreamChecksum`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ZSHANDLE RAW-CFFI-TCL9:TCL-ZLIB-STREAM-PTR))`
- SETF? `NIL`

/* 617 */ EXTERN int Tcl_ZlibStreamChecksum(Tcl_ZlibStream zshandle);

<a name="api-cffi-function-tcl-zlib-stream-close_C63F6999736AD9FEBB169502A02AABFC"></a>
### CFFI-FUNCTION: `TCL-ZLIB-STREAM-CLOSE`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ZlibStreamClose`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ZSHANDLE RAW-CFFI-TCL9:TCL-ZLIB-STREAM-PTR))`
- SETF? `NIL`

/* 620 */ EXTERN int Tcl_ZlibStreamClose(Tcl_ZlibStream zshandle);

<a name="api-cffi-function-tcl-zlib-stream-eof_BF84520BA67B69DC09E7090CBC6DD6F3"></a>
### CFFI-FUNCTION: `TCL-ZLIB-STREAM-EOF`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ZlibStreamEof`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ZSHANDLE RAW-CFFI-TCL9:TCL-ZLIB-STREAM-PTR))`
- SETF? `NIL`

/* 616 */ EXTERN int Tcl_ZlibStreamEof(Tcl_ZlibStream zshandle);

<a name="api-cffi-function-tcl-zlib-stream-get-command-name_7323EB396684C34D977B202400FA97B6"></a>
### CFFI-FUNCTION: `TCL-ZLIB-STREAM-GET-COMMAND-NAME`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ZlibStreamGetCommandName`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ZSHANDLE RAW-CFFI-TCL9:TCL-ZLIB-STREAM-PTR))`
- SETF? `NIL`

/* 615 */ EXTERN Tcl_Obj * Tcl_ZlibStreamGetCommandName(Tcl_ZlibStream zshandle);

<a name="api-cffi-function-tcl-zlib-stream-get_D8B72CFC0F996C36905BFC65CB6820CD"></a>
### CFFI-FUNCTION: `TCL-ZLIB-STREAM-GET`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ZlibStreamGet`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ZSHANDLE RAW-CFFI-TCL9:TCL-ZLIB-STREAM-PTR)
 (RAW-CFFI-TCL9::DATA RAW-CFFI-TCL9:TCL-OBJ-PTR) (COUNT RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 619 */ EXTERN int
Tcl_ZlibStreamGet(Tcl_ZlibStream zshandle, Tcl_Obj *data, Tcl_Size count);

<a name="api-cffi-function-tcl-zlib-stream-init_2F6E65F2F8BCB8B6982B856748BB0F6A"></a>
### CFFI-FUNCTION: `TCL-ZLIB-STREAM-INIT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ZlibStreamInit`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::MODE :INT) (FORMAT :INT) (RAW-CFFI-TCL9::LEVEL :INT)
 (RAW-CFFI-TCL9::DICT-OBJ RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::ZSHANDLE RAW-CFFI-TCL9:TCL-ZLIB-STREAM-PTR))`
- SETF? `NIL`

/* 614 */ EXTERN int
Tcl_ZlibStreamInit(
  Tcl_Interp *interp, int mode,
  int format, int level, Tcl_Obj *dictObj,
  Tcl_ZlibStream *zshandle);

<a name="api-cffi-function-tcl-zlib-stream-put_41CA6E5035ED2839BFB1DE3FE498AC8A"></a>
### CFFI-FUNCTION: `TCL-ZLIB-STREAM-PUT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ZlibStreamPut`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ZSHANDLE RAW-CFFI-TCL9:TCL-ZLIB-STREAM-PTR)
 (RAW-CFFI-TCL9::DATA RAW-CFFI-TCL9:TCL-OBJ-PTR) (RAW-CFFI-TCL9::FLUSH :INT))`
- SETF? `NIL`

/* 618 */ EXTERN int
Tcl_ZlibStreamPut(Tcl_ZlibStream zshandle, Tcl_Obj *data, int flush);

<a name="api-cffi-function-tcl-zlib-stream-reset_B2C0257105A7A8FA1EB0D57E4F25CB11"></a>
### CFFI-FUNCTION: `TCL-ZLIB-STREAM-RESET`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ZlibStreamReset`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ZSHANDLE RAW-CFFI-TCL9:TCL-ZLIB-STREAM-PTR))`
- SETF? `NIL`

/* 621 */ EXTERN int Tcl_ZlibStreamReset(Tcl_ZlibStream zshandle);

<a name="api-cffi-function-tcl-zlib-stream-set-compression-dictionary_95E3A7842C3493D6919E2D2EC3BD73D6"></a>
### CFFI-FUNCTION: `TCL-ZLIB-STREAM-SET-COMPRESSION-DICTIONARY`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_ZlibStreamSetCompressionDictionary`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::ZSHANDLE RAW-CFFI-TCL9:TCL-ZLIB-STREAM-PTR)
 (RAW-CFFI-TCL9::COMPRESSION-DICTIONARY-OBJ RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 630 */ EXTERN void
Tcl_ZlibStreamSetCompressionDictionary(
  Tcl_ZlibStream zhandle,
  Tcl_Obj *compressionDictionaryObj);

<a name="api-cffi-function-tcldict-obj-size_A25E3DC1B79C75D2C101184877A83FCF"></a>
### CFFI-FUNCTION: `TCL_DICT-OBJ-SIZE`

- SCOPE: EXTERNAL
- CFFI NAME: `TclDictObjSize`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::DICT-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::SIZE-PTR :POINTER))`
- SETF? `NIL`

/* 497 */ EXTERN int
TclDictObjSize(Tcl_Interp *interp, Tcl_Obj *dictPtr, void *sizePtr);

<a name="api-cffi-function-tclfs-split-path_A9F903FFA690548F830A3D0244F2E308"></a>
### CFFI-FUNCTION: `TCL_FS-SPLIT-PATH`

- SCOPE: EXTERNAL
- CFFI NAME: `TclFSSplitPath`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::LEN-PTR :POINTER))`
- SETF? `NIL`

/* 461 */ EXTERN Tcl_Obj * TclFSSplitPath(Tcl_Obj *pathPtr, void *lenPtr);

<a name="api-cffi-function-tclfscreatedirectory_6AF4ADF33E0A2DCB8A8C05A3E56D1A01"></a>
### CFFI-FUNCTION: `TCL_FSCREATEDIRECTORY`

- SCOPE: EXTERNAL
- CFFI NAME: `Tcl_FSCreateDirectory`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 442 */ EXTERN int Tcl_FSCreateDirectory(Tcl_Obj *pathPtr);

<a name="api-cffi-function-tclget-alias-obj_EDA31E8D717DED9B8247F4A7A7196558"></a>
### CFFI-FUNCTION: `TCL_GET-ALIAS-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `TclGetAliasObj`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::CHILD-CMD :STRING)
 (RAW-CFFI-TCL9::TARGET-INTERP-PTR-PTR (:POINTER RAW-CFFI-TCL9:TCL-INTERP-PTR))
 (RAW-CFFI-TCL9::TARGET-CMD-PTR (:POINTER (:POINTER :CHAR)))
 (RAW-CFFI-TCL9::OBJC-PTR (:POINTER :INT))
 (RAW-CFFI-TCL9::OBJV-PTR (:POINTER (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR))))`
- SETF? `NIL`

/* 149 */ EXTERN int
TclGetAliasObj(
  Tcl_Interp *interp, const char *childCmd,
  Tcl_Interp **targetInterpPtr, const char **targetCmdPtr,
   int *objcPtr, Tcl_Obj ***objvPtr);

<a name="api-cffi-function-tclget-bytes-from-obj_A92D0EB19EDBA3546F0B36A0EE6DDD61"></a>
### CFFI-FUNCTION: `TCL_GET-BYTES-FROM-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `TclGetBytesFromObj`
- CFFI RETURN-TYPE: `(POINTER UCHAR)`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::NUM-BYTES-PTR :POINTER))`
- SETF? `NIL`

/* 649 */ EXTERN unsigned char *
TclGetBytesFromObj(Tcl_Interp *interp, Tcl_Obj *objPtr, void *numBytesPtr);

<a name="api-cffi-function-tclget-char-length_89F536D796AFA765EDAA26B575F99ECC"></a>
### CFFI-FUNCTION: `TCL_GET-CHAR-LENGTH`

- SCOPE: EXTERNAL
- CFFI NAME: `TclGetCharLength`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR))`
- SETF? `NIL`

/* 380 */ EXTERN Tcl_Size TclGetCharLength(Tcl_Obj *objPtr);

<a name="api-cffi-function-tclget-range_56FB2FAD59FC437B36DDFF5FFC0C7E01"></a>
### CFFI-FUNCTION: `TCL_GET-RANGE`

- SCOPE: EXTERNAL
- CFFI NAME: `TclGetRange`
- CFFI RETURN-TYPE: `TCL-OBJ-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (FIRST RAW-CFFI-TCL9:TCL-SIZE) (LAST RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 383 */ EXTERN Tcl_Obj *
TclGetRange(Tcl_Obj *objPtr, Tcl_Size first, Tcl_Size last);

<a name="api-cffi-function-tclget-string-from-obj_0CE13A6488EACF9CF275F01D5C056920"></a>
### CFFI-FUNCTION: `TCL_GET-STRING-FROM-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `TclGetStringFromObj`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::LENGTH-PTR :POINTER))`
- SETF? `NIL`

/* 41 */ EXTERN char *
TclGetStringFromObj(Tcl_Obj *objPtr, void *lengthPtr);

<a name="api-cffi-function-tclget-uni-char_55F93A24C3CCAF15C8CBFE81370C0D74"></a>
### CFFI-FUNCTION: `TCL_GET-UNI-CHAR`

- SCOPE: EXTERNAL
- CFFI NAME: `TclGetUniChar`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::INDEX RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 381 */ EXTERN int TclGetUniChar(Tcl_Obj *objPtr, Tcl_Size index);

<a name="api-cffi-function-tclget-unicode-from-obj_1AE9E96C46D428D35B58679C5F540587"></a>
### CFFI-FUNCTION: `TCL_GET-UNICODE-FROM-OBJ`

- SCOPE: EXTERNAL
- CFFI NAME: `TclGetUnicodeFromObj`
- CFFI RETURN-TYPE: `TCL-UNI-CHAR-PTR`
- LAMBDA LIST: `((RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::LENGTH-PTR :POINTER))`
- SETF? `NIL`

/* 434 */ EXTERN Tcl_UniChar *
TclGetUnicodeFromObj(Tcl_Obj *objPtr, void *lengthPtr);

<a name="api-cffi-function-tcllist-obj-get-elements_B917A007E923810853D9FF70D408F6FA"></a>
### CFFI-FUNCTION: `TCL_LIST-OBJ-GET-ELEMENTS`

- SCOPE: EXTERNAL
- CFFI NAME: `TclListObjGetElements`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::LIST-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::OBJC-PTR :POINTER)
 (RAW-CFFI-TCL9::OBJV-PTR (:POINTER (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR))))`
- SETF? `NIL`

/* 45 */ EXTERN int
TclListObjGetElements(
  Tcl_Interp *interp, Tcl_Obj *listPtr, void *objcPtr, Tcl_Obj ***objvPtr);

<a name="api-cffi-function-tcllist-obj-length_E4557D84324DCA4D9FD1729BB967F802"></a>
### CFFI-FUNCTION: `TCL_LIST-OBJ-LENGTH`

- SCOPE: EXTERNAL
- CFFI NAME: `TclListObjLength`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::LIST-PTR RAW-CFFI-TCL9:TCL-OBJ-PTR)
 (RAW-CFFI-TCL9::LENGTH-PTR :POINTER))`
- SETF? `NIL`

/* 47 */ EXTERN int
TclListObjLength(
  Tcl_Interp *interp, Tcl_Obj *listPtr, void *lengthPtr);

<a name="api-cffi-function-tclnum-utf-chars_C2D1E450DD7B3EDA090F9218A699BE02"></a>
### CFFI-FUNCTION: `TCL_NUM-UTF-CHARS`

- SCOPE: EXTERNAL
- CFFI NAME: `TclNumUtfChars`
- CFFI RETURN-TYPE: `TCL-SIZE`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC (:POINTER :CHAR)) (LENGTH RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 312 */ EXTERN Tcl_Size TclNumUtfChars(const char *src, Tcl_Size length);

<a name="api-cffi-function-tclparse-args-objv_8A2B8AF0B1F8F435C3D09DBE45BD84F5"></a>
### CFFI-FUNCTION: `TCL_PARSE-ARGS-OBJV`

- SCOPE: EXTERNAL
- CFFI NAME: `TclParseArgsObjv`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::ARG-TABLE RAW-CFFI-TCL9:TCL-ARGV-INFO-PTR)
 (RAW-CFFI-TCL9::OBJC-PTR :POINTER)
 (RAW-CFFI-TCL9::OBJV (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR))
 (RAW-CFFI-TCL9::REM-OBJV (:POINTER (:POINTER RAW-CFFI-TCL9:TCL-OBJ-PTR))))`
- SETF? `NIL`

/* 604 */ EXTERN int
TclParseArgsObjv(
  Tcl_Interp *interp,
  const Tcl_ArgvInfo *argTable, void *objcPtr,
  Tcl_Obj *const *objv, Tcl_Obj ***remObjv);

<a name="api-cffi-function-tclsplit-list_4E5F8C543A230760A255AE69238FA9F6"></a>
### CFFI-FUNCTION: `TCL_SPLIT-LIST`

- SCOPE: EXTERNAL
- CFFI NAME: `TclSplitList`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR)
 (RAW-CFFI-TCL9::LIST-STR :STRING) (RAW-CFFI-TCL9::ARGC-PTR :POINTER)
 (RAW-CFFI-TCL9::ARGV-PTR (:POINTER (:POINTER (:POINTER :CHAR)))))`
- SETF? `NIL`

/* 242 */ EXTERN int
TclSplitList(
  Tcl_Interp *interp, const char *listStr,
  void *argcPtr, const char ***argvPtr);

<a name="api-cffi-function-tclsplit-path_41254C7C54E2AEBDAB9465E66DE4814A"></a>
### CFFI-FUNCTION: `TCL_SPLIT-PATH`

- SCOPE: EXTERNAL
- CFFI NAME: `TclSplitPath`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `((RAW-CFFI-TCL9::PATH :STRING) (RAW-CFFI-TCL9::ARGC-PTR :POINTER)
 (RAW-CFFI-TCL9::ARGV-PTR (:POINTER (:POINTER (:POINTER :CHAR)))))`
- SETF? `NIL`

/* 243 */ EXTERN void
TclSplitPath(const char *path, void *argcPtr, const char ***argvPtr);

<a name="api-cffi-function-tclutf-at-index_E760868232BF8C446A89A108925DE3FE"></a>
### CFFI-FUNCTION: `TCL_UTF-AT-INDEX`

- SCOPE: EXTERNAL
- CFFI NAME: `TclUtfAtIndex`
- CFFI RETURN-TYPE: `STRING`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC :STRING) (RAW-CFFI-TCL9::INDEX RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 325 */ EXTERN const char * TclUtfAtIndex(const char *src, Tcl_Size index);

<a name="api-cffi-function-tclutf-char-complete_80A8A4125130335C66EF2E1E73BBC26F"></a>
### CFFI-FUNCTION: `TCL_UTF-CHAR-COMPLETE`

- SCOPE: EXTERNAL
- CFFI NAME: `TclUtfCharComplete`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC (:POINTER :CHAR)) (LENGTH RAW-CFFI-TCL9:TCL-SIZE))`
- SETF? `NIL`

/* 326 */ EXTERN int TclUtfCharComplete(const char *src, Tcl_Size length);

<a name="api-cffi-function-tclutf-ncasecmp_216CB83D945BD3B13F68940C91FBEEFE"></a>
### CFFI-FUNCTION: `TCL_UTF-NCASECMP`

- SCOPE: EXTERNAL
- CFFI NAME: `TclUtfNcasecmp`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::S1 :STRING) (RAW-CFFI-TCL9::S2 :STRING)
 (RAW-CFFI-TCL9::N :SIZE))`
- SETF? `NIL`

/* 370 */ EXTERN int TclUtfNcasecmp(const char *s1, const char *s2, size_t n);

<a name="api-cffi-function-tclutf-ncmp_33E9C816399249171FCDE55820EEA34E"></a>
### CFFI-FUNCTION: `TCL_UTF-NCMP`

- SCOPE: EXTERNAL
- CFFI NAME: `TclUtfNcmp`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::S1 :STRING) (RAW-CFFI-TCL9::S2 :STRING)
 (RAW-CFFI-TCL9::N :SIZE))`
- SETF? `NIL`

/* 369 */ EXTERN int TclUtfNcmp(const char *s1, const char *s2, size_t n);

<a name="api-cffi-function-tclutf-next_784A64A77E61AA09C8934FAB9F4135CD"></a>
### CFFI-FUNCTION: `TCL_UTF-NEXT`

- SCOPE: EXTERNAL
- CFFI NAME: `TclUtfNext`
- CFFI RETURN-TYPE: `(POINTER CHAR)`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC (:POINTER :CHAR)))`
- SETF? `NIL`

/* 330 */ EXTERN const char * TclUtfNext(const char *src);

<a name="api-cffi-function-tclutf-prev_837C61E63F779E6397FCA3ADDE6CACF3"></a>
### CFFI-FUNCTION: `TCL_UTF-PREV`

- SCOPE: EXTERNAL
- CFFI NAME: `TclUtfPrev`
- CFFI RETURN-TYPE: `(POINTER CHAR)`
- LAMBDA LIST: `((RAW-CFFI-TCL9::SRC (:POINTER :CHAR)) (RAW-CFFI-TCL9::START (:POINTER :CHAR)))`
- SETF? `NIL`

/* 331 */ EXTERN const char * TclUtfPrev(const char *src, const char *start);

<a name="api-cffi-function-tk-create-console-window_53E38A102AEC57E3D606EC36EFB6F470"></a>
### CFFI-FUNCTION: `TK-CREATE-CONSOLE-WINDOW`

- SCOPE: EXTERNAL
- CFFI NAME: `Tk_CreateConsoleWindow`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`


<a name="api-cffi-function-tk-init_AB4CBDDFA845E83CCA52B712B543F44B"></a>
### CFFI-FUNCTION: `TK-INIT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tk_Init`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`


<a name="api-cffi-function-tk-main-loop_6F29D8537B321BF1B7ECF45F16B5A84D"></a>
### CFFI-FUNCTION: `TK-MAIN-LOOP`

- SCOPE: EXTERNAL
- CFFI NAME: `Tk_MainLoop`
- CFFI RETURN-TYPE: `VOID`
- LAMBDA LIST: `NIL`
- SETF? `NIL`


<a name="api-cffi-function-tk-safe-init_5165D5293F0FDCBDFDFE342BE8ED6995"></a>
### CFFI-FUNCTION: `TK-SAFE-INIT`

- SCOPE: EXTERNAL
- CFFI NAME: `Tk_SafeInit`
- CFFI RETURN-TYPE: `INT`
- LAMBDA LIST: `((RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9:TCL-INTERP-PTR))`
- SETF? `NIL`


<a name="api-cffi-struct-tcl-argv-info_33E64560CBB5F30EEB138ADBE47A68AA"></a>
### CFFI-STRUCT: `TCL-ARGV-INFO`

- SCOPE: EXTERNAL
- SLOTS:


<a name="api-cffi-struct-tcl-call-frame_49727D2E3CA6994F9B51B76CF253D4A1"></a>
### CFFI-STRUCT: `TCL-CALL-FRAME`

- SCOPE: EXTERNAL
- SLOTS:
   - SLOT `NS-PTR` / TYPE: `TCL-NAMESPACE-PTR`
   - SLOT `DUMMY1` / TYPE: `INT`
   - SLOT `DUMMY2` / TYPE: `TCL-SIZE`
   - SLOT `DUMMY3` / TYPE: `POINTER`
   - SLOT `DUMMY4` / TYPE: `POINTER`
   - SLOT `DUMMY5` / TYPE: `POINTER`
   - SLOT `DUMMY6` / TYPE: `TCL-SIZE`
   - SLOT `DUMMY7` / TYPE: `POINTER`
   - SLOT `DUMMY8` / TYPE: `POINTER`
   - SLOT `DUMMY9` / TYPE: `TCL-SIZE`
   - SLOT `DUMMY10` / TYPE: `POINTER`
   - SLOT `DUMMY11` / TYPE: `POINTER`
   - SLOT `DUMMY12` / TYPE: `POINTER`
   - SLOT `DUMMY13` / TYPE: `POINTER`

Tcl_CallFrame

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


<a name="api-cffi-struct-tcl-channel-type_644ECB5F4EECCF840521EEF25E24AAEE"></a>
### CFFI-STRUCT: `TCL-CHANNEL-TYPE`

- SCOPE: EXTERNAL
- SLOTS:
   - SLOT `TYPE-NAME` / TYPE: `(POINTER CHAR)`
   - SLOT `VERSION` / TYPE: `TCL-CHANNEL-TYPE-VERSION`
   - SLOT `CLOSE-PROC` / TYPE: `POINTER`
   - SLOT `INPUT-PROC` / TYPE: `TCL-DRIVER-INPUT-PROC`
   - SLOT `OUTPUT-PROC` / TYPE: `TCL-DRIVER-OUTPUT-PROC`
   - SLOT `SEEK-PROC` / TYPE: `POINTER`
   - SLOT `SET-OPTION-PROC` / TYPE: `TCL-DRIVER-SET-OPTION-PROC`
   - SLOT `GET-OPTION-PROC` / TYPE: `TCL-DRIVER-GET-OPTION-PROC`
   - SLOT `WATCH-PROC` / TYPE: `TCL-DRIVER-WATCH-PROC`
   - SLOT `GET-HANDLE-PROC` / TYPE: `TCL-DRIVER-GET-HANDLE-PROC`
   - SLOT `CLOSE2-PROC` / TYPE: `TCL-DRIVER-CLOSE2-PROC`
   - SLOT `BLOCK-MODE-PROC` / TYPE: `TCL-DRIVER-BLOCK-MODE-PROC`
   - SLOT `FLUSH-PROC` / TYPE: `TCL-DRIVER-FLUSH-PROC`
   - SLOT `HANDLER-PROC` / TYPE: `TCL-DRIVER-HANDLER-PROC`
   - SLOT `WIDE-SEEK-PROC` / TYPE: `TCL-DRIVER-WIDE-SEEK-PROC`
   - SLOT `THREAD-ACTION-PROC` / TYPE: `TCL-DRIVER-THREAD-ACTION-PROC`
   - SLOT `TRUNCATE-PROC` / TYPE: `TCL-DRIVER-TRUNCATE-PROC`

Tcl_ChannelType

<a name="api-cffi-struct-tcl-cmd-info_9365DF6E253E06FABA3A8E19EAF4055E"></a>
### CFFI-STRUCT: `TCL-CMD-INFO`

- SCOPE: EXTERNAL
- SLOTS:
   - SLOT `IS-NATIVE-OBJECT-PROC` / TYPE: `INT`
   - SLOT `OBJ-PROC` / TYPE: `TCL-OBJ-CMD-PROC`
   - SLOT `OBJ-CLIENT-DATA` / TYPE: `CLIENT-DATA`
   - SLOT `PROC` / TYPE: `TCL-CMD-PROC`
   - SLOT `CLIENT-DATA` / TYPE: `CLIENT-DATA`
   - SLOT `DELETE-PROC` / TYPE: `TCL-CMD-DELETE-PROC`
   - SLOT `DELETE-DATA` / TYPE: `CLIENT-DATA`
   - SLOT `NAMESPACE-PTR` / TYPE: `TCL-NAMESPACE-PTR`
   - SLOT `OBJ-PROC2` / TYPE: `TCL-OBJ-CMD-PROC2`
   - SLOT `OBJ-CLIENT-DATA2` / TYPE: `CLIENT-DATA`

Tcl_CmdInfo

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


<a name="api-cffi-struct-tcl-config_4CCF2F0C21364617A5CA32F83E98449F"></a>
### CFFI-STRUCT: `TCL-CONFIG`

- SCOPE: EXTERNAL
- SLOTS:


<a name="api-cffi-struct-tcl-d-string_39B84F902F44F27FF3D8C34533B3D020"></a>
### CFFI-STRUCT: `TCL-D-STRING`

- SCOPE: EXTERNAL
- SLOTS:
   - SLOT `STRING` / TYPE: `STRING`
   - SLOT `LENGTH` / TYPE: `TCL-SIZE`
   - SLOT `SPACE-AVL` / TYPE: `TCL-SIZE`
   - SLOT `STATIC-SPACE` / TYPE: `(ARRAY CHAR 200)`

Tcl_DString

The structure defined below is used to hold dynamic strings. The only
fields that clients should use are string and length, accessible via
the macros Tcl_DStringValue and Tcl_DStringLength.

<a name="api-cffi-struct-tcl-dict-search_5826526231384E62251BA1A5624E3154"></a>
### CFFI-STRUCT: `TCL-DICT-SEARCH`

- SCOPE: EXTERNAL
- SLOTS:
   - SLOT `NEXT` / TYPE: `POINTER`
   - SLOT `EPOCH` / TYPE: `TCL-HASH-TYPE`
   - SLOT `DICTIONARY-PTR` / TYPE: `TCL-DICT`

Tcl_DictSearch

<a name="api-cffi-struct-tcl-encoding-type_2167FD8F9E6E7AB315B1F0F494E8C3E2"></a>
### CFFI-STRUCT: `TCL-ENCODING-TYPE`

- SCOPE: EXTERNAL
- SLOTS:
   - SLOT `ENCODING-NAME` / TYPE: `STRING`
   - SLOT `TO-UTF-PROC` / TYPE: `TCL-ENCODING-CONVERT-PROC`
   - SLOT `FROM-UTF-PROC` / TYPE: `TCL-ENCODING-CONVERT-PROC`
   - SLOT `FREE-PROC` / TYPE: `TCL-FREE-PROC`
   - SLOT `CLIENT-DATA` / TYPE: `CLIENT-DATA`
   - SLOT `NULL-SIZE` / TYPE: `TCL-SIZE`

Tcl_EncodingType

<a name="api-cffi-struct-tcl-event_FEBF69945E1E8A4E3CB2B01A2748DF93"></a>
### CFFI-STRUCT: `TCL-EVENT`

- SCOPE: EXTERNAL
- SLOTS:
   - SLOT `PROC` / TYPE: `TCL-EVENT-PROC`
   - SLOT `NEXT-PTR` / TYPE: `POINTER`

Tcl_Event

<a name="api-cffi-struct-tcl-filesystem_5004046EB0F062CF2C31BE278D9FEF2D"></a>
### CFFI-STRUCT: `TCL-FILESYSTEM`

- SCOPE: EXTERNAL
- SLOTS:
   - SLOT `TYPE-NAME` / TYPE: `STRING`
   - SLOT `STRUCTURE-LENGTH` / TYPE: `TCL-SIZE`
   - SLOT `VERSION` / TYPE: `TCL-FS-VERSION`
   - SLOT `PATH-IN-FILESYSTEM-PROC` / TYPE: `TCL-FS-PATH-IN-FILESYSTEM-PROC`
   - SLOT `DUP-INTERNAL-REP-PROC` / TYPE: `TCL-FS-DUP-INTERNAL-REP-PROC`
   - SLOT `FREE-INTERNAL-REP-PROC` / TYPE: `TCL-FS-FREE-INTERNAL-REP-PROC`
   - SLOT `INTERNAL-TO-NORMALIZED-PROC` / TYPE: `TCL-FS-INTERNAL-TO-NORMALIZED-PROC`
   - SLOT `CREATE-INTERNAL-REP-PROC` / TYPE: `TCL-FS-CREATE-INTERNAL-REP-PROC`
   - SLOT `NORMALIZE-PATH-PROC` / TYPE: `TCL-FS-NORMALIZE-PATH-PROC`
   - SLOT `FILESYSTEM-PATH-TYPE-PROC` / TYPE: `TCL-FS-FILESYSTEM-PATH-TYPE-PROC`
   - SLOT `FILESYSTEM-SEPARATOR-PROC` / TYPE: `TCL-FS-FILESYSTEM-SEPARATOR-PROC`
   - SLOT `STAT-PROC` / TYPE: `TCL-FS-STAT-PROC`
   - SLOT `ACCESS-PROC` / TYPE: `TCL-FS-ACCESS-PROC`
   - SLOT `OPEN-FILE-CHANNEL-PROC` / TYPE: `TCL-FS-OPEN-FILE-CHANNEL-PROC`
   - SLOT `MATCH-IN-DIRECTORY-PROC` / TYPE: `TCL-FS-MATCH-IN-DIRECTORY-PROC`
   - SLOT `UTIME-PROC` / TYPE: `TCL-FS-UTIME-PROC`
   - SLOT `LINK-PROC` / TYPE: `TCL-FS-LINK-PROC`
   - SLOT `LIST-VOLUMES-PROC` / TYPE: `TCL-FS-LIST-VOLUMES-PROC`
   - SLOT `FILE-ATTR-STRINGS-PROC` / TYPE: `TCL-FS-FILE-ATTR-STRINGS-PROC`
   - SLOT `FILE-ATTRS-GET-PROC` / TYPE: `TCL-FS-FILE-ATTRS-GET-PROC`
   - SLOT `FILE-ATTRS-SET-PROC` / TYPE: `TCL-FS-FILE-ATTRS-SET-PROC`
   - SLOT `CREATE-DIRECTORY-PROC` / TYPE: `TCL-FS-CREATE-DIRECTORY-PROC`
   - SLOT `REMOVE-DIRECTORY-PROC` / TYPE: `TCL-FS-REMOVE-DIRECTORY-PROC`
   - SLOT `DELETE-FILE-PROC` / TYPE: `TCL-FS-DELETE-FILE-PROC`
   - SLOT `COPY-FILE-PROC` / TYPE: `TCL-FS-COPY-FILE-PROC`
   - SLOT `RENAME-FILE-PROC` / TYPE: `TCL-FS-RENAME-FILE-PROC`
   - SLOT `COPY-DIRECTORY-PROC` / TYPE: `TCL-FS-COPY-DIRECTORY-PROC`
   - SLOT `LSTAT-PROC` / TYPE: `TCL-FS-LSTAT-PROC`
   - SLOT `LOAD-FILE-PROC` / TYPE: `TCL-FS-LOAD-FILE-PROC`
   - SLOT `GET-CWD-PROC` / TYPE: `TCL-FS-GET-CWD-PROC`
   - SLOT `CHDIR-PROC` / TYPE: `TCL-FS-CHDIR-PROC`

Tcl_Filesystem

<a name="api-cffi-struct-tcl-glob-type-data_0FAFF43E1699D2BD6A42398254AB0ADB"></a>
### CFFI-STRUCT: `TCL-GLOB-TYPE-DATA`

- SCOPE: EXTERNAL
- SLOTS:


<a name="api-cffi-struct-tcl-hash-entry_79E515003DFB21F6CD25A1CA9ACBE03C"></a>
### CFFI-STRUCT: `TCL-HASH-ENTRY`

- SCOPE: EXTERNAL
- SLOTS:
   - SLOT `NEXT-PTR` / TYPE: `(POINTER)`
   - SLOT `TABLE-PTR` / TYPE: `(POINTER)`
   - SLOT `HASH` / TYPE: `SIZE`
   - SLOT `CLIENT-DATA` / TYPE: `CLIENT-DATA`
   - SLOT `KEY` / TYPE: `(UNION TCL-HASH-ENTRY/KEY)`

Tcl_HashEntry

<a name="api-cffi-struct-tcl-hash-key-type_711B7855F8D752AA282F9A7E4633095C"></a>
### CFFI-STRUCT: `TCL-HASH-KEY-TYPE`

- SCOPE: EXTERNAL
- SLOTS:
   - SLOT `VERSION` / TYPE: `INT`
   - SLOT `FLAGS` / TYPE: `INT`
   - SLOT `HASH-KEY-PROC` / TYPE: `TCL-HASH-KEY-PROC`
   - SLOT `COMPARE-KEYS-PROC` / TYPE: `TCL-COMPARE-HASH-KEYS-PROC`
   - SLOT `ALLOC-ENTRY-PROC` / TYPE: `TCL-ALLOC-HASH-ENTRY-PROC`
   - SLOT `FREE-ENTRY-PROC` / TYPE: `TCL-FREE-HASH-ENTRY-PROC`

Tcl_HashKeyType

<a name="api-cffi-struct-tcl-hash-search_19015DB2C3B32326F13C27157983A05D"></a>
### CFFI-STRUCT: `TCL-HASH-SEARCH`

- SCOPE: EXTERNAL
- SLOTS:
   - SLOT `TABLE-PTR` / TYPE: `TCL-HASH-TABLE-PTR`
   - SLOT `NEXT-INDEX` / TYPE: `TCL-SIZE`
   - SLOT `NEXT-ENTRY-PTR` / TYPE: `TCL-HASH-ENTRY-PTR`

Tcl_HashSearch

<a name="api-cffi-struct-tcl-hash-table_8A1E791A608397A157DDE188679BEF63"></a>
### CFFI-STRUCT: `TCL-HASH-TABLE`

- SCOPE: EXTERNAL
- SLOTS:


<a name="api-cffi-struct-tcl-namespace_64844693206AFF93FCC22698BE3A2F63"></a>
### CFFI-STRUCT: `TCL-NAMESPACE`

- SCOPE: EXTERNAL
- SLOTS:
   - SLOT `NAME` / TYPE: `STRING`
   - SLOT `FULL-NAME` / TYPE: `STRING`
   - SLOT `CLIENT-DATA` / TYPE: `CLIENT-DATA`
   - SLOT `DELETE-PROC` / TYPE: `TCL-NAMESPACE-DELETE-PROC`
   - SLOT `PARENT-PTR` / TYPE: `(POINTER)`

Tcl_Namespace

The following definitions support Tcl's namespace facility. Note: the
first five fields must match exactly the fields in a Namespace
structure (see tclInt.h).

<a name="api-cffi-struct-tcl-notifier-procs_87CE6F9346EA9E1B779DD39CD98A6806"></a>
### CFFI-STRUCT: `TCL-NOTIFIER-PROCS`

- SCOPE: EXTERNAL
- SLOTS:
   - SLOT `SET-TIMER-PROC` / TYPE: `TCL-SET-TIMER-PROC`
   - SLOT `WAIT-FOR-EVENT-PROC` / TYPE: `TCL-WAIT-FOR-EVENT-PROC`
   - SLOT `CREATE-FILE-HANDLER-PROC` / TYPE: `TCL-CREATE-FILE-HANDLER-PROC`
   - SLOT `DELETE-FILE-HANDLER-PROC` / TYPE: `TCL-DELETE-FILE-HANDLER-PROC`
   - SLOT `INIT-NOTIFIER-PROC` / TYPE: `TCL-INIT-NOTIFIER-PROC`
   - SLOT `FINALIZE-NOTIFIER-PROC` / TYPE: `TCL-FINALIZE-NOTIFIER-PROC`
   - SLOT `ALERT-NOTIFIER-PROC` / TYPE: `TCL-ALERT-NOTIFIER-PROC`
   - SLOT `SERVICE-MODE-HOOK-PROC` / TYPE: `TCL-SERVICE-MODE-HOOK-PROC`

Tcl_NotifierPRocs

<a name="api-cffi-struct-tcl-obj-internal-repptr-and-long-rep_323BF78B8A8ADD199F3859BEC38E4476"></a>
### CFFI-STRUCT: `TCL-OBJ-INTERNAL-REP/PTR-AND-LONG-REP`

- SCOPE: EXTERNAL
- SLOTS:


<a name="api-cffi-struct-tcl-obj-internal-repptr-and-size_8B58CBB2CBBEB9AD0B1394DCC76870F2"></a>
### CFFI-STRUCT: `TCL-OBJ-INTERNAL-REP/PTR-AND-SIZE`

- SCOPE: EXTERNAL
- SLOTS:


<a name="api-cffi-struct-tcl-obj-internal-reptwo-ptr-value_34AC3D7E8941D2253BE907AA6F582E39"></a>
### CFFI-STRUCT: `TCL-OBJ-INTERNAL-REP/TWO-PTR-VALUE`

- SCOPE: EXTERNAL
- SLOTS:


<a name="api-cffi-struct-tcl-obj-type_5999DD0989035B69B87CD8C8D71D1A41"></a>
### CFFI-STRUCT: `TCL-OBJ-TYPE`

- SCOPE: EXTERNAL
- SLOTS:
   - SLOT `NAME` / TYPE: `STRING`
   - SLOT `FREE-INT-REP-PROC` / TYPE: `TCL-FREE-INTERNAL-REP-PROC`
   - SLOT `DUP-INT-REP-PROC` / TYPE: `TCL-DUP-INTERNAL-REP-PROC`
   - SLOT `UPDATE-STRING-PROC` / TYPE: `TCL-UPDATE-STRING-PROC`
   - SLOT `SET-FROM-ANY-PROC` / TYPE: `TCL-SET-FROM-ANY-PROC`
   - SLOT `VERSION` / TYPE: `SIZE`
   - SLOT `LENGTH-PROC` / TYPE: `TCL-OBJ-TYPE-LENGTH-PROC`
   - SLOT `INDEX-PROC` / TYPE: `TCL-OBJ-TYPE-INDEX-PROC`
   - SLOT `SLICE-PROC` / TYPE: `TCL-OBJ-TYPE-SLICE-PROC`
   - SLOT `REVERSE-PROC` / TYPE: `TCL-OBJ-TYPE-REVERSE-PROC`
   - SLOT `GET-ELEMENTS-PROC` / TYPE: `TCL-OBJ-TYPE-GET-ELEMENTS`
   - SLOT `SET-ELEMENTS-PROC` / TYPE: `TCL-OBJ-TYPE-SET-ELEMENT`
   - SLOT `REPLACE-PROC` / TYPE: `TCL-OBJ-TYPE-REPLACE-PROC`
   - SLOT `IN-OPER-PROC` / TYPE: `TCL-OBJ-TYPE-IN-OPERATOR-PROC`

Tcl_ObjType

The following structure represents a type of object, which is a
particular internal representation for an object plus a set of
functions that provide standard operations on objects of that type.

<a name="api-cffi-struct-tcl-obj_974A467D239BA884AF3F575AEBE1567D"></a>
### CFFI-STRUCT: `TCL-OBJ`

- SCOPE: EXTERNAL
- SLOTS:
   - SLOT `REF-COUNT` / TYPE: `TCL-SIZE`
   - SLOT `BYTES` / TYPE: `POINTER`
   - SLOT `LENGTH` / TYPE: `TCL-SIZE`
   - SLOT `TYPE-PTR` / TYPE: `TCL-OBJ-TYPE-PTR`
   - SLOT `INTERNAL-REP` / TYPE: `(UNION TCL-OBJ-INTERNAL-REP)`

Tcl_Obj

One of the following structures exists for each object in the Tcl
system. An object stores a value as either a string, some internal
representation, or both.

<a name="api-cffi-struct-tcl-parse_1E3CA7E39E3D060FEE706FF576EFCE5A"></a>
### CFFI-STRUCT: `TCL-PARSE`

- SCOPE: EXTERNAL
- SLOTS:
   - SLOT `COMMENT-START` / TYPE: `(POINTER CHAR)`
   - SLOT `COMMENT-SIZE` / TYPE: `TCL-SIZE`
   - SLOT `COMMAND-START` / TYPE: `(POINTER CHAR)`
   - SLOT `COMMAND-SIZE` / TYPE: `TCL-SIZE`
   - SLOT `NUM-WORDS` / TYPE: `TCL-SIZE`
   - SLOT `TOKEN-PTR` / TYPE: `TCL-TOKEN-PTR`
   - SLOT `NUM-TOKENS` / TYPE: `TCL-SIZE`
   - SLOT `TOKENS-AVAILABLE` / TYPE: `TCL-SIZE`
   - SLOT `INCOMPLETE` / TYPE: `INT`
   - SLOT `STRING` / TYPE: `(POINTER CHAR)`
   - SLOT `END` / TYPE: `(POINTER CHAR)`
   - SLOT `INTERP` / TYPE: `TCL-INTERP-PTR`
   - SLOT `TERM` / TYPE: `STRING`
   - SLOT `STATIC-TOKENS` / TYPE: `(ARRAY (STRUCT TCL-TOKEN) 20)`

Tcl_Parse

<a name="api-cffi-struct-tcl-reg-exp-indices_4055BBC023FF564B4207DB1F7AE584A9"></a>
### CFFI-STRUCT: `TCL-REG-EXP-INDICES`

- SCOPE: EXTERNAL
- SLOTS:
   - SLOT `START` / TYPE: `TCL-SIZE`
   - SLOT `END` / TYPE: `TCL-SIZE`

typedef struct Tcl_RegExpIndices

<a name="api-cffi-struct-tcl-reg-exp-info_1A7A82FE7D5F64585BC37924BB72A56B"></a>
### CFFI-STRUCT: `TCL-REG-EXP-INFO`

- SCOPE: EXTERNAL
- SLOTS:
   - SLOT `NSUBS` / TYPE: `TCL-SIZE`
   - SLOT `MATCHES` / TYPE: `TCL-REG-EXP-INDICES-PTR`
   - SLOT `EXTENDSTART` / TYPE: `TCL-SIZE`

typedef struct Tcl_RegExpInfo

<a name="api-cffi-struct-tcl-time_F1DCAB6B5E08BC92452FFD44131CE49F"></a>
### CFFI-STRUCT: `TCL-TIME`

- SCOPE: EXTERNAL
- SLOTS:


<a name="api-cffi-struct-tcl-token_EE4BBE9C916D4845AE6D9F123C1B96AA"></a>
### CFFI-STRUCT: `TCL-TOKEN`

- SCOPE: EXTERNAL
- SLOTS:
   - SLOT `TYPE` / TYPE: `INT`
   - SLOT `START` / TYPE: `(POINTER CHAR)`
   - SLOT `SIZE` / TYPE: `INT`
   - SLOT `NUM-COMPONENTS` / TYPE: `INT`

Tcl_Token

<a name="api-cffi-type-client-data_B82E393B433D7D19C0AD98D0169CDEEE"></a>
### CFFI-TYPE: `CLIENT-DATA`

- SCOPE: INTERNAL
- BASE-TYPE: `:POINTER`


<a name="api-cffi-type-mp-int-ptr_75F8F0E4CE1C7E7F1580B585397898C6"></a>
### CFFI-TYPE: `MP-INT-PTR`

- SCOPE: INTERNAL
- BASE-TYPE: `(:POINTER)`

mp_int

<a name="api-cffi-type-tcl-alert-notifier-proc_06F7E70F10B4187BC8E2EC6D80F6B019"></a>
### CFFI-TYPE: `TCL-ALERT-NOTIFIER-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_AlertNotifierProc) (void *clientData);

<a name="api-cffi-type-tcl-alloc-hash-entry-proc_90FE2BF9B1F14143E784722E19A678EB"></a>
### CFFI-TYPE: `TCL-ALLOC-HASH-ENTRY-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef Tcl_HashEntry * (Tcl_AllocHashEntryProc) (Tcl_HashTable *tablePtr,
	void *keyPtr);

<a name="api-cffi-type-tcl-app-init-proc_5F61D3D06F7D5DB485A59FF14CCD7F5D"></a>
### CFFI-TYPE: `TCL-APP-INIT-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int (Tcl_AppInitProc) (Tcl_Interp *interp);

<a name="api-cffi-type-tcl-argv-info-ptr_332B02F7DEF6AE774CAC7FE28BEA7F29"></a>
### CFFI-TYPE: `TCL-ARGV-INFO-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER (:STRUCT RAW-CFFI-TCL9:TCL-ARGV-INFO))`


<a name="api-cffi-type-tcl-async-handler_4D578FA3BC26377018B1D049BD896FBD"></a>
### CFFI-TYPE: `TCL-ASYNC-HANDLER`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

OPAQUE: Tcl_AsyncHandler

<a name="api-cffi-type-tcl-async-proc_7F7E75FAD957614596AA09237DEA48DF"></a>
### CFFI-TYPE: `TCL-ASYNC-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int (Tcl_AsyncProc) (ClientData clientData, Tcl_Interp *interp, int code);

<a name="api-cffi-type-tcl-channel-proc_2E60B21986B20B97C4771BC57A9B18AC"></a>
### CFFI-TYPE: `TCL-CHANNEL-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_ChannelProc) (ClientData clientData, int mask);

<a name="api-cffi-type-tcl-channel-type-ptr_614EB9E552AC092B9F84F6DBFD43FABA"></a>
### CFFI-TYPE: `TCL-CHANNEL-TYPE-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

Tcl_ChannelType*

<a name="api-cffi-type-tcl-channel-type-version_B3BAA7B61FDA7654795D6D919B46D211"></a>
### CFFI-TYPE: `TCL-CHANNEL-TYPE-VERSION`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

OPAQUE: Tcl_ChannelTypeVersion

<a name="api-cffi-type-tcl-channel_3E299AD1027BFE1DD33DBD79064B008F"></a>
### CFFI-TYPE: `TCL-CHANNEL`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

OPAQUE: Tcl_Channel

<a name="api-cffi-type-tcl-close-proc_6AA00732812944CB5605B42E13C0FE71"></a>
### CFFI-TYPE: `TCL-CLOSE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_CloseProc) (ClientData data);

<a name="api-cffi-type-tcl-cmd-delete-proc_0EAB9B04DF411EEAE515AF8BAF9D1FFC"></a>
### CFFI-TYPE: `TCL-CMD-DELETE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_CmdDeleteProc) (ClientData clientData);

<a name="api-cffi-type-tcl-cmd-info-ptr_C0133C94D2ABA9C520C5ACBF38F04673"></a>
### CFFI-TYPE: `TCL-CMD-INFO-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER (:STRUCT RAW-CFFI-TCL9:TCL-CMD-INFO))`

Tcl_CmdInfo*

<a name="api-cffi-type-tcl-cmd-obj-trace-delete-proc_B0AAB9D94F6D2CD25BD8E5CDCDDBBD50"></a>
### CFFI-TYPE: `TCL-CMD-OBJ-TRACE-DELETE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_CmdObjTraceDeleteProc) (ClientData clientData);

<a name="api-cffi-type-tcl-cmd-obj-trace-proc2_C8E6E3F5B1E33588F4BBA7D655C5E65D"></a>
### CFFI-TYPE: `TCL-CMD-OBJ-TRACE-PROC2`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int (Tcl_CmdObjTraceProc2) (void *clientData, Tcl_Interp *interp,
	Tcl_Size level, const char *command, Tcl_Command commandInfo, Tcl_Size objc,
	struct Tcl_Obj *const *objv);

<a name="api-cffi-type-tcl-cmd-obj-trace-proc_F0A10C289C903B80C2FAA56A8176E9A1"></a>
### CFFI-TYPE: `TCL-CMD-OBJ-TRACE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int (Tcl_CmdObjTraceProc) (ClientData clientData, Tcl_Interp *interp,
	int level, const char *command, Tcl_Command commandInfo, int objc,
	struct Tcl_Obj *const *objv);


<a name="api-cffi-type-tcl-cmd-proc_54E23DE102094C41FADC01D894322373"></a>
### CFFI-TYPE: `TCL-CMD-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int (Tcl_CmdProc) (ClientData clientData, Tcl_Interp *interp,
	int argc, CONST84 char *argv[]);

<a name="api-cffi-type-tcl-cmd-trace-proc_9A1C87136E00E8EA0D23F1CFDDA5202E"></a>
### CFFI-TYPE: `TCL-CMD-TRACE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_CmdTraceProc) (ClientData clientData, Tcl_Interp *interp,
	int level, char *command, Tcl_CmdProc *proc,
	ClientData cmdClientData, int argc, char *argv[]);

<a name="api-cffi-type-tcl-command-trace-proc_286F734F7BC9AE8D6FDA1226BC6DFBCF"></a>
### CFFI-TYPE: `TCL-COMMAND-TRACE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_CommandTraceProc) (void *clientData, Tcl_Interp *interp,
	const char *oldName, const char *newName, int flags);

<a name="api-cffi-type-tcl-command_EE2A410BE8322F9CDA8FA33248DD2799"></a>
### CFFI-TYPE: `TCL-COMMAND`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

OPAQUE: Tcl_Command

<a name="api-cffi-type-tcl-compare-hash-keys-proc_3628D4D3761499621530399E83167577"></a>
### CFFI-TYPE: `TCL-COMPARE-HASH-KEYS-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int (Tcl_CompareHashKeysProc) (void *keyPtr, Tcl_HashEntry *hPtr);

<a name="api-cffi-type-tcl-condition-ptr_91CB3BAFEC64201E60F370716F3F7225"></a>
### CFFI-TYPE: `TCL-CONDITION-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

OPAQUE: Tcl_Condition*

<a name="api-cffi-type-tcl-config-ptr_0FFEA609498947724B25E0CFB3D25FEA"></a>
### CFFI-TYPE: `TCL-CONFIG-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER (:STRUCT RAW-CFFI-TCL9:TCL-CONFIG))`


<a name="api-cffi-type-tcl-create-file-handler-proc_6A25ABD073DB14F280A2D3CE890979AA"></a>
### CFFI-TYPE: `TCL-CREATE-FILE-HANDLER-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_CreateFileHandlerProc) (int fd, int mask, Tcl_FileProc *proc,
	void *clientData);

<a name="api-cffi-type-tcl-d-string-ptr_644CA7C165BEE677C8DDBE5B51C1C4D0"></a>
### CFFI-TYPE: `TCL-D-STRING-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

Tcl_DString*

<a name="api-cffi-type-tcl-delete-file-handler-proc_3D565EC0B6DB9D27DD45AFB09EB51AE2"></a>
### CFFI-TYPE: `TCL-DELETE-FILE-HANDLER-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_DeleteFileHandlerProc) (int fd);

<a name="api-cffi-type-tcl-dict-ptr_6EF14458D85D213EE83108FF7DC174D2"></a>
### CFFI-TYPE: `TCL-DICT-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

OPAQUE: Tcl_Dict*

<a name="api-cffi-type-tcl-dict-search-ptr_62B6A0A16CB5FB6D1250F01E89BBED8B"></a>
### CFFI-TYPE: `TCL-DICT-SEARCH-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER (:STRUCT RAW-CFFI-TCL9:TCL-DICT-SEARCH))`

Tcl_DictSearch*

<a name="api-cffi-type-tcl-dict_C60AF2D7D221F9F8DBFAE4D9F9D7FC2B"></a>
### CFFI-TYPE: `TCL-DICT`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

OPAQUE: Tcl_Dict

<a name="api-cffi-type-tcl-driver-block-mode-proc_BA8210442D5A316835EC06D3FEBFA182"></a>
### CFFI-TYPE: `TCL-DRIVER-BLOCK-MODE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int	(Tcl_DriverBlockModeProc) (ClientData instanceData, int mode);

<a name="api-cffi-type-tcl-driver-close-proc_D687AA52DF7B01F3B1837368B9F74501"></a>
### CFFI-TYPE: `TCL-DRIVER-CLOSE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`


<a name="api-cffi-type-tcl-driver-close2-proc_1CC6E4F6532304B38524AA59F0BE3A92"></a>
### CFFI-TYPE: `TCL-DRIVER-CLOSE2-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int	(Tcl_DriverClose2Proc) (ClientData instanceData, Tcl_Interp *interp, int flags);

<a name="api-cffi-type-tcl-driver-flush-proc_4EE63572B58A4A8D0D02544DC49E80CE"></a>
### CFFI-TYPE: `TCL-DRIVER-FLUSH-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int	(Tcl_DriverFlushProc) (ClientData instanceData);

<a name="api-cffi-type-tcl-driver-get-handle-proc_5EF079A782AF3DD787F516D5A0A6FA24"></a>
### CFFI-TYPE: `TCL-DRIVER-GET-HANDLE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int	(Tcl_DriverGetHandleProc)
 (ClientData instanceData, int direction, ClientData *handlePtr);

<a name="api-cffi-type-tcl-driver-get-option-proc_871575F529691B02A37B1F53FA4E060F"></a>
### CFFI-TYPE: `TCL-DRIVER-GET-OPTION-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int	(Tcl_DriverGetOptionProc)
(ClientData instanceData, Tcl_Interp *interp, CONST84 char *optionName, Tcl_DString *dsPtr);

<a name="api-cffi-type-tcl-driver-handler-proc_E1AEEE2EFFB5FA59FA57C111A3F749D2"></a>
### CFFI-TYPE: `TCL-DRIVER-HANDLER-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int	(Tcl_DriverHandlerProc)
 (ClientData instanceData, int interestMask);

<a name="api-cffi-type-tcl-driver-input-proc_2DFC751CA82FB3983A5EC1BA3102256E"></a>
### CFFI-TYPE: `TCL-DRIVER-INPUT-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int	(Tcl_DriverInputProc) (ClientData instanceData, char *buf, int toRead, int *errorCodePtr);

<a name="api-cffi-type-tcl-driver-output-proc_6351317993DE30692E1EC3808F29347A"></a>
### CFFI-TYPE: `TCL-DRIVER-OUTPUT-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int	(Tcl_DriverOutputProc) (ClientData instanceData, CONST84 char *buf, int toWrite, int *errorCodePtr);

<a name="api-cffi-type-tcl-driver-seek-proc_B6A8F3A10C323AEE784BFEB31138B7C2"></a>
### CFFI-TYPE: `TCL-DRIVER-SEEK-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int	(Tcl_DriverSeekProc)
(ClientData instanceData, long offset, int mode, int *errorCodePtr);

<a name="api-cffi-type-tcl-driver-set-option-proc_3E2E7330FB2E31B3F3EB104BFD24CC7B"></a>
### CFFI-TYPE: `TCL-DRIVER-SET-OPTION-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int	(Tcl_DriverSetOptionProc)
(ClientData instanceData, Tcl_Interp *interp, const char *optionName, const char *value);

<a name="api-cffi-type-tcl-driver-thread-action-proc_98E9D2C88D9329CB04EA08F5F74C63A3"></a>
### CFFI-TYPE: `TCL-DRIVER-THREAD-ACTION-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void	(Tcl_DriverThreadActionProc) (ClientData instanceData, int action);

<a name="api-cffi-type-tcl-driver-truncate-proc_B5FCA46D4C6C2940A8FB7A3B92D185ED"></a>
### CFFI-TYPE: `TCL-DRIVER-TRUNCATE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int	(Tcl_DriverTruncateProc) (ClientData instanceData, Tcl_WideInt length);

<a name="api-cffi-type-tcl-driver-watch-proc_AA79999E8A61DD6355AEA932EBA6B028"></a>
### CFFI-TYPE: `TCL-DRIVER-WATCH-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void	(Tcl_DriverWatchProc)
 (ClientData instanceData, int mask);

<a name="api-cffi-type-tcl-driver-wide-seek-proc_CB82CF5131C20FF9BCCDFEC3B1C9524A"></a>
### CFFI-TYPE: `TCL-DRIVER-WIDE-SEEK-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef Tcl_WideInt (Tcl_DriverWideSeekProc)
 (ClientData instanceData, Tcl_WideInt offset, int mode, int *errorCodePtr);

<a name="api-cffi-type-tcl-dup-internal-rep-proc_1483E8D164B75FC42E9D4D381A7EA7CD"></a>
### CFFI-TYPE: `TCL-DUP-INTERNAL-REP-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_DupInternalRepProc) (struct Tcl_Obj *srcPtr, struct Tcl_Obj *dupPtr);

<a name="api-cffi-type-tcl-encoding-convert-proc_993DA888A0F45530E8C94AB8AD242563"></a>
### CFFI-TYPE: `TCL-ENCODING-CONVERT-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int (Tcl_EncodingConvertProc) (void *clientData, const char *src,
	int srcLen, int flags, Tcl_EncodingState *statePtr, char *dst,
	int dstLen, int *srcReadPtr, int *dstWrotePtr, int *dstCharsPtr);

<a name="api-cffi-type-tcl-encoding-free-proc_AEE6B12C64BB1BB8E5D7F158D3E28DC0"></a>
### CFFI-TYPE: `TCL-ENCODING-FREE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_EncodingFreeProc) (void *clientData);

<a name="api-cffi-type-tcl-encoding-ptr_8D2946E891BB8435B76C04FCACC5006D"></a>
### CFFI-TYPE: `TCL-ENCODING-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

OPAQUE: Tcl_Encoding*

<a name="api-cffi-type-tcl-encoding-state-ptr_8CFE670CCAC042141110A7243172C82A"></a>
### CFFI-TYPE: `TCL-ENCODING-STATE-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

OPAQUE: Tcl_EncodingState*

<a name="api-cffi-type-tcl-encoding-type-ptr_E52BE0959F54395CEA83D29E2B1215FC"></a>
### CFFI-TYPE: `TCL-ENCODING-TYPE-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

Tcl_EncodingType*

<a name="api-cffi-type-tcl-encoding_CE0D69468E6978A947920029677BCA07"></a>
### CFFI-TYPE: `TCL-ENCODING`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

OPAQUE: Tcl_Encoding

<a name="api-cffi-type-tcl-event-check-proc_5A1C49CD345911E1C2152FAD0F5E42FC"></a>
### CFFI-TYPE: `TCL-EVENT-CHECK-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_EventCheckProc) (ClientData clientData, int flags);

<a name="api-cffi-type-tcl-event-delete-proc_F4C1D465FFAE11645DA3C9C11C577BE9"></a>
### CFFI-TYPE: `TCL-EVENT-DELETE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int (Tcl_EventDeleteProc) (Tcl_Event *evPtr, ClientData clientData);

<a name="api-cffi-type-tcl-event-proc_E647B16C2F7A5A783DDF5C1EB72F9A8B"></a>
### CFFI-TYPE: `TCL-EVENT-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int (Tcl_EventProc) (Tcl_Event *evPtr, int flags);

<a name="api-cffi-type-tcl-event-ptr_53E93ED4B957DEBCB42F2FFDEC258C5A"></a>
### CFFI-TYPE: `TCL-EVENT-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER (:STRUCT RAW-CFFI-TCL9:TCL-EVENT))`

Tcl_Event*

<a name="api-cffi-type-tcl-event-setup-proc_B52EBF0A8A2820C07D37B96524E05F22"></a>
### CFFI-TYPE: `TCL-EVENT-SETUP-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_EventSetupProc) (ClientData clientData, int flags);

<a name="api-cffi-type-tcl-exit-proc_41323AFA5B523ED5158489C4F5D0506E"></a>
### CFFI-TYPE: `TCL-EXIT-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_ExitProc) (ClientData clientData);

<a name="api-cffi-type-tcl-file-free-proc_3D8C553E93DE7B61F490D971A1F602A4"></a>
### CFFI-TYPE: `TCL-FILE-FREE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_FileFreeProc) (void *clientData);

<a name="api-cffi-type-tcl-file-proc_C99A71B1933C119AB1B0E727E34263CD"></a>
### CFFI-TYPE: `TCL-FILE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_FileProc) (ClientData clientData, int mask);

<a name="api-cffi-type-tcl-filesystem-ptr_B28D7757A247BD243BD3317D4A687A73"></a>
### CFFI-TYPE: `TCL-FILESYSTEM-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

Tcl_Filesystem*

<a name="api-cffi-type-tcl-finalize-notifier-proc_DAE731C07FEB8762C390A6554DADD562"></a>
### CFFI-TYPE: `TCL-FINALIZE-NOTIFIER-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_FinalizeNotifierProc) (void *clientData);

<a name="api-cffi-type-tcl-free-hash-entry-proc_F99C24559EF57C492FED94FBA69A4AA5"></a>
### CFFI-TYPE: `TCL-FREE-HASH-ENTRY-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_FreeHashEntryProc) (Tcl_HashEntry *hPtr);

<a name="api-cffi-type-tcl-free-internal-rep-proc_57D1BDCC7E4D4B640494C157ACDB4455"></a>
### CFFI-TYPE: `TCL-FREE-INTERNAL-REP-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_FreeInternalRepProc) (struct Tcl_Obj *objPtr);

<a name="api-cffi-type-tcl-free-proc_54950AB7FE0B5B244ECCDC86D07B49D1"></a>
### CFFI-TYPE: `TCL-FREE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_FreeProc) (char *blockPtr);

<a name="api-cffi-type-tcl-fs-access-proc_6BC4661F1E73788043DF1F4027AAA905"></a>
### CFFI-TYPE: `TCL-FS-ACCESS-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef int (Tcl_FSAccessProc) (Tcl_Obj *pathPtr, int mode);

<a name="api-cffi-type-tcl-fs-chdir-proc_C3175408CEADA90ABF6F1B3919A36C91"></a>
### CFFI-TYPE: `TCL-FS-CHDIR-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef int (Tcl_FSChdirProc) (Tcl_Obj *pathPtr);

<a name="api-cffi-type-tcl-fs-copy-directory-proc_24DDA17C921DB7BE2AD74E7570483ACB"></a>
### CFFI-TYPE: `TCL-FS-COPY-DIRECTORY-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef int (Tcl_FSCopyDirectoryProc) (Tcl_Obj *srcPathPtr,
	Tcl_Obj *destPathPtr, Tcl_Obj **errorPtr);

<a name="api-cffi-type-tcl-fs-copy-file-proc_A445C1376F04B2D460EE61A9288F6832"></a>
### CFFI-TYPE: `TCL-FS-COPY-FILE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef int (Tcl_FSCopyFileProc) (Tcl_Obj *srcPathPtr, Tcl_Obj *destPathPtr);

<a name="api-cffi-type-tcl-fs-create-directory-proc_E3E8E25E0BCCED99FB4101BAC5F83463"></a>
### CFFI-TYPE: `TCL-FS-CREATE-DIRECTORY-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef int (Tcl_FSCreateDirectoryProc) (Tcl_Obj *pathPtr);

<a name="api-cffi-type-tcl-fs-create-internal-rep-proc_344A834D38EF71930466FD23ADD1D05C"></a>
### CFFI-TYPE: `TCL-FS-CREATE-INTERNAL-REP-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef void *(Tcl_FSCreateInternalRepProc) (Tcl_Obj *pathPtr);

<a name="api-cffi-type-tcl-fs-delete-file-proc_4C2FD4C8F859E7A1D23DEBF4FD46D969"></a>
### CFFI-TYPE: `TCL-FS-DELETE-FILE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef int (Tcl_FSDeleteFileProc) (Tcl_Obj *pathPtr);

<a name="api-cffi-type-tcl-fs-dup-internal-rep-proc_8B138379796F944C01C31974660E59F0"></a>
### CFFI-TYPE: `TCL-FS-DUP-INTERNAL-REP-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef void *(Tcl_FSDupInternalRepProc) (void *clientData);

<a name="api-cffi-type-tcl-fs-file-attr-strings-proc_331FDDD2855B7705A7254FF625A4620E"></a>
### CFFI-TYPE: `TCL-FS-FILE-ATTR-STRINGS-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef const char *const * (Tcl_FSFileAttrStringsProc) (Tcl_Obj *pathPtr,
	Tcl_Obj **objPtrRef);

<a name="api-cffi-type-tcl-fs-file-attrs-get-proc_0821A32CFADA0A0CBEE738488C626362"></a>
### CFFI-TYPE: `TCL-FS-FILE-ATTRS-GET-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef int (Tcl_FSFileAttrsGetProc) (Tcl_Interp *interp, int index,
	Tcl_Obj *pathPtr, Tcl_Obj **objPtrRef);

<a name="api-cffi-type-tcl-fs-file-attrs-set-proc_B4B4BC7AFE449C555058F2A30A70B31A"></a>
### CFFI-TYPE: `TCL-FS-FILE-ATTRS-SET-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef int (Tcl_FSFileAttrsSetProc) (Tcl_Interp *interp, int index,
	Tcl_Obj *pathPtr, Tcl_Obj *objPtr);

<a name="api-cffi-type-tcl-fs-filesystem-path-type-proc_38B99128ACCBAE172CEA25B4D74CC2FE"></a>
### CFFI-TYPE: `TCL-FS-FILESYSTEM-PATH-TYPE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef Tcl_Obj * (Tcl_FSFilesystemPathTypeProc) (Tcl_Obj *pathPtr);

<a name="api-cffi-type-tcl-fs-filesystem-separator-proc_A24601BE1E1591D23DF3A27A24671495"></a>
### CFFI-TYPE: `TCL-FS-FILESYSTEM-SEPARATOR-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef Tcl_Obj * (Tcl_FSFilesystemSeparatorProc) (Tcl_Obj *pathPtr);

<a name="api-cffi-type-tcl-fs-free-internal-rep-proc_B48B9F184482B73B0752C1C88BA0D0D0"></a>
### CFFI-TYPE: `TCL-FS-FREE-INTERNAL-REP-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

#define Tcl_FSFreeInternalRepProc Tcl_FreeProc

<a name="api-cffi-type-tcl-fs-get-cwd-proc_E7EAA02B1873CA41AC42C18DEB1A7514"></a>
### CFFI-TYPE: `TCL-FS-GET-CWD-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef Tcl_Obj * (Tcl_FSGetCwdProc) (Tcl_Interp *interp);

<a name="api-cffi-type-tcl-fs-internal-to-normalized-proc_416C62532373B384F2C504CE40CE68C2"></a>
### CFFI-TYPE: `TCL-FS-INTERNAL-TO-NORMALIZED-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef Tcl_Obj * (Tcl_FSInternalToNormalizedProc) (void *clientData);

<a name="api-cffi-type-tcl-fs-link-proc_4E1F81B9FB5659AAA215D6C9D6E513A2"></a>
### CFFI-TYPE: `TCL-FS-LINK-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef Tcl_Obj * (Tcl_FSLinkProc) (Tcl_Obj *pathPtr, Tcl_Obj *toPtr,
	int linkType);

<a name="api-cffi-type-tcl-fs-list-volumes-proc_8D0528692E4C8C3A872118C7854C5479"></a>
### CFFI-TYPE: `TCL-FS-LIST-VOLUMES-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef Tcl_Obj * (Tcl_FSListVolumesProc) (void);

<a name="api-cffi-type-tcl-fs-load-file-proc_8E9646A375C03A3C62058AD8F48CAE3E"></a>
### CFFI-TYPE: `TCL-FS-LOAD-FILE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef int (Tcl_FSLoadFileProc) (Tcl_Interp *interp, Tcl_Obj *pathPtr,
	Tcl_LoadHandle *handlePtr, Tcl_FSUnloadFileProc **unloadProcPtr);

<a name="api-cffi-type-tcl-fs-lstat-proc_3A95C36147D5F48AC7480B740DDF207A"></a>
### CFFI-TYPE: `TCL-FS-LSTAT-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef int (Tcl_FSLstatProc) (Tcl_Obj *pathPtr, Tcl_StatBuf *buf);

<a name="api-cffi-type-tcl-fs-match-in-directory-proc_B4271EA5DE2C2D1A5723D229145B99C7"></a>
### CFFI-TYPE: `TCL-FS-MATCH-IN-DIRECTORY-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef int (Tcl_FSMatchInDirectoryProc) (Tcl_Interp *interp, Tcl_Obj *result,
	Tcl_Obj *pathPtr, const char *pattern, Tcl_GlobTypeData *types);

<a name="api-cffi-type-tcl-fs-normalize-path-proc_719F26FAF0FCEA6A67B5A580891BD469"></a>
### CFFI-TYPE: `TCL-FS-NORMALIZE-PATH-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef int (Tcl_FSNormalizePathProc) (Tcl_Interp *interp, Tcl_Obj *pathPtr,
	int nextCheckpoint);

<a name="api-cffi-type-tcl-fs-open-file-channel-proc_F7B14A9DF1BD1B5F85A10BE82D54BAAF"></a>
### CFFI-TYPE: `TCL-FS-OPEN-FILE-CHANNEL-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef Tcl_Channel (Tcl_FSOpenFileChannelProc) (Tcl_Interp *interp,
	Tcl_Obj *pathPtr, int mode, int permissions);

<a name="api-cffi-type-tcl-fs-path-in-filesystem-proc_192176CFC02D570B61241CDF829C818B"></a>
### CFFI-TYPE: `TCL-FS-PATH-IN-FILESYSTEM-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef int (Tcl_FSPathInFilesystemProc) (Tcl_Obj *pathPtr,
	void **clientDataPtr);

<a name="api-cffi-type-tcl-fs-remove-directory-proc_491F7B3538FAF3295030851BD8DE7E90"></a>
### CFFI-TYPE: `TCL-FS-REMOVE-DIRECTORY-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef int (Tcl_FSRemoveDirectoryProc) (Tcl_Obj *pathPtr, int recursive,
	Tcl_Obj **errorPtr);

<a name="api-cffi-type-tcl-fs-rename-file-proc_6CC65A9653A0859E94B3078975575F79"></a>
### CFFI-TYPE: `TCL-FS-RENAME-FILE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef int (Tcl_FSRenameFileProc) (Tcl_Obj *srcPathPtr, Tcl_Obj *destPathPtr);

<a name="api-cffi-type-tcl-fs-stat-proc_B31A247EFA3115B96195DDFC9C09ACE7"></a>
### CFFI-TYPE: `TCL-FS-STAT-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef int (Tcl_FSStatProc) (Tcl_Obj *pathPtr, Tcl_StatBuf *buf);

<a name="api-cffi-type-tcl-fs-unload-file-proc_B87B7A1C98E4C8BF939337000FE73DFB"></a>
### CFFI-TYPE: `TCL-FS-UNLOAD-FILE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_FSUnloadFileProc) (Tcl_LoadHandle loadHandle);

<a name="api-cffi-type-tcl-fs-unload-file-proc_B87B7A1C98E4C8BF939337000FE73DFB"></a>
### CFFI-TYPE: `TCL-FS-UNLOAD-FILE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef void (Tcl_FSUnloadFileProc) (Tcl_LoadHandle loadHandle);

<a name="api-cffi-type-tcl-fs-utime-proc_2E0DB820707053C82EC59045779C3B56"></a>
### CFFI-TYPE: `TCL-FS-UTIME-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef int (Tcl_FSUtimeProc) (Tcl_Obj *pathPtr, struct utimbuf *tval);

<a name="api-cffi-type-tcl-fs-version_F0F331CFB82EA73B361696253D1BBC68"></a>
### CFFI-TYPE: `TCL-FS-VERSION`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`


<a name="api-cffi-type-tcl-get-time-proc_73F65C70135736CEAD2568781089A1FE"></a>
### CFFI-TYPE: `TCL-GET-TIME-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_GetTimeProc)   (Tcl_Time *timebuf, ClientData clientData);

<a name="api-cffi-type-tcl-glob-type-data-ptr_1CB187BDD5DE231779CFFCFCB6E5F6E9"></a>
### CFFI-TYPE: `TCL-GLOB-TYPE-DATA-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER (:STRUCT RAW-CFFI-TCL9:TCL-GLOB-TYPE-DATA))`


<a name="api-cffi-type-tcl-hash-entry-ptr_8A918A65D5F3FB9B6A31DF32F63259D8"></a>
### CFFI-TYPE: `TCL-HASH-ENTRY-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER (:STRUCT RAW-CFFI-TCL9:TCL-HASH-ENTRY))`

Tcl_HashEntry*

<a name="api-cffi-type-tcl-hash-key-proc_E869E0765854CD3E4E330F03B0520E1C"></a>
### CFFI-TYPE: `TCL-HASH-KEY-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef TCL_HASH_TYPE (Tcl_HashKeyProc) (Tcl_HashTable *tablePtr, void *keyPtr);

<a name="api-cffi-type-tcl-hash-key-type-ptr_682FE13083B33EF59E22DE13D47F3582"></a>
### CFFI-TYPE: `TCL-HASH-KEY-TYPE-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER (:STRUCT RAW-CFFI-TCL9:TCL-HASH-KEY-TYPE))`

Tcl_HashKeyType*

<a name="api-cffi-type-tcl-hash-search-ptr_4430C5037FCB0D69DB977B604D58A9ED"></a>
### CFFI-TYPE: `TCL-HASH-SEARCH-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER (:STRUCT RAW-CFFI-TCL9:TCL-HASH-SEARCH))`

Tcl_HashSearch*

<a name="api-cffi-type-tcl-hash-table-ptr_0C7B796FBE23B42F5FA10332D7C10949"></a>
### CFFI-TYPE: `TCL-HASH-TABLE-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER (:STRUCT RAW-CFFI-TCL9:TCL-HASH-TABLE))`

Tcl_HashTable*

<a name="api-cffi-type-tcl-hash-type_BAEF3082902670CBD8CFE59D7D37A813"></a>
### CFFI-TYPE: `TCL-HASH-TYPE`

- SCOPE: EXTERNAL
- BASE-TYPE: `:SIZE`


<a name="api-cffi-type-tcl-idle-proc_D77E01E100B8A8874FBB3AB07737D428"></a>
### CFFI-TYPE: `TCL-IDLE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_IdleProc) (ClientData clientData);

<a name="api-cffi-type-tcl-init-notifier-proc_468D6D696027DE1BF21E5C5CB82872E8"></a>
### CFFI-TYPE: `TCL-INIT-NOTIFIER-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void *(Tcl_InitNotifierProc) (void);

<a name="api-cffi-type-tcl-interp-delete-proc_8CEEACF87C243922B3EBDE1DA379CA88"></a>
### CFFI-TYPE: `TCL-INTERP-DELETE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_InterpDeleteProc) (ClientData clientData, Tcl_Interp
*interp);

<a name="api-cffi-type-tcl-interp-ptr_65AD6F9977BABAE12E24BE7C0A631918"></a>
### CFFI-TYPE: `TCL-INTERP-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

OPAQUE: Tcl_Interp*

<a name="api-cffi-type-tcl-interp-state_761A7BDC21AB9FBE5EBEE1CB9B62E0F5"></a>
### CFFI-TYPE: `TCL-INTERP-STATE`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

OPAQUE: Tcl_InterpState

<a name="api-cffi-type-tcl-library-init-proc_F28694408BEBEE8601D48F7ECB3461F1"></a>
### CFFI-TYPE: `TCL-LIBRARY-INIT-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int (Tcl_LibraryInitProc) (Tcl_Interp *interp);

<a name="api-cffi-type-tcl-library-unload-proc_3C35ACD26065AECBE56F37E45A307380"></a>
### CFFI-TYPE: `TCL-LIBRARY-UNLOAD-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int (Tcl_LibraryUnloadProc) (Tcl_Interp *interp, int flags);

<a name="api-cffi-type-tcl-limit-handler-delete-proc_F047590C6B758EF6DF96FBF97718826C"></a>
### CFFI-TYPE: `TCL-LIMIT-HANDLER-DELETE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_LimitHandlerDeleteProc) (ClientData clientData);

<a name="api-cffi-type-tcl-limit-handler-proc_5B52436C2880C1000B0B82FD20FA0E3A"></a>
### CFFI-TYPE: `TCL-LIMIT-HANDLER-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_LimitHandlerProc) (ClientData clientData, Tcl_Interp *interp);

<a name="api-cffi-type-tcl-load-handle-ptr_05AD3DA980F88240802120CB41BB6CCD"></a>
### CFFI-TYPE: `TCL-LOAD-HANDLE-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER RAW-CFFI-TCL9:TCL-LOAD-HANDLE)`

OPAQUE: Tcl_LoadHandle*

<a name="api-cffi-type-tcl-load-handle_CE4F65D0671E1C0809A4E0EAD6FF42F9"></a>
### CFFI-TYPE: `TCL-LOAD-HANDLE`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

OPAQUE: Tcl_LoadHandle

<a name="api-cffi-type-tcl-main-loop-proc_8905DF0BBE7E7C9F2F16FF2D5389A0F8"></a>
### CFFI-TYPE: `TCL-MAIN-LOOP-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_MainLoopProc) (void);

<a name="api-cffi-type-tcl-math-proc_D493AA18709C9060C00DDA55A13A701D"></a>
### CFFI-TYPE: `TCL-MATH-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int (Tcl_MathProc) (ClientData clientData, Tcl_Interp *interp,
	Tcl_Value *args, Tcl_Value *resultPtr);

<a name="api-cffi-type-tcl-mutex-ptr_0EAA12FD58EB7B221F4473214BCB9EFC"></a>
### CFFI-TYPE: `TCL-MUTEX-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

OPAQUE: Tcl_Mutex*

<a name="api-cffi-type-tcl-namespace-delete-proc_645A95FB36DE05FBCACC7B7831E48F04"></a>
### CFFI-TYPE: `TCL-NAMESPACE-DELETE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_NamespaceDeleteProc) (ClientData clientData);

<a name="api-cffi-type-tcl-namespace-ptr_9185B329F7363310D8A0006CDDD1277D"></a>
### CFFI-TYPE: `TCL-NAMESPACE-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER (:STRUCT RAW-CFFI-TCL9:TCL-NAMESPACE))`

Tcl_Namespace*

<a name="api-cffi-type-tcl-notifier-procs-ptr_FE3A668A88F96CE9C3D5B5246A895558"></a>
### CFFI-TYPE: `TCL-NOTIFIER-PROCS-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

Tcl_NotifierProcs*

<a name="api-cffi-type-tcl-nr-post-proc_D25C193060D35B7E6D12305A3FDC2B9E"></a>
### CFFI-TYPE: `TCL-NR-POST-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int (Tcl_NRPostProc) (ClientData data[], Tcl_Interp *interp, int result);

<a name="api-cffi-type-tcl-obj-cmd-proc2_6D6331D23D0F6D8145D655629FACCA0F"></a>
### CFFI-TYPE: `TCL-OBJ-CMD-PROC2`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int (Tcl_ObjCmdProc2) (void *clientData, Tcl_Interp *interp,
	Tcl_Size objc, struct Tcl_Obj *const *objv);

<a name="api-cffi-type-tcl-obj-cmd-proc_9CC44ED2827011D440997670860C6FD6"></a>
### CFFI-TYPE: `TCL-OBJ-CMD-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int (Tcl_ObjCmdProc) (ClientData clientData, Tcl_Interp *interp,
	int objc, struct Tcl_Obj *const *objv);

<a name="api-cffi-type-tcl-obj-internal-rep-ptr_118D2C106EDD116C7093ED598C6C631F"></a>
### CFFI-TYPE: `TCL-OBJ-INTERNAL-REP-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER (:UNION RAW-CFFI-TCL9:TCL-OBJ-INTERNAL-REP))`


<a name="api-cffi-type-tcl-obj-ptr_16AEDB4D44EF9B33DB378BF37750610D"></a>
### CFFI-TYPE: `TCL-OBJ-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER (:STRUCT RAW-CFFI-TCL9:TCL-OBJ))`


<a name="api-cffi-type-tcl-obj-type-get-elements_19220EF3966F9FBFB7472E14EC6BD17C"></a>
### CFFI-TYPE: `TCL-OBJ-TYPE-GET-ELEMENTS`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int (Tcl_ObjTypeGetElements) (Tcl_Interp *interp,
	struct Tcl_Obj *listPtr, Tcl_Size *objcptr, struct Tcl_Obj ***objvptr);

<a name="api-cffi-type-tcl-obj-type-in-operator-proc_D76206E799C6EFE9871DD4AE73C096EA"></a>
### CFFI-TYPE: `TCL-OBJ-TYPE-IN-OPERATOR-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int (Tcl_ObjTypeInOperatorProc) (Tcl_Interp *interp,
	struct Tcl_Obj *valueObj, struct Tcl_Obj *listObj, int *boolResult);

<a name="api-cffi-type-tcl-obj-type-index-proc_6D55C4B0FB58BF8A3FC80CEE03962C87"></a>
### CFFI-TYPE: `TCL-OBJ-TYPE-INDEX-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int (Tcl_ObjTypeIndexProc) (Tcl_Interp *interp,
struct Tcl_Obj *listPtr, Tcl_Size index, struct Tcl_Obj** elemObj);

<a name="api-cffi-type-tcl-obj-type-length-proc_359E7C8A89FDE5BE4066B694A3A78012"></a>
### CFFI-TYPE: `TCL-OBJ-TYPE-LENGTH-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef Tcl_Size (Tcl_ObjTypeLengthProc) (struct Tcl_Obj *listPtr);

<a name="api-cffi-type-tcl-obj-type-ptr_706CDD544D8E1080C0DE92BDD9C903D4"></a>
### CFFI-TYPE: `TCL-OBJ-TYPE-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER (:STRUCT RAW-CFFI-TCL9:TCL-OBJ-TYPE))`

Tcl_ObjType*

<a name="api-cffi-type-tcl-obj-type-replace-proc_42047E0254035654497644C973CA9C3C"></a>
### CFFI-TYPE: `TCL-OBJ-TYPE-REPLACE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int (Tcl_ObjTypeReplaceProc) (Tcl_Interp *interp,
	struct Tcl_Obj *listObj, Tcl_Size first, Tcl_Size numToDelete,
	Tcl_Size numToInsert, struct Tcl_Obj *const insertObjs[]);

<a name="api-cffi-type-tcl-obj-type-reverse-proc_E4083DC76FCA5051EDC4DC698316CA59"></a>
### CFFI-TYPE: `TCL-OBJ-TYPE-REVERSE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int (Tcl_ObjTypeReverseProc) (Tcl_Interp *interp,
	struct Tcl_Obj *listPtr, struct Tcl_Obj **newObjPtr);

<a name="api-cffi-type-tcl-obj-type-set-element_9968D413F6E9A10945DD4B81322A9A8C"></a>
### CFFI-TYPE: `TCL-OBJ-TYPE-SET-ELEMENT`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef	struct Tcl_Obj *(Tcl_ObjTypeSetElement) (Tcl_Interp *interp,
	struct Tcl_Obj *listPtr, Tcl_Size indexCount,
	struct Tcl_Obj *const indexArray[], struct Tcl_Obj *valueObj);

<a name="api-cffi-type-tcl-obj-type-slice-proc_12DA327EAC43FD7E3D33BC0F7A8114DD"></a>
### CFFI-TYPE: `TCL-OBJ-TYPE-SLICE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int (Tcl_ObjTypeSliceProc) (Tcl_Interp *interp,
struct Tcl_Obj *listPtr,Tcl_Size fromIdx, Tcl_Size toIdx, struct Tcl_Obj **newObjPtr);

<a name="api-cffi-type-tcl-package-init-proc_8B221263E3FC2C5D2879B946C93CCCAB"></a>
### CFFI-TYPE: `TCL-PACKAGE-INIT-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int (Tcl_PackageInitProc) (Tcl_Interp *interp);

<a name="api-cffi-type-tcl-panic-proc_63BF350550023CE7711BF3B86549A9B1"></a>
### CFFI-TYPE: `TCL-PANIC-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_PanicProc) (const char *format, ...);

<a name="api-cffi-type-tcl-parse-ptr_8F890C3CDCFFCCB5DBBC16ECA8955F6B"></a>
### CFFI-TYPE: `TCL-PARSE-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

Tcl_Parse*

<a name="api-cffi-type-tcl-pid-ptr_C48B17834B60C71CED7ACB8D47D2B018"></a>
### CFFI-TYPE: `TCL-PID-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER RAW-CFFI-TCL9:TCL-PID)`

OPAQUE: Tcl_Pid*

<a name="api-cffi-type-tcl-pid_F94F78179FD897EF2E2CAED7041B57F0"></a>
### CFFI-TYPE: `TCL-PID`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

OPAQUE: Tcl_Pid

<a name="api-cffi-type-tcl-reg-exp-indices-ptr_E0EA8060B164865832C35F794815A754"></a>
### CFFI-TYPE: `TCL-REG-EXP-INDICES-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER (:STRUCT RAW-CFFI-TCL9:TCL-REG-EXP-INDICES))`


<a name="api-cffi-type-tcl-reg-exp-info-ptr_8C7DF9E0FA11C75BC78C16A034862812"></a>
### CFFI-TYPE: `TCL-REG-EXP-INFO-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER (:STRUCT RAW-CFFI-TCL9:TCL-REG-EXP-INFO))`


<a name="api-cffi-type-tcl-reg-exp_9B3237079576349B792C6B450C8096FF"></a>
### CFFI-TYPE: `TCL-REG-EXP`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

OPAQUE: Tcl_RegExp

<a name="api-cffi-type-tcl-saved-result-ptr_0A96401A4B0C310296943F5B6DDF013A"></a>
### CFFI-TYPE: `TCL-SAVED-RESULT-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

TODO struct Tcl_SavedResult

<a name="api-cffi-type-tcl-scale-time-proc_B421E3CC31034E610CB35AC7CD854412"></a>
### CFFI-TYPE: `TCL-SCALE-TIME-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_ScaleTimeProc) (Tcl_Time *timebuf, ClientData clientData);

<a name="api-cffi-type-tcl-service-mode-hook-proc_F007F8C8EDC805F893DCC4A0CFA54026"></a>
### CFFI-TYPE: `TCL-SERVICE-MODE-HOOK-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_ServiceModeHookProc) (int mode);

<a name="api-cffi-type-tcl-set-from-any-proc_3A48C1B3E32E5C9FBFA921EB1A91EEB9"></a>
### CFFI-TYPE: `TCL-SET-FROM-ANY-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef int (Tcl_SetFromAnyProc) (Tcl_Interp *interp, struct Tcl_Obj *objPtr);

<a name="api-cffi-type-tcl-set-timer-proc_A26A5EEECDCD07D30C28695AA70D2781"></a>
### CFFI-TYPE: `TCL-SET-TIMER-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef void (Tcl_SetTimerProc) (const Tcl_Time *timePtr);

<a name="api-cffi-type-tcl-size-ptr_CFCE6B802932E1E820C885DBD5D5F573"></a>
### CFFI-TYPE: `TCL-SIZE-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER RAW-CFFI-TCL9:TCL-SIZE)`


<a name="api-cffi-type-tcl-size_8FD21B10CA520889D5078CF1058E0837"></a>
### CFFI-TYPE: `TCL-SIZE`

- SCOPE: EXTERNAL
- BASE-TYPE: `:PTRDIFF`


<a name="api-cffi-type-tcl-stat-buf-ptr_A624A3381DA93A439FA8B05EB6C848C7"></a>
### CFFI-TYPE: `TCL-STAT-BUF-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

TODO: Tcl_StatBuf* ?

<a name="api-cffi-type-tcl-tcp-accept-proc_94451C19A7306D4BE89FD9EF61747CB2"></a>
### CFFI-TYPE: `TCL-TCP-ACCEPT-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_TcpAcceptProc) (ClientData callbackData, Tcl_Channel chan, char *address, int port);

<a name="api-cffi-type-tcl-thread-create-proc_3C5E6C870EC82BF43ECEF84DB8CD9EE6"></a>
### CFFI-TYPE: `TCL-THREAD-CREATE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

#if defined _WIN32
typedef unsigned (__stdcall Tcl_ThreadCreateProc) (ClientData clientData);
#else
typedef void (Tcl_ThreadCreateProc) (ClientData clientData);
#endif

<a name="api-cffi-type-tcl-thread-data-key-ptr_8E8355EC8692C3831A9847760B1BFC0B"></a>
### CFFI-TYPE: `TCL-THREAD-DATA-KEY-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

OPAQUE: Tcl_ThreadDataKey*

<a name="api-cffi-type-tcl-thread-id-ptr_CA99670D9BB2541DCB6C49C407F6DF4E"></a>
### CFFI-TYPE: `TCL-THREAD-ID-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER RAW-CFFI-TCL9:TCL-THREAD-ID)`

OPAQUE: Tcl_ThreadId*

<a name="api-cffi-type-tcl-thread-id_3A614D7F14C71759E2B226607D07735B"></a>
### CFFI-TYPE: `TCL-THREAD-ID`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

OPAQUE: Tcl_ThreadId

<a name="api-cffi-type-tcl-time-ptr_B6544038AFA7886B9385DD1FB2BF8D01"></a>
### CFFI-TYPE: `TCL-TIME-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER (:STRUCT RAW-CFFI-TCL9:TCL-TIME))`


<a name="api-cffi-type-tcl-timer-proc_07AF44DDE5CCF1D8DE9FFDCE300EADE1"></a>
### CFFI-TYPE: `TCL-TIMER-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_TimerProc) (ClientData clientData);

<a name="api-cffi-type-tcl-timer-token_D83D16012E4336099E5BE5901D27D410"></a>
### CFFI-TYPE: `TCL-TIMER-TOKEN`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

OPAQUE: Tcl_TimerToken

<a name="api-cffi-type-tcl-token-ptr_0FEF797F23356A83C254AD7C4613F28A"></a>
### CFFI-TYPE: `TCL-TOKEN-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER (:STRUCT RAW-CFFI-TCL9:TCL-TOKEN))`


<a name="api-cffi-type-tcl-trace_FEC3ED385B6FBB5AA73974FFA8211646"></a>
### CFFI-TYPE: `TCL-TRACE`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

OPAQUE: Tcl_Trace

<a name="api-cffi-type-tcl-uni-char-ptr_84E09288539040FD47CA8A663A105A79"></a>
### CFFI-TYPE: `TCL-UNI-CHAR-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER RAW-CFFI-TCL9:TCL-UNI-CHAR)`


<a name="api-cffi-type-tcl-uni-char_FD1A0FF2A3BB8AFCD30569D03658F8B3"></a>
### CFFI-TYPE: `TCL-UNI-CHAR`

- SCOPE: EXTERNAL
- BASE-TYPE: `:UINT`


<a name="api-cffi-type-tcl-uni-char_FD1A0FF2A3BB8AFCD30569D03658F8B3"></a>
### CFFI-TYPE: `TCL-UNI-CHAR`

- SCOPE: EXTERNAL
- BASE-TYPE: `:USHORT`


<a name="api-cffi-type-tcl-update-string-proc_0D0A6DC2068A47F8746941B9A78DB577"></a>
### CFFI-TYPE: `TCL-UPDATE-STRING-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef void (Tcl_UpdateStringProc) (struct Tcl_Obj *objPtr);

<a name="api-cffi-type-tcl-value-type-ptr_E4E16D89BC70D515A405819245554CB7"></a>
### CFFI-TYPE: `TCL-VALUE-TYPE-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER RAW-CFFI-TCL9:TCL-VALUE-TYPE)`


<a name="api-cffi-type-tcl-var-trace-proc_B201316403E075777A47E17534810695"></a>
### CFFI-TYPE: `TCL-VAR-TRACE-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

typedef char * (Tcl_VarTraceProc) (ClientData clientData, Tcl_Interp
*interp, char *part1, char *part2, int flags);

<a name="api-cffi-type-tcl-var_C8DF8B485AC816F287BA6706475206E4"></a>
### CFFI-TYPE: `TCL-VAR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

OPAQUE: Tcl_Var

<a name="api-cffi-type-tcl-wait-for-event-proc_8D81350DD65FFE9B596D026DAF12552B"></a>
### CFFI-TYPE: `TCL-WAIT-FOR-EVENT-PROC`

- SCOPE: EXTERNAL
- BASE-TYPE: `:POINTER`

typedef int (Tcl_WaitForEventProc) (const Tcl_Time *timePtr);

<a name="api-cffi-type-tcl-wide-int_E03D4CB3D5B35C80F8A6D0B51B1845E5"></a>
### CFFI-TYPE: `TCL-WIDE-INT`

- SCOPE: EXTERNAL
- BASE-TYPE: `:LONG-LONG`


<a name="api-cffi-type-tcl-wide-int_E03D4CB3D5B35C80F8A6D0B51B1845E5"></a>
### CFFI-TYPE: `TCL-WIDE-INT`

- SCOPE: EXTERNAL
- BASE-TYPE: `:LONG`


<a name="api-cffi-type-tcl-wide-uint_BA33A99DB7E7F36DB46C063EE3AAB75D"></a>
### CFFI-TYPE: `TCL-WIDE-UINT`

- SCOPE: EXTERNAL
- BASE-TYPE: `:UNSIGNED-LONG-LONG`


<a name="api-cffi-type-tcl-wide-uint_BA33A99DB7E7F36DB46C063EE3AAB75D"></a>
### CFFI-TYPE: `TCL-WIDE-UINT`

- SCOPE: EXTERNAL
- BASE-TYPE: `:UNSIGNED-LONG`


<a name="api-cffi-type-tcl-zlib-stream-ptr_8A598472121059B8C4B8A67220726629"></a>
### CFFI-TYPE: `TCL-ZLIB-STREAM-PTR`

- SCOPE: EXTERNAL
- BASE-TYPE: `(:POINTER)`

OPAQUE: Tcl_ZlibStream*

<a name="api-cffi-union-tcl-hash-entrykey_34CDF83626DA2474F26ABD4D3D0658D9"></a>
### CFFI-UNION: `TCL-HASH-ENTRY/KEY`

- SCOPE: EXTERNAL
- VARIANTS: `NIL`


<a name="api-cffi-union-tcl-obj-internal-rep_1ED057FDAD7A780B060ADB6ADB7F85D0"></a>
### CFFI-UNION: `TCL-OBJ-INTERNAL-REP`

- SCOPE: EXTERNAL
- VARIANTS: `(\#<DOCPARSER:CFFI-SLOT {12024084A3}> \#<DOCPARSER:CFFI-SLOT {12024084B3}>
 \#<DOCPARSER:CFFI-SLOT {12024084C3}> \#<DOCPARSER:CFFI-SLOT {12024084D3}>
 \#<DOCPARSER:CFFI-SLOT {12024084E3}> \#<DOCPARSER:CFFI-SLOT {12024084F3}>
 \#<DOCPARSER:CFFI-SLOT {1202408503}>)`

Tcl_ObjInternalRep

The following structure stores an internal
representation (internalrep) for a Tcl value. An internalrep is
associated with an Tcl_ObjType when both are stored in the same
Tcl_Obj. The routines of the Tcl_ObjType govern the handling of the
internalrep.

<a name="api-class-tcl-argv-info-tclass_AB28DFB41462E89F67E8D309046A5624"></a>
### CLASS: `TCL-ARGV-INFO-TCLASS`

- SCOPE: EXTERNAL
- SLOTS:
- SUPERCLASSES: `(CFFI::FOREIGN-STRUCT-TYPE CFFI::TRANSLATABLE-FOREIGN-TYPE)`
- METACLASS: `STANDARD-CLASS`
- DEFAULT-INITARGS: `NIL`
- TYPE: `NIL`


<a name="api-class-tcl-call-frame-tclass_4CB18C45613A7654960E9D1D7C5066DF"></a>
### CLASS: `TCL-CALL-FRAME-TCLASS`

- SCOPE: EXTERNAL
- SLOTS:
- SUPERCLASSES: `(CFFI::FOREIGN-STRUCT-TYPE CFFI::TRANSLATABLE-FOREIGN-TYPE)`
- METACLASS: `STANDARD-CLASS`
- DEFAULT-INITARGS: `NIL`
- TYPE: `NIL`


<a name="api-class-tcl-channel-type-tclass_CA50F920284694AA3C689BA20207A282"></a>
### CLASS: `TCL-CHANNEL-TYPE-TCLASS`

- SCOPE: EXTERNAL
- SLOTS:
- SUPERCLASSES: `(CFFI::FOREIGN-STRUCT-TYPE CFFI::TRANSLATABLE-FOREIGN-TYPE)`
- METACLASS: `STANDARD-CLASS`
- DEFAULT-INITARGS: `NIL`
- TYPE: `NIL`


<a name="api-class-tcl-cmd-info-tclass_8060827B13FD83B66C67282DE2091E8A"></a>
### CLASS: `TCL-CMD-INFO-TCLASS`

- SCOPE: EXTERNAL
- SLOTS:
- SUPERCLASSES: `(CFFI::FOREIGN-STRUCT-TYPE CFFI::TRANSLATABLE-FOREIGN-TYPE)`
- METACLASS: `STANDARD-CLASS`
- DEFAULT-INITARGS: `NIL`
- TYPE: `NIL`


<a name="api-class-tcl-config-tclass_FC0FF94CBD711AC9A83061D22334D2D3"></a>
### CLASS: `TCL-CONFIG-TCLASS`

- SCOPE: EXTERNAL
- SLOTS:
- SUPERCLASSES: `(CFFI::FOREIGN-STRUCT-TYPE CFFI::TRANSLATABLE-FOREIGN-TYPE)`
- METACLASS: `STANDARD-CLASS`
- DEFAULT-INITARGS: `NIL`
- TYPE: `NIL`


<a name="api-class-tcl-d-string-tclass_4ED16CF0955924C7586F484B0DF3E39F"></a>
### CLASS: `TCL-D-STRING-TCLASS`

- SCOPE: EXTERNAL
- SLOTS:
- SUPERCLASSES: `(CFFI::FOREIGN-STRUCT-TYPE CFFI::TRANSLATABLE-FOREIGN-TYPE)`
- METACLASS: `STANDARD-CLASS`
- DEFAULT-INITARGS: `NIL`
- TYPE: `NIL`


<a name="api-class-tcl-dict-search-tclass_78696FBBBFE565DED34E79C264C17BF7"></a>
### CLASS: `TCL-DICT-SEARCH-TCLASS`

- SCOPE: EXTERNAL
- SLOTS:
- SUPERCLASSES: `(CFFI::FOREIGN-STRUCT-TYPE CFFI::TRANSLATABLE-FOREIGN-TYPE)`
- METACLASS: `STANDARD-CLASS`
- DEFAULT-INITARGS: `NIL`
- TYPE: `NIL`


<a name="api-class-tcl-encoding-type-tclass_F64EC6DB5BB44FBE7F319710246AA9EB"></a>
### CLASS: `TCL-ENCODING-TYPE-TCLASS`

- SCOPE: EXTERNAL
- SLOTS:
- SUPERCLASSES: `(CFFI::FOREIGN-STRUCT-TYPE CFFI::TRANSLATABLE-FOREIGN-TYPE)`
- METACLASS: `STANDARD-CLASS`
- DEFAULT-INITARGS: `NIL`
- TYPE: `NIL`


<a name="api-class-tcl-event-tclass_FA44C16DC986730E00EBA5E432FE482D"></a>
### CLASS: `TCL-EVENT-TCLASS`

- SCOPE: EXTERNAL
- SLOTS:
- SUPERCLASSES: `(CFFI::FOREIGN-STRUCT-TYPE CFFI::TRANSLATABLE-FOREIGN-TYPE)`
- METACLASS: `STANDARD-CLASS`
- DEFAULT-INITARGS: `NIL`
- TYPE: `NIL`


<a name="api-class-tcl-filesystem-tclass_E63B0700C958BC08CAD0AE93C35962DE"></a>
### CLASS: `TCL-FILESYSTEM-TCLASS`

- SCOPE: EXTERNAL
- SLOTS:
- SUPERCLASSES: `(CFFI::FOREIGN-STRUCT-TYPE CFFI::TRANSLATABLE-FOREIGN-TYPE)`
- METACLASS: `STANDARD-CLASS`
- DEFAULT-INITARGS: `NIL`
- TYPE: `NIL`


<a name="api-class-tcl-glob-type-data-tclass_3CEB8ADA256027730308A82CE0A77DD0"></a>
### CLASS: `TCL-GLOB-TYPE-DATA-TCLASS`

- SCOPE: EXTERNAL
- SLOTS:
- SUPERCLASSES: `(CFFI::FOREIGN-STRUCT-TYPE CFFI::TRANSLATABLE-FOREIGN-TYPE)`
- METACLASS: `STANDARD-CLASS`
- DEFAULT-INITARGS: `NIL`
- TYPE: `NIL`


<a name="api-class-tcl-hash-entry-tclass_F1AB7F7E63FF8B527451EFF70C23AFBE"></a>
### CLASS: `TCL-HASH-ENTRY-TCLASS`

- SCOPE: EXTERNAL
- SLOTS:
- SUPERCLASSES: `(CFFI::FOREIGN-STRUCT-TYPE CFFI::TRANSLATABLE-FOREIGN-TYPE)`
- METACLASS: `STANDARD-CLASS`
- DEFAULT-INITARGS: `NIL`
- TYPE: `NIL`


<a name="api-class-tcl-hash-key-type-tclass_6A6E3CFC233C25A16D4EE328421E34BA"></a>
### CLASS: `TCL-HASH-KEY-TYPE-TCLASS`

- SCOPE: EXTERNAL
- SLOTS:
- SUPERCLASSES: `(CFFI::FOREIGN-STRUCT-TYPE CFFI::TRANSLATABLE-FOREIGN-TYPE)`
- METACLASS: `STANDARD-CLASS`
- DEFAULT-INITARGS: `NIL`
- TYPE: `NIL`


<a name="api-class-tcl-hash-search-tclass_FC73B65E4F387385F2D69F1B1E75369B"></a>
### CLASS: `TCL-HASH-SEARCH-TCLASS`

- SCOPE: EXTERNAL
- SLOTS:
- SUPERCLASSES: `(CFFI::FOREIGN-STRUCT-TYPE CFFI::TRANSLATABLE-FOREIGN-TYPE)`
- METACLASS: `STANDARD-CLASS`
- DEFAULT-INITARGS: `NIL`
- TYPE: `NIL`


<a name="api-class-tcl-hash-table-tclass_7206B7C5512982726B69ADAEE2BE193A"></a>
### CLASS: `TCL-HASH-TABLE-TCLASS`

- SCOPE: EXTERNAL
- SLOTS:
- SUPERCLASSES: `(CFFI::FOREIGN-STRUCT-TYPE CFFI::TRANSLATABLE-FOREIGN-TYPE)`
- METACLASS: `STANDARD-CLASS`
- DEFAULT-INITARGS: `NIL`
- TYPE: `NIL`


<a name="api-class-tcl-namespace-tclass_1EA9A432F25F9310B57D3C07B2E9A4EC"></a>
### CLASS: `TCL-NAMESPACE-TCLASS`

- SCOPE: EXTERNAL
- SLOTS:
- SUPERCLASSES: `(CFFI::FOREIGN-STRUCT-TYPE CFFI::TRANSLATABLE-FOREIGN-TYPE)`
- METACLASS: `STANDARD-CLASS`
- DEFAULT-INITARGS: `NIL`
- TYPE: `NIL`


<a name="api-class-tcl-notifier-procs-tclass_11D67D1349A0720C7A4615F13579928C"></a>
### CLASS: `TCL-NOTIFIER-PROCS-TCLASS`

- SCOPE: EXTERNAL
- SLOTS:
- SUPERCLASSES: `(CFFI::FOREIGN-STRUCT-TYPE CFFI::TRANSLATABLE-FOREIGN-TYPE)`
- METACLASS: `STANDARD-CLASS`
- DEFAULT-INITARGS: `NIL`
- TYPE: `NIL`


<a name="api-class-tcl-obj-internal-repptr-and-long-rep-tclass_788B99DBD599FE414BEFFD4E3BC1DA89"></a>
### CLASS: `TCL-OBJ-INTERNAL-REP/PTR-AND-LONG-REP-TCLASS`

- SCOPE: EXTERNAL
- SLOTS:
- SUPERCLASSES: `(CFFI::FOREIGN-STRUCT-TYPE CFFI::TRANSLATABLE-FOREIGN-TYPE)`
- METACLASS: `STANDARD-CLASS`
- DEFAULT-INITARGS: `NIL`
- TYPE: `NIL`


<a name="api-class-tcl-obj-internal-repptr-and-size-tclass_65385EB8F5F228E6B8500413AF707335"></a>
### CLASS: `TCL-OBJ-INTERNAL-REP/PTR-AND-SIZE-TCLASS`

- SCOPE: EXTERNAL
- SLOTS:
- SUPERCLASSES: `(CFFI::FOREIGN-STRUCT-TYPE CFFI::TRANSLATABLE-FOREIGN-TYPE)`
- METACLASS: `STANDARD-CLASS`
- DEFAULT-INITARGS: `NIL`
- TYPE: `NIL`


<a name="api-class-tcl-obj-internal-reptwo-ptr-value-tclass_AFB3F25132FC7D131F5AEB258A1B3043"></a>
### CLASS: `TCL-OBJ-INTERNAL-REP/TWO-PTR-VALUE-TCLASS`

- SCOPE: EXTERNAL
- SLOTS:
- SUPERCLASSES: `(CFFI::FOREIGN-STRUCT-TYPE CFFI::TRANSLATABLE-FOREIGN-TYPE)`
- METACLASS: `STANDARD-CLASS`
- DEFAULT-INITARGS: `NIL`
- TYPE: `NIL`


<a name="api-class-tcl-obj-tclass_F217059EB49CC12286CD2107E1B414D5"></a>
### CLASS: `TCL-OBJ-TCLASS`

- SCOPE: EXTERNAL
- SLOTS:
- SUPERCLASSES: `(CFFI::FOREIGN-STRUCT-TYPE CFFI::TRANSLATABLE-FOREIGN-TYPE)`
- METACLASS: `STANDARD-CLASS`
- DEFAULT-INITARGS: `NIL`
- TYPE: `NIL`


<a name="api-class-tcl-obj-type-tclass_E2DE9D4DDADDA25F6968999244C382A0"></a>
### CLASS: `TCL-OBJ-TYPE-TCLASS`

- SCOPE: EXTERNAL
- SLOTS:
- SUPERCLASSES: `(CFFI::FOREIGN-STRUCT-TYPE CFFI::TRANSLATABLE-FOREIGN-TYPE)`
- METACLASS: `STANDARD-CLASS`
- DEFAULT-INITARGS: `NIL`
- TYPE: `NIL`


<a name="api-class-tcl-parse-tclass_7B3FF8689E587C7C77C46432CE868A08"></a>
### CLASS: `TCL-PARSE-TCLASS`

- SCOPE: EXTERNAL
- SLOTS:
- SUPERCLASSES: `(CFFI::FOREIGN-STRUCT-TYPE CFFI::TRANSLATABLE-FOREIGN-TYPE)`
- METACLASS: `STANDARD-CLASS`
- DEFAULT-INITARGS: `NIL`
- TYPE: `NIL`


<a name="api-class-tcl-reg-exp-indices-tclass_5C77D07CE7C641D2DC9B88A56CA33D8A"></a>
### CLASS: `TCL-REG-EXP-INDICES-TCLASS`

- SCOPE: EXTERNAL
- SLOTS:
- SUPERCLASSES: `(CFFI::FOREIGN-STRUCT-TYPE CFFI::TRANSLATABLE-FOREIGN-TYPE)`
- METACLASS: `STANDARD-CLASS`
- DEFAULT-INITARGS: `NIL`
- TYPE: `NIL`


<a name="api-class-tcl-reg-exp-info-tclass_BFADA7896840F38E0471FC20ED0C281A"></a>
### CLASS: `TCL-REG-EXP-INFO-TCLASS`

- SCOPE: EXTERNAL
- SLOTS:
- SUPERCLASSES: `(CFFI::FOREIGN-STRUCT-TYPE CFFI::TRANSLATABLE-FOREIGN-TYPE)`
- METACLASS: `STANDARD-CLASS`
- DEFAULT-INITARGS: `NIL`
- TYPE: `NIL`


<a name="api-class-tcl-time-tclass_04C83CE09DEEEC02E3495C29BC859B44"></a>
### CLASS: `TCL-TIME-TCLASS`

- SCOPE: EXTERNAL
- SLOTS:
- SUPERCLASSES: `(CFFI::FOREIGN-STRUCT-TYPE CFFI::TRANSLATABLE-FOREIGN-TYPE)`
- METACLASS: `STANDARD-CLASS`
- DEFAULT-INITARGS: `NIL`
- TYPE: `NIL`


<a name="api-class-tcl-token-tclass_198FD22C13CFEA5C5A43940F016F1C10"></a>
### CLASS: `TCL-TOKEN-TCLASS`

- SCOPE: EXTERNAL
- SLOTS:
- SUPERCLASSES: `(CFFI::FOREIGN-STRUCT-TYPE CFFI::TRANSLATABLE-FOREIGN-TYPE)`
- METACLASS: `STANDARD-CLASS`
- DEFAULT-INITARGS: `NIL`
- TYPE: `NIL`


<a name="api-function-tcl-add-error-info_E230650BC793ADB3BCFCD6F315878658"></a>
### FUNCTION: `%TCL-ADD-ERROR-INFO`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::MESSAGE)`
- SETF? `NIL`

/* Slot 66 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-add-obj-error-info_9BD9558F64BEF48AF8BC8E469B6462DD"></a>
### FUNCTION: `%TCL-ADD-OBJ-ERROR-INFO`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::MESSAGE LENGTH)`
- SETF? `NIL`

/* Slot 67 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-background-error_FFC511BAA275FFF2011A4E9F15538042"></a>
### FUNCTION: `%TCL-BACKGROUND-ERROR`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`

/* Slot 76 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-backslash_CA4967B455B84521215669D90186F7D5"></a>
### FUNCTION: `%TCL-BACKSLASH`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC RAW-CFFI-TCL9::READ-PTR)`
- SETF? `NIL`

/* Slot 77 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-close_42DD13BE5D5BE372C9CBAFB80A4B3E93"></a>
### FUNCTION: `%TCL-CLOSE`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::CHAN)`
- SETF? `NIL`

/* 81 */ EXTERN int
Tcl_Close(Tcl_Interp *interp, Tcl_Channel chan);

<a name="api-function-tcl-create-math-func_9FD3F78F9E5CACD9DFF61FDBD40B49DD"></a>
### FUNCTION: `%TCL-CREATE-MATH-FUNC`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::NAME RAW-CFFI-TCL9::NUM-ARGS
 RAW-CFFI-TCL9::ARG-TYPES RAW-CFFI-TCL9::MATH-PROC RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* Slot 95 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-db-new-boolean-obj_581BAB599CE264F5FE622600B4B1DDD5"></a>
### FUNCTION: `%TCL-DB-NEW-BOOLEAN-OBJ`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INT-VAL RAW-CFFI-TCL9::FILE RAW-CFFI-TCL9::LINE)`
- SETF? `NIL`

/* Slot 22 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-db-new-long-obj_81D68DBAE13C66419AA5117E595EBBC4"></a>
### FUNCTION: `%TCL-DB-NEW-LONG-OBJ`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::LONG-VAL RAW-CFFI-TCL9::FILE RAW-CFFI-TCL9::LINE)`
- SETF? `NIL`

/* Slot 26 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-discard-result_A4C1B3C696BA1952DBC82E470E539BDD"></a>
### FUNCTION: `%TCL-DISCARD-RESULT`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::STATE-PTR)`
- SETF? `NIL`

/* Slot 290 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-eval-obj_2B0C061DE0CF3FB9F9C283F67C4FC7BB"></a>
### FUNCTION: `%TCL-EVAL-OBJ`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`

/* Slot 131 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-eval_19716AAA096EC24D284E891557DCABF7"></a>
### FUNCTION: `%TCL-EVAL`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::SCRIPT)`
- SETF? `NIL`

/* Slot 129 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-find-executable_2B33D340C35FF4CEA10E1CC2E9422AB9"></a>
### FUNCTION: `%TCL-FIND-EXECUTABLE`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ARGV0)`
- SETF? `NIL`

/* Slot 144 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-free-result_02FAFF2976E6C3EE33B8590DFD0143F6"></a>
### FUNCTION: `%TCL-FREE-RESULT`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`

/* Slot 147 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-get-alias_FF10214225E926E25409064637360D4A"></a>
### FUNCTION: `%TCL-GET-ALIAS`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::CHILD-CMD
 RAW-CFFI-TCL9::TARGET-INTERP-PTR-PTR RAW-CFFI-TCL9::TARGET-CMD-PTR
 RAW-CFFI-TCL9::ARGC-PTR RAW-CFFI-TCL9::ARGV-PTR)`
- SETF? `NIL`

/* Slot 148 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-get-byte-array-from-obj_A95C2F4C211065DBC8248F416A87082E"></a>
### FUNCTION: `%TCL-GET-BYTE-ARRAY-FROM-OBJ`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::NUM-BYTES-PTR)`
- SETF? `NIL`

/* 33 */ EXTERN unsigned char *
Tcl_GetByteArrayFromObj(Tcl_Obj *objPtr, Tcl_Size *numBytesPtr);

<a name="api-function-tcl-get-index-from-obj_3A5DB5A730436A4978509FA8CE9B2713"></a>
### FUNCTION: `%TCL-GET-INDEX-FROM-OBJ`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::TABLE-PTR RAW-CFFI-TCL9::MSG
 RAW-CFFI-TCL9::FLAGS RAW-CFFI-TCL9::IDX-PTR)`
- SETF? `NIL`

/* Slot 36 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-get-string-result_432149E5779229DC97B4EE8E877DF77E"></a>
### FUNCTION: `%TCL-GET-STRING-RESULT`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`

/* Slot 174 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-get-var_8258F599DE4B505BEAF1B6FA280129A3"></a>
### FUNCTION: `%TCL-GET-VAR`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::VAR-NAME RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* Slot 175 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-global-eval-obj_5F3694E7999D70DDB9D9BA933156424C"></a>
### FUNCTION: `%TCL-GLOBAL-EVAL-OBJ`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`

/* Slot 178 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-global-eval_9E8AF2E1A274ED328E314C21D134BA09"></a>
### FUNCTION: `%TCL-GLOBAL-EVAL`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::COMMAND)`
- SETF? `NIL`

/* Slot 177 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-make-safe_CBE43B668E4D38AC41B8674B8C3043A0"></a>
### FUNCTION: `%TCL-MAKE-SAFE`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`

/* Slot 190 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-new-boolean-obj_A33CFCF45C4AB0AE6B72CD70370CFB3D"></a>
### FUNCTION: `%TCL-NEW-BOOLEAN-OBJ`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INT-VAL)`
- SETF? `NIL`

/* Slot 49 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-new-int-obj_B87BDD6B13B0B9E05CAB8822B5C66F16"></a>
### FUNCTION: `%TCL-NEW-INT-OBJ`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INT-VAL)`
- SETF? `NIL`

/* Slot 52 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-new-long-obj_255E4A4D46CD1D5129EE448EC2ED1392"></a>
### FUNCTION: `%TCL-NEW-LONG-OBJ`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::LONG-VAL)`
- SETF? `NIL`

/* Slot 54 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-pkg-present_70A2DA6D7B3C3D646BEA44B3157FF095"></a>
### FUNCTION: `%TCL-PKG-PRESENT`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::NAME RAW-CFFI-TCL9:VERSION
 RAW-CFFI-TCL9::EXACT)`
- SETF? `NIL`

/* Slot 271 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-pkg-provide_05DEB6D2C8ACB9CD5A084481318AD5DC"></a>
### FUNCTION: `%TCL-PKG-PROVIDE`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::NAME RAW-CFFI-TCL9:VERSION)`
- SETF? `NIL`

/* Slot 273 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-pkg-require_9D1992E67A9BFA4B624B17BC96F0A2AD"></a>
### FUNCTION: `%TCL-PKG-REQUIRE`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::NAME RAW-CFFI-TCL9:VERSION
 RAW-CFFI-TCL9::EXACT)`
- SETF? `NIL`

/* Slot 274 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-seek-old_7166E35DE38F662DFAFE5C06D35315A4"></a>
### FUNCTION: `%TCL-SEEK-OLD`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9::OFFSET RAW-CFFI-TCL9::MODE)`
- SETF? `NIL`

/* Slot 220 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-set-boolean-obj_1EEADFE0F8DBDE4A5D563ADAA5B2DD01"></a>
### FUNCTION: `%TCL-SET-BOOLEAN-OBJ`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::INT-VAL)`
- SETF? `NIL`

/* Slot 57 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-set-int-obj_F491989BE32589CB1FB1533B19277AD1"></a>
### FUNCTION: `%TCL-SET-INT-OBJ`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::INT-VAL)`
- SETF? `NIL`

/* Slot 61 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-set-long-obj_9EF7BD021C8CA42B67D8602B339B7D70"></a>
### FUNCTION: `%TCL-SET-LONG-OBJ`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::LONG-VAL)`
- SETF? `NIL`

/* Slot 63 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-set-panic-proc_8E354BB02301291BC73189784A780D68"></a>
### FUNCTION: `%TCL-SET-PANIC-PROC`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PANIC-PROC)`
- SETF? `NIL`

/* Slot 230 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-set-result_5702C4B5DDB541FF8BAFC7C5F5096E82"></a>
### FUNCTION: `%TCL-SET-RESULT`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::RESULT RAW-CFFI-TCL9::FREE-PROC)`
- SETF? `NIL`

/* Slot 232 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-set-var_518505C60AD21637075D6759D0255AE7"></a>
### FUNCTION: `%TCL-SET-VAR`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::VAR-NAME RAW-CFFI-TCL9::NEW-VALUE
 RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* Slot 237 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-static-package_4BDD2E34EF7D3ADA66FC4D6295F1FFF1"></a>
### FUNCTION: `%TCL-STATIC-PACKAGE`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::PREFIX RAW-CFFI-TCL9::PKG-INIT-PROC
 RAW-CFFI-TCL9::SAFE-PKG-INIT-PROC)`
- SETF? `NIL`

/* Slot 244 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-string-match_12BE216854F446BB5446C8CF6F7B89B0"></a>
### FUNCTION: `%TCL-STRING-MATCH`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::STR RAW-CFFI-TCL9::PATTERN)`
- SETF? `NIL`

/* Slot 245 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-tell-old_1A2872E174059866A7B41CBDFC329972"></a>
### FUNCTION: `%TCL-TELL-OLD`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN)`
- SETF? `NIL`

/* Slot 246 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-trace-var_8C03583A24DCBC359304873CD10CD064"></a>
### FUNCTION: `%TCL-TRACE-VAR`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::VAR-NAME RAW-CFFI-TCL9::FLAGS
 RAW-CFFI-TCL9::VAR-TRACE-PROC RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* Slot 247 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-unset-var_D0FB379627076E05929DFEEEB0371F21"></a>
### FUNCTION: `%TCL-UNSET-VAR`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::VAR-NAME RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* Slot 253 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-untrace-var_6517CFDBBA4CE5B90024860F613CDA98"></a>
### FUNCTION: `%TCL-UNTRACE-VAR`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::VAR-NAME RAW-CFFI-TCL9::FLAGS
 RAW-CFFI-TCL9::VAR-TRACE-PROC RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* Slot 255 is reserved */ DEPRECATED 9.0

<a name="api-function-tcl-up-var_14EAACA8AB20936B4F394A49FC3270D3"></a>
### FUNCTION: `%TCL-UP-VAR`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::FRAME-NAME RAW-CFFI-TCL9::VAR-NAME
 RAW-CFFI-TCL9::LOCAL-NAME RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* Slot 258 is reserved */ DEPRECATED 9.0

<a name="api-function-tclvartraceinfo_AF6CBE598E2FF80CE9DBF71EF544121D"></a>
### FUNCTION: `%TCL_VARTRACEINFO`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::VAR-NAME RAW-CFFI-TCL9::FLAGS
 RAW-CFFI-TCL9::VAR-TRACE-PROC RAW-CFFI-TCL9::PREV-CLIENT-DATA)`
- SETF? `NIL`

/* Slot 261 is reserved */ DEPRECATED 9.0

<a name="api-function-fix-argv0_2857A77A521E744EE842B8DFE18037BD"></a>
### FUNCTION: `FIX-ARGV0`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::ARGV0)`
- SETF? `NIL`


<a name="api-function-get-tcl-utf-max_B0BBAA36EAED3027043FF015BBCF31D9"></a>
### FUNCTION: `GET-TCL-UTF-MAX`

- SCOPE: INTERNAL
- LAMBDA LIST: `NIL`
- SETF? `NIL`

런타임에 Tcl 라이브러리의 TCL_UTF_MAX 값을 검출합니다.

<a name="api-function-tcl-access_6B1AFA44B5BED09B85A0218700FB9870"></a>
### FUNCTION: `TCL-ACCESS`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PATH RAW-CFFI-TCL9::MODE)`
- SETF? `NIL`

/* 367 */ EXTERN int Tcl_Access(const char *path, int mode);

<a name="api-function-tcl-add-error-info_E0EF90375F10905A094D569C13FCD646"></a>
### FUNCTION: `TCL-ADD-ERROR-INFO`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::MESSAGE)`
- SETF? `NIL`


<a name="api-function-tcl-add-obj-error-info_8BEFC6030ACE17C0843464B1D7E04155"></a>
### FUNCTION: `TCL-ADD-OBJ-ERROR-INFO`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::MESSAGE LENGTH)`
- SETF? `NIL`


<a name="api-function-tcl-alert-notifier_F389C270C7C1B237C3DA8F8C84629467"></a>
### FUNCTION: `TCL-ALERT-NOTIFIER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 343 */ EXTERN void Tcl_AlertNotifier(void *clientData);

<a name="api-function-tcl-alloc_E103A7E8A460B709C5A10690528A4A86"></a>
### FUNCTION: `TCL-ALLOC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SIZE)`
- SETF? `NIL`

/* 3 */ EXTERN void *
Tcl_Alloc(TCL_HASH_TYPE size);

<a name="api-function-tcl-allow-exceptions_0C5C985D6CD2443DAFC6ACEFD1AD5C7E"></a>
### FUNCTION: `TCL-ALLOW-EXCEPTIONS`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`

/* 68 */ EXTERN void
Tcl_AllowExceptions(Tcl_Interp *interp);

<a name="api-function-tcl-append-all-obj-types_DBCDE670D5E87447752E3870C3AA2C2E"></a>
### FUNCTION: `TCL-APPEND-ALL-OBJ-TYPES`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`

/* 14 */ EXTERN int
Tcl_AppendAllObjTypes(Tcl_Interp *interp, Tcl_Obj *objPtr);

<a name="api-function-tcl-append-element_4005EFAB5C968D9228EB49D9E90CC697"></a>
### FUNCTION: `TCL-APPEND-ELEMENT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::ELEMENT)`
- SETF? `NIL`

/* 69 */ EXTERN void
Tcl_AppendElement(Tcl_Interp *interp, const char *element);

<a name="api-function-tcl-append-export-list_695C21BADDF6F66ACE880C953C2EA8F4"></a>
### FUNCTION: `TCL-APPEND-EXPORT-LIST`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::NS-PTR RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`

/* 508 */ EXTERN int
Tcl_AppendExportList(Tcl_Interp *interp, Tcl_Namespace *nsPtr, Tcl_Obj *objPtr);

<a name="api-function-tcl-append-format-to-obj_FC9DA2D525C23BEAEADC834A2F6C1B2F"></a>
### FUNCTION: `TCL-APPEND-FORMAT-TO-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OBJ-PTR FORMAT RAW-CFFI-TCL9::OBJC
 RAW-CFFI-TCL9::OBJV)`
- SETF? `NIL`

/* 577 */ EXTERN int
Tcl_AppendFormatToObj(
  Tcl_Interp *interp, Tcl_Obj *objPtr, const char *format,
  Tcl_Size objc, Tcl_Obj *const objv[]);

<a name="api-function-tcl-append-limited-to-obj_D5E92C34F75670CA22FA83FC20D1FE3B"></a>
### FUNCTION: `TCL-APPEND-LIMITED-TO-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::BYTES LENGTH RAW-CFFI-TCL9::LIMIT
 RAW-CFFI-TCL9::ELLIPSIS)`
- SETF? `NIL`

/* 575 */ EXTERN void
Tcl_AppendLimitedToObj(
  Tcl_Obj *objPtr,
  const char *bytes, Tcl_Size length,
  Tcl_Size limit, const char *ellipsis);

<a name="api-function-tcl-append-obj-to-error-info_94863A3455667DE491EF26D084AD9BC9"></a>
### FUNCTION: `TCL-APPEND-OBJ-TO-ERROR-INFO`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`

/* 574 */ EXTERN void
Tcl_AppendObjToErrorInfo(Tcl_Interp *interp, Tcl_Obj *objPtr);

<a name="api-function-tcl-append-obj-to-obj_BCB8F53BD535C7EF90F628716431D69F"></a>
### FUNCTION: `TCL-APPEND-OBJ-TO-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::APPEND-OBJ-PTR)`
- SETF? `NIL`

/* 286 */ EXTERN void
Tcl_AppendObjToObj(Tcl_Obj *objPtr, Tcl_Obj *appendObjPtr);

<a name="api-function-tcl-append-to-obj_C34F43C7F4D995ED01B75E20A4B8874D"></a>
### FUNCTION: `TCL-APPEND-TO-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::BYTES LENGTH)`
- SETF? `NIL`

/* 16 */ EXTERN void
Tcl_AppendToObj(
  Tcl_Obj *objPtr, const char *bytes, Tcl_Size length);

<a name="api-function-tcl-append-unicode-to-obj_93D8A645BC26B256A6A3FDB341365115"></a>
### FUNCTION: `TCL-APPEND-UNICODE-TO-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::UNICODE LENGTH)`
- SETF? `NIL`

/* 384 */ EXTERN void
Tcl_AppendUnicodeToObj(Tcl_Obj *objPtr, const Tcl_UniChar *unicode, Tcl_Size length);

<a name="api-function-tcl-async-create_5152A09287CE557CDA28674A088111C8"></a>
### FUNCTION: `TCL-ASYNC-CREATE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ASYNC-PROC RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 71 */ EXTERN Tcl_AsyncHandler
Tcl_AsyncCreate(Tcl_AsyncProc *proc, void *clientData);

<a name="api-function-tcl-async-delete_F72A81EE14CB7B62AD758A010CD5DF31"></a>
### FUNCTION: `TCL-ASYNC-DELETE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ASYNC-HANDLER)`
- SETF? `NIL`

/* 72 */ EXTERN void
Tcl_AsyncDelete(Tcl_AsyncHandler async);

<a name="api-function-tcl-async-invoke_3A9BDA6ABB7C063D755B80338942FC4B"></a>
### FUNCTION: `TCL-ASYNC-INVOKE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::CODE)`
- SETF? `NIL`

/* 73 */ EXTERN int
Tcl_AsyncInvoke(Tcl_Interp *interp, int code);

<a name="api-function-tcl-async-mark-from-signal_2E47312CAA90B9555459C581ACB3CF29"></a>
### FUNCTION: `TCL-ASYNC-MARK-FROM-SIGNAL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ASYNC RAW-CFFI-TCL9::SIG-NR)`
- SETF? `NIL`

/* 660 */ EXTERN int Tcl_AsyncMarkFromSignal(
  Tcl_AsyncHandler async, int sigNumber);

<a name="api-function-tcl-async-mark_D12D28A9397E847EA62E1F69D65CCAED"></a>
### FUNCTION: `TCL-ASYNC-MARK`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ASYNC-HANDLER)`
- SETF? `NIL`

/* 74 */ EXTERN void
Tcl_AsyncMark(Tcl_AsyncHandler async);

<a name="api-function-tcl-attempt-alloc_58165B255F6E1973677C6005AA294453"></a>
### FUNCTION: `TCL-ATTEMPT-ALLOC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SIZE)`
- SETF? `NIL`

/* 428 */ EXTERN void * Tcl_AttemptAlloc(TCL_HASH_TYPE size);

<a name="api-function-tcl-attempt-db-ckalloc_7C36763740E80AF8075F46C739FB178C"></a>
### FUNCTION: `TCL-ATTEMPT-DB-CKALLOC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SIZE RAW-CFFI-TCL9::FILE RAW-CFFI-TCL9::LINE)`
- SETF? `NIL`

/* 429 */ EXTERN void *
Tcl_AttemptDbCkalloc(TCL_HASH_TYPE size, const char *file, int line);

<a name="api-function-tcl-attempt-db-ckrealloc_1A581985E28562C7B38FAA113C674883"></a>
### FUNCTION: `TCL-ATTEMPT-DB-CKREALLOC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PTR RAW-CFFI-TCL9::SIZE RAW-CFFI-TCL9::FILE RAW-CFFI-TCL9::LINE)`
- SETF? `NIL`

/* 431 */ EXTERN void *
Tcl_AttemptDbCkrealloc(
  void *ptr, TCL_HASH_TYPE size, const char *file, int line);

<a name="api-function-tcl-attempt-realloc_70067A312CD0F8E7FC9DDBA2E2E44C01"></a>
### FUNCTION: `TCL-ATTEMPT-REALLOC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PTR RAW-CFFI-TCL9::SIZE)`
- SETF? `NIL`

/* 430 */ EXTERN void *
Tcl_AttemptRealloc(void *ptr, TCL_HASH_TYPE size);

<a name="api-function-tcl-attempt-set-obj-length_3C9053AE6F7F89F2CDB66D83CD362FB1"></a>
### FUNCTION: `TCL-ATTEMPT-SET-OBJ-LENGTH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR LENGTH)`
- SETF? `NIL`

/* 432 */ EXTERN int
Tcl_AttemptSetObjLength(Tcl_Obj *objPtr, Tcl_Size length);

<a name="api-function-tcl-background-error_15755E3BAEEE7E6186E451F0904F73C1"></a>
### FUNCTION: `TCL-BACKGROUND-ERROR`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP)`
- SETF? `NIL`


<a name="api-function-tcl-background-exception_7D3A479CE05753424938A49EF3B00373"></a>
### FUNCTION: `TCL-BACKGROUND-EXCEPTION`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::CODE)`
- SETF? `NIL`

/* 609 */ EXTERN void
Tcl_BackgroundException(Tcl_Interp *interp, int code);

<a name="api-function-tcl-bad-channel-option_8CAFEB26EA08B26311B263F7DD31D938"></a>
### FUNCTION: `TCL-BAD-CHANNEL-OPTION`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OPTION-NAME
 RAW-CFFI-TCL9::OPTION-LIST)`
- SETF? `NIL`

/* 78 */ EXTERN int
Tcl_BadChannelOption(
  Tcl_Interp *interp, const char *optionName, const char *optionList);

<a name="api-function-tcl-bounce-ref-count_28AB89A27D4F9E23669AB87BA4914759"></a>
### FUNCTION: `TCL-BOUNCE-REF-COUNT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`


<a name="api-function-tcl-call-when-deleted_E62481CA0FD1B108D82B8275EFEC9E71"></a>
### FUNCTION: `TCL-CALL-WHEN-DELETED`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::INTERP-DELETE-PROC
 RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 79 */ EXTERN void
Tcl_CallWhenDeleted(
  Tcl_Interp *interp, Tcl_InterpDeleteProc *proc, void *clientData);

<a name="api-function-tcl-cancel-eval_7455C0DAEE29E919FE53242ED21ACCF9"></a>
### FUNCTION: `TCL-CANCEL-EVAL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::RESULT-OBJ-PTR
 RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 580 */ EXTERN int
Tcl_CancelEval(
  Tcl_Interp *interp, Tcl_Obj *resultObjPtr, void *clientData, int flags);

<a name="api-function-tcl-cancel-idle-call_4BFFF81BB69219581FE059BB1807DD36"></a>
### FUNCTION: `TCL-CANCEL-IDLE-CALL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::IDLE-PROC RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 80 */ EXTERN void
Tcl_CancelIdleCall(Tcl_IdleProc *idleProc, void *clientData);

<a name="api-function-tcl-canceled_25D0A624FCE49990F1A1A396CE09A502"></a>
### FUNCTION: `TCL-CANCELED`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 581 */ EXTERN int Tcl_Canceled(Tcl_Interp *interp, int flags);

<a name="api-function-tcl-channel-block-mode-proc_5FCDFA2B0731C5D2955FD693BA4F1D94"></a>
### FUNCTION: `TCL-CHANNEL-BLOCK-MODE-PROC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN-TYPE-PTR)`
- SETF? `NIL`

/* 400 */ EXTERN Tcl_DriverBlockModeProc *
Tcl_ChannelBlockModeProc(const Tcl_ChannelType *chanTypePtr);

<a name="api-function-tcl-channel-buffered_A8369D63C6C65EAFE5351CFE6C44C07A"></a>
### FUNCTION: `TCL-CHANNEL-BUFFERED`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN)`
- SETF? `NIL`

/* 397 */ EXTERN int Tcl_ChannelBuffered(Tcl_Channel chan);

<a name="api-function-tcl-channel-close2-proc_3AE3DAD62F2B4EF0C2C607A08E67DA42"></a>
### FUNCTION: `TCL-CHANNEL-CLOSE2-PROC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN-TYPE-PTR)`
- SETF? `NIL`

/* 402 */ EXTERN Tcl_DriverClose2Proc *
Tcl_ChannelClose2Proc(const Tcl_ChannelType *chanTypePtr);

<a name="api-function-tcl-channel-flush-proc_5DE652B758EDDF82E982B1A52AABA930"></a>
### FUNCTION: `TCL-CHANNEL-FLUSH-PROC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN-TYPE-PTR)`
- SETF? `NIL`

/* 410 */ EXTERN Tcl_DriverFlushProc *
Tcl_ChannelFlushProc(const Tcl_ChannelType *chanTypePtr);

<a name="api-function-tcl-channel-get-handle-proc_4DF26BB619FE90FB1995FAA450577667"></a>
### FUNCTION: `TCL-CHANNEL-GET-HANDLE-PROC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN-TYPE-PTR)`
- SETF? `NIL`

/* 409 */ EXTERN Tcl_DriverGetHandleProc *
Tcl_ChannelGetHandleProc(const Tcl_ChannelType *chanTypePtr);

<a name="api-function-tcl-channel-get-option-proc_3827427FA6647487DC0F5CB808CCFD8A"></a>
### FUNCTION: `TCL-CHANNEL-GET-OPTION-PROC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN-TYPE-PTR)`
- SETF? `NIL`

/* 407 */ EXTERN Tcl_DriverGetOptionProc *
Tcl_ChannelGetOptionProc(const Tcl_ChannelType *chanTypePtr);

<a name="api-function-tcl-channel-handler-proc_ABB21FE6EFEE7390CC717770283D658B"></a>
### FUNCTION: `TCL-CHANNEL-HANDLER-PROC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN-TYPE-PTR)`
- SETF? `NIL`

/* 411 */ EXTERN Tcl_DriverHandlerProc *
Tcl_ChannelHandlerProc(const Tcl_ChannelType *chanTypePtr);

<a name="api-function-tcl-channel-input-proc_65531066AA923520D1303477A2A461CC"></a>
### FUNCTION: `TCL-CHANNEL-INPUT-PROC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN-TYPE-PTR)`
- SETF? `NIL`

/* 403 */ EXTERN Tcl_DriverInputProc *
Tcl_ChannelInputProc(const Tcl_ChannelType *chanTypePtr);

<a name="api-function-tcl-channel-name_C6CC6C07CDD2D5BFC725D97AE4B78C39"></a>
### FUNCTION: `TCL-CHANNEL-NAME`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN-TYPE-PTR)`
- SETF? `NIL`

/* 398 */ EXTERN const char * Tcl_ChannelName(const Tcl_ChannelType *chanTypePtr);

<a name="api-function-tcl-channel-output-proc_1A2C44F45D8C4F3CDC7E4E59A4FDA900"></a>
### FUNCTION: `TCL-CHANNEL-OUTPUT-PROC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN-TYPE-PTR)`
- SETF? `NIL`

/* 404 */ EXTERN Tcl_DriverOutputProc *
Tcl_ChannelOutputProc(const Tcl_ChannelType *chanTypePtr);

<a name="api-function-tcl-channel-set-option-proc_D21710C3F48FE22E01428AB3AC1E7484"></a>
### FUNCTION: `TCL-CHANNEL-SET-OPTION-PROC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN-TYPE-PTR)`
- SETF? `NIL`

/* 406 */ EXTERN Tcl_DriverSetOptionProc *
Tcl_ChannelSetOptionProc(const Tcl_ChannelType *chanTypePtr);

<a name="api-function-tcl-channel-thread-action-proc_E41563CB703DEECB406C64EEED4813D9"></a>
### FUNCTION: `TCL-CHANNEL-THREAD-ACTION-PROC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN-TYPE-PTR)`
- SETF? `NIL`

/* 554 */ EXTERN Tcl_DriverThreadActionProc *
Tcl_ChannelThreadActionProc(const Tcl_ChannelType *chanTypePtr);

<a name="api-function-tcl-channel-truncate-proc_B2277CB7FBDAE21F8B19C8FAF8D8E49B"></a>
### FUNCTION: `TCL-CHANNEL-TRUNCATE-PROC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN-TYPE-PTR)`
- SETF? `NIL`

/* 561 */ EXTERN Tcl_DriverTruncateProc *
Tcl_ChannelTruncateProc(const Tcl_ChannelType *chanTypePtr);

<a name="api-function-tcl-channel-version_90AFD02BE1A49DAA8BA07CF800D2A71F"></a>
### FUNCTION: `TCL-CHANNEL-VERSION`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN-TYPE-PTR)`
- SETF? `NIL`

/* 399 */ EXTERN Tcl_ChannelTypeVersion
Tcl_ChannelVersion(const Tcl_ChannelType *chanTypePtr);

<a name="api-function-tcl-channel-watch-proc_729DB4751D47BEB70A010401C9476946"></a>
### FUNCTION: `TCL-CHANNEL-WATCH-PROC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN-TYPE-PTR)`
- SETF? `NIL`

/* 408 */ EXTERN Tcl_DriverWatchProc *
Tcl_ChannelWatchProc(const Tcl_ChannelType *chanTypePtr);

<a name="api-function-tcl-channel-wide-seek-proc_8679CB1E431EBE0070B25BF4B0EB3364"></a>
### FUNCTION: `TCL-CHANNEL-WIDE-SEEK-PROC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN-TYPE-PTR)`
- SETF? `NIL`

/* 493 */ EXTERN Tcl_DriverWideSeekProc *
Tcl_ChannelWideSeekProc(const Tcl_ChannelType *chanTypePtr);

<a name="api-function-tcl-char16-len_57F0161D6AEF4312318D91DC3ACCF82E"></a>
### FUNCTION: `TCL-CHAR16-LEN`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::UNI-STR)`
- SETF? `NIL`

/* 352 */ EXTERN Tcl_Size Tcl_Char16Len(const unsigned short *uniStr);

<a name="api-function-tcl-char16-to-utf-d-string_ADAE882A1CDFA286B08CDD9DB7EE6C73"></a>
### FUNCTION: `TCL-CHAR16-TO-UTF-D-STRING`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::UNI-STR RAW-CFFI-TCL9::UNI-LENGTH RAW-CFFI-TCL9::DS-PTR)`
- SETF? `NIL`

/* 354 */ EXTERN char *
Tcl_Char16ToUtfDString(
  const unsigned short *uniStr, Tcl_Size uniLength, Tcl_DString *dsPtr);

<a name="api-function-tcl-chdir_046BED12E68B31073B71DF4B0BD001FF"></a>
### FUNCTION: `TCL-CHDIR`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::DIR-NAME)`
- SETF? `NIL`

/* 366 */ EXTERN int Tcl_Chdir(const char *dirName);

<a name="api-function-tcl-clear-channel-handlers_B5AE029B0135096475D34B7F732DEFB7"></a>
### FUNCTION: `TCL-CLEAR-CHANNEL-HANDLERS`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN)`
- SETF? `NIL`

/* 417 */ EXTERN void Tcl_ClearChannelHandlers(Tcl_Channel channel);

<a name="api-function-tcl-close-ex_FEF823C8DFF36437CACE161A04AC9F39"></a>
### FUNCTION: `TCL-CLOSE-EX`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 624 */ EXTERN int
Tcl_CloseEx(Tcl_Interp *interp, Tcl_Channel chan, int flags);

<a name="api-function-tcl-close_CA43390C85327B8341FBCA12869C05AD"></a>
### FUNCTION: `TCL-CLOSE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::CHAN)`
- SETF? `NIL`


<a name="api-function-tcl-command-complete_4F5E75BBD2A6E3C0D875C879E9C1D7F0"></a>
### FUNCTION: `TCL-COMMAND-COMPLETE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CMD)`
- SETF? `NIL`

/* 82 */ EXTERN int
Tcl_CommandComplete(const char *cmd);

<a name="api-function-tcl-command-trace-info_5364F1241E34289670911063F5F155B1"></a>
### FUNCTION: `TCL-COMMAND-TRACE-INFO`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::VAR-NAME RAW-CFFI-TCL9::FLAGS
 RAW-CFFI-TCL9::CMD-TRACE-PROC RAW-CFFI-TCL9::PREV-CLIENT-DATE)`
- SETF? `NIL`

/* 425 */ EXTERN void *
Tcl_CommandTraceInfo(
  Tcl_Interp *interp, const char *varName, int flags,
  Tcl_CommandTraceProc *procPtr, void *prevClientData);

<a name="api-function-tcl-concat-obj_8E0DA8FFD581B8D3C52C4F654BC51217"></a>
### FUNCTION: `TCL-CONCAT-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9::OBJV)`
- SETF? `NIL`

/* 17 */ EXTERN Tcl_Obj *
Tcl_ConcatObj(Tcl_Size objc, Tcl_Obj *const objv[]);

<a name="api-function-tcl-concat_59271C5ED48D58F3392911D3F1284CC8"></a>
### FUNCTION: `TCL-CONCAT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ARGC RAW-CFFI-TCL9::ARGV)`
- SETF? `NIL`

/* 83 */ EXTERN char *
Tcl_Concat(Tcl_Size argc, const char *const *argv);

<a name="api-function-tcl-condition-finalize_094DFB0E94735A026B9FFDEF15809C99"></a>
### FUNCTION: `TCL-CONDITION-FINALIZE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::COND-PTR)`
- SETF? `NIL`

/* 391 */ EXTERN void Tcl_ConditionFinalize(Tcl_Condition *condPtr);

<a name="api-function-tcl-condition-notify_9ECB36DE4929A2B7981A1C42D09B23EE"></a>
### FUNCTION: `TCL-CONDITION-NOTIFY`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::COND-PTR)`
- SETF? `NIL`

/* 310 */ EXTERN void Tcl_ConditionNotify(Tcl_Condition *condPtr);

<a name="api-function-tcl-condition-wait_3816602F91E4BD193BEEDAF69C74667C"></a>
### FUNCTION: `TCL-CONDITION-WAIT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::COND-PTR RAW-CFFI-TCL9::MUTEX-PTR RAW-CFFI-TCL9::TIME-PTR)`
- SETF? `NIL`

/* 311 */ EXTERN void
Tcl_ConditionWait(
  Tcl_Condition *condPtr, Tcl_Mutex *mutexPtr, const Tcl_Time *timePtr);

<a name="api-function-tcl-convert-counter-element_2242AC73E2040D06CB5A38BFE0B55EC2"></a>
### FUNCTION: `TCL-CONVERT-COUNTER-ELEMENT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC LENGTH RAW-CFFI-TCL9::DST RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 85 */ EXTERN Tcl_Size
Tcl_ConvertCountedElement(
  const char *src, Tcl_Size length, char *dst, int flags);

<a name="api-function-tcl-convert-element_67DA914A78935B7B9E3BEB3BBDA516EA"></a>
### FUNCTION: `TCL-CONVERT-ELEMENT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC RAW-CFFI-TCL9::DST RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 84 */ EXTERN Tcl_Size
Tcl_ConvertElement(const char *src, char *dst, int flags);

<a name="api-function-tcl-convert-to-type_1AD6F13A8E812499E328D2BF2DA1A221"></a>
### FUNCTION: `TCL-CONVERT-TO-TYPE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::TYPE-PTR)`
- SETF? `NIL`

/* 18 */ EXTERN int
Tcl_ConvertToType(
  Tcl_Interp *interp, Tcl_Obj *objPtr,
  const Tcl_ObjType *typePtr);

<a name="api-function-tcl-create-alias-obj_3F0396D3C746163D2DEA7D2BAB13F8D1"></a>
### FUNCTION: `TCL-CREATE-ALIAS-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHILD-INTERP RAW-CFFI-TCL9::CHILD-CMD RAW-CFFI-TCL9::TARGET
 RAW-CFFI-TCL9::TARGET-CMD RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9::OBJV)`
- SETF? `NIL`

/* 87 */ EXTERN int
Tcl_CreateAliasObj(
  Tcl_Interp *childInterp,
  const char *childCmd, Tcl_Interp *target,
  const char *targetCmd, Tcl_Size objc,
  Tcl_Obj *const objv[]);

<a name="api-function-tcl-create-alias_3C42086B1161273640D5715D38ED5457"></a>
### FUNCTION: `TCL-CREATE-ALIAS`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHILD-INTERP RAW-CFFI-TCL9::CHILD-CMD RAW-CFFI-TCL9::TARGET
 RAW-CFFI-TCL9::TARGET-CMD RAW-CFFI-TCL9::ARGC RAW-CFFI-TCL9::ARGV)`
- SETF? `NIL`

/* 86 */ EXTERN int
Tcl_CreateAlias(
  Tcl_Interp *childInterp,
  const char *childCmd, Tcl_Interp *target,
  const char *targetCmd, Tcl_Size argc,
  const char *const *argv);

<a name="api-function-tcl-create-channel-handler_D0CD54B9F4BA3B380A463BB63B45DAB7"></a>
### FUNCTION: `TCL-CREATE-CHANNEL-HANDLER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9::MASK RAW-CFFI-TCL9::CHAN-PROC
 RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 89 */ EXTERN void
Tcl_CreateChannelHandler(
  Tcl_Channel chan, int mask, Tcl_ChannelProc *proc, void *clientData);

<a name="api-function-tcl-create-channel_0432048197F1C9C1F90D3F9AC1A2D0A0"></a>
### FUNCTION: `TCL-CREATE-CHANNEL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::TYPE-PTR RAW-CFFI-TCL9::CHAN-NAME RAW-CFFI-TCL9::INSTANCE-DATA
 RAW-CFFI-TCL9::MASK)`
- SETF? `NIL`

/* 88 */ EXTERN Tcl_Channel
Tcl_CreateChannel(
  const Tcl_ChannelType *typePtr,
  const char *chanName, void *instanceData, int mask);

<a name="api-function-tcl-create-child_74C6CE26114F318D1C3E66F5CDA4CA7C"></a>
### FUNCTION: `TCL-CREATE-CHILD`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::NAME RAW-CFFI-TCL9::IS-SAFE)`
- SETF? `NIL`

/* 97 */ EXTERN Tcl_Interp *
Tcl_CreateChild(
  Tcl_Interp *interp, const char *name, int isSafe);

<a name="api-function-tcl-create-close-handler_0B2D6D3DD6544ED63675E96C08AE03A0"></a>
### FUNCTION: `TCL-CREATE-CLOSE-HANDLER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:CLOSE-PROC RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 90 */ EXTERN void
Tcl_CreateCloseHandler(
  Tcl_Channel chan,Tcl_CloseProc *proc, void *clientData);

<a name="api-function-tcl-create-command_54B1B8CA64B3A4759E044D20857E21E9"></a>
### FUNCTION: `TCL-CREATE-COMMAND`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::CMD-NAME RAW-CFFI-TCL9::CMD-PROC
 RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CMD-DELETE-PROC)`
- SETF? `NIL`

/* 91 */ EXTERN Tcl_Command
Tcl_CreateCommand(
  Tcl_Interp *interp,
  const char *cmdName, Tcl_CmdProc *proc,
  void *clientData, Tcl_CmdDeleteProc *deleteProc);

<a name="api-function-tcl-create-encoding_2B9A0A4438B1BDB571D8BFD60DA39FD4"></a>
### FUNCTION: `TCL-CREATE-ENCODING`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::TYPE-PTR)`
- SETF? `NIL`

/* 287 */ EXTERN Tcl_Encoding
Tcl_CreateEncoding(const Tcl_EncodingType *typePtr);

<a name="api-function-tcl-create-ensemble_AE5CA5DD64656501B79EB6A04C0160C0"></a>
### FUNCTION: `TCL-CREATE-ENSEMBLE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::NAME RAW-CFFI-TCL9::NAMESPACE-PTR
 RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 541 */ EXTERN Tcl_Command
Tcl_CreateEnsemble(
  Tcl_Interp *interp, const char *name, Tcl_Namespace *namespacePtr, int flags);

<a name="api-function-tcl-create-event-source_9A745C52C6EF5073418CBDA74BDC72EA"></a>
### FUNCTION: `TCL-CREATE-EVENT-SOURCE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SETUP-PROC RAW-CFFI-TCL9::CHECK-PROC RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 92 */ EXTERN void
Tcl_CreateEventSource(
  Tcl_EventSetupProc *setupProc,
  Tcl_EventCheckProc *checkProc,
  void *clientData);

<a name="api-function-tcl-create-exit-handler_60C2F921123D34F75D7092E71A9C6021"></a>
### FUNCTION: `TCL-CREATE-EXIT-HANDLER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::EXIT-PROC RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 93 */ EXTERN void
Tcl_CreateExitHandler(Tcl_ExitProc *proc, void *clientData);

<a name="api-function-tcl-create-file-handler_9C52964F46D445C7FE475CBFAC7EB223"></a>
### FUNCTION: `TCL-CREATE-FILE-HANDLER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::FD RAW-CFFI-TCL9::MASK RAW-CFFI-TCL9::FILE-PROC
 RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 9 */ EXTERN void
Tcl_CreateFileHandler(
  int fd, int mask, Tcl_FileProc *proc, void *clientData);

<a name="api-function-tcl-create-namespace_C3B7AAB06C2F79F745B1FB28036F13E2"></a>
### FUNCTION: `TCL-CREATE-NAMESPACE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::NAME RAW-CFFI-TCL9::CLIENT-DATA
 RAW-CFFI-TCL9::NAMESPACE-DELETE-PROC)`
- SETF? `NIL`

/* 506 */ EXTERN Tcl_Namespace *
Tcl_CreateNamespace(
  Tcl_Interp *interp, const char *name, void *clientData,
  Tcl_NamespaceDeleteProc *deleteProc);

<a name="api-function-tcl-create-obj-command2_9BBC749F9581A2ECDD8AB3AA5A4664EF"></a>
### FUNCTION: `TCL-CREATE-OBJ-COMMAND2`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::CMD-NAME RAW-CFFI-TCL9::PROC2
 RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::DELETE-PROC)`
- SETF? `NIL`

/* 676 */ EXTERN Tcl_Command
Tcl_CreateObjCommand2(
  Tcl_Interp *interp, const char *cmdName, Tcl_ObjCmdProc2 *proc2,
  void *clientData, Tcl_CmdDeleteProc *deleteProc);

<a name="api-function-tcl-create-obj-command_D745AE5C0CC104803419BE8BBB081B72"></a>
### FUNCTION: `TCL-CREATE-OBJ-COMMAND`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::CMD-NAME RAW-CFFI-TCL9::OBJ-CMD-PROC
 RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::CMD-DELETE-PROC)`
- SETF? `NIL`

/* 96 */ EXTERN Tcl_Command
Tcl_CreateObjCommand(
  Tcl_Interp *interp,
  const char *cmdName, Tcl_ObjCmdProc *proc,
  void *clientData,
  Tcl_CmdDeleteProc *deleteProc);

<a name="api-function-tcl-create-obj-trace2_14F39EDA222C55A69D586535197DF439"></a>
### FUNCTION: `TCL-CREATE-OBJ-TRACE2`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::LEVEL RAW-CFFI-TCL9::FLAGS
 RAW-CFFI-TCL9::OBJ-PROC2 RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::DEL-PROC)`
- SETF? `NIL`

/* 677 */ EXTERN Tcl_Trace
Tcl_CreateObjTrace2(
  Tcl_Interp *interp, Tcl_Size level, int flags,
  Tcl_CmdObjTraceProc2 *objProc2, void *clientData,
  Tcl_CmdObjTraceDeleteProc *delProc);

<a name="api-function-tcl-create-obj-trace_9533853102BBBDF84A1032FE2E27074F"></a>
### FUNCTION: `TCL-CREATE-OBJ-TRACE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::LEVEL RAW-CFFI-TCL9::FLAGS
 RAW-CFFI-TCL9::OBJ-PROC RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::DEL-PROC)`
- SETF? `NIL`

/* 483 */ EXTERN Tcl_Trace
Tcl_CreateObjTrace(
  Tcl_Interp *interp, Tcl_Size level, int flags,
  Tcl_CmdObjTraceProc *objProc, void *clientData,
  Tcl_CmdObjTraceDeleteProc *delProc);

<a name="api-function-tcl-create-pipe_3C96273E6C38BE22A6F155D2AD5224C3"></a>
### FUNCTION: `TCL-CREATE-PIPE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::RCHAN RAW-CFFI-TCL9::WCHAN
 RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 582 */ EXTERN int
Tcl_CreatePipe(
  Tcl_Interp *interp, Tcl_Channel *rchan, Tcl_Channel *wchan, int flags);

<a name="api-function-tcl-create-thread-exit-handler_CE85F04A06B87D5AF06B104E820FF984"></a>
### FUNCTION: `TCL-CREATE-THREAD-EXIT-HANDLER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::EXIT-PROC RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 288 */ EXTERN void
Tcl_CreateThreadExitHandler(Tcl_ExitProc *proc, void *clientData);

<a name="api-function-tcl-create-thread_9FDBB599556BE37299ED5166E44248A6"></a>
### FUNCTION: `TCL-CREATE-THREAD`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ID-PTR RAW-CFFI-TCL9::PROC RAW-CFFI-TCL9::CLIENT-DATA
 RAW-CFFI-TCL9::STACK-SIZE RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 393 */ EXTERN int
Tcl_CreateThread(
  Tcl_ThreadId *idPtr, Tcl_ThreadCreateProc *proc, void *clientData,
  TCL_HASH_TYPE stackSize, int flags);

<a name="api-function-tcl-create-timer-handler_4AC3F87A1F1663CCBB4982A2FA9E2452"></a>
### FUNCTION: `TCL-CREATE-TIMER-HANDLER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::MILLISECONDS RAW-CFFI-TCL9::TIMER-PROC
 RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 98 */ EXTERN Tcl_TimerToken
Tcl_CreateTimerHandler(
  int milliseconds, Tcl_TimerProc *proc, void *clientData);

<a name="api-function-tcl-create-trace_75CAFA2F3832807779A4499CD6E07612"></a>
### FUNCTION: `TCL-CREATE-TRACE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::LEVEL RAW-CFFI-TCL9::CMD-TRACE-PROC
 RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 99 */ EXTERN Tcl_Trace
Tcl_CreateTrace(
  Tcl_Interp *interp, Tcl_Size level,
  Tcl_CmdTraceProc *proc, void *clientData);

<a name="api-function-tcl-cut-channel_EEC89064A4445564DDEB201F7F75AFF6"></a>
### FUNCTION: `TCL-CUT-CHANNEL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN)`
- SETF? `NIL`

/* 415 */ EXTERN void Tcl_CutChannel(Tcl_Channel channel);

<a name="api-function-tcl-d-string-append-element_A71114706FA5144C1A86696E8EF1D122"></a>
### FUNCTION: `TCL-D-STRING-APPEND-ELEMENT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::DS-PTR RAW-CFFI-TCL9::ELEMENT)`
- SETF? `NIL`

/* 118 */ EXTERN char *
Tcl_DStringAppendElement(Tcl_DString *dsPtr, const char *element);

<a name="api-function-tcl-d-string-append_354BE93E06EA077E6EC6E7CAED06EB80"></a>
### FUNCTION: `TCL-D-STRING-APPEND`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::DS-PTR RAW-CFFI-TCL9::BYTES LENGTH)`
- SETF? `NIL`

/* 117 */ EXTERN char *
Tcl_DStringAppend(
  Tcl_DString *dsPtr, const char *bytes, Tcl_Size length);

<a name="api-function-tcl-d-string-end-sublist_F26CF0F2EEE2329A90272A29D27A6B4F"></a>
### FUNCTION: `TCL-D-STRING-END-SUBLIST`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::DS-PTR)`
- SETF? `NIL`

/* 119 */ EXTERN void
Tcl_DStringEndSublist(Tcl_DString *dsPtr);

<a name="api-function-tcl-d-string-free_4EA6A5F9643CC9BB3A985703FB71D6A5"></a>
### FUNCTION: `TCL-D-STRING-FREE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::DS-PTR)`
- SETF? `NIL`

/* 120 */ EXTERN void Tcl_DStringFree(Tcl_DString *dsPtr);

<a name="api-function-tcl-d-string-get-result_56BE2B92FDF254019ED68614C6F29304"></a>
### FUNCTION: `TCL-D-STRING-GET-RESULT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::DS-PTR)`
- SETF? `NIL`

/* 121 */ EXTERN void
Tcl_DStringGetResult(Tcl_Interp *interp, Tcl_DString *dsPtr);

<a name="api-function-tcl-d-string-init_FA9ABABC12B192A000B0862B116CEE74"></a>
### FUNCTION: `TCL-D-STRING-INIT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::DS-PTR)`
- SETF? `NIL`

/* 122 */ EXTERN void Tcl_DStringInit(Tcl_DString *dsPtr);

<a name="api-function-tcl-d-string-result_CB994BB62EFA371F5713451401DDEA15"></a>
### FUNCTION: `TCL-D-STRING-RESULT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::DS-PTR)`
- SETF? `NIL`

/* 123 */ EXTERN void
Tcl_DStringResult(Tcl_Interp *interp, Tcl_DString *dsPtr);

<a name="api-function-tcl-d-string-set-length_42F0BA5C86B0C1C7C9A76178A88C3B7A"></a>
### FUNCTION: `TCL-D-STRING-SET-LENGTH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::DS-PTR LENGTH)`
- SETF? `NIL`

/* 124 */ EXTERN void
Tcl_DStringSetLength(Tcl_DString *dsPtr, Tcl_Size length);

<a name="api-function-tcl-d-string-start-sublist_2FCF145F290E5359F1662BC813AF9B0D"></a>
### FUNCTION: `TCL-D-STRING-START-SUBLIST`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::DS-PTR)`
- SETF? `NIL`

/* 125 */ EXTERN void
Tcl_DStringStartSublist(Tcl_DString *dsPtr);

<a name="api-function-tcl-d-string-to-obj_C925DA75CD1370C82FE45AC40EBE09F0"></a>
### FUNCTION: `TCL-D-STRING-TO-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::DS-PTR)`
- SETF? `NIL`

/* 685 */ EXTERN Tcl_Obj * Tcl_DStringToObj(Tcl_DString *dsPtr);

<a name="api-function-tcl-db-ckalloc_3ED23A6278BDF6F88B5AE6A551E1AE6C"></a>
### FUNCTION: `TCL-DB-CKALLOC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SIZE RAW-CFFI-TCL9::FILE RAW-CFFI-TCL9::LINE)`
- SETF? `NIL`

/* 6 */ EXTERN void *
Tcl_DbCkalloc(TCL_HASH_TYPE size, const char *file, int line);

<a name="api-function-tcl-db-ckfree_7836ADAC786F81503CCBB22A12EAF852"></a>
### FUNCTION: `TCL-DB-CKFREE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PTR RAW-CFFI-TCL9::FILE RAW-CFFI-TCL9::LINE)`
- SETF? `NIL`

/* 7 */ EXTERN void
Tcl_DbCkfree(void *ptr, const char *file, int line);

<a name="api-function-tcl-db-ckrealloc_86534ABDBCA1D9D96089CD85D1E562DA"></a>
### FUNCTION: `TCL-DB-CKREALLOC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PTR RAW-CFFI-TCL9::SIZE RAW-CFFI-TCL9::FILE RAW-CFFI-TCL9::LINE)`
- SETF? `NIL`

/* 8 */ EXTERN void *
Tcl_DbCkrealloc(void *ptr, TCL_HASH_TYPE size, const char *file, int line);

<a name="api-function-tcl-db-decr-ref-count_CCA636AABBBECCE6077A0EC8DCD13C6B"></a>
### FUNCTION: `TCL-DB-DECR-REF-COUNT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::FILE RAW-CFFI-TCL9::LINE)`
- SETF? `NIL`

/* 19 */ EXTERN void
Tcl_DbDecrRefCount(
Tcl_Obj *objPtr, const char *file, int line);

<a name="api-function-tcl-db-incr-ref-count_BF58DA7033E6780EE3EBB9F6E18F5C9C"></a>
### FUNCTION: `TCL-DB-INCR-REF-COUNT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::FILE RAW-CFFI-TCL9::LINE)`
- SETF? `NIL`

/* 20 */ EXTERN void
Tcl_DbIncrRefCount(
  Tcl_Obj *objPtr, const char *file, int line);

<a name="api-function-tcl-db-is-shared_5EA2BE5CB779B59082901CE0105CA02F"></a>
### FUNCTION: `TCL-DB-IS-SHARED`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::FILE RAW-CFFI-TCL9::LINE)`
- SETF? `NIL`

/* 21 */ EXTERN int
Tcl_DbIsShared(
  Tcl_Obj *objPtr, const char *file, int line);

<a name="api-function-tcl-db-new-bignum-obj_19B00F5FBC96ACB5BBC773C0FBEE133D"></a>
### FUNCTION: `TCL-DB-NEW-BIGNUM-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::VALUE RAW-CFFI-TCL9::FILE RAW-CFFI-TCL9::LINE)`
- SETF? `NIL`

/* 556 */ EXTERN Tcl_Obj *
Tcl_DbNewBignumObj(void *value, const char *file, int line);

<a name="api-function-tcl-db-new-boolean-obj_1E64298C830AD792E90512B6D9A534C1"></a>
### FUNCTION: `TCL-DB-NEW-BOOLEAN-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INT-VALUE RAW-CFFI-TCL9::FILE RAW-CFFI-TCL9::LINE)`
- SETF? `NIL`


<a name="api-function-tcl-db-new-byte-array-obj_85D9D506434B2F2D78C0903CF4BEC75F"></a>
### FUNCTION: `TCL-DB-NEW-BYTE-ARRAY-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::BYTES LENGTH RAW-CFFI-TCL9::FILE RAW-CFFI-TCL9::LINE)`
- SETF? `NIL`

/* 23 */ EXTERN Tcl_Obj *
Tcl_DbNewByteArrayObj(
  const unsigned char *bytes, Tcl_Size numBytes,
  const char *file, int line);

<a name="api-function-tcl-db-new-dict-obj_BDB8B8FAEB08AA901EAC38F8574ED4A1"></a>
### FUNCTION: `TCL-DB-NEW-DICT-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::FILE RAW-CFFI-TCL9::LINE)`
- SETF? `NIL`

/* 504 */ EXTERN Tcl_Obj * Tcl_DbNewDictObj(const char *file, int line);

<a name="api-function-tcl-db-new-double-obj_D3EA7B1AA82D3B6A1548A74A6B4312C6"></a>
### FUNCTION: `TCL-DB-NEW-DOUBLE-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::DOUBLE-VAL RAW-CFFI-TCL9::FILE RAW-CFFI-TCL9::LINE)`
- SETF? `NIL`

/* 24 */ EXTERN Tcl_Obj *
Tcl_DbNewDoubleObj(
  double doubleValue, const char *file, int line);

<a name="api-function-tcl-db-new-list-obj_AAF6A042BE617A1C97BA24F0422C48E0"></a>
### FUNCTION: `TCL-DB-NEW-LIST-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9::OBJV RAW-CFFI-TCL9::FILE
 RAW-CFFI-TCL9::LINE)`
- SETF? `NIL`

/* 25 */ EXTERN Tcl_Obj *
Tcl_DbNewListObj(
  Tcl_Size objc, Tcl_Obj *const *objv,
  const char *file, int line);

<a name="api-function-tcl-db-new-long-obj_4DAED8849DA7790577831F356A6F29DE"></a>
### FUNCTION: `TCL-DB-NEW-LONG-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::VALUE RAW-CFFI-TCL9::FILE RAW-CFFI-TCL9::LINE)`
- SETF? `NIL`


<a name="api-function-tcl-db-new-obj_9D80A3F14D3BBA3FB6FED6038DFC620B"></a>
### FUNCTION: `TCL-DB-NEW-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::FILE RAW-CFFI-TCL9::LINE)`
- SETF? `NIL`

/* 27 */ EXTERN Tcl_Obj *
Tcl_DbNewObj(const char *file, int line);

<a name="api-function-tcl-db-new-string-obj_ADC17155248B4D60C95E4C54AAD1429F"></a>
### FUNCTION: `TCL-DB-NEW-STRING-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::BYTES LENGTH RAW-CFFI-TCL9::FILE RAW-CFFI-TCL9::LINE)`
- SETF? `NIL`

/* 28 */ EXTERN Tcl_Obj *
Tcl_DbNewStringObj(
  const char *bytes, Tcl_Size length,
  const char *file, int line);

<a name="api-function-tcl-db-new-wide-int-obj_4A7FDDA8B0509614D4F6C5485FBCBE8F"></a>
### FUNCTION: `TCL-DB-NEW-WIDE-INT-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::WIDE-VALUE RAW-CFFI-TCL9::FILE RAW-CFFI-TCL9::LINE)`
- SETF? `NIL`

/* 486 */ EXTERN Tcl_Obj *
Tcl_DbNewWideIntObj(Tcl_WideInt wideValue, const char *file, int line);

<a name="api-function-tcl-decr-ref-count_E48BAFEA3B88B3F564DEAE3CA61EEEDE"></a>
### FUNCTION: `TCL-DECR-REF-COUNT*`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`


<a name="api-function-tcl-decr-ref-count_F9931F1440C3883E804FACEA9B475163"></a>
### FUNCTION: `TCL-DECR-REF-COUNT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`

/* 642 */ EXTERN void Tcl_DecrRefCount(Tcl_Obj *objPtr);

<a name="api-function-tcl-delete-assoc-data_FB429449A5A7BFFF86E70C9098290A95"></a>
### FUNCTION: `TCL-DELETE-ASSOC-DATA`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::NAME)`
- SETF? `NIL`

/* 100 */ EXTERN void
Tcl_DeleteAssocData(Tcl_Interp *interp, const char *name);

<a name="api-function-tcl-delete-channel-handler_7329A13608E8FE0A3BC2158F5D460863"></a>
### FUNCTION: `TCL-DELETE-CHANNEL-HANDLER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9::CHAN-PROC RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 101 */ EXTERN void
Tcl_DeleteChannelHandler(
  Tcl_Channel chan, Tcl_ChannelProc *proc, void *clientData);

<a name="api-function-tcl-delete-close-handler_53CE31749BA08F19198AD7221ADAA449"></a>
### FUNCTION: `TCL-DELETE-CLOSE-HANDLER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9:CLOSE-PROC RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 102 */ EXTERN void
Tcl_DeleteCloseHandler(
  Tcl_Channel chan, Tcl_CloseProc *proc, void *clientData);

<a name="api-function-tcl-delete-command-from-token_41678CE54D0BB80961CC70CCD9277329"></a>
### FUNCTION: `TCL-DELETE-COMMAND-FROM-TOKEN`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::COMMAND)`
- SETF? `NIL`

/* 104 */ EXTERN int
Tcl_DeleteCommandFromToken(Tcl_Interp *interp, Tcl_Command command);

<a name="api-function-tcl-delete-command_4CA53C2D7E71F1860D1E195D0AB88071"></a>
### FUNCTION: `TCL-DELETE-COMMAND`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::CMD-NAME)`
- SETF? `NIL`

/* 103 */ EXTERN int
Tcl_DeleteCommand(Tcl_Interp *interp, const char *cmdName);

<a name="api-function-tcl-delete-event-source_20A84300D6EC1E64622CB76A5DD8570F"></a>
### FUNCTION: `TCL-DELETE-EVENT-SOURCE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::EVT-SETUP-PROC RAW-CFFI-TCL9::EVT-CHECK-PROC
 RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 106 */ EXTERN void
Tcl_DeleteEventSource(
  Tcl_EventSetupProc *setupProc,
  Tcl_EventCheckProc *checkProc,
  void *clientData);

<a name="api-function-tcl-delete-events_D504FEBB3D56D9BF5E8A606A1A93E43E"></a>
### FUNCTION: `TCL-DELETE-EVENTS`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::EVT-DELETE-PROC RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 105 */ EXTERN void
Tcl_DeleteEvents(Tcl_EventDeleteProc *proc, void *clientData);

<a name="api-function-tcl-delete-exit-handler_FFEDC9FA033B37B1CFFF5CF28EDFF346"></a>
### FUNCTION: `TCL-DELETE-EXIT-HANDLER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::EXIT-PROC RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 107 */ EXTERN void
Tcl_DeleteExitHandler(Tcl_ExitProc *proc, void *clientData);

<a name="api-function-tcl-delete-file-handler_68DE3F4E112C2848CEA5840F113BA6FE"></a>
### FUNCTION: `TCL-DELETE-FILE-HANDLER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::FD)`
- SETF? `NIL`

/* 10 */ EXTERN void
Tcl_DeleteFileHandler(int fd);

<a name="api-function-tcl-delete-hash-entry_6BA2FDA40CA0EF3D659F79399A7D203A"></a>
### FUNCTION: `TCL-DELETE-HASH-ENTRY`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::HASH-ENTRY-PTR)`
- SETF? `NIL`

/* 108 */ EXTERN void
Tcl_DeleteHashEntry(Tcl_HashEntry *entryPtr);

<a name="api-function-tcl-delete-hash-table_ABF9C6623BF2AB6A00203584BAA70ECC"></a>
### FUNCTION: `TCL-DELETE-HASH-TABLE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::HASH-TABLE-PTR)`
- SETF? `NIL`

/* 109 */ EXTERN void
Tcl_DeleteHashTable(Tcl_HashTable *tablePtr);

<a name="api-function-tcl-delete-interp_A7CAB9052960C8D79740A3FCB898F0BD"></a>
### FUNCTION: `TCL-DELETE-INTERP*`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`


<a name="api-function-tcl-delete-interp_A32C222335C9C4E64D86893753BB60DA"></a>
### FUNCTION: `TCL-DELETE-INTERP`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`

/* 110 */ EXTERN void Tcl_DeleteInterp(Tcl_Interp *interp);

<a name="api-function-tcl-delete-namespace_9C1CEC9EC052E625AA9DD46ED6945D9B"></a>
### FUNCTION: `TCL-DELETE-NAMESPACE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::NS-PTR)`
- SETF? `NIL`

/* 507 */ EXTERN void Tcl_DeleteNamespace(Tcl_Namespace *nsPtr);

<a name="api-function-tcl-delete-thread-exit-handler_8CC9F7581B931B72222C325DDFEB61E7"></a>
### FUNCTION: `TCL-DELETE-THREAD-EXIT-HANDLER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::EXIT-PROC RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 289 */ EXTERN void
Tcl_DeleteThreadExitHandler(Tcl_ExitProc *proc, void *clientData);

<a name="api-function-tcl-delete-timer-handler_663EBBB192441CA5E97C0E77966C3937"></a>
### FUNCTION: `TCL-DELETE-TIMER-HANDLER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::TIMER-TOKEN)`
- SETF? `NIL`

/* 112 */ EXTERN void
Tcl_DeleteTimerHandler(Tcl_TimerToken token);

<a name="api-function-tcl-delete-trace_41F44B86484618DA7048C0D5173B83E6"></a>
### FUNCTION: `TCL-DELETE-TRACE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR TRACE)`
- SETF? `NIL`

/* 113 */ EXTERN void
Tcl_DeleteTrace(Tcl_Interp *interp, Tcl_Trace trace);

<a name="api-function-tcl-detach-channel_223838412F07E456DA6C213370A4E286"></a>
### FUNCTION: `TCL-DETACH-CHANNEL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::CHAN)`
- SETF? `NIL`

/* 438 */ EXTERN int
Tcl_DetachChannel(Tcl_Interp *interp, Tcl_Channel channel);

<a name="api-function-tcl-detach-pids_8A31D0169EA5461C51E695982D1DD06C"></a>
### FUNCTION: `TCL-DETACH-PIDS`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::NUM-PIDS RAW-CFFI-TCL9::PID-PTR)`
- SETF? `NIL`

/* 111 */ EXTERN void
Tcl_DetachPids(Tcl_Size numPids, Tcl_Pid *pidPtr);

<a name="api-function-tcl-dict-obj-done_55C8ABF06454677882FE2B20291237B4"></a>
### FUNCTION: `TCL-DICT-OBJ-DONE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SEARCH-PTR)`
- SETF? `NIL`

/* 500 */ EXTERN void Tcl_DictObjDone(Tcl_DictSearch *searchPtr);

<a name="api-function-tcl-dict-obj-first_72E4EEEE02939EAB17286B262B1151AE"></a>
### FUNCTION: `TCL-DICT-OBJ-FIRST`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::DICT-PTR RAW-CFFI-TCL9::SEARCH-PTR
 RAW-CFFI-TCL9::KEY-PTR-PTR RAW-CFFI-TCL9::VALUE-PTR-PTR
 RAW-CFFI-TCL9::DONE-PTR)`
- SETF? `NIL`

/* 498 */ EXTERN int
Tcl_DictObjFirst(
  Tcl_Interp *interp,
  Tcl_Obj *dictPtr, Tcl_DictSearch *searchPtr,
  Tcl_Obj **keyPtrPtr, Tcl_Obj **valuePtrPtr,
  int *donePtr);

<a name="api-function-tcl-dict-obj-get_2FB4A6C722E92A6F27ACFE797943EDE2"></a>
### FUNCTION: `TCL-DICT-OBJ-GET`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::DICT-PTR RAW-CFFI-TCL9::KEY-PTR
 RAW-CFFI-TCL9::VALUE-PTR-PTR)`
- SETF? `NIL`

/* 495 */ EXTERN int
Tcl_DictObjGet(
  Tcl_Interp *interp, Tcl_Obj *dictPtr,
  Tcl_Obj *keyPtr, Tcl_Obj **valuePtrPtr);

<a name="api-function-tcl-dict-obj-next_2A8E8D6163571582E9FAC668A321E2D9"></a>
### FUNCTION: `TCL-DICT-OBJ-NEXT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SEARCH-PTR RAW-CFFI-TCL9::KEY-PTR-PTR
 RAW-CFFI-TCL9::VALUE-PTR-PTR RAW-CFFI-TCL9::DONE-PTR)`
- SETF? `NIL`

/* 499 */ EXTERN void
Tcl_DictObjNext(
  Tcl_DictSearch *searchPtr, Tcl_Obj **keyPtrPtr, Tcl_Obj **valuePtrPtr,
  int *donePtr);

<a name="api-function-tcl-dict-obj-put-key-list_D05FFA0408668E876C3D56B9DB7AFC1A"></a>
### FUNCTION: `TCL-DICT-OBJ-PUT-KEY-LIST`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::DICT-PTR RAW-CFFI-TCL9::KEYC
 RAW-CFFI-TCL9::KEYV RAW-CFFI-TCL9::VALUE-PTR)`
- SETF? `NIL`

/* 501 */ EXTERN int
Tcl_DictObjPutKeyList(
  Tcl_Interp *interp, Tcl_Obj *dictPtr, Tcl_Size keyc,
  Tcl_Obj *const *keyv, Tcl_Obj *valuePtr);

<a name="api-function-tcl-dict-obj-put_96DBB4A8E4FA6888CB2EA1F3B806E878"></a>
### FUNCTION: `TCL-DICT-OBJ-PUT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::DICT-PTR RAW-CFFI-TCL9::KEY-PTR
 RAW-CFFI-TCL9::VALUE-PTR)`
- SETF? `NIL`

/* 494 */ EXTERN int
Tcl_DictObjPut(
  Tcl_Interp *interp, Tcl_Obj *dictPtr, Tcl_Obj *keyPtr, Tcl_Obj *valuePtr);

<a name="api-function-tcl-dict-obj-remove-key-list_39D4731A7298B7D14557C36D999F715B"></a>
### FUNCTION: `TCL-DICT-OBJ-REMOVE-KEY-LIST`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::DICT-PTR RAW-CFFI-TCL9::KEYC
 RAW-CFFI-TCL9::KEYV)`
- SETF? `NIL`

/* 502 */ EXTERN int
Tcl_DictObjRemoveKeyList(
  Tcl_Interp *interp, Tcl_Obj *dictPtr,
  Tcl_Size keyc, Tcl_Obj *const *keyv);

<a name="api-function-tcl-dict-obj-remove_A4AD8641035B39BA0E486FCBA16C13F9"></a>
### FUNCTION: `TCL-DICT-OBJ-REMOVE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::DICT-PTR RAW-CFFI-TCL9::KEY-PTR)`
- SETF? `NIL`

/* 496 */ EXTERN int
Tcl_DictObjRemove(Tcl_Interp *interp, Tcl_Obj *dictPtr, Tcl_Obj *keyPtr);

<a name="api-function-tcl-dict-obj-size_C9CCB456550E3AC365ACB3F88799C87D"></a>
### FUNCTION: `TCL-DICT-OBJ-SIZE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::DICT-OBJ RAW-CFFI-TCL9::SIZE-PTR)`
- SETF? `NIL`

/* 663 */ EXTERN int
Tcl_DictObjSize(Tcl_Interp *interp, Tcl_Obj *dictPtr, Tcl_Size *sizePtr);

<a name="api-function-tcl-discard-interp-state_09F87BB71FD8167FAA5C38256D61D11E"></a>
### FUNCTION: `TCL-DISCARD-INTERP-STATE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::STATE)`
- SETF? `NIL`

/* 537 */ EXTERN void Tcl_DiscardInterpState(Tcl_InterpState state);

<a name="api-function-tcl-do-one-event_AC8C9E0D9357A831A3C22C54EC116B6A"></a>
### FUNCTION: `TCL-DO-ONE-EVENT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 115 */ EXTERN int Tcl_DoOneEvent(int flags);

<a name="api-function-tcl-do-when-idle_F90F534497C8D7248C84BDFD134557D9"></a>
### FUNCTION: `TCL-DO-WHEN-IDLE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::IDLE-PROC RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 116 */ EXTERN void
Tcl_DoWhenIdle(Tcl_IdleProc *proc, void *clientData);

<a name="api-function-tcl-dont-call-when-deleted_CE7CD63841FF08DB14034630908CEDDE"></a>
### FUNCTION: `TCL-DONT-CALL-WHEN-DELETED`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::INTERP-DELETE-PROC
 RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 114 */ EXTERN void
Tcl_DontCallWhenDeleted(
  Tcl_Interp *interp, Tcl_InterpDeleteProc *proc, void *clientData);

<a name="api-function-tcl-dump-active-memory_EF9D135CF27B330E1476BB8F298A9A01"></a>
### FUNCTION: `TCL-DUMP-ACTIVE-MEMORY`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::FILE-NAME)`
- SETF? `NIL`

/* 265 */ EXTERN int Tcl_DumpActiveMemory(const char *fileName);

<a name="api-function-tcl-duplicate-obj_ECBF5FD58E3C00AB52116ACC9911F23F"></a>
### FUNCTION: `TCL-DUPLICATE-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`

/* 29 */ EXTERN Tcl_Obj *
Tcl_DuplicateObj(Tcl_Obj *objPtr);

<a name="api-function-tcl-eof_658407D8FDB13F57F47D9736EEBF0B45"></a>
### FUNCTION: `TCL-EOF`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN)`
- SETF? `NIL`

/* 126 */ EXTERN int
Tcl_Eof(Tcl_Channel chan);

<a name="api-function-tcl-errno-msg_AE0268C3E8873A667957283DBFF3D42B"></a>
### FUNCTION: `TCL-ERRNO-MSG`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ERR)`
- SETF? `NIL`

/* 128 */ EXTERN const char * Tcl_ErrnoMsg(int err);

<a name="api-function-tcl-eval_2CF1E63B39C13DCA243743F633C97137"></a>
### FUNCTION: `TCL-EVAL*`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::SCRIPT)`
- SETF? `NIL`


<a name="api-function-tcl-eval-ex_A250CE4E0B171CCD128EA8C3265559AA"></a>
### FUNCTION: `TCL-EVAL-EX*`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::SCRIPT RAW-CFFI-TCL9::NUM-BYTES
 RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`


<a name="api-function-tcl-eval-ex_131EB786CBDDBB29A159DB3AAABA8236"></a>
### FUNCTION: `TCL-EVAL-EX`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::SCRIPT RAW-CFFI-TCL9::NUM-BYTES
 RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 291 */ EXTERN int
Tcl_EvalEx(Tcl_Interp *interp, const char *script, Tcl_Size numBytes, int flags);

<a name="api-function-tcl-eval-file_57A0AD2C7657F846BF727707D5C8549F"></a>
### FUNCTION: `TCL-EVAL-FILE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::FILE-NAME)`
- SETF? `NIL`

/* 130 */ EXTERN int
Tcl_EvalFile(Tcl_Interp *interp, const char *fileName);

<a name="api-function-tcl-eval-obj-ex_4436271D18B871ED74F58E6B3F21232E"></a>
### FUNCTION: `TCL-EVAL-OBJ-EX`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 293 */ EXTERN int
Tcl_EvalObjEx(Tcl_Interp *interp, Tcl_Obj *objPtr, int flags);

<a name="api-function-tcl-eval-obj_EB950CF82629AE4F0EA81D4999614B86"></a>
### FUNCTION: `TCL-EVAL-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`


<a name="api-function-tcl-eval-objv_B3BA10B0FEC181DD44C6023621482A0A"></a>
### FUNCTION: `TCL-EVAL-OBJV`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9::OBJV
 RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 292 */ EXTERN int
Tcl_EvalObjv(Tcl_Interp *interp, Tcl_Size objc, Tcl_Obj *const objv[], int flags);

<a name="api-function-tcl-eval-tokens-standard_139E39EB562674E60C3AE9E2C9DF7EDF"></a>
### FUNCTION: `TCL-EVAL-TOKENS-STANDARD`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::TOKEN-PTR COUNT)`
- SETF? `NIL`

/* 481 */ EXTERN int
Tcl_EvalTokensStandard(Tcl_Interp *interp, Tcl_Token *tokenPtr, Tcl_Size count);

<a name="api-function-tcl-eval_DF6381299E65F4B1DFC080C8E77C5A10"></a>
### FUNCTION: `TCL-EVAL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`


<a name="api-function-tcl-eventually-free_CF70A41D4D54E2186C8E2C02A1065ACC"></a>
### FUNCTION: `TCL-EVENTUALLY-FREE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::FREE-PROC)`
- SETF? `NIL`

/* 132 */ EXTERN void
Tcl_EventuallyFree(void *clientData, Tcl_FreeProc *freeProc);

<a name="api-function-tcl-exit-thread_618F1C90082BF18CDF25AFCA766F3CF3"></a>
### FUNCTION: `TCL-EXIT-THREAD`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::STATUS)`
- SETF? `NIL`

/* 294 */ EXTERN TCL_NORETURN void Tcl_ExitThread(int status);

<a name="api-function-tcl-exit_2B02D55CD208F90AE84D62376B2E21D7"></a>
### FUNCTION: `TCL-EXIT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::STATUS)`
- SETF? `NIL`

/* 133 */ EXTERN TCL_NORETURN void Tcl_Exit(int status);

<a name="api-function-tcl-export_92BF7E46697F7FB49EAC3A9AE9A4148D"></a>
### FUNCTION: `TCL-EXPORT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::NS-PTR RAW-CFFI-TCL9::PATTERN
 RAW-CFFI-TCL9::RESET-LIST-FIRST)`
- SETF? `NIL`

/* 509 */ EXTERN int
Tcl_Export(
  Tcl_Interp *interp, Tcl_Namespace *nsPtr, const char *pattern, int resetListFirst);

<a name="api-function-tcl-expose-command_D36F2FA324158EF561569C5B79FE0748"></a>
### FUNCTION: `TCL-EXPOSE-COMMAND`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::HIDDEN-CMD-TOKEN
 RAW-CFFI-TCL9::CMD-NAME)`
- SETF? `NIL`

/* 134 */ EXTERN int
Tcl_ExposeCommand(
  Tcl_Interp *interp, const char *hiddenCmdToken, const char *cmdName);

<a name="api-function-tcl-expr-boolean-obj_A44F6C4993C3C64AE93E0064524D14AA"></a>
### FUNCTION: `TCL-EXPR-BOOLEAN-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::PTR)`
- SETF? `NIL`

/* 136 */ EXTERN int
Tcl_ExprBooleanObj(Tcl_Interp *interp, Tcl_Obj *objPtr, int *ptr);

<a name="api-function-tcl-expr-boolean_D16414513339C9E8407F6063750703F8"></a>
### FUNCTION: `TCL-EXPR-BOOLEAN`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::EXPR RAW-CFFI-TCL9::PTR)`
- SETF? `NIL`

/* 135 */ EXTERN int
Tcl_ExprBoolean(Tcl_Interp *interp, const char *expr, int *ptr);

<a name="api-function-tcl-expr-double-obj_CF5F2924587372AC7227A51846456777"></a>
### FUNCTION: `TCL-EXPR-DOUBLE-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::PTR)`
- SETF? `NIL`

/* 138 */ EXTERN int
Tcl_ExprDoubleObj(Tcl_Interp *interp, Tcl_Obj *objPtr, double *ptr);

<a name="api-function-tcl-expr-double_CFB2E51E12701784512939F29FB332FB"></a>
### FUNCTION: `TCL-EXPR-DOUBLE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::EXPR RAW-CFFI-TCL9::PTR)`
- SETF? `NIL`

/* 137 */ EXTERN int
Tcl_ExprDouble(Tcl_Interp *interp, const char *expr, double *ptr);

<a name="api-function-tcl-expr-long-obj_9B4F7E1E4EDC0CE61582945DF6D0CFC2"></a>
### FUNCTION: `TCL-EXPR-LONG-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::PTR)`
- SETF? `NIL`

/* 140 */ EXTERN int
Tcl_ExprLongObj(Tcl_Interp *interp, Tcl_Obj *objPtr, long *ptr);

<a name="api-function-tcl-expr-long_6B21043A96312F18A32EEBA8582E0F11"></a>
### FUNCTION: `TCL-EXPR-LONG`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::EXPR RAW-CFFI-TCL9::PTR)`
- SETF? `NIL`

/* 139 */ EXTERN int
Tcl_ExprLong(Tcl_Interp *interp, const char *expr, long *ptr);

<a name="api-function-tcl-expr-obj_0D62A00104C388E2010B50F70BC70B6A"></a>
### FUNCTION: `TCL-EXPR-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::RESULT-PTR-PTR)`
- SETF? `NIL`

/* 141 */ EXTERN int
Tcl_ExprObj(Tcl_Interp *interp, Tcl_Obj *objPtr, Tcl_Obj **resultPtrPtr);

<a name="api-function-tcl-expr-string_DBC83D47D589655754D84C3D357BB9C4"></a>
### FUNCTION: `TCL-EXPR-STRING`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::EXPR)`
- SETF? `NIL`

/* 142 */ EXTERN int
Tcl_ExprString(Tcl_Interp *interp, const char *expr);

<a name="api-function-tcl-external-to-utf-d-string-ex_9A025D1811C910BE36D7CA8B86BF2D9A"></a>
### FUNCTION: `TCL-EXTERNAL-TO-UTF-D-STRING-EX`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::ENCODING RAW-CFFI-TCL9::SRC
 RAW-CFFI-TCL9::SRC-LEN RAW-CFFI-TCL9::FLAGS RAW-CFFI-TCL9::DS-PTR
 RAW-CFFI-TCL9::ERR-LOC-PTR)`
- SETF? `NIL`

/* 658 */ EXTERN int
Tcl_ExternalToUtfDStringEx(
  Tcl_Interp *interp,
  Tcl_Encoding encoding, const char *src,
  Tcl_Size srcLen, int flags,
  Tcl_DString *dsPtr,
  Tcl_Size *errorLocationPtr);

<a name="api-function-tcl-external-to-utf-d-string_C37E336C9FFD19866AFAB685C96ED44F"></a>
### FUNCTION: `TCL-EXTERNAL-TO-UTF-D-STRING`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ENCODING RAW-CFFI-TCL9::SRC RAW-CFFI-TCL9::SRC-LEN
 RAW-CFFI-TCL9::DS-PTR)`
- SETF? `NIL`

/* 296 */ EXTERN char *
Tcl_ExternalToUtfDString(
  Tcl_Encoding encoding, const char *src, Tcl_Size srcLen, Tcl_DString *dsPtr);

<a name="api-function-tcl-external-to-utf_FD83A261F04291D260CC256257CCEEA1"></a>
### FUNCTION: `TCL-EXTERNAL-TO-UTF`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::ENCODING RAW-CFFI-TCL9::SRC
 RAW-CFFI-TCL9::SRC-LEN RAW-CFFI-TCL9::FLAGS RAW-CFFI-TCL9::STATE-PTR
 RAW-CFFI-TCL9::DST RAW-CFFI-TCL9::DST-LEN RAW-CFFI-TCL9::SRC-READ-PTR
 RAW-CFFI-TCL9::DST-WROTE-PTR RAW-CFFI-TCL9::DST-CHARS-PTR)`
- SETF? `NIL`

/* 295 */ EXTERN int
Tcl_ExternalToUtf(
  Tcl_Interp *interp, Tcl_Encoding encoding, const char *src,
  Tcl_Size srcLen, int flags,
  Tcl_EncodingState *statePtr, char *dst,
  Tcl_Size dstLen, int *srcReadPtr,
  int *dstWrotePtr, int *dstCharsPtr);

<a name="api-function-tcl-fetch-internal-rep_FC938230E08802D84F8F35C5849004F6"></a>
### FUNCTION: `TCL-FETCH-INTERNAL-REP`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::TYPE-PTR)`
- SETF? `NIL`

/* 638 */ EXTERN Tcl_ObjInternalRep *
Tcl_FetchInternalRep(Tcl_Obj *objPtr, const Tcl_ObjType *typePtr);

<a name="api-function-tcl-finalize-notifier_FE06581EF328D16DC2A07A95B7553E3B"></a>
### FUNCTION: `TCL-FINALIZE-NOTIFIER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 298 */ EXTERN void Tcl_FinalizeNotifier(void *clientData);

<a name="api-function-tcl-find-command_29F6474FAAF6D4A7B6E48097BEC13E27"></a>
### FUNCTION: `TCL-FIND-COMMAND`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::NAME RAW-CFFI-TCL9::CONTEXT-NS-PTR
 RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 515 */ EXTERN Tcl_Command
Tcl_FindCommand(
  Tcl_Interp *interp, const char *name,
  Tcl_Namespace *contextNsPtr, int flags);

<a name="api-function-tcl-find-ensemble_BECEA03C052BA0E158BA7A95428B7698"></a>
### FUNCTION: `TCL-FIND-ENSEMBLE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::CMD-NAME-OBJ RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 542 */ EXTERN Tcl_Command
Tcl_FindEnsemble(Tcl_Interp *interp, Tcl_Obj *cmdNameObj, int flags);

<a name="api-function-tcl-find-executable_2BB8AFB437BD9B2939F316502BC62BF3"></a>
### FUNCTION: `TCL-FIND-EXECUTABLE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ARGV0)`
- SETF? `NIL`


<a name="api-function-tcl-find-namespace_2971372040F7D95CCFB47961A2715F05"></a>
### FUNCTION: `TCL-FIND-NAMESPACE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::NAME RAW-CFFI-TCL9::CONTEXT-NS-PTR
 RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 514 */ EXTERN Tcl_Namespace *
Tcl_FindNamespace(
  Tcl_Interp *interp, const char *name, Tcl_Namespace *contextNsPtr, int flags);

<a name="api-function-tcl-find-symbol_051E7EBBEFAD9B044CED06B393B58593"></a>
### FUNCTION: `TCL-FIND-SYMBOL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::HANDLE SYMBOL)`
- SETF? `NIL`

/* 628 */ EXTERN void *
Tcl_FindSymbol(Tcl_Interp *interp, Tcl_LoadHandle handle, const char *symbol);

<a name="api-function-tcl-first-hash-entry_36F71EB5809EAEE7B239CBB47E950536"></a>
### FUNCTION: `TCL-FIRST-HASH-ENTRY`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::TABLE-PTR RAW-CFFI-TCL9::SEARCH-PTR)`
- SETF? `NIL`

/* 145 */ EXTERN Tcl_HashEntry *
Tcl_FirstHashEntry(Tcl_HashTable *tablePtr, Tcl_HashSearch *searchPtr);

<a name="api-function-tcl-flush_493FA2AD29FFF214A1B4925CE85BB620"></a>
### FUNCTION: `TCL-FLUSH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN)`
- SETF? `NIL`

/* 146 */ EXTERN int Tcl_Flush(Tcl_Channel chan);

<a name="api-function-tcl-forget-import_96B9AF58F5E80E6F31CA0B297BE98BBE"></a>
### FUNCTION: `TCL-FORGET-IMPORT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::NS-PTR RAW-CFFI-TCL9::PATTERN)`
- SETF? `NIL`

/* 511 */ EXTERN int
Tcl_ForgetImport(Tcl_Interp *interp, Tcl_Namespace *nsPtr, const char *pattern);

<a name="api-function-tcl-format_06187754B4DAD70D446F05AACDAD7307"></a>
### FUNCTION: `TCL-FORMAT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR FORMAT RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9::OBJV)`
- SETF? `NIL`

/* 576 */ EXTERN Tcl_Obj *
Tcl_Format(
  Tcl_Interp *interp, const char *format,
  Tcl_Size objc, Tcl_Obj *const objv[]);

<a name="api-function-tcl-free-encoding_EFF91938CC4A70AECA2F53B1E2456126"></a>
### FUNCTION: `TCL-FREE-ENCODING`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ENCODING)`
- SETF? `NIL`

/* 299 */ EXTERN void Tcl_FreeEncoding(Tcl_Encoding encoding);

<a name="api-function-tcl-free-internal-rep_000B2D28C6179475BFD9EFA50FDAB3D3"></a>
### FUNCTION: `TCL-FREE-INTERNAL-REP`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`

/* 636 */ EXTERN void Tcl_FreeInternalRep(Tcl_Obj *objPtr);

<a name="api-function-tcl-free-obj_36BB16F039343ACB3E505927F68CB5A4"></a>
### FUNCTION: `TCL-FREE-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`


<a name="api-function-tcl-free-parse_FF73DC198A25AF714FA22B4669D5CD12"></a>
### FUNCTION: `TCL-FREE-PARSE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PARSE-PTR)`
- SETF? `NIL`

/* 358 */ EXTERN void Tcl_FreeParse(Tcl_Parse *parsePtr);

<a name="api-function-tcl-free_8FB9C636FED32C8F689BE375656AF5FA"></a>
### FUNCTION: `TCL-FREE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PTR)`
- SETF? `NIL`

/* 4 */ EXTERN void
Tcl_Free(void *ptr);

<a name="api-function-tcl-fs-access_73D3A7110CAF1FD411190381F6E49BDE"></a>
### FUNCTION: `TCL-FS-ACCESS`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9::MODE)`
- SETF? `NIL`

/* 455 */ EXTERN int Tcl_FSAccess(Tcl_Obj *pathPtr, int mode);

<a name="api-function-tcl-fs-chdir_8DB4B51F03CDB9533210DCD5B2A4584A"></a>
### FUNCTION: `TCL-FS-CHDIR`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PATH-PTR)`
- SETF? `NIL`

/* 458 */ EXTERN int Tcl_FSChdir(Tcl_Obj *pathPtr);

<a name="api-function-tcl-fs-convert-to-path-type_F7EF2442B363033AAE465DB5B03DE03A"></a>
### FUNCTION: `TCL-FS-CONVERT-TO-PATH-TYPE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::PATH-PTR)`
- SETF? `NIL`

/* 459 */ EXTERN int
Tcl_FSConvertToPathType(Tcl_Interp *interp, Tcl_Obj *pathPtr);

<a name="api-function-tcl-fs-copy-directory_8396BA50DADBBC22996C82CCF94401B7"></a>
### FUNCTION: `TCL-FS-COPY-DIRECTORY`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC-PATH-PTR RAW-CFFI-TCL9::DEST-PATH-PTR
 RAW-CFFI-TCL9::ERROR-PTR)`
- SETF? `NIL`

/* 441 */ EXTERN int
Tcl_FSCopyDirectory(Tcl_Obj *srcPathPtr, Tcl_Obj *destPathPtr, Tcl_Obj **errorPtr);

<a name="api-function-tcl-fs-copy-file_33F2D28EE098FA2247ECA992D721F40B"></a>
### FUNCTION: `TCL-FS-COPY-FILE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC-PATH-PTR RAW-CFFI-TCL9::DEST-PATH-PTR)`
- SETF? `NIL`

/* 440 */ EXTERN int
Tcl_FSCopyFile(Tcl_Obj *srcPathPtr, Tcl_Obj *destPathPtr);

<a name="api-function-tcl-fs-data_4D10FEDC6FAC31D0F837ED6242DE9789"></a>
### FUNCTION: `TCL-FS-DATA`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::FS-PTR)`
- SETF? `NIL`

/* 475 */ EXTERN void * Tcl_FSData(const Tcl_Filesystem *fsPtr);

<a name="api-function-tcl-fs-delete-file_A89C07580E29EAD5FA0ED653D31680DD"></a>
### FUNCTION: `TCL-FS-DELETE-FILE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PATH-PTR)`
- SETF? `NIL`

/* 443 */ EXTERN int Tcl_FSDeleteFile(Tcl_Obj *pathPtr);

<a name="api-function-tcl-fs-equal-paths_578798F08B39F91DDA4FCAE1B3FFA742"></a>
### FUNCTION: `TCL-FS-EQUAL-PATHS`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::FIRST-PTR RAW-CFFI-TCL9::SECOND-PTR)`
- SETF? `NIL`

/* 462 */ EXTERN int Tcl_FSEqualPaths(Tcl_Obj *firstPtr, Tcl_Obj *secondPtr);

<a name="api-function-tcl-fs-eval-file-ex_1AF92B026BC9CDC10D21DA424227AD3C"></a>
### FUNCTION: `TCL-FS-EVAL-FILE-EX`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::FILE-NAME
 RAW-CFFI-TCL9::ENCODING-NAME)`
- SETF? `NIL`

/* 518 */ EXTERN int
Tcl_FSEvalFileEx(Tcl_Interp *interp, Tcl_Obj *fileName, const char *encodingName);

<a name="api-function-tcl-fs-eval-file_69407C49E0CACD515A0DEE2F44341E64"></a>
### FUNCTION: `TCL-FS-EVAL-FILE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::FILE-NAME)`
- SETF? `NIL`

/* 467 */ EXTERN int
Tcl_FSEvalFile(Tcl_Interp *interp, Tcl_Obj *fileName);

<a name="api-function-tcl-fs-file-attr-strings_17218030419F55714DFB97B81B2CF357"></a>
### FUNCTION: `TCL-FS-FILE-ATTR-STRINGS`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`

/* 453 */ EXTERN const char *const *
 Tcl_FSFileAttrStrings(Tcl_Obj *pathPtr, Tcl_Obj **objPtrRef);

<a name="api-function-tcl-fs-file-attrs-get_DB03419AFE9CDC5877D924B2EBA04AA2"></a>
### FUNCTION: `TCL-FS-FILE-ATTRS-GET`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::INDEX RAW-CFFI-TCL9::PATH-PTR
 RAW-CFFI-TCL9::OBJ-PTR-REF)`
- SETF? `NIL`

/* 451 */ EXTERN int
Tcl_FSFileAttrsGet(
  Tcl_Interp *interp, int index, Tcl_Obj *pathPtr, Tcl_Obj **objPtrRef);

<a name="api-function-tcl-fs-file-attrs-set_8F8C54C908AE11B9E89D7A4D8A8C0B1A"></a>
### FUNCTION: `TCL-FS-FILE-ATTRS-SET`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::INDEX RAW-CFFI-TCL9::PATH-PTR
 RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`

/* 452 */ EXTERN int
Tcl_FSFileAttrsSet(
  Tcl_Interp *interp, int index, Tcl_Obj *pathPtr, Tcl_Obj *objPtr);

<a name="api-function-tcl-fs-file-system-info_0F4615555F3599E9B5A12776BFF673D1"></a>
### FUNCTION: `TCL-FS-FILE-SYSTEM-INFO`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PATH-PTR)`
- SETF? `NIL`

/* 470 */ EXTERN Tcl_Obj * Tcl_FSFileSystemInfo(Tcl_Obj *pathPtr);

<a name="api-function-tcl-fs-get-cwd_75220E831A179DA7DB8D1E93967A449C"></a>
### FUNCTION: `TCL-FS-GET-CWD`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`

/* 457 */ EXTERN Tcl_Obj * Tcl_FSGetCwd(Tcl_Interp *interp);

<a name="api-function-tcl-fs-get-file-system-for-path_CB8875E8D4B91D226C532C0EA176A0AD"></a>
### FUNCTION: `TCL-FS-GET-FILE-SYSTEM-FOR-PATH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PATH-PTR)`
- SETF? `NIL`

/* 477 */ EXTERN const Tcl_Filesystem *
Tcl_FSGetFileSystemForPath(Tcl_Obj *pathPtr);

<a name="api-function-tcl-fs-get-internal-rep_10CF2A7AA0987734211D83C34CCDD84C"></a>
### FUNCTION: `TCL-FS-GET-INTERNAL-REP`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9::FS-PTR)`
- SETF? `NIL`

/* 465 */ EXTERN void *
Tcl_FSGetInternalRep(Tcl_Obj *pathPtr, const Tcl_Filesystem *fsPtr);

<a name="api-function-tcl-fs-get-native-path_C485613D7A04FACEC25FEED2627A7E5A"></a>
### FUNCTION: `TCL-FS-GET-NATIVE-PATH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PATH-PTR)`
- SETF? `NIL`

/* 469 */ EXTERN const void * Tcl_FSGetNativePath(Tcl_Obj *pathPtr);

<a name="api-function-tcl-fs-get-normalized-path_8DDCA90613DDFEE9CAE5EFBCBD7EB3A9"></a>
### FUNCTION: `TCL-FS-GET-NORMALIZED-PATH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::PATH-PTR)`
- SETF? `NIL`

/* 463 */ EXTERN Tcl_Obj *
Tcl_FSGetNormalizedPath(Tcl_Interp *interp, Tcl_Obj *pathPtr);

<a name="api-function-tcl-fs-get-path-type_0644873B5206795FF0120624929179CE"></a>
### FUNCTION: `TCL-FS-GET-PATH-TYPE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PATH-PTR)`
- SETF? `NIL`

/* 478 */ EXTERN Tcl_PathType Tcl_FSGetPathType(Tcl_Obj *pathPtr);

<a name="api-function-tcl-fs-get-translated-path_77CE2A2F7D6D4E2F6A476B2E82773AD2"></a>
### FUNCTION: `TCL-FS-GET-TRANSLATED-PATH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::PATH-PTR)`
- SETF? `NIL`

/* 466 */ EXTERN Tcl_Obj *
Tcl_FSGetTranslatedPath(Tcl_Interp *interp, Tcl_Obj *pathPtr);

<a name="api-function-tcl-fs-get-translated-string-path_4F3E227D3D132849AF2C679409209FEB"></a>
### FUNCTION: `TCL-FS-GET-TRANSLATED-STRING-PATH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::PATH-PTR)`
- SETF? `NIL`

/* 476 */ EXTERN const char *
Tcl_FSGetTranslatedStringPath(
  Tcl_Interp *interp, Tcl_Obj *pathPtr);

<a name="api-function-tcl-fs-join-path_B2483686E7EA233B8D0FD02A3F6815BC"></a>
### FUNCTION: `TCL-FS-JOIN-PATH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::LIST-OBJ RAW-CFFI-TCL9::ELEMENTS)`
- SETF? `NIL`

/* 460 */ EXTERN Tcl_Obj *
Tcl_FSJoinPath(Tcl_Obj *listObj, Tcl_Size elements);

<a name="api-function-tcl-fs-join-to-path_24C869A5D1273AB3373CB7EC690A21AF"></a>
### FUNCTION: `TCL-FS-JOIN-TO-PATH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9::OBJV)`
- SETF? `NIL`

/* 464 */ EXTERN Tcl_Obj *
Tcl_FSJoinToPath(Tcl_Obj *pathPtr, Tcl_Size objc, Tcl_Obj *const objv[]);

<a name="api-function-tcl-fs-link_E055B554265054105D7FAFA9F4BFA9AB"></a>
### FUNCTION: `TCL-FS-LINK`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9::TO-PTR RAW-CFFI-TCL9::LINK-ACTION)`
- SETF? `NIL`

/* 446 */ EXTERN Tcl_Obj *
Tcl_FSLink(Tcl_Obj *pathPtr, Tcl_Obj *toPtr, int linkAction);

<a name="api-function-tcl-fs-load-file_6AB77E7928E78CA2D566CB49AF3040E9"></a>
### FUNCTION: `TCL-FS-LOAD-FILE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9::SYM-1
 RAW-CFFI-TCL9::SYM-2 RAW-CFFI-TCL9::PROC-1-PTR RAW-CFFI-TCL9::PROC-2-PTR
 RAW-CFFI-TCL9::LOAD-HANDLE-PTR RAW-CFFI-TCL9::UNLOAD-PROC)`
- SETF? `NIL`

/* 444 */ EXTERN int
Tcl_FSLoadFile(
  Tcl_Interp *interp, Tcl_Obj *pathPtr,
  const char *sym1, const char *sym2,
  Tcl_LibraryInitProc **proc1Ptr,
  Tcl_LibraryInitProc **proc2Ptr,
  Tcl_LoadHandle *handlePtr,
  Tcl_FSUnloadFileProc **unloadProcPtr);

<a name="api-function-tcl-fs-lstat_6FF88E862CCB2F3977B57DF672713991"></a>
### FUNCTION: `TCL-FS-LSTAT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9::BUF)`
- SETF? `NIL`

/* 449 */ EXTERN int Tcl_FSLstat(Tcl_Obj *pathPtr, Tcl_StatBuf *buf);

<a name="api-function-tcl-fs-match-in-directory_BA0AD85E9DA997D1E88B7414B4D7E423"></a>
### FUNCTION: `TCL-FS-MATCH-IN-DIRECTORY`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::RESULT RAW-CFFI-TCL9::PATH-PTR
 RAW-CFFI-TCL9::PATTERN RAW-CFFI-TCL9::TYPES)`
- SETF? `NIL`

/* 445 */ EXTERN int
Tcl_FSMatchInDirectory(
  Tcl_Interp *interp, Tcl_Obj *result, Tcl_Obj *pathPtr,
  const char *pattern, Tcl_GlobTypeData *types);

<a name="api-function-tcl-fs-mounts-changed_AEF5D3C6559C098F5D1AB010B71F17DD"></a>
### FUNCTION: `TCL-FS-MOUNTS-CHANGED`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::FS-PTR)`
- SETF? `NIL`

/* 480 */ EXTERN void Tcl_FSMountsChanged(const Tcl_Filesystem *fsPtr);

<a name="api-function-tcl-fs-new-native-path_B2E952559407612717AE078964891EC2"></a>
### FUNCTION: `TCL-FS-NEW-NATIVE-PATH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::FROM-FILESYSTEM RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 468 */ EXTERN Tcl_Obj *
Tcl_FSNewNativePath(
  const Tcl_Filesystem *fromFilesystem, void *clientData);

<a name="api-function-tcl-fs-open-file-channel_1FD046D75032822C6F7BA7719050915A"></a>
### FUNCTION: `TCL-FS-OPEN-FILE-CHANNEL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9::MODE-STRING
 RAW-CFFI-TCL9::PERMISSIONS)`
- SETF? `NIL`

/* 456 */ EXTERN Tcl_Channel
Tcl_FSOpenFileChannel(
  Tcl_Interp *interp, Tcl_Obj *pathPtr, const char *modeString, int permissions);

<a name="api-function-tcl-fs-path-separator_0CF17E6443A9360DFF3FE127A3317F01"></a>
### FUNCTION: `TCL-FS-PATH-SEPARATOR`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PATH-PTR)`
- SETF? `NIL`

/* 471 */ EXTERN Tcl_Obj * Tcl_FSPathSeparator(Tcl_Obj *pathPtr);

<a name="api-function-tcl-fs-register_B928342F24996092D1E21B47CA65C59E"></a>
### FUNCTION: `TCL-FS-REGISTER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::FS-PTR)`
- SETF? `NIL`

/* 473 */ EXTERN int Tcl_FSRegister(void *clientData, const Tcl_Filesystem *fsPtr);

<a name="api-function-tcl-fs-remove-directory_DC6C32CD0E8F6A7426714ECC2BF81E4D"></a>
### FUNCTION: `TCL-FS-REMOVE-DIRECTORY`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9::RECURSIVE RAW-CFFI-TCL9::ERROR-PTR)`
- SETF? `NIL`

/* 447 */ EXTERN int
Tcl_FSRemoveDirectory(Tcl_Obj *pathPtr, int recursive, Tcl_Obj **errorPtr);

<a name="api-function-tcl-fs-rename-file_A7C5DB47BBD5F0B199E14641DA80E912"></a>
### FUNCTION: `TCL-FS-RENAME-FILE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC-PATH-PTR RAW-CFFI-TCL9::DEST-PATH-PTR)`
- SETF? `NIL`

/* 448 */ EXTERN int
Tcl_FSRenameFile(Tcl_Obj *srcPathPtr, Tcl_Obj *destPathPtr);

<a name="api-function-tcl-fs-split-path_446ED88B199F819D8C389AB97AFBB261"></a>
### FUNCTION: `TCL-FS-SPLIT-PATH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9::LEN-PTR)`
- SETF? `NIL`

/* 666 */ EXTERN Tcl_Obj * Tcl_FSSplitPath(Tcl_Obj *pathPtr, Tcl_Size *lenPtr);

<a name="api-function-tcl-fs-stat_41FCE86D2A530721589F995404016650"></a>
### FUNCTION: `TCL-FS-STAT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9::BUF)`
- SETF? `NIL`

/* 454 */ EXTERN int Tcl_FSStat(Tcl_Obj *pathPtr, Tcl_StatBuf *buf);

<a name="api-function-tcl-fs-tilde-expand_C21DF381982B9D4714DCAAF32BC15887"></a>
### FUNCTION: `TCL-FS-TILDE-EXPAND`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::PATH RAW-CFFI-TCL9::DS-PTR)`
- SETF? `NIL`

/* 657 */ EXTERN int
Tcl_FSTildeExpand(Tcl_Interp *interp, const char *path, Tcl_DString *dsPtr);

<a name="api-function-tcl-fs-unload-file_51F5319D0FB84501419223FF5B277ACE"></a>
### FUNCTION: `TCL-FS-UNLOAD-FILE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::LOAD-HANDLE)`
- SETF? `NIL`

/* 629 */ EXTERN int
Tcl_FSUnloadFile(Tcl_Interp *interp, Tcl_LoadHandle handlePtr);

<a name="api-function-tcl-fs-unregister_CB4994A436091CFF644E2F5E5E9000BD"></a>
### FUNCTION: `TCL-FS-UNREGISTER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::FS-PTR)`
- SETF? `NIL`

/* 474 */ EXTERN int Tcl_FSUnregister(const Tcl_Filesystem *fsPtr);

<a name="api-function-tcl-fs-utime_9C25306F4C7C929E0D4F48CB48E1792B"></a>
### FUNCTION: `TCL-FS-UTIME`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9::TVAL)`
- SETF? `NIL`

/* 450 */ EXTERN int Tcl_FSUtime(Tcl_Obj *pathPtr, struct utimbuf *tval);

<a name="api-function-tcl-get-access-time-from-stat_F04C546041EFA30691C696B15794CD1D"></a>
### FUNCTION: `TCL-GET-ACCESS-TIME-FROM-STAT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::STAT-PTR)`
- SETF? `NIL`

/* 596 */ EXTERN long long Tcl_GetAccessTimeFromStat(const Tcl_StatBuf *statPtr);

<a name="api-function-tcl-get-alias-obj_39D2E3A3C05AB35B16A93B1541257D39"></a>
### FUNCTION: `TCL-GET-ALIAS-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::CHILD-CMD
 RAW-CFFI-TCL9::TARGET-INTERP-PTR RAW-CFFI-TCL9::TARGET-CMD-PTR
 RAW-CFFI-TCL9::OBJC-PTR RAW-CFFI-TCL9::OBJV-PTR)`
- SETF? `NIL`

/* 285 */ EXTERN int
Tcl_GetAliasObj(
  Tcl_Interp *interp, const char *childCmd,
  Tcl_Interp **targetInterpPtr, const char **targetCmdPtr,
  Tcl_Size *objcPtr, Tcl_Obj ***objvPtr);

<a name="api-function-tcl-get-assoc-data_8A33272DEE926BB9F37ED454269B8F51"></a>
### FUNCTION: `TCL-GET-ASSOC-DATA`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::NAME
 RAW-CFFI-TCL9::INTERP-DELETE-PROC)`
- SETF? `NIL`

/* 150 */ EXTERN void *
Tcl_GetAssocData(
  Tcl_Interp *interp, const char *name, Tcl_InterpDeleteProc **procPtr);

<a name="api-function-tcl-get-bignum-from-obj_B0DDDAF9E0F9F0CDA6082823D91DB991"></a>
### FUNCTION: `TCL-GET-BIGNUM-FROM-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OBJ RAW-CFFI-TCL9::VALUE)`
- SETF? `NIL`

/* 558 */ EXTERN int
Tcl_GetBignumFromObj(Tcl_Interp *interp, Tcl_Obj *obj, void *value);

<a name="api-function-tcl-get-block-size-from-stat_DC66BE64E88948CD2538067E10293056"></a>
### FUNCTION: `TCL-GET-BLOCK-SIZE-FROM-STAT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::STAT-PTR)`
- SETF? `NIL`

/* 601 */ EXTERN unsigned Tcl_GetBlockSizeFromStat(const Tcl_StatBuf *statPtr);

<a name="api-function-tcl-get-blocks-from-stat_35EA9991B871BE0818C8791427E4581A"></a>
### FUNCTION: `TCL-GET-BLOCKS-FROM-STAT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::STAT-PTR)`
- SETF? `NIL`

/* 600 */ EXTERN unsigned long long Tcl_GetBlocksFromStat(const Tcl_StatBuf *statPtr);

<a name="api-function-tcl-get-bool-from-obj_EC7E4481A7EF2747A5531D407187B1C0"></a>
### FUNCTION: `TCL-GET-BOOL-FROM-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::FLAGS
 RAW-CFFI-TCL9::CHAR-PTR)`
- SETF? `NIL`

/* 675 */ EXTERN int
Tcl_GetBoolFromObj(Tcl_Interp *interp, Tcl_Obj *objPtr, int flags, char *charPtr);

<a name="api-function-tcl-get-bool_337289ADA2AEFDE83690195146831E47"></a>
### FUNCTION: `TCL-GET-BOOL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::SRC RAW-CFFI-TCL9::FLAGS
 RAW-CFFI-TCL9::CHAR-PTR)`
- SETF? `NIL`

/* 674 */ EXTERN int
Tcl_GetBool(Tcl_Interp *interp, const char *src, int flags, char *charPtr);

<a name="api-function-tcl-get-boolean-from-obj_C52F020AF6D6D90739E099586BD991FE"></a>
### FUNCTION: `TCL-GET-BOOLEAN-FROM-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::INT-PTR)`
- SETF? `NIL`

/* 32 */ EXTERN int
Tcl_GetBooleanFromObj(
  Tcl_Interp *interp, Tcl_Obj *objPtr, int *intPtr);

<a name="api-function-tcl-get-boolean_14244B95815617584500EAF50AF9DDB9"></a>
### FUNCTION: `TCL-GET-BOOLEAN`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::SRC RAW-CFFI-TCL9::INT-PTR)`
- SETF? `NIL`

/* 31 */ EXTERN int
Tcl_GetBoolean(
  Tcl_Interp *interp, const char *src, int *intPtr);

<a name="api-function-tcl-get-byte-array-from-obj_093A51147209C3B47D7058EA80D2ED79"></a>
### FUNCTION: `TCL-GET-BYTE-ARRAY-FROM-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::SIZE-PTR)`
- SETF? `NIL`


<a name="api-function-tcl-get-bytes-from-obj_9359F8AED5CBEF84C95F5BBEDA130680"></a>
### FUNCTION: `TCL-GET-BYTES-FROM-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::NUM-BYTES-PTR)`
- SETF? `NIL`

/* 650 */ EXTERN unsigned char *
Tcl_GetBytesFromObj(Tcl_Interp *interp, Tcl_Obj *objPtr, Tcl_Size *numBytesPtr);

<a name="api-function-tcl-get-change-time-from-stat_D43C414E9E4E974EE8B501684BC7561C"></a>
### FUNCTION: `TCL-GET-CHANGE-TIME-FROM-STAT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::STAT-PTR)`
- SETF? `NIL`

/* 598 */ EXTERN long long Tcl_GetChangeTimeFromStat(const Tcl_StatBuf *statPtr);

<a name="api-function-tcl-get-channel-buffer-size_2F8BE6B6DC1B9B2478C12E407947A7E0"></a>
### FUNCTION: `TCL-GET-CHANNEL-BUFFER-SIZE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN)`
- SETF? `NIL`

/* 152 */ EXTERN Tcl_Size
Tcl_GetChannelBufferSize(Tcl_Channel chan);

<a name="api-function-tcl-get-channel-error-interp_EF3A84471B074671FD57C7877801651B"></a>
### FUNCTION: `TCL-GET-CHANNEL-ERROR-INTERP`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::MSG)`
- SETF? `NIL`

/* 563 */ EXTERN void
Tcl_GetChannelErrorInterp(Tcl_Interp *interp, Tcl_Obj **msg);

<a name="api-function-tcl-get-channel-error_0DF5954B44A0194FCC5D7A7F122053A0"></a>
### FUNCTION: `TCL-GET-CHANNEL-ERROR`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9::MSG)`
- SETF? `NIL`

/* 565 */ EXTERN void Tcl_GetChannelError(Tcl_Channel chan, Tcl_Obj **msg);

<a name="api-function-tcl-get-channel-handle_74644B74433A4EDD8901AC0A5B2F830F"></a>
### FUNCTION: `TCL-GET-CHANNEL-HANDLE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9::DIRECTION RAW-CFFI-TCL9::HANDLE-PTR)`
- SETF? `NIL`

/* 153 */ EXTERN int
Tcl_GetChannelHandle(Tcl_Channel chan, int direction, void **handlePtr);

<a name="api-function-tcl-get-channel-instance-data_39C6BF82C3688E2907557A6D814BFF76"></a>
### FUNCTION: `TCL-GET-CHANNEL-INSTANCE-DATA`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN)`
- SETF? `NIL`

/* 154 */ EXTERN void * Tcl_GetChannelInstanceData(Tcl_Channel chan);

<a name="api-function-tcl-get-channel-mode_EE4002F1A3A9E42B1FE042E340CE9656"></a>
### FUNCTION: `TCL-GET-CHANNEL-MODE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN)`
- SETF? `NIL`

/* 155 */ EXTERN int Tcl_GetChannelMode(Tcl_Channel chan);

<a name="api-function-tcl-get-channel-name_AC1FA36285912DD7BF6538CEA9FF58A4"></a>
### FUNCTION: `TCL-GET-CHANNEL-NAME`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN)`
- SETF? `NIL`

/* 156 */ EXTERN const char * Tcl_GetChannelName(Tcl_Channel chan);

<a name="api-function-tcl-get-channel-names-ex_C0EE965D178E542B80DDF3315CCE6F76"></a>
### FUNCTION: `TCL-GET-CHANNEL-NAMES-EX`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::PATTERN)`
- SETF? `NIL`

/* 389 */ EXTERN int
Tcl_GetChannelNamesEx(Tcl_Interp *interp, const char *pattern);

<a name="api-function-tcl-get-channel-names_1BAC918A6C6E11382A6DCBC3A4859B7B"></a>
### FUNCTION: `TCL-GET-CHANNEL-NAMES`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`

/* 388 */ EXTERN int Tcl_GetChannelNames(Tcl_Interp *interp);

<a name="api-function-tcl-get-channel-option_731F6FE0EB2C83875CD996D8EF229F20"></a>
### FUNCTION: `TCL-GET-CHANNEL-OPTION`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9::OPTION-NAME
 RAW-CFFI-TCL9::DS-PTR)`
- SETF? `NIL`

/* 157 */ EXTERN int
Tcl_GetChannelOption(
  Tcl_Interp *interp, Tcl_Channel chan,
  const char *optionName, Tcl_DString *dsPtr);

<a name="api-function-tcl-get-channel-thread_44084444CA234B38F2D18C1C16C09D1A"></a>
### FUNCTION: `TCL-GET-CHANNEL-THREAD`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN)`
- SETF? `NIL`

/* 433 */ EXTERN Tcl_ThreadId Tcl_GetChannelThread(Tcl_Channel channel);

<a name="api-function-tcl-get-channel-type_2B195B3DC9A475224F8B9249F2BCB791"></a>
### FUNCTION: `TCL-GET-CHANNEL-TYPE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN)`
- SETF? `NIL`

/* 158 */ EXTERN const Tcl_ChannelType *
Tcl_GetChannelType(Tcl_Channel chan);

<a name="api-function-tcl-get-channel_3762933B737B4C35C8FFF1855F5E2D29"></a>
### FUNCTION: `TCL-GET-CHANNEL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::CHAN-NAME RAW-CFFI-TCL9::MOD-PTR)`
- SETF? `NIL`

/* 151 */ EXTERN Tcl_Channel
Tcl_GetChannel(Tcl_Interp *interp, const char *chanName, int *modePtr);

<a name="api-function-tcl-get-char-length_8250E3B62D523AF73A923C2177F773DB"></a>
### FUNCTION: `TCL-GET-CHAR-LENGTH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`

/* 670 */ EXTERN Tcl_Size Tcl_GetCharLength(Tcl_Obj *objPtr);

<a name="api-function-tcl-get-child_1E41251EAC331764A5BD4744D16632E4"></a>
### FUNCTION: `TCL-GET-CHILD`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::NAME)`
- SETF? `NIL`

/* 172 */ EXTERN Tcl_Interp *
Tcl_GetChild(Tcl_Interp *interp, const char *name);

<a name="api-function-tcl-get-command-from-obj_C9AF6180FDBCE9BFD58102823F86088C"></a>
### FUNCTION: `TCL-GET-COMMAND-FROM-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`

/* 516 */ EXTERN Tcl_Command
Tcl_GetCommandFromObj(Tcl_Interp *interp, Tcl_Obj *objPtr);

<a name="api-function-tcl-get-command-full-name_199823CFB1B06DB3C2AE14B093EEBFDB"></a>
### FUNCTION: `TCL-GET-COMMAND-FULL-NAME`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::COMMAND RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`

/* 517 */ EXTERN void
Tcl_GetCommandFullName(Tcl_Interp *interp, Tcl_Command command, Tcl_Obj *objPtr);

<a name="api-function-tcl-get-command-info-from-token_F1F98F3F774BC84BF6968AAFF00482BF"></a>
### FUNCTION: `TCL-GET-COMMAND-INFO-FROM-TOKEN`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::TOKEN RAW-CFFI-TCL9::CMD-INFO-PTR)`
- SETF? `NIL`

/* 484 */ EXTERN int
Tcl_GetCommandInfoFromToken(Tcl_Command token, Tcl_CmdInfo *infoPtr);

<a name="api-function-tcl-get-command-info_41B8364E9FA844F44863FF6F61687028"></a>
### FUNCTION: `TCL-GET-COMMAND-INFO`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::CMD-NAME RAW-CFFI-TCL9::INFO-PTR)`
- SETF? `NIL`

/* 159 */ EXTERN int
Tcl_GetCommandInfo(
  Tcl_Interp *interp, const char *cmdName, Tcl_CmdInfo *infoPtr);

<a name="api-function-tcl-get-command-name_F7AB1C787EBCFAC4245761F4A8E247F9"></a>
### FUNCTION: `TCL-GET-COMMAND-NAME`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::COMMAND)`
- SETF? `NIL`

/* 160 */ EXTERN const char *
Tcl_GetCommandName(Tcl_Interp *interp, Tcl_Command command);

<a name="api-function-tcl-get-current-namespace_4FE35F8ED2C9E1734ABBB83DBB1D0867"></a>
### FUNCTION: `TCL-GET-CURRENT-NAMESPACE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`

/* 512 */ EXTERN Tcl_Namespace * Tcl_GetCurrentNamespace(Tcl_Interp *interp);

<a name="api-function-tcl-get-cwd_BF63355289BA85866C20CCEA1B97CF63"></a>
### FUNCTION: `TCL-GET-CWD`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::CWD-PTR)`
- SETF? `NIL`

/* 365 */ EXTERN char * Tcl_GetCwd(Tcl_Interp *interp, Tcl_DString *cwdPtr);

<a name="api-function-tcl-get-device-type-from-stat_6C71D488E97F96561904E7EC0830F445"></a>
### FUNCTION: `TCL-GET-DEVICE-TYPE-FROM-STAT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::STAT-PTR)`
- SETF? `NIL`

/* 595 */ EXTERN int Tcl_GetDeviceTypeFromStat(const Tcl_StatBuf *statPtr);

<a name="api-function-tcl-get-double-from-obj_0800A7088E4BD525286F00A2B19500CC"></a>
### FUNCTION: `TCL-GET-DOUBLE-FROM-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::DOUBLE-PTR)`
- SETF? `NIL`

/* 35 */ EXTERN int
Tcl_GetDoubleFromObj(
  Tcl_Interp *interp, Tcl_Obj *objPtr, double *doublePtr);

<a name="api-function-tcl-get-double_51834678D0054D740284520E37AD4266"></a>
### FUNCTION: `TCL-GET-DOUBLE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::SRC RAW-CFFI-TCL9::DOUBLE-PTR)`
- SETF? `NIL`

/* 34 */ EXTERN int
Tcl_GetDouble(Tcl_Interp *interp, const char *src, double *doublePtr);

<a name="api-function-tcl-get-encoding-from-obj_5012B56F4C0DBDADE0438323143B3A95"></a>
### FUNCTION: `TCL-GET-ENCODING-FROM-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::ENCODING-PTR)`
- SETF? `NIL`

/* 569 */ EXTERN int
Tcl_GetEncodingFromObj(
  Tcl_Interp *interp, Tcl_Obj *objPtr, Tcl_Encoding *encodingPtr);

<a name="api-function-tcl-get-encoding-name-from-environment_B7262CCE7CFBCF69C4606BB83C2F8682"></a>
### FUNCTION: `TCL-GET-ENCODING-NAME-FROM-ENVIRONMENT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::BUF-PTR)`
- SETF? `NIL`

/* 572 */ EXTERN const char *
Tcl_GetEncodingNameFromEnvironment(Tcl_DString *bufPtr);

<a name="api-function-tcl-get-encoding-name_EDF34C256805A0825F8EBC492A2F182B"></a>
### FUNCTION: `TCL-GET-ENCODING-NAME`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ENCODING)`
- SETF? `NIL`

/* 302 */ EXTERN const char * Tcl_GetEncodingName(Tcl_Encoding encoding);

<a name="api-function-tcl-get-encoding-names_1855A953568D37A14B33C73FAD0F48AB"></a>
### FUNCTION: `TCL-GET-ENCODING-NAMES`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`

/* 303 */ EXTERN void Tcl_GetEncodingNames(Tcl_Interp *interp);

<a name="api-function-tcl-get-encoding-nul-length_412D2C62B3455C6CF13087692DFCCB37"></a>
### FUNCTION: `TCL-GET-ENCODING-NUL-LENGTH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ENCODING)`
- SETF? `NIL`

/* 683 */ EXTERN Tcl_Size Tcl_GetEncodingNulLength(Tcl_Encoding encoding);

<a name="api-function-tcl-get-encoding_9BEAEF349FEC7003BA3E968675EA9E94"></a>
### FUNCTION: `TCL-GET-ENCODING`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::NAME)`
- SETF? `NIL`

/* 301 */ EXTERN Tcl_Encoding
Tcl_GetEncoding(Tcl_Interp *interp, const char *name);

<a name="api-function-tcl-get-ensemble-flags_438FD49C8AE5AFD0C6783DEB1B1364A6"></a>
### FUNCTION: `TCL-GET-ENSEMBLE-FLAGS`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::TOKEN RAW-CFFI-TCL9::FLAGS-PTR)`
- SETF? `NIL`

/* 550 */ EXTERN int
Tcl_GetEnsembleFlags(Tcl_Interp *interp, Tcl_Command token, int *flagsPtr);

<a name="api-function-tcl-get-ensemble-mapping-dict_A136EB3936CB8646EFA3365752CFE2EC"></a>
### FUNCTION: `TCL-GET-ENSEMBLE-MAPPING-DICT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::TOKEN RAW-CFFI-TCL9::MAP-DICT-PTR)`
- SETF? `NIL`

/* 548 */ EXTERN int
Tcl_GetEnsembleMappingDict(
  Tcl_Interp *interp, Tcl_Command token, Tcl_Obj **mapDictPtr);

<a name="api-function-tcl-get-ensemble-namespace_D79087A386E31CB6DA6FD9E815C8BAC3"></a>
### FUNCTION: `TCL-GET-ENSEMBLE-NAMESPACE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::TOKEN RAW-CFFI-TCL9::NAMESPACE-PTR)`
- SETF? `NIL`

/* 551 */ EXTERN int
Tcl_GetEnsembleNamespace(
  Tcl_Interp *interp, Tcl_Command token, Tcl_Namespace **namespacePtrPtr);

<a name="api-function-tcl-get-ensemble-parameter-list_CB99ACC939D6DFAD21F7C733F0C49BAB"></a>
### FUNCTION: `TCL-GET-ENSEMBLE-PARAMETER-LIST`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::TOKEN RAW-CFFI-TCL9::PARAM-LIST)`
- SETF? `NIL`

/* 603 */ EXTERN int
Tcl_GetEnsembleParameterList(
  Tcl_Interp *interp, Tcl_Command token, Tcl_Obj **paramListPtr);

<a name="api-function-tcl-get-ensemble-subcommand-list_0BCCC9B633E45FC6447240D0D6610149"></a>
### FUNCTION: `TCL-GET-ENSEMBLE-SUBCOMMAND-LIST`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::TOKEN RAW-CFFI-TCL9::SUBCMD-LIST-PTR)`
- SETF? `NIL`

/* 547 */ EXTERN int
Tcl_GetEnsembleSubcommandList(
  Tcl_Interp *interp, Tcl_Command token, Tcl_Obj **subcmdListPtr);

<a name="api-function-tcl-get-ensemble-unknown-handler_7D2F7A11BE2C86C4BF81AE393753D8D8"></a>
### FUNCTION: `TCL-GET-ENSEMBLE-UNKNOWN-HANDLER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::TOKEN RAW-CFFI-TCL9::UNKNOWN-LIST-PTR)`
- SETF? `NIL`

/* 549 */ EXTERN int
Tcl_GetEnsembleUnknownHandler(
  Tcl_Interp *interp, Tcl_Command token, Tcl_Obj **unknownListPtr);

<a name="api-function-tcl-get-error-line_797D205F901A850910528F14C33DDD44"></a>
### FUNCTION: `TCL-GET-ERROR-LINE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`

/* 605 */ EXTERN int Tcl_GetErrorLine(Tcl_Interp *interp);

<a name="api-function-tcl-get-fs-device-from-stat_1AE6E186668F8C88721047C3778A9CDB"></a>
### FUNCTION: `TCL-GET-FS-DEVICE-FROM-STAT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::STAT-PTR)`
- SETF? `NIL`

/* 589 */ EXTERN unsigned
  Tcl_GetFSDeviceFromStat(const Tcl_StatBuf *statPtr);

<a name="api-function-tcl-get-fs-inode-from-stat_F6F1231C6535CC9C049940083CB6078A"></a>
### FUNCTION: `TCL-GET-FS-INODE-FROM-STAT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::STAT-PTR)`
- SETF? `NIL`

/* 590 */ EXTERN unsigned Tcl_GetFSInodeFromStat(const Tcl_StatBuf *statPtr);

<a name="api-function-tcl-get-global-namespace_BE92378C119EA1B61320002525934B3A"></a>
### FUNCTION: `TCL-GET-GLOBAL-NAMESPACE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`

/* 513 */ EXTERN Tcl_Namespace * Tcl_GetGlobalNamespace(Tcl_Interp *interp);

<a name="api-function-tcl-get-group-id-from-stat_6EEEA8B28CA95B77E418F7E589F745D5"></a>
### FUNCTION: `TCL-GET-GROUP-ID-FROM-STAT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::STAT-PTR)`
- SETF? `NIL`

/* 594 */ EXTERN int Tcl_GetGroupIdFromStat(const Tcl_StatBuf *statPtr);

<a name="api-function-tcl-get-index-from-obj-struct_CA636C8823C952B9E048CDA4498DCC3F"></a>
### FUNCTION: `TCL-GET-INDEX-FROM-OBJ-STRUCT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::TABLE-PTR
 RAW-CFFI-TCL9::OFFSET RAW-CFFI-TCL9::MSG RAW-CFFI-TCL9::FLAGS
 RAW-CFFI-TCL9::INDEX-PTR)`
- SETF? `NIL`

/* 304 */ EXTERN int
Tcl_GetIndexFromObjStruct(
  Tcl_Interp *interp, Tcl_Obj *objPtr, const void *tablePtr,
  Tcl_Size offset, const char *msg, int flags, void *indexPtr);

<a name="api-function-tcl-get-index-from-obj_F373DE381301BFC40B86BA0D3980FE3B"></a>
### FUNCTION: `TCL-GET-INDEX-FROM-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::TABLE-PTR
 RAW-CFFI-TCL9::MSG RAW-CFFI-TCL9::FLAGS RAW-CFFI-TCL9::INDEX-PTR)`
- SETF? `NIL`


<a name="api-function-tcl-get-int-for-index_175F8181B2FB905535060E09CAF5013A"></a>
### FUNCTION: `TCL-GET-INT-FOR-INDEX`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::END-VALUE
 RAW-CFFI-TCL9::INDEX-PTR)`
- SETF? `NIL`

/* 645 */ EXTERN int
Tcl_GetIntForIndex(
  Tcl_Interp *interp, Tcl_Obj *objPtr, Tcl_Size endValue, Tcl_Size *indexPtr);

<a name="api-function-tcl-get-int-from-obj_984DED2B628805AA7DDB02E17C8F23F8"></a>
### FUNCTION: `TCL-GET-INT-FROM-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::INT-PTR)`
- SETF? `NIL`

/* 38 */ EXTERN int
Tcl_GetIntFromObj(Tcl_Interp *interp, Tcl_Obj *objPtr, int *intPtr);

<a name="api-function-tcl-get-int_7F613795580B708953ABD8984B67A922"></a>
### FUNCTION: `TCL-GET-INT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::SRC RAW-CFFI-TCL9::INT-PTR)`
- SETF? `NIL`

/* 37 */ EXTERN int
Tcl_GetInt(
  Tcl_Interp *interp, const char *src, int *intPtr);

<a name="api-function-tcl-get-interp-path_049AAB8DE1827A3E5DC0C9A09A2E47DF"></a>
### FUNCTION: `TCL-GET-INTERP-PATH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::CHILD-INTERP-PTR)`
- SETF? `NIL`

/* 163 */ EXTERN int
Tcl_GetInterpPath(Tcl_Interp *interp, Tcl_Interp *childInterp);

<a name="api-function-tcl-get-link-count-from-stat_66D43E4B00D4CB2737AFA09858B7B271"></a>
### FUNCTION: `TCL-GET-LINK-COUNT-FROM-STAT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::STAT-PTR)`
- SETF? `NIL`

/* 592 */ EXTERN int Tcl_GetLinkCountFromStat(const Tcl_StatBuf *statPtr);

<a name="api-function-tcl-get-long-from-obj_E8CD5036079806C4E118F399DE1175E3"></a>
### FUNCTION: `TCL-GET-LONG-FROM-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::LONG-PTR)`
- SETF? `NIL`

/* 39 */ EXTERN int
Tcl_GetLongFromObj(
Tcl_Interp *interp, Tcl_Obj *objPtr, long *longPtr);

<a name="api-function-tcl-get-memory-info_F255B4DB2441062915315275EF65DC01"></a>
### FUNCTION: `TCL-GET-MEMORY-INFO`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::DS-PTR)`
- SETF? `NIL`


<a name="api-function-tcl-get-mode-from-stat_2D7A29EC6E834F76734DBACDEBEB3C97"></a>
### FUNCTION: `TCL-GET-MODE-FROM-STAT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::STAT-PTR)`
- SETF? `NIL`

/* 591 */ EXTERN unsigned Tcl_GetModeFromStat(const Tcl_StatBuf *statPtr);

<a name="api-function-tcl-get-modification-time-from-stat_C208501C9352B317C514EE3F0D63FB48"></a>
### FUNCTION: `TCL-GET-MODIFICATION-TIME-FROM-STAT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::STAT-PTR)`
- SETF? `NIL`

/* 597 */ EXTERN long long
Tcl_GetModificationTimeFromStat(const Tcl_StatBuf *statPtr);

<a name="api-function-tcl-get-namespace-unknown-handler_E469A1C86D4C036CE5283E8CA48BB1EB"></a>
### FUNCTION: `TCL-GET-NAMESPACE-UNKNOWN-HANDLER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::NS-PTR)`
- SETF? `NIL`

/* 567 */ EXTERN Tcl_Obj *
Tcl_GetNamespaceUnknownHandler(Tcl_Interp *interp, Tcl_Namespace *nsPtr);

<a name="api-function-tcl-get-number-from-obj_DE78F0728CBE10C45561329D4EA65EE5"></a>
### FUNCTION: `TCL-GET-NUMBER-FROM-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::CLIENT-DATA-PTR
 RAW-CFFI-TCL9::TYPE-PTR)`
- SETF? `NIL`

/* 680 */ EXTERN int
Tcl_GetNumberFromObj(
  Tcl_Interp *interp, Tcl_Obj *objPtr, void **clientDataPtr, int *typePtr);

<a name="api-function-tcl-get-number_DDC6F39ECC58B0082F3F658AA1E679D9"></a>
### FUNCTION: `TCL-GET-NUMBER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::BYTES RAW-CFFI-TCL9::NUM-BYTES
 RAW-CFFI-TCL9::CLIENT-DATA-PTR RAW-CFFI-TCL9::TYPE-PTR)`
- SETF? `NIL`

/* 681 */ EXTERN int
Tcl_GetNumber(
  Tcl_Interp *interp, const char *bytes,
  Tcl_Size numBytes, void **clientDataPtr, int *typePtr);

<a name="api-function-tcl-get-obj-result_A30495481DB5D2510E861A802DA0D620"></a>
### FUNCTION: `TCL-GET-OBJ-RESULT*`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`


<a name="api-function-tcl-get-obj-result_F0123C5A8CFFF6EDD00E9FDFC7CFF4D8"></a>
### FUNCTION: `TCL-GET-OBJ-RESULT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`

/* 166 */ EXTERN Tcl_Obj * Tcl_GetObjResult(Tcl_Interp *interp);

<a name="api-function-tcl-get-obj-type_F391235C8DBDB9E6086C8ACEA2779589"></a>
### FUNCTION: `TCL-GET-OBJ-TYPE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9:TYPE-NAME)`
- SETF? `NIL`

/* 40 */ EXTERN const Tcl_ObjType *
Tcl_GetObjType(const char *typeName);

<a name="api-function-tcl-get-open-file_4B45D8AEAD85660A826D6109D6E1B5F4"></a>
### FUNCTION: `TCL-GET-OPEN-FILE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::CHAN-ID RAW-CFFI-TCL9::FOR-WRITING
 RAW-CFFI-TCL9::CHECK-USAGE RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 167 */ EXTERN int
Tcl_GetOpenFile(
  Tcl_Interp *interp, const char *chanID,
  int forWriting, int checkUsage, void **filePtr);

<a name="api-function-tcl-get-parent_61150FAFD00DCBAF6890E9ACBD08709F"></a>
### FUNCTION: `TCL-GET-PARENT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`

/* 164 */ EXTERN Tcl_Interp * Tcl_GetParent(Tcl_Interp *interp);

<a name="api-function-tcl-get-path-type_84EBAC55100781F2218EA8DD1C2F83AB"></a>
### FUNCTION: `TCL-GET-PATH-TYPE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PATH)`
- SETF? `NIL`

/* 168 */ EXTERN Tcl_PathType Tcl_GetPathType(const char *path);

<a name="api-function-tcl-get-range_92C0F0CCCB2A76EA44AA0358198ADAB6"></a>
### FUNCTION: `TCL-GET-RANGE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR FIRST LAST)`
- SETF? `NIL`

/* 672 */ EXTERN Tcl_Obj *
Tcl_GetRange(Tcl_Obj *objPtr, Tcl_Size first, Tcl_Size last);

<a name="api-function-tcl-get-reg-exp-from-obj_6CA45B06F88B0CB32B88D088ABF18FD0"></a>
### FUNCTION: `TCL-GET-REG-EXP-FROM-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::PAT-OBJ RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 356 */ EXTERN Tcl_RegExp
Tcl_GetRegExpFromObj(Tcl_Interp *interp, Tcl_Obj *patObj, int flags);

<a name="api-function-tcl-get-return-options_9650BFA6A4A9087579108DBD832FAFCF"></a>
### FUNCTION: `TCL-GET-RETURN-OPTIONS`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::RESULT)`
- SETF? `NIL`

/* 539 */ EXTERN Tcl_Obj *
Tcl_GetReturnOptions(Tcl_Interp *interp, int result);

<a name="api-function-tcl-get-size-from-stat_97AF997A5236C7F91C0855EA85175080"></a>
### FUNCTION: `TCL-GET-SIZE-FROM-STAT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::STAT-PTR)`
- SETF? `NIL`

/* 599 */ EXTERN unsigned long long Tcl_GetSizeFromStat(const Tcl_StatBuf *statPtr);

<a name="api-function-tcl-get-size-int-from-obj_43B7B69CAD30DFE02E9C4F2EC99591F3"></a>
### FUNCTION: `TCL-GET-SIZE-INT-FROM-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::SIZE-PTR)`
- SETF? `NIL`

/* 653 */ EXTERN int
Tcl_GetSizeIntFromObj(Tcl_Interp *interp, Tcl_Obj *objPtr, Tcl_Size *sizePtr);

<a name="api-function-tcl-get-stacked-channel_06BB8E711DE2CBB7A8531D709306FF92"></a>
### FUNCTION: `TCL-GET-STACKED-CHANNEL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN)`
- SETF? `NIL`

/* 283 */ EXTERN Tcl_Channel Tcl_GetStackedChannel(Tcl_Channel chan);

<a name="api-function-tcl-get-startup-script_4795253A3D3FF305342CD9C35CF823CE"></a>
### FUNCTION: `TCL-GET-STARTUP-SCRIPT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ENCODING-PTR)`
- SETF? `NIL`

/* 623 */ EXTERN Tcl_Obj * Tcl_GetStartupScript(const char **encodingPtr);

<a name="api-function-tcl-get-std-channel_DB0B6BEB1F48BC9F2B7AB3211204AC2B"></a>
### FUNCTION: `TCL-GET-STD-CHANNEL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(TYPE)`
- SETF? `NIL`

/* 173 */ EXTERN Tcl_Channel Tcl_GetStdChannel(int type);

<a name="api-function-tcl-get-string_6FAD3B89BAF78F7D88B8F2688ADAD658"></a>
### FUNCTION: `TCL-GET-STRING*`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`


<a name="api-function-tcl-get-string-from-objchar_9AD7D47E0CEE48139A9CDA12AD6EEB36"></a>
### FUNCTION: `TCL-GET-STRING-FROM-OBJ/CHAR*`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::LENGTH-PTR)`
- SETF? `NIL`

/* 651 */ EXTERN char *
Tcl_GetStringFromObj(Tcl_Obj *objPtr, Tcl_Size *lengthPtr);

<a name="api-function-tcl-get-string-from-obj_D03E82DEC85907E7CF34DD34E88632EE"></a>
### FUNCTION: `TCL-GET-STRING-FROM-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::LENGTH-PTR)`
- SETF? `NIL`

/* 651 */ EXTERN char *
Tcl_GetStringFromObj(Tcl_Obj *objPtr, Tcl_Size *lengthPtr);

<a name="api-function-tcl-get-string-result_10320B14B4AD082F8C61F91780C7C680"></a>
### FUNCTION: `TCL-GET-STRING-RESULT*`

- SCOPE: INTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP)`
- SETF? `NIL`


<a name="api-function-tcl-get-string-result_FB78F84E22912E0923F6A8481312D269"></a>
### FUNCTION: `TCL-GET-STRING-RESULT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP)`
- SETF? `NIL`


<a name="api-function-tcl-get-string_48C1154F94F36D83518E66B650B8A909"></a>
### FUNCTION: `TCL-GET-STRING`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`

/* 340 */ EXTERN char * Tcl_GetString(Tcl_Obj *objPtr);

<a name="api-function-tcl-get-thread-data_38F48803535946667547DD3EB7884212"></a>
### FUNCTION: `TCL-GET-THREAD-DATA`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::THREAD-DATA-KEY-PTR RAW-CFFI-TCL9::SIZE)`
- SETF? `NIL`

/* 305 */ EXTERN void * Tcl_GetThreadData(Tcl_ThreadDataKey *keyPtr, Tcl_Size size);

<a name="api-function-tcl-get-time_FDD7B54C08D3F0B47E4716679307A63D"></a>
### FUNCTION: `TCL-GET-TIME`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::TIME-BUF)`
- SETF? `NIL`

/* 482 */ EXTERN void Tcl_GetTime(Tcl_Time *timeBuf);

<a name="api-function-tcl-get-top-channel_498EE5C25A2280EB064D47180E68977F"></a>
### FUNCTION: `TCL-GET-TOP-CHANNEL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN)`
- SETF? `NIL`

/* 396 */ EXTERN Tcl_Channel Tcl_GetTopChannel(Tcl_Channel chan);

<a name="api-function-tcl-get-uni-char_CDAE16DC3C11454C0AD754B6A890497F"></a>
### FUNCTION: `TCL-GET-UNI-CHAR`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::INDEX)`
- SETF? `NIL`

/* 673 */ EXTERN int Tcl_GetUniChar(Tcl_Obj *objPtr, Tcl_Size index);

<a name="api-function-tcl-get-unicode-from-obj_2C9FC42F6A7778C8EE786871957B7F5C"></a>
### FUNCTION: `TCL-GET-UNICODE-FROM-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::LENGTH-PTR)`
- SETF? `NIL`

/* 652 */ EXTERN Tcl_UniChar *
Tcl_GetUnicodeFromObj(Tcl_Obj *objPtr, Tcl_Size *lengthPtr);

<a name="api-function-tcl-get-unicode_F874704C37E10F1665BC17F59DA7D22B"></a>
### FUNCTION: `TCL-GET-UNICODE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`


<a name="api-function-tcl-get-user-id-from-stat_70AB2CE6EDA639346B5B7A226FC786E8"></a>
### FUNCTION: `TCL-GET-USER-ID-FROM-STAT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::STAT-PTR)`
- SETF? `NIL`

/* 593 */ EXTERN int Tcl_GetUserIdFromStat(const Tcl_StatBuf *statPtr);

<a name="api-function-tcl-get-var_CB56D1EE5B7104CF30594B23314FD7CE"></a>
### FUNCTION: `TCL-GET-VAR*`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::VAR-NAME RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`


<a name="api-function-tcl-get-var2_B26ACA7C7F41B1874C3C274BA772ABDA"></a>
### FUNCTION: `TCL-GET-VAR2*`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::PART1 RAW-CFFI-TCL9::PART2
 RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

`flags'은 `TCL_GLOBAL_ONLY'(=1) 등이 가능.

<a name="api-function-tcl-get-var2-ex_68E9A386E943F68793BCE9B05CDF2605"></a>
### FUNCTION: `TCL-GET-VAR2-EX`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::PART-1 RAW-CFFI-TCL9::PART-2
 RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 306 */ EXTERN Tcl_Obj *
  Tcl_GetVar2Ex(Tcl_Interp *interp, const char *part1, const char *part2, int flags);

<a name="api-function-tcl-get-var2_BC8C1F08DBDA45CD8155A29F6160CAA0"></a>
### FUNCTION: `TCL-GET-VAR2`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::PART1 RAW-CFFI-TCL9::PART2
 RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 176 */ EXTERN const char *
Tcl_GetVar2(Tcl_Interp *interp, const char *part1, const char *part2, int flags);

<a name="api-function-tcl-get-var_9C167D12BE44F09B4F959E641C0A93F1"></a>
### FUNCTION: `TCL-GET-VAR`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::VAR-NAME RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`


<a name="api-function-tcl-get-version_26BC56AC820BA438D54847F55B549A60"></a>
### FUNCTION: `TCL-GET-VERSION`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::MAJOR RAW-CFFI-TCL9::MINOR RAW-CFFI-TCL9::PATCH-LEVEL TYPE)`
- SETF? `NIL`

/* 279 */ EXTERN void
Tcl_GetVersion(int *major, int *minor, int *patchLevel, int *type);

<a name="api-function-tcl-get-wide-int-from-obj_537A513F941EA48DEB5C80BB5AEC43D3"></a>
### FUNCTION: `TCL-GET-WIDE-INT-FROM-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::WIDE-PTR)`
- SETF? `NIL`

/* 487 */ EXTERN int
Tcl_GetWideIntFromObj(Tcl_Interp *interp, Tcl_Obj *objPtr, Tcl_WideInt *widePtr);

<a name="api-function-tcl-get-wide-u-int-from-obj_0C77DB408F0526EAEF99F2E9A9289905"></a>
### FUNCTION: `TCL-GET-WIDE-U-INT-FROM-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::UWIDE-PTR)`
- SETF? `NIL`

/* 684 */ EXTERN int
Tcl_GetWideUIntFromObj(
  Tcl_Interp *interp, Tcl_Obj *objPtr, Tcl_WideUInt *uwidePtr);

<a name="api-function-tcl-gets-obj_AC229F3ED36D0D09B19B9E258F5FA2EB"></a>
### FUNCTION: `TCL-GETS-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`

/* 170 */ EXTERN Tcl_Size Tcl_GetsObj(Tcl_Channel chan, Tcl_Obj *objPtr);

<a name="api-function-tcl-gets_B483B69C481707979F4E0D37DB9DC34D"></a>
### FUNCTION: `TCL-GETS`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9::DS-PTR)`
- SETF? `NIL`

/* 169 */ EXTERN Tcl_Size Tcl_Gets(Tcl_Channel chan, Tcl_DString *dsPtr);

<a name="api-function-tcl-global-eval-obj_48CC77133753A7B0913D93AFF03D8A55"></a>
### FUNCTION: `TCL-GLOBAL-EVAL-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`


<a name="api-function-tcl-global-eval_B1609D9B734B1E1C2A5C2497D361FAB3"></a>
### FUNCTION: `TCL-GLOBAL-EVAL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`


<a name="api-function-tcl-has-string-rep_D492A0D2840D28EB67F73FEC32D91D56"></a>
### FUNCTION: `TCL-HAS-STRING-REP`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`

/* 640 */ EXTERN int Tcl_HasStringRep(Tcl_Obj *objPtr);

<a name="api-function-tcl-hash-stats_AD177CA56F69457798704E80F86B360D"></a>
### FUNCTION: `TCL-HASH-STATS`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::TABLE-PTR)`
- SETF? `NIL`

/* 269 */ EXTERN char * Tcl_HashStats(Tcl_HashTable *tablePtr);

<a name="api-function-tcl-hide-command_9CA29B63BF03A2766C4424BCDA0B7FB4"></a>
### FUNCTION: `TCL-HIDE-COMMAND`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::CMD-NAME
 RAW-CFFI-TCL9::HIDDEN-CMD-TOKEN)`
- SETF? `NIL`

/* 179 */ EXTERN int
Tcl_HideCommand(
  Tcl_Interp *interp, const char *cmdName, const char *hiddenCmdToken);

<a name="api-function-tcl-import_45F6A0067038DDADE2498A7F5A1EEB53"></a>
### FUNCTION: `TCL-IMPORT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::NS-PTR RAW-CFFI-TCL9::PATTERN
 RAW-CFFI-TCL9::ALLOW-OVERWRITE)`
- SETF? `NIL`

/* 510 */ EXTERN int
Tcl_Import(
  Tcl_Interp *interp, Tcl_Namespace *nsPtr, const char *pattern, int allowOverwrite);

<a name="api-function-tcl-incr-ref-count_8695DB3519AB81126ED023D5BA29DAB5"></a>
### FUNCTION: `TCL-INCR-REF-COUNT*`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`


<a name="api-function-tcl-incr-ref-count_2A1D01C03BE4A947ED409AB70BBB5C9E"></a>
### FUNCTION: `TCL-INCR-REF-COUNT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`

/* 641 */ EXTERN void Tcl_IncrRefCount(Tcl_Obj *objPtr);

<a name="api-function-tcl-init_C279A8849447A1C06E945AE358493368"></a>
### FUNCTION: `TCL-INIT*`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`

=`TCL_OK'(0)

<a name="api-function-tcl-init-bignum-from-double_2A75C935AAEAAB65EE6861EA224FDAA7"></a>
### FUNCTION: `TCL-INIT-BIGNUM-FROM-DOUBLE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::INITVAL RAW-CFFI-TCL9::TO-INIT)`
- SETF? `NIL`

/* 566 */ EXTERN int
Tcl_InitBignumFromDouble(Tcl_Interp *interp, double initval, void *toInit);

<a name="api-function-tcl-init-custom-hash-table_CF839338B129E078C0BB238EF2AD31A9"></a>
### FUNCTION: `TCL-INIT-CUSTOM-HASH-TABLE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::TABLE-PTR RAW-CFFI-TCL9::KEY-TYPE RAW-CFFI-TCL9::TYPE-PTR)`
- SETF? `NIL`

/* 423 */ EXTERN void
Tcl_InitCustomHashTable(
  Tcl_HashTable *tablePtr,
  int keyType, const Tcl_HashKeyType *typePtr);

<a name="api-function-tcl-init-hash-table_4CBF19BC355C75AE441C9B770B10255D"></a>
### FUNCTION: `TCL-INIT-HASH-TABLE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::TABLE-PTR RAW-CFFI-TCL9::KEY-TYPE)`
- SETF? `NIL`

/* 181 */ EXTERN void Tcl_InitHashTable(Tcl_HashTable *tablePtr, int keyType);

<a name="api-function-tcl-init-memory_9761AB5505B1D9E5562EBB806B4663C9"></a>
### FUNCTION: `TCL-INIT-MEMORY`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`

/* 280 */ EXTERN void Tcl_InitMemory(Tcl_Interp *interp);

<a name="api-function-tcl-init-obj-hash-table_876CA1851F4E61AC8ACCBEC1845181BA"></a>
### FUNCTION: `TCL-INIT-OBJ-HASH-TABLE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::TABLE-PTR)`
- SETF? `NIL`

/* 424 */ EXTERN void Tcl_InitObjHashTable(Tcl_HashTable *tablePtr);

<a name="api-function-tcl-init-string-rep_A3FCA3EF36A2350B5BC4FA98E8AD0821"></a>
### FUNCTION: `TCL-INIT-STRING-REP`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::BYTES RAW-CFFI-TCL9::NUM-BYTES)`
- SETF? `NIL`

/* 637 */ EXTERN char *
Tcl_InitStringRep(Tcl_Obj *objPtr, const char *bytes, TCL_HASH_TYPE numBytes);

<a name="api-function-tcl-init-stub-table_B945C53BB8E09399B5807BB4462750F7"></a>
### FUNCTION: `TCL-INIT-STUB-TABLE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9:VERSION)`
- SETF? `NIL`


<a name="api-function-tcl-init-stubs_4CC5891EBEE4E5285A53E5E72C71B8FF"></a>
### FUNCTION: `TCL-INIT-STUBS`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:VERSION RAW-CFFI-TCL9::MAGIC)`
- SETF? `NIL`


<a name="api-function-tcl-init_85B65C002BF33B5B91E786A2AA2A34CB"></a>
### FUNCTION: `TCL-INIT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`

/* 180 */ EXTERN int Tcl_Init(Tcl_Interp *interp);

<a name="api-function-tcl-input-blocked_B2714BF200EC9CE22EC22D24FBC358CF"></a>
### FUNCTION: `TCL-INPUT-BLOCKED`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN)`
- SETF? `NIL`

/* 182 */ EXTERN int Tcl_InputBlocked(Tcl_Channel chan);

<a name="api-function-tcl-input-buffered_DDEDFE861690E87E3812D1E3FB5DAC37"></a>
### FUNCTION: `TCL-INPUT-BUFFERED`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN)`
- SETF? `NIL`

/* 183 */ EXTERN int Tcl_InputBuffered(Tcl_Channel chan);

<a name="api-function-tcl-interp-active_A9EC42BFEC1FA688851350298572B67A"></a>
### FUNCTION: `TCL-INTERP-ACTIVE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`

/* 608 */ EXTERN int Tcl_InterpActive(Tcl_Interp *interp);

<a name="api-function-tcl-interp-deleted_41364DF83BF146921DDFF4901659AC3D"></a>
### FUNCTION: `TCL-INTERP-DELETED`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`

/* 184 */ EXTERN int Tcl_InterpDeleted(Tcl_Interp *interp);

<a name="api-function-tcl-invalidate-string-rep_1A0A3C9CE060A2FC0F9224E4E2B31F5E"></a>
### FUNCTION: `TCL-INVALIDATE-STRING-REP`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`

/* 42 */ EXTERN void
Tcl_InvalidateStringRep(Tcl_Obj *objPtr);

<a name="api-function-tcl-is-channel-existing_E5F7E2851F69F06D8704D5A36FB767F7"></a>
### FUNCTION: `TCL-IS-CHANNEL-EXISTING`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN-NAME)`
- SETF? `NIL`

/* 418 */ EXTERN int Tcl_IsChannelExisting(const char *channelName);

<a name="api-function-tcl-is-channel-registered_9F94EB6B364D87FDB89A6FED9298A105"></a>
### FUNCTION: `TCL-IS-CHANNEL-REGISTERED`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::CHAN)`
- SETF? `NIL`

/* 414 */ EXTERN int
Tcl_IsChannelRegistered(Tcl_Interp *interp, Tcl_Channel channel);

<a name="api-function-tcl-is-channel-shared_2C24EE72CF8024BD9A93FAF2EBF0D900"></a>
### FUNCTION: `TCL-IS-CHANNEL-SHARED`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN)`
- SETF? `NIL`

/* 413 */ EXTERN int Tcl_IsChannelShared(Tcl_Channel channel);

<a name="api-function-tcl-is-ensemble_C988F79A57ADBB8268D3354801CF596B"></a>
### FUNCTION: `TCL-IS-ENSEMBLE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::TOKEN)`
- SETF? `NIL`

/* 540 */ EXTERN int Tcl_IsEnsemble(Tcl_Command token);

<a name="api-function-tcl-is-safe_BE4B25EEB93D73EDF75B2A28427E9967"></a>
### FUNCTION: `TCL-IS-SAFE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`

/* 185 */ EXTERN int Tcl_IsSafe(Tcl_Interp *interp);

<a name="api-function-tcl-is-shared_0B4BC60E8621631079D817C9E0A328F0"></a>
### FUNCTION: `TCL-IS-SHARED*`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`


<a name="api-function-tcl-is-shared_FAD91529F5928009AA79F4FF62E58894"></a>
### FUNCTION: `TCL-IS-SHARED`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`

/* 643 */ EXTERN int Tcl_IsShared(Tcl_Obj *objPtr);

<a name="api-function-tcl-is-standard-channel_1BD8498A39FC45B592014C7B75882A74"></a>
### FUNCTION: `TCL-IS-STANDARD-CHANNEL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN)`
- SETF? `NIL`

/* 439 */ EXTERN int Tcl_IsStandardChannel(Tcl_Channel channel);

<a name="api-function-tcl-join-path_17E8D998BC48055F5E5BB71970C4E50B"></a>
### FUNCTION: `TCL-JOIN-PATH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ARGC RAW-CFFI-TCL9::ARGV RAW-CFFI-TCL9::RESULT-PTR)`
- SETF? `NIL`

/* 186 */ EXTERN char *
Tcl_JoinPath(
  Tcl_Size argc, const char *const *argv, Tcl_DString *resultPtr);


<a name="api-function-tcl-join-thread_FE1115FBEC8C8F8C7447359FE0D3421B"></a>
### FUNCTION: `TCL-JOIN-THREAD`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::THREAD-ID RAW-CFFI-TCL9::RESULT)`
- SETF? `NIL`

/* 412 */ EXTERN int Tcl_JoinThread(Tcl_ThreadId threadId, int *result);

<a name="api-function-tcl-limit-add-handler_9EEE584791667D5DDD444AD804FC0A4D"></a>
### FUNCTION: `TCL-LIMIT-ADD-HANDLER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR TYPE RAW-CFFI-TCL9:HANDLER-PROC
 RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::DELETE-PROC)`
- SETF? `NIL`

/* 520 */ EXTERN void
Tcl_LimitAddHandler(
  Tcl_Interp *interp, int type,
  Tcl_LimitHandlerProc *handlerProc,
  void *clientData,
  Tcl_LimitHandlerDeleteProc *deleteProc);

<a name="api-function-tcl-limit-check_EBFD713E63F54C51788E7B5B42460A98"></a>
### FUNCTION: `TCL-LIMIT-CHECK`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`

/* 523 */ EXTERN int Tcl_LimitCheck(Tcl_Interp *interp);

<a name="api-function-tcl-limit-exceeded_5996C893AB590035F85D0B751F9379FD"></a>
### FUNCTION: `TCL-LIMIT-EXCEEDED`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`

/* 524 */ EXTERN int Tcl_LimitExceeded(Tcl_Interp *interp);

<a name="api-function-tcl-limit-get-commands_E49A479AE7A2D6ED9C23316986241924"></a>
### FUNCTION: `TCL-LIMIT-GET-COMMANDS`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`

/* 532 */ EXTERN int Tcl_LimitGetCommands(Tcl_Interp *interp);

<a name="api-function-tcl-limit-get-granularity_D006E0661E18A74E087A2AD8ED7D33CC"></a>
### FUNCTION: `TCL-LIMIT-GET-GRANULARITY`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR TYPE)`
- SETF? `NIL`

/* 534 */ EXTERN int Tcl_LimitGetGranularity(Tcl_Interp *interp, int type);

<a name="api-function-tcl-limit-get-time_600075DC861979C191DA1E9A077FBAB6"></a>
### FUNCTION: `TCL-LIMIT-GET-TIME`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::TIME-LIMIT-PTR)`
- SETF? `NIL`

/* 533 */ EXTERN void Tcl_LimitGetTime(Tcl_Interp *interp, Tcl_Time *timeLimitPtr);

<a name="api-function-tcl-limit-ready_E155CC84E84FD79F916CDA3E5976F9E6"></a>
### FUNCTION: `TCL-LIMIT-READY`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`

/* 522 */ EXTERN int Tcl_LimitReady(Tcl_Interp *interp);

<a name="api-function-tcl-limit-remove-handler_8BEA5E01BEEA520589317080D44ADD11"></a>
### FUNCTION: `TCL-LIMIT-REMOVE-HANDLER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR TYPE RAW-CFFI-TCL9:HANDLER-PROC
 RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 521 */ EXTERN void
Tcl_LimitRemoveHandler(
  Tcl_Interp *interp, int type,
  Tcl_LimitHandlerProc *handlerProc, void *clientData);

<a name="api-function-tcl-limit-set-commands_2454A49EA61E0A144C9E7535C6DE7DE9"></a>
### FUNCTION: `TCL-LIMIT-SET-COMMANDS`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::COMMAND-LIMIT)`
- SETF? `NIL`

/* 525 */ EXTERN void
Tcl_LimitSetCommands(Tcl_Interp *interp, Tcl_Size commandLimit);

<a name="api-function-tcl-limit-set-granularity_29E8C5A29BF5E2A82C0FA0598A21B8AF"></a>
### FUNCTION: `TCL-LIMIT-SET-GRANULARITY`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR TYPE RAW-CFFI-TCL9::GRANULARITY)`
- SETF? `NIL`

/* 527 */ EXTERN void
Tcl_LimitSetGranularity(Tcl_Interp *interp, int type, int granularity);

<a name="api-function-tcl-limit-set-time_FB1C8670F621637C0E7EA3B5A527F816"></a>
### FUNCTION: `TCL-LIMIT-SET-TIME`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::TIME-LIMIT-PTR)`
- SETF? `NIL`

/* 526 */ EXTERN void
Tcl_LimitSetTime(Tcl_Interp *interp, Tcl_Time *timeLimitPtr);

<a name="api-function-tcl-limit-type-enabled_66F97ADAA626E4E4C67901C9243BC688"></a>
### FUNCTION: `TCL-LIMIT-TYPE-ENABLED`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR TYPE)`
- SETF? `NIL`

/* 528 */ EXTERN int Tcl_LimitTypeEnabled(Tcl_Interp *interp, int type);

<a name="api-function-tcl-limit-type-exceeded_6351D3794EA70D394610747C236C2AC4"></a>
### FUNCTION: `TCL-LIMIT-TYPE-EXCEEDED`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR TYPE)`
- SETF? `NIL`

/* 529 */ EXTERN int Tcl_LimitTypeExceeded(Tcl_Interp *interp, int type);

<a name="api-function-tcl-limit-type-reset_1E7603D8261D098D2BA2A84BC77B8C14"></a>
### FUNCTION: `TCL-LIMIT-TYPE-RESET`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR TYPE)`
- SETF? `NIL`

/* 531 */ EXTERN void Tcl_LimitTypeReset(Tcl_Interp *interp, int type);

<a name="api-function-tcl-limit-type-set_CB9BC00B7B63D8454EEE24955F907DCF"></a>
### FUNCTION: `TCL-LIMIT-TYPE-SET`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR TYPE)`
- SETF? `NIL`

/* 530 */ EXTERN void Tcl_LimitTypeSet(Tcl_Interp *interp, int type);

<a name="api-function-tcl-link-array_5FB0329C078D2A6B3E2835B195AFCF0E"></a>
### FUNCTION: `TCL-LINK-ARRAY`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::VAR-NAME RAW-CFFI-TCL9::ADDR TYPE
 RAW-CFFI-TCL9::SIZE)`
- SETF? `NIL`

/* 644 */ EXTERN int
Tcl_LinkArray(
  Tcl_Interp *interp, const char *varName, void *addr, int type, Tcl_Size size);

<a name="api-function-tcl-link-var_27E760F1574DC738E8C232108B677157"></a>
### FUNCTION: `TCL-LINK-VAR`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::VAR-NAME RAW-CFFI-TCL9::ADDR TYPE)`
- SETF? `NIL`

/* 187 */ EXTERN int
Tcl_LinkVar(Tcl_Interp *interp, const char *varName, void *addr, int type);

<a name="api-function-tcl-list-obj-append-element_A4DCB93BB4745BF4D570E6D5001DBC63"></a>
### FUNCTION: `TCL-LIST-OBJ-APPEND-ELEMENT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::LIST-PTR RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`

/* 44 */ EXTERN int
Tcl_ListObjAppendElement(
  Tcl_Interp *interp, Tcl_Obj *listPtr, Tcl_Obj *objPtr);

<a name="api-function-tcl-list-obj-append-list_D86F7F831EDDF6BB07D8F002E76F8D4B"></a>
### FUNCTION: `TCL-LIST-OBJ-APPEND-LIST`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::LIST-PTR RAW-CFFI-TCL9::ELEM-LIST-PTR)`
- SETF? `NIL`

/* 43 */ EXTERN int
Tcl_ListObjAppendList(
  Tcl_Interp *interp, Tcl_Obj *listPtr, Tcl_Obj *elemListPtr);

<a name="api-function-tcl-list-obj-get-elements_1701C94E4B1C11767DC7F3633C70C78C"></a>
### FUNCTION: `TCL-LIST-OBJ-GET-ELEMENTS`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::LIST-PTR RAW-CFFI-TCL9::OBJC-PTR
 RAW-CFFI-TCL9::OBJV-PTR)`
- SETF? `NIL`

/* 661 */ EXTERN int
Tcl_ListObjGetElements(
  Tcl_Interp *interp, Tcl_Obj *listPtr, Tcl_Size *objcPtr, Tcl_Obj ***objvPtr);

<a name="api-function-tcl-list-obj-index_EFBF06FE58E93AF49929EE781A4D478A"></a>
### FUNCTION: `TCL-LIST-OBJ-INDEX`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::LIST-PTR RAW-CFFI-TCL9::INDEX
 RAW-CFFI-TCL9::OBJ-PTR-PTR)`
- SETF? `NIL`

/* 46 */ EXTERN int
Tcl_ListObjIndex(
  Tcl_Interp *interp,
  Tcl_Obj *listPtr, Tcl_Size index,
  Tcl_Obj **objPtrPtr);

<a name="api-function-tcl-list-obj-length_4BC4A852DF839F468BA90E74C9BF3D37"></a>
### FUNCTION: `TCL-LIST-OBJ-LENGTH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::LIST-PTR RAW-CFFI-TCL9::LENGTH-PTR)`
- SETF? `NIL`

/* 662 */ EXTERN int
Tcl_ListObjLength(Tcl_Interp *interp, Tcl_Obj *listPtr, Tcl_Size *lengthPtr);

<a name="api-function-tcl-list-obj-replace_9E9493B55CAA023DECF75473F4402D7B"></a>
### FUNCTION: `TCL-LIST-OBJ-REPLACE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::LIST-PTR FIRST COUNT
 RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9::OBJV)`
- SETF? `NIL`

/* 48 */ EXTERN int
Tcl_ListObjReplace(
  Tcl_Interp *interp,
  Tcl_Obj *listPtr, Tcl_Size first,
  Tcl_Size count, Tcl_Size objc,
  Tcl_Obj *const objv[]);

<a name="api-function-tcl-load-file_F7820322DBDA07762CA6E4CC48248239"></a>
### FUNCTION: `TCL-LOAD-FILE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9::SYMV
 RAW-CFFI-TCL9::FLAGS RAW-CFFI-TCL9::PROC-PTRS RAW-CFFI-TCL9::HANDLE-PTR)`
- SETF? `NIL`

/* 627 */ EXTERN int
Tcl_LoadFile(
  Tcl_Interp *interp, Tcl_Obj *pathPtr,
  const char *const symv[], int flags,
  void *procPtrs, Tcl_LoadHandle *handlePtr);

<a name="api-function-tcl-log-command-info_6BA2BD1B4F4F5D1E1F34D4198A4EDDB8"></a>
### FUNCTION: `TCL-LOG-COMMAND-INFO`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::SCRIPT RAW-CFFI-TCL9::COMMAND LENGTH)`
- SETF? `NIL`

/* 359 */ EXTERN void
Tcl_LogCommandInfo(
  Tcl_Interp *interp, const char *script, const char *command, Tcl_Size length);

<a name="api-function-tcl-main-ex_06B5EE9E8B90A9B0F8B593465D26F6BD"></a>
### FUNCTION: `TCL-MAIN-EX`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ARGC RAW-CFFI-TCL9::ARGV RAW-CFFI-TCL9::APP-INIT-PROC
 RAW-CFFI-TCL9::INTERP)`
- SETF? `NIL`


<a name="api-function-tcl-make-file-channel_34BD79CB250734DECCE842E6F15BE40A"></a>
### FUNCTION: `TCL-MAKE-FILE-CHANNEL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::HANDLE RAW-CFFI-TCL9::MODE)`
- SETF? `NIL`

/* 189 */ EXTERN Tcl_Channel Tcl_MakeFileChannel(void *handle, int mode);

<a name="api-function-tcl-make-tcp-client-channel_3D4BF4E3F320D3EA80A94826C900EB84"></a>
### FUNCTION: `TCL-MAKE-TCP-CLIENT-CHANNEL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9:TCL-SOCKET)`
- SETF? `NIL`

/* 191 */ EXTERN Tcl_Channel	Tcl_MakeTcpClientChannel(void *tcpSocket);

<a name="api-function-tcl-merge_B4104A3BC8728058D1C87654D38E69DA"></a>
### FUNCTION: `TCL-MERGE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ARGC RAW-CFFI-TCL9::ARGV)`
- SETF? `NIL`

/* 192 */ EXTERN char * Tcl_Merge(Tcl_Size argc, const char *const *argv);

<a name="api-function-tcl-mutex-finalize_919E5D9D2F2C5162D215795E1B5E8CD4"></a>
### FUNCTION: `TCL-MUTEX-FINALIZE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::MUTEX-PTR)`
- SETF? `NIL`

/* 392 */ EXTERN void Tcl_MutexFinalize(Tcl_Mutex *mutex);

<a name="api-function-tcl-mutex-lock_BB3598824F24F2B9064E261210130443"></a>
### FUNCTION: `TCL-MUTEX-LOCK`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::MUTEX-PTR)`
- SETF? `NIL`

/* 308 */ EXTERN void Tcl_MutexLock(Tcl_Mutex *mutexPtr);

<a name="api-function-tcl-mutex-unlock_A604FDA0B035D887D9E036B887FF761E"></a>
### FUNCTION: `TCL-MUTEX-UNLOCK`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::MUTEX-PTR)`
- SETF? `NIL`

/* 309 */ EXTERN void Tcl_MutexUnlock(Tcl_Mutex *mutexPtr);

<a name="api-function-tcl-new-bignum-obj_0C761806FC8616F1873E37A3650F7B41"></a>
### FUNCTION: `TCL-NEW-BIGNUM-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::VALUE)`
- SETF? `NIL`

/* 555 */ EXTERN Tcl_Obj * Tcl_NewBignumObj(void *value);

<a name="api-function-tcl-new-boolean-obj_C2879A7695490224530CB71E11DCC76F"></a>
### FUNCTION: `TCL-NEW-BOOLEAN-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INT-VALUE)`
- SETF? `NIL`


<a name="api-function-tcl-new-byte-array-obj_11ED7E92F4A471910571B72460639626"></a>
### FUNCTION: `TCL-NEW-BYTE-ARRAY-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::BYTES)`
- SETF? `NIL`

/* 50 */ EXTERN Tcl_Obj *
Tcl_NewByteArrayObj(
  const unsigned char *bytes, Tcl_Size numBytes);

<a name="api-function-tcl-new-double-obj_32F848D1CB5C326346386AAE4917A2BD"></a>
### FUNCTION: `TCL-NEW-DOUBLE-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::DOUBLE-VAL)`
- SETF? `NIL`

/* 51 */ EXTERN Tcl_Obj *
Tcl_NewDoubleObj(double doubleValue);

<a name="api-function-tcl-new-int-obj_D19B0CBF1A526320C711EDF2C7C4665D"></a>
### FUNCTION: `TCL-NEW-INT-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::VALUE)`
- SETF? `NIL`


<a name="api-function-tcl-new-list-obj_28055292E664F074ACB818686EE74291"></a>
### FUNCTION: `TCL-NEW-LIST-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9::OBJV)`
- SETF? `NIL`

/* 53 */ EXTERN Tcl_Obj *
Tcl_NewListObj(Tcl_Size objc, Tcl_Obj *const objv[]);

<a name="api-function-tcl-new-long-obj_87A821636FAA254559726C499A2A027C"></a>
### FUNCTION: `TCL-NEW-LONG-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::VALUE)`
- SETF? `NIL`


<a name="api-function-tcl-new-string-obj_1DBCAD1F82D59079F2A93748469C2594"></a>
### FUNCTION: `TCL-NEW-STRING-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::BYTES LENGTH)`
- SETF? `NIL`

/* 56 */ EXTERN Tcl_Obj *
Tcl_NewStringObj(const char *bytes, Tcl_Size length);

<a name="api-function-tcl-new-unicode-obj_B0E1E3A6DE101743977C3C870E2E9CD6"></a>
### FUNCTION: `TCL-NEW-UNICODE-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::UNICODE RAW-CFFI-TCL9::NUM-CHARS)`
- SETF? `NIL`

/* 378 */ EXTERN Tcl_Obj *
Tcl_NewUnicodeObj(const Tcl_UniChar *unicode, Tcl_Size numChars);


<a name="api-function-tcl-new-wide-int-obj_DE96E3F55D2234D5C6A366CC973B0269"></a>
### FUNCTION: `TCL-NEW-WIDE-INT-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::WIDE-VALUE)`
- SETF? `NIL`

/* 488 */ EXTERN Tcl_Obj * Tcl_NewWideIntObj(Tcl_WideInt wideValue);

<a name="api-function-tcl-new-wide-u-int-obj_123BCE596E4FB7880A067EA897946821"></a>
### FUNCTION: `TCL-NEW-WIDE-U-INT-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::WIDE-VALUE)`
- SETF? `NIL`

/* 688 */ EXTERN Tcl_Obj * Tcl_NewWideUIntObj(Tcl_WideUInt wideValue);

<a name="api-function-tcl-next-hash-entry_CF5AC91DFC5031CB2D32040982734087"></a>
### FUNCTION: `TCL-NEXT-HASH-ENTRY`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SEARCH-PTR)`
- SETF? `NIL`

/* 193 */ EXTERN Tcl_HashEntry *
Tcl_NextHashEntry(Tcl_HashSearch *searchPtr);

<a name="api-function-tcl-notify-channel_33B794154D62E775CAE120310FD46319"></a>
### FUNCTION: `TCL-NOTIFY-CHANNEL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9::MASK)`
- SETF? `NIL`

/* 194 */ EXTERN void Tcl_NotifyChannel(Tcl_Channel channel, int mask);

<a name="api-function-tcl-nr-add-callback_838184AE34F79B309C3B7DFFC3530812"></a>
### FUNCTION: `TCL-NR-ADD-CALLBACK`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::POST-PROC-PTR RAW-CFFI-TCL9::DATA-0
 RAW-CFFI-TCL9::DATA-1 RAW-CFFI-TCL9::DATA-2 RAW-CFFI-TCL9::DATA-3)`
- SETF? `NIL`

/* 587 */ EXTERN void
Tcl_NRAddCallback(
  Tcl_Interp *interp,
  Tcl_NRPostProc *postProcPtr, void *data0,
  void *data1, void *data2, void *data3);

<a name="api-function-tcl-nr-call-obj-proc2_4574A047766AC930CCF47A2143D2C9F6"></a>
### FUNCTION: `TCL-NR-CALL-OBJ-PROC2`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::OBJ-PROC2 RAW-CFFI-TCL9::CLIENT-DATA
 RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9::OBJV)`
- SETF? `NIL`

/* 679 */ EXTERN int
Tcl_NRCallObjProc2(
  Tcl_Interp *interp, Tcl_ObjCmdProc2 *objProc2, void *clientData,
  Tcl_Size objc, Tcl_Obj *const objv[]);

<a name="api-function-tcl-nr-call-obj-proc_BFEB7962C689FB02DDAF914700851C20"></a>
### FUNCTION: `TCL-NR-CALL-OBJ-PROC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OBJ-PROC RAW-CFFI-TCL9::CLIENT-DATA
 RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9::OBJV)`
- SETF? `NIL`

/* 588 */ EXTERN int
Tcl_NRCallObjProc(
  Tcl_Interp *interp,
  Tcl_ObjCmdProc *objProc, void *clientData,
  Tcl_Size objc, Tcl_Obj *const objv[]);

<a name="api-function-tcl-nr-cmd-swap_F50E8992DB8C58577011458D0AB3A7B6"></a>
### FUNCTION: `TCL-NR-CMD-SWAP`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::CMD RAW-CFFI-TCL9::OBJC
 RAW-CFFI-TCL9::OBJV RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 586 */ EXTERN int
Tcl_NRCmdSwap(
  Tcl_Interp *interp, Tcl_Command cmd,
  Tcl_Size objc, Tcl_Obj *const objv[],
  int flags);

<a name="api-function-tcl-nr-create-command2_04DAB72BD518C5274172AA9B0091A782"></a>
### FUNCTION: `TCL-NR-CREATE-COMMAND2`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::CMD-NAME RAW-CFFI-TCL9::PROC
 RAW-CFFI-TCL9::NRE-PROC2 RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::DELETE-PROC)`
- SETF? `NIL`

/* 678 */ EXTERN Tcl_Command
Tcl_NRCreateCommand2(
  Tcl_Interp *interp, const char *cmdName, Tcl_ObjCmdProc2 *proc,
  Tcl_ObjCmdProc2 *nreProc2, void *clientData, Tcl_CmdDeleteProc *deleteProc);

<a name="api-function-tcl-nr-create-command_2DAD06E31F6F83B037816A02F617A965"></a>
### FUNCTION: `TCL-NR-CREATE-COMMAND`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::CMD-NAME RAW-CFFI-TCL9::PROC
 RAW-CFFI-TCL9::NRE-PROC RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::DELETE-PROC)`
- SETF? `NIL`

/* 583 */ EXTERN Tcl_Command
Tcl_NRCreateCommand(
  Tcl_Interp *interp, const char *cmdName,
  Tcl_ObjCmdProc *proc, Tcl_ObjCmdProc *nreProc,
  void *clientData, Tcl_CmdDeleteProc *deleteProc);

<a name="api-function-tcl-nr-eval-obj_682B4463697A2ADEB3DCB4BCA215C417"></a>
### FUNCTION: `TCL-NR-EVAL-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 584 */ EXTERN int
Tcl_NREvalObj(Tcl_Interp *interp, Tcl_Obj *objPtr, int flags);

<a name="api-function-tcl-nr-eval-objv_26DB9642635691CB951184654B2BA42C"></a>
### FUNCTION: `TCL-NR-EVAL-OBJV`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9::OBJV
 RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 585 */ EXTERN int
Tcl_NREvalObjv(Tcl_Interp *interp, Tcl_Size objc, Tcl_Obj *const objv[], int flags);

<a name="api-function-tcl-nr-expr-obj_C5CA90D979D29A7CC93DD3B0AFA20E50"></a>
### FUNCTION: `TCL-NR-EXPR-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::RESULT-PTR)`
- SETF? `NIL`

/* 625 */ EXTERN int
Tcl_NRExprObj(Tcl_Interp *interp, Tcl_Obj *objPtr, Tcl_Obj *resultPtr);

<a name="api-function-tcl-nr-subst-obj_4E59AE68E387B6E67B3E78DB457BE0FC"></a>
### FUNCTION: `TCL-NR-SUBST-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 626 */ EXTERN int
Tcl_NRSubstObj(Tcl_Interp *interp, Tcl_Obj *objPtr, int flags);

<a name="api-function-tcl-num-utf-chars_C6A6469FDF31192C179544C68CAFFA2B"></a>
### FUNCTION: `TCL-NUM-UTF-CHARS`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC LENGTH)`
- SETF? `NIL`

/* 669 */ EXTERN Tcl_Size Tcl_NumUtfChars(const char *src, Tcl_Size length);

<a name="api-function-tcl-obj-get-var2_D3276FBC3CCDE84521E6414A72D6402D"></a>
### FUNCTION: `TCL-OBJ-GET-VAR2`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::PART-1-PTR RAW-CFFI-TCL9::PART-2-PTR
 RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 195 */ EXTERN Tcl_Obj *
Tcl_ObjGetVar2(Tcl_Interp *interp, Tcl_Obj *part1Ptr, Tcl_Obj *part2Ptr, int flags);

<a name="api-function-tcl-obj-set-var2_DAEE89A1772BC211BC45659E88D42D64"></a>
### FUNCTION: `TCL-OBJ-SET-VAR2`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::PART-1-PTR RAW-CFFI-TCL9::PART-2-PTR
 RAW-CFFI-TCL9::NEW-VAL-PTR RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 196 */ EXTERN Tcl_Obj *
Tcl_ObjSetVar2(
  Tcl_Interp *interp, Tcl_Obj *part1Ptr,
  Tcl_Obj *part2Ptr, Tcl_Obj *newValuePtr,
  int flags);

<a name="api-function-tcl-open-command-channel_1EF966F8EE1FB57DC9B0EDF493749F51"></a>
### FUNCTION: `TCL-OPEN-COMMAND-CHANNEL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::ARGC RAW-CFFI-TCL9::ARGV
 RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 197 */ EXTERN Tcl_Channel
Tcl_OpenCommandChannel(
  Tcl_Interp *interp, Tcl_Size argc, const char **argv, int flags);

<a name="api-function-tcl-open-file-channel_BA6A9D43D5DEEAE0D6289811CD72C79C"></a>
### FUNCTION: `TCL-OPEN-FILE-CHANNEL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::FILE-NAME RAW-CFFI-TCL9::MODE-STRING
 RAW-CFFI-TCL9::PERMISSIONS)`
- SETF? `NIL`

/* 198 */ EXTERN Tcl_Channel
Tcl_OpenFileChannel(
  Tcl_Interp *interp, const char *fileName,
  const char *modeString, int permissions);

<a name="api-function-tcl-open-tcp-client_8A0C7E1EC9601727DFE5C1EF901A65DD"></a>
### FUNCTION: `TCL-OPEN-TCP-CLIENT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::PORT RAW-CFFI-TCL9::ADDRESS
 RAW-CFFI-TCL9::MY-ADDR RAW-CFFI-TCL9::MY-PORT RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 199 */ EXTERN Tcl_Channel
Tcl_OpenTcpClient(
  Tcl_Interp *interp, int port,
  const char *address, const char *myaddr,
  int myport, int flags);

<a name="api-function-tcl-open-tcp-server-ex_43A392B4B3127C2253F9217F14C47CC2"></a>
### FUNCTION: `TCL-OPEN-TCP-SERVER-EX`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::SERVICE RAW-CFFI-TCL9::HOST
 RAW-CFFI-TCL9::FLAGS RAW-CFFI-TCL9::BACKLOG RAW-CFFI-TCL9::ACCEPT-PROC
 RAW-CFFI-TCL9::CALLBACK-DATA)`
- SETF? `NIL`

/* 631 */ EXTERN Tcl_Channel
Tcl_OpenTcpServerEx(
  Tcl_Interp *interp,
  const char *service, const char *host,
  unsigned int flags, int backlog,
  Tcl_TcpAcceptProc *acceptProc,
  void *callbackData);

<a name="api-function-tcl-open-tcp-server_6E9E301214D69165CA353EADCCCF5A10"></a>
### FUNCTION: `TCL-OPEN-TCP-SERVER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::PORT RAW-CFFI-TCL9::HOST
 RAW-CFFI-TCL9::ACCEPT-PROC RAW-CFFI-TCL9::CALLBACK-DATA)`
- SETF? `NIL`

/* 200 */ EXTERN Tcl_Channel
Tcl_OpenTcpServer(
  Tcl_Interp *interp, int port, const char *host,
  Tcl_TcpAcceptProc *acceptProc, void *callbackData);

<a name="api-function-tcl-output-buffered_450A9AD2AF1105136788027848A43578"></a>
### FUNCTION: `TCL-OUTPUT-BUFFERED`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN)`
- SETF? `NIL`

/* 479 */ EXTERN int Tcl_OutputBuffered(Tcl_Channel chan);

<a name="api-function-tcl-parse-args-objv_BDD9EA4BA73622996C944EAD1075E001"></a>
### FUNCTION: `TCL-PARSE-ARGS-OBJV`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::ARG-TABLE RAW-CFFI-TCL9::OBJC-PTR
 RAW-CFFI-TCL9::OBJV RAW-CFFI-TCL9::REM-OBJV)`
- SETF? `NIL`

/* 667 */ EXTERN int
Tcl_ParseArgsObjv(
  Tcl_Interp *interp,
  const Tcl_ArgvInfo *argTable,
  Tcl_Size *objcPtr, Tcl_Obj *const *objv,
  Tcl_Obj ***remObjv);

<a name="api-function-tcl-parse-braces_4338B826B912A3B15517AD0FCA264404"></a>
### FUNCTION: `TCL-PARSE-BRACES`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::START RAW-CFFI-TCL9::NUM-BYTES
 RAW-CFFI-TCL9::PARSE-PTR APPEND RAW-CFFI-TCL9::TERM-PTR)`
- SETF? `NIL`

/* 360 */ EXTERN int
Tcl_ParseBraces(
  Tcl_Interp *interp, const char *start, Tcl_Size numBytes,
  Tcl_Parse *parsePtr, int append, const char **termPtr);

<a name="api-function-tcl-parse-command_4BDC34DABE69D34D4AC4F7F0319673CB"></a>
### FUNCTION: `TCL-PARSE-COMMAND`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::START RAW-CFFI-TCL9::NUM-BYTES
 RAW-CFFI-TCL9::NESTED RAW-CFFI-TCL9::PARSE-PTR)`
- SETF? `NIL`

/* 361 */ EXTERN int
Tcl_ParseCommand(
  Tcl_Interp *interp, const char *start, Tcl_Size numBytes,
  int nested, Tcl_Parse *parsePtr);

<a name="api-function-tcl-parse-expr_75FFB34B24E497C192E09D3845CCC38E"></a>
### FUNCTION: `TCL-PARSE-EXPR`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::START RAW-CFFI-TCL9::NUM-BYTES
 RAW-CFFI-TCL9::PARSE-PTR)`
- SETF? `NIL`

/* 362 */ EXTERN int
Tcl_ParseExpr(
  Tcl_Interp *interp, const char *start,
  Tcl_Size numBytes, Tcl_Parse *parsePtr);

<a name="api-function-tcl-parse-quoted-string_62E83E5E4BBFB97EA3D4E72B263AB5E8"></a>
### FUNCTION: `TCL-PARSE-QUOTED-STRING`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::START RAW-CFFI-TCL9::NUM-BYTES
 RAW-CFFI-TCL9::PARSE-PTR APPEND RAW-CFFI-TCL9::TERM-PTR)`
- SETF? `NIL`

/* 363 */ EXTERN int
Tcl_ParseQuotedString(
  Tcl_Interp *interp, const char *start, Tcl_Size numBytes,
  Tcl_Parse *parsePtr, int append, const char **termPtr);

<a name="api-function-tcl-parse-var-name_4737F2B19B185196EC41BEE90C27EA4C"></a>
### FUNCTION: `TCL-PARSE-VAR-NAME`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::START RAW-CFFI-TCL9::NUM-BYTES
 RAW-CFFI-TCL9::PARSE-PTR APPEND)`
- SETF? `NIL`

/* 364 */ EXTERN int
Tcl_ParseVarName(
  Tcl_Interp *interp, const char *start, Tcl_Size numBytes,
  Tcl_Parse *parsePtr, int append);

<a name="api-function-tcl-parse-var_F725CB280F819C3DA36C75D45547A03F"></a>
### FUNCTION: `TCL-PARSE-VAR`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::START RAW-CFFI-TCL9::TERM-PTR)`
- SETF? `NIL`

/* 270 */ EXTERN const char *
Tcl_ParseVar(Tcl_Interp *interp, const char *start, const char **termPtr);

<a name="api-function-tcl-pkg-init-stubs-check_36E2BD97D99A1A8C221563F5F17CDCB9"></a>
### FUNCTION: `TCL-PKG-INIT-STUBS-CHECK`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:VERSION RAW-CFFI-TCL9::EXACT)`
- SETF? `NIL`


<a name="api-function-tcl-pkg-present-ex_F40629F8F2A2FC8C60E6DEE202931962"></a>
### FUNCTION: `TCL-PKG-PRESENT-EX`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::NAME RAW-CFFI-TCL9:VERSION
 RAW-CFFI-TCL9::EXACT RAW-CFFI-TCL9::CLIENT-DATA-PTR)`
- SETF? `NIL`

/* 272 */ EXTERN const char *
Tcl_PkgPresentEx(
  Tcl_Interp *interp, const char *name, const char *version,
  int exact, void *clientDataPtr);

<a name="api-function-tcl-pkg-present_B6B0A8262E00993F33B327A5C251F137"></a>
### FUNCTION: `TCL-PKG-PRESENT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::NAME RAW-CFFI-TCL9:VERSION
 RAW-CFFI-TCL9::EXACT)`
- SETF? `NIL`


<a name="api-function-tcl-pkg-provide-ex_4A9D924F1266FA508D7E69470F94E675"></a>
### FUNCTION: `TCL-PKG-PROVIDE-EX`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::NAME RAW-CFFI-TCL9:VERSION
 RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 0 */ EXTERN int
Tcl_PkgProvideEx(Tcl_Interp *interp,
                 const char *name, const char *version,
                 const void *clientData);

<a name="api-function-tcl-pkg-provide_8779CC3FE854739214F58CE30D909E7F"></a>
### FUNCTION: `TCL-PKG-PROVIDE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::NAME RAW-CFFI-TCL9:VERSION)`
- SETF? `NIL`


<a name="api-function-tcl-pkg-require-ex_09213765CD031C7D7FF9666BCC19CA42"></a>
### FUNCTION: `TCL-PKG-REQUIRE-EX`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::NAME RAW-CFFI-TCL9:VERSION
 RAW-CFFI-TCL9::EXACT RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 1 */ EXTERN const char *
Tcl_PkgRequireEx(
  Tcl_Interp *interp,
  const char *name, const char *version,
  int exact, void *clientDataPtr);

<a name="api-function-tcl-pkg-require-proc_7B604F49DDD25824A250A1809E967F45"></a>
### FUNCTION: `TCL-PKG-REQUIRE-PROC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::NAME RAW-CFFI-TCL9::OBJC
 RAW-CFFI-TCL9::OBJV RAW-CFFI-TCL9::CLIENT-DATA-PTR)`
- SETF? `NIL`

/* 573 */ EXTERN int
Tcl_PkgRequireProc(
  Tcl_Interp *interp, const char *name, Tcl_Size objc,
  Tcl_Obj *const objv[], void *clientDataPtr);

<a name="api-function-tcl-pkg-require_46716B0DE4B5D56E6347DDD2BD281392"></a>
### FUNCTION: `TCL-PKG-REQUIRE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::NAME RAW-CFFI-TCL9:VERSION
 RAW-CFFI-TCL9::EXACT)`
- SETF? `NIL`


<a name="api-function-tcl-posix-error_F4EDDE5120F21D28B23BE9AA9491B10D"></a>
### FUNCTION: `TCL-POSIX-ERROR`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`

/* 204 */ EXTERN const char * Tcl_PosixError(Tcl_Interp *interp);

<a name="api-function-tcl-preserve_8BAC44456A8585A7F9EAB406BB0B422D"></a>
### FUNCTION: `TCL-PRESERVE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::DATA)`
- SETF? `NIL`

/* 201 */ EXTERN void Tcl_Preserve(void *data);

<a name="api-function-tcl-print-double_86691BCD53E3959FEE8AD748814DB268"></a>
### FUNCTION: `TCL-PRINT-DOUBLE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::VALUE RAW-CFFI-TCL9::DST)`
- SETF? `NIL`

/* 202 */ EXTERN void
Tcl_PrintDouble(Tcl_Interp *interp, double value, char *dst);

<a name="api-function-tcl-proc-obj-cmd_2A17BA0A770AD93F05D8AE6895AC08CC"></a>
### FUNCTION: `TCL-PROC-OBJ-CMD`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CLIENT-DATA RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OBJC
 RAW-CFFI-TCL9::OBJV)`
- SETF? `NIL`

/* 390 */ EXTERN int
Tcl_ProcObjCmd(
  void *clientData, Tcl_Interp *interp,
  Tcl_Size objc, Tcl_Obj *const objv[]);

<a name="api-function-tcl-put-env_856068A92CF2A241B6FF44E8DA8EC1AB"></a>
### FUNCTION: `TCL-PUT-ENV`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ASSIGNMENT)`
- SETF? `NIL`

/* 203 */ EXTERN int Tcl_PutEnv(const char *assignment);

<a name="api-function-tcl-query-time-proc_78E7E7E58E6F189A091A32F2AB90FE33"></a>
### FUNCTION: `TCL-QUERY-TIME-PROC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::GET-TIME-PROC-PTR RAW-CFFI-TCL9::SCALE-TIME-PROC-PTR
 RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 553 */ EXTERN void
Tcl_QueryTimeProc(
  Tcl_GetTimeProc **getProc, Tcl_ScaleTimeProc **scaleProc, void **clientData);

<a name="api-function-tcl-queue-event_AF2306561893B2474CF0D56EAB0AACCC"></a>
### FUNCTION: `TCL-QUEUE-EVENT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::EV-PTR POSITION)`
- SETF? `NIL`

/* 205 */ EXTERN void Tcl_QueueEvent(Tcl_Event *evPtr, int position);

<a name="api-function-tcl-read-chars_D7CC108E67C064F50B29182FF9C1DFE1"></a>
### FUNCTION: `TCL-READ-CHARS`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::CHARS-TO-READ
 RAW-CFFI-TCL9::APPEND-FLAG)`
- SETF? `NIL`

/* 313 */ EXTERN Tcl_Size
Tcl_ReadChars(
  Tcl_Channel channel, Tcl_Obj *objPtr,
  Tcl_Size charsToRead, int appendFlag);

<a name="api-function-tcl-read-raw_CDD9C1D03BF7440B1C1E7EE69A5EA48F"></a>
### FUNCTION: `TCL-READ-RAW`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9::DST RAW-CFFI-TCL9::BYTES-TO-READ)`
- SETF? `NIL`

/* 394 */ EXTERN Tcl_Size
Tcl_ReadRaw(Tcl_Channel chan, char *dst, Tcl_Size bytesToRead);

<a name="api-function-tcl-read_A451B06A1B3119C8CA125A7DF3B35793"></a>
### FUNCTION: `TCL-READ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9::BUF-PTR RAW-CFFI-TCL9::TO-RAD)`
- SETF? `NIL`

/* 206 */ EXTERN Tcl_Size
Tcl_Read(Tcl_Channel chan, char *bufPtr, Tcl_Size toRead);

<a name="api-function-tcl-realloc_BAD92074F58755F7E605A75FDC6D448C"></a>
### FUNCTION: `TCL-REALLOC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PTR RAW-CFFI-TCL9::SIZE)`
- SETF? `NIL`

/* 5 */ EXTERN void *
Tcl_Realloc(void *ptr, TCL_HASH_TYPE size);

<a name="api-function-tcl-record-and-eval-obj_D9CC3DF6171E909A712F3342309C4A63"></a>
### FUNCTION: `TCL-RECORD-AND-EVAL-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::CMD-PTR RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 209 */ EXTERN int
Tcl_RecordAndEvalObj(Tcl_Interp *interp, Tcl_Obj *cmdPtr, int flags);

<a name="api-function-tcl-record-and-eval_4A7076F57FDF2F50BF022CB8C2BAC0FC"></a>
### FUNCTION: `TCL-RECORD-AND-EVAL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::CMD RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 208 */ EXTERN int
Tcl_RecordAndEval(Tcl_Interp *interp, const char *cmd, int flags);

<a name="api-function-tcl-reg-exp-compile_52B357553BDC6BA9A4A21AABEBDA384C"></a>
### FUNCTION: `TCL-REG-EXP-COMPILE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::PATTER)`
- SETF? `NIL`

/* 212 */ EXTERN Tcl_RegExp
Tcl_RegExpCompile(Tcl_Interp *interp, const char *pattern);

<a name="api-function-tcl-reg-exp-exec-obj_52893109CC16892B7070E9D068C89883"></a>
### FUNCTION: `TCL-REG-EXP-EXEC-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::REGEXP RAW-CFFI-TCL9::TEXT-OBJ
 RAW-CFFI-TCL9::OFFSET RAW-CFFI-TCL9::NMATCHES RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 376 */ EXTERN int
Tcl_RegExpExecObj(
  Tcl_Interp *interp, Tcl_RegExp regexp, Tcl_Obj *textObj,
  Tcl_Size offset, Tcl_Size nmatches, int flags);

<a name="api-function-tcl-reg-exp-exec_0638612C9C247354F811520E27643936"></a>
### FUNCTION: `TCL-REG-EXP-EXEC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::REGEXP RAW-CFFI-TCL9::TEXT
 RAW-CFFI-TCL9::START)`
- SETF? `NIL`

/* 213 */ EXTERN int
Tcl_RegExpExec(
  Tcl_Interp *interp, Tcl_RegExp regexp, const char *text, const char *start);

<a name="api-function-tcl-reg-exp-get-info_46D9D7DEAA375A37471E43E07B84EEBA"></a>
### FUNCTION: `TCL-REG-EXP-GET-INFO`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::REGEXP RAW-CFFI-TCL9::INFO-PTR)`
- SETF? `NIL`

/* 377 */ EXTERN void
Tcl_RegExpGetInfo(Tcl_RegExp regexp, Tcl_RegExpInfo *infoPtr);

<a name="api-function-tcl-reg-exp-match-obj_AC14D55049A21324128EE0D4481361DC"></a>
### FUNCTION: `TCL-REG-EXP-MATCH-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::TEXT-OBJ RAW-CFFI-TCL9::PATTERN-OBJ)`
- SETF? `NIL`

/* 385 */ EXTERN int
Tcl_RegExpMatchObj(Tcl_Interp *interp, Tcl_Obj *textObj, Tcl_Obj *patternObj);

<a name="api-function-tcl-reg-exp-match_CAB8CAFCCBBF016566DE59B92CA824AE"></a>
### FUNCTION: `TCL-REG-EXP-MATCH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::TEXT RAW-CFFI-TCL9::PATTERN)`
- SETF? `NIL`

/* 214 */ EXTERN int
Tcl_RegExpMatch(Tcl_Interp *interp, const char *text, const char *pattern);

<a name="api-function-tcl-reg-exp-range_52783409C0181A15C8F3C942F708ED63"></a>
### FUNCTION: `TCL-REG-EXP-RANGE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::INDEX RAW-CFFI-TCL9::START-PTR
 RAW-CFFI-TCL9::END-PTR)`
- SETF? `NIL`

/* 215 */ EXTERN void
Tcl_RegExpRange(
  Tcl_RegExp regexp, Tcl_Size index,
  const char **startPtr, const char **endPtr);

<a name="api-function-tcl-register-channel_E704933EBE18F9C8D4AFE3072F29C4F0"></a>
### FUNCTION: `TCL-REGISTER-CHANNEL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::CHAN)`
- SETF? `NIL`

/* 210 */ EXTERN void
Tcl_RegisterChannel(Tcl_Interp *interp, Tcl_Channel chan);

<a name="api-function-tcl-register-config_8A63518588B6A948AB9FB0933E6EE79A"></a>
### FUNCTION: `TCL-REGISTER-CONFIG`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::PKG-NAME RAW-CFFI-TCL9::CONFIGURATION
 RAW-CFFI-TCL9::VAL-ENCODING)`
- SETF? `NIL`

/* 505 */ EXTERN void
Tcl_RegisterConfig(
  Tcl_Interp *interp, const char *pkgName,
  const Tcl_Config *configuration, const char *valEncoding);

<a name="api-function-tcl-register-obj-type_F23BF7285DAC015D80A88DE85F667CC6"></a>
### FUNCTION: `TCL-REGISTER-OBJ-TYPE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::TYPE-PTR)`
- SETF? `NIL`

/* 211 */ EXTERN void Tcl_RegisterObjType(const Tcl_ObjType *typePtr);

<a name="api-function-tcl-release_7127EA2D536E88173E056C684ECC4BBC"></a>
### FUNCTION: `TCL-RELEASE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 216 */ EXTERN void Tcl_Release(void *clientData);

<a name="api-function-tcl-remove-channel-mode_32BD004E56D12832FF6DA5F003764851"></a>
### FUNCTION: `TCL-REMOVE-CHANNEL-MODE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::CHAN MOD)`
- SETF? `NIL`

/* 682 */ EXTERN int
Tcl_RemoveChannelMode(Tcl_Interp *interp, Tcl_Channel chan, int mode);

<a name="api-function-tcl-reset-result_83000F361C6DACEF25C36E6FF67CFD1E"></a>
### FUNCTION: `TCL-RESET-RESULT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`

/* 217 */ EXTERN void Tcl_ResetResult(Tcl_Interp *interp);

<a name="api-function-tcl-restore-interp-state_2DC93D4BE1BA2305ECE779D4B8619FD9"></a>
### FUNCTION: `TCL-RESTORE-INTERP-STATE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::STATE)`
- SETF? `NIL`

/* 536 */ EXTERN int
Tcl_RestoreInterpState(Tcl_Interp *interp, Tcl_InterpState state);

<a name="api-function-tcl-save-interp-state_B86B36A6F6EF4FD04D9DC619746D16EA"></a>
### FUNCTION: `TCL-SAVE-INTERP-STATE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::STATUS)`
- SETF? `NIL`

/* 535 */ EXTERN Tcl_InterpState
Tcl_SaveInterpState(Tcl_Interp *interp, int status);

<a name="api-function-tcl-scan-counted-element_F9030807F9F2BAA4D36B98B5A72729DD"></a>
### FUNCTION: `TCL-SCAN-COUNTED-ELEMENT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC LENGTH RAW-CFFI-TCL9::FLAG-PTR)`
- SETF? `NIL`

/* 219 */ EXTERN Tcl_Size
Tcl_ScanCountedElement(const char *src, Tcl_Size length, int *flagPtr);

<a name="api-function-tcl-scan-element_A18229B10DAA3BD37569198A8F1C48E0"></a>
### FUNCTION: `TCL-SCAN-ELEMENT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC RAW-CFFI-TCL9::FLAG-PTR)`
- SETF? `NIL`

/* 218 */ EXTERN Tcl_Size Tcl_ScanElement(const char *src, int *flagPtr);

<a name="api-function-tcl-seek_8A9AAF550D6145F71160E8BFBCD95619"></a>
### FUNCTION: `TCL-SEEK`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9::OFFSET RAW-CFFI-TCL9::MODE)`
- SETF? `NIL`

/* 491 */ EXTERN long long
Tcl_Seek(Tcl_Channel chan, long long offset, int mode);

<a name="api-function-tcl-service-event_4D8B1195FC62FFE98C63D2C95C99F1ED"></a>
### FUNCTION: `TCL-SERVICE-EVENT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 222 */ EXTERN int Tcl_ServiceEvent(int flags);

<a name="api-function-tcl-service-mode-hook_2ED5BD3E2B26125AB119B38CE3FE1B89"></a>
### FUNCTION: `TCL-SERVICE-MODE-HOOK`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::MODE)`
- SETF? `NIL`

/* 344 */ EXTERN void Tcl_ServiceModeHook(int mode);

<a name="api-function-tcl-set-assoc-data_17BF69433A293A7EEA8EAC5C811C3FE6"></a>
### FUNCTION: `TCL-SET-ASSOC-DATA`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::NAME
 RAW-CFFI-TCL9::INTERP-DELETE-PROC RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 223 */ EXTERN void
Tcl_SetAssocData(
  Tcl_Interp *interp, const char *name,
  Tcl_InterpDeleteProc *proc, void *clientData);

<a name="api-function-tcl-set-bignum-obj_625F4EB6090CC5F036912D152FBE37EB"></a>
### FUNCTION: `TCL-SET-BIGNUM-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ RAW-CFFI-TCL9::VALUE)`
- SETF? `NIL`

/* 557 */ EXTERN void Tcl_SetBignumObj(Tcl_Obj *obj, void *value);

<a name="api-function-tcl-set-boolean-obj_C604B7CE829374334C71101C35B7A47A"></a>
### FUNCTION: `TCL-SET-BOOLEAN-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::INT-VALUE)`
- SETF? `NIL`


<a name="api-function-tcl-set-byte-array-length_5A15433B3442C744CFDB11DEDB234C8F"></a>
### FUNCTION: `TCL-SET-BYTE-ARRAY-LENGTH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::NUM-BYTES)`
- SETF? `NIL`

/* 58 */ EXTERN unsigned char *
Tcl_SetByteArrayLength(
  Tcl_Obj *objPtr, Tcl_Size numBytes);

<a name="api-function-tcl-set-byte-array-obj_F3B51567F89A262FFEBD9F0A969F14C6"></a>
### FUNCTION: `TCL-SET-BYTE-ARRAY-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::BYTES RAW-CFFI-TCL9::NUM-BYTES)`
- SETF? `NIL`

/* 59 */ EXTERN void
Tcl_SetByteArrayObj(
  Tcl_Obj *objPtr, const unsigned char *bytes, Tcl_Size numBytes);

<a name="api-function-tcl-set-channel-buffer-size_B8C69787E728CD7DE7D0C3C66EA3A23A"></a>
### FUNCTION: `TCL-SET-CHANNEL-BUFFER-SIZE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9::SZ)`
- SETF? `NIL`

/* 224 */  EXTERN void Tcl_SetChannelBufferSize(Tcl_Channel chan, Tcl_Size sz);

<a name="api-function-tcl-set-channel-error-interp_7F19C6007DDE265001F8F548EC0BB320"></a>
### FUNCTION: `TCL-SET-CHANNEL-ERROR-INTERP`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::MSG)`
- SETF? `NIL`

/* 562 */ EXTERN void
Tcl_SetChannelErrorInterp(Tcl_Interp *interp, Tcl_Obj *msg);

<a name="api-function-tcl-set-channel-error_8CEF2A0FA018AC9512E5A80387CDF25A"></a>
### FUNCTION: `TCL-SET-CHANNEL-ERROR`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9::MSG)`
- SETF? `NIL`

/* 564 */ EXTERN void Tcl_SetChannelError(Tcl_Channel chan, Tcl_Obj *msg);

<a name="api-function-tcl-set-channel-option_92A8EC8CCBDE49773D7DA05559A40B80"></a>
### FUNCTION: `TCL-SET-CHANNEL-OPTION`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9::OPTION-NAME
 RAW-CFFI-TCL9::NEW-VALUE)`
- SETF? `NIL`

/* 225 */ EXTERN int
Tcl_SetChannelOption(
  Tcl_Interp *interp, Tcl_Channel chan,
  const char *optionName, const char *newValue);

<a name="api-function-tcl-set-command-info-from-token_0DA53AD23B30C8CC0450580C13BC07EE"></a>
### FUNCTION: `TCL-SET-COMMAND-INFO-FROM-TOKEN`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::TOKEN RAW-CFFI-TCL9::CMD-INFO-PTR)`
- SETF? `NIL`

/* 485 */ EXTERN int
Tcl_SetCommandInfoFromToken(Tcl_Command token, const Tcl_CmdInfo *infoPtr);

<a name="api-function-tcl-set-command-info_42855946F4C29D4A444F46974FCBBC5B"></a>
### FUNCTION: `TCL-SET-COMMAND-INFO`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::CMD-NAME RAW-CFFI-TCL9::INFO-PTR)`
- SETF? `NIL`

/* 226 */ EXTERN int
Tcl_SetCommandInfo(
  Tcl_Interp *interp, const char *cmdName, const Tcl_CmdInfo *infoPtr);

<a name="api-function-tcl-set-double-obj_CC0ED5F9438C909363FEC137C038BC78"></a>
### FUNCTION: `TCL-SET-DOUBLE-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::DOUBLE-VAL)`
- SETF? `NIL`

/* 60 */ EXTERN void
Tcl_SetDoubleObj(Tcl_Obj *objPtr, double doubleValue);

<a name="api-function-tcl-set-encoding-search-path_8E11986EC94BD0637E43DC2D88D9D2DA"></a>
### FUNCTION: `TCL-SET-ENCODING-SEARCH-PATH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SEARCH-PTR)`
- SETF? `NIL`

/* 571 */ EXTERN int Tcl_SetEncodingSearchPath(Tcl_Obj *searchPath);

<a name="api-function-tcl-set-ensemble-flags_DB25CD1A6E28A2299FAF936662B1E5F1"></a>
### FUNCTION: `TCL-SET-ENSEMBLE-FLAGS`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::TOKEN RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 546 */ EXTERN int
Tcl_SetEnsembleFlags(Tcl_Interp *interp, Tcl_Command token, int flags);

<a name="api-function-tcl-set-ensemble-mapping-dict_52622FA1AB479494A0B0D462355498FD"></a>
### FUNCTION: `TCL-SET-ENSEMBLE-MAPPING-DICT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::TOKEN RAW-CFFI-TCL9::MAP-DICT)`
- SETF? `NIL`

/* 544 */ EXTERN int
Tcl_SetEnsembleMappingDict(Tcl_Interp *interp, Tcl_Command token, Tcl_Obj *mapDict);

<a name="api-function-tcl-set-ensemble-parameter-list_1DCF982D74F9D7A9CEE04AB3F3A4465B"></a>
### FUNCTION: `TCL-SET-ENSEMBLE-PARAMETER-LIST`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::TOKEN RAW-CFFI-TCL9::PARAM-LIST)`
- SETF? `NIL`

/* 602 */ EXTERN int
Tcl_SetEnsembleParameterList(Tcl_Interp *interp, Tcl_Command token, Tcl_Obj *paramList);

<a name="api-function-tcl-set-ensemble-subcommand-list_784F82A5AED2A21383EFDCC5F46041A9"></a>
### FUNCTION: `TCL-SET-ENSEMBLE-SUBCOMMAND-LIST`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::TOKEN RAW-CFFI-TCL9::SUBCMD-LIST)`
- SETF? `NIL`

/* 543 */ EXTERN int
Tcl_SetEnsembleSubcommandList(
  Tcl_Interp *interp,Tcl_Command token, Tcl_Obj *subcmdList);

<a name="api-function-tcl-set-ensemble-unknown-handler_5EA2ADAAFFFC59799EFF3D4161C3BF19"></a>
### FUNCTION: `TCL-SET-ENSEMBLE-UNKNOWN-HANDLER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::TOKEN RAW-CFFI-TCL9::UNKNOWN-LIST)`
- SETF? `NIL`

/* 545 */ EXTERN int
Tcl_SetEnsembleUnknownHandler(
  Tcl_Interp *interp, Tcl_Command token, Tcl_Obj *unknownList);

<a name="api-function-tcl-set-errno_6B1B00C6A386B29CB48697AD104E18F1"></a>
### FUNCTION: `TCL-SET-ERRNO`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ERR)`
- SETF? `NIL`

/* 227 */ EXTERN void Tcl_SetErrno(int err);

<a name="api-function-tcl-set-error-line_97EC2EA0211CD5323A413145BE17C15D"></a>
### FUNCTION: `TCL-SET-ERROR-LINE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::LINE-NUM)`
- SETF? `NIL`

/* 606 */ EXTERN void Tcl_SetErrorLine(Tcl_Interp *interp, int lineNum);

<a name="api-function-tcl-set-int-obj_99DEA31BB1B883E7026627BCB895B6A3"></a>
### FUNCTION: `TCL-SET-INT-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::VALUE)`
- SETF? `NIL`


<a name="api-function-tcl-set-list-obj_35231A3457970A2E1DE9AAECA8987AA5"></a>
### FUNCTION: `TCL-SET-LIST-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9::OBJV)`
- SETF? `NIL`

/* 62 */ EXTERN void
Tcl_SetListObj(
  Tcl_Obj *objPtr, Tcl_Size objc, Tcl_Obj *const objv[]);

<a name="api-function-tcl-set-long-obj_1C94DE270C07990C639EF807C7013A47"></a>
### FUNCTION: `TCL-SET-LONG-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::VALUE)`
- SETF? `NIL`


<a name="api-function-tcl-set-main-loop_2D2042A330741AEF324D70AC70F2A330"></a>
### FUNCTION: `TCL-SET-MAIN-LOOP`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::MAIN-LOOP-PROC)`
- SETF? `NIL`

/* 284 */ EXTERN void Tcl_SetMainLoop(Tcl_MainLoopProc *proc);

<a name="api-function-tcl-set-max-block-time_02D35B8BA60B2B4135F1FA55D87C3FDC"></a>
### FUNCTION: `TCL-SET-MAX-BLOCK-TIME`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::TIME-PTR)`
- SETF? `NIL`

/* 229 */ EXTERN void Tcl_SetMaxBlockTime(const Tcl_Time *timePtr);

<a name="api-function-tcl-set-namespace-unknown-handler_0F5DA2962EC091C7AD23DE009D0BD4DB"></a>
### FUNCTION: `TCL-SET-NAMESPACE-UNKNOWN-HANDLER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::NS-PTR RAW-CFFI-TCL9::HANDLER-PTR)`
- SETF? `NIL`

/* 568 */ EXTERN int
Tcl_SetNamespaceUnknownHandler(
  Tcl_Interp *interp, Tcl_Namespace *nsPtr, Tcl_Obj *handlerPtr);

<a name="api-function-tcl-set-notifier_00730F54D4B221006047C17393567120"></a>
### FUNCTION: `TCL-SET-NOTIFIER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::NOTIFIER-PROC-PTR)`
- SETF? `NIL`

/* 386 */ EXTERN void Tcl_SetNotifier(const Tcl_NotifierProcs *notifierProcPtr);

<a name="api-function-tcl-set-obj-error-code_5BF38A06ABEFF760CC7FE7D143D450EF"></a>
### FUNCTION: `TCL-SET-OBJ-ERROR-CODE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::ERROR-OBJ-PTR)`
- SETF? `NIL`

/* 234 */ EXTERN void
Tcl_SetObjErrorCode(Tcl_Interp *interp, Tcl_Obj *errorObjPtr);

<a name="api-function-tcl-set-obj-length_B4E21766F9F5228AE5E5882AC7BB2D4C"></a>
### FUNCTION: `TCL-SET-OBJ-LENGTH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR LENGTH)`
- SETF? `NIL`

/* 64 */ EXTERN void
Tcl_SetObjLength(Tcl_Obj *objPtr, Tcl_Size length);

<a name="api-function-tcl-set-obj-name-of-executable_59570B98BCF1A15422BFE30F108ED200"></a>
### FUNCTION: `TCL-SET-OBJ-NAME-OF-EXECUTABLE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::NAME RAW-CFFI-TCL9::ENC)`
- SETF? `NIL`


<a name="api-function-tcl-set-obj-result_FD0EEA2047E3F7A169D7FBCE61816363"></a>
### FUNCTION: `TCL-SET-OBJ-RESULT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::RESULT-OBJ-PTR)`
- SETF? `NIL`

/* 235 */ EXTERN void
Tcl_SetObjResult(Tcl_Interp *interp, Tcl_Obj *resultObjPtr);

<a name="api-function-tcl-set-panic-proc_B4E0B2D4BBB9819CFAD23519D09C0C6F"></a>
### FUNCTION: `TCL-SET-PANIC-PROC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PANIC-PROC)`
- SETF? `NIL`


<a name="api-function-tcl-set-pre-init-script_8EC47C54A6C9BE98300DF8C5712EC39C"></a>
### FUNCTION: `TCL-SET-PRE-INIT-SCRIPT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(STRING)`
- SETF? `NIL`


<a name="api-function-tcl-set-recursion-limit_E5F244E98F0D8E14A5BBFC57C6CB554E"></a>
### FUNCTION: `TCL-SET-RECURSION-LIMIT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::DEPTH)`
- SETF? `NIL`

/* 231 */ EXTERN Tcl_Size
Tcl_SetRecursionLimit(Tcl_Interp *interp, Tcl_Size depth);

<a name="api-function-tcl-set-result_F202CC768931F8FF1F70D022C25EECF4"></a>
### FUNCTION: `TCL-SET-RESULT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::RESULT RAW-CFFI-TCL9::FREE-PROC)`
- SETF? `NIL`


<a name="api-function-tcl-set-return-options_AF53917230994BBC93057833083FB153"></a>
### FUNCTION: `TCL-SET-RETURN-OPTIONS`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OPTIONS)`
- SETF? `NIL`

/* 538 */ EXTERN int
Tcl_SetReturnOptions(Tcl_Interp *interp, Tcl_Obj *options);

<a name="api-function-tcl-set-service-mode_FD9AD7F89EA810ACD25F02D822303ABC"></a>
### FUNCTION: `TCL-SET-SERVICE-MODE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::MODE)`
- SETF? `NIL`

/* 233 */ EXTERN int Tcl_SetServiceMode(int mode);

<a name="api-function-tcl-set-startup-script_FF6939ECBAF4DD9DFEE471039F178F1E"></a>
### FUNCTION: `TCL-SET-STARTUP-SCRIPT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PATH RAW-CFFI-TCL9::ENCODING)`
- SETF? `NIL`

/* 622 */ EXTERN void Tcl_SetStartupScript(Tcl_Obj *path, const char *encoding);

<a name="api-function-tcl-set-std-channel_D8420222F96112D884EAD349D52CC08C"></a>
### FUNCTION: `TCL-SET-STD-CHANNEL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN TYPE)`
- SETF? `NIL`

/* 236 */ EXTERN void Tcl_SetStdChannel(Tcl_Channel channel, int type);

<a name="api-function-tcl-set-string-obj_1A94675A95A0D04389ACE159D02E8514"></a>
### FUNCTION: `TCL-SET-STRING-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::BYTES LENGTH)`
- SETF? `NIL`

/* 65 */ EXTERN void
Tcl_SetStringObj(
  Tcl_Obj *objPtr, const char *bytes, Tcl_Size length);

<a name="api-function-tcl-set-system-encoding_4A3367178B2E1319FCBBC8958F2230CC"></a>
### FUNCTION: `TCL-SET-SYSTEM-ENCODING`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::NAME)`
- SETF? `NIL`

/* 316 */ EXTERN int Tcl_SetSystemEncoding(Tcl_Interp *interp, const char *name);

<a name="api-function-tcl-set-time-proc_6D654674B39CC2FCCB500637550B75DC"></a>
### FUNCTION: `TCL-SET-TIME-PROC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::GET-TIME-PROC RAW-CFFI-TCL9::SCALE-TIME-PROC
 RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 552 */ EXTERN void
Tcl_SetTimeProc(
  Tcl_GetTimeProc *getProc,
  Tcl_ScaleTimeProc *scaleProc,
  void *clientData);


<a name="api-function-tcl-set-timer_0B9155D119A8CCB27DE9A449DF02BD1A"></a>
### FUNCTION: `TCL-SET-TIMER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::TIME-PTR)`
- SETF? `NIL`

/* 11 */ EXTERN void
Tcl_SetTimer(const Tcl_Time *timePtr);

<a name="api-function-tcl-set-unicode-obj_90DC373A16C9482753A77B84DB8D3BF7"></a>
### FUNCTION: `TCL-SET-UNICODE-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::UNICODE RAW-CFFI-TCL9::NUM-CHARS)`
- SETF? `NIL`

/* 379 */ EXTERN void
Tcl_SetUnicodeObj(
  Tcl_Obj *objPtr, const Tcl_UniChar *unicode, Tcl_Size numChars);

<a name="api-function-tcl-set-var2-ex_627EB384A8929CB690934C0409385275"></a>
### FUNCTION: `TCL-SET-VAR2-EX`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::PART-1 RAW-CFFI-TCL9::PART-2
 RAW-CFFI-TCL9::NEW-VALUE-PTR RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 317 */ EXTERN Tcl_Obj *
Tcl_SetVar2Ex(
  Tcl_Interp *interp, const char *part1, const char *part2,
  Tcl_Obj *newValuePtr, int flags);

<a name="api-function-tcl-set-var2_94A7E349DE7144097720EA49F2C21ADB"></a>
### FUNCTION: `TCL-SET-VAR2`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::PART-1 RAW-CFFI-TCL9::PART-2
 RAW-CFFI-TCL9::NEW-VALUE RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 238 */ EXTERN const char *
Tcl_SetVar2(
  Tcl_Interp *interp, const char *part1,
  const char *part2, const char *newValue, int flags);

<a name="api-function-tcl-set-var_1EA3AA2DCFF3B96E20A214C0AC327059"></a>
### FUNCTION: `TCL-SET-VAR`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::VAR-NAME RAW-CFFI-TCL9::NEW-VALUE
 RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`


<a name="api-function-tcl-set-wide-int-obj_25522A3C691B651F5FDA0878F61211E9"></a>
### FUNCTION: `TCL-SET-WIDE-INT-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::WIDE-VALUE)`
- SETF? `NIL`

/* 489 */ EXTERN void Tcl_SetWideIntObj(Tcl_Obj *objPtr, Tcl_WideInt wideValue);

<a name="api-function-tcl-set-wide-u-int-obj_7CC68BE0AF19CD3D33B201695AB96A59"></a>
### FUNCTION: `TCL-SET-WIDE-U-INT-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::UWIDE-VALUE)`
- SETF? `NIL`

/* 689 */ EXTERN void
Tcl_SetWideUIntObj(Tcl_Obj *objPtr, Tcl_WideUInt uwideValue);

<a name="api-function-tcl-signal-id_192A401897150F87BDE9302D53878489"></a>
### FUNCTION: `TCL-SIGNAL-ID`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SIG)`
- SETF? `NIL`

/* 239 */ EXTERN const char * Tcl_SignalId(int sig);

<a name="api-function-tcl-signal-msg_526583F286C4A1B2AC08E1161D0BF821"></a>
### FUNCTION: `TCL-SIGNAL-MSG`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SIG)`
- SETF? `NIL`

/* 240 */ EXTERN const char * Tcl_SignalMsg(int sig);

<a name="api-function-tcl-sleep_51BDAFE8AFCF0444D8D84E1A27AB5042"></a>
### FUNCTION: `TCL-SLEEP`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::MS)`
- SETF? `NIL`

/* 12 */ EXTERN void
Tcl_Sleep(int ms);

<a name="api-function-tcl-source-rc-file_1EA5E5BDA421A9FE8F0757D20BFFD9A9"></a>
### FUNCTION: `TCL-SOURCE-RC-FILE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`

/* 241 */ EXTERN void Tcl_SourceRCFile(Tcl_Interp *interp);

<a name="api-function-tcl-splice-channel_50A0CBAD6B9808D37A90F25E030BC82C"></a>
### FUNCTION: `TCL-SPLICE-CHANNEL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN)`
- SETF? `NIL`

/* 416 */ EXTERN void Tcl_SpliceChannel(Tcl_Channel channel);

<a name="api-function-tcl-split-list_2461CE263C8181008BDFD5A5023103B9"></a>
### FUNCTION: `TCL-SPLIT-LIST`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::LIST-STR RAW-CFFI-TCL9::ARGC-PTR
 RAW-CFFI-TCL9::ARGV-PTR)`
- SETF? `NIL`

/* 664 */ EXTERN int
Tcl_SplitList(
  Tcl_Interp *interp,
  const char *listStr, Tcl_Size *argcPtr,
  const char ***argvPtr);

<a name="api-function-tcl-split-path_87D84F938606511D026A2B22A5C56AF8"></a>
### FUNCTION: `TCL-SPLIT-PATH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PATH RAW-CFFI-TCL9::ARGC-PTR RAW-CFFI-TCL9::ARGV-PTR)`
- SETF? `NIL`

/* 665 */ EXTERN void
Tcl_SplitPath(const char *path, Tcl_Size *argcPtr, const char ***argvPtr);

<a name="api-function-tcl-stack-channel_C9EBD8841E85ED50A07C6ED2ED244788"></a>
### FUNCTION: `TCL-STACK-CHANNEL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::TYPE-PTR RAW-CFFI-TCL9::INSTANCE-DATA
 RAW-CFFI-TCL9::MASK RAW-CFFI-TCL9::PREV-CHAN)`
- SETF? `NIL`

/* 281 */ EXTERN Tcl_Channel
Tcl_StackChannel(
  Tcl_Interp *interp, const Tcl_ChannelType *typePtr,
  void *instanceData, int mask, Tcl_Channel prevChan);

<a name="api-function-tcl-stat_9CF871AE44D842961815ED5402370DAE"></a>
### FUNCTION: `TCL-STAT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PATH RAW-CFFI-TCL9::BUF-PTR)`
- SETF? `NIL`

/* 368 */ EXTERN int Tcl_Stat(const char *path, struct stat *bufPtr);

<a name="api-function-tcl-static-library_650F6DDF751E2A1FC7E04F510CD2899F"></a>
### FUNCTION: `TCL-STATIC-LIBRARY`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::PREFIX RAW-CFFI-TCL9::INIT-PROC
 RAW-CFFI-TCL9::SAFE-INIT-PROC)`
- SETF? `NIL`


<a name="api-function-tcl-store-internal-rep_758BE08F73309FA8A316BA004543CC8E"></a>
### FUNCTION: `TCL-STORE-INTERNAL-REP`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::TYPE-PTR RAW-CFFI-TCL9::IR-PTR)`
- SETF? `NIL`

/* 639 */ EXTERN void
Tcl_StoreInternalRep(
  Tcl_Obj *objPtr, const Tcl_ObjType *typePtr, const Tcl_ObjInternalRep *irPtr);

<a name="api-function-tcl-string-case-match_F7F1BB8422D30342278023CEC22D72DB"></a>
### FUNCTION: `TCL-STRING-CASE-MATCH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::STR RAW-CFFI-TCL9::PATTERN RAW-CFFI-TCL9::NOCASE)`
- SETF? `NIL`

/* 371 */ EXTERN int
Tcl_StringCaseMatch(const char *str, const char *pattern, int nocase);

<a name="api-function-tcl-string-match_1AE798AE958C1A9AA087632EE46D0AA0"></a>
### FUNCTION: `TCL-STRING-MATCH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::STR RAW-CFFI-TCL9::PAT)`
- SETF? `NIL`


<a name="api-function-tcl-stub-call_7D5D6B9AED5FEBAF6AE541BDC7DA5995"></a>
### FUNCTION: `TCL-STUB-CALL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ARG)`
- SETF? `NIL`


<a name="api-function-tcl-subst-obj_0BE8B7478483E01689BB3859421BDDD1"></a>
### FUNCTION: `TCL-SUBST-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 437 */ EXTERN Tcl_Obj *
Tcl_SubstObj(Tcl_Interp *interp, Tcl_Obj *objPtr, int flags);

<a name="api-function-tcl-take-bignum-from-obj_FEE50E25B03EC12A1BF607DF1B57F513"></a>
### FUNCTION: `TCL-TAKE-BIGNUM-FROM-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OBJ RAW-CFFI-TCL9::VALUE)`
- SETF? `NIL`

/* 559 */ EXTERN int
Tcl_TakeBignumFromObj(Tcl_Interp *interp, Tcl_Obj *obj, void *value);

<a name="api-function-tcl-tell_FD776D2D2C36FF067CBEDA47504BBD93"></a>
### FUNCTION: `TCL-TELL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN)`
- SETF? `NIL`

/* 492 */ EXTERN long long Tcl_Tell(Tcl_Channel chan);

<a name="api-function-tcl-thread-alert_81765DD9867DBEE9460D0A89AC303247"></a>
### FUNCTION: `TCL-THREAD-ALERT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::THREAD-ID)`
- SETF? `NIL`

/* 318 */ EXTERN void Tcl_ThreadAlert(Tcl_ThreadId threadId);

<a name="api-function-tcl-thread-queue-event_51247883145089591456E69369B91078"></a>
### FUNCTION: `TCL-THREAD-QUEUE-EVENT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::THREAD-ID RAW-CFFI-TCL9::EV-PTR POSITION)`
- SETF? `NIL`

/* 319 */ EXTERN void
Tcl_ThreadQueueEvent(Tcl_ThreadId threadId, Tcl_Event *evPtr, int position);

<a name="api-function-tcl-tom-math-initialize-stubs_290BE48AF0AA2CC74FE9227FC2BFCB21"></a>
### FUNCTION: `TCL-TOM-MATH-INITIALIZE-STUBS`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9:VERSION RAW-CFFI-TCL9::EPOCH
 RAW-CFFI-TCL9::REVISION)`
- SETF? `NIL`


<a name="api-function-tcl-trace-command_C402374F2AF675DF2EF9CDA937B7F30A"></a>
### FUNCTION: `TCL-TRACE-COMMAND`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::VAR-NAME RAW-CFFI-TCL9::FLAGS
 RAW-CFFI-TCL9::CMD-TRACE-PROC RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 426 */ EXTERN int
Tcl_TraceCommand(
  Tcl_Interp *interp, const char *varName, int flags,
  Tcl_CommandTraceProc *proc, void *clientData);

<a name="api-function-tcl-trace-var2_FD43ED4DE45E3D55C4BE7EE8DF928B7C"></a>
### FUNCTION: `TCL-TRACE-VAR2`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::PART-1 RAW-CFFI-TCL9::PART-2
 RAW-CFFI-TCL9::FLAGS RAW-CFFI-TCL9::VAR-TRACE-PROC RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 248 */ EXTERN int
Tcl_TraceVar2(
  Tcl_Interp *interp, const char *part1,
  const char *part2, int flags,
  Tcl_VarTraceProc *proc, void *clientData);

<a name="api-function-tcl-trace-var_EA702A0C76B50B2AE5BB770EC9BAA20A"></a>
### FUNCTION: `TCL-TRACE-VAR`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::VAR-NAME RAW-CFFI-TCL9::FLAGS
 RAW-CFFI-TCL9::PROC RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`


<a name="api-function-tcl-transfer-result_FDD83B1B7161430C5088D388EAEE9F6B"></a>
### FUNCTION: `TCL-TRANSFER-RESULT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC-INTERP-PTR RAW-CFFI-TCL9::CODE
 RAW-CFFI-TCL9::TARGET-INTERP-PTR)`
- SETF? `NIL`

/* 607 */ EXTERN void
Tcl_TransferResult(Tcl_Interp *sourceInterp, int code, Tcl_Interp *targetInterp);

<a name="api-function-tcl-translate-file-name_3F2FEFADEF4D1F2F4C421F8663F4D930"></a>
### FUNCTION: `TCL-TRANSLATE-FILE-NAME`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::NAME RAW-CFFI-TCL9::BUFFER-PTR)`
- SETF? `NIL`

/* 249 */ EXTERN char *
Tcl_TranslateFileName(
  Tcl_Interp *interp, const char *name, Tcl_DString *bufferPtr);

<a name="api-function-tcl-truncate-channel_38372B1738C1FAA2575039CBC6B2D709"></a>
### FUNCTION: `TCL-TRUNCATE-CHANNEL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN LENGTH)`
- SETF? `NIL`

/* 560 */ EXTERN int
Tcl_TruncateChannel(Tcl_Channel chan, long long length);

<a name="api-function-tcl-ungets_93078B960ACCD1A3D75AD6903120FC26"></a>
### FUNCTION: `TCL-UNGETS`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9::STR RAW-CFFI-TCL9::LEN
 RAW-CFFI-TCL9::AT-HEAD)`
- SETF? `NIL`

/* 250 */ EXTERN Tcl_Size
Tcl_Ungets(Tcl_Channel chan, const char *str, Tcl_Size len, int atHead);

<a name="api-function-tcl-uni-char-at-index_70D7B3989E4AB8FD5ABCFA0FE7A7F0B8"></a>
### FUNCTION: `TCL-UNI-CHAR-AT-INDEX`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC RAW-CFFI-TCL9::INDEX)`
- SETF? `NIL`

/* 320 */  EXTERN int Tcl_UniCharAtIndex(const char *src, Tcl_Size index);

<a name="api-function-tcl-uni-char-is-alnum_1B86F182C4DDCDA556CD7B4D96940832"></a>
### FUNCTION: `TCL-UNI-CHAR-IS-ALNUM`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CH)`
- SETF? `NIL`

/* 345 */ EXTERN int Tcl_UniCharIsAlnum(int ch);

<a name="api-function-tcl-uni-char-is-alpha_CA6DCFAAB2A37AF0259125D271A9FC85"></a>
### FUNCTION: `TCL-UNI-CHAR-IS-ALPHA`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CH)`
- SETF? `NIL`

/* 346 */ EXTERN int Tcl_UniCharIsAlpha(int ch);

<a name="api-function-tcl-uni-char-is-control_0C8500E7D8105EFBDC1C8C4C7CCF0E06"></a>
### FUNCTION: `TCL-UNI-CHAR-IS-CONTROL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CH)`
- SETF? `NIL`

/* 372 */ EXTERN int Tcl_UniCharIsControl(int ch);

<a name="api-function-tcl-uni-char-is-digit_46C8D886C821CF1534CB4441C88AF3FD"></a>
### FUNCTION: `TCL-UNI-CHAR-IS-DIGIT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CH)`
- SETF? `NIL`

/* 347 */ EXTERN int Tcl_UniCharIsDigit(int ch);

<a name="api-function-tcl-uni-char-is-graph_F7B20DE27095664E45BD04248AF56704"></a>
### FUNCTION: `TCL-UNI-CHAR-IS-GRAPH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CH)`
- SETF? `NIL`

/* 373 */ EXTERN int Tcl_UniCharIsGraph(int ch);

<a name="api-function-tcl-uni-char-is-lower_71FC8F5C9BAA3D747FB5A195BBAAC62E"></a>
### FUNCTION: `TCL-UNI-CHAR-IS-LOWER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CH)`
- SETF? `NIL`

/* 348 */ EXTERN int Tcl_UniCharIsLower(int ch);

<a name="api-function-tcl-uni-char-is-print_75C62BD15DDE9948AE066FAC2245F1D3"></a>
### FUNCTION: `TCL-UNI-CHAR-IS-PRINT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CH)`
- SETF? `NIL`

/* 374 */ EXTERN int Tcl_UniCharIsPrint(int ch);

<a name="api-function-tcl-uni-char-is-punct_A5A42DE41D4B24C8BD3125EF76B009E6"></a>
### FUNCTION: `TCL-UNI-CHAR-IS-PUNCT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CH)`
- SETF? `NIL`

/* 375 */ EXTERN int Tcl_UniCharIsPunct(int ch);

<a name="api-function-tcl-uni-char-is-space_A4EDC24A502D409F2E8D3E495B85658D"></a>
### FUNCTION: `TCL-UNI-CHAR-IS-SPACE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CH)`
- SETF? `NIL`

/* 349 */ EXTERN int Tcl_UniCharIsSpace(int ch);

<a name="api-function-tcl-uni-char-is-upper_0F04586349366694A734ACE23633E4E0"></a>
### FUNCTION: `TCL-UNI-CHAR-IS-UPPER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CH)`
- SETF? `NIL`

/* 350 */ EXTERN int Tcl_UniCharIsUpper(int ch);

<a name="api-function-tcl-uni-char-is-word-char_80DB3AA5D2D47C2262AE979604707DC7"></a>
### FUNCTION: `TCL-UNI-CHAR-IS-WORD-CHAR`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CH)`
- SETF? `NIL`

/* 351 */ EXTERN int Tcl_UniCharIsWordChar(int ch);

<a name="api-function-tcl-uni-char-len_EA98542E23AD90B024B3D2B460729FB0"></a>
### FUNCTION: `TCL-UNI-CHAR-LEN`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::UNI-STR)`
- SETF? `NIL`

/* 668 */ EXTERN Tcl_Size Tcl_UniCharLen(const int *uniStr);

<a name="api-function-tcl-uni-char-to-lower_CF6D7009B9DF288BB2123F85CB176A94"></a>
### FUNCTION: `TCL-UNI-CHAR-TO-LOWER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CH)`
- SETF? `NIL`

/* 321 */ EXTERN int Tcl_UniCharToLower(int ch);

<a name="api-function-tcl-uni-char-to-title_0C830D0977ED48DA2246B46C449AE7A7"></a>
### FUNCTION: `TCL-UNI-CHAR-TO-TITLE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CH)`
- SETF? `NIL`

/* 322 */ EXTERN int Tcl_UniCharToTitle(int ch);

<a name="api-function-tcl-uni-char-to-upper_A15C36C8FEFA6F81593826404029542D"></a>
### FUNCTION: `TCL-UNI-CHAR-TO-UPPER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CH)`
- SETF? `NIL`

/* 323 */ EXTERN int Tcl_UniCharToUpper(int ch);

<a name="api-function-tcl-uni-char-to-utf-d-string_4B2C83AAC1F2594C4E4908BCFE715622"></a>
### FUNCTION: `TCL-UNI-CHAR-TO-UTF-D-STRING`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::UNI-STR RAW-CFFI-TCL9::UNI-LEN RAW-CFFI-TCL9::DS-PTR)`
- SETF? `NIL`

/* 647 */ EXTERN char *
Tcl_UniCharToUtfDString(const int *uniStr, Tcl_Size uniLength, Tcl_DString *dsPtr);

<a name="api-function-tcl-uni-char-to-utf_B804DF1250CBB2C0F3AD4B6751D34F5D"></a>
### FUNCTION: `TCL-UNI-CHAR-TO-UTF`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CH RAW-CFFI-TCL9::BUF)`
- SETF? `NIL`

/* 324 */ EXTERN Tcl_Size Tcl_UniCharToUtf(int ch, char *buf);

<a name="api-function-tcl-unlink-var_D1DDAACC676EE4B18D31DC5B8B0D8253"></a>
### FUNCTION: `TCL-UNLINK-VAR`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::VAR-NAME)`
- SETF? `NIL`

/* 251 */ EXTERN void Tcl_UnlinkVar(Tcl_Interp *interp, const char *varName);

<a name="api-function-tcl-unregister-channel_461CBA68FFDDDE52EDAE5282904B9A2D"></a>
### FUNCTION: `TCL-UNREGISTER-CHANNEL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::CHAN)`
- SETF? `NIL`

/* 252 */ EXTERN int
Tcl_UnregisterChannel(Tcl_Interp *interp, Tcl_Channel chan);

<a name="api-function-tcl-unset-var2_524E735DB71076403BC4FD092BF8AECF"></a>
### FUNCTION: `TCL-UNSET-VAR2`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::PART-1 RAW-CFFI-TCL9::PART-2
 RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 254 */ EXTERN int
Tcl_UnsetVar2(
  Tcl_Interp *interp, const char *part1, const char *part2, int flags);

<a name="api-function-tcl-unset-var_1FDAF2E64AC0A560A2A90A77119884FF"></a>
### FUNCTION: `TCL-UNSET-VAR`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::VAR-NAME RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`


<a name="api-function-tcl-unstack-channel_185C0EF81C2DD891E412BA308FC63018"></a>
### FUNCTION: `TCL-UNSTACK-CHANNEL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::CHAN)`
- SETF? `NIL`

/* 282 */ EXTERN int
Tcl_UnstackChannel(Tcl_Interp *interp, Tcl_Channel chan);

<a name="api-function-tcl-untrace-command_CCBC93656A9A25BC77D05E397013B228"></a>
### FUNCTION: `TCL-UNTRACE-COMMAND`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::VAR-NAME RAW-CFFI-TCL9::FLAGS
 RAW-CFFI-TCL9::CMD-TRACE-PROC RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 427 */ EXTERN void
Tcl_UntraceCommand(
  Tcl_Interp *interp, const char *varName, int flags,
  Tcl_CommandTraceProc *proc, void *clientData);

<a name="api-function-tcl-untrace-var2_CF7444786757A09E0896EEE079512E60"></a>
### FUNCTION: `TCL-UNTRACE-VAR2`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::PART-1 RAW-CFFI-TCL9::PART-2
 RAW-CFFI-TCL9::FLAGS RAW-CFFI-TCL9::VAR-TRACE-PROC RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`

/* 256 */ EXTERN void
Tcl_UntraceVar2(
  Tcl_Interp *interp, const char *part1, const char *part2,
  int flags, Tcl_VarTraceProc *proc,
  void *clientData);

<a name="api-function-tcl-untrace-var_5BCAA3F3E9C9CB5CBE6F68BBFA0D0E3B"></a>
### FUNCTION: `TCL-UNTRACE-VAR`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::VAR-NAME RAW-CFFI-TCL9::FLAGS
 RAW-CFFI-TCL9::PROC RAW-CFFI-TCL9::CLIENT-DATA)`
- SETF? `NIL`


<a name="api-function-tcl-up-var2_ADA13FD9B24CB00F27D48D2B27EFA2DF"></a>
### FUNCTION: `TCL-UP-VAR2`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::FRAME-NAME RAW-CFFI-TCL9::PART-1
 RAW-CFFI-TCL9::PART-2 RAW-CFFI-TCL9::LOCAL-NAME RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`

/* 259 */ EXTERN int
Tcl_UpVar2(
  Tcl_Interp *interp, const char *frameName,
  const char *part1, const char *part2,
  const char *localName, int flags);

<a name="api-function-tcl-up-var_F4C58D9BDCECBE128E205C432807898E"></a>
### FUNCTION: `TCL-UP-VAR`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::FRAME-NAME RAW-CFFI-TCL9::VAR-NAME
 RAW-CFFI-TCL9::LOCAL-NAME RAW-CFFI-TCL9::FLAGS)`
- SETF? `NIL`


<a name="api-function-tcl-update-linked-var_1CA30DBB019E90B55B725C481D294FFE"></a>
### FUNCTION: `TCL-UPDATE-LINKED-VAR`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::VAR-NAME)`
- SETF? `NIL`

/* 257 */ EXTERN void
Tcl_UpdateLinkedVar(Tcl_Interp *interp, const char *varName);

<a name="api-function-tcl-utf-at-index_D3A6B4C2B0AD85A8D62BE91A2706CA5D"></a>
### FUNCTION: `TCL-UTF-AT-INDEX`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC RAW-CFFI-TCL9::INDEX)`
- SETF? `NIL`

/* 671 */ EXTERN const char * Tcl_UtfAtIndex(const char *src, Tcl_Size index);

<a name="api-function-tcl-utf-backslash_DCE23598DD6A2FD07EABD4D8C2AC8B92"></a>
### FUNCTION: `TCL-UTF-BACKSLASH*`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC RAW-CFFI-TCL9::READ-PTR RAW-CFFI-TCL9::DST)`
- SETF? `NIL`


<a name="api-function-tcl-utf-backslash_EFB001E6EABD303BB1ACDF446DBCE532"></a>
### FUNCTION: `TCL-UTF-BACKSLASH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC RAW-CFFI-TCL9::READ-PTR RAW-CFFI-TCL9::DST)`
- SETF? `NIL`

/* 327 */ EXTERN Tcl_Size Tcl_UtfBackslash(const char *src, int *readPtr, char *dst);

<a name="api-function-tcl-utf-char-complete_41BFB4677D787DBA4071434EBC09F9BA"></a>
### FUNCTION: `TCL-UTF-CHAR-COMPLETE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC RAW-CFFI-TCL9::LEN)`
- SETF? `NIL`

/* 654 */ EXTERN int Tcl_UtfCharComplete(const char *src, Tcl_Size length);

<a name="api-function-tcl-utf-find-first_256FECEE0097A00EDA176B9AEB37297A"></a>
### FUNCTION: `TCL-UTF-FIND-FIRST`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC RAW-CFFI-TCL9::CH)`
- SETF? `NIL`

/* 328 */ EXTERN const char * Tcl_UtfFindFirst(const char *src, int ch);

<a name="api-function-tcl-utf-find-last_A5F80B7DEC7F44E7A5FE0E652DA82D47"></a>
### FUNCTION: `TCL-UTF-FIND-LAST`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC RAW-CFFI-TCL9::CH)`
- SETF? `NIL`

/* 329 */ EXTERN const char * Tcl_UtfFindLast(const char *src, int ch);

<a name="api-function-tcl-utf-ncasecmp_20B3D42829014B3C060BCA36901287FB"></a>
### FUNCTION: `TCL-UTF-NCASECMP`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::S1 RAW-CFFI-TCL9::S2 RAW-CFFI-TCL9::N)`
- SETF? `NIL`

/* 687 */ EXTERN int
Tcl_UtfNcasecmp(const char *s1, const char *s2, size_t n);

<a name="api-function-tcl-utf-ncmp_A73D8BC88B03C3BEB71ED02A28FD69CA"></a>
### FUNCTION: `TCL-UTF-NCMP`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::S1 RAW-CFFI-TCL9::S2 RAW-CFFI-TCL9::N)`
- SETF? `NIL`

/* 686 */ EXTERN int
Tcl_UtfNcmp(const char *s1, const char *s2, size_t n);

<a name="api-function-tcl-utf-next_D481A578E0DBCA387792502FB431584A"></a>
### FUNCTION: `TCL-UTF-NEXT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC)`
- SETF? `NIL`

/* 655 */ EXTERN const char * Tcl_UtfNext(const char *src);

<a name="api-function-tcl-utf-prev_4BB26666A0D702FDAE41F1CEFC382563"></a>
### FUNCTION: `TCL-UTF-PREV`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC RAW-CFFI-TCL9::START)`
- SETF? `NIL`

/* 656 */ EXTERN const char * Tcl_UtfPrev(const char *src, const char *start);

<a name="api-function-tcl-utf-to-char16-d-string_B714109C4CE7F072DADC971645DB4A30"></a>
### FUNCTION: `TCL-UTF-TO-CHAR16-D-STRING`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC LENGTH RAW-CFFI-TCL9::DS-PTR)`
- SETF? `NIL`

/* 355 */ EXTERN unsigned short *
Tcl_UtfToChar16DString(const char *src, Tcl_Size length, Tcl_DString *dsPtr);

<a name="api-function-tcl-utf-to-char16_EA474C4D57FA4E23CAD8312284F4B1F3"></a>
### FUNCTION: `TCL-UTF-TO-CHAR16`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC RAW-CFFI-TCL9::CH-PTR)`
- SETF? `NIL`

/* 336 */ EXTERN Tcl_Size Tcl_UtfToChar16(const char *src, unsigned short *chPtr);

<a name="api-function-tcl-utf-to-external-d-string-ex_6F305657764C13F9864DE6CA356E59C3"></a>
### FUNCTION: `TCL-UTF-TO-EXTERNAL-D-STRING-EX`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::ENCODING RAW-CFFI-TCL9::SRC
 RAW-CFFI-TCL9::SRC-LEN RAW-CFFI-TCL9::FLAGS RAW-CFFI-TCL9::DS-PTR
 RAW-CFFI-TCL9::ERR-LOC-PTR)`
- SETF? `NIL`

/* 659 */ EXTERN int
Tcl_UtfToExternalDStringEx(
  Tcl_Interp *interp,
  Tcl_Encoding encoding, const char *src,
  Tcl_Size srcLen, int flags,
  Tcl_DString *dsPtr,
  Tcl_Size *errorLocationPtr);

<a name="api-function-tcl-utf-to-external-d-string_1DFF90D4E55EF412F8A4B591F9C80915"></a>
### FUNCTION: `TCL-UTF-TO-EXTERNAL-D-STRING`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ENCODING RAW-CFFI-TCL9::SRC RAW-CFFI-TCL9::SRC-LEN
 RAW-CFFI-TCL9::DS-PTR)`
- SETF? `NIL`

/* 333 */ EXTERN char *
Tcl_UtfToExternalDString(
  Tcl_Encoding encoding, const char *src, Tcl_Size srcLen, Tcl_DString *dsPtr);

<a name="api-function-tcl-utf-to-external_499EED6B10C6B5507F0B4542777CD4DC"></a>
### FUNCTION: `TCL-UTF-TO-EXTERNAL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::ENCODING RAW-CFFI-TCL9::SRC
 RAW-CFFI-TCL9::SRC-LEN RAW-CFFI-TCL9::FLAGS RAW-CFFI-TCL9::STATE-PTR
 RAW-CFFI-TCL9::DST RAW-CFFI-TCL9::DST-LEN RAW-CFFI-TCL9::SRC-READ-PTR
 RAW-CFFI-TCL9::DST-WROTE-PTR RAW-CFFI-TCL9::DST-CHARS-PTR)`
- SETF? `NIL`

/* 332 */ EXTERN int
Tcl_UtfToExternal(
  Tcl_Interp *interp, Tcl_Encoding encoding,
  const char *src, Tcl_Size srcLen,
  int flags, Tcl_EncodingState *statePtr,
  char *dst, Tcl_Size dstLen,
  int *srcReadPtr,
  int *dstWrotePtr, int *dstCharsPtr);


<a name="api-function-tcl-utf-to-lower_39D2A26F2B21EEE3155BF36EF56B82B7"></a>
### FUNCTION: `TCL-UTF-TO-LOWER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC)`
- SETF? `NIL`

/* 334 */ EXTERN Tcl_Size Tcl_UtfToLower(char *src);

<a name="api-function-tcl-utf-to-title_DB70F4DDFF5F6DB6BEEEC3221662E2A2"></a>
### FUNCTION: `TCL-UTF-TO-TITLE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC)`
- SETF? `NIL`

/* 335 */ EXTERN Tcl_Size Tcl_UtfToTitle(char *src);

<a name="api-function-tcl-utf-to-uni-char-d-string_6DEACE727434A93052AD848F67528D68"></a>
### FUNCTION: `TCL-UTF-TO-UNI-CHAR-D-STRING`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC RAW-CFFI-TCL9::LEN RAW-CFFI-TCL9::DS-PTR)`
- SETF? `NIL`

/* 648 */ EXTERN int *
Tcl_UtfToUniCharDString(const char *src, Tcl_Size length, Tcl_DString *dsPtr);

<a name="api-function-tcl-utf-to-uni-char_3B7B4F6A31ADDB70DE17C570C59CD238"></a>
### FUNCTION: `TCL-UTF-TO-UNI-CHAR`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC RAW-CFFI-TCL9::CH-PTR)`
- SETF? `NIL`

/* 646 */ EXTERN Tcl_Size Tcl_UtfToUniChar(const char *src, int *chPtr);

<a name="api-function-tcl-utf-to-upper_D99E718EBFEB5757D8844AF22D967F8A"></a>
### FUNCTION: `TCL-UTF-TO-UPPER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC)`
- SETF? `NIL`

/* 337 */ EXTERN Tcl_Size Tcl_UtfToUpper(char *src);

<a name="api-function-tcl-validate-all-memory_59FE1EFBBCA97FD4A06C6F43066D4B0F"></a>
### FUNCTION: `TCL-VALIDATE-ALL-MEMORY`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::FILE-NAME RAW-CFFI-TCL9::LINE)`
- SETF? `NIL`

/* 266 */ EXTERN void Tcl_ValidateAllMemory(const char *file, int line);

<a name="api-function-tcl-var-trace-info2_ABFFFD78452DED9C301A4739A8AEC312"></a>
### FUNCTION: `TCL-VAR-TRACE-INFO2`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::PART-1 RAW-CFFI-TCL9::PART-2
 RAW-CFFI-TCL9::FLAGS RAW-CFFI-TCL9::VAR-TRACE-PROC
 RAW-CFFI-TCL9::PREV-CLIENT-DATA)`
- SETF? `NIL`

/* 262 */ EXTERN void *
Tcl_VarTraceInfo2(
  Tcl_Interp *interp, const char *part1, const char *part2,
  int flags, Tcl_VarTraceProc *procPtr, void *prevClientData);

<a name="api-function-tcl-var-trace-info_D602F810D839B934A1813F8EBA27EEE5"></a>
### FUNCTION: `TCL-VAR-TRACE-INFO`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::VAR-NAME RAW-CFFI-TCL9::FLAGS
 RAW-CFFI-TCL9::PROC RAW-CFFI-TCL9::PREV-CLIENT-DATA)`
- SETF? `NIL`


<a name="api-function-tcl-wait-for-event_2662AD83940955EE77B56FF48E8E918E"></a>
### FUNCTION: `TCL-WAIT-FOR-EVENT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::TIME-PTR)`
- SETF? `NIL`

/* 13 */ EXTERN int
Tcl_WaitForEvent(const Tcl_Time *timePtr);

<a name="api-function-tcl-wait-pid_9CC00639CD09B1CBF07F53A062FE3CEA"></a>
### FUNCTION: `TCL-WAIT-PID`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PID RAW-CFFI-TCL9::STAT-PTR RAW-CFFI-TCL9::OPTIONS)`
- SETF? `NIL`

/* 277 */ EXTERN Tcl_Pid Tcl_WaitPid(Tcl_Pid pid, int *statPtr, int options);

<a name="api-function-tcl-write-chars_24D5ED2DA10005675EFCF24750761A5C"></a>
### FUNCTION: `TCL-WRITE-CHARS`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9::SRC RAW-CFFI-TCL9::SRC-LEN)`
- SETF? `NIL`

/* 338 */ EXTERN Tcl_Size
Tcl_WriteChars(Tcl_Channel chan, const char *src, Tcl_Size srcLen);

<a name="api-function-tcl-write-obj_87E06849D3A17BD9CA066378C120A782"></a>
### FUNCTION: `TCL-WRITE-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`

/* 339 */ EXTERN Tcl_Size Tcl_WriteObj(Tcl_Channel chan, Tcl_Obj *objPtr);

<a name="api-function-tcl-write-raw_59711ED5FA87A0B2262DA1BF8E4B3732"></a>
### FUNCTION: `TCL-WRITE-RAW`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9::SRC RAW-CFFI-TCL9::SRC-LEN)`
- SETF? `NIL`

/* 395 */ EXTERN Tcl_Size
Tcl_WriteRaw(Tcl_Channel chan, const char *src, Tcl_Size srcLen);

<a name="api-function-tcl-write_51E75B51F2D892F358FA440C17A7377E"></a>
### FUNCTION: `TCL-WRITE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CHAN RAW-CFFI-TCL9::S RAW-CFFI-TCL9::SLEN)`
- SETF? `NIL`

/* 263 */ EXTERN Tcl_Size
Tcl_Write(Tcl_Channel chan, const char *s, Tcl_Size slen);

<a name="api-function-tcl-wrong-num-args_C7A1880B7191393AAC1049A4075F31F5"></a>
### FUNCTION: `TCL-WRONG-NUM-ARGS`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::OBJC RAW-CFFI-TCL9::OBJV
 RAW-CFFI-TCL9::MESSAGE)`
- SETF? `NIL`

/* 264 */ EXTERN void
Tcl_WrongNumArgs(
  Tcl_Interp *interp, Tcl_Size objc,
  Tcl_Obj *const objv[], const char *message);

<a name="api-function-tcl-zipfs-mount-buffer_68D1509793C6784D14F87C46156C077E"></a>
### FUNCTION: `TCL-ZIPFS-MOUNT-BUFFER`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::DATA RAW-CFFI-TCL9::DATALEN
 RAW-CFFI-TCL9::MOUNT-POINT RAW-CFFI-TCL9::COPY)`
- SETF? `NIL`

/* 635 */ EXTERN int
TclZipfs_MountBuffer(
  Tcl_Interp *interp, const void *data, size_t datalen,
  const char *mountPoint, int copy);

<a name="api-function-tcl-zipfs-mount_24016134C63581B2D4602A4332C84CE0"></a>
### FUNCTION: `TCL-ZIPFS-MOUNT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::ZIPNAME RAW-CFFI-TCL9::MOUNT-POINT
 RAW-CFFI-TCL9::PASSWD)`
- SETF? `NIL`

/* 632 */ EXTERN int
TclZipfs_Mount(
  Tcl_Interp *interp, const char *zipname, const char *mountPoint,
  const char *passwd);

<a name="api-function-tcl-zipfs-unmount_F089284AA2E48CB0262BAE0E3B5210EF"></a>
### FUNCTION: `TCL-ZIPFS-UNMOUNT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::MOUNT-POINT)`
- SETF? `NIL`

/* 633 */ EXTERN int
TclZipfs_Unmount(
  Tcl_Interp *interp, const char *mountPoint);

<a name="api-function-tcl-zlib-adler32_ED1B19932D2F60E29CA3A22A0D643576"></a>
### FUNCTION: `TCL-ZLIB-ADLER32`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ADLER RAW-CFFI-TCL9::BUF RAW-CFFI-TCL9::LEN)`
- SETF? `NIL`

/* 613 */ EXTERN unsigned int
Tcl_ZlibAdler32(unsigned int adler, const unsigned char *buf, Tcl_Size len);

<a name="api-function-tcl-zlib-crc32_0C7BC5D2266D2EC13C077D925755B44B"></a>
### FUNCTION: `TCL-ZLIB-CRC32`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::CRC RAW-CFFI-TCL9::BUF RAW-CFFI-TCL9::LEN)`
- SETF? `NIL`

/* 612 */ EXTERN unsigned int
Tcl_ZlibCRC32(unsigned int crc, const unsigned char *buf, Tcl_Size len);

<a name="api-function-tcl-zlib-deflate_58B752334E9E1BA848B277928248ACA3"></a>
### FUNCTION: `TCL-ZLIB-DEFLATE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR FORMAT RAW-CFFI-TCL9::DATA RAW-CFFI-TCL9::LEVEL
 RAW-CFFI-TCL9::GZIP-HEADER-DICT-OBJ)`
- SETF? `NIL`

/* 610 */ EXTERN int
Tcl_ZlibDeflate(
  Tcl_Interp *interp, int format,
  Tcl_Obj *data, int level, Tcl_Obj *gzipHeaderDictObj);

<a name="api-function-tcl-zlib-inflate_4BE92A778143B264440B8104865C8E0D"></a>
### FUNCTION: `TCL-ZLIB-INFLATE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR FORMAT RAW-CFFI-TCL9::DATA
 RAW-CFFI-TCL9::BUFFER-SIZE RAW-CFFI-TCL9::GZIP-HEADER-DICT-OBJ)`
- SETF? `NIL`

/* 611 */ EXTERN int
Tcl_ZlibInflate(
  Tcl_Interp *interp, int format,
  Tcl_Obj *data, Tcl_Size buffersize,
  Tcl_Obj *gzipHeaderDictObj);

<a name="api-function-tcl-zlib-stream-checksum_FF93E32640972B7124D830DFAD2D86E2"></a>
### FUNCTION: `TCL-ZLIB-STREAM-CHECKSUM`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ZSHANDLE)`
- SETF? `NIL`

/* 617 */ EXTERN int Tcl_ZlibStreamChecksum(Tcl_ZlibStream zshandle);

<a name="api-function-tcl-zlib-stream-close_199526A1357578A494F7CA93077D4A97"></a>
### FUNCTION: `TCL-ZLIB-STREAM-CLOSE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ZSHANDLE)`
- SETF? `NIL`

/* 620 */ EXTERN int Tcl_ZlibStreamClose(Tcl_ZlibStream zshandle);

<a name="api-function-tcl-zlib-stream-eof_FE5A5DC6392307622B98742BAB0783E6"></a>
### FUNCTION: `TCL-ZLIB-STREAM-EOF`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ZSHANDLE)`
- SETF? `NIL`

/* 616 */ EXTERN int Tcl_ZlibStreamEof(Tcl_ZlibStream zshandle);

<a name="api-function-tcl-zlib-stream-get-command-name_9F305F215AFF2C85F05B252103BF8712"></a>
### FUNCTION: `TCL-ZLIB-STREAM-GET-COMMAND-NAME`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ZSHANDLE)`
- SETF? `NIL`

/* 615 */ EXTERN Tcl_Obj * Tcl_ZlibStreamGetCommandName(Tcl_ZlibStream zshandle);

<a name="api-function-tcl-zlib-stream-get_4B30E8CF1F3835238E9DB6A4D6E5E6F2"></a>
### FUNCTION: `TCL-ZLIB-STREAM-GET`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ZSHANDLE RAW-CFFI-TCL9::DATA COUNT)`
- SETF? `NIL`

/* 619 */ EXTERN int
Tcl_ZlibStreamGet(Tcl_ZlibStream zshandle, Tcl_Obj *data, Tcl_Size count);

<a name="api-function-tcl-zlib-stream-init_FA3CFDFF278F228E8CA07496230A4064"></a>
### FUNCTION: `TCL-ZLIB-STREAM-INIT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::MODE FORMAT RAW-CFFI-TCL9::LEVEL
 RAW-CFFI-TCL9::DICT-OBJ RAW-CFFI-TCL9::ZSHANDLE)`
- SETF? `NIL`

/* 614 */ EXTERN int
Tcl_ZlibStreamInit(
  Tcl_Interp *interp, int mode,
  int format, int level, Tcl_Obj *dictObj,
  Tcl_ZlibStream *zshandle);

<a name="api-function-tcl-zlib-stream-put_1A69CD2B74A63070947C6D0B593F28E9"></a>
### FUNCTION: `TCL-ZLIB-STREAM-PUT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ZSHANDLE RAW-CFFI-TCL9::DATA RAW-CFFI-TCL9::FLUSH)`
- SETF? `NIL`

/* 618 */ EXTERN int
Tcl_ZlibStreamPut(Tcl_ZlibStream zshandle, Tcl_Obj *data, int flush);

<a name="api-function-tcl-zlib-stream-reset_31DA168626142C1B4BC5A5217DF653E8"></a>
### FUNCTION: `TCL-ZLIB-STREAM-RESET`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ZSHANDLE)`
- SETF? `NIL`

/* 621 */ EXTERN int Tcl_ZlibStreamReset(Tcl_ZlibStream zshandle);

<a name="api-function-tcl-zlib-stream-set-compression-dictionary_19EC77E1FCC92C87C9537211304C24E5"></a>
### FUNCTION: `TCL-ZLIB-STREAM-SET-COMPRESSION-DICTIONARY`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::ZSHANDLE RAW-CFFI-TCL9::COMPRESSION-DICTIONARY-OBJ)`
- SETF? `NIL`

/* 630 */ EXTERN void
Tcl_ZlibStreamSetCompressionDictionary(
  Tcl_ZlibStream zhandle,
  Tcl_Obj *compressionDictionaryObj);

<a name="api-function-tcldict-obj-size_407087EE4941E63AF0A1C1726A556CBD"></a>
### FUNCTION: `TCL_DICT-OBJ-SIZE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::DICT-PTR RAW-CFFI-TCL9::SIZE-PTR)`
- SETF? `NIL`

/* 497 */ EXTERN int
TclDictObjSize(Tcl_Interp *interp, Tcl_Obj *dictPtr, void *sizePtr);

<a name="api-function-tclfs-split-path_84BB63B920B8E228B9872E2535242CBB"></a>
### FUNCTION: `TCL_FS-SPLIT-PATH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PATH-PTR RAW-CFFI-TCL9::LEN-PTR)`
- SETF? `NIL`

/* 461 */ EXTERN Tcl_Obj * TclFSSplitPath(Tcl_Obj *pathPtr, void *lenPtr);

<a name="api-function-tclfscreatedirectory_096D7B7F9240A391FEE4EB23EA34BB90"></a>
### FUNCTION: `TCL_FSCREATEDIRECTORY`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PATH-PTR)`
- SETF? `NIL`

/* 442 */ EXTERN int Tcl_FSCreateDirectory(Tcl_Obj *pathPtr);

<a name="api-function-tclget-alias-obj_6E8551B38FB90265E75931FCD3D959A9"></a>
### FUNCTION: `TCL_GET-ALIAS-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::CHILD-CMD
 RAW-CFFI-TCL9::TARGET-INTERP-PTR-PTR RAW-CFFI-TCL9::TARGET-CMD-PTR
 RAW-CFFI-TCL9::OBJC-PTR RAW-CFFI-TCL9::OBJV-PTR)`
- SETF? `NIL`

/* 149 */ EXTERN int
TclGetAliasObj(
  Tcl_Interp *interp, const char *childCmd,
  Tcl_Interp **targetInterpPtr, const char **targetCmdPtr,
   int *objcPtr, Tcl_Obj ***objvPtr);

<a name="api-function-tclget-bytes-from-obj_B0BBF8C56B66F6845DE74D9583098E06"></a>
### FUNCTION: `TCL_GET-BYTES-FROM-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::NUM-BYTES-PTR)`
- SETF? `NIL`

/* 649 */ EXTERN unsigned char *
TclGetBytesFromObj(Tcl_Interp *interp, Tcl_Obj *objPtr, void *numBytesPtr);

<a name="api-function-tclget-char-length_627D76024CA7A29B59EBAF90060B64D9"></a>
### FUNCTION: `TCL_GET-CHAR-LENGTH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR)`
- SETF? `NIL`

/* 380 */ EXTERN Tcl_Size TclGetCharLength(Tcl_Obj *objPtr);

<a name="api-function-tclget-range_1B1785CFE613873D55B6C25C9BEAC4DC"></a>
### FUNCTION: `TCL_GET-RANGE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR FIRST LAST)`
- SETF? `NIL`

/* 383 */ EXTERN Tcl_Obj *
TclGetRange(Tcl_Obj *objPtr, Tcl_Size first, Tcl_Size last);

<a name="api-function-tclget-string-from-obj_D45EC34B4B2A8D408CFE9A8FC8FD2458"></a>
### FUNCTION: `TCL_GET-STRING-FROM-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::LENGTH-PTR)`
- SETF? `NIL`

/* 41 */ EXTERN char *
TclGetStringFromObj(Tcl_Obj *objPtr, void *lengthPtr);

<a name="api-function-tclget-uni-char_8002CB3DCB8F13904C1F074586CAA081"></a>
### FUNCTION: `TCL_GET-UNI-CHAR`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::INDEX)`
- SETF? `NIL`

/* 381 */ EXTERN int TclGetUniChar(Tcl_Obj *objPtr, Tcl_Size index);

<a name="api-function-tclget-unicode-from-obj_7671CF0D96309943AB8980A2D90DC8CA"></a>
### FUNCTION: `TCL_GET-UNICODE-FROM-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR RAW-CFFI-TCL9::LENGTH-PTR)`
- SETF? `NIL`

/* 434 */ EXTERN Tcl_UniChar *
TclGetUnicodeFromObj(Tcl_Obj *objPtr, void *lengthPtr);

<a name="api-function-tcllist-obj-get-elements_ACDAB2D23871D262A9135F4B6F50A90E"></a>
### FUNCTION: `TCL_LIST-OBJ-GET-ELEMENTS`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::LIST-PTR RAW-CFFI-TCL9::OBJC-PTR
 RAW-CFFI-TCL9::OBJV-PTR)`
- SETF? `NIL`

/* 45 */ EXTERN int
TclListObjGetElements(
  Tcl_Interp *interp, Tcl_Obj *listPtr, void *objcPtr, Tcl_Obj ***objvPtr);

<a name="api-function-tcllist-obj-length_4DCAF440026DB1C398CDAF596BC86E45"></a>
### FUNCTION: `TCL_LIST-OBJ-LENGTH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::LIST-PTR RAW-CFFI-TCL9::LENGTH-PTR)`
- SETF? `NIL`

/* 47 */ EXTERN int
TclListObjLength(
  Tcl_Interp *interp, Tcl_Obj *listPtr, void *lengthPtr);

<a name="api-function-tclnum-utf-chars_BEA04CB570C4521A5E10841CB8AB2C8A"></a>
### FUNCTION: `TCL_NUM-UTF-CHARS`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC LENGTH)`
- SETF? `NIL`

/* 312 */ EXTERN Tcl_Size TclNumUtfChars(const char *src, Tcl_Size length);

<a name="api-function-tclparse-args-objv_2D6A8CEE8668DFA63633A752DC281919"></a>
### FUNCTION: `TCL_PARSE-ARGS-OBJV`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::ARG-TABLE RAW-CFFI-TCL9::OBJC-PTR
 RAW-CFFI-TCL9::OBJV RAW-CFFI-TCL9::REM-OBJV)`
- SETF? `NIL`

/* 604 */ EXTERN int
TclParseArgsObjv(
  Tcl_Interp *interp,
  const Tcl_ArgvInfo *argTable, void *objcPtr,
  Tcl_Obj *const *objv, Tcl_Obj ***remObjv);

<a name="api-function-tclsplit-list_24C8245BDE9E4433121D5D91F1E78D79"></a>
### FUNCTION: `TCL_SPLIT-LIST`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR RAW-CFFI-TCL9::LIST-STR RAW-CFFI-TCL9::ARGC-PTR
 RAW-CFFI-TCL9::ARGV-PTR)`
- SETF? `NIL`

/* 242 */ EXTERN int
TclSplitList(
  Tcl_Interp *interp, const char *listStr,
  void *argcPtr, const char ***argvPtr);

<a name="api-function-tclsplit-path_41B92AB773A78D4892EAE16E358738E2"></a>
### FUNCTION: `TCL_SPLIT-PATH`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::PATH RAW-CFFI-TCL9::ARGC-PTR RAW-CFFI-TCL9::ARGV-PTR)`
- SETF? `NIL`

/* 243 */ EXTERN void
TclSplitPath(const char *path, void *argcPtr, const char ***argvPtr);

<a name="api-function-tclutf-at-index_61D4503F57D8CBEF91576FB152A93580"></a>
### FUNCTION: `TCL_UTF-AT-INDEX`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC RAW-CFFI-TCL9::INDEX)`
- SETF? `NIL`

/* 325 */ EXTERN const char * TclUtfAtIndex(const char *src, Tcl_Size index);

<a name="api-function-tclutf-char-complete_587614D82A0EC7A7C3F0F5BA19CBB423"></a>
### FUNCTION: `TCL_UTF-CHAR-COMPLETE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC LENGTH)`
- SETF? `NIL`

/* 326 */ EXTERN int TclUtfCharComplete(const char *src, Tcl_Size length);

<a name="api-function-tclutf-ncasecmp_7DB98799A636FA019858EAD56ED36D77"></a>
### FUNCTION: `TCL_UTF-NCASECMP`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::S1 RAW-CFFI-TCL9::S2 RAW-CFFI-TCL9::N)`
- SETF? `NIL`

/* 370 */ EXTERN int TclUtfNcasecmp(const char *s1, const char *s2, size_t n);

<a name="api-function-tclutf-ncmp_A8A3222C9C9AB5B93ADDAB7643CD767B"></a>
### FUNCTION: `TCL_UTF-NCMP`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::S1 RAW-CFFI-TCL9::S2 RAW-CFFI-TCL9::N)`
- SETF? `NIL`

/* 369 */ EXTERN int TclUtfNcmp(const char *s1, const char *s2, size_t n);

<a name="api-function-tclutf-next_B8C41AE36995A3A58B850D756C24F598"></a>
### FUNCTION: `TCL_UTF-NEXT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC)`
- SETF? `NIL`

/* 330 */ EXTERN const char * TclUtfNext(const char *src);

<a name="api-function-tclutf-prev_7241B8109C69C06246784D5548D0E3EA"></a>
### FUNCTION: `TCL_UTF-PREV`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::SRC RAW-CFFI-TCL9::START)`
- SETF? `NIL`

/* 331 */ EXTERN const char * TclUtfPrev(const char *src, const char *start);

<a name="api-function-tk-create-console-window_85EEF8A7A34BE21B35B07A93FCF8F13A"></a>
### FUNCTION: `TK-CREATE-CONSOLE-WINDOW`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`


<a name="api-function-tk-init_33E63E67AF3045A519EE86147D0AC920"></a>
### FUNCTION: `TK-INIT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`


<a name="api-function-tk-safe-init_F640388FFE5FDE3334FE15FA3676E607"></a>
### FUNCTION: `TK-SAFE-INIT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR)`
- SETF? `NIL`


<a name="api-macro-overwrite-func_484E73874D3E255FE03F01BF26A06A53"></a>
### MACRO: `OVERWRITE-FUNC`

- SCOPE: INTERNAL
- LAMBDA LIST: `(&REST RAW-CFFI-TCL9::DST.SRC-LIST)`
- SETF? `NIL`


<a name="api-macro-tcl-append-printf-to-obj_680E0354D6AEC37ADF79443F490CD584"></a>
### MACRO: `TCL-APPEND-PRINTF-TO-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR FORMAT &REST \#:VARARGS0)`
- SETF? `NIL`

/* 579 */ EXTERN void
Tcl_AppendPrintfToObj(Tcl_Obj *objPtr, const char *format, ...) TCL_FORMAT_PRINTF(2, 3);

<a name="api-macro-tcl-append-result_1175997EEA639F1BBF2D9E346606F0D9"></a>
### MACRO: `TCL-APPEND-RESULT`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR &REST \#:VARARGS0)`
- SETF? `NIL`

/* 70 */ EXTERN void
Tcl_AppendResult(Tcl_Interp *interp, ...);

<a name="api-macro-tcl-append-strings-to-obj_BA27E5DCC1308BE9C80A5AB95408C312"></a>
### MACRO: `TCL-APPEND-STRINGS-TO-OBJ`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::OBJ-PTR &REST \#:VARARGS0)`
- SETF? `NIL`

/* 15 */ EXTERN void
Tcl_AppendStringsToObj(Tcl_Obj *objPtr, ...);

<a name="api-macro-tcl-console-panic_3573C3812F94E876672BE9D955370923"></a>
### MACRO: `TCL-CONSOLE-PANIC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::FMT &REST \#:VARARGS0)`
- SETF? `NIL`

(OR) #define Tcl_ConsolePanic ((Tcl_PanicProc *)NULL)

<a name="api-macro-tcl-obj-printf_52872E44BD420936BB6C1274EFE20B39"></a>
### MACRO: `TCL-OBJ-PRINTF`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(FORMAT &REST \#:VARARGS0)`
- SETF? `NIL`

/* 578 */ EXTERN Tcl_Obj *
Tcl_ObjPrintf(const char *format, ...) TCL_FORMAT_PRINTF(1, 2);

<a name="api-macro-tcl-panic_B1311C083BA12D464512A67233C72881"></a>
### MACRO: `TCL-PANIC`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(FORMAT &REST \#:VARARGS0)`
- SETF? `NIL`

/* 2 */ EXTERN TCL_NORETURN
void Tcl_Panic(const char *format, ...)
TCL_FORMAT_PRINTF(1, 2);

<a name="api-macro-tcl-set-error-code_58A53B7228910F187A90ED8D8FA95887"></a>
### MACRO: `TCL-SET-ERROR-CODE`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR &REST \#:VARARGS0)`
- SETF? `NIL`

/* 228 */ EXTERN void Tcl_SetErrorCode(Tcl_Interp *interp, ...);

<a name="api-macro-tcl-var-eval_34B00822AD74FF5AAF7D784F0BE60AFB"></a>
### MACRO: `TCL-VAR-EVAL`

- SCOPE: EXTERNAL
- LAMBDA LIST: `(RAW-CFFI-TCL9::INTERP-PTR &REST \#:VARARGS0)`
- SETF? `NIL`

/* 260 */ EXTERN int Tcl_VarEval(Tcl_Interp *interp, ...);

<a name="api-variable-cffitcl-wide-int-ptcl_9396246E5DAAD3CAAE1706B75196092D"></a>
### VARIABLE: `%CFFI+TCL--WIDE-INT-P_TCL`

- SCOPE: INTERNAL
- INITIAL-VALUE: `"set max32bit 2147483647;
set testval [expr $max32bit + 1];
\# 2147483648
if {[string is integer -strict $testval] && $testval > $max32bit} {
    \# 64-bits / 8-bytes == longlong.
    set ::wideint 64bits
} else {
    \# ...is 32-bits / 4-bytes == long.
    set ::wideint 32bits
}
\# puts $::wideint
"`


<a name="api-variable-inited_0E6A7B3FD1097156F0826C0FB1545E71"></a>
### VARIABLE: `*INITED*`

- SCOPE: INTERNAL
- INITIAL-VALUE: `NIL`


<a name="api-variable-num-static-tokens_22A85C142C376F7484C68F6526ACCFF0"></a>
### VARIABLE: `+NUM-STATIC-TOKENS+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `20`


<a name="api-variable-tcl-all-events_771C633C5F487D48338049304AA22723"></a>
### VARIABLE: `+TCL-ALL-EVENTS+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(LOGNOT RAW-CFFI-TCL9:+TCL-DONT-WAIT+)`


<a name="api-variable-tcl-allow-inline-compilation_AE8416DF9C096D5C87B402A474344CFF"></a>
### VARIABLE: `+TCL-ALLOW-INLINE-COMPILATION+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `131072`


<a name="api-variable-tcl-alpha-release_0747F0ED6BAB51E046ABFBC1849B1CFE"></a>
### VARIABLE: `+TCL-ALPHA-RELEASE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `0`


<a name="api-variable-tcl-append-value_5AD77509036A7042FDB0EE7FE69B79E9"></a>
### VARIABLE: `+TCL-APPEND-VALUE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `4`


<a name="api-variable-tcl-argv-constant_46AF2600FA52FC3D4416D587C1A2A086"></a>
### VARIABLE: `+TCL-ARGV-CONSTANT+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `15`


<a name="api-variable-tcl-argv-end_236167C8FB93A612C314F2A1BBDFED8B"></a>
### VARIABLE: `+TCL-ARGV-END+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `23`


<a name="api-variable-tcl-argv-float_3FB8BF2E21FDA8BC132F7DDCF6747E4A"></a>
### VARIABLE: `+TCL-ARGV-FLOAT+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `19`


<a name="api-variable-tcl-argv-func_FD85FE78CACA5BF12CF1F7BE45D160C0"></a>
### VARIABLE: `+TCL-ARGV-FUNC+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `20`


<a name="api-variable-tcl-argv-genfunc_8F519C50E7A8EA025DD1427BD7C44700"></a>
### VARIABLE: `+TCL-ARGV-GENFUNC+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `21`


<a name="api-variable-tcl-argv-help_4C792D2B48161BE332B21FDAE925136C"></a>
### VARIABLE: `+TCL-ARGV-HELP+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `22`


<a name="api-variable-tcl-argv-int_9E5E38BA3F46D6F6A135B5061AF8A707"></a>
### VARIABLE: `+TCL-ARGV-INT+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `16`


<a name="api-variable-tcl-argv-rest_642B91C4FA5C41235800473FEAE5DE70"></a>
### VARIABLE: `+TCL-ARGV-REST+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `18`


<a name="api-variable-tcl-argv-string_952AEC1107C2185FBE8D61B6DD2C31CE"></a>
### VARIABLE: `+TCL-ARGV-STRING+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `17`


<a name="api-variable-tcl-auto-length_28976F888BE855144569F86F3D948CA7"></a>
### VARIABLE: `+TCL-AUTO-LENGTH+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `-1`

((Tcl_Size)-1)

<a name="api-variable-tcl-beta-release_89AD34E6591851B633D18D5C1F2F38A2"></a>
### VARIABLE: `+TCL-BETA-RELEASE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`


<a name="api-variable-tcl-break_3DF93D972E33AB6B4DBF96A76C649DC5"></a>
### VARIABLE: `+TCL-BREAK+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `3`


<a name="api-variable-tcl-cancel-unwind_D68CBDE1A07A831223120ED826B297C1"></a>
### VARIABLE: `+TCL-CANCEL-UNWIND+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1048576`


<a name="api-variable-tcl-channel-thread-insert_47097B953EEAACBF6D4089A11310CCE6"></a>
### VARIABLE: `+TCL-CHANNEL-THREAD-INSERT+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `0`

TCL_CHANNEL_THREAD_INSERT

<a name="api-variable-tcl-channel-thread-remove_2D1ED69D2E1DAFFC3022EFBE8A61CE22"></a>
### VARIABLE: `+TCL-CHANNEL-THREAD-REMOVE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`

TCL_CHANNEL_THREAD_REMOVE

<a name="api-variable-tcl-channel-version-1_22930EA5FF6E4C25CBA334EB13CFAE48"></a>
### VARIABLE: `+TCL-CHANNEL-VERSION-1+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`

TCL_CHANNEL_VERSION_1

<a name="api-variable-tcl-channel-version-2_24C7E8A7D70252DE4B9E07DA75E98DA0"></a>
### VARIABLE: `+TCL-CHANNEL-VERSION-2+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `2`

TCL_CHANNEL_VERSION_2

<a name="api-variable-tcl-channel-version-3_360BDB276B7EDCAB60799B5C2776C4D4"></a>
### VARIABLE: `+TCL-CHANNEL-VERSION-3+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `3`

TCL_CHANNEL_VERSION_3

<a name="api-variable-tcl-channel-version-4_3C367F17AEAEF2134825CA97ED7EB553"></a>
### VARIABLE: `+TCL-CHANNEL-VERSION-4+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `4`

TCL_CHANNEL_VERSION_4

<a name="api-variable-tcl-channel-version-5_1B3B5CE1F4AF7CE6EAD00D1ADCFE42D2"></a>
### VARIABLE: `+TCL-CHANNEL-VERSION-5+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `5`

TCL_CHANNEL_VERSION_5

<a name="api-variable-tcl-close-read_C215A4A7FC07A96F9C1E25BED538C64B"></a>
### VARIABLE: `+TCL-CLOSE-READ+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 1)`


<a name="api-variable-tcl-close-write_78EFA356D06E36C8D8FD9D55A4DB7422"></a>
### VARIABLE: `+TCL-CLOSE-WRITE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 2)`


<a name="api-variable-tcl-close2proc_7033D8628DDF00DDFAFE525A2E291448"></a>
### VARIABLE: `+TCL-CLOSE2PROC+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(CFFI-SYS:NULL-POINTER)`

TCL_CLOSE2PROC

<a name="api-variable-tcl-code-user-max_E11400B6CE668C78AD10E0B424189315"></a>
### VARIABLE: `+TCL-CODE-USER-MAX+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1073741823`

/*  1073741823 */

<a name="api-variable-tcl-code-user-min_39916290D5526D42BA2BF7275698FC07"></a>
### VARIABLE: `+TCL-CODE-USER-MIN+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `5`


<a name="api-variable-tcl-combine_9FC32D98230A22CA84CB3885A9FFF776"></a>
### VARIABLE: `+TCL-COMBINE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `16777216`


<a name="api-variable-tcl-continue_558EF469F19B772A61B03907AF327FC3"></a>
### VARIABLE: `+TCL-CONTINUE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `4`


<a name="api-variable-tcl-convert-multibyte_AC091BA86E758E0FACEC78AD99E0FC35"></a>
### VARIABLE: `+TCL-CONVERT-MULTIBYTE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `-1`


<a name="api-variable-tcl-convert-nospace_376B31737AD856DAF78248A204573960"></a>
### VARIABLE: `+TCL-CONVERT-NOSPACE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `-4`


<a name="api-variable-tcl-convert-syntax_06FB4D768688C8679AD1002023430CE0"></a>
### VARIABLE: `+TCL-CONVERT-SYNTAX+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `-2`


<a name="api-variable-tcl-convert-unknown_3603BD59F2DCFEB08850245A5053BD47"></a>
### VARIABLE: `+TCL-CONVERT-UNKNOWN+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `-3`


<a name="api-variable-tcl-create-hard-link_8818F0B48E57667C082461B1FA7D4F88"></a>
### VARIABLE: `+TCL-CREATE-HARD-LINK+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `2`


<a name="api-variable-tcl-create-symbolic-link_4A4EF8C4853F992C4CC9E299AEAAE39F"></a>
### VARIABLE: `+TCL-CREATE-SYMBOLIC-LINK+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`


<a name="api-variable-tcl-custom-ptr-keys_6184C406B15C3CBC228C34E21F4066AF"></a>
### VARIABLE: `+TCL-CUSTOM-PTR-KEYS+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `-1`


<a name="api-variable-tcl-custom-type-keys_6199F6F962A2B6A9A88BB1E9293F548B"></a>
### VARIABLE: `+TCL-CUSTOM-TYPE-KEYS+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `-2`


<a name="api-variable-tcl-d-string-static-size_BA048EC0CA2FACEF425A6AA41B9F9211"></a>
### VARIABLE: `+TCL-D-STRING-STATIC-SIZE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `200`

TCL_DSTRING_STATIC_SIZE

<a name="api-variable-tcl-dont-quote-hash_726A2B8B275A47D0F47C10CCFE51A339"></a>
### VARIABLE: `+TCL-DONT-QUOTE-HASH+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `8`

Tcl_ConvertElement: disables the default quoting of the '#' character. It is safe to leave the hash unquoted when the element is not the first element of a list, and this flag can be used by the caller to indicate that condition.

<a name="api-variable-tcl-dont-use-braces_E05F3A11F4FE435C4C262393DEA7CFE2"></a>
### VARIABLE: `+TCL-DONT-USE-BRACES+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`

Tcl_ConvertElement: forces it not to enclose the element in braces, but to
use backslash quoting instead.

<a name="api-variable-tcl-dont-wait_57347BC73B92D72FC4729239E6758ACD"></a>
### VARIABLE: `+TCL-DONT-WAIT+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 1)`


<a name="api-variable-tcl-double-space_E66FA6AB09521D27EFED1BBE2B58EB98"></a>
### VARIABLE: `+TCL-DOUBLE-SPACE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(+ 10 RAW-CFFI-TCL9:+TCL-MAX-PREC+)`

TCL_DOUBLE_SPACE

<a name="api-variable-tcl-dynamic_40F71E7BD943D98517CB7BB01C195A9E"></a>
### VARIABLE: `+TCL-DYNAMIC+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `3`


<a name="api-variable-tcl-encoding-char-limit_BCD698C7CAE9C23C9E19577052DEBDC8"></a>
### VARIABLE: `+TCL-ENCODING-CHAR-LIMIT+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `16`


<a name="api-variable-tcl-encoding-end_8A747B93B310A62D54B63F06D82DF903"></a>
### VARIABLE: `+TCL-ENCODING-END+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `2`


<a name="api-variable-tcl-encoding-internal-use-mask_00D07C2742DEC1F5A9514B473DF05F74"></a>
### VARIABLE: `+TCL-ENCODING-INTERNAL-USE-MASK+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `65280`


<a name="api-variable-tcl-encoding-no-terminate_F8120ED72565CCEE457BE4CF40B20D63"></a>
### VARIABLE: `+TCL-ENCODING-NO-TERMINATE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `8`


<a name="api-variable-tcl-encoding-profile-replace_E2842F0376470D38F372BBA10928D9DF"></a>
### VARIABLE: `+TCL-ENCODING-PROFILE-REPLACE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `33554432`


<a name="api-variable-tcl-encoding-profile-strict_DE2E9EB7180A6E1C8B027B29B3A42D34"></a>
### VARIABLE: `+TCL-ENCODING-PROFILE-STRICT+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `0`

=TCL_ENCODING_STOPONERROR (0)

<a name="api-variable-tcl-encoding-profile-tcl8_A42EEFFDEDAD108DF1252E43DA1F00F9"></a>
### VARIABLE: `+TCL-ENCODING-PROFILE-TCL8+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `16777216`


<a name="api-variable-tcl-encoding-start_363AA1D538BD85D0661514644BF18A81"></a>
### VARIABLE: `+TCL-ENCODING-START+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`


<a name="api-variable-tcl-encoding-stoponerror_5A083128B1D2DC9CDEAFF1707C2DE167"></a>
### VARIABLE: `+TCL-ENCODING-STOPONERROR+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `0`

Not used any more

<a name="api-variable-tcl-enforce-mode_BDDE963A9186A65350BC90F5F4C507AF"></a>
### VARIABLE: `+TCL-ENFORCE-MODE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 4)`


<a name="api-variable-tcl-ensemble-prefix_28DAB753636F9E548C26A21F588529A8"></a>
### VARIABLE: `+TCL-ENSEMBLE-PREFIX+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `2`

Flag value to say whether to allow unambiguous prefixes of commands or
to require exact matches for command names.

<a name="api-variable-tcl-error_783EE0EEE7397EEDA126154F6B667264"></a>
### VARIABLE: `+TCL-ERROR+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`


<a name="api-variable-tcl-eval-direct_57E9AFDED466F35DB07A5C0D2B54504F"></a>
### VARIABLE: `+TCL-EVAL-DIRECT+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `262144`


<a name="api-variable-tcl-eval-global_586E7EE49F9B3648C3C2A4A719001476"></a>
### VARIABLE: `+TCL-EVAL-GLOBAL+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `131072`


<a name="api-variable-tcl-eval-invoke_B751FC88D00379654B5B208A8956B3BC"></a>
### VARIABLE: `+TCL-EVAL-INVOKE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `524288`


<a name="api-variable-tcl-eval-noerr_1F97DC675FE063A35C98A208C81B7CF2"></a>
### VARIABLE: `+TCL-EVAL-NOERR+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `2097152`


<a name="api-variable-tcl-exact_4F593FFE5831570C801A330DB79103FB"></a>
### VARIABLE: `+TCL-EXACT+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`

Flag that may be passed to Tcl_GetIndexFromObj to force it to disallow abbreviated strings.

<a name="api-variable-tcl-exception_C1D77A11986CFD35AC26B4EE22D62B44"></a>
### VARIABLE: `+TCL-EXCEPTION+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 3)`


<a name="api-variable-tcl-f-ok_22028A28C13E5F63114AB2B4278D6EC7"></a>
### VARIABLE: `+TCL-F-OK+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `0`


<a name="api-variable-tcl-file-events_F8B33A990B85F82362E11262C455B898"></a>
### VARIABLE: `+TCL-FILE-EVENTS+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 3)`


<a name="api-variable-tcl-filesystem-version-1_7806DA02260120063B8FC43A389AACFD"></a>
### VARIABLE: `+TCL-FILESYSTEM-VERSION-1+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`


<a name="api-variable-tcl-final-release_A113ABD51C5BE4D3BB38501499C9704B"></a>
### VARIABLE: `+TCL-FINAL-RELEASE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `2`


<a name="api-variable-tcl-glob-perm-hidden_0ABA53B62D3091725D3723F7DA478639"></a>
### VARIABLE: `+TCL-GLOB-PERM-HIDDEN+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 1)`


<a name="api-variable-tcl-glob-perm-r_0C130213021C0A280F93A0839706EA1D"></a>
### VARIABLE: `+TCL-GLOB-PERM-R+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 2)`


<a name="api-variable-tcl-glob-perm-ronly_4C4D965AC1FF3C48DE27C860E743118B"></a>
### VARIABLE: `+TCL-GLOB-PERM-RONLY+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 0)`


<a name="api-variable-tcl-glob-perm-w_EA9D79BF08F33D3E2B198F34B70CCC4B"></a>
### VARIABLE: `+TCL-GLOB-PERM-W+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 3)`


<a name="api-variable-tcl-glob-perm-x_DAE815C546826C807D68F965135DED84"></a>
### VARIABLE: `+TCL-GLOB-PERM-X+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 4)`


<a name="api-variable-tcl-glob-type-block_ABBA8390F108DB081F5CF0ED1154F4E7"></a>
### VARIABLE: `+TCL-GLOB-TYPE-BLOCK+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 0)`


<a name="api-variable-tcl-glob-type-char_E396D8902158BF75DF1F2852903F5E22"></a>
### VARIABLE: `+TCL-GLOB-TYPE-CHAR+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 1)`


<a name="api-variable-tcl-glob-type-dir_0CCF0F4AE3FBE7A56C8499BC3468CC95"></a>
### VARIABLE: `+TCL-GLOB-TYPE-DIR+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 2)`


<a name="api-variable-tcl-glob-type-file_80A1E03B22660D69D59189464DDC3032"></a>
### VARIABLE: `+TCL-GLOB-TYPE-FILE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 4)`


<a name="api-variable-tcl-glob-type-link_D673CA96334D3F2AECFB907801C04444"></a>
### VARIABLE: `+TCL-GLOB-TYPE-LINK+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 5)`


<a name="api-variable-tcl-glob-type-mount_9A2E72F6F0339251B0A01C96F5948DCA"></a>
### VARIABLE: `+TCL-GLOB-TYPE-MOUNT+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 7)`


<a name="api-variable-tcl-glob-type-pipe_4C4556886286FC36E8D80AAD2E9EA06C"></a>
### VARIABLE: `+TCL-GLOB-TYPE-PIPE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 3)`


<a name="api-variable-tcl-glob-type-sock_1A47DF47D9F9F36E79D71FC2C3716164"></a>
### VARIABLE: `+TCL-GLOB-TYPE-SOCK+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 6)`


<a name="api-variable-tcl-global-only_E2F974F469D6E58CC5CBDD7C9438C8C0"></a>
### VARIABLE: `+TCL-GLOBAL-ONLY+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`


<a name="api-variable-tcl-hash-key-direct-compare_0979762E2B8FA6A9672037B493B24260"></a>
### VARIABLE: `+TCL-HASH-KEY-DIRECT-COMPARE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `4`

TCL_HASH_KEY_DIRECT_COMPARE

<a name="api-variable-tcl-hash-key-randomize-hash_FC2A3CC986BF0BB418ED10D3145ADA94"></a>
### VARIABLE: `+TCL-HASH-KEY-RANDOMIZE-HASH+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`

TCL_HASH_KEY_RANDOMIZE_HASH

<a name="api-variable-tcl-hash-key-system-hash_5C647D15F5864E8BC2B951E2922426D3"></a>
### VARIABLE: `+TCL-HASH-KEY-SYSTEM-HASH+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `2`

TCL_HASH_KEY_SYSTEM_HASH

<a name="api-variable-tcl-hash-key-type-version_246FE7597C3C35189198466E5E569A79"></a>
### VARIABLE: `+TCL-HASH-KEY-TYPE-VERSION+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`

TCL_HASH_KEY_TYPE_VERSION

<a name="api-variable-tcl-idle-events_C1F97A9301A632850D3D12C18A9DD50D"></a>
### VARIABLE: `+TCL-IDLE-EVENTS+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 5)`


<a name="api-variable-tcl-index-none_9F364C885F05C4A54E92A1DE3A6A5794"></a>
### VARIABLE: `+TCL-INDEX-NONE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `-1`

((Tcl_Size)-1)

<a name="api-variable-tcl-index-temp-table_766E41F4AEA101BCFF76ADB16F03B74B"></a>
### VARIABLE: `+TCL-INDEX-TEMP-TABLE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `64`


<a name="api-variable-tcl-integer-space_9CF59A68AA8AFE61F35024E9081F8DFB"></a>
### VARIABLE: `+TCL-INTEGER-SPACE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(* 3 (CFFI:FOREIGN-TYPE-SIZE 'RAW-CFFI-TCL9:TCL-WIDE-INT))`

TCL_INTEGER_SPACE

<a name="api-variable-tcl-interp-destroyed_A2DA49B9629F46E91FDFE27229188A7B"></a>
### VARIABLE: `+TCL-INTERP-DESTROYED+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `256`


<a name="api-variable-tcl-io-failure_4C69EEC82D6B48FB19419844C41BB3B7"></a>
### VARIABLE: `+TCL-IO-FAILURE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `-1`

((Tcl_Size)-1)

<a name="api-variable-tcl-leave-err-msg_7BB1240C1440E0404436189146BD8B40"></a>
### VARIABLE: `+TCL-LEAVE-ERR-MSG+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `512`


<a name="api-variable-tcl-limit-commands_3AFB2BCB11431A4938A22A9E88474BC4"></a>
### VARIABLE: `+TCL-LIMIT-COMMANDS+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`


<a name="api-variable-tcl-limit-time_206F40500C94982A806B28B99BA43DD8"></a>
### VARIABLE: `+TCL-LIMIT-TIME+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `2`


<a name="api-variable-tcl-link-binary_078C91EDEC0ABB788EAA5D2F1C2C56CB"></a>
### VARIABLE: `+TCL-LINK-BINARY+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `16`


<a name="api-variable-tcl-link-boolean_43FC66FD63A6E9CD776A20524286F38C"></a>
### VARIABLE: `+TCL-LINK-BOOLEAN+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `3`


<a name="api-variable-tcl-link-char_3805D2B932D22149552BDB9979F0ED52"></a>
### VARIABLE: `+TCL-LINK-CHAR+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `6`


<a name="api-variable-tcl-link-chars_D73ED6B3ACF8F9BD52917A8A1FD88E1F"></a>
### VARIABLE: `+TCL-LINK-CHARS+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `15`


<a name="api-variable-tcl-link-double_B32FA9CDBBC24BD4B586DC952AC16687"></a>
### VARIABLE: `+TCL-LINK-DOUBLE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `2`


<a name="api-variable-tcl-link-float_118C5CF010E12724FB1DE217BE0691DF"></a>
### VARIABLE: `+TCL-LINK-FLOAT+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `13`


<a name="api-variable-tcl-link-int_F8AE00442F7C6702E3454F800CBF7CEE"></a>
### VARIABLE: `+TCL-LINK-INT+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`


<a name="api-variable-tcl-link-long_284D4D1AED42EE4274ADEA71908E9CBD"></a>
### VARIABLE: `+TCL-LINK-LONG+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `5`


<a name="api-variable-tcl-link-read-only_1BA3B05F5C9B6071584986ABDF2D5030"></a>
### VARIABLE: `+TCL-LINK-READ-ONLY+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `128`


<a name="api-variable-tcl-link-short_52793124FC89277FDB336DFC14CF5639"></a>
### VARIABLE: `+TCL-LINK-SHORT+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `8`


<a name="api-variable-tcl-link-string_BEAE50B5A55551EB05874861F488EDBE"></a>
### VARIABLE: `+TCL-LINK-STRING+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `4`


<a name="api-variable-tcl-link-uchar_5FBF2915A9154BD1AC8E71FC72240138"></a>
### VARIABLE: `+TCL-LINK-UCHAR+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `7`


<a name="api-variable-tcl-link-uint_971A7EEFEAFC829CF99E1078DFF000CF"></a>
### VARIABLE: `+TCL-LINK-UINT+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `10`


<a name="api-variable-tcl-link-ulong_05DC3B023E6F6905E14CAC2F354C0156"></a>
### VARIABLE: `+TCL-LINK-ULONG+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `14`


<a name="api-variable-tcl-link-ushort_7F1BACA9F0BC60B159383514FE778F06"></a>
### VARIABLE: `+TCL-LINK-USHORT+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `9`


<a name="api-variable-tcl-link-wide-int_E3E394A5FA0BF7F71B2344F4F553EA94"></a>
### VARIABLE: `+TCL-LINK-WIDE-INT+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `5`


<a name="api-variable-tcl-link-wide-uint_B3C1653C1F685F9854A81BD457FB5A43"></a>
### VARIABLE: `+TCL-LINK-WIDE-UINT+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `14`


<a name="api-variable-tcl-list-element_37AB74966164AA5204A7E718E98BF5A7"></a>
### VARIABLE: `+TCL-LIST-ELEMENT+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `8`


<a name="api-variable-tcl-load-global_6D84BC6ECF160B01FF71D06D546CD8ED"></a>
### VARIABLE: `+TCL-LOAD-GLOBAL+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`


<a name="api-variable-tcl-load-lazy_BD04F3A04FBFC069E36954F4E419A562"></a>
### VARIABLE: `+TCL-LOAD-LAZY+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `2`


<a name="api-variable-tcl-match-nocase_5AB828160C6169CBCA619CDC1FF07C55"></a>
### VARIABLE: `+TCL-MATCH-NOCASE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 0)`


<a name="api-variable-tcl-max-prec_DE50BF697359FC074C30D49F78706CF9"></a>
### VARIABLE: `+TCL-MAX-PREC+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `17`

TCL_MAX_PREC

<a name="api-variable-tcl-mode-blocking_55F81F9C4E2B94E2A3BF16172A54FCF0"></a>
### VARIABLE: `+TCL-MODE-BLOCKING+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `0`


<a name="api-variable-tcl-mode-nonblocking_4298F69C6014532C18A0A0723125D9FF"></a>
### VARIABLE: `+TCL-MODE-NONBLOCKING+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`


<a name="api-variable-tcl-namespace-only_E4C19C770826540E9322D401108B5FD8"></a>
### VARIABLE: `+TCL-NAMESPACE-ONLY+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `2`


<a name="api-variable-tcl-no-eval_08004AE3EF54B3136BBB61AFFC0D9B7C"></a>
### VARIABLE: `+TCL-NO-EVAL+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `65536`


<a name="api-variable-tcl-null-ok_CB18D86FD66B03243312AA7592B1DDF1"></a>
### VARIABLE: `+TCL-NULL-OK+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `32`


<a name="api-variable-tcl-number-big_8499607B4B6DD6D1EC140E5055270F27"></a>
### VARIABLE: `+TCL-NUMBER-BIG+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `3`

TCL_NUMBER_BIG

<a name="api-variable-tcl-number-double_C516FF4A10BA1C5B3176BB32F2225030"></a>
### VARIABLE: `+TCL-NUMBER-DOUBLE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `4`

TCL_NUMBER_DOUBLE

<a name="api-variable-tcl-number-int_911CFD07C75B25BE4CA3CDB583F436BF"></a>
### VARIABLE: `+TCL-NUMBER-INT+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `2`

TCL_NUMBER_INT

<a name="api-variable-tcl-number-nan_D6C8DE85F5E941687D0235AD3D5BBC93"></a>
### VARIABLE: `+TCL-NUMBER-NAN+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `5`

TCL_NUMBER_NAN

<a name="api-variable-tcl-ok_43789D88635A0FEA0EB0852F59B3BE67"></a>
### VARIABLE: `+TCL-OK+*`

- SCOPE: INTERNAL
- INITIAL-VALUE: `0`


<a name="api-variable-tcl-ok_1185E5504BF5EDEDFBF5F8E7E5132F4D"></a>
### VARIABLE: `+TCL-OK+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `0`


<a name="api-variable-tcl-one-word-keys_6C56AAC5C88ECC0D1B4A4DECC8D09C74"></a>
### VARIABLE: `+TCL-ONE-WORD-KEYS+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`


<a name="api-variable-tcl-parse-bad-number_84359531E470CF87D21D2C3A60C5B2A9"></a>
### VARIABLE: `+TCL-PARSE-BAD-NUMBER+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `9`


<a name="api-variable-tcl-parse-brace-extra_816AE27FDDCDB42739E94A0DC7D623EB"></a>
### VARIABLE: `+TCL-PARSE-BRACE-EXTRA+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `2`


<a name="api-variable-tcl-parse-missing-brace_2DD4DE32724616FE075648F317A91B53"></a>
### VARIABLE: `+TCL-PARSE-MISSING-BRACE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `3`


<a name="api-variable-tcl-parse-missing-bracket_EABD048CD1DC5B0CD06BD834C3A42DCC"></a>
### VARIABLE: `+TCL-PARSE-MISSING-BRACKET+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `4`


<a name="api-variable-tcl-parse-missing-paren_6E775DD361EA177910F459F1845BBB30"></a>
### VARIABLE: `+TCL-PARSE-MISSING-PAREN+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `5`


<a name="api-variable-tcl-parse-missing-quote_4422CF70FA4B451DCBAB3BC0B49A6990"></a>
### VARIABLE: `+TCL-PARSE-MISSING-QUOTE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `6`


<a name="api-variable-tcl-parse-missing-var-brace_7DCF923B464847CEF60FE94263AD3D66"></a>
### VARIABLE: `+TCL-PARSE-MISSING-VAR-BRACE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `7`


<a name="api-variable-tcl-parse-quote-extra_DE38A09853C0F7638BFB0D9E08A69FF8"></a>
### VARIABLE: `+TCL-PARSE-QUOTE-EXTRA+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`


<a name="api-variable-tcl-parse-success_E980D7A1D2B85013DF032467E70331AA"></a>
### VARIABLE: `+TCL-PARSE-SUCCESS+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `0`


<a name="api-variable-tcl-parse-syntax_33E7255796450B8193C1BFBB2510F9E3"></a>
### VARIABLE: `+TCL-PARSE-SYNTAX+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `8`


<a name="api-variable-tcl-r-ok_76BCDB7F6CCAA4F211A6D8485391678A"></a>
### VARIABLE: `+TCL-R-OK+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `4`


<a name="api-variable-tcl-readable_57B4A8FEF0546AF183774210E5830D9C"></a>
### VARIABLE: `+TCL-READABLE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 1)`


<a name="api-variable-tcl-reg-advanced_34F1B5AE78BD0647638003B327AEC0BE"></a>
### VARIABLE: `+TCL-REG-ADVANCED+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `3`


<a name="api-variable-tcl-reg-advf_4C4CDCA9853206EAE4930CCE718FA242"></a>
### VARIABLE: `+TCL-REG-ADVF+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `2`


<a name="api-variable-tcl-reg-basic_26574FD36FA4D254E3F939967A73BC78"></a>
### VARIABLE: `+TCL-REG-BASIC+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `0`


<a name="api-variable-tcl-reg-canmatch_007C872C296AD0C77AEE9AE088A21155"></a>
### VARIABLE: `+TCL-REG-CANMATCH+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `512`


<a name="api-variable-tcl-reg-expanded_61410C7C55ED5F5CB7F0AB740DD516CE"></a>
### VARIABLE: `+TCL-REG-EXPANDED+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `32`


<a name="api-variable-tcl-reg-extended_EE21226A0A588131263904290F9EA190"></a>
### VARIABLE: `+TCL-REG-EXTENDED+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`


<a name="api-variable-tcl-reg-newline_2697A676AC6343B6C85583E97CD62C33"></a>
### VARIABLE: `+TCL-REG-NEWLINE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `192`


<a name="api-variable-tcl-reg-nlanch_7CBD2DC61536E50AFB892F19EAE11E44"></a>
### VARIABLE: `+TCL-REG-NLANCH+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `128`


<a name="api-variable-tcl-reg-nlstop_CA568E949E34158041D2E07A8F15ACD6"></a>
### VARIABLE: `+TCL-REG-NLSTOP+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `64`


<a name="api-variable-tcl-reg-nocase_FA8DA92789FDC7ADA3E2012DC46AD394"></a>
### VARIABLE: `+TCL-REG-NOCASE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `8`


<a name="api-variable-tcl-reg-nosub_B758E4EB435DE9B5F4D43BDE9239CB6A"></a>
### VARIABLE: `+TCL-REG-NOSUB+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `16`


<a name="api-variable-tcl-reg-notbol_CC522D1A8758E62D6B20E3286614CE56"></a>
### VARIABLE: `+TCL-REG-NOTBOL+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`


<a name="api-variable-tcl-reg-noteol_83192C3D438E46EE3D37E1196CB63FE8"></a>
### VARIABLE: `+TCL-REG-NOTEOL+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `2`


<a name="api-variable-tcl-reg-quote_999309318D2F483E629963E05B45841A"></a>
### VARIABLE: `+TCL-REG-QUOTE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `4`


<a name="api-variable-tcl-result-size_83E90F9F352874B7DA5C3C3AB3855698"></a>
### VARIABLE: `+TCL-RESULT-SIZE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `200`


<a name="api-variable-tcl-return_5B6DFA1F96C6BC962560A9A7683986C0"></a>
### VARIABLE: `+TCL-RETURN+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `2`


<a name="api-variable-tcl-service-all_CE0B0AEDD190DD32EB2EDA3979CA58E0"></a>
### VARIABLE: `+TCL-SERVICE-ALL+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`


<a name="api-variable-tcl-service-none_BF8ADCAE2AF46AABD31E96702DF087F3"></a>
### VARIABLE: `+TCL-SERVICE-NONE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `0`


<a name="api-variable-tcl-small-hash-table_A35E9F7F0BB22D67BC89677A71D17A76"></a>
### VARIABLE: `+TCL-SMALL-HASH-TABLE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `4`

TCL_SMALL_HASH_TABLE

<a name="api-variable-tcl-static_63F2CFDDD10E53E4DDAE5CDB44387EF2"></a>
### VARIABLE: `+TCL-STATIC+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `0`


<a name="api-variable-tcl-stderr_1B8787965E99797441FAD7A89C23E60A"></a>
### VARIABLE: `+TCL-STDERR+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 3)`


<a name="api-variable-tcl-stdin_0CD02C10D5644575CC79C917113BDD5C"></a>
### VARIABLE: `+TCL-STDIN+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 1)`


<a name="api-variable-tcl-stdout_A5CC144E4C3F56FB91E084B97308CE5F"></a>
### VARIABLE: `+TCL-STDOUT+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 2)`


<a name="api-variable-tcl-string-keys_E8363B6ED14BF91B1F74A4176F54D808"></a>
### VARIABLE: `+TCL-STRING-KEYS+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `0`


<a name="api-variable-tcl-stub-magic_EC48ACC2EC9C4F00AA1EEFBB5442BDE7"></a>
### VARIABLE: `+TCL-STUB-MAGIC+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(+ 4238588619 (CFFI:FOREIGN-TYPE-SIZE :POINTER))`


<a name="api-variable-tcl-subst-all_3816A997B099085CA480D8BB1A643AB2"></a>
### VARIABLE: `+TCL-SUBST-ALL+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `7`


<a name="api-variable-tcl-subst-backslashes_381F89DCD8F101EEA11836F88D8DDB2D"></a>
### VARIABLE: `+TCL-SUBST-BACKSLASHES+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `4`


<a name="api-variable-tcl-subst-commands_5124EAABF50414E43332DAFC3E42FFF2"></a>
### VARIABLE: `+TCL-SUBST-COMMANDS+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`


<a name="api-variable-tcl-subst-variables_7B0DFF80D828C81D00C597C47E733B61"></a>
### VARIABLE: `+TCL-SUBST-VARIABLES+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `2`


<a name="api-variable-tcl-tcpserver-reuseaddr_365E295F6FD93642A577136C8D6C2D0E"></a>
### VARIABLE: `+TCL-TCPSERVER-REUSEADDR+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 0)`


<a name="api-variable-tcl-tcpserver-reuseport_92B36588DB18017EEE08642DB39135E6"></a>
### VARIABLE: `+TCL-TCPSERVER-REUSEPORT+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 1)`


<a name="api-variable-tcl-thread-joinable_A5E4B04429B2D2974E5E2E89F235C9D3"></a>
### VARIABLE: `+TCL-THREAD-JOINABLE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`


<a name="api-variable-tcl-thread-noflags_14DC2E064A297D8C181A8592D637D4F8"></a>
### VARIABLE: `+TCL-THREAD-NOFLAGS+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `0`


<a name="api-variable-tcl-thread-stack-default_BA902E47AAEE3D8AAEC9B7D3EFDC1503"></a>
### VARIABLE: `+TCL-THREAD-STACK-DEFAULT+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `0`


<a name="api-variable-tcl-timer-events_EDAAF5BC977EF9211A06F2BB77D7C144"></a>
### VARIABLE: `+TCL-TIMER-EVENTS+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 4)`


<a name="api-variable-tcl-token-bs_37808C77A6D246930AFBDE1B35C8D28F"></a>
### VARIABLE: `+TCL-TOKEN-BS+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `8`


<a name="api-variable-tcl-token-command_FEF13AB616E559B6A696CEA3575EC125"></a>
### VARIABLE: `+TCL-TOKEN-COMMAND+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `16`


<a name="api-variable-tcl-token-expand-word_554515D7BA4AC8284AD88476D55662CB"></a>
### VARIABLE: `+TCL-TOKEN-EXPAND-WORD+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `256`


<a name="api-variable-tcl-token-operator_348D1D68FCCF1D1230CB4AB69A01312E"></a>
### VARIABLE: `+TCL-TOKEN-OPERATOR+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `128`


<a name="api-variable-tcl-token-simple-word_795BFD4368FFB1151036CBF445A9FBFA"></a>
### VARIABLE: `+TCL-TOKEN-SIMPLE-WORD+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `2`


<a name="api-variable-tcl-token-sub-expr_0848CE0B99912E9DC65EE8705762D35B"></a>
### VARIABLE: `+TCL-TOKEN-SUB-EXPR+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `64`


<a name="api-variable-tcl-token-text_BC835CA187A3713B5E792159CD4A7B6D"></a>
### VARIABLE: `+TCL-TOKEN-TEXT+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `4`


<a name="api-variable-tcl-token-variable_9A9C3B62C8CBDCA4246737BF5C10F384"></a>
### VARIABLE: `+TCL-TOKEN-VARIABLE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `32`


<a name="api-variable-tcl-token-word_C7DAB813D2AAD5B0CF2AD7A65D1A0BF2"></a>
### VARIABLE: `+TCL-TOKEN-WORD+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`


<a name="api-variable-tcl-trace-array_17775F335AB082E0B836ACDF569928DC"></a>
### VARIABLE: `+TCL-TRACE-ARRAY+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `2048`


<a name="api-variable-tcl-trace-delete_D7DC8E8E9A59F76A80CF69147752E2B8"></a>
### VARIABLE: `+TCL-TRACE-DELETE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `16384`


<a name="api-variable-tcl-trace-destroyed_6EA1DB6E6556989BAEAA3F4E3D9F6ED9"></a>
### VARIABLE: `+TCL-TRACE-DESTROYED+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `128`


<a name="api-variable-tcl-trace-enter-exec_FC7B6ED63F5A7CED198BF5A6881FEF66"></a>
### VARIABLE: `+TCL-TRACE-ENTER-EXEC+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`


<a name="api-variable-tcl-trace-leave-exec_673B69D68E8580223EB5AF6EB83C2521"></a>
### VARIABLE: `+TCL-TRACE-LEAVE-EXEC+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `2`


<a name="api-variable-tcl-trace-old-style_7C47EB2CFD7FED021726D6A2AA35BB0C"></a>
### VARIABLE: `+TCL-TRACE-OLD-STYLE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `4096`


<a name="api-variable-tcl-trace-reads_B99400018316C7E4D0232F1141175ED7"></a>
### VARIABLE: `+TCL-TRACE-READS+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `16`


<a name="api-variable-tcl-trace-rename_65F3FDAB2AC25FC297185B8ECCF0ADA6"></a>
### VARIABLE: `+TCL-TRACE-RENAME+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `8192`


<a name="api-variable-tcl-trace-result-dynamic_E68F104ED98346279DC64AE147287211"></a>
### VARIABLE: `+TCL-TRACE-RESULT-DYNAMIC+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `32768`


<a name="api-variable-tcl-trace-result-object_08A4B712DE16D5E33347AC3BD9F48E68"></a>
### VARIABLE: `+TCL-TRACE-RESULT-OBJECT+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `65536`


<a name="api-variable-tcl-trace-unsets_FD55106D446B71B0F629FBE6C6CE0D8F"></a>
### VARIABLE: `+TCL-TRACE-UNSETS+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `64`


<a name="api-variable-tcl-trace-writes_73ED239A06B63120FE601C55CBC32E0F"></a>
### VARIABLE: `+TCL-TRACE-WRITES+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `32`


<a name="api-variable-tcl-unload-detach-from-interpreter_21482D75A40E4EBBB6D14B4BA1688DDF"></a>
### VARIABLE: `+TCL-UNLOAD-DETACH-FROM-INTERPRETER+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 0)`


<a name="api-variable-tcl-unload-detach-from-process_D84B0B3935B1670A68CF3954ED9B79E1"></a>
### VARIABLE: `+TCL-UNLOAD-DETACH-FROM-PROCESS+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 1)`


<a name="api-variable-tcl-utf-max_8A13068E1A8E0A6835B52D885813BF4D"></a>
### VARIABLE: `+TCL-UTF-MAX+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `4`


<a name="api-variable-tcl-volatile_4E8E0B19BB7D1EC2041505559DE6751E"></a>
### VARIABLE: `+TCL-VOLATILE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`


<a name="api-variable-tcl-w-ok_5D9974877203C743F6E57F9931A01275"></a>
### VARIABLE: `+TCL-W-OK+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `2`


<a name="api-variable-tcl-window-events_94DEDE9D7DD1611DD48D6B792973A220"></a>
### VARIABLE: `+TCL-WINDOW-EVENTS+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 2)`


<a name="api-variable-tcl-writable_1889C879E2472144D76875071580F8C8"></a>
### VARIABLE: `+TCL-WRITABLE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `(ASH 1 2)`


<a name="api-variable-tcl-x-ok_9134F543174060789025C8FA4B6D423A"></a>
### VARIABLE: `+TCL-X-OK+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`


<a name="api-variable-tcl-zlib-compress-best_EBED48FE5FF26D3BD9FF0DCE228F8617"></a>
### VARIABLE: `+TCL-ZLIB-COMPRESS-BEST+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `9`


<a name="api-variable-tcl-zlib-compress-default_39E663F1EF308687A5D5FBE8DB4B9980"></a>
### VARIABLE: `+TCL-ZLIB-COMPRESS-DEFAULT+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `-1`


<a name="api-variable-tcl-zlib-compress-fast_53FE6B7A5877655BE8F14F6B7A29477B"></a>
### VARIABLE: `+TCL-ZLIB-COMPRESS-FAST+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`


<a name="api-variable-tcl-zlib-compress-none_DEFB332DFFABAC9C27869E1468826AAF"></a>
### VARIABLE: `+TCL-ZLIB-COMPRESS-NONE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `0`


<a name="api-variable-tcl-zlib-finalize_3C8250656476BFEE63EC4067E75EEF26"></a>
### VARIABLE: `+TCL-ZLIB-FINALIZE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `4`


<a name="api-variable-tcl-zlib-flush_A71F02491F0EFA7A4C882069ADA1FEB8"></a>
### VARIABLE: `+TCL-ZLIB-FLUSH+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `2`


<a name="api-variable-tcl-zlib-format-auto_85D92A1BAF559A067D8065E519F330E2"></a>
### VARIABLE: `+TCL-ZLIB-FORMAT-AUTO+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `8`


<a name="api-variable-tcl-zlib-format-gzip_19CE68E1543E9D961086E55B5BD8CD58"></a>
### VARIABLE: `+TCL-ZLIB-FORMAT-GZIP+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `4`


<a name="api-variable-tcl-zlib-format-raw_17BCBDE5661A2CDE84F971FB46F0AF82"></a>
### VARIABLE: `+TCL-ZLIB-FORMAT-RAW+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `1`


<a name="api-variable-tcl-zlib-format-zlib_6A260DD6883309E1279B5AA785535C32"></a>
### VARIABLE: `+TCL-ZLIB-FORMAT-ZLIB+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `2`


<a name="api-variable-tcl-zlib-fullflush_611C83EA0E09D7A0E5FD1A70BCD5A946"></a>
### VARIABLE: `+TCL-ZLIB-FULLFLUSH+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `3`


<a name="api-variable-tcl-zlib-no-flush_991978EA3AC7189760BE064D23C7E1B7"></a>
### VARIABLE: `+TCL-ZLIB-NO-FLUSH+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `0`


<a name="api-variable-tcl-zlib-stream-deflate_2B91ACFCC6FC72EEAC9A3305FABC4292"></a>
### VARIABLE: `+TCL-ZLIB-STREAM-DEFLATE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `16`


<a name="api-variable-tcl-zlib-stream-inflate_494266C29E2454BC5A1F2F3A419AAA06"></a>
### VARIABLE: `+TCL-ZLIB-STREAM-INFLATE+`

- SCOPE: EXTERNAL
- INITIAL-VALUE: `32`


--------------------------------
Generated with [doqumen](https://github.com/ageldama/doqumen/) at 2026-05-18T23:51:24.718754+09:00 by https://github.com/ageldama
