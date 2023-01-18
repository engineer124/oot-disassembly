

.section .text
func_800CD510:
# MqDbg: Math_FTanF
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    swc1    $f12, 0x0020($sp)
    jal     func_800CF470
    lwc1    $f12, 0x0020($sp)
    swc1    $f0, 0x001C($sp)
    jal     func_800D2CD0
    lwc1    $f12, 0x0020($sp)
    lw      $ra, 0x0014($sp)
    lwc1    $f4, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    div.s   $f0, $f4, $f0


func_800CD544:
# MqDbg: Math_FFloorF
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800CD8C0
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800CD564:
# MqDbg: Math_FCeilF
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800CD8F8
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800CD584:
# MqDbg: Math_FRoundF
    mtc1    $zero, $f5                 # $f5 = 0.00
    mtc1    $zero, $f4                 # $f4 = 0.00
    nop
    c.lt.d  $f12, $f4
    nop
    bc1fl   lbl_800CD5B0
    mov.d   $f2, $f12
    neg.d   $f2, $f12
    jr      $ra
    mov.d   $f0, $f2
lbl_800CD5AC:
    mov.d   $f2, $f12
lbl_800CD5B0:
    jr      $ra
    mov.d   $f0, $f2


func_800CD5B8:
# MqDbg: Math_FTruncF
    mtc1    $zero, $f4                 # $f4 = 0.00
    nop
    c.lt.s  $f12, $f4
    nop
    bc1fl   lbl_800CD5E0
    mov.s   $f2, $f12
    neg.s   $f2, $f12
    jr      $ra
    mov.s   $f0, $f2
lbl_800CD5DC:
    mov.s   $f2, $f12
lbl_800CD5E0:
    jr      $ra
    mov.s   $f0, $f2


func_800CD5E8:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800CD9A0
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800CD608:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800CD930
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800CD628:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800CD968
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800CD648:
# MqDbg: 
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f16                  # $f16 = 1.00
    mtc1    $zero, $f2                 # $f2 = 0.00
    addiu   v0, $zero, 0x0001          # v0 = 00000001
    c.lt.s  $f16, $f12
    lui     $at, 0xBF80                # $at = BF800000
    bc1fl   lbl_800CD674
    mtc1    $at, $f4                   # $f4 = -1.00
    b       lbl_800CD694
    div.s   $f12, $f16, $f12
    mtc1    $at, $f4                   # $f4 = -1.00
lbl_800CD674:
    or      v0, $zero, $zero           # v0 = 00000000
    c.lt.s  $f12, $f4
    nop
    bc1f    lbl_800CD694
    nop
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
    b       lbl_800CD694
    div.s   $f12, $f16, $f12
lbl_800CD694:
    lui     $at, 0x41C0                # $at = 41C00000
    mul.s   $f0, $f12, $f12
    mtc1    $at, $f14                  # $f14 = 24.00
    addiu   v1, $zero, 0x0018          # v1 = 00000018
lbl_800CD6A4:
    mul.s   $f18, $f14, $f14
    add.s   $f10, $f14, $f14
    addiu   v1, v1, 0xFFFC             # v1 = 00000014
    add.s   $f10, $f10, $f16
    mul.s   $f18, $f18, $f0
    sub.s   $f14, $f14, $f16
    mul.s   $f8, $f14, $f14
    add.s   $f10, $f10, $f2
    add.s   $f6, $f14, $f14
    mul.s   $f8, $f8, $f0
    div.s   $f2, $f18, $f10
    add.s   $f6, $f6, $f16
    sub.s   $f14, $f14, $f16
    mul.s   $f10, $f14, $f14
    add.s   $f6, $f6, $f2
    add.s   $f18, $f14, $f14
    mul.s   $f10, $f10, $f0
    div.s   $f2, $f8, $f6
    add.s   $f18, $f18, $f16
    sub.s   $f14, $f14, $f16
    mul.s   $f6, $f14, $f14
    add.s   $f18, $f18, $f2
    add.s   $f8, $f14, $f14
    mul.s   $f6, $f6, $f0
    div.s   $f2, $f10, $f18
    add.s   $f8, $f8, $f16
    sub.s   $f14, $f14, $f16
    add.s   $f8, $f8, $f2
    bne     v1, $zero, lbl_800CD6A4
    div.s   $f2, $f6, $f8
    blez    v0, lbl_800CD73C
    nop
    add.s   $f10, $f16, $f2
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f6, -0x5B10($at)          # 8010A4F0
    div.s   $f18, $f12, $f10
    jr      $ra
    sub.s   $f0, $f6, $f18
lbl_800CD73C:
    bgezl   v0, lbl_800CD760
    add.s   $f6, $f16, $f2
    add.s   $f4, $f16, $f2
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f8, -0x5B0C($at)          # 8010A4F4
    div.s   $f10, $f12, $f4
    jr      $ra
    sub.s   $f0, $f8, $f10
lbl_800CD75C:
    add.s   $f6, $f16, $f2
lbl_800CD760:
    div.s   $f0, $f12, $f6
    jr      $ra
    nop


func_800CD76C:
# MqDbg: 
    mtc1    $zero, $f2                 # $f2 = 0.00
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sdc1    $f20, 0x0010($sp)
    c.eq.s  $f12, $f2
    mov.s   $f20, $f12
    sw      $ra, 0x001C($sp)
    bc1fl   lbl_800CD7A8
    c.eq.s  $f14, $f2
    c.eq.s  $f14, $f2
    nop
    bc1fl   lbl_800CD7A8
    c.eq.s  $f14, $f2
    b       lbl_800CD84C
    mov.s   $f0, $f2
    c.eq.s  $f14, $f2
lbl_800CD7A8:
    nop
    bc1fl   lbl_800CD7DC
    c.lt.s  $f14, $f2
    c.lt.s  $f20, $f2
    lui     $at, 0x8011                # $at = 80110000
    bc1f    lbl_800CD7D0
    nop
    lui     $at, 0x8011                # $at = 80110000
    b       lbl_800CD84C
    lwc1    $f0, -0x5B08($at)          # 8010A4F8
lbl_800CD7D0:
    b       lbl_800CD84C
    lwc1    $f0, -0x5B04($at)          # 8010A4FC
    c.lt.s  $f14, $f2
lbl_800CD7DC:
    nop
    bc1f    lbl_800CD844
    nop
    c.lt.s  $f20, $f2
    nop
    bc1fl   lbl_800CD824
    div.s   $f8, $f20, $f14
    div.s   $f4, $f20, $f14
    cvt.d.s $f0, $f4
    abs.d   $f0, $f0
    jal     func_800CD648
    cvt.s.d $f12, $f0
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f6, -0x5B00($at)          # 8010A500
    sub.s   $f0, $f6, $f0
    b       lbl_800CD84C
    neg.s   $f0, $f0
    div.s   $f8, $f20, $f14
lbl_800CD824:
    cvt.d.s $f0, $f8
    abs.d   $f0, $f0
    jal     func_800CD648
    cvt.s.d $f12, $f0
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f10, -0x5AFC($at)         # 8010A504
    b       lbl_800CD84C
    sub.s   $f0, $f10, $f0
lbl_800CD844:
    jal     func_800CD648
    div.s   $f12, $f20, $f14
lbl_800CD84C:
    lw      $ra, 0x001C($sp)
    ldc1    $f20, 0x0010($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800CD860:
# MqDbg: Math_FAsinF
    mul.s   $f6, $f12, $f12
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f4                   # $f4 = 1.00
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    sub.s   $f0, $f4, $f6
    jal     func_800CD76C
    sqrt.s  $f14, $f0
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800CD890:
# MqDbg: Math_FAcosF
# Wrapper for 800CD860 (subtracts result by 90 degrees)
# F12 = ?
# F0 = radians
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800CD860
    nop
    lw      $ra, 0x0014($sp)
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f4, -0x5AF8($at)          # 8010A508
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    sub.s   $f0, $f4, $f0
    nop
    nop