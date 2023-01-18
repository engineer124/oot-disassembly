# "Kankyo (Environment)" part of the code file
#
# This file implements various routines important to framebuffer effects, such as RDP accelerated color and depth
# buffer copies and coverage drawing. Also contains software implementations of the Video Interface anti-aliasing and
# divot filters.
#
# Starts at VRAM: 8009DCA0 / VROM: B13C00
#

.section .text
func_8009DCA0:
# MqDbg: PreRender_SetValuesSave
    sw      a1, 0x0008(a0)             # 00000008
    sw      a2, 0x000C(a0)             # 0000000C
    sw      a3, 0x0014(a0)             # 00000014
    lw      t6, 0x0014($sp)
    addiu   t8, a1, 0xFFFF             # t8 = FFFFFFFF
    addiu   t9, a2, 0xFFFF             # t9 = FFFFFFFF
    sw      t6, 0x0018(a0)             # 00000018
    lw      t7, 0x0010($sp)
    sw      $zero, 0x0024(a0)          # 00000024
    sw      $zero, 0x0028(a0)          # 00000028
    sw      t8, 0x002C(a0)             # 0000002C
    sw      t9, 0x0030(a0)             # 00000030
    sw      t7, 0x0020(a0)             # 00000020
    jr      $ra
    nop


func_8009DCDC:
# MqDbg: PreRender_Init
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0018($sp)
    lw      a0, 0x0018($sp)
    jal     func_80002E80              # bzero
    addiu   a1, $zero, 0x0050          # a1 = 00000050
    lw      a0, 0x0018($sp)
    jal     func_800A1B00
    addiu   a0, a0, 0x0044             # a0 = 00000044
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_8009DD10:
# MqDbg: PreRender_SetValues
# ?, Framebuffer info related
# A0 = void* struct address
# A1 = s32 framebuffer width
# A2 = s32 framebuffer height
# A3 = void* backbuffer? address
# SP+0x10 = void* Z-Buffer ptr
    sw      a1, 0x0000(a0)             # 00000000
    sw      a2, 0x0004(a0)             # 00000004
    sw      a3, 0x0010(a0)             # 00000010
    lw      t6, 0x0010($sp)
    addiu   t7, a1, 0xFFFF             # t7 = FFFFFFFF
    addiu   t8, a2, 0xFFFF             # t8 = FFFFFFFF
    sw      $zero, 0x0034(a0)          # 00000034
    sw      $zero, 0x0038(a0)          # 00000038
    sw      t7, 0x003C(a0)             # 0000003C
    sw      t8, 0x0040(a0)             # 00000040
    sw      t6, 0x001C(a0)             # 0000001C
    jr      $ra
    nop


func_8009DD44:
# MqDbg: PreRender_Destroy
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    or      a1, a0, $zero              # a1 = 00000000
    jal     func_800A1C00
    addiu   a0, a1, 0x0044             # a0 = 00000044
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_8009DD68:
# MqDbg: PreRender_CopyImage
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    lui     $at, 0x4080                # $at = 40800000
    sw      s4, 0x0018($sp)
    sw      s3, 0x0014($sp)
    mtc1    $at, $f0                   # $f0 = 4.00
    or      s3, a0, $zero              # s3 = 00000000
    or      s4, a2, $zero              # s4 = 00000000
    sw      $ra, 0x002C($sp)
    sw      s8, 0x0028($sp)
    sw      s7, 0x0024($sp)
    sw      s6, 0x0020($sp)
    sw      s5, 0x001C($sp)
    sw      s2, 0x0010($sp)
    sw      s1, 0x000C($sp)
    sw      s0, 0x0008($sp)
    sw      a1, 0x0034($sp)
    lw      t6, 0x0034($sp)
    lui     t7, 0xE700                 # t7 = E7000000
    lui     t8, 0xEF20                 # t8 = EF200000
    lw      v0, 0x0000(t6)             # 00000000
    or      v1, v0, $zero              # v1 = 00000000
    sw      t7, 0x0000(v1)             # 00000000
    sw      $zero, 0x0004(v1)          # 00000004
    addiu   v0, v0, 0x0008             # v0 = 00000008
    or      t0, v0, $zero              # t0 = 00000008
    sw      t8, 0x0000(t0)             # 00000008
    sw      $zero, 0x0004(t0)          # 0000000C
    addiu   v0, v0, 0x0008             # v0 = 00000010
    lw      t9, 0x0000(s3)             # 00000000
    or      t1, v0, $zero              # t1 = 00000010
    lui     $at, 0xFF10                # $at = FF100000
    addiu   t6, t9, 0xFFFF             # t6 = FFFFFFFF
    andi    t7, t6, 0x0FFF             # t7 = 00000FFF
    or      t8, t7, $at                # t8 = FF100FFF
    sw      t8, 0x0000(t1)             # 00000010
    sw      a3, 0x0004(t1)             # 00000014
    addiu   v0, v0, 0x0008             # v0 = 00000018
    or      t2, v0, $zero              # t2 = 00000018
    lui     t9, 0xED00                 # t9 = ED000000
    sw      t9, 0x0000(t2)             # 00000018
    lw      t6, 0x0000(s3)             # 00000000
    lw      t7, 0x0004(s3)             # 00000004
    addiu   v0, v0, 0x0008             # v0 = 00000020
    mtc1    t6, $f4                    # $f4 = NaN
    mtc1    t7, $f16                   # $f16 = 0.00
    lui     $ra, 0xF200                # $ra = F2000000
    cvt.s.w $f6, $f4
    lui     s8, 0xF400                 # s8 = F4000000
    lui     s7, 0xE600                 # s7 = E6000000
    lui     s6, 0xF510                 # s6 = F5100000
    lui     s5, 0xFD10                 # s5 = FD100000
    cvt.s.w $f18, $f16
    mul.s   $f8, $f6, $f0
    trunc.w.s $f10, $f8
    mul.s   $f4, $f18, $f0
    mfc1    t8, $f10
    nop
    andi    t9, t8, 0x0FFF             # t9 = 00000FFF
    trunc.w.s $f6, $f4
    sll     t6, t9, 12
    mfc1    t9, $f6
    nop
    andi    t7, t9, 0x0FFF             # t7 = 00000FFF
    or      t8, t6, t7                 # t8 = FFFFFFFF
    sw      t8, 0x0004(t2)             # 0000001C
    lw      t9, 0x0000(s3)             # 00000000
    addiu   t7, $zero, 0x1000          # t7 = 00001000
    lw      t0, 0x0004(s3)             # 00000004
    sll     t6, t9,  1
    div     $zero, t7, t6
    mflo    s1
    or      t1, $zero, $zero           # t1 = 00000000
    bne     t6, $zero, lbl_8009DE94
    nop
    break   # 0x01C00
lbl_8009DE94:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t6, $at, lbl_8009DEAC
    lui     $at, 0x8000                # $at = 80000000
    bne     t7, $at, lbl_8009DEAC
    nop
    break   # 0x01800
lbl_8009DEAC:
    lui     s2, 0x0700                 # s2 = 07000000
    blezl   t0, lbl_8009E004
    or      v1, v0, $zero              # v1 = 00000020
    lw      a2, 0x0000(s3)             # 00000000
lbl_8009DEBC:
    slt     $at, t0, s1
    or      v1, v0, $zero              # v1 = 00000020
    addiu   a2, a2, 0xFFFF             # a2 = FFFFFFFF
    beq     $at, $zero, lbl_8009DED4
    or      t2, a2, $zero              # t2 = FFFFFFFF
    or      s1, t0, $zero              # s1 = 00000008
lbl_8009DED4:
    andi    t8, a2, 0x0FFF             # t8 = 00000FFF
    or      t9, t8, s5                 # t9 = FD100FFF
    sw      t9, 0x0000(v1)             # 00000020
    addiu   v0, v0, 0x0008             # v0 = 00000028
    sw      s4, 0x0004(v1)             # 00000024
    sll     t7, t2,  1
    addiu   t6, t7, 0x0009             # t6 = 00001009
    sra     t8, t6,  3
    andi    t9, t8, 0x01FF             # t9 = 000001FF
    or      a0, v0, $zero              # a0 = 00000028
    sll     t7, t9,  9
    or      s0, t7, s6                 # s0 = F5101000
    sw      s0, 0x0000(a0)             # 00000028
    sw      s2, 0x0004(a0)             # 0000002C
    addiu   v0, v0, 0x0008             # v0 = 00000030
    or      a1, v0, $zero              # a1 = 00000030
    sw      s7, 0x0000(a1)             # 00000030
    sw      $zero, 0x0004(a1)          # 00000034
    addiu   v0, v0, 0x0008             # v0 = 00000038
    sll     a1, t2,  2
    addu    t3, t1, s1
    addiu   a2, t3, 0xFFFF             # a2 = FFFFFFFF
    andi    a1, a1, 0x0FFF             # a1 = 00000030
    sll     a1, a1, 12
    sll     a2, a2,  2
    or      t4, v0, $zero              # t4 = 00000038
    sll     a3, t1,  2
    andi    a3, a3, 0x0FFF             # a3 = 00000000
    andi    a2, a2, 0x0FFF             # a2 = 00000FFF
    or      t8, a1, s2                 # t8 = 07000030
    or      t9, t8, a2                 # t9 = 07000FFF
    or      t6, s8, a3                 # t6 = F4000000
    sw      t6, 0x0000(t4)             # 00000038
    sw      t9, 0x0004(t4)             # 0000003C
    addiu   v0, v0, 0x0008             # v0 = 00000040
    or      v1, v0, $zero              # v1 = 00000040
    lui     t7, 0xE700                 # t7 = E7000000
    sw      t7, 0x0000(v1)             # 00000040
    sw      $zero, 0x0004(v1)          # 00000044
    addiu   v0, v0, 0x0008             # v0 = 00000048
    or      a0, v0, $zero              # a0 = 00000048
    sw      s0, 0x0000(a0)             # 00000048
    sw      $zero, 0x0004(a0)          # 0000004C
    addiu   v0, v0, 0x0008             # v0 = 00000050
    or      t5, v0, $zero              # t5 = 00000050
    or      t6, $ra, a3                # t6 = F2000000
    or      t8, a1, a2                 # t8 = 00000FFF
    sw      t8, 0x0004(t5)             # 00000054
    sw      t6, 0x0000(t5)             # 00000050
    addiu   v0, v0, 0x0008             # v0 = 00000058
    or      v1, v0, $zero              # v1 = 00000058
    lui     $at, 0xE400                # $at = E4000000
    or      t9, a1, $at                # t9 = E4000030
    or      t7, t9, a2                 # t7 = E4000FFF
    sw      t7, 0x0000(v1)             # 00000058
    sw      a3, 0x0004(v1)             # 0000005C
    addiu   v0, v0, 0x0008             # v0 = 00000060
    or      a0, v0, $zero              # a0 = 00000060
    sll     t8, t1,  5
    andi    t9, t8, 0xFFFF             # t9 = 00000FFF
    lui     t6, 0xE100                 # t6 = E1000000
    sw      t6, 0x0000(a0)             # 00000060
    sw      t9, 0x0004(a0)             # 00000064
    addiu   v0, v0, 0x0008             # v0 = 00000068
    or      t2, v0, $zero              # t2 = 00000068
    lui     t6, 0x1000                 # t6 = 10000000
    ori     t6, t6, 0x0400             # t6 = 10000400
    lui     t7, 0xF100                 # t7 = F1000000
    sw      t7, 0x0000(t2)             # 00000068
    sw      t6, 0x0004(t2)             # 0000006C
    addiu   v0, v0, 0x0008             # v0 = 00000070
    or      t1, t3, $zero              # t1 = 00000000
    subu    t0, t0, s1
    bgtzl   t0, lbl_8009DEBC
    lw      a2, 0x0000(s3)             # 00000000
    or      v1, v0, $zero              # v1 = 00000070
lbl_8009E004:
    lui     t8, 0xE700                 # t8 = E7000000
    sw      t8, 0x0000(v1)             # 00000070
    sw      $zero, 0x0004(v1)          # 00000074
    addiu   v0, v0, 0x0008             # v0 = 00000078
    lw      t9, 0x0000(s3)             # 00000000
    lui     $at, 0xFF10                # $at = FF100000
    or      a0, v0, $zero              # a0 = 00000078
    addiu   t7, t9, 0xFFFF             # t7 = 00000FFE
    andi    t6, t7, 0x0FFF             # t6 = 00000FFE
    or      t8, t6, $at                # t8 = FF100FFE
    sw      t8, 0x0000(a0)             # 00000078
    lw      t9, 0x0010(s3)             # 00000010
    addiu   v0, v0, 0x0008             # v0 = 00000080
    sw      t9, 0x0004(a0)             # 0000007C
    lw      t7, 0x0034($sp)
    sw      v0, 0x0000(t7)             # 00000FFE
    lw      $ra, 0x002C($sp)
    lw      s0, 0x0008($sp)
    lw      s1, 0x000C($sp)
    lw      s2, 0x0010($sp)
    lw      s3, 0x0014($sp)
    lw      s4, 0x0018($sp)
    lw      s5, 0x001C($sp)
    lw      s6, 0x0020($sp)
    lw      s7, 0x0024($sp)
    lw      s8, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030           # $sp += 0x30


func_8009E074:
# MqDbg: PreRender_CopyImageRegionImpl
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    lui     $at, 0x4080                # $at = 40800000
    mtc1    $at, $f0                   # $f0 = 4.00
    sw      $ra, 0x002C($sp)
    sw      s8, 0x0028($sp)
    sw      s7, 0x0024($sp)
    sw      s6, 0x0020($sp)
    sw      s5, 0x001C($sp)
    sw      s4, 0x0018($sp)
    sw      s3, 0x0014($sp)
    sw      s2, 0x0010($sp)
    sw      s1, 0x000C($sp)
    sw      s0, 0x0008($sp)
    sw      a1, 0x0034($sp)
    lw      t6, 0x0034($sp)
    lui     t7, 0xE700                 # t7 = E7000000
    lui     t8, 0xEF20                 # t8 = EF200000
    lw      v0, 0x0000(t6)             # 00000000
    or      v1, v0, $zero              # v1 = 00000000
    sw      t7, 0x0000(v1)             # 00000000
    sw      $zero, 0x0004(v1)          # 00000004
    addiu   v0, v0, 0x0008             # v0 = 00000008
    or      a2, v0, $zero              # a2 = 00000008
    sw      t8, 0x0000(a2)             # 00000008
    sw      $zero, 0x0004(a2)          # 0000000C
    addiu   v0, v0, 0x0008             # v0 = 00000010
    lw      t9, 0x0000(a0)             # 00000000
    lui     $at, 0xFF10                # $at = FF100000
    or      a3, v0, $zero              # a3 = 00000010
    addiu   t6, t9, 0xFFFF             # t6 = FFFFFFFF
    andi    t7, t6, 0x0FFF             # t7 = 00000FFF
    or      t8, t7, $at                # t8 = FF100FFF
    sw      t8, 0x0000(a3)             # 00000010
    lw      t9, 0x0010(a0)             # 00000010
    addiu   v0, v0, 0x0008             # v0 = 00000018
    lui     $ra, 0xF100                # $ra = F1000000
    sw      t9, 0x0004(a3)             # 00000014
    lw      t6, 0x0034(a0)             # 00000034
    lui     $at, 0xED00                # $at = ED000000
    or      t0, v0, $zero              # t0 = 00000018
    mtc1    t6, $f4                    # $f4 = NaN
    addiu   v0, v0, 0x0008             # v0 = 00000020
    lui     s8, 0xE100                 # s8 = E1000000
    cvt.s.w $f6, $f4
    lui     s7, 0xE400                 # s7 = E4000000
    lui     s6, 0xF200                 # s6 = F2000000
    lui     s5, 0xF400                 # s5 = F4000000
    lui     s4, 0xE600                 # s4 = E6000000
    lui     s3, 0xFD10                 # s3 = FD100000
    mul.s   $f8, $f6, $f0
    lui     s2, 0x0700                 # s2 = 07000000
    lui     s1, 0xF510                 # s1 = F5100000
    trunc.w.s $f10, $f8
    mfc1    t8, $f10
    nop
    andi    t9, t8, 0x0FFF             # t9 = 00000FFF
    lw      t8, 0x0038(a0)             # 00000038
    sll     t6, t9, 12
    or      t7, t6, $at                # t7 = FFFFFFFF
    mtc1    t8, $f16                   # $f16 = -191491900000000000000000000000000000000.00
    nop
    cvt.s.w $f18, $f16
    mul.s   $f4, $f18, $f0
    trunc.w.s $f6, $f4
    mfc1    t6, $f6
    nop
    andi    t8, t6, 0x0FFF             # t8 = 00000FFF
    or      t9, t7, t8                 # t9 = FFFFFFFF
    sw      t9, 0x0000(t0)             # 00000018
    lw      t6, 0x003C(a0)             # 0000003C
    lw      t8, 0x0040(a0)             # 00000040
    addiu   t7, t6, 0x0001             # t7 = 00000000
    mtc1    t7, $f8                    # $f8 = 0.00
    nop
    cvt.s.w $f10, $f8
    mul.s   $f16, $f10, $f0
    trunc.w.s $f18, $f16
    mfc1    t9, $f18
    nop
    andi    t6, t9, 0x0FFF             # t6 = 00000FFF
    addiu   t9, t8, 0x0001             # t9 = 00001000
    mtc1    t9, $f4                    # $f4 = 0.00
    sll     t7, t6, 12
    cvt.s.w $f6, $f4
    mul.s   $f8, $f6, $f0
    trunc.w.s $f10, $f8
    mfc1    t8, $f10
    nop
    andi    t9, t8, 0x0FFF             # t9 = 00000FFF
    or      t6, t7, t9                 # t6 = 00000FFF
    sw      t6, 0x0004(t0)             # 0000001C
    lw      t8, 0x002C(a0)             # 0000002C
    lw      t7, 0x0024(a0)             # 00000024
    or      s0, $zero, $zero           # s0 = 00000000
    subu    t9, t8, t7
    sll     t6, t9,  1
    addiu   t8, t6, 0x0002             # t8 = 00001001
    addiu   t7, $zero, 0x1000          # t7 = 00001000
    div     $zero, t7, t8
    lw      t6, 0x0028(a0)             # 00000028
    lw      t9, 0x0030(a0)             # 00000030
    mflo    a3
    subu    t1, t9, t6
    bne     t8, $zero, lbl_8009E21C
    nop
    break   # 0x01C00
lbl_8009E21C:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t8, $at, lbl_8009E234
    lui     $at, 0x8000                # $at = 80000000
    bne     t7, $at, lbl_8009E234
    nop
    break   # 0x01800
lbl_8009E234:
    addiu   t1, t1, 0x0001             # t1 = 00000001
    blez    t1, lbl_8009E43C
    slt     $at, t1, a3
lbl_8009E240:
    beq     $at, $zero, lbl_8009E24C
    lw      a2, 0x0028(a0)             # 00000028
    or      a3, t1, $zero              # a3 = 00000001
lbl_8009E24C:
    lw      t7, 0x0038(a0)             # 00000038
    addu    t0, a2, s0
    sll     t3, t0,  2
    addu    t2, t7, s0
    lw      t8, 0x0008(a0)             # 00000008
    or      v1, v0, $zero              # v1 = 00000020
    addiu   v0, v0, 0x0008             # v0 = 00000028
    addiu   t9, t8, 0xFFFF             # t9 = 00001000
    andi    t6, t9, 0x0FFF             # t6 = 00000000
    or      t7, t6, s3                 # t7 = FD100000
    sw      t7, 0x0000(v1)             # 00000020
    lw      t8, 0x0014(a0)             # 00000014
    or      a1, v0, $zero              # a1 = 00000028
    andi    t3, t3, 0x0FFF             # t3 = 00000000
    sw      t8, 0x0004(v1)             # 00000024
    lw      t9, 0x002C(a0)             # 0000002C
    lw      t6, 0x0024(a0)             # 00000024
    sw      s2, 0x0004(a1)             # 0000002C
    addiu   v0, v0, 0x0008             # v0 = 00000030
    subu    t7, t9, t6
    sll     t8, t7,  1
    addiu   t9, t8, 0x0009             # t9 = 0000100A
    sra     t6, t9,  3
    andi    t7, t6, 0x01FF             # t7 = 00000000
    sll     t8, t7,  9
    or      t9, t8, s1                 # t9 = F5101001
    sw      t9, 0x0000(a1)             # 00000028
    or      v1, v0, $zero              # v1 = 00000030
    sw      s4, 0x0000(v1)             # 00000030
    sw      $zero, 0x0004(v1)          # 00000034
    addiu   v0, v0, 0x0008             # v0 = 00000038
    lw      t6, 0x0024(a0)             # 00000024
    or      a1, v0, $zero              # a1 = 00000038
    addu    t5, t0, a3
    sll     t7, t6,  2
    andi    t8, t7, 0x0FFF             # t8 = 00000000
    sll     t9, t8, 12
    or      t6, t9, s5                 # t6 = F5101001
    or      t7, t6, t3                 # t7 = F5101001
    sw      t7, 0x0000(a1)             # 00000038
    lw      t8, 0x002C(a0)             # 0000002C
    addiu   t5, t5, 0xFFFF             # t5 = FFFFFFFF
    sll     t5, t5,  2
    sll     t9, t8,  2
    andi    t6, t9, 0x0FFF             # t6 = 00000001
    sll     t7, t6, 12
    or      t8, t7, s2                 # t8 = F7101001
    andi    t5, t5, 0x0FFF             # t5 = 00000FFF
    or      t9, t8, t5                 # t9 = F7101FFF
    sw      t9, 0x0004(a1)             # 0000003C
    addiu   v0, v0, 0x0008             # v0 = 00000040
    or      a2, v0, $zero              # a2 = 00000040
    lui     t6, 0xE700                 # t6 = E7000000
    sw      t6, 0x0000(a2)             # 00000040
    sw      $zero, 0x0004(a2)          # 00000044
    addiu   v0, v0, 0x0008             # v0 = 00000048
    lw      t7, 0x002C(a0)             # 0000002C
    lw      t8, 0x0024(a0)             # 00000024
    or      t4, v0, $zero              # t4 = 00000048
    sw      $zero, 0x0004(t4)          # 0000004C
    subu    t9, t7, t8
    sll     t6, t9,  1
    addiu   t7, t6, 0x0009             # t7 = E7000009
    sra     t8, t7,  3
    andi    t9, t8, 0x01FF             # t9 = 00000001
    sll     t6, t9,  9
    or      t7, t6, s1                 # t7 = F7100000
    sw      t7, 0x0000(t4)             # 00000048
    addiu   v0, v0, 0x0008             # v0 = 00000050
    lw      t8, 0x0024(a0)             # 00000024
    or      v1, v0, $zero              # v1 = 00000050
    addiu   v0, v0, 0x0008             # v0 = 00000058
    sll     t9, t8,  2
    andi    t6, t9, 0x0FFF             # t6 = 00000001
    sll     t7, t6, 12
    or      t8, t7, s6                 # t8 = F7100000
    or      t9, t8, t3                 # t9 = F7100000
    sw      t9, 0x0000(v1)             # 00000050
    lw      t6, 0x002C(a0)             # 0000002C
    addu    s0, s0, a3
    subu    t1, t1, a3
    sll     t7, t6,  2
    andi    t8, t7, 0x0FFF             # t8 = 00000000
    sll     t9, t8, 12
    or      t6, t9, t5                 # t6 = F7100FFF
    sw      t6, 0x0004(v1)             # 00000054
    lw      t7, 0x003C(a0)             # 0000003C
    or      a1, v0, $zero              # a1 = 00000058
    addiu   v0, v0, 0x0008             # v0 = 00000060
    sll     t8, t7,  2
    andi    t9, t8, 0x0FFF             # t9 = 00000000
    sll     t6, t9, 12
    addu    t8, t2, a3
    addiu   t9, t8, 0xFFFF             # t9 = FFFFFFFF
    or      t7, t6, s7                 # t7 = F7100FFF
    sll     t6, t9,  2
    andi    t8, t6, 0x0FFF             # t8 = 00000FFF
    or      t9, t7, t8                 # t9 = F7100FFF
    sw      t9, 0x0000(a1)             # 00000058
    lw      t6, 0x0034(a0)             # 00000034
    or      a2, v0, $zero              # a2 = 00000060
    addiu   v0, v0, 0x0008             # v0 = 00000068
    sll     t7, t6,  2
    andi    t8, t7, 0x0FFF             # t8 = 00000FFF
    sll     t6, t2,  2
    andi    t7, t6, 0x0FFF             # t7 = 00000FFF
    sll     t9, t8, 12
    or      t8, t9, t7                 # t8 = F7100FFF
    sw      t8, 0x0004(a1)             # 0000005C
    sw      s8, 0x0000(a2)             # 00000060
    lw      t7, 0x0024(a0)             # 00000024
    sll     t6, t0,  5
    andi    t9, t6, 0xFFFF             # t9 = 00000FFF
    sll     t8, t7, 21
    or      t7, t8, t9                 # t7 = F7100FFF
    sw      t7, 0x0004(a2)             # 00000064
    or      v1, v0, $zero              # v1 = 00000068
    lui     t6, 0x1000                 # t6 = 10000000
    ori     t6, t6, 0x0400             # t6 = 10000400
    sw      t6, 0x0004(v1)             # 0000006C
    sw      $ra, 0x0000(v1)            # 00000068
    addiu   v0, v0, 0x0008             # v0 = 00000070
    bgtzl   t1, lbl_8009E240
    slt     $at, t1, a3
lbl_8009E43C:
    or      v1, v0, $zero              # v1 = 00000070
    lui     t8, 0xE700                 # t8 = E7000000
    sw      t8, 0x0000(v1)             # 00000070
    sw      $zero, 0x0004(v1)          # 00000074
    addiu   v0, v0, 0x0008             # v0 = 00000078
    lw      t9, 0x0000(a0)             # 00000000
    lui     $at, 0xFF10                # $at = FF100000
    or      a1, v0, $zero              # a1 = 00000078
    addiu   t7, t9, 0xFFFF             # t7 = 00000FFE
    andi    t6, t7, 0x0FFF             # t6 = 00000FFE
    or      t8, t6, $at                # t8 = FF100FFE
    sw      t8, 0x0000(a1)             # 00000078
    lw      t9, 0x0010(a0)             # 00000010
    addiu   v0, v0, 0x0008             # v0 = 00000080
    or      a2, v0, $zero              # a2 = 00000080
    sw      t9, 0x0004(a1)             # 0000007C
    lui     t7, 0xED00                 # t7 = ED000000
    sw      t7, 0x0000(a2)             # 00000080
    lw      t6, 0x0000(a0)             # 00000000
    lw      t8, 0x0004(a0)             # 00000004
    addiu   v0, v0, 0x0008             # v0 = 00000088
    mtc1    t6, $f16                   # $f16 = 0.00
    mtc1    t8, $f8                    # $f8 = -191491900000000000000000000000000000000.00
    cvt.s.w $f18, $f16
    cvt.s.w $f10, $f8
    mul.s   $f4, $f18, $f0
    trunc.w.s $f6, $f4
    mul.s   $f16, $f10, $f0
    mfc1    t9, $f6
    nop
    andi    t7, t9, 0x0FFF             # t7 = 00000FFF
    trunc.w.s $f18, $f16
    sll     t6, t7, 12
    mfc1    t7, $f18
    nop
    andi    t8, t7, 0x0FFF             # t8 = 00000FFF
    or      t9, t6, t8                 # t9 = 00000FFF
    sw      t9, 0x0004(a2)             # 00000084
    lw      t7, 0x0034($sp)
    sw      v0, 0x0000(t7)             # 00000FFF
    lw      $ra, 0x002C($sp)
    lw      s0, 0x0008($sp)
    lw      s1, 0x000C($sp)
    lw      s2, 0x0010($sp)
    lw      s3, 0x0014($sp)
    lw      s4, 0x0018($sp)
    lw      s5, 0x001C($sp)
    lw      s6, 0x0020($sp)
    lw      s7, 0x0024($sp)
    lw      s8, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030           # $sp += 0x30


func_8009E50C:
# MqDbg: func_800C170C
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      s5, 0x001C($sp)
    sw      s4, 0x0018($sp)
    sw      s0, 0x0008($sp)
    or      s0, a3, $zero              # s0 = 00000000
    or      s4, a0, $zero              # s4 = 00000000
    or      s5, a2, $zero              # s5 = 00000000
    sw      $ra, 0x002C($sp)
    sw      s8, 0x0028($sp)
    sw      s7, 0x0024($sp)
    sw      s6, 0x0020($sp)
    sw      s3, 0x0014($sp)
    sw      s2, 0x0010($sp)
    sw      s1, 0x000C($sp)
    sw      a1, 0x0034($sp)
    lw      t6, 0x0034($sp)
    lui     t7, 0xE700                 # t7 = E7000000
    lui     t8, 0xEF00                 # t8 = EF000000
    lw      v0, 0x0000(t6)             # 00000000
    or      t0, v0, $zero              # t0 = 00000000
    sw      t7, 0x0000(t0)             # 00000000
    sw      $zero, 0x0004(t0)          # 00000004
    addiu   v0, v0, 0x0008             # v0 = 00000008
    or      t1, v0, $zero              # t1 = 00000008
    lui     t9, 0x0F0A                 # t9 = 0F0A0000
    ori     t9, t9, 0x4004             # t9 = 0F0A4004
    ori     t8, t8, 0x0CF0             # t8 = EF000CF0
    sw      t8, 0x0000(t1)             # 00000008
    sw      t9, 0x0004(t1)             # 0000000C
    addiu   v0, v0, 0x0008             # v0 = 00000010
    or      t2, v0, $zero              # t2 = 00000010
    lui     t6, 0xFB00                 # t6 = FB000000
    sw      t6, 0x0000(t2)             # 00000010
    lw      t6, 0x0044($sp)
    lw      t8, 0x0040($sp)
    addiu   v0, v0, 0x0008             # v0 = 00000018
    andi    t7, t6, 0x00FF             # t7 = 00000000
    sll     t9, t8, 24
    sll     t8, t7, 16
    lw      t7, 0x0048($sp)
    or      t6, t9, t8                 # t6 = EF0A4CF4
    or      v1, v0, $zero              # v1 = 00000018
    andi    t9, t7, 0x00FF             # t9 = 00000000
    sll     t8, t9,  8
    lw      t9, 0x004C($sp)
    or      t7, t6, t8                 # t7 = EF0A4CF4
    addiu   v0, v0, 0x0008             # v0 = 00000020
    andi    t6, t9, 0x00FF             # t6 = 00000000
    or      t8, t7, t6                 # t8 = EF0A4CF4
    sw      t8, 0x0004(t2)             # 00000014
    lui     t9, 0xFCFF                 # t9 = FCFF0000
    lui     $at, 0x4080                # $at = 40800000
    lui     t7, 0xFFFC                 # t7 = FFFC0000
    ori     t7, t7, 0xFC7E             # t7 = FFFCFC7E
    ori     t9, t9, 0xFFFF             # t9 = FCFFFFFF
    mtc1    $at, $f0                   # $f0 = 4.00
    sw      t9, 0x0000(v1)             # 00000018
    sw      t7, 0x0004(v1)             # 0000001C
    or      a0, v0, $zero              # a0 = 00000020
    lui     t6, 0xFC12                 # t6 = FC120000
    ori     t6, t6, 0xFE25             # t6 = FC12FE25
    addiu   t8, $zero, 0xFDFE          # t8 = FFFFFDFE
    sw      t8, 0x0004(a0)             # 00000024
    sw      t6, 0x0000(a0)             # 00000020
    addiu   v0, v0, 0x0008             # v0 = 00000028
    lw      t9, 0x0000(s4)             # 00000000
    or      a1, v0, $zero              # a1 = 00000028
    lui     $at, 0xFF10                # $at = FF100000
    addiu   t7, t9, 0xFFFF             # t7 = FCFFFFFE
    andi    t6, t7, 0x0FFF             # t6 = 00000FFE
    or      t8, t6, $at                # t8 = FF100FFE
    sw      t8, 0x0000(a1)             # 00000028
    sw      s0, 0x0004(a1)             # 0000002C
    addiu   v0, v0, 0x0008             # v0 = 00000030
    or      a2, v0, $zero              # a2 = 00000030
    lui     t9, 0xED00                 # t9 = ED000000
    sw      t9, 0x0000(a2)             # 00000030
    lw      t7, 0x0000(s4)             # 00000000
    lw      t6, 0x0004(s4)             # 00000004
    addiu   v0, v0, 0x0008             # v0 = 00000038
    mtc1    t7, $f4                    # $f4 = -10633820000000000000000000000000000000.00
    mtc1    t6, $f16                   # $f16 = 0.00
    lui     $ra, 0xF400                # $ra = F4000000
    cvt.s.w $f6, $f4
    lui     s8, 0xE600                 # s8 = E6000000
    lui     s7, 0xF510                 # s7 = F5100000
    lui     s6, 0xFD10                 # s6 = FD100000
    lui     s3, 0x0700                 # s3 = 07000000
    cvt.s.w $f18, $f16
    mul.s   $f8, $f6, $f0
    trunc.w.s $f10, $f8
    mul.s   $f4, $f18, $f0
    mfc1    t8, $f10
    nop
    andi    t9, t8, 0x0FFF             # t9 = 00000FFE
    trunc.w.s $f6, $f4
    sll     t7, t9, 12
    mfc1    t9, $f6
    nop
    andi    t6, t9, 0x0FFF             # t6 = 00000FFE
    or      t8, t7, t6                 # t8 = FCFFFFFE
    sw      t8, 0x0004(a2)             # 00000034
    lw      t9, 0x0000(s4)             # 00000000
    addiu   t6, $zero, 0x1000          # t6 = 00001000
    lw      a3, 0x0004(s4)             # 00000004
    sll     t7, t9,  1
    div     $zero, t6, t7
    mflo    s2
    or      t0, $zero, $zero           # t0 = 00000000
    bne     t7, $zero, lbl_8009E6CC
    nop
    break   # 0x01C00
lbl_8009E6CC:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t7, $at, lbl_8009E6E4
    lui     $at, 0x8000                # $at = 80000000
    bne     t6, $at, lbl_8009E6E4
    nop
    break   # 0x01800
lbl_8009E6E4:
    blezl   a3, lbl_8009E858
    or      v1, v0, $zero              # v1 = 00000038
    lw      t1, 0x0000(s4)             # 00000000
lbl_8009E6F0:
    slt     $at, a3, s2
    or      v1, v0, $zero              # v1 = 00000038
    addiu   t1, t1, 0xFFFF             # t1 = 00000007
    beq     $at, $zero, lbl_8009E708
    or      a2, t1, $zero              # a2 = 00000007
    or      s2, a3, $zero              # s2 = 00000000
lbl_8009E708:
    andi    t8, t1, 0x0FFF             # t8 = 00000007
    or      t9, t8, s6                 # t9 = FD100007
    sw      t9, 0x0000(v1)             # 00000038
    addiu   v0, v0, 0x0008             # v0 = 00000040
    sw      s5, 0x0004(v1)             # 0000003C
    sll     t6, a2,  1
    addiu   t7, t6, 0x0009             # t7 = 00001009
    sra     t8, t7,  3
    andi    t9, t8, 0x01FF             # t9 = 00000007
    or      a0, v0, $zero              # a0 = 00000040
    sll     t6, t9,  9
    or      s1, t6, s7                 # s1 = F5101000
    sw      s1, 0x0000(a0)             # 00000040
    sw      s3, 0x0004(a0)             # 00000044
    addiu   v0, v0, 0x0008             # v0 = 00000048
    or      a1, v0, $zero              # a1 = 00000048
    sw      s8, 0x0000(a1)             # 00000048
    sw      $zero, 0x0004(a1)          # 0000004C
    addiu   v0, v0, 0x0008             # v0 = 00000050
    sll     t4, a2,  2
    addu    t1, t0, s2
    addiu   t2, t1, 0xFFFF             # t2 = 00000006
    andi    t4, t4, 0x0FFF             # t4 = 00000000
    sll     t4, t4, 12
    sll     s0, t2,  2
    or      t3, v0, $zero              # t3 = 00000050
    sll     a1, t0,  2
    andi    a1, a1, 0x0FFF             # a1 = 00000048
    andi    s0, s0, 0x0FFF             # s0 = 00000000
    or      t8, t4, s3                 # t8 = 07000000
    or      t9, t8, s0                 # t9 = 07000000
    or      t7, $ra, a1                # t7 = F4000048
    sw      t7, 0x0000(t3)             # 00000050
    sw      t9, 0x0004(t3)             # 00000054
    addiu   v0, v0, 0x0008             # v0 = 00000058
    or      v1, v0, $zero              # v1 = 00000058
    lui     t6, 0xE700                 # t6 = E7000000
    sw      t6, 0x0000(v1)             # 00000058
    sw      $zero, 0x0004(v1)          # 0000005C
    addiu   v0, v0, 0x0008             # v0 = 00000060
    or      a0, v0, $zero              # a0 = 00000060
    sw      s1, 0x0000(a0)             # 00000060
    sw      $zero, 0x0004(a0)          # 00000064
    addiu   v0, v0, 0x0008             # v0 = 00000068
    or      t5, v0, $zero              # t5 = 00000068
    lui     $at, 0xF200                # $at = F2000000
    or      t7, a1, $at                # t7 = F2000048
    or      t8, t4, s0                 # t8 = 00000000
    sw      t8, 0x0004(t5)             # 0000006C
    sw      t7, 0x0000(t5)             # 00000068
    addiu   v0, v0, 0x0008             # v0 = 00000070
    addiu   t9, a2, 0x0001             # t9 = 00000008
    sll     t6, t9,  2
    andi    t7, t6, 0x0FFF             # t7 = 00000000
    sll     t8, t7, 12
    addiu   t6, t2, 0x0001             # t6 = 00000007
    lui     $at, 0xE400                # $at = E4000000
    or      t9, t8, $at                # t9 = E4000000
    sll     t7, t6,  2
    or      v1, v0, $zero              # v1 = 00000070
    andi    t8, t7, 0x0FFF             # t8 = 00000000
    or      t6, t9, t8                 # t6 = E4000000
    sw      t6, 0x0000(v1)             # 00000070
    sw      a1, 0x0004(v1)             # 00000074
    addiu   v0, v0, 0x0008             # v0 = 00000078
    or      a0, v0, $zero              # a0 = 00000078
    sll     t9, t0,  5
    andi    t8, t9, 0xFFFF             # t8 = 00000000
    lui     t7, 0xE100                 # t7 = E1000000
    sw      t7, 0x0000(a0)             # 00000078
    sw      t8, 0x0004(a0)             # 0000007C
    addiu   v0, v0, 0x0008             # v0 = 00000080
    or      t3, v0, $zero              # t3 = 00000080
    lui     t7, 0x0400                 # t7 = 04000000
    ori     t7, t7, 0x0400             # t7 = 04000400
    lui     t6, 0xF100                 # t6 = F1000000
    sw      t6, 0x0000(t3)             # 00000080
    sw      t7, 0x0004(t3)             # 00000084
    addiu   v0, v0, 0x0008             # v0 = 00000088
    or      t0, t1, $zero              # t0 = 00000007
    subu    a3, a3, s2
    bgtzl   a3, lbl_8009E6F0
    lw      t1, 0x0000(s4)             # 00000000
    or      v1, v0, $zero              # v1 = 00000088
lbl_8009E858:
    lui     t9, 0xE700                 # t9 = E7000000
    sw      t9, 0x0000(v1)             # 00000088
    sw      $zero, 0x0004(v1)          # 0000008C
    addiu   v0, v0, 0x0008             # v0 = 00000090
    lw      t8, 0x0000(s4)             # 00000000
    lui     $at, 0xFF10                # $at = FF100000
    or      a0, v0, $zero              # a0 = 00000090
    addiu   t6, t8, 0xFFFF             # t6 = FFFFFFFF
    andi    t7, t6, 0x0FFF             # t7 = 00000FFF
    or      t9, t7, $at                # t9 = FF100FFF
    sw      t9, 0x0000(a0)             # 00000090
    lw      t8, 0x0010(s4)             # 00000010
    addiu   v0, v0, 0x0008             # v0 = 00000098
    sw      t8, 0x0004(a0)             # 00000094
    lw      t6, 0x0034($sp)
    sw      v0, 0x0000(t6)             # FFFFFFFF
    lw      $ra, 0x002C($sp)
    lw      s0, 0x0008($sp)
    lw      s1, 0x000C($sp)
    lw      s2, 0x0010($sp)
    lw      s3, 0x0014($sp)
    lw      s4, 0x0018($sp)
    lw      s5, 0x001C($sp)
    lw      s6, 0x0020($sp)
    lw      s7, 0x0024($sp)
    lw      s8, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030           # $sp += 0x30


func_8009E8C8:
# MqDbg: func_800C1AE8
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x0024($sp)
    addiu   t6, $zero, 0x00FF          # t6 = 000000FF
    addiu   t7, $zero, 0x00FF          # t7 = 000000FF
    addiu   t8, $zero, 0x00FF          # t8 = 000000FF
    addiu   t9, $zero, 0x00FF          # t9 = 000000FF
    sw      t9, 0x001C($sp)
    sw      t8, 0x0018($sp)
    sw      t7, 0x0014($sp)
    jal     func_8009E50C
    sw      t6, 0x0010($sp)
    lw      $ra, 0x0024($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_8009E904:
# MqDbg: PreRender_CoverageRgba16ToI8
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      s5, 0x001C($sp)
    sw      s4, 0x0018($sp)
    or      s4, a0, $zero              # s4 = 00000000
    or      s5, a2, $zero              # s5 = 00000000
    sw      $ra, 0x002C($sp)
    sw      s8, 0x0028($sp)
    sw      s7, 0x0024($sp)
    sw      s6, 0x0020($sp)
    sw      s3, 0x0014($sp)
    sw      s2, 0x0010($sp)
    sw      s1, 0x000C($sp)
    sw      s0, 0x0008($sp)
    sw      a1, 0x0034($sp)
    lw      t6, 0x0034($sp)
    lui     t7, 0xE700                 # t7 = E7000000
    lui     t8, 0xEF00                 # t8 = EF000000
    lw      v0, 0x0000(t6)             # 00000000
    or      v1, v0, $zero              # v1 = 00000000
    sw      t7, 0x0000(v1)             # 00000000
    sw      $zero, 0x0004(v1)          # 00000004
    addiu   v0, v0, 0x0008             # v0 = 00000008
    or      t0, v0, $zero              # t0 = 00000008
    lui     t9, 0x0F0A                 # t9 = 0F0A0000
    ori     t9, t9, 0x0004             # t9 = 0F0A0004
    ori     t8, t8, 0x0CF0             # t8 = EF000CF0
    sw      t8, 0x0000(t0)             # 00000008
    sw      t9, 0x0004(t0)             # 0000000C
    addiu   v0, v0, 0x0008             # v0 = 00000010
    or      t1, v0, $zero              # t1 = 00000010
    lui     t6, 0xFCFF                 # t6 = FCFF0000
    lui     t7, 0xFFFC                 # t7 = FFFC0000
    ori     t7, t7, 0xFE7F             # t7 = FFFCFE7F
    ori     t6, t6, 0xFFFF             # t6 = FCFFFFFF
    sw      t6, 0x0000(t1)             # 00000010
    sw      t7, 0x0004(t1)             # 00000014
    addiu   v0, v0, 0x0008             # v0 = 00000018
    lw      t8, 0x0000(s4)             # 00000000
    or      t2, v0, $zero              # t2 = 00000018
    lui     $at, 0xFF88                # $at = FF880000
    addiu   t9, t8, 0xFFFF             # t9 = EF000CEF
    andi    t6, t9, 0x0FFF             # t6 = 00000CEF
    or      t7, t6, $at                # t7 = FF880CEF
    sw      t7, 0x0000(t2)             # 00000018
    sw      a3, 0x0004(t2)             # 0000001C
    addiu   v0, v0, 0x0008             # v0 = 00000020
    or      t3, v0, $zero              # t3 = 00000020
    lui     t8, 0xED00                 # t8 = ED000000
    sw      t8, 0x0000(t3)             # 00000020
    lw      t9, 0x0000(s4)             # 00000000
    lw      t6, 0x0004(s4)             # 00000004
    lui     $at, 0x4080                # $at = 40800000
    mtc1    t9, $f4                    # $f4 = -39629720000000000000000000000.00
    mtc1    t6, $f16                   # $f16 = 0.00
    mtc1    $at, $f0                   # $f0 = 4.00
    cvt.s.w $f6, $f4
    addiu   v0, v0, 0x0008             # v0 = 00000028
    lui     $ra, 0xF400                # $ra = F4000000
    lui     s8, 0xE600                 # s8 = E6000000
    lui     s7, 0xF570                 # s7 = F5700000
    cvt.s.w $f18, $f16
    mul.s   $f8, $f6, $f0
    trunc.w.s $f10, $f8
    mul.s   $f4, $f18, $f0
    mfc1    t7, $f10
    nop
    andi    t8, t7, 0x0FFF             # t8 = 00000CEF
    trunc.w.s $f6, $f4
    sll     t9, t8, 12
    mfc1    t8, $f6
    nop
    andi    t6, t8, 0x0FFF             # t6 = 00000CEF
    or      t7, t9, t6                 # t7 = EF000CEF
    sw      t7, 0x0004(t3)             # 00000024
    lw      t8, 0x0000(s4)             # 00000000
    addiu   t6, $zero, 0x1000          # t6 = 00001000
    lw      a3, 0x0004(s4)             # 00000004
    sll     t9, t8,  1
    div     $zero, t6, t9
    mflo    s2
    or      t0, $zero, $zero           # t0 = 00000000
    bne     t9, $zero, lbl_8009EA54
    nop
    break   # 0x01C00
lbl_8009EA54:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t9, $at, lbl_8009EA6C
    lui     $at, 0x8000                # $at = 80000000
    bne     t6, $at, lbl_8009EA6C
    nop
    break   # 0x01800
lbl_8009EA6C:
    lui     s6, 0xFD70                 # s6 = FD700000
    blez    a3, lbl_8009EBE0
    lui     s3, 0x0700                 # s3 = 07000000
    lw      t1, 0x0000(s4)             # 00000000
lbl_8009EA7C:
    slt     $at, a3, s2
    or      v1, v0, $zero              # v1 = 00000028
    addiu   t1, t1, 0xFFFF             # t1 = 0000000F
    beq     $at, $zero, lbl_8009EA94
    or      a2, t1, $zero              # a2 = 0000000F
    or      s2, a3, $zero              # s2 = 00000000
lbl_8009EA94:
    andi    t7, t1, 0x0FFF             # t7 = 0000000F
    or      t8, t7, s6                 # t8 = FD70000F
    sw      t8, 0x0000(v1)             # 00000028
    addiu   v0, v0, 0x0008             # v0 = 00000030
    sw      s5, 0x0004(v1)             # 0000002C
    sll     t6, a2,  1
    addiu   t9, t6, 0x0009             # t9 = 00001009
    sra     t7, t9,  3
    andi    t8, t7, 0x01FF             # t8 = 0000000F
    or      a0, v0, $zero              # a0 = 00000030
    sll     t6, t8,  9
    or      s1, t6, s7                 # s1 = F5701000
    sw      s1, 0x0000(a0)             # 00000030
    sw      s3, 0x0004(a0)             # 00000034
    addiu   v0, v0, 0x0008             # v0 = 00000038
    or      a1, v0, $zero              # a1 = 00000038
    sw      s8, 0x0000(a1)             # 00000038
    sw      $zero, 0x0004(a1)          # 0000003C
    addiu   v0, v0, 0x0008             # v0 = 00000040
    sll     t4, a2,  2
    addu    t1, t0, s2
    addiu   t2, t1, 0xFFFF             # t2 = 0000000E
    andi    t4, t4, 0x0FFF             # t4 = 00000000
    sll     t4, t4, 12
    sll     s0, t2,  2
    or      t3, v0, $zero              # t3 = 00000040
    sll     a1, t0,  2
    andi    a1, a1, 0x0FFF             # a1 = 00000038
    andi    s0, s0, 0x0FFF             # s0 = 00000000
    or      t7, t4, s3                 # t7 = 07000000
    or      t8, t7, s0                 # t8 = 07000000
    or      t9, $ra, a1                # t9 = F4000038
    sw      t9, 0x0000(t3)             # 00000040
    sw      t8, 0x0004(t3)             # 00000044
    addiu   v0, v0, 0x0008             # v0 = 00000048
    or      v1, v0, $zero              # v1 = 00000048
    lui     t6, 0xE700                 # t6 = E7000000
    sw      t6, 0x0000(v1)             # 00000048
    sw      $zero, 0x0004(v1)          # 0000004C
    addiu   v0, v0, 0x0008             # v0 = 00000050
    or      a0, v0, $zero              # a0 = 00000050
    sw      s1, 0x0000(a0)             # 00000050
    sw      $zero, 0x0004(a0)          # 00000054
    addiu   v0, v0, 0x0008             # v0 = 00000058
    or      t5, v0, $zero              # t5 = 00000058
    lui     $at, 0xF200                # $at = F2000000
    or      t9, a1, $at                # t9 = F2000038
    or      t7, t4, s0                 # t7 = 00000000
    sw      t7, 0x0004(t5)             # 0000005C
    sw      t9, 0x0000(t5)             # 00000058
    addiu   v0, v0, 0x0008             # v0 = 00000060
    addiu   t8, a2, 0x0001             # t8 = 00000010
    sll     t6, t8,  2
    andi    t9, t6, 0x0FFF             # t9 = 00000000
    sll     t7, t9, 12
    addiu   t6, t2, 0x0001             # t6 = 0000000F
    lui     $at, 0xE400                # $at = E4000000
    or      t8, t7, $at                # t8 = E4000000
    sll     t9, t6,  2
    or      v1, v0, $zero              # v1 = 00000060
    andi    t7, t9, 0x0FFF             # t7 = 00000000
    or      t6, t8, t7                 # t6 = E4000000
    sw      t6, 0x0000(v1)             # 00000060
    sw      a1, 0x0004(v1)             # 00000064
    addiu   v0, v0, 0x0008             # v0 = 00000068
    or      a0, v0, $zero              # a0 = 00000068
    sll     t8, t0,  5
    andi    t7, t8, 0xFFFF             # t7 = 00000000
    lui     t9, 0xE100                 # t9 = E1000000
    sw      t9, 0x0000(a0)             # 00000068
    sw      t7, 0x0004(a0)             # 0000006C
    addiu   v0, v0, 0x0008             # v0 = 00000070
    or      t3, v0, $zero              # t3 = 00000070
    lui     t9, 0x0400                 # t9 = 04000000
    ori     t9, t9, 0x0400             # t9 = 04000400
    lui     t6, 0xF100                 # t6 = F1000000
    sw      t6, 0x0000(t3)             # 00000070
    sw      t9, 0x0004(t3)             # 00000074
    addiu   v0, v0, 0x0008             # v0 = 00000078
    or      t0, t1, $zero              # t0 = 0000000F
    subu    a3, a3, s2
    bgtzl   a3, lbl_8009EA7C
    lw      t1, 0x0000(s4)             # 00000000
lbl_8009EBE0:
    or      v1, v0, $zero              # v1 = 00000078
    lui     t8, 0xE700                 # t8 = E7000000
    sw      t8, 0x0000(v1)             # 00000078
    sw      $zero, 0x0004(v1)          # 0000007C
    addiu   v0, v0, 0x0008             # v0 = 00000080
    lw      t7, 0x0000(s4)             # 00000000
    lui     $at, 0xFF10                # $at = FF100000
    or      a0, v0, $zero              # a0 = 00000080
    addiu   t6, t7, 0xFFFF             # t6 = FFFFFFFF
    andi    t9, t6, 0x0FFF             # t9 = 00000FFF
    or      t8, t9, $at                # t8 = FF100FFF
    sw      t8, 0x0000(a0)             # 00000080
    lw      t7, 0x0010(s4)             # 00000010
    addiu   v0, v0, 0x0008             # v0 = 00000088
    sw      t7, 0x0004(a0)             # 00000084
    lw      t6, 0x0034($sp)
    sw      v0, 0x0000(t6)             # FFFFFFFF
    lw      $ra, 0x002C($sp)
    lw      s0, 0x0008($sp)
    lw      s1, 0x000C($sp)
    lw      s2, 0x0010($sp)
    lw      s3, 0x0014($sp)
    lw      s4, 0x0018($sp)
    lw      s5, 0x001C($sp)
    lw      s6, 0x0020($sp)
    lw      s7, 0x0024($sp)
    lw      s8, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030           # $sp += 0x30


func_8009EC54:
# MqDbg: PreRender_SaveZBuffer
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lw      a3, 0x0020(a0)             # 00000020
    beql    a3, $zero, lbl_8009EC80
    lw      $ra, 0x0014($sp)
    lw      a2, 0x001C(a0)             # 0000001C
    beql    a2, $zero, lbl_8009EC80
    lw      $ra, 0x0014($sp)
    jal     func_8009DD68
    nop
    lw      $ra, 0x0014($sp)
lbl_8009EC80:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_8009EC8C:
# MqDbg: PreRender_SaveFramebuffer
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lw      a3, 0x0014(a0)             # 00000014
    beql    a3, $zero, lbl_8009ECB8
    lw      $ra, 0x0014($sp)
    lw      a2, 0x0010(a0)             # 00000010
    beql    a2, $zero, lbl_8009ECB8
    lw      $ra, 0x0014($sp)
    jal     func_8009E8C8
    nop
    lw      $ra, 0x0014($sp)
lbl_8009ECB8:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_8009ECC4:
# MqDbg: PreRender_FetchFbufCoverage
    lui     t2, 0xE700                 # t2 = E7000000
    lw      v0, 0x0000(a1)             # 00000000
    or      v1, v0, $zero              # v1 = 00000000
    sw      t2, 0x0000(v1)             # 00000000
    sw      $zero, 0x0004(v1)          # 00000004
    addiu   v0, v0, 0x0008             # v0 = 00000008
    or      a2, v0, $zero              # a2 = 00000008
    lui     t6, 0xF900                 # t6 = F9000000
    addiu   t7, $zero, 0xFF08          # t7 = FFFFFF08
    sw      t7, 0x0004(a2)             # 0000000C
    sw      t6, 0x0000(a2)             # 00000008
    addiu   v0, v0, 0x0008             # v0 = 00000010
    or      a3, v0, $zero              # a3 = 00000010
    lui     t8, 0xEE00                 # t8 = EE000000
    addiu   t9, $zero, 0xFFFF          # t9 = FFFFFFFF
    sw      t9, 0x0004(a3)             # 00000014
    sw      t8, 0x0000(a3)             # 00000010
    addiu   v0, v0, 0x0008             # v0 = 00000018
    or      t0, v0, $zero              # t0 = 00000018
    lui     t3, 0xEF00                 # t3 = EF000000
    lui     t4, 0x0FA5                 # t4 = 0FA50000
    ori     t4, t4, 0x4044             # t4 = 0FA54044
    ori     t3, t3, 0x0CF0             # t3 = EF000CF0
    sw      t3, 0x0000(t0)             # 00000018
    sw      t4, 0x0004(t0)             # 0000001C
    addiu   v0, v0, 0x0008             # v0 = 00000020
    or      t1, v0, $zero              # t1 = 00000020
    lui     t5, 0xED00                 # t5 = ED000000
    sw      t5, 0x0000(t1)             # 00000020
    lw      t6, 0x0000(a0)             # 00000000
    lw      t4, 0x0004(a0)             # 00000004
    lui     $at, 0x4080                # $at = 40800000
    mtc1    t6, $f4                    # $f4 = -41538370000000000000000000000000000.00
    mtc1    t4, $f16                   # $f16 = 0.00
    mtc1    $at, $f0                   # $f0 = 4.00
    cvt.s.w $f6, $f4
    addiu   v0, v0, 0x0008             # v0 = 00000028
    or      v1, v0, $zero              # v1 = 00000028
    addiu   v0, v0, 0x0008             # v0 = 00000030
    or      a2, v0, $zero              # a2 = 00000030
    cvt.s.w $f18, $f16
    mul.s   $f8, $f6, $f0
    lui     $at, 0xF600                # $at = F6000000
    addiu   v0, v0, 0x0008             # v0 = 00000038
    mul.s   $f4, $f18, $f0
    trunc.w.s $f10, $f8
    trunc.w.s $f6, $f4
    mfc1    t8, $f10
    mfc1    t6, $f6
    andi    t9, t8, 0x0FFF             # t9 = 00000000
    sll     t3, t9, 12
    andi    t7, t6, 0x0FFF             # t7 = 00000000
    or      t8, t3, t7                 # t8 = EF000CF0
    sw      t8, 0x0004(t1)             # 00000024
    lw      t9, 0x0000(a0)             # 00000000
    lw      t3, 0x0004(a0)             # 00000004
    sw      $zero, 0x0004(v1)          # 0000002C
    andi    t4, t9, 0x03FF             # t4 = 00000000
    sll     t5, t4, 14
    andi    t7, t3, 0x03FF             # t7 = 000000F0
    sll     t8, t7,  2
    or      t6, t5, $at                # t6 = FF000000
    or      t9, t6, t8                 # t9 = FF000CF0
    sw      t9, 0x0000(v1)             # 00000028
    sw      t2, 0x0000(a2)             # 00000030
    sw      $zero, 0x0004(a2)          # 00000034
    sw      v0, 0x0000(a1)             # 00000000
    jr      $ra
    nop


func_8009EDD8:
# MqDbg: PreRender_DrawCoverage
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    sw      a1, 0x001C($sp)
    lw      a1, 0x001C($sp)
    jal     func_8009ECC4
    sw      a0, 0x0018($sp)
    lw      a0, 0x0018($sp)
    lw      a1, 0x001C($sp)
    lw      a3, 0x0018(a0)             # 00000018
    beql    a3, $zero, lbl_8009EE10
    lw      $ra, 0x0014($sp)
    jal     func_8009E904
    lw      a2, 0x0010(a0)             # 00000010
    lw      $ra, 0x0014($sp)
lbl_8009EE10:
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_8009EE1C:
# MqDbg: PreRender_RestoreZBuffer
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lw      a2, 0x0020(a0)             # 00000020
    jal     func_8009DD68
    lw      a3, 0x001C(a0)             # 0000001C
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_8009EE40:
# MqDbg: func_800C213C
    addiu   $sp, $sp, 0xFFA0           # $sp -= 0x60
    sw      s7, 0x0024($sp)
    or      s7, a0, $zero              # s7 = 00000000
    sw      $ra, 0x002C($sp)
    sw      s8, 0x0028($sp)
    sw      s6, 0x0020($sp)
    sw      s5, 0x001C($sp)
    sw      s4, 0x0018($sp)
    sw      s3, 0x0014($sp)
    sw      s2, 0x0010($sp)
    sw      s1, 0x000C($sp)
    sw      s0, 0x0008($sp)
    sw      a1, 0x0064($sp)
    lw      t6, 0x0018(s7)             # 00000018
    lw      t7, 0x0064($sp)
    lui     t8, 0xE700                 # t8 = E7000000
    beq     t6, $zero, lbl_8009F164
    lui     t9, 0xFB00                 # t9 = FB000000
    lw      v0, 0x0000(t7)             # 00000000
    or      v1, v0, $zero              # v1 = 00000000
    sw      t8, 0x0000(v1)             # 00000000
    sw      $zero, 0x0004(v1)          # 00000004
    addiu   v0, v0, 0x0008             # v0 = 00000008
    or      a0, v0, $zero              # a0 = 00000008
    addiu   t6, $zero, 0xFF20          # t6 = FFFFFF20
    sw      t6, 0x0004(a0)             # 0000000C
    sw      t9, 0x0000(a0)             # 00000008
    addiu   v0, v0, 0x0008             # v0 = 00000010
    or      a1, v0, $zero              # a1 = 00000010
    lui     t7, 0xEF10                 # t7 = EF100000
    lui     t8, 0x0F0A                 # t8 = 0F0A0000
    ori     t8, t8, 0x100C             # t8 = 0F0A100C
    ori     t7, t7, 0x0CF0             # t7 = EF100CF0
    sw      t7, 0x0000(a1)             # 00000010
    sw      t8, 0x0004(a1)             # 00000014
    addiu   v0, v0, 0x0008             # v0 = 00000018
    or      a2, v0, $zero              # a2 = 00000018
    lui     t9, 0xFCFF                 # t9 = FCFF0000
    lui     t6, 0xFFFC                 # t6 = FFFC0000
    ori     t6, t6, 0xFA38             # t6 = FFFCFA38
    ori     t9, t9, 0xE5FF             # t9 = FCFFE5FF
    sw      t9, 0x0000(a2)             # 00000018
    sw      t6, 0x0004(a2)             # 0000001C
    addiu   v0, v0, 0x0008             # v0 = 00000020
    lw      s6, 0x0004(s7)             # 00000004
    addiu   s8, $zero, 0x0004          # s8 = 00000004
    or      t1, $zero, $zero           # t1 = 00000000
    blez    s6, lbl_8009F148
    lui     $ra, 0x0700                # $ra = 07000000
    sw      t1, 0x0034($sp)
lbl_8009EF08:
    lw      a2, 0x0000(s7)             # 00000000
    slt     $at, s6, s8
    or      v1, v0, $zero              # v1 = 00000020
    addiu   a2, a2, 0xFFFF             # a2 = 00000017
    beq     $at, $zero, lbl_8009EF24
    or      s5, a2, $zero              # s5 = 00000017
    or      s8, s6, $zero              # s8 = 00000000
lbl_8009EF24:
    andi    t7, a2, 0x0FFF             # t7 = 00000017
    lui     $at, 0xFD10                # $at = FD100000
    or      t8, t7, $at                # t8 = FD100017
    sw      t8, 0x0000(v1)             # 00000020
    lw      t9, 0x0014(s7)             # 00000014
    addiu   v0, v0, 0x0008             # v0 = 00000028
    or      a0, v0, $zero              # a0 = 00000028
    sw      t9, 0x0004(v1)             # 00000024
    sll     s4, s5,  1
    addiu   s4, s4, 0x0009             # s4 = 00000009
    sra     s4, s4,  3
    andi    s4, s4, 0x01FF             # s4 = 00000009
    sll     s4, s4,  9
    lui     $at, 0xF510                # $at = F5100000
    or      s4, s4, $at                # s4 = F5100009
    sw      s4, 0x0000(a0)             # 00000028
    addiu   v0, v0, 0x0008             # v0 = 00000030
    or      s3, s5, $zero              # s3 = 00000017
    sw      $ra, 0x0004(a0)            # 0000002C
    or      a1, v0, $zero              # a1 = 00000030
    lui     t6, 0xE600                 # t6 = E6000000
    sw      t6, 0x0000(a1)             # 00000030
    sw      $zero, 0x0004(a1)          # 00000034
    addiu   v0, v0, 0x0008             # v0 = 00000038
    sll     a2, s5,  2
    addu    t2, t1, s8
    addiu   t3, t2, 0xFFFF             # t3 = FFFFFFFF
    andi    a2, a2, 0x0FFF             # a2 = 00000017
    sll     a2, a2, 12
    sll     t0, t3,  2
    or      t4, v0, $zero              # t4 = 00000038
    sll     a3, t1,  2
    andi    a3, a3, 0x0FFF             # a3 = 00000000
    andi    t0, t0, 0x0FFF             # t0 = 00000000
    or      t7, a2, $ra                # t7 = 07000017
    lui     $at, 0xF400                # $at = F4000000
    or      s1, a3, $at                # s1 = F4000000
    or      s2, t7, t0                 # s2 = 07000017
    sw      s2, 0x0004(t4)             # 0000003C
    sw      s1, 0x0000(t4)             # 00000038
    addiu   v0, v0, 0x0008             # v0 = 00000040
    or      v1, v0, $zero              # v1 = 00000040
    lui     t8, 0xE700                 # t8 = E7000000
    sw      t8, 0x0000(v1)             # 00000040
    sw      $zero, 0x0004(v1)          # 00000044
    addiu   v0, v0, 0x0008             # v0 = 00000048
    or      a0, v0, $zero              # a0 = 00000048
    sw      s4, 0x0000(a0)             # 00000048
    sw      $zero, 0x0004(a0)          # 0000004C
    addiu   v0, v0, 0x0008             # v0 = 00000050
    or      t5, v0, $zero              # t5 = 00000050
    lui     $at, 0xF200                # $at = F2000000
    or      s0, a3, $at                # s0 = F2000000
    or      t9, a2, t0                 # t9 = 00000017
    sw      t9, 0x0004(t5)             # 00000054
    sw      s0, 0x0000(t5)             # 00000050
    addiu   v0, v0, 0x0008             # v0 = 00000058
    lw      t6, 0x0000(s7)             # 00000000
    lui     $at, 0xFD88                # $at = FD880000
    or      v1, v0, $zero              # v1 = 00000058
    addiu   t7, t6, 0xFFFF             # t7 = E5FFFFFF
    andi    t8, t7, 0x0FFF             # t8 = 00000FFF
    or      t9, t8, $at                # t9 = FD880FFF
    sw      t9, 0x0000(v1)             # 00000058
    lw      t6, 0x0018(s7)             # 00000018
    addiu   v0, v0, 0x0008             # v0 = 00000060
    or      a0, v0, $zero              # a0 = 00000060
    sw      t6, 0x0004(v1)             # 0000005C
    addiu   s4, s3, 0x0008             # s4 = 0000001F
    sra     s4, s4,  3
    andi    s4, s4, 0x01FF             # s4 = 0000001F
    sll     s4, s4,  9
    lui     $at, 0xF588                # $at = F5880000
    or      s4, s4, $at                # s4 = F588001F
    ori     s4, s4, 0x0160             # s4 = F588017F
    sw      s4, 0x0000(a0)             # 00000060
    addiu   v0, v0, 0x0008             # v0 = 00000068
    sw      $ra, 0x0004(a0)            # 00000064
    or      a1, v0, $zero              # a1 = 00000068
    lui     t7, 0xE600                 # t7 = E6000000
    sw      t7, 0x0000(a1)             # 00000068
    sw      $zero, 0x0004(a1)          # 0000006C
    addiu   v0, v0, 0x0008             # v0 = 00000070
    or      v1, v0, $zero              # v1 = 00000070
    sw      s1, 0x0000(v1)             # 00000070
    sw      s2, 0x0004(v1)             # 00000074
    addiu   v0, v0, 0x0008             # v0 = 00000078
    or      a0, v0, $zero              # a0 = 00000078
    lui     t8, 0xE700                 # t8 = E7000000
    sw      t8, 0x0000(a0)             # 00000078
    sw      $zero, 0x0004(a0)          # 0000007C
    addiu   v0, v0, 0x0008             # v0 = 00000080
    or      a1, v0, $zero              # a1 = 00000080
    lui     t9, 0x0100                 # t9 = 01000000
    sw      t9, 0x0004(a1)             # 00000084
    sw      s4, 0x0000(a1)             # 00000080
    addiu   v0, v0, 0x0008             # v0 = 00000088
    or      t4, v0, $zero              # t4 = 00000088
    lui     $at, 0x0100                # $at = 01000000
    or      t6, a2, $at                # t6 = 01000017
    or      t7, t6, t0                 # t7 = 01000017
    sw      t7, 0x0004(t4)             # 0000008C
    sw      s0, 0x0000(t4)             # 00000088
    addiu   v0, v0, 0x0008             # v0 = 00000090
    addiu   t8, s5, 0x0001             # t8 = 00000018
    sll     t9, t8,  2
    andi    t6, t9, 0x0FFF             # t6 = 00000000
    sll     t7, t6, 12
    addiu   t9, t3, 0x0001             # t9 = 00000000
    lui     $at, 0xE400                # $at = E4000000
    or      t8, t7, $at                # t8 = E5000017
    sll     t6, t9,  2
    or      v1, v0, $zero              # v1 = 00000090
    andi    t7, t6, 0x0FFF             # t7 = 00000000
    or      t9, t8, t7                 # t9 = E5000017
    sw      t9, 0x0000(v1)             # 00000090
    sw      a3, 0x0004(v1)             # 00000094
    addiu   v0, v0, 0x0008             # v0 = 00000098
    or      a0, v0, $zero              # a0 = 00000098
    lui     t6, 0xE100                 # t6 = E1000000
    sw      t6, 0x0000(a0)             # 00000098
    lw      t8, 0x0034($sp)
    addiu   v0, v0, 0x0008             # v0 = 000000A0
    or      v1, v0, $zero              # v1 = 000000A0
    sll     t7, t8,  5
    andi    t9, t7, 0xFFFF             # t9 = 00000000
    sw      t9, 0x0004(a0)             # 0000009C
    lui     t8, 0x0400                 # t8 = 04000000
    ori     t8, t8, 0x0400             # t8 = 04000400
    lui     t6, 0xF100                 # t6 = F1000000
    sw      t6, 0x0000(v1)             # 000000A0
    sw      t8, 0x0004(v1)             # 000000A4
    addiu   v0, v0, 0x0008             # v0 = 000000A8
    or      t1, t2, $zero              # t1 = 00000000
    subu    s6, s6, s8
    bgtzl   s6, lbl_8009EF08
    sw      t1, 0x0034($sp)
lbl_8009F148:
    or      v1, v0, $zero              # v1 = 000000A8
    lui     t7, 0xE700                 # t7 = E7000000
    sw      t7, 0x0000(v1)             # 000000A8
    sw      $zero, 0x0004(v1)          # 000000AC
    addiu   v0, v0, 0x0008             # v0 = 000000B0
    lw      t9, 0x0064($sp)
    sw      v0, 0x0000(t9)             # 00000000
lbl_8009F164:
    lw      $ra, 0x002C($sp)
    lw      s0, 0x0008($sp)
    lw      s1, 0x000C($sp)
    lw      s2, 0x0010($sp)
    lw      s3, 0x0014($sp)
    lw      s4, 0x0018($sp)
    lw      s5, 0x001C($sp)
    lw      s6, 0x0020($sp)
    lw      s7, 0x0024($sp)
    lw      s8, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0060           # $sp += 0x60


func_8009F194:
# MqDbg: PreRender_RestoreFramebuffer
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lw      a2, 0x0014(a0)             # 00000014
    jal     func_8009DD68
    lw      a3, 0x0010(a0)             # 00000010
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_8009F1B8:
# MqDbg: PreRender_CopyImageRegion
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_8009E074
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_8009F1D8:
# MqDbg: PreRender_AntiAliasFilter
    addiu   $sp, $sp, 0xFE88           # $sp -= 0x178
    sw      s7, 0x0024($sp)
    or      s7, a0, $zero              # s7 = 00000000
    sw      s6, 0x0020($sp)
    sw      s5, 0x001C($sp)
    sw      s4, 0x0018($sp)
    sw      s3, 0x0014($sp)
    sw      s2, 0x0010($sp)
    sw      s1, 0x000C($sp)
    sw      s0, 0x0008($sp)
    or      t0, $zero, $zero           # t0 = 00000000
    addiu   t3, $sp, 0x00F8            # t3 = FFFFFF80
    addiu   t4, $sp, 0x00BC            # t4 = FFFFFF44
    addiu   t5, $sp, 0x0080            # t5 = FFFFFF08
    addiu   s6, $sp, 0x0134            # s6 = FFFFFFBC
    addiu   s5, $zero, 0x0005          # s5 = 00000005
lbl_8009F218:
    div     $zero, t0, s5
    mfhi    t6
    mflo    t7
    addu    v1, t6, a1
    addu    a3, t7, a2
    addiu   v1, v1, 0xFFFE             # v1 = FFFFFFFE
    bne     s5, $zero, lbl_8009F23C
    nop
    break   # 0x01C00
lbl_8009F23C:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     s5, $at, lbl_8009F254
    lui     $at, 0x8000                # $at = 80000000
    bne     t0, $at, lbl_8009F254
    nop
    break   # 0x01800
lbl_8009F254:
    addiu   a3, a3, 0xFFFF             # a3 = FFFFFFFF
    or      v0, v1, $zero              # v0 = FFFFFFFE
    bgez    v1, lbl_8009F270
    or      a0, a3, $zero              # a0 = FFFFFFFF
    or      v0, $zero, $zero           # v0 = 00000000
    b       lbl_8009F288
    lw      t1, 0x0000(s7)             # 00000000
lbl_8009F270:
    lw      t1, 0x0000(s7)             # 00000000
    addiu   t2, t1, 0xFFFF             # t2 = FFFFFFFF
    slt     $at, t2, v1
    beq     $at, $zero, lbl_8009F288
    nop
    or      v0, t2, $zero              # v0 = FFFFFFFF
lbl_8009F288:
    bgezl   a3, lbl_8009F29C
    lw      v1, 0x0004(s7)             # 00000004
    b       lbl_8009F2B0
    or      a0, $zero, $zero           # a0 = 00000000
    lw      v1, 0x0004(s7)             # 00000004
lbl_8009F29C:
    addiu   v1, v1, 0xFFFF             # v1 = FFFFFFFD
    slt     $at, v1, a3
    beq     $at, $zero, lbl_8009F2B0
    nop
    or      a0, v1, $zero              # a0 = FFFFFFFD
lbl_8009F2B0:
    multu   a0, t1
    lw      t8, 0x0014(s7)             # 00000014
    sll     t9, v0,  1
    addiu   t0, t0, 0x0001             # t0 = 00000001
    addu    t6, t8, t9
    slti    $at, t0, 0x000F
    addiu   t3, t3, 0x0004             # t3 = FFFFFF84
    addiu   t4, t4, 0x0004             # t4 = FFFFFF48
    addiu   t5, t5, 0x0004             # t5 = FFFFFF0C
    addiu   s6, s6, 0x0004             # s6 = FFFFFFC0
    mflo    t7
    sll     t8, t7,  1
    addu    t9, t6, t8
    lhu     t7, 0x0000(t9)             # 00000000
    sh      t7, 0x0058($sp)
    lw      t6, 0x0058($sp)
    srl     t8, t6, 27
    sll     t9, t8,  3
    sra     t7, t8,  2
    or      t6, t9, t7                 # t6 = 00000000
    sw      t6, -0x0004(t3)            # FFFFFF80
    lw      t8, 0x0058($sp)
    sll     t9, t8,  5
    srl     t7, t9, 27
    sll     t6, t7,  3
    sra     t8, t7,  2
    or      t9, t6, t8                 # t9 = 00000000
    sw      t9, -0x0004(t4)            # FFFFFF44
    lw      t7, 0x0058($sp)
    sll     t6, t7, 10
    srl     t8, t6, 27
    sll     t9, t8,  3
    sra     t7, t8,  2
    or      t6, t9, t7                 # t6 = 00000000
    sw      t6, -0x0004(t5)            # FFFFFF08
    lw      t7, 0x0000(s7)             # 00000000
    lw      t8, 0x0018(s7)             # 00000018
    multu   a0, t7
    addu    t9, t8, v0
    mflo    t6
    addu    t8, t9, t6
    lbu     t7, 0x0000(t8)             # 00000000
    sra     t9, t7,  5
    bne     $at, $zero, lbl_8009F218
    sw      t9, -0x0004(s6)            # FFFFFFBC
    lw      t5, 0x0114($sp)
    lw      s0, 0x00D8($sp)
    lw      s1, 0x009C($sp)
    addiu   t6, $zero, 0x0004          # t6 = 00000004
    sw      a1, 0x017C($sp)
    sw      a2, 0x0180($sp)
    sw      t6, 0x0044($sp)
    addiu   t0, $zero, 0x0001          # t0 = 00000001
    addiu   s6, $sp, 0x0138            # s6 = FFFFFFC0
    addiu   t4, $sp, 0x0080            # t4 = FFFFFF08
    addiu   t3, $sp, 0x00BC            # t3 = FFFFFF44
    addiu   t2, $sp, 0x00F8            # t2 = FFFFFF80
    addiu   t1, $sp, 0x0134            # t1 = FFFFFFBC
    addiu   a3, $zero, 0x0007          # a3 = 00000007
    or      s2, t5, $zero              # s2 = FFFFFF0C
    or      s3, s0, $zero              # s3 = 00000000
    or      s4, s1, $zero              # s4 = 00000000
lbl_8009F3A8:
    lw      t8, 0x0000(s6)             # FFFFFFC0
    lw      v0, 0x0044($sp)
    addiu   s6, s6, 0x0008             # s6 = FFFFFFC8
    bne     a3, t8, lbl_8009FB58
    addu    t7, t2, v0
    lw      a0, 0x0000(t7)             # 00000000
    addu    t9, t4, v0
    sw      t9, 0x002C($sp)
    slt     $at, s2, a0
    beq     $at, $zero, lbl_8009F50C
    addu    a2, t3, v0
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     t0, $at, lbl_8009F3F8
    lw      t6, 0x00FC($sp)
    slt     $at, t6, a0
    bne     $at, $zero, lbl_8009F3F8
    lw      t8, 0x0138($sp)
    bnel    a3, t8, lbl_8009F3FC
    addiu   $at, $zero, 0x0003         # $at = 00000003
    or      s2, a0, $zero              # s2 = FFFFFFFD
lbl_8009F3F8:
    addiu   $at, $zero, 0x0003         # $at = 00000003
lbl_8009F3FC:
    beq     t0, $at, lbl_8009F41C
    lw      t7, 0x0104($sp)
    slt     $at, t7, a0
    bne     $at, $zero, lbl_8009F41C
    lw      t9, 0x0140($sp)
    bne     a3, t9, lbl_8009F41C
    nop
    or      s2, a0, $zero              # s2 = FFFFFFFD
lbl_8009F41C:
    beq     t0, s5, lbl_8009F43C
    lw      t6, 0x010C($sp)
    slt     $at, t6, a0
    bne     $at, $zero, lbl_8009F43C
    lw      t8, 0x0148($sp)
    bne     a3, t8, lbl_8009F43C
    nop
    or      s2, a0, $zero              # s2 = FFFFFFFD
lbl_8009F43C:
    beq     t0, a3, lbl_8009F470
    or      v1, a3, $zero              # v1 = 00000007
    sll     v0, v1,  2
    addu    t7, t2, v0
    lw      t9, 0x0000(t7)             # 00000000
    addu    t6, t1, v0
    slt     $at, t9, a0
    bnel    $at, $zero, lbl_8009F474
    addiu   t7, v1, 0x0002             # t7 = 00000009
    lw      t8, 0x0000(t6)             # 00000004
    bnel    a3, t8, lbl_8009F474
    addiu   t7, v1, 0x0002             # t7 = 00000009
    or      s2, a0, $zero              # s2 = FFFFFFFD
lbl_8009F470:
    addiu   t7, v1, 0x0002             # t7 = 00000009
lbl_8009F474:
    beq     t0, t7, lbl_8009F4A4
    sll     v0, v1,  2
    addu    t9, t2, v0
    lw      t6, 0x0008(t9)             # 00000008
    addu    t8, t1, v0
    slt     $at, t6, a0
    bnel    $at, $zero, lbl_8009F4A8
    addiu   t9, v1, 0x0004             # t9 = 0000000B
    lw      t7, 0x0008(t8)             # 00000008
    bnel    a3, t7, lbl_8009F4A8
    addiu   t9, v1, 0x0004             # t9 = 0000000B
    or      s2, a0, $zero              # s2 = FFFFFFFD
lbl_8009F4A4:
    addiu   t9, v1, 0x0004             # t9 = 0000000B
lbl_8009F4A8:
    beq     t0, t9, lbl_8009F4D8
    sll     v0, v1,  2
    addu    t6, t2, v0
    lw      t8, 0x0010(t6)             # 00000014
    addu    t7, t1, v0
    slt     $at, t8, a0
    bnel    $at, $zero, lbl_8009F4DC
    addiu   t6, v1, 0x0006             # t6 = 0000000D
    lw      t9, 0x0010(t7)             # 00000019
    bnel    a3, t9, lbl_8009F4DC
    addiu   t6, v1, 0x0006             # t6 = 0000000D
    or      s2, a0, $zero              # s2 = FFFFFFFD
lbl_8009F4D8:
    addiu   t6, v1, 0x0006             # t6 = 0000000D
lbl_8009F4DC:
    beq     t0, t6, lbl_8009F50C
    sll     v0, v1,  2
    addu    t8, t2, v0
    lw      t7, 0x0018(t8)             # 00000018
    addu    t9, t1, v0
    slt     $at, t7, a0
    bnel    $at, $zero, lbl_8009F510
    lw      a1, 0x0000(a2)             # 00000000
    lw      t6, 0x0018(t9)             # 00000023
    bnel    a3, t6, lbl_8009F510
    lw      a1, 0x0000(a2)             # 00000000
    or      s2, a0, $zero              # s2 = FFFFFFFD
lbl_8009F50C:
    lw      a1, 0x0000(a2)             # 00000000
lbl_8009F510:
    slt     $at, s3, a1
    beq     $at, $zero, lbl_8009F650
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     t0, $at, lbl_8009F53C
    lw      t8, 0x00C0($sp)
    slt     $at, t8, a1
    bne     $at, $zero, lbl_8009F53C
    lw      t7, 0x0138($sp)
    bnel    a3, t7, lbl_8009F540
    addiu   $at, $zero, 0x0003         # $at = 00000003
    or      s3, a1, $zero              # s3 = 00000000
lbl_8009F53C:
    addiu   $at, $zero, 0x0003         # $at = 00000003
lbl_8009F540:
    beq     t0, $at, lbl_8009F560
    lw      t9, 0x00C8($sp)
    slt     $at, t9, a1
    bne     $at, $zero, lbl_8009F560
    lw      t6, 0x0140($sp)
    bne     a3, t6, lbl_8009F560
    nop
    or      s3, a1, $zero              # s3 = 00000000
lbl_8009F560:
    beq     t0, s5, lbl_8009F580
    lw      t8, 0x00D0($sp)
    slt     $at, t8, a1
    bne     $at, $zero, lbl_8009F580
    lw      t7, 0x0148($sp)
    bne     a3, t7, lbl_8009F580
    nop
    or      s3, a1, $zero              # s3 = 00000000
lbl_8009F580:
    beq     t0, a3, lbl_8009F5B4
    or      v1, a3, $zero              # v1 = 00000007
    sll     v0, v1,  2
    addu    t9, t3, v0
    lw      t6, 0x0000(t9)             # 0000000B
    addu    t8, t1, v0
    slt     $at, t6, a1
    bnel    $at, $zero, lbl_8009F5B8
    addiu   t9, v1, 0x0002             # t9 = 00000009
    lw      t7, 0x0000(t8)             # 00000000
    bnel    a3, t7, lbl_8009F5B8
    addiu   t9, v1, 0x0002             # t9 = 00000009
    or      s3, a1, $zero              # s3 = 00000000
lbl_8009F5B4:
    addiu   t9, v1, 0x0002             # t9 = 00000009
lbl_8009F5B8:
    beq     t0, t9, lbl_8009F5E8
    sll     v0, v1,  2
    addu    t6, t3, v0
    lw      t8, 0x0008(t6)             # 00000015
    addu    t7, t1, v0
    slt     $at, t8, a1
    bnel    $at, $zero, lbl_8009F5EC
    addiu   t6, v1, 0x0004             # t6 = 0000000B
    lw      t9, 0x0008(t7)             # 00000011
    bnel    a3, t9, lbl_8009F5EC
    addiu   t6, v1, 0x0004             # t6 = 0000000B
    or      s3, a1, $zero              # s3 = 00000000
lbl_8009F5E8:
    addiu   t6, v1, 0x0004             # t6 = 0000000B
lbl_8009F5EC:
    beq     t0, t6, lbl_8009F61C
    sll     v0, v1,  2
    addu    t8, t3, v0
    lw      t7, 0x0010(t8)             # 00000010
    addu    t9, t1, v0
    slt     $at, t7, a1
    bnel    $at, $zero, lbl_8009F620
    addiu   t8, v1, 0x0006             # t8 = 0000000D
    lw      t6, 0x0010(t9)             # 00000019
    bnel    a3, t6, lbl_8009F620
    addiu   t8, v1, 0x0006             # t8 = 0000000D
    or      s3, a1, $zero              # s3 = 00000000
lbl_8009F61C:
    addiu   t8, v1, 0x0006             # t8 = 0000000D
lbl_8009F620:
    beq     t0, t8, lbl_8009F650
    sll     v0, v1,  2
    addu    t7, t3, v0
    lw      t9, 0x0018(t7)             # 00000021
    addu    t6, t1, v0
    slt     $at, t9, a1
    bnel    $at, $zero, lbl_8009F654
    lw      t7, 0x002C($sp)
    lw      t8, 0x0018(t6)             # 00000023
    bnel    a3, t8, lbl_8009F654
    lw      t7, 0x002C($sp)
    or      s3, a1, $zero              # s3 = 00000000
lbl_8009F650:
    lw      t7, 0x002C($sp)
lbl_8009F654:
    lw      a2, 0x0000(t7)             # 00000009
    slt     $at, s4, a2
    beq     $at, $zero, lbl_8009F798
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     t0, $at, lbl_8009F684
    lw      t9, 0x0084($sp)
    slt     $at, t9, a2
    bne     $at, $zero, lbl_8009F684
    lw      t6, 0x0138($sp)
    bnel    a3, t6, lbl_8009F688
    addiu   $at, $zero, 0x0003         # $at = 00000003
    or      s4, a2, $zero              # s4 = 00000000
lbl_8009F684:
    addiu   $at, $zero, 0x0003         # $at = 00000003
lbl_8009F688:
    beq     t0, $at, lbl_8009F6A8
    lw      t8, 0x008C($sp)
    slt     $at, t8, a2
    bne     $at, $zero, lbl_8009F6A8
    lw      t7, 0x0140($sp)
    bne     a3, t7, lbl_8009F6A8
    nop
    or      s4, a2, $zero              # s4 = 00000000
lbl_8009F6A8:
    beq     t0, s5, lbl_8009F6C8
    lw      t9, 0x0094($sp)
    slt     $at, t9, a2
    bne     $at, $zero, lbl_8009F6C8
    lw      t6, 0x0148($sp)
    bne     a3, t6, lbl_8009F6C8
    nop
    or      s4, a2, $zero              # s4 = 00000000
lbl_8009F6C8:
    beq     t0, a3, lbl_8009F6FC
    or      v1, a3, $zero              # v1 = 00000007
    sll     v0, v1,  2
    addu    t8, t4, v0
    lw      t7, 0x0000(t8)             # 0000000D
    addu    t9, t1, v0
    slt     $at, t7, a2
    bnel    $at, $zero, lbl_8009F700
    addiu   t8, v1, 0x0002             # t8 = 00000009
    lw      t6, 0x0000(t9)             # 00000009
    bnel    a3, t6, lbl_8009F700
    addiu   t8, v1, 0x0002             # t8 = 00000009
    or      s4, a2, $zero              # s4 = 00000000
lbl_8009F6FC:
    addiu   t8, v1, 0x0002             # t8 = 00000009
lbl_8009F700:
    beq     t0, t8, lbl_8009F730
    sll     v0, v1,  2
    addu    t7, t4, v0
    lw      t9, 0x0008(t7)             # 00000011
    addu    t6, t1, v0
    slt     $at, t9, a2
    bnel    $at, $zero, lbl_8009F734
    addiu   t7, v1, 0x0004             # t7 = 0000000B
    lw      t8, 0x0008(t6)             # 00000013
    bnel    a3, t8, lbl_8009F734
    addiu   t7, v1, 0x0004             # t7 = 0000000B
    or      s4, a2, $zero              # s4 = 00000000
lbl_8009F730:
    addiu   t7, v1, 0x0004             # t7 = 0000000B
lbl_8009F734:
    beq     t0, t7, lbl_8009F764
    sll     v0, v1,  2
    addu    t9, t4, v0
    lw      t6, 0x0010(t9)             # 00000019
    addu    t8, t1, v0
    slt     $at, t6, a2
    bnel    $at, $zero, lbl_8009F768
    addiu   t9, v1, 0x0006             # t9 = 0000000D
    lw      t7, 0x0010(t8)             # 00000019
    bnel    a3, t7, lbl_8009F768
    addiu   t9, v1, 0x0006             # t9 = 0000000D
    or      s4, a2, $zero              # s4 = 00000000
lbl_8009F764:
    addiu   t9, v1, 0x0006             # t9 = 0000000D
lbl_8009F768:
    beq     t0, t9, lbl_8009F798
    sll     v0, v1,  2
    addu    t6, t4, v0
    lw      t8, 0x0018(t6)             # 00000023
    addu    t7, t1, v0
    slt     $at, t8, a2
    bnel    $at, $zero, lbl_8009F79C
    slt     $at, a0, t5
    lw      t9, 0x0018(t7)             # 00000023
    bnel    a3, t9, lbl_8009F79C
    slt     $at, a0, t5
    or      s4, a2, $zero              # s4 = 00000000
lbl_8009F798:
    slt     $at, a0, t5
lbl_8009F79C:
    beq     $at, $zero, lbl_8009F8D8
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     t0, $at, lbl_8009F7C4
    lw      t6, 0x00FC($sp)
    slt     $at, a0, t6
    bne     $at, $zero, lbl_8009F7C4
    lw      t8, 0x0138($sp)
    bnel    a3, t8, lbl_8009F7C8
    addiu   $at, $zero, 0x0003         # $at = 00000003
    or      t5, a0, $zero              # t5 = FFFFFFFD
lbl_8009F7C4:
    addiu   $at, $zero, 0x0003         # $at = 00000003
lbl_8009F7C8:
    beq     t0, $at, lbl_8009F7E8
    lw      t7, 0x0104($sp)
    slt     $at, a0, t7
    bne     $at, $zero, lbl_8009F7E8
    lw      t9, 0x0140($sp)
    bne     a3, t9, lbl_8009F7E8
    nop
    or      t5, a0, $zero              # t5 = FFFFFFFD
lbl_8009F7E8:
    beq     t0, s5, lbl_8009F808
    lw      t6, 0x010C($sp)
    slt     $at, a0, t6
    bne     $at, $zero, lbl_8009F808
    lw      t8, 0x0148($sp)
    bne     a3, t8, lbl_8009F808
    nop
    or      t5, a0, $zero              # t5 = FFFFFFFD
lbl_8009F808:
    beq     t0, a3, lbl_8009F83C
    or      v1, a3, $zero              # v1 = 00000007
    sll     v0, v1,  2
    addu    t7, t2, v0
    lw      t9, 0x0000(t7)             # 0000000B
    addu    t6, t1, v0
    slt     $at, a0, t9
    bnel    $at, $zero, lbl_8009F840
    addiu   t7, v1, 0x0002             # t7 = 00000009
    lw      t8, 0x0000(t6)             # 0000000B
    bnel    a3, t8, lbl_8009F840
    addiu   t7, v1, 0x0002             # t7 = 00000009
    or      t5, a0, $zero              # t5 = FFFFFFFD
lbl_8009F83C:
    addiu   t7, v1, 0x0002             # t7 = 00000009
lbl_8009F840:
    beq     t0, t7, lbl_8009F870
    sll     v0, v1,  2
    addu    t9, t2, v0
    lw      t6, 0x0008(t9)             # 00000015
    addu    t8, t1, v0
    slt     $at, a0, t6
    bnel    $at, $zero, lbl_8009F874
    addiu   t9, v1, 0x0004             # t9 = 0000000B
    lw      t7, 0x0008(t8)             # 00000011
    bnel    a3, t7, lbl_8009F874
    addiu   t9, v1, 0x0004             # t9 = 0000000B
    or      t5, a0, $zero              # t5 = FFFFFFFD
lbl_8009F870:
    addiu   t9, v1, 0x0004             # t9 = 0000000B
lbl_8009F874:
    beq     t0, t9, lbl_8009F8A4
    sll     v0, v1,  2
    addu    t6, t2, v0
    lw      t8, 0x0010(t6)             # 0000001B
    addu    t7, t1, v0
    slt     $at, a0, t8
    bnel    $at, $zero, lbl_8009F8A8
    addiu   t6, v1, 0x0006             # t6 = 0000000D
    lw      t9, 0x0010(t7)             # 00000019
    bnel    a3, t9, lbl_8009F8A8
    addiu   t6, v1, 0x0006             # t6 = 0000000D
    or      t5, a0, $zero              # t5 = FFFFFFFD
lbl_8009F8A4:
    addiu   t6, v1, 0x0006             # t6 = 0000000D
lbl_8009F8A8:
    beq     t0, t6, lbl_8009F8D8
    sll     v0, v1,  2
    addu    t8, t2, v0
    lw      t7, 0x0018(t8)             # 00000021
    addu    t9, t1, v0
    slt     $at, a0, t7
    bnel    $at, $zero, lbl_8009F8DC
    slt     $at, a1, s0
    lw      t6, 0x0018(t9)             # 00000023
    bnel    a3, t6, lbl_8009F8DC
    slt     $at, a1, s0
    or      t5, a0, $zero              # t5 = FFFFFFFD
lbl_8009F8D8:
    slt     $at, a1, s0
lbl_8009F8DC:
    beq     $at, $zero, lbl_8009FA18
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     t0, $at, lbl_8009F904
    lw      t8, 0x00C0($sp)
    slt     $at, a1, t8
    bne     $at, $zero, lbl_8009F904
    lw      t7, 0x0138($sp)
    bnel    a3, t7, lbl_8009F908
    addiu   $at, $zero, 0x0003         # $at = 00000003
    or      s0, a1, $zero              # s0 = 00000000
lbl_8009F904:
    addiu   $at, $zero, 0x0003         # $at = 00000003
lbl_8009F908:
    beq     t0, $at, lbl_8009F928
    lw      t9, 0x00C8($sp)
    slt     $at, a1, t9
    bne     $at, $zero, lbl_8009F928
    lw      t6, 0x0140($sp)
    bne     a3, t6, lbl_8009F928
    nop
    or      s0, a1, $zero              # s0 = 00000000
lbl_8009F928:
    beq     t0, s5, lbl_8009F948
    lw      t8, 0x00D0($sp)
    slt     $at, a1, t8
    bne     $at, $zero, lbl_8009F948
    lw      t7, 0x0148($sp)
    bne     a3, t7, lbl_8009F948
    nop
    or      s0, a1, $zero              # s0 = 00000000
lbl_8009F948:
    beq     t0, a3, lbl_8009F97C
    or      v1, a3, $zero              # v1 = 00000007
    sll     v0, v1,  2
    addu    t9, t3, v0
    lw      t6, 0x0000(t9)             # 0000000B
    addu    t8, t1, v0
    slt     $at, a1, t6
    bnel    $at, $zero, lbl_8009F980
    addiu   t9, v1, 0x0002             # t9 = 00000009
    lw      t7, 0x0000(t8)             # 00000009
    bnel    a3, t7, lbl_8009F980
    addiu   t9, v1, 0x0002             # t9 = 00000009
    or      s0, a1, $zero              # s0 = 00000000
lbl_8009F97C:
    addiu   t9, v1, 0x0002             # t9 = 00000009
lbl_8009F980:
    beq     t0, t9, lbl_8009F9B0
    sll     v0, v1,  2
    addu    t6, t3, v0
    lw      t8, 0x0008(t6)             # 00000015
    addu    t7, t1, v0
    slt     $at, a1, t8
    bnel    $at, $zero, lbl_8009F9B4
    addiu   t6, v1, 0x0004             # t6 = 0000000B
    lw      t9, 0x0008(t7)             # 00000011
    bnel    a3, t9, lbl_8009F9B4
    addiu   t6, v1, 0x0004             # t6 = 0000000B
    or      s0, a1, $zero              # s0 = 00000000
lbl_8009F9B0:
    addiu   t6, v1, 0x0004             # t6 = 0000000B
lbl_8009F9B4:
    beq     t0, t6, lbl_8009F9E4
    sll     v0, v1,  2
    addu    t8, t3, v0
    lw      t7, 0x0010(t8)             # 00000019
    addu    t9, t1, v0
    slt     $at, a1, t7
    bnel    $at, $zero, lbl_8009F9E8
    addiu   t8, v1, 0x0006             # t8 = 0000000D
    lw      t6, 0x0010(t9)             # 00000019
    bnel    a3, t6, lbl_8009F9E8
    addiu   t8, v1, 0x0006             # t8 = 0000000D
    or      s0, a1, $zero              # s0 = 00000000
lbl_8009F9E4:
    addiu   t8, v1, 0x0006             # t8 = 0000000D
lbl_8009F9E8:
    beq     t0, t8, lbl_8009FA18
    sll     v0, v1,  2
    addu    t7, t3, v0
    lw      t9, 0x0018(t7)             # 00000021
    addu    t6, t1, v0
    slt     $at, a1, t9
    bnel    $at, $zero, lbl_8009FA1C
    slt     $at, a2, s1
    lw      t8, 0x0018(t6)             # 00000023
    bnel    a3, t8, lbl_8009FA1C
    slt     $at, a2, s1
    or      s0, a1, $zero              # s0 = 00000000
lbl_8009FA18:
    slt     $at, a2, s1
lbl_8009FA1C:
    beq     $at, $zero, lbl_8009FB58
    addiu   $at, $zero, 0x0001         # $at = 00000001
    beq     t0, $at, lbl_8009FA44
    lw      t7, 0x0084($sp)
    slt     $at, a2, t7
    bne     $at, $zero, lbl_8009FA44
    lw      t9, 0x0138($sp)
    bnel    a3, t9, lbl_8009FA48
    addiu   $at, $zero, 0x0003         # $at = 00000003
    or      s1, a2, $zero              # s1 = 00000000
lbl_8009FA44:
    addiu   $at, $zero, 0x0003         # $at = 00000003
lbl_8009FA48:
    beq     t0, $at, lbl_8009FA68
    lw      t6, 0x008C($sp)
    slt     $at, a2, t6
    bne     $at, $zero, lbl_8009FA68
    lw      t8, 0x0140($sp)
    bne     a3, t8, lbl_8009FA68
    nop
    or      s1, a2, $zero              # s1 = 00000000
lbl_8009FA68:
    beq     t0, s5, lbl_8009FA88
    lw      t7, 0x0094($sp)
    slt     $at, a2, t7
    bne     $at, $zero, lbl_8009FA88
    lw      t9, 0x0148($sp)
    bne     a3, t9, lbl_8009FA88
    nop
    or      s1, a2, $zero              # s1 = 00000000
lbl_8009FA88:
    beq     t0, a3, lbl_8009FABC
    or      v1, a3, $zero              # v1 = 00000007
    sll     v0, v1,  2
    addu    t6, t4, v0
    lw      t8, 0x0000(t6)             # 0000000B
    addu    t7, t1, v0
    slt     $at, a2, t8
    bnel    $at, $zero, lbl_8009FAC0
    addiu   t6, v1, 0x0002             # t6 = 00000009
    lw      t9, 0x0000(t7)             # 00000009
    bnel    a3, t9, lbl_8009FAC0
    addiu   t6, v1, 0x0002             # t6 = 00000009
    or      s1, a2, $zero              # s1 = 00000000
lbl_8009FABC:
    addiu   t6, v1, 0x0002             # t6 = 00000009
lbl_8009FAC0:
    beq     t0, t6, lbl_8009FAF0
    sll     v0, v1,  2
    addu    t8, t4, v0
    lw      t7, 0x0008(t8)             # 00000015
    addu    t9, t1, v0
    slt     $at, a2, t7
    bnel    $at, $zero, lbl_8009FAF4
    addiu   t8, v1, 0x0004             # t8 = 0000000B
    lw      t6, 0x0008(t9)             # 00000011
    bnel    a3, t6, lbl_8009FAF4
    addiu   t8, v1, 0x0004             # t8 = 0000000B
    or      s1, a2, $zero              # s1 = 00000000
lbl_8009FAF0:
    addiu   t8, v1, 0x0004             # t8 = 0000000B
lbl_8009FAF4:
    beq     t0, t8, lbl_8009FB24
    sll     v0, v1,  2
    addu    t7, t4, v0
    lw      t9, 0x0010(t7)             # 00000019
    addu    t6, t1, v0
    slt     $at, a2, t9
    bnel    $at, $zero, lbl_8009FB28
    addiu   t7, v1, 0x0006             # t7 = 0000000D
    lw      t8, 0x0010(t6)             # 00000019
    bnel    a3, t8, lbl_8009FB28
    addiu   t7, v1, 0x0006             # t7 = 0000000D
    or      s1, a2, $zero              # s1 = 00000000
lbl_8009FB24:
    addiu   t7, v1, 0x0006             # t7 = 0000000D
lbl_8009FB28:
    beq     t0, t7, lbl_8009FB58
    sll     v0, v1,  2
    addu    t9, t4, v0
    lw      t6, 0x0018(t9)             # 00000021
    addu    t8, t1, v0
    slt     $at, a2, t6
    bnel    $at, $zero, lbl_8009FB5C
    lw      t9, 0x0044($sp)
    lw      t7, 0x0018(t8)             # 00000023
    bnel    a3, t7, lbl_8009FB5C
    lw      t9, 0x0044($sp)
    or      s1, a2, $zero              # s1 = 00000000
lbl_8009FB58:
    lw      t9, 0x0044($sp)
lbl_8009FB5C:
    addiu   t0, t0, 0x0002             # t0 = 00000003
    addiu   $at, $zero, 0x000F         # $at = 0000000F
    addiu   t6, t9, 0x0008             # t6 = 00000011
    bne     t0, $at, lbl_8009F3A8
    sw      t6, 0x0044($sp)
    lw      t8, 0x0150($sp)
    lw      t9, 0x0114($sp)
    addu    t7, s2, t5
    subu    v0, a3, t8
    sll     t6, t9,  1
    subu    t8, t7, t6
    multu   t8, v0
    mflo    t7
    addiu   t6, t7, 0x0004             # t6 = 00000011
    sra     t8, t6,  3
    lw      t6, 0x00D8($sp)
    addu    v1, t8, t9
    addu    t7, s3, s0
    sll     t8, t6,  1
    subu    t9, t7, t8
    multu   t9, v0
    mflo    t7
    addiu   t8, t7, 0x0004             # t8 = 00000011
    sra     t9, t8,  3
    lw      t8, 0x009C($sp)
    addu    a0, t9, t6
    addu    t7, s4, s1
    sll     t9, t8,  1
    subu    t6, t7, t9
    multu   t6, v0
    mflo    t7
    addiu   t9, t7, 0x0004             # t9 = 00000011
    sra     t6, t9,  3
    lbu     t7, 0x0054($sp)
    srl     t9, v1,  3
    addu    a1, t6, t8
    sll     t8, t9,  3
    andi    t9, t7, 0xFF07             # t9 = 00000005
    or      t6, t8, t9                 # t6 = 00000015
    sb      t6, 0x0054($sp)
    lhu     t7, 0x0054($sp)
    srl     t8, a0,  3
    sll     t9, t8,  6
    andi    t6, t9, 0x07C0             # t6 = 00000000
    andi    t8, t7, 0xF83F             # t8 = 0000000D
    or      t9, t6, t8                 # t9 = 0000000D
    sh      t9, 0x0054($sp)
    lbu     t7, 0x0055($sp)
    srl     t6, a1,  3
    sll     t8, t6,  1
    andi    t9, t8, 0x003E             # t9 = 0000000C
    andi    t6, t7, 0xFFC1             # t6 = 00000001
    or      t8, t9, t6                 # t8 = 0000000D
    or      t9, t8, $zero              # t9 = 0000000D
    ori     t6, t9, 0x0001             # t6 = 0000000D
    sb      t8, 0x0055($sp)
    lw      t9, 0x017C($sp)
    sb      t6, 0x0055($sp)
    lw      t7, 0x0014(s7)             # 00000014
    sll     t6, t9,  1
    lhu     t8, 0x0054($sp)
    addu    t9, t7, t6
    lw      t6, 0x0000(s7)             # 00000000
    lw      t7, 0x0180($sp)
    multu   t7, t6
    mflo    t7
    sll     t6, t7,  1
    addu    t7, t9, t6
    sh      t8, 0x0000(t7)             # 0000000D
    lw      s0, 0x0008($sp)
    lw      s1, 0x000C($sp)
    lw      s2, 0x0010($sp)
    lw      s3, 0x0014($sp)
    lw      s4, 0x0018($sp)
    lw      s5, 0x001C($sp)
    lw      s6, 0x0020($sp)
    lw      s7, 0x0024($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0178           # $sp += 0x178


func_8009FC98:
# MqDbg: PreRender_DivotFilter
    addiu   $sp, $sp, 0xFFB0           # $sp -= 0x50
    sw      s1, 0x0014($sp)
    sw      s0, 0x0010($sp)
    or      t5, $sp, $zero             # t5 = FFFFFFB0
    or      a1, a0, $zero              # a1 = 00000000
    lw      v0, 0x0000(a1)             # 00000000
    addiu   $at, $zero, 0xFFF8         # $at = FFFFFFF8
    lw      t6, 0x0004(a1)             # 00000004
    addiu   v1, v0, 0x0007             # v1 = 00000007
    and     v1, v1, $at
    subu    a3, $sp, v1
    subu    t0, a3, v1
    subu    t1, t0, v1
    blez    t6, lbl_8009FDD8
    or      a2, $zero, $zero           # a2 = 00000000
    addiu   t2, $zero, 0x0007          # t2 = 00000007
lbl_8009FCD8:
    blez    v0, lbl_8009FD5C
    or      v1, $zero, $zero           # v1 = 00000000
    or      a0, a3, $zero              # a0 = 00000000
    or      t3, t0, $zero              # t3 = 00000000
    or      t4, t1, $zero              # t4 = 00000000
lbl_8009FCEC:
    multu   a2, v0
    lw      t7, 0x0014(a1)             # 00000014
    sll     t8, v1,  1
    addiu   v1, v1, 0x0001             # v1 = 00000001
    addu    t9, t7, t8
    addiu   a0, a0, 0x0001             # a0 = 00000001
    addiu   t3, t3, 0x0001             # t3 = 00000001
    addiu   t4, t4, 0x0001             # t4 = 00000001
    mflo    t6
    sll     t7, t6,  1
    addu    t8, t9, t7
    lhu     t6, 0x0000(t8)             # 00000000
    sh      t6, 0x001C(t5)             # FFFFFFCC
    lw      t9, 0x001C(t5)             # FFFFFFCC
    srl     t7, t9, 27
    sb      t7, -0x0001(a0)            # 00000000
    lw      t8, 0x001C(t5)             # FFFFFFCC
    sll     t6, t8,  5
    srl     t9, t6, 27
    sb      t9, -0x0001(t3)            # 00000000
    lw      t7, 0x001C(t5)             # FFFFFFCC
    sll     t8, t7, 10
    srl     t6, t8, 27
    sb      t6, -0x0001(t4)            # 00000000
    lw      v0, 0x0000(a1)             # 00000000
    slt     $at, v1, v0
    bne     $at, $zero, lbl_8009FCEC
    nop
lbl_8009FD5C:
    addiu   a0, v0, 0xFFFF             # a0 = FFFFFFFF
    slti    $at, a0, 0x0002
    bne     $at, $zero, lbl_8009FDC4
    addiu   v1, $zero, 0x0001          # v1 = 00000001
lbl_8009FD6C:
    multu   a2, v0
    lw      t9, 0x0018(a1)             # 00000018
    addu    t7, t9, v1
    mflo    t3
    addu    t8, t7, t3
    lbu     t4, 0x0000(t8)             # 00000000
    sra     t4, t4,  5
    beql    t4, t2, lbl_8009FDB8
    addiu   v1, v1, 0x0001             # v1 = 00000002
    lw      t9, 0x0014(a1)             # 00000014
    sll     t7, v1,  1
    lhu     t6, 0x0018(t5)             # FFFFFFC8
    addu    t8, t9, t7
    sll     t9, t3,  1
    addu    t7, t8, t9
    sh      t6, 0x0000(t7)             # 00000000
    lw      v0, 0x0000(a1)             # 00000000
    addiu   a0, v0, 0xFFFF             # a0 = FFFFFFFF
    addiu   v1, v1, 0x0001             # v1 = 00000003
lbl_8009FDB8:
    slt     $at, v1, a0
    bne     $at, $zero, lbl_8009FD6C
    nop
lbl_8009FDC4:
    lw      t8, 0x0004(a1)             # 00000004
    addiu   a2, a2, 0x0001             # a2 = 00000001
    slt     $at, a2, t8
    bne     $at, $zero, lbl_8009FCD8
    nop
lbl_8009FDD8:
    or      $sp, t5, $zero             # $sp -= 0x50
    lw      s0, 0x0010(t5)             # FFFFFFC0
    lw      s1, 0x0014(t5)             # FFFFFFC4
    jr      $ra
    addiu   $sp, t5, 0x0050            # $sp = 00000000


func_8009FDEC:
# MqDbg: PreRender_ApplyFilters
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      s1, 0x0018($sp)
    or      s1, a0, $zero              # s1 = 00000000
    sw      $ra, 0x0024($sp)
    sw      s3, 0x0020($sp)
    sw      s2, 0x001C($sp)
    sw      s0, 0x0014($sp)
    lw      t6, 0x0018(s1)             # 00000018
    beql    t6, $zero, lbl_8009FEA4
    lw      $ra, 0x0024($sp)
    lw      t7, 0x0014(s1)             # 00000014
    beql    t7, $zero, lbl_8009FEA4
    lw      $ra, 0x0024($sp)
    lw      v0, 0x0004(s1)             # 00000004
    or      s2, $zero, $zero           # s2 = 00000000
    addiu   s3, $zero, 0x0008          # s3 = 00000008
    blezl   v0, lbl_8009FEA4
    lw      $ra, 0x0024($sp)
    lw      v1, 0x0000(s1)             # 00000000
lbl_8009FE38:
    blez    v1, lbl_8009FE90
    or      s0, $zero, $zero           # s0 = 00000000
lbl_8009FE40:
    multu   s2, v1
    lw      t8, 0x0018(s1)             # 00000018
    or      a0, s1, $zero              # a0 = 00000000
    or      a1, s0, $zero              # a1 = 00000000
    addu    t9, t8, s0
    mflo    t0
    addu    t1, t9, t0
    lbu     v0, 0x0000(t1)             # 00000000
    sra     v0, v0,  5
    addiu   v0, v0, 0x0001             # v0 = 00000001
    beql    v0, s3, lbl_8009FE80
    addiu   s0, s0, 0x0001             # s0 = 00000001
    jal     func_8009F1D8
    or      a2, s2, $zero              # a2 = 00000000
    lw      v1, 0x0000(s1)             # 00000000
    addiu   s0, s0, 0x0001             # s0 = 00000002
lbl_8009FE80:
    slt     $at, s0, v1
    bne     $at, $zero, lbl_8009FE40
    nop
    lw      v0, 0x0004(s1)             # 00000004
lbl_8009FE90:
    addiu   s2, s2, 0x0001             # s2 = 00000001
    slt     $at, s2, v0
    bne     $at, $zero, lbl_8009FE38
    nop
    lw      $ra, 0x0024($sp)
lbl_8009FEA4:
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    lw      s2, 0x001C($sp)
    lw      s3, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    nop
