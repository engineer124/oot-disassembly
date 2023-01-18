

.section .text
func_800CDA20:
# MqDbg: SystemArena_Malloc
# Allocates block to head of the main heap
# A0 = Allocate Size
# V0 = Allocate Start
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0020($sp)
    jal     func_80003CC0              # osSetIntMask
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    lui     a0, 0x8013                 # a0 = 80130000
    sw      v0, 0x001C($sp)
    addiu   a0, a0, 0xBAA0             # a0 = 8012BAA0
    jal     func_800CE060              # osMalloc?
    lw      a1, 0x0020($sp)
    sw      v0, 0x0018($sp)
    jal     func_80003CC0              # osSetIntMask
    lw      a0, 0x001C($sp)
    lw      $ra, 0x0014($sp)
    lw      v0, 0x0018($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800CDA68:
# MqDbg: SystemArena_MallocR
# Allocates block to tail end of main heap
# A0 = Allocate Size
# V0 = Allocate Start
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0020($sp)
    jal     func_80003CC0              # osSetIntMask
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    lui     a0, 0x8013                 # a0 = 80130000
    sw      v0, 0x001C($sp)
    addiu   a0, a0, 0xBAA0             # a0 = 8012BAA0
    jal     func_800CE17C
    lw      a1, 0x0020($sp)
    sw      v0, 0x0018($sp)
    jal     func_80003CC0              # osSetIntMask
    lw      a0, 0x001C($sp)
    lw      $ra, 0x0014($sp)
    lw      v0, 0x0018($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800CDAB0:
# MqDbg: SystemArena_Realloc
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0020($sp)
    sw      a1, 0x0024($sp)
    jal     func_80003CC0              # osSetIntMask
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    lui     a0, 0x8013                 # a0 = 80130000
    sw      v0, 0x001C($sp)
    addiu   a0, a0, 0xBAA0             # a0 = 8012BAA0
    lw      a1, 0x0020($sp)
    jal     func_800CE514
    lw      a2, 0x0024($sp)
    sw      v0, 0x0020($sp)
    jal     func_80003CC0              # osSetIntMask
    lw      a0, 0x001C($sp)
    lw      $ra, 0x0014($sp)
    lw      v0, 0x0020($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800CDB00:
# MqDbg: SystemArena_Free
# Deallocates memory on main heap
# A0 = ptr to block to free (not the node)
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0020($sp)
    jal     func_80003CC0              # osSetIntMask
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    lui     a0, 0x8013                 # a0 = 80130000
    sw      v0, 0x001C($sp)
    addiu   a0, a0, 0xBAA0             # a0 = 8012BAA0
    jal     func_800CE2B4              # osFree?
    lw      a1, 0x0020($sp)
    jal     func_80003CC0              # osSetIntMask
    lw      a0, 0x001C($sp)
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800CDB40:
# MqDbg: SystemArena_Calloc
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0028($sp)
    sw      a1, 0x002C($sp)
    jal     func_80003CC0              # osSetIntMask
    addiu   a0, $zero, 0x0001          # a0 = 00000001
    lw      t6, 0x0028($sp)
    lw      t7, 0x002C($sp)
    lui     a0, 0x8013                 # a0 = 80130000
    sw      v0, 0x0024($sp)
    multu   t6, t7
    addiu   a0, a0, 0xBAA0             # a0 = 8012BAA0
    mflo    a1
    sw      a1, 0x0018($sp)
    jal     func_800CE060              # osMalloc?
    nop
    sw      v0, 0x0020($sp)
    jal     func_80003CC0              # osSetIntMask
    lw      a0, 0x0024($sp)
    lw      a0, 0x0020($sp)
    beql    a0, $zero, lbl_800CDBA8
    lw      $ra, 0x0014($sp)
    jal     func_80002E80              # bzero
    lw      a1, 0x0018($sp)
    lw      a0, 0x0020($sp)
    lw      $ra, 0x0014($sp)
lbl_800CDBA8:
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    or      v0, a0, $zero              # v0 = 00000000
    jr      $ra
    nop


func_800CDBB8:
# MqDbg: SystemArena_GetSizes
# Get Free Space Info (Wrapper for 800CE688)
# A0 = ptr to store total free space on heap?
# A0 = ptr to store total free space on heap?
# A1 = ptr to store total space allocated on heap
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      a1, 0x001C($sp)
    or      a1, a0, $zero              # a1 = 00000000
    sw      a0, 0x0018($sp)
    sw      $ra, 0x0014($sp)
    or      a3, a2, $zero              # a3 = 00000000
    lui     a0, 0x8013                 # a0 = 80130000
    lw      a2, 0x001C($sp)
    jal     func_800CE688
    addiu   a0, a0, 0xBAA0             # a0 = 8012BAA0
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800CDBF0:
# MqDbg: SystemArena_Check
# Wrapper for 800CE6FC (Test Memory?)
# A0 = 8012BAA0
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lui     a0, 0x8013                 # a0 = 80130000
    jal     func_800CE6FC
    addiu   a0, a0, 0xBAA0             # a0 = 8012BAA0
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800CDC14:
# MqDbg: SystemArena_Init
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    or      a2, a1, $zero              # a2 = 00000000
    or      a1, a0, $zero              # a1 = 00000000
    sw      a0, 0x0018($sp)
    sw      $ra, 0x0014($sp)
    lui     a0, 0x8013                 # a0 = 80130000
    jal     func_800CDD90
    addiu   a0, a0, 0xBAA0             # a0 = 8012BAA0
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800CDC44:
# MqDbg: SystemArena_Cleanup
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lui     a0, 0x8013                 # a0 = 80130000
    jal     func_800CDDD8
    addiu   a0, a0, 0xBAA0             # a0 = 8012BAA0
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_800CDC68:
# MqDbg: SystemArena_IsInitialized
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lui     a0, 0x8013                 # a0 = 80130000
    jal     func_800CDDF8
    addiu   a0, a0, 0xBAA0             # a0 = 8012BAA0
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop
    nop