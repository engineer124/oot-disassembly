

.section .text
func_800CDC90:
# MqDbg: Rand_Next
# prng
# Pseudo-random number generator. Uses Numerical Recipes in C code with constants 0x19660D and 0x3C6EF35F.
# V0 = Seed Next
    lui     a0, 0x8010                 # a0 = 80100000
    addiu   a0, a0, 0x5440             # a0 = 80105440
    lw      v1, 0x0000(a0)             # 80105440
    lui     $at, 0x0019                # $at = 00190000
    ori     $at, $at, 0x660D           # $at = 0019660D
    multu   v1, $at
    lui     $at, 0x3C6E                # $at = 3C6E0000
    ori     $at, $at, 0xF35F           # $at = 3C6EF35F
    mflo    v1
    addu    v0, v1, $at
    jr      $ra
    sw      v0, 0x0000(a0)             # 80105440


func_800CDCC0:
# MqDbg: Rand_Seed
# Write RNG Seed (stored at 80105440)
# A0 = Seed Value
    lui     $at, 0x8010                # $at = 80100000
    jr      $ra
    sw      a0, 0x5440($at)            # 80105440


func_800CDCCC:
# MqDbg: Rand_ZeroOne
# Rand.Next() float
# Generates a random number between 0 inclusive and 1 exclusive
# F0 = returned value
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    jal     func_800CDC90              # prng
    nop
    lui     $at, 0x007F                # $at = 007F0000
    ori     $at, $at, 0xFFFF           # $at = 007FFFFF
    and     t6, v0, $at
    lui     $at, 0x3F80                # $at = 3F800000
    or      t7, t6, $at                # t7 = 3F800000
    sw      t7, 0x001C($sp)
    lwc1    $f4, 0x001C($sp)
    mtc1    $at, $f6                   # $f6 = 1.00
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    sub.s   $f2, $f4, $f6
    jr      $ra
    mov.s   $f0, $f2


func_800CDD10:
# MqDbg: Rand_Seed_Variable
    jr      $ra
    sw      a1, 0x0000(a0)             # 00000000


func_800CDD18:
# MqDbg: Rand_Next_Variable
    lw      v1, 0x0000(a0)             # 00000000
    lui     $at, 0x0019                # $at = 00190000
    ori     $at, $at, 0x660D           # $at = 0019660D
    multu   v1, $at
    lui     $at, 0x3C6E                # $at = 3C6E0000
    ori     $at, $at, 0xF35F           # $at = 3C6EF35F
    mflo    v1
    addu    v0, v1, $at
    jr      $ra
    sw      v0, 0x0000(a0)             # 00000000


func_800CDD40:
# MqDbg: Rand_ZeroOne_Variable
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    jal     func_800CDD18
    nop
    lui     $at, 0x007F                # $at = 007F0000
    ori     $at, $at, 0xFFFF           # $at = 007FFFFF
    and     t6, v0, $at
    lui     $at, 0x3F80                # $at = 3F800000
    or      t7, t6, $at                # t7 = 3F800000
    sw      t7, 0x001C($sp)
    lwc1    $f4, 0x001C($sp)
    mtc1    $at, $f6                   # $f6 = 1.00
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    sub.s   $f2, $f4, $f6
    jr      $ra
    mov.s   $f0, $f2
    nop
    nop
    nop

