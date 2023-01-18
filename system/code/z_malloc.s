# "Game Memory Allocation" part of the code file
#
# Handles allocating and freeing memory for the game state.
#
# Starts at VRAM: 80066C10 / VROM: ADCB70
#

.section .text
func_80066C10:
# MqDbg: ZeldaArena_Malloc
# zelda_malloc?
# Allocate Memory To Game State Free List (Head End)
# Wrapper for 800CE060
# A0 = Space to Allocate
# V0 = Pointer to reserved space
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    or      a1, a0, $zero              # a1 = 00000000
    lui     a0, 0x8012                 # a0 = 80120000
    jal     func_800CE060              # osMalloc?
    addiu   a0, a0, 0xBEF0             # a0 = 8011BEF0
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_80066C38:
# MqDbg: ZeldaArena_MallocR
# zelda_malloc?
# Allocate Memory To Game State Free List (Tail End)
# Wrapper for 800CE17C
# A0 = Space to Allocate
# V0 = Pointer to reserved space
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    or      a1, a0, $zero              # a1 = 00000000
    lui     a0, 0x8012                 # a0 = 80120000
    jal     func_800CE17C
    addiu   a0, a0, 0xBEF0             # a0 = 8011BEF0
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_80066C60:
# MqDbg: ZeldaArena_Realloc
# Wrapper for 800CE514
# A0 = ?
# A1 = ?
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    or      a2, a1, $zero              # a2 = 00000000
    or      a1, a0, $zero              # a1 = 00000000
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0018($sp)
    lui     a0, 0x8012                 # a0 = 80120000
    jal     func_800CE514
    addiu   a0, a0, 0xBEF0             # a0 = 8011BEF0
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_80066C90:
# MqDbg: ZeldaArena_Free
# Free Memory on Game State Free List
# A0 = Pointer to Space to Free
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    or      a1, a0, $zero              # a1 = 00000000
    lui     a0, 0x8012                 # a0 = 80120000
    jal     func_800CE2B4              # osFree?
    addiu   a0, a0, 0xBEF0             # a0 = 8011BEF0
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_80066CB8:
# MqDbg: ZeldaArena_Calloc
# Gamestate Mem
# A0 = Type Size?
# A1 = Number of Records
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x0014($sp)
    or      a2, a0, $zero              # a2 = 00000000
    or      a3, a1, $zero              # a3 = 00000000
    multu   a2, a3
    lui     a0, 0x8012                 # a0 = 80120000
    addiu   a0, a0, 0xBEF0             # a0 = 8011BEF0
    mflo    a1
    sw      a1, 0x001C($sp)
    jal     func_800CE060              # osMalloc?
    nop
    lw      a1, 0x001C($sp)
    beq     v0, $zero, lbl_80066CFC
    or      a0, v0, $zero              # a0 = 00000000
    jal     func_80002E80              # bzero
    sw      v0, 0x0024($sp)
    lw      a0, 0x0024($sp)
lbl_80066CFC:
    or      v0, a0, $zero              # v0 = 00000000
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    jr      $ra
    nop


func_80066D10:
# MqDbg: ZeldaArena_GetSizes
# Get Total Free Memory on Game State Block List
# (Wrapper for 800CE688)
# A0 = int*, total free space on heap?
# A1 = int*, total free space on heap
# A2 = int*, total allocated space on heap, not factoring memory nodes
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      a1, 0x001C($sp)
    or      a3, a2, $zero              # a3 = 00000000
    lw      a2, 0x001C($sp)
    or      a1, a0, $zero              # a1 = 00000000
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0018($sp)
    lui     a0, 0x8012                 # a0 = 80120000
    jal     func_800CE688
    addiu   a0, a0, 0xBEF0             # a0 = 8011BEF0
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_80066D48:
# MqDbg: ZeldaArena_Check
# Verify Game State Heap Integrity
# A0 = 8011BEF0 (Game State Free List ref)
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lui     a0, 0x8012                 # a0 = 80120000
    jal     func_800CE6FC
    addiu   a0, a0, 0xBEF0             # a0 = 8011BEF0
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_80066D6C:
# MqDbg: ZeldaArena_Init
# Allocate Game State Heap Free List
# A0 = 8011BEF0 (Game State Free List ref)
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    or      a2, a1, $zero              # a2 = 00000000
    or      a1, a0, $zero              # a1 = 00000000
    sw      $ra, 0x0014($sp)
    sw      a0, 0x0018($sp)
    lui     a0, 0x8012                 # a0 = 80120000
    jal     func_800CDD90
    addiu   a0, a0, 0xBEF0             # a0 = 8011BEF0
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_80066D9C:
# MqDbg: ZeldaArena_Cleanup
# Game State Heap
# A0 = 8011BEF0 (Game State Free List ref)
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lui     a0, 0x8012                 # a0 = 80120000
    jal     func_800CDDD8
    addiu   a0, a0, 0xBEF0             # a0 = 8011BEF0
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop


func_80066DC0:
# MqDbg: ZeldaArena_IsInitialized
# Game State Heap
# A0 = 8011BEF0 (Game State Free List ref)
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    lui     a0, 0x8012                 # a0 = 80120000
    jal     func_800CDDF8
    addiu   a0, a0, 0xBEF0             # a0 = 8011BEF0
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop
    nop
    nop
    nop
