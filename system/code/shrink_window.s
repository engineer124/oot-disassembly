# Letterbox System
#
# Controls letterboxing: black boxes at the top and bottom of the screen
#
# Starts at VRAM: 80099620 / VROM: B0F580
#

.section .text
func_80099620:
# MqDbg: Letterbox_SetSizeTarget
# sw A0, 800FE474($zero)
    lui     $at, 0x8010                # $at = 80100000
    sw      a0, -0x1B8C($at)           # 800FE474
    jr      $ra
    nop


func_80099630:
# MqDbg: Letterbox_GetSizeTarget
# lw V0, 800FE474($zero)
    lui     v0, 0x8010                 # v0 = 80100000
    lw      v0, -0x1B8C(v0)            # 800FE474
    jr      $ra
    nop


func_80099640:
# MqDbg: Letterbox_SetSize
# sw A0, 800FE478($zero)
    lui     $at, 0x8010                # $at = 80100000
    sw      a0, -0x1B88($at)           # 800FE478
    jr      $ra
    nop


func_80099650:
# MqDbg: Letterbox_GetSize
# lw V0, 800FE478($zero)
    lui     v0, 0x8010                 # v0 = 80100000
    lw      v0, -0x1B88(v0)            # 800FE478
    jr      $ra
    nop


func_80099660:
# MqDbg: Letterbox_Init
    lui     $at, 0x8010                # $at = 80100000
    sw      $zero, -0x1B90($at)        # 800FE470
    lui     $at, 0x8010                # $at = 80100000
    sw      $zero, -0x1B8C($at)        # 800FE474
    lui     $at, 0x8010                # $at = 80100000
    sw      $zero, -0x1B88($at)        # 800FE478
    jr      $ra
    nop


func_80099680:
# MqDbg: Letterbox_Destroy
# sw $zero, 800FE478
    lui     $at, 0x8010                # $at = 80100000
    sw      $zero, -0x1B88($at)        # 800FE478
    jr      $ra
    nop


func_80099690:
# MqDbg: Letterbox_Update
    addiu   $at, $zero, 0x0003         # $at = 00000003
    bne     a0, $at, lbl_800996A4
    lui     a2, 0x8010                 # a2 = 80100000
    b       lbl_800996D4
    addiu   v0, $zero, 0x000A          # v0 = 0000000A
lbl_800996A4:
    addiu   t6, $zero, 0x001E          # t6 = 0000001E
    div     $zero, t6, a0
    mflo    v0
    bne     a0, $zero, lbl_800996BC
    nop
    break   # 0x01C00
lbl_800996BC:
    addiu   $at, $zero, 0xFFFF         # $at = FFFFFFFF
    bne     a0, $at, lbl_800996D4
    lui     $at, 0x8000                # $at = 80000000
    bne     t6, $at, lbl_800996D4
    nop
    break   # 0x01800
lbl_800996D4:
    addiu   a2, a2, 0xE478             # a2 = 800FE478
    lui     a0, 0x8010                 # a0 = 80100000
    lw      a0, -0x1B8C(a0)            # 800FE474
    lw      v1, 0x0000(a2)             # 800FE478
    lui     a3, 0x8010                 # a3 = 80100000
    addiu   a3, a3, 0xE470             # a3 = 800FE470
    slt     $at, v1, a0
    beql    $at, $zero, lbl_80099730
    slt     $at, a0, v1
    lw      t7, 0x0000(a3)             # 800FE470
    addiu   a1, $zero, 0x0001          # a1 = 00000001
    beql    a1, t7, lbl_80099710
    addu    a1, v1, v0
    sw      a1, 0x0000(a3)             # 800FE470
    addu    a1, v1, v0
lbl_80099710:
    slt     $at, a1, a0
    beq     $at, $zero, lbl_80099724
    nop
    jr      $ra
    sw      a1, 0x0000(a2)             # 800FE478
lbl_80099724:
    jr      $ra
    sw      a0, 0x0000(a2)             # 800FE478
lbl_8009972C:
    slt     $at, a0, v1
lbl_80099730:
    beq     $at, $zero, lbl_80099774
    lui     a3, 0x8010                 # a3 = 80100000
    lui     a3, 0x8010                 # a3 = 80100000
    addiu   a3, a3, 0xE470             # a3 = 800FE470
    lw      t8, 0x0000(a3)             # 800FE470
    addiu   a1, $zero, 0x0002          # a1 = 00000002
    beql    a1, t8, lbl_80099758
    subu    a1, v1, v0
    sw      a1, 0x0000(a3)             # 800FE470
    subu    a1, v1, v0
lbl_80099758:
    slt     $at, a0, a1
    beq     $at, $zero, lbl_8009976C
    nop
    jr      $ra
    sw      a1, 0x0000(a2)             # 800FE478
lbl_8009976C:
    jr      $ra
    sw      a0, 0x0000(a2)             # 800FE478
lbl_80099774:
    addiu   a3, a3, 0xE470             # a3 = 800FC8E0
    sw      $zero, 0x0000(a3)          # 800FC8E0
    jr      $ra
    nop
    nop
    nop
    nop
    