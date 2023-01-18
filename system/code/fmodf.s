

.section .text
func_800D5DE0:
# MqDbg: fmodf
    mtc1    $zero, $f2                 # $f2 = 0.00
    nop
    c.eq.s  $f14, $f2
    nop
    bc1fl   lbl_800D5E04
    div.s   $f4, $f12, $f14
    jr      $ra
    mov.s   $f0, $f2
lbl_800D5E00:
    div.s   $f4, $f12, $f14
lbl_800D5E04:
    trunc.w.s $f6, $f4
    mfc1    t7, $f6
    nop
    mtc1    t7, $f8                    # $f8 = 0.00
    nop
    cvt.s.w $f10, $f8
    mul.s   $f16, $f10, $f14
    sub.s   $f0, $f12, $f16
    jr      $ra
    nop
    nop
