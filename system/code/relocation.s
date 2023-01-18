

.section .text
func_800CC8F0:
# MqDbg: Overlay_Relocate
# Perform Overlay Relocation
    addiu   $sp, $sp, 0xFE70           # $sp -= 0x190
    lui     t6, 0x8010                 # t6 = 80100000
    lw      t6, 0x5420(t6)             # 80105420
    sw      s4, 0x0028($sp)
    sw      s1, 0x001C($sp)
    sw      s0, 0x0018($sp)
    slti    $at, t6, 0x0003
    or      s0, a1, $zero              # s0 = 00000000
    or      s1, a2, $zero              # s1 = 00000000
    or      s4, a0, $zero              # s4 = 00000000
    sw      $ra, 0x003C($sp)
    sw      s8, 0x0038($sp)
    sw      s7, 0x0034($sp)
    sw      s6, 0x0030($sp)
    sw      s5, 0x002C($sp)
    sw      s3, 0x0024($sp)
    bne     $at, $zero, lbl_800CC950
    sw      s2, 0x0020($sp)
    lui     a0, 0x8011                 # a0 = 80110000
    addiu   a0, a0, 0xA350             # a0 = 8010A350
    or      a1, s4, $zero              # a1 = 00000000
    or      a2, s0, $zero              # a2 = 00000000
    jal     func_800015BC
    or      a3, s1, $zero              # a3 = 00000000
lbl_800CC950:
    sw      $zero, 0x0180($sp)
    sw      s4, 0x0184($sp)
    lw      t7, 0x0000(s0)             # 00000000
    or      s2, $zero, $zero           # s2 = 00000000
    or      s3, s0, $zero              # s3 = 00000000
    addu    t8, t7, s4
    sw      t8, 0x0188($sp)
    lw      t3, 0x0004(s0)             # 00000004
    lui     s8, 0xFFFF                 # s8 = FFFF0000
    lui     s7, 0x0F00                 # s7 = 0F000000
    addu    t4, t8, t3
    sw      t4, 0x018C($sp)
    lw      t1, 0x0010(s0)             # 00000010
    addiu   s6, $sp, 0x0064            # s6 = FFFFFED4
    addiu   s5, $sp, 0x00E4            # s5 = FFFFFF54
    beql    t1, $zero, lbl_800CCB8C
    lw      $ra, 0x003C($sp)
lbl_800CC994:
    lw      v0, 0x0014(s3)             # 00000014
    lui     $at, 0x00FF                # $at = 00FF0000
    ori     $at, $at, 0xFFFF           # $at = 00FFFFFF
    srl     t5, v0, 30
    sll     t6, t5,  2
    and     t8, v0, $at
    addu    t7, $sp, t6
    lui     $at, 0x3F00                # $at = 3F000000
    lw      t7, 0x0180(t7)             # 00000180
    and     v1, v0, $at
    lui     $at, 0x0200                # $at = 02000000
    beq     v1, $at, lbl_800CC9EC
    addu    a0, t7, t8
    lui     $at, 0x0400                # $at = 04000000
    beq     v1, $at, lbl_800CCA38
    lui     $at, 0x0500                # $at = 05000000
    beq     v1, $at, lbl_800CCA84
    lui     $at, 0x0600                # $at = 06000000
    beql    v1, $at, lbl_800CCAC0
    lw      a3, 0x0000(a0)             # 00000000
    b       lbl_800CCB7C
    addiu   s2, s2, 0x0001             # s2 = 00000001
lbl_800CC9EC:
    lw      a3, 0x0000(a0)             # 00000000
    lui     t5, 0x8010                 # t5 = 80100000
    and     t9, a3, s7
    bne     t9, $zero, lbl_800CCA10
    subu    t3, a3, s1
    addu    t4, t3, s4
    sw      t4, 0x0000(a0)             # 00000000
    b       lbl_800CCB78
    lw      t1, 0x0010(s0)             # 00000010
lbl_800CCA10:
    lw      t5, 0x5420(t5)             # 80105420
    lui     a0, 0x8011                 # a0 = 80110000
    addiu   a0, a0, 0xA370             # a0 = 8010A370
    slti    $at, t5, 0x0003
    bnel    $at, $zero, lbl_800CCB7C
    addiu   s2, s2, 0x0001             # s2 = 00000002
    jal     func_800015BC
    subu    a1, a3, s1
    b       lbl_800CCB78
    lw      t1, 0x0010(s0)             # 00000010
lbl_800CCA38:
    lw      a3, 0x0000(a0)             # 00000000
    lui     $at, 0x03FF                # $at = 03FF0000
    ori     $at, $at, 0xFFFF           # $at = 03FFFFFF
    and     t6, a3, $at
    sll     t7, t6,  2
    lui     $at, 0x8000                # $at = 80000000
    or      t8, t7, $at                # t8 = 80000000
    subu    t9, t8, s1
    lui     $at, 0x0FFF                # $at = 0FFF0000
    ori     $at, $at, 0xFFFF           # $at = 0FFFFFFF
    addu    t3, t9, s4
    and     t4, t3, $at
    lui     $at, 0xFC00                # $at = FC000000
    srl     t5, t4,  2
    and     t6, a3, $at
    or      t7, t5, t6                 # t7 = 00000000
    sw      t7, 0x0000(a0)             # 00000000
    b       lbl_800CCB78
    lw      t1, 0x0010(s0)             # 00000010
lbl_800CCA84:
    lw      t8, 0x0000(a0)             # 00000000
    srl     t9, t8, 16
    andi    t3, t9, 0x001F             # t3 = 00000000
    sll     t4, t3,  2
    addu    t5, s5, t4
    sw      a0, 0x0000(t5)             # 00000000
    lw      a3, 0x0000(a0)             # 00000000
    srl     t6, a3, 16
    andi    t7, t6, 0x001F             # t7 = 00000000
    sll     t8, t7,  2
    addu    t9, s6, t8
    sw      a3, 0x0000(t9)             # 00000000
    b       lbl_800CCB78
    lw      t1, 0x0010(s0)             # 00000010
    lw      a3, 0x0000(a0)             # 00000000
lbl_800CCAC0:
    srl     v0, a3, 21
    andi    v0, v0, 0x001F             # v0 = 00000000
    sll     v0, v0,  2
    addu    t3, s5, v0
    lw      v1, 0x0000(t3)             # 00000000
    sll     a1, a3, 16
    sra     a1, a1, 16
    lw      a2, 0x0000(v1)             # 00000000
    addu    t2, s6, v0
    sll     t4, a2, 16
    addu    t0, a1, t4
    and     t5, t0, s7
    bne     t5, $zero, lbl_800CCB54
    lui     t4, 0x8010                 # t4 = 80100000
    lw      t6, 0x0000(t2)             # 00000000
    and     t4, a2, s8
    sll     t7, t6, 16
    addu    t8, a1, t7
    subu    t9, t8, s1
    addu    v0, t9, s4
    andi    t3, v0, 0x8000             # t3 = 00000000
    beq     t3, $zero, lbl_800CCB24
    srl     t5, v0, 16
    b       lbl_800CCB28
    addiu   a1, $zero, 0x0001          # a1 = 00000001
lbl_800CCB24:
    or      a1, $zero, $zero           # a1 = 00000000
lbl_800CCB28:
    andi    t6, t5, 0xFFFF             # t6 = 00000000
    addu    t7, t6, a1
    or      t8, t4, t7                 # t8 = 80100000
    sw      t8, 0x0000(v1)             # 00000000
    lw      t9, 0x0000(a0)             # 00000000
    andi    t5, v0, 0xFFFF             # t5 = 00000000
    and     t3, t9, s8
    or      t6, t3, t5                 # t6 = 00000000
    sw      t6, 0x0000(a0)             # 00000000
    b       lbl_800CCB78
    lw      t1, 0x0010(s0)             # 00000010
lbl_800CCB54:
    lw      t4, 0x5420(t4)             # 80105420
    lui     a0, 0x8011                 # a0 = 80110000
    addiu   a0, a0, 0xA3B0             # a0 = 8010A3B0
    slti    $at, t4, 0x0003
    bnel    $at, $zero, lbl_800CCB7C
    addiu   s2, s2, 0x0001             # s2 = 00000003
    jal     func_800015BC
    subu    a1, t0, s1
    lw      t1, 0x0010(s0)             # 00000010
lbl_800CCB78:
    addiu   s2, s2, 0x0001             # s2 = 00000004
lbl_800CCB7C:
    sltu    $at, s2, t1
    bne     $at, $zero, lbl_800CC994
    addiu   s3, s3, 0x0004             # s3 = 00000004
    lw      $ra, 0x003C($sp)
lbl_800CCB8C:
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
    addiu   $sp, $sp, 0x0190           # $sp += 0x190


func_800CCBB8:
# MqDbg: Overlay_Load
# Dynamic Linking Function (dlf), loads and links overlays
# A0 = File VROM Start
# A1 = File VROM End
# A2 = VRAM Start
# A3 = VRAM End
# SP+0x10 = Ram Start
    lui     v0, 0x8010                 # v0 = 80100000
    lw      v0, 0x5420(v0)             # 80105420
    addiu   $sp, $sp, 0xFFB8           # $sp -= 0x48
    sw      s0, 0x0020($sp)
    slti    $at, v0, 0x0003
    or      s0, a0, $zero              # s0 = 00000000
    sw      $ra, 0x0024($sp)
    sw      a1, 0x004C($sp)
    sw      a2, 0x0050($sp)
    bne     $at, $zero, lbl_800CCBF8
    sw      a3, 0x0054($sp)
    lui     a0, 0x8011                 # a0 = 80110000
    jal     func_800015BC
    addiu   a0, a0, 0xA3DC             # a0 = 8010A3DC
    lui     v0, 0x8010                 # v0 = 80100000
    lw      v0, 0x5420(v0)             # 80105420
lbl_800CCBF8:
    slti    $at, v0, 0x0003
    bne     $at, $zero, lbl_800CCC1C
    lw      a1, 0x0058($sp)
    lw      t6, 0x004C($sp)
    lui     a0, 0x8011                 # a0 = 80110000
    addiu   a0, a0, 0xA414             # a0 = 8010A414
    subu    t7, t6, s0
    jal     func_800015BC
    addu    a2, a1, t7
lbl_800CCC1C:
    lw      t8, 0x004C($sp)
    lw      a0, 0x0058($sp)
    or      a1, s0, $zero              # a1 = 00000000
    subu    a2, t8, s0
    addu    t9, a0, a2
    jal     func_80000DF0
    sw      t9, 0x002C($sp)
    lw      t0, 0x002C($sp)
    lui     v0, 0x8010                 # v0 = 80100000
    lw      v0, 0x5420(v0)             # 80105420
    lw      t1, -0x0004(t0)            # FFFFFFFC
    lui     a0, 0x8011                 # a0 = 80110000
    slti    $at, v0, 0x0003
    bne     $at, $zero, lbl_800CCC7C
    subu    s0, t0, t1
    lw      t2, 0x000C(s0)             # 0000000C
    lw      a1, 0x0000(s0)             # 00000000
    lw      a2, 0x0004(s0)             # 00000004
    lw      a3, 0x0008(s0)             # 00000008
    addiu   a0, a0, 0xA448             # a0 = 8010A448
    jal     func_800015BC
    sw      t2, 0x0010($sp)
    lui     v0, 0x8010                 # v0 = 80100000
    lw      v0, 0x5420(v0)             # 80105420
lbl_800CCC7C:
    slti    $at, v0, 0x0003
    bne     $at, $zero, lbl_800CCC90
    lui     a0, 0x8011                 # a0 = 80110000
    jal     func_800015BC
    addiu   a0, a0, 0xA47C             # a0 = 8010A47C
lbl_800CCC90:
    lw      a0, 0x0058($sp)
    or      a1, s0, $zero              # a1 = 00000000
    jal     func_800CC8F0
    lw      a2, 0x0050($sp)
    lw      a3, 0x000C(s0)             # 0000000C
    lui     t3, 0x8010                 # t3 = 80100000
    beql    a3, $zero, lbl_800CCCE4
    lw      t5, 0x0054($sp)
    lw      t3, 0x5420(t3)             # 80105420
    lw      a1, 0x002C($sp)
    lui     a0, 0x8011                 # a0 = 80110000
    slti    $at, t3, 0x0003
    bne     $at, $zero, lbl_800CCCD4
    addu    a2, a3, a1
    jal     func_800015BC
    addiu   a0, a0, 0xA494             # a0 = 8010A494
    lw      a3, 0x000C(s0)             # 0000000C
lbl_800CCCD4:
    lw      a0, 0x002C($sp)
    jal     func_80002E80              # bzero
    or      a1, a3, $zero              # a1 = 00000000
    lw      t5, 0x0054($sp)
lbl_800CCCE4:
    lw      t6, 0x0050($sp)
    lw      a0, 0x0058($sp)
    subu    s0, t5, t6
    jal     func_80003440              # osWritebackDCache
    or      a1, s0, $zero              # a1 = 00000000
    lw      a0, 0x0058($sp)
    jal     func_800041A0              # osInvalICache
    or      a1, s0, $zero              # a1 = 00000000
    lui     t7, 0x8010                 # t7 = 80100000
    lw      t7, 0x5420(t7)             # 80105420
    lui     a0, 0x8011                 # a0 = 80110000
    slti    $at, t7, 0x0003
    bnel    $at, $zero, lbl_800CCD28
    lw      $ra, 0x0024($sp)
    jal     func_800015BC
    addiu   a0, a0, 0xA4B8             # a0 = 8010A4B8
    lw      $ra, 0x0024($sp)
lbl_800CCD28:
    or      v0, s0, $zero              # v0 = 00000000
    lw      s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0048           # $sp += 0x48


func_800CCD38:
# MqDbg: Overlay_AllocateAndLoad
# Possibly related to mapping an overlay to ram?
# Appears to allocate "Game Context" overlays
# A0 = ROM Start
# A1 = Rom End
# A2 = VRam start
# A3 = VRam end
    addiu   $sp, $sp, 0xFFD8           # $sp -= 0x28
    sw      $ra, 0x001C($sp)
    sw      a0, 0x0028($sp)
    sw      a1, 0x002C($sp)
    sw      a2, 0x0030($sp)
    sw      a3, 0x0034($sp)
    jal     func_800CDA68
    subu    a0, a3, a2
    beq     v0, $zero, lbl_800CCD80
    or      v1, v0, $zero              # v1 = 00000000
    lw      a0, 0x0028($sp)
    lw      a1, 0x002C($sp)
    lw      a2, 0x0030($sp)
    lw      a3, 0x0034($sp)
    sw      v0, 0x0010($sp)
    jal     func_800CCBB8
    sw      v0, 0x0024($sp)
    lw      v1, 0x0024($sp)
lbl_800CCD80:
    lw      $ra, 0x001C($sp)
    addiu   $sp, $sp, 0x0028           # $sp += 0x28
    or      v0, v1, $zero              # v0 = 00000000
    jr      $ra
    nop
    nop
    nop
    nop