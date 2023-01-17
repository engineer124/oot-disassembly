# "Particle Effects" part of the code file
#
# Handles all particle effects, including blur, shield, spark and soft sprites.
#
# General Documentation about particles:
# https://wiki.cloudmodding.com/oot/Particles
#
# Starts at VRAM: 8001BAA0 / VROM: A91A00
#

.section .text
func_8001BAA0:
# MqDbg: EffectSs_DrawGEffect
# Draw Splash? (Particle 0x0A)
    addiu   $sp, $sp, 0xFEA8           # $sp -= 0x158
    sw      s1, 0x0018($sp)
    or      s1, a1, $zero              # s1 = 00000000
    sw      $ra, 0x001C($sp)
    sw      s0, 0x0014($sp)
    sw      a0, 0x0158($sp)
    sw      a2, 0x0160($sp)
    lh      t7, 0x0056(s1)             # 00000056
    lw      t6, 0x0158($sp)
    lui     t0, 0x0001                 # t0 = 00010000
    sll     t8, t7,  4
    addu    t8, t8, t7
    sll     t8, t8,  2
    addu    t9, t6, t8
    addu    t0, t0, t9
    lw      t0, 0x17B4(t0)             # 000117B4
    lw      s0, 0x0000(t6)             # 00000000
    sw      t0, 0x0044($sp)
    lh      t1, 0x0042(s1)             # 00000042
    lui     $at, 0x8010                # $at = 80100000
    lwc1    $f8, 0x6080($at)           # 80106080
    mtc1    t1, $f4                    # $f4 = 0.00
    lw      a1, 0x0000(s1)             # 00000000
    lw      a2, 0x0004(s1)             # 00000004
    cvt.s.w $f6, $f4
    lw      a3, 0x0008(s1)             # 00000008
    addiu   a0, $sp, 0x0110            # a0 = FFFFFFB8
    mul.s   $f0, $f6, $f8
    jal     func_8008F82C              # guTranslateF
    swc1    $f0, 0x0150($sp)
    lwc1    $f0, 0x0150($sp)
    addiu   a0, $sp, 0x00D0            # a0 = FFFFFF78
    mfc1    a1, $f0
    mfc1    a2, $f0
    mfc1    a3, $f0
    jal     func_8008F4A8              # guScaleF
    nop
    lw      a1, 0x0158($sp)
    lui     $at, 0x0001                # $at = 00010000
    ori     $at, $at, 0x1DA0           # $at = 00011DA0
    addiu   a0, $sp, 0x0110            # a0 = FFFFFFB8
    addiu   a2, $sp, 0x0050            # a2 = FFFFFEF8
    jal     func_8008EDB8
    addu    a1, a1, $at
    addiu   a0, $sp, 0x0050            # a0 = FFFFFEF8
    addiu   a1, $sp, 0x00D0            # a1 = FFFFFF78
    jal     func_8008EDB8
    addiu   a2, $sp, 0x0090            # a2 = FFFFFF38
    lw      a2, 0x0044($sp)
    lui     $at, 0x8000                # $at = 80000000
    or      a0, s0, $zero              # a0 = 00000000
    addu    t2, a2, $at
    lui     $at, 0x8012                # $at = 80120000
    sw      t2, 0x0C50($at)            # 80120C50
    lw      v0, 0x02D0(s0)             # 000002D0
    lui     t4, 0xDB06                 # t4 = DB060000
    ori     t4, t4, 0x0018             # t4 = DB060018
    addiu   t3, v0, 0x0008             # t3 = 00000008
    sw      t3, 0x02D0(s0)             # 000002D0
    sw      a2, 0x0004(v0)             # 00000004
    sw      t4, 0x0000(v0)             # 00000000
    jal     func_8008FC98
    addiu   a1, $sp, 0x0090            # a1 = FFFFFF38
    beq     v0, $zero, lbl_8001BCCC
    or      a2, v0, $zero              # a2 = 00000000
    lw      a3, 0x0160($sp)
    lw      v0, 0x02D0(s0)             # 000002D0
    lui     t7, 0xDA38                 # t7 = DA380000
    ori     t7, t7, 0x0003             # t7 = DA380003
    addiu   t5, v0, 0x0008             # t5 = 00000008
    sw      t5, 0x02D0(s0)             # 000002D0
    sw      a2, 0x0004(v0)             # 00000004
    sw      t7, 0x0000(v0)             # 00000000
    lw      v0, 0x02D0(s0)             # 000002D0
    sll     t9, a3,  4
    srl     t0, t9, 28
    lui     t8, 0xDB06                 # t8 = DB060000
    addiu   t6, v0, 0x0008             # t6 = 00000008
    sw      t6, 0x02D0(s0)             # 000002D0
    ori     t8, t8, 0x0020             # t8 = DB060020
    sll     t1, t0,  2
    lui     t2, 0x8012                 # t2 = 80120000
    addu    t2, t2, t1
    lui     $at, 0x00FF                # $at = 00FF0000
    sw      t8, 0x0000(v0)             # 00000000
    lw      t2, 0x0C38(t2)             # 80120C38
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    and     t3, a3, $at
    lui     $at, 0x8000                # $at = 80000000
    addu    t4, t2, t3
    addu    t5, t4, $at
    sw      t5, 0x0004(v0)             # 00000004
    jal     func_8007E978
    or      a0, s0, $zero              # a0 = 00000000
    lw      v0, 0x02D0(s0)             # 000002D0
    lui     t6, 0xFA00                 # t6 = FA000000
    addiu   t7, v0, 0x0008             # t7 = 00000008
    sw      t7, 0x02D0(s0)             # 000002D0
    sw      t6, 0x0000(v0)             # 00000000
    lh      t8, 0x004C(s1)             # 0000004C
    lh      t4, 0x0048(s1)             # 00000048
    lh      t1, 0x0046(s1)             # 00000046
    andi    t9, t8, 0x00FF             # t9 = 00000000
    lh      t8, 0x004A(s1)             # 0000004A
    andi    t5, t4, 0x00FF             # t5 = 00000000
    sll     t2, t1, 24
    or      t3, t9, t2                 # t3 = 00000000
    sll     t7, t5, 16
    andi    t0, t8, 0x00FF             # t0 = 00000000
    sll     t1, t0,  8
    or      t6, t3, t7                 # t6 = 00000008
    or      t9, t6, t1                 # t9 = 00000008
    sw      t9, 0x0004(v0)             # 00000004
    lw      v0, 0x02D0(s0)             # 000002D0
    lui     t4, 0xFB00                 # t4 = FB000000
    addiu   t2, v0, 0x0008             # t2 = 00000008
    sw      t2, 0x02D0(s0)             # 000002D0
    sw      t4, 0x0000(v0)             # 00000000
    lh      t5, 0x0054(s1)             # 00000054
    lh      t1, 0x0050(s1)             # 00000050
    lh      t8, 0x004E(s1)             # 0000004E
    andi    t3, t5, 0x00FF             # t3 = 00000000
    lh      t5, 0x0052(s1)             # 00000052
    andi    t9, t1, 0x00FF             # t9 = 00000000
    sll     t0, t8, 24
    or      t6, t3, t0                 # t6 = 00000000
    sll     t2, t9, 16
    andi    t7, t5, 0x00FF             # t7 = 00000000
    sll     t8, t7,  8
    or      t4, t6, t2                 # t4 = 00000008
    or      t3, t4, t8                 # t3 = 00000008
    sw      t3, 0x0004(v0)             # 00000004
    lw      v0, 0x02D0(s0)             # 000002D0
    lui     t1, 0xDE00                 # t1 = DE000000
    addiu   t0, v0, 0x0008             # t0 = 00000008
    sw      t0, 0x02D0(s0)             # 000002D0
    sw      t1, 0x0000(v0)             # 00000000
    lw      t9, 0x0038(s1)             # 00000038
    sw      t9, 0x0004(v0)             # 00000004
lbl_8001BCCC:
    lw      $ra, 0x001C($sp)
    lw      s0, 0x0014($sp)
    lw      s1, 0x0018($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0158           # $sp += 0x158


func_8001BCE0:
# MqDbg: EffectSsDust_Spawn
# Spawn Particle 0x00
# A0 = Global Context
# A1 = ?
# A2 = Coords Ptr 1
# A3 = Coords Ptr 2
# SP+0x10 = Coords Ptr 3
# SP+0x14 = Color 1 ptr
# SP+0x18 = Color 2 ptr
# SP+0x1C = s16 ? (possibly timer)
# SP+0x20 = s16 ?
# SP+0x24 = s16 ?
# SP+0x28 = u8 ?
    addiu   $sp, $sp, 0xFFB0           # $sp -= 0x50
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0050($sp)
    sw      a1, 0x0054($sp)
    sw      a3, 0x005C($sp)
    addiu   a0, $sp, 0x0018            # a0 = FFFFFFC8
    jal     func_80063CAC              # Vec3f_Copy
    or      a1, a2, $zero              # a1 = 00000000
    addiu   a0, $sp, 0x0024            # a0 = FFFFFFD4
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x005C($sp)
    addiu   a0, $sp, 0x0030            # a0 = FFFFFFE0
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0060($sp)
    lw      t7, 0x0064($sp)
    addiu   t6, $sp, 0x003C            # t6 = FFFFFFEC
    addiu   t0, $sp, 0x0040            # t0 = FFFFFFF0
    lwl     t9, 0x0000(t7)             # 00000000
    lwr     t9, 0x0003(t7)             # 00000003
    or      a1, $zero, $zero           # a1 = 00000000
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    swl     t9, 0x0000(t6)             # FFFFFFEC
    swr     t9, 0x0003(t6)             # FFFFFFEF
    lw      t1, 0x0068($sp)
    addiu   a3, $sp, 0x0018            # a3 = FFFFFFC8
    lwl     t3, 0x0000(t1)             # 00000000
    lwr     t3, 0x0003(t1)             # 00000003
    swl     t3, 0x0000(t0)             # FFFFFFF0
    swr     t3, 0x0003(t0)             # FFFFFFF3
    lhu     t4, 0x0056($sp)
    lh      t5, 0x006E($sp)
    lh      t6, 0x0072($sp)
    lh      t7, 0x0076($sp)
    lbu     t8, 0x007B($sp)
    lw      a0, 0x0050($sp)
    sh      t4, 0x004A($sp)
    sh      t5, 0x0044($sp)
    sh      t6, 0x0046($sp)
    sh      t7, 0x0048($sp)
    jal     func_8001B468
    sb      t8, 0x004C($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0050           # $sp += 0x50
    jr      $ra
    nop


func_8001BD94:
# MqDbg: func_8002829C
# Spawn Particle 0x00 Type 0 (Wrapper for 8001BCE0)
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      a2, 0x0040($sp)
    sw      a3, 0x0044($sp)
    lw      a3, 0x0040($sp)
    or      a2, a1, $zero              # a2 = 00000000
    sw      $ra, 0x0034($sp)
    sw      a1, 0x003C($sp)
    lw      t6, 0x0044($sp)
    lw      t7, 0x0048($sp)
    lw      t8, 0x004C($sp)
    lh      t9, 0x0052($sp)
    lh      t0, 0x0056($sp)
    addiu   t1, $zero, 0x000A          # t1 = 0000000A
    sw      t1, 0x0024($sp)
    or      a1, $zero, $zero           # a1 = 00000000
    sw      $zero, 0x0028($sp)
    sw      t6, 0x0010($sp)
    sw      t7, 0x0014($sp)
    sw      t8, 0x0018($sp)
    sw      t9, 0x001C($sp)
    jal     func_8001BCE0
    sw      t0, 0x0020($sp)
    lw      $ra, 0x0034($sp)
    addiu   $sp, $sp, 0x0038           # $sp += 0x38
    jr      $ra
    nop


func_8001BDFC:
# MqDbg: func_80028304
# Spawn Particle 0x00 Type 1 (Wrapper for 8001BCE0)
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      a2, 0x0040($sp)
    sw      a3, 0x0044($sp)
    lw      a3, 0x0040($sp)
    or      a2, a1, $zero              # a2 = 00000000
    sw      $ra, 0x0034($sp)
    sw      a1, 0x003C($sp)
    lw      t6, 0x0044($sp)
    lw      t7, 0x0048($sp)
    lw      t8, 0x004C($sp)
    lh      t9, 0x0052($sp)
    lh      t0, 0x0056($sp)
    addiu   t1, $zero, 0x000A          # t1 = 0000000A
    sw      t1, 0x0024($sp)
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    sw      $zero, 0x0028($sp)
    sw      t6, 0x0010($sp)
    sw      t7, 0x0014($sp)
    sw      t8, 0x0018($sp)
    sw      t9, 0x001C($sp)
    jal     func_8001BCE0
    sw      t0, 0x0020($sp)
    lw      $ra, 0x0034($sp)
    addiu   $sp, $sp, 0x0038           # $sp += 0x38
    jr      $ra
    nop


func_8001BE64:
# MqDbg: func_8002836C
# Spawn Particle 0x00 Type 0 (Wrapper for 8001BCE0)
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      a2, 0x0040($sp)
    sw      a3, 0x0044($sp)
    lw      a3, 0x0040($sp)
    or      a2, a1, $zero              # a2 = 00000000
    sw      $ra, 0x0034($sp)
    sw      a1, 0x003C($sp)
    lw      t6, 0x0044($sp)
    lw      t7, 0x0048($sp)
    lw      t8, 0x004C($sp)
    lh      t9, 0x0052($sp)
    lh      t0, 0x0056($sp)
    lh      t1, 0x005A($sp)
    or      a1, $zero, $zero           # a1 = 00000000
    sw      $zero, 0x0028($sp)
    sw      t6, 0x0010($sp)
    sw      t7, 0x0014($sp)
    sw      t8, 0x0018($sp)
    sw      t9, 0x001C($sp)
    sw      t0, 0x0020($sp)
    jal     func_8001BCE0
    sw      t1, 0x0024($sp)
    lw      $ra, 0x0034($sp)
    addiu   $sp, $sp, 0x0038           # $sp += 0x38
    jr      $ra
    nop


func_8001BECC:
# MqDbg: func_800283D4
# Spawn Particle 0x00 Type 1 (Wrapper for 8001BCE0)
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      a2, 0x0040($sp)
    sw      a3, 0x0044($sp)
    lw      a3, 0x0040($sp)
    or      a2, a1, $zero              # a2 = 00000000
    sw      $ra, 0x0034($sp)
    sw      a1, 0x003C($sp)
    lw      t6, 0x0044($sp)
    lw      t7, 0x0048($sp)
    lw      t8, 0x004C($sp)
    lh      t9, 0x0052($sp)
    lh      t0, 0x0056($sp)
    lh      t1, 0x005A($sp)
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    sw      $zero, 0x0028($sp)
    sw      t6, 0x0010($sp)
    sw      t7, 0x0014($sp)
    sw      t8, 0x0018($sp)
    sw      t9, 0x001C($sp)
    sw      t0, 0x0020($sp)
    jal     func_8001BCE0
    sw      t1, 0x0024($sp)
    lw      $ra, 0x0034($sp)
    addiu   $sp, $sp, 0x0038           # $sp += 0x38
    jr      $ra
    nop


func_8001BF34:
# MqDbg: func_8002843C
# Spawn Particle 0x00 Type 2 (Wrapper for 8001BCE0)
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      a2, 0x0040($sp)
    sw      a3, 0x0044($sp)
    lw      a3, 0x0040($sp)
    or      a2, a1, $zero              # a2 = 00000000
    sw      $ra, 0x0034($sp)
    sw      a1, 0x003C($sp)
    lw      t6, 0x0044($sp)
    lw      t7, 0x0048($sp)
    lw      t8, 0x004C($sp)
    lh      t9, 0x0052($sp)
    lh      t0, 0x0056($sp)
    lh      t1, 0x005A($sp)
    addiu   a1, $zero, 0x0002          # a1 = 00000002
    sw      $zero, 0x0028($sp)
    sw      t6, 0x0010($sp)
    sw      t7, 0x0014($sp)
    sw      t8, 0x0018($sp)
    sw      t9, 0x001C($sp)
    sw      t0, 0x0020($sp)
    jal     func_8001BCE0
    sw      t1, 0x0024($sp)
    lw      $ra, 0x0034($sp)
    addiu   $sp, $sp, 0x0038           # $sp += 0x38
    jr      $ra
    nop


func_8001BF9C:
# MqDbg: func_800284A4
# Spawn Particle 0x00 Type 0 (Wrapper for 8001BCE0)
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      a2, 0x0040($sp)
    sw      a3, 0x0044($sp)
    lw      a3, 0x0040($sp)
    or      a2, a1, $zero              # a2 = 00000000
    sw      $ra, 0x0034($sp)
    sw      a1, 0x003C($sp)
    lw      t6, 0x0044($sp)
    lw      t7, 0x0048($sp)
    lw      t8, 0x004C($sp)
    lh      t9, 0x0052($sp)
    lh      t0, 0x0056($sp)
    addiu   t1, $zero, 0x000A          # t1 = 0000000A
    addiu   t2, $zero, 0x0001          # t2 = 00000001
    sw      t2, 0x0028($sp)
    sw      t1, 0x0024($sp)
    or      a1, $zero, $zero           # a1 = 00000000
    sw      t6, 0x0010($sp)
    sw      t7, 0x0014($sp)
    sw      t8, 0x0018($sp)
    sw      t9, 0x001C($sp)
    jal     func_8001BCE0
    sw      t0, 0x0020($sp)
    lw      $ra, 0x0034($sp)
    addiu   $sp, $sp, 0x0038           # $sp += 0x38
    jr      $ra
    nop


func_8001C008:
# MqDbg: func_80028510
# Spawn Particle 0x00 Type 1 (Wrapper for 8001BCE0)
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      a2, 0x0040($sp)
    sw      a3, 0x0044($sp)
    lw      a3, 0x0040($sp)
    or      a2, a1, $zero              # a2 = 00000000
    sw      $ra, 0x0034($sp)
    sw      a1, 0x003C($sp)
    lw      t6, 0x0044($sp)
    lw      t7, 0x0048($sp)
    lw      t8, 0x004C($sp)
    lh      t9, 0x0052($sp)
    lh      t0, 0x0056($sp)
    addiu   t1, $zero, 0x000A          # t1 = 0000000A
    addiu   t2, $zero, 0x0001          # t2 = 00000001
    sw      t2, 0x0028($sp)
    sw      t1, 0x0024($sp)
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    sw      t6, 0x0010($sp)
    sw      t7, 0x0014($sp)
    sw      t8, 0x0018($sp)
    sw      t9, 0x001C($sp)
    jal     func_8001BCE0
    sw      t0, 0x0020($sp)
    lw      $ra, 0x0034($sp)
    addiu   $sp, $sp, 0x0038           # $sp += 0x38
    jr      $ra
    nop


func_8001C074:
# MqDbg: func_8002857C
# Spawn Particle 0x00 Type 4 (Wrapper for 8001BCE0)
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      a2, 0x0040($sp)
    sw      a3, 0x0044($sp)
    lw      a3, 0x0040($sp)
    or      a2, a1, $zero              # a2 = 00000000
    sw      $ra, 0x0034($sp)
    sw      a1, 0x003C($sp)
    lw      t6, 0x0044($sp)
    lui     t7, 0x800E                 # t7 = 800E0000
    lui     t8, 0x800E                 # t8 = 800E0000
    addiu   t8, t8, 0x7B60             # t8 = 800E7B60
    addiu   t7, t7, 0x7B5C             # t7 = 800E7B5C
    addiu   t9, $zero, 0x0064          # t9 = 00000064
    addiu   t0, $zero, 0x0005          # t0 = 00000005
    addiu   t1, $zero, 0x000A          # t1 = 0000000A
    sw      t1, 0x0024($sp)
    sw      t0, 0x0020($sp)
    sw      t9, 0x001C($sp)
    sw      t7, 0x0014($sp)
    sw      t8, 0x0018($sp)
    addiu   a1, $zero, 0x0004          # a1 = 00000004
    sw      $zero, 0x0028($sp)
    jal     func_8001BCE0
    sw      t6, 0x0010($sp)
    lw      $ra, 0x0034($sp)
    addiu   $sp, $sp, 0x0038           # $sp += 0x38
    jr      $ra
    nop


func_8001C0E4:
# MqDbg: func_800285EC
# Spawn Particle 0x00 Type 5 (Wrapper for 8001BCE0)
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      a2, 0x0040($sp)
    sw      a3, 0x0044($sp)
    lw      a3, 0x0040($sp)
    or      a2, a1, $zero              # a2 = 00000000
    sw      $ra, 0x0034($sp)
    sw      a1, 0x003C($sp)
    lw      t6, 0x0044($sp)
    lui     t7, 0x800E                 # t7 = 800E0000
    lui     t8, 0x800E                 # t8 = 800E0000
    addiu   t8, t8, 0x7B60             # t8 = 800E7B60
    addiu   t7, t7, 0x7B5C             # t7 = 800E7B5C
    addiu   t9, $zero, 0x0064          # t9 = 00000064
    addiu   t0, $zero, 0x0005          # t0 = 00000005
    addiu   t1, $zero, 0x000A          # t1 = 0000000A
    sw      t1, 0x0024($sp)
    sw      t0, 0x0020($sp)
    sw      t9, 0x001C($sp)
    sw      t7, 0x0014($sp)
    sw      t8, 0x0018($sp)
    addiu   a1, $zero, 0x0005          # a1 = 00000005
    sw      $zero, 0x0028($sp)
    jal     func_8001BCE0
    sw      t6, 0x0010($sp)
    lw      $ra, 0x0034($sp)
    addiu   $sp, $sp, 0x0038           # $sp += 0x38
    jr      $ra
    nop


func_8001C154:
# MqDbg: func_8002865C
# Spawn Particle 0x00 Type 4 (Wrapper for 8001BCE0)
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      a2, 0x0040($sp)
    sw      a3, 0x0044($sp)
    lw      a3, 0x0040($sp)
    or      a2, a1, $zero              # a2 = 00000000
    sw      $ra, 0x0034($sp)
    sw      a1, 0x003C($sp)
    lw      t6, 0x0044($sp)
    lh      t9, 0x004A($sp)
    lh      t0, 0x004E($sp)
    lui     t7, 0x800E                 # t7 = 800E0000
    lui     t8, 0x800E                 # t8 = 800E0000
    addiu   t8, t8, 0x7B60             # t8 = 800E7B60
    addiu   t7, t7, 0x7B5C             # t7 = 800E7B5C
    addiu   t1, $zero, 0x000A          # t1 = 0000000A
    sw      t1, 0x0024($sp)
    sw      t7, 0x0014($sp)
    sw      t8, 0x0018($sp)
    addiu   a1, $zero, 0x0004          # a1 = 00000004
    sw      $zero, 0x0028($sp)
    sw      t6, 0x0010($sp)
    sw      t9, 0x001C($sp)
    jal     func_8001BCE0
    sw      t0, 0x0020($sp)
    lw      $ra, 0x0034($sp)
    addiu   $sp, $sp, 0x0038           # $sp += 0x38
    jr      $ra
    nop


func_8001C1C4:
# MqDbg: func_800286CC
# Spawn Particle 0x00 Type 5 (Wrapper for 8001BCE0)
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      a2, 0x0040($sp)
    sw      a3, 0x0044($sp)
    lw      a3, 0x0040($sp)
    or      a2, a1, $zero              # a2 = 00000000
    sw      $ra, 0x0034($sp)
    sw      a1, 0x003C($sp)
    lw      t6, 0x0044($sp)
    lh      t9, 0x004A($sp)
    lh      t0, 0x004E($sp)
    lui     t7, 0x800E                 # t7 = 800E0000
    lui     t8, 0x800E                 # t8 = 800E0000
    addiu   t8, t8, 0x7B60             # t8 = 800E7B60
    addiu   t7, t7, 0x7B5C             # t7 = 800E7B5C
    addiu   t1, $zero, 0x000A          # t1 = 0000000A
    sw      t1, 0x0024($sp)
    sw      t7, 0x0014($sp)
    sw      t8, 0x0018($sp)
    addiu   a1, $zero, 0x0005          # a1 = 00000005
    sw      $zero, 0x0028($sp)
    sw      t6, 0x0010($sp)
    sw      t9, 0x001C($sp)
    jal     func_8001BCE0
    sw      t0, 0x0020($sp)
    lw      $ra, 0x0034($sp)
    addiu   $sp, $sp, 0x0038           # $sp += 0x38
    jr      $ra
    nop


func_8001C234:
# MqDbg: func_8002873C
# Spawn Particle 0x00 Type 4 (Wrapper for 8001BCE0)
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      a2, 0x0040($sp)
    sw      a3, 0x0044($sp)
    lw      a3, 0x0040($sp)
    or      a2, a1, $zero              # a2 = 00000000
    sw      $ra, 0x0034($sp)
    sw      a1, 0x003C($sp)
    lw      t6, 0x0044($sp)
    lh      t9, 0x004A($sp)
    lh      t0, 0x004E($sp)
    lh      t1, 0x0052($sp)
    lui     t7, 0x800E                 # t7 = 800E0000
    lui     t8, 0x800E                 # t8 = 800E0000
    addiu   t8, t8, 0x7B60             # t8 = 800E7B60
    addiu   t7, t7, 0x7B5C             # t7 = 800E7B5C
    sw      t7, 0x0014($sp)
    sw      t8, 0x0018($sp)
    addiu   a1, $zero, 0x0004          # a1 = 00000004
    sw      $zero, 0x0028($sp)
    sw      t6, 0x0010($sp)
    sw      t9, 0x001C($sp)
    sw      t0, 0x0020($sp)
    jal     func_8001BCE0
    sw      t1, 0x0024($sp)
    lw      $ra, 0x0034($sp)
    addiu   $sp, $sp, 0x0038           # $sp += 0x38
    jr      $ra
    nop


func_8001C2A4:
# MqDbg: func_800287AC
# Spawn Particle 0x00 Type 5 (Wrapper for 8001BCE0)
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      a2, 0x0040($sp)
    sw      a3, 0x0044($sp)
    lw      a3, 0x0040($sp)
    or      a2, a1, $zero              # a2 = 00000000
    sw      $ra, 0x0034($sp)
    sw      a1, 0x003C($sp)
    lw      t6, 0x0044($sp)
    lh      t9, 0x004A($sp)
    lh      t0, 0x004E($sp)
    lh      t1, 0x0052($sp)
    lui     t7, 0x800E                 # t7 = 800E0000
    lui     t8, 0x800E                 # t8 = 800E0000
    addiu   t8, t8, 0x7B60             # t8 = 800E7B60
    addiu   t7, t7, 0x7B5C             # t7 = 800E7B5C
    sw      t7, 0x0014($sp)
    sw      t8, 0x0018($sp)
    addiu   a1, $zero, 0x0005          # a1 = 00000005
    sw      $zero, 0x0028($sp)
    sw      t6, 0x0010($sp)
    sw      t9, 0x001C($sp)
    sw      t0, 0x0020($sp)
    jal     func_8001BCE0
    sw      t1, 0x0024($sp)
    lw      $ra, 0x0034($sp)
    addiu   $sp, $sp, 0x0038           # $sp += 0x38
    jr      $ra
    nop


func_8001C314:
# MqDbg: func_8002881C
# Spawn Particle 0x00 (Wrapper for 8001BD94)
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x0024($sp)
    lw      t6, 0x0038($sp)
    lw      t7, 0x003C($sp)
    addiu   t8, $zero, 0x0064          # t8 = 00000064
    addiu   t9, $zero, 0x0005          # t9 = 00000005
    sw      t9, 0x001C($sp)
    sw      t8, 0x0018($sp)
    sw      t6, 0x0010($sp)
    jal     func_8001BD94
    sw      t7, 0x0014($sp)
    lw      $ra, 0x0024($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_8001C350:
# MqDbg: func_80028858
# Spawn Particle 0x00 (Wrapper for 8001BDFC)
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x0024($sp)
    lw      t6, 0x0038($sp)
    lw      t7, 0x003C($sp)
    addiu   t8, $zero, 0x0064          # t8 = 00000064
    addiu   t9, $zero, 0x0005          # t9 = 00000005
    sw      t9, 0x001C($sp)
    sw      t8, 0x0018($sp)
    sw      t6, 0x0010($sp)
    jal     func_8001BDFC
    sw      t7, 0x0014($sp)
    lw      $ra, 0x0024($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_8001C38C:
# MqDbg: func_80028894
# Helper for 8001C488, 8001C54C
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      s0, 0x0018($sp)
    or      s0, a2, $zero              # s0 = 00000000
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0028($sp)
    sw      a1, 0x002C($sp)
    sw      a3, 0x0034($sp)
    jal     func_800CDCCC              # Rand.Next() float
    nop
    lwc1    $f4, 0x002C($sp)
    mul.s   $f6, $f0, $f4
    jal     func_800CDCCC              # Rand.Next() float
    swc1    $f6, 0x0020($sp)
    lui     $at, 0x4780                # $at = 47800000
    mtc1    $at, $f8                   # $f8 = 65536.00
    lw      t7, 0x0028($sp)
    mul.s   $f10, $f0, $f8
    trunc.w.s $f16, $f10
    mfc1    v0, $f16
    nop
    sh      v0, 0x0026($sp)
    lw      t9, 0x0000(t7)             # 00000000
    sll     a0, v0, 16
    sra     a0, a0, 16
    sw      t9, 0x0000(s0)             # 00000000
    lw      t8, 0x0004(t7)             # 00000004
    sw      t8, 0x0004(s0)             # 00000004
    lw      t9, 0x0008(t7)             # 00000008
    jal     func_800636C4              # sins?
    sw      t9, 0x0008(s0)             # 00000008
    lwc1    $f4, 0x0020($sp)
    lwc1    $f18, 0x0000(s0)           # 00000000
    mul.s   $f6, $f0, $f4
    add.s   $f8, $f18, $f6
    swc1    $f8, 0x0000(s0)            # 00000000
    jal     func_80063684              # coss?
    lh      a0, 0x0026($sp)
    lwc1    $f16, 0x0020($sp)
    lwc1    $f10, 0x0008(s0)           # 00000008
    lui     $at, 0x3F80                # $at = 3F800000
    mul.s   $f4, $f0, $f16
    mtc1    $at, $f6                   # $f6 = 1.00
    add.s   $f18, $f10, $f4
    swc1    $f18, 0x0008(s0)           # 00000008
    lw      t0, 0x0034($sp)
    swc1    $f6, 0x0004(t0)            # 00000004
    jal     func_800636C4              # sins?
    lh      a0, 0x0026($sp)
    lw      t1, 0x0034($sp)
    swc1    $f0, 0x0000(t1)            # 00000000
    jal     func_80063684              # coss?
    lh      a0, 0x0026($sp)
    lw      v0, 0x0038($sp)
    lw      t2, 0x0034($sp)
    mtc1    $zero, $f2                 # $f2 = 0.00
    swc1    $f0, 0x0008(t2)            # 00000008
    swc1    $f2, 0x0000(v0)            # 00000000
    swc1    $f2, 0x0004(v0)            # 00000004
    swc1    $f2, 0x0008(v0)            # 00000008
    lw      $ra, 0x001C($sp)
    lw      s0, 0x0018($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028           # $sp += 0x28


func_8001C488:
# MqDbg: func_80028990
# Spawn 20 Particle 0x00 (Calls 8001C234)
    addiu   $sp, $sp, 0xFF88           # $sp -= 0x78
    sdc1    $f20, 0x0028($sp)
    sw      s5, 0x0044($sp)
    sw      s4, 0x0040($sp)
    mtc1    a1, $f20                   # $f20 = 0.00
    or      s4, a2, $zero              # s4 = 00000000
    or      s5, a0, $zero              # s5 = 00000000
    sw      $ra, 0x004C($sp)
    sw      s6, 0x0048($sp)
    sw      s3, 0x003C($sp)
    sw      s2, 0x0038($sp)
    sw      s1, 0x0034($sp)
    sw      s0, 0x0030($sp)
    or      s0, $zero, $zero           # s0 = 00000000
    addiu   s6, $zero, 0x0014          # s6 = 00000014
    addiu   s3, $sp, 0x0050            # s3 = FFFFFFD8
    addiu   s2, $sp, 0x005C            # s2 = FFFFFFE4
    addiu   s1, $sp, 0x0068            # s1 = FFFFFFF0
    mfc1    a1, $f20
lbl_8001C4D4:
    or      a0, s4, $zero              # a0 = 00000000
    or      a2, s1, $zero              # a2 = FFFFFFF0
    or      a3, s2, $zero              # a3 = FFFFFFE4
    jal     func_8001C38C
    sw      s3, 0x0010($sp)
    addiu   t6, $zero, 0x0064          # t6 = 00000064
    addiu   t7, $zero, 0x001E          # t7 = 0000001E
    addiu   t8, $zero, 0x0007          # t8 = 00000007
    sw      t8, 0x0018($sp)
    sw      t7, 0x0014($sp)
    sw      t6, 0x0010($sp)
    or      a0, s5, $zero              # a0 = 00000000
    or      a1, s1, $zero              # a1 = FFFFFFF0
    or      a2, s2, $zero              # a2 = FFFFFFE4
    jal     func_8001C234
    or      a3, s3, $zero              # a3 = FFFFFFD8
    addiu   s0, s0, 0x0001             # s0 = 00000001
    bnel    s0, s6, lbl_8001C4D4
    mfc1    a1, $f20
    lw      $ra, 0x004C($sp)
    ldc1    $f20, 0x0028($sp)
    lw      s0, 0x0030($sp)
    lw      s1, 0x0034($sp)
    lw      s2, 0x0038($sp)
    lw      s3, 0x003C($sp)
    lw      s4, 0x0040($sp)
    lw      s5, 0x0044($sp)
    lw      s6, 0x0048($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0078           # $sp += 0x78


func_8001C54C:
# MqDbg: func_80028A54
# Spawn 20 Particle 0x00 (Calls 8001C2A4)
    addiu   $sp, $sp, 0xFF88           # $sp -= 0x78
    sdc1    $f20, 0x0028($sp)
    sw      s5, 0x0044($sp)
    sw      s4, 0x0040($sp)
    mtc1    a1, $f20                   # $f20 = 0.00
    or      s4, a2, $zero              # s4 = 00000000
    or      s5, a0, $zero              # s5 = 00000000
    sw      $ra, 0x004C($sp)
    sw      s6, 0x0048($sp)
    sw      s3, 0x003C($sp)
    sw      s2, 0x0038($sp)
    sw      s1, 0x0034($sp)
    sw      s0, 0x0030($sp)
    or      s0, $zero, $zero           # s0 = 00000000
    addiu   s6, $zero, 0x0014          # s6 = 00000014
    addiu   s3, $sp, 0x0050            # s3 = FFFFFFD8
    addiu   s2, $sp, 0x005C            # s2 = FFFFFFE4
    addiu   s1, $sp, 0x0068            # s1 = FFFFFFF0
    mfc1    a1, $f20
lbl_8001C598:
    or      a0, s4, $zero              # a0 = 00000000
    or      a2, s1, $zero              # a2 = FFFFFFF0
    or      a3, s2, $zero              # a3 = FFFFFFE4
    jal     func_8001C38C
    sw      s3, 0x0010($sp)
    addiu   t6, $zero, 0x0064          # t6 = 00000064
    addiu   t7, $zero, 0x001E          # t7 = 0000001E
    addiu   t8, $zero, 0x0007          # t8 = 00000007
    sw      t8, 0x0018($sp)
    sw      t7, 0x0014($sp)
    sw      t6, 0x0010($sp)
    or      a0, s5, $zero              # a0 = 00000000
    or      a1, s1, $zero              # a1 = FFFFFFF0
    or      a2, s2, $zero              # a2 = FFFFFFE4
    jal     func_8001C2A4
    or      a3, s3, $zero              # a3 = FFFFFFD8
    addiu   s0, s0, 0x0001             # s0 = 00000001
    bnel    s0, s6, lbl_8001C598
    mfc1    a1, $f20
    lw      $ra, 0x004C($sp)
    ldc1    $f20, 0x0028($sp)
    lw      s0, 0x0030($sp)
    lw      s1, 0x0034($sp)
    lw      s2, 0x0038($sp)
    lw      s3, 0x003C($sp)
    lw      s4, 0x0040($sp)
    lw      s5, 0x0044($sp)
    lw      s6, 0x0048($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0078           # $sp += 0x78


func_8001C610:
# MqDbg: EffectSsKiraKira_SpawnSmallYellow
# Spawn Particle 0x01 (Wrapper for 8001C6A8)
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      $ra, 0x0024($sp)
    addiu   v0, $sp, 0x002C            # v0 = FFFFFFFC
    addiu   v1, $sp, 0x0028            # v1 = FFFFFFF8
    lui     t6, 0x800E                 # t6 = 800E0000
    addiu   t6, t6, 0x7B64             # t6 = 800E7B64
    lw      t8, 0x0000(t6)             # 800E7B64
    lui     t9, 0x800E                 # t9 = 800E0000
    addiu   t9, t9, 0x7B68             # t9 = 800E7B68
    sw      t8, 0x0000(v0)             # FFFFFFFC
    lw      t1, 0x0000(t9)             # 800E7B68
    addiu   t2, $zero, 0x03E8          # t2 = 000003E8
    addiu   t3, $zero, 0x0010          # t3 = 00000010
    sw      t1, 0x0000(v1)             # FFFFFFF8
    sw      t3, 0x001C($sp)
    sw      t2, 0x0018($sp)
    sw      v1, 0x0014($sp)
    jal     func_8001C6A8
    sw      v0, 0x0010($sp)
    lw      $ra, 0x0024($sp)
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop


func_8001C66C:
# MqDbg: EffectSsKiraKira_SpawnSmall
# Spawn Particle 0x01 (Wrapper for 8001C6A8)
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x0024($sp)
    lw      t6, 0x0038($sp)
    lw      t7, 0x003C($sp)
    addiu   t8, $zero, 0x03E8          # t8 = 000003E8
    addiu   t9, $zero, 0x0010          # t9 = 00000010
    sw      t9, 0x001C($sp)
    sw      t8, 0x0018($sp)
    sw      t6, 0x0010($sp)
    jal     func_8001C6A8
    sw      t7, 0x0014($sp)
    lw      $ra, 0x0024($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_8001C6A8:
# MqDbg: EffectSsKiraKira_SpawnDispersed
# Spawn Particle 0x01 (Fairy Sparkle)
    addiu   $sp, $sp, 0xFFA8           # $sp -= 0x58
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0058($sp)
    sw      a2, 0x0060($sp)
    sw      a3, 0x0064($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x001C            # a0 = FFFFFFC4
    addiu   a0, $sp, 0x0028            # a0 = FFFFFFD0
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0060($sp)
    jal     func_800CDCCC              # Rand.Next() float
    nop
    lwc1    $f2, 0x002C($sp)
    lui     $at, 0x3F00                # $at = 3F000000
    mtc1    $at, $f8                   # $f8 = 0.50
    mul.s   $f4, $f0, $f2
    addiu   a0, $sp, 0x0034            # a0 = FFFFFFDC
    lw      a1, 0x0064($sp)
    add.s   $f6, $f4, $f2
    mul.s   $f2, $f6, $f8
    jal     func_80063CAC              # Vec3f_Copy
    swc1    $f2, 0x002C($sp)
    jal     func_800CDCCC              # Rand.Next() float
    nop
    lwc1    $f2, 0x0038($sp)
    lui     $at, 0x3F00                # $at = 3F000000
    mtc1    $at, $f18                  # $f18 = 0.50
    mul.s   $f10, $f0, $f2
    lw      t6, 0x0074($sp)
    addiu   t7, $zero, 0x1518          # t7 = 00001518
    sb      $zero, 0x0054($sp)
    sh      t7, 0x0050($sp)
    sw      t6, 0x004C($sp)
    add.s   $f16, $f10, $f2
    mul.s   $f2, $f16, $f18
    jal     func_800CDCCC              # Rand.Next() float
    swc1    $f2, 0x0038($sp)
    lui     $at, 0x4680                # $at = 46800000
    mtc1    $at, $f4                   # $f4 = 16384.00
    lh      t0, 0x0072($sp)
    lw      t2, 0x0068($sp)
    mul.s   $f6, $f0, $f4
    sh      t0, 0x004A($sp)
    addiu   t1, $sp, 0x0040            # t1 = FFFFFFE8
    addiu   t5, $sp, 0x0044            # t5 = FFFFFFEC
    lui     $at, 0x437F                # $at = 437F0000
    mtc1    $at, $f10                  # $f10 = 255.00
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    trunc.w.s $f8, $f6
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    addiu   a3, $sp, 0x001C            # a3 = FFFFFFC4
    mfc1    t9, $f8
    nop
    sh      t9, 0x0052($sp)
    lwl     t4, 0x0000(t2)             # 00000000
    lwr     t4, 0x0003(t2)             # 00000003
    swl     t4, 0x0000(t1)             # FFFFFFE8
    swr     t4, 0x0003(t1)             # FFFFFFEB
    lw      t6, 0x006C($sp)
    lwl     t8, 0x0000(t6)             # 00000000
    lwr     t8, 0x0003(t6)             # 00000003
    swl     t8, 0x0000(t5)             # FFFFFFEC
    swr     t8, 0x0003(t5)             # FFFFFFEF
    lw      t9, 0x004C($sp)
    lw      a0, 0x0058($sp)
    mtc1    t9, $f16                   # $f16 = 0.00
    nop
    cvt.s.w $f18, $f16
    div.s   $f2, $f10, $f18
    neg.s   $f2, $f2
    add.s   $f4, $f2, $f2
    trunc.w.s $f6, $f4
    mfc1    t1, $f6
    jal     func_8001B468
    sh      t1, 0x0048($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0058           # $sp += 0x58
    jr      $ra
    nop


func_8001C7E4:
# MqDbg: EffectSsKiraKira_SpawnFocused
# Spawn Particle 0x01 (?, First Visit ToT as Adult)
    addiu   $sp, $sp, 0xFFA8           # $sp -= 0x58
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0058($sp)
    sw      a2, 0x0060($sp)
    sw      a3, 0x0064($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x001C            # a0 = FFFFFFC4
    addiu   a0, $sp, 0x0028            # a0 = FFFFFFD0
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0060($sp)
    addiu   a0, $sp, 0x0034            # a0 = FFFFFFDC
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0064($sp)
    lw      t6, 0x0074($sp)
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    addiu   t8, $zero, 0x1518          # t8 = 00001518
    sb      t7, 0x0054($sp)
    sh      t8, 0x0050($sp)
    jal     func_800CDCCC              # Rand.Next() float
    sw      t6, 0x004C($sp)
    lui     $at, 0x4680                # $at = 46800000
    mtc1    $at, $f4                   # $f4 = 16384.00
    lh      t1, 0x0072($sp)
    addiu   a0, $sp, 0x0040            # a0 = FFFFFFE8
    mul.s   $f6, $f0, $f4
    lw      a1, 0x0068($sp)
    sh      t1, 0x004A($sp)
    trunc.w.s $f8, $f6
    mfc1    t0, $f8
    jal     func_800646C8
    sh      t0, 0x0052($sp)
    addiu   a0, $sp, 0x0044            # a0 = FFFFFFEC
    jal     func_800646C8
    lw      a1, 0x006C($sp)
    lw      t2, 0x004C($sp)
    lui     $at, 0x437F                # $at = 437F0000
    mtc1    $at, $f10                  # $f10 = 255.00
    mtc1    t2, $f16                   # $f16 = 0.00
    lw      a0, 0x0058($sp)
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    cvt.s.w $f18, $f16
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    addiu   a3, $sp, 0x001C            # a3 = FFFFFFC4
    div.s   $f0, $f10, $f18
    neg.s   $f0, $f0
    add.s   $f4, $f0, $f0
    trunc.w.s $f6, $f4
    mfc1    t4, $f6
    jal     func_8001B468
    sh      t4, 0x0048($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0058           # $sp += 0x58
    jr      $ra
    nop


func_8001C8BC:
# MqDbg: EffectSsBomb_Spawn
# Spawn Particle 0x02
    addiu   $sp, $sp, 0xFFC0           # $sp -= 0x40
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0040($sp)
    sw      a2, 0x0048($sp)
    sw      a3, 0x004C($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x001C            # a0 = FFFFFFDC
    addiu   a0, $sp, 0x0028            # a0 = FFFFFFE8
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0048($sp)
    addiu   a0, $sp, 0x0034            # a0 = FFFFFFF4
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x004C($sp)
    lw      a0, 0x0040($sp)
    addiu   a1, $zero, 0x0002          # a1 = 00000002
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    jal     func_8001B468
    addiu   a3, $sp, 0x001C            # a3 = FFFFFFDC
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0040           # $sp += 0x40
    jr      $ra
    nop


func_8001C914:
# MqDbg: EffectSsBomb2_SpawnFade
# Spawn Particle 0x03
    addiu   $sp, $sp, 0xFFB8           # $sp -= 0x48
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0048($sp)
    sw      a2, 0x0050($sp)
    sw      a3, 0x0054($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x001C            # a0 = FFFFFFD4
    addiu   a0, $sp, 0x0028            # a0 = FFFFFFE0
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0050($sp)
    addiu   a0, $sp, 0x0034            # a0 = FFFFFFEC
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0054($sp)
    addiu   t6, $zero, 0x0064          # t6 = 00000064
    sh      t6, 0x0040($sp)
    sh      $zero, 0x0042($sp)
    sb      $zero, 0x0044($sp)
    lw      a0, 0x0048($sp)
    addiu   a1, $zero, 0x0003          # a1 = 00000003
    addiu   a2, $zero, 0x000A          # a2 = 0000000A
    jal     func_8001B468
    addiu   a3, $sp, 0x001C            # a3 = FFFFFFD4
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0048           # $sp += 0x48
    jr      $ra
    nop


func_8001C97C:
# MqDbg: EffectSsBomb2_SpawnLayered
# Spawn Particle 0x03
    addiu   $sp, $sp, 0xFFB8           # $sp -= 0x48
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0048($sp)
    sw      a2, 0x0050($sp)
    sw      a3, 0x0054($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x001C            # a0 = FFFFFFD4
    addiu   a0, $sp, 0x0028            # a0 = FFFFFFE0
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0050($sp)
    addiu   a0, $sp, 0x0034            # a0 = FFFFFFEC
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0054($sp)
    lh      t6, 0x005A($sp)
    lh      t7, 0x005E($sp)
    addiu   t8, $zero, 0x0001          # t8 = 00000001
    sb      t8, 0x0044($sp)
    lw      a0, 0x0048($sp)
    addiu   a1, $zero, 0x0003          # a1 = 00000003
    addiu   a2, $zero, 0x000A          # a2 = 0000000A
    addiu   a3, $sp, 0x001C            # a3 = FFFFFFD4
    sh      t6, 0x0040($sp)
    jal     func_8001B468
    sh      t7, 0x0042($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0048           # $sp += 0x48
    jr      $ra
    nop


func_8001C9EC:
# MqDbg: EffectSsBlast_Spawn
# Spawn Particle 0x04
    addiu   $sp, $sp, 0xFFB0           # $sp -= 0x50
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0050($sp)
    sw      a2, 0x0058($sp)
    sw      a3, 0x005C($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x001C            # a0 = FFFFFFCC
    addiu   a0, $sp, 0x0028            # a0 = FFFFFFD8
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0058($sp)
    addiu   a0, $sp, 0x0034            # a0 = FFFFFFE4
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x005C($sp)
    addiu   a0, $sp, 0x0040            # a0 = FFFFFFF0
    jal     func_800646C8
    lw      a1, 0x0060($sp)
    addiu   a0, $sp, 0x0044            # a0 = FFFFFFF4
    jal     func_800646C8
    lw      a1, 0x0064($sp)
    lh      t6, 0x006A($sp)
    lh      t7, 0x006E($sp)
    lh      t8, 0x0072($sp)
    lh      t9, 0x0076($sp)
    lw      a0, 0x0050($sp)
    addiu   a1, $zero, 0x0004          # a1 = 00000004
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    addiu   a3, $sp, 0x001C            # a3 = FFFFFFCC
    sh      t6, 0x0048($sp)
    sh      t7, 0x004A($sp)
    sh      t8, 0x004C($sp)
    jal     func_8001B468
    sh      t9, 0x004E($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0050           # $sp += 0x50
    jr      $ra
    nop


func_8001CA7C:
# MqDbg: EffectSsBlast_SpawnWhiteCustomScale
# Spawn Particle 0x04 (Wrapper for 8001C9EC)
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      $ra, 0x002C($sp)
    lh      t8, 0x0042($sp)
    lh      t9, 0x0046($sp)
    lh      t1, 0x004A($sp)
    lui     t6, 0x800E                 # t6 = 800E0000
    lui     t7, 0x800E                 # t7 = 800E0000
    addiu   t7, t7, 0x7B70             # t7 = 800E7B70
    addiu   t6, t6, 0x7B6C             # t6 = 800E7B6C
    addiu   t0, $zero, 0x0023          # t0 = 00000023
    sw      t0, 0x0020($sp)
    sw      t6, 0x0010($sp)
    sw      t7, 0x0014($sp)
    sw      t8, 0x0018($sp)
    sw      t9, 0x001C($sp)
    jal     func_8001C9EC
    sw      t1, 0x0024($sp)
    lw      $ra, 0x002C($sp)
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop


func_8001CAD0:
# MqDbg: EffectSsBlast_SpawnShockwave
# Spawn Particle 0x04 (Wrapper for 8001C9EC)
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      $ra, 0x002C($sp)
    lw      t6, 0x0040($sp)
    lw      t7, 0x0044($sp)
    lh      t1, 0x004A($sp)
    addiu   t8, $zero, 0x0064          # t8 = 00000064
    addiu   t9, $zero, 0x0177          # t9 = 00000177
    addiu   t0, $zero, 0x0023          # t0 = 00000023
    sw      t0, 0x0020($sp)
    sw      t9, 0x001C($sp)
    sw      t8, 0x0018($sp)
    sw      t6, 0x0010($sp)
    sw      t7, 0x0014($sp)
    jal     func_8001C9EC
    sw      t1, 0x0024($sp)
    lw      $ra, 0x002C($sp)
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop


func_8001CB1C:
# MqDbg: EffectSsBlast_SpawnWhiteShockwave
# Spawn Particle 0x04 (Wrapper for 8001CAD0)
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x0024($sp)
    lui     t6, 0x800E                 # t6 = 800E0000
    lui     t7, 0x800E                 # t7 = 800E0000
    addiu   t7, t7, 0x7B78             # t7 = 800E7B78
    addiu   t6, t6, 0x7B74             # t6 = 800E7B74
    addiu   t8, $zero, 0x000A          # t8 = 0000000A
    sw      t8, 0x0018($sp)
    sw      t6, 0x0010($sp)
    jal     func_8001CAD0
    sw      t7, 0x0014($sp)
    lw      $ra, 0x0024($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_8001CB58:
# MqDbg: EffectSsGSpk_SpawnAccel
# Spawn Particle 0x05
    addiu   $sp, $sp, 0xFFB0           # $sp -= 0x50
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0050($sp)
    sw      a1, 0x0054($sp)
    sw      a3, 0x005C($sp)
    addiu   a0, $sp, 0x001C            # a0 = FFFFFFCC
    jal     func_80063CAC              # Vec3f_Copy
    or      a1, a2, $zero              # a1 = 00000000
    addiu   a0, $sp, 0x0028            # a0 = FFFFFFD8
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x005C($sp)
    addiu   a0, $sp, 0x0034            # a0 = FFFFFFE4
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0060($sp)
    addiu   a0, $sp, 0x0040            # a0 = FFFFFFF0
    jal     func_800646C8
    lw      a1, 0x0064($sp)
    addiu   a0, $sp, 0x0044            # a0 = FFFFFFF4
    jal     func_800646C8
    lw      a1, 0x0068($sp)
    lw      t6, 0x0054($sp)
    lh      t7, 0x006E($sp)
    lh      t8, 0x0072($sp)
    sb      $zero, 0x004C($sp)
    lw      a0, 0x0050($sp)
    addiu   a1, $zero, 0x0005          # a1 = 00000005
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    addiu   a3, $sp, 0x0018            # a3 = FFFFFFC8
    sw      t6, 0x0018($sp)
    sh      t7, 0x0048($sp)
    jal     func_8001B468
    sh      t8, 0x004A($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0050           # $sp += 0x50
    jr      $ra
    nop


func_8001CBE8:
# MqDbg: EffectSsGSpk_SpawnNoAccel
# Spawn Particle 0x05
    addiu   $sp, $sp, 0xFFB0           # $sp -= 0x50
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0050($sp)
    sw      a1, 0x0054($sp)
    sw      a3, 0x005C($sp)
    addiu   a0, $sp, 0x001C            # a0 = FFFFFFCC
    jal     func_80063CAC              # Vec3f_Copy
    or      a1, a2, $zero              # a1 = 00000000
    addiu   a0, $sp, 0x0028            # a0 = FFFFFFD8
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x005C($sp)
    addiu   a0, $sp, 0x0034            # a0 = FFFFFFE4
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0060($sp)
    addiu   a0, $sp, 0x0040            # a0 = FFFFFFF0
    jal     func_800646C8
    lw      a1, 0x0064($sp)
    addiu   a0, $sp, 0x0044            # a0 = FFFFFFF4
    jal     func_800646C8
    lw      a1, 0x0068($sp)
    lw      t6, 0x0054($sp)
    lh      t7, 0x006E($sp)
    lh      t8, 0x0072($sp)
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    sb      t9, 0x004C($sp)
    lw      a0, 0x0050($sp)
    addiu   a1, $zero, 0x0005          # a1 = 00000005
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    addiu   a3, $sp, 0x0018            # a3 = FFFFFFC8
    sw      t6, 0x0018($sp)
    sh      t7, 0x0048($sp)
    jal     func_8001B468
    sh      t8, 0x004A($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0050           # $sp += 0x50
    jr      $ra
    nop


func_8001CC7C:
# MqDbg: EffectSsGSpk_SpawnFuse
# Spawn Particle 0x05 (Wrapper for 8001CDD4)
# Bomb Spark
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      $ra, 0x0024($sp)
    addiu   v0, $sp, 0x002C            # v0 = FFFFFFFC
    addiu   v1, $sp, 0x0028            # v1 = FFFFFFF8
    lui     t6, 0x800E                 # t6 = 800E0000
    addiu   t6, t6, 0x7B7C             # t6 = 800E7B7C
    lw      t8, 0x0000(t6)             # 800E7B7C
    lui     t9, 0x800E                 # t9 = 800E0000
    addiu   t9, t9, 0x7B80             # t9 = 800E7B80
    sw      t8, 0x0000(v0)             # FFFFFFFC
    lw      t1, 0x0000(t9)             # 800E7B80
    sw      t1, 0x0000(v1)             # FFFFFFF8
    lw      t2, 0x0040($sp)
    sw      v1, 0x0018($sp)
    sw      v0, 0x0014($sp)
    jal     func_8001CDD4
    sw      t2, 0x0010($sp)
    lw      $ra, 0x0024($sp)
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop


func_8001CCD0:
# MqDbg: EffectSsGSpk_SpawnRandColor
# Spawn Particle 0x05 (Wrapper for 8001CB58)
    addiu   $sp, $sp, 0xFFC0           # $sp -= 0x40
    sw      $ra, 0x002C($sp)
    sw      a0, 0x0040($sp)
    sw      a1, 0x0044($sp)
    sw      a2, 0x0048($sp)
    sw      a3, 0x004C($sp)
    lui     t6, 0x800E                 # t6 = 800E0000
    lui     t7, 0x800E                 # t7 = 800E0000
    lw      t6, 0x7B84(t6)             # 800E7B84
    lw      t7, 0x7B88(t7)             # 800E7B88
    sw      t6, 0x003C($sp)
    jal     func_800CDCCC              # Rand.Next() float
    sw      t7, 0x0038($sp)
    lui     $at, 0x41A0                # $at = 41A00000
    mtc1    $at, $f4                   # $f4 = 20.00
    lui     $at, 0x4120                # $at = 41200000
    mtc1    $at, $f8                   # $f8 = 10.00
    mul.s   $f6, $f0, $f4
    lbu     t9, 0x003C($sp)
    lbu     t1, 0x003D($sp)
    lbu     t3, 0x003E($sp)
    lbu     t5, 0x003F($sp)
    lbu     t7, 0x0038($sp)
    lw      a0, 0x0040($sp)
    sub.s   $f10, $f6, $f8
    lw      a1, 0x0044($sp)
    lw      a2, 0x0048($sp)
    lw      a3, 0x004C($sp)
    trunc.w.s $f16, $f10
    mfc1    v0, $f16
    nop
    addu    t0, t9, v0
    lbu     t9, 0x0039($sp)
    addu    t2, t1, v0
    addu    t4, t3, v0
    lbu     t1, 0x003A($sp)
    lbu     t3, 0x003B($sp)
    sb      t0, 0x003C($sp)
    addu    t6, t5, v0
    addu    t8, t7, v0
    sb      t8, 0x0038($sp)
    addu    t0, t9, v0
    lh      t9, 0x005A($sp)
    lh      t8, 0x0056($sp)
    lw      t5, 0x0050($sp)
    sb      t2, 0x003D($sp)
    sb      t4, 0x003E($sp)
    sb      t6, 0x003F($sp)
    addiu   t6, $sp, 0x003C            # t6 = FFFFFFFC
    addiu   t7, $sp, 0x0038            # t7 = FFFFFFF8
    addu    t2, t1, v0
    addu    t4, t3, v0
    sb      t0, 0x0039($sp)
    sb      t2, 0x003A($sp)
    sb      t4, 0x003B($sp)
    sw      t7, 0x0018($sp)
    sw      t6, 0x0014($sp)
    sw      t9, 0x0020($sp)
    sw      t8, 0x001C($sp)
    jal     func_8001CB58
    sw      t5, 0x0010($sp)
    lw      $ra, 0x002C($sp)
    addiu   $sp, $sp, 0x0040           # $sp += 0x40
    jr      $ra
    nop


func_8001CDD4:
# MqDbg: EffectSsGSpk_SpawnSmall
# Spawn Particle 0x05 (Wrapper for 8001CB58)
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      $ra, 0x002C($sp)
    lw      t6, 0x0040($sp)
    lw      t7, 0x0044($sp)
    lw      t8, 0x0048($sp)
    addiu   t9, $zero, 0x0064          # t9 = 00000064
    addiu   t0, $zero, 0x0005          # t0 = 00000005
    sw      t0, 0x0020($sp)
    sw      t9, 0x001C($sp)
    sw      t6, 0x0010($sp)
    sw      t7, 0x0014($sp)
    jal     func_8001CB58
    sw      t8, 0x0018($sp)
    lw      $ra, 0x002C($sp)
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop


func_8001CE18:
# MqDbg: EffectSsDFire_Spawn
# Spawn Particle 0x06
    addiu   $sp, $sp, 0xFFB8           # $sp -= 0x48
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0048($sp)
    sw      a2, 0x0050($sp)
    sw      a3, 0x0054($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x0018            # a0 = FFFFFFD0
    addiu   a0, $sp, 0x0024            # a0 = FFFFFFDC
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0050($sp)
    addiu   a0, $sp, 0x0030            # a0 = FFFFFFE8
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0054($sp)
    lh      t6, 0x005A($sp)
    lh      t7, 0x005E($sp)
    lh      t8, 0x0062($sp)
    lh      t9, 0x0066($sp)
    lw      t0, 0x0068($sp)
    lw      a0, 0x0048($sp)
    addiu   a1, $zero, 0x0006          # a1 = 00000006
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    addiu   a3, $sp, 0x0018            # a3 = FFFFFFD0
    sh      t6, 0x003C($sp)
    sh      t7, 0x003E($sp)
    sh      t8, 0x0040($sp)
    sh      t9, 0x0042($sp)
    jal     func_8001B468
    sw      t0, 0x0044($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0048           # $sp += 0x48
    jr      $ra
    nop


func_8001CE98:
# MqDbg: EffectSsDFire_SpawnFixedScale
# Spawn Particle 0x06 (Wrapper for 8001CE18)
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      $ra, 0x002C($sp)
    lh      t8, 0x0042($sp)
    lh      t9, 0x0046($sp)
    addiu   t6, $zero, 0x0064          # t6 = 00000064
    addiu   t7, $zero, 0x0023          # t7 = 00000023
    addiu   t0, $zero, 0x0008          # t0 = 00000008
    sw      t0, 0x0020($sp)
    sw      t7, 0x0014($sp)
    sw      t6, 0x0010($sp)
    sw      t8, 0x0018($sp)
    jal     func_8001CE18
    sw      t9, 0x001C($sp)
    lw      $ra, 0x002C($sp)
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop


func_8001CEDC:
# MqDbg: EffectSsBubble_Spawn
# Spawn Particle 0x07
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0038($sp)
    sw      a2, 0x0040($sp)
    sw      a3, 0x0044($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x001C            # a0 = FFFFFFE4
    lwc1    $f4, 0x0040($sp)
    lwc1    $f6, 0x0044($sp)
    lwc1    $f8, 0x0048($sp)
    lwc1    $f10, 0x004C($sp)
    lw      a0, 0x0038($sp)
    addiu   a1, $zero, 0x0007          # a1 = 00000007
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    addiu   a3, $sp, 0x001C            # a3 = FFFFFFE4
    swc1    $f4, 0x0028($sp)
    swc1    $f6, 0x002C($sp)
    swc1    $f8, 0x0030($sp)
    jal     func_8001B468
    swc1    $f10, 0x0034($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0038           # $sp += 0x38
    jr      $ra
    nop


func_8001CF3C:
# MqDbg: EffectSsGRipple_Spawn
# Spawn Particle 0x09
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0030($sp)
    sw      a2, 0x0038($sp)
    sw      a3, 0x003C($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x001C            # a0 = FFFFFFEC
    lh      t6, 0x003A($sp)
    lh      t7, 0x003E($sp)
    lh      t8, 0x0042($sp)
    lw      a0, 0x0030($sp)
    addiu   a1, $zero, 0x0009          # a1 = 00000009
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    addiu   a3, $sp, 0x001C            # a3 = FFFFFFEC
    sh      t6, 0x0028($sp)
    sh      t7, 0x002A($sp)
    jal     func_8001B468
    sh      t8, 0x002C($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop


func_8001CF94:
# MqDbg: EffectSsGSplash_Spawn
# Spawn Particle 0x0A
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0030($sp)
    sw      a2, 0x0038($sp)
    sw      a3, 0x003C($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x0018            # a0 = FFFFFFE8
    lw      v0, 0x0038($sp)
    lh      t6, 0x0042($sp)
    lh      t7, 0x0046($sp)
    addiu   a1, $zero, 0x000A          # a1 = 0000000A
    sb      t6, 0x0024($sp)
    beq     v0, $zero, lbl_8001D004
    sh      t7, 0x0026($sp)
    lwl     t0, 0x0000(v0)             # 00000000
    lwr     t0, 0x0003(v0)             # 00000003
    addiu   t8, $sp, 0x0028            # t8 = FFFFFFF8
    addiu   t1, $sp, 0x002C            # t1 = FFFFFFFC
    swl     t0, 0x0000(t8)             # FFFFFFF8
    swr     t0, 0x0003(t8)             # FFFFFFFB
    lw      t2, 0x003C($sp)
    addiu   t5, $zero, 0x0001          # t5 = 00000001
    lwl     t4, 0x0000(t2)             # 00000000
    lwr     t4, 0x0003(t2)             # 00000003
    swl     t4, 0x0000(t1)             # FFFFFFFC
    swr     t4, 0x0003(t1)             # FFFFFFFF
    b       lbl_8001D008
    sb      t5, 0x0025($sp)
lbl_8001D004:
    sb      $zero, 0x0025($sp)
lbl_8001D008:
    lw      a0, 0x0030($sp)
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    jal     func_8001B468
    addiu   a3, $sp, 0x0018            # a3 = FFFFFFE8
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop


func_8001D028:
# MqDbg: EffectSsGMagma_Spawn
# Spawn Particle 0x0B
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0028($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x001C            # a0 = FFFFFFF4
    lw      a0, 0x0028($sp)
    addiu   a1, $zero, 0x000B          # a1 = 0000000B
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    jal     func_8001B468
    addiu   a3, $sp, 0x001C            # a3 = FFFFFFF4
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_8001D060:
# MqDbg: EffectSsGFire_Spawn
# Spawn Particle 0x0C
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0028($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x001C            # a0 = FFFFFFF4
    lw      a0, 0x0028($sp)
    addiu   a1, $zero, 0x000C          # a1 = 0000000C
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    jal     func_8001B468
    addiu   a3, $sp, 0x001C            # a3 = FFFFFFF4
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_8001D098:
# MqDbg: EffectSsLightning_Spawn
# Spawn Particle 0x0D
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0038($sp)
    sw      a2, 0x0040($sp)
    sw      a3, 0x0044($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x001C            # a0 = FFFFFFE4
    addiu   a0, $sp, 0x0028            # a0 = FFFFFFF0
    jal     func_800646C8
    lw      a1, 0x0040($sp)
    addiu   a0, $sp, 0x002C            # a0 = FFFFFFF4
    jal     func_800646C8
    lw      a1, 0x0044($sp)
    lh      t6, 0x004A($sp)
    lh      t7, 0x004E($sp)
    lh      t8, 0x0052($sp)
    lh      t9, 0x0056($sp)
    lw      a0, 0x0038($sp)
    addiu   a1, $zero, 0x000D          # a1 = 0000000D
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    addiu   a3, $sp, 0x001C            # a3 = FFFFFFE4
    sh      t6, 0x0030($sp)
    sh      t7, 0x0032($sp)
    sh      t8, 0x0034($sp)
    jal     func_8001B468
    sh      t9, 0x0036($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0038           # $sp += 0x38
    jr      $ra
    nop


func_8001D110:
# MqDbg: EffectSsDtBubble_SpawnColorProfile
# Spawn Particle 0x0E
    addiu   $sp, $sp, 0xFFB0           # $sp -= 0x50
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0050($sp)
    sw      a2, 0x0058($sp)
    sw      a3, 0x005C($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x0018            # a0 = FFFFFFC8
    addiu   a0, $sp, 0x0024            # a0 = FFFFFFD4
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0058($sp)
    addiu   a0, $sp, 0x0030            # a0 = FFFFFFE0
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x005C($sp)
    lh      t6, 0x006A($sp)
    lh      t7, 0x0062($sp)
    lh      t8, 0x0066($sp)
    lh      t9, 0x006E($sp)
    sb      $zero, 0x004C($sp)
    lw      a0, 0x0050($sp)
    addiu   a1, $zero, 0x000E          # a1 = 0000000E
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    addiu   a3, $sp, 0x0018            # a3 = FFFFFFC8
    sh      t6, 0x0048($sp)
    sh      t7, 0x0044($sp)
    sh      t8, 0x0046($sp)
    jal     func_8001B468
    sh      t9, 0x004A($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0050           # $sp += 0x50
    jr      $ra
    nop


func_8001D18C:
# MqDbg: EffectSsDtBubble_SpawnCustomColor
# Spawn Particle 0x0E
    addiu   $sp, $sp, 0xFFB0           # $sp -= 0x50
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0050($sp)
    sw      a2, 0x0058($sp)
    sw      a3, 0x005C($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x0018            # a0 = FFFFFFC8
    addiu   a0, $sp, 0x0024            # a0 = FFFFFFD4
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0058($sp)
    addiu   a0, $sp, 0x0030            # a0 = FFFFFFE0
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x005C($sp)
    addiu   a0, $sp, 0x003C            # a0 = FFFFFFEC
    jal     func_800646C8
    lw      a1, 0x0060($sp)
    addiu   a0, $sp, 0x0040            # a0 = FFFFFFF0
    jal     func_800646C8
    lw      a1, 0x0064($sp)
    lh      t6, 0x006A($sp)
    lh      t7, 0x006E($sp)
    lh      t8, 0x0072($sp)
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    sb      t9, 0x004C($sp)
    lw      a0, 0x0050($sp)
    addiu   a1, $zero, 0x000E          # a1 = 0000000E
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    addiu   a3, $sp, 0x0018            # a3 = FFFFFFC8
    sh      t6, 0x0044($sp)
    sh      t7, 0x0046($sp)
    jal     func_8001B468
    sh      t8, 0x004A($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0050           # $sp += 0x50
    jr      $ra
    nop


func_8001D21C:
# MqDbg: EffectSsHahen_Spawn
# Spawn Particle 0x0F
    addiu   $sp, $sp, 0xFFB8           # $sp -= 0x48
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0048($sp)
    sw      a2, 0x0050($sp)
    sw      a3, 0x0054($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x0018            # a0 = FFFFFFD0
    addiu   a0, $sp, 0x0024            # a0 = FFFFFFDC
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0050($sp)
    addiu   a0, $sp, 0x0030            # a0 = FFFFFFE8
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0054($sp)
    lw      t6, 0x0068($sp)
    lh      t7, 0x005A($sp)
    lh      t8, 0x005E($sp)
    lh      t9, 0x0062($sp)
    lh      t0, 0x0066($sp)
    lw      a0, 0x0048($sp)
    addiu   a1, $zero, 0x000F          # a1 = 0000000F
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    addiu   a3, $sp, 0x0018            # a3 = FFFFFFD0
    sw      t6, 0x003C($sp)
    sh      t7, 0x0040($sp)
    sh      t8, 0x0042($sp)
    sh      t9, 0x0044($sp)
    jal     func_8001B468
    sh      t0, 0x0046($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0048           # $sp += 0x48
    jr      $ra
    nop


func_8001D29C:
# MqDbg: EffectSsHahen_SpawnBurst
# Spawn N Particle 0x0F (Wrapper for 8001D21C)
# SP+0x18 = s16 Particles to Spawn
    addiu   $sp, $sp, 0xFF78           # $sp -= 0x88
    sw      s6, 0x0058($sp)
    sdc1    $f22, 0x0038($sp)
    sll     s6, a3, 16
    sw      s5, 0x0054($sp)
    sw      s4, 0x0050($sp)
    sw      s1, 0x0044($sp)
    mtc1    a2, $f22                   # $f22 = 0.00
    mtc1    $zero, $f0                 # $f0 = 0.00
    lh      s1, 0x00A2($sp)
    or      s4, a0, $zero              # s4 = 00000000
    or      s5, a1, $zero              # s5 = 00000000
    sra     s6, s6, 16
    sw      $ra, 0x0064($sp)
    sw      s8, 0x0060($sp)
    sw      s7, 0x005C($sp)
    sw      s3, 0x004C($sp)
    sw      s2, 0x0048($sp)
    sw      s0, 0x0040($sp)
    sdc1    $f20, 0x0030($sp)
    sw      a3, 0x0094($sp)
    lui     $at, 0x8010                # $at = 80100000
    lwc1    $f4, 0x6084($at)           # 80106084
    swc1    $f0, 0x0074($sp)
    swc1    $f0, 0x006C($sp)
    mul.s   $f6, $f4, $f22
    lui     $at, 0x3F00                # $at = 3F000000
    or      s0, $zero, $zero           # s0 = 00000000
    lh      s8, 0x00AA($sp)
    lh      s7, 0x00A6($sp)
    lh      s3, 0x009E($sp)
    blez    s1, lbl_8001D3AC
    swc1    $f6, 0x0070($sp)
    mtc1    $at, $f20                  # $f20 = 0.50
    lh      s2, 0x009A($sp)
lbl_8001D328:
    jal     func_800CDCCC              # Rand.Next() float
    nop
    sub.s   $f8, $f0, $f20
    mul.s   $f10, $f8, $f22
    jal     func_800CDCCC              # Rand.Next() float
    swc1    $f10, 0x0078($sp)
    sub.s   $f16, $f0, $f20
    mul.s   $f18, $f16, $f22
    jal     func_800CDCCC              # Rand.Next() float
    swc1    $f18, 0x0080($sp)
    mul.s   $f4, $f0, $f20
    sll     a0, s2, 16
    sll     a1, s3, 16
    sra     a1, a1, 16
    sra     a0, a0, 16
    add.s   $f6, $f4, $f20
    mul.s   $f8, $f6, $f22
    jal     func_80063BF0
    swc1    $f8, 0x007C($sp)
    lw      t6, 0x00AC($sp)
    or      a0, s4, $zero              # a0 = 00000000
    or      a1, s5, $zero              # a1 = 00000000
    addiu   a2, $sp, 0x0078            # a2 = FFFFFFF0
    addiu   a3, $sp, 0x006C            # a3 = FFFFFFE4
    sw      s6, 0x0010($sp)
    sw      v0, 0x0014($sp)
    sw      s7, 0x0018($sp)
    sw      s8, 0x001C($sp)
    jal     func_8001D21C
    sw      t6, 0x0020($sp)
    addiu   s0, s0, 0x0001             # s0 = 00000001
    bne     s0, s1, lbl_8001D328
    nop
lbl_8001D3AC:
    lw      $ra, 0x0064($sp)
    ldc1    $f20, 0x0030($sp)
    ldc1    $f22, 0x0038($sp)
    lw      s0, 0x0040($sp)
    lw      s1, 0x0044($sp)
    lw      s2, 0x0048($sp)
    lw      s3, 0x004C($sp)
    lw      s4, 0x0050($sp)
    lw      s5, 0x0054($sp)
    lw      s6, 0x0058($sp)
    lw      s7, 0x005C($sp)
    lw      s8, 0x0060($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0088           # $sp += 0x88


func_8001D3E4:
# MqDbg: EffectSsStick_Spawn
# Spawn Particle 0x10
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x0014($sp)
    sw      a1, 0x002C($sp)
    sw      a2, 0x0030($sp)
    addiu   a3, $sp, 0x0018            # a3 = FFFFFFF0
    lw      t6, 0x002C($sp)
    addiu   a1, $zero, 0x0010          # a1 = 00000010
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    lw      t8, 0x0000(t6)             # 00000000
    sw      t8, 0x0000(a3)             # FFFFFFF0
    lw      t7, 0x0004(t6)             # 00000004
    sw      t7, 0x0004(a3)             # FFFFFFF4
    lw      t8, 0x0008(t6)             # 00000008
    sw      t8, 0x0008(a3)             # FFFFFFF8
    lh      t9, 0x0032($sp)
    jal     func_8001B468
    sh      t9, 0x0024($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_8001D438:
# MqDbg: EffectSsSibuki_Spawn
# Spawn Particle 0x11
    addiu   $sp, $sp, 0xFFB8           # $sp -= 0x48
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0048($sp)
    sw      a2, 0x0050($sp)
    sw      a3, 0x0054($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x001C            # a0 = FFFFFFD4
    addiu   a0, $sp, 0x0028            # a0 = FFFFFFE0
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0050($sp)
    addiu   a0, $sp, 0x0034            # a0 = FFFFFFEC
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0054($sp)
    lh      t6, 0x005A($sp)
    lh      t7, 0x005E($sp)
    lh      t8, 0x0062($sp)
    lw      a0, 0x0048($sp)
    addiu   a1, $zero, 0x0011          # a1 = 00000011
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    addiu   a3, $sp, 0x001C            # a3 = FFFFFFD4
    sh      t6, 0x0040($sp)
    sh      t7, 0x0042($sp)
    jal     func_8001B468
    sh      t8, 0x0044($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0048           # $sp += 0x48
    jr      $ra
    nop


func_8001D4A8:
# MqDbg: EffectSsSibuki_SpawnBurst
# Spawn Particle 0x11 (Wrapper for 8001D438)
    addiu   $sp, $sp, 0xFF88           # $sp -= 0x78
    sw      s5, 0x003C($sp)
    sw      s4, 0x0038($sp)
    sw      s2, 0x0030($sp)
    addiu   s2, $sp, 0x0050            # s2 = FFFFFFD8
    or      s4, a0, $zero              # s4 = 00000000
    or      s5, a1, $zero              # s5 = 00000000
    sw      $ra, 0x0044($sp)
    sw      s6, 0x0040($sp)
    sw      s3, 0x0034($sp)
    sw      s1, 0x002C($sp)
    sw      s0, 0x0028($sp)
    lui     t7, 0x800E                 # t7 = 800E0000
    addiu   t7, t7, 0x7B8C             # t7 = 800E7B8C
    lw      t9, 0x0000(t7)             # 800E7B8C
    addiu   t6, $sp, 0x0068            # t6 = FFFFFFF0
    lw      t8, 0x0004(t7)             # 800E7B90
    sw      t9, 0x0000(t6)             # FFFFFFF0
    lw      t9, 0x0008(t7)             # 800E7B94
    lui     t1, 0x800E                 # t1 = 800E0000
    addiu   t1, t1, 0x7B98             # t1 = 800E7B98
    sw      t8, 0x0004(t6)             # FFFFFFF4
    sw      t9, 0x0008(t6)             # FFFFFFF8
    lw      t3, 0x0000(t1)             # 800E7B98
    addiu   t0, $sp, 0x005C            # t0 = FFFFFFE4
    lw      t2, 0x0004(t1)             # 800E7B9C
    sw      t3, 0x0000(t0)             # FFFFFFE4
    lw      t3, 0x0008(t1)             # 800E7BA0
    lui     t4, 0x800E                 # t4 = 800E0000
    addiu   t4, t4, 0x7BA4             # t4 = 800E7BA4
    sw      t2, 0x0004(t0)             # FFFFFFE8
    sw      t3, 0x0008(t0)             # FFFFFFEC
    lw      t6, 0x0000(t4)             # 800E7BA4
    sw      t6, 0x0000(s2)             # FFFFFFD8
    lw      t5, 0x0004(t4)             # 800E7BA8
    sw      t5, 0x0004(s2)             # FFFFFFDC
    lw      t6, 0x0008(t4)             # 800E7BAC
    jal     func_800CDCCC              # Rand.Next() float
    sw      t6, 0x0008(s2)             # FFFFFFE0
    lui     $at, 0x8010                # $at = 80100000
    lwc1    $f4, 0x6088($at)           # 80106088
    lui     s6, 0x8012                 # s6 = 80120000
    addiu   s6, s6, 0xBA00             # s6 = 8011BA00
    mul.s   $f6, $f0, $f4
    lw      s0, 0x0000(s6)             # 8011BA00
    or      s1, $zero, $zero           # s1 = 00000000
    lh      t8, 0x09FA(s0)             # 000009FA
    trunc.w.s $f8, $f6
    addiu   t9, t8, 0x001E             # t9 = 0000001E
    mfc1    s3, $f8
    nop
    sll     s3, s3, 16
    blez    t9, lbl_8001D604
    sra     s3, s3, 16
    lh      t0, 0x0A0A(s0)             # 00000A0A
lbl_8001D584:
    sw      s3, 0x0014($sp)
    or      a0, s4, $zero              # a0 = 00000000
    addiu   t1, t0, 0x0006             # t1 = 00000006
    div     $zero, s1, t1
    mflo    t2
    sw      t2, 0x0010($sp)
    lh      t3, 0x09F8(s0)             # 000009F8
    or      a1, s5, $zero              # a1 = 00000000
    or      a2, s2, $zero              # a2 = FFFFFFD8
    addiu   t4, t3, 0x0028             # t4 = 00000028
    sw      t4, 0x0018($sp)
    or      a3, s2, $zero              # a3 = FFFFFFD8
    bne     t1, $zero, lbl_8001D5C0
    nop
    break   # 0x01C00
lbl_8001D5C0:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     t1, $at, lbl_8001D5D8
    lui     $at, 0x8000                # $at = 80000000
    bne     s1, $at, lbl_8001D5D8
    nop
    break   # 0x01800
lbl_8001D5D8:
    jal     func_8001D438
    nop
    lw      s0, 0x0000(s6)             # 8011BA00
    addiu   s1, s1, 0x0001             # s1 = 00000001
    sll     s1, s1, 16
    lh      t5, 0x09FA(s0)             # 000009FA
    sra     s1, s1, 16
    addiu   t6, t5, 0x001E             # t6 = 0000001E
    slt     $at, s1, t6
    bnel    $at, $zero, lbl_8001D584
    lh      t0, 0x0A0A(s0)             # 00000A0A
lbl_8001D604:
    lw      $ra, 0x0044($sp)
    lw      s0, 0x0028($sp)
    lw      s1, 0x002C($sp)
    lw      s2, 0x0030($sp)
    lw      s3, 0x0034($sp)
    lw      s4, 0x0038($sp)
    lw      s5, 0x003C($sp)
    lw      s6, 0x0040($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0078           # $sp += 0x78


func_8001D62C:
# MqDbg: EffectSsSibuki2_Spawn
# Spawn Particle 0x12
    addiu   $sp, $sp, 0xFFC0           # $sp -= 0x40
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0040($sp)
    sw      a2, 0x0048($sp)
    sw      a3, 0x004C($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x0018            # a0 = FFFFFFD8
    addiu   a0, $sp, 0x0024            # a0 = FFFFFFE4
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0048($sp)
    addiu   a0, $sp, 0x0030            # a0 = FFFFFFF0
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x004C($sp)
    lh      t6, 0x0052($sp)
    lw      a0, 0x0040($sp)
    addiu   a1, $zero, 0x0012          # a1 = 00000012
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    addiu   a3, $sp, 0x0018            # a3 = FFFFFFD8
    jal     func_8001B468
    sh      t6, 0x003C($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0040           # $sp += 0x40
    jr      $ra
    nop


func_8001D68C:
# MqDbg: EffectSsGMagma2_Spawn
# Spawn Particle 0x13
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0038($sp)
    sw      a2, 0x0040($sp)
    sw      a3, 0x0044($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x001C            # a0 = FFFFFFE4
    addiu   a0, $sp, 0x0028            # a0 = FFFFFFF0
    jal     func_800646C8
    lw      a1, 0x0040($sp)
    addiu   a0, $sp, 0x002C            # a0 = FFFFFFF4
    jal     func_800646C8
    lw      a1, 0x0044($sp)
    lh      t6, 0x004A($sp)
    lh      t7, 0x004E($sp)
    lh      t8, 0x0052($sp)
    lw      a0, 0x0038($sp)
    addiu   a1, $zero, 0x0013          # a1 = 00000013
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    addiu   a3, $sp, 0x001C            # a3 = FFFFFFE4
    sh      t6, 0x0030($sp)
    sh      t7, 0x0032($sp)
    jal     func_8001B468
    sh      t8, 0x0034($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0038           # $sp += 0x38
    jr      $ra
    nop


func_8001D6FC:
# MqDbg: EffectSsStone1_Spawn
# Spawn Particle 0x14
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x0014($sp)
    sw      a1, 0x002C($sp)
    sw      a2, 0x0030($sp)
    addiu   a3, $sp, 0x0018            # a3 = FFFFFFF0
    lw      t6, 0x002C($sp)
    addiu   a1, $zero, 0x0014          # a1 = 00000014
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    lw      t8, 0x0000(t6)             # 00000000
    sw      t8, 0x0000(a3)             # FFFFFFF0
    lw      t7, 0x0004(t6)             # 00000004
    sw      t7, 0x0004(a3)             # FFFFFFF4
    lw      t8, 0x0008(t6)             # 00000008
    sw      t8, 0x0008(a3)             # FFFFFFF8
    lw      t9, 0x0030($sp)
    jal     func_8001B468
    sw      t9, 0x0024($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_8001D750:
# MqDbg: EffectSsHitMark_Spawn
# Spawn Particle 0x15
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      a2, 0x0038($sp)
    sll     a2, a2, 16
    sra     a2, a2, 16
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0030($sp)
    sw      a1, 0x0034($sp)
    lw      t6, 0x0034($sp)
    sh      a2, 0x0020($sp)
    addiu   a0, $sp, 0x0024            # a0 = FFFFFFF4
    or      a1, a3, $zero              # a1 = 00000000
    jal     func_80063CAC              # Vec3f_Copy
    sw      t6, 0x001C($sp)
    lw      a0, 0x0030($sp)
    addiu   a1, $zero, 0x0015          # a1 = 00000015
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    jal     func_8001B468
    addiu   a3, $sp, 0x001C            # a3 = FFFFFFEC
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop


func_8001D7A8:
# MqDbg: EffectSsHitMark_SpawnFixedScale
# Spawn Particle 0x15 (Wrapper for 8001D750)
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    or      a3, a2, $zero              # a3 = 00000000
    jal     func_8001D750
    addiu   a2, $zero, 0x012C          # a2 = 0000012C
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_8001D7CC:
# MqDbg: EffectSsHitMark_SpawnCustomScale
# Spawn Particle 0x15 (Wrapper for 8001D750)
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      a2, 0x0020($sp)
    sll     a2, a2, 16
    sra     a2, a2, 16
    sw      $ra, 0x0014($sp)
    jal     func_8001D750
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_8001D7F8:
# MqDbg: EffectSsFhgFlash_SpawnLightBall
# Spawn Particle 0x16
    addiu   $sp, $sp, 0xFFB8           # $sp -= 0x48
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0048($sp)
    sw      a2, 0x0050($sp)
    sw      a3, 0x0054($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x0018            # a0 = FFFFFFD0
    addiu   a0, $sp, 0x0024            # a0 = FFFFFFDC
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0050($sp)
    addiu   a0, $sp, 0x0030            # a0 = FFFFFFE8
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0054($sp)
    lh      t6, 0x005A($sp)
    lbu     t7, 0x005F($sp)
    sb      $zero, 0x0044($sp)
    lw      a0, 0x0048($sp)
    addiu   a1, $zero, 0x0016          # a1 = 00000016
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    addiu   a3, $sp, 0x0018            # a3 = FFFFFFD0
    sh      t6, 0x003C($sp)
    jal     func_8001B468
    sb      t7, 0x003E($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0048           # $sp += 0x48
    jr      $ra
    nop


func_8001D864:
# MqDbg: EffectSsFhgFlash_SpawnShock
# Spawn Particle 0x16
    addiu   $sp, $sp, 0xFFB8           # $sp -= 0x48
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0048($sp)
    sw      a1, 0x004C($sp)
    sw      a3, 0x0054($sp)
    lw      t6, 0x004C($sp)
    addiu   a0, $sp, 0x0018            # a0 = FFFFFFD0
    or      a1, a2, $zero              # a1 = 00000000
    jal     func_80063CAC              # Vec3f_Copy
    sw      t6, 0x0040($sp)
    lh      t7, 0x0056($sp)
    lbu     t8, 0x005B($sp)
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    sb      t9, 0x0044($sp)
    lw      a0, 0x0048($sp)
    addiu   a1, $zero, 0x0016          # a1 = 00000016
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    addiu   a3, $sp, 0x0018            # a3 = FFFFFFD0
    sh      t7, 0x003C($sp)
    jal     func_8001B468
    sb      t8, 0x003E($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0048           # $sp += 0x48
    jr      $ra
    nop


func_8001D8C8:
# MqDbg: EffectSsKFire_Spawn
# Spawn Particle 0x17
    addiu   $sp, $sp, 0xFFC0           # $sp -= 0x40
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0040($sp)
    sw      a2, 0x0048($sp)
    sw      a3, 0x004C($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x0018            # a0 = FFFFFFD8
    addiu   a0, $sp, 0x0024            # a0 = FFFFFFE4
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0048($sp)
    addiu   a0, $sp, 0x0030            # a0 = FFFFFFF0
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x004C($sp)
    lh      t6, 0x0052($sp)
    lbu     t7, 0x0057($sp)
    lw      a0, 0x0040($sp)
    addiu   a1, $zero, 0x0017          # a1 = 00000017
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    addiu   a3, $sp, 0x0018            # a3 = FFFFFFD8
    sh      t6, 0x003C($sp)
    jal     func_8001B468
    sb      t7, 0x003E($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0040           # $sp += 0x40
    jr      $ra
    nop


func_8001D930:
# MqDbg: EffectSsSolderSrchBall_Spawn
# Spawn Particle 0x18
    addiu   $sp, $sp, 0xFFB8           # $sp -= 0x48
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0048($sp)
    sw      a2, 0x0050($sp)
    sw      a3, 0x0054($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x001C            # a0 = FFFFFFD4
    addiu   a0, $sp, 0x0028            # a0 = FFFFFFE0
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0050($sp)
    addiu   a0, $sp, 0x0034            # a0 = FFFFFFEC
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0054($sp)
    lh      t6, 0x005A($sp)
    lw      t7, 0x005C($sp)
    lw      a0, 0x0048($sp)
    addiu   a1, $zero, 0x0018          # a1 = 00000018
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    addiu   a3, $sp, 0x001C            # a3 = FFFFFFD4
    sh      t6, 0x0040($sp)
    jal     func_8001B468
    sw      t7, 0x0044($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0048           # $sp += 0x48
    jr      $ra
    nop


func_8001D998:
# MqDbg: EffectSsKakera_Spawn
# Spawn Particle 0x19
    addiu   $sp, $sp, 0xFFA8           # $sp -= 0x58
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0058($sp)
    sw      a2, 0x0060($sp)
    sw      a3, 0x0064($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x0018            # a0 = FFFFFFC0
    addiu   a0, $sp, 0x0024            # a0 = FFFFFFCC
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0060($sp)
    addiu   a0, $sp, 0x0030            # a0 = FFFFFFD8
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0064($sp)
    lh      t6, 0x006A($sp)
    lh      t7, 0x006E($sp)
    lh      t8, 0x0072($sp)
    sh      t6, 0x003C($sp)
    sh      t7, 0x003E($sp)
    lh      t9, 0x0076($sp)
    lh      t0, 0x007A($sp)
    lh      t1, 0x007E($sp)
    lh      t2, 0x0082($sp)
    lh      t3, 0x0086($sp)
    lw      t4, 0x0088($sp)
    lh      t5, 0x008E($sp)
    lh      t6, 0x0092($sp)
    lw      t7, 0x0094($sp)
    lw      a0, 0x0058($sp)
    addiu   a1, $zero, 0x0019          # a1 = 00000019
    addiu   a2, $zero, 0x0065          # a2 = 00000065
    addiu   a3, $sp, 0x0018            # a3 = FFFFFFC0
    sh      t8, 0x0040($sp)
    sh      t9, 0x0042($sp)
    sh      t0, 0x0044($sp)
    sh      t1, 0x0046($sp)
    sh      t2, 0x0048($sp)
    sh      t3, 0x004A($sp)
    sw      t4, 0x004C($sp)
    sh      t5, 0x0050($sp)
    sh      t6, 0x0052($sp)
    jal     func_8001B468
    sw      t7, 0x0054($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0058           # $sp += 0x58
    jr      $ra
    nop


func_8001DA50:
# MqDbg: EffectSsIcePiece_Spawn
# Spawn Particle 0x1A
    addiu   $sp, $sp, 0xFFB8           # $sp -= 0x48
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0048($sp)
    sw      a2, 0x0050($sp)
    sw      a3, 0x0054($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x001C            # a0 = FFFFFFD4
    addiu   a0, $sp, 0x002C            # a0 = FFFFFFE4
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0054($sp)
    addiu   a0, $sp, 0x0038            # a0 = FFFFFFF0
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0058($sp)
    lwc1    $f4, 0x0050($sp)
    lw      t6, 0x005C($sp)
    lw      a0, 0x0048($sp)
    addiu   a1, $zero, 0x001A          # a1 = 0000001A
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    addiu   a3, $sp, 0x001C            # a3 = FFFFFFD4
    swc1    $f4, 0x0028($sp)
    jal     func_8001B468
    sw      t6, 0x0044($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0048           # $sp += 0x48
    jr      $ra
    nop


func_8001DAB8:
# MqDbg: EffectSsIcePiece_SpawnBurst
# Spawn Particle 0x1A (Wrapper for 8001DA50)
    addiu   $sp, $sp, 0xFF70           # $sp -= 0x90
    sw      s3, 0x004C($sp)
    sw      s2, 0x0048($sp)
    mtc1    a2, $f12                   # $f12 = 0.00
    or      s2, a1, $zero              # s2 = 00000000
    or      s3, a0, $zero              # s3 = 00000000
    sw      $ra, 0x005C($sp)
    sw      s6, 0x0058($sp)
    sw      s5, 0x0054($sp)
    sw      s4, 0x0050($sp)
    sw      s1, 0x0044($sp)
    sw      s0, 0x0040($sp)
    sdc1    $f26, 0x0038($sp)
    sdc1    $f24, 0x0030($sp)
    sdc1    $f22, 0x0028($sp)
    sdc1    $f20, 0x0020($sp)
    lui     $at, 0x8010                # $at = 80100000
    lwc1    $f4, 0x608C($at)           # 8010608C
    lui     $at, 0x800E                # $at = 800E0000
    lui     s0, 0x800E                 # s0 = 800E0000
    swc1    $f4, 0x7BB4($at)           # 800E7BB4
    lui     $at, 0x8010                # $at = 80100000
    lwc1    $f6, 0x6090($at)           # 80106090
    lui     $at, 0x42C8                # $at = 42C80000
    mtc1    $at, $f10                  # $f10 = 100.00
    mul.s   $f8, $f12, $f6
    lui     $at, 0x3F00                # $at = 3F000000
    mtc1    $at, $f24                  # $f24 = 0.50
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f22                  # $f22 = 1.00
    lui     $at, 0x8010                # $at = 80100000
    lui     s6, 0x800E                 # s6 = 800E0000
    lui     s5, 0x800E                 # s5 = 800E0000
    mul.s   $f26, $f8, $f10
    addiu   s5, s5, 0x7BB0             # s5 = 800E7BB0
    addiu   s6, s6, 0x7C34             # s6 = 800E7C34
    lwc1    $f20, 0x6094($at)          # 80106094
    addiu   s0, s0, 0x7BBC             # s0 = 800E7BBC
    addiu   s4, $sp, 0x0080            # s4 = FFFFFFF0
    addiu   s1, $sp, 0x0074            # s1 = FFFFFFE4
    lw      t7, 0x0000(s2)             # 00000000
lbl_8001DB5C:
    mov.s   $f12, $f22
    sw      t7, 0x0000(s1)             # FFFFFFE4
    lw      t6, 0x0004(s2)             # 00000004
    sw      t6, 0x0004(s1)             # FFFFFFE8
    lw      t7, 0x0008(s2)             # 00000008
    jal     func_80026D64
    sw      t7, 0x0008(s1)             # FFFFFFEC
    lwc1    $f14, 0x0000(s0)           # 800E7BBC
    add.s   $f2, $f0, $f24
    lwc1    $f16, 0x0004(s0)           # 800E7BC0
    mul.s   $f4, $f14, $f20
    lwc1    $f18, 0x0008(s0)           # 800E7BC4
    mov.s   $f12, $f22
    mul.s   $f6, $f4, $f2
    nop
    mul.s   $f8, $f16, $f20
    swc1    $f6, 0x0080($sp)
    mul.s   $f10, $f8, $f2
    lwc1    $f8, 0x0074($sp)
    mul.s   $f4, $f18, $f20
    swc1    $f10, 0x0084($sp)
    add.s   $f10, $f8, $f14
    lwc1    $f8, 0x007C($sp)
    mul.s   $f6, $f4, $f2
    lwc1    $f4, 0x0078($sp)
    swc1    $f10, 0x0074($sp)
    add.s   $f10, $f8, $f18
    swc1    $f6, 0x0088($sp)
    add.s   $f6, $f4, $f16
    swc1    $f10, 0x007C($sp)
    jal     func_80026D64
    swc1    $f6, 0x0078($sp)
    add.s   $f4, $f0, $f24
    addiu   t8, $zero, 0x0019          # t8 = 00000019
    sw      t8, 0x0014($sp)
    or      a0, s3, $zero              # a0 = 00000000
    mul.s   $f6, $f4, $f26
    or      a1, s1, $zero              # a1 = FFFFFFE4
    or      a3, s4, $zero              # a3 = FFFFFFF0
    sw      s5, 0x0010($sp)
    mfc1    a2, $f6
    jal     func_8001DA50
    nop
    addiu   s0, s0, 0x000C             # s0 = 800E7BC8
    bnel    s0, s6, lbl_8001DB5C
    lw      t7, 0x0000(s2)             # 00000000
    lw      $ra, 0x005C($sp)
    ldc1    $f20, 0x0020($sp)
    ldc1    $f22, 0x0028($sp)
    ldc1    $f24, 0x0030($sp)
    ldc1    $f26, 0x0038($sp)
    lw      s0, 0x0040($sp)
    lw      s1, 0x0044($sp)
    lw      s2, 0x0048($sp)
    lw      s3, 0x004C($sp)
    lw      s4, 0x0050($sp)
    lw      s5, 0x0054($sp)
    lw      s6, 0x0058($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0090           # $sp += 0x90


func_8001DC4C:
# MqDbg: EffectSsEnIce_SpawnFlyingVec3f
# Spawn Particle 0x1B
    addiu   $sp, $sp, 0xFFA8           # $sp -= 0x58
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0058($sp)
    sw      a1, 0x005C($sp)
    sw      a3, 0x0064($sp)
    lw      t6, 0x005C($sp)
    addiu   a0, $sp, 0x0020            # a0 = FFFFFFC8
    or      a1, a2, $zero              # a1 = 00000000
    jal     func_80063CAC              # Vec3f_Copy
    sw      t6, 0x001C($sp)
    lw      a0, 0x005C($sp)
    lh      t7, 0x0066($sp)
    lh      t8, 0x006A($sp)
    lh      t9, 0x006E($sp)
    lh      t0, 0x0072($sp)
    lh      t1, 0x0076($sp)
    lh      t2, 0x007A($sp)
    lh      t3, 0x007E($sp)
    lwc1    $f4, 0x0080($sp)
    sh      $zero, 0x0054($sp)
    sb      t7, 0x0048($sp)
    sb      t8, 0x0049($sp)
    sb      t9, 0x004A($sp)
    sb      t0, 0x004B($sp)
    sb      t1, 0x004C($sp)
    sb      t2, 0x004D($sp)
    sb      t3, 0x004E($sp)
    beq     a0, $zero, lbl_8001DCC8
    swc1    $f4, 0x002C($sp)
    jal     func_80022FD0
    addiu   a1, $zero, 0x0874          # a1 = 00000874
lbl_8001DCC8:
    lw      a0, 0x0058($sp)
    addiu   a1, $zero, 0x001B          # a1 = 0000001B
    addiu   a2, $zero, 0x0050          # a2 = 00000050
    jal     func_8001B468
    addiu   a3, $sp, 0x001C            # a3 = FFFFFFC4
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0058           # $sp += 0x58
    jr      $ra
    nop


func_8001DCEC:
# MqDbg: EffectSsEnIce_SpawnFlyingVec3s
# Spawn Particle 0x1B
    addiu   $sp, $sp, 0xFFA8           # $sp -= 0x58
    sw      a3, 0x0064($sp)
    sll     a3, a3, 16
    sra     a3, a3, 16
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0058($sp)
    sw      a1, 0x005C($sp)
    lw      t6, 0x005C($sp)
    lh      t0, 0x006A($sp)
    lh      t1, 0x006E($sp)
    sw      t6, 0x001C($sp)
    lh      t7, 0x0000(a2)             # 00000000
    lh      t2, 0x0072($sp)
    lh      t3, 0x0076($sp)
    mtc1    t7, $f4                    # $f4 = 0.00
    lh      t4, 0x007A($sp)
    lh      t5, 0x007E($sp)
    cvt.s.w $f6, $f4
    lwc1    $f4, 0x0080($sp)
    or      a0, t6, $zero              # a0 = 00000000
    swc1    $f6, 0x0020($sp)
    lh      t8, 0x0002(a2)             # 00000002
    mtc1    t8, $f8                    # $f8 = 0.00
    nop
    cvt.s.w $f10, $f8
    swc1    $f10, 0x0024($sp)
    lh      t9, 0x0004(a2)             # 00000004
    sb      a3, 0x0048($sp)
    sh      $zero, 0x0054($sp)
    mtc1    t9, $f16                   # $f16 = 0.00
    sb      t0, 0x0049($sp)
    sb      t1, 0x004A($sp)
    cvt.s.w $f18, $f16
    sb      t2, 0x004B($sp)
    sb      t3, 0x004C($sp)
    sb      t4, 0x004D($sp)
    sb      t5, 0x004E($sp)
    swc1    $f4, 0x002C($sp)
    beq     t6, $zero, lbl_8001DD94
    swc1    $f18, 0x0028($sp)
    jal     func_80022FD0
    addiu   a1, $zero, 0x0874          # a1 = 00000874
lbl_8001DD94:
    lw      a0, 0x0058($sp)
    addiu   a1, $zero, 0x001B          # a1 = 0000001B
    addiu   a2, $zero, 0x0050          # a2 = 00000050
    jal     func_8001B468
    addiu   a3, $sp, 0x001C            # a3 = FFFFFFC4
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0058           # $sp += 0x58
    jr      $ra
    nop


func_8001DDB8:
# MqDbg: EffectSsEnIce_Spawn
# Spawn Particle 0x1B
    addiu   $sp, $sp, 0xFFA8           # $sp -= 0x58
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0058($sp)
    sw      a2, 0x0060($sp)
    sw      a3, 0x0064($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x0020            # a0 = FFFFFFC8
    addiu   a0, $sp, 0x0030            # a0 = FFFFFFD8
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0064($sp)
    addiu   a0, $sp, 0x003C            # a0 = FFFFFFE4
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0068($sp)
    addiu   a0, $sp, 0x0048            # a0 = FFFFFFF0
    jal     func_800646C8
    lw      a1, 0x006C($sp)
    addiu   a0, $sp, 0x004C            # a0 = FFFFFFF4
    jal     func_800646C8
    lw      a1, 0x0070($sp)
    lwc1    $f4, 0x0060($sp)
    lw      t6, 0x0074($sp)
    addiu   t7, $zero, 0x0001          # t7 = 00000001
    sh      t7, 0x0054($sp)
    lw      a0, 0x0058($sp)
    addiu   a1, $zero, 0x001B          # a1 = 0000001B
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    addiu   a3, $sp, 0x001C            # a3 = FFFFFFC4
    swc1    $f4, 0x002C($sp)
    jal     func_8001B468
    sw      t6, 0x0050($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0058           # $sp += 0x58
    jr      $ra
    nop


func_8001DE40:
# MqDbg: EffectSsFireTail_Spawn
# Spawn Particle 0x1C
    addiu   $sp, $sp, 0xFFB0           # $sp -= 0x50
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0050($sp)
    sw      a1, 0x0054($sp)
    sw      a3, 0x005C($sp)
    addiu   a0, $sp, 0x0020            # a0 = FFFFFFD0
    jal     func_80063CAC              # Vec3f_Copy
    or      a1, a2, $zero              # a1 = 00000000
    addiu   a0, $sp, 0x0030            # a0 = FFFFFFE0
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0060($sp)
    addiu   a0, $sp, 0x003E            # a0 = FFFFFFEE
    jal     func_800646C8
    lw      a1, 0x0068($sp)
    addiu   a0, $sp, 0x0042            # a0 = FFFFFFF2
    jal     func_800646C8
    lw      a1, 0x006C($sp)
    lh      t6, 0x0066($sp)
    lw      t7, 0x0054($sp)
    lwc1    $f4, 0x005C($sp)
    lh      t8, 0x0072($sp)
    lh      t9, 0x0076($sp)
    lw      t0, 0x0078($sp)
    lw      a0, 0x0050($sp)
    addiu   a1, $zero, 0x001C          # a1 = 0000001C
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    addiu   a3, $sp, 0x001C            # a3 = FFFFFFCC
    sh      t6, 0x003C($sp)
    sw      t7, 0x001C($sp)
    swc1    $f4, 0x002C($sp)
    sh      t8, 0x0046($sp)
    sh      t9, 0x0048($sp)
    jal     func_8001B468
    sw      t0, 0x004C($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0050           # $sp += 0x50
    jr      $ra
    nop


func_8001DED8:
# MqDbg: EffectSsFireTail_SpawnFlame
# Spawn Particle 0x1C (Wrapper for 8001DE40)
    addiu   $sp, $sp, 0xFFC8           # $sp -= 0x38
    mtc1    a3, $f14                   # $f14 = 0.00
    sw      $ra, 0x0034($sp)
    lwc1    $f12, 0x004C($sp)
    lui     $at, 0x437F                # $at = 437F0000
    mtc1    $at, $f4                   # $f4 = 255.00
    lui     $at, 0x800E                # $at = 800E0000
    sb      $zero, 0x7C36($at)         # 800E7C36
    mul.s   $f6, $f4, $f12
    mfc1    a3, $f14
    lui     t9, 0x800E                 # t9 = 800E0000
    lui     t0, 0x800E                 # t0 = 800E0000
    addiu   t0, t0, 0x7C38             # t0 = 800E7C38
    addiu   t9, t9, 0x7C34             # t9 = 800E7C34
    addiu   t7, a1, 0x005C             # t7 = 0000005C
    trunc.w.s $f8, $f6
    addiu   t8, $zero, 0x000F          # t8 = 0000000F
    addiu   t2, $zero, 0x0001          # t2 = 00000001
    mfc1    v0, $f8
    nop
    sb      v0, 0x7C35($at)            # 800E7C35
    lui     $at, 0x800E                # $at = 800E0000
    sb      $zero, 0x7C39($at)         # 800E7C39
    sb      $zero, 0x7C3A($at)         # 800E7C3A
    sb      v0, 0x7C38($at)            # 800E7C38
    lui     $at, 0x800E                # $at = 800E0000
    sb      v0, 0x7C34($at)            # 800E7C34
    lui     $at, 0x3F80                # $at = 3F800000
    mtc1    $at, $f10                  # $f10 = 1.00
    addiu   v0, $zero, 0x0001          # v0 = 00000001
    c.eq.s  $f12, $f10
    nop
    bc1f    lbl_8001DF68
    nop
    b       lbl_8001DF68
    or      v0, $zero, $zero           # v0 = 00000000
lbl_8001DF68:
    lh      t1, 0x004A($sp)
    sw      t7, 0x0010($sp)
    sw      t8, 0x0014($sp)
    sw      t9, 0x0018($sp)
    sw      t0, 0x001C($sp)
    sw      v0, 0x0020($sp)
    sw      t2, 0x0028($sp)
    jal     func_8001DE40
    sw      t1, 0x0024($sp)
    lw      $ra, 0x0034($sp)
    addiu   $sp, $sp, 0x0038           # $sp += 0x38
    jr      $ra
    nop


func_8001DF9C:
# MqDbg: EffectSsFireTail_SpawnFlameOnPlayer
# Spawn Particle 0x1C (Wrapper for 8001DED8)
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    mtc1    a1, $f12                   # $f12 = 0.00
    mtc1    a3, $f14                   # $f14 = 0.00
    sw      $ra, 0x001C($sp)
    sw      a2, 0x0028($sp)
    lh      t6, 0x002A($sp)
    lw      a1, 0x1C44(a0)             # 00001C44
    mfc1    a3, $f12
    sll     t7, t6,  2
    subu    t7, t7, t6
    sll     t7, t7,  2
    addu    a2, a1, t7
    addiu   a2, a2, 0x08F8             # a2 = 000008F8
    swc1    $f14, 0x0014($sp)
    jal     func_8001DED8
    sw      t6, 0x0010($sp)
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_8001DFEC:
# MqDbg: EffectSsEnFire_SpawnVec3f
# Spawn Particle 0x1D
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0030($sp)
    sw      a1, 0x0034($sp)
    sw      a3, 0x003C($sp)
    addiu   a0, $sp, 0x001C            # a0 = FFFFFFEC
    jal     func_80063CAC              # Vec3f_Copy
    or      a1, a2, $zero              # a1 = 00000000
    lw      a0, 0x0034($sp)
    lh      t6, 0x003E($sp)
    lh      t7, 0x0042($sp)
    lh      t8, 0x0046($sp)
    lh      t9, 0x004A($sp)
    sw      a0, 0x0018($sp)
    sh      t6, 0x0028($sp)
    sh      t7, 0x002A($sp)
    sh      t8, 0x002C($sp)
    beq     a0, $zero, lbl_8001E040
    sh      t9, 0x002E($sp)
    jal     func_80022FD0
    addiu   a1, $zero, 0x2822          # a1 = 00002822
lbl_8001E040:
    lw      a0, 0x0030($sp)
    addiu   a1, $zero, 0x001D          # a1 = 0000001D
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    jal     func_8001B468
    addiu   a3, $sp, 0x0018            # a3 = FFFFFFE8
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop


func_8001E064:
# MqDbg: EffectSsEnFire_SpawnVec3s
# Spawn Particle 0x1D
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      a3, 0x003C($sp)
    sll     a3, a3, 16
    sra     a3, a3, 16
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0030($sp)
    sw      a1, 0x0034($sp)
    lh      t6, 0x0000(a2)             # 00000000
    lw      t9, 0x0034($sp)
    lh      t1, 0x0046($sp)
    mtc1    t6, $f4                    # $f4 = 0.00
    lh      t0, 0x0042($sp)
    lh      t3, 0x004A($sp)
    cvt.s.w $f6, $f4
    ori     t2, t1, 0x8000             # t2 = 00008000
    or      a0, t9, $zero              # a0 = 00000000
    swc1    $f6, 0x001C($sp)
    lh      t7, 0x0002(a2)             # 00000002
    mtc1    t7, $f8                    # $f8 = 0.00
    nop
    cvt.s.w $f10, $f8
    swc1    $f10, 0x0020($sp)
    lh      t8, 0x0004(a2)             # 00000004
    sh      a3, 0x0028($sp)
    sh      t2, 0x002C($sp)
    mtc1    t8, $f16                   # $f16 = 0.00
    sw      t9, 0x0018($sp)
    sh      t0, 0x002A($sp)
    cvt.s.w $f18, $f16
    sh      t3, 0x002E($sp)
    beq     t9, $zero, lbl_8001E0EC
    swc1    $f18, 0x0024($sp)
    jal     func_80022FD0
    addiu   a1, $zero, 0x2822          # a1 = 00002822
lbl_8001E0EC:
    lw      a0, 0x0030($sp)
    addiu   a1, $zero, 0x001D          # a1 = 0000001D
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    jal     func_8001B468
    addiu   a3, $sp, 0x0018            # a3 = FFFFFFE8
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop


func_8001E110:
# MqDbg: EffectSsExtra_Spawn
# Spawn Particle 0x1E
    addiu   $sp, $sp, 0xFFC0           # $sp -= 0x40
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0040($sp)
    sw      a2, 0x0048($sp)
    sw      a3, 0x004C($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x0018            # a0 = FFFFFFD8
    addiu   a0, $sp, 0x0024            # a0 = FFFFFFE4
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0048($sp)
    addiu   a0, $sp, 0x0030            # a0 = FFFFFFF0
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x004C($sp)
    lh      t6, 0x0052($sp)
    lh      t7, 0x0056($sp)
    lw      a0, 0x0040($sp)
    addiu   a1, $zero, 0x001E          # a1 = 0000001E
    addiu   a2, $zero, 0x0064          # a2 = 00000064
    addiu   a3, $sp, 0x0018            # a3 = FFFFFFD8
    sh      t6, 0x003C($sp)
    jal     func_8001B468
    sh      t7, 0x003E($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0040           # $sp += 0x40
    jr      $ra
    nop


func_8001E178:
# MqDbg: EffectSsFCircle_Spawn
# Spawn Particle 0x1F
    addiu   $sp, $sp, 0xFFD0           # $sp -= 0x30
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0030($sp)
    sw      a1, 0x0034($sp)
    sw      a3, 0x003C($sp)
    addiu   a0, $sp, 0x0020            # a0 = FFFFFFF0
    jal     func_80063CAC              # Vec3f_Copy
    or      a1, a2, $zero              # a1 = 00000000
    lw      t6, 0x0034($sp)
    lh      t7, 0x003E($sp)
    lh      t8, 0x0042($sp)
    lw      a0, 0x0030($sp)
    addiu   a1, $zero, 0x001F          # a1 = 0000001F
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    addiu   a3, $sp, 0x001C            # a3 = FFFFFFEC
    sw      t6, 0x001C($sp)
    sh      t7, 0x002C($sp)
    jal     func_8001B468
    sh      t8, 0x002E($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0030           # $sp += 0x30
    jr      $ra
    nop


func_8001E1D4:
# MqDbg: EffectSsDeadDb_Spawn
# Spawn Particle 0x20
    addiu   $sp, $sp, 0xFFA8           # $sp -= 0x58
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0058($sp)
    sw      a2, 0x0060($sp)
    sw      a3, 0x0064($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x001C            # a0 = FFFFFFC4
    addiu   a0, $sp, 0x0028            # a0 = FFFFFFD0
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0060($sp)
    addiu   a0, $sp, 0x0034            # a0 = FFFFFFDC
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0064($sp)
    lh      t6, 0x006A($sp)
    lh      t7, 0x006E($sp)
    lh      t8, 0x0072($sp)
    sh      t6, 0x0040($sp)
    sh      t7, 0x0042($sp)
    lh      t9, 0x0076($sp)
    lh      t0, 0x007A($sp)
    lh      t1, 0x007E($sp)
    lh      t2, 0x0082($sp)
    lh      t3, 0x0086($sp)
    lh      t4, 0x008A($sp)
    lh      t5, 0x008E($sp)
    lw      t6, 0x0090($sp)
    lh      t7, 0x0096($sp)
    lw      a0, 0x0058($sp)
    addiu   a1, $zero, 0x0020          # a1 = 00000020
    addiu   a2, $zero, 0x0078          # a2 = 00000078
    addiu   a3, $sp, 0x001C            # a3 = FFFFFFC4
    sb      t8, 0x0044($sp)
    sb      t9, 0x0045($sp)
    sb      t0, 0x0046($sp)
    sb      t1, 0x0047($sp)
    sb      t2, 0x0048($sp)
    sb      t3, 0x0049($sp)
    sb      t4, 0x004A($sp)
    sh      t5, 0x004C($sp)
    sw      t6, 0x0050($sp)
    jal     func_8001B468
    sh      t7, 0x0054($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0058           # $sp += 0x58
    jr      $ra
    nop


func_8001E28C:
# MqDbg: EffectSsDeadDd_Spawn
# Spawn Particle 0x21
    addiu   $sp, $sp, 0xFFA0           # $sp -= 0x60
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0060($sp)
    sw      a2, 0x0068($sp)
    sw      a3, 0x006C($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x001C            # a0 = FFFFFFBC
    addiu   a0, $sp, 0x0028            # a0 = FFFFFFC8
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0068($sp)
    addiu   a0, $sp, 0x0034            # a0 = FFFFFFD4
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x006C($sp)
    lh      t6, 0x0072($sp)
    lh      t7, 0x0076($sp)
    lh      t8, 0x007A($sp)
    sh      t6, 0x0040($sp)
    lh      t9, 0x007E($sp)
    lh      t0, 0x0082($sp)
    lh      t1, 0x0086($sp)
    lh      t2, 0x008A($sp)
    lh      t3, 0x008E($sp)
    lh      t4, 0x0092($sp)
    lh      t5, 0x0096($sp)
    lw      t6, 0x0098($sp)
    sb      $zero, 0x005C($sp)
    lw      a0, 0x0060($sp)
    addiu   a1, $zero, 0x0021          # a1 = 00000021
    addiu   a2, $zero, 0x0078          # a2 = 00000078
    addiu   a3, $sp, 0x001C            # a3 = FFFFFFBC
    sh      t7, 0x0042($sp)
    sb      t8, 0x0044($sp)
    sb      t9, 0x0045($sp)
    sb      t0, 0x0046($sp)
    sb      t1, 0x0047($sp)
    sb      t2, 0x0048($sp)
    sb      t3, 0x0049($sp)
    sb      t4, 0x004A($sp)
    sh      t5, 0x004C($sp)
    jal     func_8001B468
    sw      t6, 0x0050($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0060           # $sp += 0x60
    jr      $ra
    nop


func_8001E340:
# MqDbg: EffectSsDeadDd_SpawnRandYellow
# Spawn Particle 0x21
    addiu   $sp, $sp, 0xFFA0           # $sp -= 0x60
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0060($sp)
    sw      a2, 0x0068($sp)
    sw      a3, 0x006C($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x001C            # a0 = FFFFFFBC
    lh      t6, 0x006A($sp)
    lh      t7, 0x006E($sp)
    lwc1    $f4, 0x0070($sp)
    lw      t8, 0x0074($sp)
    lw      t9, 0x0078($sp)
    addiu   t0, $zero, 0x0001          # t0 = 00000001
    sb      t0, 0x005C($sp)
    lw      a0, 0x0060($sp)
    addiu   a1, $zero, 0x0021          # a1 = 00000021
    addiu   a2, $zero, 0x0078          # a2 = 00000078
    addiu   a3, $sp, 0x001C            # a3 = FFFFFFBC
    sh      t6, 0x0040($sp)
    sh      t7, 0x0042($sp)
    swc1    $f4, 0x0054($sp)
    sw      t8, 0x0058($sp)
    jal     func_8001B468
    sw      t9, 0x0050($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0060           # $sp += 0x60
    jr      $ra
    nop


func_8001E3B0:
# MqDbg: EffectSsDeadDs_Spawn
# Spawn Particle 0x22
    addiu   $sp, $sp, 0xFFB8           # $sp -= 0x48
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0048($sp)
    sw      a2, 0x0050($sp)
    sw      a3, 0x0054($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x0018            # a0 = FFFFFFD0
    addiu   a0, $sp, 0x0024            # a0 = FFFFFFDC
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0050($sp)
    addiu   a0, $sp, 0x0030            # a0 = FFFFFFE8
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0054($sp)
    lh      t6, 0x005A($sp)
    lh      t7, 0x005E($sp)
    lh      t8, 0x0062($sp)
    lw      t9, 0x0064($sp)
    lw      a0, 0x0048($sp)
    addiu   a1, $zero, 0x0022          # a1 = 00000022
    addiu   a2, $zero, 0x0064          # a2 = 00000064
    addiu   a3, $sp, 0x0018            # a3 = FFFFFFD0
    sh      t6, 0x003C($sp)
    sh      t7, 0x003E($sp)
    sh      t8, 0x0040($sp)
    jal     func_8001B468
    sw      t9, 0x0044($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0048           # $sp += 0x48
    jr      $ra
    nop


func_8001E428:
# MqDbg: EffectSsDeadDs_SpawnStationary
# Spawn Particle 0x22 (Wrapper for 8001E3B0)
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      a2, 0x0030($sp)
    lui     a2, 0x800E                 # a2 = 800E0000
    addiu   a2, a2, 0x7B50             # a2 = 800E7B50
    sw      $ra, 0x0024($sp)
    sw      a3, 0x0034($sp)
    lh      t6, 0x0032($sp)
    lh      t7, 0x0036($sp)
    lh      t8, 0x003A($sp)
    lw      t9, 0x003C($sp)
    or      a3, a2, $zero              # a3 = 800E7B50
    sw      t6, 0x0010($sp)
    sw      t7, 0x0014($sp)
    sw      t8, 0x0018($sp)
    jal     func_8001E3B0
    sw      t9, 0x001C($sp)
    lw      $ra, 0x0024($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_8001E478:
# MqDbg: EffectSsDeadSound_Spawn
# Spawn Particle 0x23
    addiu   $sp, $sp, 0xFFB8           # $sp -= 0x48
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0048($sp)
    sw      a2, 0x0050($sp)
    sw      a3, 0x0054($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x0018            # a0 = FFFFFFD0
    addiu   a0, $sp, 0x0024            # a0 = FFFFFFDC
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0050($sp)
    addiu   a0, $sp, 0x0030            # a0 = FFFFFFE8
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0054($sp)
    lh      v0, 0x005E($sp)
    lhu     t6, 0x005A($sp)
    lh      t7, 0x0062($sp)
    lw      t8, 0x0064($sp)
    sh      v0, 0x003E($sp)
    sh      t6, 0x003C($sp)
    sh      t7, 0x0040($sp)
    bne     v0, $zero, lbl_8001E4EC
    sw      t8, 0x0044($sp)
    lw      a0, 0x0048($sp)
    addiu   a1, $zero, 0x0023          # a1 = 00000023
    addiu   a2, $zero, 0x0064          # a2 = 00000064
    jal     func_8001B468
    addiu   a3, $sp, 0x0018            # a3 = FFFFFFD0
    b       lbl_8001E504
    lw      $ra, 0x0014($sp)
lbl_8001E4EC:
    lw      a0, 0x0048($sp)
    addiu   a1, $zero, 0x0023          # a1 = 00000023
    addiu   a2, $zero, 0x007F          # a2 = 0000007F
    jal     func_8001B468
    addiu   a3, $sp, 0x0018            # a3 = FFFFFFD0
    lw      $ra, 0x0014($sp)
lbl_8001E504:
    addiu   $sp, $sp, 0x0048           # $sp += 0x48
    jr      $ra
    nop


func_8001E510:
# MqDbg: EffectSsDeadSound_SpawnStationary
# Spawn Particle 0x23 (Wrapper for 8001E478)
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      a2, 0x0030($sp)
    lui     a2, 0x800E                 # a2 = 800E0000
    addiu   a2, a2, 0x7B50             # a2 = 800E7B50
    sw      $ra, 0x0024($sp)
    sw      a3, 0x0034($sp)
    lhu     t6, 0x0032($sp)
    lh      t7, 0x0036($sp)
    lh      t8, 0x003A($sp)
    lw      t9, 0x003C($sp)
    or      a3, a2, $zero              # a3 = 800E7B50
    sw      t6, 0x0010($sp)
    sw      t7, 0x0014($sp)
    sw      t8, 0x0018($sp)
    jal     func_8001E478
    sw      t9, 0x001C($sp)
    lw      $ra, 0x0024($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_8001E560:
# MqDbg: EffectSsIceSmoke_Spawn
# Spawn Particle 0x24
    addiu   $sp, $sp, 0xFFC0           # $sp -= 0x40
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0040($sp)
    sw      a2, 0x0048($sp)
    sw      a3, 0x004C($sp)
    jal     func_80063CAC              # Vec3f_Copy
    addiu   a0, $sp, 0x0018            # a0 = FFFFFFD8
    addiu   a0, $sp, 0x0024            # a0 = FFFFFFE4
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x0048($sp)
    addiu   a0, $sp, 0x0030            # a0 = FFFFFFF0
    jal     func_80063CAC              # Vec3f_Copy
    lw      a1, 0x004C($sp)
    lh      t6, 0x0052($sp)
    lw      a0, 0x0040($sp)
    addiu   a1, $zero, 0x0024          # a1 = 00000024
    addiu   a2, $zero, 0x0080          # a2 = 00000080
    addiu   a3, $sp, 0x0018            # a3 = FFFFFFD8
    jal     func_8001B468
    sh      t6, 0x003C($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0040           # $sp += 0x40
    jr      $ra
    nop
