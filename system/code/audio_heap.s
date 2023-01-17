# Audio Heap
#
# Starts at VRAM: 800B33E0 / VROM: B29340
#

.section .text
func_800B33E0:
# MqDbg: AudioHeap_CalculateAdsrDecay
    lui     $at, 0x4380                # $at = 43800000
    mtc1    $at, $f4                   # $f4 = 256.00
    lui     $at, 0x8012                # $at = 80120000
    lwc1    $f6, 0x7E98($at)           # 80127E98
    mul.s   $f8, $f4, $f6
    jr      $ra
    div.s   $f0, $f8, $f12


func_800B33FC:
# MqDbg: AudioHeap_InitAdsrDecayTable
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    lui     $at, 0x3E80                # $at = 3E800000
    sw      $ra, 0x0024($sp)
    mtc1    $at, $f12                  # $f12 = 0.25
    sw      s3, 0x0020($sp)
    sw      s2, 0x001C($sp)
    sw      s1, 0x0018($sp)
    jal     func_800B33E0
    sw      s0, 0x0014($sp)
    lui     s3, 0x8012                 # s3 = 80120000
    addiu   s3, s3, 0x5630             # s3 = 80125630
    lw      t6, 0x3520(s3)             # 80128B50
    lui     $at, 0x8011                # $at = 80110000
    swc1    $f0, 0x03FC(t6)            # 000003FC
    jal     func_800B33E0
    lwc1    $f12, -0x6830($at)         # 801097D0
    lw      t7, 0x3520(s3)             # 80128B50
    lui     $at, 0x3F00                # $at = 3F000000
    mtc1    $at, $f12                  # $f12 = 0.50
    jal     func_800B33E0
    swc1    $f0, 0x03F8(t7)            # 000003F8
    lw      t8, 0x3520(s3)             # 80128B50
    lui     $at, 0x8011                # $at = 80110000
    swc1    $f0, 0x03F4(t8)            # 000003F4
    jal     func_800B33E0
    lwc1    $f12, -0x682C($at)         # 801097D4
    lw      t9, 0x3520(s3)             # 80128B50
    lui     $at, 0x3F40                # $at = 3F400000
    mtc1    $at, $f12                  # $f12 = 0.75
    jal     func_800B33E0
    swc1    $f0, 0x03F0(t9)            # 000003F0
    lw      t0, 0x3520(s3)             # 80128B50
    addiu   s1, $zero, 0x0080          # s1 = 00000080
    addiu   s0, $zero, 0x0200          # s0 = 00000200
    addiu   s2, $zero, 0x00FB          # s2 = 000000FB
    swc1    $f0, 0x03EC(t0)            # 000003EC
lbl_800B348C:
    subu    t1, s2, s1
    mtc1    t1, $f4                    # $f4 = 0.00
    jal     func_800B33E0
    cvt.s.w $f12, $f4
    lw      t2, 0x3520(s3)             # 80128B50
    addiu   s1, s1, 0x0001             # s1 = 00000081
    slti    $at, s1, 0x00FB
    addu    t3, t2, s0
    addiu   s0, s0, 0x0004             # s0 = 00000204
    bne     $at, $zero, lbl_800B348C
    swc1    $f0, 0x0000(t3)            # 00000000
    addiu   s0, $zero, 0x0040          # s0 = 00000040
    addiu   s2, $zero, 0x01FC          # s2 = 000001FC
lbl_800B34C0:
    mtc1    s2, $f6                    # $f6 = 0.00
    jal     func_800B33E0
    cvt.s.w $f12, $f6
    lw      t4, 0x3520(s3)             # 80128B50
    addiu   s2, s2, 0xFFFC             # s2 = 000001F8
    slti    $at, s2, 0x003D
    addu    t5, t4, s0
    addiu   s0, s0, 0x0004             # s0 = 00000044
    beq     $at, $zero, lbl_800B34C0
    swc1    $f0, 0x0000(t5)            # 00000000
    addiu   s0, $zero, 0x0004          # s0 = 00000004
    addiu   s2, $zero, 0x0528          # s2 = 00000528
    addiu   s1, $zero, 0x01A4          # s1 = 000001A4
lbl_800B34F4:
    mtc1    s2, $f8                    # $f8 = 0.00
    jal     func_800B33E0
    cvt.s.w $f12, $f8
    lw      t6, 0x3520(s3)             # 80128B50
    addiu   s2, s2, 0xFFC4             # s2 = 000004EC
    addu    t7, t6, s0
    addiu   s0, s0, 0x0004             # s0 = 00000008
    bne     s1, s2, lbl_800B34F4
    swc1    $f0, 0x0000(t7)            # 00000000
    mtc1    $zero, $f10                # $f10 = 0.00
    lw      t8, 0x3520(s3)             # 80128B50
    swc1    $f10, 0x0000(t8)           # 00000000
    lw      $ra, 0x0024($sp)
    lw      s3, 0x0020($sp)
    lw      s2, 0x001C($sp)
    lw      s1, 0x0018($sp)
    lw      s0, 0x0014($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28


func_800B3540:
# MqDbg: AudioHeap_ResetLoadStatus
    lui     v1, 0x8012                 # v1 = 80120000
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x5660             # v0 = 80125660
    addiu   v1, v1, 0x5630             # v1 = 80125630
    addiu   a0, $zero, 0x0005          # a0 = 00000005
    lbu     t6, 0x3468(v1)             # 80128A98
lbl_800B3558:
    beql    a0, t6, lbl_800B3568
    addiu   v1, v1, 0x0001             # v1 = 80125631
    sb      $zero, 0x3468(v1)          # 80128A99
    addiu   v1, v1, 0x0001             # v1 = 80125632
lbl_800B3568:
    sltu    $at, v1, v0
    bnel    $at, $zero, lbl_800B3558
    lbu     t6, 0x3468(v1)             # 80128A9A
    lui     v1, 0x8012                 # v1 = 80120000
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x5660             # v0 = 80125660
    addiu   v1, v1, 0x5630             # v1 = 80125630
    lbu     t7, 0x3438(v1)             # 80128A68
lbl_800B3588:
    beql    a0, t7, lbl_800B3598
    addiu   v1, v1, 0x0001             # v1 = 80125631
    sb      $zero, 0x3438(v1)          # 80128A69
    addiu   v1, v1, 0x0001             # v1 = 80125632
lbl_800B3598:
    sltu    $at, v1, v0
    bnel    $at, $zero, lbl_800B3588
    lbu     t7, 0x3438(v1)             # 80128A6A
    lui     v1, 0x8012                 # v1 = 80120000
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x56B0             # v0 = 801256B0
    addiu   v1, v1, 0x5630             # v1 = 80125630
    lbu     t8, 0x3498(v1)             # 80128AC8
lbl_800B35B8:
    beql    a0, t8, lbl_800B35C8
    lbu     t9, 0x3499(v1)             # 80128AC9
    sb      $zero, 0x3498(v1)          # 80128AC8
    lbu     t9, 0x3499(v1)             # 80128AC9
lbl_800B35C8:
    beql    a0, t9, lbl_800B35D8
    lbu     t0, 0x349A(v1)             # 80128ACA
    sb      $zero, 0x3499(v1)          # 80128AC9
    lbu     t0, 0x349A(v1)             # 80128ACA
lbl_800B35D8:
    beql    a0, t0, lbl_800B35E8
    lbu     t1, 0x349B(v1)             # 80128ACB
    sb      $zero, 0x349A(v1)          # 80128ACA
    lbu     t1, 0x349B(v1)             # 80128ACB
lbl_800B35E8:
    beql    a0, t1, lbl_800B35F8
    addiu   v1, v1, 0x0004             # v1 = 80125634
    sb      $zero, 0x349B(v1)          # 80128ACF
    addiu   v1, v1, 0x0004             # v1 = 80125638
lbl_800B35F8:
    bnel    v1, v0, lbl_800B35B8
    lbu     t8, 0x3498(v1)             # 80128AD0
    jr      $ra
    nop


func_800B3608:
# MqDbg: AudioHeap_DiscardFont
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      s5, 0x0028($sp)
    lui     s5, 0x8012                 # s5 = 80120000
    addiu   s5, s5, 0x5630             # s5 = 80125630
    lw      v0, 0x2894(s5)             # 80127EC4
    sw      s4, 0x0024($sp)
    sw      s1, 0x0018($sp)
    or      s4, a0, $zero              # s4 = 00000000
    sw      $ra, 0x002C($sp)
    sw      s3, 0x0020($sp)
    sw      s2, 0x001C($sp)
    sw      s0, 0x0014($sp)
    blez    v0, lbl_800B36C8
    or      s1, $zero, $zero           # s1 = 00000000
    lui     s3, 0x8013                 # s3 = 80130000
    addiu   s3, s3, 0xB1C8             # s3 = 8012B1C8
    or      s2, $zero, $zero           # s2 = 00000000
lbl_800B364C:
    lw      t6, 0x352C(s5)             # 80128B5C
    addu    s0, s2, t6
    lbu     t7, 0x0033(s0)             # 00000033
    bnel    s4, t7, lbl_800B36BC
    addiu   s1, s1, 0x0001             # s1 = 00000001
    lbu     t8, 0x0034(s0)             # 00000034
    bne     t8, $zero, lbl_800B3698
    nop
    lbu     t9, 0x0030(s0)             # 00000030
    beq     t9, $zero, lbl_800B3698
    nop
    lw      v0, 0x0044(s0)             # 00000044
    lbu     t0, 0x0000(v0)             # 00000000
    andi    t1, t0, 0xFF7F             # t1 = 00000000
    sb      t1, 0x0000(v0)             # 00000000
    lw      v0, 0x0044(s0)             # 00000044
    lbu     t3, 0x0000(v0)             # 00000000
    ori     t4, t3, 0x0040             # t4 = 00000040
    sb      t4, 0x0000(v0)             # 00000000
lbl_800B3698:
    jal     func_800BC4E8
    or      a0, s0, $zero              # a0 = 00000000
    jal     func_800BD69C
    or      a0, s0, $zero              # a0 = 00000000
    or      a0, s3, $zero              # a0 = 8012B1C8
    jal     func_800BF1E8
    or      a1, s0, $zero              # a1 = 00000000
    lw      v0, 0x2894(s5)             # 80127EC4
    addiu   s1, s1, 0x0001             # s1 = 00000002
lbl_800B36BC:
    slt     $at, s1, v0
    bne     $at, $zero, lbl_800B364C
    addiu   s2, s2, 0x00E0             # s2 = 000000E0
lbl_800B36C8:
    lw      $ra, 0x002C($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    lw      s4, 0x0024($sp)
    lw      s5, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030           # $sp += 0x30


func_800B36EC:
# MqDbg: AudioHeap_ReleaseNotesForFont
    lui     t0, 0x8012                 # t0 = 80120000
    addiu   t0, t0, 0x5630             # t0 = 80125630
    lw      v1, 0x2894(t0)             # 80127EC4
    or      a3, a0, $zero              # a3 = 00000000
    or      v0, $zero, $zero           # v0 = 00000000
    blez    v1, lbl_800B376C
    or      a1, $zero, $zero           # a1 = 00000000
    addiu   t2, $zero, 0x0001          # t2 = 00000001
    addiu   t1, $zero, 0x0006          # t1 = 00000006
lbl_800B3710:
    lw      t6, 0x352C(t0)             # 80128B5C
    addiu   v0, v0, 0x0001             # v0 = 00000001
    addu    a0, a1, t6
    lbu     t7, 0x0033(a0)             # 00000033
    addiu   a2, a0, 0x0030             # a2 = 00000030
    bnel    a3, t7, lbl_800B3764
    slt     $at, v0, v1
    lbu     t8, 0x0000(a2)             # 00000030
    beql    t8, $zero, lbl_800B3764
    slt     $at, v0, v1
    lbu     a0, 0x0040(a2)             # 00000070
    andi    t9, a0, 0x000F             # t9 = 00000000
    bnel    t1, t9, lbl_800B3764
    slt     $at, v0, v1
    sb      t2, 0x0000(a2)             # 00000030
    lwc1    $f4, 0x2864(t0)            # 80127E94
    ori     t4, a0, 0x0010             # t4 = 00000010
    sb      t4, 0x0040(a2)             # 00000070
    swc1    $f4, 0x004C(a2)            # 0000007C
    lw      v1, 0x2894(t0)             # 80127EC4
    slt     $at, v0, v1
lbl_800B3764:
    bne     $at, $zero, lbl_800B3710
    addiu   a1, a1, 0x00E0             # a1 = 000000E0
lbl_800B376C:
    jr      $ra
    nop


func_800B3774:
# MqDbg: AudioHeap_DiscardSequence
    lui     v0, 0x8012                 # v0 = 80120000
    lh      v0, 0x7E8C(v0)             # 80127E8C
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    or      s2, a0, $zero              # s2 = 00000000
    sw      $ra, 0x0024($sp)
    sw      s0, 0x0018($sp)
    blez    v0, lbl_800B37E0
    or      s1, $zero, $zero           # s1 = 00000000
    lui     s0, 0x8012                 # s0 = 80120000
    addiu   s0, s0, 0x5630             # s0 = 80125630
lbl_800B37A4:
    lw      t6, 0x3530(s0)             # 80128B60
    srl     t7, t6, 31
    beql    t7, $zero, lbl_800B37D4
    addiu   s1, s1, 0x0001             # s1 = 00000001
    lbu     t8, 0x3534(s0)             # 80128B64
    bnel    s2, t8, lbl_800B37D4
    addiu   s1, s1, 0x0001             # s1 = 00000002
    jal     func_800BF12C
    addiu   a0, s0, 0x3530             # a0 = 80128B60
    lui     v0, 0x8012                 # v0 = 80120000
    lh      v0, 0x7E8C(v0)             # 80127E8C
    addiu   s1, s1, 0x0001             # s1 = 00000003
lbl_800B37D4:
    slt     $at, s1, v0
    bne     $at, $zero, lbl_800B37A4
    addiu   s0, s0, 0x0160             # s0 = 80125790
lbl_800B37E0:
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28


func_800B37F8:
# MqDbg: AudioHeap_WritebackDCache
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800BBE40
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800B3818:
# MqDbg: AudioHeap_AllocZeroedAttemptExternal
    lui     t6, 0x8012                 # t6 = 80120000
    lw      t6, 0x7FD0(t6)             # 80127FD0
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0018($sp)
    sw      a1, 0x001C($sp)
    beq     t6, $zero, lbl_800B3848
    or      v1, $zero, $zero           # v1 = 00000000
    lui     a0, 0x8012                 # a0 = 80120000
    jal     func_800B3940
    addiu   a0, a0, 0x7FD0             # a0 = 80127FD0
    or      v1, v0, $zero              # v1 = 00000000
lbl_800B3848:
    bne     v1, $zero, lbl_800B385C
    lw      a0, 0x0018($sp)
    jal     func_800B3940
    lw      a1, 0x001C($sp)
    or      v1, v0, $zero              # v1 = 00000000
lbl_800B385C:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    or      v0, v1, $zero              # v0 = 00000000
    jr      $ra
    nop


func_800B3870:
# MqDbg: AudioHeap_AllocAttemptExternal
    lui     t6, 0x8012                 # t6 = 80120000
    lw      t6, 0x7FD0(t6)             # 80127FD0
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0018($sp)
    sw      a1, 0x001C($sp)
    beq     t6, $zero, lbl_800B38A0
    or      v1, $zero, $zero           # v1 = 00000000
    lui     a0, 0x8012                 # a0 = 80120000
    jal     func_800B399C
    addiu   a0, a0, 0x7FD0             # a0 = 80127FD0
    or      v1, v0, $zero              # v1 = 00000000
lbl_800B38A0:
    bne     v1, $zero, lbl_800B38B4
    lw      a0, 0x0018($sp)
    jal     func_800B399C
    lw      a1, 0x001C($sp)
    or      v1, v0, $zero              # v1 = 00000000
lbl_800B38B4:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    or      v0, v1, $zero              # v0 = 00000000
    jr      $ra
    nop


func_800B38C8:
# MqDbg: AudioHeap_AllocDmaMemory
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    jal     func_800B399C
    sw      a1, 0x0024($sp)
    beq     v0, $zero, lbl_800B38F0
    or      a0, v0, $zero              # a0 = 00000000
    lw      a1, 0x0024($sp)
    jal     func_800B37F8
    sw      v0, 0x001C($sp)
    lw      a0, 0x001C($sp)
lbl_800B38F0:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    or      v0, a0, $zero              # v0 = 00000000
    jr      $ra
    nop


func_800B3904:
# MqDbg: AudioHeap_AllocDmaMemoryZeroed
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    jal     func_800B3940
    sw      a1, 0x0024($sp)
    beq     v0, $zero, lbl_800B392C
    or      a0, v0, $zero              # a0 = 00000000
    lw      a1, 0x0024($sp)
    jal     func_800B37F8
    sw      v0, 0x001C($sp)
    lw      a0, 0x001C($sp)
lbl_800B392C:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    or      v0, a0, $zero              # v0 = 00000000
    jr      $ra
    nop


func_800B3940:
# MqDbg: AudioHeap_AllocZeroed
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800B399C
    sw      a0, 0x0018($sp)
    lw      a0, 0x0018($sp)
    beq     v0, $zero, lbl_800B3988
    or      a1, v0, $zero              # a1 = 00000000
    lw      t6, 0x0004(a0)             # 00000004
    or      v1, v0, $zero              # v1 = 00000000
    sltu    $at, v0, t6
    beql    $at, $zero, lbl_800B398C
    lw      $ra, 0x0014($sp)
    sb      $zero, 0x0000(v1)          # 00000000
lbl_800B3974:
    lw      t7, 0x0004(a0)             # 00000004
    addiu   v1, v1, 0x0001             # v1 = 00000001
    sltu    $at, v1, t7
    bnel    $at, $zero, lbl_800B3974
    sb      $zero, 0x0000(v1)          # 00000001
lbl_800B3988:
    lw      $ra, 0x0014($sp)
lbl_800B398C:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    or      v0, a1, $zero              # v0 = 00000000
    jr      $ra
    nop


func_800B399C:
# MqDbg: AudioHeap_Alloc
    lw      a2, 0x0004(a0)             # 00000004
    lw      t6, 0x0000(a0)             # 00000000
    lw      t7, 0x0008(a0)             # 00000008
    addiu   v0, a1, 0x000F             # v0 = 0000000F
    addiu   $at, $zero, 0xFFF0         # $at = FFFFFFF0
    and     v0, v0, $at
    addu    t9, a2, v0
    addu    t8, t6, t7
    sltu    $at, t8, t9
    bne     $at, $zero, lbl_800B39D4
    or      v1, a2, $zero              # v1 = 00000000
    addu    t0, a2, v0
    b       lbl_800B39DC
    sw      t0, 0x0004(a0)             # 00000004
lbl_800B39D4:
    jr      $ra
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B39DC:
    lw      t1, 0x000C(a0)             # 0000000C
    or      v0, v1, $zero              # v0 = 00000000
    addiu   t2, t1, 0x0001             # t2 = 00000001
    sw      t2, 0x000C(a0)             # 0000000C
    jr      $ra
    nop


func_800B39F4:
# MqDbg: AudioHeap_InitPool
    addiu   v0, a1, 0x000F             # v0 = 0000000F
    addiu   $at, $zero, 0xFFF0         # $at = FFFFFFF0
    andi    t6, a1, 0x000F             # t6 = 00000000
    and     v0, v0, $at
    subu    t7, a2, t6
    sw      v0, 0x0000(a0)             # 00000000
    sw      v0, 0x0004(a0)             # 00000004
    sw      t7, 0x0008(a0)             # 00000008
    jr      $ra
    sw      $zero, 0x000C(a0)          # 0000000C


func_800B3A1C:
# MqDbg: AudioHeap_InitPersistentCache
    lw      t6, 0x0004(a0)             # 00000004
    sw      $zero, 0x0010(a0)          # 00000010
    sw      $zero, 0x0000(a0)          # 00000000
    jr      $ra
    sw      t6, 0x0008(a0)             # 00000008


func_800B3A30:
# MqDbg: AudioHeap_InitTemporaryCache
    lw      v0, 0x0004(a0)             # 00000004
    lw      t6, 0x000C(a0)             # 0000000C
    addiu   v1, $zero, 0xFFFF          # v1 = FFFFFFFF
    sw      $zero, 0x0010(a0)          # 00000010
    addu    t7, v0, t6
    sw      $zero, 0x0000(a0)          # 00000000
    sw      t7, 0x0020(a0)             # 00000020
    sh      v1, 0x001E(a0)             # 0000001E
    sh      v1, 0x002A(a0)             # 0000002A
    sw      v0, 0x0008(a0)             # 00000008
    jr      $ra
    sw      v0, 0x0014(a0)             # 00000014


func_800B3A60:
# MqDbg: AudioHeap_ResetPool
    lw      t6, 0x0000(a0)             # 00000000
    sw      $zero, 0x000C(a0)          # 0000000C
    jr      $ra
    sw      t6, 0x0004(a0)             # 00000004


func_800B3A70:
# MqDbg: AudioHeap_PopPersistentCache
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      $ra, 0x0014($sp)
    beq     a0, $zero, lbl_800B3AA0
    or      a2, a0, $zero              # a2 = 00000000
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     a0, $at, lbl_800B3AB8
    lui     v1, 0x8013                 # v1 = 80130000
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     a0, $at, lbl_800B3ACC
    lui     v1, 0x8013                 # v1 = 80130000
    b       lbl_800B3ADC
    lw      v1, 0x002C($sp)
lbl_800B3AA0:
    lui     t6, 0x8013                 # t6 = 80130000
    lui     v1, 0x8013                 # v1 = 80130000
    addiu   t6, t6, 0x8AC8             # t6 = 80128AC8
    addiu   v1, v1, 0x8050             # v1 = 80128050
    b       lbl_800B3ADC
    sw      t6, 0x001C($sp)
lbl_800B3AB8:
    lui     t7, 0x8013                 # t7 = 80130000
    addiu   t7, t7, 0x8A98             # t7 = 80128A98
    addiu   v1, v1, 0x8160             # v1 = 801201B0
    b       lbl_800B3ADC
    sw      t7, 0x001C($sp)
lbl_800B3ACC:
    lui     t8, 0x8013                 # t8 = 80130000
    addiu   t8, t8, 0x8A68             # t8 = 80128A68
    addiu   v1, v1, 0x8270             # v1 = 80118420
    sw      t8, 0x001C($sp)
lbl_800B3ADC:
    lw      a1, 0x0000(v1)             # 80118420
    addiu   v0, v1, 0x0004             # v0 = 80118424
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     a1, $zero, lbl_800B3BA0
    sll     t9, a1,  2
    subu    t9, t9, a1
    lw      t1, 0x000C(v0)             # 80118430
    sll     t9, t9,  2
    addu    t0, v1, t9
    lw      a0, 0x0008(t0)             # 00000008
    addiu   t2, t1, 0xFFFF             # t2 = FFFFFFFF
    sw      t2, 0x000C(v0)             # 80118430
    bne     a2, $at, lbl_800B3B40
    sw      a0, 0x0004(v0)             # 80118428
    lw      t3, 0x0000(v1)             # 80118420
    sll     t4, t3,  2
    subu    t4, t4, t3
    sll     t4, t4,  2
    addu    t5, v1, t4
    lh      a0, 0x0012(t5)             # 00000012
    sw      a2, 0x0030($sp)
    jal     func_800B642C
    sw      v1, 0x002C($sp)
    lw      v1, 0x002C($sp)
    lw      a2, 0x0030($sp)
lbl_800B3B40:
    addiu   $at, $zero, 0x0001         # $at = 00000001
    bnel    a2, $at, lbl_800B3B74
    lw      t0, 0x0000(v1)             # 00000000
    lw      t6, 0x0000(v1)             # 00000000
    sll     t7, t6,  2
    subu    t7, t7, t6
    sll     t7, t7,  2
    addu    t8, v1, t7
    lh      a0, 0x0012(t8)             # 00000012
    jal     func_800B3608
    sw      v1, 0x002C($sp)
    lw      v1, 0x002C($sp)
    lw      t0, 0x0000(v1)             # 00000000
lbl_800B3B74:
    lw      t9, 0x001C($sp)
    sll     t1, t0,  2
    subu    t1, t1, t0
    sll     t1, t1,  2
    addu    t2, v1, t1
    lh      t3, 0x0012(t2)             # 00000012
    addu    t4, t9, t3
    sb      $zero, 0x0000(t4)          # 00000000
    lw      t5, 0x0000(v1)             # 00000000
    addiu   t6, t5, 0xFFFF             # t6 = FFFFFFFF
    sw      t6, 0x0000(v1)             # 00000000
lbl_800B3BA0:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop


func_800B3BB0:
# MqDbg: AudioHeap_InitMainPools
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    or      a2, a0, $zero              # a2 = 00000000
    sw      $ra, 0x0014($sp)
    lui     a0, 0x8012                 # a0 = 80120000
    lui     a1, 0x8013                 # a1 = 80130000
    lw      a1, -0x74AC(a1)            # 80128B54
    addiu   a0, a0, 0x7FE0             # a0 = 80127FE0
    jal     func_800B39F4
    sw      a2, 0x0018($sp)
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x5630             # v0 = 80125630
    lw      a3, 0x0018($sp)
    lw      t6, 0x3524(v0)             # 80128B54
    lw      t7, 0x3528(v0)             # 80128B58
    lui     a0, 0x8012                 # a0 = 80120000
    addiu   a0, a0, 0x7FC0             # a0 = 80127FC0
    addu    a1, t6, a3
    jal     func_800B39F4
    subu    a2, t7, a3
    lw      $ra, 0x0014($sp)
    lui     $at, 0x8012                # $at = 80120000
    sw      $zero, 0x7FD0($at)         # 80127FD0
    jr      $ra
    addiu   $sp, $sp, 0x0018           # $sp += 0x18


func_800B3C10:
# MqDbg: AudioHeap_InitSessionPools
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x5630             # v0 = 80125630
    lw      t6, 0x2990(v0)             # 80127FC0
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      a0, 0x0018($sp)
    lw      t7, 0x0018($sp)
    sw      $ra, 0x0014($sp)
    lui     a0, 0x8012                 # a0 = 80120000
    sw      t6, 0x2994(v0)             # 80127FC4
    addiu   a0, a0, 0x7FC0             # a0 = 80127FC0
    jal     func_800B399C
    lw      a1, 0x0000(t7)             # 00000000
    lw      t8, 0x0018($sp)
    lui     a0, 0x8012                 # a0 = 80120000
    addiu   a0, a0, 0x7FF0             # a0 = 80127FF0
    or      a1, v0, $zero              # a1 = 00000000
    jal     func_800B39F4
    lw      a2, 0x0000(t8)             # 00000000
    lw      t9, 0x0018($sp)
    lui     a0, 0x8012                 # a0 = 80120000
    addiu   a0, a0, 0x7FC0             # a0 = 80127FC0
    jal     func_800B399C
    lw      a1, 0x000C(t9)             # 0000000C
    lw      t0, 0x0018($sp)
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0x8020             # a0 = 80128020
    or      a1, v0, $zero              # a1 = 00000000
    jal     func_800B39F4
    lw      a2, 0x000C(t0)             # 0000000C
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800B3C94:
# MqDbg: AudioHeap_InitCachePools
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x5630             # v0 = 80125630
    lw      t6, 0x29F0(v0)             # 80128020
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      a0, 0x0018($sp)
    lw      t7, 0x0018($sp)
    sw      $ra, 0x0014($sp)
    lui     a0, 0x8013                 # a0 = 80130000
    sw      t6, 0x29F4(v0)             # 80128024
    addiu   a0, a0, 0x8020             # a0 = 80128020
    jal     func_800B399C
    lw      a1, 0x0000(t7)             # 00000000
    lw      t8, 0x0018($sp)
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0x8030             # a0 = 80128030
    or      a1, v0, $zero              # a1 = 00000000
    jal     func_800B39F4
    lw      a2, 0x0000(t8)             # 00000000
    lw      t9, 0x0018($sp)
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0x8020             # a0 = 80128020
    jal     func_800B399C
    lw      a1, 0x0004(t9)             # 00000004
    lw      t0, 0x0018($sp)
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0x8040             # a0 = 80128040
    or      a1, v0, $zero              # a1 = 00000000
    jal     func_800B39F4
    lw      a2, 0x0004(t0)             # 00000004
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800B3D18:
# MqDbg: AudioHeap_InitPersistentPoolsAndCaches
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x5630             # v0 = 80125630
    lw      t6, 0x2A00(v0)             # 80128030
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      s0, 0x0018($sp)
    or      s0, a0, $zero              # s0 = 00000000
    sw      $ra, 0x001C($sp)
    lui     a0, 0x8013                 # a0 = 80130000
    sw      t6, 0x2A04(v0)             # 80128034
    lw      a1, 0x0000(s0)             # 00000000
    jal     func_800B399C
    addiu   a0, a0, 0x8030             # a0 = 80128030
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0x8054             # a0 = 80128054
    or      a1, v0, $zero              # a1 = 00000000
    jal     func_800B39F4
    lw      a2, 0x0000(s0)             # 00000000
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0x8030             # a0 = 80128030
    jal     func_800B399C
    lw      a1, 0x0004(s0)             # 00000004
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0x8164             # a0 = 80128164
    or      a1, v0, $zero              # a1 = 00000000
    jal     func_800B39F4
    lw      a2, 0x0004(s0)             # 00000004
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0x8030             # a0 = 80128030
    jal     func_800B399C
    lw      a1, 0x0008(s0)             # 00000008
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0x8274             # a0 = 80128274
    or      a1, v0, $zero              # a1 = 00000000
    jal     func_800B39F4
    lw      a2, 0x0008(s0)             # 00000008
    lui     a0, 0x8013                 # a0 = 80130000
    jal     func_800B3A1C
    addiu   a0, a0, 0x8050             # a0 = 80128050
    lui     a0, 0x8013                 # a0 = 80130000
    jal     func_800B3A1C
    addiu   a0, a0, 0x8160             # a0 = 80128160
    lui     a0, 0x8013                 # a0 = 80130000
    jal     func_800B3A1C
    addiu   a0, a0, 0x8270             # a0 = 80128270
    lw      $ra, 0x001C($sp)
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800B3DDC:
# MqDbg: AudioHeap_InitTemporaryPoolsAndCaches
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x5630             # v0 = 80125630
    lw      t6, 0x2A10(v0)             # 80128040
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      s0, 0x0018($sp)
    or      s0, a0, $zero              # s0 = 00000000
    sw      $ra, 0x001C($sp)
    lui     a0, 0x8013                 # a0 = 80130000
    sw      t6, 0x2A14(v0)             # 80128044
    lw      a1, 0x0000(s0)             # 00000000
    jal     func_800B399C
    addiu   a0, a0, 0x8040             # a0 = 80128040
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0x8128             # a0 = 80128128
    or      a1, v0, $zero              # a1 = 00000000
    jal     func_800B39F4
    lw      a2, 0x0000(s0)             # 00000000
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0x8040             # a0 = 80128040
    jal     func_800B399C
    lw      a1, 0x0004(s0)             # 00000004
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0x8238             # a0 = 80128238
    or      a1, v0, $zero              # a1 = 00000000
    jal     func_800B39F4
    lw      a2, 0x0004(s0)             # 00000004
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0x8040             # a0 = 80128040
    jal     func_800B399C
    lw      a1, 0x0008(s0)             # 00000008
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0x8348             # a0 = 80128348
    or      a1, v0, $zero              # a1 = 00000000
    jal     func_800B39F4
    lw      a2, 0x0008(s0)             # 00000008
    lui     a0, 0x8013                 # a0 = 80130000
    jal     func_800B3A30
    addiu   a0, a0, 0x8124             # a0 = 80128124
    lui     a0, 0x8013                 # a0 = 80130000
    jal     func_800B3A30
    addiu   a0, a0, 0x8234             # a0 = 80128234
    lui     a0, 0x8013                 # a0 = 80130000
    jal     func_800B3A30
    addiu   a0, a0, 0x8344             # a0 = 80128344
    lw      $ra, 0x001C($sp)
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800B3EA0:
# MqDbg: AudioHeap_AllocCached
    addiu   $sp, $sp, 0xFFB0           # $sp -= 0x50
    sw      s0, 0x0018($sp)
    or      s0, a0, $zero              # s0 = 00000000
    sw      $ra, 0x001C($sp)
    sw      a1, 0x0054($sp)
    sw      a3, 0x005C($sp)
    lw      t3, 0x0030($sp)
    lw      t0, 0x004C($sp)
    addiu   t2, $zero, 0x0002          # t2 = 00000002
    addiu   t1, $zero, 0x0001          # t1 = 00000001
lbl_800B3EC8:
    beq     s0, $zero, lbl_800B3EE8
    lw      a1, 0x0054($sp)
    beq     s0, t1, lbl_800B3EFC
    nop
    beq     s0, t2, lbl_800B3F10
    nop
    b       lbl_800B3F20
    nop
lbl_800B3EE8:
    lui     t0, 0x8013                 # t0 = 80130000
    lui     t3, 0x8013                 # t3 = 80130000
    addiu   t0, t0, 0x8050             # t0 = 80128050
    b       lbl_800B3F20
    addiu   t3, t3, 0x8AC8             # t3 = 80128AC8
lbl_800B3EFC:
    lui     t0, 0x8013                 # t0 = 80130000
    lui     t3, 0x8013                 # t3 = 80130000
    addiu   t0, t0, 0x8160             # t0 = 80128160
    b       lbl_800B3F20
    addiu   t3, t3, 0x8A98             # t3 = 80128A98
lbl_800B3F10:
    lui     t0, 0x8013                 # t0 = 80130000
    lui     t3, 0x8013                 # t3 = 80130000
    addiu   t0, t0, 0x8270             # t0 = 80128270
    addiu   t3, t3, 0x8A68             # t3 = 80128A68
lbl_800B3F20:
    bne     a2, $zero, lbl_800B456C
    addiu   a0, t0, 0x0004             # a0 = 80128274
    lw      t6, 0x00E0(t0)             # 80128350
    lw      t7, 0x0054($sp)
    addiu   a3, t0, 0x00D4             # a3 = 80128344
    slt     $at, t6, t7
    beql    $at, $zero, lbl_800B3F4C
    lh      a2, 0x001E(a3)             # 80128362
    b       lbl_800B4620
    or      v0, $zero, $zero           # v0 = 00000000
    lh      a2, 0x001E(a3)             # 80128362
lbl_800B3F4C:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     a2, $at, lbl_800B3F60
    addu    t8, a2, t3
    b       lbl_800B3F64
    or      t4, $zero, $zero           # t4 = 00000000
lbl_800B3F60:
    lbu     t4, 0x0000(t8)             # 00000000
lbl_800B3F64:
    lh      a0, 0x002A(a3)             # 8012836E
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     a0, $at, lbl_800B3F7C
    addu    t9, a0, t3
    b       lbl_800B3F80
    or      t5, $zero, $zero           # t5 = 00000000
lbl_800B3F7C:
    lbu     t5, 0x0000(t9)             # 00000000
lbl_800B3F80:
    bne     s0, t1, lbl_800B40A0
    addiu   $at, $zero, 0x0004         # $at = 00000004
    bne     t4, $at, lbl_800B400C
    lui     a1, 0x8012                 # a1 = 80120000
    lw      a1, 0x7EC4(a1)             # 80127EC4
    or      v1, $zero, $zero           # v1 = 00000000
    lui     v0, 0x8013                 # v0 = 80130000
    blez    a1, lbl_800B3FD4
    or      a0, a2, $zero              # a0 = 00000000
    lw      v0, -0x74A4(v0)            # 80128B5C
lbl_800B3FA8:
    lbu     t6, 0x0033(v0)             # 80130033
    bnel    t6, a2, lbl_800B3FC8
    addiu   v1, v1, 0x0001             # v1 = 00000001
    lw      t7, 0x00C0(v0)             # 801300C0
    srl     t8, t7, 31
    bne     t8, $zero, lbl_800B3FD4
    nop
    addiu   v1, v1, 0x0001             # v1 = 00000002
lbl_800B3FC8:
    slt     $at, v1, a1
    bne     $at, $zero, lbl_800B3FA8
    addiu   v0, v0, 0x00E0             # v0 = 801300E0
lbl_800B3FD4:
    bne     v1, a1, lbl_800B400C
    addiu   a1, $zero, 0x0003          # a1 = 00000003
    sw      a3, 0x0024($sp)
    sw      t0, 0x004C($sp)
    sw      t3, 0x0030($sp)
    jal     func_800B6FD8
    sb      t5, 0x003A($sp)
    lw      a3, 0x0024($sp)
    lw      t0, 0x004C($sp)
    addiu   t1, $zero, 0x0001          # t1 = 00000001
    addiu   t2, $zero, 0x0002          # t2 = 00000002
    lw      t3, 0x0030($sp)
    lbu     t5, 0x003A($sp)
    addiu   t4, $zero, 0x0003          # t4 = 00000003
lbl_800B400C:
    addiu   $at, $zero, 0x0004         # $at = 00000004
    bne     t5, $at, lbl_800B40A0
    lui     a1, 0x8012                 # a1 = 80120000
    lw      a1, 0x7EC4(a1)             # 80127EC4
    or      v1, $zero, $zero           # v1 = 00000000
    lui     v0, 0x8013                 # v0 = 80130000
    blez    a1, lbl_800B4060
    nop
    lw      v0, -0x74A4(v0)            # 80128B5C
    lh      a0, 0x002A(a3)             # 0000002A
lbl_800B4034:
    lbu     t9, 0x0033(v0)             # 80130033
    bnel    t9, a0, lbl_800B4054
    addiu   v1, v1, 0x0001             # v1 = 00000001
    lw      t6, 0x00C0(v0)             # 801300C0
    srl     t7, t6, 31
    bne     t7, $zero, lbl_800B4060
    nop
    addiu   v1, v1, 0x0001             # v1 = 00000002
lbl_800B4054:
    slt     $at, v1, a1
    bne     $at, $zero, lbl_800B4034
    addiu   v0, v0, 0x00E0             # v0 = 801300E0
lbl_800B4060:
    bne     v1, a1, lbl_800B40A0
    nop
    lh      a0, 0x002A(a3)             # 0000002A
    sb      t4, 0x003B($sp)
    sw      t3, 0x0030($sp)
    sw      t0, 0x004C($sp)
    sw      a3, 0x0024($sp)
    jal     func_800B6FD8
    addiu   a1, $zero, 0x0003          # a1 = 00000003
    lw      a3, 0x0024($sp)
    lw      t0, 0x004C($sp)
    addiu   t1, $zero, 0x0001          # t1 = 00000001
    addiu   t2, $zero, 0x0002          # t2 = 00000002
    lw      t3, 0x0030($sp)
    lbu     t4, 0x003B($sp)
    addiu   t5, $zero, 0x0003          # t5 = 00000003
lbl_800B40A0:
    bne     t4, $zero, lbl_800B40B4
    or      $ra, t4, $zero             # $ra = 00000000
    sw      $zero, 0x0000(a3)          # 00000000
    b       lbl_800B42D4
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B40B4:
    bne     t5, $zero, lbl_800B40C8
    or      t4, t5, $zero              # t4 = 00000003
    addiu   v0, $zero, 0x0001          # v0 = 00000001
    b       lbl_800B42D4
    sw      v0, 0x0000(a3)             # 00000000
lbl_800B40C8:
    addiu   v0, $zero, 0x0003          # v0 = 00000003
    bne     v0, $ra, lbl_800B40E4
    nop
    bne     v0, t4, lbl_800B40E4
    nop
    b       lbl_800B42D4
    lw      v0, 0x0000(a3)             # 00000000
lbl_800B40E4:
    bne     v0, $ra, lbl_800B40F8
    nop
    sw      $zero, 0x0000(a3)          # 00000000
    b       lbl_800B42D4
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B40F8:
    bne     v0, t4, lbl_800B4108
    addiu   v0, $zero, 0x0001          # v0 = 00000001
    b       lbl_800B42D4
    sw      v0, 0x0000(a3)             # 00000000
lbl_800B4108:
    bne     s0, $zero, lbl_800B41C8
    nop
    bne     t2, $ra, lbl_800B416C
    lui     a0, 0x8012                 # a0 = 80120000
    lh      a0, 0x7E8C(a0)             # 80127E8C
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x5630             # v0 = 80125630
    blez    a0, lbl_800B415C
    or      v1, $zero, $zero           # v1 = 00000000
lbl_800B412C:
    lw      t6, 0x3530(v0)             # 80128B60
    srl     t7, t6, 31
    beql    t7, $zero, lbl_800B4150
    addiu   v1, v1, 0x0001             # v1 = 00000001
    lbu     t8, 0x3534(v0)             # 80128B64
    lh      t9, 0x001E(a3)             # 0000001E
    beq     t8, t9, lbl_800B415C
    nop
    addiu   v1, v1, 0x0001             # v1 = 00000002
lbl_800B4150:
    slt     $at, v1, a0
    bne     $at, $zero, lbl_800B412C
    addiu   v0, v0, 0x0160             # v0 = 80125790
lbl_800B415C:
    bne     v1, a0, lbl_800B416C
    or      v0, $zero, $zero           # v0 = 00000000
    b       lbl_800B42D4
    sw      $zero, 0x0000(a3)          # 00000000
lbl_800B416C:
    bne     t2, t4, lbl_800B4290
    lui     a0, 0x8012                 # a0 = 80120000
    lh      a0, 0x7E8C(a0)             # 80127E8C
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x5630             # v0 = 80125630
    blez    a0, lbl_800B41B8
    or      v1, $zero, $zero           # v1 = 00000000
lbl_800B4188:
    lw      t6, 0x3530(v0)             # 80128B60
    srl     t7, t6, 31
    beql    t7, $zero, lbl_800B41AC
    addiu   v1, v1, 0x0001             # v1 = 00000001
    lbu     t8, 0x3534(v0)             # 80128B64
    lh      t9, 0x002A(a3)             # 0000002A
    beq     t8, t9, lbl_800B41B8
    nop
    addiu   v1, v1, 0x0001             # v1 = 00000002
lbl_800B41AC:
    slt     $at, v1, a0
    bne     $at, $zero, lbl_800B4188
    addiu   v0, v0, 0x0160             # v0 = 80125790
lbl_800B41B8:
    bne     v1, a0, lbl_800B4290
    addiu   v0, $zero, 0x0001          # v0 = 00000001
    b       lbl_800B42D4
    sw      v0, 0x0000(a3)             # 00000000
lbl_800B41C8:
    bnel    s0, t1, lbl_800B4294
    lw      v0, 0x0000(a3)             # 00000000
    bne     t2, $ra, lbl_800B4230
    lui     a1, 0x8012                 # a1 = 80120000
    lw      a1, 0x7EC4(a1)             # 80127EC4
    or      v1, $zero, $zero           # v1 = 00000000
    lui     v0, 0x8013                 # v0 = 80130000
    blez    a1, lbl_800B4220
    nop
    lw      v0, -0x74A4(v0)            # 80128B5C
    lh      a2, 0x001E(a3)             # 0000001E
lbl_800B41F4:
    lbu     t7, 0x0033(v0)             # 80130033
    bnel    t7, a2, lbl_800B4214
    addiu   v1, v1, 0x0001             # v1 = 00000001
    lw      t8, 0x00C0(v0)             # 801300C0
    srl     t9, t8, 31
    bne     t9, $zero, lbl_800B4220
    nop
    addiu   v1, v1, 0x0001             # v1 = 00000002
lbl_800B4214:
    slt     $at, v1, a1
    bne     $at, $zero, lbl_800B41F4
    addiu   v0, v0, 0x00E0             # v0 = 801300E0
lbl_800B4220:
    bne     v1, a1, lbl_800B4230
    or      v0, $zero, $zero           # v0 = 00000000
    b       lbl_800B42D4
    sw      $zero, 0x0000(a3)          # 00000000
lbl_800B4230:
    bne     t2, t4, lbl_800B4290
    lui     a1, 0x8012                 # a1 = 80120000
    lw      a1, 0x7EC4(a1)             # 80127EC4
    or      v1, $zero, $zero           # v1 = 00000000
    lui     v0, 0x8013                 # v0 = 80130000
    blez    a1, lbl_800B4280
    nop
    lw      v0, -0x74A4(v0)            # 80128B5C
    lh      a0, 0x002A(a3)             # 0000002A
lbl_800B4254:
    lbu     t6, 0x0033(v0)             # 80130033
    bnel    t6, a0, lbl_800B4274
    addiu   v1, v1, 0x0001             # v1 = 00000001
    lw      t7, 0x00C0(v0)             # 801300C0
    srl     t8, t7, 31
    bne     t8, $zero, lbl_800B4280
    nop
    addiu   v1, v1, 0x0001             # v1 = 00000002
lbl_800B4274:
    slt     $at, v1, a1
    bne     $at, $zero, lbl_800B4254
    addiu   v0, v0, 0x00E0             # v0 = 801300E0
lbl_800B4280:
    bne     v1, a1, lbl_800B4290
    addiu   v0, $zero, 0x0001          # v0 = 00000001
    b       lbl_800B42D4
    sw      v0, 0x0000(a3)             # 00000000
lbl_800B4290:
    lw      v0, 0x0000(a3)             # 00000000
lbl_800B4294:
    bne     v0, $zero, lbl_800B42B4
    nop
    bnel    t1, $ra, lbl_800B42D8
    sll     t7, v0,  2
    beq     t1, t4, lbl_800B42CC
    addiu   v0, $zero, 0x0001          # v0 = 00000001
    b       lbl_800B42D4
    sw      v0, 0x0000(a3)             # 00000000
lbl_800B42B4:
    bnel    t1, t4, lbl_800B42D8
    sll     t7, v0,  2
    beq     t1, $ra, lbl_800B42CC
    or      v0, $zero, $zero           # v0 = 00000000
    b       lbl_800B42D4
    sw      $zero, 0x0000(a3)          # 00000000
lbl_800B42CC:
    b       lbl_800B4620
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B42D4:
    sll     t7, v0,  2
lbl_800B42D8:
    subu    t7, t7, v0
    sll     t7, t7,  2
    addu    a1, a3, t7
    lh      a0, 0x001E(a1)             # 8012001E
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    or      v1, v0, $zero              # v1 = 00000000
    beq     a0, $at, lbl_800B4374
    nop
    bnel    s0, t2, lbl_800B433C
    addu    t8, t3, a0
    sw      v0, 0x002C($sp)
    sw      a1, 0x0020($sp)
    sw      a3, 0x0024($sp)
    sw      t0, 0x004C($sp)
    jal     func_800B642C
    sw      t3, 0x0030($sp)
    lw      a1, 0x0020($sp)
    lw      v1, 0x002C($sp)
    lw      a3, 0x0024($sp)
    lw      t0, 0x004C($sp)
    addiu   t1, $zero, 0x0001          # t1 = 00000001
    addiu   t2, $zero, 0x0002          # t2 = 00000002
    lw      t3, 0x0030($sp)
    lh      a0, 0x001E(a1)             # 0000001E
    addu    t8, t3, a0
lbl_800B433C:
    bne     s0, t1, lbl_800B4374
    sb      $zero, 0x0000(t8)          # 00000000
    lh      a0, 0x001E(a1)             # 0000001E
    sw      t3, 0x0030($sp)
    sw      t0, 0x004C($sp)
    sw      a3, 0x0024($sp)
    jal     func_800B3608
    sw      v1, 0x002C($sp)
    lw      v1, 0x002C($sp)
    lw      a3, 0x0024($sp)
    lw      t0, 0x004C($sp)
    addiu   t1, $zero, 0x0001          # t1 = 00000001
    addiu   t2, $zero, 0x0002          # t2 = 00000002
    lw      t3, 0x0030($sp)
lbl_800B4374:
    beq     v1, $zero, lbl_800B438C
    addiu   v0, t0, 0x00D8             # v0 = 000000D8
    beq     v1, t1, lbl_800B4480
    addiu   v0, t0, 0x00D8             # v0 = 000000D8
    b       lbl_800B4620
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B438C:
    lw      t9, 0x0000(v0)             # 00000000
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    sw      t9, 0x0014(a3)             # 00000014
    lw      t6, 0x005C($sp)
    sh      t6, 0x001E(a3)             # 0000001E
    lw      t7, 0x0054($sp)
    sw      t7, 0x0018(a3)             # 00000018
    lw      t9, 0x0054($sp)
    lw      t8, 0x0000(v0)             # 00000000
    addu    t6, t8, t9
    sw      t6, 0x0004(v0)             # 00000004
    lh      a0, 0x002A(a3)             # 0000002A
    beql    a0, $at, lbl_800B446C
    lw      v1, 0x0014(a3)             # 00000014
    lw      t7, 0x0020(a3)             # 00000020
    sltu    $at, t7, t6
    beql    $at, $zero, lbl_800B446C
    lw      v1, 0x0014(a3)             # 00000014
    bnel    s0, t2, lbl_800B4404
    addu    t9, t3, a0
    sw      v0, 0x0020($sp)
    sw      a3, 0x0024($sp)
    jal     func_800B642C
    sw      t3, 0x0030($sp)
    lw      a3, 0x0024($sp)
    lw      v0, 0x0020($sp)
    addiu   t1, $zero, 0x0001          # t1 = 00000001
    lw      t3, 0x0030($sp)
    lh      a0, 0x002A(a3)             # 0000002A
    addu    t9, t3, a0
lbl_800B4404:
    beq     s0, $zero, lbl_800B441C
    sb      $zero, 0x0000(t9)          # 00000000
    beql    s0, t1, lbl_800B443C
    lh      a0, 0x002A(a3)             # 0000002A
    b       lbl_800B4454
    addiu   t6, $zero, 0xFFFF          # t6 = FFFFFFFF
lbl_800B441C:
    lh      a0, 0x002A(a3)             # 0000002A
    sw      a3, 0x0024($sp)
    jal     func_800B3774
    sw      v0, 0x0020($sp)
    lw      v0, 0x0020($sp)
    b       lbl_800B4450
    lw      a3, 0x0024($sp)
    lh      a0, 0x002A(a3)             # 0000002A
lbl_800B443C:
    sw      a3, 0x0024($sp)
    jal     func_800B3608
    sw      v0, 0x0020($sp)
    lw      v0, 0x0020($sp)
    lw      a3, 0x0024($sp)
lbl_800B4450:
    addiu   t6, $zero, 0xFFFF          # t6 = FFFFFFFF
lbl_800B4454:
    sh      t6, 0x002A(a3)             # 0000002A
    lw      t8, 0x0008(v0)             # 00000008
    lw      t7, 0x0000(v0)             # 00000000
    addu    t9, t7, t8
    sw      t9, 0x0020(a3)             # 00000020
    lw      v1, 0x0014(a3)             # 00000014
lbl_800B446C:
    lw      t6, 0x0000(a3)             # 00000000
    or      v0, v1, $zero              # v0 = 00000000
    xori    t7, t6, 0x0001             # t7 = FFFFFFFE
    b       lbl_800B4620
    sw      t7, 0x0000(a3)             # 00000000
lbl_800B4480:
    lw      t8, 0x0000(v0)             # 00000000
    lw      t9, 0x0008(v0)             # 00000008
    lw      t7, 0x0054($sp)
    addiu   $at, $zero, 0xFFF0         # $at = FFFFFFF0
    addu    t6, t8, t9
    subu    t8, t6, t7
    and     t9, t8, $at
    sw      t9, 0x0020(a3)             # 00000020
    lw      t6, 0x005C($sp)
    lh      a2, 0x001E(a3)             # 0000001E
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    sh      t6, 0x002A(a3)             # 0000002A
    lw      t7, 0x0054($sp)
    or      t8, t9, $zero              # t8 = 00000000
    beq     a2, $at, lbl_800B455C
    sw      t7, 0x0024(a3)             # 00000024
    lw      t9, 0x0004(v0)             # 00000004
    sltu    $at, t8, t9
    beq     $at, $zero, lbl_800B455C
    nop
    bne     s0, t2, lbl_800B44FC
    or      a0, a2, $zero              # a0 = 00000000
    sw      v0, 0x0020($sp)
    sw      a3, 0x0024($sp)
    jal     func_800B642C
    sw      t3, 0x0030($sp)
    lw      a3, 0x0024($sp)
    lw      v0, 0x0020($sp)
    addiu   t1, $zero, 0x0001          # t1 = 00000001
    lw      t3, 0x0030($sp)
    lh      a2, 0x001E(a3)             # 0000001E
lbl_800B44FC:
    addu    t6, t3, a2
    beq     s0, $zero, lbl_800B4518
    sb      $zero, 0x0000(t6)          # 00000000
    beql    s0, t1, lbl_800B4538
    lh      a0, 0x001E(a3)             # 0000001E
    b       lbl_800B4550
    addiu   t7, $zero, 0xFFFF          # t7 = FFFFFFFF
lbl_800B4518:
    lh      a0, 0x001E(a3)             # 0000001E
    sw      a3, 0x0024($sp)
    jal     func_800B3774
    sw      v0, 0x0020($sp)
    lw      v0, 0x0020($sp)
    b       lbl_800B454C
    lw      a3, 0x0024($sp)
    lh      a0, 0x001E(a3)             # 0000001E
lbl_800B4538:
    sw      a3, 0x0024($sp)
    jal     func_800B3608
    sw      v0, 0x0020($sp)
    lw      v0, 0x0020($sp)
    lw      a3, 0x0024($sp)
lbl_800B454C:
    addiu   t7, $zero, 0xFFFF          # t7 = FFFFFFFF
lbl_800B4550:
    sh      t7, 0x001E(a3)             # 0000001E
    lw      t8, 0x0000(v0)             # 00000000
    sw      t8, 0x0004(v0)             # 00000004
lbl_800B455C:
    b       lbl_800B446C
    lw      v1, 0x0020(a3)             # 00000020
    b       lbl_800B4620
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B456C:
    sw      a2, 0x0058($sp)
    sw      t0, 0x004C($sp)
    jal     func_800B399C
    sw      t3, 0x0030($sp)
    lw      t0, 0x004C($sp)
    addiu   a3, $zero, 0x000C          # a3 = 0000000C
    lw      a2, 0x0058($sp)
    lw      t9, 0x0000(t0)             # 00000000
    lw      t3, 0x0030($sp)
    addiu   t1, $zero, 0x0001          # t1 = 00000001
    multu   t9, a3
    addiu   t2, $zero, 0x0002          # t2 = 00000002
    mflo    t6
    addu    t7, t0, t6
    bne     v0, $zero, lbl_800B45D4
    sw      v0, 0x0014(t7)             # 00000014
    beq     a2, $zero, lbl_800B45CC
    nop
    beq     a2, t1, lbl_800B45CC
    nop
    bnel    a2, t2, lbl_800B45D8
    lw      t9, 0x0000(t0)             # 00000000
    b       lbl_800B3EC8
    or      a2, $zero, $zero           # a2 = 00000000
lbl_800B45CC:
    b       lbl_800B4620
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B45D4:
    lw      t9, 0x0000(t0)             # 00000000
lbl_800B45D8:
    lw      t8, 0x005C($sp)
    multu   t9, a3
    mflo    t6
    addu    t7, t0, t6
    sh      t8, 0x001E(t7)             # 0000001E
    lw      t6, 0x0000(t0)             # 00000000
    lw      t9, 0x0054($sp)
    multu   t6, a3
    mflo    t8
    addu    t7, t0, t8
    sw      t9, 0x0018(t7)             # 00000018
    lw      v1, 0x0000(t0)             # 00000000
    multu   v1, a3
    addiu   t9, v1, 0x0001             # t9 = 00000001
    mflo    t6
    addu    t8, t0, t6
    lw      v0, 0x0014(t8)             # 00000014
    sw      t9, 0x0000(t0)             # 00000000
lbl_800B4620:
    lw      $ra, 0x001C($sp)
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0050           # $sp += 0x50
    jr      $ra
    nop


func_800B4634:
# MqDbg: AudioHeap_SearchCaches
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    sw      a1, 0x001C($sp)
    sw      a0, 0x0018($sp)
    sw      a2, 0x0020($sp)
    jal     func_800B5AA8
    or      a1, a2, $zero              # a1 = 00000000
    beq     v0, $zero, lbl_800B4660
    lw      a1, 0x001C($sp)
    b       lbl_800B4680
    lw      $ra, 0x0014($sp)
lbl_800B4660:
    addiu   $at, $zero, 0x0003         # $at = 00000003
    bne     a1, $at, lbl_800B4674
    lw      a0, 0x0018($sp)
    b       lbl_800B467C
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B4674:
    jal     func_800B468C
    lw      a2, 0x0020($sp)
lbl_800B467C:
    lw      $ra, 0x0014($sp)
lbl_800B4680:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800B468C:
# MqDbg: AudioHeap_SearchRegularCaches
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    sw      a1, 0x0024($sp)
    beq     a0, $zero, lbl_800B46C0
    or      a3, a0, $zero              # a3 = 00000000
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     a0, $at, lbl_800B46CC
    lui     a1, 0x8013                 # a1 = 80130000
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     a0, $at, lbl_800B46D4
    lui     a1, 0x8013                 # a1 = 80130000
    b       lbl_800B46D8
    lw      a1, 0x0018($sp)
lbl_800B46C0:
    lui     a1, 0x8013                 # a1 = 80130000
    b       lbl_800B46D8
    addiu   a1, a1, 0x8050             # a1 = 80128050
lbl_800B46CC:
    b       lbl_800B46D8
    addiu   a1, a1, 0x8160             # a1 = 801201B0
lbl_800B46D4:
    addiu   a1, a1, 0x8270             # a1 = 80118420
lbl_800B46D8:
    lw      t6, 0x0024($sp)
    addiu   v1, a1, 0x00D4             # v1 = 801184F4
    bnel    t6, $zero, lbl_800B4728
    lw      t0, 0x0000(a1)             # 80118420
    lh      t7, 0x001E(v1)             # 80118512
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    bnel    a2, t7, lbl_800B4708
    lh      t9, 0x002A(v1)             # 8011851E
    sw      t8, 0x0000(v1)             # 801184F4
    b       lbl_800B4788
    lw      v0, 0x0014(v1)             # 80118508
    lh      t9, 0x002A(v1)             # 8011851E
lbl_800B4708:
    bne     a2, t9, lbl_800B471C
    nop
    sw      $zero, 0x0000(v1)          # 801184F4
    b       lbl_800B4788
    lw      v0, 0x0020(v1)             # 80118514
lbl_800B471C:
    b       lbl_800B4788
    or      v0, $zero, $zero           # v0 = 00000000
    lw      t0, 0x0000(a1)             # 80118420
lbl_800B4728:
    or      a0, a1, $zero              # a0 = 80118420
    or      v0, $zero, $zero           # v0 = 00000000
    beq     t0, $zero, lbl_800B4764
    or      v1, a1, $zero              # v1 = 80118420
    lh      t1, 0x001E(v1)             # 8011843E
lbl_800B473C:
    bnel    a2, t1, lbl_800B4750
    lw      t2, 0x0000(a0)             # 80118420
    b       lbl_800B4788
    lw      v0, 0x0014(v1)             # 80118434
    lw      t2, 0x0000(a0)             # 80118420
lbl_800B4750:
    addiu   v0, v0, 0x0001             # v0 = 00000001
    addiu   v1, v1, 0x000C             # v1 = 8011842C
    sltu    $at, v0, t2
    bnel    $at, $zero, lbl_800B473C
    lh      t1, 0x001E(v1)             # 8011844A
lbl_800B4764:
    lw      t3, 0x0024($sp)
    addiu   $at, $zero, 0x0002         # $at = 00000002
    or      a0, a3, $zero              # a0 = 00000000
    bne     t3, $at, lbl_800B4788
    or      v0, $zero, $zero           # v0 = 00000000
    jal     func_800B4634
    or      a1, $zero, $zero           # a1 = 00000000
    b       lbl_800B478C
    lw      $ra, 0x0014($sp)
lbl_800B4788:
    lw      $ra, 0x0014($sp)
lbl_800B478C:
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800B4798:
# MqDbg: func_800DF1D8
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f0, -0x6828($at)          # 801097D8
    addiu   $sp, $sp, 0xFFB0           # $sp -= 0x50
    addiu   a0, $sp, 0x0014            # a0 = FFFFFFC4
    mul.s   $f4, $f14, $f0
    addiu   v0, $sp, 0x002C            # v0 = FFFFFFDC
    addiu   v1, a2, 0x0004             # v1 = 00000004
    mul.s   $f6, $f12, $f0
    nop
    mul.s   $f8, $f14, $f12
    swc1    $f4, 0x000C($sp)
    swc1    $f6, 0x002C($sp)
    mul.s   $f10, $f8, $f0
    nop
    mul.s   $f16, $f12, $f12
    swc1    $f10, 0x0010($sp)
    add.s   $f18, $f16, $f14
    mul.s   $f4, $f18, $f0
    swc1    $f4, 0x0030($sp)
lbl_800B47E4:
    lwc1    $f6, -0x0004(a0)           # FFFFFFC0
    lwc1    $f10, -0x0008(a0)          # FFFFFFBC
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    mul.s   $f8, $f6, $f12
    lui     $at, 0x4F00                # $at = 4F000000
    mul.s   $f16, $f14, $f10
    add.s   $f18, $f8, $f16
    cfc1    t6, $f31
    ctc1    t7, $f31
    nop
    cvt.w.s $f4, $f18
    cfc1    t7, $f31
    nop
    andi    t7, t7, 0x0078             # t7 = 00000000
    beql    t7, $zero, lbl_800B486C
    mfc1    t7, $f4
    mtc1    $at, $f4                   # $f4 = 2147484000.00
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    sub.s   $f4, $f18, $f4
    ctc1    t7, $f31
    nop
    cvt.w.s $f4, $f4
    cfc1    t7, $f31
    nop
    andi    t7, t7, 0x0078             # t7 = 00000000
    bne     t7, $zero, lbl_800B4860
    nop
    mfc1    t7, $f4
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800B4878
    or      t7, t7, $at                # t7 = 80000000
lbl_800B4860:
    b       lbl_800B4878
    addiu   t7, $zero, 0xFFFF          # t7 = FFFFFFFF
    mfc1    t7, $f4
lbl_800B486C:
    nop
    bltz    t7, lbl_800B4860
    nop
lbl_800B4878:
    sh      t7, 0x0000(v1)             # 00000004
    ctc1    t6, $f31
    lwc1    $f6, 0x001C(a0)            # FFFFFFE0
    lwc1    $f8, 0x0018(a0)            # FFFFFFDC
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    mul.s   $f10, $f6, $f12
    addiu   a0, a0, 0x0004             # a0 = FFFFFFC8
    lui     $at, 0x4F00                # $at = 4F000000
    mul.s   $f16, $f14, $f8
    add.s   $f18, $f10, $f16
    cfc1    t8, $f31
    ctc1    t9, $f31
    nop
    cvt.w.s $f4, $f18
    cfc1    t9, $f31
    nop
    andi    t9, t9, 0x0078             # t9 = 00000000
    beql    t9, $zero, lbl_800B490C
    mfc1    t9, $f4
    mtc1    $at, $f4                   # $f4 = 2147484000.00
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    sub.s   $f4, $f18, $f4
    ctc1    t9, $f31
    nop
    cvt.w.s $f4, $f4
    cfc1    t9, $f31
    nop
    andi    t9, t9, 0x0078             # t9 = 00000000
    bne     t9, $zero, lbl_800B4900
    nop
    mfc1    t9, $f4
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800B4918
    or      t9, t9, $at                # t9 = 80000000
lbl_800B4900:
    b       lbl_800B4918
    addiu   t9, $zero, 0xFFFF          # t9 = FFFFFFFF
    mfc1    t9, $f4
lbl_800B490C:
    nop
    bltz    t9, lbl_800B4900
    nop
lbl_800B4918:
    sltu    $at, a0, v0
    ctc1    t8, $f31
    addiu   v1, v1, 0x0002             # v1 = 00000006
    bne     $at, $zero, lbl_800B47E4
    sh      t9, 0x000E(v1)             # 00000014
    or      v1, a2, $zero              # v1 = 00000000
    addiu   a0, $sp, 0x000C            # a0 = FFFFFFBC
    addiu   v0, $sp, 0x004C            # v0 = FFFFFFFC
lbl_800B4938:
    cfc1    t0, $f31
    addiu   t1, $zero, 0x0001          # t1 = 00000001
    ctc1    t1, $f31
    lwc1    $f6, 0x0000(a0)            # FFFFFFBC
    lui     $at, 0x4F00                # $at = 4F000000
    cvt.w.s $f8, $f6
    cfc1    t1, $f31
    nop
    andi    t1, t1, 0x0078             # t1 = 00000000
    beql    t1, $zero, lbl_800B49AC
    mfc1    t1, $f8
    mtc1    $at, $f8                   # $f8 = 2147484000.00
    addiu   t1, $zero, 0x0001          # t1 = 00000001
    sub.s   $f8, $f6, $f8
    ctc1    t1, $f31
    nop
    cvt.w.s $f8, $f8
    cfc1    t1, $f31
    nop
    andi    t1, t1, 0x0078             # t1 = 00000000
    bne     t1, $zero, lbl_800B49A0
    nop
    mfc1    t1, $f8
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800B49B8
    or      t1, t1, $at                # t1 = 80000000
lbl_800B49A0:
    b       lbl_800B49B8
    addiu   t1, $zero, 0xFFFF          # t1 = FFFFFFFF
    mfc1    t1, $f8
lbl_800B49AC:
    nop
    bltz    t1, lbl_800B49A0
    nop
lbl_800B49B8:
    ctc1    t0, $f31
    addiu   t3, $zero, 0x0001          # t3 = 00000001
    sh      t1, 0x0000(v1)             # 00000000
    lwc1    $f10, 0x0004(a0)           # FFFFFFC0
    cfc1    t2, $f31
    ctc1    t3, $f31
    lui     $at, 0x4F00                # $at = 4F000000
    cvt.w.s $f16, $f10
    cfc1    t3, $f31
    nop
    andi    t3, t3, 0x0078             # t3 = 00000000
    beql    t3, $zero, lbl_800B4A34
    mfc1    t3, $f16
    mtc1    $at, $f16                  # $f16 = 2147484000.00
    addiu   t3, $zero, 0x0001          # t3 = 00000001
    sub.s   $f16, $f10, $f16
    ctc1    t3, $f31
    nop
    cvt.w.s $f16, $f16
    cfc1    t3, $f31
    nop
    andi    t3, t3, 0x0078             # t3 = 00000000
    bne     t3, $zero, lbl_800B4A28
    nop
    mfc1    t3, $f16
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800B4A40
    or      t3, t3, $at                # t3 = 80000000
lbl_800B4A28:
    b       lbl_800B4A40
    addiu   t3, $zero, 0xFFFF          # t3 = FFFFFFFF
    mfc1    t3, $f16
lbl_800B4A34:
    nop
    bltz    t3, lbl_800B4A28
    nop
lbl_800B4A40:
    ctc1    t2, $f31
    sh      t3, 0x0002(v1)             # 00000002
    addiu   t5, $zero, 0x0001          # t5 = 00000001
    lwc1    $f18, 0x0008(a0)           # FFFFFFC4
    cfc1    t4, $f31
    ctc1    t5, $f31
    lui     $at, 0x4F00                # $at = 4F000000
    cvt.w.s $f4, $f18
    cfc1    t5, $f31
    nop
    andi    t5, t5, 0x0078             # t5 = 00000000
    beql    t5, $zero, lbl_800B4ABC
    mfc1    t5, $f4
    mtc1    $at, $f4                   # $f4 = 2147484000.00
    addiu   t5, $zero, 0x0001          # t5 = 00000001
    sub.s   $f4, $f18, $f4
    ctc1    t5, $f31
    nop
    cvt.w.s $f4, $f4
    cfc1    t5, $f31
    nop
    andi    t5, t5, 0x0078             # t5 = 00000000
    bne     t5, $zero, lbl_800B4AB0
    nop
    mfc1    t5, $f4
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800B4AC8
    or      t5, t5, $at                # t5 = 80000000
lbl_800B4AB0:
    b       lbl_800B4AC8
    addiu   t5, $zero, 0xFFFF          # t5 = FFFFFFFF
    mfc1    t5, $f4
lbl_800B4ABC:
    nop
    bltz    t5, lbl_800B4AB0
    nop
lbl_800B4AC8:
    ctc1    t4, $f31
    sh      t5, 0x0004(v1)             # 00000004
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    lwc1    $f6, 0x000C(a0)            # FFFFFFC8
    cfc1    t6, $f31
    ctc1    t7, $f31
    addiu   a0, a0, 0x0010             # a0 = FFFFFFCC
    lui     $at, 0x4F00                # $at = 4F000000
    cvt.w.s $f8, $f6
    cfc1    t7, $f31
    nop
    andi    t7, t7, 0x0078             # t7 = 00000000
    beql    t7, $zero, lbl_800B4B48
    mfc1    t7, $f8
    mtc1    $at, $f8                   # $f8 = 2147484000.00
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    sub.s   $f8, $f6, $f8
    ctc1    t7, $f31
    nop
    cvt.w.s $f8, $f8
    cfc1    t7, $f31
    nop
    andi    t7, t7, 0x0078             # t7 = 00000000
    bne     t7, $zero, lbl_800B4B3C
    nop
    mfc1    t7, $f8
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800B4B54
    or      t7, t7, $at                # t7 = 80000000
lbl_800B4B3C:
    b       lbl_800B4B54
    addiu   t7, $zero, 0xFFFF          # t7 = FFFFFFFF
    mfc1    t7, $f8
lbl_800B4B48:
    nop
    bltz    t7, lbl_800B4B3C
    nop
lbl_800B4B54:
    ctc1    t6, $f31
    sh      t7, 0x0006(v1)             # 00000006
    bne     a0, v0, lbl_800B4938
    addiu   v1, v1, 0x0008             # v1 = 00000008
    jr      $ra
    addiu   $sp, $sp, 0x0050           # $sp += 0x50


func_800B4B6C:
# MqDbg: AudioHeap_ClearFilter
    or      v1, a0, $zero              # v1 = 00000000
    addiu   a0, $zero, 0x0008          # a0 = 00000008
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B4B78:
    addiu   v0, v0, 0x0004             # v0 = 00000004
    sh      $zero, 0x0002(v1)          # 00000002
    sh      $zero, 0x0004(v1)          # 00000004
    sh      $zero, 0x0006(v1)          # 00000006
    addiu   v1, v1, 0x0008             # v1 = 00000008
    bne     v0, a0, lbl_800B4B78
    sh      $zero, -0x0008(v1)         # 00000000
    jr      $ra
    nop


func_800B4B9C:
# MqDbg: AudioHeap_LoadLowPassFilter
    lui     t8, 0x8010                 # t8 = 80100000
    addiu   t8, t8, 0x1538             # t8 = 80101538
    or      v1, a0, $zero              # v1 = 00000000
    sll     t7, a1,  4
    addu    a2, t7, t8
    addiu   a0, $zero, 0x0008          # a0 = 00000008
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B4BB8:
    lh      t9, 0x0000(a2)             # 00000000
    addiu   v0, v0, 0x0004             # v0 = 00000004
    addiu   v1, v1, 0x0008             # v1 = 00000008
    sh      t9, -0x0008(v1)            # 00000000
    lh      t0, 0x0002(a2)             # 00000002
    addiu   a2, a2, 0x0008             # a2 = 00000008
    sh      t0, -0x0006(v1)            # 00000002
    lh      t1, -0x0004(a2)            # 00000004
    sh      t1, -0x0004(v1)            # 00000004
    lh      t2, -0x0002(a2)            # 00000006
    bne     v0, a0, lbl_800B4BB8
    sh      t2, -0x0002(v1)            # 00000006
    jr      $ra
    nop


func_800B4BF0:
# MqDbg: AudioHeap_LoadHighPassFilter
    sll     t7, a1,  4
    lui     t9, 0x8010                 # t9 = 80100000
    addiu   t9, t9, 0x1638             # t9 = 80101638
    addiu   t8, t7, 0xFFF0             # t8 = FFFFFFF0
    or      v1, a0, $zero              # v1 = 00000000
    addiu   a0, $zero, 0x0008          # a0 = 00000008
    addu    a2, t8, t9
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B4C10:
    lh      t0, 0x0000(a2)             # 00000000
    addiu   v0, v0, 0x0004             # v0 = 00000004
    addiu   v1, v1, 0x0008             # v1 = 00000008
    sh      t0, -0x0008(v1)            # 00000000
    lh      t1, 0x0002(a2)             # 00000002
    addiu   a2, a2, 0x0008             # a2 = 00000008
    sh      t1, -0x0006(v1)            # 00000002
    lh      t2, -0x0004(a2)            # 00000004
    sh      t2, -0x0004(v1)            # 00000004
    lh      t3, -0x0002(a2)            # 00000006
    bne     v0, a0, lbl_800B4C10
    sh      t3, -0x0002(v1)            # 00000006
    jr      $ra
    nop


func_800B4C48:
# MqDbg: AudioHeap_LoadFilter
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0018($sp)
    bne     a1, $zero, lbl_800B4C74
    or      a3, a1, $zero              # a3 = 00000000
    bne     a2, $zero, lbl_800B4C74
    nop
    jal     func_800B4B9C
    or      a1, $zero, $zero           # a1 = 00000000
    b       lbl_800B4D70
    lw      $ra, 0x0014($sp)
lbl_800B4C74:
    bne     a2, $zero, lbl_800B4C8C
    lw      a0, 0x0018($sp)
    jal     func_800B4B9C
    or      a1, a3, $zero              # a1 = 00000000
    b       lbl_800B4D70
    lw      $ra, 0x0014($sp)
lbl_800B4C8C:
    bne     a3, $zero, lbl_800B4CA8
    or      a1, $zero, $zero           # a1 = 00000000
    lw      a0, 0x0018($sp)
    jal     func_800B4BF0
    or      a1, a2, $zero              # a1 = 00000000
    b       lbl_800B4D70
    lw      $ra, 0x0014($sp)
lbl_800B4CA8:
    or      t6, a2, $zero              # t6 = 00000000
    sll     t7, t6,  4
    lui     t9, 0x8010                 # t9 = 80100000
    lui     t2, 0x8010                 # t2 = 80100000
    addiu   t2, t2, 0x1538             # t2 = 80101538
    addiu   t9, t9, 0x1638             # t9 = 80101638
    addiu   t8, t7, 0xFFF0             # t8 = FFFFFFF0
    sll     t1, a3,  4
    addu    a0, t1, t2
    addu    v1, t8, t9
    addiu   a2, $zero, 0x0008          # a2 = 00000008
    lw      v0, 0x0018($sp)
lbl_800B4CD8:
    lh      t3, 0x0000(v1)             # 00000000
    lh      t4, 0x0000(a0)             # 00000000
    addiu   a1, a1, 0x0004             # a1 = 00000004
    addiu   v0, v0, 0x0008             # v0 = 00000008
    addu    t5, t3, t4
    bgez    t5, lbl_800B4CFC
    sra     t6, t5,  1
    addiu   $at, t5, 0x0001            # $at = 00000001
    sra     t6, $at,  1
lbl_800B4CFC:
    sh      t6, -0x0008(v0)            # 00000000
    lh      t8, 0x0002(a0)             # 00000002
    lh      t7, 0x0002(v1)             # 00000002
    addiu   v1, v1, 0x0008             # v1 = 00000008
    addiu   a0, a0, 0x0008             # a0 = 00000008
    addu    t9, t7, t8
    bgez    t9, lbl_800B4D24
    sra     t0, t9,  1
    addiu   $at, t9, 0x0001            # $at = 80101639
    sra     t0, $at,  1
lbl_800B4D24:
    sh      t0, -0x0006(v0)            # 00000002
    lh      t2, -0x0004(a0)            # 00000004
    lh      t1, -0x0004(v1)            # 00000004
    addu    t3, t1, t2
    bgez    t3, lbl_800B4D44
    sra     t4, t3,  1
    addiu   $at, t3, 0x0001            # $at = 00000001
    sra     t4, $at,  1
lbl_800B4D44:
    sh      t4, -0x0004(v0)            # 00000004
    lh      t6, -0x0002(a0)            # 00000006
    lh      t5, -0x0002(v1)            # 00000006
    addu    t7, t5, t6
    bgez    t7, lbl_800B4D64
    sra     t8, t7,  1
    addiu   $at, t7, 0x0001            # $at = 00000001
    sra     t8, $at,  1
lbl_800B4D64:
    bne     a1, a2, lbl_800B4CD8
    sh      t8, -0x0002(v0)            # 00000006
    lw      $ra, 0x0014($sp)
lbl_800B4D70:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800B4D7C:
# MqDbg: AudioHeap_UpdateReverb
    jr      $ra
    sw      a0, 0x0000($sp)


func_800B4D84:
# MqDbg: AudioHeap_UpdateReverbs
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x5630             # v1 = 80125630
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    lh      t6, 0x2848(v1)             # 80127E78
    addiu   $at, $zero, 0x0002         # $at = 00000002
    sw      $ra, 0x0024($sp)
    sw      s3, 0x0020($sp)
    sw      s2, 0x001C($sp)
    sw      s1, 0x0018($sp)
    bne     t6, $at, lbl_800B4DB8
    sw      s0, 0x0014($sp)
    b       lbl_800B4DBC
    addiu   s2, $zero, 0x0002          # s2 = 00000002
lbl_800B4DB8:
    addiu   s2, $zero, 0x0001          # s2 = 00000001
lbl_800B4DBC:
    lb      v0, 0x0001(v1)             # 80125631
    or      s3, $zero, $zero           # s3 = 00000000
    blezl   v0, lbl_800B4E30
    lw      $ra, 0x0024($sp)
lbl_800B4DCC:
    blez    s2, lbl_800B4E1C
    or      s0, $zero, $zero           # s0 = 00000000
    sll     t7, s3,  2
    subu    t7, t7, s3
    sll     t7, t7,  2
    subu    t7, t7, s3
    sll     t7, t7,  3
    addu    t7, t7, s3
    sll     t7, t7,  3
    lui     t9, 0x8012                 # t9 = 80120000
    addiu   t9, t9, 0x5630             # t9 = 80125630
    addiu   t8, t7, 0x0018             # t8 = 00000018
    addu    s1, t8, t9
lbl_800B4E00:
    jal     func_800B4D7C
    or      a0, s1, $zero              # a0 = 00000000
    addiu   s0, s0, 0x0001             # s0 = 00000001
    bne     s0, s2, lbl_800B4E00
    nop
    lui     v0, 0x8012                 # v0 = 80120000
    lb      v0, 0x5631(v0)             # 80125631
lbl_800B4E1C:
    addiu   s3, s3, 0x0001             # s3 = 00000001
    slt     $at, s3, v0
    bne     $at, $zero, lbl_800B4DCC
    nop
    lw      $ra, 0x0024($sp)
lbl_800B4E30:
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28


func_800B4E48:
# MqDbg: AudioHeap_ClearCurrentAiBuffer
    lui     a2, 0x8012                 # a2 = 80120000
    addiu   a2, a2, 0x5630             # a2 = 80125630
    lw      v0, 0x28A8(a2)             # 80127ED8
    lh      t6, 0x2852(a2)             # 80127E82
    or      a1, $zero, $zero           # a1 = 00000000
    sll     t7, v0,  1
    sll     t9, v0,  2
    addu    t8, a2, t7
    addu    a0, a2, t9
    addiu   v0, $zero, 0x0B00          # v0 = 00000B00
    sh      t6, 0x2974(t8)             # 00002974
lbl_800B4E74:
    lw      t0, 0x2968(a0)             # 00002968
    addu    t1, t0, a1
    sh      $zero, 0x0000(t1)          # 00000000
    lw      t2, 0x2968(a0)             # 00002968
    addu    t3, t2, a1
    sh      $zero, 0x0002(t3)          # 00000002
    lw      t4, 0x2968(a0)             # 00002968
    addu    t5, t4, a1
    sh      $zero, 0x0004(t5)          # 00000004
    lw      t7, 0x2968(a0)             # 00002968
    addu    t6, t7, a1
    addiu   a1, a1, 0x0008             # a1 = 00000008
    bne     a1, v0, lbl_800B4E74
    sh      $zero, 0x0006(t6)          # 00000006
    jr      $ra
    nop


func_800B4EB4:
# MqDbg: AudioHeap_ResetStep
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      s1, 0x0018($sp)
    lui     s1, 0x8012                 # s1 = 80120000
    addiu   s1, s1, 0x5630             # s1 = 80125630
    lh      t6, 0x2848(s1)             # 80127E78
    addiu   $at, $zero, 0x0002         # $at = 00000002
    sw      $ra, 0x001C($sp)
    bne     t6, $at, lbl_800B4EE4
    sw      s0, 0x0014($sp)
    addiu   t7, $zero, 0x0002          # t7 = 00000002
    b       lbl_800B4EEC
    sw      t7, 0x0024($sp)
lbl_800B4EE4:
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    sw      t8, 0x0024($sp)
lbl_800B4EEC:
    lbu     t9, 0x3518(s1)             # 80128B48
    addiu   t0, t9, 0xFFFF             # t0 = FFFFFFFF
    sltiu   $at, t0, 0x0005
    beq     $at, $zero, lbl_800B5188
    sll     t0, t0,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t0
    lw      t0, -0x6824($at)           # 801097DC
    jr      t0
    nop
    lh      t1, 0x285C(s1)             # 80127E8C
    or      a1, $zero, $zero           # a1 = 00000000
    blezl   t1, lbl_800B4F58
    lw      t3, 0x0024($sp)
    lui     s0, 0x8013                 # s0 = 80130000
    addiu   s0, s0, 0x8B60             # s0 = 80128B60
    or      a0, s0, $zero              # a0 = 80128B60
lbl_800B4F30:
    jal     func_800BF104
    sw      a1, 0x002C($sp)
    lw      a1, 0x002C($sp)
    lh      t2, 0x285C(s1)             # 80127E8C
    addiu   s0, s0, 0x0160             # s0 = 80128CC0
    addiu   a1, a1, 0x0001             # a1 = 00000001
    slt     $at, a1, t2
    bnel    $at, $zero, lbl_800B4F30
    or      a0, s0, $zero              # a0 = 80128CC0
    lw      t3, 0x0024($sp)
lbl_800B4F58:
    addiu   t4, $zero, 0x0002          # t4 = 00000002
    lbu     v0, 0x3518(s1)             # 80128B48
    div     $zero, t4, t3
    mflo    t5
    addiu   t6, v0, 0xFFFF             # t6 = FFFFFFFF
    bne     t3, $zero, lbl_800B4F78
    nop
    break   # 0x01C00
lbl_800B4F78:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t3, $at, lbl_800B4F90
    lui     $at, 0x8000                # $at = 80000000
    bne     t4, $at, lbl_800B4F90
    nop
    break   # 0x01800
lbl_800B4F90:
    sw      t5, 0x351C(s1)             # 80128B4C
    b       lbl_800B5188
    sb      t6, 0x3518(s1)             # 80128B48
    lw      v0, 0x351C(s1)             # 80128B4C
    beq     v0, $zero, lbl_800B4FB8
    addiu   t7, v0, 0xFFFF             # t7 = FFFFFFFF
    jal     func_800B4D84
    sw      t7, 0x351C(s1)             # 80128B4C
    b       lbl_800B518C
    lbu     t7, 0x3518(s1)             # 80128B48
lbl_800B4FB8:
    lw      a0, 0x2894(s1)             # 80127EC4
    or      a1, $zero, $zero           # a1 = 00000000
    blezl   a0, lbl_800B502C
    lw      t7, 0x0024($sp)
    or      v1, $zero, $zero           # v1 = 00000000
lbl_800B4FCC:
    lw      t8, 0x352C(s1)             # 80128B5C
    addiu   a1, a1, 0x0001             # a1 = 00000001
    addu    v0, t8, v1
    lw      t9, 0x00C0(v0)             # 000000C0
    srl     t0, t9, 31
    beql    t0, $zero, lbl_800B5020
    slt     $at, a1, a0
    lbu     t1, 0x0070(v0)             # 00000070
    andi    t2, t1, 0x000F             # t2 = 00000000
    beql    t2, $zero, lbl_800B5020
    slt     $at, a1, a0
    lwc1    $f4, 0x2864(s1)            # 80127E94
    swc1    $f4, 0x007C(v0)            # 0000007C
    lw      t4, 0x352C(s1)             # 80128B5C
    addu    v0, t4, v1
    lbu     t3, 0x0070(v0)             # 00000070
    andi    t5, t3, 0xFFEF             # t5 = 00000000
    ori     t6, t5, 0x0010             # t6 = 00000010
    sb      t6, 0x0070(v0)             # 00000070
    lw      a0, 0x2894(s1)             # 80127EC4
    slt     $at, a1, a0
lbl_800B5020:
    bne     $at, $zero, lbl_800B4FCC
    addiu   v1, v1, 0x00E0             # v1 = 000000E0
    lw      t7, 0x0024($sp)
lbl_800B502C:
    addiu   t8, $zero, 0x0008          # t8 = 00000008
    lbu     v0, 0x3518(s1)             # 80128B48
    div     $zero, t8, t7
    mflo    t9
    addiu   t0, v0, 0xFFFF             # t0 = FFFFFFFF
    bne     t7, $zero, lbl_800B504C
    nop
    break   # 0x01C00
lbl_800B504C:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t7, $at, lbl_800B5064
    lui     $at, 0x8000                # $at = 80000000
    bne     t8, $at, lbl_800B5064
    nop
    break   # 0x01800
lbl_800B5064:
    sw      t9, 0x351C(s1)             # 80128B4C
    b       lbl_800B5188
    sb      t0, 0x3518(s1)             # 80128B48
    lw      v0, 0x351C(s1)             # 80128B4C
    lw      t2, 0x0024($sp)
    addiu   t4, $zero, 0x0002          # t4 = 00000002
    beq     v0, $zero, lbl_800B5098
    nop
    addiu   t1, v0, 0xFFFF             # t1 = FFFFFFFF
    jal     func_800B4D84
    sw      t1, 0x351C(s1)             # 80128B4C
    b       lbl_800B518C
    lbu     t7, 0x3518(s1)             # 80128B48
lbl_800B5098:
    div     $zero, t4, t2
    lbu     v0, 0x3518(s1)             # 80128B48
    mflo    t3
    sw      t3, 0x351C(s1)             # 80128B4C
    bne     t2, $zero, lbl_800B50B4
    nop
    break   # 0x01C00
lbl_800B50B4:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t2, $at, lbl_800B50CC
    lui     $at, 0x8000                # $at = 80000000
    bne     t4, $at, lbl_800B50CC
    nop
    break   # 0x01800
lbl_800B50CC:
    addiu   t5, v0, 0xFFFF             # t5 = FFFFFFFF
    b       lbl_800B5188
    sb      t5, 0x3518(s1)             # 80128B48
    jal     func_800B4E48
    nop
    lw      v0, 0x351C(s1)             # 80128B4C
    beq     v0, $zero, lbl_800B50F4
    addiu   t6, v0, 0xFFFF             # t6 = FFFFFFFF
    b       lbl_800B5188
    sw      t6, 0x351C(s1)             # 80128B4C
lbl_800B50F4:
    lbu     v0, 0x3518(s1)             # 80128B48
    addiu   t8, v0, 0xFFFF             # t8 = FFFFFFFF
    jal     func_800B627C
    sb      t8, 0x3518(s1)             # 80128B48
    jal     func_800B6708
    nop
    b       lbl_800B518C
    lbu     t7, 0x3518(s1)             # 80128B48
    jal     func_800B51B8
    nop
    lui     t7, 0x8012                 # t7 = 80120000
    addiu   v1, t7, 0x5630             # v1 = 80125630
    lui     a3, 0x8012                 # a3 = 80120000
    sb      $zero, 0x3518(s1)          # 80128B48
    addiu   a3, a3, 0x563C             # a3 = 8012563C
    or      a2, v1, $zero              # a2 = 80125630
    addiu   a0, $zero, 0x0B00          # a0 = 00000B00
lbl_800B5138:
    lh      t9, 0x2850(s1)             # 80127E80
    or      v0, $zero, $zero           # v0 = 00000000
    sh      t9, 0x2974(a2)             # 80127FA4
lbl_800B5144:
    lw      t0, 0x2968(v1)             # 80127F98
    addu    t1, t0, v0
    sh      $zero, 0x0000(t1)          # 00000000
    lw      t4, 0x2968(v1)             # 80127F98
    addu    t2, t4, v0
    sh      $zero, 0x0002(t2)          # 00000002
    lw      t3, 0x2968(v1)             # 80127F98
    addu    t5, t3, v0
    sh      $zero, 0x0004(t5)          # 00000004
    lw      t6, 0x2968(v1)             # 80127F98
    addu    t8, t6, v0
    addiu   v0, v0, 0x0008             # v0 = 00000008
    bne     v0, a0, lbl_800B5144
    sh      $zero, 0x0006(t8)          # 00000006
    addiu   v1, v1, 0x0004             # v1 = 80125634
    bne     v1, a3, lbl_800B5138
    addiu   a2, a2, 0x0002             # a2 = 80125632
lbl_800B5188:
    lbu     t7, 0x3518(s1)             # 80128B48
lbl_800B518C:
    lw      $ra, 0x001C($sp)
    addiu   v0, $zero, 0x0001          # v0 = 00000001
    slti    $at, t7, 0x0003
    beq     $at, $zero, lbl_800B51A8
    nop
    b       lbl_800B51A8
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B51A8:
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030           # $sp += 0x30


func_800B51B8:
# MqDbg: AudioHeap_Init
    addiu   $sp, $sp, 0xFF60           # $sp -= 0xA0
    sw      s6, 0x0030($sp)
    lui     s6, 0x8012                 # s6 = 80120000
    addiu   s6, s6, 0x5630             # s6 = 80125630
    lbu     t6, 0x3519(s6)             # 80128B49
    lui     t8, 0x8010                 # t8 = 80100000
    addiu   t8, t8, 0x4778             # t8 = 80104778
    sll     t7, t6,  3
    subu    t7, t7, t6
    sll     t7, t7,  3
    sw      $ra, 0x003C($sp)
    sw      s8, 0x0038($sp)
    sw      s7, 0x0034($sp)
    sw      s5, 0x002C($sp)
    sw      s4, 0x0028($sp)
    sw      s3, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    addu    v0, t7, t8
    sw      $zero, 0x2620(s6)          # 80127C50
    lw      t9, 0x0000(v0)             # 00000000
    sw      v0, 0x0068($sp)
    sh      t9, 0x284A(s6)             # 80127E7A
    jal     func_800D2900
    andi    a0, t9, 0xFFFF             # a0 = 00000000
    lhu     v1, 0x284A(s6)             # 80127E7A
    lw      t1, 0x2964(s6)             # 80127F94
    lw      t0, 0x0068($sp)
    mtc1    v1, $f6                    # $f6 = 0.00
    div     $zero, v1, t1
    mflo    t2
    addiu   t3, t2, 0x000F             # t3 = 0000000F
    andi    t4, t3, 0xFFF0             # t4 = 00000000
    sh      t4, 0x284E(s6)             # 80127E7E
    lh      a2, 0x284E(s6)             # 80127E7E
    cvt.s.w $f8, $f6
    sh      v0, 0x284C(s6)             # 80127E7C
    bne     t1, $zero, lbl_800B525C
    nop
    break   # 0x01C00
lbl_800B525C:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t1, $at, lbl_800B5274
    lui     $at, 0x8000                # $at = 80000000
    bne     v1, $at, lbl_800B5274
    nop
    break   # 0x01800
lbl_800B5274:
    addiu   $at, $zero, 0x00D0         # $at = 000000D0
    addiu   a0, a2, 0x0010             # a0 = 00000010
    div     $zero, a0, $at
    mflo    t6
    addiu   t7, t6, 0x0001             # t7 = 00000001
    sh      t7, 0x2854(s6)             # 80127E84
    lh      a3, 0x2854(s6)             # 80127E84
    addiu   t5, a2, 0xFFF0             # t5 = FFFFFFF0
    sh      t5, 0x2852(s6)             # 80127E82
    div     $zero, a2, a3
    mflo    t8
    mtc1    a3, $f16                   # $f16 = 0.00
    sh      a0, 0x2850(s6)             # 80127E80
    bne     a3, $zero, lbl_800B52B4
    nop
    break   # 0x01C00
lbl_800B52B4:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     a3, $at, lbl_800B52CC
    lui     $at, 0x8000                # $at = 80000000
    bne     a2, $at, lbl_800B52CC
    nop
    break   # 0x01800
lbl_800B52CC:
    addiu   $at, $zero, 0xFFF8         # $at = FFFFFFF8
    and     t9, t8, $at
    lui     $at, 0x46FA                # $at = 46FA0000
    mtc1    $at, $f4                   # $f4 = 32000.00
    lui     $at, 0x3B80                # $at = 3B800000
    cvt.s.w $f0, $f16
    mtc1    $at, $f18                  # $f18 = 0.00
    lui     $at, 0x3E80                # $at = 3E800000
    sh      t9, 0x2856(s6)             # 80127E86
    lh      a1, 0x2856(s6)             # 80127E86
    div.s   $f10, $f4, $f8
    mtc1    $at, $f4                   # $f4 = 0.25
    lui     $at, 0x3F80                # $at = 3F800000
    addiu   t2, a1, 0x0008             # t2 = 00000008
    mul.s   $f8, $f0, $f4
    addiu   t3, a1, 0xFFF8             # t3 = FFFFFFF8
    sh      t2, 0x2858(s6)             # 80127E88
    sh      t3, 0x285A(s6)             # 80127E8A
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0x8A38             # a0 = 80128A38
    swc1    $f8, 0x286C(s6)            # 80127E9C
    div.s   $f6, $f18, $f0
    swc1    $f10, 0x2860(s6)           # 80127E90
    mtc1    $at, $f10                  # $f10 = 1.00
    nop
    div.s   $f16, $f10, $f0
    swc1    $f6, 0x2868(s6)            # 80127E98
    swc1    $f16, 0x2864(s6)           # 80127E94
    lhu     t4, 0x0010(t0)             # 00000010
    sw      t4, 0x2874(s6)             # 80127EA4
    lhu     t5, 0x0012(t0)             # 00000012
    sw      t5, 0x2878(s6)             # 80127EA8
    lbu     t6, 0x0005(t0)             # 00000005
    sw      t6, 0x2894(s6)             # 80127EC4
    lbu     t7, 0x0006(t0)             # 00000006
    sh      t7, 0x285C(s6)             # 80127E8C
    lh      t8, 0x285C(s6)             # 80127E8C
    slti    $at, t8, 0x0005
    bne     $at, $zero, lbl_800B5370
    addiu   t9, $zero, 0x0004          # t9 = 00000004
    sh      t9, 0x285C(s6)             # 80127E8C
lbl_800B5370:
    lhu     t2, 0x0014(t0)             # 00000014
    lui     t3, 0x8011                 # t3 = 80110000
    lui     $at, 0x8011                # $at = 80110000
    sh      t2, 0x0002(s6)             # 80125632
    lh      t3, -0x5E4E(t3)            # 8010A1B2
    lwc1    $f18, -0x6810($at)         # 801097F0
    lwc1    $f16, 0x2960(s6)           # 80127F90
    mtc1    t3, $f4                    # $f4 = 0.00
    mul.s   $f6, $f0, $f18
    addiu   t5, $zero, 0x0001          # t5 = 00000001
    cvt.s.w $f8, $f4
    div.s   $f10, $f6, $f8
    div.s   $f18, $f10, $f16
    cfc1    t4, $f31
    ctc1    t5, $f31
    nop
    cvt.w.s $f4, $f18
    cfc1    t5, $f31
    nop
    andi    t5, t5, 0x0078             # t5 = 00000000
    beq     t5, $zero, lbl_800B540C
    lui     $at, 0x4F00                # $at = 4F000000
    mtc1    $at, $f4                   # $f4 = 2147484000.00
    addiu   t5, $zero, 0x0001          # t5 = 00000001
    sub.s   $f4, $f18, $f4
    ctc1    t5, $f31
    nop
    cvt.w.s $f4, $f4
    cfc1    t5, $f31
    nop
    andi    t5, t5, 0x0078             # t5 = 00000000
    bne     t5, $zero, lbl_800B5404
    nop
    mfc1    t5, $f4
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800B541C
    or      t5, t5, $at                # t5 = 80000000
lbl_800B5404:
    b       lbl_800B541C
    addiu   t5, $zero, 0xFFFF          # t5 = FFFFFFFF
lbl_800B540C:
    mfc1    t5, $f4
    nop
    bltz    t5, lbl_800B5404
    nop
lbl_800B541C:
    ctc1    t4, $f31
    mtc1    t1, $f6                    # $f6 = 0.00
    lhu     t6, 0x284C(s6)             # 80127E7C
    sh      t5, 0x2898(s6)             # 80127EC8
    cvt.s.w $f8, $f6
    mtc1    t6, $f4                    # $f4 = 0.00
    nop
    cvt.s.w $f6, $f4
    swc1    $f8, 0x2870(s6)            # 80127EA0
    lwc1    $f10, 0x2870(s6)           # 80127EA0
    mul.s   $f16, $f10, $f0
    swc1    $f16, 0x2870(s6)           # 80127EA0
    bgez    t6, lbl_800B5464
    lwc1    $f18, 0x2870(s6)           # 80127EA0
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f6, $f6, $f8
lbl_800B5464:
    div.s   $f10, $f18, $f6
    lh      t7, 0x2898(s6)             # 80127EC8
    lh      t2, 0x2850(s6)             # 80127E80
    lh      t4, 0x2852(s6)             # 80127E82
    mtc1    t7, $f4                    # $f4 = 0.00
    nop
    cvt.s.w $f8, $f4
    swc1    $f10, 0x2870(s6)           # 80127EA0
    lwc1    $f16, 0x2870(s6)           # 80127EA0
    div.s   $f18, $f16, $f8
    swc1    $f18, 0x2870(s6)           # 80127EA0
    lbu     t8, 0x0004(t0)             # 00000004
    sh      t8, 0x2848(s6)             # 80127E78
    lh      v0, 0x2848(s6)             # 80127E78
    multu   a2, v0
    slti    $at, v0, 0x0002
    mflo    t9
    sh      t9, 0x284E(s6)             # 80127E7E
    nop
    multu   t2, v0
    mflo    t3
    sh      t3, 0x2850(s6)             # 80127E80
    nop
    multu   t4, v0
    mflo    t5
    sh      t5, 0x2852(s6)             # 80127E82
    nop
    multu   a3, v0
    mflo    t6
    sh      t6, 0x2854(s6)             # 80127E84
    bnel    $at, $zero, lbl_800B54F4
    lw      t9, 0x2894(s6)             # 80127EC4
    lh      t7, 0x2850(s6)             # 80127E80
    addiu   t8, t7, 0xFFF0             # t8 = FFFFFFF1
    sh      t8, 0x2850(s6)             # 80127E80
    lw      t9, 0x2894(s6)             # 80127EC4
lbl_800B54F4:
    lh      t3, 0x2854(s6)             # 80127E84
    lbu     t5, 0x0009(t0)             # 00000009
    sll     t2, t9,  4
    multu   t2, t3
    sll     t6, t5,  2
    subu    t6, t6, t5
    sll     t6, t6,  3
    lw      v1, 0x29A0(s6)             # 80127FD0
    lui     $at, 0x8013                # $at = 80130000
    mflo    t4
    addu    t7, t4, t6
    addiu   t8, t7, 0x0140             # t8 = 00000141
    sw      t8, 0x2890(s6)             # 80127EC0
    lw      t2, 0x001C(t0)             # 0000001C
    lw      t9, 0x0018(t0)             # 00000018
    lw      t6, 0x0028(t0)             # 00000028
    lw      t4, 0x0024(t0)             # 00000024
    lw      t5, 0x0020(t0)             # 00000020
    lw      t8, 0x002C(t0)             # 0000002C
    addu    t3, t9, t2
    addu    t7, t4, t6
    lw      t9, 0x2998(s6)             # 80127FC8
    addu    s0, t3, t5
    addu    s1, t7, t8
    addiu   s0, s0, 0x0010             # s0 = 00000010
    addiu   s1, s1, 0x0010             # s1 = 00000010
    addu    v0, s0, s1
    subu    a1, t9, v0
    beq     v1, $zero, lbl_800B5570
    addiu   a1, a1, 0xFF00             # a1 = FFFFFF00
    sw      v1, 0x29A4(s6)             # 80127FD4
lbl_800B5570:
    sw      a1, 0x3408(s6)             # 80128A38
    jal     func_800B3C10
    sw      v0, -0x75BC($at)           # 80128A44
    lui     a0, 0x8013                 # a0 = 80130000
    sw      s0, 0x3418(s6)             # 80128A48
    sw      s1, 0x341C(s6)             # 80128A4C
    jal     func_800B3C94
    addiu   a0, a0, 0x8A48             # a0 = 80128A48
    lw      v0, 0x0068($sp)
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0x8A50             # a0 = 80128A50
    lw      t2, 0x0018(v0)             # 00000018
    sw      t2, 0x3420(s6)             # 80128A50
    lw      t3, 0x001C(v0)             # 0000001C
    sw      t3, 0x3424(s6)             # 80128A54
    lw      t5, 0x0020(v0)             # 00000020
    jal     func_800B3D18
    sw      t5, 0x3428(s6)             # 80128A58
    lw      v0, 0x0068($sp)
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0x8A5C             # a0 = 80128A5C
    lw      t4, 0x0024(v0)             # 00000024
    sw      t4, 0x342C(s6)             # 80128A5C
    lw      t6, 0x0028(v0)             # 00000028
    sw      t6, 0x3430(s6)             # 80128A60
    lw      t7, 0x002C(v0)             # 0000002C
    jal     func_800B3DDC
    sw      t7, 0x3434(s6)             # 80128A64
    jal     func_800B3540
    nop
    lw      a1, 0x2894(s6)             # 80127EC4
    lui     s3, 0x8012                 # s3 = 80120000
    addiu   s3, s3, 0x7FF0             # s3 = 80127FF0
    addu    $at, a1, $zero
    sll     a1, a1,  3
    subu    a1, a1, $at
    sll     a1, a1,  5
    jal     func_800B3940
    or      a0, s3, $zero              # a0 = 80127FF0
    jal     func_800BDD48
    sw      v0, 0x352C(s6)             # 80128B5C
    jal     func_800BD31C
    nop
    lh      t8, 0x2854(s6)             # 80127E84
    lw      t9, 0x2894(s6)             # 80127EC4
    or      a0, s3, $zero              # a0 = 80127FF0
    multu   t8, t9
    mflo    a1
    sll     a1, a1,  5
    jal     func_800B3940
    nop
    lui     s0, 0x8012                 # s0 = 80120000
    lui     s1, 0x8012                 # s1 = 80120000
    sw      v0, 0x0014(s6)             # 80125644
    addiu   s1, s1, 0x5638             # s1 = 80125638
    addiu   s0, s0, 0x5630             # s0 = 80125630
lbl_800B5650:
    lw      a1, 0x2890(s6)             # 80127EC0
    or      a0, s3, $zero              # a0 = 80127FF0
    jal     func_800B3904
    sll     a1, a1,  3
    addiu   s0, s0, 0x0004             # s0 = 80125634
    bne     s0, s1, lbl_800B5650
    sw      v0, 0x28A8(s0)             # 80127EDC
    or      a0, s3, $zero              # a0 = 80127FF0
    jal     func_800B399C
    addiu   a1, $zero, 0x0400          # a1 = 00000400
    jal     func_800B33FC
    sw      v0, 0x3520(s6)             # 80128B50
    lui     s4, 0x8012                 # s4 = 80120000
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x6150             # v0 = 80126150
    addiu   s4, s4, 0x5630             # s4 = 80125630
lbl_800B5690:
    addiu   s4, s4, 0x02C8             # s4 = 801258F8
    sltu    $at, s4, v0
    bne     $at, $zero, lbl_800B5690
    sb      $zero, -0x02AF(s4)         # 80125649
    lw      v0, 0x0068($sp)
    lbu     t2, 0x0009(v0)             # 80126159
    sw      $zero, 0x0074($sp)
    sb      t2, 0x0001(s6)             # 80125631
    lb      t3, 0x0001(s6)             # 80125631
    blez    t3, lbl_800B59E0
    lui     t5, 0x8012                 # t5 = 80120000
    addiu   t5, t5, 0x58E0             # t5 = 801258E0
    lui     s4, 0x8012                 # s4 = 80120000
    lui     s2, 0x8012                 # s2 = 80120000
    lui     s8, 0x8012                 # s8 = 80120000
    addiu   s8, s8, 0x58D0             # s8 = 801258D0
    addiu   s2, s2, 0x5648             # s2 = 80125648
    addiu   s4, s4, 0x5630             # s4 = 80125630
    sw      t5, 0x0044($sp)
    or      s7, $zero, $zero           # s7 = 00000000
lbl_800B56E0:
    lw      v0, 0x0068($sp)
    or      a0, s3, $zero              # a0 = 80127FF0
    lw      t4, 0x000C(v0)             # 8012615C
    addu    s5, t4, s7
    lbu     t6, 0x0000(s5)             # 00000000
    sb      t6, 0x001C(s4)             # 8012564C
    lhu     t7, 0x0002(s5)             # 00000002
    andi    t2, t6, 0x00FF             # t2 = 00000000
    sll     t8, t7,  6
    andi    t9, t8, 0xFFFF             # t9 = 00000000
    div     $zero, t9, t2
    sh      t8, 0x001E(s4)             # 8012564E
    mflo    t3
    sh      t3, 0x001E(s4)             # 8012564E
    lhu     t5, 0x0004(s5)             # 00000004
    bne     t2, $zero, lbl_800B5728
    nop
    break   # 0x01C00
lbl_800B5728:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t2, $at, lbl_800B5740
    lui     $at, 0x8000                # $at = 80000000
    bne     t9, $at, lbl_800B5740
    nop
    break   # 0x01800
lbl_800B5740:
    sh      t5, 0x0024(s4)             # 80125654
    lhu     t4, 0x000A(s5)             # 0000000A
    lhu     a1, 0x001E(s4)             # 8012564E
    sh      t4, 0x0022(s4)             # 80125652
    lhu     t6, 0x0006(s5)             # 00000006
    addiu   t4, $zero, 0x0008          # t4 = 00000008
    sll     a1, a1,  1
    sll     t7, t6,  6
    sh      t7, 0x002C(s4)             # 8012565C
    lhu     t8, 0x0008(s5)             # 00000008
    sb      $zero, 0x0030(s4)          # 80125660
    sh      t8, 0x002E(s4)             # 8012565E
    lhu     t9, 0x000C(s5)             # 0000000C
    sh      t9, 0x0028(s4)             # 80125658
    lhu     t2, 0x000E(s5)             # 0000000E
    sh      t2, 0x002A(s4)             # 8012565A
    lb      t3, 0x0010(s5)             # 00000010
    sb      t3, 0x001D(s4)             # 8012564D
    lhu     t5, 0x0012(s5)             # 00000012
    sb      t4, 0x0019(s4)             # 80125649
    jal     func_800B3818
    sh      t5, 0x0020(s4)             # 80125650
    lhu     a1, 0x0006(s2)             # 8012564E
    sw      v0, 0x0028(s2)             # 80125670
    or      a0, s3, $zero              # a0 = 80127FF0
    jal     func_800B3818
    sll     a1, a1,  1
    lbu     t9, 0x0288(s2)             # 801258D0
    lhu     a1, 0x0006(s2)             # 8012564E
    addiu   t6, $zero, 0x0002          # t6 = 00000002
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    andi    t2, t9, 0xFF0F             # t2 = 00000000
    sw      v0, 0x002C(s2)             # 80125674
    sw      $zero, 0x001C(s2)          # 80125664
    sw      $zero, 0x0020(s2)          # 80125668
    sb      $zero, 0x0003(s2)          # 8012564B
    sb      t6, 0x0002(s2)             # 8012564A
    sb      t7, 0x0000(s2)             # 80125648
    sw      s8, 0x0280(s2)             # 801258C8
    ori     t5, t2, 0x0040             # t5 = 00000040
    sw      a1, 0x0024(s2)             # 8012566C
    lw      t8, 0x0044($sp)
    lui     $at, 0x3F80                # $at = 3F800000
    sb      t5, 0x0288(s2)             # 801258D0
    andi    t4, t5, 0x00F3             # t4 = 00000040
    mtc1    $at, $f6                   # $f6 = 1.00
    sb      t4, 0x0288(s2)             # 801258D0
    lw      a0, 0x0288(s2)             # 801258D0
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    sll     t6, a1,  1
    and     t7, t6, $at
    sw      t8, 0x0290(s2)             # 801258D8
    xor     t8, t7, a0
    lbu     v0, 0x0004(s2)             # 8012564C
    sll     t9, t8,  8
    lw      t5, 0x0028(s2)             # 80125670
    srl     t2, t9,  8
    addiu   t4, $zero, 0x0001          # t4 = 00000001
    addiu   $at, $zero, 0x0001         # $at = 00000001
    xor     t3, t2, a0
    sw      t3, 0x0288(s2)             # 801258D0
    sw      $zero, 0x0298(s2)          # 801258E0
    sw      t4, 0x02A0(s2)             # 801258E8
    or      v1, a1, $zero              # v1 = 00000000
    sw      a1, 0x029C(s2)             # 801258E4
    swc1    $f6, 0x0284(s2)            # 801258CC
    beq     v0, $at, lbl_800B5924
    sw      t5, 0x028C(s2)             # 801258D4
    ori     t6, $zero, 0x8000          # t6 = 00008000
    div     $zero, t6, v0
    mflo    t7
    sh      t7, 0x000E(s2)             # 80125656
    bne     v0, $zero, lbl_800B5870
    nop
    break   # 0x01C00
lbl_800B5870:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     v0, $at, lbl_800B5888
    lui     $at, 0x8000                # $at = 80000000
    bne     t6, $at, lbl_800B5888
    nop
    break   # 0x01800
lbl_800B5888:
    or      a0, s3, $zero              # a0 = 80127FF0
    addiu   a1, $zero, 0x0020          # a1 = 00000020
    jal     func_800B3940
    or      s1, $zero, $zero           # s1 = 00000000
    sw      v0, 0x0030(s2)             # 80125678
    or      a0, s3, $zero              # a0 = 80127FF0
    jal     func_800B3940
    addiu   a1, $zero, 0x0020          # a1 = 00000020
    sw      v0, 0x0034(s2)             # 8012567C
    or      a0, s3, $zero              # a0 = 80127FF0
    jal     func_800B3940
    addiu   a1, $zero, 0x0020          # a1 = 00000020
    sw      v0, 0x0038(s2)             # 80125680
    or      a0, s3, $zero              # a0 = 80127FF0
    jal     func_800B3940
    addiu   a1, $zero, 0x0020          # a1 = 00000020
    sw      v0, 0x003C(s2)             # 80125684
    lh      t8, 0x2854(s6)             # 80127E84
    blezl   t8, lbl_800B5928
    lh      t5, 0x0014(s5)             # 00000014
    or      s0, s2, $zero              # s0 = 80125648
    or      a0, s3, $zero              # a0 = 80127FF0
lbl_800B58E0:
    jal     func_800B3818
    addiu   a1, $zero, 0x0340          # a1 = 00000340
    addiu   t9, v0, 0x01A0             # t9 = 000001A0
    sw      v0, 0x0044(s0)             # 8012568C
    sw      t9, 0x0048(s0)             # 80125690
    or      a0, s3, $zero              # a0 = 80127FF0
    jal     func_800B3818
    addiu   a1, $zero, 0x0340          # a1 = 00000340
    addiu   t2, v0, 0x01A0             # t2 = 000001A0
    sw      v0, 0x00D0(s0)             # 80125718
    sw      t2, 0x00D4(s0)             # 8012571C
    lh      t3, 0x2854(s6)             # 80127E84
    addiu   s1, s1, 0x0001             # s1 = 00000001
    addiu   s0, s0, 0x001C             # s0 = 80125664
    slt     $at, s1, t3
    bnel    $at, $zero, lbl_800B58E0
    or      a0, s3, $zero              # a0 = 80127FF0
lbl_800B5924:
    lh      t5, 0x0014(s5)             # 00000014
lbl_800B5928:
    beql    t5, $zero, lbl_800B5968
    sw      $zero, 0x0270(s2)          # 801258B8
    or      a0, s3, $zero              # a0 = 80127FF0
    jal     func_800B3904
    addiu   a1, $zero, 0x0040          # a1 = 00000040
    sw      v0, 0x0278(s2)             # 801258C0
    or      a0, s3, $zero              # a0 = 80127FF0
    jal     func_800B38C8
    addiu   a1, $zero, 0x0010          # a1 = 00000010
    sw      v0, 0x0270(s2)             # 801258B8
    lh      a1, 0x0014(s5)             # 00000014
    jal     func_800B4B9C
    or      a0, v0, $zero              # a0 = 00000000
    b       lbl_800B596C
    lh      t4, 0x0016(s5)             # 00000016
    sw      $zero, 0x0270(s2)          # 801258B8
lbl_800B5968:
    lh      t4, 0x0016(s5)             # 00000016
lbl_800B596C:
    beql    t4, $zero, lbl_800B59AC
    sw      $zero, 0x0274(s2)          # 801258BC
    or      a0, s3, $zero              # a0 = 80127FF0
    jal     func_800B3904
    addiu   a1, $zero, 0x0040          # a1 = 00000040
    sw      v0, 0x027C(s2)             # 801258C4
    or      a0, s3, $zero              # a0 = 80127FF0
    jal     func_800B38C8
    addiu   a1, $zero, 0x0010          # a1 = 00000010
    sw      v0, 0x0274(s2)             # 801258BC
    lh      a1, 0x0016(s5)             # 00000016
    jal     func_800B4B9C
    or      a0, v0, $zero              # a0 = 00000000
    b       lbl_800B59B0
    lw      v0, 0x0074($sp)
    sw      $zero, 0x0274(s2)          # 801258BC
lbl_800B59AC:
    lw      v0, 0x0074($sp)
lbl_800B59B0:
    lw      t6, 0x0044($sp)
    lb      t8, 0x0001(s6)             # 80125631
    addiu   v0, v0, 0x0001             # v0 = 00000001
    addiu   t7, t6, 0x02C8             # t7 = 000002C8
    slt     $at, v0, t8
    sw      t7, 0x0044($sp)
    sw      v0, 0x0074($sp)
    addiu   s4, s4, 0x02C8             # s4 = 801258F8
    addiu   s7, s7, 0x0018             # s7 = 00000018
    addiu   s2, s2, 0x02C8             # s2 = 80125910
    bne     $at, $zero, lbl_800B56E0
    addiu   s8, s8, 0x02C8             # s8 = 80125B98
lbl_800B59E0:
    jal     func_800C1E9C
    or      s1, $zero, $zero           # s1 = 00000000
    lh      t9, 0x285C(s6)             # 80127E8C
    lui     s0, 0x8013                 # s0 = 80130000
    addiu   s0, s0, 0x8B60             # s0 = 80128B60
    blezl   t9, lbl_800B5A28
    lw      t3, 0x0068($sp)
lbl_800B59FC:
    jal     func_800C1CF4
    or      a0, s1, $zero              # a0 = 00000000
    jal     func_800C1C28
    or      a0, s0, $zero              # a0 = 80128B60
    lh      t2, 0x285C(s6)             # 80127E8C
    addiu   s1, s1, 0x0001             # s1 = 00000001
    addiu   s0, s0, 0x0160             # s0 = 80128CC0
    slt     $at, s1, t2
    bne     $at, $zero, lbl_800B59FC
    nop
    lw      t3, 0x0068($sp)
lbl_800B5A28:
    lw      a0, 0x0030(t3)             # 00000030
    jal     func_800B5BF4
    lw      a1, 0x0034(t3)             # 00000034
    jal     func_800B6BD8
    lw      a0, 0x2894(s6)             # 80127EC4
    jal     func_800B89C0
    sw      $zero, 0x176C(s6)          # 80126D9C
    jal     func_800BA570
    nop
    jal     func_800B8FD4
    nop
    addiu   t5, $zero, 0x1000          # t5 = 00001000
    jal     func_800BA354
    sh      t5, 0x0004(s6)             # 80125634
    jal     func_80003CC0              # osSetIntMask
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    jal     func_800D5AA0              # osWritebackDCacheAll
    or      s0, v0, $zero              # s0 = 00000000
    jal     func_80003CC0              # osSetIntMask
    or      a0, s0, $zero              # a0 = 00000000
    lw      $ra, 0x003C($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    lw      s3, 0x0024($sp)
    lw      s4, 0x0028($sp)
    lw      s5, 0x002C($sp)
    lw      s6, 0x0030($sp)
    lw      s7, 0x0034($sp)
    lw      s8, 0x0038($sp)
    jr      $ra
    addiu   $sp, $sp, 0x00A0           # $sp += 0xA0


func_800B5AA8:
# MqDbg: AudioHeap_SearchPermanentCache
    lui     v1, 0x8013                 # v1 = 80130000
    lw      v1, -0x7C74(v1)            # 8012838C
    or      a2, a1, $zero              # a2 = 00000000
    lui     a1, 0x8012                 # a1 = 80120000
    blez    v1, lbl_800B5AF4
    or      v0, $zero, $zero           # v0 = 00000000
    addiu   a1, a1, 0x5630             # a1 = 80125630
lbl_800B5AC4:
    lh      t6, 0x2D68(a1)             # 80128398
    addiu   v0, v0, 0x0001             # v0 = 00000001
    slt     $at, v0, v1
    bne     a0, t6, lbl_800B5AEC
    nop
    lh      t7, 0x2D6A(a1)             # 8012839A
    bne     a2, t7, lbl_800B5AEC
    nop
    jr      $ra
    lw      v0, 0x2D60(a1)             # 80128390
lbl_800B5AEC:
    bne     $at, $zero, lbl_800B5AC4
    addiu   a1, a1, 0x000C             # a1 = 8012563C
lbl_800B5AF4:
    or      v0, $zero, $zero           # v0 = 00000000
    jr      $ra
    nop


func_800B5B00:
# MqDbg: AudioHeap_AllocPermanent
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    lui     t6, 0x8013                 # t6 = 80130000
    lw      t6, -0x7C74(t6)            # 8012838C
    sw      a0, 0x0020($sp)
    sw      $ra, 0x0014($sp)
    sw      a1, 0x0024($sp)
    lui     a0, 0x8013                 # a0 = 80130000
    sw      a2, 0x0028($sp)
    addiu   a0, a0, 0x8380             # a0 = 80128380
    or      a1, a2, $zero              # a1 = 00000000
    jal     func_800B399C
    sw      t6, 0x0018($sp)
    lw      t7, 0x0018($sp)
    lui     t9, 0x8012                 # t9 = 80120000
    addiu   t9, t9, 0x5630             # t9 = 80125630
    sll     t8, t7,  2
    subu    t8, t8, t7
    sll     t8, t8,  2
    addu    v1, t8, t9
    bne     v0, $zero, lbl_800B5B5C
    sw      v0, 0x2D60(v1)             # 00002D60
    b       lbl_800B5B74
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B5B5C:
    lw      t0, 0x0020($sp)
    lw      t1, 0x0024($sp)
    lw      t2, 0x0028($sp)
    sh      t0, 0x2D68(v1)             # 00002D68
    sh      t1, 0x2D6A(v1)             # 00002D6A
    sw      t2, 0x2D64(v1)             # 00002D64
lbl_800B5B74:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800B5B84:
# MqDbg: AudioHeap_AllocSampleCache
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    lw      t6, 0x0028($sp)
    sw      $ra, 0x0014($sp)
    sw      a1, 0x001C($sp)
    sw      a2, 0x0020($sp)
    bne     t6, $zero, lbl_800B5BB0
    sw      a3, 0x0024($sp)
    jal     func_800B5C8C
    nop
    b       lbl_800B5BBC
    or      v1, v0, $zero              # v1 = 00000000
lbl_800B5BB0:
    jal     func_800B61B8
    nop
    or      v1, v0, $zero              # v1 = 00000000
lbl_800B5BBC:
    beq     v0, $zero, lbl_800B5BE0
    lw      t7, 0x001C($sp)
    sb      t7, 0x0002(v1)             # 00000002
    lw      t8, 0x0020($sp)
    lw      v0, 0x0008(v1)             # 00000008
    sw      t8, 0x000C(v1)             # 0000000C
    lb      t9, 0x0027($sp)
    b       lbl_800B5BE4
    sb      t9, 0x0001(v1)             # 00000001
lbl_800B5BE0:
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B5BE4:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800B5BF4:
# MqDbg: AudioHeap_InitSampleCaches
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      a0, 0x0018($sp)
    sw      $ra, 0x0014($sp)
    sw      a1, 0x001C($sp)
    lui     a0, 0x8012                 # a0 = 80120000
    addiu   a0, a0, 0x7FF0             # a0 = 80127FF0
    jal     func_800B3870
    lw      a1, 0x0018($sp)
    bne     v0, $zero, lbl_800B5C28
    or      a1, v0, $zero              # a1 = 00000000
    lui     $at, 0x8013                # $at = 80130000
    b       lbl_800B5C38
    sw      $zero, -0x7AE8($at)        # 80128518
lbl_800B5C28:
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0x8510             # a0 = 80128510
    jal     func_800B39F4
    lw      a2, 0x0018($sp)
lbl_800B5C38:
    lui     a0, 0x8012                 # a0 = 80120000
    addiu   a0, a0, 0x7FF0             # a0 = 80127FF0
    jal     func_800B3870
    lw      a1, 0x001C($sp)
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x5630             # v1 = 80125630
    bne     v0, $zero, lbl_800B5C60
    or      a1, v0, $zero              # a1 = 00000000
    b       lbl_800B5C78
    sw      $zero, 0x317C(v1)          # 801287AC
lbl_800B5C60:
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0x87A4             # a0 = 801287A4
    jal     func_800B39F4
    lw      a2, 0x001C($sp)
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x5630             # v1 = 80125630
lbl_800B5C78:
    lw      $ra, 0x0014($sp)
    sw      $zero, 0x3170(v1)          # 801287A0
    sw      $zero, 0x3404(v1)          # 80128A34
    jr      $ra
    addiu   $sp, $sp, 0x0018           # $sp += 0x18


func_800B5C8C:
# MqDbg: AudioHeap_AllocTemporarySampleCacheEntry
    addiu   $sp, $sp, 0xFFB8           # $sp -= 0x48
    sw      s6, 0x002C($sp)
    sw      a0, 0x0048($sp)
    lui     a0, 0x8013                 # a0 = 80130000
    lui     s6, 0x8012                 # s6 = 80120000
    addiu   s6, s6, 0x5630             # s6 = 80125630
    addiu   a0, a0, 0x87A4             # a0 = 801287A4
    sw      $ra, 0x0034($sp)
    sw      s4, 0x0024($sp)
    sw      s3, 0x0020($sp)
    sw      s7, 0x0030($sp)
    sw      s5, 0x0028($sp)
    sw      s2, 0x001C($sp)
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    or      s4, a0, $zero              # s4 = 801287A4
    lw      s3, 0x3178(s6)             # 801287A8
    jal     func_800B399C
    lw      a1, 0x0048($sp)
    bne     v0, $zero, lbl_800B5D28
    sw      v0, 0x003C($sp)
    lui     t6, 0x8013                 # t6 = 80130000
    lw      t6, -0x785C(t6)            # 801287A4
    lui     s0, 0x8013                 # s0 = 80130000
    lw      s0, -0x7858(s0)            # 801287A8
    lui     $at, 0x8013                # $at = 80130000
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0x87A4             # a0 = 801287A4
    lw      a1, 0x0048($sp)
    jal     func_800B399C
    sw      t6, -0x7858($at)           # 801287A8
    bne     v0, $zero, lbl_800B5D20
    sw      v0, 0x003C($sp)
    lui     $at, 0x8013                # $at = 80130000
    sw      s0, -0x7858($at)           # 801287A8
    b       lbl_800B5EF8
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B5D20:
    lui     s3, 0x8013                 # s3 = 80130000
    lw      s3, -0x785C(s3)            # 801287A4
lbl_800B5D28:
    lw      a3, 0x176C(s6)             # 80126D9C
    lui     s2, 0x8013                 # s2 = 80130000
    lw      s2, -0x7858(s2)            # 801287A8
    addiu   s5, $zero, 0xFFFF          # s5 = FFFFFFFF
    blez    a3, lbl_800B5E0C
    or      s1, $zero, $zero           # s1 = 00000000
    lui     a2, 0x8012                 # a2 = 80120000
    addiu   a2, a2, 0x5630             # a2 = 80125630
    addiu   s7, $zero, 0x0001          # s7 = 00000001
    lw      t7, 0x0D78(a2)             # 801263A8
lbl_800B5D50:
    lui     t6, 0x8012                 # t6 = 80120000
    addiu   t6, t6, 0x5630             # t6 = 80125630
    bne     t7, $zero, lbl_800B5DE8
    addiu   a0, a2, 0x0D68             # a0 = 80126398
    lw      t8, 0x0004(a0)             # 8012639C
    lw      v0, 0x0008(a0)             # 801263A0
    lui     $at, 0x00FF                # $at = 00FF0000
    lw      t9, 0x0000(t8)             # 00000000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    or      v1, v0, $zero              # v1 = 00000000
    and     t0, t9, $at
    addu    a1, v0, t0
    addiu   a1, a1, 0xFFFF             # a1 = FFFFFFFF
    sltu    $at, a1, s3
    beq     $at, $zero, lbl_800B5DB0
    sltu    $at, v0, s3
    beq     $at, $zero, lbl_800B5DB0
    sll     t1, a3,  2
    addu    t1, t1, a3
    lui     t2, 0x8012                 # t2 = 80120000
    addiu   t2, t2, 0x5630             # t2 = 80125630
    sll     t1, t1,  2
    b       lbl_800B5DF8
    addu    v0, t1, t2
lbl_800B5DB0:
    sltu    $at, a1, s2
    bne     $at, $zero, lbl_800B5DDC
    sltu    $at, v1, s2
    bne     $at, $zero, lbl_800B5DDC
    sll     t3, a3,  2
    addu    t3, t3, a3
    lui     t4, 0x8012                 # t4 = 80120000
    addiu   t4, t4, 0x5630             # t4 = 80125630
    sll     t3, t3,  2
    b       lbl_800B5DF8
    addu    v0, t3, t4
lbl_800B5DDC:
    sw      s7, 0x0010(a0)             # 801263A8
    lui     a3, 0x8012                 # a3 = 80120000
    lw      a3, 0x6D9C(a3)             # 80126D9C
lbl_800B5DE8:
    sll     t5, a3,  2
    addu    t5, t5, a3
    sll     t5, t5,  2
    addu    v0, t5, t6
lbl_800B5DF8:
    addiu   a2, a2, 0x0014             # a2 = 80125644
    sltu    $at, a2, v0
    bnel    $at, $zero, lbl_800B5D50
    lw      t7, 0x0D78(a2)             # 801263BC
    or      s1, $zero, $zero           # s1 = 00000000
lbl_800B5E0C:
    lui     t7, 0x8013                 # t7 = 80130000
    lw      t7, -0x75CC(t7)            # 80128A34
    lui     s0, 0x8013                 # s0 = 80130000
    addiu   s7, $zero, 0x0001          # s7 = 00000001
    blez    t7, lbl_800B5EAC
    addiu   s0, s0, 0x87A4             # s0 = 801287A4
    addiu   s6, $zero, 0xFFFF          # s6 = FFFFFFFF
lbl_800B5E28:
    lb      t8, 0x0010(s0)             # 801287B4
    bnel    t8, $zero, lbl_800B5E40
    lw      v1, 0x0018(s0)             # 801287BC
    b       lbl_800B5E9C
    lw      v0, 0x0290(s4)             # 80128A34
    lw      v1, 0x0018(s0)             # 801287BC
lbl_800B5E40:
    lw      t9, 0x0020(s0)             # 801287C4
    addu    a1, t9, v1
    addiu   a1, a1, 0xFFFF             # a1 = FFFFFFFE
    sltu    $at, a1, s3
    beq     $at, $zero, lbl_800B5E68
    sltu    $at, v1, s3
    beql    $at, $zero, lbl_800B5E6C
    sltu    $at, a1, s2
    b       lbl_800B5E9C
    lw      v0, 0x0290(s4)             # 80128A34
lbl_800B5E68:
    sltu    $at, a1, s2
lbl_800B5E6C:
    bne     $at, $zero, lbl_800B5E84
    sltu    $at, v1, s2
    bne     $at, $zero, lbl_800B5E84
    nop
    b       lbl_800B5E9C
    lw      v0, 0x0290(s4)             # 80128A34
lbl_800B5E84:
    jal     func_800B6098
    addiu   a0, s0, 0x0010             # a0 = 801287B4
    bnel    s5, s6, lbl_800B5E9C
    lw      v0, 0x0290(s4)             # 80128A34
    or      s5, s1, $zero              # s5 = 00000000
    lw      v0, 0x0290(s4)             # 80128A34
lbl_800B5E9C:
    addiu   s1, s1, 0x0001             # s1 = 00000001
    slt     $at, s1, v0
    bne     $at, $zero, lbl_800B5E28
    addiu   s0, s0, 0x0014             # s0 = 801287B8
lbl_800B5EAC:
    addiu   s6, $zero, 0xFFFF          # s6 = FFFFFFFF
    bne     s5, s6, lbl_800B5ECC
    lui     t3, 0x8013                 # t3 = 80130000
    lui     t0, 0x8013                 # t0 = 80130000
    lw      s5, -0x75CC(t0)            # 80128A34
    lui     $at, 0x8013                # $at = 80130000
    addiu   t1, s5, 0x0001             # t1 = 00000001
    sw      t1, -0x75CC($at)           # 80128A34
lbl_800B5ECC:
    sll     t2, s5,  2
    addu    t2, t2, s5
    sll     t2, t2,  2
    addiu   t3, t3, 0x87A4             # t3 = 801287A4
    addu    v1, t2, t3
    lw      t4, 0x003C($sp)
    lw      t5, 0x0048($sp)
    sb      s7, 0x0010(v1)             # 00000010
    addiu   v0, v1, 0x0010             # v0 = 00000010
    sw      t4, 0x0018(v1)             # 00000018
    sw      t5, 0x0020(v1)             # 00000020
lbl_800B5EF8:
    lw      $ra, 0x0034($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    lw      s4, 0x0024($sp)
    lw      s5, 0x0028($sp)
    lw      s6, 0x002C($sp)
    lw      s7, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0048           # $sp += 0x48


func_800B5F24:
# MqDbg: AudioHeap_UnapplySampleCacheForFont
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      s5, 0x002C($sp)
    lui     s5, 0x8012                 # s5 = 80120000
    addiu   s5, s5, 0x5630             # s5 = 80125630
    sw      s3, 0x0024($sp)
    lw      t6, 0x2844(s5)             # 80127E74
    sll     s3, a1,  2
    addu    s3, s3, a1
    sll     s3, s3,  2
    sw      $ra, 0x0034($sp)
    sw      s6, 0x0030($sp)
    sw      s4, 0x0028($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    addu    v0, t6, s3
    lbu     t7, 0x0000(v0)             # 00000000
    or      s2, a0, $zero              # s2 = 00000000
    or      s4, a1, $zero              # s4 = 00000000
    blez    t7, lbl_800B5FE8
    or      s1, $zero, $zero           # s1 = 00000000
    addiu   s6, $zero, 0x007F          # s6 = 0000007F
    or      a0, s4, $zero              # a0 = 00000000
lbl_800B5F80:
    jal     func_800BCA58
    or      a1, s1, $zero              # a1 = 00000000
    beq     v0, $zero, lbl_800B5FCC
    or      s0, v0, $zero              # s0 = 00000000
    lbu     t8, 0x0001(v0)             # 00000001
    or      a0, s2, $zero              # a0 = 00000000
    beql    t8, $zero, lbl_800B5FAC
    lbu     t9, 0x0002(s0)             # 00000002
    jal     func_800B6174
    lw      a1, 0x0008(v0)             # 00000008
    lbu     t9, 0x0002(s0)             # 00000002
lbl_800B5FAC:
    or      a0, s2, $zero              # a0 = 00000000
    beql    s6, t9, lbl_800B5FC4
    or      a0, s2, $zero              # a0 = 00000000
    jal     func_800B6174
    lw      a1, 0x0018(s0)             # 00000018
    or      a0, s2, $zero              # a0 = 00000000
lbl_800B5FC4:
    jal     func_800B6174
    lw      a1, 0x0010(s0)             # 00000010
lbl_800B5FCC:
    lw      t0, 0x2844(s5)             # 80127E74
    addiu   s1, s1, 0x0001             # s1 = 00000001
    addu    v0, t0, s3
    lbu     t1, 0x0000(v0)             # 00000000
    slt     $at, s1, t1
    bnel    $at, $zero, lbl_800B5F80
    or      a0, s4, $zero              # a0 = 00000000
lbl_800B5FE8:
    lbu     t2, 0x0001(v0)             # 00000001
    or      s0, $zero, $zero           # s0 = 00000000
    blez    t2, lbl_800B602C
    or      a0, s4, $zero              # a0 = 00000000
lbl_800B5FF8:
    jal     func_800BCB2C
    or      a1, s0, $zero              # a1 = 00000000
    beq     v0, $zero, lbl_800B6010
    or      a0, s2, $zero              # a0 = 00000000
    jal     func_800B6174
    lw      a1, 0x0004(v0)             # 00000004
lbl_800B6010:
    lw      t3, 0x2844(s5)             # 80127E74
    addiu   s0, s0, 0x0001             # s0 = 00000001
    addu    v0, t3, s3
    lbu     t4, 0x0001(v0)             # 00000001
    slt     $at, s0, t4
    bnel    $at, $zero, lbl_800B5FF8
    or      a0, s4, $zero              # a0 = 00000000
lbl_800B602C:
    lhu     t5, 0x0004(v0)             # 00000004
    or      s0, $zero, $zero           # s0 = 00000000
    blez    t5, lbl_800B6070
    or      a0, s4, $zero              # a0 = 00000000
lbl_800B603C:
    jal     func_800BCC10
    or      a1, s0, $zero              # a1 = 00000000
    beq     v0, $zero, lbl_800B6054
    or      a0, s2, $zero              # a0 = 00000000
    jal     func_800B6174
    lw      a1, 0x0000(v0)             # 00000000
lbl_800B6054:
    lw      t6, 0x2844(s5)             # 80127E74
    addiu   s0, s0, 0x0001             # s0 = 00000001
    addu    t7, t6, s3
    lhu     t8, 0x0004(t7)             # 00000004
    slt     $at, s0, t8
    bnel    $at, $zero, lbl_800B603C
    or      a0, s4, $zero              # a0 = 00000000
lbl_800B6070:
    lw      $ra, 0x0034($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    lw      s3, 0x0024($sp)
    lw      s4, 0x0028($sp)
    lw      s5, 0x002C($sp)
    lw      s6, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038           # $sp += 0x38


func_800B6098:
# MqDbg: AudioHeap_DiscardSampleCacheEntry
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      s5, 0x0028($sp)
    lui     s5, 0x8012                 # s5 = 80120000
    addiu   s5, s5, 0x5630             # s5 = 80125630
    lw      t6, 0x2834(s5)             # 80127E64
    sw      $ra, 0x002C($sp)
    sw      s4, 0x0024($sp)
    sw      s3, 0x0020($sp)
    sw      s2, 0x001C($sp)
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    lh      s4, 0x0000(t6)             # 00000000
    or      s2, a0, $zero              # s2 = 00000000
    or      s0, $zero, $zero           # s0 = 00000000
    blez    s4, lbl_800B6150
    or      s1, $zero, $zero           # s1 = 00000000
    addiu   s3, $zero, 0x00FF          # s3 = 000000FF
lbl_800B60DC:
    lw      t7, 0x2844(s5)             # 80127E74
    lb      a1, 0x0002(s2)             # 00000002
    addu    v0, t7, s1
    lbu     v1, 0x0002(v0)             # 00000002
    lbu     a0, 0x0003(v0)             # 00000003
    beq     v1, s3, lbl_800B6100
    nop
    beql    v1, a1, lbl_800B6118
    addiu   a0, $zero, 0x0001          # a0 = 00000001
lbl_800B6100:
    beq     a0, s3, lbl_800B6110
    nop
    beql    a0, a1, lbl_800B6118
    addiu   a0, $zero, 0x0001          # a0 = 00000001
lbl_800B6110:
    bne     a1, $zero, lbl_800B6144
    addiu   a0, $zero, 0x0001          # a0 = 00000001
lbl_800B6118:
    addiu   a1, $zero, 0x0002          # a1 = 00000002
    jal     func_800B4634
    or      a2, s0, $zero              # a2 = 00000000
    beql    v0, $zero, lbl_800B6148
    addiu   s0, s0, 0x0001             # s0 = 00000001
    jal     func_800B6E70
    or      a0, s0, $zero              # a0 = 00000001
    beq     v0, $zero, lbl_800B6144
    or      a0, s2, $zero              # a0 = 00000000
    jal     func_800B5F24
    or      a1, s0, $zero              # a1 = 00000001
lbl_800B6144:
    addiu   s0, s0, 0x0001             # s0 = 00000002
lbl_800B6148:
    bne     s0, s4, lbl_800B60DC
    addiu   s1, s1, 0x0014             # s1 = 00000014
lbl_800B6150:
    lw      $ra, 0x002C($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    lw      s4, 0x0024($sp)
    lw      s5, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030           # $sp += 0x30


func_800B6174:
# MqDbg: AudioHeap_UnapplySampleCache
    beq     a1, $zero, lbl_800B61B0
    nop
    lw      t6, 0x0008(a0)             # 00000008
    lw      t7, 0x0004(a1)             # 00000004
    bne     t6, t7, lbl_800B61B0
    nop
    lw      t8, 0x000C(a0)             # 0000000C
    lbu     t3, 0x0000(a1)             # 00000000
    sw      t8, 0x0004(a1)             # 00000004
    lb      t0, 0x0001(a0)             # 00000001
    andi    t4, t3, 0xFFF3             # t4 = 00000000
    sll     t1, t0,  2
    andi    t2, t1, 0x000C             # t2 = 00000000
    or      t5, t2, t4                 # t5 = 00000000
    sb      t5, 0x0000(a1)             # 00000000
lbl_800B61B0:
    jr      $ra
    nop


func_800B61B8:
# MqDbg: AudioHeap_AllocPersistentSampleCacheEntry
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      a0, 0x0018($sp)
    sw      $ra, 0x0014($sp)
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0x8510             # a0 = 80128510
    jal     func_800B399C
    lw      a1, 0x0018($sp)
    bne     v0, $zero, lbl_800B61E4
    or      a0, v0, $zero              # a0 = 00000000
    b       lbl_800B6230
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800B61E4:
    lui     t6, 0x8013                 # t6 = 80130000
    lw      t6, -0x7860(t6)            # 801287A0
    lui     t9, 0x8013                 # t9 = 80130000
    addiu   t9, t9, 0x8510             # t9 = 80128510
    sll     t7, t6,  2
    addu    t7, t7, t6
    sll     t7, t7,  2
    addiu   t8, t7, 0x0010             # t8 = 00000010
    addu    v0, t8, t9
    addiu   t0, $zero, 0x0001          # t0 = 00000001
    sb      t0, 0x0000(v0)             # 00000000
    sw      a0, 0x0008(v0)             # 00000008
    lw      t1, 0x0018($sp)
    lui     t2, 0x8013                 # t2 = 80130000
    lui     $at, 0x8013                # $at = 80130000
    sw      t1, 0x0010(v0)             # 00000010
    lw      t2, -0x7860(t2)            # 801287A0
    addiu   t3, t2, 0x0001             # t3 = 80130001
    sw      t3, -0x7860($at)           # 801287A0
lbl_800B6230:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800B6240:
# MqDbg: AudioHeap_DiscardSampleCacheForFont
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lb      v0, 0x0002(a0)             # 00000002
    beq     a1, v0, lbl_800B6264
    nop
    beq     a2, v0, lbl_800B6264
    nop
    bnel    v0, $zero, lbl_800B6270
    lw      $ra, 0x0014($sp)
lbl_800B6264:
    jal     func_800B5F24
    or      a1, a3, $zero              # a1 = 00000000
    lw      $ra, 0x0014($sp)
lbl_800B6270:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800B627C:
# MqDbg: AudioHeap_DiscardSampleCaches
    addiu   $sp, $sp, 0xFFC0           # $sp -= 0x40
    sw      s5, 0x002C($sp)
    lui     s5, 0x8012                 # s5 = 80120000
    addiu   s5, s5, 0x5630             # s5 = 80125630
    lw      t6, 0x2834(s5)             # 80127E64
    sw      $ra, 0x003C($sp)
    sw      s8, 0x0038($sp)
    sw      s7, 0x0034($sp)
    sw      s6, 0x0030($sp)
    sw      s4, 0x0028($sp)
    sw      s3, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    lh      s8, 0x0000(t6)             # 00000000
    or      s4, $zero, $zero           # s4 = 00000000
    or      s6, $zero, $zero           # s6 = 00000000
    blez    s8, lbl_800B639C
    addiu   s7, $zero, 0x00FF          # s7 = 000000FF
lbl_800B62C8:
    lw      t7, 0x2844(s5)             # 80127E74
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    addiu   a1, $zero, 0x0003          # a1 = 00000003
    addu    v0, t7, s6
    lbu     s2, 0x0002(v0)             # 00000002
    lbu     s3, 0x0003(v0)             # 00000003
    bne     s2, s7, lbl_800B62F0
    nop
    beql    s3, s7, lbl_800B6394
    addiu   s4, s4, 0x0001             # s4 = 00000001
lbl_800B62F0:
    jal     func_800B4634
    or      a2, s4, $zero              # a2 = 00000001
    beql    v0, $zero, lbl_800B6394
    addiu   s4, s4, 0x0001             # s4 = 00000002
    jal     func_800B6E70
    or      a0, s4, $zero              # a0 = 00000002
    beql    v0, $zero, lbl_800B6394
    addiu   s4, s4, 0x0001             # s4 = 00000003
    lw      t8, 0x3170(s5)             # 801287A0
    lui     s1, 0x8013                 # s1 = 80130000
    addiu   s1, s1, 0x8520             # s1 = 80128520
    blez    t8, lbl_800B6354
    or      s0, $zero, $zero           # s0 = 00000000
    or      a0, s1, $zero              # a0 = 80128520
lbl_800B6328:
    or      a1, s2, $zero              # a1 = 00000000
    or      a2, s3, $zero              # a2 = 00000000
    jal     func_800B6240
    or      a3, s4, $zero              # a3 = 00000003
    lw      t9, 0x3170(s5)             # 801287A0
    addiu   s0, s0, 0x0001             # s0 = 00000001
    addiu   s1, s1, 0x0014             # s1 = 80128534
    slt     $at, s0, t9
    bnel    $at, $zero, lbl_800B6328
    or      a0, s1, $zero              # a0 = 80128534
    or      s0, $zero, $zero           # s0 = 00000000
lbl_800B6354:
    lw      t0, 0x3404(s5)             # 80128A34
    lui     s1, 0x8013                 # s1 = 80130000
    addiu   s1, s1, 0x87B4             # s1 = 801287B4
    blez    t0, lbl_800B6390
    or      a0, s1, $zero              # a0 = 801287B4
lbl_800B6368:
    or      a1, s2, $zero              # a1 = 00000000
    or      a2, s3, $zero              # a2 = 00000000
    jal     func_800B6240
    or      a3, s4, $zero              # a3 = 00000003
    lw      t1, 0x3404(s5)             # 80128A34
    addiu   s0, s0, 0x0001             # s0 = 00000001
    addiu   s1, s1, 0x0014             # s1 = 801287C8
    slt     $at, s0, t1
    bnel    $at, $zero, lbl_800B6368
    or      a0, s1, $zero              # a0 = 801287C8
lbl_800B6390:
    addiu   s4, s4, 0x0001             # s4 = 00000004
lbl_800B6394:
    bne     s4, s8, lbl_800B62C8
    addiu   s6, s6, 0x0014             # s6 = 00000014
lbl_800B639C:
    lw      $ra, 0x003C($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    lw      s3, 0x0024($sp)
    lw      s4, 0x0028($sp)
    lw      s5, 0x002C($sp)
    lw      s6, 0x0030($sp)
    lw      s7, 0x0034($sp)
    lw      s8, 0x0038($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0040           # $sp += 0x40


func_800B63CC:
# MqDbg: AudioHeap_ChangeStorage
    beq     a1, $zero, lbl_800B6424
    nop
    lw      v1, 0x0000(a0)             # 00000000
    lw      a3, 0x0004(a1)             # 00000004
    lw      t6, 0x0008(a0)             # 00000008
    sltu    $at, a3, v1
    bne     $at, $zero, lbl_800B6424
    addu    a2, v1, t6
    sltu    $at, a3, a2
    beq     $at, $zero, lbl_800B6424
    nop
    lw      t8, 0x0004(a0)             # 00000004
    subu    t7, a3, v1
    lbu     t5, 0x0000(a1)             # 00000000
    addu    t9, t7, t8
    sw      t9, 0x0004(a1)             # 00000004
    lbu     t2, 0x000C(a0)             # 0000000C
    andi    t6, t5, 0xFFF3             # t6 = 00000000
    sll     t3, t2,  2
    andi    t4, t3, 0x000C             # t4 = 00000000
    or      t7, t4, t6                 # t7 = 00000000
    sb      t7, 0x0000(a1)             # 00000000
lbl_800B6424:
    jr      $ra
    nop


func_800B642C:
# MqDbg: AudioHeap_DiscardSampleBank
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    or      a1, a0, $zero              # a1 = 00000000
    jal     func_800B6474
    or      a0, $zero, $zero           # a0 = 00000000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800B6450:
# MqDbg: AudioHeap_ApplySampleBankCache
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    or      a1, a0, $zero              # a1 = 00000000
    jal     func_800B6474
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800B6474:
# MqDbg: AudioHeap_ApplySampleBankCacheInternal
    addiu   $sp, $sp, 0xFF60           # $sp -= 0xA0
    sw      s7, 0x0034($sp)
    lui     s7, 0x8012                 # s7 = 80120000
    addiu   s7, s7, 0x5630             # s7 = 80125630
    lw      t6, 0x2834(s7)             # 80127E64
    sw      $ra, 0x003C($sp)
    sw      s8, 0x0038($sp)
    sw      s6, 0x0030($sp)
    sw      s5, 0x002C($sp)
    sw      s4, 0x0028($sp)
    sw      s3, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    sw      a1, 0x00A4($sp)
    lh      t7, 0x0000(t6)             # 00000000
    or      s1, a0, $zero              # s1 = 00000000
    lw      s0, 0x2838(s7)             # 80127E68
    addiu   a0, $zero, 0x0002          # a0 = 00000002
    lw      a2, 0x00A4($sp)
    addiu   a1, $zero, 0x0002          # a1 = 00000002
    jal     func_800B4634
    sw      t7, 0x0094($sp)
    beq     v0, $zero, lbl_800B66D8
    sw      v0, 0x0078($sp)
    lw      t8, 0x00A4($sp)
    addiu   $at, $zero, 0x0002         # $at = 00000002
    or      s6, $zero, $zero           # s6 = 00000000
    sll     t9, t8,  4
    addu    v0, s0, t9
    lw      t0, 0x0014(v0)             # 00000014
    addiu   s8, $zero, 0x007F          # s8 = 0000007F
    addiu   s4, $sp, 0x0078            # s4 = FFFFFFD8
    sw      t0, 0x0080($sp)
    lb      t1, 0x0018(v0)             # 00000018
    andi    v1, t1, 0x00FF             # v1 = 00000000
    beq     v1, $at, lbl_800B6518
    sb      t1, 0x0084($sp)
    addiu   $at, $zero, 0x0003         # $at = 00000003
    bnel    v1, $at, lbl_800B6528
    sw      $zero, 0x007C($sp)
lbl_800B6518:
    lw      t2, 0x0010(v0)             # 00000010
    b       lbl_800B6528
    sw      t2, 0x007C($sp)
    sw      $zero, 0x007C($sp)
lbl_800B6528:
    beq     s1, $zero, lbl_800B6548
    addiu   $at, $zero, 0x0001         # $at = 00000001
    bne     s1, $at, lbl_800B6548
    lw      v0, 0x007C($sp)
    lw      t3, 0x0078($sp)
    sw      v0, 0x0078($sp)
    sb      $zero, 0x0084($sp)
    sw      t3, 0x007C($sp)
lbl_800B6548:
    lw      t4, 0x0094($sp)
    or      s5, $zero, $zero           # s5 = 00000000
    blezl   t4, lbl_800B66DC
    lw      $ra, 0x003C($sp)
    lw      t5, 0x2844(s7)             # 80127E74
lbl_800B655C:
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    addu    v0, t5, s6
    lbu     s0, 0x0002(v0)             # 00000002
    lbu     s1, 0x0003(v0)             # 00000003
    bne     s0, $at, lbl_800B657C
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    beql    s1, $at, lbl_800B66C8
    lw      t1, 0x0094($sp)
lbl_800B657C:
    jal     func_800B6E70
    or      a0, s5, $zero              # a0 = 00000000
    beq     v0, $zero, lbl_800B66C4
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    addiu   a1, $zero, 0x0002          # a1 = 00000002
    jal     func_800B4634
    or      a2, s5, $zero              # a2 = 00000000
    beq     v0, $zero, lbl_800B66C4
    lw      t6, 0x00A4($sp)
    bne     s0, t6, lbl_800B65B8
    lw      t7, 0x00A4($sp)
    or      s1, $zero, $zero           # s1 = 00000000
    or      s2, $zero, $zero           # s2 = 00000000
    b       lbl_800B65C8
    or      s3, $zero, $zero           # s3 = 00000000
lbl_800B65B8:
    bne     s1, t7, lbl_800B66C4
    or      s2, $zero, $zero           # s2 = 00000000
    or      s1, $zero, $zero           # s1 = 00000000
    or      s3, $zero, $zero           # s3 = 00000000
lbl_800B65C8:
    lw      t8, 0x2844(s7)             # 80127E74
    addu    v0, t8, s6
    lbu     t9, 0x0000(v0)             # 00000000
    blez    t9, lbl_800B6644
    or      a0, s5, $zero              # a0 = 00000000
lbl_800B65DC:
    jal     func_800BCA58
    or      a1, s1, $zero              # a1 = 00000000
    beq     v0, $zero, lbl_800B6628
    or      s0, v0, $zero              # s0 = 00000000
    lbu     t0, 0x0001(v0)             # 00000001
    or      a0, s4, $zero              # a0 = FFFFFFD8
    beql    t0, $zero, lbl_800B6608
    lbu     t1, 0x0002(s0)             # 00000002
    jal     func_800B63CC
    lw      a1, 0x0008(v0)             # 00000008
    lbu     t1, 0x0002(s0)             # 00000002
lbl_800B6608:
    or      a0, s4, $zero              # a0 = FFFFFFD8
    beql    s8, t1, lbl_800B6620
    or      a0, s4, $zero              # a0 = FFFFFFD8
    jal     func_800B63CC
    lw      a1, 0x0018(s0)             # 00000018
    or      a0, s4, $zero              # a0 = FFFFFFD8
lbl_800B6620:
    jal     func_800B63CC
    lw      a1, 0x0010(s0)             # 00000010
lbl_800B6628:
    lw      t2, 0x2844(s7)             # 80127E74
    addiu   s1, s1, 0x0001             # s1 = 00000001
    addu    v0, t2, s6
    lbu     t3, 0x0000(v0)             # 00000000
    slt     $at, s1, t3
    bnel    $at, $zero, lbl_800B65DC
    or      a0, s5, $zero              # a0 = 00000000
lbl_800B6644:
    lbu     t4, 0x0001(v0)             # 00000001
    blez    t4, lbl_800B6684
    or      a0, s5, $zero              # a0 = 00000000
lbl_800B6650:
    jal     func_800BCB2C
    or      a1, s2, $zero              # a1 = 00000000
    beq     v0, $zero, lbl_800B6668
    or      a0, s4, $zero              # a0 = FFFFFFD8
    jal     func_800B63CC
    lw      a1, 0x0004(v0)             # 00000004
lbl_800B6668:
    lw      t5, 0x2844(s7)             # 80127E74
    addiu   s2, s2, 0x0001             # s2 = 00000001
    addu    v0, t5, s6
    lbu     t6, 0x0001(v0)             # 00000001
    slt     $at, s2, t6
    bnel    $at, $zero, lbl_800B6650
    or      a0, s5, $zero              # a0 = 00000000
lbl_800B6684:
    lhu     t7, 0x0004(v0)             # 00000004
    blez    t7, lbl_800B66C4
    or      a0, s5, $zero              # a0 = 00000000
lbl_800B6690:
    jal     func_800BCC10
    or      a1, s3, $zero              # a1 = 00000000
    beq     v0, $zero, lbl_800B66A8
    or      a0, s4, $zero              # a0 = FFFFFFD8
    jal     func_800B63CC
    lw      a1, 0x0000(v0)             # 00000000
lbl_800B66A8:
    lw      t8, 0x2844(s7)             # 80127E74
    addiu   s3, s3, 0x0001             # s3 = 00000001
    addu    t9, t8, s6
    lhu     t0, 0x0004(t9)             # 00000004
    slt     $at, s3, t0
    bnel    $at, $zero, lbl_800B6690
    or      a0, s5, $zero              # a0 = 00000000
lbl_800B66C4:
    lw      t1, 0x0094($sp)
lbl_800B66C8:
    addiu   s5, s5, 0x0001             # s5 = 00000001
    addiu   s6, s6, 0x0014             # s6 = 00000014
    bnel    s5, t1, lbl_800B655C
    lw      t5, 0x2844(s7)             # 80127E74
lbl_800B66D8:
    lw      $ra, 0x003C($sp)
lbl_800B66DC:
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    lw      s3, 0x0024($sp)
    lw      s4, 0x0028($sp)
    lw      s5, 0x002C($sp)
    lw      s6, 0x0030($sp)
    lw      s7, 0x0034($sp)
    lw      s8, 0x0038($sp)
    jr      $ra
    addiu   $sp, $sp, 0x00A0           # $sp += 0xA0


func_800B6708:
# MqDbg: AudioHeap_DiscardSampleBanks
    lui     t6, 0x8013                 # t6 = 80130000
    lh      t6, -0x7C9E(t6)            # 80128362
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      s0, 0x0018($sp)
    addiu   s0, $zero, 0xFFFF          # s0 = FFFFFFFF
    sw      $ra, 0x0024($sp)
    sw      s2, 0x0020($sp)
    beq     s0, t6, lbl_800B6734
    sw      s1, 0x001C($sp)
    jal     func_800B642C
    or      a0, t6, $zero              # a0 = 80130000
lbl_800B6734:
    lui     a0, 0x8013                 # a0 = 80130000
    lh      a0, -0x7C92(a0)            # 8012836E
    beq     s0, a0, lbl_800B674C
    nop
    jal     func_800B642C
    nop
lbl_800B674C:
    lui     t8, 0x8013                 # t8 = 80130000
    lw      t8, -0x7D90(t8)            # 80128270
    lui     t7, 0x8013                 # t7 = 80130000
    addiu   t7, t7, 0x8270             # t7 = 80128270
    or      s2, t7, $zero              # s2 = 80128270
    beq     t8, $zero, lbl_800B678C
    or      s0, $zero, $zero           # s0 = 00000000
    or      s1, t7, $zero              # s1 = 80128270
lbl_800B676C:
    jal     func_800B642C
    lh      a0, 0x001E(s1)             # 8012828E
    lw      t9, 0x0000(s2)             # 80128270
    addiu   s0, s0, 0x0001             # s0 = 00000001
    addiu   s1, s1, 0x000C             # s1 = 8012827C
    sltu    $at, s0, t9
    bne     $at, $zero, lbl_800B676C
    nop
lbl_800B678C:
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    nop
    nop
    nop
