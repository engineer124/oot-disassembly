# "Sound" part of the code file
#
# Handles the audio tables as well as the game sounds, instruments and music.
#
# Starts at VRAM: 800B0280 / VROM: B261E0
#

.section .text
func_800BA5A0:
# MqDbg: 
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
# MqDbg: 
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
# MqDbg: 
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
# MqDbg: 
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
# MqDbg: 
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
# MqDbg: 
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
# MqDbg: 
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
# MqDbg: 
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
# MqDbg: 
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
# MqDbg: 
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
# MqDbg: 
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
# MqDbg: 
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
# MqDbg: 
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x5630             # v0 = 80125630
    lbu     t6, 0x5BD8(v0)             # 8012B208
    sb      $zero, 0x5BDA(v0)          # 8012B20A
    jr      $ra
    sb      t6, 0x5BD9(v0)             # 8012B209


func_800BB1E8:
# MqDbg: 
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
# MqDbg: 
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
# MqDbg: 
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
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800B74F8
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BB464:
# MqDbg: 
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
# MqDbg: 
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
# MqDbg: 
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
# MqDbg: 
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
# MqDbg: 
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
# MqDbg: 
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
# MqDbg: 
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
# MqDbg: 
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
# MqDbg: 
# zero s32 at 80127FD0
    lui     $at, 0x8012                # $at = 80120000
    jr      $ra
    sw      $zero, 0x7FD0($at)         # 80127FD0


func_800BB6E8:
# MqDbg: 
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


func_800BB73C:
# MqDbg: 
    lw      t1, 0x0004(a1)             # 00000004
    sll     t2, t1,  2
    subu    t2, t2, t1
    sll     t2, t2,  4
    jr      $ra
    sh      t2, 0x0008(a0)             # 00000008


func_800BB754:
# MqDbg: 
    lw      t3, 0x0004(a1)             # 00000004
    sll     t4, t3,  2
    subu    t4, t4, t3
    sll     t4, t4,  4
    jr      $ra
    sh      t4, 0x000C(a0)             # 0000000C


func_800BB76C:
# MqDbg: 
    lw      t5, 0x0004(a1)             # 00000004
    jr      $ra
    sh      t5, 0x000C(a0)             # 0000000C


func_800BB778:
# MqDbg: 
    lb      t6, 0x0004(a1)             # 00000004
    jr      $ra
    sh      t6, 0x000E(a0)             # 0000000E


func_800BB784:
# MqDbg: 
    lbu     t8, 0x0003(a1)             # 00000003
    lb      t7, 0x0004(a1)             # 00000004
    addu    t9, a0, t8
    jr      $ra
    sb      t7, 0x0158(t9)             # 00000158


func_800BB798:
# MqDbg: 
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


func_800BB828:
# MqDbg: 
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


func_800BB878:
# MqDbg: 
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
# MqDbg: 
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


func_800BB914:
# MqDbg: 
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


func_800BB940:
# MqDbg: 
    lb      v0, 0x0004(a1)             # 00000004
    lbu     t4, 0x000A(a0)             # 0000000A
    beq     v0, t4, lbl_800BBA68
    nop
    lbu     t6, 0x0001(a0)             # 00000001
    sb      v0, 0x000A(a0)             # 0000000A
    ori     t7, t6, 0x0020             # t7 = 00000020
    jr      $ra
    sb      t7, 0x0001(a0)             # 00000001


func_800BB964:
# MqDbg: 
    lb      v0, 0x0004(a1)             # 00000004
    lbu     t8, 0x000A(a0)             # 0000000A
    beq     v0, t8, lbl_800BBA68
    nop
    lbu     t0, 0x0001(a0)             # 00000001
    sb      v0, 0x000B(a0)             # 0000000B
    ori     t1, t0, 0x0020             # t1 = 00000020
    jr      $ra
    sb      t1, 0x0001(a0)             # 00000001


func_800BB988:
# MqDbg: 
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


func_800BB9B4:
# MqDbg: 
    lb      v0, 0x0004(a1)             # 00000004
    lbu     t5, 0x0004(a0)             # 00000004
    beq     v0, t5, lbl_800BBA68
    nop
    jr      $ra
    sb      v0, 0x0004(a0)             # 00000004


func_800BB9CC:
# MqDbg: 
    lbu     v0, 0x0003(a1)             # 00000003
    slti    $at, v0, 0x0008
    beq     $at, $zero, lbl_800BBA68
    nop
    lb      t6, 0x0004(a1)             # 00000004
    addu    t7, a0, v0
    jr      $ra
    sb      t6, 0x00C4(t7)             # 000000C4


func_800BB9EC:
# MqDbg: 
    lb      t9, 0x0004(a1)             # 00000004
    lbu     t2, 0x0000(a0)             # 00000000
    sll     t0, t9,  4
    andi    t1, t0, 0x0010             # t1 = 00000000
    andi    t3, t2, 0xFFEF             # t3 = 00000000
    or      t4, t1, t3                 # t4 = 00000000
    jr      $ra
    sb      t4, 0x0000(a0)             # 00000000


func_800BBA0C:
# MqDbg: 
    lb      t5, 0x0004(a1)             # 00000004
    jr      $ra
    sb      t5, 0x0003(a0)             # 00000003


func_800BBA18:
# MqDbg: 
    lbu     t6, 0x0004(a1)             # 00000004
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    sh      t8, 0x001A(a0)             # 0000001A
    sll     t7, t6,  3
    jr      $ra
    sh      t7, 0x0016(a0)             # 00000016


func_800BBA30:
# MqDbg: 
    lbu     t9, 0x0004(a1)             # 00000004
    addiu   t2, $zero, 0x0001          # t2 = 00000001
    sh      t2, 0x0018(a0)             # 00000018
    sll     t0, t9,  5
    jr      $ra
    sh      t0, 0x0014(a0)             # 00000014


func_800BBA48:
# MqDbg: 
    lbu     t1, 0x0004(a1)             # 00000004
    jr      $ra
    sb      t1, 0x000F(a0)             # 0000000F


func_800BBA54:
# MqDbg: 
    lhu     t3, 0x0004(a1)             # 00000004
    jr      $ra
    sh      t3, 0x0020(a0)             # 00000020


func_800BBA60:
# MqDbg: 
    lbu     t4, 0x0004(a1)             # 00000004
    sb      t4, 0x00D0(a0)             # 000000D0
lbl_800BBA68:
    jr      $ra
    nop


func_800BBA70:
# MqDbg: 
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
# MqDbg: 
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
# MqDbg: 
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
# MqDbg: 
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
# MqDbg: 
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
# MqDbg: 
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
# MqDbg: 
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
# MqDbg: 
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
# MqDbg: 
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
# MqDbg: 
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


func_800BBE00:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0020($sp)
    sw      a1, 0x0024($sp)
    jal     func_80003CC0              # osSetIntMask
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    sw      v0, 0x001C($sp)
    lw      a0, 0x0020($sp)
    jal     func_80004250              # osInvalDCache
    lw      a1, 0x0024($sp)
    jal     func_80003CC0              # osSetIntMask
    lw      a0, 0x001C($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800BBE40:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0020($sp)
    sw      a1, 0x0024($sp)
    jal     func_80003CC0              # osSetIntMask
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    sw      v0, 0x001C($sp)
    lw      a0, 0x0020($sp)
    jal     func_80003440              # osWritebackDCache
    lw      a1, 0x0024($sp)
    jal     func_80003CC0              # osSetIntMask
    lw      a0, 0x001C($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800BBE80:
# MqDbg: 
# s32 osAiSetNextBuffer(void* vaddr, u32 nbytes)
# Sets up DMA transfer from RDRAM to the audio interface buffer
# A0 = RDRAM virtual address (64-bit aligned)
# A1 = u32 number of bytes to transfer (multiple of 8 bytes)
# V0 = 0 if success, else -1 (if the interface is busy)
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x1810(t6)             # 80101810
    addu    t7, a0, a1
    or      v1, a0, $zero              # v1 = 00000000
    beq     t6, $zero, lbl_800BBE9C
    andi    t8, t7, 0x1FFF             # t8 = 00000000
    addiu   v1, a0, 0xE000             # v1 = FFFFE000
lbl_800BBE9C:
    bne     t8, $zero, lbl_800BBEB4
    lui     t0, 0xA450                 # t0 = A4500000
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    lui     $at, 0x8010                # $at = 80100000
    b       lbl_800BBEBC
    sb      t9, 0x1810($at)            # 80101810
lbl_800BBEB4:
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x1810($at)         # 80101810
lbl_800BBEBC:
    lw      v0, 0x000C(t0)             # A450000C
    lui     $at, 0x8000                # $at = 80000000
    addu    t2, v1, $at
    sll     t1, v0,  0
    bgez    t1, lbl_800BBEDC
    lui     t3, 0xA450                 # t3 = A4500000
    jr      $ra
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
lbl_800BBEDC:
    sw      t2, 0x0000(t3)             # A4500000
    lui     t4, 0xA450                 # t4 = A4500000
    sw      a1, 0x0004(t4)             # A4500004
    or      v0, $zero, $zero           # v0 = 00000000
    jr      $ra
    nop
    nop
    nop
    nop


func_800BBF00:
# MqDbg: 
    addiu   $sp, $sp, 0xFFB8           # $sp -= 0x48
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0048($sp)
    lbu     t7, 0x0002(a2)             # 00000002
    lbu     v0, 0x0035(a0)             # 00000035
    lwc1    $f2, 0x0008(a2)            # 00000008
    sb      t7, 0x0027($sp)
    lbu     t8, 0x0000(a2)             # 00000000
    addiu   t9, $sp, 0x0024            # t9 = FFFFFFDC
    or      a3, a1, $zero              # a3 = 00000000
    sb      t8, 0x0026($sp)
    lbu     t1, 0x0003(a2)             # 00000003
    or      a0, a1, $zero              # a0 = 00000000
    sb      t1, 0x0000(t9)             # FFFFFFDC
    lw      t2, 0x0048($sp)
    lbu     t4, 0x00C0(t2)             # 000000C0
    sb      t4, 0x0000(a1)             # 00000000
    lw      t5, 0x0048($sp)
    lbu     t7, 0x00C1(t5)             # 000000C1
    sb      t7, 0x0001(a1)             # 00000001
    lw      t8, 0x0048($sp)
    lw      t9, 0x00D0(t8)             # 000000D0
    sw      t9, 0x0010(a1)             # 00000010
    lw      t0, 0x0048($sp)
    lbu     t1, 0x00C6(t0)             # 000000C6
    sb      t1, 0x0006(a1)             # 00000006
    lw      a1, 0x0004(a2)             # 00000004
    sw      a3, 0x004C($sp)
    sw      a2, 0x0050($sp)
    sw      v0, 0x0020($sp)
    jal     func_800BC378
    swc1    $f2, 0x0028($sp)
    lbu     t2, 0x0027($sp)
    lw      a3, 0x004C($sp)
    lw      v0, 0x0020($sp)
    andi    t3, t2, 0x007F             # t3 = 00000000
    sb      t3, 0x0027($sp)
    lbu     t4, 0x0000(a3)             # 00000000
    lw      a2, 0x0050($sp)
    lwc1    $f2, 0x0028($sp)
    andi    t6, t4, 0xFFF7             # t6 = 00000000
    andi    t3, t6, 0x00FB             # t3 = 00000000
    sb      t6, 0x0000(a3)             # 00000000
    sb      t3, 0x0000(a3)             # 00000000
    lw      t8, 0x0024($sp)
    andi    t4, t3, 0x00FD             # t4 = 00000000
    mtc1    $zero, $f0                 # $f0 = 0.00
    sll     t9, t8,  6
    srl     t0, t9, 31
    sll     t1, t0,  1
    andi    t2, t1, 0x0002             # t2 = 00000000
    or      t9, t2, t4                 # t9 = 00000000
    sb      t9, 0x0000(a3)             # 00000000
    lbu     t7, 0x0024($sp)
    andi    t0, t9, 0x00FE             # t0 = 00000000
    lui     t3, 0x8012                 # t3 = 80120000
    andi    t8, t7, 0x0001             # t8 = 00000000
    or      t1, t8, t0                 # t1 = 00000000
    beq     v0, $zero, lbl_800BC070
    sb      t1, 0x0000(a3)             # 00000000
    lb      t3, 0x7ECA(t3)             # 80127ECA
    lbu     v1, 0x0027($sp)
    addiu   $at, $zero, 0x0001         # $at = 00000001
    bne     t3, $at, lbl_800BC070
    sra     v1, v1,  1
    slti    $at, v1, 0x0040
    bne     $at, $zero, lbl_800BC014
    lui     t2, 0x8010                 # t2 = 80100000
    addiu   v1, $zero, 0x003F          # v1 = 0000003F
lbl_800BC014:
    sll     v0, v1,  1
    addu    t2, t2, v0
    lhu     t2, 0x0E34(t2)             # 80100E34
    subu    t4, $zero, v0
    lui     t5, 0x8010                 # t5 = 80100000
    lbu     t7, 0x0001(a3)             # 00000001
    addu    t5, t5, t4
    sb      t2, 0x0004(a3)             # 00000004
    lhu     t5, 0x0EB2(t5)             # 80100EB2
    ori     t9, t7, 0x0001             # t9 = 00000001
    sb      t9, 0x0001(a3)             # 00000001
    sb      t5, 0x0003(a3)             # 00000003
    lbu     t8, 0x0027($sp)
    lui     $at, 0x8010                # $at = 80100000
    sll     t0, t8,  2
    addu    $at, $at, t0
    lwc1    $f12, 0x0F38($at)          # 80100F38
    sll     t1, t8,  2
    subu    t3, $zero, t1
    lui     $at, 0x8010                # $at = 80100000
    addu    $at, $at, t3
    b       lbl_800BC2D4
    lwc1    $f14, 0x1134($at)          # 80101134
lbl_800BC070:
    lui     v1, 0x8012                 # v1 = 80120000
    beq     v0, $zero, lbl_800BC23C
    lb      v1, 0x7ECA(v1)             # 80127ECA
    bnel    v1, $zero, lbl_800BC240
    addiu   $at, $zero, 0x0003         # $at = 00000003
    lbu     t2, 0x0001(a3)             # 00000001
    sb      $zero, 0x0003(a3)          # 00000003
    sb      $zero, 0x0004(a3)          # 00000004
    andi    t4, t2, 0xFFFE             # t4 = 00000000
    sb      t4, 0x0001(a3)             # 00000001
    lbu     t5, 0x0027($sp)
    lui     $at, 0x8010                # $at = 80100000
    or      v1, $zero, $zero           # v1 = 00000000
    sll     t6, t5,  2
    addu    $at, $at, t6
    lwc1    $f12, 0x1138($at)          # 80101138
    sll     t7, t5,  2
    subu    t9, $zero, t7
    lui     $at, 0x8010                # $at = 80100000
    addu    $at, $at, t9
    lwc1    $f14, 0x1334($at)          # 80101334
    slti    $at, t5, 0x0020
    beq     $at, $zero, lbl_800BC0D8
    or      a0, $zero, $zero           # a0 = 00000000
    b       lbl_800BC0EC
    addiu   a0, $zero, 0x0001          # a0 = 00000001
lbl_800BC0D8:
    lbu     t0, 0x0027($sp)
    slti    $at, t0, 0x0061
    bnel    $at, $zero, lbl_800BC0F0
    lbu     t2, 0x0000(a3)             # 00000000
    addiu   v1, $zero, 0x0001          # v1 = 00000001
lbl_800BC0EC:
    lbu     t2, 0x0000(a3)             # 00000000
lbl_800BC0F0:
    sll     t1, v1,  3
    andi    t3, t1, 0x0008             # t3 = 00000000
    andi    t4, t2, 0xFFF7             # t4 = 00000000
    or      t0, t3, t4                 # t0 = 00000000
    sll     t9, a0,  2
    andi    t5, t9, 0x0004             # t5 = 00000000
    andi    t8, t0, 0x00FB             # t8 = 00000000
    sb      t0, 0x0000(a3)             # 00000000
    or      t1, t5, t8                 # t1 = 00000000
    sb      t1, 0x0000(a3)             # 00000000
    lw      v0, 0x0024($sp)
    addiu   $at, $zero, 0x0001         # $at = 00000001
    sll     v0, v0,  2
    srl     v0, v0, 30
    beql    v0, $zero, lbl_800BC2D8
    c.lt.s  $f2, $f0
    beq     v0, $at, lbl_800BC158
    lw      t2, 0x0024($sp)
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     v0, $at, lbl_800BC19C
    lw      t0, 0x0024($sp)
    addiu   $at, $zero, 0x0003         # $at = 00000003
    beq     v0, $at, lbl_800BC1EC
    lw      t0, 0x0024($sp)
    b       lbl_800BC2D8
    c.lt.s  $f2, $f0
lbl_800BC158:
    lbu     t9, 0x0000(a3)             # 00000000
    sll     t3, t2,  4
    srl     t4, t3, 31
    sll     t6, t4,  3
    andi    t7, t6, 0x0008             # t7 = 00000000
    andi    t0, t9, 0xFFF7             # t0 = 00000001
    or      t6, t7, t0                 # t6 = 00000001
    sb      t6, 0x0000(a3)             # 00000000
    lw      t8, 0x0024($sp)
    andi    t9, t6, 0x00FB             # t9 = 00000001
    sll     t1, t8,  5
    srl     t2, t1, 31
    sll     t3, t2,  2
    andi    t4, t3, 0x0004             # t4 = 00000000
    or      t7, t4, t9                 # t7 = 00000001
    b       lbl_800BC2D4
    sb      t7, 0x0000(a3)             # 00000000
lbl_800BC19C:
    sll     t5, t0,  4
    lbu     t4, 0x0000(a3)             # 00000000
    srl     t8, t5, 31
    or      t2, t8, v1                 # t2 = 00000001
    sll     t3, t2,  3
    andi    t6, t3, 0x0008             # t6 = 00000000
    andi    t9, t4, 0xFFF7             # t9 = 00000000
    or      t7, t6, t9                 # t7 = 00000000
    sb      t7, 0x0000(a3)             # 00000000
    lw      t0, 0x0024($sp)
    or      t6, t7, $zero              # t6 = 00000000
    andi    t9, t6, 0x00FB             # t9 = 00000000
    sll     t5, t0,  5
    srl     t8, t5, 31
    or      t2, t8, a0                 # t2 = 00000001
    sll     t3, t2,  2
    andi    t4, t3, 0x0004             # t4 = 00000000
    or      t7, t4, t9                 # t7 = 00000000
    b       lbl_800BC2D4
    sb      t7, 0x0000(a3)             # 00000000
lbl_800BC1EC:
    sll     t5, t0,  4
    lbu     t4, 0x0000(a3)             # 00000000
    srl     t8, t5, 31
    xor     t2, t8, v1
    sll     t3, t2,  3
    andi    t6, t3, 0x0008             # t6 = 00000000
    andi    t9, t4, 0xFFF7             # t9 = 00000000
    or      t7, t6, t9                 # t7 = 00000000
    sb      t7, 0x0000(a3)             # 00000000
    lw      t0, 0x0024($sp)
    or      t6, t7, $zero              # t6 = 00000000
    andi    t9, t6, 0x00FB             # t9 = 00000000
    sll     t5, t0,  5
    srl     t8, t5, 31
    xor     t2, t8, a0
    sll     t3, t2,  2
    andi    t4, t3, 0x0004             # t4 = 00000000
    or      t7, t4, t9                 # t7 = 00000000
    b       lbl_800BC2D4
    sb      t7, 0x0000(a3)             # 00000000
lbl_800BC23C:
    addiu   $at, $zero, 0x0003         # $at = 00000003
lbl_800BC240:
    bne     v1, $at, lbl_800BC26C
    lw      t2, 0x0024($sp)
    lbu     t0, 0x0000(a3)             # 00000000
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f14, -0x6660($at)         # 801099A0
    andi    t8, t0, 0xFFFD             # t8 = 00000001
    sb      t8, 0x0000(a3)             # 00000000
    andi    t1, t8, 0x00FE             # t1 = 00000000
    sb      t1, 0x0000(a3)             # 00000000
    b       lbl_800BC2D4
    mov.s   $f12, $f14
lbl_800BC26C:
    lbu     t7, 0x0000(a3)             # 00000000
    sll     t3, t2,  4
    srl     t6, t3, 31
    sll     t4, t6,  3
    andi    t9, t4, 0x0008             # t9 = 00000000
    andi    t0, t7, 0xFFF7             # t0 = 00000000
    or      t4, t9, t0                 # t4 = 00000000
    sb      t4, 0x0000(a3)             # 00000000
    lw      t8, 0x0024($sp)
    andi    t7, t4, 0x00FB             # t7 = 00000000
    lui     $at, 0x8010                # $at = 80100000
    sll     t1, t8,  5
    srl     t2, t1, 31
    sll     t3, t2,  2
    andi    t6, t3, 0x0004             # t6 = 00000000
    or      t9, t6, t7                 # t9 = 00000000
    sb      t9, 0x0000(a3)             # 00000000
    lbu     t0, 0x0027($sp)
    sll     t5, t0,  2
    addu    $at, $at, t5
    lwc1    $f12, 0x1338($at)          # 80101338
    sll     t8, t0,  2
    subu    t1, $zero, t8
    lui     $at, 0x8010                # $at = 80100000
    addu    $at, $at, t1
    lwc1    $f14, 0x1534($at)          # 80101534
lbl_800BC2D4:
    c.lt.s  $f2, $f0
lbl_800BC2D8:
    lui     $at, 0x3F80                # $at = 3F800000
    bc1fl   lbl_800BC2EC
    mtc1    $at, $f0                   # $f0 = 1.00
    mov.s   $f2, $f0
    mtc1    $at, $f0                   # $f0 = 1.00
lbl_800BC2EC:
    nop
    c.lt.s  $f0, $f2
    nop
    bc1f    lbl_800BC304
    nop
    mov.s   $f2, $f0
lbl_800BC304:
    mul.s   $f4, $f2, $f12
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f0, -0x665C($at)          # 801099A4
    mul.s   $f6, $f4, $f0
    nop
    mul.s   $f10, $f2, $f14
    trunc.w.s $f8, $f6
    mul.s   $f16, $f10, $f0
    mfc1    t3, $f8
    nop
    sh      t3, 0x0008(a3)             # 00000008
    trunc.w.s $f18, $f16
    mfc1    t6, $f18
    nop
    sh      t6, 0x000A(a3)             # 0000000A
    lbu     t7, 0x0001(a2)             # 00000001
    sb      t7, 0x0002(a3)             # 00000002
    lw      t9, 0x0010(a2)             # 00000010
    sw      t9, 0x0014(a3)             # 00000014
    lbu     t5, 0x0014(a2)             # 00000014
    sb      t5, 0x0007(a3)             # 00000007
    lhu     t0, 0x0016(a2)             # 00000016
    sh      t0, 0x000E(a3)             # 0000000E
    lbu     t8, 0x0026($sp)
    sb      t8, 0x0005(a3)             # 00000005
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0048           # $sp += 0x48
    jr      $ra
    nop


func_800BC378:
# MqDbg: 
    lui     $at, 0x4000                # $at = 40000000
    mtc1    a1, $f12                   # $f12 = 0.00
    mtc1    $at, $f4                   # $f4 = 2.00
    lui     $at, 0x8011                # $at = 80110000
    c.lt.s  $f12, $f4
    nop
    bc1fl   lbl_800BC3C8
    lbu     t9, 0x0001(a0)             # 00000001
    lwc1    $f2, -0x6658($at)          # 801099A8
    lbu     t6, 0x0001(a0)             # 00000001
    c.lt.s  $f2, $f12
    andi    t7, t6, 0xFFFD             # t7 = 00000000
    sb      t7, 0x0001(a0)             # 00000001
    bc1f    lbl_800BC3BC
    nop
    b       lbl_800BC408
    mov.s   $f0, $f2
lbl_800BC3BC:
    b       lbl_800BC408
    mov.s   $f0, $f12
    lbu     t9, 0x0001(a0)             # 00000001
lbl_800BC3C8:
    lui     $at, 0x8011                # $at = 80110000
    ori     t0, t9, 0x0002             # t0 = 00000002
    sb      t0, 0x0001(a0)             # 00000001
    lwc1    $f6, -0x6654($at)          # 801099AC
    lui     $at, 0x3F00                # $at = 3F000000
    c.lt.s  $f6, $f12
    nop
    bc1fl   lbl_800BC3FC
    mtc1    $at, $f8                   # $f8 = 0.50
    lui     $at, 0x8011                # $at = 80110000
    b       lbl_800BC408
    lwc1    $f0, -0x6650($at)          # 801099B0
    mtc1    $at, $f8                   # $f8 = 0.00
lbl_800BC3FC:
    nop
    mul.s   $f0, $f12, $f8
    nop
lbl_800BC408:
    lui     $at, 0x4700                # $at = 47000000
    mtc1    $at, $f10                  # $f10 = 32768.00
    nop
    mul.s   $f16, $f0, $f10
    trunc.w.s $f18, $f16
    mfc1    t2, $f18
    jr      $ra
    sh      t2, 0x000C(a0)             # 0000000C


func_800BC428:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lw      v0, 0x0044(a0)             # 00000044
    or      a3, a0, $zero              # a3 = 00000000
    addiu   a2, a3, 0x0036             # a2 = 00000036
    lbu     t6, 0x0018(v0)             # 00000018
    bnel    t6, $zero, lbl_800BC46C
    lw      a1, 0x001C(v0)             # 0000001C
    lw      t7, 0x0050(v0)             # 00000050
    addiu   a0, a0, 0x0070             # a0 = 00000070
    addiu   a2, a3, 0x0036             # a2 = 00000036
    lw      a1, 0x0080(t7)             # 00000080
    jal     func_800BE5A4
    sw      a3, 0x0018($sp)
    b       lbl_800BC47C
    lw      a3, 0x0018($sp)
    lw      a1, 0x001C(v0)             # 0000001C
lbl_800BC46C:
    sw      a3, 0x0018($sp)
    jal     func_800BE5A4
    addiu   a0, a3, 0x0070             # a0 = 00000070
    lw      a3, 0x0018($sp)
lbl_800BC47C:
    lbu     t8, 0x0070(a3)             # 00000070
    lui     t1, 0x8010                 # t1 = 80100000
    sb      $zero, 0x0034(a3)          # 00000034
    andi    t9, t8, 0xFFF0             # t9 = 00000000
    ori     t0, t9, 0x0001             # t0 = 00000001
    sb      t0, 0x0070(a3)             # 00000070
    addiu   t1, t1, 0x0E14             # t1 = 80100E14
    lw      t3, 0x0000(t1)             # 80100E14
    sw      t3, 0x00C0(a3)             # 000000C0
    lw      t2, 0x0004(t1)             # 80100E18
    sw      t2, 0x00C4(a3)             # 000000C4
    lw      t3, 0x0008(t1)             # 80100E1C
    sw      t3, 0x00C8(a3)             # 000000C8
    lw      t2, 0x000C(t1)             # 80100E20
    sw      t2, 0x00CC(a3)             # 000000CC
    lw      t3, 0x0010(t1)             # 80100E24
    sw      t3, 0x00D0(a3)             # 000000D0
    lw      t2, 0x0014(t1)             # 80100E28
    sw      t2, 0x00D4(a3)             # 000000D4
    lw      t3, 0x0018(t1)             # 80100E2C
    sw      t3, 0x00D8(a3)             # 000000D8
    lw      t2, 0x001C(t1)             # 80100E30
    sw      t2, 0x00DC(a3)             # 000000DC
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BC4E8:
# MqDbg: 
    lw      t6, 0x00C0(a0)             # 000000C0
    addiu   $at, $zero, 0x0001         # $at = 00000001
    mtc1    $zero, $f4                 # $f4 = 0.00
    sll     t7, t6,  1
    srl     t8, t7, 31
    bne     t8, $at, lbl_800BC510
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
    lbu     t9, 0x00C0(a0)             # 000000C0
    andi    t0, t9, 0xFFBF             # t0 = 00000000
    sb      t0, 0x00C0(a0)             # 000000C0
lbl_800BC510:
    lbu     t1, 0x00C0(a0)             # 000000C0
    lbu     t5, 0x0070(a0)             # 00000070
    sb      $zero, 0x0030(a0)          # 00000030
    andi    t2, t1, 0xFF7F             # t2 = 00000000
    sb      t2, 0x00C0(a0)             # 000000C0
    lbu     t3, 0x00C0(a0)             # 000000C0
    andi    t6, t5, 0xFFF0             # t6 = 00000000
    sb      $zero, 0x0034(a0)          # 00000034
    andi    t4, t3, 0xFFDF             # t4 = 00000000
    sb      t4, 0x00C0(a0)             # 000000C0
    sw      v0, 0x0044(a0)             # 00000044
    sw      v0, 0x0040(a0)             # 00000040
    sb      t6, 0x0070(a0)             # 00000070
    jr      $ra
    swc1    $f4, 0x0080(a0)            # 00000080


func_800BC54C:
# MqDbg: 
    addiu   $sp, $sp, 0xFF60           # $sp -= 0xA0
    sw      s4, 0x0028($sp)
    lui     s4, 0x8012                 # s4 = 80120000
    addiu   s4, s4, 0x5630             # s4 = 80125630
    lw      v0, 0x2894(s4)             # 80127EC4
    sw      s5, 0x002C($sp)
    sw      $ra, 0x003C($sp)
    sw      s8, 0x0038($sp)
    sw      s7, 0x0034($sp)
    sw      s6, 0x0030($sp)
    sw      s3, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    blez    v0, lbl_800BC9EC
    or      s5, $zero, $zero           # s5 = 00000000
    or      s7, $zero, $zero           # s7 = 00000000
    addiu   s8, $sp, 0x006F            # s8 = FFFFFFCF
    addiu   s6, $zero, 0x0001          # s6 = 00000001
    addiu   s3, $zero, 0xFFFF          # s3 = FFFFFFFF
lbl_800BC59C:
    lw      t7, 0x5B84(s4)             # 8012B1B4
    lw      t0, 0x0014(s4)             # 80125644
    lw      t6, 0x352C(s4)             # 80128B5C
    addu    t8, t7, s5
    sll     t9, t8,  5
    addu    t1, t9, t0
    sw      t1, 0x0090($sp)
    addu    s1, s7, t6
    lw      t2, 0x0044(s1)             # 00000044
    addiu   s0, s1, 0x0030             # s0 = 00000030
    beql    s3, t2, lbl_800BC6D4
    lbu     t9, 0x0004(s0)             # 00000034
    addiu   s0, s1, 0x0030             # s0 = 00000030
    lw      a0, 0x0014(s0)             # 00000044
    lui     $at, 0x7FFF                # $at = 7FFF0000
    ori     $at, $at, 0xFFFF           # $at = 7FFFFFFF
    sltu    $at, a0, $at
    bnel    $at, $zero, lbl_800BC9E0
    addiu   s5, s5, 0x0001             # s5 = 00000001
    lw      t3, 0x002C(a0)             # 0000002C
    beql    s1, t3, lbl_800BC62C
    lw      t9, 0x0000(a0)             # 00000000
    lbu     t4, 0x0004(s0)             # 00000034
    bnel    t4, $zero, lbl_800BC62C
    lw      t9, 0x0000(a0)             # 00000000
    lbu     t6, 0x0040(s0)             # 00000070
    addiu   t8, $zero, 0x0002          # t8 = 00000002
    andi    v0, s6, 0x00FF             # v0 = 00000001
    ori     t7, t6, 0x0010             # t7 = 00000010
    sb      t7, 0x0040(s0)             # 00000070
    lwc1    $f4, 0x2864(s4)            # 80127E94
    sb      s6, 0x0000(s0)             # 00000030
    sb      t8, 0x0004(s0)             # 00000034
    b       lbl_800BC6EC
    swc1    $f4, 0x004C(s0)            # 0000007C
    lw      t9, 0x0000(a0)             # 00000000
lbl_800BC62C:
    srl     t0, t9, 31
    bnel    t0, $zero, lbl_800BC654
    lw      a1, 0x0050(a0)             # 00000050
    lbu     t1, 0x0004(s0)             # 00000034
    bnel    t1, $zero, lbl_800BC654
    lw      a1, 0x0050(a0)             # 00000050
    lbu     t2, 0x0000(s0)             # 00000030
    bgtz    t2, lbl_800BC6A0
    nop
    lw      a1, 0x0050(a0)             # 00000050
lbl_800BC654:
    lw      v0, 0x004C(a1)             # 0000004C
    bnel    v0, $zero, lbl_800BC67C
    lw      t3, 0x0000(v0)             # 00000001
    jal     func_800BEE88
    or      a0, a1, $zero              # a0 = 00000000
    sb      s6, 0x0000(s0)             # 00000030
    sb      s6, 0x0004(s0)             # 00000034
    b       lbl_800BC9DC
    lw      v0, 0x2894(s4)             # 80127EC4
    lw      t3, 0x0000(v0)             # 00000000
lbl_800BC67C:
    sll     t5, t3,  2
    bgez    t5, lbl_800BC698
    nop
    lbu     t6, 0x0003(a1)             # 00000003
    andi    t7, t6, 0x0040             # t7 = 00000000
    bne     t7, $zero, lbl_800BC6A0
    nop
lbl_800BC698:
    b       lbl_800BC6EC
    lbu     v0, 0x0000(s0)             # 00000030
lbl_800BC6A0:
    jal     func_800BD140
    nop
    jal     func_800BD69C
    or      a0, s1, $zero              # a0 = 00000000
    lw      a0, 0x000C(s1)             # 0000000C
    or      a1, s1, $zero              # a1 = 00000000
    jal     func_800BD65C
    addiu   a0, a0, 0x0010             # a0 = 00000010
    addiu   t8, $zero, 0x0002          # t8 = 00000002
    sb      s6, 0x0000(s0)             # 00000030
    b       lbl_800BC6E8
    sb      t8, 0x0004(s0)             # 00000034
    lbu     t9, 0x0004(s0)             # 00000034
lbl_800BC6D4:
    bnel    t9, $zero, lbl_800BC6EC
    lbu     v0, 0x0000(s0)             # 00000030
    lbu     t0, 0x0000(s0)             # 00000030
    bgtzl   t0, lbl_800BC9E0
    addiu   s5, s5, 0x0001             # s5 = 00000002
lbl_800BC6E8:
    lbu     v0, 0x0000(s0)             # 00000030
lbl_800BC6EC:
    beql    v0, $zero, lbl_800BC9DC
    lw      v0, 0x2894(s4)             # 80127EC4
    lbu     v0, 0x0004(s0)             # 00000034
    addiu   s2, s1, 0x00C0             # s2 = 000000C0
    bgtzl   v0, lbl_800BC718
    lbu     t4, 0x0040(s0)             # 00000070
    lw      t1, 0x0000(s2)             # 000000C0
    sll     t3, t1,  2
    bgezl   t3, lbl_800BC7FC
    lbu     t4, 0x0040(s0)             # 00000070
    lbu     t4, 0x0040(s0)             # 00000070
lbl_800BC718:
    addiu   s2, s1, 0x00C0             # s2 = 000000C0
    andi    t5, t4, 0x000F             # t5 = 00000000
    beql    t5, $zero, lbl_800BC73C
    lw      t9, 0x0018(s0)             # 00000048
    lw      t6, 0x0000(s2)             # 000000C0
    sll     t8, t6,  2
    bgez    t8, lbl_800BC844
    nop
    lw      t9, 0x0018(s0)             # 00000048
lbl_800BC73C:
    beql    s3, t9, lbl_800BC7C0
    lw      a0, 0x0014(s0)             # 00000044
    jal     func_800BC4E8
    or      a0, s1, $zero              # a0 = 00000000
    lw      a1, 0x0018(s0)             # 00000048
    or      a0, s1, $zero              # a0 = 00000000
    lw      t0, 0x0050(a1)             # 00000050
    beq     t0, $zero, lbl_800BC798
    nop
    jal     func_800BD748
    addiu   s2, s1, 0x00C0             # s2 = 000000C0
    jal     func_800BE4C0
    or      a0, s1, $zero              # a0 = 00000000
    jal     func_800BE578
    or      a0, s1, $zero              # a0 = 00000000
    jal     func_800BD69C
    or      a0, s1, $zero              # a0 = 00000000
    lw      a0, 0x000C(s1)             # 0000000C
    or      a1, s1, $zero              # a1 = 00000000
    jal     func_800BF1E8
    addiu   a0, a0, 0x0030             # a0 = 00000030
    b       lbl_800BC844
    sw      s3, 0x0018(s0)             # 00000048
lbl_800BC798:
    jal     func_800BC4E8
    or      a0, s1, $zero              # a0 = 00000000
    jal     func_800BD69C
    or      a0, s1, $zero              # a0 = 00000000
    lw      a0, 0x000C(s1)             # 0000000C
    jal     func_800BF1E8
    or      a1, s1, $zero              # a1 = 00000000
    b       lbl_800BC9D8
    sw      s3, 0x0018(s0)             # 00000048
    lw      a0, 0x0014(s0)             # 00000044
lbl_800BC7C0:
    beq     s3, a0, lbl_800BC7D4
    nop
    lbu     t2, 0x0000(a0)             # 00000000
    ori     t3, t2, 0x0002             # t3 = 00000002
    sb      t3, 0x0000(a0)             # 00000000
lbl_800BC7D4:
    jal     func_800BC4E8
    or      a0, s1, $zero              # a0 = 00000000
    jal     func_800BD69C
    or      a0, s1, $zero              # a0 = 00000000
    lw      a0, 0x000C(s1)             # 0000000C
    jal     func_800BF1E8
    or      a1, s1, $zero              # a1 = 00000000
    b       lbl_800BC9DC
    lw      v0, 0x2894(s4)             # 80127EC4
    lbu     t4, 0x0040(s0)             # 00000070
lbl_800BC7FC:
    andi    t5, t4, 0x000F             # t5 = 00000000
    bne     t5, $zero, lbl_800BC844
    nop
    lw      a0, 0x0014(s0)             # 00000044
    beq     s3, a0, lbl_800BC820
    nop
    lbu     t7, 0x0000(a0)             # 00000000
    ori     t8, t7, 0x0002             # t8 = 00000002
    sb      t8, 0x0000(a0)             # 00000000
lbl_800BC820:
    jal     func_800BC4E8
    or      a0, s1, $zero              # a0 = 00000000
    jal     func_800BD69C
    or      a0, s1, $zero              # a0 = 00000000
    lw      a0, 0x000C(s1)             # 0000000C
    jal     func_800BF1E8
    or      a1, s1, $zero              # a1 = 00000000
    b       lbl_800BC9DC
    lw      v0, 0x2894(s4)             # 80127EC4
lbl_800BC844:
    jal     func_800BE5C4
    addiu   a0, s0, 0x0040             # a0 = 00000070
    swc1    $f0, 0x0064($sp)
    jal     func_800BE464
    or      a0, s1, $zero              # a0 = 00000000
    lbu     v0, 0x0004(s0)             # 00000034
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     v0, $at, lbl_800BC86C
    addiu   $at, $zero, 0x0002         # $at = 00000002
    bne     v0, $at, lbl_800BC8CC
lbl_800BC86C:
    addiu   v0, s0, 0x001C             # v0 = 0000004C
    lwc1    $f6, 0x0008(v0)            # 00000054
    swc1    $f6, 0x0070($sp)
    lwc1    $f8, 0x000C(v0)            # 00000058
    swc1    $f8, 0x0074($sp)
    lbu     t9, 0x0002(v0)             # 0000004E
    sb      t9, 0x006E($sp)
    lbu     t0, 0x0000(v0)             # 0000004C
    sb      t0, 0x006C($sp)
    lbu     t2, 0x0003(v0)             # 0000004F
    sb      t2, 0x0000(s8)             # FFFFFFCF
    lbu     t3, 0x0001(v0)             # 0000004D
    sb      t3, 0x006D($sp)
    lw      t4, 0x0010(v0)             # 0000005C
    sw      t4, 0x007C($sp)
    lbu     t5, 0x0004(v0)             # 00000050
    sb      t5, 0x0080($sp)
    lhu     t6, 0x0006(v0)             # 00000052
    sh      t6, 0x0082($sp)
    lw      v1, 0x0000(s2)             # 000000C0
    sll     v1, v1, 11
    srl     v1, v1, 30
    b       lbl_800BC974
    andi    v1, v1, 0x00FF             # v1 = 00000000
lbl_800BC8CC:
    lw      v1, 0x0014(s0)             # 00000044
    lwc1    $f10, 0x0044(v1)           # 00000044
    lw      v0, 0x0050(v1)             # 00000050
    swc1    $f10, 0x0070($sp)
    lwc1    $f16, 0x0040(v1)           # 00000040
    swc1    $f16, 0x0074($sp)
    lbu     t7, 0x0007(v1)             # 00000007
    sb      t7, 0x006E($sp)
    lbu     t8, 0x0001(v1)             # 00000001
    bnel    t8, $zero, lbl_800BC908
    lbu     t2, 0x0001(v1)             # 00000001
    lbu     t0, 0x00D0(v0)             # 0000011C
    b       lbl_800BC90C
    sb      t0, 0x0000(s8)             # FFFFFFCF
    lbu     t2, 0x0001(v1)             # 00000001
lbl_800BC908:
    sb      t2, 0x0000(s8)             # FFFFFFCF
lbl_800BC90C:
    lbu     t3, 0x0004(v0)             # 00000050
    sb      t3, 0x006C($sp)
    lbu     t4, 0x000C(v0)             # 00000058
    sb      t4, 0x006D($sp)
    lw      t5, 0x00CC(v0)             # 00000118
    sw      t5, 0x007C($sp)
    lbu     t6, 0x000F(v0)             # 0000005B
    sb      t6, 0x0080($sp)
    lhu     t7, 0x0020(v0)             # 0000006C
    sh      t7, 0x0082($sp)
    lw      t8, 0x004C(v0)             # 00000098
    lbu     v1, 0x0009(v0)             # 00000055
    lw      t9, 0x0000(t8)             # 00000000
    andi    v1, v1, 0x0007             # v1 = 00000000
    andi    v1, v1, 0x00FF             # v1 = 00000000
    sll     t1, t9,  2
    bgezl   t1, lbl_800BC978
    lwc1    $f6, 0x000C(s0)            # 0000003C
    lbu     t2, 0x0003(v0)             # 0000004F
    andi    t3, t2, 0x0008             # t3 = 00000000
    beql    t3, $zero, lbl_800BC978
    lwc1    $f6, 0x000C(s0)            # 0000003C
    mtc1    $zero, $f18                # $f18 = 0.00
    mtc1    $zero, $f4                 # $f4 = 0.00
    swc1    $f18, 0x0070($sp)
    swc1    $f4, 0x0074($sp)
lbl_800BC974:
    lwc1    $f6, 0x000C(s0)            # 0000003C
lbl_800BC978:
    lwc1    $f8, 0x0008(s0)            # 00000038
    lwc1    $f16, 0x0070($sp)
    lwc1    $f4, 0x2860(s4)            # 80127E90
    mul.s   $f10, $f6, $f8
    lwc1    $f8, 0x0074($sp)
    sb      v1, 0x006B($sp)
    or      a0, s1, $zero              # a0 = 00000000
    lw      a1, 0x0090($sp)
    addiu   a2, $sp, 0x006C            # a2 = FFFFFFCC
    mul.s   $f18, $f16, $f10
    lwc1    $f16, 0x0064($sp)
    mul.s   $f6, $f18, $f4
    swc1    $f18, 0x0070($sp)
    mul.s   $f10, $f8, $f16
    swc1    $f6, 0x0070($sp)
    jal     func_800BBF00
    swc1    $f10, 0x0074($sp)
    lbu     t4, 0x006B($sp)
    lbu     t7, 0x0001(s2)             # 000000C1
    sll     t5, t4,  3
    andi    t6, t5, 0x0018             # t6 = 00000000
    andi    t8, t7, 0xFFE7             # t8 = 00000000
    or      t9, t6, t8                 # t9 = 00000000
    sb      t9, 0x0001(s2)             # 000000C1
lbl_800BC9D8:
    lw      v0, 0x2894(s4)             # 80127EC4
lbl_800BC9DC:
    addiu   s5, s5, 0x0001             # s5 = 00000003
lbl_800BC9E0:
    slt     $at, s5, v0
    bne     $at, $zero, lbl_800BC59C
    addiu   s7, s7, 0x00E0             # s7 = 000000E0
lbl_800BC9EC:
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


func_800BCA1C:
# MqDbg: 
    lbu     t6, 0x0001(a0)             # 00000001
    slt     $at, a1, t6
    beql    $at, $zero, lbl_800BCA38
    lbu     t7, 0x0002(a0)             # 00000002
    jr      $ra
    addiu   v0, a0, 0x0008             # v0 = 00000008
lbl_800BCA34:
    lbu     t7, 0x0002(a0)             # 00000002
lbl_800BCA38:
    addiu   v1, a0, 0x0018             # v1 = 00000018
    slt     $at, t7, a1
    bne     $at, $zero, lbl_800BCA50
    nop
    jr      $ra
    addiu   v0, a0, 0x0010             # v0 = 00000010
lbl_800BCA50:
    jr      $ra
    or      v0, v1, $zero              # v0 = 00000018


func_800BCA58:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    bne     a0, $at, lbl_800BCA70
    sw      $ra, 0x0014($sp)
    b       lbl_800BCB1C
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BCA70:
    sw      a0, 0x0018($sp)
    jal     func_800B6E70
    sw      a1, 0x001C($sp)
    lw      a0, 0x0018($sp)
    bne     v0, $zero, lbl_800BCAA4
    lw      a1, 0x001C($sp)
    lui     a2, 0x8012                 # a2 = 80120000
    lui     $at, 0x1000                # $at = 10000000
    addiu   a2, a2, 0x5630             # a2 = 80125630
    addu    t6, a0, $at
    sw      t6, 0x2980(a2)             # 80127FB0
    b       lbl_800BCB1C
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BCAA4:
    lui     a2, 0x8012                 # a2 = 80120000
    addiu   a2, a2, 0x5630             # a2 = 80125630
    lw      t7, 0x2844(a2)             # 80127E74
    sll     t8, a0,  2
    addu    t8, t8, a0
    sll     t8, t8,  2
    addu    v0, t7, t8
    lbu     t9, 0x0000(v0)             # 00000000
    sll     t0, a0,  8
    addu    t1, t0, a1
    slt     $at, a1, t9
    bne     $at, $zero, lbl_800BCAE8
    lui     $at, 0x0300                # $at = 03000000
    addu    t2, t1, $at
    sw      t2, 0x2980(a2)             # 80127FB0
    b       lbl_800BCB1C
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BCAE8:
    lw      t3, 0x0008(v0)             # 00000008
    sll     t4, a1,  2
    sll     t6, a0,  8
    addu    t5, t3, t4
    lw      v1, 0x0000(t5)             # 00000000
    addu    t7, t6, a1
    lui     $at, 0x0100                # $at = 01000000
    bne     v1, $zero, lbl_800BCB18
    addu    t8, t7, $at
    sw      t8, 0x2980(a2)             # 80127FB0
    b       lbl_800BCB1C
    or      v0, v1, $zero              # v0 = 00000000
lbl_800BCB18:
    or      v0, v1, $zero              # v0 = 00000000
lbl_800BCB1C:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BCB2C:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    sw      $ra, 0x0014($sp)
    bne     a0, $at, lbl_800BCB48
    or      a2, a1, $zero              # a2 = 00000000
    b       lbl_800BCC00
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BCB48:
    sw      a0, 0x0018($sp)
    jal     func_800B6E70
    sw      a2, 0x001C($sp)
    lw      a0, 0x0018($sp)
    bne     v0, $zero, lbl_800BCB7C
    lw      a2, 0x001C($sp)
    lui     a3, 0x8012                 # a3 = 80120000
    lui     $at, 0x1000                # $at = 10000000
    addiu   a3, a3, 0x5630             # a3 = 80125630
    addu    t6, a0, $at
    sw      t6, 0x2980(a3)             # 80127FB0
    b       lbl_800BCC00
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BCB7C:
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x5630             # a3 = 80125630
    lw      t7, 0x2844(a3)             # 80127E74
    sll     t8, a0,  2
    addu    t8, t8, a0
    sll     t8, t8,  2
    addu    v0, t7, t8
    lbu     t9, 0x0001(v0)             # 00000001
    sll     t0, a0,  8
    addu    t1, t0, a2
    slt     $at, a2, t9
    bne     $at, $zero, lbl_800BCBC0
    lui     $at, 0x0400                # $at = 04000000
    addu    t2, t1, $at
    sw      t2, 0x2980(a3)             # 80127FB0
    b       lbl_800BCC00
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BCBC0:
    lw      v1, 0x000C(v0)             # 0000000C
    lui     $at, 0x8000                # $at = 80000000
    sll     t3, a2,  2
    sltu    $at, v1, $at
    beq     $at, $zero, lbl_800BCBE0
    addu    t4, v1, t3
    b       lbl_800BCC00
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BCBE0:
    lw      a1, 0x0000(t4)             # 00000000
    sll     t5, a0,  8
    addu    t6, t5, a2
    bne     a1, $zero, lbl_800BCC00
    or      v0, a1, $zero              # v0 = 00000000
    lui     $at, 0x0500                # $at = 05000000
    addu    t7, t6, $at
    sw      t7, 0x2980(a3)             # 80127FB0
lbl_800BCC00:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BCC10:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    sw      $ra, 0x0014($sp)
    bne     a0, $at, lbl_800BCC2C
    or      a2, a1, $zero              # a2 = 00000000
    b       lbl_800BCCF4
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BCC2C:
    sw      a0, 0x0018($sp)
    jal     func_800B6E70
    sw      a2, 0x001C($sp)
    lw      a0, 0x0018($sp)
    bne     v0, $zero, lbl_800BCC60
    lw      a2, 0x001C($sp)
    lui     a3, 0x8012                 # a3 = 80120000
    lui     $at, 0x1000                # $at = 10000000
    addiu   a3, a3, 0x5630             # a3 = 80125630
    addu    t6, a0, $at
    sw      t6, 0x2980(a3)             # 80127FB0
    b       lbl_800BCCF4
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BCC60:
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x5630             # a3 = 80125630
    lw      t7, 0x2844(a3)             # 80127E74
    sll     t8, a0,  2
    addu    t8, t8, a0
    sll     t8, t8,  2
    addu    v0, t7, t8
    lhu     t9, 0x0004(v0)             # 00000004
    sll     t0, a0,  8
    addu    t1, t0, a2
    slt     $at, a2, t9
    bne     $at, $zero, lbl_800BCCA4
    lui     $at, 0x0400                # $at = 04000000
    addu    t2, t1, $at
    sw      t2, 0x2980(a3)             # 80127FB0
    b       lbl_800BCCF4
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BCCA4:
    lw      a1, 0x0010(v0)             # 00000010
    lui     $at, 0x8000                # $at = 80000000
    sll     t3, a2,  3
    sltu    $at, a1, $at
    beq     $at, $zero, lbl_800BCCC4
    addu    v1, a1, t3
    b       lbl_800BCCF4
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BCCC4:
    bne     v1, $zero, lbl_800BCCDC
    sll     t4, a0,  8
    addu    t5, t4, a2
    lui     $at, 0x0500                # $at = 05000000
    addu    t6, t5, $at
    sw      t6, 0x2980(a3)             # 80127FB0
lbl_800BCCDC:
    lw      t7, 0x0000(v1)             # 00000000
    or      v0, v1, $zero              # v0 = 00000000
    bne     t7, $zero, lbl_800BCCF4
    nop
    b       lbl_800BCCF4
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BCCF4:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BCD04:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    sw      $ra, 0x0014($sp)
    bne     a1, $at, lbl_800BCD20
    sw      a0, 0x0018($sp)
    b       lbl_800BCE38
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
lbl_800BCD20:
    or      a0, a1, $zero              # a0 = 00000000
    sw      a1, 0x001C($sp)
    sw      a2, 0x0020($sp)
    jal     func_800B6E70
    sw      a3, 0x0024($sp)
    lw      v1, 0x0018($sp)
    lw      a1, 0x001C($sp)
    lw      a2, 0x0020($sp)
    bne     v0, $zero, lbl_800BCD50
    lw      a3, 0x0024($sp)
    b       lbl_800BCE38
    addiu   v0, $zero, 0xFFFE          # v0 = FFFFFFFE
lbl_800BCD50:
    beq     v1, $zero, lbl_800BCD6C
    lui     t6, 0x8012                 # t6 = 80120000
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     v1, $at, lbl_800BCDAC
    lui     t2, 0x8012                 # t2 = 80120000
    b       lbl_800BCDF8
    lui     t0, 0x8012                 # t0 = 80120000
lbl_800BCD6C:
    lw      t6, 0x7E74(t6)             # 80127E74
    sll     t7, a1,  2
    addu    t7, t7, a1
    sll     t7, t7,  2
    addu    v0, t6, t7
    lbu     t8, 0x0001(v0)             # FFFFFFFF
    slt     $at, a2, t8
    bnel    $at, $zero, lbl_800BCD9C
    lw      t9, 0x000C(v0)             # 0000000A
    b       lbl_800BCE38
    addiu   v0, $zero, 0xFFFD          # v0 = FFFFFFFD
    lw      t9, 0x000C(v0)             # 00000009
lbl_800BCD9C:
    sll     t0, a2,  2
    addu    t1, t9, t0
    b       lbl_800BCE34
    sw      a3, 0x0000(t1)             # 00000000
lbl_800BCDAC:
    lw      t2, 0x7E74(t2)             # 80127E74
    sll     t3, a1,  2
    addu    t3, t3, a1
    sll     t3, t3,  2
    addu    v0, t2, t3
    lhu     t4, 0x0004(v0)             # 00000001
    slt     $at, a2, t4
    bnel    $at, $zero, lbl_800BCDDC
    lw      t5, 0x0010(v0)             # 0000000D
    b       lbl_800BCE38
    addiu   v0, $zero, 0xFFFD          # v0 = FFFFFFFD
    lw      t5, 0x0010(v0)             # 0000000D
lbl_800BCDDC:
    lw      t9, 0x0000(a3)             # 00000000
    sll     t6, a2,  3
    addu    t7, t5, t6
    sw      t9, 0x0000(t7)             # 00000000
    lw      t8, 0x0004(a3)             # 00000004
    b       lbl_800BCE34
    sw      t8, 0x0004(t7)             # 00000004
lbl_800BCDF8:
    lw      t0, 0x7E74(t0)             # 80127E74
    sll     t1, a1,  2
    addu    t1, t1, a1
    sll     t1, t1,  2
    addu    v0, t0, t1
    lbu     t2, 0x0000(v0)             # FFFFFFFD
    slt     $at, a2, t2
    bnel    $at, $zero, lbl_800BCE28
    lw      t3, 0x0008(v0)             # 00000005
    b       lbl_800BCE38
    addiu   v0, $zero, 0xFFFD          # v0 = FFFFFFFD
    lw      t3, 0x0008(v0)             # 00000005
lbl_800BCE28:
    sll     t4, a2,  2
    addu    t5, t3, t4
    sw      a3, 0x0000(t5)             # 00000000
lbl_800BCE34:
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BCE38:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BCE48:
# MqDbg: 
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      s0, 0x0018($sp)
    addiu   t0, $zero, 0xFFFF          # t0 = FFFFFFFF
    or      s0, a0, $zero              # s0 = 00000000
    sw      $ra, 0x001C($sp)
    beq     a0, t0, lbl_800BD10C
    sw      a1, 0x002C($sp)
    lbu     t6, 0x0000(a0)             # 00000000
    lw      v0, 0x002C(a0)             # 0000002C
    andi    t7, t6, 0xFFF7             # t7 = 00000000
    beq     v0, $zero, lbl_800BD10C
    sb      t7, 0x0000(a0)             # 00000000
    lw      t8, 0x0048(v0)             # 00000048
    or      a2, v0, $zero              # a2 = 00000000
    bnel    a0, t8, lbl_800BCE90
    lw      v0, 0x0044(a2)             # 00000044
    sw      t0, 0x0048(v0)             # 00000048
    lw      v0, 0x0044(a2)             # 00000044
lbl_800BCE90:
    beql    s0, v0, lbl_800BCEE4
    lbu     t7, 0x0070(a2)             # 00000070
    bnel    t0, v0, lbl_800BD110
    lw      $ra, 0x001C($sp)
    lw      t9, 0x0048(a2)             # 00000048
    bnel    t0, t9, lbl_800BD110
    lw      $ra, 0x001C($sp)
    lw      t2, 0x0040(a2)             # 00000040
    lw      t3, 0x002C($sp)
    bne     s0, t2, lbl_800BD10C
    addiu   t1, $zero, 0x0006          # t1 = 00000006
    beql    t3, t1, lbl_800BD110
    lw      $ra, 0x001C($sp)
    lbu     t5, 0x0070(a2)             # 00000070
    lui     $at, 0x8012                # $at = 80120000
    lwc1    $f4, 0x7E94($at)           # 80127E94
    ori     t6, t5, 0x0010             # t6 = 00000010
    sb      t6, 0x0070(a2)             # 00000070
    b       lbl_800BD10C
    swc1    $f4, 0x007C(a2)            # 0000007C
    lbu     t7, 0x0070(a2)             # 00000070
lbl_800BCEE4:
    addiu   t1, $zero, 0x0006          # t1 = 00000006
    andi    t8, t7, 0x000F             # t8 = 00000000
    beql    t1, t8, lbl_800BD0E8
    lw      t9, 0x002C($sp)
    lwc1    $f6, 0x0044(s0)            # 00000044
    addiu   a0, a2, 0x004C             # a0 = 0000004C
    swc1    $f6, 0x0008(a0)            # 00000054
    lwc1    $f8, 0x0040(s0)            # 00000040
    swc1    $f8, 0x000C(a0)            # 00000058
    lbu     t9, 0x0007(s0)             # 00000007
    sb      t9, 0x0002(a0)             # 0000004E
    lw      v0, 0x0050(s0)             # 00000050
    beql    v0, $zero, lbl_800BD00C
    lbu     t5, 0x0001(s0)             # 00000001
    lbu     t2, 0x0004(v0)             # 00000004
    or      a3, v0, $zero              # a3 = 00000000
    or      v1, a0, $zero              # v1 = 0000004C
    sb      t2, 0x0000(a0)             # 0000004C
    lbu     t3, 0x000C(v0)             # 0000000C
    addiu   a1, $zero, 0x0010          # a1 = 00000010
    sb      t3, 0x0001(a0)             # 0000004D
    lw      t4, 0x00CC(v0)             # 000000CC
    or      v0, $zero, $zero           # v0 = 00000000
    beq     t4, $zero, lbl_800BCF9C
    sw      t4, 0x0010(a0)             # 0000005C
lbl_800BCF48:
    lw      t6, 0x0010(a0)             # 0000005C
    addiu   v1, v1, 0x0008             # v1 = 00000054
    addu    t7, t6, v0
    lh      t8, 0x0000(t7)             # 00000000
    sh      t8, 0x000C(v1)             # 00000060
    lw      t9, 0x0010(a0)             # 0000005C
    addu    t2, t9, v0
    lh      t3, 0x0002(t2)             # 00000002
    sh      t3, 0x000E(v1)             # 00000062
    lw      t4, 0x0010(a0)             # 0000005C
    addu    t5, t4, v0
    lh      t6, 0x0004(t5)             # 00000004
    sh      t6, 0x0010(v1)             # 00000064
    lw      t7, 0x0010(a0)             # 0000005C
    addu    t8, t7, v0
    lh      t9, 0x0006(t8)             # 00000006
    addiu   v0, v0, 0x0008             # v0 = 00000008
    bne     v0, a1, lbl_800BCF48
    sh      t9, 0x0012(v1)             # 00000066
    addiu   t2, a0, 0x0014             # t2 = 00000060
    sw      t2, 0x0010(a0)             # 0000005C
lbl_800BCF9C:
    lhu     t3, 0x0020(a3)             # 00000020
    sh      t3, 0x0006(a0)             # 00000052
    lbu     t4, 0x000F(a3)             # 0000000F
    sb      t4, 0x0004(a0)             # 00000050
    lw      t5, 0x004C(a3)             # 0000004C
    lw      t6, 0x0000(t5)             # 00000000
    sll     t8, t6,  2
    bgezl   t8, lbl_800BCFE0
    lbu     t6, 0x0001(s0)             # 00000001
    lbu     t9, 0x0003(a3)             # 00000003
    andi    t2, t9, 0x0008             # t2 = 00000000
    beql    t2, $zero, lbl_800BCFE0
    lbu     t6, 0x0001(s0)             # 00000001
    lbu     t4, 0x00C0(a2)             # 000000C0
    ori     t5, t4, 0x0020             # t5 = 00000020
    sb      t5, 0x00C0(a2)             # 000000C0
    lbu     t6, 0x0001(s0)             # 00000001
lbl_800BCFE0:
    bnel    t6, $zero, lbl_800BCFF8
    lbu     t2, 0x0001(s0)             # 00000001
    lbu     t8, 0x00D0(a3)             # 000000D0
    b       lbl_800BCFFC
    sb      t8, 0x0003(a0)             # 0000004F
    lbu     t2, 0x0001(s0)             # 00000001
lbl_800BCFF8:
    sb      t2, 0x0003(a0)             # 0000004F
lbl_800BCFFC:
    lbu     t3, 0x0006(a3)             # 00000006
    b       lbl_800BD018
    sb      t3, 0x0030(a2)             # 00000030
    lbu     t5, 0x0001(s0)             # 00000001
lbl_800BD00C:
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    sb      t5, 0x0003(a0)             # 0000004F
    sb      t6, 0x0030(a2)             # 00000030
lbl_800BD018:
    lw      t7, 0x0044(a2)             # 00000044
    sw      t0, 0x0044(a2)             # 00000044
    addiu   $at, $zero, 0x0007         # $at = 00000007
    sw      t7, 0x0040(a2)             # 00000040
    lw      t8, 0x002C($sp)
    addiu   t4, $zero, 0x0002          # t4 = 00000002
    bnel    t8, $at, lbl_800BD05C
    lbu     t7, 0x0070(a2)             # 00000070
    lbu     t2, 0x0070(a2)             # 00000070
    lui     $at, 0x8012                # $at = 80120000
    lwc1    $f10, 0x7E94($at)          # 80127E94
    ori     t3, t2, 0x0010             # t3 = 00000010
    sb      t3, 0x0070(a2)             # 00000070
    sb      t4, 0x0034(a2)             # 00000034
    b       lbl_800BD0E4
    swc1    $f10, 0x007C(a2)           # 0000007C
    lbu     t7, 0x0070(a2)             # 00000070
lbl_800BD05C:
    addiu   t5, $zero, 0x0001          # t5 = 00000001
    sb      t5, 0x0034(a2)             # 00000034
    ori     t8, t7, 0x0020             # t8 = 00000020
    sb      t8, 0x0070(a2)             # 00000070
    lbu     v0, 0x0018(s0)             # 00000018
    lui     t6, 0x8013                 # t6 = 80130000
    bne     v0, $zero, lbl_800BD0A0
    nop
    lw      t2, 0x0050(s0)             # 00000050
    lui     t9, 0x8013                 # t9 = 80130000
    lw      t9, -0x74B0(t9)            # 80128B50
    lbu     t3, 0x007C(t2)             # 0000007C
    sll     t4, t3,  2
    addu    t5, t9, t4
    lwc1    $f16, 0x0000(t5)           # 00000001
    b       lbl_800BD0B4
    swc1    $f16, 0x007C(a2)           # 0000007C
lbl_800BD0A0:
    lw      t6, -0x74B0(t6)            # 80128B50
    sll     t7, v0,  2
    addu    t8, t6, t7
    lwc1    $f18, 0x0000(t8)           # 00000020
    swc1    $f18, 0x007C(a2)           # 0000007C
lbl_800BD0B4:
    lw      t2, 0x0050(s0)             # 00000050
    lwc1    $f8, 0x0080(a2)            # 00000080
    lui     $at, 0x3B80                # $at = 3B800000
    lbu     t3, 0x007D(t2)             # 0000007D
    mtc1    $at, $f16                  # $f16 = 0.00
    mtc1    t3, $f4                    # $f4 = 0.00
    nop
    cvt.s.w $f6, $f4
    mul.s   $f10, $f6, $f8
    nop
    mul.s   $f18, $f10, $f16
    swc1    $f18, 0x0074(a2)           # 00000074
lbl_800BD0E4:
    lw      t9, 0x002C($sp)
lbl_800BD0E8:
    or      a0, a2, $zero              # a0 = 00000000
    bnel    t9, t1, lbl_800BD110
    lw      $ra, 0x001C($sp)
    jal     func_800BD69C
    sw      a2, 0x0024($sp)
    lw      a1, 0x0024($sp)
    lw      a0, 0x000C(a1)             # 0000000C
    jal     func_800BD65C
    addiu   a0, a0, 0x0010             # a0 = 00000010
lbl_800BD10C:
    lw      $ra, 0x001C($sp)
lbl_800BD110:
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800BD120:
# MqDbg: 
# Wrapper for 800BCE48 (A1 = 6)
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800BCE48
    addiu   a1, $zero, 0x0006          # a1 = 00000006
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BD140:
# MqDbg: 
# Wrapper for 800BCE48 (A1 = 7)
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800BCE48
    addiu   a1, $zero, 0x0007          # a1 = 00000007
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BD160:
# MqDbg: 
    slti    $at, a2, 0x0080
    beq     $at, $zero, lbl_800BD170
    or      v1, $zero, $zero           # v1 = 00000000
    addiu   a2, $zero, 0x0080          # a2 = 00000080
lbl_800BD170:
    lbu     t6, 0x0020(a1)             # 00000020
    lwc1    $f0, 0x0030(a1)            # 00000030
    beq     t6, $zero, lbl_800BD1B0
    mov.s   $f2, $f0
    lwc1    $f12, 0x0028(a1)           # 00000028
    mtc1    $zero, $f4                 # $f4 = 0.00
    lui     $at, 0x3F80                # $at = 3F800000
    c.lt.s  $f4, $f12
    nop
    bc1f    lbl_800BD1B0
    nop
    mtc1    $at, $f6                   # $f6 = 1.00
    nop
    add.s   $f8, $f12, $f6
    mul.s   $f2, $f2, $f8
    nop
lbl_800BD1B0:
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f10, -0x664C($at)         # 801099B4
    lui     $at, 0x8011                # $at = 80110000
    c.lt.s  $f2, $f10
    nop
    bc1f    lbl_800BD1D8
    nop
    lui     $at, 0x8011                # $at = 80110000
    b       lbl_800BD230
    lwc1    $f2, -0x6648($at)          # 801099B8
lbl_800BD1D8:
    lwc1    $f16, -0x6644($at)         # 801099BC
    addiu   v1, $zero, 0x0001          # v1 = 00000001
    lui     $at, 0x8011                # $at = 80110000
    c.lt.s  $f2, $f16
    nop
    bc1f    lbl_800BD200
    nop
    lui     $at, 0x8011                # $at = 80110000
    b       lbl_800BD230
    lwc1    $f2, -0x6640($at)          # 801099C0
lbl_800BD200:
    lwc1    $f18, -0x663C($at)         # 801099C4
    addiu   v1, $zero, 0x0003          # v1 = 00000003
    lui     $at, 0x8011                # $at = 80110000
    c.lt.s  $f2, $f18
    nop
    bc1f    lbl_800BD22C
    nop
    lui     $at, 0x8011                # $at = 80110000
    addiu   v1, $zero, 0x0002          # v1 = 00000002
    b       lbl_800BD230
    lwc1    $f2, -0x6638($at)          # 801099C8
lbl_800BD22C:
    lwc1    $f2, -0x6634($at)          # 801099CC
lbl_800BD230:
    mul.s   $f4, $f0, $f2
    sll     t7, a2,  2
    lui     t8, 0x8010                 # t8 = 80100000
    addu    t8, t8, t7
    sll     t9, v1,  7
    or      v0, v1, $zero              # v0 = 00000002
    swc1    $f4, 0x0030(a1)            # 00000030
    sb      a2, 0x0031(a0)             # 00000031
    sb      v1, 0x0032(a0)             # 00000032
    lw      t8, 0x01A0(t8)             # 801001A0
    addu    t0, t8, t9
    jr      $ra
    sw      t0, 0x00D0(a0)             # 000000D0


func_800BD264:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    lbu     a2, 0x0002(a1)             # 00000002
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    bnel    a2, $at, lbl_800BD288
    lbu     v1, 0x0032(a0)             # 00000032
    lw      t6, 0x0050(a1)             # 00000050
    lh      a2, 0x0024(t6)             # 00000024
    lbu     v1, 0x0032(a0)             # 00000032
lbl_800BD288:
    sw      a0, 0x0020($sp)
    jal     func_800BD160
    sw      v1, 0x001C($sp)
    lw      v1, 0x001C($sp)
    sll     t7, v0,  2
    lw      a0, 0x0020($sp)
    beq     v0, v1, lbl_800BD2AC
    addu    t8, t7, v1
    sb      t8, 0x00C6(a0)             # 000000C6
lbl_800BD2AC:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800BD2BC:
# MqDbg: 
    sw      a0, 0x0000(a0)             # 00000000
    sw      a0, 0x0004(a0)             # 00000004
    jr      $ra
    sw      $zero, 0x0008(a0)          # 00000008


func_800BD2CC:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x001C($sp)
    sw      s0, 0x0018($sp)
    jal     func_800BD2BC
    or      s0, a0, $zero              # s0 = 00000000
    jal     func_800BD2BC
    addiu   a0, s0, 0x0010             # a0 = 00000010
    jal     func_800BD2BC
    addiu   a0, s0, 0x0020             # a0 = 00000020
    jal     func_800BD2BC
    addiu   a0, s0, 0x0030             # a0 = 00000030
    sw      s0, 0x000C(s0)             # 0000000C
    sw      s0, 0x001C(s0)             # 0000001C
    sw      s0, 0x002C(s0)             # 0000002C
    sw      s0, 0x003C(s0)             # 0000003C
    lw      $ra, 0x001C($sp)
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800BD31C:
# MqDbg: 
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      s3, 0x0020($sp)
    lui     s3, 0x8013                 # s3 = 80130000
    addiu   s3, s3, 0xB1C8             # s3 = 8012B1C8
    sw      $ra, 0x0024($sp)
    sw      s2, 0x001C($sp)
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    jal     func_800BD2CC
    or      a0, s3, $zero              # a0 = 8012B1C8
    lui     s1, 0x8012                 # s1 = 80120000
    addiu   s1, s1, 0x5630             # s1 = 80125630
    lw      t6, 0x2894(s1)             # 80127EC4
    or      s2, $zero, $zero           # s2 = 00000000
    or      s0, $zero, $zero           # s0 = 00000000
    blezl   t6, lbl_800BD3A8
    lw      $ra, 0x0024($sp)
    lw      v0, 0x352C(s1)             # 80128B5C
lbl_800BD364:
    or      a0, s3, $zero              # a0 = 8012B1C8
    addu    t7, s0, v0
    addu    t8, v0, s0
    sw      t7, 0x0008(t8)             # 00000008
    lw      t9, 0x352C(s1)             # 80128B5C
    addu    t0, t9, s0
    sw      $zero, 0x0000(t0)          # 00000000
    lw      t1, 0x352C(s1)             # 80128B5C
    jal     func_800BF1E8
    addu    a1, s0, t1
    lw      t2, 0x2894(s1)             # 80127EC4
    addiu   s2, s2, 0x0001             # s2 = 00000001
    addiu   s0, s0, 0x00E0             # s0 = 000000E0
    slt     $at, s2, t2
    bnel    $at, $zero, lbl_800BD364
    lw      v0, 0x352C(s1)             # 80128B5C
    lw      $ra, 0x0024($sp)
lbl_800BD3A8:
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28


func_800BD3C0:
# MqDbg: 
# Audio?
    addiu   $sp, $sp, 0xFFB0           # $sp -= 0x50
    sw      s8, 0x0038($sp)
    sw      s7, 0x0034($sp)
    sw      s6, 0x0030($sp)
    sw      s5, 0x002C($sp)
    sw      s4, 0x0028($sp)
    sw      s3, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    lui     a2, 0x8013                 # a2 = 80130000
    lui     a1, 0x8013                 # a1 = 80130000
    lui     v1, 0x8013                 # v1 = 80130000
    lui     v0, 0x8013                 # v0 = 80130000
    or      s4, a0, $zero              # s4 = 00000000
    sw      $ra, 0x003C($sp)
    sw      s0, 0x0018($sp)
    addiu   v0, v0, 0xB1F8             # v0 = 8012B1F8
    addiu   v1, v1, 0xB1E8             # v1 = 8012B1E8
    addiu   a1, a1, 0xB1D8             # a1 = 8012B1D8
    addiu   a2, a2, 0xB1C8             # a2 = 8012B1C8
    lw      s1, 0x0048($sp)
    lw      s2, 0x0040($sp)
    or      s3, $zero, $zero           # s3 = 00000000
    addiu   s5, $zero, 0x0001          # s5 = 00000001
    addiu   s6, $zero, 0x0002          # s6 = 00000002
    addiu   s7, $zero, 0x0003          # s7 = 00000003
    addiu   s8, $zero, 0x0004          # s8 = 00000004
lbl_800BD42C:
    beql    s3, $zero, lbl_800BD458
    or      s1, s4, $zero              # s1 = 00000000
    beql    s3, s5, lbl_800BD468
    addiu   s1, s4, 0x0010             # s1 = 00000010
    beql    s3, s6, lbl_800BD478
    addiu   s1, s4, 0x0020             # s1 = 00000020
    beql    s3, s7, lbl_800BD488
    addiu   s1, s4, 0x0030             # s1 = 00000030
    b       lbl_800BD490
    lw      s0, 0x0004(s1)             # 00000034
    or      s1, s4, $zero              # s1 = 00000000
lbl_800BD458:
    or      s2, a2, $zero              # s2 = 8012B1C8
    b       lbl_800BD490
    lw      s0, 0x0004(s4)             # 00000004
    addiu   s1, s4, 0x0010             # s1 = 00000010
lbl_800BD468:
    or      s2, a1, $zero              # s2 = 8012B1D8
    b       lbl_800BD490
    lw      s0, 0x0004(s1)             # 00000014
    addiu   s1, s4, 0x0020             # s1 = 00000020
lbl_800BD478:
    or      s2, v1, $zero              # s2 = 8012B1E8
    b       lbl_800BD490
    lw      s0, 0x0004(s1)             # 00000024
    addiu   s1, s4, 0x0030             # s1 = 00000030
lbl_800BD488:
    or      s2, v0, $zero              # s2 = 8012B1F8
    lw      s0, 0x0004(s1)             # 00000034
lbl_800BD490:
    beql    s0, s1, lbl_800BD4E0
    addiu   s3, s3, 0x0001             # s3 = 00000001
lbl_800BD498:
    beql    s0, $zero, lbl_800BD4E0
    addiu   s3, s3, 0x0001             # s3 = 00000002
    jal     func_800BD69C
    or      a0, s0, $zero              # a0 = 00000000
    or      a0, s2, $zero              # a0 = 8012B1F8
    jal     func_800BF1E8
    or      a1, s0, $zero              # a1 = 00000000
    lw      s0, 0x0004(s1)             # 00000034
    lui     a2, 0x8013                 # a2 = 80130000
    lui     a1, 0x8013                 # a1 = 80130000
    lui     v1, 0x8013                 # v1 = 80130000
    lui     v0, 0x8013                 # v0 = 80130000
    addiu   v0, v0, 0xB1F8             # v0 = 8012B1F8
    addiu   v1, v1, 0xB1E8             # v1 = 8012B1E8
    addiu   a1, a1, 0xB1D8             # a1 = 8012B1D8
    bne     s0, s1, lbl_800BD498
    addiu   a2, a2, 0xB1C8             # a2 = 8012B1C8
    addiu   s3, s3, 0x0001             # s3 = 00000003
lbl_800BD4E0:
    bne     s3, s8, lbl_800BD42C
    nop
    lw      $ra, 0x003C($sp)
    sw      s2, 0x0040($sp)
    sw      s1, 0x0048($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    lw      s0, 0x0018($sp)
    lw      s3, 0x0024($sp)
    lw      s4, 0x0028($sp)
    lw      s5, 0x002C($sp)
    lw      s6, 0x0030($sp)
    lw      s7, 0x0034($sp)
    lw      s8, 0x0038($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050           # $sp += 0x50


func_800BD520:
# MqDbg: 
    addiu   $sp, $sp, 0xFFA8           # $sp -= 0x58
    sw      $ra, 0x003C($sp)
    sw      s5, 0x002C($sp)
    sw      s3, 0x0024($sp)
    or      s3, a1, $zero              # s3 = 00000000
    or      s5, a0, $zero              # s5 = 00000000
    sw      s8, 0x0038($sp)
    sw      s7, 0x0034($sp)
    sw      s6, 0x0030($sp)
    sw      s4, 0x0028($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    jal     func_800BD3C0
    sw      s0, 0x0018($sp)
    or      s4, $zero, $zero           # s4 = 00000000
    blez    s3, lbl_800BD62C
    or      s0, $zero, $zero           # s0 = 00000000
    addiu   s8, $zero, 0x0002          # s8 = 00000002
    addiu   s7, $zero, 0x0001          # s7 = 00000001
    addiu   s6, $zero, 0x0004          # s6 = 00000004
    lw      s2, 0x0044($sp)
    lw      s1, 0x0048($sp)
lbl_800BD578:
    beql    s4, s6, lbl_800BD630
    lw      $ra, 0x003C($sp)
    beq     s4, $zero, lbl_800BD5A8
    nop
    beq     s4, s7, lbl_800BD5B8
    nop
    beq     s4, s8, lbl_800BD5C8
    addiu   $at, $zero, 0x0003         # $at = 00000003
    beq     s4, $at, lbl_800BD5D8
    nop
    b       lbl_800BD5E8
    slt     $at, s0, s3
lbl_800BD5A8:
    lui     s1, 0x8013                 # s1 = 80130000
    addiu   s1, s1, 0xB1C8             # s1 = 8012B1C8
    b       lbl_800BD5E4
    or      s2, s5, $zero              # s2 = 00000000
lbl_800BD5B8:
    lui     s1, 0x8013                 # s1 = 80130000
    addiu   s1, s1, 0xB1D8             # s1 = 8012B1D8
    b       lbl_800BD5E4
    addiu   s2, s5, 0x0010             # s2 = 00000010
lbl_800BD5C8:
    lui     s1, 0x8013                 # s1 = 80130000
    addiu   s1, s1, 0xB1E8             # s1 = 8012B1E8
    b       lbl_800BD5E4
    addiu   s2, s5, 0x0020             # s2 = 00000020
lbl_800BD5D8:
    lui     s1, 0x8013                 # s1 = 80130000
    addiu   s1, s1, 0xB1F8             # s1 = 8012B1F8
    addiu   s2, s5, 0x0030             # s2 = 00000030
lbl_800BD5E4:
    slt     $at, s0, s3
lbl_800BD5E8:
    beql    $at, $zero, lbl_800BD61C
    slt     $at, s0, s3
lbl_800BD5F0:
    jal     func_800BF228
    or      a0, s1, $zero              # a0 = 8012B1F8
    beq     v0, $zero, lbl_800BD618
    or      a1, v0, $zero              # a1 = 00000000
    jal     func_800BF1E8
    or      a0, s2, $zero              # a0 = 00000030
    addiu   s0, s0, 0x0001             # s0 = 00000001
    slt     $at, s0, s3
    bne     $at, $zero, lbl_800BD5F0
    nop
lbl_800BD618:
    slt     $at, s0, s3
lbl_800BD61C:
    bne     $at, $zero, lbl_800BD578
    addiu   s4, s4, 0x0001             # s4 = 00000001
    sw      s2, 0x0044($sp)
    sw      s1, 0x0048($sp)
lbl_800BD62C:
    lw      $ra, 0x003C($sp)
lbl_800BD630:
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
    addiu   $sp, $sp, 0x0058           # $sp += 0x58


func_800BD65C:
# MqDbg: 
    lw      t6, 0x0000(a1)             # 00000000
    bne     t6, $zero, lbl_800BD694
    nop
    sw      a0, 0x0000(a1)             # 00000000
    lw      t7, 0x0004(a0)             # 00000004
    sw      t7, 0x0004(a1)             # 00000004
    lw      t8, 0x0004(a0)             # 00000004
    sw      a1, 0x0000(t8)             # 00000000
    lw      t9, 0x0008(a0)             # 00000008
    lw      t1, 0x000C(a0)             # 0000000C
    sw      a1, 0x0004(a0)             # 00000004
    addiu   t0, t9, 0x0001             # t0 = 00000001
    sw      t0, 0x0008(a0)             # 00000008
    sw      t1, 0x000C(a1)             # 0000000C
lbl_800BD694:
    jr      $ra
    nop


func_800BD69C:
# MqDbg: 
# Audio, delete?
# A0 = some struct ptr
    lw      v0, 0x0000(a0)             # 00000000
    beq     v0, $zero, lbl_800BD6C0
    nop
    lw      t6, 0x0004(a0)             # 00000004
    sw      t6, 0x0004(v0)             # 00000004
    lw      t7, 0x0000(a0)             # 00000000
    lw      t8, 0x0004(a0)             # 00000004
    sw      t7, 0x0000(t8)             # 00000000
    sw      $zero, 0x0000(a0)          # 00000000
lbl_800BD6C0:
    jr      $ra
    nop


func_800BD6C8:
# MqDbg: 
    lw      v0, 0x0004(a0)             # 00000004
    bne     v0, a0, lbl_800BD6DC
    nop
    jr      $ra
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BD6DC:
    beq     v0, a0, lbl_800BD710
    or      v1, v0, $zero              # v1 = 00000000
    lw      t6, 0x0008(v1)             # 00000008
lbl_800BD6E8:
    lw      t8, 0x0008(v0)             # 00000008
    lbu     t7, 0x0030(t6)             # 00000030
    lbu     t9, 0x0030(t8)             # 00000030
    slt     $at, t7, t9
    bnel    $at, $zero, lbl_800BD708
    lw      v0, 0x0004(v0)             # 00000004
    or      v1, v0, $zero              # v1 = 00000000
    lw      v0, 0x0004(v0)             # 00000004
lbl_800BD708:
    bnel    v0, a0, lbl_800BD6E8
    lw      t6, 0x0008(v1)             # 00000008
lbl_800BD710:
    bnel    v1, $zero, lbl_800BD724
    lw      a0, 0x0008(v1)             # 00000008
    jr      $ra
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BD720:
    lw      a0, 0x0008(v1)             # 00000008
lbl_800BD724:
    lbu     t0, 0x0030(a0)             # 00000030
    or      v0, a0, $zero              # v0 = 00000000
    slt     $at, t0, a1
    bne     $at, $zero, lbl_800BD740
    nop
    jr      $ra
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BD740:
    jr      $ra
    nop


func_800BD748:
# MqDbg: 
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      $ra, 0x0014($sp)
    addiu   t6, $zero, 0xFFFF          # t6 = FFFFFFFF
    sw      t6, 0x0040(a0)             # 00000040
    sw      a1, 0x0044(a0)             # 00000044
    lw      t7, 0x0050(a1)             # 00000050
    mtc1    $zero, $f4                 # $f4 = 0.00
    lbu     t8, 0x0005(t7)             # 00000005
    sb      t8, 0x0030(a0)             # 00000030
    lbu     t0, 0x0000(a1)             # 00000000
    lw      t5, 0x0050(a1)             # 00000050
    sw      a0, 0x002C(a1)             # 0000002C
    ori     t3, t0, 0x0001             # t3 = 00000001
    sb      t3, 0x0000(a1)             # 00000000
    ori     t4, t3, 0x0008             # t4 = 00000009
    sb      t4, 0x0000(a1)             # 00000000
    sw      a0, 0x0040(t5)             # 00000040
    lw      t6, 0x0050(a1)             # 00000050
    sw      a1, 0x0044(t6)             # 00000043
    swc1    $f4, 0x0040(a1)            # 00000040
    sw      a1, 0x003C($sp)
    jal     func_800BC428
    sw      a0, 0x0038($sp)
    lw      a1, 0x003C($sp)
    lw      a0, 0x0038($sp)
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    lbu     a2, 0x0002(a1)             # 00000002
    addiu   v1, a0, 0x00C0             # v1 = 000000C0
    bnel    a2, $at, lbl_800BD7CC
    lw      t8, 0x004C(a1)             # 0000004C
    lw      t7, 0x0050(a1)             # 00000050
    lh      a2, 0x0024(t7)             # 00000024
    lw      t8, 0x004C(a1)             # 0000004C
lbl_800BD7CC:
    slti    $at, a2, 0x0080
    bne     $at, $zero, lbl_800BD7F4
    sw      t8, 0x0010(v1)             # 000000D0
    slti    $at, a2, 0x00C0
    beql    $at, $zero, lbl_800BD7F8
    lbu     t2, 0x0001(v1)             # 000000C1
    lbu     t0, 0x0001(v1)             # 000000C1
    ori     t1, t0, 0x0004             # t1 = 00000004
    b       lbl_800BD800
    sb      t1, 0x0001(v1)             # 000000C1
lbl_800BD7F4:
    lbu     t2, 0x0001(v1)             # 000000C1
lbl_800BD7F8:
    andi    t3, t2, 0xFFFB             # t3 = 00000000
    sb      t3, 0x0001(v1)             # 000000C1
lbl_800BD800:
    lw      t4, 0x0000(v1)             # 000000C0
    sll     t6, t4, 13
    bgezl   t6, lbl_800BD830
    lw      t7, 0x0050(a1)             # 00000050
    sw      v1, 0x001C($sp)
    sw      a0, 0x0038($sp)
    jal     func_800BD160
    sw      a1, 0x003C($sp)
    lw      v1, 0x001C($sp)
    lw      a0, 0x0038($sp)
    lw      a1, 0x003C($sp)
    lw      t7, 0x0050(a1)             # 00000050
lbl_800BD830:
    addiu   v0, a0, 0x0030             # v0 = 00000030
    lbu     t8, 0x0007(t7)             # 00000007
    sb      t8, 0x0003(v0)             # 00000033
    lw      t9, 0x0050(a1)             # 00000050
    lw      t0, 0x0000(t9)             # 00000000
    sll     t1, t0,  5
    srl     t2, t1, 31
    sb      t2, 0x0005(v0)             # 00000035
    lw      t3, 0x0050(a1)             # 00000050
    lbu     t9, 0x0001(v1)             # 00000001
    lbu     t4, 0x0008(t3)             # 00000008
    andi    t0, t9, 0xFF1F             # t0 = 00000000
    andi    t6, t4, 0x0003             # t6 = 00000000
    sll     t8, t6,  5
    or      t1, t8, t0                 # t1 = 00000000
    sb      t1, 0x0001(v1)             # 00000001
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0038           # $sp += 0x38
    jr      $ra
    nop


func_800BD880:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0018($sp)
    sw      a1, 0x001C($sp)
    jal     func_800BD140
    lw      a0, 0x0044(a0)             # 00000044
    lw      t7, 0x001C($sp)
    lw      t8, 0x0018($sp)
    sw      t7, 0x0048(t8)             # 00000048
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BD8B4:
# MqDbg: 
    sw      a1, 0x0048(a0)             # 00000048
    lw      t6, 0x0050(a1)             # 00000050
    lbu     t9, 0x0070(a0)             # 00000070
    lui     $at, 0x8012                # $at = 80120000
    lbu     t7, 0x0005(t6)             # 00000005
    ori     t0, t9, 0x0010             # t0 = 00000010
    sb      t7, 0x0030(a0)             # 00000030
    lwc1    $f4, 0x7E94($at)           # 80127E94
    sb      t0, 0x0070(a0)             # 00000070
    jr      $ra
    swc1    $f4, 0x007C(a0)            # 0000007C


func_800BD8E0:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0020($sp)
    jal     func_800BF228
    sw      a1, 0x0024($sp)
    beq     v0, $zero, lbl_800BD918
    sw      v0, 0x001C($sp)
    or      a0, v0, $zero              # a0 = 00000000
    jal     func_800BD748
    lw      a1, 0x0024($sp)
    lw      a0, 0x0020($sp)
    lw      a1, 0x001C($sp)
    jal     func_800BD65C
    addiu   a0, a0, 0x0030             # a0 = 00000030
lbl_800BD918:
    lw      $ra, 0x0014($sp)
    lw      v0, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800BD92C:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0020($sp)
    sw      a1, 0x0024($sp)
    jal     func_800BF228
    addiu   a0, a0, 0x0010             # a0 = 00000010
    beq     v0, $zero, lbl_800BD968
    sw      v0, 0x001C($sp)
    or      a0, v0, $zero              # a0 = 00000000
    jal     func_800BD8B4
    lw      a1, 0x0024($sp)
    lw      a0, 0x0020($sp)
    lw      a1, 0x001C($sp)
    jal     func_800BF1E8
    addiu   a0, a0, 0x0020             # a0 = 00000020
lbl_800BD968:
    lw      $ra, 0x0014($sp)
    lw      v0, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800BD97C:
# MqDbg: 
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    addiu   t6, $zero, 0x0010          # t6 = 00000010
    addiu   t7, $zero, 0x0010          # t7 = 00000010
    sw      $ra, 0x001C($sp)
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    sw      t7, 0x002C($sp)
    sw      t6, 0x0028($sp)
    lw      t8, 0x0050(a1)             # 00000050
    or      s0, a0, $zero              # s0 = 00000000
    or      s1, a1, $zero              # s1 = 00000000
    addiu   a0, a0, 0x0020             # a0 = 00000020
    lbu     a1, 0x0005(t8)             # 00000005
    jal     func_800BD6C8
    sw      a0, 0x0024($sp)
    beq     v0, $zero, lbl_800BD9C8
    or      v1, v0, $zero              # v1 = 00000000
    lbu     t9, 0x0030(v0)             # 00000030
    sw      t9, 0x002C($sp)
lbl_800BD9C8:
    lw      t0, 0x0050(s1)             # 00000050
    addiu   a0, s0, 0x0030             # a0 = 00000030
    lbu     a1, 0x0005(t0)             # 00000005
    jal     func_800BD6C8
    sw      v1, 0x0034($sp)
    lw      v1, 0x0034($sp)
    beq     v0, $zero, lbl_800BD9F0
    or      s0, v0, $zero              # s0 = 00000000
    lbu     t1, 0x0030(v0)             # 00000030
    sw      t1, 0x0028($sp)
lbl_800BD9F0:
    bne     v1, $zero, lbl_800BDA08
    lw      t2, 0x0028($sp)
    bnel    v0, $zero, lbl_800BDA0C
    lw      t3, 0x002C($sp)
    b       lbl_800BDA60
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BDA08:
    lw      t3, 0x002C($sp)
lbl_800BDA0C:
    slt     $at, t2, t3
    beql    $at, $zero, lbl_800BDA50
    sw      s1, 0x0048(v1)             # 00000048
    jal     func_800BD69C
    or      a0, s0, $zero              # a0 = 00000000
    or      a0, s0, $zero              # a0 = 00000000
    jal     func_800BD880
    or      a1, s1, $zero              # a1 = 00000000
    lw      a0, 0x0024($sp)
    jal     func_800BF1E8
    or      a1, s0, $zero              # a1 = 00000000
    lw      t4, 0x0050(s1)             # 00000050
    or      v0, s0, $zero              # v0 = 00000000
    lbu     t5, 0x0005(t4)             # 00000005
    b       lbl_800BDA60
    sb      t5, 0x0030(s0)             # 00000030
    sw      s1, 0x0048(v1)             # 00000048
lbl_800BDA50:
    lw      t6, 0x0050(s1)             # 00000050
    or      v0, v1, $zero              # v0 = 00000000
    lbu     t7, 0x0005(t6)             # 00000005
    sb      t7, 0x0030(v1)             # 00000030
lbl_800BDA60:
    lw      $ra, 0x001C($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038           # $sp += 0x38


func_800BDA74:
# MqDbg: 
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x001C($sp)
    sw      s0, 0x0018($sp)
    lw      v1, 0x0050(a0)             # 00000050
    or      s0, a0, $zero              # s0 = 00000000
    lbu     v0, 0x0002(v1)             # 00000002
    andi    t6, v0, 0x0001             # t6 = 00000000
    beq     t6, $zero, lbl_800BDAEC
    andi    t9, v0, 0x0002             # t9 = 00000000
    lw      a2, 0x002C(a0)             # 0000002C
    beq     a2, $zero, lbl_800BDAEC
    nop
    lw      t7, 0x0040(a2)             # 00000040
    bne     a0, t7, lbl_800BDAEC
    nop
    lw      t8, 0x0048(a2)             # 00000048
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    or      a0, a2, $zero              # a0 = 00000000
    bne     t8, $at, lbl_800BDAEC
    or      a1, s0, $zero              # a1 = 00000000
    jal     func_800BD8B4
    sw      a2, 0x0024($sp)
    jal     func_800BD69C
    lw      a0, 0x0024($sp)
    lw      a1, 0x0024($sp)
    lw      a0, 0x000C(a1)             # 0000000C
    jal     func_800BF1E8
    addiu   a0, a0, 0x0020             # a0 = 00000020
    b       lbl_800BDD34
    lw      v0, 0x0024($sp)
lbl_800BDAEC:
    beq     t9, $zero, lbl_800BDB40
    andi    t0, v0, 0x0004             # t0 = 00000000
    addiu   a0, v1, 0x0084             # a0 = 00000084
    jal     func_800BD8E0
    or      a1, s0, $zero              # a1 = 00000000
    bne     v0, $zero, lbl_800BDB38
    or      a2, v0, $zero              # a2 = 00000000
    lw      a0, 0x0050(s0)             # 00000050
    or      a1, s0, $zero              # a1 = 00000000
    jal     func_800BD92C
    addiu   a0, a0, 0x0084             # a0 = 00000084
    bne     v0, $zero, lbl_800BDB38
    or      a2, v0, $zero              # a2 = 00000000
    lw      a0, 0x0050(s0)             # 00000050
    or      a1, s0, $zero              # a1 = 00000000
    jal     func_800BD97C
    addiu   a0, a0, 0x0084             # a0 = 00000084
    beq     v0, $zero, lbl_800BDD24
    or      a2, v0, $zero              # a2 = 00000000
lbl_800BDB38:
    b       lbl_800BDD34
    or      v0, a2, $zero              # v0 = 00000000
lbl_800BDB40:
    beq     t0, $zero, lbl_800BDBE8
    andi    t4, v0, 0x0008             # t4 = 00000000
    addiu   a0, v1, 0x0084             # a0 = 00000084
    jal     func_800BD8E0
    or      a1, s0, $zero              # a1 = 00000000
    bne     v0, $zero, lbl_800BDBE0
    or      a2, v0, $zero              # a2 = 00000000
    lw      t1, 0x0050(s0)             # 00000050
    or      a1, s0, $zero              # a1 = 00000000
    lw      a0, 0x004C(t1)             # 0000004C
    jal     func_800BD8E0
    addiu   a0, a0, 0x009C             # a0 = 0000009C
    bne     v0, $zero, lbl_800BDBE0
    or      a2, v0, $zero              # a2 = 00000000
    lw      a0, 0x0050(s0)             # 00000050
    or      a1, s0, $zero              # a1 = 00000000
    jal     func_800BD92C
    addiu   a0, a0, 0x0084             # a0 = 00000084
    bne     v0, $zero, lbl_800BDBE0
    or      a2, v0, $zero              # a2 = 00000000
    lw      t2, 0x0050(s0)             # 00000050
    or      a1, s0, $zero              # a1 = 00000000
    lw      a0, 0x004C(t2)             # 0000004C
    jal     func_800BD92C
    addiu   a0, a0, 0x009C             # a0 = 0000009C
    bne     v0, $zero, lbl_800BDBE0
    or      a2, v0, $zero              # a2 = 00000000
    lw      a0, 0x0050(s0)             # 00000050
    or      a1, s0, $zero              # a1 = 00000000
    jal     func_800BD97C
    addiu   a0, a0, 0x0084             # a0 = 00000084
    bne     v0, $zero, lbl_800BDBE0
    or      a2, v0, $zero              # a2 = 00000000
    lw      t3, 0x0050(s0)             # 00000050
    or      a1, s0, $zero              # a1 = 00000000
    lw      a0, 0x004C(t3)             # 0000004C
    jal     func_800BD97C
    addiu   a0, a0, 0x009C             # a0 = 0000009C
    beq     v0, $zero, lbl_800BDD24
    or      a2, v0, $zero              # a2 = 00000000
lbl_800BDBE0:
    b       lbl_800BDD34
    or      v0, a2, $zero              # v0 = 00000000
lbl_800BDBE8:
    beq     t4, $zero, lbl_800BDC40
    addiu   a0, v1, 0x0084             # a0 = 00000084
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0xB1C8             # a0 = 8012B1C8
    jal     func_800BD8E0
    or      a1, s0, $zero              # a1 = 00000000
    bne     v0, $zero, lbl_800BDC38
    or      a2, v0, $zero              # a2 = 00000000
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0xB1C8             # a0 = 8012B1C8
    jal     func_800BD92C
    or      a1, s0, $zero              # a1 = 00000000
    bne     v0, $zero, lbl_800BDC38
    or      a2, v0, $zero              # a2 = 00000000
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0xB1C8             # a0 = 8012B1C8
    jal     func_800BD97C
    or      a1, s0, $zero              # a1 = 00000000
    beq     v0, $zero, lbl_800BDD24
    or      a2, v0, $zero              # a2 = 00000000
lbl_800BDC38:
    b       lbl_800BDD34
    or      v0, a2, $zero              # v0 = 00000000
lbl_800BDC40:
    jal     func_800BD8E0
    or      a1, s0, $zero              # a1 = 00000000
    bne     v0, $zero, lbl_800BDD1C
    or      a2, v0, $zero              # a2 = 00000000
    lw      t5, 0x0050(s0)             # 00000050
    or      a1, s0, $zero              # a1 = 00000000
    lw      a0, 0x004C(t5)             # 0000004C
    jal     func_800BD8E0
    addiu   a0, a0, 0x009C             # a0 = 0000009C
    bne     v0, $zero, lbl_800BDD1C
    or      a2, v0, $zero              # a2 = 00000000
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0xB1C8             # a0 = 8012B1C8
    jal     func_800BD8E0
    or      a1, s0, $zero              # a1 = 00000000
    bne     v0, $zero, lbl_800BDD1C
    or      a2, v0, $zero              # a2 = 00000000
    lw      a0, 0x0050(s0)             # 00000050
    or      a1, s0, $zero              # a1 = 00000000
    jal     func_800BD92C
    addiu   a0, a0, 0x0084             # a0 = 00000084
    bne     v0, $zero, lbl_800BDD1C
    or      a2, v0, $zero              # a2 = 00000000
    lw      t6, 0x0050(s0)             # 00000050
    or      a1, s0, $zero              # a1 = 00000000
    lw      a0, 0x004C(t6)             # 0000004C
    jal     func_800BD92C
    addiu   a0, a0, 0x009C             # a0 = 0000009C
    bne     v0, $zero, lbl_800BDD1C
    or      a2, v0, $zero              # a2 = 00000000
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0xB1C8             # a0 = 8012B1C8
    jal     func_800BD92C
    or      a1, s0, $zero              # a1 = 00000000
    bne     v0, $zero, lbl_800BDD1C
    or      a2, v0, $zero              # a2 = 00000000
    lw      a0, 0x0050(s0)             # 00000050
    or      a1, s0, $zero              # a1 = 00000000
    jal     func_800BD97C
    addiu   a0, a0, 0x0084             # a0 = 00000084
    bne     v0, $zero, lbl_800BDD1C
    or      a2, v0, $zero              # a2 = 00000000
    lw      t7, 0x0050(s0)             # 00000050
    or      a1, s0, $zero              # a1 = 00000000
    lw      a0, 0x004C(t7)             # 0000004C
    jal     func_800BD97C
    addiu   a0, a0, 0x009C             # a0 = 0000009C
    bne     v0, $zero, lbl_800BDD1C
    or      a2, v0, $zero              # a2 = 00000000
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0xB1C8             # a0 = 8012B1C8
    jal     func_800BD97C
    or      a1, s0, $zero              # a1 = 00000000
    beq     v0, $zero, lbl_800BDD24
    or      a2, v0, $zero              # a2 = 00000000
lbl_800BDD1C:
    b       lbl_800BDD34
    or      v0, a2, $zero              # v0 = 00000000
lbl_800BDD24:
    lbu     t9, 0x0000(s0)             # 00000000
    or      v0, $zero, $zero           # v0 = 00000000
    ori     t0, t9, 0x0008             # t0 = 00000008
    sb      t0, 0x0000(s0)             # 00000000
lbl_800BDD34:
    lw      $ra, 0x001C($sp)
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800BDD48:
# MqDbg: 
    addiu   $sp, $sp, 0xFFC0           # $sp -= 0x40
    sw      s4, 0x0030($sp)
    lui     s4, 0x8012                 # s4 = 80120000
    addiu   s4, s4, 0x5630             # s4 = 80125630
    lw      t6, 0x2894(s4)             # 80127EC4
    sw      s1, 0x0024($sp)
    sw      $ra, 0x003C($sp)
    sw      s6, 0x0038($sp)
    sw      s5, 0x0034($sp)
    sw      s3, 0x002C($sp)
    sw      s2, 0x0028($sp)
    sw      s0, 0x0020($sp)
    sdc1    $f20, 0x0018($sp)
    blez    t6, lbl_800BDE48
    or      s1, $zero, $zero           # s1 = 00000000
    lui     s6, 0x8012                 # s6 = 80120000
    lui     s5, 0x8010                 # s5 = 80100000
    mtc1    $zero, $f20                # $f20 = 0.00
    addiu   s5, s5, 0x0DF4             # s5 = 80100DF4
    addiu   s6, s6, 0x7FF0             # s6 = 80127FF0
    or      s2, $zero, $zero           # s2 = 00000000
    addiu   s3, $zero, 0xFFFF          # s3 = FFFFFFFF
    lw      t7, 0x352C(s4)             # 80128B5C
lbl_800BDDA4:
    lw      t9, 0x0000(s5)             # 80100DF4
    or      a0, s6, $zero              # a0 = 80127FF0
    addu    s0, s2, t7
    sw      t9, 0x00C0(s0)             # 000000C0
    lw      t8, 0x0004(s5)             # 80100DF8
    addiu   a1, $zero, 0x01E0          # a1 = 000001E0
    sw      t8, 0x00C4(s0)             # 000000C4
    lw      t9, 0x0008(s5)             # 80100DFC
    sw      t9, 0x00C8(s0)             # 000000C8
    lw      t8, 0x000C(s5)             # 80100E00
    sw      t8, 0x00CC(s0)             # 000000CC
    lw      t9, 0x0010(s5)             # 80100E04
    sw      t9, 0x00D0(s0)             # 000000D0
    lw      t8, 0x0014(s5)             # 80100E08
    sw      t8, 0x00D4(s0)             # 000000D4
    lw      t9, 0x0018(s5)             # 80100E0C
    sw      t9, 0x00D8(s0)             # 000000D8
    lw      t8, 0x001C(s5)             # 80100E10
    sb      $zero, 0x0030(s0)          # 00000030
    sb      $zero, 0x0034(s0)          # 00000034
    sw      s3, 0x0044(s0)             # 00000044
    sw      s3, 0x0048(s0)             # 00000048
    sw      s3, 0x0040(s0)             # 00000040
    sb      $zero, 0x0031(s0)          # 00000031
    swc1    $f20, 0x0058(s0)           # 00000058
    sh      $zero, 0x0036(s0)          # 00000036
    sb      $zero, 0x0070(s0)          # 00000070
    sb      $zero, 0x00B0(s0)          # 000000B0
    sh      $zero, 0x0092(s0)          # 00000092
    sh      $zero, 0x0094(s0)          # 00000094
    sb      $zero, 0x0035(s0)          # 00000035
    sw      $zero, 0x00BC(s0)          # 000000BC
    jal     func_800B38C8
    sw      t8, 0x00DC(s0)             # 000000DC
    sw      v0, 0x001C(s0)             # 0000001C
    lw      t0, 0x2894(s4)             # 80127EC4
    addiu   s1, s1, 0x0001             # s1 = 00000001
    addiu   s2, s2, 0x00E0             # s2 = 000000E0
    slt     $at, s1, t0
    bnel    $at, $zero, lbl_800BDDA4
    lw      t7, 0x352C(s4)             # 80128B5C
lbl_800BDE48:
    lw      $ra, 0x003C($sp)
    ldc1    $f20, 0x0018($sp)
    lw      s0, 0x0020($sp)
    lw      s1, 0x0024($sp)
    lw      s2, 0x0028($sp)
    lw      s3, 0x002C($sp)
    lw      s4, 0x0030($sp)
    lw      s5, 0x0034($sp)
    lw      s6, 0x0038($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0040           # $sp += 0x40
    nop
    nop
    nop


func_800BDE80:
# MqDbg: 
    lw      v0, 0x0000(a0)             # 00000000
    or      a3, a0, $zero              # a3 = 00000000
    addiu   t1, $zero, 0x0010          # t1 = 00000010
    sll     t7, v0,  9
    bltz    t7, lbl_800BDEA0
    addiu   t0, $zero, 0x0080          # t0 = 00000080
    beql    a1, $zero, lbl_800BDEF4
    sll     t6, v0, 10
lbl_800BDEA0:
    lwc1    $f4, 0x002C(a0)            # 0000002C
    lwc1    $f6, 0x0028(a0)            # 00000028
    lw      v0, 0x004C(a0)             # 0000004C
    mul.s   $f8, $f4, $f6
    lwc1    $f10, 0x0030(v0)           # 00000030
    lw      t8, 0x0000(v0)             # 00000000
    sll     t2, t8,  2
    mul.s   $f0, $f8, $f10
    bgez    t2, lbl_800BDEE4
    nop
    lbu     t3, 0x0003(a0)             # 00000003
    andi    t4, t3, 0x0020             # t4 = 00000000
    beq     t4, $zero, lbl_800BDEE4
    nop
    lwc1    $f16, 0x0028(v0)           # 00000028
    mul.s   $f0, $f16, $f0
    nop
lbl_800BDEE4:
    mul.s   $f18, $f0, $f0
    lw      v0, 0x0000(a0)             # 00000000
    swc1    $f18, 0x0034(a0)           # 00000034
    sll     t6, v0, 10
lbl_800BDEF4:
    bgez    t6, lbl_800BDF14
    nop
    lbu     t7, 0x000A(a0)             # 0000000A
    lbu     t8, 0x000B(a0)             # 0000000B
    multu   t7, t8
    mflo    t9
    sw      t9, 0x0030(a0)             # 00000030
    nop
lbl_800BDF14:
    beq     a2, $zero, lbl_800BDF38
    lwc1    $f0, 0x0038(a0)            # 00000038
    lw      t2, 0x004C(a0)             # 0000004C
    lbu     t4, 0x0001(a0)             # 00000001
    lwc1    $f4, 0x0034(t2)            # 00000034
    ori     t5, t4, 0x0080             # t5 = 00000080
    sb      t5, 0x0001(a0)             # 00000001
    mul.s   $f0, $f0, $f4
    nop
lbl_800BDF38:
    or      a2, $zero, $zero           # a2 = 00000000
lbl_800BDF3C:
    lw      v1, 0x0050(a3)             # 00000050
    addiu   a2, a2, 0x0004             # a2 = 00000004
    beq     v1, $zero, lbl_800BE038
    nop
    lw      t6, 0x0000(v1)             # 00000000
    srl     t7, t6, 31
    beq     t7, $zero, lbl_800BE038
    nop
    lw      t8, 0x002C(v1)             # 0000002C
    beq     t8, $zero, lbl_800BE038
    nop
    lbu     v0, 0x0000(v1)             # 00000000
    andi    t9, v0, 0x0001             # t9 = 00000000
    beql    t9, $zero, lbl_800BDFC8
    lb      t2, 0x0001(a0)             # 00000001
    lwc1    $f6, 0x0030(v1)            # 00000030
    lwc1    $f10, 0x0038(v1)           # 00000038
    lbu     t2, 0x0006(v1)             # 00000006
    mul.s   $f8, $f6, $f0
    andi    t9, v0, 0xFFFE             # t9 = 00000000
    swc1    $f8, 0x0044(v1)            # 00000044
    lwc1    $f16, 0x0034(a0)           # 00000034
    mul.s   $f18, $f10, $f16
    swc1    $f18, 0x0040(v1)           # 00000040
    lbu     t3, 0x000B(a0)             # 0000000B
    lw      t6, 0x0030(a0)             # 00000030
    sb      t9, 0x0000(v1)             # 00000000
    subu    t4, t0, t3
    multu   t2, t4
    mflo    t5
    addu    t7, t6, t5
    sra     t8, t7,  7
    b       lbl_800BE038
    sb      t8, 0x0007(v1)             # 00000007
    lb      t2, 0x0001(a0)             # 00000001
lbl_800BDFC8:
    bgezl   t2, lbl_800BDFE0
    lw      v0, 0x0000(a0)             # 00000000
    lwc1    $f4, 0x0030(v1)            # 00000030
    mul.s   $f6, $f4, $f0
    swc1    $f6, 0x0044(v1)            # 00000044
    lw      v0, 0x0000(a0)             # 00000000
lbl_800BDFE0:
    sll     t6, v0,  9
    bltzl   t6, lbl_800BDFF8
    lwc1    $f8, 0x0038(v1)            # 00000038
    beql    a1, $zero, lbl_800BE00C
    sll     t7, v0, 10
    lwc1    $f8, 0x0038(v1)            # 00000038
lbl_800BDFF8:
    lwc1    $f10, 0x0034(a0)           # 00000034
    mul.s   $f16, $f8, $f10
    swc1    $f16, 0x0040(v1)           # 00000040
    lw      v0, 0x0000(a0)             # 00000000
    sll     t7, v0, 10
lbl_800BE00C:
    bgez    t7, lbl_800BE038
    nop
    lbu     t9, 0x000B(a0)             # 0000000B
    lbu     t8, 0x0006(v1)             # 00000006
    lw      t4, 0x0030(a0)             # 00000030
    subu    t3, t0, t9
    multu   t8, t3
    mflo    t2
    addu    t6, t4, t2
    sra     t5, t6,  7
    sb      t5, 0x0007(v1)             # 00000007
lbl_800BE038:
    bne     a2, t1, lbl_800BDF3C
    addiu   a3, a3, 0x0004             # a3 = 00000004
    jr      $ra
    sb      $zero, 0x0001(a0)          # 00000001


func_800BE048:
# MqDbg: 
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      $ra, 0x002C($sp)
    sw      s4, 0x0028($sp)
    sw      s3, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    lhu     t6, 0x0012(a0)             # 00000012
    or      s2, a0, $zero              # s2 = 00000000
    or      s1, s2, $zero              # s1 = 00000000
    beq     t6, $zero, lbl_800BE108
    or      s0, $zero, $zero           # s0 = 00000000
    lwc1    $f4, 0x001C(a0)            # 0000001C
    lwc1    $f6, 0x0020(a0)            # 00000020
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f2                   # $f2 = 1.00
    add.s   $f8, $f4, $f6
    lbu     t8, 0x0000(a0)             # 00000000
    swc1    $f8, 0x001C(a0)            # 0000001C
    lwc1    $f0, 0x001C(a0)            # 0000001C
    ori     t9, t8, 0x0004             # t9 = 00000004
    sb      t9, 0x0000(a0)             # 00000000
    c.lt.s  $f2, $f0
    nop
    bc1fl   lbl_800BE0BC
    mtc1    $zero, $f2                 # $f2 = 0.00
    swc1    $f2, 0x001C(a0)            # 0000001C
    lwc1    $f0, 0x001C(a0)            # 0000001C
    mtc1    $zero, $f2                 # $f2 = 0.00
lbl_800BE0BC:
    nop
    c.lt.s  $f0, $f2
    nop
    bc1fl   lbl_800BE0D8
    lhu     t0, 0x0012(s2)             # 00000012
    swc1    $f2, 0x001C(s2)            # 0000001C
    lhu     t0, 0x0012(s2)             # 00000012
lbl_800BE0D8:
    addiu   t1, t0, 0xFFFF             # t1 = FFFFFFFF
    andi    t2, t1, 0xFFFF             # t2 = 0000FFFF
    bne     t2, $zero, lbl_800BE108
    sh      t1, 0x0012(s2)             # 00000012
    lbu     t3, 0x0001(s2)             # 00000001
    addiu   $at, $zero, 0x0002         # $at = 00000002
    bnel    t3, $at, lbl_800BE10C
    lw      t4, 0x0000(s2)             # 00000000
    jal     func_800BF12C
    or      a0, s2, $zero              # a0 = 00000000
    b       lbl_800BE178
    lw      $ra, 0x002C($sp)
lbl_800BE108:
    lw      t4, 0x0000(s2)             # 00000000
lbl_800BE10C:
    addiu   s4, $zero, 0x0040          # s4 = 00000040
    addiu   s3, $zero, 0x0001          # s3 = 00000001
    sll     t6, t4,  5
    bgez    t6, lbl_800BE130
    nop
    lwc1    $f10, 0x001C(s2)           # 0000001C
    lwc1    $f16, 0x002C(s2)           # 0000002C
    mul.s   $f18, $f10, $f16
    swc1    $f18, 0x0030(s2)           # 00000030
lbl_800BE130:
    lw      a0, 0x0038(s1)             # 00000038
    lw      t7, 0x0000(a0)             # 00000000
    srl     t8, t7, 31
    bnel    s3, t8, lbl_800BE160
    addiu   s0, s0, 0x0004             # s0 = 00000004
    lw      a1, 0x0000(s2)             # 00000000
    lbu     a2, 0x0000(s2)             # 00000000
    sll     a1, a1,  5
    srl     a1, a1, 31
    jal     func_800BDE80
    andi    a2, a2, 0x0001             # a2 = 00000000
    addiu   s0, s0, 0x0004             # s0 = 00000008
lbl_800BE160:
    bne     s0, s4, lbl_800BE130
    addiu   s1, s1, 0x0004             # s1 = 00000004
    lbu     t9, 0x0000(s2)             # 00000000
    andi    t0, t9, 0xFFFB             # t0 = 00000000
    sb      t0, 0x0000(s2)             # 00000000
    lw      $ra, 0x002C($sp)
lbl_800BE178:
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    lw      s3, 0x0024($sp)
    lw      s4, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030           # $sp += 0x30


func_800BE194:
# MqDbg: 
    lhu     t6, 0x0002(a0)             # 00000002
    lhu     t7, 0x0004(a0)             # 00000004
    addu    v0, t6, t7
    sh      v0, 0x0002(a0)             # 00000002
    sra     v0, v0,  8
    andi    v0, v0, 0x00FF             # v0 = 00000000
    sltiu   $at, v0, 0x007F
    bnel    $at, $zero, lbl_800BE1C4
    lui     $at, 0x3F80                # $at = 3F800000
    addiu   v0, $zero, 0x007F          # v0 = 0000007F
    sb      $zero, 0x0000(a0)          # 00000000
    lui     $at, 0x3F80                # $at = 3F800000
lbl_800BE1C4:
    mtc1    $at, $f12                  # $f12 = 1.00
    lui     $at, 0x8010                # $at = 80100000
    sll     t9, v0,  2
    addu    $at, $at, t9
    lwc1    $f4, 0x05C4($at)           # 801005C4
    lwc1    $f8, 0x0008(a0)            # 00000008
    sub.s   $f6, $f4, $f12
    mul.s   $f10, $f6, $f8
    add.s   $f2, $f10, $f12
    jr      $ra
    mov.s   $f0, $f2


func_800BE1F0:
# MqDbg: 
    lwc1    $f4, 0x0010(a0)            # 00000010
    lw      t6, 0x0004(a0)             # 00000004
    lw      t0, 0x0008(a0)             # 00000008
    trunc.w.s $f6, $f4
    mfc1    t8, $f6
    nop
    addu    t9, t6, t8
    srl     v1, t9, 10
    andi    v1, v1, 0x003F             # v1 = 00000000
    sll     t1, v1,  1
    sw      t9, 0x0004(a0)             # 00000004
    addu    t2, t0, t1
    jr      $ra
    lh      v0, 0x0000(t2)             # 00000000


func_800BE228:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lhu     v0, 0x001A(a0)             # 0000001A
    lw      v1, 0x0000(a0)             # 00000000
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    beq     v0, $zero, lbl_800BE254
    addiu   t6, v0, 0xFFFF             # t6 = FFFFFFFF
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f0                   # $f0 = 1.00
    b       lbl_800BE454
    sh      t6, 0x001A(a0)             # 0000001A
lbl_800BE254:
    beql    v1, $at, lbl_800BE3B0
    mtc1    $zero, $f4                 # $f4 = 0.00
    lhu     v0, 0x0018(a0)             # 00000018
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beql    v0, $zero, lbl_800BE2CC
    lwc1    $f4, 0x000C(a0)            # 0000000C
    bne     v0, $at, lbl_800BE290
    or      a1, v0, $zero              # a1 = 00000000
    lhu     t7, 0x0016(v1)             # 00000016
    lhu     v0, 0x0018(a0)             # 00000018
    mtc1    t7, $f4                    # $f4 = 0.00
    nop
    cvt.s.w $f6, $f4
    b       lbl_800BE2BC
    swc1    $f6, 0x000C(a0)            # 0000000C
lbl_800BE290:
    lhu     t8, 0x0016(v1)             # 00000016
    mtc1    a1, $f6                    # $f6 = 0.00
    lwc1    $f0, 0x000C(a0)            # 0000000C
    mtc1    t8, $f8                    # $f8 = 0.00
    nop
    cvt.s.w $f10, $f8
    cvt.s.w $f8, $f6
    sub.s   $f4, $f10, $f0
    div.s   $f10, $f4, $f8
    add.s   $f6, $f0, $f10
    swc1    $f6, 0x000C(a0)            # 0000000C
lbl_800BE2BC:
    addiu   t9, v0, 0xFFFF             # t9 = FFFFFFFF
    b       lbl_800BE304
    sh      t9, 0x0018(a0)             # 00000018
    lwc1    $f4, 0x000C(a0)            # 0000000C
lbl_800BE2CC:
    lhu     t2, 0x0016(v1)             # 00000016
    trunc.w.s $f8, $f4
    mfc1    t1, $f8
    nop
    beql    t1, t2, lbl_800BE308
    lhu     v0, 0x0016(a0)             # 00000016
    lhu     v0, 0x001A(v1)             # 0000001A
    bne     v0, $zero, lbl_800BE304
    sh      v0, 0x0018(a0)             # 00000018
    lhu     t3, 0x0016(v1)             # 00000016
    mtc1    t3, $f10                   # $f10 = 0.00
    nop
    cvt.s.w $f6, $f10
    swc1    $f6, 0x000C(a0)            # 0000000C
lbl_800BE304:
    lhu     v0, 0x0016(a0)             # 00000016
lbl_800BE308:
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beql    v0, $zero, lbl_800BE374
    lwc1    $f4, 0x0010(a0)            # 00000010
    bne     v0, $at, lbl_800BE338
    or      a1, v0, $zero              # a1 = 00000000
    lhu     t4, 0x0014(v1)             # 00000014
    lhu     v0, 0x0016(a0)             # 00000016
    mtc1    t4, $f4                    # $f4 = 0.00
    nop
    cvt.s.w $f8, $f4
    b       lbl_800BE364
    swc1    $f8, 0x0010(a0)            # 00000010
lbl_800BE338:
    lhu     t5, 0x0014(v1)             # 00000014
    mtc1    a1, $f8                    # $f8 = 0.00
    lwc1    $f0, 0x0010(a0)            # 00000010
    mtc1    t5, $f10                   # $f10 = 0.00
    nop
    cvt.s.w $f6, $f10
    cvt.s.w $f10, $f8
    sub.s   $f4, $f6, $f0
    div.s   $f6, $f4, $f10
    add.s   $f8, $f0, $f6
    swc1    $f8, 0x0010(a0)            # 00000010
lbl_800BE364:
    addiu   t6, v0, 0xFFFF             # t6 = FFFFFFFF
    b       lbl_800BE3AC
    sh      t6, 0x0016(a0)             # 00000016
    lwc1    $f4, 0x0010(a0)            # 00000010
lbl_800BE374:
    lhu     t9, 0x0014(v1)             # 00000014
    trunc.w.s $f10, $f4
    mfc1    t8, $f10
    nop
    beql    t8, t9, lbl_800BE3B0
    mtc1    $zero, $f4                 # $f4 = 0.00
    lhu     v0, 0x0018(v1)             # 00000018
    bne     v0, $zero, lbl_800BE3AC
    sh      v0, 0x0016(a0)             # 00000016
    lhu     t0, 0x0014(v1)             # 00000014
    mtc1    t0, $f6                    # $f6 = 0.00
    nop
    cvt.s.w $f8, $f6
    swc1    $f8, 0x0010(a0)            # 00000010
lbl_800BE3AC:
    mtc1    $zero, $f4                 # $f4 = 0.00
lbl_800BE3B0:
    lwc1    $f10, 0x000C(a0)           # 0000000C
    lui     $at, 0x3F80                # $at = 3F800000
    c.eq.s  $f4, $f10
    nop
    bc1f    lbl_800BE3D4
    nop
    mtc1    $at, $f0                   # $f0 = 1.00
    b       lbl_800BE458
    lw      $ra, 0x0014($sp)
lbl_800BE3D4:
    jal     func_800BE1F0
    sw      a0, 0x0018($sp)
    lw      a0, 0x0018($sp)
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f18                  # $f18 = 1.00
    lui     $at, 0x3980                # $at = 39800000
    mtc1    $at, $f8                   # $f8 = 0.00
    lwc1    $f6, 0x000C(a0)            # 0000000C
    mtc1    v0, $f4                    # $f4 = 0.00
    lui     $at, 0x4700                # $at = 47000000
    mul.s   $f16, $f6, $f8
    mtc1    $at, $f6                   # $f6 = 32768.00
    lui     $at, 0x4780                # $at = 47800000
    lui     t1, 0x8010                 # t1 = 80100000
    lw      t1, 0x1824(t1)             # 80101824
    cvt.s.w $f10, $f4
    addiu   t2, t1, 0x0001             # t2 = 80100001
    add.s   $f2, $f16, $f18
    add.s   $f8, $f10, $f6
    mtc1    $at, $f6                   # $f6 = 65536.00
    lui     $at, 0x8010                # $at = 80100000
    div.s   $f12, $f18, $f2
    sub.s   $f4, $f2, $f12
    mul.s   $f10, $f4, $f8
    div.s   $f4, $f10, $f6
    lwc1    $f10, 0x1820($at)          # 80101820
    add.s   $f8, $f4, $f12
    div.s   $f0, $f18, $f8
    add.s   $f6, $f10, $f0
    swc1    $f6, 0x1820($at)           # 80101820
    lui     $at, 0x8010                # $at = 80100000
    sw      t2, 0x1824($at)            # 80101824
lbl_800BE454:
    lw      $ra, 0x0014($sp)
lbl_800BE458:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BE464:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lbu     t6, 0x0090(a0)             # 00000090
    or      a1, a0, $zero              # a1 = 00000000
    addiu   a0, a0, 0x0090             # a0 = 00000090
    beql    t6, $zero, lbl_800BE494
    lbu     t7, 0x00B0(a1)             # 000000B0
    jal     func_800BE194
    sw      a1, 0x0018($sp)
    lw      a1, 0x0018($sp)
    swc1    $f0, 0x0038(a1)            # 00000038
    lbu     t7, 0x00B0(a1)             # 000000B0
lbl_800BE494:
    addiu   a0, a1, 0x009C             # a0 = 0000009C
    beql    t7, $zero, lbl_800BE4B4
    lw      $ra, 0x0014($sp)
    jal     func_800BE228
    sw      a1, 0x0018($sp)
    lw      a1, 0x0018($sp)
    swc1    $f0, 0x003C(a1)            # 0000003C
    lw      $ra, 0x0014($sp)
lbl_800BE4B4:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BE4C0:
# MqDbg: 
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f4                   # $f4 = 1.00
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    sb      t6, 0x00B0(a0)             # 000000B0
    sw      $zero, 0x00A0(a0)          # 000000A0
    lui     t7, 0x8010                 # t7 = 80100000
    swc1    $f4, 0x003C(a0)            # 0000003C
    lw      t7, 0x03A8(t7)             # 801003A8
    lw      t8, 0x0044(a0)             # 00000044
    sw      t7, 0x00A4(a0)             # 000000A4
    lw      t9, 0x0050(t8)             # 00000050
    sw      t9, 0x009C(a0)             # 0000009C
    lhu     a1, 0x001A(t9)             # 0000001A
    or      v1, t9, $zero              # v1 = 00000000
    bne     a1, $zero, lbl_800BE51C
    sh      a1, 0x00B4(a0)             # 000000B4
    lhu     t0, 0x0016(t9)             # 00000016
    addiu   v0, a0, 0x009C             # v0 = 0000009C
    mtc1    t0, $f6                    # $f6 = 0.00
    nop
    cvt.s.w $f8, $f6
    b       lbl_800BE534
    swc1    $f8, 0x000C(v0)            # 000000A8
lbl_800BE51C:
    lhu     t1, 0x0012(v1)             # 00000012
    addiu   v0, a0, 0x009C             # v0 = 0000009C
    mtc1    t1, $f10                   # $f10 = 0.00
    nop
    cvt.s.w $f16, $f10
    swc1    $f16, 0x000C(v0)           # 000000A8
lbl_800BE534:
    lhu     a1, 0x0018(v1)             # 00000018
    bne     a1, $zero, lbl_800BE558
    sh      a1, 0x0016(v0)             # 000000B2
    lhu     t2, 0x0014(v1)             # 00000014
    mtc1    t2, $f18                   # $f18 = 0.00
    nop
    cvt.s.w $f4, $f18
    b       lbl_800BE56C
    swc1    $f4, 0x0010(v0)            # 000000AC
lbl_800BE558:
    lhu     t3, 0x0010(v1)             # 00000010
    mtc1    t3, $f6                    # $f6 = 0.00
    nop
    cvt.s.w $f8, $f6
    swc1    $f8, 0x0010(v0)            # 000000AC
lbl_800BE56C:
    lhu     t4, 0x001C(v1)             # 0000001C
    jr      $ra
    sh      t4, 0x001A(v0)             # 000000B6


func_800BE578:
# MqDbg: 
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f4                   # $f4 = 1.00
    lw      t6, 0x0044(a0)             # 00000044
    swc1    $f4, 0x0038(a0)            # 00000038
    lw      t8, 0x0020(t6)             # 00000020
    sw      t8, 0x0090(a0)             # 00000090
    lw      t7, 0x0024(t6)             # 00000024
    sw      t7, 0x0094(a0)             # 00000094
    lw      t8, 0x0028(t6)             # 00000028
    jr      $ra
    sw      t8, 0x0098(a0)             # 00000098


func_800BE5A4:
# MqDbg: 
    sw      a2, 0x0008($sp)
    mtc1    $zero, $f0                 # $f0 = 0.00
    sb      $zero, 0x0000(a0)          # 00000000
    sh      $zero, 0x0002(a0)          # 00000002
    sw      a1, 0x001C(a0)             # 0000001C
    swc1    $f0, 0x0004(a0)            # 00000004
    jr      $ra
    swc1    $f0, 0x0010(a0)            # 00000010


func_800BE5C4:
# MqDbg: 
    lbu     v1, 0x0000(a0)             # 00000000
    or      v0, v1, $zero              # v0 = 00000000
    andi    v0, v0, 0x000F             # v0 = 00000000
    sltiu   $at, v0, 0x0009
    beq     $at, $zero, lbl_800BE860
    or      a1, v0, $zero              # a1 = 00000000
    sll     t6, v0,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t6
    lw      t6, -0x6630($at)           # 801099D0
    jr      t6
    nop
    mtc1    $zero, $f0                 # $f0 = 0.00
    jr      $ra
    nop


func_800BE600:
# MqDbg: 
    lw      t7, 0x0000(a0)             # 00000000
    andi    t0, v1, 0xFFF0             # t0 = 00000000
    ori     t1, t0, 0x0005             # t1 = 00000005
    sll     t9, t7,  1
    bgezl   t9, lbl_800BE624
    andi    t2, v1, 0xFFF0             # t2 = 00000000
    b       lbl_800BE860
    sb      t1, 0x0000(a0)             # 00000000
    andi    t2, v1, 0xFFF0             # t2 = 00000000
lbl_800BE624:
    ori     t3, t2, 0x0003             # t3 = 00000003
    sb      $zero, 0x0001(a0)          # 00000001
    sb      t3, 0x0000(a0)             # 00000000
lbl_800BE630:
    lbu     t5, 0x0001(a0)             # 00000001
    lw      t4, 0x001C(a0)             # 0000001C
    addiu   $at, $zero, 0xFFFD         # $at = FFFFFFFD
    sll     t6, t5,  2
    addu    v0, t4, t6
    lh      t7, 0x0000(v0)             # 00000000
    sh      t7, 0x0002(a0)             # 00000002
    lh      a1, 0x0002(a0)             # 00000002
    beq     a1, $at, lbl_800BE6A0
    addiu   $at, $zero, 0xFFFE         # $at = FFFFFFFE
    beq     a1, $at, lbl_800BE694
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    beql    a1, $at, lbl_800BE684
    lbu     t0, 0x0000(a0)             # 00000000
    bnel    a1, $zero, lbl_800BE6B8
    mtc1    a1, $f4                    # $f4 = 0.00
    lbu     t8, 0x0000(a0)             # 00000000
    andi    t9, t8, 0xFFF0             # t9 = 00000000
    b       lbl_800BE75C
    sb      t9, 0x0000(a0)             # 00000000
    lbu     t0, 0x0000(a0)             # 00000000
lbl_800BE684:
    andi    t1, t0, 0xFFF0             # t1 = 00000000
    ori     t2, t1, 0x0005             # t2 = 00000005
    b       lbl_800BE75C
    sb      t2, 0x0000(a0)             # 00000000
lbl_800BE694:
    lh      t3, 0x0002(v0)             # 00000002
    b       lbl_800BE630
    sb      t3, 0x0001(a0)             # 00000001
lbl_800BE6A0:
    lbu     t5, 0x0000(a0)             # 00000000
    andi    t4, t5, 0xFFF0             # t4 = 00000000
    ori     t6, t4, 0x0001             # t6 = 00000001
    b       lbl_800BE75C
    sb      t6, 0x0000(a0)             # 00000000
    mtc1    a1, $f4                    # $f4 = 0.00
lbl_800BE6B8:
    lui     $at, 0x8012                # $at = 80120000
    lwc1    $f8, 0x7E9C($at)           # 80127E9C
    cvt.s.w $f6, $f4
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    mul.s   $f10, $f6, $f8
    trunc.w.s $f16, $f10
    mfc1    t8, $f16
    nop
    sh      t8, 0x0002(a0)             # 00000002
    lh      a1, 0x0002(a0)             # 00000002
    bnel    a1, $zero, lbl_800BE6F4
    lbu     v0, 0x0001(a0)             # 00000001
    sh      t9, 0x0002(a0)             # 00000002
    lh      a1, 0x0002(a0)             # 00000002
    lbu     v0, 0x0001(a0)             # 00000001
lbl_800BE6F4:
    lw      t0, 0x001C(a0)             # 0000001C
    lui     $at, 0x8011                # $at = 80110000
    sll     t1, v0,  2
    addu    t2, t0, t1
    lh      t3, 0x0002(t2)             # 00000007
    lwc1    $f6, -0x660C($at)          # 801099F4
    lbu     t5, 0x0000(a0)             # 00000000
    mtc1    t3, $f18                   # $f18 = 0.00
    addiu   t7, v0, 0x0001             # t7 = 00000001
    andi    t4, t5, 0xFFF0             # t4 = 00000000
    cvt.s.w $f4, $f18
    lwc1    $f18, 0x0010(a0)           # 00000010
    ori     t6, t4, 0x0004             # t6 = 00000004
    sb      t6, 0x0000(a0)             # 00000000
    sb      t7, 0x0001(a0)             # 00000001
    div.s   $f8, $f4, $f6
    mtc1    a1, $f6                    # $f6 = 0.00
    swc1    $f8, 0x0014(a0)            # 00000014
    lwc1    $f0, 0x0014(a0)            # 00000014
    cvt.s.w $f8, $f6
    mul.s   $f10, $f0, $f0
    swc1    $f10, 0x0014(a0)           # 00000014
    lwc1    $f16, 0x0014(a0)           # 00000014
    sub.s   $f4, $f16, $f18
    div.s   $f10, $f4, $f8
    swc1    $f10, 0x0008(a0)           # 00000008
lbl_800BE75C:
    lbu     t8, 0x0000(a0)             # 00000000
    addiu   $at, $zero, 0x0004         # $at = 00000004
    andi    t9, t8, 0x000F             # t9 = 00000000
    bnel    t9, $at, lbl_800BE864
    lw      v0, 0x0000(a0)             # 00000000
    lh      t0, 0x0002(a0)             # 00000002
    lwc1    $f16, 0x0010(a0)           # 00000010
    lwc1    $f18, 0x0008(a0)           # 00000008
    addiu   t1, t0, 0xFFFF             # t1 = FFFFFFFF
    sh      t1, 0x0002(a0)             # 00000002
    add.s   $f6, $f16, $f18
    lh      t2, 0x0002(a0)             # 00000002
    bgtz    t2, lbl_800BE860
    swc1    $f6, 0x0010(a0)            # 00000010
    lbu     t3, 0x0000(a0)             # 00000000
    andi    t5, t3, 0xFFF0             # t5 = 00000000
    ori     t4, t5, 0x0003             # t4 = 00000003
    b       lbl_800BE860
    sb      t4, 0x0000(a0)             # 00000000
    mtc1    $zero, $f12                # $f12 = 0.00
    lwc1    $f0, 0x0004(a0)            # 00000004
    lwc1    $f4, 0x0010(a0)            # 00000010
    lwc1    $f8, 0x000C(a0)            # 0000000C
    c.eq.s  $f12, $f0
    addiu   $at, $zero, 0x0006         # $at = 00000006
    sub.s   $f10, $f4, $f8
    bc1t    lbl_800BE808
    swc1    $f10, 0x0010(a0)           # 00000010
    bne     a1, $at, lbl_800BE808
    nop
    lwc1    $f16, 0x0010(a0)           # 00000010
    addiu   t6, $zero, 0x0080          # t6 = 00000080
    c.lt.s  $f16, $f0
    nop
    bc1fl   lbl_800BE864
    lw      v0, 0x0000(a0)             # 00000000
    lbu     t7, 0x0000(a0)             # 00000000
    swc1    $f0, 0x0010(a0)            # 00000010
    sh      t6, 0x0002(a0)             # 00000002
    andi    t8, t7, 0xFFF0             # t8 = 00000000
    ori     t9, t8, 0x0008             # t9 = 00000008
    b       lbl_800BE860
    sb      t9, 0x0000(a0)             # 00000000
lbl_800BE808:
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f6, -0x6608($at)          # 801099F8
    lwc1    $f18, 0x0010(a0)           # 00000010
    c.lt.s  $f18, $f6
    nop
    bc1fl   lbl_800BE864
    lw      v0, 0x0000(a0)             # 00000000
    lbu     t0, 0x0000(a0)             # 00000000
    swc1    $f12, 0x0010(a0)           # 00000010
    andi    t1, t0, 0xFFF0             # t1 = 00000000
    b       lbl_800BE860
    sb      t1, 0x0000(a0)             # 00000000
    lh      t2, 0x0002(a0)             # 00000002
    addiu   t3, t2, 0xFFFF             # t3 = 00000004
    sh      t3, 0x0002(a0)             # 00000002
    lh      t5, 0x0002(a0)             # 00000002
    bnel    t5, $zero, lbl_800BE864
    lw      v0, 0x0000(a0)             # 00000000
    lbu     t4, 0x0000(a0)             # 00000000
    andi    t6, t4, 0xFFF0             # t6 = 00000000
    ori     t7, t6, 0x0007             # t7 = 00000007
    sb      t7, 0x0000(a0)             # 00000000
lbl_800BE860:
    lw      v0, 0x0000(a0)             # 00000000
lbl_800BE864:
    mtc1    $zero, $f12                # $f12 = 0.00
    lui     $at, 0x3F80                # $at = 3F800000
    sll     t9, v0,  2
    bgezl   t9, lbl_800BE898
    sll     t6, v0,  3
    lbu     t0, 0x0000(a0)             # 00000000
    andi    t1, t0, 0xFFF0             # t1 = 00000000
    ori     t3, t1, 0x0006             # t3 = 00000006
    sb      t3, 0x0000(a0)             # 00000000
    andi    t5, t3, 0x00DF             # t5 = 00000006
    sb      t5, 0x0000(a0)             # 00000000
    lw      v0, 0x0000(a0)             # 00000000
    sll     t6, v0,  3
lbl_800BE898:
    bgezl   t6, lbl_800BE8BC
    lwc1    $f2, 0x0010(a0)            # 00000010
    lbu     t7, 0x0000(a0)             # 00000000
    andi    t8, t7, 0xFFF0             # t8 = 00000000
    ori     t0, t8, 0x0007             # t0 = 00000007
    sb      t0, 0x0000(a0)             # 00000000
    andi    t1, t0, 0x00EF             # t1 = 00000007
    sb      t1, 0x0000(a0)             # 00000000
    lwc1    $f2, 0x0010(a0)            # 00000010
lbl_800BE8BC:
    c.lt.s  $f2, $f12
    nop
    bc1fl   lbl_800BE8D8
    mtc1    $at, $f12                  # $f12 = 1.00
    jr      $ra
    mov.s   $f0, $f12
lbl_800BE8D4:
    mtc1    $at, $f12                  # $f12 = 1.00
lbl_800BE8D8:
    nop
    c.lt.s  $f12, $f2
    nop
    bc1fl   lbl_800BE8F8
    mov.s   $f0, $f2
    jr      $ra
    mov.s   $f0, $f12
lbl_800BE8F4:
    mov.s   $f0, $f2
lbl_800BE8F8:
    jr      $ra
    nop


func_800BE900:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      a1, 0x001C($sp)
    andi    a1, a1, 0x00FF             # a1 = 00000000
    lui     v0, 0x8010                 # v0 = 80100000
    addu    v0, v0, a1
    lbu     v0, 0x1780(v0)             # 80101780
    addiu   $at, $zero, 0x0001         # $at = 00000001
    sw      $ra, 0x0014($sp)
    andi    t7, v0, 0x0003             # t7 = 00000000
    bne     t7, $at, lbl_800BE954
    or      v1, $zero, $zero           # v1 = 00000000
    andi    t8, v0, 0x0080             # t8 = 00000000
    bne     t8, $zero, lbl_800BE948
    nop
    jal     func_800BF308
    nop
    b       lbl_800BE954
    andi    v1, v0, 0xFFFF             # v1 = 00000000
lbl_800BE948:
    jal     func_800BF31C
    nop
    andi    v1, v0, 0xFFFF             # v1 = 00000000
lbl_800BE954:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    or      v0, v1, $zero              # v0 = 00000000
    jr      $ra
    nop


func_800BE968:
# MqDbg: 
    addiu   t6, a2, 0xFF0E             # t6 = FFFFFF0E
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sltiu   $at, t6, 0x000E
    sw      $ra, 0x0014($sp)
    beq     $at, $zero, lbl_800BEB30
    or      v0, a2, $zero              # v0 = 00000000
    sll     t6, t6,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t6
    lw      t6, -0x6600($at)           # 80109A00
    jr      t6
    nop
    lbu     v0, 0x0018(a1)             # 00000018
    bne     v0, $zero, lbl_800BE9AC
    addiu   v1, v0, 0xFFFF             # v1 = FFFFFFFF
    b       lbl_800BEB34
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
lbl_800BE9AC:
    andi    v1, v1, 0x00FF             # v1 = 000000FF
    sll     t7, v1,  2
    addu    t8, a1, t7
    sb      v1, 0x0018(a1)             # 00000018
    lw      t9, 0x0004(t8)             # 00000004
    b       lbl_800BEB30
    sw      t9, 0x0000(a1)             # 00000000
    jal     func_800BF354
    or      a0, a1, $zero              # a0 = 00000000
    b       lbl_800BEB38
    lw      $ra, 0x0014($sp)
    b       lbl_800BEB34
    addiu   v0, $zero, 0x0001          # v0 = 00000001
    lbu     t1, 0x0018(a1)             # 00000018
    lw      t0, 0x0000(a1)             # 00000000
    andi    t7, a3, 0xFFFF             # t7 = 00000000
    sll     t2, t1,  2
    addu    t3, a1, t2
    sw      t0, 0x0004(t3)             # 00000004
    lbu     t4, 0x0018(a1)             # 00000018
    addiu   t5, t4, 0x0001             # t5 = 00000001
    sb      t5, 0x0018(a1)             # 00000018
    lw      t6, 0x0018(a0)             # 00000018
    addu    t8, t6, t7
    b       lbl_800BEB30
    sw      t8, 0x0000(a1)             # 00000000
    lbu     t9, 0x0018(a1)             # 00000018
    addu    t1, a1, t9
    sb      a3, 0x0014(t1)             # 00000014
    lbu     t0, 0x0018(a1)             # 00000018
    lw      t2, 0x0000(a1)             # 00000000
    sll     t3, t0,  2
    addu    t4, a1, t3
    sw      t2, 0x0004(t4)             # 00000004
    lbu     t5, 0x0018(a1)             # 00000018
    addiu   t6, t5, 0x0001             # t6 = 00000002
    b       lbl_800BEB30
    sb      t6, 0x0018(a1)             # 00000018
    lbu     t7, 0x0018(a1)             # 00000018
    addu    v1, a1, t7
    lbu     t8, 0x0013(v1)             # 00000013
    addiu   t9, t8, 0xFFFF             # t9 = FFFFFFFF
    sb      t9, 0x0013(v1)             # 00000013
    lbu     v0, 0x0018(a1)             # 00000018
    addu    t1, a1, v0
    lbu     t0, 0x0013(t1)             # 00000013
    or      a0, v0, $zero              # a0 = 00000001
    sll     t3, a0,  2
    beq     t0, $zero, lbl_800BEA84
    addiu   t5, v0, 0xFFFF             # t5 = 00000000
    addu    t2, a1, t3
    lw      t4, 0x0000(t2)             # 00000000
    b       lbl_800BEB30
    sw      t4, 0x0000(a1)             # 00000000
lbl_800BEA84:
    b       lbl_800BEB30
    sb      t5, 0x0018(a1)             # 00000018
    lbu     t6, 0x0018(a1)             # 00000018
    addiu   t7, t6, 0xFFFF             # t7 = 00000001
    b       lbl_800BEB30
    sb      t7, 0x0018(a1)             # 00000018
    addiu   $at, $zero, 0x00FA         # $at = 000000FA
    bnel    v0, $at, lbl_800BEAB4
    addiu   $at, $zero, 0x00F9         # $at = 000000F9
    lb      t8, 0x0019(a1)             # 00000019
    bne     t8, $zero, lbl_800BEB30
    addiu   $at, $zero, 0x00F9         # $at = 000000F9
lbl_800BEAB4:
    bnel    v0, $at, lbl_800BEAC8
    addiu   $at, $zero, 0x00F5         # $at = 000000F5
    lb      t9, 0x0019(a1)             # 00000019
    bgez    t9, lbl_800BEB30
    addiu   $at, $zero, 0x00F5         # $at = 000000F5
lbl_800BEAC8:
    bnel    v0, $at, lbl_800BEAE0
    lw      t0, 0x0018(a0)             # 00000019
    lb      t1, 0x0019(a1)             # 00000019
    bltzl   t1, lbl_800BEB34
    or      v0, $zero, $zero           # v0 = 00000000
    lw      t0, 0x0018(a0)             # 00000019
lbl_800BEAE0:
    andi    t3, a3, 0xFFFF             # t3 = 00000000
    addu    t2, t0, t3
    b       lbl_800BEB30
    sw      t2, 0x0000(a1)             # 00000000
    addiu   $at, $zero, 0x00F3         # $at = 000000F3
    bnel    v0, $at, lbl_800BEB08
    addiu   $at, $zero, 0x00F2         # $at = 000000F2
    lb      t4, 0x0019(a1)             # 00000019
    bne     t4, $zero, lbl_800BEB30
    addiu   $at, $zero, 0x00F2         # $at = 000000F2
lbl_800BEB08:
    bnel    v0, $at, lbl_800BEB20
    lw      t6, 0x0000(a1)             # 00000000
    lb      t5, 0x0019(a1)             # 00000019
    bgezl   t5, lbl_800BEB34
    or      v0, $zero, $zero           # v0 = 00000000
    lw      t6, 0x0000(a1)             # 00000000
lbl_800BEB20:
    sll     t8, a3, 24
    sra     t9, t8, 24
    addu    t1, t6, t9
    sw      t1, 0x0000(a1)             # 00000000
lbl_800BEB30:
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BEB34:
    lw      $ra, 0x0014($sp)
lbl_800BEB38:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BEB44:
# MqDbg: 
    lui     t6, 0x8012                 # t6 = 80120000
    addiu   t6, t6, 0x5630             # t6 = 80125630
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    addiu   t7, t6, 0x5AB0             # t7 = 8012B0E0
    sw      $ra, 0x0014($sp)
    beq     a0, t7, lbl_800BEC88
    or      a1, a0, $zero              # a1 = 00000000
    lbu     t8, 0x0000(a0)             # 00000000
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f0                   # $f0 = 1.00
    andi    t0, t8, 0xFF7F             # t0 = 00000000
    andi    t2, t0, 0x00BF             # t2 = 00000000
    sb      t0, 0x0000(a0)             # 00000000
    andi    t4, t2, 0x00DF             # t4 = 00000000
    sb      t2, 0x0000(a0)             # 00000000
    andi    t6, t4, 0x00EF             # t6 = 00000000
    sb      t4, 0x0000(a0)             # 00000000
    andi    t8, t6, 0x00F7             # t8 = 00000000
    sb      t6, 0x0000(a0)             # 00000000
    andi    t0, t8, 0x00FB             # t0 = 00000000
    sb      t8, 0x0000(a0)             # 00000000
    addiu   v0, $zero, 0x0800          # v0 = 00000800
    lui     t7, 0x8010                 # t7 = 80100000
    sb      t0, 0x0000(a0)             # 00000000
    andi    t1, t0, 0x00FD             # t1 = 00000000
    addiu   t2, $zero, 0x00FF          # t2 = 000000FF
    addiu   t3, $zero, 0x0040          # t3 = 00000040
    addiu   t4, $zero, 0x0080          # t4 = 00000080
    addiu   t5, $zero, 0x0003          # t5 = 00000003
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    addiu   t7, t7, 0x0DE4             # t7 = 80100DE4
    addiu   t8, $zero, 0x00F0          # t8 = 000000F0
    sh      v0, 0x0014(a0)             # 00000014
    sh      v0, 0x0010(a0)             # 00000010
    sh      $zero, 0x0026(a0)          # 00000026
    sb      t1, 0x0000(a0)             # 00000000
    sb      $zero, 0x0009(a0)          # 00000009
    sb      $zero, 0x00D0(a0)          # 000000D0
    sb      t2, 0x0001(a0)             # 00000001
    sb      $zero, 0x0078(a0)          # 00000078
    sb      t3, 0x000A(a0)             # 0000000A
    sb      t4, 0x000B(a0)             # 0000000B
    sb      $zero, 0x000D(a0)          # 0000000D
    sb      $zero, 0x000E(a0)          # 0000000E
    sw      $zero, 0x0040(a0)          # 00000040
    sb      $zero, 0x0008(a0)          # 00000008
    sb      $zero, 0x0004(a0)          # 00000004
    sb      $zero, 0x000C(a0)          # 0000000C
    sb      t5, 0x0005(a0)             # 00000005
    sb      t6, 0x0006(a0)             # 00000006
    sh      $zero, 0x001E(a0)          # 0000001E
    sw      t7, 0x0080(a0)             # 00000080
    sb      t8, 0x007C(a0)             # 0000007C
    sb      $zero, 0x007D(a0)          # 0000007D
    sh      $zero, 0x0016(a0)          # 00000016
    sh      $zero, 0x0012(a0)          # 00000012
    sh      $zero, 0x0018(a0)          # 00000018
    sh      $zero, 0x001A(a0)          # 0000001A
    sh      $zero, 0x001C(a0)          # 0000001C
    sw      $zero, 0x00CC(a0)          # 000000CC
    sh      $zero, 0x0020(a0)          # 00000020
    sb      $zero, 0x000F(a0)          # 0000000F
    swc1    $f0, 0x002C(a0)            # 0000002C
    swc1    $f0, 0x0028(a0)            # 00000028
    swc1    $f0, 0x0038(a0)            # 00000038
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
    or      v1, a1, $zero              # v1 = 00000000
    addiu   a2, $zero, 0x0008          # a2 = 00000008
lbl_800BEC58:
    addiu   a0, a0, 0x0004             # a0 = 00000004
    sb      v0, 0x00C5(v1)             # 000000C5
    sb      v0, 0x00C6(v1)             # 000000C6
    sb      v0, 0x00C7(v1)             # 000000C7
    addiu   v1, v1, 0x0004             # v1 = 00000004
    bne     a0, a2, lbl_800BEC58
    sb      v0, 0x00C0(v1)             # 000000C4
    lbu     t9, 0x0000(a1)             # 00000000
    addiu   a0, a1, 0x0084             # a0 = 00000084
    andi    t0, t9, 0xFFFE             # t0 = 00000000
    jal     func_800BD2CC
    sb      t0, 0x0000(a1)             # 00000000
lbl_800BEC88:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BEC98:
# MqDbg: 
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sll     t7, a1,  2
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0028($sp)
    addu    a2, a0, t7
    lw      a3, 0x0050(a2)             # 00000050
    bne     a3, $zero, lbl_800BECE0
    or      a0, a3, $zero              # a0 = 00000000
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0xB1B8             # a0 = 8012B1B8
    jal     func_800BF228
    sw      a2, 0x001C($sp)
    lw      a2, 0x001C($sp)
    bne     v0, $zero, lbl_800BECEC
    sw      v0, 0x0050(a2)             # 00000050
    sw      $zero, 0x0050(a2)          # 00000050
    b       lbl_800BEDAC
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
lbl_800BECE0:
    jal     func_800BD120
    sw      a2, 0x001C($sp)
    lw      a2, 0x001C($sp)
lbl_800BECEC:
    lw      v1, 0x0050(a2)             # 00000050
    lw      t8, 0x0028($sp)
    lui     $at, 0x3F80                # $at = 3F800000
    lbu     t3, 0x0000(v1)             # 00000000
    sw      t8, 0x0050(v1)             # 00000050
    lw      t9, 0x0028($sp)
    ori     t5, t3, 0x0080             # t5 = 00000080
    andi    t7, t5, 0x00BF             # t7 = 00000080
    lw      t1, 0x007C(t9)             # 0000007C
    mtc1    $at, $f0                   # $f0 = 1.00
    mtc1    $zero, $f4                 # $f4 = 0.00
    sw      t1, 0x0018(v1)             # 00000018
    lw      t0, 0x0080(t9)             # 00000080
    andi    t9, t7, 0x00DF             # t9 = 00000080
    sb      t5, 0x0000(v1)             # 00000000
    andi    t1, t9, 0x00EF             # t1 = 00000080
    sb      t7, 0x0000(v1)             # 00000000
    andi    t3, t1, 0x00F7             # t3 = 00000080
    sb      t9, 0x0000(v1)             # 00000000
    andi    t5, t3, 0x00FB             # t5 = 00000080
    sb      t1, 0x0000(v1)             # 00000000
    andi    t7, t5, 0x00FD             # t7 = 00000080
    sb      t3, 0x0000(v1)             # 00000000
    sb      t5, 0x0000(v1)             # 00000000
    sw      t0, 0x001C(v1)             # 0000001C
    andi    t8, t7, 0x00FE             # t8 = 00000080
    addiu   t9, $zero, 0x0080          # t9 = 00000080
    addiu   t0, $zero, 0x0040          # t0 = 00000040
    addiu   t1, $zero, 0x00FF          # t1 = 000000FF
    sb      t7, 0x0000(v1)             # 00000000
    or      v0, $zero, $zero           # v0 = 00000000
    sb      $zero, 0x0018(v1)          # 00000018
    sb      t8, 0x0000(v1)             # 00000000
    sb      $zero, 0x0001(v1)          # 00000001
    sb      $zero, 0x0020(v1)          # 00000020
    sb      $zero, 0x006C(v1)          # 0000006C
    sb      t9, 0x0003(v1)             # 00000003
    sb      t0, 0x0006(v1)             # 00000006
    sh      $zero, 0x0010(v1)          # 00000010
    sh      $zero, 0x0008(v1)          # 00000008
    sh      $zero, 0x000A(v1)          # 0000000A
    sh      $zero, 0x000C(v1)          # 0000000C
    sw      $zero, 0x002C(v1)          # 0000002C
    sw      $zero, 0x0048(v1)          # 00000048
    sb      t1, 0x0002(v1)             # 00000002
    swc1    $f0, 0x0030(v1)            # 00000030
    swc1    $f0, 0x0034(v1)            # 00000034
    swc1    $f4, 0x0038(v1)            # 00000038
lbl_800BEDAC:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800BEDBC:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    beq     a0, $zero, lbl_800BEE28
    sw      $ra, 0x0014($sp)
    lw      v0, 0x0050(a0)             # 00000050
    lui     t6, 0x8013                 # t6 = 80130000
    addiu   t6, t6, 0xB0E0             # t6 = 8012B0E0
    beq     t6, v0, lbl_800BEE08
    nop
    lw      t7, 0x004C(v0)             # 0000004C
    addiu   $at, $zero, 0x0001         # $at = 00000001
    lw      t8, 0x0000(t7)             # 00000000
    sll     t9, t8,  1
    srl     t0, t9, 31
    bne     t0, $at, lbl_800BEE08
    nop
    jal     func_800BD140
    sw      a0, 0x0018($sp)
    b       lbl_800BEE14
    lw      a0, 0x0018($sp)
lbl_800BEE08:
    jal     func_800BD120
    sw      a0, 0x0018($sp)
    lw      a0, 0x0018($sp)
lbl_800BEE14:
    lbu     t1, 0x0000(a0)             # 00000000
    andi    t4, t1, 0xFF7F             # t4 = 00000000
    sb      t4, 0x0000(a0)             # 00000000
    ori     t5, t4, 0x0040             # t5 = 00000040
    sb      t5, 0x0000(a0)             # 00000000
lbl_800BEE28:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BEE38:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sll     t6, a1,  2
    sw      $ra, 0x0014($sp)
    addu    v0, a0, t6
    lw      a2, 0x0050(v0)             # 00000050
    lui     a0, 0x8013                 # a0 = 80130000
    addiu   a0, a0, 0xB1B8             # a0 = 8012B1B8
    beq     a2, $zero, lbl_800BEE78
    addiu   a1, a2, 0x0070             # a1 = 00000070
    sw      v0, 0x0018($sp)
    jal     func_800BF1E8
    sw      a2, 0x001C($sp)
    jal     func_800BEDBC
    lw      a0, 0x001C($sp)
    lw      v0, 0x0018($sp)
    sw      $zero, 0x0050(v0)          # 00000050
lbl_800BEE78:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800BEE88:
# MqDbg: 
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    or      s1, a0, $zero              # s1 = 00000000
    sw      $ra, 0x0024($sp)
    or      s0, $zero, $zero           # s0 = 00000000
    addiu   s2, $zero, 0x0004          # s2 = 00000004
    or      a0, s1, $zero              # a0 = 00000000
lbl_800BEEAC:
    jal     func_800BEE38
    or      a1, s0, $zero              # a1 = 00000000
    addiu   s0, s0, 0x0001             # s0 = 00000001
    bnel    s0, s2, lbl_800BEEAC
    or      a0, s1, $zero              # a0 = 00000000
    jal     func_800BD3C0
    addiu   a0, s1, 0x0084             # a0 = 00000084
    lbu     t6, 0x0000(s1)             # 00000000
    andi    t9, t6, 0xFF7F             # t9 = 00000000
    sb      t9, 0x0000(s1)             # 00000000
    ori     t0, t9, 0x0040             # t0 = 00000040
    sb      t0, 0x0000(s1)             # 00000000
    lw      $ra, 0x0024($sp)
    lw      s2, 0x0020($sp)
    lw      s1, 0x001C($sp)
    lw      s0, 0x0018($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28


func_800BEEF4:
# MqDbg: 
    sw      a1, 0x0004($sp)
    andi    a1, a1, 0xFFFF             # a1 = 00000000
    or      a2, a0, $zero              # a2 = 00000000
    or      v0, $zero, $zero           # v0 = 00000000
    addiu   a3, $zero, 0x0010          # a3 = 00000010
lbl_800BEF08:
    andi    t6, a1, 0x0001             # t6 = 00000000
    beq     t6, $zero, lbl_800BEF38
    or      v1, a1, $zero              # v1 = 00000000
    sll     t7, v0,  2
    addu    t8, a2, t7
    lw      a0, 0x0038(t8)             # 00000038
    lbu     t9, 0x0005(a2)             # 00000005
    sb      t9, 0x0007(a0)             # 00000007
    lbu     t0, 0x0003(a2)             # 00000003
    sb      t0, 0x0003(a0)             # 00000003
    lbu     t1, 0x0002(a2)             # 00000002
    sb      t1, 0x0002(a0)             # 00000002
lbl_800BEF38:
    sra     a1, v1,  1
    andi    v1, a1, 0xFFFF             # v1 = 00000000
    andi    t2, v1, 0x0001             # t2 = 00000000
    beq     t2, $zero, lbl_800BEF70
    sra     a1, v1,  1
    sll     t3, v0,  2
    addu    t4, a2, t3
    lw      a0, 0x003C(t4)             # 0000003C
    lbu     t5, 0x0005(a2)             # 00000005
    sb      t5, 0x0007(a0)             # 00000007
    lbu     t6, 0x0003(a2)             # 00000003
    sb      t6, 0x0003(a0)             # 00000003
    lbu     t7, 0x0002(a2)             # 00000002
    sb      t7, 0x0002(a0)             # 00000002
lbl_800BEF70:
    andi    v1, a1, 0xFFFF             # v1 = 00000000
    andi    t8, v1, 0x0001             # t8 = 00000000
    beq     t8, $zero, lbl_800BEFA4
    sra     a1, v1,  1
    sll     t9, v0,  2
    addu    t0, a2, t9
    lw      a0, 0x0040(t0)             # 00000040
    lbu     t1, 0x0005(a2)             # 00000005
    sb      t1, 0x0007(a0)             # 00000007
    lbu     t2, 0x0003(a2)             # 00000003
    sb      t2, 0x0003(a0)             # 00000003
    lbu     t3, 0x0002(a2)             # 00000002
    sb      t3, 0x0002(a0)             # 00000002
lbl_800BEFA4:
    andi    v1, a1, 0xFFFF             # v1 = 00000000
    andi    t4, v1, 0x0001             # t4 = 00000000
    beq     t4, $zero, lbl_800BEFD8
    sra     a1, v1,  1
    sll     t5, v0,  2
    addu    t6, a2, t5
    lw      a0, 0x0044(t6)             # 00000044
    lbu     t7, 0x0005(a2)             # 00000005
    sb      t7, 0x0007(a0)             # 00000007
    lbu     t8, 0x0003(a2)             # 00000003
    sb      t8, 0x0003(a0)             # 00000003
    lbu     t9, 0x0002(a2)             # 00000002
    sb      t9, 0x0002(a0)             # 00000002
lbl_800BEFD8:
    addiu   v0, v0, 0x0004             # v0 = 00000004
    bne     v0, a3, lbl_800BEF08
    andi    a1, a1, 0xFFFF             # a1 = 00000000
    jr      $ra
    nop


func_800BEFEC:
# MqDbg: 
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      s2, 0x0020($sp)
    sw      s4, 0x0028($sp)
    sw      s3, 0x0024($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    lui     s2, 0x8013                 # s2 = 80130000
    sw      $ra, 0x002C($sp)
    sw      a1, 0x0034($sp)
    addiu   s2, s2, 0xB0E0             # s2 = 8012B0E0
    or      s0, $zero, $zero           # s0 = 00000000
    or      s1, a0, $zero              # s1 = 00000000
    addiu   s3, $zero, 0x0001          # s3 = 00000001
    addiu   s4, $zero, 0x0040          # s4 = 00000040
lbl_800BF024:
    lw      a0, 0x0038(s1)             # 00000038
    xor     t6, a0, s2
    sltu    t6, $zero, t6
    bnel    s3, t6, lbl_800BF044
    addiu   s0, s0, 0x0004             # s0 = 00000004
    jal     func_800BEE88
    nop
    addiu   s0, s0, 0x0004             # s0 = 00000008
lbl_800BF044:
    bne     s0, s4, lbl_800BF024
    addiu   s1, s1, 0x0004             # s1 = 00000004
    lw      $ra, 0x002C($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    lw      s3, 0x0024($sp)
    lw      s4, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030           # $sp += 0x30


func_800BF06C:
# MqDbg: 
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      a1, 0x002C($sp)
    andi    a1, a1, 0x00FF             # a1 = 00000000
    sll     t6, a1,  2
    sw      $ra, 0x0024($sp)
    sw      s3, 0x0020($sp)
    sw      s2, 0x001C($sp)
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    addu    t7, a0, t6
    lw      s2, 0x0038(t7)             # 00000038
    or      s0, $zero, $zero           # s0 = 00000000
    addiu   s3, $zero, 0x0004          # s3 = 00000004
    lbu     t9, 0x0000(s2)             # 00000000
    sb      $zero, 0x0078(s2)          # 00000078
    sw      a2, 0x0060(s2)             # 00000060
    ori     t1, t9, 0x0080             # t1 = 00000080
    andi    t2, t1, 0x00BF             # t2 = 00000080
    sb      t1, 0x0000(s2)             # 00000000
    sb      t2, 0x0000(s2)             # 00000000
    sh      $zero, 0x001E(s2)          # 0000001E
    or      s1, s2, $zero              # s1 = 00000000
lbl_800BF0C4:
    lw      t3, 0x0050(s1)             # 00000050
    or      a0, s2, $zero              # a0 = 00000000
    beql    t3, $zero, lbl_800BF0E0
    addiu   s0, s0, 0x0001             # s0 = 00000001
    jal     func_800BEE38
    or      a1, s0, $zero              # a1 = 00000001
    addiu   s0, s0, 0x0001             # s0 = 00000002
lbl_800BF0E0:
    bne     s0, s3, lbl_800BF0C4
    addiu   s1, s1, 0x0004             # s1 = 00000004
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28


func_800BF104:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lbu     t7, 0x0000(a0)             # 00000000
    ori     t8, t7, 0x0040             # t8 = 00000040
    jal     func_800BF12C
    sb      t8, 0x0000(a0)             # 00000000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BF12C:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x001C($sp)
    sw      s0, 0x0018($sp)
    or      s0, a0, $zero              # s0 = 00000000
    jal     func_800BEFEC
    ori     a1, $zero, 0xFFFF          # a1 = 0000FFFF
    jal     func_800BD3C0
    addiu   a0, s0, 0x009C             # a0 = 0000009C
    lw      t6, 0x0000(s0)             # 00000000
    srl     t7, t6, 31
    beql    t7, $zero, lbl_800BF1D8
    lw      $ra, 0x001C($sp)
    lbu     t8, 0x0000(s0)             # 00000000
    lbu     a0, 0x0004(s0)             # 00000004
    andi    t1, t8, 0xFF7F             # t1 = 00000000
    sb      t1, 0x0000(s0)             # 00000000
    ori     t2, t1, 0x0040             # t2 = 00000040
    jal     func_800B6EE8
    sb      t2, 0x0000(s0)             # 00000000
    beq     v0, $zero, lbl_800BF188
    addiu   a1, $zero, 0x0003          # a1 = 00000003
    jal     func_800B7008
    lbu     a0, 0x0004(s0)             # 00000004
lbl_800BF188:
    jal     func_800B6E70
    lbu     a0, 0x0005(s0)             # 00000005
    beq     v0, $zero, lbl_800BF1A0
    addiu   a1, $zero, 0x0004          # a1 = 00000004
    jal     func_800B6FD8
    lbu     a0, 0x0005(s0)             # 00000005
lbl_800BF1A0:
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x5630             # v1 = 80125630
    lh      t3, 0x2C22(v1)             # 80128252
    lbu     v0, 0x0005(s0)             # 00000005
    bnel    v0, t3, lbl_800BF1C4
    lh      t4, 0x2C2E(v1)             # 8012825E
    b       lbl_800BF1D4
    sw      $zero, 0x2C04(v1)          # 80128234
    lh      t4, 0x2C2E(v1)             # 8012825E
lbl_800BF1C4:
    addiu   t5, $zero, 0x0001          # t5 = 00000001
    bnel    v0, t4, lbl_800BF1D8
    lw      $ra, 0x001C($sp)
    sw      t5, 0x2C04(v1)             # 80128234
lbl_800BF1D4:
    lw      $ra, 0x001C($sp)
lbl_800BF1D8:
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800BF1E8:
# MqDbg: 
# Audio?
    lw      t6, 0x0000(a1)             # 00000000
    bne     t6, $zero, lbl_800BF220
    nop
    lw      t7, 0x0000(a0)             # 00000000
    sw      a1, 0x0004(t7)             # 00000004
    lw      t8, 0x0000(a0)             # 00000000
    sw      a0, 0x0004(a1)             # 00000004
    sw      t8, 0x0000(a1)             # 00000000
    lw      t9, 0x0008(a0)             # 00000008
    lw      t1, 0x000C(a0)             # 0000000C
    sw      a1, 0x0000(a0)             # 00000000
    addiu   t0, t9, 0x0001             # t0 = 00000001
    sw      t0, 0x0008(a0)             # 00000008
    sw      t1, 0x000C(a1)             # 0000000C
lbl_800BF220:
    jr      $ra
    nop


func_800BF228:
# MqDbg: 
    lw      v1, 0x0000(a0)             # 00000000
    bnel    v1, a0, lbl_800BF240
    lw      t6, 0x0000(v1)             # 00000000
    jr      $ra
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BF23C:
    lw      t6, 0x0000(v1)             # 00000000
lbl_800BF240:
    sw      a0, 0x0004(t6)             # 00000004
    lw      t7, 0x0000(v1)             # 00000000
    sw      t7, 0x0000(a0)             # 00000000
    sw      $zero, 0x0000(v1)          # 00000000
    lw      t8, 0x0008(a0)             # 00000008
    addiu   t9, t8, 0xFFFF             # t9 = FFFFFFFF
    sw      t9, 0x0008(a0)             # 00000008
    lw      v0, 0x0008(v1)             # 00000008
    jr      $ra
    nop


func_800BF268:
# MqDbg: 
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x5630             # v0 = 80125630
    sw      s3, 0x0024($sp)
    lui     s3, 0x8013                 # s3 = 80130000
    addiu   s3, s3, 0xB1B8             # s3 = 8012B1B8
    sw      s4, 0x0028($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    lui     s0, 0x8012                 # s0 = 80120000
    lui     s1, 0x8013                 # s1 = 80130000
    lui     s2, 0x8013                 # s2 = 80130000
    lui     s4, 0x8013                 # s4 = 80130000
    sw      $ra, 0x002C($sp)
    sw      s3, 0x5B88(v0)             # 8012B1B8
    sw      s3, 0x5B8C(v0)             # 8012B1BC
    sw      $zero, 0x5B90(v0)          # 8012B1C0
    sw      $zero, 0x5B94(v0)          # 8012B1C4
    addiu   s4, s4, 0xB150             # s4 = 8012B150
    addiu   s2, s2, 0x90E0             # s2 = 801290E0
    addiu   s1, s1, 0x9150             # s1 = 80129150
    addiu   s0, s0, 0x5630             # s0 = 80125630
lbl_800BF2C4:
    sw      s2, 0x3B28(s0)             # 80129158
    sw      $zero, 0x3B20(s0)          # 80129150
    or      a0, s3, $zero              # a0 = 8012B1B8
    jal     func_800BF1E8
    or      a1, s1, $zero              # a1 = 80129150
    addiu   s1, s1, 0x0080             # s1 = 801291D0
    addiu   s0, s0, 0x0080             # s0 = 801256B0
    bne     s1, s4, lbl_800BF2C4
    addiu   s2, s2, 0x0080             # s2 = 80129160
    lw      $ra, 0x002C($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    lw      s3, 0x0024($sp)
    lw      s4, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030           # $sp += 0x30


func_800BF308:
# MqDbg: 
    lw      a1, 0x0000(a0)             # 00000000
    lbu     v0, 0x0000(a1)             # 00000000
    addiu   t6, a1, 0x0001             # t6 = 00000001
    jr      $ra
    sw      t6, 0x0000(a0)             # 00000000


func_800BF31C:
# MqDbg: 
    lw      a1, 0x0000(a0)             # 00000000
    lbu     v1, 0x0000(a1)             # 00000000
    addiu   t6, a1, 0x0001             # t6 = 00000001
    sw      t6, 0x0000(a0)             # 00000000
    lbu     t7, 0x0000(t6)             # 00000001
    sll     v1, v1,  8
    sll     v1, v1, 16
    sra     v1, v1, 16
    or      v1, t7, v1                 # v1 = 00000000
    sll     v1, v1, 16
    addiu   t8, t6, 0x0001             # t8 = 00000002
    sw      t8, 0x0000(a0)             # 00000000
    jr      $ra
    sra     v0, v1, 16


func_800BF354:
# MqDbg: 
    lw      v0, 0x0000(a0)             # 00000000
    lbu     v1, 0x0000(v0)             # 00000000
    addiu   t6, v0, 0x0001             # t6 = 00000001
    sw      t6, 0x0000(a0)             # 00000000
    andi    t7, v1, 0x0080             # t7 = 00000000
    beq     t7, $zero, lbl_800BF38C
    or      a1, v1, $zero              # a1 = 00000000
    lbu     t8, 0x0000(t6)             # 00000001
    sll     v1, a1,  8
    andi    v1, v1, 0x7F00             # v1 = 00000000
    addiu   t9, t6, 0x0001             # t9 = 00000002
    or      v1, t8, v1                 # v1 = 00000000
    andi    v1, v1, 0xFFFF             # v1 = 00000000
    sw      t9, 0x0000(a0)             # 00000000
lbl_800BF38C:
    jr      $ra
    or      v0, v1, $zero              # v0 = 00000000


func_800BF394:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x001C($sp)
    sw      s0, 0x0018($sp)
    lw      v0, 0x0000(a0)             # 00000000
    or      s0, a0, $zero              # s0 = 00000000
    srl     t6, v0, 31
    beql    t6, $zero, lbl_800BF488
    lw      $ra, 0x001C($sp)
    lh      v1, 0x0008(a0)             # 00000008
    sll     t9, v0,  2
    slti    $at, v1, 0x0002
    bne     $at, $zero, lbl_800BF3FC
    addiu   t7, v1, 0xFFFF             # t7 = FFFFFFFF
    bltz    t9, lbl_800BF484
    sh      t7, 0x0008(a0)             # 00000008
    lh      t0, 0x000A(a0)             # 0000000A
    lh      t1, 0x0008(a0)             # 00000008
    slt     $at, t0, t1
    bnel    $at, $zero, lbl_800BF488
    lw      $ra, 0x001C($sp)
    jal     func_800BD120
    nop
    lbu     t3, 0x0000(s0)             # 00000000
    ori     t4, t3, 0x0020             # t4 = 00000020
    b       lbl_800BF484
    sb      t4, 0x0000(s0)             # 00000000
lbl_800BF3FC:
    jal     func_800BF498
    or      a0, s0, $zero              # a0 = 00000000
    jal     func_800BF680
    or      a0, s0, $zero              # a0 = 00000000
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    beq     v0, $at, lbl_800BF484
    or      a1, v0, $zero              # a1 = 00000000
    jal     func_800C00A0
    or      a0, s0, $zero              # a0 = 00000000
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    beq     v0, $at, lbl_800BF438
    or      a1, v0, $zero              # a1 = 00000000
    jal     func_800BFA00
    or      a0, s0, $zero              # a0 = 00000000
    or      a1, v0, $zero              # a1 = 00000000
lbl_800BF438:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    beql    v0, $at, lbl_800BF450
    lw      v0, 0x0000(s0)             # 00000000
    jal     func_800BF524
    or      a0, s0, $zero              # a0 = 00000000
    lw      v0, 0x0000(s0)             # 00000000
lbl_800BF450:
    addiu   $at, $zero, 0x0001         # $at = 00000001
    sll     t5, v0,  2
    srl     t6, t5, 31
    bnel    t6, $at, lbl_800BF488
    lw      $ra, 0x001C($sp)
    lw      t7, 0x002C(s0)             # 0000002C
    sll     t9, v0,  3
    bne     t7, $zero, lbl_800BF47C
    nop
    bgezl   t9, lbl_800BF488
    lw      $ra, 0x001C($sp)
lbl_800BF47C:
    jal     func_800BD120
    or      a0, s0, $zero              # a0 = 00000000
lbl_800BF484:
    lw      $ra, 0x001C($sp)
lbl_800BF488:
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800BF498:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lw      t6, 0x0000(a0)             # 00000000
    sll     t8, t6,  3
    bltzl   t8, lbl_800BF4C4
    lw      v0, 0x002C(a0)             # 0000002C
    jal     func_800BD120
    sw      a0, 0x0018($sp)
    b       lbl_800BF4E4
    lw      a0, 0x0018($sp)
    lw      v0, 0x002C(a0)             # 0000002C
lbl_800BF4C4:
    beql    v0, $zero, lbl_800BF4E8
    lbu     v0, 0x0020(a0)             # 00000020
    lw      t9, 0x0048(v0)             # 00000048
    bnel    a0, t9, lbl_800BF4E8
    lbu     v0, 0x0020(a0)             # 00000020
    jal     func_800BD120
    sw      a0, 0x0018($sp)
    lw      a0, 0x0018($sp)
lbl_800BF4E4:
    lbu     v0, 0x0020(a0)             # 00000020
lbl_800BF4E8:
    addiu   $at, $zero, 0xFF7F         # $at = FFFFFF7F
    and     v0, v0, $at
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     v0, $at, lbl_800BF504
    addiu   $at, $zero, 0x0002         # $at = 00000002
    bnel    v0, $at, lbl_800BF50C
    lbu     t1, 0x0000(a0)             # 00000000
lbl_800BF504:
    sb      $zero, 0x0020(a0)          # 00000020
    lbu     t1, 0x0000(a0)             # 00000000
lbl_800BF50C:
    ori     t2, t1, 0x0001             # t2 = 00000001
    sb      t2, 0x0000(a0)             # 00000000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BF524:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lw      v0, 0x0000(a0)             # 00000000
    or      a3, a0, $zero              # a3 = 00000000
    sll     t7, v0,  2
    bltzl   t7, lbl_800BF588
    sll     v1, v0,  3
    lw      v1, 0x004C(a0)             # 0000004C
    beql    v1, $zero, lbl_800BF588
    sll     v1, v0,  3
    lw      t8, 0x0000(v1)             # 00000000
    addiu   $at, $zero, 0x0002         # $at = 00000002
    lw      a0, 0x0000(t8)             # 00000000
    srl     t9, a0, 28
    bne     t9, $at, lbl_800BF584
    sll     t0, a0,  4
    srl     t1, t0, 30
    beql    t1, $zero, lbl_800BF588
    sll     v1, v0,  3
    lbu     t3, 0x0000(a3)             # 00000000
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
    ori     t4, t3, 0x0020             # t4 = 00000020
    b       lbl_800BF670
    sb      t4, 0x0000(a3)             # 00000000
lbl_800BF584:
    sll     v1, v0,  3
lbl_800BF588:
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    srl     v1, v1, 31
    bne     a0, v1, lbl_800BF5AC
    sll     t5, v0,  6
    srl     t6, t5, 31
    bne     a0, t6, lbl_800BF5AC
    nop
    b       lbl_800BF670
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BF5AC:
    bne     a0, v1, lbl_800BF604
    nop
    lw      a2, 0x002C(a3)             # 0000002C
    sll     t8, v0,  4
    beq     a2, $zero, lbl_800BF604
    nop
    bgez    t8, lbl_800BF604
    nop
    bne     a1, a0, lbl_800BF604
    nop
    lw      t9, 0x0044(a2)             # 00000044
    bne     a3, t9, lbl_800BF604
    nop
    lw      t0, 0x004C(a3)             # 0000004C
    or      a0, a2, $zero              # a0 = 00000000
    or      a1, a3, $zero              # a1 = 00000000
    bnel    t0, $zero, lbl_800BF650
    lw      a2, 0x002C(a3)             # 0000002C
    jal     func_800BD264
    sw      a3, 0x0018($sp)
    b       lbl_800BF64C
    lw      a3, 0x0018($sp)
lbl_800BF604:
    bne     a1, $zero, lbl_800BF618
    or      a0, a3, $zero              # a0 = 00000000
    jal     func_800BD120
    sw      a3, 0x0018($sp)
    lw      a3, 0x0018($sp)
lbl_800BF618:
    or      a0, a3, $zero              # a0 = 00000000
    jal     func_800BDA74
    sw      a3, 0x0018($sp)
    lw      a3, 0x0018($sp)
    beq     v0, $zero, lbl_800BF64C
    sw      v0, 0x002C(a3)             # 0000002C
    lw      t1, 0x0044(v0)             # 00000044
    or      a0, v0, $zero              # a0 = 00000000
    bnel    a3, t1, lbl_800BF650
    lw      a2, 0x002C(a3)             # 0000002C
    jal     func_800BE4C0
    sw      a3, 0x0018($sp)
    lw      a3, 0x0018($sp)
lbl_800BF64C:
    lw      a2, 0x002C(a3)             # 0000002C
lbl_800BF650:
    beql    a2, $zero, lbl_800BF670
    or      v0, $zero, $zero           # v0 = 00000000
    lw      t2, 0x0044(a2)             # 00000044
    bnel    a3, t2, lbl_800BF670
    or      v0, $zero, $zero           # v0 = 00000000
    jal     func_800BE578
    or      a0, a2, $zero              # a0 = 00000000
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800BF670:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800BF680:
# MqDbg: 
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      $ra, 0x0034($sp)
    sw      s4, 0x0030($sp)
    sw      s3, 0x002C($sp)
    sw      s2, 0x0028($sp)
    sw      s1, 0x0024($sp)
    sw      s0, 0x0020($sp)
    sdc1    $f20, 0x0018($sp)
    lw      s4, 0x0050(a0)             # 00000050
    lui     $at, 0x8011                # $at = 80110000
    or      s1, a0, $zero              # s1 = 00000000
    lwc1    $f20, -0x65C8($at)         # 80109A38
    addiu   s2, a0, 0x0054             # s2 = 00000054
    lw      s3, 0x004C(s4)             # 0000004C
lbl_800BF6B8:
    jal     func_800BF308
    or      a0, s2, $zero              # a0 = 00000054
    slti    $at, v0, 0x00C1
    andi    s0, v0, 0x00FF             # s0 = 00000000
    beq     $at, $zero, lbl_800BF6D8
    or      a0, v0, $zero              # a0 = 00000000
    b       lbl_800BF9DC
    or      v0, s0, $zero              # v0 = 00000000
lbl_800BF6D8:
    slti    $at, a0, 0x00F2
    bne     $at, $zero, lbl_800BF71C
    addiu   t6, a0, 0xFF3F             # t6 = FFFFFF3F
    or      a0, s2, $zero              # a0 = 00000054
    jal     func_800BE900
    andi    a1, s0, 0x00FF             # a1 = 00000000
    or      a0, s3, $zero              # a0 = 00000000
    or      a1, s2, $zero              # a1 = 00000054
    or      a2, s0, $zero              # a2 = 00000000
    jal     func_800BE968
    or      a3, v0, $zero              # a3 = 00000000
    beq     v0, $zero, lbl_800BF6B8
    nop
    jal     func_800BEDBC
    or      a0, s1, $zero              # a0 = 00000000
    b       lbl_800BF9DC
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
lbl_800BF71C:
    sltiu   $at, t6, 0x000F
    beq     $at, $zero, lbl_800BF978
    andi    v1, a0, 0x00F0             # v1 = 00000000
    sll     t6, t6,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t6
    lw      t6, -0x65C4($at)           # 80109A3C
    jr      t6
    nop
    lw      v1, 0x0000(s2)             # 00000054
    addiu   $at, $zero, 0x00C1         # $at = 000000C1
    lbu     a1, 0x0000(v1)             # 00000000
    addiu   t7, v1, 0x0001             # t7 = 00000001
    bne     a0, $at, lbl_800BF778
    sw      t7, 0x0000(s2)             # 00000054
    multu   a1, a1
    mflo    t8
    mtc1    t8, $f4                    # $f4 = 0.00
    nop
    cvt.s.w $f6, $f4
    div.s   $f8, $f6, $f20
    b       lbl_800BF6B8
    swc1    $f8, 0x003C(s1)            # 0000003C
lbl_800BF778:
    b       lbl_800BF6B8
    sb      a1, 0x0006(s1)             # 00000006
    lw      v1, 0x0000(s2)             # 00000054
    addiu   $at, $zero, 0x00C9         # $at = 000000C9
    lbu     a1, 0x0000(v1)             # 00000000
    addiu   t9, v1, 0x0001             # t9 = 00000001
    bne     a0, $at, lbl_800BF7A0
    sw      t9, 0x0000(s2)             # 00000054
    b       lbl_800BF6B8
    sb      a1, 0x0003(s1)             # 00000003
lbl_800BF7A0:
    b       lbl_800BF6B8
    sh      a1, 0x0010(s1)             # 00000010
    addiu   $at, $zero, 0x00C4         # $at = 000000C4
    bnel    a0, $at, lbl_800BF7C8
    lbu     t3, 0x0000(s1)             # 00000000
    lbu     t1, 0x0000(s1)             # 00000000
    ori     t2, t1, 0x0010             # t2 = 00000010
    b       lbl_800BF7D0
    sb      t2, 0x0000(s1)             # 00000000
    lbu     t3, 0x0000(s1)             # 00000000
lbl_800BF7C8:
    andi    t4, t3, 0xFFEF             # t4 = 00000000
    sb      t4, 0x0000(s1)             # 00000000
lbl_800BF7D0:
    lbu     t5, 0x0000(s1)             # 00000000
    or      a0, s1, $zero              # a0 = 00000000
    andi    t6, t5, 0xFFFD             # t6 = 00000000
    jal     func_800BD120
    sb      t6, 0x0000(s1)             # 00000000
    b       lbl_800BF6B8
    nop
    jal     func_800BF354
    or      a0, s2, $zero              # a0 = 00000054
    b       lbl_800BF6B8
    sh      v0, 0x0012(s1)             # 00000012
    jal     func_800BF308
    or      a0, s2, $zero              # a0 = 00000054
    slti    $at, v0, 0x007E
    andi    s0, v0, 0x00FF             # s0 = 00000000
    bne     $at, $zero, lbl_800BF858
    or      a0, v0, $zero              # a0 = 00000000
    addiu   $at, $zero, 0x007E         # $at = 0000007E
    bne     v0, $at, lbl_800BF828
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    b       lbl_800BF844
    sb      t7, 0x0002(s1)             # 00000002
lbl_800BF828:
    addiu   $at, $zero, 0x007F         # $at = 0000007F
    bnel    a0, $at, lbl_800BF840
    sb      v0, 0x0002(s1)             # 00000002
    b       lbl_800BF844
    sb      $zero, 0x0002(s1)          # 00000002
    sb      v0, 0x0002(s1)             # 00000002
lbl_800BF840:
    sw      $zero, 0x0048(s1)          # 00000048
lbl_800BF844:
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    bne     a0, $at, lbl_800BF6B8
    nop
    b       lbl_800BF6B8
    sb      $zero, 0x0018(s1)          # 00000018
lbl_800BF858:
    or      a0, s4, $zero              # a0 = 00000000
    andi    a1, s0, 0x00FF             # a1 = 00000000
    addiu   a2, s1, 0x0048             # a2 = 00000048
    jal     func_800C04E4
    addiu   a3, s1, 0x0018             # a3 = 00000018
    bne     v0, $zero, lbl_800BF6B8
    sb      v0, 0x0002(s1)             # 00000002
    addiu   t8, $zero, 0x00FF          # t8 = 000000FF
    b       lbl_800BF6B8
    sb      t8, 0x0002(s1)             # 00000002
    jal     func_800BF308
    or      a0, s2, $zero              # a0 = 00000054
    sb      v0, 0x0020(s1)             # 00000020
    jal     func_800BF308
    or      a0, s2, $zero              # a0 = 00000054
    lh      t9, 0x0026(s4)             # 00000026
    lh      t0, 0x0010(s1)             # 00000010
    lh      t1, 0x000E(s3)             # 0000000E
    addu    s0, v0, t9
    addu    s0, s0, t0
    addu    s0, s0, t1
    andi    s0, s0, 0x00FF             # s0 = 00000000
    slti    $at, s0, 0x0080
    bnel    $at, $zero, lbl_800BF8C4
    lbu     t2, 0x0020(s1)             # 00000020
    or      s0, $zero, $zero           # s0 = 00000000
    lbu     t2, 0x0020(s1)             # 00000020
lbl_800BF8C4:
    sb      s0, 0x0005(s1)             # 00000005
    andi    t3, t2, 0x0080             # t3 = 00000000
    beq     t3, $zero, lbl_800BF8F0
    nop
    lw      t4, 0x0000(s2)             # 00000054
    lbu     t5, 0x0000(t4)             # 00000000
    sh      t5, 0x000E(s1)             # 0000000E
    lw      t6, 0x0000(s2)             # 00000054
    addiu   t7, t6, 0x0001             # t7 = 00000001
    b       lbl_800BF6B8
    sw      t7, 0x0000(s2)             # 00000054
lbl_800BF8F0:
    jal     func_800BF354
    or      a0, s2, $zero              # a0 = 00000054
    b       lbl_800BF6B8
    sh      v0, 0x000E(s1)             # 0000000E
    b       lbl_800BF6B8
    sb      $zero, 0x0020(s1)          # 00000020
    jal     func_800BF31C
    or      a0, s2, $zero              # a0 = 00000054
    lw      t8, 0x0018(s3)             # 00000018
    andi    t9, v0, 0xFFFF             # t9 = 00000000
    addu    t0, t8, t9
    sw      t0, 0x001C(s1)             # 0000001C
    jal     func_800BF308
    or      a0, s2, $zero              # a0 = 00000054
    b       lbl_800BF6B8
    sb      v0, 0x0018(s1)             # 00000018
    lbu     t2, 0x0000(s1)             # 00000000
    ori     t3, t2, 0x0004             # t3 = 00000004
    b       lbl_800BF6B8
    sb      t3, 0x0000(s1)             # 00000000
    jal     func_800BF308
    or      a0, s2, $zero              # a0 = 00000054
    b       lbl_800BF6B8
    sb      v0, 0x0001(s1)             # 00000001
    jal     func_800BF308
    or      a0, s2, $zero              # a0 = 00000054
    addiu   t4, v0, 0x0080             # t4 = 00000080
    andi    t5, t4, 0x00FF             # t5 = 00000080
    sll     t6, t5,  2
    lui     $at, 0x8010                # $at = 80100000
    addu    $at, $at, t6
    lwc1    $f10, 0x07C4($at)          # 801007C4
    b       lbl_800BF6B8
    swc1    $f10, 0x0034(s1)           # 00000034
lbl_800BF978:
    addiu   $at, $zero, 0x00D0         # $at = 000000D0
    beq     v1, $at, lbl_800BF994
    addiu   $at, $zero, 0x00E0         # $at = 000000E0
    beql    v1, $at, lbl_800BF9C8
    lw      t1, 0x0098(s3)             # 00000098
    b       lbl_800BF6B8
    nop
lbl_800BF994:
    lw      t7, 0x0094(s3)             # 00000094
    andi    t8, a0, 0x000F             # t8 = 00000000
    addu    t9, t7, t8
    lbu     a1, 0x0000(t9)             # 00000000
    multu   a1, a1
    mflo    t0
    mtc1    t0, $f16                   # $f16 = 0.00
    nop
    cvt.s.w $f18, $f16
    div.s   $f4, $f18, $f20
    b       lbl_800BF6B8
    swc1    $f4, 0x003C(s1)            # 0000003C
    lw      t1, 0x0098(s3)             # 00000098
lbl_800BF9C8:
    andi    t2, a0, 0x000F             # t2 = 00000000
    addu    t3, t1, t2
    lbu     t4, 0x0000(t3)             # 00000000
    b       lbl_800BF6B8
    sb      t4, 0x0003(s1)             # 00000003
lbl_800BF9DC:
    lw      $ra, 0x0034($sp)
    ldc1    $f20, 0x0018($sp)
    lw      s0, 0x0020($sp)
    lw      s1, 0x0024($sp)
    lw      s2, 0x0028($sp)
    lw      s3, 0x002C($sp)
    lw      s4, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038           # $sp += 0x38


func_800BFA00:
# MqDbg: 
    addiu   $sp, $sp, 0xFF88           # $sp -= 0x78
    sw      $ra, 0x0014($sp)
    sw      a1, 0x007C($sp)
    lbu     v0, 0x0002(a0)             # 00000002
    lw      v1, 0x0050(a0)             # 00000050
    addiu   t0, $zero, 0x00FF          # t0 = 000000FF
    or      a2, a0, $zero              # a2 = 00000000
    addiu   t3, $zero, 0x0001          # t3 = 00000001
    bne     v0, t0, lbl_800BFA44
    lw      t2, 0x004C(v1)             # 0000004C
    lw      t6, 0x0000(v1)             # 00000000
    sll     t8, t6,  4
    bltzl   t8, lbl_800BFA44
    lh      v0, 0x0024(v1)             # 00000024
    b       lbl_800C0090
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
    lh      v0, 0x0024(v1)             # 00000024
lbl_800BFA44:
    beq     v0, $zero, lbl_800BFA60
    lbu     t9, 0x007F($sp)
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     v0, $at, lbl_800BFAF8
    lbu     t6, 0x007F($sp)
    b       lbl_800BFB70
    lh      t7, 0x000E(t2)             # 0000000E
lbl_800BFA60:
    lh      t4, 0x0026(v1)             # 00000026
    lh      t6, 0x0010(a2)             # 00000010
    addu    t5, t9, t4
    addu    t1, t5, t6
    andi    a1, t1, 0x00FF             # a1 = 00000000
    sb      a1, 0x0004(a2)             # 00000004
    lbu     a0, 0x0007(v1)             # 00000007
    sw      t3, 0x0074($sp)
    sw      t2, 0x0040($sp)
    jal     func_800BCB2C
    sw      a2, 0x0078($sp)
    lw      a2, 0x0078($sp)
    lw      t2, 0x0040($sp)
    bne     v0, $zero, lbl_800BFAB8
    lw      t3, 0x0074($sp)
    lbu     t8, 0x0000(a2)             # 00000000
    lh      t4, 0x0008(a2)             # 00000008
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
    ori     t9, t8, 0x0020             # t9 = 00000020
    sb      t9, 0x0000(a2)             # 00000000
    b       lbl_800C0090
    sh      t4, 0x000C(a2)             # 0000000C
lbl_800BFAB8:
    lw      t5, 0x000C(v0)             # 0000000B
    lw      t7, 0x0000(a2)             # 00000000
    addiu   v1, v0, 0x0004             # v1 = 00000003
    sw      t5, 0x001C(a2)             # 0000001C
    lbu     t6, 0x0000(v0)             # FFFFFFFF
    sll     t9, t7,  5
    bltz    t9, lbl_800BFAE0
    sb      t6, 0x0018(a2)             # 00000018
    lbu     t4, 0x0001(v0)             # 00000000
    sb      t4, 0x0006(a2)             # 00000006
lbl_800BFAE0:
    sw      v1, 0x004C(a2)             # 0000004C
    lwc1    $f4, 0x0004(v1)            # 00000007
    lui     a1, 0x8012                 # a1 = 80120000
    addiu   a1, a1, 0x5630             # a1 = 80125630
    b       lbl_800BFF00
    swc1    $f4, 0x0030(a2)            # 00000030
lbl_800BFAF8:
    lbu     v0, 0x007F($sp)
    lh      t5, 0x0010(a2)             # 00000010
    sb      v0, 0x0004(a2)             # 00000004
    lbu     a0, 0x0007(v1)             # 0000000A
    sll     t6, t5,  6
    addu    a3, t6, v0
    andi    a1, a3, 0xFFFF             # a1 = 00000000
    sw      t3, 0x0074($sp)
    sw      t2, 0x0040($sp)
    jal     func_800BCC10
    sw      a2, 0x0078($sp)
    lw      a2, 0x0078($sp)
    lw      t2, 0x0040($sp)
    bne     v0, $zero, lbl_800BFB54
    lw      t3, 0x0074($sp)
    lbu     t8, 0x0000(a2)             # 00000000
    lh      t4, 0x0008(a2)             # 00000008
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
    ori     t9, t8, 0x0020             # t9 = 00000020
    addiu   t5, t4, 0x0001             # t5 = 00000001
    sb      t9, 0x0000(a2)             # 00000000
    b       lbl_800C0090
    sh      t5, 0x000C(a2)             # 0000000C
lbl_800BFB54:
    sw      v0, 0x004C(a2)             # 0000004C
    lwc1    $f6, 0x0004(v0)            # 00000003
    lui     a1, 0x8012                 # a1 = 80120000
    addiu   a1, a1, 0x5630             # a1 = 80125630
    b       lbl_800BFF00
    swc1    $f6, 0x0030(a2)            # 00000030
    lh      t7, 0x000E(t2)             # 0000000E
lbl_800BFB70:
    lh      t9, 0x0026(v1)             # 00000026
    lh      t5, 0x0010(a2)             # 00000010
    addu    t8, t6, t7
    addu    t4, t8, t9
    addu    t1, t4, t5
    andi    t1, t1, 0x00FF             # t1 = 00000000
    slti    $at, t1, 0x0080
    sb      t1, 0x0004(a2)             # 00000004
    bne     $at, $zero, lbl_800BFBAC
    or      a3, t1, $zero              # a3 = 00000000
    lbu     t7, 0x0000(a2)             # 00000000
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
    ori     t8, t7, 0x0020             # t8 = 00000020
    b       lbl_800C0090
    sb      t8, 0x0000(a2)             # 00000000
lbl_800BFBAC:
    lbu     t9, 0x0002(a2)             # 00000002
    bnel    t0, t9, lbl_800BFBC4
    lw      a0, 0x0048(a2)             # 00000048
    b       lbl_800BFBC4
    lw      a0, 0x0048(v1)             # 00000048
    lw      a0, 0x0048(a2)             # 00000048
lbl_800BFBC4:
    lbu     t4, 0x0020(a2)             # 00000020
    beq     t4, $zero, lbl_800BFE44
    nop
    addiu   t0, a2, 0x0020             # t0 = 00000020
    sw      t0, 0x0060($sp)
    lbu     v1, 0x0005(a2)             # 00000005
    slt     $at, v1, a3
    beq     $at, $zero, lbl_800BFBF0
    or      a1, v1, $zero              # a1 = 00000000
    b       lbl_800BFBF0
    or      a1, a3, $zero              # a1 = 00000000
lbl_800BFBF0:
    beq     a0, $zero, lbl_800BFC3C
    lui     $at, 0x3F80                # $at = 3F800000
    sw      a2, 0x0078($sp)
    sw      a3, 0x0020($sp)
    sw      t0, 0x001C($sp)
    sb      t1, 0x003F($sp)
    jal     func_800BCA1C
    sw      t2, 0x0040($sp)
    lw      a2, 0x0078($sp)
    lw      a3, 0x0020($sp)
    lw      t0, 0x001C($sp)
    lw      t5, 0x004C(a2)             # 0000004C
    lbu     t1, 0x003F($sp)
    lw      t2, 0x0040($sp)
    sw      v0, 0x004C(a2)             # 0000004C
    xor     t3, v0, t5
    sltiu   t3, t3, 0x0001
    b       lbl_800BFC84
    lwc1    $f0, 0x0004(v0)            # 00000004
lbl_800BFC3C:
    mtc1    $at, $f0                   # $f0 = 0.00
    slti    $at, v0, 0x00C0
    bne     $at, $zero, lbl_800BFC84
    sw      $zero, 0x004C(a2)          # 0000004C
    sll     t6, v0,  2
    subu    t6, t6, v0
    sll     t6, t6,  2
    subu    t6, t6, v0
    sll     t6, t6,  3
    lui     a1, 0x8012                 # a1 = 80120000
    addu    t6, t6, v0
    addiu   a1, a1, 0x5630             # a1 = 80125630
    sll     t6, t6,  3
    lui     $at, 0xFFFD                # $at = FFFD0000
    ori     $at, $at, 0xEC98           # $at = FFFDEC98
    addu    t7, a1, t6
    addu    t8, t7, $at
    sw      t8, 0x004C(a2)             # 0000004C
lbl_800BFC84:
    lui     v1, 0x8010                 # v1 = 80100000
    lbu     t5, 0x0005(a2)             # 00000005
    addiu   v1, v1, 0x0BC4             # v1 = 80100BC4
    sll     t9, a3,  2
    addu    t4, v1, t9
    lwc1    $f8, 0x0000(t4)            # 00000000
    lbu     v0, 0x0000(t0)             # 00000000
    sll     t6, t5,  2
    addu    t7, v1, t6
    lwc1    $f10, 0x0000(t7)           # 00000000
    mul.s   $f2, $f8, $f0
    addiu   a0, $zero, 0xFF7F          # a0 = FFFFFF7F
    and     t8, v0, a0
    addiu   t9, t8, 0xFFFF             # t9 = FFFFFFFF
    lui     a1, 0x8012                 # a1 = 80120000
    sltiu   $at, t9, 0x0005
    mul.s   $f14, $f10, $f0
    beq     $at, $zero, lbl_800BFD00
    addiu   a1, a1, 0x5630             # a1 = 80125630
    sll     t9, t9,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t9
    lw      t9, -0x6588($at)           # 80109A78
    jr      t9
    nop
    mov.s   $f0, $f2
    b       lbl_800BFD08
    mov.s   $f12, $f14
    mov.s   $f12, $f2
    b       lbl_800BFD08
    mov.s   $f0, $f14
lbl_800BFD00:
    mov.s   $f12, $f2
    mov.s   $f0, $f2
lbl_800BFD08:
    div.s   $f16, $f0, $f12
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f18                  # $f18 = 1.00
    andi    t4, v0, 0x0080             # t4 = 00000000
    sub.s   $f4, $f16, $f18
    beq     t4, $zero, lbl_800BFDB4
    swc1    $f4, 0x0008(t0)            # 00000008
    lhu     t5, 0x0008(t2)             # 00000008
    lh      t7, 0x2898(a1)             # 80127EC8
    lh      v0, 0x0008(a2)             # 00000008
    sll     t6, t5, 15
    div     $zero, t6, t7
    mflo    v1
    bne     t7, $zero, lbl_800BFD48
    nop
    break   # 0x01C00
lbl_800BFD48:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t7, $at, lbl_800BFD60
    lui     $at, 0x8000                # $at = 80000000
    bne     t6, $at, lbl_800BFD60
    nop
    break   # 0x01800
lbl_800BFD60:
    beql    v0, $zero, lbl_800BFE00
    slti    $at, v1, 0x7FFF
    lhu     t9, 0x000E(a2)             # 0000000E
    sll     t8, v1,  8
    multu   v0, t9
    mflo    t4
    nop
    nop
    div     $zero, t8, t4
    mflo    v1
    bne     t4, $zero, lbl_800BFD94
    nop
    break   # 0x01C00
lbl_800BFD94:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t4, $at, lbl_800BFDAC
    lui     $at, 0x8000                # $at = 80000000
    bne     t8, $at, lbl_800BFDAC
    nop
    break   # 0x01800
lbl_800BFDAC:
    b       lbl_800BFE00
    slti    $at, v1, 0x7FFF
lbl_800BFDB4:
    lhu     t5, 0x000E(a2)             # 0000000E
    lh      t6, 0x2854(a1)             # 80127E84
    lui     t9, 0x0002                 # t9 = 00020000
    multu   t5, t6
    mflo    t7
    nop
    nop
    div     $zero, t9, t7
    mflo    v1
    bne     t7, $zero, lbl_800BFDE4
    nop
    break   # 0x01C00
lbl_800BFDE4:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t7, $at, lbl_800BFDFC
    lui     $at, 0x8000                # $at = 80000000
    bne     t9, $at, lbl_800BFDFC
    nop
    break   # 0x01800
lbl_800BFDFC:
    slti    $at, v1, 0x7FFF
lbl_800BFE00:
    bne     $at, $zero, lbl_800BFE10
    nop
    b       lbl_800BFE1C
    addiu   v1, $zero, 0x7FFF          # v1 = 00007FFF
lbl_800BFE10:
    bgtzl   v1, lbl_800BFE20
    sh      v1, 0x0004(t0)             # 00000004
    addiu   v1, $zero, 0x0001          # v1 = 00000001
lbl_800BFE1C:
    sh      v1, 0x0004(t0)             # 00000004
lbl_800BFE20:
    sh      $zero, 0x0002(t0)          # 00000002
    swc1    $f12, 0x0030(a2)           # 00000030
    lbu     t8, 0x0000(t0)             # 00000000
    addiu   $at, $zero, 0x0005         # $at = 00000005
    and     t4, t8, a0
    bnel    t4, $at, lbl_800BFF04
    lwc1    $f18, 0x0030(a2)           # 00000030
    b       lbl_800BFF00
    sb      t1, 0x0005(a2)             # 00000005
lbl_800BFE44:
    beq     a0, $zero, lbl_800BFE9C
    or      a1, a3, $zero              # a1 = 00000000
    sw      a2, 0x0078($sp)
    sw      a3, 0x0020($sp)
    jal     func_800BCA1C
    sw      t2, 0x0040($sp)
    lw      a2, 0x0078($sp)
    lw      a3, 0x0020($sp)
    lui     v1, 0x8010                 # v1 = 80100000
    lw      t5, 0x004C(a2)             # 0000004C
    lw      t2, 0x0040($sp)
    addiu   v1, v1, 0x0BC4             # v1 = 80100BC4
    sw      v0, 0x004C(a2)             # 0000004C
    sll     t6, a3,  2
    addu    t9, v1, t6
    lwc1    $f6, 0x0000(t9)            # 00000000
    lwc1    $f8, 0x0004(v0)            # 00000004
    xor     t3, v0, t5
    sltiu   t3, t3, 0x0001
    mul.s   $f10, $f6, $f8
    b       lbl_800BFEF8
    swc1    $f10, 0x0030(a2)           # 00000030
lbl_800BFE9C:
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x0BC4             # v1 = 80100BC4
    sll     t7, a3,  2
    sw      $zero, 0x004C(a2)          # 0000004C
    addu    t8, v1, t7
    lwc1    $f16, 0x0000(t8)           # 00000000
    slti    $at, v0, 0x00C0
    bne     $at, $zero, lbl_800BFEF8
    swc1    $f16, 0x0030(a2)           # 00000030
    sll     t4, v0,  2
    subu    t4, t4, v0
    sll     t4, t4,  2
    subu    t4, t4, v0
    sll     t4, t4,  3
    lui     a1, 0x8012                 # a1 = 80120000
    addu    t4, t4, v0
    addiu   a1, a1, 0x5630             # a1 = 80125630
    sll     t4, t4,  3
    lui     $at, 0xFFFD                # $at = FFFD0000
    ori     $at, $at, 0xEC98           # $at = FFFDEC98
    addu    t5, a1, t4
    addu    t6, t5, $at
    sw      t6, 0x004C(a2)             # 0000004C
lbl_800BFEF8:
    lui     a1, 0x8012                 # a1 = 80120000
    addiu   a1, a1, 0x5630             # a1 = 80125630
lbl_800BFF00:
    lwc1    $f18, 0x0030(a2)           # 00000030
lbl_800BFF04:
    lwc1    $f4, 0x0034(a2)            # 00000034
    lh      v0, 0x0008(a2)             # 00000008
    mul.s   $f6, $f18, $f4
    sh      v0, 0x000C(a2)             # 0000000C
    bne     v0, $zero, lbl_800C008C
    swc1    $f6, 0x0030(a2)            # 00000030
    lw      v0, 0x004C(a2)             # 0000004C
    beql    v0, $zero, lbl_800BFF5C
    mtc1    $zero, $f0                 # $f0 = 0.00
    lw      t9, 0x0000(v0)             # 00000000
    lui     $at, 0x4F80                # $at = 4F800000
    lw      t7, 0x0008(t9)             # 00000008
    lw      t8, 0x0004(t7)             # 00000004
    mtc1    t8, $f8                    # $f8 = 0.00
    bgez    t8, lbl_800BFF60
    cvt.s.w $f0, $f8
    mtc1    $at, $f10                  # $f10 = 4294967000.00
    nop
    add.s   $f0, $f0, $f10
    b       lbl_800BFF64
    lhu     t4, 0x0008(t2)             # 00000008
    mtc1    $zero, $f0                 # $f0 = 0.00
lbl_800BFF5C:
    nop
lbl_800BFF60:
    lhu     t4, 0x0008(t2)             # 00000008
lbl_800BFF64:
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f2, -0x6574($at)          # 80109A8C
    mtc1    t4, $f16                   # $f16 = 0.00
    bgez    t4, lbl_800BFF88
    cvt.s.w $f18, $f16
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f18, $f18, $f4
lbl_800BFF88:
    mul.s   $f0, $f0, $f18
    lwc1    $f6, 0x2870(a1)            # 80127EA0
    lwc1    $f8, 0x0030(a2)            # 00000030
    mul.s   $f0, $f0, $f6
    div.s   $f0, $f0, $f8
    c.lt.s  $f2, $f0
    nop
    bc1fl   lbl_800BFFB4
    trunc.w.s $f10, $f0
    mov.s   $f0, $f2
    trunc.w.s $f10, $f0
lbl_800BFFB4:
    lbu     t8, 0x0020(a2)             # 00000020
    sh      $zero, 0x000A(a2)          # 0000000A
    mfc1    t9, $f10
    nop
    addiu   t7, t9, 0x0001             # t7 = 00000001
    beq     t8, $zero, lbl_800C008C
    sh      t7, 0x0008(a2)             # 00000008
    lw      t4, 0x0060($sp)
    lbu     t5, 0x0000(t4)             # 00000000
    andi    t6, t5, 0x0080             # t6 = 00000000
    beql    t6, $zero, lbl_800C0090
    or      v0, t3, $zero              # v0 = 00000000
    lhu     t9, 0x0008(t2)             # 00000008
    lh      t8, 0x2898(a1)             # 80127EC8
    lh      t4, 0x0008(a2)             # 00000008
    sll     t7, t9, 15
    div     $zero, t7, t8
    mflo    v0
    lhu     t5, 0x000E(a2)             # 0000000E
    sll     t9, v0,  8
    bne     t8, $zero, lbl_800C0010
    nop
    break   # 0x01C00
lbl_800C0010:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t8, $at, lbl_800C0028
    lui     $at, 0x8000                # $at = 80000000
    bne     t7, $at, lbl_800C0028
    nop
    break   # 0x01800
lbl_800C0028:
    multu   t4, t5
    lw      t7, 0x0060($sp)
    mflo    t6
    nop
    nop
    div     $zero, t9, t6
    bne     t6, $zero, lbl_800C004C
    nop
    break   # 0x01C00
lbl_800C004C:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t6, $at, lbl_800C0064
    lui     $at, 0x8000                # $at = 80000000
    bne     t9, $at, lbl_800C0064
    nop
    break   # 0x01800
lbl_800C0064:
    mflo    v0
    slti    $at, v0, 0x7FFF
    bne     $at, $zero, lbl_800C007C
    nop
    b       lbl_800C0088
    addiu   v0, $zero, 0x7FFF          # v0 = 00007FFF
lbl_800C007C:
    bgtzl   v0, lbl_800C008C
    sh      v0, 0x0004(t7)             # 00000005
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800C0088:
    sh      v0, 0x0004(t7)             # 00000005
lbl_800C008C:
    or      v0, t3, $zero              # v0 = 00000000
lbl_800C0090:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0078           # $sp += 0x78
    jr      $ra
    nop


func_800C00A0:
# MqDbg: 
    addiu   $sp, $sp, 0xFFC0           # $sp -= 0x40
    sw      $ra, 0x0014($sp)
    sw      a1, 0x0044($sp)
    lw      t0, 0x0050(a0)             # 00000050
    addiu   $at, $zero, 0x00C0         # $at = 000000C0
    or      a2, a0, $zero              # a2 = 00000000
    lw      t6, 0x004C(t0)             # 0000004C
    bne     a1, $at, lbl_800C00F4
    sw      t6, 0x002C($sp)
    addiu   a0, a2, 0x0054             # a0 = 00000054
    jal     func_800BF354
    sw      a2, 0x0040($sp)
    lw      a2, 0x0040($sp)
    lbu     t9, 0x0000(a2)             # 00000000
    sh      v0, 0x0008(a2)             # 00000008
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
    ori     t2, t9, 0x0020             # t2 = 00000020
    andi    t3, t2, 0x00FD             # t3 = 00000020
    sb      t2, 0x0000(a2)             # 00000000
    b       lbl_800C04A4
    sb      t3, 0x0000(a2)             # 00000000
lbl_800C00F4:
    lbu     t4, 0x0000(a2)             # 00000000
    addiu   $at, $zero, 0x0001         # $at = 00000001
    andi    t5, t4, 0xFFDF             # t5 = 00000000
    sb      t5, 0x0000(a2)             # 00000000
    lw      t6, 0x0000(t0)             # 00000000
    lw      a1, 0x0044($sp)
    sll     t7, t6,  6
    srl     t8, t7, 31
    bne     t8, $at, lbl_800C0264
    andi    a1, a1, 0x00C0             # a1 = 00000000
    lw      a1, 0x0044($sp)
    addiu   $at, $zero, 0x0040         # $at = 00000040
    andi    a1, a1, 0x00C0             # a1 = 00000000
    beql    a1, $zero, lbl_800C014C
    addiu   a0, a2, 0x0054             # a0 = 00000054
    beq     a1, $at, lbl_800C01A4
    addiu   $at, $zero, 0x0080         # $at = 00000080
    beql    a1, $at, lbl_800C01F0
    lh      t6, 0x0014(a2)             # 00000014
    b       lbl_800C0220
    lw      a3, 0x0034($sp)
    addiu   a0, a2, 0x0054             # a0 = 00000054
lbl_800C014C:
    sw      a0, 0x001C($sp)
    sw      a1, 0x0018($sp)
    sw      a2, 0x0040($sp)
    jal     func_800BF354
    sw      t0, 0x0030($sp)
    lw      a0, 0x001C($sp)
    sh      v0, 0x003A($sp)
    lw      a2, 0x0040($sp)
    lw      v1, 0x0000(a0)             # 00000000
    lw      a1, 0x0018($sp)
    lw      t0, 0x0030($sp)
    lbu     a3, 0x0000(v1)             # 00000000
    addiu   t9, v1, 0x0001             # t9 = 00000001
    sw      t9, 0x0000(a0)             # 00000000
    lbu     t2, 0x0000(t9)             # 00000001
    or      t1, t9, $zero              # t1 = 00000001
    sb      t2, 0x0003(a2)             # 00000003
    lw      t3, 0x0000(a0)             # 00000000
    addiu   t4, t3, 0x0001             # t4 = 00000001
    sw      t4, 0x0000(a0)             # 00000000
    b       lbl_800C0220
    sh      v0, 0x0014(a2)             # 00000014
lbl_800C01A4:
    addiu   a0, a2, 0x0054             # a0 = 00000054
    sw      a0, 0x001C($sp)
    sw      a1, 0x0018($sp)
    sw      a2, 0x0040($sp)
    jal     func_800BF354
    sw      t0, 0x0030($sp)
    lw      a0, 0x001C($sp)
    sh      v0, 0x003A($sp)
    lw      a2, 0x0040($sp)
    lw      v1, 0x0000(a0)             # 00000000
    lw      a1, 0x0018($sp)
    lw      t0, 0x0030($sp)
    lbu     a3, 0x0000(v1)             # 00000000
    addiu   t5, v1, 0x0001             # t5 = 00000001
    sw      t5, 0x0000(a0)             # 00000000
    sb      $zero, 0x0003(a2)          # 00000003
    b       lbl_800C0220
    sh      v0, 0x0014(a2)             # 00000014
    lh      t6, 0x0014(a2)             # 00000014
lbl_800C01F0:
    addiu   a0, a2, 0x0054             # a0 = 00000054
    sh      t6, 0x003A($sp)
    lw      v1, 0x0000(a0)             # 00000054
    lbu     a3, 0x0000(v1)             # 00000000
    addiu   t7, v1, 0x0001             # t7 = 00000001
    sw      t7, 0x0000(a0)             # 00000054
    lbu     t9, 0x0000(t7)             # 00000001
    or      t8, t7, $zero              # t8 = 00000001
    sb      t9, 0x0003(a2)             # 00000003
    lw      t1, 0x0000(a0)             # 00000054
    addiu   t2, t1, 0x0001             # t2 = 00000001
    sw      t2, 0x0000(a0)             # 00000054
lbl_800C0220:
    slti    $at, a3, 0x0080
    beql    $at, $zero, lbl_800C0238
    addiu   a3, $zero, 0x007F          # a3 = 0000007F
    bgezl   a3, lbl_800C023C
    mtc1    a3, $f4                    # $f4 = 0.00
    addiu   a3, $zero, 0x007F          # a3 = 0000007F
lbl_800C0238:
    mtc1    a3, $f4                    # $f4 = 0.00
lbl_800C023C:
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f8, -0x6570($at)          # 80109A90
    cvt.s.w $f0, $f4
    mul.s   $f6, $f0, $f0
    div.s   $f10, $f6, $f8
    swc1    $f10, 0x003C(a2)           # 0000003C
    lw      t3, 0x0044($sp)
    subu    t4, t3, a1
    b       lbl_800C02D4
    sw      t4, 0x0044($sp)
lbl_800C0264:
    beq     a1, $zero, lbl_800C0288
    addiu   $at, $zero, 0x0040         # $at = 00000040
    beql    a1, $at, lbl_800C02B8
    lh      t5, 0x0012(a2)             # 00000012
    addiu   $at, $zero, 0x0080         # $at = 00000080
    beql    a1, $at, lbl_800C02C4
    lh      t6, 0x0014(a2)             # 00000014
    b       lbl_800C02CC
    lw      t7, 0x0044($sp)
lbl_800C0288:
    addiu   a0, a2, 0x0054             # a0 = 00000054
    sw      a1, 0x0018($sp)
    sw      a2, 0x0040($sp)
    jal     func_800BF354
    sw      t0, 0x0030($sp)
    lw      a2, 0x0040($sp)
    lw      a1, 0x0018($sp)
    lw      t0, 0x0030($sp)
    sh      v0, 0x003A($sp)
    b       lbl_800C02C8
    sh      v0, 0x0014(a2)             # 00000014
    lh      t5, 0x0012(a2)             # 00000012
lbl_800C02B8:
    b       lbl_800C02C8
    sh      t5, 0x003A($sp)
    lh      t6, 0x0014(a2)             # 00000014
lbl_800C02C4:
    sh      t6, 0x003A($sp)
lbl_800C02C8:
    lw      t7, 0x0044($sp)
lbl_800C02CC:
    subu    t8, t7, a1
    sw      t8, 0x0044($sp)
lbl_800C02D4:
    lbu     v1, 0x000D(t0)             # 0000000D
    lui     v0, 0x8012                 # v0 = 80120000
    beql    v1, $zero, lbl_800C0388
    lwc1    $f16, 0x003C(a2)           # 0000003C
    lw      v0, 0x7FAC(v0)             # 80127FAC
    lwc1    $f12, 0x003C(a2)           # 0000003C
    lui     $at, 0x4F80                # $at = 4F800000
    divu    $zero, v0, v1
    mfhi    t9
    mtc1    t9, $f16                   # $f16 = 0.00
    bne     v1, $zero, lbl_800C0308
    nop
    break   # 0x01C00
lbl_800C0308:
    cvt.s.w $f18, $f16
    bgez    t9, lbl_800C0320
    nop
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f18, $f18, $f4
lbl_800C0320:
    mul.s   $f6, $f12, $f18
    lui     $at, 0x42C8                # $at = 42C80000
    mtc1    $at, $f8                   # $f8 = 100.00
    andi    t1, v0, 0x8000             # t1 = 00000000
    beq     t1, $zero, lbl_800C033C
    div.s   $f2, $f6, $f8
    neg.s   $f2, $f2
lbl_800C033C:
    add.s   $f0, $f12, $f2
    mtc1    $zero, $f14                # $f14 = 0.00
    nop
    c.lt.s  $f0, $f14
    swc1    $f0, 0x0038(a2)            # 00000038
    bc1fl   lbl_800C0364
    lui     $at, 0x3F80                # $at = 3F800000
    b       lbl_800C038C
    swc1    $f14, 0x0038(a2)           # 00000038
    lui     $at, 0x3F80                # $at = 3F800000
lbl_800C0364:
    mtc1    $at, $f0                   # $f0 = 1.00
    lwc1    $f10, 0x0038(a2)           # 00000038
    c.lt.s  $f0, $f10
    nop
    bc1fl   lbl_800C0390
    lhu     v0, 0x003A($sp)
    b       lbl_800C038C
    swc1    $f0, 0x0038(a2)            # 00000038
    lwc1    $f16, 0x003C(a2)           # 0000003C
lbl_800C0388:
    swc1    $f16, 0x0038(a2)           # 00000038
lbl_800C038C:
    lhu     v0, 0x003A($sp)
lbl_800C0390:
    lbu     t2, 0x0003(a2)             # 00000003
    sh      v0, 0x0008(a2)             # 00000008
    multu   t2, v0
    lui     v0, 0x8012                 # v0 = 80120000
    mflo    t3
    sra     t4, t3,  8
    sh      t4, 0x000A(a2)             # 0000000A
    lbu     t5, 0x000E(t0)             # 0000000E
    beql    t5, $zero, lbl_800C0438
    lw      t1, 0x002C($sp)
    lw      v0, 0x7FAC(v0)             # 80127FAC
    lbu     t6, 0x000D(t0)             # 0000000D
    lh      v1, 0x000A(a2)             # 0000000A
    addiu   $at, $zero, 0x0064         # $at = 00000064
    divu    $zero, v0, t6
    mfhi    t7
    andi    t8, v0, 0x4000             # t8 = 00000000
    bne     t6, $zero, lbl_800C03E0
    nop
    break   # 0x01C00
lbl_800C03E0:
    multu   v1, t7
    mflo    a0
    nop
    nop
    divu    $zero, a0, $at
    mflo    a0
    beql    t8, $zero, lbl_800C0408
    addu    t9, v1, a0
    subu    a0, $zero, a0
    addu    t9, v1, a0
lbl_800C0408:
    sh      t9, 0x000A(a2)             # 0000000A
    lh      v1, 0x000A(a2)             # 0000000A
    bgezl   v1, lbl_800C0424
    lh      v0, 0x0008(a2)             # 00000008
    b       lbl_800C0434
    sh      $zero, 0x000A(a2)          # 0000000A
    lh      v0, 0x0008(a2)             # 00000008
lbl_800C0424:
    slt     $at, v0, v1
    beql    $at, $zero, lbl_800C0438
    lw      t1, 0x002C($sp)
    sh      v0, 0x000A(a2)             # 0000000A
lbl_800C0434:
    lw      t1, 0x002C($sp)
lbl_800C0438:
    lw      t2, 0x0000(t1)             # 00000000
    sll     t4, t2,  2
    bgezl   t4, lbl_800C045C
    lw      t7, 0x0000(t0)             # 00000000
    lbu     t5, 0x0003(t0)             # 00000003
    andi    t6, t5, 0x0050             # t6 = 00000000
    bnel    t6, $zero, lbl_800C0470
    lbu     t2, 0x0000(a2)             # 00000000
    lw      t7, 0x0000(t0)             # 00000000
lbl_800C045C:
    lw      t4, 0x002C($sp)
    sll     t9, t7,  3
    bgezl   t9, lbl_800C0484
    lw      t5, 0x00DC(t4)             # 000000DC
    lbu     t2, 0x0000(a2)             # 00000000
lbl_800C0470:
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
    ori     t3, t2, 0x0020             # t3 = 00000020
    b       lbl_800C04A4
    sb      t3, 0x0000(a2)             # 00000000
    lw      t5, 0x00DC(t4)             # 000000DC
lbl_800C0484:
    lw      v0, 0x0044($sp)
    beq     t5, $zero, lbl_800C04A4
    nop
    lbu     t7, 0x0000(a2)             # 00000000
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
    ori     t8, t7, 0x0020             # t8 = 00000020
    b       lbl_800C04A4
    sb      t8, 0x0000(a2)             # 00000000
lbl_800C04A4:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0040           # $sp += 0x40
    jr      $ra
    nop


func_800C04B4:
# MqDbg: 
    andi    v0, a1, 0x00FF             # v0 = 00000000
    andi    v1, v0, 0x000F             # v1 = 00000000
    beq     v1, $zero, lbl_800C04C8
    sw      a1, 0x0004($sp)
    sb      v1, 0x0005(a0)             # 00000005
lbl_800C04C8:
    sra     a1, v0,  4
    andi    a1, a1, 0x00FF             # a1 = 00000000
    beq     a1, $zero, lbl_800C04DC
    nop
    sb      a1, 0x0006(a0)             # 00000006
lbl_800C04DC:
    jr      $ra
    nop


func_800C04E4:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a1, 0x0024($sp)
    lbu     a1, 0x0027($sp)
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0020($sp)
    sw      a2, 0x0028($sp)
    sw      a3, 0x002C($sp)
    lbu     a0, 0x0007(a0)             # 00000007
    jal     func_800BCA58
    sw      a1, 0x0018($sp)
    lw      a1, 0x0018($sp)
    lw      a2, 0x0028($sp)
    lw      a3, 0x002C($sp)
    bne     v0, $zero, lbl_800C052C
    or      v1, v0, $zero              # v1 = 00000000
    sw      $zero, 0x0000(a2)          # 00000000
    b       lbl_800C0548
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800C052C:
    lw      t7, 0x0004(v1)             # 00000004
    addiu   a0, a1, 0x0002             # a0 = 00000002
    andi    v0, a0, 0x00FF             # v0 = 00000002
    sw      t7, 0x0004(a3)             # 00000004
    lbu     t8, 0x0003(v1)             # 00000003
    sb      t8, 0x0000(a3)             # 00000000
    sw      v1, 0x0000(a2)             # 00000000
lbl_800C0548:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C0558:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      a1, 0x001C($sp)
    andi    a1, a1, 0x00FF             # a1 = 00000000
    slti    $at, a1, 0x0080
    sw      $ra, 0x0014($sp)
    bne     $at, $zero, lbl_800C0580
    or      v0, a1, $zero              # v0 = 00000000
    sh      v0, 0x0024(a0)             # 00000024
    b       lbl_800C05E8
    sw      $zero, 0x0048(a0)          # 00000048
lbl_800C0580:
    addiu   $at, $zero, 0x007F         # $at = 0000007F
    bne     v0, $at, lbl_800C0598
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    sh      $zero, 0x0024(a0)          # 00000024
    b       lbl_800C05E8
    sw      t6, 0x0048(a0)             # 00000048
lbl_800C0598:
    addiu   $at, $zero, 0x007E         # $at = 0000007E
    bne     v0, $at, lbl_800C05B8
    addiu   a2, a0, 0x0048             # a2 = 00000048
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    addiu   t8, $zero, 0x0002          # t8 = 00000002
    sh      t7, 0x0024(a0)             # 00000024
    b       lbl_800C05E8
    sw      t8, 0x0048(a0)             # 00000048
lbl_800C05B8:
    addiu   a3, a0, 0x007C             # a3 = 0000007C
    jal     func_800C04E4
    sw      a0, 0x0018($sp)
    lw      a0, 0x0018($sp)
    sll     t9, v0, 16
    sra     t0, t9, 16
    bne     t0, $zero, lbl_800C05E8
    sh      v0, 0x0024(a0)             # 00000024
    lbu     t1, 0x0000(a0)             # 00000000
    andi    t2, t1, 0xFFF7             # t2 = 00000000
    b       lbl_800C05F4
    sb      t2, 0x0000(a0)             # 00000000
lbl_800C05E8:
    lbu     t4, 0x0000(a0)             # 00000000
    ori     t5, t4, 0x0008             # t5 = 00000008
    sb      t5, 0x0000(a0)             # 00000000
lbl_800C05F4:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C0604:
# MqDbg: 
    sw      a1, 0x0004($sp)
    andi    a1, a1, 0x00FF             # a1 = 00000000
    mtc1    a1, $f4                    # $f4 = 0.00
    lui     $at, 0x42FE                # $at = 42FE0000
    mtc1    $at, $f8                   # $f8 = 127.00
    cvt.s.w $f6, $f4
    div.s   $f10, $f6, $f8
    jr      $ra
    swc1    $f10, 0x002C(a0)           # 0000002C


func_800C0628:
# MqDbg: 
# Audio, related to playing the Ocarina
# A0 = ptr to some struct
    addiu   $sp, $sp, 0xFF78           # $sp -= 0x88
    sw      $ra, 0x003C($sp)
    sw      s8, 0x0038($sp)
    sw      s7, 0x0034($sp)
    sw      s6, 0x0030($sp)
    sw      s5, 0x002C($sp)
    sw      s4, 0x0028($sp)
    sw      s3, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    lw      t6, 0x0000(a0)             # 00000000
    or      s4, a0, $zero              # s4 = 00000000
    sll     t8, t6,  2
    bgezl   t8, lbl_800C0674
    lw      s7, 0x004C(s4)             # 0000004C
    b       lbl_800C12C0
    or      s0, $zero, $zero           # s0 = 00000000
    lw      s7, 0x004C(s4)             # 0000004C
lbl_800C0674:
    lw      t9, 0x0000(s7)             # 00000000
    sll     t1, t9,  2
    bgezl   t1, lbl_800C0698
    lhu     v1, 0x001E(s4)             # 0000001E
    lbu     t2, 0x0003(s4)             # 00000003
    andi    t3, t2, 0x0080             # t3 = 00000000
    bnel    t3, $zero, lbl_800C12EC
    lw      $ra, 0x003C($sp)
    lhu     v1, 0x001E(s4)             # 0000001E
lbl_800C0698:
    addiu   s6, s4, 0x0060             # s6 = 00000060
    slti    $at, v1, 0x0002
    bne     $at, $zero, lbl_800C06B0
    addiu   t4, v1, 0xFFFF             # t4 = FFFFFFFF
    b       lbl_800C12BC
    sh      t4, 0x001E(s4)             # 0000001E
lbl_800C06B0:
    addiu   s8, $zero, 0xFFFF          # s8 = FFFFFFFF
lbl_800C06B4:
    jal     func_800BF308
    or      a0, s6, $zero              # a0 = 00000060
    slti    $at, v0, 0x00B0
    andi    s2, v0, 0x00FF             # s2 = 00000000
    bne     $at, $zero, lbl_800C0FEC
    or      a0, v0, $zero              # a0 = 00000000
    lui     v1, 0x8010                 # v1 = 80100000
    addu    v1, v1, a0
    lbu     v1, 0x1780(v1)             # 80101780
    addiu   s0, $sp, 0x0060            # s0 = FFFFFFD8
    andi    a1, v1, 0x0003             # a1 = 00000000
    andi    t5, a1, 0x00FF             # t5 = 00000000
    blez    t5, lbl_800C0734
    andi    s5, a1, 0x00FF             # s5 = 00000000
    sll     t7, s5,  2
    addu    s3, t7, s0
lbl_800C06F4:
    andi    t8, v1, 0x0080             # t8 = 00000000
    bne     t8, $zero, lbl_800C0710
    or      s1, v1, $zero              # s1 = 80100000
    jal     func_800BF308
    or      a0, s6, $zero              # a0 = 00000060
    b       lbl_800C071C
    sw      v0, 0x0000(s0)             # FFFFFFD8
lbl_800C0710:
    jal     func_800BF31C
    or      a0, s6, $zero              # a0 = 00000060
    sw      v0, 0x0000(s0)             # FFFFFFD8
lbl_800C071C:
    addiu   s0, s0, 0x0004             # s0 = FFFFFFDC
    sltu    $at, s0, s3
    sll     v1, s1,  1
    bne     $at, $zero, lbl_800C06F4
    andi    v1, v1, 0x00FF             # v1 = 00000000
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800C0734:
    slti    $at, s2, 0x00F2
    bne     $at, $zero, lbl_800C077C
    or      s0, s2, $zero              # s0 = 00000000
    or      a0, s7, $zero              # a0 = 00000000
    or      a1, s6, $zero              # a1 = 00000060
    or      a2, s0, $zero              # a2 = 00000000
    jal     func_800BE968
    lw      a3, 0x0060($sp)
    beq     v0, $zero, lbl_800C06B4
    nop
    bne     v0, s8, lbl_800C0774
    nop
    jal     func_800BEE88
    or      a0, s4, $zero              # a0 = 00000000
    b       lbl_800C12C0
    or      s0, $zero, $zero           # s0 = 00000000
lbl_800C0774:
    b       lbl_800C12BC
    sh      v0, 0x001E(s4)             # 0000001E
lbl_800C077C:
    addiu   t9, s0, 0xFF50             # t9 = FFFFFF50
    sltiu   $at, t9, 0x0042
    beq     $at, $zero, lbl_800C06B4
    sll     t9, t9,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t9
    lw      t9, -0x656C($at)           # 80109A94
    jr      t9
    nop
    lbu     t1, 0x0000(s4)             # 00000000
    ori     t2, t1, 0x0020             # t2 = 00000020
    b       lbl_800C12BC
    sb      t2, 0x0000(s4)             # 00000000
    addiu   s0, s4, 0x0084             # s0 = 00000084
    jal     func_800BD3C0
    or      a0, s0, $zero              # a0 = 00000084
    lbu     a1, 0x0063($sp)
    jal     func_800BD520
    or      a0, s0, $zero              # a0 = 00000084
    b       lbl_800C06B4
    nop
    jal     func_800BD3C0
    addiu   a0, s4, 0x0084             # a0 = 00000084
    b       lbl_800C06B4
    nop
    lhu     s1, 0x0062($sp)
    lw      t3, 0x0018(s7)             # 00000018
    addu    t4, t3, s1
    b       lbl_800C06B4
    sw      t4, 0x003C(s4)             # 0000003C
    lb      v0, 0x0019(s6)             # 00000079
    beq     s8, v0, lbl_800C06B4
    nop
    lw      t5, 0x003C(s4)             # 0000003C
    sll     t7, v0,  1
    lw      t0, 0x0018(s7)             # 00000018
    addu    s0, t5, t7
    lbu     t8, 0x0000(s0)             # 00000084
    lbu     t6, 0x0001(s0)             # 00000085
    sll     t9, t8,  8
    addu    s1, t6, t9
    andi    s1, s1, 0xFFFF             # s1 = 00000000
    addu    t1, t0, s1
    b       lbl_800C06B4
    sw      t1, 0x003C(s4)             # 0000003C
    lbu     t3, 0x0005(s7)             # 00000005
    lbu     t2, 0x0063($sp)
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    beq     t3, $at, lbl_800C0874
    or      s2, t2, $zero              # s2 = 00000000
    lbu     t4, 0x0004(s7)             # 00000004
    lui     v0, 0x8012                 # v0 = 80120000
    lw      v0, 0x7E6C(v0)             # 80127E6C
    sll     t5, t4,  1
    addu    t7, v0, t5
    lhu     s1, 0x0000(t7)             # 00000000
    addu    t8, s1, v0
    lbu     s5, 0x0000(t8)             # 00000000
    addu    t6, s1, s5
    subu    t9, t6, t2
    addu    t0, t9, v0
    lbu     s2, 0x0000(t0)             # 00000000
lbl_800C0874:
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    addiu   a1, $zero, 0x0002          # a1 = 00000002
    jal     func_800B4634
    or      a2, s2, $zero              # a2 = 00000000
    beql    v0, $zero, lbl_800C0894
    lw      t1, 0x0064($sp)
    sb      s2, 0x0007(s4)             # 00000007
    lw      t1, 0x0064($sp)
lbl_800C0894:
    sw      t1, 0x0060($sp)
    lbu     a1, 0x0063($sp)
    jal     func_800C0558
    or      a0, s4, $zero              # a0 = 00000000
    b       lbl_800C06B4
    nop
    lbu     t3, 0x0000(s4)             # 00000000
    andi    t4, t3, 0xFFFD             # t4 = 00000000
    b       lbl_800C06B4
    sb      t4, 0x0000(s4)             # 00000000
    lbu     t7, 0x0000(s4)             # 00000000
    ori     t8, t7, 0x0002             # t8 = 00000002
    b       lbl_800C06B4
    sb      t8, 0x0000(s4)             # 00000000
    lbu     a1, 0x0063($sp)
    jal     func_800C0604
    or      a0, s4, $zero              # a0 = 00000000
    lbu     t2, 0x0001(s4)             # 00000001
    ori     t9, t2, 0x0040             # t9 = 00000040
    b       lbl_800C06B4
    sb      t9, 0x0001(s4)             # 00000001
    lbu     s2, 0x0063($sp)
    lui     $at, 0x3C00                # $at = 3C000000
    mtc1    $at, $f8                   # $f8 = 0.01
    mtc1    s2, $f4                    # $f4 = 0.00
    lbu     t1, 0x0001(s4)             # 00000001
    cvt.s.w $f6, $f4
    ori     t3, t1, 0x0040             # t3 = 00000040
    sb      t3, 0x0001(s4)             # 00000001
    mul.s   $f10, $f6, $f8
    b       lbl_800C06B4
    swc1    $f10, 0x0028(s4)           # 00000028
    lhu     s1, 0x0062($sp)
    lui     $at, 0x4700                # $at = 47000000
    mtc1    $at, $f4                   # $f4 = 32768.00
    mtc1    s1, $f16                   # $f16 = 0.00
    lbu     t5, 0x0001(s4)             # 00000001
    cvt.s.w $f18, $f16
    ori     t7, t5, 0x0080             # t7 = 00000080
    sb      t7, 0x0001(s4)             # 00000001
    div.s   $f6, $f18, $f4
    b       lbl_800C06B4
    swc1    $f6, 0x0038(s4)            # 00000038
    lbu     s2, 0x0063($sp)
    lbu     t2, 0x0001(s4)             # 00000001
    lui     $at, 0x8010                # $at = 80100000
    addiu   s2, s2, 0x0080             # s2 = 00000080
    andi    s2, s2, 0x00FF             # s2 = 00000080
    sll     t8, s2,  2
    addu    $at, $at, t8
    lwc1    $f8, 0x03C4($at)           # 801003C4
    ori     t9, t2, 0x0080             # t9 = 00000080
    sb      t9, 0x0001(s4)             # 00000001
    b       lbl_800C06B4
    swc1    $f8, 0x0038(s4)            # 00000038
    lbu     s2, 0x0063($sp)
    lbu     t3, 0x0001(s4)             # 00000001
    lui     $at, 0x8010                # $at = 80100000
    addiu   s2, s2, 0x0080             # s2 = 00000100
    andi    s2, s2, 0x00FF             # s2 = 00000000
    sll     t0, s2,  2
    addu    $at, $at, t0
    lwc1    $f10, 0x07C4($at)          # 801007C4
    ori     t4, t3, 0x0080             # t4 = 000000C0
    sb      t4, 0x0001(s4)             # 00000001
    b       lbl_800C06B4
    swc1    $f10, 0x0038(s4)           # 00000038
    lbu     t7, 0x0001(s4)             # 00000001
    lbu     s2, 0x0063($sp)
    ori     t8, t7, 0x0020             # t8 = 000000A0
    sb      t8, 0x0001(s4)             # 00000001
    b       lbl_800C06B4
    sb      s2, 0x000A(s4)             # 0000000A
    lbu     t2, 0x0001(s4)             # 00000001
    lbu     s2, 0x0063($sp)
    ori     t9, t2, 0x0020             # t9 = 00000020
    sb      t9, 0x0001(s4)             # 00000001
    b       lbl_800C06B4
    sb      s2, 0x000B(s4)             # 0000000B
    lb      v0, 0x0063($sp)
    b       lbl_800C06B4
    sh      v0, 0x0026(s4)             # 00000026
    lhu     s1, 0x0062($sp)
    lw      t0, 0x0018(s7)             # 00000018
    addu    t1, t0, s1
    b       lbl_800C06B4
    sw      t1, 0x0080(s4)             # 00000080
    lbu     s2, 0x0063($sp)
    b       lbl_800C06B4
    sb      s2, 0x007C(s4)             # 0000007C
    lbu     s2, 0x0063($sp)
    sh      $zero, 0x0012(s4)          # 00000012
    sh      $zero, 0x001A(s4)          # 0000001A
    sll     t3, s2,  3
    b       lbl_800C06B4
    sh      t3, 0x0016(s4)             # 00000016
    lbu     s2, 0x0063($sp)
    sh      $zero, 0x0018(s4)          # 00000018
    sll     v0, s2,  5
    sh      v0, 0x0014(s4)             # 00000014
    b       lbl_800C06B4
    sh      v0, 0x0010(s4)             # 00000010
    lbu     s2, 0x0063($sp)
    sll     t4, s2,  3
    sh      t4, 0x0012(s4)             # 00000012
    lbu     s2, 0x0067($sp)
    sll     t5, s2,  3
    sh      t5, 0x0016(s4)             # 00000016
    lbu     s2, 0x006B($sp)
    sll     t7, s2,  4
    b       lbl_800C06B4
    sh      t7, 0x001A(s4)             # 0000001A
    lbu     s2, 0x0063($sp)
    sll     t8, s2,  5
    sh      t8, 0x0010(s4)             # 00000010
    lbu     s2, 0x0067($sp)
    sll     t6, s2,  5
    sh      t6, 0x0014(s4)             # 00000014
    lbu     s2, 0x006B($sp)
    sll     t2, s2,  4
    b       lbl_800C06B4
    sh      t2, 0x0018(s4)             # 00000018
    lbu     s2, 0x0063($sp)
    sll     t9, s2,  4
    b       lbl_800C06B4
    sh      t9, 0x001C(s4)             # 0000001C
    lbu     s2, 0x0063($sp)
    b       lbl_800C06B4
    sb      s2, 0x0004(s4)             # 00000004
    lbu     t1, 0x0005(s7)             # 00000005
    lbu     t0, 0x0063($sp)
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    beq     t1, $at, lbl_800C0ADC
    or      s2, t0, $zero              # s2 = 00000000
    lbu     t3, 0x0004(s7)             # 00000004
    lui     v0, 0x8012                 # v0 = 80120000
    lw      v0, 0x7E6C(v0)             # 80127E6C
    sll     t4, t3,  1
    addu    t5, v0, t4
    lhu     s1, 0x0000(t5)             # 00000000
    addu    t7, s1, v0
    lbu     s5, 0x0000(t7)             # 00000080
    addu    t8, s1, s5
    subu    t6, t8, t0
    addu    t2, t6, v0
    lbu     s2, 0x0000(t2)             # 00000000
lbl_800C0ADC:
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    addiu   a1, $zero, 0x0002          # a1 = 00000002
    jal     func_800B4634
    or      a2, s2, $zero              # a2 = 00000000
    beq     v0, $zero, lbl_800C06B4
    nop
    b       lbl_800C06B4
    sb      s2, 0x0007(s4)             # 00000007
    lbu     s2, 0x0063($sp)
    lhu     s1, 0x0066($sp)
    lw      t9, 0x0018(s7)             # 00000018
    lbu     t1, 0x0019(s6)             # 00000079
    addu    v0, t9, s1
    addu    t3, t1, s2
    b       lbl_800C06B4
    sb      t3, 0x0000(v0)             # 00000000
    addiu   $at, $zero, 0x00C8         # $at = 000000C8
    bne     s0, $at, lbl_800C0B38
    lb      v0, 0x0063($sp)
    lb      t4, 0x0019(s6)             # 00000079
    subu    t5, t4, v0
    b       lbl_800C06B4
    sb      t5, 0x0019(s6)             # 00000079
lbl_800C0B38:
    addiu   $at, $zero, 0x00CC         # $at = 000000CC
    bnel    s0, $at, lbl_800C0B50
    lb      t7, 0x0019(s6)             # 00000079
    b       lbl_800C06B4
    sb      v0, 0x0019(s6)             # 00000079
    lb      t7, 0x0019(s6)             # 00000079
lbl_800C0B50:
    and     t8, t7, v0
    b       lbl_800C06B4
    sb      t8, 0x0019(s6)             # 00000079
    lbu     s2, 0x0063($sp)
    sll     t0, s2,  2
    addu    t6, s7, t0
    jal     func_800BEE88
    lw      a0, 0x0038(t6)             # 00000038
    b       lbl_800C06B4
    nop
    lbu     t9, 0x0001(s4)             # 00000001
    lbu     s2, 0x0063($sp)
    ori     t1, t9, 0x0040             # t1 = 00000040
    sb      t1, 0x0001(s4)             # 00000001
    b       lbl_800C06B4
    sb      s2, 0x0003(s4)             # 00000003
    lhu     s1, 0x0062($sp)
    lb      t4, 0x0019(s6)             # 00000079
    lw      t3, 0x0018(s7)             # 00000018
    addu    t5, s1, t4
    addu    t7, t3, t5
    lbu     t8, 0x0000(t7)             # 00000000
    b       lbl_800C06B4
    sb      t8, 0x0019(s6)             # 00000079
    lhu     s1, 0x0062($sp)
    b       lbl_800C06B4
    sh      s1, 0x0022(s4)             # 00000022
    lhu     s1, 0x0062($sp)
    lw      t0, 0x0018(s7)             # 00000018
    lhu     t6, 0x0022(s4)             # 00000022
    addu    v0, t0, s1
    sra     t9, t6,  8
    sb      t9, 0x0000(v0)             # 00000000
    lhu     t4, 0x0022(s4)             # 00000022
    b       lbl_800C06B4
    sb      t4, 0x0001(v0)             # 00000001
    lbu     s0, 0x0063($sp)
    andi    t3, s0, 0x0080             # t3 = 00000080
    beq     t3, $zero, lbl_800C0C00
    andi    t2, s0, 0x007F             # t2 = 00000004
    lbu     t7, 0x0000(s4)             # 00000000
    ori     t8, t7, 0x0004             # t8 = 00000004
    b       lbl_800C0C0C
    sb      t8, 0x0000(s4)             # 00000000
lbl_800C0C00:
    lbu     t0, 0x0000(s4)             # 00000000
    andi    t6, t0, 0xFFFB             # t6 = 00000000
    sb      t6, 0x0000(s4)             # 00000000
lbl_800C0C0C:
    b       lbl_800C06B4
    sb      t2, 0x00D0(s4)             # 000000D0
    lbu     s2, 0x0063($sp)
    b       lbl_800C06B4
    sb      s2, 0x0002(s4)             # 00000002
    lbu     s2, 0x0063($sp)
    b       lbl_800C06B4
    sb      s2, 0x007D(s4)             # 0000007D
    lbu     s2, 0x0063($sp)
    b       lbl_800C06B4
    sb      s2, 0x0008(s4)             # 00000008
    lb      v0, 0x0019(s6)             # 00000079
    beq     s8, v0, lbl_800C06B4
    nop
    lbu     t3, 0x0018(s6)             # 00000078
    lw      t4, 0x0000(s6)             # 00000060
    lw      t9, 0x003C(s4)             # 0000003C
    sll     t5, t3,  2
    addu    t7, s6, t5
    sw      t4, 0x0004(t7)             # 00000004
    lbu     t8, 0x0018(s6)             # 00000078
    sll     t1, v0,  1
    addu    s0, t9, t1
    addiu   t0, t8, 0x0001             # t0 = 00000005
    sb      t0, 0x0018(s6)             # 00000078
    lbu     t2, 0x0000(s0)             # 00000084
    lbu     t6, 0x0001(s0)             # 00000085
    lw      t1, 0x0018(s7)             # 00000018
    sll     t9, t2,  8
    addu    s1, t6, t9
    andi    s1, s1, 0xFFFF             # s1 = 00000000
    addu    t3, t1, s1
    b       lbl_800C06B4
    sw      t3, 0x0000(s6)             # 00000060
    lbu     s2, 0x0063($sp)
    b       lbl_800C06B4
    sb      s2, 0x0009(s4)             # 00000009
    lhu     s1, 0x0062($sp)
    lw      t5, 0x0018(s7)             # 00000018
    or      a0, s4, $zero              # a0 = 00000000
    addu    s0, t5, s1
    lbu     t4, 0x0000(s0)             # 00000084
    addiu   s0, s0, 0x0003             # s0 = 00000087
    sb      t4, 0x0003(s4)             # 00000003
    lbu     t7, -0x0002(s0)            # 00000085
    sb      t7, 0x0002(s4)             # 00000002
    jal     func_800C04B4
    lbu     a1, -0x0001(s0)            # 00000086
    lb      t8, 0x0000(s0)             # 00000087
    lbu     t3, 0x0001(s4)             # 00000001
    addiu   s0, s0, 0x0004             # s0 = 0000008B
    sh      t8, 0x0026(s4)             # 00000026
    lbu     t0, -0x0003(s0)            # 00000088
    ori     t5, t3, 0x0020             # t5 = 00000020
    sb      t0, 0x000A(s4)             # 0000000A
    lbu     t2, -0x0002(s0)            # 00000089
    sb      t2, 0x000B(s4)             # 0000000B
    lbu     t6, -0x0001(s0)            # 0000008A
    sb      t6, 0x0004(s4)             # 00000004
    lbu     t9, 0x0000(s0)             # 0000008B
    sb      t5, 0x0001(s4)             # 00000001
    b       lbl_800C06B4
    sb      t9, 0x0008(s4)             # 00000008
    lw      t4, 0x0060($sp)
    or      a0, s4, $zero              # a0 = 00000000
    sb      t4, 0x0003(s4)             # 00000003
    lw      t7, 0x0064($sp)
    sb      t7, 0x0002(s4)             # 00000002
    jal     func_800C04B4
    lbu     a1, 0x006B($sp)
    jal     func_800BF308
    or      a0, s6, $zero              # a0 = 00000060
    sll     t8, v0, 24
    sra     t0, t8, 24
    sh      t0, 0x0026(s4)             # 00000026
    jal     func_800BF308
    or      a0, s6, $zero              # a0 = 00000060
    sb      v0, 0x000A(s4)             # 0000000A
    jal     func_800BF308
    or      a0, s6, $zero              # a0 = 00000060
    sb      v0, 0x000B(s4)             # 0000000B
    jal     func_800BF308
    or      a0, s6, $zero              # a0 = 00000060
    sb      v0, 0x0004(s4)             # 00000004
    jal     func_800BF308
    or      a0, s6, $zero              # a0 = 00000060
    lbu     t6, 0x0001(s4)             # 00000001
    sb      v0, 0x0008(s4)             # 00000008
    ori     t9, t6, 0x0020             # t9 = 00000020
    b       lbl_800C06B4
    sb      t9, 0x0001(s4)             # 00000001
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f16                  # $f16 = 1.00
    sh      $zero, 0x0016(s4)          # 00000016
    sh      $zero, 0x0012(s4)          # 00000012
    sh      $zero, 0x001A(s4)          # 0000001A
    sh      $zero, 0x0014(s4)          # 00000014
    sh      $zero, 0x0010(s4)          # 00000010
    sh      $zero, 0x0018(s4)          # 00000018
    sw      $zero, 0x00CC(s4)          # 000000CC
    sb      $zero, 0x000C(s4)          # 0000000C
    sb      $zero, 0x007D(s4)          # 0000007D
    sb      $zero, 0x000D(s4)          # 0000000D
    sb      $zero, 0x000E(s4)          # 0000000E
    sb      $zero, 0x000F(s4)          # 0000000F
    sh      $zero, 0x0020(s4)          # 00000020
    sb      $zero, 0x0009(s4)          # 00000009
    b       lbl_800C06B4
    swc1    $f16, 0x0038(s4)           # 00000038
    or      a0, s4, $zero              # a0 = 00000000
    jal     func_800C04B4
    lbu     a1, 0x0063($sp)
    b       lbl_800C06B4
    nop
    lbu     s2, 0x0063($sp)
    b       lbl_800C06B4
    sb      s2, 0x000C(s4)             # 0000000C
    lhu     s1, 0x0062($sp)
    lw      t1, 0x0018(s7)             # 00000018
    addu    s0, t1, s1
    b       lbl_800C06B4
    sw      s0, 0x00CC(s4)             # 000000CC
    b       lbl_800C06B4
    sw      $zero, 0x00CC(s4)          # 000000CC
    lw      a0, 0x00CC(s4)             # 000000CC
    lbu     s2, 0x0063($sp)
    beq     a0, $zero, lbl_800C06B4
    sra     s5, s2,  4
    or      s0, s2, $zero              # s0 = 00000000
    andi    s5, s5, 0x000F             # s5 = 00000000
    andi    s2, s2, 0x000F             # s2 = 00000000
    andi    a1, s5, 0x00FF             # a1 = 00000000
    jal     func_800B4C48
    andi    a2, s2, 0x00FF             # a2 = 00000000
    b       lbl_800C06B4
    nop
    lb      t5, 0x0019(s6)             # 00000079
    lhu     s1, 0x0062($sp)
    lw      t3, 0x0018(s7)             # 00000018
    sll     t4, t5,  1
    addu    t7, s1, t4
    addu    t8, t3, t7
    lhu     t0, 0x0000(t8)             # 00000000
    b       lbl_800C06B4
    sh      t0, 0x0022(s4)             # 00000022
    lw      t2, 0x0018(s7)             # 00000018
    lhu     t6, 0x0022(s4)             # 00000022
    addu    t9, t2, t6
    b       lbl_800C06B4
    sw      t9, 0x003C(s4)             # 0000003C
    lb      t5, 0x0019(s6)             # 00000079
    lw      t1, 0x003C(s4)             # 0000003C
    sll     t4, t5,  1
    addu    t3, t1, t4
    lhu     t7, 0x0000(t3)             # 00000000
    b       lbl_800C06B4
    sh      t7, 0x0022(s4)             # 00000022
    lw      t8, 0x003C(s4)             # 0000003C
    lb      t0, 0x0019(s6)             # 00000079
    addu    t2, t8, t0
    lbu     t6, 0x0000(t2)             # 00000000
    b       lbl_800C06B4
    sb      t6, 0x0019(s6)             # 00000079
    lw      t9, 0x0060($sp)
    lui     t4, 0x8012                 # t4 = 80120000
    lw      t3, 0x0060($sp)
    bne     t9, $zero, lbl_800C0EBC
    nop
    lui     t5, 0x8012                 # t5 = 80120000
    lw      t1, 0x7FAC(t5)             # 80127FAC
    b       lbl_800C06B4
    sh      t1, 0x0022(s4)             # 00000022
lbl_800C0EBC:
    lw      t4, 0x7FAC(t4)             # 80127FAC
    divu    $zero, t4, t3
    mfhi    t7
    sh      t7, 0x0022(s4)             # 00000022
    bne     t3, $zero, lbl_800C0ED8
    nop
    break   # 0x01C00
lbl_800C0ED8:
    b       lbl_800C06B4
    nop
    lw      t8, 0x0060($sp)
    lui     t6, 0x8012                 # t6 = 80120000
    lw      t9, 0x0060($sp)
    bne     t8, $zero, lbl_800C0F04
    nop
    lui     t0, 0x8012                 # t0 = 80120000
    lw      t2, 0x7FAC(t0)             # 80127FAC
    b       lbl_800C06B4
    sb      t2, 0x0019(s6)             # 00000079
lbl_800C0F04:
    lw      t6, 0x7FAC(t6)             # 80127FAC
    divu    $zero, t6, t9
    mfhi    t5
    sb      t5, 0x0019(s6)             # 00000079
    bne     t9, $zero, lbl_800C0F20
    nop
    break   # 0x01C00
lbl_800C0F20:
    b       lbl_800C06B4
    nop
    jal     func_800BBD80
    nop
    lw      t1, 0x0060($sp)
    lw      t3, 0x0060($sp)
    bne     t1, $zero, lbl_800C0F48
    nop
    b       lbl_800C0F60
    sh      v0, 0x0022(s4)             # 00000022
lbl_800C0F48:
    divu    $zero, v0, t3
    mfhi    t7
    sh      t7, 0x0022(s4)             # 00000022
    bne     t3, $zero, lbl_800C0F60
    nop
    break   # 0x01C00
lbl_800C0F60:
    lhu     t8, 0x0022(s4)             # 00000022
    lw      t0, 0x0064($sp)
    addu    t2, t8, t0
    andi    v0, t2, 0xFFFF             # v0 = 00000000
    sh      t2, 0x0022(s4)             # 00000022
    bgez    v0, lbl_800C0F84
    sra     v1, v0,  8
    addiu   $at, v0, 0x00FF            # $at = 000000FF
    sra     v1, $at,  8
lbl_800C0F84:
    addiu   v1, v1, 0x0080             # v1 = 00000080
    bgez    v0, lbl_800C0F9C
    andi    a0, v0, 0x00FF             # a0 = 00000000
    beq     a0, $zero, lbl_800C0F9C
    nop
    addiu   a0, a0, 0xFF00             # a0 = FFFFFF00
lbl_800C0F9C:
    sll     t6, v1,  8
    or      t9, t6, a0                 # t9 = FFFFFF00
    b       lbl_800C06B4
    sh      t9, 0x0022(s4)             # 00000022
    lw      t5, 0x0060($sp)
    b       lbl_800C06B4
    sb      t5, 0x000D(s4)             # 0000000D
    lw      t1, 0x0060($sp)
    b       lbl_800C06B4
    sb      t1, 0x000E(s4)             # 0000000E
    lw      t4, 0x0060($sp)
    sb      t4, 0x000F(s4)             # 0000000F
    lw      t3, 0x0064($sp)
    b       lbl_800C06B4
    sh      t3, 0x0020(s4)             # 00000020
    lhu     t7, 0x0022(s4)             # 00000022
    lw      t8, 0x0060($sp)
    addu    t0, t7, t8
    b       lbl_800C06B4
    sh      t0, 0x0022(s4)             # 00000022
lbl_800C0FEC:
    slti    $at, a0, 0x0070
    bne     $at, $zero, lbl_800C1168
    andi    a1, a0, 0x000F             # a1 = 00000000
    andi    a1, a0, 0x0007             # a1 = 00000000
    andi    v1, a0, 0x00F8             # v1 = 00000000
    addiu   $at, $zero, 0x0070         # $at = 00000070
    beq     v1, $at, lbl_800C1020
    andi    s5, a1, 0x00FF             # s5 = 00000000
    andi    t2, a1, 0x00FF             # t2 = 00000000
    slti    $at, t2, 0x0004
    bnel    $at, $zero, lbl_800C1024
    addiu   t6, v1, 0xFF90             # t6 = FFFFFF90
    or      s5, $zero, $zero           # s5 = 00000000
lbl_800C1020:
    addiu   t6, v1, 0xFF90             # t6 = FFFFFF90
lbl_800C1024:
    sltiu   $at, t6, 0x0029
    beq     $at, $zero, lbl_800C06B4
    sll     t6, t6,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t6
    lw      t6, -0x6464($at)           # 80109B9C
    jr      t6
    nop
    sll     t9, s5,  2
    addu    t5, s4, t9
    lw      v0, 0x0050(t5)             # 00000050
    beq     v0, $zero, lbl_800C106C
    nop
    lw      t1, 0x0000(v0)             # 00000000
    sll     t4, t1,  1
    srl     t3, t4, 31
    b       lbl_800C06B4
    sb      t3, 0x0019(s6)             # 00000079
lbl_800C106C:
    b       lbl_800C06B4
    sb      s8, 0x0019(s6)             # 00000079
    jal     func_800BF31C
    or      a0, s6, $zero              # a0 = 00000060
    andi    s1, v0, 0xFFFF             # s1 = 00000000
    or      a0, s4, $zero              # a0 = 00000000
    jal     func_800BEC98
    or      a1, s5, $zero              # a1 = 00000000
    bne     v0, $zero, lbl_800C06B4
    sll     t0, s5,  2
    lw      t7, 0x0018(s7)             # 00000018
    addu    t2, s4, t0
    lw      t6, 0x0050(t2)             # 00000050
    addu    t8, t7, s1
    b       lbl_800C06B4
    sw      t8, 0x0054(t6)             # 00000054
    or      a0, s4, $zero              # a0 = 00000000
    jal     func_800BEE38
    or      a1, s5, $zero              # a1 = 00000000
    b       lbl_800C06B4
    nop
    lb      t9, 0x0019(s6)             # 00000079
    or      a0, s4, $zero              # a0 = 00000000
    beq     s8, t9, lbl_800C06B4
    nop
    jal     func_800BEC98
    or      a1, s5, $zero              # a1 = 00000000
    beq     v0, s8, lbl_800C06B4
    sll     t6, s5,  2
    lb      t1, 0x0019(s6)             # 00000079
    lw      t5, 0x003C(s4)             # 0000003C
    lw      t2, 0x0018(s7)             # 00000018
    sll     t4, t1,  1
    addu    s0, t5, t4
    lbu     t7, 0x0000(s0)             # 00000000
    lbu     t3, 0x0001(s0)             # 00000001
    addu    t9, s4, t6
    sll     t0, t7,  8
    addu    s1, t3, t0
    lw      t1, 0x0050(t9)             # 00000050
    andi    s1, s1, 0xFFFF             # s1 = 00000000
    addu    t8, t2, s1
    b       lbl_800C06B4
    sw      t8, 0x0054(t1)             # 00000054
    lb      t5, 0x0019(s6)             # 00000079
    addu    t4, s4, s5
    b       lbl_800C06B4
    sb      t5, 0x00C4(t4)             # 000000C4
    jal     func_800BF31C
    or      a0, s6, $zero              # a0 = 00000060
    sll     s0, v0, 16
    sra     s0, s0, 16
    or      a0, s4, $zero              # a0 = 00000000
    jal     func_800BEC98
    or      a1, s5, $zero              # a1 = 00000000
    bne     v0, $zero, lbl_800C06B4
    sll     t0, s5,  2
    lw      t7, 0x0000(s6)             # 00000060
    addu    t2, s4, t0
    lw      t6, 0x0050(t2)             # 00000050
    addu    t3, t7, s0
    b       lbl_800C06B4
    sw      t3, 0x0054(t6)             # 00000054
lbl_800C1168:
    andi    t9, a0, 0x00F0             # t9 = 00000000
    sltiu   $at, t9, 0x0061
    beq     $at, $zero, lbl_800C06B4
    andi    s5, a1, 0x00FF             # s5 = 00000000
    sll     t9, t9,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t9
    lw      t9, -0x63C0($at)           # 80109C40
    jr      t9
    nop
    andi    t8, a1, 0x00FF             # t8 = 00000000
    b       lbl_800C12BC
    sh      t8, 0x001E(s4)             # 0000001E
    andi    t1, a1, 0x00FF             # t1 = 00000000
    slti    $at, t1, 0x0008
    beq     $at, $zero, lbl_800C11D8
    andi    s5, s2, 0x000F             # s5 = 00000000
    andi    t4, s2, 0x000F             # t4 = 00000000
    addu    v0, s4, t4
    sb      s8, 0x00C4(v0)             # 000000C4
    lb      a1, 0x0019(s6)             # 00000079
    lbu     a0, 0x0007(s4)             # 00000007
    jal     func_800B89D4
    addiu   a2, v0, 0x00C4             # a2 = 000000C4
    bne     v0, s8, lbl_800C06B4
    nop
    b       lbl_800C06B4
    nop
lbl_800C11D8:
    addiu   s5, s5, 0xFFF8             # s5 = FFFFFFF8
    andi    s5, s5, 0x00FF             # s5 = 000000F8
    addu    v0, s4, s5
    sb      s8, 0x00C4(v0)             # 000000C4
    lhu     a1, 0x0022(s4)             # 00000022
    lbu     a0, 0x0007(s4)             # 00000007
    addiu   a2, v0, 0x00C4             # a2 = 000000C4
    jal     func_800B89D4
    addiu   a1, a1, 0x0100             # a1 = 00000100
    bne     v0, s8, lbl_800C06B4
    nop
    b       lbl_800C06B4
    nop
    andi    v1, a1, 0x00FF             # v1 = 00000000
    addu    a0, s4, v1
    lb      t7, 0x00C4(a0)             # 000000C4
    slti    $at, v1, 0x0002
    beq     $at, $zero, lbl_800C06B4
    sb      t7, 0x0019(s6)             # 00000079
    b       lbl_800C06B4
    sb      s8, 0x00C4(a0)             # 000000C4
    andi    t2, a1, 0x00FF             # t2 = 00000000
    addu    t3, s4, t2
    lb      t6, 0x00C4(t3)             # 000000C4
    lb      t0, 0x0019(s6)             # 00000079
    subu    t9, t0, t6
    b       lbl_800C06B4
    sb      t9, 0x0019(s6)             # 00000079
    jal     func_800BF31C
    or      a0, s6, $zero              # a0 = 00000060
    lw      t8, 0x0018(s7)             # 00000018
    or      a1, s2, $zero              # a1 = 00000000
    andi    t1, v0, 0xFFFF             # t1 = 00000000
    andi    a1, a1, 0x000F             # a1 = 00000000
    or      a0, s7, $zero              # a0 = 00000000
    jal     func_800BF06C
    addu    a2, t8, t1
    b       lbl_800C06B4
    nop
    jal     func_800BF308
    or      a0, s6, $zero              # a0 = 00000060
    sll     t4, s5,  2
    addu    t7, s7, t4
    lw      t2, 0x0038(t7)             # 00000038
    lb      t5, 0x0019(s6)             # 00000079
    addu    t3, t2, v0
    b       lbl_800C06B4
    sb      t5, 0x00C4(t3)             # 000000C4
    jal     func_800BF308
    or      a0, s6, $zero              # a0 = 00000060
    sll     t0, s5,  2
    addu    t6, s7, t0
    lw      t9, 0x0038(t6)             # 00000038
    addu    t8, t9, v0
    lb      t1, 0x00C4(t8)             # 000000C4
    b       lbl_800C06B4
    sb      t1, 0x0019(s6)             # 00000079
lbl_800C12BC:
    or      s0, $zero, $zero           # s0 = 00000000
lbl_800C12C0:
    or      s1, s4, $zero              # s1 = 00000000
    addiu   s2, $zero, 0x0010          # s2 = 00000010
lbl_800C12C8:
    lw      a0, 0x0050(s1)             # 00000050
    beql    a0, $zero, lbl_800C12E0
    addiu   s0, s0, 0x0004             # s0 = 00000004
    jal     func_800BF394
    nop
    addiu   s0, s0, 0x0004             # s0 = 00000008
lbl_800C12E0:
    bne     s0, s2, lbl_800C12C8
    addiu   s1, s1, 0x0004             # s1 = 00000004
    lw      $ra, 0x003C($sp)
lbl_800C12EC:
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
    addiu   $sp, $sp, 0x0088           # $sp += 0x88


func_800C1318:
# MqDbg: 
    addiu   $sp, $sp, 0xFF98           # $sp -= 0x68
    sw      $ra, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    lw      t6, 0x0000(a0)             # 00000000
    or      s2, a0, $zero              # s2 = 00000000
    srl     t7, t6, 31
    beql    t7, $zero, lbl_800C1B10
    lw      $ra, 0x0024($sp)
    jal     func_800B6EE8
    lbu     a0, 0x0004(a0)             # 00000004
    beq     v0, $zero, lbl_800C1360
    nop
    jal     func_800B6E70
    lbu     a0, 0x0005(s2)             # 00000005
    bne     v0, $zero, lbl_800C1370
    addiu   a1, $zero, 0x0002          # a1 = 00000002
lbl_800C1360:
    jal     func_800BF12C
    or      a0, s2, $zero              # a0 = 00000000
    b       lbl_800C1B10
    lw      $ra, 0x0024($sp)
lbl_800C1370:
    jal     func_800B7008
    lbu     a0, 0x0004(s2)             # 00000004
    lbu     a0, 0x0005(s2)             # 00000005
    jal     func_800B6FD8
    addiu   a1, $zero, 0x0002          # a1 = 00000002
    lw      t8, 0x0000(s2)             # 00000000
    lui     a0, 0x8012                 # a0 = 80120000
    sll     t0, t8,  2
    bgezl   t0, lbl_800C13AC
    lhu     t5, 0x000A(s2)             # 0000000A
    lbu     t1, 0x0003(s2)             # 00000003
    andi    t2, t1, 0x0080             # t2 = 00000000
    bnel    t2, $zero, lbl_800C1B10
    lw      $ra, 0x0024($sp)
    lhu     t5, 0x000A(s2)             # 0000000A
lbl_800C13AC:
    lhu     t6, 0x0008(s2)             # 00000008
    lw      t3, 0x00E0(s2)             # 000000E0
    lh      t9, 0x000C(s2)             # 0000000C
    addu    t8, t5, t6
    sh      t8, 0x000A(s2)             # 0000000A
    addiu   t4, t3, 0x0001             # t4 = 00000001
    addu    t0, t8, t9
    sw      t4, 0x00E0(s2)             # 000000E0
    sh      t0, 0x000A(s2)             # 0000000A
    lh      a0, 0x7EC8(a0)             # 80127EC8
    andi    v0, t0, 0xFFFF             # v0 = 00000000
    slt     $at, v0, a0
    bnel    $at, $zero, lbl_800C1B10
    lw      $ra, 0x0024($sp)
    lw      t3, 0x0000(s2)             # 00000000
    subu    t2, v0, a0
    addiu   $at, $zero, 0x0001         # $at = 00000001
    sll     t4, t3,  6
    srl     t5, t4, 31
    beq     t5, $at, lbl_800C1B0C
    sh      t2, 0x000A(s2)             # 0000000A
    lhu     v0, 0x0010(s2)             # 00000010
    slti    $at, v0, 0x0002
    bne     $at, $zero, lbl_800C1418
    addiu   t6, v0, 0xFFFF             # t6 = FFFFFFFF
    b       lbl_800C1AD8
    sh      t6, 0x0010(s2)             # 00000010
lbl_800C1418:
    lbu     t8, 0x0000(s2)             # 00000000
    addiu   s1, s2, 0x0078             # s1 = 00000078
    ori     t9, t8, 0x0004             # t9 = 00000004
    sb      t9, 0x0000(s2)             # 00000000
lbl_800C1428:
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000078
    slti    $at, v0, 0x00F2
    bne     $at, $zero, lbl_800C1488
    andi    s0, v0, 0x00FF             # s0 = 00000000
    or      a0, s1, $zero              # a0 = 00000078
    jal     func_800BE900
    andi    a1, s0, 0x00FF             # a1 = 00000000
    or      a0, s2, $zero              # a0 = 00000000
    or      a1, s1, $zero              # a1 = 00000078
    or      a2, s0, $zero              # a2 = 00000000
    jal     func_800BE968
    or      a3, v0, $zero              # a3 = 00000000
    beq     v0, $zero, lbl_800C1428
    nop
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     v0, $at, lbl_800C1480
    nop
    jal     func_800BF12C
    or      a0, s2, $zero              # a0 = 00000000
    b       lbl_800C1ADC
    or      s1, s2, $zero              # s1 = 00000000
lbl_800C1480:
    b       lbl_800C1AD8
    sh      v0, 0x0010(s2)             # 00000010
lbl_800C1488:
    andi    v1, v0, 0x00FF             # v1 = 00000000
    slti    $at, v1, 0x00C0
    bne     $at, $zero, lbl_800C194C
    andi    v0, v1, 0x00F0             # v0 = 00000000
    addiu   t0, v1, 0xFF3C             # t0 = FFFFFF3C
    sltiu   $at, t0, 0x002E
    beq     $at, $zero, lbl_800C1428
    sll     t0, t0,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t0
    lw      t0, -0x623C($at)           # 80109DC4
    jr      t0
    nop
    addiu   s0, s2, 0x009C             # s0 = 0000009C
    jal     func_800BD3C0
    or      a0, s0, $zero              # a0 = 0000009C
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    or      a0, s0, $zero              # a0 = 0000009C
    jal     func_800BD520
    or      a1, v0, $zero              # a1 = 00000000
    b       lbl_800C1428
    nop
    b       lbl_800C1428
    nop
    jal     func_800BD3C0
    addiu   a0, s2, 0x009C             # a0 = 0000009C
    b       lbl_800C1428
    nop
    sh      $zero, 0x000E(s2)          # 0000000E
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    lh      t1, 0x000E(s2)             # 0000000E
    sll     t2, v0, 24
    sra     t3, t2, 24
    addu    t4, t1, t3
    b       lbl_800C1428
    sh      t4, 0x000E(s2)             # 0000000E
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    sll     t5, v0,  2
    subu    t5, t5, v0
    sll     t5, t5,  4
    sh      t5, 0x0008(s2)             # 00000008
    lui     a0, 0x8012                 # a0 = 80120000
    lh      a0, 0x7EC8(a0)             # 80127EC8
    andi    v1, t5, 0xFFFF             # v1 = 00000000
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    slt     $at, a0, v1
    beql    $at, $zero, lbl_800C1560
    sll     t6, v1, 16
    sh      a0, 0x0008(s2)             # 00000008
    andi    v1, a0, 0xFFFF             # v1 = 00000000
    sll     t6, v1, 16
lbl_800C1560:
    sra     t7, t6, 16
    bgtz    t7, lbl_800C1428
    nop
    b       lbl_800C1428
    sh      t8, 0x0008(s2)             # 00000008
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    sll     t9, v0, 24
    sra     t0, t9, 24
    sll     t2, t0,  2
    subu    t2, t2, t0
    sll     t2, t2,  4
    b       lbl_800C1428
    sh      t2, 0x000C(s2)             # 0000000C
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    andi    s0, v0, 0x00FF             # s0 = 00000000
    jal     func_800BF31C
    or      a0, s1, $zero              # a0 = 00000000
    beq     s0, $zero, lbl_800C15D0
    or      a0, s0, $zero              # a0 = 00000000
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     a0, $at, lbl_800C15D0
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     a0, $at, lbl_800C15EC
    andi    t3, v0, 0xFFFF             # t3 = 00000000
    b       lbl_800C1428
    nop
lbl_800C15D0:
    lbu     t1, 0x0001(s2)             # 00000001
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     t1, $at, lbl_800C1428
    nop
    sh      v0, 0x0014(s2)             # 00000014
    b       lbl_800C1428
    sb      s0, 0x0001(s2)             # 00000001
lbl_800C15EC:
    mtc1    t3, $f10                   # $f10 = 0.00
    mtc1    $zero, $f4                 # $f4 = 0.00
    lwc1    $f6, 0x001C(s2)            # 0000001C
    cvt.s.w $f16, $f10
    sh      v0, 0x0012(s2)             # 00000012
    sb      s0, 0x0001(s2)             # 00000001
    sub.s   $f8, $f4, $f6
    div.s   $f18, $f8, $f16
    b       lbl_800C1428
    swc1    $f18, 0x0020(s2)           # 00000020
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    lbu     v1, 0x0001(s2)             # 00000001
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beql    v1, $zero, lbl_800C1654
    lhu     v1, 0x0014(s2)             # 00000014
    beq     v1, $at, lbl_800C1644
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     v1, $at, lbl_800C1428
    nop
    b       lbl_800C1428
    nop
lbl_800C1644:
    mtc1    $zero, $f4                 # $f4 = 0.00
    sb      $zero, 0x0001(s2)          # 00000001
    swc1    $f4, 0x001C(s2)            # 0000001C
    lhu     v1, 0x0014(s2)             # 00000014
lbl_800C1654:
    beq     v1, $zero, lbl_800C1690
    sh      v1, 0x0012(s2)             # 00000012
    mtc1    v0, $f6                    # $f6 = 0.00
    lui     $at, 0x42FE                # $at = 42FE0000
    mtc1    $at, $f8                   # $f8 = 127.00
    cvt.s.w $f10, $f6
    andi    t4, v1, 0xFFFF             # t4 = 00000000
    mtc1    t4, $f6                    # $f6 = 0.00
    lwc1    $f18, 0x001C(s2)           # 0000001C
    div.s   $f16, $f10, $f8
    cvt.s.w $f10, $f6
    sub.s   $f4, $f16, $f18
    div.s   $f8, $f4, $f10
    b       lbl_800C1428
    swc1    $f8, 0x0020(s2)            # 00000020
lbl_800C1690:
    mtc1    v0, $f16                   # $f16 = 0.00
    lui     $at, 0x42FE                # $at = 42FE0000
    mtc1    $at, $f6                   # $f6 = 127.00
    cvt.s.w $f18, $f16
    div.s   $f4, $f18, $f6
    b       lbl_800C1428
    swc1    $f4, 0x001C(s2)            # 0000001C
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    sll     t5, v0, 24
    sra     t6, t5, 24
    mtc1    t6, $f10                   # $f10 = 0.00
    lui     $at, 0x42FE                # $at = 42FE0000
    mtc1    $at, $f16                  # $f16 = 127.00
    cvt.s.w $f8, $f10
    div.s   $f18, $f8, $f16
    b       lbl_800C1428
    swc1    $f18, 0x002C(s2)           # 0000002C
    jal     func_800BF31C
    or      a0, s1, $zero              # a0 = 00000000
    or      a0, s2, $zero              # a0 = 00000000
    jal     func_800BEEF4
    andi    a1, v0, 0xFFFF             # a1 = 00000000
    b       lbl_800C1428
    nop
    jal     func_800BF31C
    or      a0, s1, $zero              # a0 = 00000000
    b       lbl_800C1428
    nop
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    sll     t7, v0, 24
    sra     t8, t7, 24
    mtc1    t8, $f6                    # $f6 = 0.00
    lui     $at, 0x42FE                # $at = 42FE0000
    mtc1    $at, $f10                  # $f10 = 127.00
    cvt.s.w $f4, $f6
    div.s   $f8, $f4, $f10
    b       lbl_800C1428
    swc1    $f8, 0x0028(s2)            # 00000028
    lbu     t0, 0x0000(s2)             # 00000000
    ori     t2, t0, 0x0020             # t2 = 00000020
    b       lbl_800C1428
    sb      t2, 0x0000(s2)             # 00000000
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    b       lbl_800C1428
    sb      v0, 0x0003(s2)             # 00000003
    jal     func_800BF31C
    or      a0, s1, $zero              # a0 = 00000000
    lw      t1, 0x0018(s2)             # 00000018
    andi    t3, v0, 0xFFFF             # t3 = 00000000
    addiu   $at, $zero, 0x00D2         # $at = 000000D2
    bne     s0, $at, lbl_800C1774
    addu    v1, t1, t3
    b       lbl_800C1428
    sw      v1, 0x0094(s2)             # 00000094
lbl_800C1774:
    b       lbl_800C1428
    sw      v1, 0x0098(s2)             # 00000098
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    b       lbl_800C1428
    sb      v0, 0x0002(s2)             # 00000002
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    bne     v0, $zero, lbl_800C17B0
    lui     t7, 0x8012                 # t7 = 80120000
    lui     t4, 0x8012                 # t4 = 80120000
    lw      t4, 0x7FAC(t4)             # 80127FAC
    srl     t6, t4,  2
    b       lbl_800C1428
    sb      t6, 0x0019(s1)             # 00000019
lbl_800C17B0:
    lw      t7, 0x7FAC(t7)             # 80127FAC
    andi    t9, v0, 0x00FF             # t9 = 00000000
    srl     t8, t7,  2
    divu    $zero, t8, t9
    mfhi    t0
    sb      t0, 0x0019(s1)             # 00000019
    bne     t9, $zero, lbl_800C17D4
    nop
    break   # 0x01C00
lbl_800C17D4:
    b       lbl_800C1428
    nop
    jal     func_800BF31C
    or      a0, s1, $zero              # a0 = 00000000
    lb      a1, 0x0019(s1)             # 00000019
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    beq     a1, $at, lbl_800C1428
    nop
    lbu     a2, 0x0018(s1)             # 00000018
    addiu   $at, $zero, 0x0003         # $at = 00000003
    andi    t2, v0, 0xFFFF             # t2 = 00000000
    beq     a2, $at, lbl_800C1428
    sll     t1, a1,  1
    lw      t5, 0x0000(s1)             # 00000000
    sll     t6, a2,  2
    lw      t4, 0x0018(s2)             # 00000018
    addu    t7, s1, t6
    sw      t5, 0x0004(t7)             # 00000004
    lbu     t8, 0x0018(s1)             # 00000018
    addu    t3, t2, t1
    addu    v0, t4, t3
    addiu   t9, t8, 0x0001             # t9 = 00000001
    sb      t9, 0x0018(s1)             # 00000018
    lbu     t2, 0x0000(v0)             # 00000000
    lbu     t0, 0x0001(v0)             # 00000001
    lw      t4, 0x0018(s2)             # 00000018
    sll     t1, t2,  8
    addu    v1, t0, t1
    andi    v1, v1, 0xFFFF             # v1 = 00000000
    addu    t3, t4, v1
    b       lbl_800C1428
    sw      t3, 0x0000(s1)             # 00000000
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    b       lbl_800C1428
    sb      v0, 0x0019(s1)             # 00000019
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    lb      t6, 0x0019(s1)             # 00000019
    and     t5, t6, v0
    b       lbl_800C1428
    sb      t5, 0x0019(s1)             # 00000019
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    lb      t7, 0x0019(s1)             # 00000019
    subu    t8, t7, v0
    b       lbl_800C1428
    sb      t8, 0x0019(s1)             # 00000019
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    andi    s0, v0, 0x00FF             # s0 = 00000000
    jal     func_800BF31C
    or      a0, s1, $zero              # a0 = 00000000
    lw      t9, 0x0018(s2)             # 00000018
    lbu     t0, 0x0019(s1)             # 00000019
    andi    t2, v0, 0xFFFF             # t2 = 00000000
    addu    a1, t9, t2
    addu    t1, t0, s0
    b       lbl_800C1428
    sb      t1, 0x0000(a1)             # 00000000
    lbu     t3, 0x0000(s2)             # 00000000
    ori     t6, t3, 0x0002             # t6 = 00000002
    b       lbl_800C1B0C
    sb      t6, 0x0000(s2)             # 00000000
    jal     func_800BF31C
    or      a0, s1, $zero              # a0 = 00000000
    andi    t5, v0, 0xFFFF             # t5 = 00000000
    b       lbl_800C1428
    sw      t5, 0x00E0(s2)             # 000000E0
    jal     func_800BF31C
    or      a0, s1, $zero              # a0 = 00000000
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    b       lbl_800C1428
    nop
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    bne     v0, $at, lbl_800C1918
    andi    s0, v0, 0x00FF             # s0 = 00000000
    lbu     s0, 0x0007(s2)             # 00000007
lbl_800C1918:
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    or      a0, s0, $zero              # a0 = 00000000
    or      a1, v0, $zero              # a1 = 00000000
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_800B7694
    sw      s0, 0x002C($sp)
    lw      a0, 0x002C($sp)
    lbu     t7, 0x0007(s2)             # 00000007
    bne     t7, a0, lbl_800C1428
    nop
    b       lbl_800C1B10
    lw      $ra, 0x0024($sp)
lbl_800C194C:
    andi    a0, v1, 0x000F             # a0 = 00000000
    blez    v0, lbl_800C197C
    sb      a0, 0x0066($sp)
    addiu   t8, v0, 0xFFC0             # t8 = FFFFFFC0
    sltiu   $at, t8, 0x0071
    beq     $at, $zero, lbl_800C1428
    sll     t8, t8,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t8
    lw      t8, -0x6184($at)           # 80109E7C
    jr      t8
    nop
lbl_800C197C:
    bne     v0, $zero, lbl_800C1428
    andi    t9, a0, 0x00FF             # t9 = 00000000
    sll     t2, t9,  2
    addu    t0, s2, t2
    lw      t1, 0x0038(t0)             # 00000038
    lw      t4, 0x0000(t1)             # 00000000
    srl     t3, t4, 31
    xori    t6, t3, 0x0001             # t6 = 00000001
    b       lbl_800C1428
    sb      t6, 0x0019(s1)             # 00000019
    andi    t7, a0, 0x00FF             # t7 = 00000000
    addu    t8, s2, t7
    lb      t9, 0x0158(t8)             # 00000118
    lb      t5, 0x0019(s1)             # 00000019
    subu    t2, t5, t9
    b       lbl_800C1428
    sb      t2, 0x0019(s1)             # 00000019
    lb      t0, 0x0019(s1)             # 00000019
    andi    t1, a0, 0x00FF             # t1 = 00000000
    addu    t4, s2, t1
    b       lbl_800C1428
    sb      t0, 0x0158(t4)             # 00000158
    andi    v0, a0, 0x00FF             # v0 = 00000000
    addu    v1, s2, v0
    lb      t3, 0x0158(v1)             # 00000158
    slti    $at, v0, 0x0002
    beq     $at, $zero, lbl_800C1428
    sb      t3, 0x0019(s1)             # 00000019
    addiu   t6, $zero, 0xFFFF          # t6 = FFFFFFFF
    b       lbl_800C1428
    sb      t6, 0x0158(v1)             # 00000158
    andi    t8, s0, 0x000F             # t8 = 00000000
    sll     t5, t8,  2
    addu    t9, s2, t5
    jal     func_800BEE88
    lw      a0, 0x0038(t9)             # 00000038
    b       lbl_800C1428
    nop
    jal     func_800BF31C
    or      a0, s1, $zero              # a0 = 00000000
    lw      t2, 0x0018(s2)             # 00000018
    or      a1, s0, $zero              # a1 = 00000000
    andi    t1, v0, 0xFFFF             # t1 = 00000000
    andi    a1, a1, 0x000F             # a1 = 00000000
    or      a0, s2, $zero              # a0 = 00000000
    jal     func_800BF06C
    addu    a2, t2, t1
    b       lbl_800C1428
    nop
    jal     func_800BF31C
    or      a0, s1, $zero              # a0 = 00000000
    lw      t0, 0x0000(s1)             # 00000000
    or      a1, s0, $zero              # a1 = 00000000
    andi    a1, a1, 0x000F             # a1 = 00000000
    or      a0, s2, $zero              # a0 = 00000000
    jal     func_800BF06C
    addu    a2, t0, v0
    b       lbl_800C1428
    nop
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    andi    s0, v0, 0x00FF             # s0 = 00000000
    jal     func_800BF31C
    or      a0, s1, $zero              # a0 = 00000000
    lbu     t6, 0x0066($sp)
    lw      t4, 0x0018(s2)             # 00000018
    andi    t3, v0, 0xFFFF             # t3 = 00000000
    addu    a2, s2, t6
    addiu   a2, a2, 0x0158             # a2 = 00000158
    or      a0, s0, $zero              # a0 = 00000000
    jal     func_800B8ECC
    addu    a1, t4, t3
    b       lbl_800C1428
    nop
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    or      s0, v0, $zero              # s0 = 00000000
    jal     func_800BF308
    or      a0, s1, $zero              # a0 = 00000000
    lbu     t7, 0x0066($sp)
    or      a0, s0, $zero              # a0 = 00000000
    or      a1, v0, $zero              # a1 = 00000000
    addu    a2, s2, t7
    jal     func_800BA4AC
    addiu   a2, a2, 0x0158             # a2 = 00000158
    b       lbl_800C1428
    nop
lbl_800C1AD8:
    or      s1, s2, $zero              # s1 = 00000000
lbl_800C1ADC:
    addiu   s2, $zero, 0x0040          # s2 = 00000040
    or      s0, $zero, $zero           # s0 = 00000000
lbl_800C1AE4:
    lw      a0, 0x0038(s1)             # 00000038
    lw      t8, 0x0000(a0)             # 00000000
    srl     t5, t8, 31
    beql    t5, $zero, lbl_800C1B04
    addiu   s0, s0, 0x0004             # s0 = 00000004
    jal     func_800C0628
    nop
    addiu   s0, s0, 0x0004             # s0 = 00000008
lbl_800C1B04:
    bne     s0, s2, lbl_800C1AE4
    addiu   s1, s1, 0x0004             # s1 = 00000004
lbl_800C1B0C:
    lw      $ra, 0x0024($sp)
lbl_800C1B10:
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0068           # $sp += 0x68


func_800C1B24:
# MqDbg: 
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x5630             # v1 = 80125630
    lh      t6, 0x2854(v1)             # 80127E84
    lw      t9, 0x2894(v1)             # 80127EC4
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    subu    t7, t6, a0
    addiu   t8, t7, 0xFFFF             # t8 = FFFFFFFF
    multu   t8, t9
    lh      v0, 0x285C(v1)             # 80127E8C
    sw      s1, 0x0018($sp)
    sw      s3, 0x0020($sp)
    sw      s2, 0x001C($sp)
    lui     s1, 0x8012                 # s1 = 80120000
    sw      $ra, 0x0024($sp)
    sw      s0, 0x0014($sp)
    addiu   s1, s1, 0x5630             # s1 = 80125630
    or      s2, $zero, $zero           # s2 = 00000000
    mflo    t0
    sw      t0, 0x5B84(v1)             # 8012B1B4
    beq     v0, $zero, lbl_800C1BB4
    addiu   s3, $zero, 0x0001          # s3 = 00000001
lbl_800C1B78:
    lw      t1, 0x3530(s1)             # 80128B60
    addiu   s0, s1, 0x3530             # s0 = 80128B60
    srl     t2, t1, 31
    bnel    s3, t2, lbl_800C1BA8
    addiu   s2, s2, 0x0001             # s2 = 00000001
    jal     func_800C1318
    or      a0, s0, $zero              # a0 = 80128B60
    jal     func_800BE048
    or      a0, s0, $zero              # a0 = 80128B60
    lui     v0, 0x8012                 # v0 = 80120000
    lh      v0, 0x7E8C(v0)             # 80127E8C
    addiu   s2, s2, 0x0001             # s2 = 00000002
lbl_800C1BA8:
    sltu    $at, s2, v0
    bne     $at, $zero, lbl_800C1B78
    addiu   s1, s1, 0x0160             # s1 = 80125790
lbl_800C1BB4:
    jal     func_800BC54C
    nop
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28


func_800C1BD8:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x001C($sp)
    sw      s0, 0x0018($sp)
    lw      t6, 0x00DC(a0)             # 000000DC
    or      s0, a0, $zero              # s0 = 00000000
    blezl   t6, lbl_800C1C18
    lw      $ra, 0x001C($sp)
lbl_800C1BF4:
    jal     func_800C1318
    or      a0, s0, $zero              # a0 = 00000000
    jal     func_800BE048
    or      a0, s0, $zero              # a0 = 00000000
    lw      t7, 0x00DC(s0)             # 000000DC
    addiu   t8, t7, 0xFFFF             # t8 = FFFFFFFF
    bgtz    t8, lbl_800C1BF4
    sw      t8, 0x00DC(s0)             # 000000DC
    lw      $ra, 0x001C($sp)
lbl_800C1C18:
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C1C28:
# MqDbg: 
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    jal     func_800BF12C
    sw      a0, 0x0028($sp)
    lw      s1, 0x0028($sp)
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f4                   # $f4 = 1.00
    mtc1    $zero, $f0                 # $f0 = 0.00
    lbu     t6, 0x0000(s1)             # 00000000
    lui     $at, 0x3F00                # $at = 3F000000
    mtc1    $at, $f6                   # $f6 = 0.50
    lui     t0, 0x8010                 # t0 = 80100000
    lui     t1, 0x8010                 # t1 = 80100000
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    addiu   t9, $zero, 0x1680          # t9 = 00001680
    addiu   t0, t0, 0x0DC4             # t0 = 80100DC4
    addiu   t1, t1, 0x0DD4             # t1 = 80100DD4
    andi    t7, t6, 0xFFFD             # t7 = 00000000
    or      s0, $zero, $zero           # s0 = 00000000
    addiu   s2, $zero, 0x0040          # s2 = 00000040
    sb      t7, 0x0000(s1)             # 00000000
    sh      $zero, 0x0010(s1)          # 00000010
    sb      t8, 0x0001(s1)             # 00000001
    sh      $zero, 0x0012(s1)          # 00000012
    sh      $zero, 0x0014(s1)          # 00000014
    sh      $zero, 0x000A(s1)          # 0000000A
    sh      t9, 0x0008(s1)             # 00000008
    sh      $zero, 0x000C(s1)          # 0000000C
    sh      $zero, 0x000E(s1)          # 0000000E
    sb      $zero, 0x0002(s1)          # 00000002
    sw      t0, 0x0094(s1)             # 00000094
    sw      t1, 0x0098(s1)             # 00000098
    sw      $zero, 0x00E0(s1)          # 000000E0
    swc1    $f4, 0x001C(s1)            # 0000001C
    swc1    $f0, 0x0020(s1)            # 00000020
    swc1    $f0, 0x0024(s1)            # 00000024
    swc1    $f6, 0x0028(s1)            # 00000028
lbl_800C1CC8:
    jal     func_800BEB44
    lw      a0, 0x0038(s1)             # 00000038
    addiu   s0, s0, 0x0004             # s0 = 00000004
    bne     s0, s2, lbl_800C1CC8
    addiu   s1, s1, 0x0004             # s1 = 00000004
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28


func_800C1CF4:
# MqDbg: 
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sll     t6, a0,  2
    subu    t6, t6, a0
    sll     t6, t6,  2
    subu    t6, t6, a0
    sll     t6, t6,  5
    lui     t8, 0x8012                 # t8 = 80120000
    sw      s4, 0x0024($sp)
    sw      s3, 0x0020($sp)
    sw      s2, 0x001C($sp)
    addiu   t8, t8, 0x5630             # t8 = 80125630
    addiu   t7, t6, 0x3530             # t7 = 00003530
    sw      s5, 0x0028($sp)
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    addu    s2, t7, t8
    lui     s3, 0x8012                 # s3 = 80120000
    lui     s4, 0x8013                 # s4 = 80130000
    sw      $ra, 0x002C($sp)
    addiu   s4, s4, 0xB0E0             # s4 = 8012B0E0
    addiu   s3, s3, 0x7FF0             # s3 = 80127FF0
    or      s0, s2, $zero              # s0 = 00000000
    or      s1, $zero, $zero           # s1 = 00000000
    addiu   s5, $zero, 0x0040          # s5 = 00000040
lbl_800C1D54:
    or      a0, s3, $zero              # a0 = 80127FF0
    jal     func_800B3940
    addiu   a1, $zero, 0x00D4          # a1 = 000000D4
    bne     v0, $zero, lbl_800C1D70
    sw      v0, 0x0038(s0)             # 00000038
    b       lbl_800C1D94
    sw      s4, 0x0038(s0)             # 00000038
lbl_800C1D70:
    lw      v1, 0x0038(s0)             # 00000038
    lbu     t9, 0x0000(v1)             # 00000000
    sw      s2, 0x004C(v1)             # 0000004C
    sw      $zero, 0x0054(v1)          # 00000054
    andi    t0, t9, 0xFF7F             # t0 = 00000000
    sb      t0, 0x0000(v1)             # 00000000
    sw      $zero, 0x0058(v1)          # 00000058
    sw      $zero, 0x005C(v1)          # 0000005C
    sw      $zero, 0x0050(v1)          # 00000050
lbl_800C1D94:
    jal     func_800BEB44
    lw      a0, 0x0038(s0)             # 00000038
    addiu   s1, s1, 0x0004             # s1 = 00000004
    bne     s1, s5, lbl_800C1D54
    addiu   s0, s0, 0x0004             # s0 = 00000004
    lw      $ra, 0x002C($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    lw      s4, 0x0024($sp)
    lw      s5, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030           # $sp += 0x30


func_800C1DCC:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    or      a2, a0, $zero              # a2 = 00000000
    or      v1, a0, $zero              # v1 = 00000000
    lui     v0, 0x8013                 # v0 = 80130000
    sw      $ra, 0x0014($sp)
    addiu   v0, v0, 0xB0E0             # v0 = 8012B0E0
    addiu   a0, $zero, 0x0010          # a0 = 00000010
    or      a1, $zero, $zero           # a1 = 00000000
lbl_800C1DEC:
    addiu   a1, a1, 0x0004             # a1 = 00000004
    sw      v0, 0x003C(v1)             # 0000003C
    sw      v0, 0x0040(v1)             # 00000040
    sw      v0, 0x0044(v1)             # 00000044
    addiu   v1, v1, 0x0010             # v1 = 00000010
    bne     a1, a0, lbl_800C1DEC
    sw      v0, 0x0028(v1)             # 00000038
    lbu     t6, 0x0000(a2)             # 00000000
    or      a0, $zero, $zero           # a0 = 00000000
    or      v1, a2, $zero              # v1 = 00000000
    andi    t8, t6, 0xFF7F             # t8 = 00000000
    andi    t0, t8, 0x00DF             # t0 = 00000000
    sb      t8, 0x0000(a2)             # 00000000
    andi    t2, t0, 0x00F7             # t2 = 00000000
    sb      t0, 0x0000(a2)             # 00000000
    andi    t4, t2, 0x00EF             # t4 = 00000000
    sb      t2, 0x0000(a2)             # 00000000
    sb      t4, 0x0000(a2)             # 00000000
    andi    t5, t4, 0x00FE             # t5 = 00000000
    sb      t5, 0x0000(a2)             # 00000000
    addiu   a1, $zero, 0x0008          # a1 = 00000008
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
lbl_800C1E44:
    addiu   a0, a0, 0x0004             # a0 = 00000004
    sb      v0, 0x0159(v1)             # 00000159
    sb      v0, 0x015A(v1)             # 0000015A
    sb      v0, 0x015B(v1)             # 0000015B
    addiu   v1, v1, 0x0004             # v1 = 00000004
    bne     a0, a1, lbl_800C1E44
    sb      v0, 0x0154(v1)             # 00000158
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f0                   # $f0 = 1.00
    addiu   t6, $zero, 0x0060          # t6 = 00000060
    sb      t6, 0x0003(a2)             # 00000003
    swc1    $f0, 0x002C(a2)            # 0000002C
    swc1    $f0, 0x0034(a2)            # 00000034
    sw      a2, 0x0018($sp)
    jal     func_800BD2CC
    addiu   a0, a2, 0x009C             # a0 = 0000009C
    jal     func_800C1C28
    lw      a0, 0x0018($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C1E9C:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x001C($sp)
    sw      s1, 0x0018($sp)
    jal     func_800BF268
    sw      s0, 0x0014($sp)
    lui     v0, 0x8012                 # v0 = 80120000
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x7630             # v1 = 80127630
    addiu   v0, v0, 0x5630             # v0 = 80125630
lbl_800C1EC0:
    lbu     t6, 0x3AB0(v0)             # 801290E0
    addiu   v0, v0, 0x0080             # v0 = 801256B0
    sltu    $at, v0, v1
    andi    t7, t6, 0xFF7F             # t7 = 00000000
    sw      $zero, 0x3A80(v0)          # 80129130
    bne     $at, $zero, lbl_800C1EC0
    sb      t7, 0x3A30(v0)             # 801290E0
    lui     s0, 0x8013                 # s0 = 80130000
    lui     s1, 0x8013                 # s1 = 80130000
    addiu   s1, s1, 0x90E0             # s1 = 801290E0
    addiu   s0, s0, 0x8B60             # s0 = 80128B60
lbl_800C1EEC:
    jal     func_800C1DCC
    or      a0, s0, $zero              # a0 = 80128B60
    addiu   s0, s0, 0x0160             # s0 = 80128CC0
    bne     s0, s1, lbl_800C1EEC
    nop
    lw      $ra, 0x001C($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    nop
    nop
    nop


func_800C1F20:
# MqDbg: 
    lui     t6, 0x8012                 # t6 = 80120000
    lw      t6, 0x1F24(t6)             # 80121F24
    addiu   $sp, $sp, 0xFF80           # $sp -= 0x80
    sw      $ra, 0x0014($sp)
    lui     a0, 0x8012                 # a0 = 80120000
    addiu   a0, a0, 0xD500             # a0 = 8011D500
    addiu   a1, $sp, 0x0020            # a1 = FFFFFFA0
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_800A279C
    sw      t6, 0x0018($sp)
    lhu     t7, 0x0020($sp)
    lw      t8, 0x0018($sp)
    lui     $at, 0x8012                # $at = 80120000
    sw      t7, 0x1F24($at)            # 80121F24
    lw      $ra, 0x0014($sp)
    lui     $at, 0x8012                # $at = 80120000
    lb      t9, 0x0034($sp)
    lb      t0, 0x0035($sp)
    sw      t8, 0x1F2C($at)            # 80121F2C
    lui     $at, 0x8012                # $at = 80120000
    addiu   $sp, $sp, 0x0080           # $sp += 0x80
    sb      t9, 0x1F20($at)            # 80121F20
    jr      $ra
    sb      t0, 0x1F21($at)            # 80121F21


func_800C1F80:
# MqDbg: 
    sw      a0, 0x0000($sp)
    sll     a0, a0, 24
    sra     a0, a0, 24
    slti    $at, a0, 0x0041
    bnel    $at, $zero, lbl_800C1FA4
    slti    $at, a0, 0xFFC0
    b       lbl_800C1FF8
    addiu   v0, $zero, 0x007F          # v0 = 0000007F
    slti    $at, a0, 0xFFC0
lbl_800C1FA4:
    beq     $at, $zero, lbl_800C1FB4
    nop
    b       lbl_800C1FF8
    addiu   v0, $zero, 0xFF80          # v0 = FFFFFF80
lbl_800C1FB4:
    bltz    a0, lbl_800C1FE0
    sll     v0, a0,  7
    sll     v0, a0,  7
    subu    v0, v0, a0
    bgez    v0, lbl_800C1FD0
    addu    $at, v0, $zero
    addiu   $at, v0, 0x003F            # $at = FFFFFFBF
lbl_800C1FD0:
    sra     v0, $at,  6
    sll     v0, v0, 24
    b       lbl_800C1FF8
    sra     v0, v0, 24
lbl_800C1FE0:
    bgez    v0, lbl_800C1FEC
    addu    $at, v0, $zero
    addiu   $at, v0, 0x003F            # $at = FFFFFFBF
lbl_800C1FEC:
    sra     v0, $at,  6
    sll     v0, v0, 24
    sra     v0, v0, 24
lbl_800C1FF8:
    sll     t6, v0,  2
    lui     $at, 0x8010                # $at = 80100000
    addu    $at, $at, t6
    lwc1    $f2, 0x09C4($at)           # 801009C4
    jr      $ra
    mov.s   $f0, $f2


func_800C2010:
# MqDbg: 
    lui     a0, 0x8010                 # a0 = 80100000
    addiu   a0, a0, 0x2B74             # a0 = 80102B74
    lbu     v0, 0x0000(a0)             # 80102B74
    beq     v0, $zero, lbl_800C2030
    addiu   v1, v0, 0xFFFF             # v1 = FFFFFFFF
    andi    v0, v1, 0x00FF             # v0 = 000000FF
    jr      $ra
    sb      $zero, 0x0000(a0)          # 80102B74
lbl_800C2030:
    lui     t6, 0x8010                 # t6 = 80100000
    lw      t6, 0x2238(t6)             # 80102238
    beql    t6, $zero, lbl_800C204C
    addiu   v1, $zero, 0x00FF          # v1 = 000000FF
    jr      $ra
    addiu   v0, $zero, 0x00FE          # v0 = 000000FE
lbl_800C2048:
    addiu   v1, $zero, 0x00FF          # v1 = 000000FF
lbl_800C204C:
    jr      $ra
    or      v0, v1, $zero              # v0 = 000000FF


func_800C2054:
# MqDbg: 
    sw      a0, 0x0000($sp)
    andi    a0, a0, 0x00FF             # a0 = 00000000
    andi    t6, a0, 0x003F             # t6 = 00000000
    lui     v1, 0x8010                 # v1 = 80100000
    addu    v1, v1, t6
    lbu     v1, 0x2EEC(v1)             # 80102EEC
    addiu   $at, $zero, 0x0005         # $at = 00000005
    andi    t7, a0, 0x0080             # t7 = 00000000
    bne     v1, $at, lbl_800C2094
    or      v0, v1, $zero              # v0 = 80100000
    beq     t7, $zero, lbl_800C208C
    nop
    jr      $ra
    addiu   v0, $zero, 0x0002          # v0 = 00000002
lbl_800C208C:
    jr      $ra
    addiu   v0, $zero, 0x0003          # v0 = 00000003
lbl_800C2094:
    jr      $ra
    nop


func_800C209C:
# MqDbg: 
# Song playback & activation related.
    sw      a0, 0x0000($sp)
    andi    a0, a0, 0x00FF             # a0 = 00000000
    sll     t6, a0,  2
    addu    t6, t6, a0
    lui     t7, 0x8010                 # t7 = 80100000
    addiu   t7, t7, 0x227C             # t7 = 8010227C
    sll     t6, t6,  5
    lui     t0, 0x8010                 # t0 = 80100000
    lui     a3, 0x8010                 # a3 = 80100000
    or      v0, $zero, $zero           # v0 = 00000000
    or      v1, $zero, $zero           # v1 = 00000000
    addiu   a3, a3, 0x2EFC             # a3 = 80102EFC
    addiu   t0, t0, 0x2EEC             # t0 = 80102EEC
    addu    a1, t6, t7
    addiu   a2, $zero, 0x00FF          # a2 = 000000FF
    sll     t8, v1,  3
lbl_800C20DC:
    addu    t9, a1, t8
    lbu     a0, 0x0000(t9)             # 00000000
    addiu   v1, v1, 0x0001             # v1 = 00000001
    andi    v1, v1, 0x00FF             # v1 = 00000001
    beq     a2, a0, lbl_800C2108
    addu    t1, t0, a0
    lbu     t2, 0x0000(t1)             # 00000000
    addu    t3, a3, v0
    addiu   v0, v0, 0x0001             # v0 = 00000001
    andi    v0, v0, 0x00FF             # v0 = 00000001
    sb      t2, 0x006D(t3)             # 0000006D
lbl_800C2108:
    slti    $at, v0, 0x0008
    beq     $at, $zero, lbl_800C211C
    slti    $at, v1, 0x0010
    bnel    $at, $zero, lbl_800C20DC
    sll     t8, v1,  3
lbl_800C211C:
    jr      $ra
    nop


func_800C2124:
# MqDbg: 
    lui     v0, 0x8010                 # v0 = 80100000
    lbu     v0, 0x2A08(v0)             # 80102A08
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      a0, 0x0028($sp)
    addiu   v1, $zero, 0x00FF          # v1 = 000000FF
    andi    a0, a0, 0xFFFF             # a0 = 00000000
    beq     v1, v0, lbl_800C215C
    sw      $ra, 0x0014($sp)
    andi    t6, a0, 0x0FFF             # t6 = 00000000
    addiu   $at, $zero, 0x0FFF         # $at = 00000FFF
    bne     t6, $at, lbl_800C215C
    or      t0, a0, $zero              # t0 = 00000000
    ori     a0, t0, 0x1000             # a0 = 00001000
    andi    a0, a0, 0xFFFF             # a0 = 00001000
lbl_800C215C:
    ori     $at, $zero, 0xCFFF         # $at = 0000CFFF
    bne     a0, $at, lbl_800C2178
    or      t0, a0, $zero              # t0 = 00001000
    beql    v1, v0, lbl_800C217C
    addiu   $at, $zero, 0x0FFF         # $at = 00000FFF
    ori     a0, $zero, 0xDFFF          # a0 = 0000DFFF
    ori     t0, $zero, 0xDFFF          # t0 = 0000DFFF
lbl_800C2178:
    addiu   $at, $zero, 0x0FFF         # $at = 00000FFF
lbl_800C217C:
    bne     t0, $at, lbl_800C2194
    addiu   t8, $zero, 0x000E          # t8 = 0000000E
    beql    v1, v0, lbl_800C2198
    ori     $at, $zero, 0xFFFF         # $at = 0000FFFF
    addiu   a0, $zero, 0x1FFF          # a0 = 00001FFF
    addiu   t0, $zero, 0x1FFF          # t0 = 00001FFF
lbl_800C2194:
    ori     $at, $zero, 0xFFFF         # $at = 0000FFFF
lbl_800C2198:
    beq     t0, $at, lbl_800C22BC
    lui     v0, 0x8012                 # v0 = 80120000
    lui     $at, 0x8000                # $at = 80000000
    addu    t7, a0, $at
    lui     $at, 0x8010                # $at = 80100000
    sw      t7, 0x2238($at)            # 80102238
    lui     $at, 0x8012                # $at = 80120000
    sb      $zero, 0x1F42($at)         # 80121F42
    addiu   v0, v0, 0x1F43             # v0 = 80121F43
    ori     $at, $zero, 0xA000         # $at = 0000A000
    beq     t0, $at, lbl_800C21D0
    sb      t8, 0x0000(v0)             # 80121F43
    addiu   t1, t8, 0xFFFF             # t1 = 0000000D
    sb      t1, 0x0000(v0)             # 80121F43
lbl_800C21D0:
    andi    t2, t0, 0x3FFF             # t2 = 00001FFF
    lui     $at, 0x8012                # $at = 80120000
    sh      t2, 0x1F44($at)            # 80121F44
    lui     $at, 0x8010                # $at = 80100000
    addiu   t3, $zero, 0x0008          # t3 = 00000008
    sb      t3, 0x2B78($at)            # 80102B78
    lui     $at, 0x8012                # $at = 80120000
    sb      $zero, 0x1F41($at)         # 80121F41
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2B74($at)         # 80102B74
    lui     $at, 0x8012                # $at = 80120000
    sb      $zero, 0x1F46($at)         # 80121F46
    jal     func_800C2010
    sw      t0, 0x001C($sp)
    lui     $at, 0x8012                # $at = 80120000
    sb      v0, 0x1F0F($at)            # 80121F0F
    lui     $at, 0x8010                # $at = 80100000
    addiu   t4, $zero, 0x0001          # t4 = 00000001
    sb      t4, 0x2208($at)            # 80102208
    lui     $at, 0x8010                # $at = 80100000
    lui     a3, 0x8012                 # a3 = 80120000
    lui     a2, 0x8012                 # a2 = 80120000
    lui     a1, 0x8012                 # a1 = 80120000
    lui     a0, 0x8012                 # a0 = 80120000
    lw      t0, 0x001C($sp)
    sh      $zero, 0x2248($at)         # 80102248
    addiu   a0, a0, 0x1F48             # a0 = 80121F48
    addiu   a1, a1, 0x1F68             # a1 = 80121F68
    addiu   a2, a2, 0x1F88             # a2 = 80121F88
    addiu   a3, a3, 0x1FA8             # a3 = 80121FA8
    or      v1, $zero, $zero           # v1 = 00000000
lbl_800C224C:
    sll     v0, v1,  1
    addu    t5, a0, v0
    addu    t8, a3, v1
    addiu   v1, v1, 0x0001             # v1 = 00000001
    sh      $zero, 0x0000(t5)          # 00000000
    addu    t6, a1, v0
    andi    v1, v1, 0x00FF             # v1 = 00000001
    sh      $zero, 0x0000(t6)          # 00000000
    addu    t7, a2, v0
    slti    $at, v1, 0x000E
    sh      $zero, 0x0000(t7)          # 00000000
    bne     $at, $zero, lbl_800C224C
    sb      $zero, 0x0000(t8)          # 00000000
    andi    t9, t0, 0x8000             # t9 = 00000000
    beq     t9, $zero, lbl_800C2294
    andi    t1, t0, 0x4000             # t1 = 00000000
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2B78($at)         # 80102B78
lbl_800C2294:
    beq     t1, $zero, lbl_800C22A4
    andi    t2, t0, 0xD000             # t2 = 00000000
    lui     $at, 0x8012                # $at = 80120000
    sb      $zero, 0x1F40($at)         # 80121F40
lbl_800C22A4:
    beql    t2, $zero, lbl_800C22D0
    lw      $ra, 0x0014($sp)
    jal     func_800C209C
    addiu   a0, $zero, 0x000C          # a0 = 0000000C
    b       lbl_800C22D0
    lw      $ra, 0x0014($sp)
lbl_800C22BC:
    lui     $at, 0x8010                # $at = 80100000
    sw      $zero, 0x2238($at)         # 80102238
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2208($at)         # 80102208
    lw      $ra, 0x0014($sp)
lbl_800C22D0:
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800C22DC:
# MqDbg: 
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x2210(t6)             # 80102210
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    lui     v0, 0x8012                 # v0 = 80120000
    beq     t6, $at, lbl_800C2310
    addiu   v0, v0, 0x1F41             # v0 = 80121F41
    lbu     t7, 0x0000(v0)             # 80121F41
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    addiu   t9, $zero, 0x00FF          # t9 = 000000FF
    bne     t7, $zero, lbl_800C2310
    lui     $at, 0x8010                # $at = 80100000
    sb      t8, 0x0000(v0)             # 80121F41
    sb      t9, 0x221C($at)            # 8010221C
lbl_800C2310:
    jr      $ra
    nop


func_800C2318:
# MqDbg: 
# Song playback related.
    addiu   $sp, $sp, 0xFFA0           # $sp -= 0x60
    sw      $ra, 0x002C($sp)
    sw      s5, 0x0028($sp)
    sw      s4, 0x0024($sp)
    sw      s3, 0x0020($sp)
    sw      s2, 0x001C($sp)
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    sb      $zero, 0x005B($sp)
    jal     func_800C22DC
    sb      $zero, 0x0057($sp)
    lui     t6, 0x8012                 # t6 = 80120000
    lbu     t6, 0x1F41(t6)             # 80121F41
    lui     v0, 0x8010                 # v0 = 80100000
    beql    t6, $zero, lbl_800C2700
    lw      $ra, 0x002C($sp)
    lb      v0, 0x2228(v0)             # 80102228
    lui     t7, 0x8010                 # t7 = 80100000
    lui     t8, 0x8010                 # t8 = 80100000
    bgez    v0, lbl_800C2374
    or      v1, v0, $zero              # v1 = 80100000
    b       lbl_800C2374
    subu    v1, $zero, v0
lbl_800C2374:
    slti    $at, v1, 0x0015
    bne     $at, $zero, lbl_800C238C
    lui     $ra, 0x8012                # $ra = 80120000
    lui     $at, 0x8010                # $at = 80100000
    b       lbl_800C26FC
    sw      $zero, 0x2238($at)         # 80102238
lbl_800C238C:
    lbu     t7, 0x2210(t7)             # 80102210
    lbu     t8, 0x2214(t8)             # 80102214
    lui     t6, 0x8012                 # t6 = 80120000
    sw      t7, 0x0040($sp)
    beq     t7, t8, lbl_800C23AC
    or      s5, t7, $zero              # s5 = 80100000
    addiu   t5, $zero, 0x00FF          # t5 = 000000FF
    bne     t5, t7, lbl_800C23B8
lbl_800C23AC:
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    sb      t9, 0x005B($sp)
    addiu   t5, $zero, 0x00FF          # t5 = 000000FF
lbl_800C23B8:
    lbu     $ra, 0x1F42($ra)           # 80121F42
    lbu     t6, 0x1F43(t6)             # 80121F43
    lui     s0, 0x8012                 # s0 = 80120000
    or      a2, $ra, $zero             # a2 = 80120000
    slt     $at, $ra, t6
    beq     $at, $zero, lbl_800C26C8
    sw      t6, 0x0034($sp)
    lui     s4, 0x8010                 # s4 = 80100000
    lui     s3, 0x8012                 # s3 = 80120000
    lui     s2, 0x8010                 # s2 = 80100000
    lui     s1, 0x8012                 # s1 = 80120000
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x1F46             # v0 = 80121F46
    addiu   s1, s1, 0x1FA8             # s1 = 80121FA8
    addiu   s2, s2, 0x221C             # s2 = 8010221C
    addiu   s3, s3, 0x1F48             # s3 = 80121F48
    addiu   s4, s4, 0x227C             # s4 = 8010227C
    lhu     s0, 0x1F44(s0)             # 80121F44
lbl_800C2400:
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    sllv    t3, t7, a2
    andi    t3, t3, 0xFFFF             # t3 = 00000000
    and     t8, s0, t3
    beq     t8, $zero, lbl_800C264C
    sll     t4, $ra,  1
    lui     t6, 0x8012                 # t6 = 80120000
    addiu   t6, t6, 0x1F88             # t6 = 80121F88
    addu    t0, t4, t6
    lhu     a0, 0x0000(t0)             # 00000000
    lbu     t7, 0x005B($sp)
    lui     t9, 0x8012                 # t9 = 80120000
    addiu   t9, t9, 0x1F68             # t9 = 80121F68
    addu    v1, t4, t9
    addiu   a1, a0, 0x0012             # a1 = 00000012
    beq     t7, $zero, lbl_800C24C4
    sh      a1, 0x0000(v1)             # 80100000
    andi    v0, a1, 0xFFFF             # v0 = 00000012
    addiu   t8, a0, 0xFFEE             # t8 = FFFFFFEE
    slt     $at, v0, t8
    bne     $at, $zero, lbl_800C24B8
    slt     $at, v0, a1
    bne     $at, $zero, lbl_800C24B8
    sll     t9, $ra,  2
    addu    t7, s3, t4
    lhu     t8, 0x0000(t7)             # 00000001
    addu    t9, t9, $ra
    sll     t9, t9,  5
    addu    t6, s4, t9
    sll     t9, t8,  3
    addu    t7, t6, t9
    lhu     t8, 0x0002(t7)             # 00000003
    addu    t9, s1, $ra
    bne     t8, $zero, lbl_800C24B8
    nop
    lbu     t6, 0x0000(s2)             # 8010221C
    lbu     t7, 0x0000(t9)             # 80121F68
    addiu   t8, a2, 0x0001             # t8 = 80120001
    lui     $at, 0x8010                # $at = 80100000
    bne     t6, t7, lbl_800C24B8
    nop
    sb      t8, 0x2B74($at)            # 80102B74
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2208($at)         # 80102208
    lui     $at, 0x8010                # $at = 80100000
    sw      $zero, 0x2238($at)         # 80102238
lbl_800C24B8:
    lui     v0, 0x8012                 # v0 = 80120000
    b       lbl_800C264C
    addiu   v0, v0, 0x1F46             # v0 = 80121F46
lbl_800C24C4:
    lhu     v0, 0x0000(v1)             # 80100000
    addiu   t9, a0, 0xFFEE             # t9 = FFFFFFEE
    addu    a3, s3, t4
    slt     $at, v0, t9
    bne     $at, $zero, lbl_800C2608
    sll     t9, $ra,  2
    lbu     v0, 0x0000(s2)             # 8010221C
    addu    t6, s1, $ra
    addu    t9, t9, $ra
    beql    t5, v0, lbl_800C2528
    lhu     v0, 0x0000(a3)             # 00000000
    lbu     t7, 0x0000(t6)             # 80121F88
    xor     t8, s0, t3
    lui     $at, 0x8012                # $at = 80120000
    bne     v0, t7, lbl_800C2518
    nop
    addiu   $at, $zero, 0x000C         # $at = 0000000C
    bnel    a2, $at, lbl_800C2528
    lhu     v0, 0x0000(a3)             # 00000000
    b       lbl_800C2524
    sh      $zero, 0x0000(v1)          # 80100000
lbl_800C2518:
    sh      t8, 0x1F44($at)            # 00001F50
    lui     s0, 0x8012                 # s0 = 80120000
    lhu     s0, 0x1F44(s0)             # 80121F44
lbl_800C2524:
    lhu     v0, 0x0000(a3)             # 00000000
lbl_800C2528:
    sll     t9, t9,  5
    addu    a2, s4, t9
    addiu   t1, v0, 0x0001             # t1 = 80121F47
    andi    t1, t1, 0xFFFF             # t1 = 00001F47
    sll     t6, v0,  3
    addu    a1, a2, t6
    sh      t1, 0x0000(a3)             # 00000000
    lhu     t8, 0x0002(a1)             # 00000014
    sll     t7, t1,  3
    addu    t2, a2, t7
    sh      t8, 0x0000(t0)             # 00000000
    lbu     t9, 0x0000(a1)             # 00000012
    addu    v1, s1, $ra
    or      a0, t2, $zero              # a0 = 00000000
    andi    t6, t9, 0x00FF             # t6 = 000000EE
    beq     s5, t6, lbl_800C2580
    sb      t9, 0x0000(v1)             # 80100000
    xor     t7, s0, t3
    lui     $at, 0x8012                # $at = 80120000
    sh      t7, 0x1F44($at)            # 80121F44
    lui     s0, 0x8012                 # s0 = 80120000
    lhu     s0, 0x1F44(s0)             # 80121F44
lbl_800C2580:
    lbu     t8, 0x0000(a0)             # 00000000
    lbu     t9, 0x0000(a1)             # 00000012
    beql    t8, t9, lbl_800C25AC
    lhu     t8, 0x0000(t0)             # 00000000
    lbu     t6, 0x0000(t2)             # 00000000
    bne     t5, t6, lbl_800C25FC
    nop
    lhu     t7, 0x0002(t2)             # 00000002
    beq     t7, $zero, lbl_800C25FC
    nop
    lhu     t8, 0x0000(t0)             # 00000000
lbl_800C25AC:
    lhu     t9, 0x0002(a0)             # 00000002
    lhu     v0, 0x0000(a3)             # 00000000
    addu    t6, t8, t9
    addiu   t9, v0, 0x0001             # t9 = 80121F47
    sh      t6, 0x0000(t0)             # 00000000
    sh      t9, 0x0000(a3)             # 00000000
    sll     t7, v0,  3
    sll     t8, v0,  3
    addu    a1, a2, t7
    addu    a0, a2, t8
    lbu     v1, 0x0008(a0)             # 00000008
    lbu     t6, 0x0000(a1)             # 00000012
    addiu   a0, a0, 0x0008             # a0 = 00000008
    beql    v1, t6, lbl_800C25AC
    lhu     t8, 0x0000(t0)             # 00000000
    bne     t5, v1, lbl_800C25FC
    nop
    lhu     t7, 0x0002(a0)             # 0000000A
    bnel    t7, $zero, lbl_800C25AC
    lhu     t8, 0x0000(t0)             # 00000000
lbl_800C25FC:
    lui     v0, 0x8012                 # v0 = 80120000
    b       lbl_800C264C
    addiu   v0, v0, 0x1F46             # v0 = 80121F46
lbl_800C2608:
    slti    $at, v0, 0x000A
    beq     $at, $zero, lbl_800C2630
    addiu   t8, $zero, 0xFFFF          # t8 = FFFFFFFF
    lw      t9, 0x0040($sp)
    lui     v0, 0x8012                 # v0 = 80120000
    sb      t8, 0x0057($sp)
    sh      $zero, 0x0000(v1)          # 80100000
    addiu   v0, v0, 0x1F46             # v0 = 80121F46
    b       lbl_800C264C
    sb      t9, 0x0000(s2)             # 8010221C
lbl_800C2630:
    xor     t6, s0, t3
    lui     $at, 0x8012                # $at = 80120000
    sh      t6, 0x1F44($at)            # 80121F44
    lui     s0, 0x8012                 # s0 = 80120000
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x1F46             # v0 = 80121F46
    lhu     s0, 0x1F44(s0)             # 80121F44
lbl_800C264C:
    bne     s0, $zero, lbl_800C26B0
    lui     t8, 0x8010                 # t8 = 80100000
    lbu     t7, 0x0000(v0)             # 80121F46
    lbu     t8, 0x2B78(t8)             # 80102B78
    slt     $at, t7, t8
    bnel    $at, $zero, lbl_800C26B4
    lw      t9, 0x0034($sp)
    lui     v0, 0x8010                 # v0 = 80100000
    lw      v0, 0x2238(v0)             # 80102238
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2208($at)         # 80102208
    andi    t9, v0, 0x4000             # t9 = 00000000
    beq     t9, $zero, lbl_800C26A4
    sll     t6, $ra,  2
    addu    t6, t6, $ra
    sll     t6, t6,  5
    addu    t7, s4, t6
    lbu     t8, 0x0000(t7)             # 00000001
    lui     $at, 0x8010                # $at = 80100000
    bne     s5, t8, lbl_800C26A4
    nop
    sh      v0, 0x2248($at)            # 80102248
lbl_800C26A4:
    lui     $at, 0x8010                # $at = 80100000
    b       lbl_800C26FC
    sw      $zero, 0x2238($at)         # 80102238
lbl_800C26B0:
    lw      t9, 0x0034($sp)
lbl_800C26B4:
    addiu   $ra, $ra, 0x0001           # $ra = 80120001
    andi    $ra, $ra, 0x00FF           # $ra = 00000001
    slt     $at, $ra, t9
    bne     $at, $zero, lbl_800C2400
    or      a2, $ra, $zero             # a2 = 00000001
lbl_800C26C8:
    lbu     t6, 0x005B($sp)
    lui     v0, 0x8012                 # v0 = 80120000
    lui     s2, 0x8010                 # s2 = 80100000
    addiu   s2, s2, 0x221C             # s2 = 8010221C
    bne     t6, $zero, lbl_800C26FC
    addiu   v0, v0, 0x1F46             # v0 = 80121F46
    lw      t7, 0x0040($sp)
    lbu     t8, 0x0000(v0)             # 80121F46
    lb      t9, 0x0057($sp)
    sb      t7, 0x0000(s2)             # 8010221C
    addu    t6, t8, t9
    addiu   t7, t6, 0x0001             # t7 = 000000EF
    sb      t7, 0x0000(v0)             # 80121F46
lbl_800C26FC:
    lw      $ra, 0x002C($sp)
lbl_800C2700:
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    lw      s4, 0x0024($sp)
    lw      s5, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0060           # $sp += 0x60


func_800C2720:
# MqDbg: 
# Song activation related.
    lui     v0, 0x8012                 # v0 = 80120000
    lw      v0, 0x1F24(v0)             # 80121F24
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x001C($sp)
    andi    t6, v0, 0x0020             # t6 = 00000000
    beq     t6, $zero, lbl_800C2758
    sw      s0, 0x0018($sp)
    andi    t7, v0, 0x800F             # t7 = 00000000
    beq     t7, $zero, lbl_800C2758
    lui     a0, 0x8010                 # a0 = 80100000
    jal     func_800C2124
    lhu     a0, 0x223A(a0)             # 8010223A
    b       lbl_800C295C
    lw      $ra, 0x001C($sp)
lbl_800C2758:
    jal     func_800C22DC
    nop
    lui     t8, 0x8012                 # t8 = 80120000
    lbu     t8, 0x1F41(t8)             # 80121F41
    lui     a1, 0x8010                 # a1 = 80100000
    lui     t9, 0x8010                 # t9 = 80100000
    beql    t8, $zero, lbl_800C295C
    lw      $ra, 0x001C($sp)
    lbu     a1, 0x2210(a1)             # 80102210
    lbu     t9, 0x2214(t9)             # 80102214
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    beql    a1, t9, lbl_800C295C
    lw      $ra, 0x001C($sp)
    beq     a1, $at, lbl_800C2958
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x1F46             # v0 = 80121F46
    lbu     t6, 0x0000(v0)             # 80121F46
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x1F40             # v1 = 80121F40
    addiu   t7, t6, 0x0001             # t7 = 00000001
    andi    t8, t7, 0x00FF             # t8 = 00000001
    slti    $at, t8, 0x0009
    bne     $at, $zero, lbl_800C27C0
    sb      t7, 0x0000(v0)             # 80121F46
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    sb      t9, 0x0000(v0)             # 80121F46
lbl_800C27C0:
    lbu     v0, 0x0000(v1)             # 80121F40
    addiu   $at, $zero, 0x0008         # $at = 00000008
    or      t3, $zero, $zero           # t3 = 00000000
    bne     v0, $at, lbl_800C280C
    or      t2, v0, $zero              # t2 = 80121F46
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x1F38             # v0 = 80121F38
    or      t4, $zero, $zero           # t4 = 00000000
lbl_800C27E0:
    addu    t8, v0, t3
    addiu   t3, t3, 0x0001             # t3 = 00000001
    addu    t6, v0, t4
    lbu     t7, 0x0001(t6)             # 00000001
    andi    t3, t3, 0x00FF             # t3 = 00000001
    slti    $at, t3, 0x0007
    or      t4, t3, $zero              # t4 = 00000001
    bne     $at, $zero, lbl_800C27E0
    sb      t7, 0x0000(t8)             # 00000001
    b       lbl_800C2820
    nop
lbl_800C280C:
    addiu   t9, v0, 0x0001             # t9 = 80121F39
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x1F38             # v0 = 80121F38
    sb      t9, 0x0000(v1)             # 80121F40
    andi    t2, t9, 0x00FF             # t2 = 00000039
lbl_800C2820:
    lui     v1, 0x8010                 # v1 = 80100000
    lb      v1, 0x2228(v1)             # 80102228
    lui     t3, 0x8012                 # t3 = 80120000
    lui     t5, 0x8012                 # t5 = 80120000
    bgez    v1, lbl_800C2840
    or      a0, v1, $zero              # a0 = 80100000
    b       lbl_800C2840
    subu    a0, $zero, v1
lbl_800C2840:
    slti    $at, a0, 0x0015
    bne     $at, $zero, lbl_800C285C
    addu    $ra, v0, t2
    addu    $ra, v0, t2
    addiu   t6, $zero, 0x00FF          # t6 = 000000FF
    b       lbl_800C2860
    sb      t6, -0x0001($ra)           # FFFFFFFF
lbl_800C285C:
    sb      a1, -0x0001($ra)           # FFFFFFFF
lbl_800C2860:
    lbu     t3, 0x1F42(t3)             # 80121F42
    lbu     t5, 0x1F43(t5)             # 80121F43
    lui     s0, 0x8012                 # s0 = 80120000
    lui     t1, 0x8010                 # t1 = 80100000
    slt     $at, t3, t5
    beq     $at, $zero, lbl_800C2958
    or      t4, t3, $zero              # t4 = 80120000
    lhu     s0, 0x1F44(s0)             # 80121F44
    addiu   t1, t1, 0x2268             # t1 = 80102268
lbl_800C2884:
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    sllv    t8, t7, t4
    andi    t9, t8, 0xFFFF             # t9 = 00000001
    and     t6, s0, t9
    beq     t6, $zero, lbl_800C2944
    sll     t7, t3,  3
    lui     t8, 0x8010                 # t8 = 80100000
    addiu   t8, t8, 0x2EFC             # t8 = 80102EFC
    addu    t7, t7, t3
    addu    t0, t7, t8
    lbu     a2, 0x0000(t0)             # 00000000
    or      v1, $zero, $zero           # v1 = 00000000
    or      a1, $zero, $zero           # a1 = 00000000
    blez    a2, lbl_800C2924
    slt     $at, t2, a2
    bne     $at, $zero, lbl_800C2924
    subu    t9, $zero, a2
    addu    a3, $ra, t9
    or      a0, $zero, $zero           # a0 = 00000000
    addu    t7, t0, v1
lbl_800C28D4:
    lbu     t8, 0x0001(t7)             # 00000002
    addu    t6, a3, a0
    lbu     v0, 0x0000(t6)             # 000000FF
    addu    t9, t1, t8
    lbu     t6, 0x0000(t9)             # 00000001
    bnel    v0, t6, lbl_800C2904
    addiu   a1, a1, 0x0001             # a1 = 00000001
    addiu   v1, v1, 0x0001             # v1 = 00000001
    andi    v1, v1, 0x00FF             # v1 = 00000001
    b       lbl_800C2908
    or      a0, v1, $zero              # a0 = 00000001
    addiu   a1, a1, 0x0001             # a1 = 00000002
lbl_800C2904:
    andi    a1, a1, 0x00FF             # a1 = 00000002
lbl_800C2908:
    slt     $at, a0, a2
    beq     $at, $zero, lbl_800C2924
    nop
    bne     a1, $zero, lbl_800C2924
    slt     $at, t2, a2
    beql    $at, $zero, lbl_800C28D4
    addu    t7, t0, v1
lbl_800C2924:
    bne     v1, a2, lbl_800C2944
    addiu   t7, t4, 0x0001             # t7 = 80120001
    lui     $at, 0x8010                # $at = 80100000
    sb      t7, 0x2B74($at)            # 80102B74
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2208($at)         # 80102208
    lui     $at, 0x8010                # $at = 80100000
    sw      $zero, 0x2238($at)         # 80102238
lbl_800C2944:
    addiu   t3, t3, 0x0001             # t3 = 80120001
    andi    t3, t3, 0x00FF             # t3 = 00000001
    slt     $at, t3, t5
    bne     $at, $zero, lbl_800C2884
    or      t4, t3, $zero              # t4 = 00000001
lbl_800C2958:
    lw      $ra, 0x001C($sp)
lbl_800C295C:
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C296C:
# MqDbg: 
    lui     t6, 0x8010                 # t6 = 80100000
    lw      t6, 0x2238(t6)             # 80102238
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x001C($sp)
    beq     t6, $zero, lbl_800C29A0
    sw      a0, 0x0020($sp)
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x2B7C             # v1 = 80102B7C
    lbu     v0, 0x0000(v1)             # 80102B7C
    beq     v0, $zero, lbl_800C29A0
    addiu   t7, v0, 0xFFFF             # t7 = FFFFFFFF
    b       lbl_800C2C70
    sb      t7, 0x0000(v1)             # 80102B7C
lbl_800C29A0:
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x1F28             # v1 = 80121F28
    lw      v0, 0x0000(v1)             # 80121F28
    beq     v0, $zero, lbl_800C29C8
    lui     t8, 0x8012                 # t8 = 80120000
    lw      t8, 0x1F24(t8)             # 80121F24
    andi    t2, v0, 0x800F             # t2 = 00000000
    andi    t9, t8, 0x800F             # t9 = 00000000
    beql    t9, t2, lbl_800C2C74
    lw      $ra, 0x001C($sp)
lbl_800C29C8:
    sw      $zero, 0x0000(v1)          # 80121F28
    lui     a2, 0x8012                 # a2 = 80120000
    lw      a2, 0x1F24(a2)             # 80121F24
    lui     a1, 0x8010                 # a1 = 80100000
    addiu   t0, $zero, 0x00FF          # t0 = 000000FF
    lui     t1, 0x8010                 # t1 = 80100000
    addiu   t1, t1, 0x2210             # t1 = 80102210
    addiu   a1, a1, 0x2218             # a1 = 80102218
    sb      t0, 0x0000(t1)             # 80102210
    sb      t0, 0x0000(a1)             # 80102218
    lui     t3, 0x8012                 # t3 = 80120000
    lw      t3, 0x1F2C(t3)             # 80121F2C
    lui     a0, 0x8012                 # a0 = 80120000
    addiu   a0, a0, 0x1F30             # a0 = 80121F30
    lw      t4, 0x0000(a0)             # 80121F30
    andi    a3, a2, 0x800F             # a3 = 00000000
    and     v0, a3, t3
    andi    v0, v0, 0x800F             # v0 = 00000000
    and     v1, t4, v0
    bne     v1, $zero, lbl_800C2A2C
    addiu   t6, $zero, 0x0002          # t6 = 00000002
    beql    a2, $zero, lbl_800C2A30
    sw      v1, 0x0000(a0)             # 80121F30
    b       lbl_800C2A30
    sw      a2, 0x0000(a0)             # 80121F30
lbl_800C2A2C:
    sw      v1, 0x0000(a0)             # 80121F30
lbl_800C2A30:
    lw      v0, 0x0000(a0)             # 80121F30
    lui     a0, 0x8010                 # a0 = 80100000
    lui     $at, 0x3F80                # $at = 3F800000
    andi    t5, v0, 0x8000             # t5 = 00000000
    beq     t5, $zero, lbl_800C2A54
    andi    t7, v0, 0x0004             # t7 = 00000000
    sb      t6, 0x0000(t1)             # 80102210
    b       lbl_800C2ABC
    sb      $zero, 0x0000(a1)          # 80102218
lbl_800C2A54:
    beq     t7, $zero, lbl_800C2A70
    andi    t2, v0, 0x0001             # t2 = 00000000
    addiu   t8, $zero, 0x0005          # t8 = 00000005
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    sb      t8, 0x0000(t1)             # 80102210
    b       lbl_800C2ABC
    sb      t9, 0x0000(a1)             # 80102218
lbl_800C2A70:
    beq     t2, $zero, lbl_800C2A8C
    andi    t5, v0, 0x0002             # t5 = 00000000
    addiu   t3, $zero, 0x0009          # t3 = 00000009
    addiu   t4, $zero, 0x0002          # t4 = 00000002
    sb      t3, 0x0000(t1)             # 80102210
    b       lbl_800C2ABC
    sb      t4, 0x0000(a1)             # 80102218
lbl_800C2A8C:
    beq     t5, $zero, lbl_800C2AA8
    andi    t8, v0, 0x0008             # t8 = 00000000
    addiu   t6, $zero, 0x000B          # t6 = 0000000B
    addiu   t7, $zero, 0x0003          # t7 = 00000003
    sb      t6, 0x0000(t1)             # 80102210
    b       lbl_800C2ABC
    sb      t7, 0x0000(a1)             # 80102218
lbl_800C2AA8:
    beq     t8, $zero, lbl_800C2ABC
    addiu   t9, $zero, 0x000E          # t9 = 0000000E
    addiu   t2, $zero, 0x0004          # t2 = 00000004
    sb      t9, 0x0000(t1)             # 80102210
    sb      t2, 0x0000(a1)             # 80102218
lbl_800C2ABC:
    lbu     v1, 0x0000(t1)             # 80102210
    addiu   a3, $zero, 0x00FF          # a3 = 000000FF
    andi    t3, a2, 0x0010             # t3 = 00000000
    beq     a3, v1, lbl_800C2B04
    or      v0, v1, $zero              # v0 = 80121F28
    beq     t3, $zero, lbl_800C2B04
    lui     t4, 0x8010                 # t4 = 80100000
    lbu     t4, 0x2B54(t4)             # 80102B54
    addiu   t0, $zero, 0x0002          # t0 = 00000002
    addiu   t7, v1, 0x0001             # t7 = 80121F29
    beql    t0, t4, lbl_800C2B08
    addiu   t0, $zero, 0x0002          # t0 = 00000002
    lbu     t5, 0x0000(a1)             # 80102218
    andi    v1, t7, 0x00FF             # v1 = 00000029
    or      v0, v1, $zero              # v0 = 00000029
    addiu   t6, t5, 0x0080             # t6 = 00000080
    sb      t6, 0x0000(a1)             # 80102218
    sb      t7, 0x0000(t1)             # 80102210
lbl_800C2B04:
    addiu   t0, $zero, 0x0002          # t0 = 00000002
lbl_800C2B08:
    beq     a3, v0, lbl_800C2B38
    lbu     a0, 0x2B54(a0)             # 80102B54
    andi    t8, a2, 0x2000             # t8 = 00000000
    beq     t8, $zero, lbl_800C2B38
    nop
    beq     t0, a0, lbl_800C2B38
    nop
    lbu     t9, 0x0000(a1)             # 80102218
    addiu   t3, v1, 0xFFFF             # t3 = 00000028
    sb      t3, 0x0000(t1)             # 80102210
    addiu   t2, t9, 0x0040             # t2 = 0000004E
    sb      t2, 0x0000(a1)             # 80102218
lbl_800C2B38:
    beq     t0, a0, lbl_800C2BB0
    lui     v1, 0x8010                 # v1 = 80100000
    lui     t4, 0x8012                 # t4 = 80120000
    lb      t4, 0x1F21(t4)             # 80121F21
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x2228             # v1 = 80102228
    sb      t4, 0x0000(v1)             # 80102228
    jal     func_800C1F80
    lb      a0, 0x0000(v1)             # 80102228
    lui     v0, 0x8012                 # v0 = 80120000
    lb      v0, 0x1F20(v0)             # 80121F20
    lui     $at, 0x8010                # $at = 80100000
    swc1    $f0, 0x2220($at)           # 80102220
    bgez    v0, lbl_800C2B7C
    lui     a0, 0x0602                 # a0 = 06020000
    b       lbl_800C2B80
    subu    v1, $zero, v0
lbl_800C2B7C:
    or      v1, v0, $zero              # v1 = 80120000
lbl_800C2B80:
    lui     v0, 0x8010                 # v0 = 80100000
    addiu   v0, v0, 0x2230             # v0 = 80102230
    sra     t5, v1,  2
    sb      t5, 0x0000(v0)             # 80102230
    lb      a1, 0x0000(v0)             # 80102230
    jal     func_800BB0E0
    ori     a0, a0, 0x0D06             # a0 = 06020D06
    lui     t1, 0x8010                 # t1 = 80100000
    addiu   t1, t1, 0x2210             # t1 = 80102210
    lbu     v0, 0x0000(t1)             # 80102210
    b       lbl_800C2BC8
    addiu   a3, $zero, 0x00FF          # a3 = 000000FF
lbl_800C2BB0:
    mtc1    $at, $f4                   # $f4 = 0.00
    addiu   v1, v1, 0x2228             # v1 = 00002228
    sb      $zero, 0x0000(v1)          # 00002228
    lui     $at, 0x8010                # $at = 80100000
    swc1    $f4, 0x2220($at)           # 80102220
    lbu     v0, 0x0000(t1)             # 80102210
lbl_800C2BC8:
    beq     a3, v0, lbl_800C2C50
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x2214(t6)             # 80102214
    lui     a1, 0x8010                 # a1 = 80100000
    beq     v0, t6, lbl_800C2C50
    nop
    lb      a1, 0x220C(a1)             # 8010220C
    lui     a0, 0x0602                 # a0 = 06020000
    ori     a0, a0, 0x0D07             # a0 = 06020D07
    addiu   a1, a1, 0xFFFF             # a1 = 800FFFFF
    sll     a1, a1, 24
    jal     func_800BB0E0
    sra     a1, a1, 24
    lui     t1, 0x8010                 # t1 = 80100000
    addiu   t1, t1, 0x2210             # t1 = 80102210
    lui     a0, 0x0602                 # a0 = 06020000
    ori     a0, a0, 0x0D05             # a0 = 06020D05
    jal     func_800BB0E0
    lb      a1, 0x0000(t1)             # 80102210
    lui     t7, 0x8010                 # t7 = 80100000
    lui     t8, 0x8010                 # t8 = 80100000
    addiu   t8, t8, 0x43A8             # t8 = 801043A8
    addiu   t7, t7, 0x2224             # t7 = 80102224
    lui     a1, 0x8010                 # a1 = 80100000
    lui     a3, 0x8010                 # a3 = 80100000
    addiu   a3, a3, 0x2220             # a3 = 80102220
    addiu   a1, a1, 0x4394             # a1 = 80104394
    sw      t7, 0x0010($sp)
    sw      t8, 0x0014($sp)
    addiu   a0, $zero, 0x5800          # a0 = 00005800
    jal     func_800C806C
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    b       lbl_800C2C74
    lw      $ra, 0x001C($sp)
lbl_800C2C50:
    lui     t9, 0x8010                 # t9 = 80100000
    lbu     t9, 0x2214(t9)             # 80102214
    beql    a3, t9, lbl_800C2C74
    lw      $ra, 0x001C($sp)
    bnel    a3, v0, lbl_800C2C74
    lw      $ra, 0x001C($sp)
    jal     func_800C9884
    addiu   a0, $zero, 0x5800          # a0 = 00005800
lbl_800C2C70:
    lw      $ra, 0x001C($sp)
lbl_800C2C74:
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C2C80:
# MqDbg: 
# sw A0, 0x0000(SP)
# sb a0, 0x80102208
    lui     $at, 0x8010                # $at = 80100000
    sw      a0, 0x0000($sp)
    jr      $ra
    sb      a0, 0x2208($at)            # 80102208


func_800C2C90:
# MqDbg: 
# Handles setting the instrument for song playback?
# A0 = Instrument
    lui     t6, 0x8010                 # t6 = 80100000
    lb      t6, 0x220C(t6)             # 8010220C
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a0, 0x0020($sp)
    andi    a0, a0, 0x00FF             # a0 = 00000000
    sw      $ra, 0x0014($sp)
    beq     a0, t6, lbl_800C2D64
    or      v0, a0, $zero              # v0 = 00000000
    lui     $at, 0x8201                # $at = 82010000
    ori     $at, $at, 0x0D00           # $at = 82010D00
    or      a0, a0, $at                # a0 = 82010D00
    jal     func_800CAA70
    sw      v0, 0x001C($sp)
    lw      v0, 0x001C($sp)
    lui     $at, 0x8010                # $at = 80100000
    ori     t7, $zero, 0xFFFF          # t7 = 0000FFFF
    bne     v0, $zero, lbl_800C2D40
    sb      v0, 0x220C($at)            # 8010220C
    lui     $at, 0x8012                # $at = 80120000
    sw      $zero, 0x1F24($at)         # 80121F24
    lui     $at, 0x8012                # $at = 80120000
    sw      $zero, 0x1F2C($at)         # 80121F2C
    lui     $at, 0x8012                # $at = 80120000
    sw      $zero, 0x1F30($at)         # 80121F30
    lui     $at, 0x8012                # $at = 80120000
    sw      t7, 0x1F28($at)            # 80121F28
    jal     func_800C296C
    or      a0, $zero, $zero           # a0 = 00000000
    jal     func_800C9884
    addiu   a0, $zero, 0x5800          # a0 = 00005800
    jal     func_800C7F40
    or      a0, $zero, $zero           # a0 = 00000000
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2234($at)         # 80102234
    lui     $at, 0x8010                # $at = 80100000
    sh      $zero, 0x2244($at)         # 80102244
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2208($at)         # 80102208
    lui     $at, 0x8010                # $at = 80100000
    sw      $zero, 0x2238($at)         # 80102238
    jal     func_800C7FFC
    addiu   a0, $zero, 0x000D          # a0 = 0000000D
    b       lbl_800C2D68
    lw      $ra, 0x0014($sp)
lbl_800C2D40:
    lui     $at, 0x8012                # $at = 80120000
    jal     func_800C1F20
    sw      $zero, 0x1F24($at)         # 80121F24
    lui     t8, 0x8012                 # t8 = 80120000
    lw      t8, 0x1F24(t8)             # 80121F24
    lui     $at, 0x8012                # $at = 80120000
    addiu   a0, $zero, 0x000D          # a0 = 0000000D
    jal     func_800C7F98
    sw      t8, 0x1F28($at)            # 80121F28
lbl_800C2D64:
    lw      $ra, 0x0014($sp)
lbl_800C2D68:
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C2D74:
# MqDbg: 
# Song playback related.
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      a0, 0x0018($sp)
    sll     a0, a0, 24
    sra     a0, a0, 24
    sll     a2, a1, 24
    sra     a2, a2, 24
    sw      $ra, 0x0014($sp)
    bne     a0, $zero, lbl_800C2DB0
    sw      a1, 0x001C($sp)
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2234($at)         # 80102234
    jal     func_800C9884
    addiu   a0, $zero, 0x5800          # a0 = 00005800
    b       lbl_800C2E68
    lw      $ra, 0x0014($sp)
lbl_800C2DB0:
    slti    $at, a0, 0x000F
    beq     $at, $zero, lbl_800C2DE8
    lui     v1, 0x8010                 # v1 = 80100000
    sll     t6, a0,  2
    addu    t6, t6, a0
    sll     t6, t6,  5
    lui     t8, 0x8010                 # t8 = 80100000
    lui     a3, 0x8010                 # a3 = 80100000
    addiu   t8, t8, 0x227C             # t8 = 8010227C
    addiu   t7, t6, 0xFF60             # t7 = FFFFFF60
    addiu   a3, a3, 0x2B3C             # a3 = 80102B3C
    addu    t9, t7, t8
    b       lbl_800C2DFC
    sw      t9, 0x0000(a3)             # 80102B3C
lbl_800C2DE8:
    lui     a3, 0x8010                 # a3 = 80100000
    lui     t0, 0x8010                 # t0 = 80100000
    addiu   a3, a3, 0x2B3C             # a3 = 80102B3C
    addiu   t0, t0, 0x2B80             # t0 = 80102B80
    sw      t0, 0x0000(a3)             # 80102B3C
lbl_800C2DFC:
    lui     $at, 0x8010                # $at = 80100000
    sb      a2, 0x2234($at)            # 80102234
    lui     $at, 0x8010                # $at = 80100000
    sw      $zero, 0x223C($at)         # 8010223C
    lui     $at, 0x8010                # $at = 80100000
    addiu   t1, $zero, 0x00FF          # t1 = 000000FF
    sb      t1, 0x224C($at)            # 8010224C
    addiu   v1, v1, 0x2240             # v1 = 80102240
    sh      $zero, 0x0000(v1)          # 80102240
    lui     $at, 0x8010                # $at = 80100000
    sh      $zero, 0x2244($at)         # 80102244
    lhu     v0, 0x0000(v1)             # 80102240
    lw      a0, 0x0000(a3)             # 80102B3C
    addiu   a1, $zero, 0x00FF          # a1 = 000000FF
    sll     t2, v0,  3
    addu    t3, a0, t2
    lbu     t4, 0x0000(t3)             # 00000000
    bne     a1, t4, lbl_800C2E64
    addiu   t5, v0, 0x0001             # t5 = 00000001
lbl_800C2E48:
    andi    v0, t5, 0xFFFF             # v0 = 00000001
    sll     t6, v0,  3
    addu    t7, a0, t6
    sh      t5, 0x0000(v1)             # 80102240
    lbu     t8, 0x0000(t7)             # FFFFFF60
    beql    a1, t8, lbl_800C2E48
    addiu   t5, v0, 0x0001             # t5 = 00000002
lbl_800C2E64:
    lw      $ra, 0x0014($sp)
lbl_800C2E68:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C2E74:
# MqDbg: 
    lui     t0, 0x8010                 # t0 = 80100000
    addiu   t0, t0, 0x2234             # t0 = 80102234
    lbu     a3, 0x0000(t0)             # 80102234
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x001C($sp)
    beq     a3, $zero, lbl_800C3190
    lui     t1, 0x8010                 # t1 = 80100000
    addiu   t1, t1, 0x2244             # t1 = 80102244
    lhu     t6, 0x0000(t1)             # 80102244
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x223C             # v1 = 8010223C
    bne     t6, $zero, lbl_800C2EB0
    lui     t7, 0x8012                 # t7 = 80120000
    b       lbl_800C2EC0
    addiu   a0, $zero, 0x0003          # a0 = 00000003
lbl_800C2EB0:
    lui     t8, 0x8010                 # t8 = 80100000
    lw      t8, 0x2264(t8)             # 80102264
    lw      t7, 0x1F1C(t7)             # 80121F1C
    subu    a0, t7, t8
lbl_800C2EC0:
    lw      v0, 0x0000(v1)             # 8010223C
    lui     a2, 0x8010                 # a2 = 80100000
    lui     a1, 0x8010                 # a1 = 80100000
    sltu    $at, a0, v0
    beq     $at, $zero, lbl_800C2EE4
    subu    t2, a0, v0
    subu    t9, v0, a0
    b       lbl_800C2EEC
    sw      t9, 0x0000(v1)             # 8010223C
lbl_800C2EE4:
    sw      t2, 0x0020($sp)
    sw      $zero, 0x0000(v1)          # 8010223C
lbl_800C2EEC:
    lw      t3, 0x0000(v1)             # 8010223C
    bnel    t3, $zero, lbl_800C3194
    lw      $ra, 0x001C($sp)
    lhu     a1, 0x2240(a1)             # 80102240
    lw      a2, 0x2B3C(a2)             # 80102B3C
    addiu   $at, $zero, 0x0001         # $at = 00000001
    sll     t4, a1,  3
    addu    a0, a2, t4
    lhu     t5, 0x0002(a0)             # 00000005
    addiu   t8, a3, 0xFFFF             # t8 = FFFFFFFF
    bne     a1, $at, lbl_800C2F24
    sw      t5, 0x0000(v1)             # 8010223C
    addiu   t7, t5, 0x0001             # t7 = 00000001
    sw      t7, 0x0000(v1)             # 8010223C
lbl_800C2F24:
    lw      v0, 0x0000(v1)             # 8010223C
    lw      t3, 0x0020($sp)
    andi    t9, t8, 0x00FF             # t9 = 000000FF
    bne     v0, $zero, lbl_800C2F70
    subu    t4, v0, t3
    beq     t9, $zero, lbl_800C2F60
    sb      t8, 0x0000(t0)             # 80102234
    lui     a2, 0x8010                 # a2 = 80100000
    lui     $at, 0x8010                # $at = 80100000
    addiu   a2, a2, 0x224C             # a2 = 8010224C
    sh      $zero, 0x2240($at)         # 80102240
    addiu   t2, $zero, 0x00FF          # t2 = 000000FF
    sh      $zero, 0x0000(t1)          # 80102244
    b       lbl_800C3190
    sb      t2, 0x0000(a2)             # 8010224C
lbl_800C2F60:
    jal     func_800C9884
    addiu   a0, $zero, 0x5800          # a0 = 00005800
    b       lbl_800C3194
    lw      $ra, 0x001C($sp)
lbl_800C2F70:
    sw      t4, 0x0000(v1)             # 00000000
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x2250             # v1 = 80102250
    lbu     t5, 0x0000(v1)             # 80102250
    lbu     v0, 0x0004(a0)             # 00000004
    beq     t5, v0, lbl_800C2FC0
    andi    t6, v0, 0x00FF             # t6 = 00000000
    mtc1    t6, $f4                    # $f4 = 0.00
    sb      v0, 0x0000(v1)             # 80102250
    bgez    t6, lbl_800C2FAC
    cvt.s.w $f6, $f4
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f6, $f6, $f8
lbl_800C2FAC:
    lui     $at, 0x42FE                # $at = 42FE0000
    mtc1    $at, $f10                  # $f10 = 127.00
    lui     $at, 0x8010                # $at = 80100000
    div.s   $f16, $f6, $f10
    swc1    $f16, 0x2260($at)          # 80102260
lbl_800C2FC0:
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x2254             # v1 = 80102254
    lbu     t7, 0x0000(v1)             # 80102254
    lbu     v0, 0x0005(a0)             # 00000005
    beq     t7, v0, lbl_800C300C
    nop
    sb      v0, 0x0000(v1)             # 80102254
    lui     a0, 0x0602                 # a0 = 06020000
    ori     a0, a0, 0x0D06             # a0 = 06020D06
    jal     func_800BB0E0
    lb      a1, 0x0000(v1)             # 80102254
    lui     a1, 0x8010                 # a1 = 80100000
    lhu     a1, 0x2240(a1)             # 80102240
    lui     a2, 0x8010                 # a2 = 80100000
    lw      a2, 0x2B3C(a2)             # 80102B3C
    lui     t1, 0x8010                 # t1 = 80100000
    sll     t8, a1,  3
    addiu   t1, t1, 0x2244             # t1 = 80102244
    addu    a0, a2, t8
lbl_800C300C:
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x2258             # v1 = 80102258
    lb      t9, 0x0000(v1)             # 80102258
    lb      v0, 0x0006(a0)             # 00000006
    beql    t9, v0, lbl_800C305C
    sll     t3, a1,  3
    sb      v0, 0x0000(v1)             # 80102258
    jal     func_800C1F80
    lb      a0, 0x0000(v1)             # 80102258
    lui     a1, 0x8010                 # a1 = 80100000
    lhu     a1, 0x2240(a1)             # 80102240
    lui     a2, 0x8010                 # a2 = 80100000
    lw      a2, 0x2B3C(a2)             # 80102B3C
    lui     t1, 0x8010                 # t1 = 80100000
    lui     $at, 0x8010                # $at = 80100000
    sll     t2, a1,  3
    swc1    $f0, 0x225C($at)           # 8010225C
    addiu   t1, t1, 0x2244             # t1 = 80102244
    addu    a0, a2, t2
    sll     t3, a1,  3
lbl_800C305C:
    addu    v0, a2, t3
    lbu     t5, -0x0004(v0)            # FFFFFFFC
    lbu     t4, 0x0004(a0)             # 00000004
    addiu   $at, $zero, 0x000A         # $at = 0000000A
    bne     t4, t5, lbl_800C30A0
    nop
    lbu     t6, 0x0005(a0)             # 00000005
    lbu     t7, -0x0003(v0)            # FFFFFFFD
    bne     t6, t7, lbl_800C30A0
    nop
    lb      t8, 0x0006(a0)             # 00000006
    lb      t9, -0x0002(v0)            # FFFFFFFE
    lui     a2, 0x8010                 # a2 = 80100000
    addiu   a2, a2, 0x224C             # a2 = 8010224C
    bne     t8, t9, lbl_800C30A0
    addiu   t2, $zero, 0x00FE          # t2 = 000000FE
    sb      t2, 0x0000(a2)             # 8010224C
lbl_800C30A0:
    lui     a2, 0x8010                 # a2 = 80100000
    addiu   a2, a2, 0x224C             # a2 = 8010224C
    lbu     t3, 0x0000(a2)             # 8010224C
    lbu     v0, 0x0000(a0)             # 00000000
    beq     t3, v0, lbl_800C3184
    andi    v1, v0, 0x00FF             # v1 = 00000000
    bne     v1, $at, lbl_800C30D0
    or      a1, v1, $zero              # a1 = 00000000
    lbu     t4, 0x0007(a0)             # 00000007
    addu    t5, t4, a1
    b       lbl_800C30D4
    sb      t5, 0x0000(a2)             # 8010224C
lbl_800C30D0:
    sb      v1, 0x0000(a2)             # 8010224C
lbl_800C30D4:
    lbu     t6, 0x0000(a2)             # 8010224C
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    beq     t6, $at, lbl_800C3174
    nop
    lhu     t7, 0x0000(t1)             # 80102244
    lui     a1, 0x8010                 # a1 = 80100000
    lui     a0, 0x0602                 # a0 = 06020000
    addiu   t8, t7, 0x0001             # t8 = 00000001
    sh      t8, 0x0000(t1)             # 80102244
    lb      a1, 0x220C(a1)             # 8010220C
    ori     a0, a0, 0x0D07             # a0 = 06020D07
    addiu   a1, a1, 0xFFFF             # a1 = 800FFFFF
    sll     a1, a1, 24
    jal     func_800BB0E0
    sra     a1, a1, 24
    lui     a2, 0x8010                 # a2 = 80100000
    addiu   a2, a2, 0x224C             # a2 = 8010224C
    lbu     a1, 0x0000(a2)             # 8010224C
    lui     a0, 0x0602                 # a0 = 06020000
    ori     a0, a0, 0x0D05             # a0 = 06020D05
    andi    a1, a1, 0x003F             # a1 = 00000000
    sll     a1, a1, 24
    jal     func_800BB0E0
    sra     a1, a1, 24
    lui     t9, 0x8010                 # t9 = 80100000
    lui     t2, 0x8010                 # t2 = 80100000
    addiu   t2, t2, 0x43A8             # t2 = 801043A8
    addiu   t9, t9, 0x2260             # t9 = 80102260
    lui     a1, 0x8010                 # a1 = 80100000
    lui     a3, 0x8010                 # a3 = 80100000
    addiu   a3, a3, 0x225C             # a3 = 8010225C
    addiu   a1, a1, 0x4394             # a1 = 80104394
    sw      t9, 0x0010($sp)
    sw      t2, 0x0014($sp)
    addiu   a0, $zero, 0x5800          # a0 = 00005800
    jal     func_800C806C
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    lui     a1, 0x8010                 # a1 = 80100000
    b       lbl_800C3184
    lhu     a1, 0x2240(a1)             # 80102240
lbl_800C3174:
    jal     func_800C9884
    addiu   a0, $zero, 0x5800          # a0 = 00005800
    lui     a1, 0x8010                 # a1 = 80100000
    lhu     a1, 0x2240(a1)             # 80102240
lbl_800C3184:
    addiu   t3, a1, 0x0001             # t3 = 80100001
    lui     $at, 0x8010                # $at = 80100000
    sh      t3, 0x2240($at)            # 80102240
lbl_800C3190:
    lw      $ra, 0x001C($sp)
lbl_800C3194:
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800C31A0:
# MqDbg: 
# Song playback & activation related.
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    lui     $ra, 0x8010                # $ra = 80100000
    addiu   $ra, $ra, 0x2B54           # $ra = 80102B54
    lbu     t6, 0x0000($ra)            # 80102B54
    addiu   $at, $zero, 0x0001         # $at = 00000001
    sw      a0, 0x0020($sp)
    bne     t6, $at, lbl_800C31D0
    lui     v0, 0x8010                 # v0 = 80100000
    lui     a0, 0x8010                 # a0 = 80100000
    b       lbl_800C31D8
    lw      a0, 0x2EE0(a0)             # 80102EE0
lbl_800C31D0:
    lui     a0, 0x8010                 # a0 = 80100000
    lw      a0, 0x2EE8(a0)             # 80102EE8
lbl_800C31D8:
    lui     t5, 0x8010                 # t5 = 80100000
    addiu   t5, t5, 0x2B58             # t5 = 80102B58
    lbu     t8, 0x0000(t5)             # 80102B58
    addiu   v0, v0, 0x2B60             # v0 = 80102B60
    lbu     t7, 0x0000(v0)             # 80102B60
    sll     t9, t8,  3
    addu    t6, a0, t9
    sb      t7, 0x0000(t6)             # 00000000
    lui     t9, 0x8010                 # t9 = 80100000
    lui     t8, 0x8012                 # t8 = 80120000
    lw      t8, 0x1F1C(t8)             # 80121F1C
    lw      t9, 0x2B5C(t9)             # 80102B5C
    lbu     t6, 0x0000(t5)             # 80102B58
    lui     v1, 0x8010                 # v1 = 80100000
    subu    t7, t8, t9
    sll     t8, t6,  3
    addu    t9, a0, t8
    sh      t7, 0x0002(t9)             # 80100002
    lbu     t8, 0x0000(t5)             # 80102B58
    addiu   v1, v1, 0x2B64             # v1 = 80102B64
    lbu     t6, 0x0000(v1)             # 80102B64
    sll     t7, t8,  3
    addu    t9, a0, t7
    sb      t6, 0x0004(t9)             # 80100004
    lbu     t7, 0x0000(t5)             # 80102B58
    lui     a1, 0x8010                 # a1 = 80100000
    addiu   a1, a1, 0x2B68             # a1 = 80102B68
    lbu     t8, 0x0000(a1)             # 80102B68
    sll     t6, t7,  3
    addu    t9, a0, t6
    sb      t8, 0x0005(t9)             # 80100005
    lbu     t6, 0x0000(t5)             # 80102B58
    lui     t0, 0x8010                 # t0 = 80100000
    addiu   t0, t0, 0x2B6C             # t0 = 80102B6C
    lb      t7, 0x0000(t0)             # 80102B6C
    sll     t8, t6,  3
    addu    t9, a0, t8
    lui     t1, 0x8010                 # t1 = 80100000
    sb      t7, 0x0006(t9)             # 80100006
    addiu   t1, t1, 0x2B70             # t1 = 80102B70
    lbu     t6, 0x0000(t1)             # 80102B70
    lbu     t7, 0x0000(t5)             # 80102B58
    addiu   $at, $zero, 0x006B         # $at = 0000006B
    andi    t8, t6, 0x00C0             # t8 = 00000000
    sll     t9, t7,  3
    addu    t6, a0, t9
    sb      t8, 0x0007(t6)             # 00000007
    lui     t7, 0x8010                 # t7 = 80100000
    lbu     t7, 0x2210(t7)             # 80102210
    lui     t9, 0x8010                 # t9 = 80100000
    lui     t8, 0x8010                 # t8 = 80100000
    sb      t7, 0x0000(v0)             # 80102B60
    lb      t9, 0x222C(t9)             # 8010222C
    lui     t6, 0x8010                 # t6 = 80100000
    lui     t7, 0x8010                 # t7 = 80100000
    sb      t9, 0x0000(v1)             # 80102B64
    lb      t8, 0x2230(t8)             # 80102230
    lbu     t9, 0x0000(t5)             # 80102B58
    sb      t8, 0x0000(a1)             # 80102B68
    lb      t6, 0x2228(t6)             # 80102228
    addiu   t8, t9, 0x0001             # t8 = 80100001
    andi    a3, t8, 0x00FF             # a3 = 00000001
    sb      t6, 0x0000(t0)             # 80102B6C
    lbu     t7, 0x2218(t7)             # 80102218
    sb      t8, 0x0000(t5)             # 80102B58
    or      a2, a3, $zero              # a2 = 00000001
    beq     a3, $at, lbl_800C32F0
    sb      t7, 0x0000(t1)             # 80102B70
    lbu     t6, 0x0023($sp)
    beq     t6, $zero, lbl_800C3598
lbl_800C32F0:
    andi    t1, a3, 0xFFFF             # t1 = 00000001
    beq     t1, $zero, lbl_800C3324
    or      v0, t1, $zero              # v0 = 00000001
    addiu   a1, $zero, 0x00FF          # a1 = 000000FF
    addiu   t1, t1, 0xFFFF             # t1 = 00000000
lbl_800C3304:
    andi    t1, t1, 0xFFFF             # t1 = 00000000
    sll     t7, t1,  3
    addu    t9, a0, t7
    or      v0, t1, $zero              # v0 = 00000000
    beq     t1, $zero, lbl_800C3324
    lbu     v1, 0x0000(t9)             # 80100000
    beql    a1, v1, lbl_800C3304
    addiu   t1, t1, 0xFFFF             # t1 = FFFFFFFF
lbl_800C3324:
    addiu   t8, v0, 0x0001             # t8 = 00000001
    beq     t8, a2, lbl_800C3348
    addiu   t6, v0, 0x0002             # t6 = 00000002
    andi    t7, t6, 0x00FF             # t7 = 00000002
    sll     t9, t7,  3
    sb      t6, 0x0000(t5)             # 80102B58
    addu    t8, a0, t9
    sh      $zero, -0x0006(t8)         # FFFFFFFB
    lbu     a3, 0x0000(t5)             # 80102B58
lbl_800C3348:
    sll     t6, a3,  3
    addu    t7, a0, t6
    sh      $zero, 0x0002(t7)          # 00000004
    lbu     t9, 0x0000($ra)            # 80102B54
    addiu   $at, $zero, 0x0002         # $at = 00000002
    lui     t8, 0x8012                 # t8 = 80120000
    bnel    t9, $at, lbl_800C3598
    sb      $zero, 0x0000($ra)         # 80102B54
    lbu     t8, 0x1F46(t8)             # 80121F46
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x227C             # v1 = 8010227C
    slti    $at, t8, 0x0008
    bne     $at, $zero, lbl_800C3590
    addiu   v0, $zero, 0x00FF          # v0 = 000000FF
    lbu     t6, 0x0000(t5)             # 80102B58
    or      t1, $zero, $zero           # t1 = 00000000
    or      v0, $zero, $zero           # v0 = 00000000
    blez    t6, lbl_800C33E0
    sll     t8, v0,  3
lbl_800C3394:
    addu    t6, a0, t8
    lwl     t8, 0x0008(t6)             # 0000000A
    lwr     t8, 0x000B(t6)             # 0000000D
    sll     t7, t1,  3
    addu    t9, a0, t7
    swl     t8, 0x0000(t9)             # 80100000
    swr     t8, 0x0003(t9)             # 80100003
    lwl     t7, 0x000C(t6)             # 0000000E
    lwr     t7, 0x000F(t6)             # 00000011
    addiu   t1, t1, 0x0001             # t1 = 00000001
    andi    t1, t1, 0xFFFF             # t1 = 00000001
    swl     t7, 0x0004(t9)             # 80100004
    swr     t7, 0x0007(t9)             # 80100007
    lbu     t9, 0x0000(t5)             # 80102B58
    or      v0, t1, $zero              # v0 = 00000001
    slt     $at, t1, t9
    bnel    $at, $zero, lbl_800C3394
    sll     t8, v0,  3
    or      t1, $zero, $zero           # t1 = 00000000
lbl_800C33E0:
    addiu   a0, $zero, 0x000D          # a0 = 0000000D
    jal     func_800C209C
    sh      t1, 0x001E($sp)
    lui     t5, 0x8010                 # t5 = 80100000
    lui     $ra, 0x8010                # $ra = 80100000
    lui     a3, 0x8010                 # a3 = 80100000
    addiu   $ra, $ra, 0x2B54           # $ra = 80102B54
    addiu   t5, t5, 0x2B58             # t5 = 80102B58
    lhu     t1, 0x001E($sp)
    addiu   a3, a3, 0x2EFC             # a3 = 80102EFC
    addiu   t4, $zero, 0x0009          # t4 = 00000009
    addiu   t3, $zero, 0x0009          # t3 = 00000009
lbl_800C3410:
    multu   t1, t4
    or      t0, $zero, $zero           # t0 = 00000000
    mflo    t6
    addu    t7, a3, t6
    lbu     a2, 0x0000(t7)             # 00000000
    subu    t2, t3, a2
    blezl   t2, lbl_800C34D4
    addiu   t1, t1, 0x0001             # t1 = 00000001
lbl_800C3430:
    blez    a2, lbl_800C34A0
    or      v1, $zero, $zero           # v1 = 00000000
    slti    $at, t0, 0x0008
    beq     $at, $zero, lbl_800C34A0
    or      a0, t0, $zero              # a0 = 00000000
    sll     t8, t1,  3
    addu    t8, t8, t1
    addu    a1, a3, t8
    addu    t6, a3, a0
    lbu     t7, 0x006D(t6)             # 0000006D
    lbu     t9, 0x0001(a1)             # 00000001
    bne     t9, t7, lbl_800C34A0
    nop
    addiu   v1, v1, 0x0001             # v1 = 00000001
lbl_800C3468:
    andi    v1, v1, 0x00FF             # v1 = 00000001
    slt     $at, v1, a2
    beq     $at, $zero, lbl_800C34A0
    or      v0, v1, $zero              # v0 = 00000001
    addu    t8, v0, a0
    slti    $at, t8, 0x0008
    beq     $at, $zero, lbl_800C34A0
    addu    t6, a1, v1
    addu    t7, a3, v0
    lbu     t9, 0x0001(t6)             # 00000001
    addu    t8, t7, a0
    lbu     t6, 0x006D(t8)             # 0000006D
    beql    t9, t6, lbl_800C3468
    addiu   v1, v1, 0x0001             # v1 = 00000002
lbl_800C34A0:
    bne     v1, a2, lbl_800C34BC
    addiu   v0, $zero, 0x00FF          # v0 = 000000FF
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x227C             # v1 = 8010227C
    sb      v0, 0x0000($ra)            # 80102B54
    b       lbl_800C3598
    sb      v0, 0x078C(v1)             # 80102A08
lbl_800C34BC:
    addiu   t0, t0, 0x0001             # t0 = 00000001
    andi    t0, t0, 0x00FF             # t0 = 00000001
    slt     $at, t0, t2
    bne     $at, $zero, lbl_800C3430
    nop
    addiu   t1, t1, 0x0001             # t1 = 00000002
lbl_800C34D4:
    andi    t1, t1, 0xFFFF             # t1 = 00000002
    slti    $at, t1, 0x000C
    bne     $at, $zero, lbl_800C3410
    nop
    addiu   t1, $zero, 0x0001          # t1 = 00000001
    lbu     v1, 0x006D(a3)             # 80102F69
lbl_800C34EC:
    addu    t7, a3, t1
    lbu     t8, 0x006D(t7)             # 0000006D
    addiu   t1, t1, 0x0001             # t1 = 00000002
    andi    t1, t1, 0xFFFF             # t1 = 00000002
    beq     v1, t8, lbl_800C350C
    nop
    b       lbl_800C350C
    addiu   t1, $zero, 0x0009          # t1 = 00000009
lbl_800C350C:
    slti    $at, t1, 0x0008
    bne     $at, $zero, lbl_800C34EC
    or      v0, t1, $zero              # v0 = 00000009
    addiu   $at, $zero, 0x0008         # $at = 00000008
    bne     v0, $at, lbl_800C3538
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v0, $zero, 0x00FF          # v0 = 000000FF
    addiu   v1, v1, 0x227C             # v1 = 8010227C
    sb      v0, 0x0000($ra)            # 80102B54
    b       lbl_800C3598
    sb      v0, 0x078C(v1)             # 80102A08
lbl_800C3538:
    lbu     a2, 0x0000(t5)             # 80102B58
    or      t1, $zero, $zero           # t1 = 00000000
    blez    a2, lbl_800C3584
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x227C             # v1 = 8010227C
lbl_800C354C:
    sll     t9, t1,  3
    addu    v0, v1, t9
    lwl     t7, 0x0820(v0)             # 0000091F
    lwl     t6, 0x0824(v0)             # 00000923
    lwr     t7, 0x0823(v0)             # 00000922
    lwr     t6, 0x0827(v0)             # 00000926
    addiu   t1, t1, 0x0001             # t1 = 00000001
    andi    t1, t1, 0xFFFF             # t1 = 00000001
    slt     $at, t1, a2
    swl     t7, 0x0780(v0)             # 0000087F
    swl     t6, 0x0784(v0)             # 00000883
    swr     t7, 0x0783(v0)             # 00000882
    bne     $at, $zero, lbl_800C354C
    swr     t6, 0x0787(v0)             # 00000886
lbl_800C3584:
    lui     $at, 0x8010                # $at = 80100000
    b       lbl_800C3594
    sb      $zero, 0x2208($at)         # 80102208
lbl_800C3590:
    sb      v0, 0x078C(v1)             # 80102A08
lbl_800C3594:
    sb      $zero, 0x0000($ra)         # 80102B54
lbl_800C3598:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C35A8:
# MqDbg: 
    lui     v0, 0x8010                 # v0 = 80100000
    lbu     v0, 0x2B54(v0)             # 80102B54
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    andi    a1, a0, 0x00FF             # a1 = 00000000
    sw      $ra, 0x0014($sp)
    beq     a1, v0, lbl_800C36C4
    sw      a0, 0x0018($sp)
    beq     a1, $zero, lbl_800C3654
    lui     t4, 0x8010                 # t4 = 80100000
    lui     t6, 0x8012                 # t6 = 80120000
    lw      t6, 0x1F1C(t6)             # 80121F1C
    lui     $at, 0x8010                # $at = 80100000
    addiu   t7, $zero, 0x00FF          # t7 = 000000FF
    sw      t6, 0x2B5C($at)            # 80102B5C
    lui     $at, 0x8010                # $at = 80100000
    sb      t7, 0x2B60($at)            # 80102B60
    lui     $at, 0x8010                # $at = 80100000
    addiu   t8, $zero, 0x0057          # t8 = 00000057
    sb      t8, 0x2B64($at)            # 80102B64
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2B68($at)         # 80102B68
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2B6C($at)         # 80102B6C
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2B70($at)         # 80102B70
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2B58($at)         # 80102B58
    lui     $at, 0x8010                # $at = 80100000
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    sb      t9, 0x2208($at)            # 80102208
    lui     $at, 0x8012                # $at = 80120000
    lui     t1, 0x8010                 # t1 = 80100000
    sb      $zero, 0x1F46($at)         # 80121F46
    addiu   t1, t1, 0x2B88             # t1 = 80102B88
    lwl     t3, 0x0000(t1)             # 80102B88
    lwl     t2, 0x0004(t1)             # 80102B8C
    lwr     t3, 0x0003(t1)             # 80102B8B
    lwr     t2, 0x0007(t1)             # 80102B8F
    lui     t0, 0x8012                 # t0 = 80120000
    addiu   t0, t0, 0x1FB8             # t0 = 80121FB8
    sw      t3, 0x0000(t0)             # 80121FB8
    b       lbl_800C36BC
    sw      t2, 0x0004(t0)             # 80121FBC
lbl_800C3654:
    lbu     t4, 0x2B58(t4)             # 80102B58
    lui     t5, 0x8010                 # t5 = 80100000
    addiu   $at, $zero, 0x0002         # $at = 00000002
    bne     t4, $zero, lbl_800C3690
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    lui     t6, 0x8012                 # t6 = 80120000
    addiu   t6, t6, 0x1FB8             # t6 = 80121FB8
    lw      t8, 0x0000(t6)             # 80121FB8
    lw      t7, 0x0004(t6)             # 80121FBC
    addiu   t5, t5, 0x2B88             # t5 = 80102B88
    swl     t8, 0x0000(t5)             # 80102B88
    swl     t7, 0x0004(t5)             # 80102B8C
    swr     t8, 0x0003(t5)             # 80102B8B
    b       lbl_800C36AC
    swr     t7, 0x0007(t5)             # 80102B8F
lbl_800C3690:
    bne     v0, $at, lbl_800C36A0
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    lui     $at, 0x8012                # $at = 80120000
    sb      t9, 0x1F46($at)            # 80121F46
lbl_800C36A0:
    jal     func_800C31A0
    sb      a1, 0x001B($sp)
    lbu     a1, 0x001B($sp)
lbl_800C36AC:
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2208($at)         # 80102208
    lui     $at, 0x8012                # $at = 80120000
    sb      $zero, 0x1F46($at)         # 80121F46
lbl_800C36BC:
    lui     $at, 0x8010                # $at = 80100000
    sb      a1, 0x2B54($at)            # 80102B54
lbl_800C36C4:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C36D4:
# MqDbg: 
    lui     a0, 0x8010                 # a0 = 80100000
    addiu   a0, a0, 0x2B54             # a0 = 80102B54
    lbu     v0, 0x0000(a0)             # 80102B54
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x1F16             # v1 = 80121F16
    lui     t6, 0x8012                 # t6 = 80120000
    sb      v0, 0x0001(v1)             # 80121F17
    lbu     t6, 0x1F46(t6)             # 80121F46
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    bne     v0, $at, lbl_800C3704
    sb      t6, 0x0002(v1)             # 80121F18
    sb      $zero, 0x0000(a0)          # 80102B54
lbl_800C3704:
    jr      $ra
    nop


func_800C370C:
# MqDbg: 
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x2218(t6)             # 80102218
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lui     $at, 0x8012                # $at = 80120000
    andi    t7, t6, 0x003F             # t7 = 00000000
    jal     func_800C2010
    sb      t7, 0x1F0E($at)            # 80121F0E
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x1F0E             # v1 = 80121F0E
    lw      $ra, 0x0014($sp)
    sb      v0, 0x0001(v1)             # 80121F0F
    lui     t8, 0x8012                 # t8 = 80120000
    lbu     t8, 0x1F46(t8)             # 80121F46
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    sb      t8, 0x0002(v1)             # 80121F10


func_800C3750:
# MqDbg: 
    lui     a0, 0x8010                 # a0 = 80100000
    lbu     a0, 0x224C(a0)             # 8010224C
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    andi    t6, a0, 0x003F             # t6 = 00000000
    slti    $at, t6, 0x0010
    beq     $at, $zero, lbl_800C3784
    nop
    jal     func_800C2054
    nop
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x1F12             # v1 = 80121F12
    sb      v0, 0x0000(v1)             # 80121F12
lbl_800C3784:
    lui     t7, 0x8010                 # t7 = 80100000
    lbu     t7, 0x2234(t7)             # 80102234
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x1F12             # v1 = 80121F12
    lui     t8, 0x8010                 # t8 = 80100000
    sb      t7, 0x0001(v1)             # 80121F13
    lw      t8, 0x2B3C(t8)             # 80102B3C
    lui     t9, 0x8010                 # t9 = 80100000
    addiu   t9, t9, 0x2B80             # t9 = 80102B80
    beq     t8, t9, lbl_800C37C0
    lui     v0, 0x8010                 # v0 = 80100000
    lui     t0, 0x8010                 # t0 = 80100000
    lhu     t0, 0x2244(t0)             # 80102244
    b       lbl_800C37F0
    sb      t0, 0x0002(v1)             # 80121F14
lbl_800C37C0:
    lhu     v0, 0x2244(v0)             # 80102244
    bne     v0, $zero, lbl_800C37D4
    addiu   t1, v0, 0xFFFF             # t1 = 800FFFFF
    b       lbl_800C37F0
    sb      $zero, 0x0002(v1)          # 80121F14
lbl_800C37D4:
    bgez    t1, lbl_800C37E8
    andi    t2, t1, 0x0007             # t2 = 00000007
    beq     t2, $zero, lbl_800C37E8
    nop
    addiu   t2, t2, 0xFFF8             # t2 = FFFFFFFF
lbl_800C37E8:
    addiu   t3, t2, 0x0001             # t3 = 00000000
    sb      t3, 0x0002(v1)             # 80121F14
lbl_800C37F0:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C3800:
# MqDbg: 
# V0 = 80121F16
    lui     v0, 0x8012                 # v0 = 80120000
    jr      $ra
    addiu   v0, v0, 0x1F16             # v0 = 80121F16


func_800C380C:
# MqDbg: 
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x1F0E             # v1 = 80121F0E
    lbu     t6, 0x0001(v1)             # 80121F0F
    slti    $at, t6, 0x00FE
    beq     $at, $zero, lbl_800C3828
    lui     $at, 0x8010                # $at = 80100000
    sw      $zero, 0x2238($at)         # 80102238
lbl_800C3828:
    jr      $ra
    or      v0, v1, $zero              # v0 = 80121F0E


func_800C3830:
# MqDbg: 
# V0 = 80121F12
    lui     v0, 0x8012                 # v0 = 80120000
    jr      $ra
    addiu   v0, v0, 0x1F12             # v0 = 80121F12


func_800C383C:
# MqDbg: 
    lui     a0, 0x8010                 # a0 = 80100000
    lbu     a0, 0x2B54(a0)             # 80102B54
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    beq     a0, $zero, lbl_800C39A4
    lui     t6, 0x8012                 # t6 = 80120000
    lui     t7, 0x8010                 # t7 = 80100000
    lw      t7, 0x2B5C(t7)             # 80102B5C
    lw      t6, 0x1F1C(t6)             # 80121F1C
    lui     v1, 0x8010                 # v1 = 80100000
    lui     t9, 0x8010                 # t9 = 80100000
    subu    t8, t6, t7
    sltiu   $at, t8, 0x0003
    bnel    $at, $zero, lbl_800C39A8
    lw      $ra, 0x0014($sp)
    lbu     v1, 0x2210(v1)             # 80102210
    lbu     t9, 0x2B60(t9)             # 80102B60
    or      v0, $zero, $zero           # v0 = 00000000
    lui     t7, 0x8010                 # t7 = 80100000
    beq     v1, t9, lbl_800C3930
    lui     t8, 0x8010                 # t8 = 80100000
    addiu   $at, $zero, 0x00FF         # $at = 000000FF
    beq     v1, $at, lbl_800C38C4
    lui     v0, 0x8012                 # v0 = 80120000
    lui     t0, 0x8010                 # t0 = 80100000
    lbu     t0, 0x2218(t0)             # 80102218
    lui     $at, 0x8012                # $at = 80120000
    addiu   v0, v0, 0x1F46             # v0 = 80121F46
    andi    t1, t0, 0x003F             # t1 = 00000000
    sb      t1, 0x1F16($at)            # 80121F16
    lbu     t2, 0x0000(v0)             # 80121F46
    addiu   t3, t2, 0x0001             # t3 = 00000001
    b       lbl_800C38F4
    sb      t3, 0x0000(v0)             # 80121F46
lbl_800C38C4:
    addiu   $at, $zero, 0x0002         # $at = 00000002
    bne     a0, $at, lbl_800C38F4
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x1F46             # v0 = 80121F46
    lbu     t4, 0x0000(v0)             # 80121F46
    addiu   $at, $zero, 0x0008         # $at = 00000008
    bne     t4, $at, lbl_800C38F4
    nop
    jal     func_800C31A0
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    b       lbl_800C39A8
    lw      $ra, 0x0014($sp)
lbl_800C38F4:
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x1F46             # v0 = 80121F46
    lbu     t5, 0x0000(v0)             # 80121F46
    slti    $at, t5, 0x0009
    bne     $at, $zero, lbl_800C3928
    addiu   $at, $zero, 0x0002         # $at = 00000002
    bne     a0, $at, lbl_800C3924
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    jal     func_800C31A0
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    b       lbl_800C39A8
    lw      $ra, 0x0014($sp)
lbl_800C3924:
    sb      t6, 0x0000(v0)             # 00000000
lbl_800C3928:
    b       lbl_800C3984
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800C3930:
    lb      t7, 0x222C(t7)             # 0000222C
    lbu     t8, 0x2B64(t8)             # 00002B64
    lui     t9, 0x8010                 # t9 = 80100000
    lui     t0, 0x8010                 # t0 = 80100000
    beq     t7, t8, lbl_800C3950
    nop
    b       lbl_800C3984
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800C3950:
    lb      t9, 0x2230(t9)             # 80102230
    lbu     t0, 0x2B68(t0)             # 80102B68
    lui     t1, 0x8010                 # t1 = 80100000
    lui     t2, 0x8010                 # t2 = 80100000
    beq     t9, t0, lbl_800C3970
    nop
    b       lbl_800C3984
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800C3970:
    lb      t1, 0x2228(t1)             # 80102228
    lb      t2, 0x2B6C(t2)             # 80102B6C
    beq     t1, t2, lbl_800C3984
    nop
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800C3984:
    beql    v0, $zero, lbl_800C39A8
    lw      $ra, 0x0014($sp)
    jal     func_800C31A0
    or      a0, $zero, $zero           # a0 = 00000000
    lui     t3, 0x8012                 # t3 = 80120000
    lw      t3, 0x1F1C(t3)             # 80121F1C
    lui     $at, 0x8010                # $at = 80100000
    sw      t3, 0x2B5C($at)            # 80102B5C
lbl_800C39A4:
    lw      $ra, 0x0014($sp)
lbl_800C39A8:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C39B4:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a0, 0x0020($sp)
    andi    a0, a0, 0x00FF             # a0 = 00000000
    slti    $at, a0, 0x0003
    sw      $ra, 0x001C($sp)
    bne     $at, $zero, lbl_800C39D4
    sw      s0, 0x0018($sp)
    addiu   a0, $zero, 0x0002          # a0 = 00000002
lbl_800C39D4:
    lui     t6, 0x8010                 # t6 = 80100000
    addu    t6, t6, a0
    lbu     t6, 0x2278(t6)             # 80102278
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x2270($at)         # 80102270
    lui     $at, 0x8010                # $at = 80100000
    or      s0, $zero, $zero           # s0 = 00000000
    sb      t6, 0x2274($at)            # 80102274
lbl_800C39F4:
    jal     func_800C3A24
    nop
    addiu   s0, s0, 0x0001             # s0 = 00000001
    andi    s0, s0, 0x00FF             # s0 = 00000001
    slti    $at, s0, 0x0003
    bne     $at, $zero, lbl_800C39F4
    nop
    lw      $ra, 0x001C($sp)
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C3A24:
# MqDbg: 
# Song playback related.
    lui     a2, 0x8010                 # a2 = 80100000
    addiu   a2, a2, 0x2270             # a2 = 80102270
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x2274(t6)             # 80102274
    lbu     t7, 0x0000(a2)             # 80102270
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    bne     t6, t7, lbl_800C3A50
    nop
    b       lbl_800C3B1C
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800C3A50:
    jal     func_800BBD80
    nop
    addiu   t0, $zero, 0x0005          # t0 = 00000005
    divu    $zero, v0, t0
    lui     a2, 0x8010                 # a2 = 80100000
    addiu   a2, a2, 0x2270             # a2 = 80102270
    lbu     v1, 0x0000(a2)             # 80102270
    lui     a0, 0x8010                 # a0 = 80100000
    lui     a3, 0x8010                 # a3 = 80100000
    addiu   a3, a3, 0x227C             # a3 = 8010227C
    addiu   a0, a0, 0x2268             # a0 = 80102268
    mfhi    t8
    sll     t1, v1,  3
    addu    t9, a0, t8
    addu    t2, a3, t1
    lbu     a1, 0x0000(t9)             # 00000000
    lbu     t3, 0x0818(t2)             # 00000818
    bne     t0, $zero, lbl_800C3AA0
    nop
    break   # 0x01C00
lbl_800C3AA0:
    addiu   t8, $zero, 0x002D          # t8 = 0000002D
    bne     a1, t3, lbl_800C3ACC
    sll     t7, v1,  3
    addiu   t4, v0, 0x0001             # t4 = 00000001
    divu    $zero, t4, t0
    mfhi    t5
    addu    t6, a0, t5
    lbu     a1, 0x0000(t6)             # 00000000
    bne     t0, $zero, lbl_800C3ACC
    nop
    break   # 0x01C00
lbl_800C3ACC:
    addu    v0, a3, t7
    addiu   t1, v1, 0x0001             # t1 = 00000001
    addiu   t9, $zero, 0x0050          # t9 = 00000050
    andi    v1, t1, 0x00FF             # v1 = 00000001
    sb      a1, 0x0820(v0)             # 00000820
    sh      t8, 0x0822(v0)             # 00000822
    sb      t9, 0x0824(v0)             # 00000824
    sb      $zero, 0x0825(v0)          # 00000825
    sb      $zero, 0x0826(v0)          # 00000826
    sll     t2, v1,  3
    addu    v0, a3, t2
    addiu   t0, $zero, 0x00FF          # t0 = 000000FF
    sb      t0, 0x0820(v0)             # 00000820
    sh      $zero, 0x0822(v0)          # 00000822
    sll     t3, v1,  3
    addu    a0, a3, t3
    sb      t1, 0x0000(a2)             # 80102270
    sb      t0, 0x0828(a0)             # 80102A90
    sh      $zero, 0x082A(a0)          # 80102A92
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800C3B1C:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C3B2C:
# MqDbg: 
    lui     t7, 0x8010                 # t7 = 80100000
    lb      t7, 0x220C(t7)             # 8010220C
    lui     t6, 0x8012                 # t6 = 80120000
    lw      t6, 0x7ECC(t6)             # 80127ECC
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    lui     $at, 0x8012                # $at = 80120000
    sw      $ra, 0x0014($sp)
    beq     t7, $zero, lbl_800C3C34
    sw      t6, 0x1F1C($at)            # 80121F1C
    lui     t8, 0x8010                 # t8 = 80100000
    lbu     t8, 0x2208(t8)             # 80102208
    addiu   $at, $zero, 0x0001         # $at = 00000001
    bne     t8, $at, lbl_800C3B6C
    nop
    jal     func_800C1F20
    nop
lbl_800C3B6C:
    lui     t9, 0x8010                 # t9 = 80100000
    lbu     t9, 0x2234(t9)             # 80102234
    lui     t0, 0x8010                 # t0 = 80100000
    bne     t9, $zero, lbl_800C3B98
    nop
    lbu     t0, 0x2208(t0)             # 80102208
    addiu   $at, $zero, 0x0001         # $at = 00000001
    bne     t0, $at, lbl_800C3B98
    nop
    jal     func_800C296C
    or      a0, $zero, $zero           # a0 = 00000000
lbl_800C3B98:
    lui     v0, 0x8010                 # v0 = 80100000
    lw      v0, 0x2238(v0)             # 80102238
    beq     v0, $zero, lbl_800C3BC8
    andi    t1, v0, 0x4000             # t1 = 00000000
    beq     t1, $zero, lbl_800C3BC0
    nop
    jal     func_800C2720
    nop
    b       lbl_800C3BC8
    nop
lbl_800C3BC0:
    jal     func_800C2318
    nop
lbl_800C3BC8:
    jal     func_800C2E74
    nop
    lui     t3, 0x8010                 # t3 = 80100000
    lbu     t3, 0x2234(t3)             # 80102234
    lui     t2, 0x8012                 # t2 = 80120000
    lw      t2, 0x1F1C(t2)             # 80121F1C
    lui     $at, 0x8010                # $at = 80100000
    bne     t3, $zero, lbl_800C3BF4
    sw      t2, 0x2264($at)            # 80102264
    jal     func_800C383C
    nop
lbl_800C3BF4:
    lui     t4, 0x8010                 # t4 = 80100000
    lw      t4, 0x2238(t4)             # 80102238
    lui     t5, 0x8010                 # t5 = 80100000
    lui     t6, 0x8010                 # t6 = 80100000
    beq     t4, $zero, lbl_800C3C28
    lui     t8, 0x8010                 # t8 = 80100000
    lbu     t5, 0x2210(t5)             # 80102210
    lbu     t6, 0x2214(t6)             # 80102214
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    lui     $at, 0x8010                # $at = 80100000
    beq     t5, t6, lbl_800C3C28
    nop
    sb      t7, 0x2B7C($at)            # 80102B7C
lbl_800C3C28:
    lbu     t8, 0x2210(t8)             # 80102210
    lui     $at, 0x8010                # $at = 80100000
    sb      t8, 0x2214($at)            # 80102214
lbl_800C3C34:
    jal     func_800C370C
    nop
    jal     func_800C3750
    nop
    jal     func_800C36D4
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C3C5C:
# MqDbg: 
    lui     a1, 0x8010                 # a1 = 80100000
    lbu     a1, 0x2F7C(a1)             # 80102F7C
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    beq     a1, $zero, lbl_800C3C90
    or      v0, a1, $zero              # v0 = 80100000
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     v0, $at, lbl_800C3CF0
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     v0, $at, lbl_800C3D3C
    nop
    b       lbl_800C3D5C
    lw      $ra, 0x0014($sp)
lbl_800C3C90:
    lui     v1, 0x8010                 # v1 = 80100000
    lhu     v1, 0x2F84(v1)             # 80102F84
    lui     $at, 0x8010                # $at = 80100000
    lui     t6, 0x8010                 # t6 = 80100000
    sltiu   v0, v1, 0x0001
    addiu   v1, v1, 0xFFFF             # v1 = 800FFFFF
    beq     v0, $zero, lbl_800C3D58
    sh      v1, 0x2F84($at)            # 80102F84
    lbu     t6, 0x2F80(t6)             # 80102F80
    addiu   a1, a1, 0x0001             # a1 = 80100001
    or      a0, $zero, $zero           # a0 = 00000000
    slti    $at, t6, 0x0007
    beq     $at, $zero, lbl_800C3CD0
    lui     $at, 0x8010                # $at = 80100000
    b       lbl_800C3CE0
    sb      a1, 0x2F7C($at)            # 80102F7C
lbl_800C3CD0:
    addiu   a1, $zero, 0x0003          # a1 = 00000003
    lui     $at, 0x8010                # $at = 80100000
    jal     func_800C2C90
    sb      a1, 0x2F7C($at)            # 80102F7C
lbl_800C3CE0:
    addiu   v1, $zero, 0x04B0          # v1 = 000004B0
    lui     $at, 0x8010                # $at = 80100000
    b       lbl_800C3D58
    sh      v1, 0x2F84($at)            # 80102F84
lbl_800C3CF0:
    jal     func_800C7F40
    or      a0, $zero, $zero           # a0 = 00000000
    lui     a0, 0x8010                 # a0 = 80100000
    jal     func_800C2C90
    lbu     a0, 0x2F80(a0)             # 80102F80
    addiu   a0, $zero, 0x000F          # a0 = 0000000F
    jal     func_800C2D74
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    lui     t7, 0x8010                 # t7 = 80100000
    lbu     t7, 0x2F80(t7)             # 80102F80
    lui     a1, 0x8010                 # a1 = 80100000
    lbu     a1, 0x2F7C(a1)             # 80102F7C
    lui     $at, 0x8010                # $at = 80100000
    addiu   t8, t7, 0x0001             # t8 = 80100001
    sb      t8, 0x2F80($at)            # 80102F80
    lui     $at, 0x8010                # $at = 80100000
    addiu   a1, a1, 0x0001             # a1 = 80100001
    b       lbl_800C3D58
    sb      a1, 0x2F7C($at)            # 80102F7C
lbl_800C3D3C:
    jal     func_800C3830
    nop
    lbu     t9, 0x0001(v0)             # 00000001
    lui     $at, 0x8010                # $at = 80100000
    bnel    t9, $zero, lbl_800C3D5C
    lw      $ra, 0x0014($sp)
    sb      $zero, 0x2F7C($at)         # 80102F7C
lbl_800C3D58:
    lw      $ra, 0x0014($sp)
lbl_800C3D5C:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C3D68:
# MqDbg: 
    addiu   v1, $zero, 0x00FF          # v1 = 000000FF
    lui     v0, 0x8012                 # v0 = 80120000
    lui     a0, 0x8012                 # a0 = 80120000
    lui     a1, 0x8012                 # a1 = 80120000
    addiu   a1, a1, 0x1F16             # a1 = 80121F16
    addiu   a0, a0, 0x1F12             # a0 = 80121F12
    addiu   v0, v0, 0x1F0E             # v0 = 80121F0E
    sb      v1, 0x0000(v0)             # 80121F0E
    sb      v1, 0x0001(v0)             # 80121F0F
    sb      $zero, 0x0002(v0)          # 80121F10
    sb      v1, 0x0000(a0)             # 80121F12
    sb      $zero, 0x0001(a0)          # 80121F13
    sb      $zero, 0x0002(a0)          # 80121F14
    sb      v1, 0x0000(a1)             # 80121F16
    sb      v1, 0x0001(a1)             # 80121F17
    sb      $zero, 0x0002(a1)          # 80121F18
    lui     $at, 0x8010                # $at = 80100000
    jr      $ra
    sb      $zero, 0x2B7C($at)         # 80102B7C


func_800C3DB4:
# MqDbg: 
    jr      $ra
    sw      a0, 0x0000($sp)


func_800C3DBC:
# MqDbg: 
    sw      a0, 0x0000($sp)
    jr      $ra
    sw      a1, 0x0004($sp)


func_800C3DC8:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800CB798
    nop
    bnel    v0, $zero, lbl_800C3E60
    lw      $ra, 0x0014($sp)
    jal     func_800C3B2C
    nop
    lui     a0, 0x8012                 # a0 = 80120000
    jal     func_800C54C4
    addiu   a0, a0, 0x1DD0             # a0 = 80121DD0
    lui     a0, 0x8012                 # a0 = 80120000
    jal     func_800C54C4
    addiu   a0, a0, 0x1DE0             # a0 = 80121DE0
    jal     func_800C57B0
    nop
    jal     func_800C63FC
    nop
    jal     func_800C6A34
    nop
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x43C0(t6)             # 801043C0
    addiu   $at, $zero, 0x0007         # $at = 00000007
    bne     t6, $at, lbl_800C3E34
    nop
    jal     func_800C5E0C
    nop
lbl_800C3E34:
    jal     func_800C99BC
    nop
    jal     func_800CAA98
    nop
    jal     func_800C9B08
    nop
    jal     func_800CAE40
    nop
    jal     func_800BB140
    nop
    lw      $ra, 0x0014($sp)
lbl_800C3E60:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C3E6C:
# MqDbg: 
    jr      $ra
    sw      a0, 0x0000($sp)


func_800C3E74:
# MqDbg: 
    sw      a0, 0x0000($sp)
    jr      $ra
    sw      a1, 0x0004($sp)


func_800C3E80:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      a0, 0x0018($sp)
    or      a2, a0, $zero              # a2 = 00000000
    or      a0, a2, $zero              # a0 = 00000000
    andi    a0, a0, 0x00FF             # a0 = 00000000
    sw      $ra, 0x0014($sp)
    sll     a0, a0,  8
    lui     $at, 0x8200                # $at = 82000000
    or      a0, a0, $at                # a0 = 82000000
    jal     func_800BB0BC
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C3EBC:
# MqDbg: 
    sw      a0, 0x0000($sp)
    andi    a0, a0, 0x00FF             # a0 = 00000000
    sw      a1, 0x0004($sp)
    sll     t6, a0,  2
    lui     t7, 0x8010                 # t7 = 80100000
    andi    a1, a1, 0x00FF             # a1 = 00000000
    addu    t7, t7, t6
    lw      t7, 0x4368(t7)             # 80104368
    sll     t8, a1,  2
    subu    t8, t8, a1
    sll     t8, t8,  4
    addu    v0, t7, t8
    lhu     v1, 0x0026(v0)             # 00000026
    lui     $at, 0x8011                # $at = 80110000
    andi    t9, v1, 0x2000             # t9 = 00000000
    beq     t9, $zero, lbl_800C3F10
    nop
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f0                   # $f0 = 1.00
    jr      $ra
    nop
lbl_800C3F10:
    lwc1    $f16, -0x5FC0($at)         # 3F7FA040
    lwc1    $f2, 0x001C(v0)            # 0000001C
    andi    v0, v1, 0x0003             # v0 = 00000000
    addiu   $at, $zero, 0x0001         # $at = 00000001
    c.lt.s  $f16, $f2
    nop
    bc1f    lbl_800C3F3C
    nop
    mtc1    $zero, $f12                # $f12 = 0.00
    b       lbl_800C401C
    mov.s   $f0, $f12
lbl_800C3F3C:
    beq     v0, $at, lbl_800C3F60
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     v0, $at, lbl_800C3F6C
    addiu   $at, $zero, 0x0003         # $at = 00000003
    beq     v0, $at, lbl_800C3F78
    lui     $at, 0x43FA                # $at = 43FA0000
    mtc1    $at, $f0                   # $f0 = 500.00
    b       lbl_800C3F84
    lui     $at, 0x40A0                # $at = 40A00000
lbl_800C3F60:
    lui     $at, 0x8011                # $at = 80110000
    b       lbl_800C3F80
    lwc1    $f0, -0x5FBC($at)          # 8010A044
lbl_800C3F6C:
    lui     $at, 0x8011                # $at = 80110000
    b       lbl_800C3F80
    lwc1    $f0, -0x5FB8($at)          # 8010A048
lbl_800C3F78:
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f0, -0x5FB4($at)          # 8010A04C
lbl_800C3F80:
    lui     $at, 0x40A0                # $at = 40A00000
lbl_800C3F84:
    mtc1    $at, $f4                   # $f4 = 5.00
    lui     $at, 0x3F80                # $at = 3F800000
    div.s   $f14, $f0, $f4
    c.lt.s  $f2, $f14
    nop
    bc1fl   lbl_800C3FB0
    c.lt.s  $f2, $f0
    mtc1    $at, $f12                  # $f12 = 1.00
    b       lbl_800C4010
    nop
    c.lt.s  $f2, $f0
lbl_800C3FB0:
    nop
    bc1fl   lbl_800C3FEC
    sub.s   $f8, $f2, $f0
    sub.s   $f16, $f0, $f14
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f18, -0x5FB0($at)         # 8010A050
    sub.s   $f6, $f2, $f14
    lui     $at, 0x8011                # $at = 80110000
    sub.s   $f8, $f16, $f6
    lwc1    $f6, -0x5FAC($at)          # 8010A054
    div.s   $f10, $f8, $f16
    mul.s   $f4, $f10, $f18
    b       lbl_800C4010
    add.s   $f12, $f4, $f6
    sub.s   $f8, $f2, $f0
lbl_800C3FEC:
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f4                   # $f4 = 1.00
    sub.s   $f10, $f16, $f0
    lui     $at, 0x8011                # $at = 80110000
    div.s   $f18, $f8, $f10
    lwc1    $f8, -0x5FA8($at)          # 8010A058
    sub.s   $f6, $f4, $f18
    mul.s   $f12, $f6, $f8
    nop
lbl_800C4010:
    mul.s   $f12, $f12, $f12
    nop
    mov.s   $f0, $f12
lbl_800C401C:
    jr      $ra
    nop


func_800C4024:
# MqDbg: 
    sw      a0, 0x0000($sp)
    andi    a0, a0, 0x00FF             # a0 = 00000000
    sw      a1, 0x0004($sp)
    sll     t6, a0,  2
    lui     t7, 0x8010                 # t7 = 80100000
    andi    a1, a1, 0x00FF             # a1 = 00000000
    addu    t7, t7, t6
    lw      t7, 0x4368(t7)             # 80104368
    sll     t8, a1,  2
    subu    t8, t8, a1
    sll     t8, t8,  4
    sw      a2, 0x0008($sp)
    addu    a3, t7, t8
    lhu     t9, 0x0026(a3)             # 00000026
    andi    a2, a2, 0x00FF             # a2 = 00000000
    or      v0, $zero, $zero           # v0 = 00000000
    andi    t0, t9, 0x1000             # t0 = 00000000
    bne     t0, $zero, lbl_800C4104
    or      v1, $zero, $zero           # v1 = 00000000
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f2, -0x5FA4($at)          # 8010A05C
    lwc1    $f0, 0x001C(a3)            # 0000001C
    addiu   v0, $zero, 0x0046          # v0 = 00000046
    c.lt.s  $f0, $f2
    nop
    bc1f    lbl_800C4104
    nop
    lw      t1, 0x0008(a3)             # 00000008
    mtc1    $zero, $f4                 # $f4 = 0.00
    lwc1    $f6, 0x0000(t1)            # 00000000
    c.lt.s  $f4, $f6
    nop
    bc1fl   lbl_800C40DC
    div.s   $f4, $f0, $f2
    div.s   $f8, $f0, $f2
    lui     $at, 0x428C                # $at = 428C0000
    mtc1    $at, $f10                  # $f10 = 70.00
    nop
    mul.s   $f16, $f8, $f10
    trunc.w.s $f18, $f16
    mfc1    v0, $f18
    nop
    sll     v0, v0, 24
    b       lbl_800C4104
    sra     v0, v0, 24
    div.s   $f4, $f0, $f2
lbl_800C40DC:
    lui     $at, 0x42B6                # $at = 42B60000
    mtc1    $at, $f6                   # $f6 = 91.00
    nop
    mul.s   $f8, $f4, $f6
    trunc.w.s $f10, $f8
    mfc1    v0, $f10
    nop
    sll     v0, v0, 24
    b       lbl_800C4104
    sra     v0, v0, 24
lbl_800C4104:
    sll     t4, a2,  2
    lui     a1, 0x8013                 # a1 = 80130000
    addu    a1, a1, t4
    lw      a1, -0x71A8(a1)            # 80128E58
    lui     t5, 0x8013                 # t5 = 80130000
    addiu   t5, t5, 0xB0E0             # t5 = 8012B0E0
    beq     t5, a1, lbl_800C4134
    lui     t1, 0x8010                 # t1 = 80100000
    lb      v1, 0x00C5(a1)             # 801300C5
    bgezl   v1, lbl_800C4138
    lw      t6, 0x0018(a3)             # 00000018
    or      v1, $zero, $zero           # v1 = 00000000
lbl_800C4134:
    lw      t6, 0x0018(a3)             # 00000018
lbl_800C4138:
    addiu   $at, $zero, 0x0005         # $at = 00000005
    lui     t3, 0x8010                 # t3 = 80100000
    lb      t7, 0x0000(t6)             # 00000000
    lui     t5, 0x8010                 # t5 = 80100000
    addu    t8, t7, v0
    bne     a0, $at, lbl_800C4168
    addu    a1, t8, v1
    lhu     t9, 0x0028(a3)             # 00000028
    andi    t0, t9, 0x01FF             # t0 = 00000000
    slti    $at, t0, 0x0002
    bnel    $at, $zero, lbl_800C4184
    slti    $at, a1, 0x0080
lbl_800C4168:
    lb      t1, 0x1924(t1)             # 80101924
    lb      t3, 0x1928(t3)             # 80101928
    lb      t5, 0x1920(t5)             # 80101920
    addu    t2, a1, t1
    addu    t4, t2, t3
    addu    a1, t4, t5
    slti    $at, a1, 0x0080
lbl_800C4184:
    bnel    $at, $zero, lbl_800C4194
    sll     v0, a1, 24
    addiu   a1, $zero, 0x007F          # a1 = 0000007F
    sll     v0, a1, 24
lbl_800C4194:
    jr      $ra
    sra     v0, v0, 24


func_800C419C:
# MqDbg: 
    mtc1    $zero, $f0                 # $f0 = 0.00
    addiu   $sp, $sp, 0xFFF0           # $sp -= 0x10
    sdc1    $f20, 0x0008($sp)
    c.lt.s  $f12, $f0
    mtc1    $zero, $f16                # $f16 = 0.00
    mov.s   $f20, $f12
    sw      a2, 0x0018($sp)
    bc1f    lbl_800C41C8
    lui     $at, 0x45FA                # $at = 45FA0000
    b       lbl_800C41CC
    neg.s   $f12, $f12
lbl_800C41C8:
    mov.s   $f12, $f20
lbl_800C41CC:
    c.lt.s  $f14, $f0
    mtc1    $at, $f0                   # $f0 = 8000.00
    bc1fl   lbl_800C41E8
    mov.s   $f2, $f14
    b       lbl_800C41E8
    neg.s   $f2, $f14
    mov.s   $f2, $f14
lbl_800C41E8:
    c.lt.s  $f0, $f12
    nop
    bc1fl   lbl_800C4200
    c.lt.s  $f0, $f2
    mov.s   $f12, $f0
    c.lt.s  $f0, $f2
lbl_800C4200:
    nop
    bc1fl   lbl_800C4214
    c.eq.s  $f20, $f16
    mov.s   $f2, $f0
    c.eq.s  $f20, $f16
lbl_800C4214:
    nop
    bc1fl   lbl_800C4240
    c.le.s  $f2, $f12
    c.eq.s  $f14, $f16
    lui     $at, 0x3F00                # $at = 3F000000
    bc1fl   lbl_800C4240
    c.le.s  $f2, $f12
    mtc1    $at, $f14                  # $f14 = 0.50
    b       lbl_800C42B0
    mov.s   $f0, $f14
    c.le.s  $f2, $f12
lbl_800C4240:
    lui     $at, 0x3F00                # $at = 3F000000
    bc1fl   lbl_800C429C
    mtc1    $at, $f14                  # $f14 = 0.50
    lui     $at, 0x467A                # $at = 467A0000
    mtc1    $at, $f18                  # $f18 = 16000.00
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f4, -0x5FA0($at)          # 8010A060
    sub.s   $f6, $f18, $f2
    lui     $at, 0x3F80                # $at = 3F800000
    sub.s   $f10, $f18, $f12
    mul.s   $f8, $f4, $f6
    c.le.s  $f16, $f20
    div.s   $f14, $f10, $f8
    bc1f    lbl_800C4288
    mov.s   $f0, $f14
    mtc1    $at, $f4                   # $f4 = 1.00
    nop
    sub.s   $f0, $f4, $f14
lbl_800C4288:
    lui     $at, 0x3F00                # $at = 3F000000
    mtc1    $at, $f14                  # $f14 = 0.50
    b       lbl_800C42B4
    lui     $at, 0x4248                # $at = 42480000
    mtc1    $at, $f14                  # $f14 = 50.00
lbl_800C429C:
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f6, -0x5F9C($at)          # 8010A064
    mul.s   $f10, $f6, $f2
    div.s   $f8, $f20, $f10
    add.s   $f0, $f8, $f14
lbl_800C42B0:
    lui     $at, 0x4248                # $at = 42480000
lbl_800C42B4:
    mtc1    $at, $f16                  # $f16 = 50.00
    lui     $at, 0x42FE                # $at = 42FE0000
    mtc1    $at, $f8                   # $f8 = 127.00
    c.lt.s  $f2, $f16
    nop
    bc1f    lbl_800C42F8
    nop
    c.lt.s  $f12, $f16
    nop
    bc1f    lbl_800C42F8
    nop
    div.s   $f2, $f12, $f16
    sub.s   $f4, $f0, $f14
    mul.s   $f6, $f2, $f2
    nop
    mul.s   $f10, $f4, $f6
    add.s   $f0, $f10, $f14
lbl_800C42F8:
    mul.s   $f4, $f0, $f8
    ldc1    $f20, 0x0008($sp)
    addiu   $sp, $sp, 0x0010           # $sp += 0x10
    add.s   $f6, $f4, $f14
    trunc.w.s $f10, $f6
    mfc1    v0, $f10
    nop
    sll     v0, v0, 24
    jr      $ra
    sra     v0, v0, 24


func_800C4320:
# MqDbg: 
    sw      a0, 0x0000($sp)
    andi    a0, a0, 0x00FF             # a0 = 00000000
    sw      a1, 0x0004($sp)
    sll     t6, a0,  2
    lui     t7, 0x8010                 # t7 = 80100000
    andi    a1, a1, 0x00FF             # a1 = 00000000
    addu    t7, t7, t6
    lw      t7, 0x4368(t7)             # 80104368
    sll     t8, a1,  2
    subu    t8, t8, a1
    sll     t8, t8,  4
    addu    v1, t7, t8
    lhu     a2, 0x0026(v1)             # 00000026
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f0                   # $f0 = 1.00
    andi    t9, a2, 0x4000             # t9 = 00000000
    or      v0, $zero, $zero           # v0 = 00000000
    beq     t9, $zero, lbl_800C43A8
    mov.s   $f2, $f0
    lui     t0, 0x8012                 # t0 = 80120000
    lw      t0, 0x7FAC(t0)             # 80127FAC
    lui     $at, 0x4F80                # $at = 4F800000
    andi    t1, t0, 0x000F             # t1 = 00000000
    mtc1    t1, $f4                    # $f4 = 0.00
    bgez    t1, lbl_800C4394
    cvt.s.w $f6, $f4
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f6, $f6, $f8
lbl_800C4394:
    lui     $at, 0x4340                # $at = 43400000
    mtc1    $at, $f10                  # $f10 = 192.00
    nop
    div.s   $f16, $f6, $f10
    sub.s   $f2, $f0, $f16
lbl_800C43A8:
    sltiu   $at, a0, 0x0007
    beq     $at, $zero, lbl_800C43F4
    sll     t2, a0,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t2
    lw      t2, -0x5F98($at)           # 8010A068
    jr      t2
    nop
    lui     t3, 0x8010                 # t3 = 80100000
    lbu     t3, 0x1954(t3)             # 80101954
    beql    t3, $zero, lbl_800C43F8
    addiu   $at, $zero, 0x0001         # $at = 00000001
    b       lbl_800C43F4
    addiu   v0, $zero, 0x0001          # v0 = 00000001
    lui     t4, 0x8010                 # t4 = 80100000
    lbu     t4, 0x1958(t4)             # 80101958
    beql    t4, $zero, lbl_800C43F8
    addiu   $at, $zero, 0x0001         # $at = 00000001
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800C43F4:
    addiu   $at, $zero, 0x0001         # $at = 00000001
lbl_800C43F8:
    bne     v0, $at, lbl_800C4458
    andi    t8, a2, 0x2000             # t8 = 00000000
    andi    t5, a2, 0x0800             # t5 = 00000000
    bne     t5, $zero, lbl_800C4458
    lui     t6, 0x8012                 # t6 = 80120000
    lw      t6, 0x7FAC(t6)             # 80127FAC
    lui     $at, 0x4F80                # $at = 4F800000
    andi    t7, t6, 0x000F             # t7 = 00000000
    mtc1    t7, $f18                   # $f18 = 0.00
    bgez    t7, lbl_800C4430
    cvt.s.w $f4, $f18
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f4, $f4, $f8
lbl_800C4430:
    lui     $at, 0x4310                # $at = 43100000
    mtc1    $at, $f6                   # $f6 = 144.00
    lui     $at, 0x8011                # $at = 80110000
    ldc1    $f18, -0x5F78($at)         # 8010A088
    div.s   $f10, $f4, $f6
    cvt.d.s $f4, $f2
    cvt.d.s $f16, $f10
    sub.d   $f8, $f18, $f16
    mul.d   $f6, $f4, $f8
    cvt.s.d $f2, $f6
lbl_800C4458:
    bne     t8, $zero, lbl_800C44A4
    lwc1    $f0, 0x001C(v1)            # 0000001C
    andi    t9, a2, 0x8000             # t9 = 00000000
    bne     t9, $zero, lbl_800C44A4
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f12, -0x5F70($at)         # 8010A090
    lui     $at, 0x8011                # $at = 80110000
    c.le.s  $f12, $f0
    nop
    bc1fl   lbl_800C4494
    div.s   $f16, $f0, $f12
    lwc1    $f10, -0x5F6C($at)         # 8010A094
    b       lbl_800C44A4
    add.s   $f2, $f2, $f10
    div.s   $f16, $f0, $f12
lbl_800C4494:
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f18, -0x5F68($at)         # 8010A098
    mul.s   $f4, $f18, $f16
    add.s   $f2, $f2, $f4
lbl_800C44A4:
    andi    t0, a2, 0x00C0             # t0 = 00000000
    beq     t0, $zero, lbl_800C44E4
    nop
    lbu     t1, 0x002F(v1)             # 0000002F
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    t1, $f8                    # $f8 = 0.00
    bgez    t1, lbl_800C44D0
    cvt.s.w $f6, $f8
    mtc1    $at, $f10                  # $f10 = 4294967000.00
    nop
    add.s   $f6, $f6, $f10
lbl_800C44D0:
    lui     $at, 0x4340                # $at = 43400000
    mtc1    $at, $f18                  # $f18 = 192.00
    nop
    div.s   $f16, $f6, $f18
    add.s   $f2, $f2, $f16
lbl_800C44E4:
    jr      $ra
    mov.s   $f0, $f2


func_800C44EC:
# MqDbg: 
    sw      a2, 0x0008($sp)
    lw      t6, 0x0008(a1)             # 00000008
    sll     a2, a2, 24
    sra     a2, a2, 24
    lwc1    $f4, 0x0000(t6)            # 00000000
    slti    $at, a2, 0x0041
    or      v1, $zero, $zero           # v1 = 00000000
    c.lt.s  $f4, $f12
    nop
    bc1f    lbl_800C4588
    nop
    beq     $at, $zero, lbl_800C452C
    addiu   t7, $zero, 0x007F          # t7 = 0000007F
    sll     v0, a2, 24
    b       lbl_800C4538
    sra     v0, v0, 24
lbl_800C452C:
    subu    v0, t7, a2
    sll     v0, v0, 24
    sra     v0, v0, 24
lbl_800C4538:
    slti    $at, v0, 0x001E
    beql    $at, $zero, lbl_800C4550
    andi    $at, v0, 0xFFFF            # $at = 00000000
    b       lbl_800C4588
    or      v1, $zero, $zero           # v1 = 00000000
    andi    $at, v0, 0xFFFF            # $at = 00000000
lbl_800C4550:
    sll     a0, $at,  2
    addu    a0, a0, $at
    sll     a0, a0,  1
    addiu   a0, a0, 0xFED4             # a0 = FFFFFED4
    addiu   $at, $zero, 0x0022         # $at = 00000022
    div     $zero, a0, $at
    mflo    a0
    andi    a2, a0, 0x00FF             # a2 = 000000D4
    beq     a2, $zero, lbl_800C4588
    andi    v1, a0, 0x00FF             # v1 = 000000D4
    addiu   t8, $zero, 0x0010          # t8 = 00000010
    subu    v1, t8, a2
    b       lbl_800C4588
    andi    v1, v1, 0x00FF             # v1 = 000000D4
lbl_800C4588:
    bne     v1, $zero, lbl_800C45A4
    or      a0, v1, $zero              # a0 = 000000D4
    lhu     t9, 0x0026(a1)             # 00000026
    andi    t0, t9, 0x0200             # t0 = 00000000
    beql    t0, $zero, lbl_800C45A8
    lhu     v0, 0x0026(a1)             # 00000026
    addiu   a0, $zero, 0x000F          # a0 = 0000000F
lbl_800C45A4:
    lhu     v0, 0x0026(a1)             # 00000026
lbl_800C45A8:
    addiu   $at, $zero, 0x0001         # $at = 00000001
    andi    v0, v0, 0x0003             # v0 = 00000000
    beq     v0, $at, lbl_800C45D4
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     v0, $at, lbl_800C45E4
    addiu   $at, $zero, 0x0003         # $at = 00000003
    beq     v0, $at, lbl_800C45F4
    lui     $at, 0x4170                # $at = 41700000
    mtc1    $at, $f0                   # $f0 = 15.00
    b       lbl_800C4600
    nop
lbl_800C45D4:
    lui     $at, 0x4140                # $at = 41400000
    mtc1    $at, $f0                   # $f0 = 12.00
    b       lbl_800C4600
    nop
lbl_800C45E4:
    lui     $at, 0x4110                # $at = 41100000
    mtc1    $at, $f0                   # $f0 = 9.00
    b       lbl_800C4600
    nop
lbl_800C45F4:
    lui     $at, 0x40C0                # $at = 40C00000
    mtc1    $at, $f0                   # $f0 = 6.00
    nop
lbl_800C4600:
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f14, -0x5F64($at)         # 8010A09C
    lwc1    $f2, 0x001C(a1)            # 0000001C
    lui     $at, 0x4F00                # $at = 4F000000
    c.lt.s  $f14, $f2
    nop
    bc1fl   lbl_800C462C
    mov.s   $f12, $f2
    b       lbl_800C462C
    mov.s   $f12, $f14
    mov.s   $f12, $f2
lbl_800C462C:
    mul.s   $f6, $f0, $f12
    addiu   t3, $zero, 0x0001          # t3 = 00000001
    sll     t1, a0,  4
    div.s   $f8, $f6, $f14
    cfc1    t2, $f31
    ctc1    t3, $f31
    nop
    cvt.w.s $f10, $f8
    cfc1    t3, $f31
    nop
    andi    t3, t3, 0x0078             # t3 = 00000000
    beql    t3, $zero, lbl_800C46A8
    mfc1    t3, $f10
    mtc1    $at, $f10                  # $f10 = 2147484000.00
    addiu   t3, $zero, 0x0001          # t3 = 00000001
    sub.s   $f10, $f8, $f10
    ctc1    t3, $f31
    nop
    cvt.w.s $f10, $f10
    cfc1    t3, $f31
    nop
    andi    t3, t3, 0x0078             # t3 = 00000000
    bne     t3, $zero, lbl_800C469C
    nop
    mfc1    t3, $f10
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800C46B4
    or      t3, t3, $at                # t3 = 80000000
lbl_800C469C:
    b       lbl_800C46B4
    addiu   t3, $zero, 0xFFFF          # t3 = FFFFFFFF
    mfc1    t3, $f10
lbl_800C46A8:
    nop
    bltz    t3, lbl_800C469C
    nop
lbl_800C46B4:
    ctc1    t2, $f31
    addu    v0, t1, t3
    jr      $ra
    andi    v0, v0, 0x00FF             # v0 = 00000000


func_800C46C4:
# MqDbg: 
    mtc1    $zero, $f4                 # $f4 = 0.00
    sw      a1, 0x0004($sp)
    or      v1, $zero, $zero           # v1 = 00000000
    c.le.s  $f4, $f12
    lui     $at, 0x8011                # $at = 80110000
    bc1fl   lbl_800C4730
    ori     v0, v1, 0x0001             # v0 = 00000001
    lwc1    $f0, -0x5F60($at)          # 8010A0A0
    addiu   v1, $zero, 0x007F          # v1 = 0000007F
    ori     v0, v1, 0x0001             # v0 = 0000007F
    c.lt.s  $f0, $f12
    sll     v0, v0, 24
    bc1fl   lbl_800C4708
    div.s   $f6, $f12, $f0
    jr      $ra
    sra     v0, v0, 24
lbl_800C4704:
    div.s   $f6, $f12, $f0
lbl_800C4708:
    lui     $at, 0x42FC                # $at = 42FC0000
    mtc1    $at, $f8                   # $f8 = 126.00
    nop
    mul.s   $f10, $f6, $f8
    trunc.w.s $f16, $f10
    mfc1    v1, $f16
    nop
    sll     v1, v1, 24
    sra     v1, v1, 24
    ori     v0, v1, 0x0001             # v0 = 0000007F
lbl_800C4730:
    sll     v0, v0, 24
    jr      $ra
    sra     v0, v0, 24


func_800C473C:
# MqDbg: 
    addiu   $sp, $sp, 0xFFB8           # $sp -= 0x48
    sw      a0, 0x0048($sp)
    lbu     t7, 0x004B($sp)
    sw      a1, 0x004C($sp)
    lbu     t0, 0x004F($sp)
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f2                   # $f2 = 1.00
    lui     t9, 0x8010                 # t9 = 80100000
    sll     t8, t7,  2
    addu    t9, t9, t8
    sll     t1, t0,  2
    lw      t9, 0x4368(t9)             # 80104368
    subu    t1, t1, t0
    addiu   t6, $zero, 0x0040          # t6 = 00000040
    sll     t1, t1,  4
    sltiu   $at, t7, 0x0007
    sw      $ra, 0x0014($sp)
    sw      a2, 0x0050($sp)
    sb      $zero, 0x0042($sp)
    sb      t6, 0x003B($sp)
    sb      $zero, 0x003A($sp)
    sb      $zero, 0x0039($sp)
    sb      $zero, 0x0038($sp)
    sb      $zero, 0x0033($sp)
    sw      t7, 0x0024($sp)
    swc1    $f2, 0x003C($sp)
    swc1    $f2, 0x0044($sp)
    beq     $at, $zero, lbl_800C49BC
    addu    a3, t9, t1
    sll     t2, t7,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t2
    lw      t2, -0x5F5C($at)           # 8010A0A4
    jr      t2
    nop
    lui     t3, 0x8010                 # t3 = 80100000
    lb      t3, 0x1914(t3)             # 80101914
    addiu   $at, $zero, 0x0002         # $at = 00000002
    bnel    t3, $at, lbl_800C47FC
    lui     $at, 0x4120                # $at = 41200000
    lw      t4, 0x0004(a3)             # 00000004
    lhu     a1, 0x0026(a3)             # 00000026
    lwc1    $f12, 0x0000(t4)           # 00000000
    jal     func_800C46C4
    sw      a3, 0x002C($sp)
    lw      a3, 0x002C($sp)
    sb      v0, 0x0038($sp)
    lui     $at, 0x4120                # $at = 41200000
lbl_800C47FC:
    mtc1    $at, $f6                   # $f6 = 10.00
    lwc1    $f4, 0x001C(a3)            # 0000001C
    sw      a3, 0x002C($sp)
    mul.s   $f12, $f4, $f6
    jal     func_800D0DC0
    nop
    lw      a3, 0x002C($sp)
    swc1    $f0, 0x001C(a3)            # 0000001C
    lbu     a1, 0x004F($sp)
    jal     func_800C3EBC
    lbu     a0, 0x004B($sp)
    lw      a3, 0x002C($sp)
    lbu     a0, 0x004B($sp)
    lbu     a1, 0x004F($sp)
    lw      t5, 0x0014(a3)             # 00000014
    lbu     a2, 0x0053($sp)
    lwc1    $f8, 0x0000(t5)            # 00000000
    mul.s   $f10, $f8, $f0
    jal     func_800C4024
    swc1    $f10, 0x0044($sp)
    lw      a3, 0x002C($sp)
    sb      v0, 0x0042($sp)
    lw      t8, 0x0008(a3)             # 00000008
    lw      t6, 0x0000(a3)             # 00000000
    lbu     a2, 0x000C(a3)             # 0000000C
    lwc1    $f14, 0x0000(t8)           # 00000000
    jal     func_800C419C
    lwc1    $f12, 0x0000(t6)           # 00000000
    sb      v0, 0x003B($sp)
    lbu     a0, 0x004B($sp)
    jal     func_800C4320
    lbu     a1, 0x004F($sp)
    lw      a3, 0x002C($sp)
    lui     v1, 0x8010                 # v1 = 80100000
    lb      v1, 0x1914(v1)             # 80101914
    lw      t0, 0x0010(a3)             # 00000010
    addiu   $at, $zero, 0x0002         # $at = 00000002
    lwc1    $f16, 0x0000(t0)           # 00000000
    mul.s   $f18, $f16, $f0
    bne     v1, $at, lbl_800C4938
    swc1    $f18, 0x003C($sp)
    lhu     v0, 0x0026(a3)             # 00000026
    lui     $at, 0x8010                # $at = 80100000
    andi    t9, v0, 0x0400             # t9 = 00000000
    sra     t1, t9, 10
    sll     t7, t1,  2
    addu    $at, $at, t7
    lwc1    $f4, 0x18D4($at)           # 801018D4
    andi    t2, v0, 0x0800             # t2 = 00000000
    bne     t2, $zero, lbl_800C4938
    swc1    $f4, 0x0034($sp)
    lw      t3, 0x0008(a3)             # 00000008
    lwc1    $f8, 0x0034($sp)
    addiu   t4, $zero, 0x0010          # t4 = 00000010
    lwc1    $f6, 0x0000(t3)            # 00000000
    c.lt.s  $f6, $f8
    nop
    bc1fl   lbl_800C48F0
    lbu     t5, 0x0053($sp)
    sb      t4, 0x003A($sp)
    lbu     t5, 0x0053($sp)
lbl_800C48F0:
    lui     v0, 0x8012                 # v0 = 80120000
    lbu     t8, 0x003A($sp)
    sll     t6, t5,  4
    addu    v0, v0, t6
    lb      v0, 0x1E12(v0)             # 80121E12
    lb      t1, 0x003B($sp)
    xor     t0, v0, t8
    andi    t9, t0, 0x0010             # t9 = 00000000
    beq     t9, $zero, lbl_800C4934
    slti    $at, t1, 0x0040
    beq     $at, $zero, lbl_800C492C
    xori    t2, v0, 0x0018             # t2 = 80120018
    xori    t7, v0, 0x0014             # t7 = 80120014
    b       lbl_800C4938
    sb      t7, 0x003A($sp)
lbl_800C492C:
    b       lbl_800C4938
    sb      t2, 0x003A($sp)
lbl_800C4934:
    sb      v0, 0x003A($sp)
lbl_800C4938:
    lui     v0, 0x8010                 # v0 = 80100000
    lbu     v0, 0x194C(v0)             # 8010194C
    lw      a0, 0x0024($sp)
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     v0, $zero, lbl_800C496C
    lui     t4, 0x8010                 # t4 = 80100000
    beql    a0, $at, lbl_800C496C
    sb      v0, 0x0033($sp)
    beq     a0, $zero, lbl_800C4968
    addiu   $at, $zero, 0x0006         # $at = 00000006
    bnel    a0, $at, lbl_800C4970
    lbu     t3, 0x0033($sp)
lbl_800C4968:
    sb      v0, 0x0033($sp)
lbl_800C496C:
    lbu     t3, 0x0033($sp)
lbl_800C4970:
    lbu     t4, 0x1950(t4)             # 80101950
    addiu   $at, $zero, 0x0002         # $at = 00000002
    or      v0, t3, t4                 # v0 = 80100000
    beq     v0, $zero, lbl_800C498C
    nop
    b       lbl_800C49B8
    sb      v0, 0x0039($sp)
lbl_800C498C:
    bnel    v1, $at, lbl_800C49BC
    lwc1    $f2, 0x0044($sp)
    lhu     t5, 0x0026(a3)             # 00000026
    lwc1    $f12, 0x0034($sp)
    or      a1, a3, $zero              # a1 = 00000000
    andi    t6, t5, 0x2000             # t6 = 00000000
    bnel    t6, $zero, lbl_800C49BC
    lwc1    $f2, 0x0044($sp)
    jal     func_800C44EC
    lb      a2, 0x003B($sp)
    sb      v0, 0x0039($sp)
lbl_800C49B8:
    lwc1    $f2, 0x0044($sp)
lbl_800C49BC:
    lbu     t8, 0x0053($sp)
    lui     t9, 0x8012                 # t9 = 80120000
    addiu   t9, t9, 0x1E08             # t9 = 80121E08
    sll     t0, t8,  4
    addu    v0, t0, t9
    lwc1    $f10, 0x0000(v0)           # 00000000
    lui     $at, 0x42FE                # $at = 42FE0000
    addiu   a1, $zero, 0xFFFF          # a1 = FFFFFFFF
    c.eq.s  $f2, $f10
    nop
    bc1t    lbl_800C4A88
    nop
    mtc1    $at, $f16                  # $f16 = 127.00
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    lui     $at, 0x4F00                # $at = 4F000000
    mul.s   $f18, $f2, $f16
    cfc1    t1, $f31
    ctc1    a1, $f31
    nop
    cvt.w.s $f4, $f18
    cfc1    a1, $f31
    nop
    andi    a1, a1, 0x0078             # a1 = 00000000
    beql    a1, $zero, lbl_800C4A68
    mfc1    a1, $f4
    mtc1    $at, $f4                   # $f4 = 2147484000.00
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    sub.s   $f4, $f18, $f4
    ctc1    a1, $f31
    nop
    cvt.w.s $f4, $f4
    cfc1    a1, $f31
    nop
    andi    a1, a1, 0x0078             # a1 = 00000000
    bne     a1, $zero, lbl_800C4A5C
    nop
    mfc1    a1, $f4
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800C4A74
    or      a1, a1, $at                # a1 = 80000000
lbl_800C4A5C:
    b       lbl_800C4A74
    addiu   a1, $zero, 0xFFFF          # a1 = FFFFFFFF
    mfc1    a1, $f4
lbl_800C4A68:
    nop
    bltz    a1, lbl_800C4A5C
    nop
lbl_800C4A74:
    ctc1    t1, $f31
    sll     a1, a1, 24
    sra     a1, a1, 24
    b       lbl_800C4A88
    swc1    $f2, 0x0000(v0)            # 00000000
lbl_800C4A88:
    lbu     v1, 0x0053($sp)
    lui     $at, 0x0602                # $at = 06020000
    sw      v0, 0x0024($sp)
    sll     v1, v1,  8
    or      a2, v1, $at                # a2 = 06020000
    ori     a0, a2, 0x0002             # a0 = 06020002
    sw      a2, 0x0018($sp)
    jal     func_800BB0E0
    sw      v1, 0x001C($sp)
    lw      v0, 0x0024($sp)
    lb      a1, 0x0042($sp)
    lw      a0, 0x001C($sp)
    lb      t7, 0x0008(v0)             # 00000008
    lui     $at, 0x0502                # $at = 05020000
    or      a0, a0, $at                # a0 = 05020000
    beql    a1, t7, lbl_800C4AE4
    lwc1    $f0, 0x003C($sp)
    jal     func_800BB0E0
    sw      v0, 0x0024($sp)
    lw      v0, 0x0024($sp)
    lb      t2, 0x0042($sp)
    sb      t2, 0x0008(v0)             # 00000008
    lwc1    $f0, 0x003C($sp)
lbl_800C4AE4:
    lwc1    $f6, 0x0004(v0)            # 00000004
    lw      a0, 0x001C($sp)
    lui     $at, 0x0402                # $at = 04020000
    c.eq.s  $f0, $f6
    or      a0, a0, $at                # a0 = 04020000
    bc1tl   lbl_800C4B1C
    lbu     v1, 0x003A($sp)
    mfc1    a1, $f0
    jal     func_800BB098
    sw      v0, 0x0024($sp)
    lw      v0, 0x0024($sp)
    lwc1    $f8, 0x003C($sp)
    swc1    $f8, 0x0004(v0)            # 00000004
    lbu     v1, 0x003A($sp)
lbl_800C4B1C:
    lb      t3, 0x000A(v0)             # 0000000A
    lw      a0, 0x001C($sp)
    lui     $at, 0x0E02                # $at = 0E020000
    beq     v1, t3, lbl_800C4B54
    or      a0, a0, $at                # a0 = 0E020000
    ori     a1, v1, 0x0010             # a1 = 00000010
    sll     a1, a1, 24
    sra     a1, a1, 24
    sw      v0, 0x0024($sp)
    jal     func_800BB0E0
    sw      v1, 0x0020($sp)
    lw      v0, 0x0024($sp)
    lw      v1, 0x0020($sp)
    sb      v1, 0x000A(v0)             # 0000000A
lbl_800C4B54:
    lbu     v1, 0x0039($sp)
    lbu     t4, 0x000B(v0)             # 0000000B
    lw      a0, 0x0018($sp)
    sll     a1, v1, 24
    beq     v1, t4, lbl_800C4B84
    ori     a0, a0, 0x0003             # a0 = 00000003
    sra     a1, a1, 24
    jal     func_800BB0E0
    sw      v0, 0x0024($sp)
    lw      v0, 0x0024($sp)
    lbu     t5, 0x0039($sp)
    sb      t5, 0x000B(v0)             # 0000000B
lbl_800C4B84:
    lb      t6, 0x0038($sp)
    lbu     t8, 0x000C(v0)             # 0000000C
    lw      a0, 0x001C($sp)
    lui     $at, 0x0C02                # $at = 0C020000
    beq     t6, t8, lbl_800C4BDC
    or      a0, a0, $at                # a0 = 0C020000
    addiu   a1, $zero, 0x0010          # a1 = 00000010
    jal     func_800BB0E0
    sw      v0, 0x0024($sp)
    lb      v1, 0x0038($sp)
    lw      a0, 0x001C($sp)
    lui     $at, 0x0D02                # $at = 0D020000
    or      a1, v1, $zero              # a1 = 00000000
    sll     a1, a1,  8
    addiu   a1, a1, 0x00FF             # a1 = 000000FF
    andi    a1, a1, 0xFFFF             # a1 = 000000FF
    sw      v1, 0x0020($sp)
    jal     func_800BB110
    or      a0, a0, $at                # a0 = 0D020000
    lw      v0, 0x0024($sp)
    lw      v1, 0x0020($sp)
    sb      v1, 0x000C(v0)             # 0000000C
lbl_800C4BDC:
    lb      t0, 0x003B($sp)
    lb      t9, 0x0009(v0)             # 00000009
    lw      a0, 0x001C($sp)
    lui     $at, 0x0302                # $at = 03020000
    beq     t0, t9, lbl_800C4C0C
    or      a0, a0, $at                # a0 = 03020000
    or      a1, t0, $zero              # a1 = 00000000
    jal     func_800BB0E0
    sw      v0, 0x0024($sp)
    lw      v0, 0x0024($sp)
    lb      t1, 0x003B($sp)
    sb      t1, 0x0009(v0)             # 00000009
lbl_800C4C0C:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0048           # $sp += 0x48
    jr      $ra
    nop


func_800C4C1C:
# MqDbg: 
    lui     $at, 0x3F80                # $at = 3F800000
    lui     a0, 0x8012                 # a0 = 80120000
    mtc1    $at, $f0                   # $f0 = 1.00
    addiu   a0, a0, 0x1E08             # a0 = 80121E08
    or      v0, $zero, $zero           # v0 = 00000000
    addiu   a2, $zero, 0x00FF          # a2 = 000000FF
    addiu   a1, $zero, 0x0040          # a1 = 00000040
lbl_800C4C38:
    sll     t6, v0,  4
    addu    v1, a0, t6
    addiu   v0, v0, 0x0001             # v0 = 00000001
    andi    v0, v0, 0x00FF             # v0 = 00000001
    slti    $at, v0, 0x0010
    swc1    $f0, 0x0000(v1)            # 00000000
    swc1    $f0, 0x0004(v1)            # 00000004
    sb      $zero, 0x0008(v1)          # 00000008
    sb      a1, 0x0009(v1)             # 00000009
    sb      $zero, 0x000A(v1)          # 0000000A
    sb      a2, 0x000B(v1)             # 0000000B
    bne     $at, $zero, lbl_800C4C38
    sb      a2, 0x000C(v1)             # 0000000C
    sb      $zero, 0x00DC(a0)          # 80121EE4
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x192C($at)         # 8010192C
    lui     $at, 0x8010                # $at = 80100000
    jr      $ra
    sb      $zero, 0x1928($at)         # 80101928


func_800C4C84:
# MqDbg: 
    lui     t6, 0x8012                 # t6 = 80120000
    lbu     t6, 0x4754(t6)             # 80124754
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    addiu   $at, $zero, 0x0001         # $at = 00000001
    sw      $ra, 0x0014($sp)
    beq     t6, $at, lbl_800C4CBC
    sw      a0, 0x0018($sp)
    lui     a0, 0x0300                 # a0 = 03000000
    jal     func_800CAA70
    ori     a0, a0, 0x006D             # a0 = 0300006D
    lbu     a0, 0x001B($sp)
    lui     $at, 0x8300                # $at = 83000000
    jal     func_800CAA70
    or      a0, a0, $at                # a0 = 83000000
lbl_800C4CBC:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C4CCC:
# MqDbg: 
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f0                   # $f0 = 1.00
    lui     $at, 0x40C0                # $at = 40C00000
    mtc1    $at, $f14                  # $f14 = 6.00
    lui     $at, 0x8012                # $at = 80120000
    mov.s   $f2, $f0
    c.lt.s  $f14, $f12
    nop
    bc1fl   lbl_800C4D10
    div.s   $f2, $f12, $f14
    swc1    $f0, 0x1DC0($at)           # 80121DC0
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f4, -0x5F40($at)          # 8010A0C0
    lui     $at, 0x8012                # $at = 80120000
    jr      $ra
    swc1    $f4, 0x1DC8($at)           # 80121DC8
lbl_800C4D0C:
    div.s   $f2, $f12, $f14
lbl_800C4D10:
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f6, -0x5F3C($at)          # 8010A0C4
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f10, -0x5F38($at)         # 8010A0C8
    lui     $at, 0x8012                # $at = 80120000
    mul.s   $f8, $f2, $f6
    add.s   $f16, $f8, $f10
    swc1    $f16, 0x1DC0($at)          # 80121DC0
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f18, -0x5F34($at)         # 8010A0CC
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f6, -0x5F30($at)          # 8010A0D0
    mul.s   $f4, $f2, $f18
    lui     $at, 0x8012                # $at = 80120000
    add.s   $f8, $f4, $f6
    swc1    $f8, 0x1DC8($at)           # 80121DC8
    jr      $ra
    mov.s   $f0, $f2


func_800C4D58:
# MqDbg: 
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x001C($sp)
    sw      a2, 0x0030($sp)
    sw      a0, 0x0028($sp)
    sw      a1, 0x002C($sp)
    jal     func_800C4CCC
    lwc1    $f12, 0x0030($sp)
    lui     t6, 0x8012                 # t6 = 80120000
    lui     t7, 0x8010                 # t7 = 80100000
    addiu   t7, t7, 0x43A8             # t7 = 801043A8
    addiu   t6, t6, 0x1DC0             # t6 = 80121DC0
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x1DC8             # a3 = 80121DC8
    sw      t6, 0x0010($sp)
    sw      t7, 0x0014($sp)
    lhu     a0, 0x002E($sp)
    lw      a1, 0x0028($sp)
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    jal     func_800C806C
    swc1    $f0, 0x0024($sp)
    lhu     v1, 0x002E($sp)
    addiu   $at, $zero, 0x00B0         # $at = 000000B0
    lwc1    $f2, 0x0024($sp)
    andi    t8, v1, 0x00F0             # t8 = 00000000
    bne     t8, $at, lbl_800C4DD8
    lwc1    $f4, 0x0030($sp)
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f0, -0x5F2C($at)          # 8010A0D4
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f2                   # $f2 = 1.00
    b       lbl_800C4DF0
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800C4DD8:
    lui     v0, 0x8012                 # v0 = 80120000
    lw      v0, 0x7FAC(v0)             # 80127FAC
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f0, -0x5F28($at)          # 8010A0D8
    andi    v0, v0, 0x0001             # v0 = 00000000
    andi    v0, v0, 0x00FF             # v0 = 00000000
lbl_800C4DF0:
    c.lt.s  $f0, $f4
    nop
    bc1fl   lbl_800C4E6C
    lw      $ra, 0x001C($sp)
    beq     v0, $zero, lbl_800C4E68
    andi    t9, v1, 0x0080             # t9 = 00000000
    beq     t9, $zero, lbl_800C4E18
    lui     $at, 0x8011                # $at = 80110000
    b       lbl_800C4E1C
    addiu   a0, $zero, 0x0867          # a0 = 00000867
lbl_800C4E18:
    addiu   a0, $zero, 0x0866          # a0 = 00000866
lbl_800C4E1C:
    ldc1    $f8, -0x5F20($at)          # 8010A0E0
    cvt.d.s $f6, $f2
    lui     $at, 0x8011                # $at = 80110000
    mul.d   $f10, $f6, $f8
    ldc1    $f16, -0x5F18($at)         # 8010A0E8
    lui     v0, 0x8012                 # v0 = 80120000
    lui     t0, 0x8010                 # t0 = 80100000
    addiu   v0, v0, 0x1DC4             # v0 = 80121DC4
    addiu   t0, t0, 0x43A8             # t0 = 801043A8
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x1DC8             # a3 = 80121DC8
    add.d   $f18, $f10, $f16
    sw      t0, 0x0014($sp)
    sw      v0, 0x0010($sp)
    lw      a1, 0x0028($sp)
    cvt.s.d $f4, $f18
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    jal     func_800C806C
    swc1    $f4, 0x0000(v0)            # 80121DC4
lbl_800C4E68:
    lw      $ra, 0x001C($sp)
lbl_800C4E6C:
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800C4E78:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x001C($sp)
    mtc1    a2, $f12                   # $f12 = 0.00
    sw      a0, 0x0020($sp)
    jal     func_800C4CCC
    sw      a1, 0x0024($sp)
    lui     t6, 0x8012                 # t6 = 80120000
    lui     t7, 0x8010                 # t7 = 80100000
    addiu   t7, t7, 0x43A8             # t7 = 801043A8
    addiu   t6, t6, 0x1DC0             # t6 = 80121DC0
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x1DC8             # a3 = 80121DC8
    sw      t6, 0x0010($sp)
    sw      t7, 0x0014($sp)
    lhu     a0, 0x0026($sp)
    lw      a1, 0x0020($sp)
    jal     func_800C806C
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C4ED0:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a1, 0x0024($sp)
    lui     t6, 0x8010                 # t6 = 80100000
    lui     t7, 0x8010                 # t7 = 80100000
    or      a1, a0, $zero              # a1 = 00000000
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0020($sp)
    addiu   t7, t7, 0x18C4             # t7 = 801018C4
    addiu   t6, t6, 0x43A0             # t6 = 801043A0
    lui     a3, 0x8010                 # a3 = 80100000
    addiu   a3, a3, 0x18C0             # a3 = 801018C0
    sw      t6, 0x0010($sp)
    sw      t7, 0x0014($sp)
    lhu     a0, 0x0026($sp)
    jal     func_800C806C
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C4F20:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0020($sp)
    sw      a1, 0x0024($sp)
    jal     func_800BBD80
    sw      a2, 0x0028($sp)
    lbu     t7, 0x002B($sp)
    lhu     t6, 0x0026($sp)
    lui     a3, 0x8010                 # a3 = 80100000
    divu    $zero, v0, t7
    mfhi    t8
    andi    t9, t8, 0x00FF             # t9 = 00000000
    lui     t0, 0x8010                 # t0 = 80100000
    addiu   a3, a3, 0x43A0             # a3 = 801043A0
    addiu   t0, t0, 0x43A8             # t0 = 801043A8
    bne     t7, $zero, lbl_800C4F68
    nop
    break   # 0x01C00
lbl_800C4F68:
    addu    a0, t6, t9
    andi    a0, a0, 0xFFFF             # a0 = 00000000
    sw      t0, 0x0014($sp)
    sw      a3, 0x0010($sp)
    lw      a1, 0x0020($sp)
    jal     func_800C806C
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C4F94:
# MqDbg: 
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      s0, 0x0020($sp)
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x18F0(t6)             # 801018F0
    or      s0, a1, $zero              # s0 = 00000000
    andi    s0, s0, 0x0003             # s0 = 00000000
    andi    s0, s0, 0x00FF             # s0 = 00000000
    sw      $ra, 0x0024($sp)
    sw      a0, 0x0030($sp)
    sw      a1, 0x0034($sp)
    beq     t6, s0, lbl_800C5064
    or      v0, s0, $zero              # v0 = 00000000
    sll     t7, s0,  2
    lui     $at, 0x8010                # $at = 80100000
    addu    $at, $at, t7
    lwc1    $f4, 0x18F4($at)           # 801018F4
    lui     a3, 0x8010                 # a3 = 80100000
    addiu   a3, a3, 0x1904             # a3 = 80101904
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     s0, $at, lbl_800C4FFC
    swc1    $f4, 0x0000(a3)            # 80101904
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     v0, $at, lbl_800C5030
    addiu   a0, $zero, 0x086D          # a0 = 0000086D
    b       lbl_800C505C
    nop
lbl_800C4FFC:
    lui     t8, 0x8010                 # t8 = 80100000
    lui     t9, 0x8010                 # t9 = 80100000
    addiu   t9, t9, 0x43A8             # t9 = 801043A8
    addiu   t8, t8, 0x43A0             # t8 = 801043A0
    sw      t8, 0x0010($sp)
    sw      t9, 0x0014($sp)
    addiu   a0, $zero, 0x086D          # a0 = 0000086D
    lw      a1, 0x0030($sp)
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    jal     func_800C806C
    sw      v0, 0x0028($sp)
    b       lbl_800C505C
    lw      v0, 0x0028($sp)
lbl_800C5030:
    lui     t0, 0x8010                 # t0 = 80100000
    lui     t1, 0x8010                 # t1 = 80100000
    addiu   t1, t1, 0x43A8             # t1 = 801043A8
    addiu   t0, t0, 0x43A0             # t0 = 801043A0
    sw      t0, 0x0010($sp)
    sw      t1, 0x0014($sp)
    lw      a1, 0x0030($sp)
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    jal     func_800C806C
    sw      v0, 0x0028($sp)
    lw      v0, 0x0028($sp)
lbl_800C505C:
    lui     $at, 0x8010                # $at = 80100000
    sb      s0, 0x18F0($at)            # 801018F0
lbl_800C5064:
    lui     a3, 0x8010                 # a3 = 80100000
    beq     v0, $zero, lbl_800C5098
    addiu   a3, a3, 0x1904             # a3 = 80101904
    lui     t2, 0x8010                 # t2 = 80100000
    lui     t3, 0x8010                 # t3 = 80100000
    addiu   t3, t3, 0x43A8             # t3 = 801043A8
    addiu   t2, t2, 0x43A0             # t2 = 801043A0
    sw      t2, 0x0010($sp)
    sw      t3, 0x0014($sp)
    addiu   a0, $zero, 0x1022          # a0 = 00001022
    lw      a1, 0x0030($sp)
    jal     func_800C806C
    addiu   a2, $zero, 0x0004          # a2 = 00000004
lbl_800C5098:
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0020($sp)
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop


func_800C50AC:
# MqDbg: 
    lui     $at, 0x3F40                # $at = 3F400000
    mtc1    $at, $f0                   # $f0 = 0.75
    mtc1    a2, $f12                   # $f12 = 0.00
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    lui     a3, 0x8012                 # a3 = 80120000
    c.lt.s  $f12, $f0
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0020($sp)
    sw      a1, 0x0024($sp)
    bc1f    lbl_800C5104
    addiu   a3, a3, 0x1DF0             # a3 = 80121DF0
    div.s   $f4, $f12, $f0
    lui     $at, 0x3E80                # $at = 3E800000
    mtc1    $at, $f6                   # $f6 = 0.25
    lui     $at, 0x3F00                # $at = 3F000000
    mtc1    $at, $f10                  # $f10 = 0.50
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x1DF0             # a3 = 80121DF0
    mul.s   $f8, $f4, $f6
    add.s   $f16, $f8, $f10
    b       lbl_800C5108
    swc1    $f16, 0x0000(a3)           # 80121DF0
lbl_800C5104:
    swc1    $f12, 0x0000(a3)           # 80121DF0
lbl_800C5108:
    lui     $at, 0x3F00                # $at = 3F000000
    mtc1    $at, $f18                  # $f18 = 0.50
    lwc1    $f4, 0x0000(a3)            # 80121DF0
    lui     t6, 0x8010                 # t6 = 80100000
    addiu   t6, t6, 0x43A0             # t6 = 801043A0
    c.lt.s  $f18, $f4
    lhu     a0, 0x0026($sp)
    lw      a1, 0x0020($sp)
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    bc1f    lbl_800C5144
    lui     t7, 0x8010                 # t7 = 80100000
    addiu   t7, t7, 0x43A8             # t7 = 801043A8
    sw      t7, 0x0014($sp)
    jal     func_800C806C
    sw      t6, 0x0010($sp)
lbl_800C5144:
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C5154:
# MqDbg: 
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x18C8             # v1 = 801018C8
    lb      t6, 0x0000(v1)             # 801018C8
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    mtc1    a2, $f12                   # $f12 = 0.00
    addiu   t7, t6, 0xFFFF             # t7 = FFFFFFFF
    sb      t7, 0x0000(v1)             # 801018C8
    lb      t8, 0x0000(v1)             # 801018C8
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0020($sp)
    bne     t8, $zero, lbl_800C521C
    sw      a1, 0x0024($sp)
    lui     t9, 0x8010                 # t9 = 80100000
    lui     t0, 0x8010                 # t0 = 80100000
    addiu   t0, t0, 0x43A8             # t0 = 801043A8
    addiu   t9, t9, 0x43A0             # t9 = 801043A0
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x1DF0             # a3 = 80121DF0
    sw      t9, 0x0010($sp)
    sw      t0, 0x0014($sp)
    lhu     a0, 0x0026($sp)
    lw      a1, 0x0020($sp)
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    jal     func_800C806C
    swc1    $f12, 0x0028($sp)
    lui     $at, 0x4000                # $at = 40000000
    mtc1    $at, $f0                   # $f0 = 2.00
    lwc1    $f12, 0x0028($sp)
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x18C8             # v1 = 801018C8
    c.lt.s  $f0, $f12
    lui     v0, 0x8010                 # v0 = 80100000
    lui     t1, 0x8010                 # t1 = 80100000
    bc1f    lbl_800C51E4
    nop
    mov.s   $f12, $f0
lbl_800C51E4:
    lb      v0, 0x18D0(v0)             # 801018D0
    lb      t1, 0x18CC(t1)             # 801018CC
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f8                   # $f8 = 1.00
    subu    t2, v0, t1
    mtc1    t2, $f4                    # $f4 = 0.00
    sub.s   $f10, $f8, $f12
    cvt.s.w $f6, $f4
    mul.s   $f16, $f6, $f10
    trunc.w.s $f18, $f16
    mfc1    t6, $f18
    nop
    addu    t7, t6, v0
    sb      t7, 0x0000(v1)             # 801018C8
lbl_800C521C:
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C522C:
# MqDbg: 
    sw      a1, 0x0004($sp)
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    lui     $at, 0x8010                # $at = 80100000
    sll     a1, a1, 24
    sb      t6, 0x18C8($at)            # 801018C8
    sra     a1, a1, 24
    sw      a0, 0x0000($sp)
    lui     $at, 0x8010                # $at = 80100000
    sll     a0, a0, 24
    sb      a1, 0x18CC($at)            # 801018CC
    sra     a0, a0, 24
    lui     $at, 0x8010                # $at = 80100000
    jr      $ra
    sb      a0, 0x18D0($at)            # 801018D0


func_800C5264:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a2, 0x0028($sp)
    lb      t6, 0x002B($sp)
    sw      a1, 0x0024($sp)
    lui     v0, 0x8012                 # v0 = 80120000
    lui     a3, 0x8010                 # a3 = 80100000
    addiu   a3, a3, 0x43A0             # a3 = 801043A0
    addiu   v0, v0, 0x1DF4             # v0 = 80121DF4
    or      a1, a0, $zero              # a1 = 00000000
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0020($sp)
    lhu     a0, 0x0026($sp)
    sw      v0, 0x0014($sp)
    sw      a3, 0x0010($sp)
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    jal     func_800C806C
    sb      t6, 0x0000(v0)             # 80121DF4
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C52B8:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    mtc1    a2, $f12                   # $f12 = 0.00
    sw      a1, 0x0024($sp)
    lui     v0, 0x8012                 # v0 = 80120000
    lui     t6, 0x8010                 # t6 = 80100000
    addiu   v0, v0, 0x1DF8             # v0 = 80121DF8
    or      a1, a0, $zero              # a1 = 00000000
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0020($sp)
    addiu   t6, t6, 0x43A8             # t6 = 801043A8
    lui     a3, 0x8010                 # a3 = 80100000
    addiu   a3, a3, 0x43A0             # a3 = 801043A0
    sw      t6, 0x0014($sp)
    lhu     a0, 0x0026($sp)
    sw      v0, 0x0010($sp)
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    jal     func_800C806C
    swc1    $f12, 0x0000(v0)           # 80121DF8
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C5310:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    swc1    $f12, 0x0018($sp)
    lui     a0, 0x8010                 # a0 = 80100000
    addiu   a0, a0, 0x4394             # a0 = 80104394
    lw      a2, 0x0018($sp)
    jal     func_800C5154
    addiu   a1, $zero, 0x103D          # a1 = 0000103D
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f4, -0x5F10($at)          # 8010A0F0
    lwc1    $f6, 0x0018($sp)
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f10, -0x5F0C($at)         # 8010A0F4
    mul.s   $f8, $f4, $f6
    lui     a0, 0x8010                 # a0 = 80100000
    addiu   a0, a0, 0x4394             # a0 = 80104394
    or      a1, $zero, $zero           # a1 = 00000000
    add.s   $f16, $f8, $f10
    mfc1    a2, $f16
    jal     func_800C50AC
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C5374:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    mtc1    a1, $f12                   # $f12 = 0.00
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0020($sp)
    addiu   a0, $zero, 0x2006          # a0 = 00002006
    jal     func_800C9B74
    swc1    $f12, 0x0024($sp)
    bne     v0, $zero, lbl_800C53A8
    lwc1    $f12, 0x0024($sp)
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x1DD0             # a3 = 80121DD0
    b       lbl_800C53E8
    swc1    $f12, 0x0000(a3)           # 80121DD0
lbl_800C53A8:
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x1DD0             # a3 = 80121DD0
    lwc1    $f0, 0x0000(a3)            # 80121DD0
    c.eq.s  $f12, $f0
    nop
    bc1t    lbl_800C53E8
    nop
    swc1    $f12, 0x0004(a3)           # 80121DD4
    lwc1    $f4, 0x0004(a3)            # 80121DD4
    lui     $at, 0x4220                # $at = 42200000
    mtc1    $at, $f8                   # $f8 = 40.00
    sub.s   $f6, $f4, $f0
    addiu   t6, $zero, 0x0028          # t6 = 00000028
    sw      t6, 0x000C(a3)             # 80121DDC
    div.s   $f10, $f6, $f8
    swc1    $f10, 0x0008(a3)           # 80121DD8
lbl_800C53E8:
    lui     t7, 0x8010                 # t7 = 80100000
    lui     t8, 0x8010                 # t8 = 80100000
    addiu   t8, t8, 0x43A8             # t8 = 801043A8
    addiu   t7, t7, 0x43A0             # t7 = 801043A0
    sw      t7, 0x0010($sp)
    sw      t8, 0x0014($sp)
    addiu   a0, $zero, 0x2006          # a0 = 00002006
    lw      a1, 0x0020($sp)
    jal     func_800C806C
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C5420:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    mtc1    a1, $f12                   # $f12 = 0.00
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0020($sp)
    addiu   a0, $zero, 0x2007          # a0 = 00002007
    jal     func_800C9B74
    swc1    $f12, 0x0024($sp)
    bne     v0, $zero, lbl_800C5454
    lwc1    $f12, 0x0024($sp)
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x1DE0             # a3 = 80121DE0
    b       lbl_800C5494
    swc1    $f12, 0x0000(a3)           # 80121DE0
lbl_800C5454:
    lui     a3, 0x8012                 # a3 = 80120000
    addiu   a3, a3, 0x1DE0             # a3 = 80121DE0
    lwc1    $f0, 0x0000(a3)            # 80121DE0
    c.eq.s  $f12, $f0
    nop
    bc1t    lbl_800C5494
    nop
    swc1    $f12, 0x0004(a3)           # 80121DE4
    lwc1    $f4, 0x0004(a3)            # 80121DE4
    lui     $at, 0x4220                # $at = 42200000
    mtc1    $at, $f8                   # $f8 = 40.00
    sub.s   $f6, $f4, $f0
    addiu   t6, $zero, 0x0028          # t6 = 00000028
    sw      t6, 0x000C(a3)             # 80121DEC
    div.s   $f10, $f6, $f8
    swc1    $f10, 0x0008(a3)           # 80121DE8
lbl_800C5494:
    lui     t7, 0x8010                 # t7 = 80100000
    addiu   t7, t7, 0x43A8             # t7 = 801043A8
    sw      t7, 0x0014($sp)
    addiu   a0, $zero, 0x2007          # a0 = 00002007
    lw      a1, 0x0020($sp)
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    jal     func_800C806C
    sw      a3, 0x0010($sp)
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C54C4:
# MqDbg: 
    lw      v0, 0x000C(a0)             # 0000000C
    beq     v0, $zero, lbl_800C54F4
    addiu   t6, v0, 0xFFFF             # t6 = FFFFFFFF
    beq     t6, $zero, lbl_800C54EC
    sw      t6, 0x000C(a0)             # 0000000C
    lwc1    $f4, 0x0000(a0)            # 00000000
    lwc1    $f6, 0x0008(a0)            # 00000008
    add.s   $f8, $f4, $f6
    jr      $ra
    swc1    $f8, 0x0000(a0)            # 00000000
lbl_800C54EC:
    lwc1    $f10, 0x0004(a0)           # 00000004
    swc1    $f10, 0x0000(a0)           # 00000000
lbl_800C54F4:
    jr      $ra
    nop


func_800C54FC:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_800CACA4
    addiu   a3, $zero, 0x000A          # a3 = 0000000A
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_800CACA4
    addiu   a3, $zero, 0x000A          # a3 = 0000000A
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C553C:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    jal     func_800CACA4
    addiu   a3, $zero, 0x0003          # a3 = 00000003
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    jal     func_800CACA4
    addiu   a3, $zero, 0x0003          # a3 = 00000003
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C557C:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0018($sp)
    sw      a1, 0x001C($sp)
    andi    a2, a0, 0x00FF             # a2 = 00000000
    andi    a3, a1, 0x00FF             # a3 = 00000000
    or      a1, $zero, $zero           # a1 = 00000000
    jal     func_800CACA4
    or      a0, $zero, $zero           # a0 = 00000000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C55B0:
# MqDbg: 
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      s1, 0x001C($sp)
    andi    v0, a0, 0x00FF             # v0 = 00000000
    sw      $ra, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s0, 0x0018($sp)
    sw      a0, 0x0030($sp)
    bne     v0, $zero, lbl_800C55D8
    or      s1, $zero, $zero           # s1 = 00000000
    addiu   s1, $zero, 0x007F          # s1 = 0000007F
lbl_800C55D8:
    or      s0, $zero, $zero           # s0 = 00000000
    sw      v0, 0x0028($sp)
    lui     s2, 0x0700                 # s2 = 07000000
    andi    t6, s0, 0x00FF             # t6 = 00000000
lbl_800C55E8:
    sll     t7, t6,  8
    sll     a1, s1, 24
    sra     a1, a1, 24
    jal     func_800BB0E0
    or      a0, t7, s2                 # a0 = 07000000
    addiu   s0, s0, 0x0001             # s0 = 00000001
    andi    s0, s0, 0x00FF             # s0 = 00000001
    slti    $at, s0, 0x0010
    bnel    $at, $zero, lbl_800C55E8
    andi    t6, s0, 0x00FF             # t6 = 00000001
    lw      t8, 0x0028($sp)
    lw      t0, 0x0028($sp)
    addiu   $at, $zero, 0x0007         # $at = 00000007
    bne     t8, $at, lbl_800C5634
    andi    t1, t0, 0x0007             # t1 = 00000000
    addiu   t9, $zero, 0x0002          # t9 = 00000002
    lui     $at, 0x8010                # $at = 80100000
    b       lbl_800C5644
    sb      t9, 0x1910($at)            # 80101910
lbl_800C5634:
    lui     a0, 0x8010                 # a0 = 80100000
    addu    a0, a0, t1
    jal     func_800C565C
    lbu     a0, 0x1908(a0)             # 80101908
lbl_800C5644:
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030           # $sp += 0x30


func_800C565C:
# MqDbg: 
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    lui     t6, 0x8012                 # t6 = 80120000
    lbu     t6, 0x1E00(t6)             # 80121E00
    sw      s5, 0x0028($sp)
    andi    a2, a0, 0x00FF             # a2 = 00000000
    sw      $ra, 0x002C($sp)
    sw      s4, 0x0024($sp)
    sw      s3, 0x0020($sp)
    sw      s2, 0x001C($sp)
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    sw      a0, 0x0030($sp)
    beq     a2, t6, lbl_800C576C
    or      s5, a2, $zero              # s5 = 00000000
    or      a0, $zero, $zero           # a0 = 00000000
    or      a1, $zero, $zero           # a1 = 00000000
    addiu   a3, $zero, 0x0002          # a3 = 00000002
    jal     func_800CACA4
    sb      a2, 0x0033($sp)
    slti    $at, s5, 0x0040
    beq     $at, $zero, lbl_800C56BC
    addiu   v0, s5, 0xFFC0             # v0 = FFFFFFC0
    b       lbl_800C56CC
    addiu   v0, $zero, 0x0010          # v0 = 00000010
lbl_800C56BC:
    sra     v0, v0,  2
    addiu   v0, v0, 0x0001             # v0 = 00000011
    sll     v0, v0,  4
    andi    v0, v0, 0x00FF             # v0 = 00000011
lbl_800C56CC:
    lui     $at, 0x8004                # $at = 80040000
    ori     $at, $at, 0x0F00           # $at = 80040F00
    jal     func_800CAA70
    or      a0, v0, $at                # a0 = 80040F11
    lui     s2, 0x8012                 # s2 = 80120000
    lui     s1, 0x8013                 # s1 = 80130000
    addiu   s1, s1, 0xB0E0             # s1 = 8012B0E0
    addiu   s2, s2, 0x5630             # s2 = 80125630
    or      s0, $zero, $zero           # s0 = 00000000
    lui     s4, 0x0500                 # s4 = 05000000
    addiu   s3, $zero, 0x00FF          # s3 = 000000FF
    sll     t7, s0,  2
lbl_800C56FC:
    addu    t8, s2, t7
    lw      v0, 0x3568(t8)             # 00003568
    beql    s1, v0, lbl_800C5750
    addiu   s0, s0, 0x0001             # s0 = 00000001
    lb      v1, 0x00C9(v0)             # 000000C9
    andi    t1, s0, 0x00FF             # t1 = 00000001
    sll     t2, t1,  8
    andi    t9, v1, 0x00FF             # t9 = 00000000
    beq     s3, t9, lbl_800C574C
    subu    v0, v1, s5
    addiu   v0, v0, 0x007F             # v0 = 0000007F
    andi    v0, v0, 0xFFFF             # v0 = 0000007F
    slti    $at, v0, 0x0080
    bne     $at, $zero, lbl_800C573C
    or      a0, t2, s4                 # a0 = 05000000
    addiu   v0, $zero, 0x007F          # v0 = 0000007F
lbl_800C573C:
    or      a1, v0, $zero              # a1 = 0000007F
    sll     a1, a1, 24
    jal     func_800BB0E0
    sra     a1, a1, 24
lbl_800C574C:
    addiu   s0, s0, 0x0001             # s0 = 00000002
lbl_800C5750:
    andi    s0, s0, 0x00FF             # s0 = 00000002
    slti    $at, s0, 0x0010
    bnel    $at, $zero, lbl_800C56FC
    sll     t7, s0,  2
    lbu     t3, 0x0033($sp)
    lui     $at, 0x8012                # $at = 80120000
    sb      t3, 0x1E00($at)            # 80121E00
lbl_800C576C:
    lw      $ra, 0x002C($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    lw      s4, 0x0024($sp)
    lw      s5, 0x0028($sp)
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF


func_800C5794:
# MqDbg: 
# Sound? Set u8 80121DFC to A0, u8 80121DFE to 1
# A0 = ?
    lui     $at, 0x8012                # $at = 80120000
    sb      a0, 0x1DFC($at)            # 80121DFC
    lui     $at, 0x8012                # $at = 80120000
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    sw      a0, 0x0000($sp)
    jr      $ra
    sb      t6, 0x1DFE($at)            # 80121DFE


func_800C57B0:
# MqDbg: 
    lui     t6, 0x8012                 # t6 = 80120000
    lbu     t6, 0x1DFE(t6)             # 80121DFE
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    addiu   v0, $zero, 0x0001          # v0 = 00000001
    bne     v0, t6, lbl_800C5818
    sw      $ra, 0x0014($sp)
    lui     a2, 0x8012                 # a2 = 80120000
    lui     t7, 0x8012                 # t7 = 80120000
    lbu     t7, 0x1DFD(t7)             # 80121DFD
    lbu     a2, 0x1DFC(a2)             # 80121DFC
    or      a0, $zero, $zero           # a0 = 00000000
    or      a1, $zero, $zero           # a1 = 00000000
    beq     a2, t7, lbl_800C580C
    nop
    jal     func_800CACA4
    addiu   a3, $zero, 0x000A          # a3 = 0000000A
    lui     t8, 0x8012                 # t8 = 80120000
    lbu     t8, 0x1DFC(t8)             # 80121DFC
    lui     $at, 0x8012                # $at = 80120000
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    sb      t8, 0x1DFD($at)            # 80121DFD
    lui     $at, 0x8012                # $at = 80120000
    sb      t9, 0x1DFF($at)            # 80121DFF
lbl_800C580C:
    lui     $at, 0x8012                # $at = 80120000
    b       lbl_800C585C
    sb      $zero, 0x1DFE($at)         # 80121DFE
lbl_800C5818:
    lui     t0, 0x8012                 # t0 = 80120000
    lbu     t0, 0x1DFF(t0)             # 80121DFF
    lui     t1, 0x8010                 # t1 = 80100000
    bne     v0, t0, lbl_800C585C
    nop
    lb      t1, 0x1918(t1)             # 80101918
    or      a0, $zero, $zero           # a0 = 00000000
    or      a1, $zero, $zero           # a1 = 00000000
    bne     t1, $zero, lbl_800C585C
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    jal     func_800CACA4
    addiu   a3, $zero, 0x000A          # a3 = 0000000A
    addiu   t2, $zero, 0x007F          # t2 = 0000007F
    lui     $at, 0x8012                # $at = 80120000
    sb      t2, 0x1DFD($at)            # 80121DFD
    lui     $at, 0x8012                # $at = 80120000
    sb      $zero, 0x1DFF($at)         # 80121DFF
lbl_800C585C:
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x1910             # v1 = 80101910
    lbu     v0, 0x0000(v1)             # 80101910
    beq     v0, $zero, lbl_800C5888
    addiu   t3, v0, 0xFFFF             # t3 = FFFFFFFF
    andi    t4, t3, 0x00FF             # t4 = 000000FF
    bne     t4, $zero, lbl_800C5888
    sb      t3, 0x0000(v1)             # 80101910
    lui     a0, 0x8010                 # a0 = 80100000
    jal     func_800C565C
    lbu     a0, 0x190F(a0)             # 8010190F
lbl_800C5888:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C5898:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a2, 0x0028($sp)
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x18DC(t6)             # 801018DC
    lw      t7, 0x0028($sp)
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0020($sp)
    sw      a1, 0x0024($sp)
    addu    t8, t6, t7
    lbu     t9, 0x0000(t8)             # 00000000
    lui     t2, 0x8010                 # t2 = 80100000
    lui     t3, 0x8010                 # t3 = 80100000
    lui     t4, 0x8010                 # t4 = 80100000
    sll     t0, t9,  2
    or      a1, a0, $zero              # a1 = 00000000
    addiu   t1, t0, 0x009C             # t1 = 0000009C
    addiu   t4, t4, 0x43A8             # t4 = 801043A8
    addiu   t3, t3, 0x43A0             # t3 = 801043A0
    addiu   t2, t2, 0x0BC4             # t2 = 80100BC4
    addu    a3, t1, t2
    sw      t3, 0x0010($sp)
    sw      t4, 0x0014($sp)
    lhu     a0, 0x0026($sp)
    jal     func_800C806C
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x18DC             # v1 = 801018DC
    lbu     v0, 0x0000(v1)             # 801018DC
    slti    $at, v0, 0x000F
    beq     $at, $zero, lbl_800C5918
    addiu   t5, v0, 0x0001             # t5 = 00000001
    sb      t5, 0x0000(v1)             # 801018DC
lbl_800C5918:
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C5928:
# MqDbg: 
# Zero u8? 801018DC
    lui     $at, 0x8010                # $at = 80100000
    jr      $ra
    sb      $zero, 0x18DC($at)         # 801018DC


func_800C5934:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a2, 0x0028($sp)
    lb      t6, 0x002B($sp)
    sw      a1, 0x0024($sp)
    lui     t9, 0x8010                 # t9 = 80100000
    lui     t0, 0x8010                 # t0 = 80100000
    lui     t1, 0x8010                 # t1 = 80100000
    sll     t7, t6,  2
    or      a1, a0, $zero              # a1 = 00000000
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0020($sp)
    addiu   t8, t7, 0x009C             # t8 = 0000009C
    addiu   t1, t1, 0x43A8             # t1 = 801043A8
    addiu   t0, t0, 0x43A0             # t0 = 801043A0
    addiu   t9, t9, 0x0BC4             # t9 = 80100BC4
    addu    a3, t8, t9
    sw      t0, 0x0010($sp)
    sw      t1, 0x0014($sp)
    lhu     a0, 0x0026($sp)
    jal     func_800C806C
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C5998:
# MqDbg: 
    addiu   $sp, $sp, 0xFFB0           # $sp -= 0x50
    sw      a1, 0x0054($sp)
    lhu     a3, 0x0056($sp)
    sw      s7, 0x003C($sp)
    sw      s8, 0x0040($sp)
    sra     v0, a3, 12
    sw      s1, 0x0024($sp)
    sw      s0, 0x0020($sp)
    andi    s7, v0, 0x00FF             # s7 = 00000000
    sw      $ra, 0x0044($sp)
    sw      s6, 0x0038($sp)
    sw      s5, 0x0034($sp)
    sw      s4, 0x0030($sp)
    sw      s3, 0x002C($sp)
    sw      s2, 0x0028($sp)
    sw      a0, 0x0050($sp)
    sw      a2, 0x0058($sp)
    or      s1, $zero, $zero           # s1 = 00000000
    andi    s8, v0, 0x00FF             # s8 = 00000000
    blez    s7, lbl_800C5A30
    or      s0, $zero, $zero           # s0 = 00000000
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x438C(t6)             # 8010438C
    lui     t8, 0x8010                 # t8 = 80100000
    addiu   t8, t8, 0x1888             # t8 = 80101888
    sll     t7, t6,  3
    subu    t7, t7, t6
    addu    v1, t7, t8
    or      v0, s8, $zero              # v0 = 00000000
lbl_800C5A0C:
    addu    t9, v1, s0
    lbu     t0, 0x0000(t9)             # 00000000
    addiu   s0, s0, 0x0001             # s0 = 00000001
    andi    s0, s0, 0x00FF             # s0 = 00000001
    slt     $at, s0, v0
    addu    s1, s1, t0
    bne     $at, $zero, lbl_800C5A0C
    andi    s1, s1, 0x00FF             # s1 = 00000000
    or      s0, $zero, $zero           # s0 = 00000000
lbl_800C5A30:
    lui     t1, 0x8010                 # t1 = 80100000
    lbu     t1, 0x438C(t1)             # 8010438C
    lui     t3, 0x8010                 # t3 = 80100000
    addiu   t3, t3, 0x1888             # t3 = 80101888
    sll     t2, t1,  3
    subu    t2, t2, t1
    addu    v1, t2, t3
    addu    t4, v1, s7
    lbu     t5, 0x0000(t4)             # 00000000
    sll     t6, s7,  2
    subu    t6, t6, s7
    blez    t5, lbl_800C5B18
    sll     t6, t6,  3
    lui     t7, 0x8012                 # t7 = 80120000
    addiu   t7, t7, 0x46A8             # t7 = 801246A8
    lui     s3, 0x8010                 # s3 = 80100000
    addiu   s3, s3, 0x4368             # s3 = 80104368
    addu    s6, t6, t7
    lui     s5, 0x0602                 # s5 = 06020000
    addiu   s4, $zero, 0x0030          # s4 = 00000030
    addiu   s2, $zero, 0x00FF          # s2 = 000000FF
lbl_800C5A84:
    sll     t8, s0,  3
    addu    t9, s6, t8
    lbu     v0, 0x0004(t9)             # 00000004
    beql    s2, v0, lbl_800C5AFC
    addu    t1, v1, s8
    multu   v0, s4
    sll     t0, s7,  2
    addu    t1, s3, t0
    lw      t2, 0x0000(t1)             # 80100000
    andi    t6, s1, 0x00FF             # t6 = 00000000
    sll     t7, t6,  8
    or      a0, t7, s5                 # a0 = 861246A8
    ori     a0, a0, 0x0006             # a0 = 861246AE
    lb      a1, 0x005B($sp)
    mflo    t3
    addu    t4, t2, t3
    lhu     t5, 0x0028(t4)             # 00000028
    bnel    a3, t5, lbl_800C5AFC
    addu    t1, v1, s8
    jal     func_800BB0E0
    sw      a3, 0x0048($sp)
    lui     t8, 0x8010                 # t8 = 80100000
    lbu     t8, 0x438C(t8)             # 8010438C
    lui     t0, 0x8010                 # t0 = 80100000
    addiu   t0, t0, 0x1888             # t0 = 80101888
    sll     t9, t8,  3
    subu    t9, t9, t8
    addu    v1, t9, t0
    lw      a3, 0x0048($sp)
    addu    t1, v1, s8
lbl_800C5AFC:
    lbu     t2, 0x0000(t1)             # 00000000
    addiu   s0, s0, 0x0001             # s0 = 00000001
    andi    s0, s0, 0x00FF             # s0 = 00000001
    addiu   s1, s1, 0x0001             # s1 = 00000001
    slt     $at, s0, t2
    bne     $at, $zero, lbl_800C5A84
    andi    s1, s1, 0x00FF             # s1 = 00000001
lbl_800C5B18:
    lui     a3, 0x8010                 # a3 = 80100000
    lui     t3, 0x8010                 # t3 = 80100000
    addiu   a3, a3, 0x43A0             # a3 = 801043A0
    addiu   t3, t3, 0x43A8             # t3 = 801043A8
    sw      t3, 0x0014($sp)
    sw      a3, 0x0010($sp)
    lhu     a0, 0x0056($sp)
    lw      a1, 0x0050($sp)
    jal     func_800C806C
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    lw      $ra, 0x0044($sp)
    lw      s0, 0x0020($sp)
    lw      s1, 0x0024($sp)
    lw      s2, 0x0028($sp)
    lw      s3, 0x002C($sp)
    lw      s4, 0x0030($sp)
    lw      s5, 0x0034($sp)
    lw      s6, 0x0038($sp)
    lw      s7, 0x003C($sp)
    lw      s8, 0x0040($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050           # $sp += 0x50


func_800C5B70:
# MqDbg: 
    addiu   $sp, $sp, 0xFFC0           # $sp -= 0x40
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x195C             # v1 = 8010195C
    lw      v0, 0x0000(v1)             # 8010195C
    mtc1    a1, $f12                   # $f12 = 0.00
    sw      $ra, 0x003C($sp)
    sw      s4, 0x0038($sp)
    sw      s3, 0x0034($sp)
    sw      s2, 0x0030($sp)
    sw      s1, 0x002C($sp)
    sw      s0, 0x0028($sp)
    sdc1    $f22, 0x0020($sp)
    bne     v0, $zero, lbl_800C5BC4
    sdc1    $f20, 0x0018($sp)
    lui     a1, 0x8010                 # a1 = 80100000
    addiu   a1, a1, 0x1960             # a1 = 80101960
    swc1    $f12, 0x0000(a1)           # 80101960
    sw      a0, 0x0000(v1)             # 8010195C
    lwc1    $f0, 0x0000(a1)            # 80101960
    b       lbl_800C5C08
    or      v0, a0, $zero              # v0 = 00000000
lbl_800C5BC4:
    beq     a0, v0, lbl_800C5BF8
    lui     a1, 0x8010                 # a1 = 80100000
    addiu   a1, a1, 0x1960             # a1 = 80101960
    lwc1    $f0, 0x0000(a1)            # 80101960
    c.lt.s  $f12, $f0
    nop
    bc1fl   lbl_800C5C0C
    lui     $at, 0x42C8                # $at = 42C80000
    swc1    $f12, 0x0000(a1)           # 80101960
    sw      a0, 0x0000(v1)             # 8010195C
    lwc1    $f0, 0x0000(a1)            # 80101960
    b       lbl_800C5C08
    or      v0, a0, $zero              # v0 = 00000000
lbl_800C5BF8:
    lui     a1, 0x8010                 # a1 = 80100000
    addiu   a1, a1, 0x1960             # a1 = 80101960
    swc1    $f12, 0x0000(a1)           # 80101960
    lwc1    $f0, 0x0000(a1)            # 80101960
lbl_800C5C08:
    lui     $at, 0x42C8                # $at = 42C80000
lbl_800C5C0C:
    mtc1    $at, $f14                  # $f14 = 100.00
    lwc1    $f2, 0x0000(v0)            # 00000000
    or      v0, $zero, $zero           # v0 = 00000000
    or      s0, $zero, $zero           # s0 = 00000000
    c.lt.s  $f14, $f2
    lui     s3, 0x0300                 # s3 = 03000000
    lui     s2, 0x6002                 # s2 = 60020000
    bc1fl   lbl_800C5C3C
    lui     $at, 0xC2C8                # $at = C2C80000
    b       lbl_800C5C88
    addiu   s4, $zero, 0x007F          # s4 = 0000007F
    lui     $at, 0xC2C8                # $at = C2C80000
lbl_800C5C3C:
    mtc1    $at, $f4                   # $f4 = -100.00
    nop
    c.lt.s  $f2, $f4
    nop
    bc1fl   lbl_800C5C60
    div.s   $f6, $f2, $f14
    b       lbl_800C5C88
    or      s4, $zero, $zero           # s4 = 00000000
    div.s   $f6, $f2, $f14
lbl_800C5C60:
    lui     $at, 0x4280                # $at = 42800000
    mtc1    $at, $f12                  # $f12 = 64.00
    nop
    mul.s   $f8, $f6, $f12
    add.s   $f10, $f8, $f12
    trunc.w.s $f16, $f10
    mfc1    s4, $f16
    nop
    sll     s4, s4, 24
    sra     s4, s4, 24
lbl_800C5C88:
    lui     $at, 0x43C8                # $at = 43C80000
    mtc1    $at, $f18                  # $f18 = 400.00
    nop
    c.lt.s  $f18, $f0
    nop
    bc1f    lbl_800C5CAC
    lui     $at, 0x8011                # $at = 80110000
    b       lbl_800C5D08
    lwc1    $f22, -0x5F08($at)         # 8010A0F8
lbl_800C5CAC:
    lui     $at, 0x42F0                # $at = 42F00000
    mtc1    $at, $f2                   # $f2 = 120.00
    lui     $at, 0x438C                # $at = 438C0000
    c.lt.s  $f0, $f2
    nop
    bc1fl   lbl_800C5CDC
    sub.s   $f4, $f0, $f2
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f22                  # $f22 = 1.00
    b       lbl_800C5D0C
    lui     $at, 0x42FE                # $at = 42FE0000
    sub.s   $f4, $f0, $f2
lbl_800C5CDC:
    mtc1    $at, $f6                   # $f6 = 127.00
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f10                  # $f10 = 1.00
    div.s   $f8, $f4, $f6
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f18, -0x5F04($at)         # 8010A0FC
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f6, -0x5F00($at)          # 8010A100
    sub.s   $f16, $f10, $f8
    mul.s   $f4, $f16, $f18
    add.s   $f22, $f4, $f6
lbl_800C5D08:
    lui     $at, 0x42FE                # $at = 42FE0000
lbl_800C5D0C:
    mtc1    $at, $f20                  # $f20 = 127.00
    addiu   s1, $zero, 0x0009          # s1 = 00000009
lbl_800C5D14:
    beql    s1, v0, lbl_800C5DD4
    addiu   s0, s0, 0x0001             # s0 = 00000001
    mul.s   $f10, $f20, $f22
    addiu   t0, $zero, 0x0001          # t0 = 00000001
    sll     t7, v0,  8
    or      t8, t7, s2                 # t8 = 60020000
    lui     $at, 0x4F00                # $at = 4F000000
    cfc1    t9, $f31
    ctc1    t0, $f31
    nop
    cvt.w.s $f8, $f10
    cfc1    t0, $f31
    nop
    andi    t0, t0, 0x0078             # t0 = 00000000
    beql    t0, $zero, lbl_800C5D9C
    mfc1    t0, $f8
    mtc1    $at, $f8                   # $f8 = 2147484000.00
    addiu   t0, $zero, 0x0001          # t0 = 00000001
    sub.s   $f8, $f10, $f8
    ctc1    t0, $f31
    nop
    cvt.w.s $f8, $f8
    cfc1    t0, $f31
    nop
    andi    t0, t0, 0x0078             # t0 = 00000000
    bne     t0, $zero, lbl_800C5D90
    nop
    mfc1    t0, $f8
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800C5DA8
    or      t0, t0, $at                # t0 = 80000000
lbl_800C5D90:
    b       lbl_800C5DA8
    addiu   t0, $zero, 0xFFFF          # t0 = FFFFFFFF
    mfc1    t0, $f8
lbl_800C5D9C:
    nop
    bltz    t0, lbl_800C5D90
    nop
lbl_800C5DA8:
    ctc1    t9, $f31
    andi    t1, t0, 0x00FF             # t1 = 000000FF
    jal     func_800CAA70
    or      a0, t8, t1                 # a0 = 600200FF
    andi    t2, s0, 0x00FF             # t2 = 00000001
    sll     t3, t2,  8
    sll     a1, s4, 24
    sra     a1, a1, 24
    jal     func_800BB0E0
    or      a0, t3, s3                 # a0 = 03000000
    addiu   s0, s0, 0x0001             # s0 = 00000002
lbl_800C5DD4:
    andi    s0, s0, 0x00FF             # s0 = 00000002
    slti    $at, s0, 0x0010
    bne     $at, $zero, lbl_800C5D14
    or      v0, s0, $zero              # v0 = 00000002
    lw      $ra, 0x003C($sp)
    ldc1    $f20, 0x0018($sp)
    ldc1    $f22, 0x0020($sp)
    lw      s0, 0x0028($sp)
    lw      s1, 0x002C($sp)
    lw      s2, 0x0030($sp)
    lw      s3, 0x0034($sp)
    lw      s4, 0x0038($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0040           # $sp += 0x40


func_800C5E0C:
# MqDbg: 
    lui     v0, 0x8010                 # v0 = 80100000
    addiu   v0, v0, 0x195C             # v0 = 8010195C
    lw      t6, 0x0000(v0)             # 8010195C
    beq     t6, $zero, lbl_800C5E24
    nop
    sw      $zero, 0x0000(v0)          # 8010195C
lbl_800C5E24:
    jr      $ra
    nop


func_800C5E2C:
# MqDbg: 
    lui     v0, 0x8010                 # v0 = 80100000
    addiu   v0, v0, 0x195C             # v0 = 8010195C
    lw      t6, 0x0000(v0)             # 8010195C
    bne     a0, t6, lbl_800C5E44
    nop
    sw      $zero, 0x0000(v0)          # 8010195C
lbl_800C5E44:
    jr      $ra
    nop


func_800C5E4C:
# MqDbg: 
# Sound-related function
    addiu   $sp, $sp, 0xFFB8           # $sp -= 0x48
    lui     t6, 0x8010                 # t6 = 80100000
    lhu     t6, 0x2F88(t6)             # 80102F88
    sw      s1, 0x001C($sp)
    sll     s1, a0, 24
    sw      $ra, 0x002C($sp)
    sw      a0, 0x0048($sp)
    sra     s1, s1, 24
    sw      s4, 0x0028($sp)
    sw      s3, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s0, 0x0018($sp)
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    jal     func_800CAB18
    sh      t6, 0x0040($sp)
    ori     $at, $zero, 0xFFFF         # $at = 0000FFFF
    bnel    v0, $at, lbl_800C5FC4
    lw      $ra, 0x002C($sp)
    jal     func_800CAB18
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    addiu   $at, $zero, 0x002F         # $at = 0000002F
    beq     v0, $at, lbl_800C5FC0
    or      s0, $zero, $zero           # s0 = 00000000
    or      v0, $zero, $zero           # v0 = 00000000
    addiu   s4, $zero, 0x007F          # s4 = 0000007F
    addiu   s3, $zero, 0x000A          # s3 = 0000000A
    lui     s2, 0xA000                 # s2 = A0000000
lbl_800C5EB8:
    bne     v0, $zero, lbl_800C5EC8
    or      a1, $zero, $zero           # a1 = 00000000
    b       lbl_800C5ED0
    andi    v1, s1, 0x00FF             # v1 = 00000000
lbl_800C5EC8:
    subu    v1, s4, s1
    andi    v1, v1, 0x00FF             # v1 = 00000000
lbl_800C5ED0:
    slti    $at, v1, 0x0065
    bne     $at, $zero, lbl_800C5EE4
    or      v0, v1, $zero              # v0 = 00000000
    b       lbl_800C5F2C
    addiu   a2, $zero, 0x000B          # a2 = 0000000B
lbl_800C5EE4:
    slti    $at, v0, 0x0014
    beq     $at, $zero, lbl_800C5EF8
    addiu   t7, v0, 0xFFEC             # t7 = FFFFFFEC
    b       lbl_800C5F2C
    addiu   a2, $zero, 0x0002          # a2 = 00000002
lbl_800C5EF8:
    div     $zero, t7, s3
    mflo    a2
    addiu   a2, a2, 0x0002             # a2 = 00000004
    andi    a2, a2, 0x00FF             # a2 = 00000004
    bne     s3, $zero, lbl_800C5F14
    nop
    break   # 0x01C00
lbl_800C5F14:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     s3, $at, lbl_800C5F2C
    lui     $at, 0x8000                # $at = 80000000
    bne     t7, $at, lbl_800C5F2C
    nop
    break   # 0x01800
lbl_800C5F2C:
    addu    a3, $sp, s0
    lbu     a3, 0x0040(a3)             # 00000040
    lui     t9, 0x8012                 # t9 = 80120000
    addiu   t9, t9, 0x5630             # t9 = 80125630
    sll     t8, a3,  2
    subu    t8, t8, a3
    sll     t8, t8,  2
    subu    t8, t8, a3
    sll     t8, t8,  5
    addu    v1, t8, t9
    or      v0, $zero, $zero           # v0 = 00000000
    or      a0, a2, $zero              # a0 = 00000004
    sll     t0, v0,  2
lbl_800C5F60:
    addu    t1, v1, t0
    lw      t2, 0x3568(t1)             # 00003568
    addiu   t4, $zero, 0x0001          # t4 = 00000001
    sllv    t5, t4, v0
    lbu     t3, 0x0005(t2)             # 00000005
    slt     $at, t3, a0
    beql    $at, $zero, lbl_800C5F8C
    addiu   v0, v0, 0x0001             # v0 = 00000001
    addu    a1, a1, t5
    andi    a1, a1, 0xFFFF             # a1 = 00000000
    addiu   v0, v0, 0x0001             # v0 = 00000002
lbl_800C5F8C:
    andi    v0, v0, 0x00FF             # v0 = 00000002
    slti    $at, v0, 0x0010
    bnel    $at, $zero, lbl_800C5F60
    sll     t0, v0,  2
    sll     t6, a3, 24
    or      t7, t6, s2                 # t7 = A0000000
    jal     func_800CAA70
    or      a0, t7, a1                 # a0 = A0000000
    addiu   s0, s0, 0x0001             # s0 = 00000001
    andi    s0, s0, 0x00FF             # s0 = 00000001
    slti    $at, s0, 0x0002
    bne     $at, $zero, lbl_800C5EB8
    or      v0, s0, $zero              # v0 = 00000001
lbl_800C5FC0:
    lw      $ra, 0x002C($sp)
lbl_800C5FC4:
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    lw      s3, 0x0024($sp)
    lw      s4, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0048           # $sp += 0x48


func_800C5FE0:
# MqDbg: 
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x1F0A             # v1 = 80121F0A
    lbu     v0, 0x0000(v1)             # 80121F0A
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      $ra, 0x001C($sp)
    sw      a1, 0x003C($sp)
    beq     v0, $zero, lbl_800C600C
    sw      a2, 0x0040($sp)
    addiu   t6, v0, 0xFFFF             # t6 = FFFFFFFF
    b       lbl_800C6248
    sb      t6, 0x0000(v1)             # 80121F0A
lbl_800C600C:
    lwc1    $f0, 0x0008(a0)            # 00000008
    lwc1    $f2, 0x0000(a0)            # 00000000
    sw      a0, 0x0038($sp)
    mul.s   $f4, $f0, $f0
    nop
    mul.s   $f6, $f2, $f2
    jal     func_800D0DC0
    add.s   $f12, $f4, $f6
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x195C             # v1 = 8010195C
    lw      v0, 0x0000(v1)             # 8010195C
    mov.s   $f14, $f0
    bnel    v0, $zero, lbl_800C6078
    lwc1    $f0, 0x0008(v0)            # 00000008
    lw      t7, 0x0038($sp)
    addiu   t8, $zero, 0x0002          # t8 = 00000002
    sw      t8, 0x0010($sp)
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    lhu     a1, 0x003E($sp)
    or      a2, $zero, $zero           # a2 = 00000000
    addiu   a3, $zero, 0x0007          # a3 = 00000007
    swc1    $f14, 0x0030($sp)
    jal     func_800C6B54
    sw      t7, 0x0000(v1)             # 8010195C
    b       lbl_800C60BC
    lwc1    $f14, 0x0030($sp)
    lwc1    $f0, 0x0008(v0)            # 00000008
lbl_800C6078:
    lwc1    $f2, 0x0000(v0)            # 00000000
    swc1    $f14, 0x0030($sp)
    mul.s   $f8, $f0, $f0
    nop
    mul.s   $f10, $f2, $f2
    jal     func_800D0DC0
    add.s   $f12, $f8, $f10
    lwc1    $f14, 0x0030($sp)
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x195C             # v1 = 8010195C
    c.lt.s  $f14, $f0
    lw      t9, 0x0038($sp)
    bc1fl   lbl_800C60BC
    mov.s   $f14, $f0
    b       lbl_800C60BC
    sw      t9, 0x0000(v1)             # 8010195C
    mov.s   $f14, $f0
lbl_800C60BC:
    lw      t0, 0x0038($sp)
    mtc1    $zero, $f16                # $f16 = 0.00
    lhu     t1, 0x0042($sp)
    lwc1    $f0, 0x0004(t0)            # 00000004
    lhu     t3, 0x003E($sp)
    mtc1    t1, $f18                   # $f18 = 0.00
    c.lt.s  $f0, $f16
    nop
    bc1fl   lbl_800C60F0
    mov.s   $f2, $f0
    b       lbl_800C60F0
    neg.s   $f2, $f0
    mov.s   $f2, $f0
lbl_800C60F0:
    bgez    t1, lbl_800C6108
    cvt.s.w $f0, $f18
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f0, $f0, $f4
lbl_800C6108:
    lui     $at, 0x4170                # $at = 41700000
    mtc1    $at, $f6                   # $f6 = 15.00
    nop
    div.s   $f8, $f0, $f6
    c.lt.s  $f8, $f2
    nop
    bc1fl   lbl_800C6134
    c.lt.s  $f14, $f0
    b       lbl_800C61F8
    or      a2, $zero, $zero           # a2 = 00000000
    c.lt.s  $f14, $f0
lbl_800C6134:
    or      a2, $zero, $zero           # a2 = 00000000
    bc1f    lbl_800C61F8
    nop
    div.s   $f16, $f14, $f0
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f10                  # $f10 = 1.00
    lui     $at, 0x42FE                # $at = 42FE0000
    mtc1    $at, $f4                   # $f4 = 127.00
    addiu   a2, $zero, 0x0001          # a2 = 00000001
    lui     $at, 0x4F00                # $at = 4F000000
    sub.s   $f18, $f10, $f16
    mul.s   $f6, $f18, $f4
    cfc1    t2, $f31
    ctc1    a2, $f31
    nop
    cvt.w.s $f8, $f6
    cfc1    a2, $f31
    nop
    andi    a2, a2, 0x0078             # a2 = 00000000
    beql    a2, $zero, lbl_800C61E0
    mfc1    a2, $f8
    mtc1    $at, $f8                   # $f8 = 2147484000.00
    addiu   a2, $zero, 0x0001          # a2 = 00000001
    sub.s   $f8, $f6, $f8
    ctc1    a2, $f31
    nop
    cvt.w.s $f8, $f8
    cfc1    a2, $f31
    nop
    andi    a2, a2, 0x0078             # a2 = 00000000
    bnel    a2, $zero, lbl_800C61D0
    addiu   a2, $zero, 0xFFFF          # a2 = FFFFFFFF
    mfc1    a2, $f8
    lui     $at, 0x8000                # $at = 80000000
    ctc1    t2, $f31
    or      a2, a2, $at                # a2 = FFFFFFFF
    b       lbl_800C61F8
    andi    a2, a2, 0x00FF             # a2 = 000000FF
    addiu   a2, $zero, 0xFFFF          # a2 = FFFFFFFF
lbl_800C61D0:
    ctc1    t2, $f31
    b       lbl_800C61F8
    andi    a2, a2, 0x00FF             # a2 = 000000FF
    mfc1    a2, $f8
lbl_800C61E0:
    nop
    bltzl   a2, lbl_800C61D0
    addiu   a2, $zero, 0xFFFF          # a2 = FFFFFFFF
    ctc1    t2, $f31
    b       lbl_800C61F8
    andi    a2, a2, 0x00FF             # a2 = 000000FF
lbl_800C61F8:
    addiu   $at, $zero, 0x0028         # $at = 00000028
    beq     t3, $at, lbl_800C6214
    sll     a0, a2, 24
    sra     a0, a0, 24
    jal     func_800C5E4C
    sb      a2, 0x002F($sp)
    lbu     a2, 0x002F($sp)
lbl_800C6214:
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    addiu   a1, $zero, 0x0003          # a1 = 00000003
    or      a3, $zero, $zero           # a3 = 00000000
    jal     func_800CACA4
    sw      a2, 0x0024($sp)
    lw      t4, 0x0024($sp)
    addiu   t5, $zero, 0x007F          # t5 = 0000007F
    or      a0, $zero, $zero           # a0 = 00000000
    subu    a2, t5, t4
    andi    a2, a2, 0x00FF             # a2 = 00000000
    addiu   a1, $zero, 0x0003          # a1 = 00000003
    jal     func_800CACA4
    or      a3, $zero, $zero           # a3 = 00000000
lbl_800C6248:
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0038           # $sp += 0x38
    jr      $ra
    nop


func_800C6258:
# MqDbg: 
# Zero u32? 8010195C
    lui     $at, 0x8010                # $at = 80100000
    jr      $ra
    sw      $zero, 0x195C($at)         # 8010195C


func_800C6264:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0020($sp)
    jal     func_800C62A4
    lhu     a0, 0x0022($sp)
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    sw      t6, 0x0010($sp)
    or      a0, $zero, $zero           # a0 = 00000000
    lhu     a1, 0x0022($sp)
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_800C6B54
    or      a3, $zero, $zero           # a3 = 00000000
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C62A4:
# MqDbg: 
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0028($sp)
    sb      $zero, 0x0027($sp)
    jal     func_800CAB18
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   $at, $zero, 0x004C         # $at = 0000004C
    beql    v0, $at, lbl_800C63F0
    lw      $ra, 0x001C($sp)
    jal     func_800CAB18
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    addiu   $at, $zero, 0x002F         # $at = 0000002F
    bne     v0, $at, lbl_800C62F0
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    jal     func_800C9F24
    or      a1, $zero, $zero           # a1 = 00000000
    lui     a0, 0xF800                 # a0 = F8000000
    jal     func_800BB0BC
    or      a1, $zero, $zero           # a1 = 00000000
lbl_800C62F0:
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x1940(t6)             # 80101940
    lui     t0, 0x8010                 # t0 = 80100000
    addiu   t0, t0, 0x1964             # t0 = 80101964
    addu    t7, t0, t6
    lbu     t8, 0x0000(t7)             # 00000000
    lhu     a1, 0x002A($sp)
    or      a0, $zero, $zero           # a0 = 00000000
    andi    t9, t8, 0x0020             # t9 = 00000000
    beq     t9, $zero, lbl_800C6378
    andi    v1, a1, 0x00FF             # v1 = 00000000
    andi    t1, v1, 0x00FF             # t1 = 00000000
    addu    t2, t0, t1
    lbu     t3, 0x0000(t2)             # 00000000
    lui     v0, 0x8010                 # v0 = 80100000
    addiu   a3, $zero, 0x0007          # a3 = 00000007
    andi    t4, t3, 0x0010             # t4 = 00000000
    beql    t4, $zero, lbl_800C637C
    lhu     a1, 0x002A($sp)
    lbu     v0, 0x193C(v0)             # 8010193C
    addiu   t6, $zero, 0x001E          # t6 = 0000001E
    or      a0, $zero, $zero           # a0 = 00000000
    andi    t5, v0, 0x003F             # t5 = 00000000
    beql    t5, $zero, lbl_800C635C
    lbu     a2, 0x0027($sp)
    sb      t6, 0x0027($sp)
    lbu     a2, 0x0027($sp)
lbl_800C635C:
    sw      v0, 0x0010($sp)
    jal     func_800C6B54
    sw      v1, 0x0020($sp)
    lui     $at, 0x8010                # $at = 80100000
    lw      v1, 0x0020($sp)
    b       lbl_800C63E4
    sb      $zero, 0x193C($at)         # 8010193C
lbl_800C6378:
    lhu     a1, 0x002A($sp)
lbl_800C637C:
    addiu   v0, $zero, 0x00FF          # v0 = 000000FF
    or      a2, $zero, $zero           # a2 = 00000000
    andi    v1, a1, 0x00FF             # v1 = 00000000
    andi    t7, v1, 0x00FF             # t7 = 00000000
    addu    t8, t0, t7
    lbu     t9, 0x0000(t8)             # 00000000
    addiu   a3, $zero, 0x0007          # a3 = 00000007
    andi    t1, t9, 0x0040             # t1 = 00000000
    beq     t1, $zero, lbl_800C63AC
    nop
    b       lbl_800C63AC
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800C63AC:
    sw      v0, 0x0010($sp)
    jal     func_800C6B54
    sw      v1, 0x0020($sp)
    lhu     t2, 0x002A($sp)
    lui     t0, 0x8010                 # t0 = 80100000
    addiu   t0, t0, 0x1964             # t0 = 80101964
    addu    t3, t0, t2
    lbu     t4, 0x0000(t3)             # 00000000
    lw      v1, 0x0020($sp)
    addiu   t6, $zero, 0x00C0          # t6 = 000000C0
    andi    t5, t4, 0x0020             # t5 = 00000000
    bne     t5, $zero, lbl_800C63E4
    lui     $at, 0x8010                # $at = 80100000
    sb      t6, 0x193C($at)            # 8010193C
lbl_800C63E4:
    lui     $at, 0x8010                # $at = 80100000
    sb      v1, 0x1940($at)            # 80101940
    lw      $ra, 0x001C($sp)
lbl_800C63F0:
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800C63FC:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800CAB18
    or      a0, $zero, $zero           # a0 = 00000000
    ori     $at, $zero, 0xFFFF         # $at = 0000FFFF
    beq     v0, $at, lbl_800C645C
    andi    t7, v0, 0x00FF             # t7 = 00000000
    lui     t8, 0x8010                 # t8 = 80100000
    addu    t8, t8, t7
    lbu     t8, 0x1964(t8)             # 80101964
    lui     v0, 0x8010                 # v0 = 80100000
    addiu   v0, v0, 0x193C             # v0 = 8010193C
    andi    t9, t8, 0x0010             # t9 = 00000000
    beql    t9, $zero, lbl_800C6460
    lw      $ra, 0x0014($sp)
    lbu     t0, 0x0000(v0)             # 8010193C
    addiu   $at, $zero, 0x00C0         # $at = 000000C0
    lui     t1, 0x8013                 # t1 = 80130000
    beql    t0, $at, lbl_800C645C
    sb      $zero, 0x0000(v0)          # 8010193C
    lb      t1, -0x7345(t1)            # 80128CBB
    b       lbl_800C645C
    sb      t1, 0x0000(v0)             # 8010193C
    sb      $zero, 0x0000(v0)          # 8010193C
lbl_800C645C:
    lw      $ra, 0x0014($sp)
lbl_800C6460:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C646C:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800CAB18
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   $at, $zero, 0x004C         # $at = 0000004C
    beql    v0, $at, lbl_800C6494
    lw      $ra, 0x0014($sp)
    jal     func_800CAA70
    addiu   a0, $zero, 0x004C          # a0 = 0000004C
    lw      $ra, 0x0014($sp)
lbl_800C6494:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C64A0:
# MqDbg: 
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f4                   # $f4 = 1.00
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      a1, 0x002C($sp)
    c.eq.s  $f12, $f4
    andi    a2, a1, 0x00FF             # a2 = 00000000
    sw      $ra, 0x0014($sp)
    or      a1, a2, $zero              # a1 = 00000000
    bc1f    lbl_800C6598
    lui     $at, 0x42C8                # $at = 42C80000
    lui     $at, 0xB000                # $at = B0000000
    ori     $at, $at, 0x4000           # $at = B0004000
    sll     a0, a2, 16
    or      a0, a0, $at                # a0 = B0004000
    sw      a2, 0x0024($sp)
    jal     func_800CAA70
    swc1    $f12, 0x0028($sp)
    lui     $at, 0x42C8                # $at = 42C80000
    mtc1    $at, $f6                   # $f6 = 100.00
    lwc1    $f12, 0x0028($sp)
    addiu   v1, $zero, 0x0001          # v1 = 00000001
    lw      a1, 0x0024($sp)
    mul.s   $f8, $f12, $f6
    lui     $at, 0x4F00                # $at = 4F000000
    sll     v0, a1,  8
    cfc1    t6, $f31
    ctc1    v1, $f31
    nop
    cvt.w.s $f10, $f8
    cfc1    v1, $f31
    nop
    andi    v1, v1, 0x0078             # v1 = 00000000
    beql    v1, $zero, lbl_800C6580
    mfc1    v1, $f10
    mtc1    $at, $f10                  # $f10 = 2147484000.00
    addiu   v1, $zero, 0x0001          # v1 = 00000001
    sub.s   $f10, $f8, $f10
    ctc1    v1, $f31
    nop
    cvt.w.s $f10, $f10
    cfc1    v1, $f31
    nop
    andi    v1, v1, 0x0078             # v1 = 00000000
    bnel    v1, $zero, lbl_800C6570
    addiu   v1, $zero, 0xFFFF          # v1 = FFFFFFFF
    mfc1    v1, $f10
    lui     $at, 0x8000                # $at = 80000000
    ctc1    t6, $f31
    or      v1, v1, $at                # v1 = FFFFFFFF
    b       lbl_800C664C
    andi    v1, v1, 0x00FF             # v1 = 000000FF
    addiu   v1, $zero, 0xFFFF          # v1 = FFFFFFFF
lbl_800C6570:
    ctc1    t6, $f31
    b       lbl_800C664C
    andi    v1, v1, 0x00FF             # v1 = 000000FF
    mfc1    v1, $f10
lbl_800C6580:
    nop
    bltzl   v1, lbl_800C6570
    addiu   v1, $zero, 0xFFFF          # v1 = FFFFFFFF
    ctc1    t6, $f31
    b       lbl_800C664C
    andi    v1, v1, 0x00FF             # v1 = 000000FF
lbl_800C6598:
    mtc1    $at, $f16                  # $f16 = 0.00
    addiu   v1, $zero, 0x0001          # v1 = 00000001
    lui     $at, 0x4F00                # $at = 4F000000
    mul.s   $f18, $f12, $f16
    sll     v0, a2,  8
    cfc1    t7, $f31
    ctc1    v1, $f31
    nop
    cvt.w.s $f4, $f18
    cfc1    v1, $f31
    nop
    andi    v1, v1, 0x0078             # v1 = 00000000
    beql    v1, $zero, lbl_800C6618
    mfc1    v1, $f4
    mtc1    $at, $f4                   # $f4 = 2147484000.00
    addiu   v1, $zero, 0x0001          # v1 = 00000001
    sub.s   $f4, $f18, $f4
    ctc1    v1, $f31
    nop
    cvt.w.s $f4, $f4
    cfc1    v1, $f31
    nop
    andi    v1, v1, 0x0078             # v1 = 00000000
    bne     v1, $zero, lbl_800C660C
    nop
    mfc1    v1, $f4
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800C6624
    or      v1, v1, $at                # v1 = 80000000
lbl_800C660C:
    b       lbl_800C6624
    addiu   v1, $zero, 0xFFFF          # v1 = FFFFFFFF
    mfc1    v1, $f4
lbl_800C6618:
    nop
    bltz    v1, lbl_800C660C
    nop
lbl_800C6624:
    lui     $at, 0xC130                # $at = C1300000
    or      t8, v0, $at                # t8 = C1300000
    ctc1    t7, $f31
    andi    v1, v1, 0x00FF             # v1 = 000000FF
    or      a0, t8, v1                 # a0 = C13000FF
    sw      v1, 0x001C($sp)
    jal     func_800CAA70
    sw      v0, 0x0020($sp)
    lw      v0, 0x0020($sp)
    lw      v1, 0x001C($sp)
lbl_800C664C:
    lui     $at, 0xC1A0                # $at = C1A00000
    or      t9, v0, $at                # t9 = C1A00000
    jal     func_800CAA70
    or      a0, t9, v1                 # a0 = C1A00000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800C666C:
# MqDbg: 
# Speed up playback of minigame music sequence
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800CAB18
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   $at, $zero, 0x006C         # $at = 0000006C
    bne     v0, $at, lbl_800C66A0
    or      a0, $zero, $zero           # a0 = 00000000
    jal     func_800CAB80
    lui     a1, 0xF000                 # a1 = F0000000
    beq     v0, $zero, lbl_800C66A0
    lui     a0, 0xB005                 # a0 = B0050000
    jal     func_800CAA70
    ori     a0, a0, 0x00D2             # a0 = B00500D2
lbl_800C66A0:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C66B0:
# MqDbg: 
# Cutscenes, Play New Background Sequence
# A0 = Music Sequence ID
    andi    a1, a0, 0xFFFF             # a1 = 00000000
    andi    t7, a1, 0x00FF             # t7 = 00000000
    lui     v1, 0x8010                 # v1 = 80100000
    addu    v1, v1, t7
    lbu     v1, 0x1964(v1)             # 80101964
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x001C($sp)
    andi    t8, v1, 0x0002             # t8 = 00000000
    sw      a0, 0x0020($sp)
    beq     t8, $zero, lbl_800C66EC
    or      v0, a1, $zero              # v0 = 00000000
    jal     func_800C69A0
    andi    a0, a1, 0xFFFF             # a0 = 00000000
    b       lbl_800C6730
    lw      $ra, 0x001C($sp)
lbl_800C66EC:
    andi    t9, v1, 0x0004             # t9 = 00000000
    beq     t9, $zero, lbl_800C670C
    or      a0, $zero, $zero           # a0 = 00000000
    lui     $at, 0x0100                # $at = 01000000
    jal     func_800CAA70
    or      a0, v0, $at                # a0 = 01000000
    b       lbl_800C6730
    lw      $ra, 0x001C($sp)
lbl_800C670C:
    addiu   t0, $zero, 0xFFFF          # t0 = FFFFFFFF
    sw      t0, 0x0010($sp)
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_800C6B54
    addiu   a3, $zero, 0x0007          # a3 = 00000007
    lui     a0, 0x1100                 # a0 = 11000000
    jal     func_800CAA70
    ori     a0, a0, 0x00FF             # a0 = 110000FF
    lw      $ra, 0x001C($sp)
lbl_800C6730:
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C673C:
# MqDbg: 
    andi    t7, a0, 0x00FF             # t7 = 00000000
    lui     v0, 0x8010                 # v0 = 80100000
    addu    v0, v0, t7
    lbu     v0, 0x1964(v0)             # 80101964
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    andi    t8, v0, 0x0002             # t8 = 00000000
    beq     t8, $zero, lbl_800C6774
    sw      a0, 0x0018($sp)
    lui     a0, 0x1100                 # a0 = 11000000
    jal     func_800CAA70
    ori     a0, a0, 0x00FF             # a0 = 110000FF
    b       lbl_800C67A0
    lw      $ra, 0x0014($sp)
lbl_800C6774:
    andi    t9, v0, 0x0004             # t9 = 00000000
    beq     t9, $zero, lbl_800C6794
    lui     a0, 0x1000                 # a0 = 10000000
    lui     a0, 0x1100                 # a0 = 11000000
    jal     func_800CAA70
    ori     a0, a0, 0x00FF             # a0 = 110000FF
    b       lbl_800C67A0
    lw      $ra, 0x0014($sp)
lbl_800C6794:
    jal     func_800CAA70
    ori     a0, a0, 0x00FF             # a0 = 000000FF
    lw      $ra, 0x0014($sp)
lbl_800C67A0:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C67AC:
# MqDbg: 
    andi    v1, a0, 0x00FF             # v1 = 00000000
    andi    t6, v1, 0x00FF             # t6 = 00000000
    lui     v0, 0x8010                 # v0 = 80100000
    addu    v0, v0, t6
    lbu     v0, 0x1964(v0)             # 80101964
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    andi    t7, v0, 0x0002             # t7 = 00000000
    sw      a0, 0x0020($sp)
    beq     t7, $zero, lbl_800C67E0
    or      a1, $zero, $zero           # a1 = 00000000
    b       lbl_800C67F0
    addiu   a1, $zero, 0x0001          # a1 = 00000001
lbl_800C67E0:
    andi    t8, v0, 0x0004             # t8 = 00000000
    beql    t8, $zero, lbl_800C67F4
    andi    a0, a1, 0x00FF             # a0 = 00000001
    addiu   a1, $zero, 0x0001          # a1 = 00000001
lbl_800C67F0:
    andi    a0, a1, 0x00FF             # a0 = 00000001
lbl_800C67F4:
    jal     func_800CAB18
    sw      v1, 0x0018($sp)
    lw      v1, 0x0018($sp)
    andi    t9, v0, 0x00FF             # t9 = 00000000
    or      v0, $zero, $zero           # v0 = 00000000
    bne     v1, t9, lbl_800C6818
    lw      $ra, 0x0014($sp)
    b       lbl_800C6818
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800C6818:
    jr      $ra
    addiu   $sp, $sp, 0x0020           # $sp += 0x20


func_800C6820:
# MqDbg: 
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0028($sp)
    jal     func_800CAB18
    or      a0, $zero, $zero           # a0 = 00000000
    andi    a0, v0, 0x00FF             # a0 = 00000000
    addiu   $at, $zero, 0x002E         # $at = 0000002E
    beq     a0, $at, lbl_800C6884
    andi    a2, v0, 0xFFFF             # a2 = 00000000
    addiu   $at, $zero, 0x0062         # $at = 00000062
    beq     a0, $at, lbl_800C6884
    lhu     a1, 0x002A($sp)
    beq     a1, v0, lbl_800C6884
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    sw      a1, 0x001C($sp)
    jal     func_800C6BCC
    sh      a2, 0x0026($sp)
    lhu     a2, 0x0026($sp)
    ori     $at, $zero, 0xFFFF         # $at = 0000FFFF
    lw      a1, 0x001C($sp)
    beq     a2, $at, lbl_800C687C
    lui     $at, 0x8010                # $at = 80100000
    sh      a2, 0x1938($at)            # 80101938
lbl_800C687C:
    jal     func_800CAA70
    or      a0, a1, $zero              # a0 = 00000000
lbl_800C6884:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800C6894:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800CAB18
    or      a0, $zero, $zero           # a0 = 00000000
    ori     v1, $zero, 0xFFFF          # v1 = 0000FFFF
    beq     v1, v0, lbl_800C691C
    lui     t6, 0x8010                 # t6 = 80100000
    lhu     t6, 0x1938(t6)             # 80101938
    beql    v1, t6, lbl_800C6920
    lw      $ra, 0x0014($sp)
    jal     func_800CAB18
    or      a0, $zero, $zero           # a0 = 00000000
    andi    t7, v0, 0x00FF             # t7 = 00000000
    lui     t8, 0x8010                 # t8 = 80100000
    addu    t8, t8, t7
    lbu     t8, 0x1964(t8)             # 80101964
    ori     v1, $zero, 0xFFFF          # v1 = 0000FFFF
    lui     v0, 0x8010                 # v0 = 80100000
    andi    t9, t8, 0x0008             # t9 = 00000000
    beql    t9, $zero, lbl_800C6920
    lw      $ra, 0x0014($sp)
    lhu     v0, 0x1938(v0)             # 80101938
    lui     a0, 0x1000                 # a0 = 10000000
    bne     v1, v0, lbl_800C6908
    nop
    jal     func_800CAA70
    ori     a0, a0, 0x00FF             # a0 = 100000FF
    b       lbl_800C6914
    ori     t0, $zero, 0xFFFF          # t0 = 0000FFFF
lbl_800C6908:
    jal     func_800CAA70
    or      a0, v0, $zero              # a0 = 00000000
    ori     t0, $zero, 0xFFFF          # t0 = 0000FFFF
lbl_800C6914:
    lui     $at, 0x8010                # $at = 80100000
    sh      t0, 0x1938($at)            # 80101938
lbl_800C691C:
    lw      $ra, 0x0014($sp)
lbl_800C6920:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C692C:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0018($sp)
    jal     func_800CAB18
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     v0, $at, lbl_800C6950
    lui     $at, 0x8010                # $at = 80100000
    sh      v0, 0x1938($at)            # 80101938
lbl_800C6950:
    jal     func_800C7C90
    lbu     a0, 0x001B($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C6968:
# MqDbg: 
    lui     v0, 0x8010                 # v0 = 80100000
    lhu     v0, 0x1938(v0)             # 80101938
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    ori     $at, $zero, 0xFFFF         # $at = 0000FFFF
    beq     v0, $at, lbl_800C6988
    sw      $ra, 0x0014($sp)
    jal     func_800CAA70
    or      a0, v0, $zero              # a0 = 80100000
lbl_800C6988:
    lw      $ra, 0x0014($sp)
    ori     t6, $zero, 0xFFFF          # t6 = 0000FFFF
    lui     $at, 0x8010                # $at = 80100000
    sh      t6, 0x1938($at)            # 80101938
    jr      $ra
    addiu   $sp, $sp, 0x0018           # $sp += 0x18


func_800C69A0:
# MqDbg: 
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0028($sp)
    jal     func_800CAB18
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    sh      v0, 0x0026($sp)
    andi    a0, v0, 0x00FF             # a0 = 00000000
    jal     func_800BB444
    addiu   a1, $sp, 0x0020            # a1 = FFFFFFF8
    lhu     a0, 0x002A($sp)
    sw      v0, 0x001C($sp)
    addiu   a1, $sp, 0x0020            # a1 = FFFFFFF8
    jal     func_800BB444
    andi    a0, a0, 0x00FF             # a0 = 00000000
    lhu     t6, 0x0026($sp)
    ori     $at, $zero, 0xFFFF         # $at = 0000FFFF
    lw      t7, 0x001C($sp)
    beq     t6, $at, lbl_800C6A04
    addiu   t0, $zero, 0x0001          # t0 = 00000001
    lbu     t8, 0x0000(t7)             # 00000000
    lbu     t9, 0x0000(v0)             # 00000000
    addiu   t1, $zero, 0x0005          # t1 = 00000005
    lui     $at, 0x8012                # $at = 80120000
    bne     t8, t9, lbl_800C6A10
    lui     a0, 0x1100                 # a0 = 11000000
lbl_800C6A04:
    lui     $at, 0x8012                # $at = 80120000
    b       lbl_800C6A1C
    sb      t0, 0x1F0B($at)            # 80121F0B
lbl_800C6A10:
    sb      t1, 0x1F0B($at)            # 80121F0B
    jal     func_800CAA70
    ori     a0, a0, 0x00FF             # a0 = 110000FF
lbl_800C6A1C:
    lw      $ra, 0x0014($sp)
    lhu     t2, 0x002A($sp)
    lui     $at, 0x8012                # $at = 80120000
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    sh      t2, 0x1F0C($at)            # 80121F0C


func_800C6A34:
# MqDbg: 
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x1F0B             # v1 = 80121F0B
    lbu     v0, 0x0000(v1)             # 80121F0B
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x0014($sp)
    beq     v0, $zero, lbl_800C6B44
    addiu   t6, v0, 0xFFFF             # t6 = FFFFFFFF
    andi    t7, t6, 0x00FF             # t7 = 000000FF
    bne     t7, $zero, lbl_800C6B44
    sb      t6, 0x0000(v1)             # 80121F0B
    lui     a0, 0xE300                 # a0 = E3000000
    jal     func_800BB0BC
    or      a1, $zero, $zero           # a1 = 00000000
    lui     a0, 0xE300                 # a0 = E3000000
    jal     func_800BB0BC
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    jal     func_800CAB18
    or      a0, $zero, $zero           # a0 = 00000000
    jal     func_800CAB18
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    sh      v0, 0x0026($sp)
    jal     func_800CAB18
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    lhu     t8, 0x0026($sp)
    ori     $at, $zero, 0xFFFF         # $at = 0000FFFF
    sh      v0, 0x0022($sp)
    bne     t8, $at, lbl_800C6B00
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_800CACA4
    addiu   a3, $zero, 0x0005          # a3 = 00000005
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    or      a2, $zero, $zero           # a2 = 00000000
    jal     func_800CACA4
    addiu   a3, $zero, 0x0005          # a3 = 00000005
    lui     a0, 0xC180                 # a0 = C1800000
    jal     func_800CAA70
    ori     a0, a0, 0x010A             # a0 = C180010A
    lui     a0, 0xC183                 # a0 = C1830000
    jal     func_800CAA70
    ori     a0, a0, 0x010A             # a0 = C183010A
    jal     func_800CAA70
    lui     a0, 0xC190                 # a0 = C1900000
    lhu     t9, 0x0022($sp)
    addiu   $at, $zero, 0x002F         # $at = 0000002F
    beq     t9, $at, lbl_800C6B00
    nop
    jal     func_800CAA70
    lui     a0, 0xC193                 # a0 = C1930000
lbl_800C6B00:
    lui     a0, 0x8012                 # a0 = 80120000
    lhu     a0, 0x1F0C(a0)             # 80121F0C
    lhu     t0, 0x0022($sp)
    lui     $at, 0x0101                # $at = 01010000
    or      a0, a0, $at                # a0 = 81130000
    jal     func_800CAA70
    sw      t0, 0x001C($sp)
    lui     a0, 0xA000                 # a0 = A0000000
    jal     func_800CAA70
    ori     a0, a0, 0xFFFF             # a0 = A000FFFF
    lw      t1, 0x001C($sp)
    addiu   $at, $zero, 0x002F         # $at = 0000002F
    lui     a0, 0xA300                 # a0 = A3000000
    beql    t1, $at, lbl_800C6B48
    lw      $ra, 0x0014($sp)
    jal     func_800CAA70
    ori     a0, a0, 0xFFFF             # a0 = A300FFFF
lbl_800C6B44:
    lw      $ra, 0x0014($sp)
lbl_800C6B48:
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800C6B54:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a0, 0x0020($sp)
    lbu     v0, 0x0023($sp)
    sw      a3, 0x002C($sp)
    sll     a3, a3, 24
    sra     a3, a3, 24
    andi    t7, a3, 0x00FF             # t7 = 00000000
    lui     $at, 0x7000                # $at = 70000000
    sll     v0, v0, 24
    lbu     t0, 0x0033($sp)
    or      t6, v0, $at                # t6 = 70000000
    sll     t8, t7, 16
    sw      $ra, 0x0014($sp)
    or      t9, t6, t8                 # t9 = 70000000
    sw      a1, 0x0024($sp)
    sw      a2, 0x0028($sp)
    sw      v0, 0x001C($sp)
    jal     func_800CAA70
    or      a0, t9, t0                 # a0 = 70000000
    lbu     t1, 0x002B($sp)
    lw      v0, 0x001C($sp)
    lhu     t4, 0x0026($sp)
    sll     t2, t1, 16
    or      t3, v0, t2                 # t3 = 00000000
    jal     func_800CAA70
    or      a0, t3, t4                 # a0 = 00000000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C6BCC:
# MqDbg: 
    lui     t6, 0x8010                 # t6 = 80100000
    lhu     t6, 0x1938(t6)             # 80101938
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    ori     $at, $zero, 0xFFFF         # $at = 0000FFFF
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0030($sp)
    bne     t6, $at, lbl_800C6E38
    andi    a1, a0, 0x00FF             # a1 = 00000000
    lui     t7, 0x8010                 # t7 = 80100000
    lb      t7, 0x191C(t7)             # 8010191C
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    beq     t7, $zero, lbl_800C6C08
    nop
    addiu   a1, $zero, 0x0003          # a1 = 00000003
lbl_800C6C08:
    lhu     v0, 0x4E54(v0)             # 80124E54
    addiu   v1, $zero, 0x0002          # v1 = 00000002
    bne     v1, v0, lbl_800C6C3C
    or      t2, v0, $zero              # t2 = 80120000
    sb      a1, 0x0033($sp)
    jal     func_800CAB18
    sw      v0, 0x0024($sp)
    addiu   $at, $zero, 0x081A         # $at = 0000081A
    addiu   v1, $zero, 0x0002          # v1 = 00000002
    lbu     a1, 0x0033($sp)
    bne     v0, $at, lbl_800C6C3C
    lw      t2, 0x0024($sp)
    addiu   a1, $zero, 0x0003          # a1 = 00000003
lbl_800C6C3C:
    ori     $at, $zero, 0xFFFF         # $at = 0000FFFF
    beq     t2, $at, lbl_800C6C7C
    andi    t9, t2, 0x00FF             # t9 = 00000000
    lui     t5, 0x8010                 # t5 = 80100000
    addu    t5, t5, t9
    lbu     t5, 0x1964(t5)             # 80101964
    lui     t4, 0x8010                 # t4 = 80100000
    addiu   t4, t4, 0x192C             # t4 = 8010192C
    andi    t6, t5, 0x0001             # t6 = 00000000
    bne     t6, $zero, lbl_800C6C7C
    nop
    lbu     v0, 0x0000(t4)             # 8010192C
    addiu   t3, $zero, 0x0001          # t3 = 00000001
    andi    t7, v0, 0x007F             # t7 = 00000000
    bne     t3, t7, lbl_800C6DA0
    nop
lbl_800C6C7C:
    lui     t4, 0x8010                 # t4 = 80100000
    addiu   t4, t4, 0x192C             # t4 = 8010192C
    lbu     v0, 0x0000(t4)             # 8010192C
    addiu   t3, $zero, 0x0001          # t3 = 00000001
    or      t1, a1, $zero              # t1 = 00000003
    andi    v0, v0, 0x007F             # v0 = 00000000
    beql    v0, a1, lbl_800C6E3C
    lw      $ra, 0x0014($sp)
    bne     t3, a1, lbl_800C6D40
    lui     v1, 0x8010                 # v1 = 80100000
    lui     t8, 0x8012                 # t8 = 80120000
    lbu     t8, 0x533B(t8)             # 8012533B
    lb      v1, 0x1934(v1)             # 80101934
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    addiu   a1, $zero, 0x0003          # a1 = 00000003
    subu    v0, t8, v1
    bgez    v0, lbl_800C6CCC
    andi    a2, v1, 0x00FF             # a2 = 00000000
    b       lbl_800C6CD0
    subu    t0, $zero, v0
lbl_800C6CCC:
    or      t0, v0, $zero              # t0 = 00000000
lbl_800C6CD0:
    andi    a3, t0, 0x00FF             # a3 = 00000000
    sw      t1, 0x001C($sp)
    jal     func_800CACA4
    sw      t2, 0x0024($sp)
    lui     a0, 0x030A                 # a0 = 030A0000
    jal     func_800CAA70
    ori     a0, a0, 0x081A             # a0 = 030A081A
    lw      t2, 0x0024($sp)
    addiu   $at, $zero, 0x0001         # $at = 00000001
    lw      t1, 0x001C($sp)
    beq     t2, $at, lbl_800C6D34
    or      a0, $zero, $zero           # a0 = 00000000
    lui     t9, 0x8010                 # t9 = 80100000
    lb      t9, 0x1934(t9)             # 80101934
    addiu   t5, $zero, 0x007F          # t5 = 0000007F
    addiu   a1, $zero, 0x0003          # a1 = 00000003
    subu    a2, t5, t9
    andi    a2, a2, 0x00FF             # a2 = 00000000
    addiu   a3, $zero, 0x000A          # a3 = 0000000A
    jal     func_800CACA4
    sw      t1, 0x001C($sp)
    lui     a0, 0x8010                 # a0 = 80100000
    jal     func_800C5E4C
    lb      a0, 0x1934(a0)             # 80101934
    lw      t1, 0x001C($sp)
lbl_800C6D34:
    lui     t4, 0x8010                 # t4 = 80100000
    b       lbl_800C6D94
    addiu   t4, t4, 0x192C             # t4 = 8010192C
lbl_800C6D40:
    bne     t3, v0, lbl_800C6D94
    lui     a0, 0x130A                 # a0 = 130A0000
    ori     a0, a0, 0x00FF             # a0 = 130A00FF
    jal     func_800CAA70
    sw      t1, 0x001C($sp)
    lw      t1, 0x001C($sp)
    addiu   $at, $zero, 0x0003         # $at = 00000003
    or      a0, $zero, $zero           # a0 = 00000000
    bne     t1, $at, lbl_800C6D70
    addiu   a1, $zero, 0x0003          # a1 = 00000003
    b       lbl_800C6D74
    or      a3, $zero, $zero           # a3 = 00000000
lbl_800C6D70:
    addiu   a3, $zero, 0x000A          # a3 = 0000000A
lbl_800C6D74:
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    jal     func_800CACA4
    sw      t1, 0x001C($sp)
    jal     func_800C5E4C
    or      a0, $zero, $zero           # a0 = 00000000
    lui     t4, 0x8010                 # t4 = 80100000
    addiu   t4, t4, 0x192C             # t4 = 8010192C
    lw      t1, 0x001C($sp)
lbl_800C6D94:
    addiu   t6, t1, 0x0080             # t6 = 00000080
    b       lbl_800C6E38
    sb      t6, 0x0000(t4)             # 8010192C
lbl_800C6DA0:
    bne     a1, $zero, lbl_800C6DDC
    or      t1, a1, $zero              # t1 = 00000000
    bne     v1, v0, lbl_800C6DB8
    lui     a0, 0x8010                 # a0 = 80100000
    addiu   a0, a0, 0x1948             # a0 = 80101948
    sw      $zero, 0x0000(a0)          # 80101948
lbl_800C6DB8:
    lui     a0, 0x8010                 # a0 = 80100000
    addiu   a0, a0, 0x1948             # a0 = 80101948
    lw      t7, 0x0000(a0)             # 80101948
    lui     v0, 0x8010                 # v0 = 80100000
    addiu   v0, v0, 0x1944             # v0 = 80101944
    addiu   t8, t7, 0x0001             # t8 = 00000001
    sw      $zero, 0x0000(v0)          # 80101944
    b       lbl_800C6DF8
    sw      t8, 0x0000(a0)             # 80101948
lbl_800C6DDC:
    lui     v0, 0x8010                 # v0 = 80100000
    addiu   v0, v0, 0x1944             # v0 = 80101944
    lw      t5, 0x0000(v0)             # 80101944
    lui     a0, 0x8010                 # a0 = 80100000
    addiu   a0, a0, 0x1948             # a0 = 80101948
    addiu   t9, t5, 0x0001             # t9 = 00000001
    sw      t9, 0x0000(v0)             # 80101944
lbl_800C6DF8:
    bnel    v1, t1, lbl_800C6E2C
    lui     $at, 0x7002                # $at = 70020000
    lw      t6, 0x0000(v0)             # 80101944
    sltiu   $at, t6, 0x001E
    beql    $at, $zero, lbl_800C6E2C
    lui     $at, 0x7002                # $at = 70020000
    lw      t7, 0x0000(a0)             # 80101948
    sltiu   $at, t7, 0x0015
    bnel    $at, $zero, lbl_800C6E2C
    lui     $at, 0x7002                # $at = 70020000
    or      a1, $zero, $zero           # a1 = 00000000
    or      t1, $zero, $zero           # t1 = 00000000
    lui     $at, 0x7002                # $at = 70020000
lbl_800C6E2C:
    sb      a1, 0x0000(t4)             # 8010192C
    jal     func_800CAA70
    or      a0, t1, $at                # a0 = 70020000
lbl_800C6E38:
    lw      $ra, 0x0014($sp)
lbl_800C6E3C:
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop


func_800C6E48:
# MqDbg: 
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x192C(t6)             # 8010192C
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    addiu   $at, $zero, 0x0081         # $at = 00000081
    bne     t6, $at, lbl_800C6F88
    sw      $ra, 0x0014($sp)
    lui     $at, 0x8010                # $at = 80100000
    lwc1    $f4, 0x1930($at)           # 80101930
    lui     $at, 0x4316                # $at = 43160000
    c.eq.s  $f12, $f4
    nop
    bc1t    lbl_800C6F60
    nop
    mtc1    $at, $f2                   # $f2 = 150.00
    lui     $at, 0x43FA                # $at = 43FA0000
    c.lt.s  $f12, $f2
    nop
    bc1fl   lbl_800C6EAC
    mtc1    $at, $f6                   # $f6 = 500.00
    lui     $at, 0x43AF                # $at = 43AF0000
    mtc1    $at, $f2                   # $f2 = 350.00
    mtc1    $zero, $f0                 # $f0 = 0.00
    b       lbl_800C6EE0
    sub.s   $f8, $f2, $f0
    mtc1    $at, $f6                   # $f6 = 350.00
lbl_800C6EAC:
    lui     $at, 0x43AF                # $at = 43AF0000
    c.lt.s  $f6, $f12
    nop
    bc1fl   lbl_800C6ED4
    sub.s   $f0, $f12, $f2
    lui     $at, 0x43AF                # $at = 43AF0000
    mtc1    $at, $f2                   # $f2 = 350.00
    b       lbl_800C6EDC
    mov.s   $f0, $f2
    sub.s   $f0, $f12, $f2
lbl_800C6ED4:
    mtc1    $at, $f2                   # $f2 = 350.00
    nop
lbl_800C6EDC:
    sub.s   $f8, $f2, $f0
lbl_800C6EE0:
    lui     $at, 0x42FE                # $at = 42FE0000
    mtc1    $at, $f10                  # $f10 = 127.00
    lui     v0, 0x8010                 # v0 = 80100000
    addiu   v0, v0, 0x1934             # v0 = 80101934
    mul.s   $f16, $f8, $f10
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    addiu   a1, $zero, 0x0003          # a1 = 00000003
    addiu   a3, $zero, 0x000A          # a3 = 0000000A
    swc1    $f12, 0x0018($sp)
    div.s   $f18, $f16, $f2
    trunc.w.s $f4, $f18
    mfc1    t8, $f4
    nop
    sb      t8, 0x0000(v0)             # 80101934
    jal     func_800CACA4
    andi    a2, t8, 0x00FF             # a2 = 00000000
    lui     t9, 0x8012                 # t9 = 80120000
    lhu     t9, 0x4E54(t9)             # 80124E54
    addiu   $at, $zero, 0x0001         # $at = 00000001
    lwc1    $f12, 0x0018($sp)
    beq     t9, $at, lbl_800C6F60
    or      a0, $zero, $zero           # a0 = 00000000
    lui     t0, 0x8010                 # t0 = 80100000
    lb      t0, 0x1934(t0)             # 80101934
    addiu   t1, $zero, 0x007F          # t1 = 0000007F
    addiu   a1, $zero, 0x0003          # a1 = 00000003
    subu    a2, t1, t0
    andi    a2, a2, 0x00FF             # a2 = 00000000
    addiu   a3, $zero, 0x000A          # a3 = 0000000A
    jal     func_800CACA4
    swc1    $f12, 0x0018($sp)
    lwc1    $f12, 0x0018($sp)
lbl_800C6F60:
    lui     t2, 0x8012                 # t2 = 80120000
    lhu     t2, 0x4E54(t2)             # 80124E54
    addiu   $at, $zero, 0x0001         # $at = 00000001
    lui     a0, 0x8010                 # a0 = 80100000
    beql    t2, $at, lbl_800C6F8C
    lw      $ra, 0x0014($sp)
    lb      a0, 0x1934(a0)             # 80101934
    jal     func_800C5E4C
    swc1    $f12, 0x0018($sp)
    lwc1    $f12, 0x0018($sp)
lbl_800C6F88:
    lw      $ra, 0x0014($sp)
lbl_800C6F8C:
    lui     $at, 0x8010                # $at = 80100000
    swc1    $f12, 0x1930($at)          # 80101930
    jr      $ra
    addiu   $sp, $sp, 0x0018           # $sp += 0x18


func_800C6F9C:
# MqDbg: 
    lui     t6, 0x8012                 # t6 = 80120000
    lbu     t6, 0x1F09(t6)             # 80121F09
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      $ra, 0x001C($sp)
    bne     t6, $zero, lbl_800C71F0
    sw      a1, 0x0034($sp)
    or      a0, $zero, $zero           # a0 = 00000000
    jal     func_800CAB18
    swc1    $f12, 0x0030($sp)
    lhu     v1, 0x0036($sp)
    or      a0, v0, $zero              # a0 = 00000000
    sll     a0, a0, 24
    sra     a0, a0, 24
    andi    v1, v1, 0x00FF             # v1 = 00000000
    bne     v1, a0, lbl_800C70BC
    lwc1    $f12, 0x0030($sp)
    addiu   $at, $zero, 0x002F         # $at = 0000002F
    bne     v1, $at, lbl_800C70B4
    addiu   t8, $zero, 0x007F          # t8 = 0000007F
    lui     $at, 0x44FA                # $at = 44FA0000
    mtc1    $at, $f4                   # $f4 = 2000.00
    lui     $at, 0x4348                # $at = 43480000
    c.lt.s  $f4, $f12
    nop
    bc1fl   lbl_800C7010
    mtc1    $at, $f0                   # $f0 = 200.00
    b       lbl_800C7058
    addiu   v1, $zero, 0x007F          # v1 = 0000007F
    mtc1    $at, $f0                   # $f0 = 200.00
lbl_800C7010:
    lui     $at, 0x42FE                # $at = 42FE0000
    c.lt.s  $f12, $f0
    nop
    bc1fl   lbl_800C7030
    sub.s   $f6, $f12, $f0
    b       lbl_800C7058
    or      v1, $zero, $zero           # v1 = 00000000
    sub.s   $f6, $f12, $f0
lbl_800C7030:
    mtc1    $at, $f8                   # $f8 = 127.00
    lui     $at, 0x44E1                # $at = 44E10000
    mtc1    $at, $f16                  # $f16 = 1800.00
    mul.s   $f10, $f6, $f8
    div.s   $f18, $f10, $f16
    trunc.w.s $f4, $f18
    mfc1    v1, $f4
    nop
    sll     v1, v1, 24
    sra     v1, v1, 24
lbl_800C7058:
    subu    v0, t8, v1
    lui     $at, 0x6003                # $at = 60030000
    or      a0, v0, $at                # a0 = 60030000
    sw      v0, 0x0028($sp)
    jal     func_800CAA70
    sb      v1, 0x002E($sp)
    lw      v0, 0x0028($sp)
    lui     $at, 0x6003                # $at = 60030000
    ori     $at, $at, 0x0100           # $at = 60030100
    jal     func_800CAA70
    or      a0, v0, $at                # a0 = 60030100
    lb      v1, 0x002E($sp)
    lui     $at, 0x6003                # $at = 60030000
    ori     $at, $at, 0x0D00           # $at = 60030D00
    andi    a0, v1, 0x00FF             # a0 = 00000000
    jal     func_800CAA70
    or      a0, a0, $at                # a0 = 60030D00
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x1F08             # v1 = 80121F08
    lbu     v0, 0x0000(v1)             # 80121F08
    bne     v0, $zero, lbl_800C70B4
    addiu   t9, v0, 0x0001             # t9 = 00000001
    sb      t9, 0x0000(v1)             # 80121F08
lbl_800C70B4:
    b       lbl_800C71D4
    nop
lbl_800C70BC:
    addiu   $at, $zero, 0x0001         # $at = 00000001
    bne     a0, $at, lbl_800C71D4
    addiu   $at, $zero, 0x002F         # $at = 0000002F
    bne     v1, $at, lbl_800C71D4
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    sw      v1, 0x0024($sp)
    jal     func_800CAB18
    swc1    $f12, 0x0030($sp)
    lw      v1, 0x0024($sp)
    sll     t1, v0, 24
    sra     t2, t1, 24
    beq     v1, t2, lbl_800C7138
    lwc1    $f12, 0x0030($sp)
    lui     t3, 0x8012                 # t3 = 80120000
    lbu     t3, 0x1F08(t3)             # 80121F08
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    addiu   a1, $zero, 0x002F          # a1 = 0000002F
    slti    $at, t3, 0x000A
    beq     $at, $zero, lbl_800C7138
    or      a2, $zero, $zero           # a2 = 00000000
    or      a3, $zero, $zero           # a3 = 00000000
    sw      $zero, 0x0010($sp)
    jal     func_800C6B54
    swc1    $f12, 0x0030($sp)
    lui     a0, 0xA300                 # a0 = A3000000
    jal     func_800CAA70
    ori     a0, a0, 0xFFFC             # a0 = A300FFFC
    addiu   t4, $zero, 0x000A          # t4 = 0000000A
    lui     $at, 0x8012                # $at = 80120000
    lwc1    $f12, 0x0030($sp)
    sb      t4, 0x1F08($at)            # 80121F08
lbl_800C7138:
    lui     $at, 0x44FA                # $at = 44FA0000
    mtc1    $at, $f6                   # $f6 = 2000.00
    lui     $at, 0x4348                # $at = 43480000
    addiu   t6, $zero, 0x007F          # t6 = 0000007F
    c.lt.s  $f6, $f12
    nop
    bc1fl   lbl_800C7164
    mtc1    $at, $f0                   # $f0 = 200.00
    b       lbl_800C71AC
    addiu   v1, $zero, 0x007F          # v1 = 0000007F
    mtc1    $at, $f0                   # $f0 = 200.00
lbl_800C7164:
    lui     $at, 0x42FE                # $at = 42FE0000
    c.lt.s  $f12, $f0
    nop
    bc1fl   lbl_800C7184
    sub.s   $f8, $f12, $f0
    b       lbl_800C71AC
    or      v1, $zero, $zero           # v1 = 00000000
    sub.s   $f8, $f12, $f0
lbl_800C7184:
    mtc1    $at, $f10                  # $f10 = 127.00
    lui     $at, 0x44E1                # $at = 44E10000
    mtc1    $at, $f18                  # $f18 = 1800.00
    mul.s   $f16, $f8, $f10
    div.s   $f4, $f16, $f18
    trunc.w.s $f6, $f4
    mfc1    v1, $f6
    nop
    sll     v1, v1, 24
    sra     v1, v1, 24
lbl_800C71AC:
    subu    v0, t6, v1
    lui     $at, 0x6303                # $at = 63030000
    or      a0, v0, $at                # a0 = 63030000
    jal     func_800CAA70
    sw      v0, 0x0028($sp)
    lw      v0, 0x0028($sp)
    lui     $at, 0x6303                # $at = 63030000
    ori     $at, $at, 0x0100           # $at = 63030100
    jal     func_800CAA70
    or      a0, v0, $at                # a0 = 63030100
lbl_800C71D4:
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x1F08             # v1 = 80121F08
    lbu     v0, 0x0000(v1)             # 80121F08
    slti    $at, v0, 0x000A
    beq     $at, $zero, lbl_800C71F0
    addiu   t7, v0, 0x0001             # t7 = 00000001
    sb      t7, 0x0000(v1)             # 80121F08
lbl_800C71F0:
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop


func_800C7200:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a0, 0x0020($sp)
    andi    a0, a0, 0x00FF             # a0 = 00000000
    lui     $at, 0x8010                # $at = 80100000
    sw      $ra, 0x001C($sp)
    beq     a0, $zero, lbl_800C725C
    sb      a0, 0x1918($at)            # 80101918
    lui     a3, 0x8010                 # a3 = 80100000
    lui     t6, 0x8010                 # t6 = 80100000
    addiu   a3, a3, 0x43A0             # a3 = 801043A0
    addiu   t6, t6, 0x43A8             # t6 = 801043A8
    lui     a1, 0x8010                 # a1 = 80100000
    addiu   a1, a1, 0x4394             # a1 = 80104394
    sw      t6, 0x0014($sp)
    sw      a3, 0x0010($sp)
    addiu   a0, $zero, 0x4800          # a0 = 00004800
    jal     func_800C806C
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    lui     a0, 0xF100                 # a0 = F1000000
    jal     func_800BB0BC
    or      a1, $zero, $zero           # a1 = 00000000
    b       lbl_800C7298
    lw      $ra, 0x001C($sp)
lbl_800C725C:
    lui     a3, 0x8010                 # a3 = 80100000
    lui     t7, 0x8010                 # t7 = 80100000
    addiu   a3, a3, 0x43A0             # a3 = 801043A0
    addiu   t7, t7, 0x43A8             # t7 = 801043A8
    lui     a1, 0x8010                 # a1 = 80100000
    addiu   a1, a1, 0x4394             # a1 = 80104394
    sw      t7, 0x0014($sp)
    sw      a3, 0x0010($sp)
    addiu   a0, $zero, 0x4801          # a0 = 00004801
    jal     func_800C806C
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    lui     a0, 0xF200                 # a0 = F2000000
    jal     func_800BB0BC
    or      a1, $zero, $zero           # a1 = 00000000
    lw      $ra, 0x001C($sp)
lbl_800C7298:
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C72A4:
# MqDbg: 
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      s0, 0x001C($sp)
    andi    s0, a0, 0x00FF             # s0 = 00000000
    sw      $ra, 0x0024($sp)
    sw      a0, 0x0038($sp)
    lui     $at, 0x8012                # $at = 80120000
    sw      s1, 0x0020($sp)
    sb      s0, 0x1F09($at)            # 80121F09
    jal     func_800CAB18
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   s1, $zero, 0x002F          # s1 = 0000002F
    andi    t6, v0, 0x00FF             # t6 = 00000000
    bne     s1, t6, lbl_800C72E4
    or      v1, $zero, $zero           # v1 = 00000000
    b       lbl_800C7300
    sh      $zero, 0x0034($sp)
lbl_800C72E4:
    jal     func_800CAB18
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    andi    t7, v0, 0x00FF             # t7 = 00000000
    bne     s1, t7, lbl_800C73CC
    addiu   v1, $zero, 0x0003          # v1 = 00000003
    ori     t8, $zero, 0xFFFC          # t8 = 0000FFFC
    sh      t8, 0x0034($sp)
lbl_800C7300:
    beq     s0, $zero, lbl_800C7364
    addiu   $at, $zero, 0x0003         # $at = 00000003
    sll     s1, v1, 24
    lui     $at, 0x6000                # $at = 60000000
    or      v0, s1, $at                # v0 = 6000002F
    lui     $at, 0x0001                # $at = 00010000
    or      v0, v0, $at                # v0 = 6001002F
    or      a0, v0, $zero              # a0 = 6001002F
    sw      v0, 0x0028($sp)
    jal     func_800CAA70
    or      s0, v1, $zero              # s0 = 00000003
    lw      v0, 0x0028($sp)
    jal     func_800CAA70
    ori     a0, v0, 0x0100             # a0 = 00000100
    addiu   $at, $zero, 0x0003         # $at = 00000003
    bne     s0, $at, lbl_800C73CC
    lhu     t0, 0x0034($sp)
    lui     $at, 0xA000                # $at = A0000000
    ori     t1, t0, 0x0003             # t1 = 00000003
    andi    t2, t1, 0xFFFF             # t2 = 00000003
    or      t9, s1, $at                # t9 = A000002F
    jal     func_800CAA70
    or      a0, t9, t2                 # a0 = A000002F
    b       lbl_800C73D0
    lw      $ra, 0x0024($sp)
lbl_800C7364:
    bne     v1, $at, lbl_800C7384
    or      s0, v1, $zero              # s0 = 00000000
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    addiu   a1, $zero, 0x002F          # a1 = 0000002F
    or      a2, $zero, $zero           # a2 = 00000000
    or      a3, $zero, $zero           # a3 = 00000000
    jal     func_800C6B54
    sw      $zero, 0x0010($sp)
lbl_800C7384:
    sll     s1, s0, 24
    lui     $at, 0x6000                # $at = 60000000
    or      v0, s1, $at                # v0 = 6000002F
    lui     $at, 0x0001                # $at = 00010000
    or      v0, v0, $at                # v0 = 6001002F
    ori     a0, v0, 0x007F             # a0 = 6001007F
    jal     func_800CAA70
    sw      v0, 0x0028($sp)
    lw      a0, 0x0028($sp)
    jal     func_800CAA70
    ori     a0, a0, 0x017F             # a0 = 0000017F
    addiu   $at, $zero, 0x0003         # $at = 00000003
    bne     s0, $at, lbl_800C73CC
    lhu     t4, 0x0034($sp)
    lui     $at, 0xA000                # $at = A0000000
    or      t3, s1, $at                # t3 = A000002F
    jal     func_800CAA70
    or      a0, t3, t4                 # a0 = A000002F
lbl_800C73CC:
    lw      $ra, 0x0024($sp)
lbl_800C73D0:
    lw      s0, 0x001C($sp)
    lw      s1, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038           # $sp += 0x38


func_800C73E0:
# MqDbg: 
    sw      a0, 0x0000($sp)
    sll     a0, a0, 24
    sra     a0, a0, 24
    andi    t6, a0, 0x007F             # t6 = 00000000
    lui     $at, 0x8010                # $at = 80100000
    jr      $ra
    sb      t6, 0x1924($at)            # 80101924


func_800C73FC:
# MqDbg: 
    sw      a0, 0x0000($sp)
    sll     a0, a0, 24
    sra     a0, a0, 24
    beq     a0, $zero, lbl_800C7418
    andi    t6, a0, 0x007F             # t6 = 00000000
    lui     $at, 0x8010                # $at = 80100000
    sb      t6, 0x1928($at)            # 80101928
lbl_800C7418:
    jr      $ra
    nop


func_800C7420:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a0, 0x0020($sp)
    sll     a0, a0, 24
    sra     a0, a0, 24
    beq     a0, $zero, lbl_800C7464
    sw      $ra, 0x0014($sp)
    addiu   v0, $zero, 0x0001          # v0 = 00000001
    beq     a0, v0, lbl_800C7474
    addiu   t6, $zero, 0x0003          # t6 = 00000003
    addiu   v1, $zero, 0x0002          # v1 = 00000002
    beq     a0, v1, lbl_800C7488
    lui     $at, 0x8010                # $at = 80100000
    addiu   $at, $zero, 0x0003         # $at = 00000003
    beq     a0, $at, lbl_800C7494
    nop
    b       lbl_800C74A4
    lbu     a0, 0x001F($sp)
lbl_800C7464:
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x001F($sp)
    b       lbl_800C74A0
    sb      $zero, 0x1914($at)         # 80101914
lbl_800C7474:
    addiu   t7, $zero, 0x0003          # t7 = 00000003
    lui     $at, 0x8010                # $at = 80100000
    sb      t6, 0x001F($sp)
    b       lbl_800C74A0
    sb      t7, 0x1914($at)            # 80101914
lbl_800C7488:
    sb      v0, 0x001F($sp)
    b       lbl_800C74A0
    sb      v0, 0x1914($at)            # 80101914
lbl_800C7494:
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x001F($sp)
    sb      v1, 0x1914($at)            # 80101914
lbl_800C74A0:
    lbu     a0, 0x001F($sp)
lbl_800C74A4:
    lui     $at, 0xE000                # $at = E0000000
    jal     func_800CAA70
    or      a0, a0, $at                # a0 = E0000000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C74C0:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a0, 0x0020($sp)
    lui     v1, 0x8010                 # v1 = 80100000
    lbu     v1, 0x194C(v1)             # 8010194C
    lbu     v0, 0x0023($sp)
    sw      $ra, 0x001C($sp)
    beql    v0, v1, lbl_800C752C
    lbu     t7, 0x0023($sp)
    bne     v0, $zero, lbl_800C74F8
    nop
    jal     func_800C9884
    addiu   a0, $zero, 0x086B          # a0 = 0000086B
    b       lbl_800C752C
    lbu     t7, 0x0023($sp)
lbl_800C74F8:
    bne     v1, $zero, lbl_800C7528
    lui     a3, 0x8010                 # a3 = 80100000
    lui     t6, 0x8010                 # t6 = 80100000
    addiu   a3, a3, 0x43A0             # a3 = 801043A0
    addiu   t6, t6, 0x43A8             # t6 = 801043A8
    lui     a1, 0x8010                 # a1 = 80100000
    addiu   a1, a1, 0x4394             # a1 = 80104394
    sw      t6, 0x0014($sp)
    sw      a3, 0x0010($sp)
    addiu   a0, $zero, 0x086B          # a0 = 0000086B
    jal     func_800C806C
    addiu   a2, $zero, 0x0004          # a2 = 00000004
lbl_800C7528:
    lbu     t7, 0x0023($sp)
lbl_800C752C:
    lw      $ra, 0x001C($sp)
    lui     $at, 0x8010                # $at = 80100000
    sb      t7, 0x194C($at)            # 8010194C
    lui     $at, 0x8010                # $at = 80100000
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    sb      t7, 0x1954($at)            # 80101954


func_800C7548:
# MqDbg: 
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      a0, 0x0028($sp)
    andi    a0, a0, 0x00FF             # a0 = 00000000
    lui     $at, 0x8010                # $at = 80100000
    sb      a0, 0x1958($at)            # 80101958
    lui     t6, 0x8012                 # t6 = 80120000
    lhu     t6, 0x4E54(t6)             # 80124E54
    lui     $at, 0x8010                # $at = 80100000
    sb      a0, 0x1950($at)            # 80101950
    addiu   $at, $zero, 0x0001         # $at = 00000001
    sw      $ra, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    bne     t6, $at, lbl_800C75C4
    sw      s0, 0x0018($sp)
    sll     s1, a0, 24
    sra     s1, s1, 24
    or      s0, $zero, $zero           # s0 = 00000000
    lui     s2, 0x0600                 # s2 = 06000000
    andi    t7, s0, 0x00FF             # t7 = 00000000
lbl_800C7598:
    sll     t8, t7,  8
    or      a0, t8, s2                 # a0 = 06000000
    sll     a1, s1, 24
    sra     a1, a1, 24
    jal     func_800BB0E0
    ori     a0, a0, 0x0006             # a0 = 06000006
    addiu   s0, s0, 0x0001             # s0 = 00000001
    andi    s0, s0, 0x00FF             # s0 = 00000001
    slti    $at, s0, 0x0010
    bnel    $at, $zero, lbl_800C7598
    andi    t7, s0, 0x00FF             # t7 = 00000001
lbl_800C75C4:
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28


func_800C75DC:
# MqDbg: 
    sw      a0, 0x0000($sp)
    sll     a0, a0, 24
    sra     a0, a0, 24
    lui     $at, 0x8010                # $at = 80100000
    jr      $ra
    sb      a0, 0x191C($at)            # 8010191C


func_800C75F4:
# MqDbg: 
    lui     t6, 0x8010                 # t6 = 80100000
    lb      t6, 0x191C(t6)             # 8010191C
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      a0, 0x0020($sp)
    sw      a2, 0x0028($sp)
    andi    a2, a2, 0x00FF             # a2 = 00000000
    andi    a0, a0, 0xFFFF             # a0 = 00000000
    bne     t6, $zero, lbl_800C762C
    sw      $ra, 0x001C($sp)
    lw      t7, 0x0030($sp)
    lw      t8, 0x0034($sp)
    sw      t7, 0x0010($sp)
    jal     func_800C806C
    sw      t8, 0x0014($sp)
lbl_800C762C:
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C763C:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    lui     a3, 0x8010                 # a3 = 80100000
    lui     t6, 0x8010                 # t6 = 80100000
    addiu   a3, a3, 0x43A0             # a3 = 801043A0
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0020($sp)
    addiu   t6, t6, 0x43A8             # t6 = 801043A8
    lui     a1, 0x8010                 # a1 = 80100000
    andi    a0, a0, 0xFFFF             # a0 = 00000000
    addiu   a1, a1, 0x4394             # a1 = 80104394
    sw      t6, 0x0014($sp)
    sw      a3, 0x0010($sp)
    jal     func_800C75F4
    addiu   a2, $zero, 0x0004          # a2 = 00000004
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C7684:
# MqDbg: 
    addiu   $sp, $sp, 0xFFB0           # $sp -= 0x50
    andi    a1, a0, 0xFFFF             # a1 = 00000000
    sll     v0, a1,  2
    subu    v0, v0, a1
    sw      $ra, 0x0034($sp)
    sw      s7, 0x0030($sp)
    sw      a0, 0x0050($sp)
    sw      s6, 0x002C($sp)
    sw      s5, 0x0028($sp)
    sw      s4, 0x0024($sp)
    sw      s3, 0x0020($sp)
    sw      s2, 0x001C($sp)
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    or      s7, a1, $zero              # s7 = 00000000
    bgez    v0, lbl_800C76CC
    addu    $at, v0, $zero
    addiu   $at, v0, 0x0001            # $at = 00000001
lbl_800C76CC:
    sra     v0, $at,  1
    lui     $at, 0x1000                # $at = 10000000
    andi    v0, v0, 0x00FF             # v0 = 00000000
    sll     v0, v0, 16
    ori     $at, $at, 0x00FF           # $at = 100000FF
    or      a0, v0, $at                # a0 = 100000FF
    jal     func_800CAA70
    sw      v0, 0x003C($sp)
    lw      a0, 0x003C($sp)
    lui     $at, 0x1100                # $at = 11000000
    ori     $at, $at, 0x00FF           # $at = 110000FF
    jal     func_800CAA70
    or      a0, a0, $at                # a0 = 110000FF
    lui     s6, 0x8010                 # s6 = 80100000
    addiu   s6, s6, 0x43C0             # s6 = 801043C0
    or      s0, $zero, $zero           # s0 = 00000000
    or      v0, $zero, $zero           # v0 = 00000000
    addiu   s5, $zero, 0x000A          # s5 = 0000000A
    lui     s4, 0x6200                 # s4 = 62000000
    addiu   s3, $zero, 0x000D          # s3 = 0000000D
    addiu   s2, $zero, 0x000C          # s2 = 0000000C
    addiu   s1, $zero, 0x000B          # s1 = 0000000B
lbl_800C7724:
    beq     s1, v0, lbl_800C7744
    or      v1, $zero, $zero           # v1 = 00000000
    beql    v0, s2, lbl_800C7748
    lbu     t6, 0x0000(s6)             # 801043C0
    beql    v0, s3, lbl_800C775C
    addiu   v1, $zero, 0x0001          # v1 = 00000001
    b       lbl_800C775C
    nop
lbl_800C7744:
    lbu     t6, 0x0000(s6)             # 801043C0
lbl_800C7748:
    bne     s5, t6, lbl_800C775C
    nop
    b       lbl_800C775C
    addiu   v1, $zero, 0x0001          # v1 = 00000001
    addiu   v1, $zero, 0x0001          # v1 = 00000001
lbl_800C775C:
    bne     v1, $zero, lbl_800C777C
    sra     t7, s7,  1
    andi    t8, t7, 0x00FF             # t8 = 00000000
    sll     t9, t8, 16
    or      t0, t9, s4                 # t0 = 62000000
    sll     t1, v0,  8
    jal     func_800CAA70
    or      a0, t0, t1                 # a0 = 62000000
lbl_800C777C:
    addiu   s0, s0, 0x0001             # s0 = 00000001
    andi    s0, s0, 0x00FF             # s0 = 00000001
    slti    $at, s0, 0x0010
    bne     $at, $zero, lbl_800C7724
    or      v0, s0, $zero              # v0 = 00000001
    lw      a0, 0x003C($sp)
    lui     $at, 0x1300                # $at = 13000000
    ori     $at, $at, 0x00FF           # $at = 130000FF
    jal     func_800CAA70
    or      a0, a0, $at                # a0 = 130000FF
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
    addiu   $sp, $sp, 0x0050           # $sp += 0x50


func_800C77D0:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    or      a1, a0, $zero              # a1 = 00000000
    andi    v0, a1, 0x00FF             # v0 = 00000000
    lui     $at, 0x1000                # $at = 10000000
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0020($sp)
    ori     $at, $at, 0x00FF           # $at = 100000FF
    sll     v0, v0, 16
    or      a0, v0, $at                # a0 = 100000FF
    jal     func_800CAA70
    sw      v0, 0x001C($sp)
    lw      a0, 0x001C($sp)
    lui     $at, 0x1100                # $at = 11000000
    ori     $at, $at, 0x00FF           # $at = 110000FF
    jal     func_800CAA70
    or      a0, a0, $at                # a0 = 110000FF
    lw      a0, 0x001C($sp)
    lui     $at, 0x1300                # $at = 13000000
    ori     $at, $at, 0x00FF           # $at = 130000FF
    jal     func_800CAA70
    or      a0, a0, $at                # a0 = 130000FF
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   a1, $zero, 0x0003          # a1 = 00000003
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    jal     func_800CACA4
    or      a3, $zero, $zero           # a3 = 00000000
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    jal     func_800CACA4
    or      a3, $zero, $zero           # a3 = 00000000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C785C:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    addiu   a0, $zero, 0x0002          # a0 = 00000002
    or      a1, $zero, $zero           # a1 = 00000000
    addiu   a2, $zero, 0x00FF          # a2 = 000000FF
    jal     func_800C9DA0
    addiu   a3, $zero, 0x0005          # a3 = 00000005
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C7888:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lui     a0, 0x8300                 # a0 = 83000000
    jal     func_800BB0BC
    or      a1, $zero, $zero           # a1 = 00000000
    lui     a0, 0x8301                 # a0 = 83010000
    jal     func_800BB0BC
    or      a1, $zero, $zero           # a1 = 00000000
    lui     a0, 0x8302                 # a0 = 83020000
    jal     func_800BB0BC
    or      a1, $zero, $zero           # a1 = 00000000
    lui     a0, 0x8303                 # a0 = 83030000
    jal     func_800BB0BC
    or      a1, $zero, $zero           # a1 = 00000000
    jal     func_800BB140
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C78D8:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800BBC40
    nop
    lw      $ra, 0x0014($sp)
    sll     v0, v0, 24
    sra     v0, v0, 24
    jr      $ra
    addiu   $sp, $sp, 0x0018           # $sp += 0x18


func_800C78FC:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800C7888
    nop
    jal     func_800BB140
    nop
lbl_800C7914:
    jal     func_800C78D8
    nop
    bne     v0, $zero, lbl_800C7914
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C7934:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800BB5E4
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C7954:
# MqDbg: 
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f0                   # $f0 = 1.00
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x192C($at)         # 8010192C
    lui     $at, 0x8012                # $at = 80120000
    swc1    $f0, 0x1DC0($at)           # 80121DC0
    lui     $at, 0x8012                # $at = 80120000
    swc1    $f0, 0x1DC8($at)           # 80121DC8
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x194C($at)         # 8010194C
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x1950($at)         # 80101950
    lui     $at, 0x8010                # $at = 80100000
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sb      $zero, 0x1954($at)         # 80101954
    sw      $ra, 0x0014($sp)
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x1958($at)         # 80101958
    jal     func_800C2C90
    or      a0, $zero, $zero           # a0 = 00000000
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f0                   # $f0 = 1.00
    lui     v0, 0x8012                 # v0 = 80120000
    lui     v1, 0x8012                 # v1 = 80120000
    addiu   v1, v1, 0x1DE0             # v1 = 80121DE0
    addiu   v0, v0, 0x1DD0             # v0 = 80121DD0
    sw      $zero, 0x000C(v0)          # 80121DDC
    sw      $zero, 0x000C(v1)          # 80121DEC
    lui     $at, 0x8012                # $at = 80120000
    swc1    $f0, 0x0000(v0)            # 80121DD0
    swc1    $f0, 0x0000(v1)            # 80121DE0
    swc1    $f0, 0x1DF0($at)           # 80121DF0
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    lui     $at, 0x8012                # $at = 80120000
    sb      a2, 0x1DFC($at)            # 80121DFC
    lui     $at, 0x8012                # $at = 80120000
    sb      a2, 0x1DFD($at)            # 80121DFD
    lui     $at, 0x8012                # $at = 80120000
    sb      $zero, 0x1DFE($at)         # 80121DFE
    lui     t7, 0x8010                 # t7 = 80100000
    lbu     t7, 0x43C0(t7)             # 801043C0
    lui     $at, 0x8012                # $at = 80120000
    sb      $zero, 0x1DFF($at)         # 80121DFF
    lui     $at, 0x8012                # $at = 80120000
    addiu   t6, $zero, 0x00FF          # t6 = 000000FF
    lui     t8, 0x8010                 # t8 = 80100000
    sb      t6, 0x1E00($at)            # 80121E00
    addu    t8, t8, t7
    lb      t8, 0x19D4(t8)             # 801019D4
    lui     $at, 0x8012                # $at = 80120000
    sb      $zero, 0x1F08($at)         # 80121F08
    lui     $at, 0x8010                # $at = 80100000
    sb      t8, 0x1920($at)            # 80101920
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x1918($at)         # 80101918
    lui     $at, 0x8010                # $at = 80100000
    ori     t9, $zero, 0xFFFF          # t9 = 0000FFFF
    sh      t9, 0x1938($at)            # 80101938
    lui     a0, 0x4600                 # a0 = 46000000
    jal     func_800BB0E0
    addiu   a1, $zero, 0xFFFF          # a1 = FFFFFFFF
    lui     $at, 0x8010                # $at = 80100000
    sw      $zero, 0x195C($at)         # 8010195C
    lui     $at, 0x8012                # $at = 80120000
    sb      $zero, 0x1F0B($at)         # 80121F0B
    lw      $ra, 0x0014($sp)
    lui     $at, 0x8012                # $at = 80120000
    addiu   t0, $zero, 0x0001          # t0 = 00000001
    sb      t0, 0x1F0A($at)            # 80121F0A
    lui     $at, 0x8012                # $at = 80120000
    sb      $zero, 0x1F09($at)         # 80121F09
    jr      $ra
    addiu   $sp, $sp, 0x0018           # $sp += 0x18


func_800C7A78:
# MqDbg: 
    addiu   $sp, $sp, 0xFFC0           # $sp -= 0x40
    lui     t6, 0x8012                 # t6 = 80120000
    lhu     t6, 0x4E54(t6)             # 80124E54
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    addiu   $at, $zero, 0x0001         # $at = 00000001
    andi    s1, a0, 0x00FF             # s1 = 00000000
    andi    s2, a1, 0x00FF             # s2 = 00000000
    sw      $ra, 0x002C($sp)
    sw      s4, 0x0028($sp)
    sw      s3, 0x0024($sp)
    sw      s0, 0x0018($sp)
    sw      a0, 0x0040($sp)
    sw      a1, 0x0044($sp)
    beq     t6, $at, lbl_800C7ACC
    sw      a2, 0x0048($sp)
    lui     a1, 0xF000                 # a1 = F0000000
    ori     a1, a1, 0x00FF             # a1 = F00000FF
    jal     func_800CAB80
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    bne     v0, $zero, lbl_800C7B6C
lbl_800C7ACC:
    sll     t7, s1,  8
    addu    t8, t7, s2
    addiu   $at, $zero, 0x0101         # $at = 00000101
    or      s0, s1, $zero              # s0 = 00000000
    bne     t8, $at, lbl_800C7B04
    or      a1, s2, $zero              # a1 = 00000000
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    jal     func_800CAB18
    sw      s2, 0x0034($sp)
    addiu   $at, $zero, 0x002F         # $at = 0000002F
    beq     v0, $at, lbl_800C7B04
    lw      a1, 0x0034($sp)
    lui     $at, 0x8012                # $at = 80120000
    sb      $zero, 0x1F08($at)         # 80121F08
lbl_800C7B04:
    sra     v0, s0,  4
    andi    a0, s0, 0x000F             # a0 = 00000000
    andi    t9, v0, 0x00FF             # t9 = 00000000
    andi    v1, v0, 0x00FF             # v1 = 00000000
    bne     t9, $zero, lbl_800C7B20
    andi    a2, a0, 0x00FF             # a2 = 00000000
    andi    v1, a0, 0x00FF             # v1 = 00000000
lbl_800C7B20:
    andi    t0, a0, 0x00FF             # t0 = 00000000
    slt     $at, t0, v1
    bne     $at, $zero, lbl_800C7B6C
    andi    s0, v1, 0x00FF             # s0 = 00000000
    sll     s3, a1, 16
    lui     $at, 0x8000                # $at = 80000000
    or      s3, s3, $at                # s3 = 80000000
    or      s2, a2, $zero              # s2 = 00000000
    or      s1, s0, $zero              # s1 = 00000000
    lbu     s4, 0x004B($sp)
lbl_800C7B48:
    sll     t1, s1,  8
    or      t2, s3, t1                 # t2 = 80000000
    jal     func_800CAA70
    or      a0, t2, s4                 # a0 = 80000000
    addiu   s0, s0, 0x0001             # s0 = 00000001
    andi    s0, s0, 0x00FF             # s0 = 00000001
    slt     $at, s2, s0
    beq     $at, $zero, lbl_800C7B48
    or      s1, s0, $zero              # s1 = 00000001
lbl_800C7B6C:
    lw      $ra, 0x002C($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    lw      s3, 0x0024($sp)
    lw      s4, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0040           # $sp += 0x40


func_800C7B8C:
# MqDbg: 
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      s0, 0x0014($sp)
    andi    s0, a0, 0xFFFF             # s0 = 00000000
    sw      $ra, 0x0024($sp)
    sw      s1, 0x0018($sp)
    sw      a0, 0x0028($sp)
    andi    s1, a1, 0xFFFF             # s1 = 00000000
    sw      s3, 0x0020($sp)
    sw      s2, 0x001C($sp)
    sw      a1, 0x002C($sp)
    jal     func_800CAB18
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   $at, $zero, 0x004C         # $at = 0000004C
    bne     v0, $at, lbl_800C7BD8
    lui     a0, 0x7000                 # a0 = 70000000
    jal     func_800C4C84
    addiu   a0, $zero, 0x000F          # a0 = 0000000F
    b       lbl_800C7C78
    lw      $ra, 0x0024($sp)
lbl_800C7BD8:
    jal     func_800CAA70
    ori     a0, a0, 0x0001             # a0 = 00000001
    sra     a0, s0,  8
    andi    a0, a0, 0x00FF             # a0 = 00000000
    lui     $at, 0x7004                # $at = 70040000
    or      a0, a0, $at                # a0 = 70040000
    jal     func_800CAA70
    or      s3, s0, $zero              # s3 = 00000000
    or      a0, s3, $zero              # a0 = 00000000
    andi    a0, a0, 0x00FF             # a0 = 00000000
    lui     $at, 0x7005                # $at = 70050000
    jal     func_800CAA70
    or      a0, a0, $at                # a0 = 70050000
    or      a0, $zero, $zero           # a0 = 00000000
    or      a1, $zero, $zero           # a1 = 00000000
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    jal     func_800CACA4
    addiu   a3, $zero, 0x0001          # a3 = 00000001
    jal     func_800CAA70
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    or      s2, s1, $zero              # s2 = 00000000
    lui     s1, 0x8001                 # s1 = 80010000
    or      s0, $zero, $zero           # s0 = 00000000
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800C7C38:
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    sllv    v1, t6, v0
    and     t7, s2, v1
    bne     t7, $zero, lbl_800C7C60
    and     t8, s3, v1
    beq     t8, $zero, lbl_800C7C60
    sll     t9, v0,  8
    or      a0, t9, s1                 # a0 = 80010000
    jal     func_800CAA70
    ori     a0, a0, 0x0001             # a0 = 80010001
lbl_800C7C60:
    addiu   s0, s0, 0x0001             # s0 = 00000001
    andi    s0, s0, 0x00FF             # s0 = 00000001
    slti    $at, s0, 0x0010
    bne     $at, $zero, lbl_800C7C38
    or      v0, s0, $zero              # v0 = 00000001
    lw      $ra, 0x0024($sp)
lbl_800C7C78:
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28


func_800C7C90:
# MqDbg: 
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    lui     v0, 0x8012                 # v0 = 80120000
    lhu     v0, 0x4E54(v0)             # 80124E54
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    ori     $at, $zero, 0xFFFF         # $at = 0000FFFF
    andi    s1, a0, 0x00FF             # s1 = 00000000
    sw      $ra, 0x002C($sp)
    sw      s4, 0x0028($sp)
    sw      s3, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      a0, 0x0030($sp)
    beq     v0, $at, lbl_800C7CE0
    or      s0, $zero, $zero           # s0 = 00000000
    andi    t7, v0, 0x00FF             # t7 = 00000000
    lui     t8, 0x8010                 # t8 = 80100000
    addu    t8, t8, t7
    lbu     t8, 0x1964(t8)             # 80101964
    andi    t9, t8, 0x0080             # t9 = 00000000
    bne     t9, $zero, lbl_800C7DB4
lbl_800C7CE0:
    sll     t0, s1,  2
    subu    t0, t0, s1
    sll     t0, t0,  2
    lui     s3, 0x8010                 # s3 = 80100000
    addu    t0, t0, s1
    addiu   s3, s3, 0x19E8             # s3 = 801019E8
    sll     t0, t0,  3
    addu    v0, s3, t0
    lhu     a0, 0x0000(v0)             # 80120000
    jal     func_800C7B8C
    lhu     a1, 0x0002(v0)             # 80120002
    sll     t1, s1,  2
    subu    t1, t1, s1
    sll     t1, t1,  2
    addu    t1, t1, s1
    sll     t1, t1,  3
    addu    s2, s3, t1
    lbu     t2, 0x0004(s2)             # 00000004
    addiu   s4, $zero, 0x00FF          # s4 = 000000FF
    addu    t3, s2, s0
    beq     s4, t2, lbl_800C7D9C
    lui     s3, 0x8000                 # s3 = 80000000
    lbu     s1, 0x0004(t3)             # 00000004
    addiu   s0, s0, 0x0001             # s0 = 00000001
lbl_800C7D40:
    andi    s0, s0, 0x00FF             # s0 = 00000001
    addu    t4, s2, s0
    lbu     v1, 0x0004(t4)             # 00000004
    addiu   s0, s0, 0x0001             # s0 = 00000002
    andi    s0, s0, 0x00FF             # s0 = 00000002
    andi    v0, s1, 0x00FF             # v0 = 00000000
    addu    t5, s2, s0
    sll     t6, v1, 16
    lbu     a1, 0x0004(t5)             # 00000004
    or      t7, t6, s3                 # t7 = 80000000
    sll     t8, v0,  8
    addiu   s0, s0, 0x0001             # s0 = 00000003
    or      t9, t7, t8                 # t9 = 80000000
    andi    s0, s0, 0x00FF             # s0 = 00000003
    jal     func_800CAA70
    or      a0, t9, a1                 # a0 = 80000000
    addu    t0, s2, s0
    lbu     s1, 0x0004(t0)             # 00000004
    slti    $at, s0, 0x0064
    beq     s4, s1, lbl_800C7D9C
    nop
    bnel    $at, $zero, lbl_800C7D40
    addiu   s0, s0, 0x0001             # s0 = 00000004
lbl_800C7D9C:
    lui     a0, 0x8010                 # a0 = 80100000
    lbu     a0, 0x1914(a0)             # 80101914
    lui     $at, 0x8007                # $at = 80070000
    ori     $at, $at, 0x0D00           # $at = 80070D00
    jal     func_800CAA70
    or      a0, a0, $at                # a0 = 80170D00
lbl_800C7DB4:
    lw      $ra, 0x002C($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    lw      s3, 0x0024($sp)
    lw      s4, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030           # $sp += 0x30


func_800C7DD4:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    or      a0, $zero, $zero           # a0 = 00000000
    jal     func_800B8654
    or      a1, $zero, $zero           # a1 = 00000000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C7DF8:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800C7954
    nop
    jal     func_800C3D68
    nop
    jal     func_800C4C1C
    nop
    jal     func_800CB918
    nop
    jal     func_800C9BDC
    nop
    addiu   a0, $zero, 0x0002          # a0 = 00000002
    or      a1, $zero, $zero           # a1 = 00000000
    addiu   a2, $zero, 0x0070          # a2 = 00000070
    jal     func_800C9DA0
    addiu   a3, $zero, 0x000A          # a3 = 0000000A
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C7E4C:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    addiu   a0, $zero, 0x0002          # a0 = 00000002
    or      a1, $zero, $zero           # a1 = 00000000
    addiu   a2, $zero, 0x0070          # a2 = 00000070
    jal     func_800C9DA0
    addiu   a3, $zero, 0x0001          # a3 = 00000001
    lui     a0, 0xF200                 # a0 = F2000000
    jal     func_800BB0BC
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    jal     func_800BB140
    nop
    lui     a0, 0xF800                 # a0 = F8000000
    jal     func_800BB0BC
    or      a1, $zero, $zero           # a1 = 00000000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C7E98:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    lui     $at, 0x8010                # $at = 80100000
    sw      a0, 0x0018($sp)
    jal     func_800C7954
    sb      t6, 0x43C4($at)            # 801043C4
    jal     func_800C3D68
    nop
    jal     func_800C4C1C
    nop
    jal     func_800CB85C
    nop
    jal     func_800C9BDC
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C7EE4:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800CB85C
    nop
    lui     a0, 0xF200                 # a0 = F2000000
    jal     func_800BB0BC
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    jal     func_800C7954
    nop
    jal     func_800C4C1C
    nop
    addiu   a0, $zero, 0x0002          # a0 = 00000002
    or      a1, $zero, $zero           # a1 = 00000000
    addiu   a2, $zero, 0x0070          # a2 = 00000070
    jal     func_800C9DA0
    addiu   a3, $zero, 0x0001          # a3 = 00000001
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop
    nop
    nop
    nop


func_800C7F40:
# MqDbg: 
    sw      a0, 0x0000($sp)
    lui     a1, 0x8012                 # a1 = 80120000
    andi    a0, a0, 0xFFFF             # a0 = 00000000
    addiu   a1, a1, 0x4754             # a1 = 80124754
    or      v0, $zero, $zero           # v0 = 00000000
    addiu   a2, $zero, 0x0001          # a2 = 00000001
lbl_800C7F58:
    andi    t6, a0, 0x0001             # t6 = 00000000
    beq     t6, $zero, lbl_800C7F70
    or      v1, a0, $zero              # v1 = 00000000
    addu    t7, a1, v0
    b       lbl_800C7F78
    sb      a2, 0x0000(t7)             # 00000000
lbl_800C7F70:
    addu    t8, a1, v0
    sb      $zero, 0x0000(t8)          # 00000000
lbl_800C7F78:
    addiu   v0, v0, 0x0001             # v0 = 00000001
    andi    v0, v0, 0x00FF             # v0 = 00000001
    slti    $at, v0, 0x0007
    sra     a0, v1,  1
    bne     $at, $zero, lbl_800C7F58
    andi    a0, a0, 0xFFFF             # a0 = 00000000
    jr      $ra
    nop


func_800C7F98:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      a0, 0x0018($sp)
    lui     v0, 0x8010                 # v0 = 80100000
    lbu     t7, 0x001B($sp)
    addiu   v0, v0, 0x4390             # v0 = 80104390
    lhu     t6, 0x0000(v0)             # 80104390
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    sllv    t9, t8, t7
    sw      $ra, 0x0014($sp)
    or      t0, t6, t9                 # t0 = 00000000
    sh      t0, 0x0000(v0)             # 80104390
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   a1, $zero, 0x0002          # a1 = 00000002
    addiu   a2, $zero, 0x0040          # a2 = 00000040
    jal     func_800CACA4
    addiu   a3, $zero, 0x000F          # a3 = 0000000F
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    addiu   a1, $zero, 0x0002          # a1 = 00000002
    addiu   a2, $zero, 0x0040          # a2 = 00000040
    jal     func_800CACA4
    addiu   a3, $zero, 0x000F          # a3 = 0000000F
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C7FFC:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    lui     v0, 0x8010                 # v0 = 80100000
    addiu   v0, v0, 0x4390             # v0 = 80104390
    sw      a0, 0x0018($sp)
    lhu     t6, 0x0000(v0)             # 80104390
    andi    a0, a0, 0x00FF             # a0 = 00000000
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    sllv    t8, t7, a0
    xori    t9, t8, 0xFFFF             # t9 = FFFFFFFF
    and     t0, t6, t9
    andi    t1, t0, 0xFFFF             # t1 = 00000000
    sw      $ra, 0x0014($sp)
    bne     t1, $zero, lbl_800C805C
    sh      t0, 0x0000(v0)             # 80104390
    or      a0, $zero, $zero           # a0 = 00000000
    addiu   a1, $zero, 0x0002          # a1 = 00000002
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    jal     func_800CACA4
    addiu   a3, $zero, 0x000F          # a3 = 0000000F
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    addiu   a1, $zero, 0x0002          # a1 = 00000002
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    jal     func_800CACA4
    addiu   a3, $zero, 0x000F          # a3 = 0000000F
lbl_800C805C:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800C806C:
# MqDbg: 
# Global Play Sfx?
# A0 = SFX ID
# A1 = ?
# A2 = ?
# A3 = ?
    sw      a0, 0x0000($sp)
    andi    a0, a0, 0xFFFF             # a0 = 00000000
    sra     t6, a0, 12
    andi    t7, t6, 0x00FF             # t7 = 00000000
    lui     t8, 0x8012                 # t8 = 80120000
    addu    t8, t8, t7
    lbu     t8, 0x4754(t8)             # 80124754
    sw      a2, 0x0008($sp)
    andi    a2, a2, 0x00FF             # a2 = 00000000
    bne     t8, $zero, lbl_800C80E4
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x4360             # v1 = 80104360
    lbu     t9, 0x0000(v1)             # 80104360
    lui     t1, 0x8012                 # t1 = 80120000
    addiu   t1, t1, 0x2E90             # t1 = 80122E90
    sll     t0, t9,  2
    subu    t0, t0, t9
    sll     t0, t0,  3
    addu    v0, t0, t1
    sh      a0, 0x0000(v0)             # 00000000
    sw      a1, 0x0004(v0)             # 00000004
    sb      a2, 0x0008(v0)             # 00000008
    sw      a3, 0x000C(v0)             # 0000000C
    lw      t2, 0x0010($sp)
    sw      t2, 0x0010(v0)             # 00000010
    lw      t3, 0x0014($sp)
    sw      t3, 0x0014(v0)             # 00000014
    lbu     t4, 0x0000(v1)             # 80104360
    addiu   t5, t4, 0x0001             # t5 = 00000001
    sb      t5, 0x0000(v1)             # 80104360
lbl_800C80E4:
    jr      $ra
    nop


func_800C80EC:
# MqDbg: 
    lui     v0, 0x8010                 # v0 = 80100000
    lui     v1, 0x8010                 # v1 = 80100000
    lbu     v0, 0x4364(v0)             # 80104364
    lbu     v1, 0x4360(v1)             # 80104360
    sw      a0, 0x0000($sp)
    andi    a0, a0, 0x00FF             # a0 = 00000000
    beq     v1, v0, lbl_800C8284
    or      a3, a1, $zero              # a3 = 00000000
    lui     t0, 0x8012                 # t0 = 80120000
    addiu   t0, t0, 0x2E90             # t0 = 80122E90
    or      a2, a0, $zero              # a2 = 00000000
    addiu   t1, $zero, 0x0018          # t1 = 00000018
    sltiu   $at, a2, 0x0006
lbl_800C8120:
    beq     $at, $zero, lbl_800C8254
    or      a0, $zero, $zero           # a0 = 00000000
    sll     t6, a2,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t6
    lw      t6, -0x5EF0($at)           # 8010A110
    jr      t6
    nop
    multu   v0, t1
    lhu     t7, 0x0028(a3)             # 00000028
    andi    t8, t7, 0xF000             # t8 = 00000000
    mflo    t9
    addu    t2, t0, t9
    lhu     t3, 0x0000(t2)             # 00000000
    andi    t4, t3, 0xF000             # t4 = 00000000
    bne     t8, t4, lbl_800C8254
    nop
    b       lbl_800C8254
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    multu   v0, t1
    lhu     t6, 0x0028(a3)             # 00000028
    andi    t7, t6, 0xF000             # t7 = 00000000
    mflo    t5
    addu    a1, t0, t5
    lhu     t9, 0x0000(a1)             # 00000000
    andi    t2, t9, 0xF000             # t2 = 00000000
    bne     t7, t2, lbl_800C8254
    nop
    lw      t3, 0x0000(a3)             # 00000000
    lw      t8, 0x0004(a1)             # 00000004
    bne     t3, t8, lbl_800C8254
    nop
    b       lbl_800C8254
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    multu   v0, t1
    lw      t4, 0x0000(a3)             # 00000000
    mflo    t5
    addu    t6, t0, t5
    lw      t9, 0x0004(t6)             # 00000004
    bne     t4, t9, lbl_800C8254
    nop
    b       lbl_800C8254
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    multu   v0, t1
    lw      t2, 0x0000(a3)             # 00000000
    mflo    t7
    addu    a1, t0, t7
    lw      t3, 0x0004(a1)             # 00000004
    bne     t2, t3, lbl_800C8254
    nop
    lhu     t8, 0x0028(a3)             # 00000028
    lhu     t5, 0x0000(a1)             # 00000000
    bne     t8, t5, lbl_800C8254
    nop
    b       lbl_800C8254
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    multu   v0, t1
    lbu     t4, 0x000C(a3)             # 0000000C
    mflo    t6
    addu    a1, t0, t6
    lbu     t9, 0x0008(a1)             # 00000008
    bne     t4, t9, lbl_800C8254
    nop
    lhu     t7, 0x0028(a3)             # 00000028
    lhu     t2, 0x0000(a1)             # 00000000
    bne     t7, t2, lbl_800C8254
    nop
    b       lbl_800C8254
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    multu   v0, t1
    lhu     t3, 0x0028(a3)             # 00000028
    mflo    t8
    addu    t5, t0, t8
    lhu     t6, 0x0000(t5)             # 00000000
    bne     t3, t6, lbl_800C8254
    nop
    addiu   a0, $zero, 0x0001          # a0 = 00000001
lbl_800C8254:
    beql    a0, $zero, lbl_800C8278
    addiu   v0, v0, 0x0001             # v0 = 80100001
    multu   v0, t1
    lui     v1, 0x8010                 # v1 = 80100000
    mflo    t4
    addu    t9, t0, t4
    sh      $zero, 0x0000(t9)          # 00000000
    lbu     v1, 0x4360(v1)             # 80104360
    addiu   v0, v0, 0x0001             # v0 = 80100002
lbl_800C8278:
    andi    v0, v0, 0x00FF             # v0 = 00000002
    bnel    v1, v0, lbl_800C8120
    sltiu   $at, a2, 0x0006
lbl_800C8284:
    jr      $ra
    nop


func_800C828C:
# MqDbg: 
    addiu   $sp, $sp, 0xFFA0           # $sp -= 0x60
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x4364(t6)             # 80104364
    lui     t8, 0x8012                 # t8 = 80120000
    addiu   t8, t8, 0x2E90             # t8 = 80122E90
    sll     t7, t6,  2
    subu    t7, t7, t6
    sll     t7, t7,  3
    sw      $ra, 0x0034($sp)
    sw      s6, 0x0030($sp)
    sw      s5, 0x002C($sp)
    sw      s4, 0x0028($sp)
    sw      s3, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    addu    t2, t7, t8
    lhu     a3, 0x0000(t2)             # 00000000
    addiu   s1, $zero, 0x0080          # s1 = 00000080
    lui     t6, 0x8010                 # t6 = 80100000
    beq     a3, $zero, lbl_800C8700
    andi    s5, a3, 0xF000             # s5 = 00000000
    sra     s5, s5, 12
    andi    s5, s5, 0x00FF             # s5 = 00000000
    sll     t9, s5,  2
    addiu   t6, t6, 0x4368             # t6 = 80104368
    addu    t0, t9, t6
    lw      t3, 0x0000(t0)             # 00000000
    addiu   s6, $zero, 0x00FF          # s6 = 000000FF
    or      t4, $zero, $zero           # t4 = 00000000
    lbu     a1, 0x002D(t3)             # 0000002D
    beq     s6, a1, lbl_800C85C0
    or      v0, a1, $zero              # v0 = 00000000
    beq     a1, $zero, lbl_800C85C0
    addiu   s4, $zero, 0x0030          # s4 = 00000030
    lui     s3, 0x8010                 # s3 = 80100000
    addiu   s3, s3, 0x433C             # s3 = 8010433C
    lbu     s2, 0x004B($sp)
lbl_800C8324:
    multu   a1, s4
    lw      t8, 0x0004(t2)             # 00000004
    mflo    t7
    addu    s0, t3, t7
    lw      t9, 0x0000(s0)             # 00000000
    bne     t8, t9, lbl_800C8590
    nop
    lhu     a3, 0x0000(t2)             # 00000000
    sra     t6, a3, 12
    andi    t7, t6, 0x00FF             # t7 = 00000068
    sll     t8, t7,  2
    addu    t9, s3, t8
    lw      t5, 0x0000(t9)             # 00000000
    andi    $ra, a3, 0x01FF            # $ra = 00000000
    sll     $ra, $ra,  2
    addu    a2, t5, $ra
    lhu     t6, 0x0002(a2)             # 00000002
    andi    t7, t6, 0x0020             # t7 = 00000020
    beq     t7, $zero, lbl_800C8384
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t8, 0x0000(a2)             # 00000000
    lbu     t9, 0x0024(s0)             # 00000024
    beql    t8, t9, lbl_800C8704
    lw      $ra, 0x0034($sp)
lbl_800C8384:
    lbu     t6, 0x438C(t6)             # 8010438C
    lui     v0, 0x8010                 # v0 = 80100000
    lhu     v1, 0x0028(s0)             # 00000028
    sll     t7, t6,  3
    subu    t7, t7, t6
    addu    t8, t7, s5
    addu    v0, v0, t8
    lbu     v0, 0x18A4(v0)             # 801018A4
    bne     a3, v1, lbl_800C83B8
    or      t1, v0, $zero              # t1 = 80100000
    andi    t4, v0, 0x00FF             # t4 = 00000000
    b       lbl_800C8450
    or      v1, t4, $zero              # v1 = 00000000
lbl_800C83B8:
    bne     t4, $zero, lbl_800C83EC
    andi    a0, v1, 0xFFFF             # a0 = 00000000
    sra     t9, a0, 12
    andi    t6, t9, 0x00FF             # t6 = 00000000
    sll     t7, t6,  2
    addu    t8, s3, t7
    lw      t9, 0x0000(t8)             # 80122E90
    andi    t6, a0, 0x01FF             # t6 = 00000000
    sll     t7, t6,  2
    addu    t8, t9, t7
    andi    s1, a1, 0x00FF             # s1 = 00000000
    b       lbl_800C8424
    lbu     s2, 0x0000(t8)             # 80122E90
lbl_800C83EC:
    lbu     t6, 0x0024(s0)             # 00000024
    andi    a0, v1, 0xFFFF             # a0 = 00000000
    sra     t9, a0, 12
    slt     $at, t6, s2
    beq     $at, $zero, lbl_800C8424
    andi    t7, t9, 0x00FF             # t7 = 00000000
    sll     t8, t7,  2
    addu    t6, s3, t8
    lw      t9, 0x0000(t6)             # 00000000
    andi    t7, a0, 0x01FF             # t7 = 00000000
    sll     t8, t7,  2
    addu    t6, t9, t8
    andi    s1, a1, 0x00FF             # s1 = 00000000
    lbu     s2, 0x0000(t6)             # 00000000
lbl_800C8424:
    addiu   t4, t4, 0x0001             # t4 = 00000001
    andi    t4, t4, 0x00FF             # t4 = 00000001
    bne     t4, t1, lbl_800C8450
    or      v1, t4, $zero              # v1 = 00000001
    lbu     t7, 0x0000(a2)             # 00000000
    or      a1, $zero, $zero           # a1 = 00000000
    slt     $at, t7, s2
    bne     $at, $zero, lbl_800C8450
    nop
    b       lbl_800C8450
    andi    a1, s1, 0x00FF             # a1 = 00000000
lbl_800C8450:
    bne     v1, t1, lbl_800C8590
    sll     v0, a1,  2
    subu    v0, v0, a1
    sll     v0, v0,  4
    andi    t9, a3, 0x0C00             # t9 = 00000000
    addu    v1, t5, $ra
    bne     t9, $zero, lbl_800C8488
    addu    s0, t3, v0
    lhu     t8, 0x0002(v1)             # 00000003
    andi    t6, t8, 0x0004             # t6 = 00000000
    bnel    t6, $zero, lbl_800C848C
    lhu     t7, 0x0026(s0)             # 00000026
    bnel    s1, a1, lbl_800C8574
    lbu     t6, 0x002A(s0)             # 0000002A
lbl_800C8488:
    lhu     t7, 0x0026(s0)             # 00000026
lbl_800C848C:
    andi    t9, t7, 0x0008             # t9 = 00000000
    beql    t9, $zero, lbl_800C84E4
    lbu     t7, 0x0008(t2)             # 00000008
    lbu     t8, 0x002A(s0)             # 0000002A
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beql    t8, $at, lbl_800C84E4
    lbu     t7, 0x0008(t2)             # 00000008
    lbu     a0, 0x002E(s0)             # 0000002E
    sb      t4, 0x005D($sp)
    sw      t2, 0x0058($sp)
    sw      t0, 0x0040($sp)
    sw      v1, 0x0050($sp)
    jal     func_800C7FFC
    sw      v0, 0x0038($sp)
    lw      t0, 0x0040($sp)
    lw      v0, 0x0038($sp)
    lw      v1, 0x0050($sp)
    lw      t6, 0x0000(t0)             # 00000000
    lw      t2, 0x0058($sp)
    lbu     t4, 0x005D($sp)
    addu    s0, t6, v0
    lbu     t7, 0x0008(t2)             # 00000008
lbl_800C84E4:
    sb      t7, 0x000C(s0)             # 0000000C
    lw      t8, 0x0000(t0)             # 00000000
    lhu     t9, 0x0000(t2)             # 00000000
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    addu    t6, t8, v0
    sh      t9, 0x0028(t6)             # 00000028
    lw      t8, 0x0000(t0)             # 00000000
    addiu   t6, $zero, 0x0002          # t6 = 00000002
    addu    t9, t8, v0
    sb      t7, 0x002A(t9)             # 0000002A
    lw      t8, 0x0000(t0)             # 00000000
    addu    t7, t8, v0
    sb      t6, 0x002B(t7)             # 0000002C
    lw      t8, 0x0000(t0)             # 00000000
    lw      t9, 0x000C(t2)             # 0000000C
    addu    t6, t8, v0
    sw      t9, 0x0010(t6)             # 00000012
    lw      t8, 0x0000(t0)             # 00000000
    lw      t7, 0x0010(t2)             # 00000010
    addu    t9, t8, v0
    sw      t7, 0x0014(t9)             # 00000014
    lw      t8, 0x0000(t0)             # 00000000
    lw      t6, 0x0014(t2)             # 00000014
    addu    t7, t8, v0
    sw      t6, 0x0018(t7)             # 00000019
    lw      t8, 0x0000(t0)             # 00000000
    lhu     t9, 0x0002(v1)             # 00000002
    addu    t6, t8, v0
    sh      t9, 0x0026(t6)             # 00000028
    lw      t8, 0x0000(t0)             # 00000000
    lbu     t7, 0x0000(v1)             # 00000000
    addu    t9, t8, v0
    sb      t7, 0x0024(t9)             # 00000024
    b       lbl_800C858C
    lw      t3, 0x0000(t0)             # 00000000
    lbu     t6, 0x002A(s0)             # 0000002A
lbl_800C8574:
    addiu   $at, $zero, 0x0005         # $at = 00000005
    addiu   t8, $zero, 0x0004          # t8 = 00000004
    bnel    t6, $at, lbl_800C8590
    or      a1, $zero, $zero           # a1 = 00000000
    sb      t8, 0x002A(s0)             # 0000002A
    lw      t3, 0x0000(t0)             # 00000000
lbl_800C858C:
    or      a1, $zero, $zero           # a1 = 00000000
lbl_800C8590:
    beq     a1, $zero, lbl_800C85AC
    or      v0, a1, $zero              # v0 = 00000000
    multu   a1, s4
    mflo    t7
    addu    t9, t3, t7
    lbu     a1, 0x002D(t9)             # 0000002D
    or      v0, a1, $zero              # v0 = 00000000
lbl_800C85AC:
    beq     s6, v0, lbl_800C85C0
    nop
    bne     v0, $zero, lbl_800C8324
    nop
    sb      s2, 0x004B($sp)
lbl_800C85C0:
    lui     t6, 0x8012                 # t6 = 80120000
    addiu   t6, t6, 0x4698             # t6 = 80124698
    addu    a2, s5, t6
    lbu     t1, 0x0000(a2)             # 00000000
    addiu   s4, $zero, 0x0030          # s4 = 00000030
    lui     s3, 0x8010                 # s3 = 80100000
    multu   t1, s4
    addiu   s3, s3, 0x433C             # s3 = 8010433C
    mflo    t8
    addu    t7, t3, t8
    lbu     t9, 0x002D(t7)             # 0000002E
    beql    s6, t9, lbl_800C8704
    lw      $ra, 0x0034($sp)
    beq     v0, $zero, lbl_800C8700
    andi    a1, t1, 0x00FF             # a1 = 00000000
    multu   a1, s4
    lw      t8, 0x0004(t2)             # 00000004
    addiu   a1, $zero, 0x00FF          # a1 = 000000FF
    mflo    t6
    addu    v0, t3, t6
    sw      t8, 0x0000(v0)             # 00000000
    lw      t7, 0x0004(t2)             # 00000004
    addiu   t9, t7, 0x0004             # t9 = 00000005
    sw      t9, 0x0004(v0)             # 00000004
    lw      t6, 0x0004(t2)             # 00000004
    addiu   t8, t6, 0x0008             # t8 = 801246A0
    sw      t8, 0x0008(v0)             # 00000008
    lbu     t7, 0x0008(t2)             # 00000008
    sb      t7, 0x000C(v0)             # 0000000C
    lw      t9, 0x000C(t2)             # 0000000C
    sw      t9, 0x0010(v0)             # 00000010
    lw      t6, 0x0010(t2)             # 00000010
    sw      t6, 0x0014(v0)             # 00000014
    lw      t8, 0x0014(t2)             # 00000014
    sw      t8, 0x0018(v0)             # 00000018
    lhu     a3, 0x0000(t2)             # 00000000
    sra     t7, a3, 12
    andi    t9, t7, 0x00FF             # t9 = 00000001
    sll     t6, t9,  2
    addu    t8, s3, t6
    lw      t7, 0x0000(t8)             # 801246A0
    andi    t9, a3, 0x01FF             # t9 = 00000000
    sll     t6, t9,  2
    addu    v1, t7, t6
    lhu     t8, 0x0002(v1)             # 00000002
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    sh      t8, 0x0026(v0)             # 00000026
    lbu     t9, 0x0000(v1)             # 00000000
    addiu   t8, $zero, 0x0002          # t8 = 00000002
    sb      t9, 0x0024(v0)             # 00000024
    lhu     t7, 0x0000(t2)             # 00000000
    lui     t9, 0x8012                 # t9 = 80120000
    addiu   t9, t9, 0x4690             # t9 = 80124690
    sb      t6, 0x002A(v0)             # 0000002A
    sb      t8, 0x002B(v0)             # 0000002B
    addu    a0, s5, t9
    sh      t7, 0x0028(v0)             # 00000028
    lbu     t7, 0x0000(a0)             # 00000000
    sb      t7, 0x002C(v0)             # 0000002C
    lbu     t9, 0x0000(a0)             # 00000000
    lw      t8, 0x0000(t0)             # 00000000
    lbu     t6, 0x0000(a2)             # 00000000
    multu   t9, s4
    mflo    t7
    addu    t9, t8, t7
    sb      t6, 0x002D(t9)             # 801246BD
    lbu     t1, 0x0000(a2)             # 00000000
    lw      t3, 0x0000(t0)             # 00000000
    multu   t1, s4
    sb      t1, 0x0000(a0)             # 00000000
    mflo    t8
    addu    t7, t3, t8
    lbu     t6, 0x002D(t7)             # 0000002E
    andi    t9, t6, 0x00FF             # t9 = 00000001
    multu   t9, s4
    sb      t6, 0x0000(a2)             # 00000000
    mflo    t8
    addu    t7, t3, t8
    sb      a1, 0x002C(t7)             # 0000002D
    sb      a1, 0x002D(v0)             # 0000002D
lbl_800C8700:
    lw      $ra, 0x0034($sp)
lbl_800C8704:
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    lw      s3, 0x0024($sp)
    lw      s4, 0x0028($sp)
    lw      s5, 0x002C($sp)
    lw      s6, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0060           # $sp += 0x60


func_800C8728:
# MqDbg: 
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      a1, 0x0034($sp)
    lbu     t8, 0x0037($sp)
    addiu   t3, $zero, 0x0030          # t3 = 00000030
    sw      s0, 0x0018($sp)
    multu   t8, t3
    andi    s0, a0, 0x00FF             # s0 = 00000000
    lui     t7, 0x8010                 # t7 = 80100000
    addiu   t7, t7, 0x4368             # t7 = 80104368
    sll     t6, s0,  2
    addu    t2, t6, t7
    lw      t1, 0x0000(t2)             # 00000000
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0030($sp)
    mflo    t9
    addu    a2, t1, t9
    lhu     t4, 0x0026(a2)             # 00000026
    andi    t5, t4, 0x0008             # t5 = 00000000
    beq     t5, $zero, lbl_800C8798
    nop
    lbu     a0, 0x002E(a2)             # 0000002E
    sw      t2, 0x0024($sp)
    jal     func_800C7FFC
    sw      a2, 0x002C($sp)
    lw      t2, 0x0024($sp)
    lw      a2, 0x002C($sp)
    addiu   t3, $zero, 0x0030          # t3 = 00000030
    lw      t1, 0x0000(t2)             # 00000000
lbl_800C8798:
    lui     t6, 0x8012                 # t6 = 80120000
    addiu   t6, t6, 0x4690             # t6 = 80124690
    addu    v0, s0, t6
    lbu     t7, 0x0000(v0)             # 00000000
    lbu     t0, 0x0037($sp)
    bnel    t0, t7, lbl_800C87C4
    lbu     t4, 0x002D(a2)             # 0000002D
    lbu     t8, 0x002C(a2)             # 0000002C
    b       lbl_800C87DC
    sb      t8, 0x0000(v0)             # 00000000
    lbu     t4, 0x002D(a2)             # 0000002D
lbl_800C87C4:
    lbu     t9, 0x002C(a2)             # 0000002C
    multu   t4, t3
    mflo    t5
    addu    t6, t1, t5
    sb      t9, 0x002C(t6)             # 801246BC
    lw      t1, 0x0000(t2)             # 00000000
lbl_800C87DC:
    lbu     t8, 0x002C(a2)             # 0000002C
    lbu     t7, 0x002D(a2)             # 0000002D
    lui     t9, 0x8012                 # t9 = 80120000
    multu   t8, t3
    addiu   t9, t9, 0x4698             # t9 = 80124698
    addu    v1, s0, t9
    addiu   a3, $zero, 0x00FF          # a3 = 000000FF
    lui     a0, 0x8010                 # a0 = 80100000
    or      v0, $zero, $zero           # v0 = 00000000
    mflo    t4
    addu    t5, t1, t4
    sb      t7, 0x002D(t5)             # 0000002D
    lbu     t6, 0x0000(v1)             # 00000000
    sb      a3, 0x002C(a2)             # 0000002C
    sb      t6, 0x002D(a2)             # 0000002D
    lbu     t7, 0x0000(v1)             # 00000000
    lw      t4, 0x0000(t2)             # 00000000
    lbu     t8, 0x0037($sp)
    multu   t7, t3
    lui     t7, 0x8010                 # t7 = 80100000
    mflo    t5
    addu    t9, t4, t5
    sb      t8, 0x002C(t9)             # 801246C4
    lbu     t6, 0x0037($sp)
    sll     t8, s0,  2
    subu    t8, t8, s0
    sb      t6, 0x0000(v1)             # 00000000
    sb      $zero, 0x002A(a2)          # 0000002A
    lbu     t7, 0x438C(t7)             # 8010438C
    lui     t9, 0x8012                 # t9 = 80120000
    addiu   t9, t9, 0x46A8             # t9 = 801246A8
    sll     t4, t7,  3
    subu    t4, t4, t7
    addu    t5, t4, s0
    addu    a0, a0, t5
    lbu     a0, 0x1888(a0)             # 80101888
    sll     t8, t8,  3
    addu    a2, t8, t9
    blez    a0, lbl_800C88AC
    or      a1, a0, $zero              # a1 = 80100000
    sll     t6, v0,  3
lbl_800C8880:
    addu    v1, a2, t6
    lbu     t7, 0x0004(v1)             # 00000004
    bnel    t0, t7, lbl_800C889C
    addiu   v0, v0, 0x0001             # v0 = 00000001
    sb      a3, 0x0004(v1)             # 00000004
    andi    v0, a0, 0x00FF             # v0 = 00000000
    addiu   v0, v0, 0x0001             # v0 = 00000001
lbl_800C889C:
    andi    v0, v0, 0x00FF             # v0 = 00000001
    slt     $at, v0, a1
    bnel    $at, $zero, lbl_800C8880
    sll     t6, v0,  3
lbl_800C88AC:
    lw      $ra, 0x001C($sp)
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop


func_800C88C0:
# MqDbg: 
    addiu   $sp, $sp, 0xFF68           # $sp -= 0x98
    sw      s4, 0x0028($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    lui     v0, 0x7FFF                 # v0 = 7FFF0000
    sw      $ra, 0x003C($sp)
    sw      s8, 0x0038($sp)
    sw      s7, 0x0034($sp)
    sw      s6, 0x0030($sp)
    sw      s5, 0x002C($sp)
    sw      s3, 0x0024($sp)
    sw      s0, 0x0018($sp)
    sw      a0, 0x0098($sp)
    or      s2, $zero, $zero           # s2 = 00000000
    ori     v0, v0, 0xFFFF             # v0 = 7FFFFFFF
    addiu   s1, $sp, 0x006C            # s1 = FFFFFFD4
    addiu   s4, $zero, 0x00FF          # s4 = 000000FF
    or      t3, $zero, $zero           # t3 = 00000000
lbl_800C8908:
    sll     t6, t3,  3
    addiu   t3, t3, 0x0001             # t3 = 00000001
    andi    t3, t3, 0x00FF             # t3 = 00000001
    slti    $at, t3, 0x0003
    addu    a3, s1, t6
    sw      v0, 0x0000(a3)             # 00000000
    bne     $at, $zero, lbl_800C8908
    sb      s4, 0x0004(a3)             # 00000004
    lbu     t7, 0x009B($sp)
    lui     t9, 0x8010                 # t9 = 80100000
    addiu   t9, t9, 0x4368             # t9 = 80104368
    sll     t8, t7,  2
    addu    s5, t8, t9
    lw      v1, 0x0000(s5)             # 00000000
    addiu   s7, $zero, 0x00FF          # s7 = 000000FF
    or      s0, $zero, $zero           # s0 = 00000000
    lbu     s3, 0x002D(v1)             # 0000002D
    addiu   s8, $zero, 0x0001          # s8 = 00000001
    addiu   s6, $zero, 0x0030          # s6 = 00000030
    beql    s7, s3, lbl_800C8D60
    addiu   s6, $zero, 0x0030          # s6 = 00000030
lbl_800C895C:
    multu   s3, s6
    mflo    a2
    addu    v0, v1, a2
    lbu     a0, 0x002A(v0)             # 80000029
    bnel    s8, a0, lbl_800C89A0
    lhu     t9, 0x0028(v0)             # 80000027
    lhu     t5, 0x0028(v0)             # 80000027
    andi    t6, t5, 0x0C00             # t6 = 00000000
    beql    t6, $zero, lbl_800C89A0
    lhu     t9, 0x0028(v0)             # 80000027
    lbu     t7, 0x002B(v0)             # 8000002A
    addiu   t8, t7, 0xFFFF             # t8 = FFFFFFFF
    sb      t8, 0x002B(v0)             # 8000002A
    lw      v1, 0x0000(s5)             # 00000000
    b       lbl_800C89E8
    addu    v0, v1, a2
    lhu     t9, 0x0028(v0)             # 80000027
lbl_800C89A0:
    addiu   $at, $zero, 0x0005         # $at = 00000005
    andi    t5, t9, 0x0C00             # t5 = 00000000
    bnel    t5, $zero, lbl_800C89EC
    lbu     t6, 0x002B(v0)             # 8000002A
    bne     a0, $at, lbl_800C89E8
    or      a1, $zero, $zero           # a1 = 00000000
    lbu     a0, 0x002E(v0)             # 8000002D
    lui     $at, 0x0602                # $at = 06020000
    sw      a2, 0x005C($sp)
    sll     a0, a0,  8
    jal     func_800BB0E0
    or      a0, a0, $at                # a0 = 06020000
    lbu     a0, 0x009B($sp)
    jal     func_800C8728
    andi    a1, s3, 0x00FF             # a1 = 00000000
    lw      a2, 0x005C($sp)
    lw      v1, 0x0000(s5)             # 00000000
    addu    v0, v1, a2
lbl_800C89E8:
    lbu     t6, 0x002B(v0)             # 0000002B
lbl_800C89EC:
    lbu     a0, 0x009B($sp)
    bnel    t6, $zero, lbl_800C8A0C
    lbu     t7, 0x002A(v0)             # 0000002A
    jal     func_800C8728
    andi    a1, s3, 0x00FF             # a1 = 00000000
    b       lbl_800C8D44
    lw      v1, 0x0000(s5)             # 00000000
    lbu     t7, 0x002A(v0)             # 0000002A
lbl_800C8A0C:
    addu    t2, v1, a2
    beq     t7, $zero, lbl_800C8D44
    nop
    lw      v0, 0x0000(t2)             # 00000000
    lui     t8, 0x8010                 # t8 = 80100000
    addiu   t8, t8, 0x4394             # t8 = 80104394
    bnel    t8, v0, lbl_800C8A3C
    lw      t9, 0x0004(t2)             # 00000004
    mtc1    $zero, $f4                 # $f4 = 0.00
    b       lbl_800C8A7C
    swc1    $f4, 0x001C(t2)            # 0000001C
    lw      t9, 0x0004(t2)             # 00000004
lbl_800C8A3C:
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f8                   # $f8 = 1.00
    lwc1    $f6, 0x0000(t9)            # 00000000
    lwc1    $f12, 0x0000(v0)           # 00000000
    lw      t5, 0x0008(t2)             # 00000008
    mul.s   $f0, $f6, $f8
    lui     $at, 0x4120                # $at = 41200000
    lwc1    $f2, 0x0000(t5)            # 00000000
    mul.s   $f10, $f12, $f12
    mtc1    $at, $f8                   # $f8 = 10.00
    mul.s   $f16, $f0, $f0
    add.s   $f18, $f10, $f16
    mul.s   $f4, $f2, $f2
    add.s   $f6, $f4, $f18
    div.s   $f10, $f6, $f8
    swc1    $f10, 0x001C(t2)           # 0000001C
lbl_800C8A7C:
    lhu     t6, 0x0026(t2)             # 00000026
    lbu     a1, 0x0024(t2)             # 00000024
    lui     $at, 0x4F00                # $at = 4F000000
    andi    t7, t6, 0x0010             # t7 = 00000000
    beq     t7, $zero, lbl_800C8AD0
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    subu    v0, s7, a1
    multu   v0, v0
    lwc1    $f0, 0x001C(t2)            # 0000001C
    mflo    t8
    sll     t9, t8,  2
    subu    t9, t9, t8
    sll     t9, t9,  2
    subu    t9, t9, t8
    sll     t9, t9,  2
    addu    t9, t9, t8
    sll     t9, t9,  3
    addu    t9, t9, t8
    sll     t9, t9,  4
    b       lbl_800C8C00
    sw      t9, 0x0020(t2)             # 00000020
lbl_800C8AD0:
    lwc1    $f0, 0x001C(t2)            # 0000001C
    mtc1    $at, $f16                  # $f16 = 2147484000.00
    lui     $at, 0x4EE0                # $at = 4EE00000
    c.lt.s  $f16, $f0
    nop
    bc1fl   lbl_800C8B00
    cfc1    t5, $f31
    mtc1    $at, $f4                   # $f4 = 1879048000.00
    nop
    swc1    $f4, 0x001C(t2)            # 0000001C
    lwc1    $f0, 0x001C(t2)            # 0000001C
    cfc1    t5, $f31
lbl_800C8B00:
    ctc1    t6, $f31
    lhu     v1, 0x0028(t2)             # 00000028
    subu    v0, s7, a1
    cvt.w.s $f18, $f0
    lui     $at, 0x4F00                # $at = 4F000000
    cfc1    t6, $f31
    nop
    andi    t6, t6, 0x0078             # t6 = 00000000
    beql    t6, $zero, lbl_800C8B70
    mfc1    t6, $f18
    mtc1    $at, $f18                  # $f18 = 2147484000.00
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    sub.s   $f18, $f0, $f18
    ctc1    t6, $f31
    nop
    cvt.w.s $f18, $f18
    cfc1    t6, $f31
    nop
    andi    t6, t6, 0x0078             # t6 = 00000000
    bne     t6, $zero, lbl_800C8B64
    nop
    mfc1    t6, $f18
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800C8B7C
    or      t6, t6, $at                # t6 = 80000000
lbl_800C8B64:
    b       lbl_800C8B7C
    addiu   t6, $zero, 0xFFFF          # t6 = FFFFFFFF
    mfc1    t6, $f18
lbl_800C8B70:
    nop
    bltz    t6, lbl_800C8B64
    nop
lbl_800C8B7C:
    multu   v0, v0
    ctc1    t5, $f31
    mtc1    $zero, $f6                 # $f6 = 0.00
    lui     $at, 0x40C0                # $at = 40C00000
    mflo    t7
    sll     t8, t7,  2
    subu    t8, t8, t7
    sll     t8, t8,  2
    subu    t8, t8, t7
    sll     t8, t8,  2
    addu    t8, t8, t7
    sll     t8, t8,  3
    addu    t8, t8, t7
    sll     t8, t8,  4
    addu    t9, t6, t8
    lw      t6, 0x0008(t2)             # 00000008
    addu    t5, t9, v1
    subu    t7, t5, v1
    sw      t7, 0x0020(t2)             # 00000020
    lwc1    $f2, 0x0000(t6)            # FFFFFFFF
    c.lt.s  $f2, $f6
    nop
    bc1f    lbl_800C8C00
    nop
    mtc1    $at, $f10                  # $f10 = 6.00
    neg.s   $f8, $f2
    lwc1    $f0, 0x001C(t2)            # 0000001C
    mul.s   $f16, $f8, $f10
    trunc.w.s $f4, $f16
    mfc1    t9, $f4
    nop
    addu    t7, t7, t9
    sw      t7, 0x0020(t2)             # 00000020
lbl_800C8C00:
    lui     $at, 0x8011                # $at = 80110000
    lwc1    $f18, -0x5ED8($at)         # 8010A128
    lui     t9, 0x8010                 # t9 = 80100000
    c.lt.s  $f18, $f0
    nop
    bc1f    lbl_800C8C70
    nop
    lbu     t6, 0x002A(t2)             # 0000002A
    addiu   $at, $zero, 0x0004         # $at = 00000004
    or      a1, $zero, $zero           # a1 = 00000000
    bnel    t6, $at, lbl_800C8D40
    andi    s0, s3, 0x00FF             # s0 = 00000000
    lbu     a0, 0x002E(t2)             # 0000002E
    lui     $at, 0x0602                # $at = 06020000
    sw      t2, 0x0084($sp)
    sll     a0, a0,  8
    jal     func_800BB0E0
    or      a0, a0, $at                # a0 = 06020000
    lw      t2, 0x0084($sp)
    lbu     a0, 0x009B($sp)
    lhu     t8, 0x0028(t2)             # 00000028
    andi    t5, t8, 0x0C00             # t5 = 00000000
    beql    t5, $zero, lbl_800C8D40
    andi    s0, s3, 0x00FF             # s0 = 00000000
    jal     func_800C8728
    andi    a1, s3, 0x00FF             # a1 = 00000000
    b       lbl_800C8D3C
    andi    s3, s0, 0x00FF             # s3 = 00000000
lbl_800C8C70:
    lbu     t9, 0x438C(t9)             # 0000438C
    lbu     t6, 0x009B($sp)
    lui     t4, 0x8010                 # t4 = 80100000
    sll     t7, t9,  3
    subu    t7, t7, t9
    addu    t8, t7, t6
    addu    t4, t4, t8
    lbu     t4, 0x1888(t4)             # 80101888
    or      t3, $zero, $zero           # t3 = 00000000
    andi    t1, t4, 0x00FF             # t1 = 00000000
    blez    t1, lbl_800C8D3C
    or      t0, t1, $zero              # t0 = 00000000
    sll     t5, t3,  3
lbl_800C8CA4:
    addu    a3, s1, t5
    lw      t9, 0x0000(a3)             # 00000000
    lw      v1, 0x0020(t2)             # 00000020
    addiu   v0, t0, 0xFFFF             # v0 = FFFFFFFF
    andi    a1, v0, 0x00FF             # a1 = 000000FF
    sltu    $at, t9, v1
    bne     $at, $zero, lbl_800C8D28
    or      a2, t3, $zero              # a2 = 00000000
    slt     $at, s2, t4
    beq     $at, $zero, lbl_800C8CD8
    andi    a0, v0, 0x00FF             # a0 = 000000FF
    addiu   s2, s2, 0x0001             # s2 = 00000001
    andi    s2, s2, 0x00FF             # s2 = 00000001
lbl_800C8CD8:
    slt     $at, a2, a0
    beq     $at, $zero, lbl_800C8D20
    andi    t3, t1, 0x00FF             # t3 = 00000000
    or      v1, a1, $zero              # v1 = 000000FF
lbl_800C8CE8:
    sll     t6, v1,  3
    addu    v0, s1, t6
    lw      t8, -0x0008(v0)            # FFFFFFF7
    sll     t7, a1,  3
    addu    a0, s1, t7
    addiu   a1, a1, 0xFFFF             # a1 = 000000FE
    sw      t8, 0x0000(a0)             # 000000FF
    lbu     t5, -0x0004(v0)            # FFFFFFFB
    andi    a1, a1, 0x00FF             # a1 = 000000FE
    slt     $at, a2, a1
    or      v1, a1, $zero              # v1 = 000000FE
    bne     $at, $zero, lbl_800C8CE8
    sb      t5, 0x0004(a0)             # 00000103
    lw      v1, 0x0020(t2)             # 00000020
lbl_800C8D20:
    sw      v1, 0x0000(a3)             # 00000000
    sb      s3, 0x0004(a3)             # 00000004
lbl_800C8D28:
    addiu   t3, t3, 0x0001             # t3 = 00000001
    andi    t3, t3, 0x00FF             # t3 = 00000001
    slt     $at, t3, t0
    bnel    $at, $zero, lbl_800C8CA4
    sll     t5, t3,  3
lbl_800C8D3C:
    andi    s0, s3, 0x00FF             # s0 = 00000000
lbl_800C8D40:
    lw      v1, 0x0000(s5)             # 00000000
lbl_800C8D44:
    multu   s0, s6
    mflo    t9
    addu    t7, v1, t9
    lbu     s3, 0x002D(t7)             # 0000002D
    bne     s7, s3, lbl_800C895C
    nop
    addiu   s6, $zero, 0x0030          # s6 = 00000030
lbl_800C8D60:
    addiu   s8, $zero, 0x0001          # s8 = 00000001
    or      t3, $zero, $zero           # t3 = 00000000
    blez    s2, lbl_800C8DD0
    or      a1, s2, $zero              # a1 = 00000001
    addiu   v1, $zero, 0x0003          # v1 = 00000003
    addiu   v0, $zero, 0x0002          # v0 = 00000002
    sll     t6, t3,  3
lbl_800C8D7C:
    addu    t8, s1, t6
    lbu     t5, 0x0004(t8)             # 00000004
    lw      t7, 0x0000(s5)             # 00000000
    addiu   t3, t3, 0x0001             # t3 = 00000001
    multu   t5, s6
    andi    t3, t3, 0x00FF             # t3 = 00000001
    addiu   $at, $zero, 0x0004         # $at = 00000004
    mflo    t9
    addu    t2, t9, t7
    lbu     a0, 0x002A(t2)             # 0000002A
    bne     s8, a0, lbl_800C8DB4
    nop
    b       lbl_800C8DC0
    sb      v0, 0x002A(t2)             # 0000002A
lbl_800C8DB4:
    bnel    a0, $at, lbl_800C8DC4
    slt     $at, t3, a1
    sb      v1, 0x002A(t2)             # 0000002A
lbl_800C8DC0:
    slt     $at, t3, a1
lbl_800C8DC4:
    bnel    $at, $zero, lbl_800C8D7C
    sll     t6, t3,  3
    or      t3, $zero, $zero           # t3 = 00000000
lbl_800C8DD0:
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x438C(t6)             # 8010438C
    lbu     v0, 0x009B($sp)
    lui     t1, 0x8010                 # t1 = 80100000
    sll     t8, t6,  3
    subu    t8, t8, t6
    addu    t5, t8, v0
    addu    t1, t1, t5
    lbu     t1, 0x1888(t1)             # 80101888
    sll     t9, v0,  2
    subu    t9, t9, v0
    blez    t1, lbl_800C8FD0
    or      t0, t1, $zero              # t0 = 80100000
    lui     t7, 0x8012                 # t7 = 80120000
    addiu   t7, t7, 0x46A8             # t7 = 801246A8
    sll     t9, t9,  3
    addu    a2, t9, t7
    addiu   t4, $zero, 0x0003          # t4 = 00000003
    sll     t6, t3,  3
lbl_800C8E1C:
    addu    s3, a2, t6
    lbu     a1, 0x0004(s3)             # 00000004
    or      v1, $zero, $zero           # v1 = 00000000
    bne     s7, a1, lbl_800C8E38
    or      v0, a1, $zero              # v0 = 00000001
    b       lbl_800C8F00
    addiu   v1, $zero, 0x0001          # v1 = 00000001
lbl_800C8E38:
    multu   a1, s6
    lw      t5, 0x0000(s5)             # 00000000
    addiu   $at, $zero, 0x0004         # $at = 00000004
    mflo    t8
    addu    t2, t8, t5
    lbu     a0, 0x002A(t2)             # 0000002A
    bne     a0, $at, lbl_800C8EAC
    nop
    lhu     t9, 0x0028(t2)             # 00000028
    lbu     a0, 0x009B($sp)
    addiu   t6, $zero, 0x0001          # t6 = 00000001
    andi    t7, t9, 0x0C00             # t7 = 00000000
    beql    t7, $zero, lbl_800C8EA4
    sb      t6, 0x002A(t2)             # 0000002A
    sw      a2, 0x005C($sp)
    sw      t0, 0x004C($sp)
    sb      t1, 0x0096($sp)
    jal     func_800C8728
    sb      t3, 0x0094($sp)
    lw      a2, 0x005C($sp)
    lw      t0, 0x004C($sp)
    lbu     t1, 0x0096($sp)
    lbu     t3, 0x0094($sp)
    addiu   t4, $zero, 0x0003          # t4 = 00000003
    b       lbl_800C8F00
    addiu   v1, $zero, 0x0001          # v1 = 00000001
    sb      t6, 0x002A(t2)             # 0000002A
lbl_800C8EA4:
    b       lbl_800C8F00
    addiu   v1, $zero, 0x0001          # v1 = 00000001
lbl_800C8EAC:
    bne     a0, $zero, lbl_800C8EC0
    nop
    sb      s4, 0x0004(s3)             # 00000004
    b       lbl_800C8F00
    addiu   v1, $zero, 0x0001          # v1 = 00000001
lbl_800C8EC0:
    blez    t0, lbl_800C8EF8
    or      a1, $zero, $zero           # a1 = 00000000
    sll     t8, a1,  3
lbl_800C8ECC:
    addu    a0, s1, t8
    lbu     t5, 0x0004(a0)             # 00000004
    bnel    v0, t5, lbl_800C8EE8
    addiu   a1, a1, 0x0001             # a1 = 00000001
    sb      s4, 0x0004(a0)             # 00000004
    andi    a1, t1, 0x00FF             # a1 = 00000000
    addiu   a1, a1, 0x0001             # a1 = 00000001
lbl_800C8EE8:
    andi    a1, a1, 0x00FF             # a1 = 00000001
    slt     $at, a1, t0
    bnel    $at, $zero, lbl_800C8ECC
    sll     t8, a1,  3
lbl_800C8EF8:
    addiu   s2, s2, 0xFFFF             # s2 = 00000000
    andi    s2, s2, 0x00FF             # s2 = 00000000
lbl_800C8F00:
    bne     s8, v1, lbl_800C8FBC
    or      t2, v1, $zero              # t2 = 00000001
    blez    t0, lbl_800C8FB0
    or      a1, $zero, $zero           # a1 = 00000000
    sll     t9, a1,  3
lbl_800C8F14:
    addu    a0, s1, t9
    lbu     a3, 0x0004(a0)             # 00000004
    beq     s7, a3, lbl_800C8F9C
    or      v0, a3, $zero              # v0 = 00000000
    multu   a3, s6
    lw      t7, 0x0000(s5)             # 00000000
    mflo    t6
    addu    t8, t7, t6
    lbu     t5, 0x002A(t8)             # 0000002A
    beql    t4, t5, lbl_800C8FA0
    addiu   a1, a1, 0x0001             # a1 = 00000001
    blez    t0, lbl_800C8F7C
    or      s0, $zero, $zero           # s0 = 00000000
    sll     t9, s0,  3
lbl_800C8F4C:
    addu    t7, a2, t9
    lbu     t6, 0x0004(t7)             # 00000004
    bnel    v0, t6, lbl_800C8F68
    addiu   s0, s0, 0x0001             # s0 = 00000001
    or      v1, $zero, $zero           # v1 = 00000000
    andi    s0, t1, 0x00FF             # s0 = 00000000
    addiu   s0, s0, 0x0001             # s0 = 00000001
lbl_800C8F68:
    andi    s0, s0, 0x00FF             # s0 = 00000001
    slt     $at, s0, t0
    bnel    $at, $zero, lbl_800C8F4C
    sll     t9, s0,  3
    or      t2, v1, $zero              # t2 = 00000000
lbl_800C8F7C:
    bnel    s8, t2, lbl_800C8FA0
    addiu   a1, a1, 0x0001             # a1 = 00000002
    addiu   a1, t0, 0x0001             # a1 = 00000001
    addiu   s2, s2, 0xFFFF             # s2 = FFFFFFFF
    sb      a3, 0x0004(s3)             # 00000004
    sb      s4, 0x0004(a0)             # 00000004
    andi    a1, a1, 0x00FF             # a1 = 00000001
    andi    s2, s2, 0x00FF             # s2 = 000000FF
lbl_800C8F9C:
    addiu   a1, a1, 0x0001             # a1 = 00000002
lbl_800C8FA0:
    andi    a1, a1, 0x00FF             # a1 = 00000002
    slt     $at, a1, t0
    bnel    $at, $zero, lbl_800C8F14
    sll     t9, a1,  3
lbl_800C8FB0:
    bnel    t0, a1, lbl_800C8FC0
    addiu   t3, t3, 0x0001             # t3 = 00000001
    sb      s4, 0x0004(s3)             # 00000004
lbl_800C8FBC:
    addiu   t3, t3, 0x0001             # t3 = 00000002
lbl_800C8FC0:
    andi    t3, t3, 0x00FF             # t3 = 00000002
    slt     $at, t3, t0
    bnel    $at, $zero, lbl_800C8E1C
    sll     t6, t3,  3
lbl_800C8FD0:
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
    addiu   $sp, $sp, 0x0098           # $sp += 0x98


func_800C9000:
# MqDbg: 
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x438C(t6)             # 8010438C
    addiu   $sp, $sp, 0xFFA0           # $sp -= 0x60
    sw      s2, 0x0020($sp)
    sll     t7, t6,  3
    andi    s2, a0, 0x00FF             # s2 = 00000000
    subu    t7, t7, t6
    addu    t8, t7, s2
    lui     v1, 0x8010                 # v1 = 80100000
    addu    v1, v1, t8
    lbu     v1, 0x1888(v1)             # 80101888
    sw      s4, 0x0028($sp)
    sw      $ra, 0x003C($sp)
    sw      s8, 0x0038($sp)
    sw      s7, 0x0034($sp)
    sw      s6, 0x0030($sp)
    sw      s5, 0x002C($sp)
    sw      s3, 0x0024($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    sw      a0, 0x0060($sp)
    blez    v1, lbl_800C92F0
    or      s4, $zero, $zero           # s4 = 00000000
    sll     t9, s2,  2
    subu    t9, t9, s2
    lui     t0, 0x8012                 # t0 = 80120000
    addiu   t0, t0, 0x46A8             # t0 = 801246A8
    sll     t9, t9,  3
    addu    t1, t9, t0
    lui     s3, 0x8012                 # s3 = 80120000
    addiu   s3, s3, 0x4750             # s3 = 80124750
    sw      t1, 0x0044($sp)
    addiu   s8, $zero, 0x0004          # s8 = 00000004
    addiu   s7, $zero, 0x00FF          # s7 = 000000FF
    lui     s6, 0x0602                 # s6 = 06020000
lbl_800C908C:
    lw      t2, 0x0044($sp)
    sll     t3, s4,  3
    sll     t5, s2,  2
    addu    t4, t2, t3
    lbu     s1, 0x0004(t4)             # 00000004
    lui     t6, 0x8010                 # t6 = 80100000
    addu    t6, t6, t5
    beq     s7, s1, lbl_800C92D4
    sll     t7, s1,  2
    lw      t6, 0x4368(t6)             # 80104368
    subu    t7, t7, s1
    lbu     a2, 0x0000(s3)             # 80124750
    sll     t7, t7,  4
    addu    s0, t6, t7
    lbu     v0, 0x002A(s0)             # 0000002A
    lui     a0, 0x8013                 # a0 = 80130000
    sll     t8, a2,  2
    addu    a0, a0, t8
    addiu   $at, $zero, 0x0002         # $at = 00000002
    bne     v0, $at, lbl_800C9228
    lw      a0, -0x71A8(a0)            # 80128E58
    lhu     v0, 0x0026(s0)             # 00000026
    lui     t9, 0x8010                 # t9 = 80100000
    addiu   t9, t9, 0x1880             # t9 = 80101880
    andi    t0, v0, 0x0008             # t0 = 00000000
    sb      a2, 0x002E(s0)             # 0000002E
    beq     t0, $zero, lbl_800C9108
    addu    s5, s2, t9
    jal     func_800C7F98
    lbu     a0, 0x0000(s3)             # 80124750
    lhu     v0, 0x0026(s0)             # 00000026
lbl_800C9108:
    andi    v1, v0, 0x00C0             # v1 = 00000000
    beq     v1, $zero, lbl_800C916C
    addiu   $at, $zero, 0x0040         # $at = 00000040
    beq     v1, $at, lbl_800C9134
    addiu   $at, $zero, 0x0080         # $at = 00000080
    beq     v1, $at, lbl_800C9148
    addiu   $at, $zero, 0x00C0         # $at = 000000C0
    beq     v1, $at, lbl_800C915C
    nop
    b       lbl_800C916C
    sb      $zero, 0x002F(s0)          # 0000002F
lbl_800C9134:
    jal     func_800BBD80
    nop
    andi    t1, v0, 0x000F             # t1 = 00000000
    b       lbl_800C916C
    sb      t1, 0x002F(s0)             # 0000002F
lbl_800C9148:
    jal     func_800BBD80
    nop
    andi    t2, v0, 0x001F             # t2 = 00000000
    b       lbl_800C916C
    sb      t2, 0x002F(s0)             # 0000002F
lbl_800C915C:
    jal     func_800BBD80
    nop
    andi    t3, v0, 0x003F             # t3 = 00000000
    sb      t3, 0x002F(s0)             # 0000002F
lbl_800C916C:
    andi    a0, s2, 0x00FF             # a0 = 00000000
    andi    a1, s1, 0x00FF             # a1 = 00000000
    jal     func_800C473C
    lbu     a2, 0x0000(s3)             # 80124750
    lbu     t5, 0x0000(s3)             # 80124750
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    sll     t6, t5,  8
    jal     func_800BB0E0
    or      a0, t6, s6                 # a0 = 06020000
    lbu     t8, 0x0000(s3)             # 80124750
    lhu     a1, 0x0028(s0)             # 00000028
    sll     t9, t8,  8
    or      a0, t9, s6                 # a0 = 06020000
    sll     a1, a1, 24
    sra     a1, a1, 24
    jal     func_800BB0E0
    ori     a0, a0, 0x0004             # a0 = 06020004
    lbu     t0, 0x0000(s5)             # 00000000
    beql    t0, $zero, lbl_800C91E8
    lhu     t4, 0x0028(s0)             # 00000028
    lhu     a1, 0x0028(s0)             # 00000028
    lbu     t2, 0x0000(s3)             # 80124750
    andi    a1, a1, 0x0100             # a1 = 00000000
    sra     a1, a1,  8
    sll     t3, t2,  8
    or      a0, t3, s6                 # a0 = 06020000
    sll     a1, a1, 24
    sra     a1, a1, 24
    jal     func_800BB0E0
    ori     a0, a0, 0x0005             # a0 = 06020005
    lhu     t4, 0x0028(s0)             # 00000028
lbl_800C91E8:
    lui     t7, 0x8010                 # t7 = 80100000
    addiu   t6, $zero, 0x0005          # t6 = 00000005
    andi    t5, t4, 0x0C00             # t5 = 00000000
    beql    t5, $zero, lbl_800C9208
    sb      t6, 0x002A(s0)             # 0000002A
    b       lbl_800C9208
    sb      s8, 0x002A(s0)             # 0000002A
    sb      t6, 0x002A(s0)             # 0000002A
lbl_800C9208:
    lbu     t7, 0x438C(t7)             # 8010438C
    lui     v1, 0x8010                 # v1 = 80100000
    sll     t8, t7,  3
    subu    t8, t8, t7
    addu    t9, t8, s2
    addu    v1, v1, t9
    b       lbl_800C92D4
    lbu     v1, 0x1888(v1)             # 80101888
lbl_800C9228:
    lbu     t0, 0x00C5(a0)             # 000000C5
    andi    a0, s2, 0x00FF             # a0 = 00000000
    addiu   $at, $zero, 0x0003         # $at = 00000003
    bne     s7, t0, lbl_800C9268
    nop
    jal     func_800C8728
    andi    a1, s1, 0x00FF             # a1 = 00000000
    lui     t1, 0x8010                 # t1 = 80100000
    lbu     t1, 0x438C(t1)             # 8010438C
    lui     v1, 0x8010                 # v1 = 80100000
    sll     t2, t1,  3
    subu    t2, t2, t1
    addu    t3, t2, s2
    addu    v1, v1, t3
    b       lbl_800C92D4
    lbu     v1, 0x1888(v1)             # 80101888
lbl_800C9268:
    bne     v0, $at, lbl_800C92D4
    andi    a0, s2, 0x00FF             # a0 = 00000000
    jal     func_800C473C
    andi    a1, s1, 0x00FF             # a1 = 00000000
    lhu     t4, 0x0028(s0)             # 00000028
    lui     t6, 0x8010                 # t6 = 80100000
    addiu   t9, $zero, 0x0005          # t9 = 00000005
    andi    t5, t4, 0x0C00             # t5 = 00000000
    beq     t5, $zero, lbl_800C92B4
    lui     t0, 0x8010                 # t0 = 80100000
    sb      s8, 0x002A(s0)             # 0000002A
    lbu     t6, 0x438C(t6)             # 8010438C
    lui     v1, 0x8010                 # v1 = 80100000
    sll     t7, t6,  3
    subu    t7, t7, t6
    addu    t8, t7, s2
    addu    v1, v1, t8
    b       lbl_800C92D4
    lbu     v1, 0x1888(v1)             # 80101888
lbl_800C92B4:
    sb      t9, 0x002A(s0)             # 0000002A
    lbu     t0, 0x438C(t0)             # 8010438C
    lui     v1, 0x8010                 # v1 = 80100000
    sll     t1, t0,  3
    subu    t1, t1, t0
    addu    t2, t1, s2
    addu    v1, v1, t2
    lbu     v1, 0x1888(v1)             # 80101888
lbl_800C92D4:
    lbu     t3, 0x0000(s3)             # 80124750
    addiu   s4, s4, 0x0001             # s4 = 00000001
    andi    s4, s4, 0x00FF             # s4 = 00000001
    slt     $at, s4, v1
    addiu   t4, t3, 0x0001             # t4 = 00000001
    bne     $at, $zero, lbl_800C908C
    sb      t4, 0x0000(s3)             # 80124750
lbl_800C92F0:
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
    addiu   $sp, $sp, 0x0060           # $sp += 0x60


func_800C9320:
# MqDbg: 
    addiu   $sp, $sp, 0xFF80           # $sp -= 0x80
    sw      s6, 0x0030($sp)
    andi    s6, a0, 0x00FF             # s6 = 00000000
    lui     t7, 0x8010                 # t7 = 80100000
    sw      s2, 0x0020($sp)
    addiu   t7, t7, 0x4368             # t7 = 80104368
    sll     t6, s6,  2
    addu    s2, t6, t7
    lw      v1, 0x0000(s2)             # 00000000
    sw      $ra, 0x0034($sp)
    sw      s5, 0x002C($sp)
    sw      s4, 0x0028($sp)
    sw      s3, 0x0024($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    sw      a0, 0x0080($sp)
    lbu     s1, 0x002D(v1)             # 0000002D
    addiu   s3, $zero, 0x00FF          # s3 = 000000FF
    addiu   s4, $zero, 0x0030          # s4 = 00000030
    beq     s3, s1, lbl_800C93C8
    lui     s5, 0x0602                 # s5 = 06020000
lbl_800C9374:
    multu   s1, s4
    mflo    t8
    addu    s0, v1, t8
    lbu     v0, 0x002A(s0)             # 0000002A
    slti    $at, v0, 0x0003
    bne     $at, $zero, lbl_800C93A8
    nop
    lbu     t0, 0x002E(s0)             # 0000002E
    or      a1, $zero, $zero           # a1 = 00000000
    sll     t1, t0,  8
    jal     func_800BB0E0
    or      a0, t1, s5                 # a0 = 06020000
    lbu     v0, 0x002A(s0)             # 0000002A
lbl_800C93A8:
    beq     v0, $zero, lbl_800C93B8
    andi    a0, s6, 0x00FF             # a0 = 00000000
    jal     func_800C8728
    andi    a1, s1, 0x00FF             # a1 = 00000000
lbl_800C93B8:
    lw      v1, 0x0000(s2)             # 00000000
    lbu     s1, 0x002D(v1)             # 0000002D
    bne     s3, s1, lbl_800C9374
    nop
lbl_800C93C8:
    sll     t2, s6, 12
    sh      t2, 0x0070($sp)
    or      a0, $zero, $zero           # a0 = 00000000
    jal     func_800C80EC
    addiu   a1, $sp, 0x0048            # a1 = FFFFFFC8
    lw      $ra, 0x0034($sp)
    lw      s0, 0x0018($sp)
    lw      s1, 0x001C($sp)
    lw      s2, 0x0020($sp)
    lw      s3, 0x0024($sp)
    lw      s4, 0x0028($sp)
    lw      s5, 0x002C($sp)
    lw      s6, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0080           # $sp += 0x80


func_800C9404:
# MqDbg: 
    addiu   $sp, $sp, 0xFFC0           # $sp -= 0x40
    sw      s5, 0x002C($sp)
    andi    s5, a0, 0x00FF             # s5 = 00000000
    lui     t7, 0x8010                 # t7 = 80100000
    sw      s4, 0x0028($sp)
    addiu   t7, t7, 0x4368             # t7 = 80104368
    sll     t6, s5,  2
    addu    s4, t6, t7
    lw      v0, 0x0000(s4)             # 00000000
    sw      $ra, 0x003C($sp)
    sw      s8, 0x0038($sp)
    sw      s7, 0x0034($sp)
    sw      s6, 0x0030($sp)
    sw      s3, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    sw      a0, 0x0040($sp)
    lbu     s1, 0x002D(v0)             # 0000002D
    addiu   s7, $zero, 0x00FF          # s7 = 000000FF
    or      s6, a1, $zero              # s6 = 00000000
    beq     s7, s1, lbl_800C94F0
    or      s2, $zero, $zero           # s2 = 00000000
    addiu   s8, $zero, 0x0030          # s8 = 00000030
lbl_800C9464:
    multu   s1, s8
    mflo    t8
    addu    s0, v0, t8
    lw      t9, 0x0000(s0)             # 00000000
    bnel    s6, t9, lbl_800C94D4
    andi    s2, s1, 0x00FF             # s2 = 00000000
    lbu     v0, 0x002A(s0)             # 0000002A
    sll     s3, s2,  2
    subu    s3, s3, s2
    slti    $at, v0, 0x0003
    bne     $at, $zero, lbl_800C94B0
    sll     s3, s3,  4
    lbu     a0, 0x002E(s0)             # 0000002E
    lui     $at, 0x0602                # $at = 06020000
    or      a1, $zero, $zero           # a1 = 00000000
    sll     a0, a0,  8
    jal     func_800BB0E0
    or      a0, a0, $at                # a0 = 06020000
    lbu     v0, 0x002A(s0)             # 0000002A
lbl_800C94B0:
    beq     v0, $zero, lbl_800C94C0
    andi    a0, s5, 0x00FF             # a0 = 00000000
    jal     func_800C8728
    andi    a1, s1, 0x00FF             # a1 = 00000000
lbl_800C94C0:
    lw      v0, 0x0000(s4)             # 00000000
    addu    t0, v0, s3
    b       lbl_800C94E8
    lbu     s1, 0x002D(t0)             # 0000002D
    andi    s2, s1, 0x00FF             # s2 = 00000000
lbl_800C94D4:
    sll     t1, s2,  2
    subu    t1, t1, s2
    sll     t1, t1,  4
    addu    t2, v0, t1
    lbu     s1, 0x002D(t2)             # 0000002D
lbl_800C94E8:
    bne     s7, s1, lbl_800C9464
    nop
lbl_800C94F0:
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


func_800C9520:
# MqDbg: 
    addiu   $sp, $sp, 0xFFB8           # $sp -= 0x48
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0048($sp)
    sw      a1, 0x004C($sp)
    jal     func_800C9404
    lbu     a0, 0x004B($sp)
    lbu     t6, 0x004B($sp)
    lw      t8, 0x004C($sp)
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    sll     t7, t6, 12
    sh      t7, 0x0040($sp)
    addiu   a1, $sp, 0x0018            # a1 = FFFFFFD0
    jal     func_800C80EC
    sw      t8, 0x0018($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0048           # $sp += 0x48
    jr      $ra
    nop


func_800C9568:
# MqDbg: 
    addiu   $sp, $sp, 0xFFA8           # $sp -= 0x58
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    or      s1, a0, $zero              # s1 = 00000000
    sw      $ra, 0x001C($sp)
    or      s0, $zero, $zero           # s0 = 00000000
    andi    a0, s0, 0x00FF             # a0 = 00000000
lbl_800C9584:
    jal     func_800C9404
    or      a1, s1, $zero              # a1 = 00000000
    addiu   s0, s0, 0x0001             # s0 = 00000001
    andi    s0, s0, 0x00FF             # s0 = 00000001
    slti    $at, s0, 0x0007
    bnel    $at, $zero, lbl_800C9584
    andi    a0, s0, 0x00FF             # a0 = 00000001
    sw      s1, 0x0024($sp)
    addiu   a0, $zero, 0x0002          # a0 = 00000002
    jal     func_800C80EC
    addiu   a1, $sp, 0x0024            # a1 = FFFFFFCC
    lw      $ra, 0x001C($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0058           # $sp += 0x58


func_800C95C4:
# MqDbg: 
    addiu   $sp, $sp, 0xFF78           # $sp -= 0x88
    sw      s7, 0x0034($sp)
    sw      a1, 0x008C($sp)
    lhu     s7, 0x008E($sp)
    sw      s8, 0x0038($sp)
    lui     t7, 0x8010                 # t7 = 80100000
    andi    s8, s7, 0xF000             # s8 = 00000000
    sra     s8, s8, 12
    andi    s8, s8, 0x00FF             # s8 = 00000000
    sw      s3, 0x0024($sp)
    sll     t6, s8,  2
    addiu   t7, t7, 0x4368             # t7 = 80104368
    addu    s3, t6, t7
    lw      t8, 0x0000(s3)             # 00000000
    sw      $ra, 0x003C($sp)
    sw      s6, 0x0030($sp)
    sw      s5, 0x002C($sp)
    sw      s4, 0x0028($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    sw      a0, 0x0088($sp)
    lbu     s1, 0x002D(t8)             # 0000002D
    addiu   s5, $zero, 0x00FF          # s5 = 000000FF
    or      s4, $zero, $zero           # s4 = 00000000
    beq     s5, s1, lbl_800C96D4
    or      v0, s1, $zero              # v0 = 00000000
    lui     s6, 0x0602                 # s6 = 06020000
    addiu   s2, $zero, 0x0030          # s2 = 00000030
lbl_800C9638:
    multu   s1, s2
    lw      t9, 0x0000(s3)             # 00000000
    lw      t1, 0x0088($sp)
    mflo    t0
    addu    s0, t9, t0
    lw      t2, 0x0000(s0)             # 00000000
    bnel    t1, t2, lbl_800C96AC
    andi    s4, s1, 0x00FF             # s4 = 00000000
    lhu     t3, 0x0028(s0)             # 00000028
    bnel    s7, t3, lbl_800C96AC
    andi    s4, s1, 0x00FF             # s4 = 00000000
    lbu     v0, 0x002A(s0)             # 0000002A
    slti    $at, v0, 0x0003
    bne     $at, $zero, lbl_800C968C
    nop
    lbu     t5, 0x002E(s0)             # 0000002E
    or      a1, $zero, $zero           # a1 = 00000000
    sll     t6, t5,  8
    jal     func_800BB0E0
    or      a0, t6, s6                 # a0 = 06020000
    lbu     v0, 0x002A(s0)             # 0000002A
lbl_800C968C:
    beq     v0, $zero, lbl_800C969C
    andi    a0, s8, 0x00FF             # a0 = 00000000
    jal     func_800C8728
    andi    a1, s1, 0x00FF             # a1 = 00000000
lbl_800C969C:
    addiu   s1, $zero, 0x00FF          # s1 = 000000FF
    b       lbl_800C96AC
    addiu   v0, $zero, 0x00FF          # v0 = 000000FF
    andi    s4, s1, 0x00FF             # s4 = 000000FF
lbl_800C96AC:
    beq     s5, v0, lbl_800C96CC
    nop
    multu   s4, s2
    lw      t7, 0x0000(s3)             # 00000000
    mflo    t8
    addu    t9, t7, t8
    lbu     s1, 0x002D(t9)             # 0000002D
    or      v0, s1, $zero              # v0 = 000000FF
lbl_800C96CC:
    bne     s5, v0, lbl_800C9638
    nop
lbl_800C96D4:
    lw      t0, 0x0088($sp)
    lhu     t1, 0x008E($sp)
    addiu   a0, $zero, 0x0003          # a0 = 00000003
    addiu   a1, $sp, 0x0050            # a1 = FFFFFFC8
    sw      t0, 0x0050($sp)
    jal     func_800C80EC
    sh      t1, 0x0078($sp)
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
    addiu   $sp, $sp, 0x0088           # $sp += 0x88


func_800C9720:
# MqDbg: 
    addiu   $sp, $sp, 0xFF70           # $sp -= 0x90
    sw      s8, 0x0038($sp)
    sw      a1, 0x0094($sp)
    lhu     s8, 0x0096($sp)
    lui     t0, 0x8010                 # t0 = 80100000
    sw      s4, 0x0028($sp)
    andi    t6, s8, 0xF000             # t6 = 00000000
    sra     t7, t6, 12
    andi    t8, t7, 0x00FF             # t8 = 00000000
    sll     t9, t8,  2
    addiu   t0, t0, 0x4368             # t0 = 80104368
    addu    s4, t9, t0
    lw      t1, 0x0000(s4)             # 00000000
    sw      $ra, 0x003C($sp)
    sw      s7, 0x0034($sp)
    sw      s6, 0x0030($sp)
    sw      s5, 0x002C($sp)
    sw      s3, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    sw      a0, 0x0090($sp)
    sw      t8, 0x0050($sp)
    lbu     s1, 0x002D(t1)             # 0000002D
    addiu   s6, $zero, 0x00FF          # s6 = 000000FF
    or      s5, $zero, $zero           # s5 = 00000000
    beq     s6, s1, lbl_800C9838
    or      s2, s1, $zero              # s2 = 00000000
    lbu     t2, 0x0093($sp)
    lui     s7, 0x0602                 # s7 = 06020000
    addiu   s3, $zero, 0x0030          # s3 = 00000030
    sw      t2, 0x0044($sp)
lbl_800C97A0:
    multu   s1, s3
    lw      t3, 0x0000(s4)             # 00000000
    lw      t5, 0x0044($sp)
    mflo    t4
    addu    s0, t3, t4
    lbu     t6, 0x000C(s0)             # 0000000C
    bnel    t5, t6, lbl_800C9810
    andi    s5, s1, 0x00FF             # s5 = 00000000
    lhu     t7, 0x0028(s0)             # 00000028
    bnel    s8, t7, lbl_800C9810
    andi    s5, s1, 0x00FF             # s5 = 00000000
    lbu     v0, 0x002A(s0)             # 0000002A
    slti    $at, v0, 0x0003
    bne     $at, $zero, lbl_800C97F4
    nop
    lbu     t9, 0x002E(s0)             # 0000002E
    or      a1, $zero, $zero           # a1 = 00000000
    sll     t0, t9,  8
    jal     func_800BB0E0
    or      a0, t0, s7                 # a0 = 86124368
    lbu     v0, 0x002A(s0)             # 0000002A
lbl_800C97F4:
    beq     v0, $zero, lbl_800C9810
    lbu     a0, 0x0053($sp)
    jal     func_800C8728
    andi    a1, s1, 0x00FF             # a1 = 00000000
    b       lbl_800C9810
    nop
    andi    s5, s1, 0x00FF             # s5 = 00000000
lbl_800C9810:
    beq     s6, s2, lbl_800C9830
    nop
    multu   s5, s3
    lw      t1, 0x0000(s4)             # 00000000
    mflo    t2
    addu    t3, t1, t2
    lbu     s1, 0x002D(t3)             # 0000002D
    or      s2, s1, $zero              # s2 = 00000000
lbl_800C9830:
    bne     s6, s2, lbl_800C97A0
    nop
lbl_800C9838:
    lbu     t4, 0x0093($sp)
    lhu     t5, 0x0096($sp)
    addiu   a0, $zero, 0x0004          # a0 = 00000004
    addiu   a1, $sp, 0x0058            # a1 = FFFFFFC8
    sb      t4, 0x0064($sp)
    jal     func_800C80EC
    sh      t5, 0x0080($sp)
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
    addiu   $sp, $sp, 0x0090           # $sp += 0x90


func_800C9884:
# MqDbg: 
    addiu   $sp, $sp, 0xFF78           # $sp -= 0x88
    sw      s4, 0x0028($sp)
    andi    s4, a0, 0xF000             # s4 = 00000000
    srl     s4, s4, 12
    andi    s4, s4, 0x00FF             # s4 = 00000000
    lui     t7, 0x8010                 # t7 = 80100000
    sw      s5, 0x002C($sp)
    addiu   t7, t7, 0x4368             # t7 = 80104368
    sll     t6, s4,  2
    addu    s5, t6, t7
    lw      v0, 0x0000(s5)             # 00000000
    sw      $ra, 0x003C($sp)
    sw      s8, 0x0038($sp)
    sw      s7, 0x0034($sp)
    sw      s6, 0x0030($sp)
    sw      s3, 0x0024($sp)
    sw      s2, 0x0020($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    sw      a0, 0x0088($sp)
    lbu     s1, 0x002D(v0)             # 0000002D
    addiu   s6, $zero, 0x00FF          # s6 = 000000FF
    or      s2, $zero, $zero           # s2 = 00000000
    beq     s6, s1, lbl_800C9978
    addiu   s7, $zero, 0x0030          # s7 = 00000030
    lui     s8, 0x0602                 # s8 = 06020000
lbl_800C98EC:
    multu   s1, s7
    lw      t9, 0x0088($sp)
    mflo    t8
    addu    s0, v0, t8
    lhu     t0, 0x0028(s0)             # 00000028
    bnel    t9, t0, lbl_800C995C
    andi    s2, s1, 0x00FF             # s2 = 00000000
    lbu     v0, 0x002A(s0)             # 0000002A
    sll     s3, s2,  2
    subu    s3, s3, s2
    slti    $at, v0, 0x0003
    bne     $at, $zero, lbl_800C9938
    sll     s3, s3,  4
    lbu     t2, 0x002E(s0)             # 0000002E
    or      a1, $zero, $zero           # a1 = 00000000
    sll     t3, t2,  8
    jal     func_800BB0E0
    or      a0, t3, s8                 # a0 = 06020000
    lbu     v0, 0x002A(s0)             # 0000002A
lbl_800C9938:
    beq     v0, $zero, lbl_800C9948
    andi    a0, s4, 0x00FF             # a0 = 00000000
    jal     func_800C8728
    andi    a1, s1, 0x00FF             # a1 = 00000000
lbl_800C9948:
    lw      v0, 0x0000(s5)             # 00000000
    addu    t4, v0, s3
    b       lbl_800C9970
    lbu     s1, 0x002D(t4)             # 0000002D
    andi    s2, s1, 0x00FF             # s2 = 00000000
lbl_800C995C:
    sll     t5, s2,  2
    subu    t5, t5, s2
    sll     t5, t5,  4
    addu    t6, v0, t5
    lbu     s1, 0x002D(t6)             # 0000002D
lbl_800C9970:
    bne     s6, s1, lbl_800C98EC
    nop
lbl_800C9978:
    lw      t7, 0x0088($sp)
    addiu   a0, $zero, 0x0005          # a0 = 00000005
    addiu   a1, $sp, 0x0050            # a1 = FFFFFFC8
    jal     func_800C80EC
    sh      t7, 0x0078($sp)
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
    addiu   $sp, $sp, 0x0088           # $sp += 0x88


func_800C99BC:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      s1, 0x0018($sp)
    sw      s0, 0x0014($sp)
    lui     s0, 0x8010                 # s0 = 80100000
    lui     s1, 0x8010                 # s1 = 80100000
    addiu   s1, s1, 0x4360             # s1 = 80104360
    addiu   s0, s0, 0x4364             # s0 = 80104364
    lbu     t6, 0x0000(s0)             # 80104364
    lbu     t7, 0x0000(s1)             # 80104360
    sw      $ra, 0x001C($sp)
    beql    t6, t7, lbl_800C9A10
    lw      $ra, 0x001C($sp)
lbl_800C99EC:
    jal     func_800C828C
    nop
    lbu     t8, 0x0000(s0)             # 80104364
    lbu     t1, 0x0000(s1)             # 80104360
    addiu   t9, t8, 0x0001             # t9 = 00000001
    andi    t0, t9, 0x00FF             # t0 = 00000001
    bne     t0, t1, lbl_800C99EC
    sb      t9, 0x0000(s0)             # 80104364
    lw      $ra, 0x001C($sp)
lbl_800C9A10:
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0020           # $sp += 0x20


func_800C9A20:
# MqDbg: 
    sw      a2, 0x0008($sp)
    andi    a2, a2, 0xFFFF             # a2 = 00000000
    sw      a0, 0x0000($sp)
    sw      a1, 0x0004($sp)
    andi    a1, a1, 0x00FF             # a1 = 00000000
    bne     a2, $zero, lbl_800C9A44
    andi    a0, a0, 0x00FF             # a0 = 00000000
    addiu   a2, a2, 0x0001             # a2 = 00000001
    andi    a2, a2, 0xFFFF             # a2 = 00000001
lbl_800C9A44:
    mtc1    a1, $f4                    # $f4 = 0.00
    lui     t7, 0x8012                 # t7 = 80120000
    addiu   t7, t7, 0x4760             # t7 = 80124760
    sll     t6, a0,  4
    addu    v0, t6, t7
    bgez    a1, lbl_800C9A70
    cvt.s.w $f6, $f4
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f6, $f6, $f8
lbl_800C9A70:
    lui     $at, 0x42FE                # $at = 42FE0000
    mtc1    $at, $f10                  # $f10 = 127.00
    lwc1    $f16, 0x0000(v0)           # 00000000
    mtc1    a2, $f4                    # $f4 = 0.00
    div.s   $f0, $f6, $f10
    sh      a2, 0x000C(v0)             # 0000000C
    lui     $at, 0x4F80                # $at = 4F800000
    cvt.s.w $f8, $f4
    swc1    $f0, 0x0004(v0)            # 00000004
    bgez    a2, lbl_800C9AA8
    sub.s   $f18, $f16, $f0
    mtc1    $at, $f6                   # $f6 = 4294967000.00
    nop
    add.s   $f8, $f8, $f6
lbl_800C9AA8:
    div.s   $f10, $f18, $f8
    jr      $ra
    swc1    $f10, 0x0008(v0)           # 00000008


func_800C9AB4:
# MqDbg: 
    sw      a0, 0x0000($sp)
    andi    a0, a0, 0x00FF             # a0 = 00000000
    lui     t7, 0x8012                 # t7 = 80120000
    addiu   t7, t7, 0x4760             # t7 = 80124760
    sll     t6, a0,  4
    addu    v0, t6, t7
    lhu     v1, 0x000C(v0)             # 0000000C
    beq     v1, $zero, lbl_800C9B00
    addiu   t8, v1, 0xFFFF             # t8 = FFFFFFFF
    andi    t9, t8, 0xFFFF             # t9 = 0000FFFF
    beq     t9, $zero, lbl_800C9AF8
    sh      t8, 0x000C(v0)             # 0000000C
    lwc1    $f4, 0x0000(v0)            # 00000000
    lwc1    $f6, 0x0008(v0)            # 00000008
    sub.s   $f8, $f4, $f6
    jr      $ra
    swc1    $f8, 0x0000(v0)            # 00000000
lbl_800C9AF8:
    lwc1    $f10, 0x0004(v0)           # 00000004
    swc1    $f10, 0x0000(v0)           # 00000000
lbl_800C9B00:
    jr      $ra
    nop


func_800C9B08:
# MqDbg: 
    lui     t7, 0x8013                 # t7 = 80130000
    lw      t7, -0x71A8(t7)            # 80128E58
    lui     t6, 0x8013                 # t6 = 80130000
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    addiu   t6, t6, 0xB0E0             # t6 = 8012B0E0
    sw      $ra, 0x001C($sp)
    beq     t6, t7, lbl_800C9B60
    sw      s0, 0x0018($sp)
    lui     $at, 0x8012                # $at = 80120000
    sb      $zero, 0x4750($at)         # 80124750
    or      s0, $zero, $zero           # s0 = 00000000
lbl_800C9B34:
    jal     func_800C88C0
    andi    a0, s0, 0x00FF             # a0 = 00000000
    jal     func_800C9000
    andi    a0, s0, 0x00FF             # a0 = 00000000
    jal     func_800C9AB4
    andi    a0, s0, 0x00FF             # a0 = 00000000
    addiu   s0, s0, 0x0001             # s0 = 00000001
    andi    s0, s0, 0x00FF             # s0 = 00000001
    slti    $at, s0, 0x0007
    bne     $at, $zero, lbl_800C9B34
    nop
lbl_800C9B60:
    lw      $ra, 0x001C($sp)
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800C9B74:
# MqDbg: 
    andi    t6, a0, 0xF000             # t6 = 00000000
    srl     t7, t6, 12
    andi    t8, t7, 0x00FF             # t8 = 00000000
    sll     t9, t8,  2
    lui     v1, 0x8010                 # v1 = 80100000
    addu    v1, v1, t9
    lw      v1, 0x4368(v1)             # 80104368
    addiu   a2, $zero, 0x00FF          # a2 = 000000FF
    addiu   a3, $zero, 0x0030          # a3 = 00000030
    lbu     v0, 0x002D(v1)             # 8010002D
    beql    a2, v0, lbl_800C9BD4
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800C9BA4:
    multu   v0, a3
    mflo    t0
    addu    a1, v1, t0
    lhu     t1, 0x0028(a1)             # 00000028
    bnel    a0, t1, lbl_800C9BC8
    lbu     v0, 0x002D(a1)             # 0000002D
    jr      $ra
    addiu   v0, $zero, 0x0001          # v0 = 00000001
lbl_800C9BC4:
    lbu     v0, 0x002D(a1)             # 0000002D
lbl_800C9BC8:
    bne     a2, v0, lbl_800C9BA4
    nop
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800C9BD4:
    jr      $ra
    nop


func_800C9BDC:
# MqDbg: 
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x4360($at)         # 80104360
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x4364($at)         # 80104364
    lui     $at, 0x8010                # $at = 80100000
    sh      $zero, 0x4390($at)         # 80104390
    lui     $at, 0x3F80                # $at = 3F800000
    lui     t1, 0x8012                 # t1 = 80120000
    lui     t0, 0x8012                 # t0 = 80120000
    lui     a3, 0x8012                 # a3 = 80120000
    lui     a1, 0x8012                 # a1 = 80120000
    lui     a0, 0x8012                 # a0 = 80120000
    mtc1    $at, $f0                   # $f0 = 1.00
    addiu   a0, a0, 0x4690             # a0 = 80124690
    addiu   a1, a1, 0x4698             # a1 = 80124698
    addiu   a3, a3, 0x46A0             # a3 = 801246A0
    addiu   t0, t0, 0x4754             # t0 = 80124754
    addiu   t1, t1, 0x4760             # t1 = 80124760
    or      v0, $zero, $zero           # v0 = 00000000
    addiu   a2, $zero, 0x0001          # a2 = 00000001
lbl_800C9C2C:
    addu    t6, a0, v0
    addu    t7, a1, v0
    sb      $zero, 0x0000(t6)          # 00000000
    addu    t8, a3, v0
    addu    t9, t0, v0
    sll     t4, v0,  4
    addiu   v0, v0, 0x0001             # v0 = 00000001
    sb      a2, 0x0000(t7)             # 00000000
    andi    v0, v0, 0x00FF             # v0 = 00000001
    sb      $zero, 0x0000(t8)          # 00000000
    slti    $at, v0, 0x0007
    sb      $zero, 0x0000(t9)          # 00000000
    addu    v1, t1, t4
    swc1    $f0, 0x0000(v1)            # 00000000
    bne     $at, $zero, lbl_800C9C2C
    sh      $zero, 0x000C(v1)          # 0000000C
    or      v0, $zero, $zero           # v0 = 00000000
    addiu   t0, $zero, 0x00FF          # t0 = 000000FF
    sll     t5, v0,  2
lbl_800C9C78:
    subu    t5, t5, v0
    lui     t6, 0x8012                 # t6 = 80120000
    addiu   t6, t6, 0x46A8             # t6 = 801246A8
    sll     t5, t5,  3
    addu    a0, t5, t6
    or      v1, $zero, $zero           # v1 = 00000000
lbl_800C9C90:
    sll     t7, v1,  3
    addiu   v1, v1, 0x0001             # v1 = 00000001
    andi    v1, v1, 0x00FF             # v1 = 00000001
    slti    $at, v1, 0x0003
    addu    t8, a0, t7
    bne     $at, $zero, lbl_800C9C90
    sb      t0, 0x0004(t8)             # 00000004
    addiu   v0, v0, 0x0001             # v0 = 00000001
    andi    v0, v0, 0x00FF             # v0 = 00000001
    slti    $at, v0, 0x0007
    bnel    $at, $zero, lbl_800C9C78
    sll     t5, v0,  2
    lui     t2, 0x8010                 # t2 = 80100000
    lui     t1, 0x8010                 # t1 = 80100000
    addiu   t1, t1, 0x4368             # t1 = 80104368
    addiu   t2, t2, 0x4384             # t2 = 80104384
    or      v0, $zero, $zero           # v0 = 00000000
    addiu   t3, $zero, 0x0030          # t3 = 00000030
lbl_800C9CD8:
    sll     t9, v0,  2
    addu    a1, t1, t9
    lw      t4, 0x0000(a1)             # 80124698
    addu    a2, t2, v0
    addiu   v1, $zero, 0x0001          # v1 = 00000001
    sb      t0, 0x002C(t4)             # 0000002C
    lw      t5, 0x0000(a1)             # 80124698
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    sb      t0, 0x002D(t5)             # 0000002D
    lbu     t6, 0x0000(a2)             # 00000001
    addiu   t7, t6, 0xFFFF             # t7 = 801246A7
    slti    $at, t7, 0x0002
    bne     $at, $zero, lbl_800C9D58
    nop
lbl_800C9D10:
    multu   v1, t3
    lw      t9, 0x0000(a1)             # 80124698
    addiu   t8, a0, 0xFFFF             # t8 = 00000000
    addiu   t5, a0, 0x0001             # t5 = 00000002
    addiu   v1, v1, 0x0001             # v1 = 00000002
    andi    v1, v1, 0x00FF             # v1 = 00000002
    or      a0, v1, $zero              # a0 = 00000002
    mflo    a3
    addu    t4, t9, a3
    sb      t8, 0x002C(t4)             # 0000002C
    lw      t6, 0x0000(a1)             # 80124698
    addu    t7, t6, a3
    sb      t5, 0x002D(t7)             # 801246D4
    lbu     t9, 0x0000(a2)             # 00000001
    addiu   t8, t9, 0xFFFF             # t8 = FFFFFFFF
    slt     $at, v1, t8
    bne     $at, $zero, lbl_800C9D10
    nop
lbl_800C9D58:
    multu   v1, t3
    lw      t6, 0x0000(a1)             # 80124698
    addiu   t4, v1, 0xFFFF             # t4 = 00000001
    addiu   v0, v0, 0x0001             # v0 = 00000001
    andi    v0, v0, 0x00FF             # v0 = 00000001
    slti    $at, v0, 0x0007
    mflo    a3
    addu    t5, t6, a3
    sb      t4, 0x002C(t5)             # 0000002E
    lw      t7, 0x0000(a1)             # 80124698
    addu    t9, t7, a3
    bne     $at, $zero, lbl_800C9CD8
    sb      t0, 0x002D(t9)             # 0000002D
    jr      $ra
    nop
    nop
    nop
    nop


func_800C9DA0:
# MqDbg: 
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x43B8(t6)             # 801043B8
    sw      a2, 0x0030($sp)
    sw      a3, 0x0034($sp)
    andi    a3, a3, 0xFFFF             # a3 = 00000000
    andi    a2, a2, 0x00FF             # a2 = 00000000
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0028($sp)
    beq     t6, $zero, lbl_800C9DD8
    sw      a1, 0x002C($sp)
    lbu     t7, 0x002B($sp)
    addiu   $at, $zero, 0x0002         # $at = 00000002
    bne     t7, $at, lbl_800C9F14
lbl_800C9DD8:
    lui     t2, 0x8012                 # t2 = 80120000
    lhu     t2, 0x7E84(t2)             # 80127E84
    lbu     v1, 0x002B($sp)
    lbu     t9, 0x002F($sp)
    multu   a3, t2
    lui     $at, 0x8200                # $at = 82000000
    sll     v1, v1, 16
    or      t8, v1, $at                # t8 = 82000000
    or      t0, t9, $zero              # t0 = 00000000
    andi    a2, a2, 0x007F             # a2 = 00000000
    sll     t1, t0,  8
    or      a0, t8, t1                 # a0 = 82000000
    sb      a2, 0x0033($sp)
    sw      v1, 0x001C($sp)
    mflo    a1
    bgez    a1, lbl_800C9E20
    addu    $at, a1, $zero
    addiu   $at, a1, 0x0003            # $at = 00000003
lbl_800C9E20:
    sra     a1, $at,  2
    jal     func_800BB0BC
    nop
    lbu     t3, 0x002B($sp)
    lui     t5, 0x8012                 # t5 = 80120000
    addiu   t5, t5, 0x4C00             # t5 = 80124C00
    sll     t4, t3,  2
    addu    t4, t4, t3
    sll     t4, t4,  2
    subu    t4, t4, t3
    sll     t4, t4,  3
    addu    t4, t4, t3
    sll     t4, t4,  2
    lui     $at, 0x3F80                # $at = 3F800000
    addu    a2, t4, t5
    mtc1    $at, $f0                   # $f0 = 1.00
    lwc1    $f2, 0x0000(a2)            # 00000000
    lbu     t7, 0x0033($sp)
    lbu     t6, 0x002F($sp)
    c.eq.s  $f0, $f2
    sll     t9, t7,  8
    or      v0, t6, t9                 # v0 = 00000000
    lw      v1, 0x001C($sp)
    sh      v0, 0x0254(a2)             # 00000254
    bc1t    lbl_800C9EA8
    sh      v0, 0x0256(a2)             # 00000256
    lui     $at, 0x4100                # $at = 41000000
    mfc1    a1, $f2
    or      a0, v1, $at                # a0 = 41000000
    jal     func_800BB098
    sw      a2, 0x0018($sp)
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f0                   # $f0 = 1.00
    lw      a2, 0x0018($sp)
lbl_800C9EA8:
    lbu     t0, 0x002B($sp)
    lui     t1, 0x8012                 # t1 = 80120000
    addiu   t1, t1, 0x4C00             # t1 = 80124C00
    sll     t8, t0,  2
    addu    t8, t8, t0
    sll     t8, t8,  2
    subu    t8, t8, t0
    sll     t8, t8,  3
    addu    t8, t8, t0
    sll     t8, t8,  2
    sh      $zero, 0x0028(a2)          # 00000028
    sh      $zero, 0x0018(a2)          # 00000018
    sw      $zero, 0x0014(a2)          # 00000014
    addu    a0, t8, t1
    or      v1, $zero, $zero           # v1 = 00000000
lbl_800C9EE4:
    sll     t2, v1,  5
    addiu   v1, v1, 0x0001             # v1 = 00000001
    addu    v0, a0, t2
    andi    v1, v1, 0x00FF             # v1 = 00000001
    slti    $at, v1, 0x0010
    swc1    $f0, 0x0050(v0)            # 00000050
    sh      $zero, 0x005C(v0)          # 0000005C
    swc1    $f0, 0x0060(v0)            # 00000060
    bne     $at, $zero, lbl_800C9EE4
    sh      $zero, 0x006C(v0)          # 0000006C
    sh      $zero, 0x0250(a2)          # 00000250
    sh      $zero, 0x0252(a2)          # 00000252
lbl_800C9F14:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_800C9F24:
# MqDbg: 
    lui     t6, 0x8012                 # t6 = 80120000
    lhu     t6, 0x7E84(t6)             # 80127E84
    andi    a2, a1, 0xFFFF             # a2 = 00000000
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    multu   a2, t6
    sw      a0, 0x0018($sp)
    lbu     a0, 0x001B($sp)
    sw      a1, 0x001C($sp)
    lui     $at, 0x8300                # $at = 83000000
    sll     a0, a0, 16
    or      a0, a0, $at                # a0 = 83000000
    sw      $ra, 0x0014($sp)
    mflo    a1
    bgez    a1, lbl_800C9F64
    addu    $at, a1, $zero
    addiu   $at, a1, 0x0003            # $at = 00000003
lbl_800C9F64:
    sra     a1, $at,  2
    jal     func_800BB0BC
    nop
    lbu     t8, 0x001B($sp)
    lw      $ra, 0x0014($sp)
    lui     $at, 0x8012                # $at = 80120000
    sll     t9, t8,  2
    addu    t9, t9, t8
    sll     t9, t9,  2
    subu    t9, t9, t8
    sll     t9, t9,  3
    addu    t9, t9, t8
    sll     t9, t9,  2
    addu    $at, $at, t9
    ori     t7, $zero, 0xFFFF          # t7 = 0000FFFF
    sh      t7, 0x4E54($at)            # 80124E54
    jr      $ra
    addiu   $sp, $sp, 0x0018           # $sp += 0x18


func_800C9FAC:
# MqDbg: 
    lui     $at, 0x0F00                # $at = 0F000000
    and     a3, a0, $at
    srl     t6, a0, 28
    addiu   $sp, $sp, 0xFF98           # $sp -= 0x68
    andi    t7, t6, 0x00FF             # t7 = 00000000
    sw      s0, 0x0018($sp)
    srl     a3, a3, 24
    sltiu   $at, t7, 0x0010
    or      s0, a0, $zero              # s0 = 00000000
    sw      $ra, 0x001C($sp)
    beq     $at, $zero, lbl_800CAA5C
    andi    a1, a3, 0x00FF             # a1 = 00000000
    sll     t7, t7,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t7
    lw      t7, -0x5ED0($at)           # 8010A130
    jr      t7
    nop
    andi    a0, a3, 0x00FF             # a0 = 00000000
    sll     t8, a0,  2
    addu    t8, t8, a0
    sll     t8, t8,  2
    subu    t8, t8, a0
    sll     t8, t8,  3
    lui     t1, 0x8012                 # t1 = 80120000
    addu    t8, t8, a0
    addiu   t1, t1, 0x4C00             # t1 = 80124C00
    sll     t8, t8,  2
    addu    t9, t1, t8
    lbu     t5, 0x0260(t9)             # 00000260
    andi    a2, s0, 0xFF00             # a2 = 00000000
    srl     a2, a2,  8
    bne     t5, $zero, lbl_800CAA5C
    andi    a2, a2, 0x00FF             # a2 = 00000000
    slti    $at, a2, 0x0080
    beq     $at, $zero, lbl_800CAA5C
    or      a1, s0, $zero              # a1 = 00000000
    lui     $at, 0x00FF                # $at = 00FF0000
    and     a3, s0, $at
    srl     a3, a3, 13
    andi    a3, a3, 0xFFFF             # a3 = 00000000
    jal     func_800C9DA0
    andi    a1, a1, 0x00FF             # a1 = 00000000
    b       lbl_800CAA60
    lw      $ra, 0x001C($sp)
    lui     $at, 0x00FF                # $at = 00FF0000
    and     a1, s0, $at
    srl     a1, a1, 13
    andi    a1, a1, 0xFFFF             # a1 = 00000000
    jal     func_800C9F24
    andi    a0, a3, 0x00FF             # a0 = 00000000
    b       lbl_800CAA60
    lw      $ra, 0x001C($sp)
    lui     v0, 0x8012                 # v0 = 80120000
    addiu   v0, v0, 0x47F8             # v0 = 801247F8
    andi    t6, a3, 0x00FF             # t6 = 00000000
    addu    t4, v0, t6
    lbu     t2, 0x0000(t4)             # 00000000
    sw      t6, 0x002C($sp)
    or      v1, $zero, $zero           # v1 = 00000000
    blez    t2, lbl_800CA12C
    or      t3, t2, $zero              # t3 = 00000000
    sll     t5, t6,  2
    addu    t5, t5, t6
    lui     t6, 0x8012                 # t6 = 80120000
    addiu   t6, t6, 0x47D0             # t6 = 801247D0
    sll     t5, t5,  1
    andi    a0, s0, 0x00FF             # a0 = 00000000
    sw      a0, 0x0030($sp)
    addu    a2, t5, t6
    sll     t8, v1,  1
lbl_800CA0C8:
    addu    t9, a2, t8
    lbu     t7, 0x0000(t9)             # 00000000
    addu    t5, v0, a1
    bnel    a0, t7, lbl_800CA114
    lbu     t6, 0x0000(t5)             # 00000000
    bne     v1, $zero, lbl_800CAA5C
    lbu     a0, 0x002F($sp)
    lui     $at, 0x00FF                # $at = 00FF0000
    and     a3, s0, $at
    andi    a2, s0, 0xFF00             # a2 = 00000000
    srl     a2, a2,  8
    srl     a3, a3, 13
    andi    a3, a3, 0xFFFF             # a3 = 00000000
    andi    a2, a2, 0x00FF             # a2 = 00000000
    jal     func_800C9DA0
    lbu     a1, 0x0033($sp)
    b       lbl_800CAA60
    lw      $ra, 0x001C($sp)
    lbu     t6, 0x0000(t5)             # 00000000
lbl_800CA114:
    addiu   v1, v1, 0x0001             # v1 = 00000001
    andi    v1, v1, 0x00FF             # v1 = 00000001
    slt     $at, v1, t6
    bnel    $at, $zero, lbl_800CA0C8
    sll     t8, v1,  1
    or      v1, $zero, $zero           # v1 = 00000000
lbl_800CA12C:
    lw      t7, 0x002C($sp)
    lui     t6, 0x8012                 # t6 = 80120000
    addiu   t6, t6, 0x47D0             # t6 = 801247D0
    sll     t5, t7,  2
    addu    t5, t5, t7
    sll     t5, t5,  1
    andi    t9, s0, 0x00FF             # t9 = 00000000
    andi    t1, t2, 0x00FF             # t1 = 00000000
    sw      t9, 0x0030($sp)
    blez    t3, lbl_800CA1A4
    addu    a2, t5, t6
    andi    a0, s0, 0xFF00             # a0 = 00000000
    lui     v0, 0x8012                 # v0 = 80120000
    addu    v0, v0, a1
    srl     a0, a0,  8
    andi    a0, a0, 0x00FF             # a0 = 00000000
    lbu     v0, 0x47F8(v0)             # 801247F8
    sll     t8, v1,  1
lbl_800CA174:
    addu    t9, a2, t8
    lbu     t7, 0x0001(t9)             # 00000001
    slt     $at, a0, t7
    bnel    $at, $zero, lbl_800CA194
    addiu   v1, v1, 0x0001             # v1 = 00000001
    andi    t1, v1, 0x00FF             # t1 = 00000001
    andi    v1, t2, 0x00FF             # v1 = 00000000
    addiu   v1, v1, 0x0001             # v1 = 00000001
lbl_800CA194:
    andi    v1, v1, 0x00FF             # v1 = 00000001
    slt     $at, v1, v0
    bnel    $at, $zero, lbl_800CA174
    sll     t8, v1,  1
lbl_800CA1A4:
    andi    t5, s0, 0xFF00             # t5 = 00000000
    srl     t6, t5,  8
    andi    t8, t6, 0x00FF             # t8 = 000000D0
    slti    $at, t3, 0x0005
    beq     $at, $zero, lbl_800CA1C8
    sw      t8, 0x003C($sp)
    addiu   t9, t2, 0x0001             # t9 = 00000001
    sb      t9, 0x0000(t4)             # 00000000
    andi    t3, t9, 0x00FF             # t3 = 00000001
lbl_800CA1C8:
    addiu   v1, t3, 0xFFFF             # v1 = 00000000
    andi    v1, v1, 0x00FF             # v1 = 00000000
    or      v0, v1, $zero              # v0 = 00000000
    beq     t1, v1, lbl_800CA20C
    or      t0, t1, $zero              # t0 = 00000001
lbl_800CA1DC:
    sll     t5, v0,  1
    addu    a1, a2, t5
    lbu     t6, -0x0001(a1)            # FFFFFFFF
    sll     t7, v1,  1
    addu    a0, a2, t7
    sb      t6, 0x0001(a0)             # 00000001
    lbu     t8, -0x0002(a1)            # FFFFFFFE
    addiu   v1, v1, 0xFFFF             # v1 = FFFFFFFF
    andi    v1, v1, 0x00FF             # v1 = 000000FF
    or      v0, v1, $zero              # v0 = 000000FF
    bne     t0, v1, lbl_800CA1DC
    sb      t8, 0x0000(a0)             # 00000000
lbl_800CA20C:
    lw      t7, 0x003C($sp)
    lw      t5, 0x0030($sp)
    sll     t9, t1,  1
    addu    v0, a2, t9
    sb      t7, 0x0001(v0)             # 00000100
    bne     t0, $zero, lbl_800CAA5C
    sb      t5, 0x0000(v0)             # 000000FF
    lui     $at, 0x00FF                # $at = 00FF0000
    and     a3, s0, $at
    srl     a3, a3, 13
    andi    a3, a3, 0xFFFF             # a3 = 00000000
    lbu     a0, 0x002F($sp)
    lbu     a1, 0x0033($sp)
    jal     func_800C9DA0
    lbu     a2, 0x003F($sp)
    b       lbl_800CAA60
    lw      $ra, 0x001C($sp)
    lui     t6, 0x8012                 # t6 = 80120000
    addiu   t6, t6, 0x47F8             # t6 = 801247F8
    andi    t8, a3, 0x00FF             # t8 = 00000000
    addu    t4, t6, t8
    lbu     t2, 0x0000(t4)             # 00000000
    sw      t8, 0x002C($sp)
    or      v1, $zero, $zero           # v1 = 00000000
    or      t1, t2, $zero              # t1 = 00000000
    blez    t2, lbl_800CA2D0
    or      t3, t2, $zero              # t3 = 00000000
    sll     t5, t8,  2
    addu    t5, t5, t8
    lui     t8, 0x8012                 # t8 = 80120000
    addiu   t8, t8, 0x47D0             # t8 = 801247D0
    sll     t5, t5,  1
    addu    t7, a1, t6
    or      a0, s0, $zero              # a0 = 00000000
    andi    a0, a0, 0x00FF             # a0 = 00000000
    lbu     v0, 0x0000(t7)             # 00000000
    addu    a2, t5, t8
    sll     t6, v1,  1
lbl_800CA2A4:
    addu    t7, a2, t6
    lbu     t9, 0x0000(t7)             # 00000000
    bnel    a0, t9, lbl_800CA2C0
    addiu   v1, v1, 0x0001             # v1 = 00000001
    andi    t1, v1, 0x00FF             # t1 = 00000001
    andi    v1, t2, 0x00FF             # v1 = 00000000
    addiu   v1, v1, 0x0001             # v1 = 00000001
lbl_800CA2C0:
    andi    v1, v1, 0x00FF             # v1 = 00000001
    slt     $at, v1, v0
    bnel    $at, $zero, lbl_800CA2A4
    sll     t6, v1,  1
lbl_800CA2D0:
    beq     t1, t3, lbl_800CA344
    or      t0, t1, $zero              # t0 = 00000001
    addiu   a3, t3, 0xFFFF             # a3 = FFFFFFFF
    slt     $at, t1, a3
    beq     $at, $zero, lbl_800CA33C
    andi    v1, t1, 0x00FF             # v1 = 00000001
    lw      t5, 0x002C($sp)
    lui     t6, 0x8012                 # t6 = 80120000
    addiu   t6, t6, 0x47D0             # t6 = 801247D0
    sll     t8, t5,  2
    addu    t8, t8, t5
    sll     t8, t8,  1
    addu    a2, t8, t6
    or      v0, v1, $zero              # v0 = 00000001
lbl_800CA308:
    sll     t9, v0,  1
    addu    a1, a2, t9
    lbu     t5, 0x0003(a1)             # 00000003
    sll     t7, v1,  1
    addu    a0, a2, t7
    addiu   v1, v1, 0x0001             # v1 = 00000002
    sb      t5, 0x0001(a0)             # 00000001
    lbu     t8, 0x0002(a1)             # 00000002
    andi    v1, v1, 0x00FF             # v1 = 00000002
    slt     $at, v1, a3
    or      v0, v1, $zero              # v0 = 00000002
    bne     $at, $zero, lbl_800CA308
    sb      t8, 0x0000(a0)             # 00000000
lbl_800CA33C:
    addiu   t6, t2, 0xFFFF             # t6 = FFFFFFFF
    sb      t6, 0x0000(t4)             # 00000000
lbl_800CA344:
    bne     t0, $zero, lbl_800CAA5C
    lbu     a0, 0x002F($sp)
    lui     $at, 0x00FF                # $at = 00FF0000
    and     a3, s0, $at
    srl     a3, a3, 13
    andi    a3, a3, 0xFFFF             # a3 = 0000FFFF
    andi    a1, a3, 0xFFFF             # a1 = 0000FFFF
    sw      a3, 0x003C($sp)
    jal     func_800C9F24
    sw      t4, 0x0024($sp)
    lw      t4, 0x0024($sp)
    lw      a0, 0x002C($sp)
    lw      a3, 0x003C($sp)
    lbu     t7, 0x0000(t4)             # 00000000
    sll     t9, a0,  2
    addu    t9, t9, a0
    beq     t7, $zero, lbl_800CAA5C
    sll     t9, t9,  1
    lui     t5, 0x8012                 # t5 = 80120000
    addiu   t5, t5, 0x47D0             # t5 = 801247D0
    addu    v0, t9, t5
    lbu     a1, 0x0000(v0)             # 00000000
    jal     func_800C9DA0
    lbu     a2, 0x0001(v0)             # 00000001
    b       lbl_800CAA60
    lw      $ra, 0x001C($sp)
    lui     $at, 0x00FF                # $at = 00FF0000
    and     v0, s0, $at
    srl     v0, v0, 15
    andi    v1, v0, 0x00FF             # v1 = 00000000
    bne     v1, $zero, lbl_800CA3CC
    andi    a1, v0, 0x00FF             # a1 = 00000000
    addiu   a1, v1, 0x0001             # a1 = 00000001
    andi    a1, a1, 0x00FF             # a1 = 00000001
lbl_800CA3CC:
    andi    t8, a3, 0x00FF             # t8 = 00000000
    sll     t6, t8,  2
    addu    t6, t6, t8
    sll     t6, t6,  2
    subu    t6, t6, t8
    sll     t6, t6,  3
    andi    t9, s0, 0x00FF             # t9 = 00000000
    mtc1    t9, $f4                    # $f4 = 0.00
    lui     t1, 0x8012                 # t1 = 80120000
    addu    t6, t6, t8
    addiu   t1, t1, 0x4C00             # t1 = 80124C00
    sll     t6, t6,  2
    addu    v0, t1, t6
    bgez    t9, lbl_800CA418
    cvt.s.w $f6, $f4
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f6, $f6, $f8
lbl_800CA418:
    lui     $at, 0x42FE                # $at = 42FE0000
    mtc1    $at, $f10                  # $f10 = 127.00
    lwc1    $f2, 0x0000(v0)            # 00000000
    div.s   $f0, $f6, $f10
    c.eq.s  $f2, $f0
    swc1    $f0, 0x0004(v0)            # 00000004
    bc1tl   lbl_800CAA60
    lw      $ra, 0x001C($sp)
    lwc1    $f16, 0x0004(v0)           # 00000004
    mtc1    a1, $f4                    # $f4 = 0.00
    lui     $at, 0x4F80                # $at = 4F800000
    sub.s   $f18, $f2, $f16
    bgez    a1, lbl_800CA45C
    cvt.s.w $f8, $f4
    mtc1    $at, $f6                   # $f6 = 4294967000.00
    nop
    add.s   $f8, $f8, $f6
lbl_800CA45C:
    div.s   $f10, $f18, $f8
    sh      a1, 0x000C(v0)             # 0000000C
    b       lbl_800CAA5C
    swc1    $f10, 0x0008(v0)           # 00000008
    lui     $at, 0x00FF                # $at = 00FF0000
    and     v0, s0, $at
    srl     v0, v0, 15
    andi    v1, v0, 0x00FF             # v1 = 00000000
    bne     v1, $zero, lbl_800CA48C
    andi    a1, v0, 0x00FF             # a1 = 00000000
    addiu   a1, v1, 0x0001             # a1 = 00000001
    andi    a1, a1, 0x00FF             # a1 = 00000001
lbl_800CA48C:
    mtc1    a1, $f16                   # $f16 = 0.00
    or      v1, $zero, $zero           # v1 = 00000000
    bgez    a1, lbl_800CA4AC
    cvt.s.w $f2, $f16
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f2, $f2, $f4
lbl_800CA4AC:
    andi    a2, a3, 0x00FF             # a2 = 00000000
    sll     t5, a2,  2
    addu    t5, t5, a2
    sll     t5, t5,  2
    subu    t5, t5, a2
    sll     t5, t5,  3
    andi    t7, s0, 0xFFFF             # t7 = 00000000
    mtc1    t7, $f6                    # $f6 = 0.00
    addu    t5, t5, a2
    lui     t8, 0x8012                 # t8 = 80120000
    addiu   t8, t8, 0x4C00             # t8 = 80124C00
    sll     t5, t5,  2
    addu    a0, t5, t8
    bgez    t7, lbl_800CA4F8
    cvt.s.w $f18, $f6
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f18, $f18, $f8
lbl_800CA4F8:
    lui     $at, 0x447A                # $at = 447A0000
    mtc1    $at, $f10                  # $f10 = 1000.00
    lui     t1, 0x8012                 # t1 = 80120000
    addiu   t1, t1, 0x4C00             # t1 = 80124C00
    div.s   $f0, $f18, $f10
lbl_800CA50C:
    sll     t9, v1,  5
    addu    v0, a0, t9
    lwc1    $f16, 0x0060(v0)           # 00000060
    addiu   v1, v1, 0x0001             # v1 = 00000001
    andi    v1, v1, 0x00FF             # v1 = 00000001
    sub.s   $f4, $f16, $f0
    slti    $at, v1, 0x0010
    swc1    $f0, 0x0064(v0)            # 00000064
    sh      a1, 0x006C(v0)             # 0000006C
    div.s   $f6, $f4, $f2
    bne     $at, $zero, lbl_800CA50C
    swc1    $f6, 0x0068(v0)            # 00000068
    sll     t8, a2,  2
    addu    t8, t8, a2
    sll     t8, t8,  2
    subu    t8, t8, a2
    sll     t8, t8,  3
    addu    t8, t8, a2
    sll     t8, t8,  2
    addu    t6, t1, t8
    ori     t5, $zero, 0xFFFF          # t5 = 0000FFFF
    b       lbl_800CAA5C
    sh      t5, 0x0250(t6)             # 00000250
    lui     $at, 0x00FF                # $at = 00FF0000
    and     v0, s0, $at
    srl     v0, v0, 15
    andi    v1, v0, 0x00FF             # v1 = 00000000
    bne     v1, $zero, lbl_800CA588
    andi    a1, v0, 0x00FF             # a1 = 00000000
    addiu   a1, v1, 0x0001             # a1 = 00000001
    andi    a1, a1, 0x00FF             # a1 = 00000001
lbl_800CA588:
    andi    t7, a3, 0x00FF             # t7 = 00000000
    sll     t9, t7,  2
    addu    t9, t9, t7
    sll     t9, t9,  2
    subu    t9, t9, t7
    sll     t9, t9,  3
    andi    a0, s0, 0xF000             # a0 = 00000000
    lui     t1, 0x8012                 # t1 = 80120000
    srl     a0, a0, 12
    addu    t9, t9, t7
    andi    t6, s0, 0x0FFF             # t6 = 00000000
    mtc1    t6, $f8                    # $f8 = 0.00
    addiu   t1, t1, 0x4C00             # t1 = 80124C00
    sll     t9, t9,  2
    andi    a0, a0, 0x00FF             # a0 = 00000000
    sll     t8, a0,  5
    addu    v0, t1, t9
    addu    v1, v0, t8
    bgez    t6, lbl_800CA5E8
    cvt.s.w $f18, $f8
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f10                  # $f10 = 4294967000.00
    nop
    add.s   $f18, $f18, $f10
lbl_800CA5E8:
    lui     $at, 0x447A                # $at = 447A0000
    mtc1    $at, $f16                  # $f16 = 1000.00
    lwc1    $f4, 0x0060(v1)            # 00000060
    mtc1    a1, $f8                    # $f8 = 0.00
    div.s   $f0, $f18, $f16
    cvt.s.w $f10, $f8
    swc1    $f0, 0x0064(v1)            # 00000064
    bgez    a1, lbl_800CA61C
    sub.s   $f6, $f4, $f0
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f18                  # $f18 = 4294967000.00
    nop
    add.s   $f10, $f10, $f18
lbl_800CA61C:
    div.s   $f16, $f6, $f10
    sh      a1, 0x006C(v1)             # 0000006C
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    sllv    t8, t9, a0
    swc1    $f16, 0x0068(v1)           # 00000068
    lhu     t7, 0x0250(v0)             # 00000250
    or      t5, t7, t8                 # t5 = 80124C00
    b       lbl_800CAA5C
    sh      t5, 0x0250(v0)             # 00000250
    lui     $at, 0x00FF                # $at = 00FF0000
    and     v0, s0, $at
    srl     v0, v0, 15
    andi    v1, v0, 0x00FF             # v1 = 00000000
    bne     v1, $zero, lbl_800CA660
    andi    a1, v0, 0x00FF             # a1 = 00000000
    addiu   a1, v1, 0x0001             # a1 = 00000001
    andi    a1, a1, 0x00FF             # a1 = 00000001
lbl_800CA660:
    andi    t0, a3, 0x00FF             # t0 = 00000000
    sll     t6, t0,  2
    addu    t6, t6, t0
    sll     t6, t6,  2
    subu    t6, t6, t0
    sll     t6, t6,  3
    andi    a2, s0, 0x0F00             # a2 = 00000000
    lui     t1, 0x8012                 # t1 = 80120000
    srl     a2, a2,  8
    addu    t6, t6, t0
    andi    t8, s0, 0x00FF             # t8 = 00000000
    mtc1    t8, $f4                    # $f4 = 0.00
    addiu   t1, t1, 0x4C00             # t1 = 80124C00
    sll     t6, t6,  2
    andi    a2, a2, 0x00FF             # a2 = 00000000
    sll     a0, a2,  5
    addu    t9, t1, t6
    addu    v0, t9, a0
    bgez    t8, lbl_800CA6C0
    cvt.s.w $f8, $f4
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f18                  # $f18 = 4294967000.00
    nop
    add.s   $f8, $f8, $f18
lbl_800CA6C0:
    lui     $at, 0x42FE                # $at = 42FE0000
    mtc1    $at, $f6                   # $f6 = 127.00
    lwc1    $f10, 0x0050(v0)           # 00000050
    div.s   $f0, $f8, $f6
    c.eq.s  $f10, $f0
    swc1    $f0, 0x0054(v0)            # 00000054
    bc1t    lbl_800CAA5C
    sll     t5, t0,  2
    addu    t5, t5, t0
    sll     t5, t5,  2
    subu    t5, t5, t0
    sll     t5, t5,  3
    addu    t5, t5, t0
    sll     t5, t5,  2
    addu    v0, t1, t5
    addu    v1, v0, a0
    lwc1    $f16, 0x0050(v1)           # 00000050
    lwc1    $f4, 0x0054(v1)            # 00000054
    mtc1    a1, $f8                    # $f8 = 0.00
    lui     $at, 0x4F80                # $at = 4F800000
    sub.s   $f18, $f16, $f4
    bgez    a1, lbl_800CA728
    cvt.s.w $f6, $f8
    mtc1    $at, $f10                  # $f10 = 4294967000.00
    nop
    add.s   $f6, $f6, $f10
lbl_800CA728:
    div.s   $f16, $f18, $f6
    sh      a1, 0x005C(v1)             # 0000005C
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    sllv    t7, t9, a2
    swc1    $f16, 0x0058(v1)           # 00000058
    lhu     t6, 0x0252(v0)             # 00000252
    or      t8, t6, t7                 # t8 = 00000000
    b       lbl_800CAA5C
    sh      t8, 0x0252(v0)             # 00000252
    andi    t9, a3, 0x00FF             # t9 = 00000000
    sll     t6, t9, 16
    lui     $at, 0x4600                # $at = 46000000
    or      t7, t6, $at                # t7 = 46000000
    lui     $at, 0x00FF                # $at = 00FF0000
    and     t8, s0, $at
    srl     t9, t8, 16
    or      a1, s0, $zero              # a1 = 00000000
    sll     a1, a1, 24
    andi    t6, t9, 0x00FF             # t6 = 00000000
    or      a0, t7, t6                 # a0 = 46000000
    jal     func_800BB0E0
    sra     a1, a1, 24
    b       lbl_800CAA60
    lw      $ra, 0x001C($sp)
    andi    v0, a3, 0x00FF             # v0 = 00000000
    sll     t8, v0,  2
    addu    t8, t8, v0
    sll     t8, t8,  2
    subu    t8, t8, v0
    sll     t8, t8,  3
    lui     t1, 0x8012                 # t1 = 80120000
    addu    t8, t8, v0
    addiu   t1, t1, 0x4C00             # t1 = 80124C00
    sll     t8, t8,  2
    addu    t5, t1, t8
    andi    a2, s0, 0x0F00             # a2 = 00000000
    lhu     t9, 0x0258(t5)             # 00000258
    srl     a2, a2,  8
    andi    a2, a2, 0x00FF             # a2 = 00000000
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    sllv    t6, t7, a2
    and     t8, t9, t6
    bne     t8, $zero, lbl_800CAA5C
    andi    t5, v0, 0x00FF             # t5 = 00000000
    sll     t7, t5, 16
    lui     $at, 0x0600                # $at = 06000000
    or      t9, t7, $at                # t9 = 06000001
    andi    t6, a2, 0x00FF             # t6 = 00000000
    sll     t8, t6,  8
    lui     $at, 0x00FF                # $at = 00FF0000
    and     t7, s0, $at
    or      t5, t9, t8                 # t5 = 06000001
    srl     t9, t7, 16
    or      a1, s0, $zero              # a1 = 00000000
    sll     a1, a1, 24
    andi    t8, t9, 0x00FF             # t8 = 00000001
    or      a0, t5, t8                 # a0 = 06000001
    jal     func_800BB0E0
    sra     a1, a1, 24
    b       lbl_800CAA60
    lw      $ra, 0x001C($sp)
    andi    t6, a3, 0x00FF             # t6 = 00000000
    sll     t9, t6,  2
    addu    t9, t9, t6
    sll     t9, t9,  2
    subu    t9, t9, t6
    sll     t9, t9,  3
    lui     t1, 0x8012                 # t1 = 80120000
    addu    t9, t9, t6
    addiu   t1, t1, 0x4C00             # t1 = 80124C00
    sll     t9, t9,  2
    addu    t5, t1, t9
    b       lbl_800CAA5C
    sh      s0, 0x0258(t5)             # 00000258
    or      a1, s0, $zero              # a1 = 00000000
    andi    a1, a1, 0xFFFF             # a1 = 00000000
    beq     a1, $zero, lbl_800CA8A4
    or      v1, a1, $zero              # v1 = 00000000
    or      v0, a3, $zero              # v0 = 00000000
    andi    v0, v0, 0x00FF             # v0 = 00000000
    sll     v0, v0, 16
    lui     $at, 0x9000                # $at = 90000000
    or      a0, v0, $at                # a0 = 90000000
    sw      v0, 0x0030($sp)
    sw      a1, 0x0034($sp)
    jal     func_800BB110
    sw      a3, 0x003C($sp)
    lw      v0, 0x0030($sp)
    lui     $at, 0x0800                # $at = 08000000
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    or      a0, v0, $at                # a0 = 08000000
    jal     func_800BB0E0
    ori     a0, a0, 0xFF00             # a0 = 0800FF00
    lw      v1, 0x0034($sp)
    lw      a3, 0x003C($sp)
lbl_800CA8A4:
    xori    a2, v1, 0xFFFF             # a2 = FFFFFFFF
    beq     a2, $zero, lbl_800CAA5C
    or      v0, a3, $zero              # v0 = 00000000
    andi    v0, v0, 0x00FF             # v0 = 00000000
    sll     v0, v0, 16
    lui     $at, 0x9000                # $at = 90000000
    or      a0, v0, $at                # a0 = 90000000
    lui     $at, 0x0800                # $at = 08000000
    or      s0, v0, $at                # s0 = 08000000
    ori     s0, s0, 0xFF00             # s0 = 0800FF00
    jal     func_800BB110
    andi    a1, a2, 0xFFFF             # a1 = 0000FFFF
    or      a0, s0, $zero              # a0 = 0800FF00
    jal     func_800BB0E0
    or      a1, $zero, $zero           # a1 = 00000000
    b       lbl_800CAA60
    lw      $ra, 0x001C($sp)
    andi    t8, a3, 0x00FF             # t8 = 00000000
    sll     t6, t8,  2
    addu    t6, t6, t8
    sll     t6, t6,  2
    subu    t6, t6, t8
    sll     t6, t6,  3
    lui     t1, 0x8012                 # t1 = 80120000
    addu    t6, t6, t8
    addiu   t1, t1, 0x4C00             # t1 = 80124C00
    sll     t6, t6,  2
    addu    t9, t1, t6
    b       lbl_800CAA5C
    sw      s0, 0x0014(t9)             # 00000014
    lui     $at, 0x00F0                # $at = 00F00000
    and     t7, s0, $at
    srl     t5, t7, 20
    andi    t8, t5, 0x00FF             # t8 = 00000000
    addiu   $at, $zero, 0x000F         # $at = 0000000F
    beq     t8, $at, lbl_800CA998
    andi    t6, a3, 0x00FF             # t6 = 00000000
    sll     t9, t6,  2
    addu    t9, t9, t6
    sll     t9, t9,  2
    subu    t9, t9, t6
    sll     t9, t9,  3
    lui     t1, 0x8012                 # t1 = 80120000
    addu    t9, t9, t6
    addiu   t1, t1, 0x4C00             # t1 = 80124C00
    sll     t9, t9,  2
    addu    v0, t1, t9
    lbu     v1, 0x004D(v0)             # 0000004D
    slti    $at, v1, 0x0007
    beq     $at, $zero, lbl_800CAA5C
    andi    t1, v1, 0x00FF             # t1 = 00000000
    addiu   t7, v1, 0x0001             # t7 = 00000001
    slti    $at, t1, 0x0008
    beq     $at, $zero, lbl_800CAA5C
    sb      t7, 0x004D(v0)             # 0000004D
    sll     t5, t1,  2
    addu    t8, v0, t5
    sw      s0, 0x002C(t8)             # 0000002C
    addiu   t6, $zero, 0x0002          # t6 = 00000002
    b       lbl_800CAA5C
    sb      t6, 0x004C(v0)             # 0000004C
lbl_800CA998:
    andi    t9, a3, 0x00FF             # t9 = 00000000
    sll     t7, t9,  2
    addu    t7, t7, t9
    sll     t7, t7,  2
    subu    t7, t7, t9
    sll     t7, t7,  3
    lui     t1, 0x8012                 # t1 = 80120000
    addu    t7, t7, t9
    addiu   t1, t1, 0x4C00             # t1 = 80124C00
    sll     t7, t7,  2
    addu    t5, t1, t7
    b       lbl_800CAA5C
    sb      $zero, 0x004D(t5)          # 0000004D
    andi    v0, s0, 0x0F00             # v0 = 00000F00
    srl     v0, v0,  8
    andi    v0, v0, 0x00FF             # v0 = 00000000
    beq     v0, $zero, lbl_800CA9F4
    lui     a0, 0xF000                 # a0 = F0000000
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     v0, $at, lbl_800CAA10
    andi    t5, s0, 0x0001             # t5 = 00000000
    b       lbl_800CAA60
    lw      $ra, 0x001C($sp)
lbl_800CA9F4:
    andi    t6, s0, 0x00FF             # t6 = 00000000
    lui     a1, 0x8010                 # a1 = 80100000
    addu    a1, a1, t6
    jal     func_800BB0BC
    lbu     a1, 0x43BC(a1)             # 801043BC
    b       lbl_800CAA60
    lw      $ra, 0x001C($sp)
lbl_800CAA10:
    lui     $at, 0x8010                # $at = 80100000
    b       lbl_800CAA5C
    sb      t5, 0x43B8($at)            # 801043B8
    andi    t8, s0, 0xFF00             # t8 = 0000FF00
    lui     v1, 0x8010                 # v1 = 80100000
    srl     t6, t8,  8
    lui     $at, 0x8010                # $at = 80100000
    addiu   v1, v1, 0x43C0             # v1 = 801043C0
    sb      t6, 0x438C($at)            # 8010438C
    lbu     t9, 0x0000(v1)             # 801043C0
    sb      s0, 0x0000(v1)             # 801043C0
    andi    a0, s0, 0x00FF             # a0 = 00000000
    jal     func_800BB548
    sb      t9, 0x0059($sp)
    jal     func_800C7E98
    lbu     a0, 0x0059($sp)
    lui     a0, 0xF800                 # a0 = F8000000
    jal     func_800BB0BC
    or      a1, $zero, $zero           # a1 = 00000000
lbl_800CAA5C:
    lw      $ra, 0x001C($sp)
lbl_800CAA60:
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0068           # $sp += 0x68
    jr      $ra
    nop


func_800CAA70:
# MqDbg: 
# Change background music?
# (writes data to the audio buffer for background music)
# A0 = u8? music ID
    lui     v1, 0x8010                 # v1 = 80100000
    addiu   v1, v1, 0x43B0             # v1 = 801043B0
    lbu     v0, 0x0000(v1)             # 801043B0
    lui     $at, 0x8012                # $at = 80120000
    sll     t6, v0,  2
    addu    $at, $at, t6
    sw      a0, 0x4800($at)            # 80124800
    addiu   t7, v0, 0x0001             # t7 = 00000001
    jr      $ra
    sb      t7, 0x0000(v1)             # 801043B0


func_800CAA98:
# MqDbg: 
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      s2, 0x001C($sp)
    sw      s1, 0x0018($sp)
    lui     s1, 0x8010                 # s1 = 80100000
    lui     s2, 0x8010                 # s2 = 80100000
    addiu   s2, s2, 0x43B0             # s2 = 801043B0
    addiu   s1, s1, 0x43B4             # s1 = 801043B4
    sw      s0, 0x0014($sp)
    lbu     s0, 0x0000(s1)             # 801043B4
    lbu     t6, 0x0000(s2)             # 801043B0
    sw      s3, 0x0020($sp)
    sw      $ra, 0x0024($sp)
    beq     s0, t6, lbl_800CAAFC
    lui     s3, 0x8012                 # s3 = 80120000
    addiu   s3, s3, 0x4800             # s3 = 80124800
    sll     t7, s0,  2
lbl_800CAAD8:
    addu    t8, s3, t7
    lw      a0, 0x0000(t8)             # 00000000
    addiu   t9, s0, 0x0001             # t9 = 00000001
    jal     func_800C9FAC
    sb      t9, 0x0000(s1)             # 801043B4
    lbu     s0, 0x0000(s1)             # 801043B4
    lbu     t0, 0x0000(s2)             # 801043B0
    bnel    s0, t0, lbl_800CAAD8
    sll     t7, s0,  2
lbl_800CAAFC:
    lw      $ra, 0x0024($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28


func_800CAB18:
# MqDbg: 
    sw      a0, 0x0000($sp)
    andi    a0, a0, 0x00FF             # a0 = 00000000
    sll     t6, a0,  2
    subu    t6, t6, a0
    sll     t6, t6,  2
    subu    t6, t6, a0
    sll     t6, t6,  5
    lui     t7, 0x8013                 # t7 = 80130000
    addu    t7, t7, t6
    lw      t7, -0x74A0(t7)            # 80128B60
    sll     t9, a0,  2
    addu    t9, t9, a0
    srl     t8, t7, 31
    bne     t8, $zero, lbl_800CAB5C
    sll     t9, t9,  2
    jr      $ra
    ori     v0, $zero, 0xFFFF          # v0 = 0000FFFF
lbl_800CAB5C:
    subu    t9, t9, a0
    sll     t9, t9,  3
    addu    t9, t9, a0
    sll     t9, t9,  2
    lui     v0, 0x8012                 # v0 = 80120000
    addu    v0, v0, t9
    lhu     v0, 0x4E54(v0)             # 80124E54
    jr      $ra
    nop


func_800CAB80:
# MqDbg: 
    lui     v0, 0x8010                 # v0 = 80100000
    lui     v1, 0x8010                 # v1 = 80100000
    lbu     v1, 0x43B0(v1)             # 801043B0
    lbu     v0, 0x43B4(v0)             # 801043B4
    lui     a2, 0x8012                 # a2 = 80120000
    addiu   a2, a2, 0x4800             # a2 = 80124800
    beq     v1, v0, lbl_800CABCC
    sll     t6, v0,  2
lbl_800CABA0:
    addu    t7, a2, t6
    lw      t8, 0x0000(t7)             # 00000000
    addiu   v0, v0, 0x0001             # v0 = 80100001
    andi    v0, v0, 0x00FF             # v0 = 00000001
    and     t9, t8, a1
    bne     a0, t9, lbl_800CABC4
    nop
    jr      $ra
    or      v0, $zero, $zero           # v0 = 00000000
lbl_800CABC4:
    bnel    v1, v0, lbl_800CABA0
    sll     t6, v0,  2
lbl_800CABCC:
    addiu   v0, $zero, 0x0001          # v0 = 00000001
    jr      $ra
    nop


func_800CABD8:
# MqDbg: 
    sw      a0, 0x0000($sp)
    andi    a0, a0, 0x00FF             # a0 = 00000000
    lui     $at, 0x8012                # $at = 80120000
    addu    $at, $at, a0
    jr      $ra
    sb      $zero, 0x47F8($at)         # 801247F8


func_800CABF0:
# MqDbg: 
    sw      a0, 0x0000($sp)
    andi    a0, a0, 0x00FF             # a0 = 00000000
    sll     t6, a0,  2
    addu    t6, t6, a0
    sll     t6, t6,  2
    subu    t6, t6, a0
    sll     t6, t6,  3
    addu    t6, t6, a0
    lui     t7, 0x8012                 # t7 = 80120000
    addiu   t7, t7, 0x4C00             # t7 = 80124C00
    sll     t6, t6,  2
    addu    v1, t6, t7
    lbu     a2, 0x004D(v1)             # 0000004D
    sw      a1, 0x0004($sp)
    andi    a3, a1, 0x00FF             # a3 = 00000000
    blez    a2, lbl_800CAC9C
    or      v0, $zero, $zero           # v0 = 00000000
    sll     t8, a0,  2
    addu    t8, t8, a0
    sll     t8, t8,  2
    subu    t8, t8, a0
    sll     t8, t8,  3
    addu    t8, t8, a0
    sll     t8, t8,  2
    addu    a1, t8, t7
    or      t0, a3, $zero              # t0 = 00000000
    lui     t2, 0xFF00                 # t2 = FF000000
    lui     t1, 0x00F0                 # t1 = 00F00000
    sll     t9, v0,  2
lbl_800CAC64:
    addu    a3, a1, t9
    lw      t3, 0x002C(a3)             # 0000002C
    addiu   v0, v0, 0x0001             # v0 = 00000001
    andi    v0, v0, 0x00FF             # v0 = 00000001
    and     a0, t3, t1
    srl     a0, a0, 20
    andi    a0, a0, 0x00FF             # a0 = 00000000
    bnel    t0, a0, lbl_800CAC94
    slt     $at, v0, a2
    sw      t2, 0x002C(a3)             # 0000002C
    lbu     a2, 0x004D(v1)             # 0000004D
    slt     $at, v0, a2
lbl_800CAC94:
    bnel    $at, $zero, lbl_800CAC64
    sll     t9, v0,  2
lbl_800CAC9C:
    jr      $ra
    nop


func_800CACA4:
# MqDbg: 
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      a0, 0x0018($sp)
    lbu     t6, 0x001B($sp)
    lui     t1, 0x8012                 # t1 = 80120000
    addiu   t1, t1, 0x4C00             # t1 = 80124C00
    sll     t7, t6,  2
    addu    t7, t7, t6
    sll     t7, t7,  2
    subu    t7, t7, t6
    sll     t7, t7,  3
    addu    t7, t7, t6
    sw      a1, 0x001C($sp)
    sll     t7, t7,  2
    andi    a1, a1, 0x00FF             # a1 = 00000000
    sw      a3, 0x0024($sp)
    addu    v1, t1, t7
    andi    a3, a3, 0x00FF             # a3 = 00000000
    addu    t9, v1, a1
    andi    t8, a2, 0x007F             # t8 = 00000000
    sw      $ra, 0x0014($sp)
    sw      a2, 0x0020($sp)
    sb      t8, 0x000E(t9)             # 0000000E
    beq     a3, $zero, lbl_800CAD38
    or      t0, a3, $zero              # t0 = 00000000
    lbu     t2, 0x001B($sp)
    addiu   t4, $zero, 0x0001          # t4 = 00000001
    sll     t3, t2,  2
    addu    t3, t3, t2
    sll     t3, t3,  2
    subu    t3, t3, t2
    sll     t3, t3,  3
    addu    t3, t3, t2
    sll     t3, t3,  2
    addu    v0, t1, t3
    sb      t4, 0x0013(v0)             # 00000013
    b       lbl_800CAE30
    sb      a3, 0x0012(v0)             # 00000012
lbl_800CAD38:
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f0                   # $f0 = 1.00
    lui     $at, 0x42FE                # $at = 42FE0000
    mtc1    $at, $f2                   # $f2 = 127.00
    or      v0, $zero, $zero           # v0 = 00000000
    addu    t5, v1, v0
lbl_800CAD50:
    lbu     t6, 0x000E(t5)             # 0000000E
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    t6, $f4                    # $f4 = 0.00
    bgez    t6, lbl_800CAD70
    cvt.s.w $f6, $f4
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f6, $f6, $f8
lbl_800CAD70:
    div.s   $f10, $f6, $f2
    addiu   v0, v0, 0x0001             # v0 = 00000001
    andi    v0, v0, 0x00FF             # v0 = 00000001
    slti    $at, v0, 0x0004
    mul.s   $f0, $f0, $f10
    bnel    $at, $zero, lbl_800CAD50
    addu    t5, v1, v0
    mul.s   $f16, $f0, $f2
    addiu   t5, $zero, 0x0001          # t5 = 00000001
    lbu     t7, 0x001B($sp)
    lui     $at, 0x4000                # $at = 40000000
    sll     t2, t0, 16
    sll     t8, t7, 24
    or      t9, t8, $at                # t9 = 40000000
    cfc1    t4, $f31
    ctc1    t5, $f31
    or      t3, t9, t2                 # t3 = 40000000
    cvt.w.s $f18, $f16
    cfc1    t5, $f31
    nop
    andi    t5, t5, 0x0078             # t5 = 00000000
    beq     t5, $zero, lbl_800CAE10
    lui     $at, 0x4F00                # $at = 4F000000
    mtc1    $at, $f18                  # $f18 = 2147484000.00
    addiu   t5, $zero, 0x0001          # t5 = 00000001
    sub.s   $f18, $f16, $f18
    ctc1    t5, $f31
    nop
    cvt.w.s $f18, $f18
    cfc1    t5, $f31
    nop
    andi    t5, t5, 0x0078             # t5 = 00000000
    bne     t5, $zero, lbl_800CAE08
    nop
    mfc1    t5, $f18
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800CAE20
    or      t5, t5, $at                # t5 = 80000000
lbl_800CAE08:
    b       lbl_800CAE20
    addiu   t5, $zero, 0xFFFF          # t5 = FFFFFFFF
lbl_800CAE10:
    mfc1    t5, $f18
    nop
    bltz    t5, lbl_800CAE08
    nop
lbl_800CAE20:
    ctc1    t4, $f31
    andi    t6, t5, 0x00FF             # t6 = 000000FF
    jal     func_800C9FAC
    or      a0, t3, t6                 # a0 = 400000FF
lbl_800CAE30:
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800CAE40:
# MqDbg: 
    addiu   $sp, $sp, 0xFF70           # $sp -= 0x90
    sw      s7, 0x003C($sp)
    sdc1    $f20, 0x0018($sp)
    lui     $at, 0x42FE                # $at = 42FE0000
    sw      s8, 0x0040($sp)
    sw      s6, 0x0038($sp)
    sw      s5, 0x0034($sp)
    lui     s7, 0x8012                 # s7 = 80120000
    mtc1    $at, $f20                  # $f20 = 127.00
    sw      $ra, 0x0044($sp)
    sw      s4, 0x0030($sp)
    sw      s3, 0x002C($sp)
    sw      s2, 0x0028($sp)
    sw      s1, 0x0024($sp)
    sw      s0, 0x0020($sp)
    addiu   s7, s7, 0x4C00             # s7 = 80124C00
    or      s5, $zero, $zero           # s5 = 00000000
    lui     s6, 0xE300                 # s6 = E3000000
    addiu   s8, $zero, 0x0264          # s8 = 00000264
lbl_800CAE8C:
    multu   s5, s8
    mflo    t6
    addu    s2, s7, t6
    lbu     t7, 0x0260(s2)             # 00000260
    beql    t7, $zero, lbl_800CAEE0
    lbu     t8, 0x0013(s2)             # 00000013
    jal     func_800BB3E0
    addiu   a0, $sp, 0x0070            # a0 = FFFFFFE0
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     v0, $at, lbl_800CAED0
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     v0, $at, lbl_800CAED0
    addiu   $at, $zero, 0x0003         # $at = 00000003
    beq     v0, $at, lbl_800CAED0
    addiu   $at, $zero, 0x0004         # $at = 00000004
    bnel    v0, $at, lbl_800CAEE0
    lbu     t8, 0x0013(s2)             # 00000013
lbl_800CAED0:
    sb      $zero, 0x0260(s2)          # 00000260
    jal     func_800C9FAC
    lw      a0, 0x025C(s2)             # 0000025C
    lbu     t8, 0x0013(s2)             # 00000013
lbl_800CAEE0:
    beq     t8, $zero, lbl_800CB000
    sll     t9, s5,  2
    addu    t9, t9, s5
    sll     t9, t9,  2
    subu    t9, t9, s5
    sll     t9, t9,  3
    lui     $at, 0x3F80                # $at = 3F800000
    addu    t9, t9, s5
    sll     t9, t9,  2
    mtc1    $at, $f0                   # $f0 = 1.00
    addu    s4, s7, t9
    or      s3, $zero, $zero           # s3 = 00000000
    or      v0, s5, $zero              # v0 = 00000000
    addu    t2, s4, s3
lbl_800CAF18:
    lbu     t3, 0x000E(t2)             # 0000000E
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    t3, $f4                    # $f4 = 0.00
    bgez    t3, lbl_800CAF38
    cvt.s.w $f6, $f4
    mtc1    $at, $f8                   # $f8 = 4294967000.00
    nop
    add.s   $f6, $f6, $f8
lbl_800CAF38:
    div.s   $f10, $f6, $f20
    addiu   s3, s3, 0x0001             # s3 = 00000001
    andi    s3, s3, 0x00FF             # s3 = 00000001
    slti    $at, s3, 0x0004
    mul.s   $f0, $f0, $f10
    bnel    $at, $zero, lbl_800CAF18
    addu    t2, s4, s3
    mul.s   $f16, $f0, $f20
    addiu   t2, $zero, 0x0001          # t2 = 00000001
    lbu     t4, 0x0012(s2)             # 00000012
    lui     $at, 0x4000                # $at = 40000000
    sll     t7, v0, 24
    sll     t5, t4, 16
    or      t6, t5, $at                # t6 = 40000000
    cfc1    t9, $f31
    ctc1    t2, $f31
    or      t8, t6, t7                 # t8 = 40000000
    lui     $at, 0x4F00                # $at = 4F000000
    cvt.w.s $f18, $f16
    cfc1    t2, $f31
    nop
    andi    t2, t2, 0x0078             # t2 = 00000000
    beql    t2, $zero, lbl_800CAFE0
    mfc1    t2, $f18
    mtc1    $at, $f18                  # $f18 = 2147484000.00
    addiu   t2, $zero, 0x0001          # t2 = 00000001
    sub.s   $f18, $f16, $f18
    ctc1    t2, $f31
    nop
    cvt.w.s $f18, $f18
    cfc1    t2, $f31
    nop
    andi    t2, t2, 0x0078             # t2 = 00000000
    bne     t2, $zero, lbl_800CAFD4
    nop
    mfc1    t2, $f18
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800CAFEC
    or      t2, t2, $at                # t2 = 80000000
lbl_800CAFD4:
    b       lbl_800CAFEC
    addiu   t2, $zero, 0xFFFF          # t2 = FFFFFFFF
    mfc1    t2, $f18
lbl_800CAFE0:
    nop
    bltz    t2, lbl_800CAFD4
    nop
lbl_800CAFEC:
    ctc1    t9, $f31
    andi    t3, t2, 0x00FF             # t3 = 000000FF
    jal     func_800CAA70
    or      a0, t8, t3                 # a0 = 400000FF
    sb      $zero, 0x0013(s2)          # 00000013
lbl_800CB000:
    lhu     v0, 0x000C(s2)             # 0000000C
    beq     v0, $zero, lbl_800CB04C
    addiu   t4, v0, 0xFFFF             # t4 = FFFFFFFF
    andi    t5, t4, 0xFFFF             # t5 = 0000FFFF
    beq     t5, $zero, lbl_800CB02C
    sh      t4, 0x000C(s2)             # 0000000C
    lwc1    $f4, 0x0000(s2)            # 00000000
    lwc1    $f8, 0x0008(s2)            # 00000008
    sub.s   $f6, $f4, $f8
    b       lbl_800CB034
    swc1    $f6, 0x0000(s2)            # 00000000
lbl_800CB02C:
    lwc1    $f10, 0x0004(s2)           # 00000004
    swc1    $f10, 0x0000(s2)           # 00000000
lbl_800CB034:
    andi    a0, s5, 0x00FF             # a0 = 00000000
    sll     a0, a0, 16
    lui     $at, 0x4100                # $at = 41000000
    or      a0, a0, $at                # a0 = 41000000
    jal     func_800BB098
    lw      a1, 0x0000(s2)             # 00000000
lbl_800CB04C:
    lw      a1, 0x0014(s2)             # 00000014
    beq     a1, $zero, lbl_800CB290
    lui     $at, 0x00FF                # $at = 00FF0000
    and     v0, a1, $at
    srl     v0, v0, 15
    andi    a0, a1, 0x0FFF             # a0 = 00000000
    andi    a3, v0, 0x00FF             # a3 = 00000000
    or      v1, a1, $zero              # v1 = 00000000
    andi    t0, v0, 0x00FF             # t0 = 00000000
    bne     a3, $zero, lbl_800CB080
    andi    a2, a0, 0xFFFF             # a2 = 00000000
    addiu   t0, a3, 0x0001             # t0 = 00000001
    andi    t0, t0, 0x00FF             # t0 = 00000001
lbl_800CB080:
    sll     t6, s5,  2
    subu    t6, t6, s5
    sll     t6, t6,  2
    subu    t6, t6, s5
    lui     t7, 0x8012                 # t7 = 80120000
    addiu   t7, t7, 0x5630             # t7 = 80125630
    sll     t6, t6,  5
    addu    a1, t6, t7
    lw      t9, 0x3530(a1)             # 00003530
    addiu   $at, $zero, 0x0030         # $at = 00000030
    andi    v0, v1, 0xF000             # v0 = 00000000
    srl     t2, t9, 31
    beql    t2, $zero, lbl_800CB294
    lhu     v0, 0x0028(s2)             # 00000028
    lhu     t1, 0x3538(a1)             # 00003538
    srl     v0, v0, 12
    andi    v0, v0, 0x00FF             # v0 = 00000000
    div     $zero, t1, $at
    mflo    t1
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     v0, $at, lbl_800CB104
    andi    a3, t1, 0xFFFF             # a3 = 00000000
    addiu   $at, $zero, 0x0002         # $at = 00000002
    beq     v0, $at, lbl_800CB114
    andi    v1, a0, 0xFFFF             # v1 = 00000000
    addiu   $at, $zero, 0x0003         # $at = 00000003
    beq     v0, $at, lbl_800CB130
    andi    t3, a0, 0xFFFF             # t3 = 00000000
    addiu   $at, $zero, 0x0004         # $at = 00000004
    beql    v0, $at, lbl_800CB20C
    lhu     v0, 0x0018(s2)             # 00000018
    b       lbl_800CB220
    lhu     v0, 0x0018(s2)             # 00000018
lbl_800CB104:
    addu    a2, a0, a3
    andi    a2, a2, 0xFFFF             # a2 = 00000000
    b       lbl_800CB220
    lhu     v0, 0x0018(s2)             # 00000018
lbl_800CB114:
    slt     $at, v1, a3
    beq     $at, $zero, lbl_800CB128
    or      v0, a3, $zero              # v0 = 00000000
    subu    a2, v0, v1
    andi    a2, a2, 0xFFFF             # a2 = 00000000
lbl_800CB128:
    b       lbl_800CB220
    lhu     v0, 0x0018(s2)             # 00000018
lbl_800CB130:
    mtc1    t3, $f16                   # $f16 = 0.00
    mtc1    a3, $f10                   # $f10 = 0.00
    bgez    t3, lbl_800CB150
    cvt.s.w $f18, $f16
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f18, $f18, $f4
lbl_800CB150:
    lui     $at, 0x42C8                # $at = 42C80000
    mtc1    $at, $f8                   # $f8 = 100.00
    cvt.s.w $f16, $f10
    bgez    a3, lbl_800CB174
    div.s   $f6, $f18, $f8
    lui     $at, 0x4F80                # $at = 4F800000
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f16, $f16, $f4
lbl_800CB174:
    mul.s   $f18, $f16, $f6
    addiu   a2, $zero, 0x0001          # a2 = 00000001
    lui     $at, 0x4F00                # $at = 4F000000
    cfc1    t4, $f31
    ctc1    a2, $f31
    nop
    cvt.w.s $f8, $f18
    cfc1    a2, $f31
    nop
    andi    a2, a2, 0x0078             # a2 = 00000000
    beql    a2, $zero, lbl_800CB1EC
    mfc1    a2, $f8
    mtc1    $at, $f8                   # $f8 = 2147484000.00
    addiu   a2, $zero, 0x0001          # a2 = 00000001
    sub.s   $f8, $f18, $f8
    ctc1    a2, $f31
    nop
    cvt.w.s $f8, $f8
    cfc1    a2, $f31
    nop
    andi    a2, a2, 0x0078             # a2 = 00000000
    bne     a2, $zero, lbl_800CB1E0
    nop
    mfc1    a2, $f8
    lui     $at, 0x8000                # $at = 80000000
    b       lbl_800CB1F8
    or      a2, a2, $at                # a2 = 80000000
lbl_800CB1E0:
    b       lbl_800CB1F8
    addiu   a2, $zero, 0xFFFF          # a2 = FFFFFFFF
    mfc1    a2, $f8
lbl_800CB1EC:
    nop
    bltz    a2, lbl_800CB1E0
    nop
lbl_800CB1F8:
    ctc1    t4, $f31
    andi    a2, a2, 0xFFFF             # a2 = 0000FFFF
    b       lbl_800CB220
    lhu     v0, 0x0018(s2)             # 00000018
    lhu     v0, 0x0018(s2)             # 00000018
lbl_800CB20C:
    andi    a2, a3, 0xFFFF             # a2 = 00000000
    beq     v0, $zero, lbl_800CB220
    nop
    b       lbl_800CB220
    andi    a2, v0, 0xFFFF             # a2 = 00000000
lbl_800CB220:
    mtc1    t1, $f16                   # $f16 = 0.00
    slti    $at, a2, 0x012D
    bne     $at, $zero, lbl_800CB234
    cvt.s.w $f2, $f16
    addiu   a2, $zero, 0x012C          # a2 = 0000012C
lbl_800CB234:
    mtc1    a2, $f10                   # $f10 = 0.00
    bne     v0, $zero, lbl_800CB244
    lui     $at, 0x4F80                # $at = 4F800000
    sh      a3, 0x0018(s2)             # 00000018
lbl_800CB244:
    bgez    a2, lbl_800CB258
    cvt.s.w $f0, $f10
    mtc1    $at, $f4                   # $f4 = 4294967000.00
    nop
    add.s   $f0, $f0, $f4
lbl_800CB258:
    mtc1    t0, $f18                   # $f18 = 0.00
    swc1    $f0, 0x0020(s2)            # 00000020
    swc1    $f2, 0x001C(s2)            # 0000001C
    sub.s   $f6, $f2, $f0
    lui     $at, 0x4F80                # $at = 4F800000
    bgez    t0, lbl_800CB280
    cvt.s.w $f8, $f18
    mtc1    $at, $f10                  # $f10 = 4294967000.00
    nop
    add.s   $f8, $f8, $f10
lbl_800CB280:
    div.s   $f4, $f6, $f8
    sh      t0, 0x0028(s2)             # 00000028
    sw      $zero, 0x0014(s2)          # 00000014
    swc1    $f4, 0x0024(s2)            # 00000024
lbl_800CB290:
    lhu     v0, 0x0028(s2)             # 00000028
lbl_800CB294:
    beq     v0, $zero, lbl_800CB2E8
    addiu   t5, v0, 0xFFFF             # t5 = FFFFFFFF
    andi    t6, t5, 0xFFFF             # t6 = 0000FFFF
    andi    v1, s5, 0x00FF             # v1 = 00000000
    sh      t5, 0x0028(s2)             # 00000028
    beq     t6, $zero, lbl_800CB2C4
    sll     v1, v1, 16
    lwc1    $f16, 0x001C(s2)           # 0000001C
    lwc1    $f18, 0x0024(s2)           # 00000024
    sub.s   $f10, $f16, $f18
    b       lbl_800CB2CC
    swc1    $f10, 0x001C(s2)           # 0000001C
lbl_800CB2C4:
    lwc1    $f6, 0x0020(s2)            # 00000020
    swc1    $f6, 0x001C(s2)            # 0000001C
lbl_800CB2CC:
    lwc1    $f8, 0x001C(s2)            # 0000001C
    lui     $at, 0x4700                # $at = 47000000
    or      a0, v1, $at                # a0 = 47000000
    trunc.w.s $f4, $f8
    mfc1    a1, $f4
    jal     func_800BB0BC
    nop
lbl_800CB2E8:
    lhu     t9, 0x0252(s2)             # 00000252
    beq     t9, $zero, lbl_800CB3A0
    sll     t2, s5,  2
    addu    t2, t2, s5
    sll     t2, t2,  2
    subu    t2, t2, s5
    sll     t2, t2,  3
    addu    t2, t2, s5
    sll     t2, t2,  2
    addu    s4, s7, t2
    or      s0, $zero, $zero           # s0 = 00000000
    sll     a0, s0,  5
lbl_800CB318:
    addu    v0, s4, a0
    lhu     v1, 0x005C(v0)             # 0000005C
    andi    a2, s5, 0x00FF             # a2 = 00000000
    sll     a2, a2, 16
    beq     v1, $zero, lbl_800CB38C
    addiu   t8, v1, 0xFFFF             # t8 = FFFFFFFF
    lui     $at, 0x0100                # $at = 01000000
    andi    t3, t8, 0xFFFF             # t3 = 0000FFFF
    sh      t8, 0x005C(v0)             # 0000005C
    beq     t3, $zero, lbl_800CB358
    or      a2, a2, $at                # a2 = 01000000
    lwc1    $f16, 0x0050(v0)           # 00000050
    lwc1    $f18, 0x0058(v0)           # 00000058
    sub.s   $f10, $f16, $f18
    b       lbl_800CB378
    swc1    $f10, 0x0050(v0)           # 00000050
lbl_800CB358:
    addu    v1, s2, a0
    lwc1    $f6, 0x0054(v1)            # 00000054
    addiu   t5, $zero, 0x0001          # t5 = 00000001
    sllv    t6, t5, s0
    swc1    $f6, 0x0050(v1)            # 00000050
    lhu     t4, 0x0252(s2)             # 00000252
    xor     t7, t4, t6
    sh      t7, 0x0252(s2)             # 00000252
lbl_800CB378:
    andi    t9, s0, 0x00FF             # t9 = 00000000
    sll     t2, t9,  8
    or      a0, a2, t2                 # a0 = 01000000
    jal     func_800BB098
    lw      a1, 0x0050(v0)             # 00000050
lbl_800CB38C:
    addiu   s0, s0, 0x0001             # s0 = 00000001
    andi    s0, s0, 0x00FF             # s0 = 00000001
    slti    $at, s0, 0x0010
    bnel    $at, $zero, lbl_800CB318
    sll     a0, s0,  5
lbl_800CB3A0:
    lhu     t8, 0x0250(s2)             # 00000250
    beq     t8, $zero, lbl_800CB458
    sll     t3, s5,  2
    addu    t3, t3, s5
    sll     t3, t3,  2
    subu    t3, t3, s5
    sll     t3, t3,  3
    addu    t3, t3, s5
    sll     t3, t3,  2
    addu    s4, s7, t3
    or      s0, $zero, $zero           # s0 = 00000000
    sll     a0, s0,  5
lbl_800CB3D0:
    addu    v0, s4, a0
    lhu     v1, 0x006C(v0)             # 0000006C
    andi    a2, s5, 0x00FF             # a2 = 00000000
    sll     a2, a2, 16
    beq     v1, $zero, lbl_800CB444
    addiu   t5, v1, 0xFFFF             # t5 = FFFFFFFF
    lui     $at, 0x0400                # $at = 04000000
    andi    t4, t5, 0xFFFF             # t4 = 0000FFFF
    sh      t5, 0x006C(v0)             # 0000006C
    beq     t4, $zero, lbl_800CB410
    or      a2, a2, $at                # a2 = 04000000
    lwc1    $f8, 0x0060(v0)            # 00000060
    lwc1    $f4, 0x0068(v0)            # 00000068
    sub.s   $f16, $f8, $f4
    b       lbl_800CB430
    swc1    $f16, 0x0060(v0)           # 00000060
lbl_800CB410:
    addu    v1, s2, a0
    lwc1    $f18, 0x0064(v1)           # 00000064
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    sllv    t9, t7, s0
    swc1    $f18, 0x0060(v1)           # 00000060
    lhu     t6, 0x0250(s2)             # 00000250
    xor     t2, t6, t9
    sh      t2, 0x0250(s2)             # 00000250
lbl_800CB430:
    andi    t8, s0, 0x00FF             # t8 = 00000000
    sll     t3, t8,  8
    or      a0, a2, t3                 # a0 = 04000000
    jal     func_800BB098
    lw      a1, 0x0060(v0)             # 00000060
lbl_800CB444:
    addiu   s0, s0, 0x0001             # s0 = 00000001
    andi    s0, s0, 0x00FF             # s0 = 00000001
    slti    $at, s0, 0x0010
    bnel    $at, $zero, lbl_800CB3D0
    sll     a0, s0,  5
lbl_800CB458:
    lbu     t5, 0x004D(s2)             # 0000004D
    beq     t5, $zero, lbl_800CB750
    lui     a0, 0xF000                 # a0 = F0000000
    jal     func_800CAB80
    or      a1, a0, $zero              # a1 = F0000000
    bnel    v0, $zero, lbl_800CB480
    lbu     v0, 0x004C(s2)             # 0000004C
    b       lbl_800CB764
    sb      $zero, 0x004D(s2)          # 0000004D
    lbu     v0, 0x004C(s2)             # 0000004C
lbl_800CB480:
    sll     t7, s5,  2
    subu    t7, t7, s5
    beq     v0, $zero, lbl_800CB49C
    sll     t7, t7,  2
    addiu   t4, v0, 0xFFFF             # t4 = FFFFFFFF
    b       lbl_800CB750
    sb      t4, 0x004C(s2)             # 0000004C
lbl_800CB49C:
    subu    t7, t7, s5
    sll     t7, t7,  5
    lui     t6, 0x8013                 # t6 = 80130000
    addu    t6, t6, t7
    lw      t6, -0x74A0(t6)            # 80128B60
    srl     t9, t6, 31
    bnel    t9, $zero, lbl_800CB754
    addiu   s5, s5, 0x0001             # s5 = 00000001
    lbu     v1, 0x004D(s2)             # 0000004D
    sll     t2, s5,  2
    addu    t2, t2, s5
    blez    v1, lbl_800CB74C
    or      s3, $zero, $zero           # s3 = 00000000
    sll     t2, t2,  2
    subu    t2, t2, s5
    sll     t2, t2,  3
    addu    t2, t2, s5
    sll     t2, t2,  2
    addu    s4, s7, t2
    sll     t8, s3,  2
lbl_800CB4EC:
    addu    t3, s4, t8
    lw      v0, 0x002C(t3)             # 0000002C
    lui     $at, 0x00F0                # $at = 00F00000
    and     a0, v0, $at
    lui     $at, 0x000F                # $at = 000F0000
    srl     a0, a0, 20
    and     s1, v0, $at
    andi    a0, a0, 0x00FF             # a0 = 00000000
    andi    s0, v0, 0xFF00             # s0 = 00000000
    srl     s1, s1, 16
    srl     s0, s0,  8
    sltiu   $at, a0, 0x000F
    or      a3, v0, $zero              # a3 = 00000000
    andi    s1, s1, 0x00FF             # s1 = 00000000
    andi    s0, s0, 0x00FF             # s0 = 00000000
    beq     $at, $zero, lbl_800CB738
    andi    a3, a3, 0x00FF             # a3 = 00000000
    sll     t5, a0,  2
    lui     $at, 0x8011                # $at = 80110000
    addu    $at, $at, t5
    lw      t5, -0x5E90($at)           # 8010A170
    jr      t5
    nop
    andi    a0, s1, 0x00FF             # a0 = 00000000
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    jal     func_800CACA4
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    b       lbl_800CB738
    lbu     v1, 0x004D(s2)             # 0000004D
    lui     t4, 0x8012                 # t4 = 80120000
    addu    t4, t4, s5
    lbu     t4, 0x47F8(t4)             # 801247F8
    andi    a0, s1, 0x00FF             # a0 = 00000000
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    bne     a3, t4, lbl_800CB738
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    jal     func_800CACA4
    andi    a3, s0, 0x00FF             # a3 = 00000000
    b       lbl_800CB738
    lbu     v1, 0x004D(s2)             # 0000004D
    lhu     t7, 0x0254(s2)             # 00000254
    lui     $at, 0x3000                # $at = 30000000
    sll     t9, s5, 24
    or      t6, t7, $at                # t6 = 30000000
    jal     func_800CAA70
    or      a0, t6, t9                 # a0 = 30000000
    b       lbl_800CB738
    lbu     v1, 0x004D(s2)             # 0000004D
    multu   s1, s8
    sll     t3, s1, 24
    lui     $at, 0x0001                # $at = 00010000
    mflo    t2
    addu    s0, s7, t2
    lhu     t8, 0x0254(s0)             # 00000254
    or      a0, t8, t3                 # a0 = 00000000
    jal     func_800CAA70
    or      a0, a0, $at                # a0 = 00010000
    addiu   t5, $zero, 0x0001          # t5 = 00000001
    addiu   t4, $zero, 0x007F          # t4 = 0000007F
    sb      t5, 0x0013(s0)             # 00000013
    sb      t4, 0x000F(s0)             # 0000000F
    b       lbl_800CB738
    lbu     v1, 0x004D(s2)             # 0000004D
    lui     $at, 0xB000                # $at = B0000000
    ori     $at, $at, 0x3000           # $at = B0003000
    sll     t7, s1, 24
    or      t6, t7, $at                # t6 = B0003000
    sll     t9, s0, 16
    or      t2, t6, t9                 # t2 = B0003000
    jal     func_800CAA70
    or      a0, t2, a3                 # a0 = B0003000
    b       lbl_800CB738
    lbu     v1, 0x004D(s2)             # 0000004D
    lui     $at, 0xB000                # $at = B0000000
    ori     $at, $at, 0x4000           # $at = B0004000
    sll     t8, s1, 24
    or      t3, t8, $at                # t3 = B0004000
    sll     t5, a3, 16
    jal     func_800CAA70
    or      a0, t3, t5                 # a0 = B0004000
    b       lbl_800CB738
    lbu     v1, 0x004D(s2)             # 0000004D
    multu   s1, s8
    sll     t9, s1, 24
    andi    v1, v0, 0xFFFF             # v1 = 00000000
    mflo    t4
    addu    s0, s7, t4
    lbu     t7, 0x004E(s0)             # 0000004E
    sll     t6, t7, 16
    or      t2, t6, t9                 # t2 = 00000000
    jal     func_800CAA70
    or      a0, t2, v1                 # a0 = 00000000
    andi    a0, s1, 0x00FF             # a0 = 00000000
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    jal     func_800CACA4
    or      a3, $zero, $zero           # a3 = 00000000
    sb      $zero, 0x004E(s0)          # 0000004E
    b       lbl_800CB738
    lbu     v1, 0x004D(s2)             # 0000004D
    sb      s0, 0x004E(s2)             # 0000004E
    b       lbl_800CB738
    lbu     v1, 0x004D(s2)             # 0000004D
    andi    a0, s1, 0x00FF             # a0 = 00000000
    andi    a1, s0, 0x00FF             # a1 = 00000000
    jal     func_800CACA4
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    b       lbl_800CB738
    lbu     v1, 0x004D(s2)             # 0000004D
    andi    t8, a3, 0x0001             # t8 = 00000000
    beq     t8, $zero, lbl_800CB6B8
    or      s0, a3, $zero              # s0 = 00000000
    or      a0, s6, $zero              # a0 = E3000000
    jal     func_800BB0BC
    or      a1, $zero, $zero           # a1 = 00000000
lbl_800CB6B8:
    andi    t3, s0, 0x0002             # t3 = 00000000
    beq     t3, $zero, lbl_800CB6CC
    or      a0, s6, $zero              # a0 = E3000000
    jal     func_800BB0BC
    addiu   a1, $zero, 0x0001          # a1 = 00000001
lbl_800CB6CC:
    andi    t5, s0, 0x0004             # t5 = 00000000
    beq     t5, $zero, lbl_800CB6E0
    or      a0, s6, $zero              # a0 = E3000000
    jal     func_800BB0BC
    addiu   a1, $zero, 0x0002          # a1 = 00000002
lbl_800CB6E0:
    b       lbl_800CB738
    lbu     v1, 0x004D(s2)             # 0000004D
    sll     t4, s1, 24
    lui     $at, 0xA000                # $at = A0000000
    andi    v1, v0, 0xFFFF             # v1 = 00000000
    or      t7, t4, $at                # t7 = A0000000
    jal     func_800CAA70
    or      a0, t7, v1                 # a0 = A0000000
    b       lbl_800CB738
    lbu     v1, 0x004D(s2)             # 0000004D
    sll     t3, a3,  2
    addu    t3, t3, a3
    sll     t6, s1, 24
    lui     $at, 0x5000                # $at = 50000000
    or      t9, t6, $at                # t9 = 50000000
    sll     t3, t3,  1
    sll     t2, s0, 16
    or      t8, t9, t2                 # t8 = 50000000
    andi    t5, t3, 0xFFFF             # t5 = 00000000
    jal     func_800CAA70
    or      a0, t8, t5                 # a0 = 50000000
    lbu     v1, 0x004D(s2)             # 0000004D
lbl_800CB738:
    addiu   s3, s3, 0x0001             # s3 = 00000001
    andi    s3, s3, 0x00FF             # s3 = 00000001
    slt     $at, s3, v1
    bnel    $at, $zero, lbl_800CB4EC
    sll     t8, s3,  2
lbl_800CB74C:
    sb      $zero, 0x004D(s2)          # 0000004D
lbl_800CB750:
    addiu   s5, s5, 0x0001             # s5 = 00000002
lbl_800CB754:
    andi    s5, s5, 0x00FF             # s5 = 00000002
    slti    $at, s5, 0x0004
    bne     $at, $zero, lbl_800CAE8C
    nop
lbl_800CB764:
    lw      $ra, 0x0044($sp)
    ldc1    $f20, 0x0018($sp)
    lw      s0, 0x0020($sp)
    lw      s1, 0x0024($sp)
    lw      s2, 0x0028($sp)
    lw      s3, 0x002C($sp)
    lw      s4, 0x0030($sp)
    lw      s5, 0x0034($sp)
    lw      s6, 0x0038($sp)
    lw      s7, 0x003C($sp)
    lw      s8, 0x0040($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0090           # $sp += 0x90


func_800CB798:
# MqDbg: 
    lui     v1, 0x8010                 # v1 = 80100000
    lbu     v1, 0x43C4(v1)             # 801043C4
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x001C($sp)
    sw      s0, 0x0018($sp)
    beq     v1, $zero, lbl_800CB848
    or      v0, v1, $zero              # v0 = 80100000
    addiu   s0, $zero, 0x0001          # s0 = 00000001
    bne     s0, v0, lbl_800CB7F8
    addiu   $at, $zero, 0x0002         # $at = 00000002
    jal     func_800BB49C
    nop
    bne     v0, s0, lbl_800CB7EC
    lui     $at, 0x8010                # $at = 80100000
    lui     a1, 0x8010                 # a1 = 80100000
    sb      $zero, 0x43C4($at)         # 801043C4
    lb      a1, 0x438C(a1)             # 8010438C
    jal     func_800BB0E0
    lui     a0, 0x4602                 # a0 = 46020000
    jal     func_800C7E4C
    nop
lbl_800CB7EC:
    lui     v1, 0x8010                 # v1 = 80100000
    b       lbl_800CB848
    lbu     v1, 0x43C4(v1)             # 801043C4
lbl_800CB7F8:
    bnel    v0, $at, lbl_800CB84C
    lw      $ra, 0x001C($sp)
    jal     func_800BB49C
    nop
    beq     v0, s0, lbl_800CB820
    nop
lbl_800CB810:
    jal     func_800BB49C
    nop
    bne     v0, s0, lbl_800CB810
    nop
lbl_800CB820:
    lui     $at, 0x8010                # $at = 80100000
    lui     a1, 0x8010                 # a1 = 80100000
    sb      $zero, 0x43C4($at)         # 801043C4
    lb      a1, 0x438C(a1)             # 8010438C
    jal     func_800BB0E0
    lui     a0, 0x4602                 # a0 = 46020000
    jal     func_800C7E4C
    nop
    lui     v1, 0x8010                 # v1 = 80100000
    lbu     v1, 0x43C4(v1)             # 801043C4
lbl_800CB848:
    lw      $ra, 0x001C($sp)
lbl_800CB84C:
    lw      s0, 0x0018($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    or      v0, v1, $zero              # v0 = 80100000


func_800CB85C:
# MqDbg: 
    lui     a3, 0x8012                 # a3 = 80120000
    lui     a2, 0x8012                 # a2 = 80120000
    addiu   a2, a2, 0x47F8             # a2 = 801247F8
    addiu   a3, a3, 0x4C00             # a3 = 80124C00
    or      v0, $zero, $zero           # v0 = 00000000
    addiu   t3, $zero, 0x0001          # t3 = 00000001
    addiu   t2, $zero, 0x007F          # t2 = 0000007F
    ori     t1, $zero, 0xFFFF          # t1 = 0000FFFF
    addiu   t0, $zero, 0x0264          # t0 = 00000264
lbl_800CB880:
    multu   v0, t0
    addu    t6, a2, v0
    sb      $zero, 0x0000(t6)          # 00000000
    sll     t8, v0,  2
    addu    t8, t8, v0
    sll     t8, t8,  2
    subu    t8, t8, v0
    sll     t8, t8,  3
    addu    t8, t8, v0
    sll     t8, t8,  2
    mflo    t7
    addu    v1, a3, t7
    sh      t1, 0x0254(v1)             # 00000254
    sh      t1, 0x0256(v1)             # 00000256
    sh      $zero, 0x0028(v1)          # 00000028
    sh      $zero, 0x0018(v1)          # 00000018
    sw      $zero, 0x0014(v1)          # 00000014
    sh      $zero, 0x0258(v1)          # 00000258
    sb      $zero, 0x004D(v1)          # 0000004D
    sb      $zero, 0x004E(v1)          # 0000004E
    sh      $zero, 0x0250(v1)          # 00000250
    sh      $zero, 0x0252(v1)          # 00000252
    addu    a1, a3, t8
    or      a0, $zero, $zero           # a0 = 00000000
lbl_800CB8E0:
    addu    t9, a1, a0
    addiu   a0, a0, 0x0001             # a0 = 00000001
    andi    a0, a0, 0x00FF             # a0 = 00000001
    slti    $at, a0, 0x0004
    bne     $at, $zero, lbl_800CB8E0
    sb      t2, 0x000E(t9)             # 0000000E
    addiu   v0, v0, 0x0001             # v0 = 00000001
    andi    v0, v0, 0x00FF             # v0 = 00000001
    slti    $at, v0, 0x0004
    sb      t3, 0x0012(v1)             # 00000012
    bne     $at, $zero, lbl_800CB880
    sb      t3, 0x0013(v1)             # 00000013
    jr      $ra
    nop


func_800CB918:
# MqDbg: 
    lui     $at, 0x3F80                # $at = 3F800000
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    lui     a3, 0x8012                 # a3 = 80120000
    mtc1    $at, $f0                   # $f0 = 1.00
    sw      $ra, 0x0014($sp)
    addiu   a3, a3, 0x4C00             # a3 = 80124C00
    or      a2, $zero, $zero           # a2 = 00000000
    addiu   t0, $zero, 0x0264          # t0 = 00000264
    addiu   a0, $zero, 0x007F          # a0 = 0000007F
lbl_800CB93C:
    multu   a2, t0
    sll     t7, a2,  2
    addu    t7, t7, a2
    sll     t7, t7,  2
    subu    t7, t7, a2
    sll     t7, t7,  3
    addu    t7, t7, a2
    sll     t7, t7,  2
    addu    v1, a3, t7
    or      v0, $zero, $zero           # v0 = 00000000
    mflo    t6
    addu    a1, a3, t6
    swc1    $f0, 0x0000(a1)            # 00000000
    sh      $zero, 0x000C(a1)          # 0000000C
    sb      $zero, 0x0013(a1)          # 00000013
lbl_800CB978:
    addu    t8, v1, v0
    addiu   v0, v0, 0x0001             # v0 = 00000001
    andi    v0, v0, 0x00FF             # v0 = 00000001
    slti    $at, v0, 0x0004
    bne     $at, $zero, lbl_800CB978
    sb      a0, 0x000E(t8)             # 0000000E
    addiu   a2, a2, 0x0001             # a2 = 00000001
    andi    a2, a2, 0x00FF             # a2 = 00000001
    slti    $at, a2, 0x0004
    bne     $at, $zero, lbl_800CB93C
    nop
    jal     func_800CB85C
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop
    nop
