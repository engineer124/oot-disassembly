# "TwoHeadArena" part of the code file
# 
# This file implements a simple general purpose double-ended stack allocator.
# 
# A double-ended stack allocator accepts allocations at either the "head" or "tail" of its allotted memory region.
# While in general this type of allocator could accept deallocations on the most recently allocated block at either
# end, this implementation does not support any individual deallocations; the only provided way to deallocate anything
# is to reset the entire arena, deallocating everything. This scheme is most applicable to allocating similar data
# with identical lifetime.
#
# Starts at VRAM: 800A00D0 / VROM: B16030
#

.section .text
func_800A00D0:
# MqDbg: THA_GetHead
    lw      v0, 0x0008(a0)             # 00000008
    jr      $ra
    nop


func_800A00DC:
# MqDbg: THA_SetHead
    sw      a1, 0x0008(a0)             # 00000008
    jr      $ra
    nop


func_800A00E8:
# MqDbg: THA_GetTail
    lw      v0, 0x000C(a0)             # 0000000C
    jr      $ra
    nop


func_800A00F4:
# MqDbg: THA_AllocHead
# A0 = ?
# A1 = Increment
    lw      v0, 0x0008(a0)             # 00000008
    addu    t6, v0, a1
    sw      t6, 0x0008(a0)             # 00000008
    jr      $ra
    nop


func_800A0108:
# MqDbg: THA_AllocHeadByte
# Wrapper for 800A00F4 (A1 = 1)
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800A00F4
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800A0128:
# MqDbg: THA_AllocTail
    addiu   $at, $zero, 0x0008         # $at = 00000008
    bnel    a1, $at, lbl_800A0140
    addiu   $at, $zero, 0x0004         # $at = 00000004
    b       lbl_800A019C
    addiu   v1, $zero, 0xFFF8          # v1 = FFFFFFF8
    addiu   $at, $zero, 0x0004         # $at = 00000004
lbl_800A0140:
    beq     a1, $at, lbl_800A0150
    addiu   v0, $zero, 0x000C          # v0 = 0000000C
    bne     a1, v0, lbl_800A0158
    addiu   $at, $zero, 0x0002         # $at = 00000002
lbl_800A0150:
    b       lbl_800A019C
    addiu   v1, $zero, 0xFFFC          # v1 = FFFFFFFC
lbl_800A0158:
    beq     a1, $at, lbl_800A0180
    addiu   $at, $zero, 0x0006         # $at = 00000006
    beq     a1, $at, lbl_800A0180
    addiu   $at, $zero, 0x000A         # $at = 0000000A
    beq     a1, $at, lbl_800A0180
    nop
    beq     a1, v0, lbl_800A0180
    addiu   $at, $zero, 0x000E         # $at = 0000000E
    bnel    a1, $at, lbl_800A018C
    sltiu   $at, a1, 0x0010
lbl_800A0180:
    b       lbl_800A019C
    addiu   v1, $zero, 0xFFFE          # v1 = FFFFFFFE
    sltiu   $at, a1, 0x0010
lbl_800A018C:
    bne     $at, $zero, lbl_800A019C
    or      v1, $zero, $zero           # v1 = 00000000
    b       lbl_800A019C
    addiu   v1, $zero, 0xFFF0          # v1 = FFFFFFF0
lbl_800A019C:
    lw      t6, 0x000C(a0)             # 0000000C
    and     t7, t6, v1
    subu    t8, t7, a1
    and     v0, t8, v1
    sw      v0, 0x000C(a0)             # 0000000C
    jr      $ra
    nop


func_800A01B8:
# MqDbg: THA_AllocTailAlign16
# Allocates to the tail end of the given heap (0x10 aligned)
# A0 = Allocation Handle ptr
# A1 = Allocate Size
# V0 = ptr to free space
    lw      t6, 0x000C(a0)             # 0000000C
    addiu   $at, $zero, 0xFFF0         # $at = FFFFFFF0
    and     t7, t6, $at
    subu    t8, t7, a1
    and     v0, t8, $at
    sw      v0, 0x000C(a0)             # 0000000C
    jr      $ra
    nop


func_800A01D8:
# MqDbg: THA_AllocTailAlign
# Allocates to the tail end of the given heap (custom align)
# A0 = Allocation Handle ptr
# A1 = Allocate Size
# A2 = Alignment Constant
# V0 = ptr to free space
    lw      t6, 0x000C(a0)             # 0000000C
    and     t7, t6, a2
    subu    t8, t7, a1
    and     v0, t8, a2
    sw      v0, 0x000C(a0)             # 0000000C
    jr      $ra
    nop


func_800A01F4:
# MqDbg: THA_GetRemaining
# Get Free Memory left in memory allocation handle
# A0 = Allocation Handle ptr
# V0 = free space
    lw      t6, 0x000C(a0)             # 0000000C
    lw      t7, 0x0008(a0)             # 00000008
    subu    v0, t6, t7
    jr      $ra
    nop


func_800A0208:
# MqDbg: THA_IsCrash
# Is Allocation Handle full
# A0 = Allocation Handle ptr
# V0 = 1 if full, 0 if free space remains
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800A01F4
    nop
    slti    v0, v0, 0x0000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800A022C:
# MqDbg: THA_Reset
# Set Allocation Handle (helper)
# A0 = Allocation Handle ptr
# Size and Start address for handle must be valid
    lw      v0, 0x0004(a0)             # 00000004
    lw      t6, 0x0000(a0)             # 00000000
    sw      v0, 0x0008(a0)             # 00000008
    addu    t7, v0, t6
    sw      t7, 0x000C(a0)             # 0000000C
    jr      $ra
    nop


func_800A0248:
# MqDbg: THA_Init
# Set Allocation Handle
# (Wrapper for 800A022C)
# A0 = Allocation Handle ptr
# A1 = Allocate Start
# A2 = Allocate Size
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    sw      a1, 0x0004(a0)             # 00000004
    jal     func_800A022C
    sw      a2, 0x0000(a0)             # 00000000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800A026C:
# MqDbg: THA_Destroy
# Zero Allocation Handle
# A0 = Allocation Handle ptr
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_80002E80              # bzero
    addiu   a1, $zero, 0x0010          # a1 = 00000010
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop
    nop
