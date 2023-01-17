# "Player" part of the code file
#
# The purpose of this file's content is unclear but it contains the 4 main functions of the player actor (init, destruct, update, draw).
#
# Starts at VRAM: 80097650 / VROM: B0D5B0
#

.section .text
func_80097650:
# MqDbg: PlayerCall_InitFuncPtrs
# Set 4 inner main functions of the player actor at 8011D030 in memory
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lui     a0, 0x8084                 # a0 = 80840000
    jal     func_80099DBC
    addiu   a0, a0, 0x4DE8             # a0 = 80844DE8
    lui     $at, 0x8012                # $at = 80120000
    lui     a0, 0x8085                 # a0 = 80850000
    sw      v0, -0x2FD0($at)           # 8011D030
    jal     func_80099DBC
    addiu   a0, a0, 0x8BB4             # a0 = 80848BB4
    lui     $at, 0x8012                # $at = 80120000
    lui     a0, 0x8084                 # a0 = 80840000
    sw      v0, -0x2FCC($at)           # 8011D034
    jal     func_80099DBC
    addiu   a0, a0, 0x7FC8             # a0 = 80847FC8
    lui     $at, 0x8012                # $at = 80120000
    lui     a0, 0x8085                 # a0 = 80850000
    sw      v0, -0x2FC8($at)           # 8011D038
    jal     func_80099DBC
    addiu   a0, a0, 0x8680             # a0 = 80848680
    lui     $at, 0x8012                # $at = 80120000
    sw      v0, -0x2FC4($at)           # 8011D03C
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800976B8:
# MqDbg: PlayerCall_Init
# Link, Init Routine (Primary, Wrapper for 80844DE8)
# A0 = Link Instance
# A1 = Global Context
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0018($sp)
    sw      a1, 0x001C($sp)
    jal     func_80099E90
    nop
    jal     func_80097650
    nop
    lui     t9, 0x8012                 # t9 = 80120000
    lw      t9, -0x2FD0(t9)            # 8011D030
    lw      a0, 0x0018($sp)
    lw      a1, 0x001C($sp)
    jalr    $ra, t9
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_80097700:
# MqDbg: PlayerCall_Destroy
# Link, Destruct Routine (Primary, Wrapper for 80848BB4)
# A0 = Link Instance
# A1 = Global Context
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0018($sp)
    sw      a1, 0x001C($sp)
    jal     func_80099E90
    nop
    lui     t9, 0x8012                 # t9 = 80120000
    lw      t9, -0x2FCC(t9)            # 8011D034
    lw      a0, 0x0018($sp)
    lw      a1, 0x001C($sp)
    jalr    $ra, t9
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_80097740:
# MqDbg: PlayerCall_Update
# Link, Update Routine (Primary Wrapper for 80847FC8)
# A0 = Link Instance
# A1 = Global Context
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0018($sp)
    sw      a1, 0x001C($sp)
    jal     func_80099E90
    nop
    lui     t9, 0x8012                 # t9 = 80120000
    lw      t9, -0x2FC8(t9)            # 8011D038
    lw      a0, 0x0018($sp)
    lw      a1, 0x001C($sp)
    jalr    $ra, t9
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_80097780:
# MqDbg: PlayerCall_Draw
# Link, Draw Routine (Primary, Wrapper for 80848680)
# A0 = Link Instance
# A1 = Global Context
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0018($sp)
    sw      a1, 0x001C($sp)
    jal     func_80099E90
    nop
    lui     t9, 0x8012                 # t9 = 80120000
    lw      t9, -0x2FC4(t9)            # 8011D03C
    lw      a0, 0x0018($sp)
    lw      a1, 0x001C($sp)
    jalr    $ra, t9
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop

