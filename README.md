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

<a name="api-variable-cffitcl-wide-int-ptcl_9396246E5DAAD3CAAE1706B75196092D"></a>
### VARIABLE: `%CFFI+TCL--WIDE-INT-P_TCL`

- SCOPE: INTERNAL
- INITIAL-VALUE: `"set max32bit 2147483647;
set testval [expr $max32bit + 1];
# 2147483648
if {[string is integer -strict $testval] && $testval > $max32bit} {
    # 64-bits / 8-bytes == longlong.
    set ::wideint 64bits
} else {
    # ...is 32-bits / 4-bytes == long.
    set ::wideint 32bits
}
# puts $::wideint
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
Generated with [doqumen](https://github.com/ageldama/doqumen/) at 2026-05-18T21:46:22.203334+09:00 by https://github.com/ageldama
