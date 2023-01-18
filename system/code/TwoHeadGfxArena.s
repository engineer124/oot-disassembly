# "TwoHeadGfxArena" part of the code file
# 
# This file implements a particular use of the double-ended stack allocator from TwoHeadArena.c for graphics data.
# 
# Display list commands are allocated from the head while other graphics data such as matrices and vertices are
# allocated from the tail end.
# 
# @see TwoHeadArena.c
#
# Starts at VRAM: 8009FEC0 / VROM: B15E20
#

.section .text
func_8009FEC0:
# MqDbg: THGA_Init
# Frame Display List Buffer - Allocate (Memory Allocation Handle)
# (Wrapper for 800A0248)
# A0 = Allocation Handle ptr
# A1 = Allocate Start
# A2 = Allocate Size
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800A0248
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_8009FEE0:
# MqDbg: THGA_Destroy
# Frame Display List Buffer - Zero Memory Allocation Handle
# (Wrapper for 800A026C)
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800A026C
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_8009FF00:
# MqDbg: THGA_IsCrash
# Frame Display List Buffer - Check if full
# (Wrapper for 800A0208)
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800A0208
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_8009FF20:
# MqDbg: THGA_Reset
# (Wrapper for 800A022C)
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800A022C
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_8009FF40:
# MqDbg: THGA_GetRemaining
# (Wrapper for 800A01F4)
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800A01F4
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_8009FF60:
# MqDbg: THGA_GetHead
# (Wrapper for 800A00D0)
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800A00D0
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_8009FF80:
# MqDbg: THGA_SetHead
# (Wrapper for 800A00DC)
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800A00DC
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_8009FFA0:
# MqDbg: THGA_GetTail
# (Wrapper for 800A00E8)
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800A00E8
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_8009FFC0:
# MqDbg: THGA_AllocDisplayList
# (Wrapper for 800A00F4)
# Calls wrapped function with A1 <<= 3
# A0 = ?
# A1 = s32?
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    or      a2, a1, $zero              # a2 = 00000000
    jal     func_800A00F4
    sll     a1, a2,  3
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_8009FFE4:
# MqDbg: THGA_AllocGfx
# (Wrapper for 8009FFC0)
# Calls wrapped function with A1 = 1
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_8009FFC0
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800A0004:
# MqDbg: THGA_AllocGfx2
# (Wrapper for 8009FFE4)
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_8009FFE4
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800A0024:
# MqDbg: THGA_AllocTail
# (Wrapper for 800A0128)
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800A0128
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800A0044:
# MqDbg: THGA_AllocMtxArray
# (Wrapper for 800A0024)
# Calls wrapped function with A1 <<= 6
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    or      a2, a1, $zero              # a2 = 00000000
    jal     func_800A0024
    sll     a1, a2,  6
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800A0068:
# MqDbg: THGA_AllocMtx
# (Wrapper for 800A0024)
# Calls wrapped function with A1 = 0x40
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800A0024
    addiu   a1, $zero, 0x0040          # a1 = 00000040
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800A0088:
# MqDbg: THGA_AllocVtxArray
# (Wrapper for 800A0024)
# Calls wrapped function with A1 <<= 4
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    or      a2, a1, $zero              # a2 = 00000000
    jal     func_800A0024
    sll     a1, a2,  4
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800A00AC:
# MqDbg: THGA_AllocVtx
# (Wrapper for 800A0024)
# Calls wrapped function with A1 = 0x10
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800A0024
    addiu   a1, $zero, 0x0010          # a1 = 00000010
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop
    nop
