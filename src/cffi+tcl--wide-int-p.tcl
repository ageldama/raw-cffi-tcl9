set max32bit 2147483647;
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
