# Audio Thread
#
# Starts at VRAM: 800BA5A0 / VROM: ??????
#

func_800BA5A0:
# MqDbg: func_800E4FE0
# Audio, Wrapper for 800BA5C0
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800BA5C0
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BA5C0:
# MqDbg: func_800E5000
# Audio, loads rcp microcode for audio processing
    addiu   $sp, $sp, 0xFF90           # $sp -= 0x70
    sw      s2, 0x0020($sp)
    lui     s2, 0x8012                 # s2 = 80120000
    addiu   s2, s2, 0x5630             # s2 = 80125630
    lw      t6, 0x289C(s2)             # 80127ECC
    lh      v1, 0x2848(s2)             # 80127E78
    sw      $ra, 0x0024($sp)
    addiu   t7, t6, 0x0001             # t7 = 00000001
    div     $zero, t7, v1
    or      a3, t7, $zero              # a3 = 00000001
    mfhi    a0
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    sw      t7, 0x289C(s2)             # 80127ECC
    bne     v1, $zero, lbl_800BA604
    nop
    break   # 0x01C00
lbl_800BA604:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     v1, $at, lbl_800BA61C
    lui     $at, 0x8000                # $at = 80000000
    bne     a3, $at, lbl_800BA61C
    nop
    break   # 0x01800
lbl_800BA61C:
    or      a1, a3, $zero              # a1 = 00000001
    beq     a0, $zero, lbl_800BA698
    or      a2, $zero, $zero           # a2 = 00000000
    lui     v0, 0x8013                 # v0 = 80130000
    lw      v0, -0x4580(v0)            # 8012BA80
    beql    v0, $zero, lbl_800BA680
    addiu   t9, a0, 0x0001             # t9 = 00000001
    jalr    $ra, v0
    nop
    lui     v1, 0x8012                 # v1 = 80120000
    lui     t8, 0x8012                 # t8 = 80120000
    lw      t8, 0x7ECC(t8)             # 80127ECC
    lh      v1, 0x7E78(v1)             # 80127E78
    div     $zero, t8, v1
    mfhi    a0
    bne     v1, $zero, lbl_800BA664
    nop
    break   # 0x01C00
lbl_800BA664:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     v1, $at, lbl_800BA67C
    lui     $at, 0x8000                # $at = 80000000
    bne     t8, $at, lbl_800BA67C
    nop
    break   # 0x01800
lbl_800BA67C:
    addiu   t9, a0, 0x0001             # t9 = 00000001
lbl_800BA680:
    bne     v1, t9, lbl_800BA690
    lui     v0, 0x8010                 # v0 = 80100000
    b       lbl_800BAB2C
    lw      v0, 0x17F4(v0)             # 801017F4
lbl_800BA690:
    b       lbl_800BAB2C
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BA698:
    jal     func_80001E20              # osSendMesg
    lw      a0, 0x5BE8(s2)             # 8012B218
    addiu   v1, $zero, 0x0003          # v1 = 00000003
    lw      t3, 0x28A8(s2)             # 80127ED8
    lw      t1, 0x28A4(s2)             # 80127ED4
    addiu   t4, t3, 0x0001             # t4 = 00000001
    div     $zero, t4, v1
    mfhi    t6
    addiu   t8, t6, 0x0001             # t8 = 00000001
    or      t5, t4, $zero              # t5 = 00000001
    div     $zero, t8, v1
    sw      t4, 0x28A8(s2)             # 80127ED8
    mfhi    s0
    xori    t2, t1, 0x0001             # t2 = 00000001
    sw      t2, 0x28A4(s2)             # 80127ED4
    bne     v1, $zero, lbl_800BA6E0
    nop
    break   # 0x01C00
lbl_800BA6E0:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     v1, $at, lbl_800BA6F8
    lui     $at, 0x8000                # $at = 80000000
    bne     t5, $at, lbl_800BA6F8
    nop
    break   # 0x01800
lbl_800BA6F8:
    sw      t6, 0x28A8(s2)             # 80127ED8
    or      t7, t6, $zero              # t7 = 00000000
    bne     v1, $zero, lbl_800BA70C
    nop
    break   # 0x01C00
lbl_800BA70C:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     v1, $at, lbl_800BA724
    lui     $at, 0x8000                # $at = 80000000
    bne     t8, $at, lbl_800BA724
    nop
    break   # 0x01800
lbl_800BA724:
    jal     func_800D32E0              # osAiGetLength
    nop
    lw      t1, 0x2984(s2)             # 80127FB4
    srl     t9, v0,  2
    sw      t9, 0x006C($sp)
    sltiu   $at, t1, 0x0010
    beq     $at, $zero, lbl_800BA76C
    sll     t2, s0,  1
    addu    a2, s2, t2
    lh      v0, 0x2974(a2)             # 00002974
    sll     t3, s0,  2
    addu    v1, s2, t3
    beq     v0, $zero, lbl_800BA76C
    sll     a1, v0,  2
    lw      a0, 0x2968(v1)             # 00002968
    sw      v1, 0x0034($sp)
    jal     func_800BBE80
    sw      a2, 0x003C($sp)
lbl_800BA76C:
    lui     v0, 0x8013                 # v0 = 80130000
    lw      v0, -0x4580(v0)            # 8012BA80
    beql    v0, $zero, lbl_800BA788
    lw      v1, 0x28A0(s2)             # 80127ED0
    jalr    $ra, v0
    nop
    lw      v1, 0x28A0(s2)             # 80127ED0
lbl_800BA788:
    lui     s1, 0x8012                 # s1 = 80120000
    addiu   s1, s1, 0x7500             # s1 = 80127500
    blez    v1, lbl_800BA7CC
    or      s0, $zero, $zero           # s0 = 00000000
    or      a0, s1, $zero              # a0 = 80127500
lbl_800BA79C:
    or      a1, $zero, $zero           # a1 = 00000000
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_80002030              # osRecvMesg
    sw      v1, 0x005C($sp)
    bne     v0, $zero, lbl_800BA7B8
    lw      v1, 0x005C($sp)
    addiu   v1, v1, 0xFFFF             # v1 = FFFFFFFF
lbl_800BA7B8:
    lw      t4, 0x28A0(s2)             # 80127ED0
    addiu   s0, s0, 0x0001             # s0 = 00000001
    slt     $at, s0, t4
    bnel    $at, $zero, lbl_800BA79C
    or      a0, s1, $zero              # a0 = 80127500
lbl_800BA7CC:
    lui     s1, 0x8012                 # s1 = 80120000
    beq     v1, $zero, lbl_800BA804
    addiu   s1, s1, 0x7500             # s1 = 80127500
    blez    v1, lbl_800BA804
    or      s0, $zero, $zero           # s0 = 00000000
    or      a0, s1, $zero              # a0 = 80127500
lbl_800BA7E4:
    or      a1, $zero, $zero           # a1 = 00000000
    addiu   a2, $zero, 0x0001          # a2 = 00000001
    jal     func_80002030              # osRecvMesg
    sw      v1, 0x005C($sp)
    lw      v1, 0x005C($sp)
    addiu   s0, s0, 0x0001             # s0 = 00000001
    bnel    s0, v1, lbl_800BA7E4
    or      a0, s1, $zero              # a0 = 80127500
lbl_800BA804:
    lw      v1, 0x1ED8(s2)             # 80127508
    beq     v1, $zero, lbl_800BA83C
    nop
    blez    v1, lbl_800BA83C
    or      s0, $zero, $zero           # s0 = 00000000
    or      a0, s1, $zero              # a0 = 80127500
lbl_800BA81C:
    or      a1, $zero, $zero           # a1 = 00000000
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_80002030              # osRecvMesg
    sw      v1, 0x0048($sp)
    lw      v1, 0x0048($sp)
    addiu   s0, s0, 0x0001             # s0 = 00000001
    bnel    s0, v1, lbl_800BA81C
    or      a0, s1, $zero              # a0 = 80127500
lbl_800BA83C:
    jal     func_800B67B0
    sw      $zero, 0x28A0(s2)          # 80127ED0
    jal     func_800B85AC
    lbu     a0, 0x3518(s2)             # 80128B48
    jal     func_800BA518
    nop
    lbu     t5, 0x3518(s2)             # 80128B48
    beql    t5, $zero, lbl_800BA8A0
    lw      t7, 0x2984(s2)             # 80127FB4
    jal     func_800B4EB4
    nop
    bnel    v0, $zero, lbl_800BA8A0
    lw      t7, 0x2984(s2)             # 80127FB4
    lbu     t6, 0x3518(s2)             # 80128B48
    or      a2, $zero, $zero           # a2 = 00000000
    bne     t6, $zero, lbl_800BA88C
    nop
    lw      a0, 0x5BE4(s2)             # 8012B214
    jal     func_80001E20              # osSendMesg
    lbu     a1, 0x3519(s2)             # 80128B49
lbl_800BA88C:
    lui     $at, 0x8010                # $at = 80100000
    sw      $zero, 0x17F4($at)         # 801017F4
    b       lbl_800BAB2C
    or      v0, $zero, $zero           # v0 = 00000000
    lw      t7, 0x2984(s2)             # 80127FB4
lbl_800BA8A0:
    sltiu   $at, t7, 0x0011
    bnel    $at, $zero, lbl_800BA8B8
    lw      t8, 0x2984(s2)             # 80127FB4
    b       lbl_800BAB2C
    or      v0, $zero, $zero           # v0 = 00000000
    lw      t8, 0x2984(s2)             # 80127FB4
lbl_800BA8B8:
    addiu   s1, $sp, 0x004C            # s1 = FFFFFFDC
    or      a1, s1, $zero              # a1 = FFFFFFDC
    beq     t8, $zero, lbl_800BA8D4
    or      a2, $zero, $zero           # a2 = 00000000
    lw      v0, 0x2984(s2)             # 80127FB4
    addiu   t9, v0, 0x0001             # t9 = 00000001
    sw      t9, 0x2984(s2)             # 80127FB4
lbl_800BA8D4:
    lw      v1, 0x28A4(s2)             # 80127ED4
    lw      s0, 0x28A8(s2)             # 80127ED8
    sll     t1, v1,  2
    addu    t1, t1, v1
    sll     t1, t1,  4
    addu    t2, s2, t1
    addiu   t3, t2, 0x28C0             # t3 = 000028C0
    sll     t4, v1,  2
    sw      t3, 0x28B8(s2)             # 80127EE8
    addu    t5, s2, t4
    lw      t6, 0x28AC(t5)             # 000028AC
    lw      t4, 0x006C($sp)
    lh      t3, 0x284E(s2)             # 80127E7E
    sll     t7, s0,  2
    addu    t8, s2, t7
    sw      t6, 0x28B4(s2)             # 80127EE4
    subu    t5, t3, t4
    sw      t8, 0x0034($sp)
    addiu   t6, t5, 0x0080             # t6 = 00000080
    lw      t1, 0x2968(t8)             # 00002968
    andi    t7, t6, 0xFFF0             # t7 = 00000080
    sll     t2, s0,  1
    addu    t0, s2, t2
    addiu   t8, t7, 0x0010             # t8 = 00000090
    sh      t8, 0x2974(t0)             # 00002974
    lh      a0, 0x2852(s2)             # 80127E82
    lh      v0, 0x2974(t0)             # 00002974
    sw      t1, 0x0058($sp)
    slt     $at, v0, a0
    beql    $at, $zero, lbl_800BA95C
    lh      v1, 0x2850(s2)             # 80127E80
    sh      a0, 0x2974(t0)             # 00002974
    lh      v0, 0x2974(t0)             # 00002974
    lh      v1, 0x2850(s2)             # 80127E80
lbl_800BA95C:
    slt     $at, v1, v0
    beql    $at, $zero, lbl_800BA970
    lbu     t9, 0x3518(s2)             # 80128B48
    sh      v1, 0x2974(t0)             # 00002974
    lbu     t9, 0x3518(s2)             # 80128B48
lbl_800BA970:
    or      s0, $zero, $zero           # s0 = 00000000
    sw      t0, 0x003C($sp)
    bnel    t9, $zero, lbl_800BA9E0
    lw      t0, 0x003C($sp)
    lw      a0, 0x5BEC(s2)             # 8012B21C
    jal     func_80002030              # osRecvMesg
    sw      t0, 0x003C($sp)
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    beq     v0, $at, lbl_800BA9C0
    nop
lbl_800BA998:
    jal     func_800BB32C
    lw      a0, 0x004C($sp)
    lw      a0, 0x5BEC(s2)             # 8012B21C
    or      a1, s1, $zero              # a1 = FFFFFFDC
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_80002030              # osRecvMesg
    addiu   s0, s0, 0x0001             # s0 = 00000001
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     v0, $at, lbl_800BA998
    nop
lbl_800BA9C0:
    bnel    s0, $zero, lbl_800BA9E0
    lw      t0, 0x003C($sp)
    lbu     t1, 0x5BDA(s2)             # 8012B20A
    beql    t1, $zero, lbl_800BA9E0
    lw      t0, 0x003C($sp)
    jal     func_800BB140
    nop
    lw      t0, 0x003C($sp)
lbl_800BA9E0:
    lw      a0, 0x28B4(s2)             # 80127EE4
    addiu   a1, $sp, 0x0068            # a1 = FFFFFFF8
    lw      a2, 0x0058($sp)
    jal     func_800B0684
    lh      a3, 0x2974(t0)             # 00002974
    jal     func_80004D50              # osGetCount
    sw      v0, 0x28B4(s2)             # 80127EE4
    lw      a3, 0x289C(s2)             # 80127ECC
    lw      t2, 0x297C(s2)             # 80127FAC
    lw      t5, 0x0034($sp)
    andi    t7, a3, 0x00FF             # t7 = 00000000
    addu    t3, t2, a3
    multu   v0, t3
    sll     t8, t7,  1
    lui     t7, 0x800C                 # t7 = 800C0000
    addiu   t7, t7, 0xA5A0             # t7 = 800BA5A0
    lui     $at, 0x8010                # $at = 80100000
    lui     a2, 0x8011                 # a2 = 80110000
    lui     t2, 0x8011                 # t2 = 80110000
    addiu   a2, a2, 0x42E0             # a2 = 801142E0
    addiu   t2, t2, 0x45C0             # t2 = 801145C0
    lui     a0, 0x800E                 # a0 = 800E0000
    mflo    t4
    sw      t4, 0x297C(s2)             # 80127FAC
    lw      t6, 0x2968(t5)             # 00002968
    addiu   a0, a0, 0x2FC0             # a0 = 800E2FC0
    addiu   a1, $zero, 0x1000          # a1 = 00001000
    addu    t9, t6, t8
    lh      t1, 0x0000(t9)             # 00000000
    addu    t3, t1, t4
    andi    t5, t3, 0xFFF0             # t5 = 00000000
    sw      t3, 0x297C(s2)             # 80127FAC
    addu    t6, t5, t7
    sw      t6, 0x03C0($at)            # 801003C0
    lw      t8, 0x28B8(s2)             # 80127EE8
    lw      s0, 0x28A4(s2)             # 80127ED4
    subu    t3, t2, a2
    sw      $zero, 0x0040(t8)          # 00000040
    lw      t9, 0x28B8(s2)             # 80127EE8
    sra     t4, t3,  3
    sll     t5, t4,  3
    sw      $zero, 0x0044(t9)          # 00000044
    lw      v1, 0x28B8(s2)             # 80127EE8
    addiu   t1, $zero, 0x0002          # t1 = 00000002
    addiu   t7, t5, 0xFFFF             # t7 = FFFFFFFF
    sll     t6, s0,  2
    addu    t8, s2, t6
    sw      t1, 0x0000(v1)             # 00000000
    sw      $zero, 0x0004(v1)          # 00000004
    sw      a0, 0x0008(v1)             # 00000008
    sw      a1, 0x000C(v1)             # 0000000C
    sw      t7, 0x001C(v1)             # 0000001C
    sw      a0, 0x0010(v1)             # 00000010
    sw      a2, 0x0018(v1)             # 00000018
    sw      a1, 0x0014(v1)             # 00000014
    sw      $zero, 0x0020(v1)          # 00000020
    sw      $zero, 0x0024(v1)          # 00000024
    sw      $zero, 0x0028(v1)          # 00000028
    sw      $zero, 0x002C(v1)          # 0000002C
    lw      t9, 0x28AC(t8)             # 000028AC
    lui     t3, 0x8010                 # t3 = 80100000
    sw      t9, 0x0030(v1)             # 00000030
    lw      t1, 0x0068($sp)
    sw      $zero, 0x0038(v1)          # 00000038
    sw      $zero, 0x003C(v1)          # 0000003C
    sll     t2, t1,  3
    sw      t2, 0x0034(v1)             # 00000034
    lw      t4, 0x0068($sp)
    lw      t3, 0x17F0(t3)             # 801017F0
    slt     $at, t3, t4
    beq     $at, $zero, lbl_800BAB04
    lui     $at, 0x8010                # $at = 80100000
    sw      t4, 0x17F0($at)            # 801017F0
lbl_800BAB04:
    lh      t5, 0x2848(s2)             # 80127E78
    addiu   $at, $zero, 0x0001         # $at = 00000001
    bnel    t5, $at, lbl_800BAB20
    lw      t7, 0x28B8(s2)             # 80127EE8
    b       lbl_800BAB2C
    lw      v0, 0x28B8(s2)             # 80127EE8
    lw      t7, 0x28B8(s2)             # 80127EE8
lbl_800BAB20:
    lui     $at, 0x8010                # $at = 80100000
    or      v0, $zero, $zero           # v0 = 00000000
    sw      t7, 0x17F4($at)            # 801017F4
lbl_800BAB2C:
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0070           # $sp += 0x70


func_800BAB44:
# MqDbg: func_800E5584
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      $ra, 0x001C($sp)
    sw      s0, 0x0018($sp)
    lbu     v1, 0x0000(a0)             # 00000000
    or      s0, a0, $zero              # s0 = 00000000
    slti    $at, v1, 0x0091
    bne     $at, $zero, lbl_800BAB88
    or      v0, v1, $zero              # v0 = 00000000
    addiu   t6, v0, 0xFF20             # t6 = FFFFFF20
    sltiu   $at, t6, 0x001F
    beq     $at, $zero, lbl_800BAF04
    sll     t6, t6,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t6
    lw      t6, -0x6790($at)           # 80109870
    jr      t6
    nop
lbl_800BAB88:
    addiu   t7, v0, 0xFF7F             # t7 = FFFFFF7F
    sltiu   $at, t7, 0x0010
    beq     $at, $zero, lbl_800BAF04
    sll     t7, t7,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t7
    lw      t7, -0x6714($at)           # 801098EC
    jr      t7
    nop
    lbu     a0, 0x0002(s0)             # 00000002
    jal     func_800B71D8
    lbu     a1, 0x0003(s0)             # 00000003
    b       lbl_800BAF08
    lw      $ra, 0x001C($sp)
    lbu     a0, 0x0001(s0)             # 00000001
    lbu     a1, 0x0002(s0)             # 00000002
    jal     func_800B7694
    lbu     a2, 0x0003(s0)             # 00000003
    lbu     a0, 0x0001(s0)             # 00000001
    jal     func_800BAF6C
    lw      a1, 0x0004(s0)             # 00000004
    b       lbl_800BAF08
    lw      $ra, 0x001C($sp)
    lbu     a0, 0x0001(s0)             # 00000001
    lbu     a1, 0x0002(s0)             # 00000002
    jal     func_800B76E4
    lw      a2, 0x0004(s0)             # 00000004
    b       lbl_800BAF08
    lw      $ra, 0x001C($sp)
    lbu     v0, 0x0001(s0)             # 00000001
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x5630             # a3 = 80125630
    sll     t8, v0,  2
    subu    t8, t8, v0
    sll     t8, t8,  2
    subu    t8, t8, v0
    sll     t8, t8,  5
    addu    v1, a3, t8
    lw      t9, 0x3530(v1)             # 00003530
    srl     t0, t9, 31
    beql    t0, $zero, lbl_800BAF08
    lw      $ra, 0x001C($sp)
    lw      a1, 0x0004(s0)             # 00000004
    bne     a1, $zero, lbl_800BAC4C
    nop
    jal     func_800BF104
    addiu   a0, v1, 0x3530             # a0 = 00003530
    b       lbl_800BAF08
    lw      $ra, 0x001C($sp)
lbl_800BAC4C:
    jal     func_800BAF18
    or      a0, v0, $zero              # a0 = 00000000
    b       lbl_800BAF08
    lw      $ra, 0x001C($sp)
    lw      t1, 0x0004(s0)             # 00000004
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x5630             # a3 = 80125630
    b       lbl_800BAF04
    sb      t1, 0x289A(a3)             # 80127ECA
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x5630             # a3 = 80125630
    lh      t2, 0x285C(a3)             # 80127E8C
    lui     s0, 0x8012                 # s0 = 80120000
    addiu   s0, s0, 0x5630             # s0 = 80125630
    blez    t2, lbl_800BAF04
    or      a1, $zero, $zero           # a1 = 00000000
    lbu     t4, 0x3530(s0)             # 80128B60
lbl_800BAC90:
    addiu   a1, a1, 0x0001             # a1 = 00000001
    addiu   s0, s0, 0x0160             # s0 = 80125790
    ori     t7, t4, 0x0020             # t7 = 00000020
    sb      t7, 0x33D0(s0)             # 80128B60
    ori     t8, t7, 0x0004             # t8 = 00000024
    sb      t8, 0x33D0(s0)             # 80128B60
    lh      t9, 0x285C(a3)             # 80127E8C
    slt     $at, a1, t9
    bnel    $at, $zero, lbl_800BAC90
    lbu     t4, 0x3530(s0)             # 80128CC0
    b       lbl_800BAF08
    lw      $ra, 0x001C($sp)
    lw      t0, 0x0004(s0)             # 80125794
    addiu   $at, $zero, 0x0001         # $at = 00000001
    lui     a3, 0x8012                 # a3 = 80120000
    bne     t0, $at, lbl_800BAD48
    addiu   a3, a3, 0x5630             # a3 = 80125630
    lw      a2, 0x2894(a3)             # 80127EC4
    or      a1, $zero, $zero           # a1 = 00000000
    or      a0, $zero, $zero           # a0 = 00000000
    blez    a2, lbl_800BAD48
    nop
lbl_800BACE8:
    lw      t1, 0x352C(a3)             # 80128B5C
    addiu   a1, a1, 0x0001             # a1 = 00000001
    addu    v1, a0, t1
    lw      t2, 0x00C0(v1)             # 000000C0
    srl     t3, t2, 31
    beql    t3, $zero, lbl_800BAD40
    slt     $at, a1, a2
    lbu     t4, 0x0034(v1)             # 00000034
    bnel    t4, $zero, lbl_800BAD40
    slt     $at, a1, a2
    lw      t5, 0x0044(v1)             # 00000044
    addiu   v0, v1, 0x00C0             # v0 = 000000C0
    lw      t6, 0x0050(t5)             # 00000050
    lbu     t7, 0x0003(t6)             # 00000003
    andi    t8, t7, 0x0008             # t8 = 00000000
    beql    t8, $zero, lbl_800BAD40
    slt     $at, a1, a2
    lbu     t0, 0x0000(v0)             # 000000C0
    ori     t1, t0, 0x0020             # t1 = 00000020
    sb      t1, 0x0000(v0)             # 000000C0
    lw      a2, 0x2894(a3)             # 80127EC4
    slt     $at, a1, a2
lbl_800BAD40:
    bne     $at, $zero, lbl_800BACE8
    addiu   a0, a0, 0x00E0             # a0 = 000000E0
lbl_800BAD48:
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x5630             # a3 = 80125630
    lh      t2, 0x285C(a3)             # 80127E8C
    lui     s0, 0x8012                 # s0 = 80120000
    addiu   s0, s0, 0x5630             # s0 = 80125630
    blez    t2, lbl_800BAF04
    or      a1, $zero, $zero           # a1 = 00000000
    lbu     t3, 0x3530(s0)             # 80128B60
lbl_800BAD68:
    addiu   a1, a1, 0x0001             # a1 = 00000001
    addiu   s0, s0, 0x0160             # s0 = 80125790
    andi    t6, t3, 0xFFDF             # t6 = 00000000
    sb      t6, 0x33D0(s0)             # 80128B60
    ori     t7, t6, 0x0004             # t7 = 00000004
    sb      t7, 0x33D0(s0)             # 80128B60
    lh      t8, 0x285C(a3)             # 80127E8C
    slt     $at, a1, t8
    bnel    $at, $zero, lbl_800BAD68
    lbu     t3, 0x3530(s0)             # 80128CC0
    b       lbl_800BAF08
    lw      $ra, 0x001C($sp)
    lbu     a0, 0x0001(s0)             # 80125791
    lbu     a1, 0x0002(s0)             # 80125792
    jal     func_800B7324
    lbu     a2, 0x0003(s0)             # 80125793
    b       lbl_800BAF08
    lw      $ra, 0x001C($sp)
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x7450             # a3 = 80127450
    lbu     a0, 0x0001(s0)             # 80125791
    lbu     a1, 0x0002(s0)             # 80125792
    jal     func_800B7470
    lbu     a2, 0x0003(s0)             # 80125793
    b       lbl_800BAF08
    lw      $ra, 0x001C($sp)
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x7450             # a3 = 80127450
    lbu     a0, 0x0001(s0)             # 80125791
    lbu     a1, 0x0002(s0)             # 80125792
    jal     func_800B74B4
    lbu     a2, 0x0003(s0)             # 80125793
    b       lbl_800BAF08
    lw      $ra, 0x001C($sp)
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x7450             # a3 = 80127450
    lbu     a0, 0x0001(s0)             # 80125791
    lbu     a1, 0x0002(s0)             # 80125792
    jal     func_800B742C
    lbu     a2, 0x0003(s0)             # 80125793
    b       lbl_800BAF08
    lw      $ra, 0x001C($sp)
    jal     func_800B753C
    lbu     a0, 0x0002(s0)             # 80125792
    b       lbl_800BAF08
    lw      $ra, 0x001C($sp)
    lbu     t0, 0x0001(s0)             # 80125791
    lui     a3, 0x8012                 # a3 = 80120000
    lhu     t9, 0x0004(s0)             # 80125794
    addiu   a3, a3, 0x5630             # a3 = 80125630
    sll     t1, t0,  1
    addu    t2, a3, t1
    b       lbl_800BAF04
    sh      t9, 0x5BDC(t2)             # 00005BDC
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x5630             # a3 = 80125630
    addiu   t3, $zero, 0x0005          # t3 = 00000005
    sb      t3, 0x3518(a3)             # 80128B48
    lw      t4, 0x0004(s0)             # 80125794
    b       lbl_800BAF04
    sb      t4, 0x3519(a3)             # 80128B49
    lw      t5, 0x0004(s0)             # 80125794
    lui     $at, 0x8013                # $at = 80130000
    b       lbl_800BAF04
    sw      t5, -0x4580($at)           # 8012BA80
    addiu   a0, v1, 0xFF20             # a0 = FFFFFF20
    lbu     a1, 0x0001(s0)             # 80125791
    lbu     a2, 0x0002(s0)             # 80125792
    jal     func_800BCD04
    lw      a3, 0x0004(s0)             # 80125794
    b       lbl_800BAF08
    lw      $ra, 0x001C($sp)
    lw      t6, 0x0004(s0)             # 80125794
    addiu   $at, $zero, 0x0001         # $at = 00000001
    lui     a3, 0x8012                 # a3 = 80120000
    bne     t6, $at, lbl_800BAEEC
    sw      t6, 0x0024($sp)
    addiu   a3, a3, 0x5630             # a3 = 80125630
    lh      v0, 0x285C(a3)             # 80127E8C
    lui     s0, 0x8012                 # s0 = 80120000
    addiu   s0, s0, 0x5630             # s0 = 80125630
    blez    v0, lbl_800BAEEC
    or      a1, $zero, $zero           # a1 = 00000000
lbl_800BAEB4:
    lw      t8, 0x3530(s0)             # 80128B60
    addiu   a0, s0, 0x3530             # a0 = 80128B60
    srl     t0, t8, 31
    beql    t0, $zero, lbl_800BAEE0
    addiu   a1, a1, 0x0001             # a1 = 00000001
    jal     func_800BF104
    sw      a1, 0x0034($sp)
    lui     v0, 0x8012                 # v0 = 80120000
    lh      v0, 0x7E8C(v0)             # 80127E8C
    lw      a1, 0x0034($sp)
    addiu   a1, a1, 0x0001             # a1 = 00000001
lbl_800BAEE0:
    slt     $at, a1, v0
    bne     $at, $zero, lbl_800BAEB4
    addiu   s0, s0, 0x0160             # s0 = 80125790
lbl_800BAEEC:
    jal     func_800BBC80
    lw      a0, 0x0024($sp)
    b       lbl_800BAF08
    lw      $ra, 0x001C($sp)
    jal     func_800B3A70
    lw      a0, 0x0004(s0)             # 80125794
lbl_800BAF04:
    lw      $ra, 0x001C($sp)
lbl_800BAF08:
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0038           # $sp += 0x38
    jr      $ra
    nop


func_800BAF18:
# MqDbg: func_800E5958
    bne     a1, $zero, lbl_800BAF24
    sll     t6, a0,  2
    addiu   a1, $zero, 0x0001          # a1 = 00000001
lbl_800BAF24:
    mtc1    a1, $f6                    # $f6 = 0.00
    subu    t6, t6, a0
    sll     t6, t6,  2
    subu    t6, t6, a0
    cvt.s.w $f8, $f6
    sll     t6, t6,  5
    lui     t8, 0x8012                 # t8 = 80120000
    addiu   t8, t8, 0x5630             # t8 = 80125630
    addiu   t7, t6, 0x3530             # t7 = 00003530
    addu    v0, t7, t8
    lwc1    $f4, 0x001C(v0)            # 0000001C
    addiu   t9, $zero, 0x0002          # t9 = 00000002
    sb      t9, 0x0001(v0)             # 00000001
    div.s   $f10, $f4, $f8
    sh      a1, 0x0012(v0)             # 00000012
    neg.s   $f16, $f10
    jr      $ra
    swc1    $f16, 0x0020(v0)           # 00000020


func_800BAF6C:
# MqDbg: func_800E59AC
    beq     a1, $zero, lbl_800BAFAC
    sll     t6, a0,  2
    subu    t6, t6, a0
    sll     t6, t6,  2
    subu    t6, t6, a0
    lui     t7, 0x8012                 # t7 = 80120000
    addiu   t7, t7, 0x5630             # t7 = 80125630
    sll     t6, t6,  5
    addu    v0, t6, t7
    mtc1    $zero, $f0                 # $f0 = 0.00
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    sb      t8, 0x3531(v0)             # 00003531
    sh      a1, 0x3544(v0)             # 00003544
    sh      a1, 0x3542(v0)             # 00003542
    swc1    $f0, 0x354C(v0)            # 0000354C
    swc1    $f0, 0x3550(v0)            # 00003550
lbl_800BAFAC:
    jr      $ra
    nop


func_800BAFB4:
# MqDbg: Audio_InitMesgQueuesInternal
# Audio, initializes OSMesgQueues
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x5630             # v0 = 80125630
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    lui     t6, 0x8013                 # t6 = 80130000
    lui     t7, 0x8013                 # t7 = 80130000
    lui     t8, 0x8013                 # t8 = 80130000
    sw      $ra, 0x0014($sp)
    addiu   a0, t6, 0xB220             # a0 = 8012B220
    addiu   t7, t7, 0xB238             # t7 = 8012B238
    addiu   t8, t8, 0xB250             # t8 = 8012B250
    lui     a1, 0x8013                 # a1 = 80130000
    sb      $zero, 0x5BD8(v0)          # 8012B208
    sb      $zero, 0x5BD9(v0)          # 8012B209
    sb      $zero, 0x5BDA(v0)          # 8012B20A
    sw      a0, 0x5BE8(v0)             # 8012B218
    sw      t7, 0x5BEC(v0)             # 8012B21C
    sw      t8, 0x5BE4(v0)             # 8012B214
    addiu   a1, a1, 0xB268             # a1 = 8012B268
    jal     func_80004220              # osCreateMesgQueue
    addiu   a2, $zero, 0x0001          # a2 = 00000001
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x5630             # v0 = 80125630
    lui     a1, 0x8013                 # a1 = 80130000
    addiu   a1, a1, 0xB270             # a1 = 8012B270
    lw      a0, 0x5BEC(v0)             # 8012B21C
    jal     func_80004220              # osCreateMesgQueue
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x5630             # v0 = 80125630
    lui     a1, 0x8013                 # a1 = 80130000
    addiu   a1, a1, 0xB26C             # a1 = 8012B26C
    lw      a0, 0x5BE4(v0)             # 8012B214
    jal     func_80004220              # osCreateMesgQueue
    addiu   a2, $zero, 0x0001          # a2 = 00000001
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BB04C:
# MqDbg: Audio_QueueCmd
    lui     a2, 0x8012                 # a2 = 80120000
    addiu   a2, a2, 0x5630             # a2 = 80125630
    lbu     t7, 0x5BD8(a2)             # 8012B208
    sll     t8, t7,  3
    addu    v0, a2, t8
    sw      a0, 0x5C50(v0)             # 00005C50
    lw      t9, 0x0000(a1)             # 00000000
    addiu   v0, v0, 0x5C50             # v0 = 00005C50
    sw      t9, 0x0004(v0)             # 00005C54
    lbu     t0, 0x5BD8(a2)             # 8012B208
    lbu     t2, 0x5BD9(a2)             # 8012B209
    addiu   t1, t0, 0x0001             # t1 = 00000001
    andi    v1, t1, 0x00FF             # v1 = 00000001
    bne     t2, v1, lbl_800BB090
    sb      t1, 0x5BD8(a2)             # 8012B208
    addiu   t3, v1, 0xFFFF             # t3 = 00000000
    sb      t3, 0x5BD8(a2)             # 8012B208
lbl_800BB090:
    jr      $ra
    nop


func_800BB098:
# MqDbg: Audio_QueueCmdF32
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    sw      a1, 0x001C($sp)
    jal     func_800BB04C
    addiu   a1, $sp, 0x001C            # a1 = 00000004
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BB0BC:
# MqDbg: Audio_QueueCmdS32
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    sw      a1, 0x001C($sp)
    jal     func_800BB04C
    addiu   a1, $sp, 0x001C            # a1 = 00000004
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BB0E0:
# MqDbg: Audio_QueueCmdS8
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    or      a2, a1, $zero              # a2 = 00000000
    sw      $ra, 0x0014($sp)
    sw      a1, 0x0024($sp)
    sll     t6, a2, 24
    sw      t6, 0x001C($sp)
    jal     func_800BB04C
    addiu   a1, $sp, 0x001C            # a1 = FFFFFFFC
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800BB110:
# MqDbg: Audio_QueueCmdU16
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    or      a2, a1, $zero              # a2 = 00000000
    sw      $ra, 0x0014($sp)
    sw      a1, 0x0024($sp)
    sll     t6, a2, 16
    sw      t6, 0x001C($sp)
    jal     func_800BB04C
    addiu   a1, $sp, 0x001C            # a1 = FFFFFFFC
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800BB140:
# MqDbg: Audio_ScheduleProcessCmds
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x5630             # v1 = 80125630
    lbu     v0, 0x5BD8(v1)             # 8012B208
    lbu     a3, 0x5BD9(v1)             # 8012B209
    lui     t6, 0x8010                 # t6 = 80100000
    lw      t6, 0x17F8(t6)             # 801017F8
    subu    a0, v0, a3
    addiu   a0, a0, 0x0100             # a0 = 00000100
    andi    a0, a0, 0x00FF             # a0 = 00000000
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    slt     $at, t6, a0
    beq     $at, $zero, lbl_800BB17C
    sw      $ra, 0x0014($sp)
    lui     $at, 0x8010                # $at = 80100000
    sw      a0, 0x17F8($at)            # 801017F8
lbl_800BB17C:
    andi    t7, a3, 0x00FF             # t7 = 00000000
    sll     t8, t7,  8
    andi    t9, v0, 0x00FF             # t9 = 00000000
    or      a1, t8, t9                 # a1 = 00000000
    lw      a0, 0x5BEC(v1)             # 8012B21C
    jal     func_80001E20              # osSendMesg
    or      a2, $zero, $zero           # a2 = 00000000
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    beq     v0, $at, lbl_800BB1B8
    addiu   v1, v1, 0x5630             # v1 = 80125630
    lbu     t0, 0x5BD8(v1)             # 8012B208
    or      v0, $zero, $zero           # v0 = 00000000
    b       lbl_800BB1C0
    sb      t0, 0x5BD9(v1)             # 8012B209
lbl_800BB1B8:
    b       lbl_800BB1C0
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
lbl_800BB1C0:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BB1D0:
# MqDbg: Audio_ResetCmdQueue
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x5630             # v0 = 80125630
    lbu     t6, 0x5BD8(v0)             # 8012B208
    sb      $zero, 0x5BDA(v0)          # 8012B20A
    jr      $ra
    sb      t6, 0x5BD9(v0)             # 8012B209


func_800BB1E8:
# MqDbg: Audio_ProcessCmd
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      $ra, 0x002C($sp)
    sw      s4, 0x0028($sp)
    sw      s3, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    lbu     v0, 0x0000(a0)             # 00000000
    addiu   $at, $zero, 0x00F0         # $at = 000000F0
    or      s3, a0, $zero              # s3 = 00000000
    andi    t6, v0, 0x00F0             # t6 = 00000000
    bne     t6, $at, lbl_800BB22C
    lui     a1, 0x8012                 # a1 = 80120000
    jal     func_800BAB44
    nop
    b       lbl_800BB310
    lw      $ra, 0x002C($sp)
lbl_800BB22C:
    lbu     a0, 0x0001(s3)             # 00000001
    addiu   a1, a1, 0x5630             # a1 = 00005630
    lh      t7, 0x285C(a1)             # 00007E8C
    sll     t8, a0,  2
    subu    t8, t8, a0
    slt     $at, a0, t7
    beq     $at, $zero, lbl_800BB30C
    sll     t8, t8,  2
    subu    t8, t8, a0
    sll     t8, t8,  5
    addu    s4, a1, t8
    andi    t9, v0, 0x0080             # t9 = 00000000
    beq     t9, $zero, lbl_800BB274
    addiu   s4, s4, 0x3530             # s4 = 00003530
    jal     func_800BAB44
    or      a0, s3, $zero              # a0 = 00000000
    b       lbl_800BB310
    lw      $ra, 0x002C($sp)
lbl_800BB274:
    andi    t0, v0, 0x0040             # t0 = 00000000
    beql    t0, $zero, lbl_800BB298
    lbu     v0, 0x0002(s3)             # 00000002
    or      a0, s4, $zero              # a0 = 00003530
    jal     func_800BB6E8
    or      a1, s3, $zero              # a1 = 00000000
    b       lbl_800BB310
    lw      $ra, 0x002C($sp)
    lbu     v0, 0x0002(s3)             # 00000002
lbl_800BB298:
    slti    $at, v0, 0x0010
    beq     $at, $zero, lbl_800BB2C0
    or      v1, v0, $zero              # v1 = 00000000
    sll     t1, v0,  2
    addu    t2, s4, t1
    lw      a0, 0x0038(t2)             # 00000038
    jal     func_800BB8C0
    or      a1, s3, $zero              # a1 = 00000000
    b       lbl_800BB310
    lw      $ra, 0x002C($sp)
lbl_800BB2C0:
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    bne     v1, $at, lbl_800BB30C
    sll     t3, a0,  1
    addu    t4, a1, t3
    lhu     v0, 0x5BDC(t4)             # 00005BDC
    or      s0, $zero, $zero           # s0 = 00000000
    addiu   s2, $zero, 0x0010          # s2 = 00000010
lbl_800BB2DC:
    andi    t5, v0, 0x0001             # t5 = 00000000
    beq     t5, $zero, lbl_800BB2FC
    or      s1, v0, $zero              # s1 = 00000000
    sll     t6, s0,  2
    addu    t7, s4, t6
    lw      a0, 0x0038(t7)             # 00000038
    jal     func_800BB8C0
    or      a1, s3, $zero              # a1 = 00000000
lbl_800BB2FC:
    addiu   s0, s0, 0x0001             # s0 = 00000001
    sra     v0, s1,  1
    bne     s0, s2, lbl_800BB2DC
    andi    v0, v0, 0xFFFF             # v0 = 00000000
lbl_800BB30C:
    lw      $ra, 0x002C($sp)
lbl_800BB310:
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    lw      s3, 0x0024($sp)
    lw      s4, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030           # $sp += 0x30


func_800BB32C:
# MqDbg: Audio_ProcessCmds
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      s3, 0x0020($sp)
    lui     s3, 0x8012                 # s3 = 80120000
    addiu   s3, s3, 0x5630             # s3 = 80125630
    lbu     t6, 0x5BDA(s3)             # 8012B20A
    sw      $ra, 0x0024($sp)
    sw      s2, 0x001C($sp)
    sw      s1, 0x0018($sp)
    bne     t6, $zero, lbl_800BB360
    sw      s0, 0x0014($sp)
    srl     v1, a0,  8
    lui     $at, 0x8010                # $at = 80100000
    sb      v1, 0x17FC($at)            # 801017FC
lbl_800BB360:
    or      s1, a0, $zero              # s1 = 00000000
    andi    s1, s1, 0x00FF             # s1 = 00000000
    addiu   s2, $zero, 0x00F8          # s2 = 000000F8
lbl_800BB36C:
    lui     v1, 0x8010                 # v1 = 80100000
    lbu     v1, 0x17FC(v1)             # 801017FC
    lui     $at, 0x8010                # $at = 80100000
    bne     s1, v1, lbl_800BB388
    or      v0, v1, $zero              # v0 = 80100000
    b       lbl_800BB3C4
    sb      $zero, 0x5BDA(s3)          # 8012B20A
lbl_800BB388:
    andi    t7, v0, 0x00FF             # t7 = 00000000
    sll     t8, t7,  3
    addiu   v1, v1, 0x0001             # v1 = 80100001
    addu    s0, s3, t8
    sb      v1, 0x17FC($at)            # 801017FC
    lbu     t9, 0x5C50(s0)             # 00005C50
    addiu   s0, s0, 0x5C50             # s0 = 00005C50
    bne     s2, t9, lbl_800BB3B4
    addiu   t0, $zero, 0x0001          # t0 = 00000001
    b       lbl_800BB3C4
    sb      t0, 0x5BDA(s3)             # 8012B20A
lbl_800BB3B4:
    jal     func_800BB1E8
    or      a0, s0, $zero              # a0 = 00005C50
    b       lbl_800BB36C
    sb      $zero, 0x0000(s0)          # 00005C50
lbl_800BB3C4:
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28


func_800BB3E0:
# MqDbg: func_800E5E20
# osRecvMsg, Get ? Message and do ?
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a0, 0x0020($sp)
    sw      $ra, 0x0014($sp)
    lui     a0, 0x8012                 # a0 = 80120000
    addiu   a0, a0, 0x7450             # a0 = 80127450
    addiu   a1, $sp, 0x001C            # a1 = FFFFFFFC
    jal     func_80002030              # osRecvMesg
    or      a2, $zero, $zero           # a2 = 00000000
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     v0, $at, lbl_800BB418
    lw      v1, 0x0020($sp)
    sw      $zero, 0x0000(v1)          # 00000000
    b       lbl_800BB434
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BB418:
    lw      t6, 0x001C($sp)
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    and     t7, t6, $at
    sw      t7, 0x0000(v1)             # 00000000
    lw      v0, 0x001C($sp)
    srl     v0, v0, 24
lbl_800BB434:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800BB444:
# MqDbg: func_800E5E84
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800B74F8
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BB464:
# MqDbg: Audio_GetSampleBankIdsOfFont
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x5630             # v1 = 80125630
    lw      t6, 0x2844(v1)             # 80127E74
    sll     v0, a0,  2
    addu    v0, v0, a0
    sll     v0, v0,  2
    addu    t7, t6, v0
    lbu     t8, 0x0002(t7)             # 00000002
    sw      t8, 0x0000(a1)             # 00000000
    lw      t9, 0x2844(v1)             # 80127E74
    addu    t0, t9, v0
    lbu     t1, 0x0003(t0)             # 00000003
    jr      $ra
    sw      t1, 0x0000(a2)             # 00000000


func_800BB49C:
# MqDbg: func_800E5EDC
# osRecvMsg, Get ? Message and do ?
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    lui     a0, 0x8013                 # a0 = 80130000
    lw      a0, -0x4DEC(a0)            # 8012B214
    addiu   a1, $sp, 0x0018            # a1 = FFFFFFF8
    jal     func_80002030              # osRecvMesg
    or      a2, $zero, $zero           # a2 = 00000000
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     v0, $at, lbl_800BB4CC
    lw      $ra, 0x0014($sp)
    b       lbl_800BB4EC
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BB4CC:
    lui     t7, 0x8013                 # t7 = 80130000
    lbu     t7, -0x74B7(t7)            # 80128B49
    lw      t6, 0x0018($sp)
    addiu   v0, $zero, 0x0001          # v0 = 00000001
    beq     t6, t7, lbl_800BB4EC
    nop
    b       lbl_800BB4EC
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
lbl_800BB4EC:
    jr      $ra
    addiu   $sp, $sp, 0x0020           # $sp += 0x20


func_800BB4F4:
# MqDbg: func_800E5F34
# osRecvMsg, Get ? Message and do ?
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      s1, 0x001C($sp)
    sw      s2, 0x0020($sp)
    sw      s0, 0x0018($sp)
    lui     s1, 0x8012                 # s1 = 80120000
    sw      $ra, 0x0024($sp)
    addiu   s1, s1, 0x5630             # s1 = 80125630
    addiu   s0, $zero, 0xFFFF          # s0 = FFFFFFFF
    addiu   s2, $sp, 0x0028            # s2 = FFFFFFF8
    lw      a0, 0x5BE4(s1)             # 8012B214
lbl_800BB51C:
    or      a1, s2, $zero              # a1 = FFFFFFF8
    jal     func_80002030              # osRecvMesg
    or      a2, $zero, $zero           # a2 = 00000000
    bnel    v0, s0, lbl_800BB51C
    lw      a0, 0x5BE4(s1)             # 8012B214
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030           # $sp += 0x30


func_800BB548:
# MqDbg: func_800E5F88
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x0014($sp)
    jal     func_800BB4F4
    sw      a0, 0x0028($sp)
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x5630             # v1 = 80125630
    lbu     v0, 0x3518(v1)             # 80128B48
    beq     v0, $zero, lbl_800BB5B8
    nop
    jal     func_800BB1D0
    sw      v0, 0x0024($sp)
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x5630             # v1 = 80125630
    lw      a3, 0x0028($sp)
    lbu     t6, 0x3519(v1)             # 80128B49
    lw      v0, 0x0024($sp)
    bne     a3, t6, lbl_800BB598
    slti    $at, v0, 0x0003
    b       lbl_800BB5D4
    addiu   v0, $zero, 0xFFFE          # v0 = FFFFFFFE
lbl_800BB598:
    bne     $at, $zero, lbl_800BB5AC
    addiu   a1, $sp, 0x0020            # a1 = FFFFFFF8
    sb      a3, 0x3519(v1)             # 80128B49
    b       lbl_800BB5D4
    addiu   v0, $zero, 0xFFFD          # v0 = FFFFFFFD
lbl_800BB5AC:
    lw      a0, 0x5BE4(v1)             # 8012B214
    jal     func_80002030              # osRecvMesg
    addiu   a2, $zero, 0x0001          # a2 = 00000001
lbl_800BB5B8:
    jal     func_800BB4F4
    nop
    lui     a0, 0xF900                 # a0 = F9000000
    jal     func_800BB0BC
    lw      a1, 0x0028($sp)
    jal     func_800BB140
    nop
lbl_800BB5D4:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800BB5E4:
# MqDbg: Audio_PreNMIInternal
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    lui     t7, 0x8012                 # t7 = 80120000
    sw      $ra, 0x0014($sp)
    addiu   t7, t7, 0x5630             # t7 = 80125630
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    sw      t6, 0x2984(t7)             # 80127FB4
    lui     t8, 0x8010                 # t8 = 80100000
    lw      t8, 0x17E8(t8)             # 801017E8
    beql    t8, $zero, lbl_800BB624
    lw      $ra, 0x0014($sp)
    jal     func_800BB548
    or      a0, $zero, $zero           # a0 = 00000000
    lui     t9, 0x8012                 # t9 = 80120000
    addiu   t9, t9, 0x5630             # t9 = 80125630
    sb      $zero, 0x3518(t9)          # 80128B48
    lw      $ra, 0x0014($sp)
lbl_800BB624:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BB630:
# MqDbg: func_800E6070
    sll     t6, a0,  2
    subu    t6, t6, a0
    sll     t6, t6,  2
    subu    t6, t6, a0
    lui     t7, 0x8012                 # t7 = 80120000
    addiu   t7, t7, 0x5630             # t7 = 80125630
    sll     t6, t6,  5
    addu    v1, t6, t7
    lw      t8, 0x3530(v1)             # 00003530
    sll     t0, a1,  2
    addu    t1, v1, t0
    srl     t9, t8, 31
    beql    t9, $zero, lbl_800BB67C
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
    lw      a0, 0x3568(t1)             # 00003568
    addu    t2, a0, a2
    jr      $ra
    lb      v0, 0x00C4(t2)             # 000000C4
lbl_800BB678:
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
lbl_800BB67C:
    jr      $ra
    nop


func_800BB684:
# MqDbg: func_800E60C4
    sll     t6, a0,  2
    subu    t6, t6, a0
    sll     t6, t6,  2
    subu    t6, t6, a0
    sll     t6, t6,  5
    addu    t7, t6, a1
    lui     v0, 0x8013                 # v0 = 80130000
    addu    v0, v0, t7
    jr      $ra
    lb      v0, -0x7348(v0)            # 80128CB8


func_800BB6AC:
# MqDbg: Audio_InitExternalPool
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    or      a2, a1, $zero              # a2 = 00000000
    or      a1, a0, $zero              # a1 = 00000000
    sw      a0, 0x0018($sp)
    sw      $ra, 0x0014($sp)
    lui     a0, 0x8012                 # a0 = 80120000
    jal     func_800B39F4
    addiu   a0, a0, 0x7FD0             # a0 = 80127FD0
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BB6DC:
# MqDbg: Audio_DestroyExternalPool
# zero s32 at 80127FD0
    lui     $at, 0x8012                # $at = 80120000
    jr      $ra
    sw      $zero, 0x7FD0($at)         # 80127FD0


func_800BB6E8:
# MqDbg: func_800E6128
# Branch to 800BB8B8 if condition
# Jump Table 8010992C (ends 80119964)
    lbu     t6, 0x0000(a1)             # 00000000
    addiu   t7, t6, 0xFFBF             # t7 = FFFFFFBF
    sltiu   $at, t7, 0x000E
    beq     $at, $zero, lbl_800BB8B8
    sll     t7, t7,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t7
    lw      t7, -0x66D4($at)           # 8010992C
    jr      t7
    nop
    lwc1    $f0, 0x0004(a1)            # 00000004
    lwc1    $f4, 0x002C(a0)            # 0000002C
    c.eq.s  $f0, $f4
    nop
    bc1t    lbl_800BB8B8
    nop
    lbu     t9, 0x0000(a0)             # 00000000
    swc1    $f0, 0x002C(a0)            # 0000002C
    ori     t0, t9, 0x0004             # t0 = 00000004
    jr      $ra
    sb      t0, 0x0000(a0)             # 00000000
    lw      t1, 0x0004(a1)             # 00000004
    sll     t2, t1,  2
    subu    t2, t2, t1
    sll     t2, t2,  4
    jr      $ra
    sh      t2, 0x0008(a0)             # 00000008
    lw      t3, 0x0004(a1)             # 00000004
    sll     t4, t3,  2
    subu    t4, t4, t3
    sll     t4, t4,  4
    jr      $ra
    sh      t4, 0x000C(a0)             # 0000000C
    lw      t5, 0x0004(a1)             # 00000004
    jr      $ra
    sh      t5, 0x000C(a0)             # 0000000C
    lb      t6, 0x0004(a1)             # 00000004
    jr      $ra
    sh      t6, 0x000E(a0)             # 0000000E
    lbu     t8, 0x0003(a1)             # 00000003
    lb      t7, 0x0004(a1)             # 00000004
    addu    t9, a0, t8
    jr      $ra
    sb      t7, 0x0158(t9)             # 00000158
    lbu     t0, 0x0002(a1)             # 00000002
    lui     $at, 0x42FE                # $at = 42FE0000
    mtc1    $at, $f10                  # $f10 = 127.00
    mtc1    t0, $f6                    # $f6 = 0.00
    nop
    cvt.s.w $f8, $f6
    b       lbl_800BB7DC
    div.s   $f0, $f8, $f10
    lbu     t1, 0x0002(a1)             # 00000002
    lui     $at, 0x42C8                # $at = 42C80000
    mtc1    $at, $f4                   # $f4 = 100.00
    mtc1    t1, $f16                   # $f16 = 0.00
    lwc1    $f8, 0x001C(a0)            # 0000001C
    cvt.s.w $f18, $f16
    div.s   $f6, $f18, $f4
    mul.s   $f0, $f6, $f8
    nop
lbl_800BB7DC:
    lbu     t2, 0x0001(a0)             # 00000001
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     t2, $at, lbl_800BB8B8
    nop
    lwc1    $f2, 0x001C(a0)            # 0000001C
    swc1    $f2, 0x0024(a0)            # 00000024
    lw      v0, 0x0004(a1)             # 00000004
    bnel    v0, $zero, lbl_800BB80C
    mtc1    v0, $f16                   # $f16 = 0.00
    jr      $ra
    swc1    $f0, 0x001C(a0)            # 0000001C
lbl_800BB808:
    mtc1    v0, $f16                   # $f16 = 0.00
lbl_800BB80C:
    sub.s   $f10, $f0, $f2
    sb      $zero, 0x0001(a0)          # 00000001
    sh      v0, 0x0012(a0)             # 00000012
    cvt.s.w $f18, $f16
    div.s   $f4, $f10, $f18
    jr      $ra
    swc1    $f4, 0x0020(a0)            # 00000020
    lbu     t3, 0x0001(a0)             # 00000001
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     t3, $at, lbl_800BB8B8
    nop
    lw      v0, 0x0004(a1)             # 00000004
    bnel    v0, $zero, lbl_800BB854
    mtc1    v0, $f18                   # $f18 = 0.00
    lwc1    $f6, 0x0024(a0)            # 00000024
    jr      $ra
    swc1    $f6, 0x001C(a0)            # 0000001C
lbl_800BB850:
    mtc1    v0, $f18                   # $f18 = 0.00
lbl_800BB854:
    lwc1    $f8, 0x0024(a0)            # 00000024
    lwc1    $f16, 0x001C(a0)           # 0000001C
    cvt.s.w $f4, $f18
    sb      $zero, 0x0001(a0)          # 00000001
    sh      v0, 0x0012(a0)             # 00000012
    sub.s   $f10, $f8, $f16
    div.s   $f6, $f10, $f4
    jr      $ra
    swc1    $f6, 0x0020(a0)            # 00000020
    lwc1    $f8, 0x0004(a1)            # 00000004
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f16                  # $f16 = 1.00
    swc1    $f8, 0x0034(a0)            # 00000034
    lwc1    $f18, 0x0034(a0)           # 00000034
    c.eq.s  $f16, $f18
    nop
    bc1fl   lbl_800BB8B0
    lbu     t8, 0x0000(a0)             # 00000000
    lbu     t4, 0x0000(a0)             # 00000000
    andi    t5, t4, 0xFFFE             # t5 = 00000000
    jr      $ra
    sb      t5, 0x0000(a0)             # 00000000
lbl_800BB8AC:
    lbu     t8, 0x0000(a0)             # 00000000
lbl_800BB8B0:
    ori     t7, t8, 0x0001             # t7 = 00000001
    sb      t7, 0x0000(a0)             # 00000000
lbl_800BB8B8:
    jr      $ra
    nop


func_800BB8C0:
# MqDbg: func_800E6300
# Jump Table 80119964 (ends 8011999C)
    lbu     t6, 0x0000(a1)             # 00000000
    addiu   t7, t6, 0xFFFF             # t7 = FFFFFFFF
    sltiu   $at, t7, 0x000E
    beq     $at, $zero, lbl_800BBA68
    sll     t7, t7,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t7
    lw      t7, -0x669C($at)           # 80109964
    jr      t7
    nop
    lwc1    $f0, 0x0004(a1)            # 00000004
    lwc1    $f4, 0x0028(a0)            # 00000028
    c.eq.s  $f0, $f4
    nop
    bc1t    lbl_800BBA68
    nop
    lbu     t9, 0x0001(a0)             # 00000001
    swc1    $f0, 0x0028(a0)            # 00000028
    ori     t0, t9, 0x0040             # t0 = 00000040
    jr      $ra
    sb      t0, 0x0001(a0)             # 00000001
    lwc1    $f0, 0x0004(a1)            # 00000004
    lwc1    $f6, 0x002C(a0)            # 0000002C
    c.eq.s  $f0, $f6
    nop
    bc1t    lbl_800BBA68
    nop
    lbu     t2, 0x0001(a0)             # 00000001
    swc1    $f0, 0x002C(a0)            # 0000002C
    ori     t3, t2, 0x0040             # t3 = 00000040
    jr      $ra
    sb      t3, 0x0001(a0)             # 00000001
    lb      v0, 0x0004(a1)             # 00000004
    lbu     t4, 0x000A(a0)             # 0000000A
    beq     v0, t4, lbl_800BBA68
    nop
    lbu     t6, 0x0001(a0)             # 00000001
    sb      v0, 0x000A(a0)             # 0000000A
    ori     t7, t6, 0x0020             # t7 = 00000020
    jr      $ra
    sb      t7, 0x0001(a0)             # 00000001
    lb      v0, 0x0004(a1)             # 00000004
    lbu     t8, 0x000A(a0)             # 0000000A
    beq     v0, t8, lbl_800BBA68
    nop
    lbu     t0, 0x0001(a0)             # 00000001
    sb      v0, 0x000B(a0)             # 0000000B
    ori     t1, t0, 0x0020             # t1 = 00000020
    jr      $ra
    sb      t1, 0x0001(a0)             # 00000001
    lwc1    $f0, 0x0004(a1)            # 00000004
    lwc1    $f8, 0x0038(a0)            # 00000038
    c.eq.s  $f0, $f8
    nop
    bc1t    lbl_800BBA68
    nop
    lbu     t3, 0x0001(a0)             # 00000001
    swc1    $f0, 0x0038(a0)            # 00000038
    ori     t4, t3, 0x0080             # t4 = 00000080
    jr      $ra
    sb      t4, 0x0001(a0)             # 00000001
    lb      v0, 0x0004(a1)             # 00000004
    lbu     t5, 0x0004(a0)             # 00000004
    beq     v0, t5, lbl_800BBA68
    nop
    jr      $ra
    sb      v0, 0x0004(a0)             # 00000004
    lbu     v0, 0x0003(a1)             # 00000003
    slti    $at, v0, 0x0008
    beq     $at, $zero, lbl_800BBA68
    nop
    lb      t6, 0x0004(a1)             # 00000004
    addu    t7, a0, v0
    jr      $ra
    sb      t6, 0x00C4(t7)             # 000000C4
    lb      t9, 0x0004(a1)             # 00000004
    lbu     t2, 0x0000(a0)             # 00000000
    sll     t0, t9,  4
    andi    t1, t0, 0x0010             # t1 = 00000000
    andi    t3, t2, 0xFFEF             # t3 = 00000000
    or      t4, t1, t3                 # t4 = 00000000
    jr      $ra
    sb      t4, 0x0000(a0)             # 00000000
    lb      t5, 0x0004(a1)             # 00000004
    jr      $ra
    sb      t5, 0x0003(a0)             # 00000003
    lbu     t6, 0x0004(a1)             # 00000004
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    sh      t8, 0x001A(a0)             # 0000001A
    sll     t7, t6,  3
    jr      $ra
    sh      t7, 0x0016(a0)             # 00000016
    lbu     t9, 0x0004(a1)             # 00000004
    addiu   t2, $zero, 0x0001          # t2 = 00000001
    sh      t2, 0x0018(a0)             # 00000018
    sll     t0, t9,  5
    jr      $ra
    sh      t0, 0x0014(a0)             # 00000014
    lbu     t1, 0x0004(a1)             # 00000004
    jr      $ra
    sb      t1, 0x000F(a0)             # 0000000F
    lhu     t3, 0x0004(a1)             # 00000004
    jr      $ra
    sh      t3, 0x0020(a0)             # 00000020
    lbu     t4, 0x0004(a1)             # 00000004
    sb      t4, 0x00D0(a0)             # 000000D0
lbl_800BBA68:
    jr      $ra
    nop


func_800BBA70:
# MqDbg: func_800E64B0
    andi    t6, a0, 0x00FF             # t6 = 00000000
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sll     t7, t6, 16
    lui     $at, 0xFA00                # $at = FA000000
    andi    t0, a1, 0x00FF             # t0 = 00000000
    sll     t1, t0,  8
    or      t8, t7, $at                # t8 = FA000000
    sw      $ra, 0x0014($sp)
    sw      a1, 0x001C($sp)
    or      t2, t8, t1                 # t2 = FA000000
    andi    t3, a2, 0x00FF             # t3 = 00000000
    or      a0, t2, t3                 # a0 = FA000000
    jal     func_800BB0BC
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BBAB8:
# MqDbg: func_800E64F8
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lui     a0, 0xFA00                 # a0 = FA000000
    jal     func_800BB0BC
    or      a1, $zero, $zero           # a1 = 00000000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BBADC:
# MqDbg: func_800E651C
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    or      a2, a1, $zero              # a2 = 00000000
    or      a1, a0, $zero              # a1 = 00000000
    sw      a0, 0x0018($sp)
    sw      $ra, 0x0014($sp)
    andi    a0, a2, 0x00FF             # a0 = 00000000
    lui     $at, 0xFD00                # $at = FD000000
    jal     func_800BB0BC
    or      a0, a0, $at                # a0 = FD000000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BBB10:
# MqDbg: Audio_WaitForAudioTask
# osRecvMsg, Get ? Message and do ?
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lui     a0, 0x8013                 # a0 = 80130000
    lw      a0, -0x4DE8(a0)            # 8012B218
    or      a1, $zero, $zero           # a1 = 00000000
    jal     func_80002030              # osRecvMesg
    or      a2, $zero, $zero           # a2 = 00000000
    lui     a0, 0x8013                 # a0 = 80130000
    lw      a0, -0x4DE8(a0)            # 8012B218
    or      a1, $zero, $zero           # a1 = 00000000
    jal     func_80002030              # osRecvMesg
    addiu   a2, $zero, 0x0001          # a2 = 00000001
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BBB50:
# MqDbg: func_800E6590
    sll     t6, a0,  2
    subu    t6, t6, a0
    sll     t6, t6,  2
    subu    t6, t6, a0
    lui     t7, 0x8012                 # t7 = 80120000
    addiu   t7, t7, 0x5630             # t7 = 80125630
    sll     t6, t6,  5
    addu    v0, t6, t7
    lw      t8, 0x3530(v0)             # 00003530
    sll     t0, a1,  2
    addu    t1, v0, t0
    srl     t9, t8, 31
    beql    t9, $zero, lbl_800BBC38
    or      v0, $zero, $zero           # v0 = 00000000
    lw      v1, 0x3568(t1)             # 00003568
    sll     t4, a2,  2
    lw      t2, 0x0000(v1)             # 00000000
    addu    t5, v1, t4
    srl     t3, t2, 31
    beql    t3, $zero, lbl_800BBC38
    or      v0, $zero, $zero           # v0 = 00000000
    lw      v0, 0x0050(t5)             # 00000050
    bnel    v0, $zero, lbl_800BBBBC
    lw      v1, 0x0000(v0)             # 00000000
    jr      $ra
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BBBB8:
    lw      v1, 0x0000(v0)             # 00000000
lbl_800BBBBC:
    srl     t6, v1, 31
    beql    t6, $zero, lbl_800BBC38
    or      v0, $zero, $zero           # v0 = 00000000
    lw      a0, 0x002C(v0)             # 0000002C
    sll     t8, v1,  4
    bne     a0, $zero, lbl_800BBBE0
    nop
    jr      $ra
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BBBE0:
    bltzl   t8, lbl_800BBBF4
    lw      t9, 0x0044(a0)             # 00000044
    jr      $ra
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BBBF0:
    lw      t9, 0x0044(a0)             # 00000044
lbl_800BBBF4:
    or      v1, a0, $zero              # v1 = 00000000
    bne     v0, t9, lbl_800BBC2C
    nop
    lw      a0, 0x00D0(a0)             # 000000D0
    bnel    a0, $zero, lbl_800BBC18
    lw      t0, 0x0000(a0)             # 00000000
    jr      $ra
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BBC14:
    lw      t0, 0x0000(a0)             # 00000000
lbl_800BBC18:
    lw      a2, 0x0018(v1)             # 00000018
    lw      t1, 0x0008(t0)             # 00000008
    lw      a1, 0x0004(t1)             # 00000004
    jr      $ra
    subu    v0, a1, a2
lbl_800BBC2C:
    jr      $ra
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BBC34:
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BBC38:
    jr      $ra
    nop


func_800BBC40:
# MqDbg: func_800E6680
# Wrapper for 800BBC80 (A0 = 0)
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800BBC80
    or      a0, $zero, $zero           # a0 = 00000000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BBC60:
# MqDbg: func_800E66A0
# Wrapper for 800BBC80 (A0 = 2)
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800BBC80
    addiu   a0, $zero, 0x0002          # a0 = 00000002
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BBC80:
# MqDbg: func_800E66C0
    lui     t2, 0x8012                 # t2 = 80120000
    addiu   t2, t2, 0x5630             # t2 = 80125630
    lw      a1, 0x2894(t2)             # 80127EC4
    addiu   $sp, $sp, 0xFFF8           # $sp -= 0x8
    sw      s0, 0x0004($sp)
    or      s0, a0, $zero              # s0 = 00000000
    blez    a1, lbl_800BBD70
    or      v1, $zero, $zero           # v1 = 00000000
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   t3, $zero, 0x0001          # t3 = 00000001
    lw      t6, 0x352C(t2)             # 80128B5C
lbl_800BBCAC:
    addu    v0, a0, t6
    lw      t7, 0x00C0(v0)             # 000000C0
    addiu   a0, a0, 0x00E0             # a0 = 000000E0
    addiu   a2, v0, 0x0030             # a2 = 00000030
    srl     t8, t7, 31
    beql    t8, $zero, lbl_800BBD5C
    sll     v0, a1,  3
    lbu     t1, 0x0040(a2)             # 00000070
    slti    $at, s0, 0x0002
    andi    t9, t1, 0x000F             # t9 = 00000000
    beql    t9, $zero, lbl_800BBD5C
    sll     v0, a1,  3
    bne     $at, $zero, lbl_800BBD38
    addiu   a3, v0, 0x00C0             # a3 = 000000C0
    lw      t0, 0x0010(a3)             # 000000D0
    sll     v0, a1,  3
    subu    v0, v0, a1
    beq     t0, $zero, lbl_800BBD08
    nop
    lw      t4, 0x0000(a3)             # 000000C0
    sll     t6, t4, 13
    bgezl   t6, lbl_800BBD14
    lw      t7, 0x0000(t0)             # 00000000
lbl_800BBD08:
    b       lbl_800BBD64
    sll     v0, v0,  5
    lw      t7, 0x0000(t0)             # 00000000
lbl_800BBD14:
    sll     v0, a1,  3
    subu    v0, v0, a1
    lw      t8, 0x0000(t7)             # 00000000
    sll     t9, t8,  4
    srl     t4, t9, 30
    bnel    t4, $zero, lbl_800BBD3C
    andi    t5, s0, 0x0001             # t5 = 00000000
    b       lbl_800BBD64
    sll     v0, v0,  5
lbl_800BBD38:
    andi    t5, s0, 0x0001             # t5 = 00000000
lbl_800BBD3C:
    bne     t3, t5, lbl_800BBD58
    addiu   v1, v1, 0x0001             # v1 = 00000001
    lwc1    $f4, 0x2864(t2)            # 80127E94
    ori     t7, t1, 0x0010             # t7 = 00000010
    sb      t7, 0x0040(a2)             # 00000070
    swc1    $f4, 0x004C(a2)            # 0000007C
    lw      a1, 0x2894(t2)             # 80127EC4
lbl_800BBD58:
    sll     v0, a1,  3
lbl_800BBD5C:
    subu    v0, v0, a1
    sll     v0, v0,  5
lbl_800BBD64:
    slt     $at, a0, v0
    bnel    $at, $zero, lbl_800BBCAC
    lw      t6, 0x352C(t2)             # 80128B5C
lbl_800BBD70:
    lw      s0, 0x0004($sp)
    addiu   $sp, $sp, 0x0008           # $sp += 0x8
    jr      $ra
    or      v0, v1, $zero              # v0 = 00000001


func_800BBD80:
# MqDbg: Audio_NextRandom
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_80004D50              # osGetCount
    nop
    lui     a0, 0x8012                 # a0 = 80120000
    addiu   a0, a0, 0x5630             # a0 = 80125630
    lui     v1, 0x8010                 # v1 = 80100000
    lw      v1, 0x1800(v1)             # 80101800
    lw      t7, 0x289C(a0)             # 80127ECC
    lui     $at, 0x0123                # $at = 01230000
    ori     $at, $at, 0x4567           # $at = 01234567
    addu    t6, v0, $at
    addu    t8, v1, t7
    multu   t6, t8
    lw      t9, 0x297C(a0)             # 80127FAC
    lw      $ra, 0x0014($sp)
    lui     $at, 0x8010                # $at = 80100000
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    mflo    v1
    addu    v0, v1, t9
    jr      $ra
    sw      v0, 0x1800($at)            # 80101800


func_800BBDD8:
# MqDbg: Audio_InitMesgQueues
# Audio, Wrapper for 800BAFB4
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800BAFB4
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop
    nop
    nop
