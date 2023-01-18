

.section .text
func_800CC5C0:
# MqDbg: RcpUtils_PrintRegisterStatus
    addiu   $sp, $sp, 0xFFE0           # $sp -= 0x20
    sw      $ra, 0x0014($sp)
    jal     func_800D5A80              # __osSpGetStatus
    nop
    jal     func_800D2AF0              # __osDpGetStatus
    sw      v0, 0x001C($sp)
    lui     a0, 0x8011                 # a0 = 80110000
    sw      v0, 0x0018($sp)
    addiu   a0, a0, 0xA200             # a0 = 8010A200
    jal     func_800015BC
    lw      a1, 0x001C($sp)
    lw      t6, 0x001C($sp)
    andi    t7, t6, 0x0001             # t7 = 00000000
    beq     t7, $zero, lbl_800CC604
    lui     a0, 0x8011                 # a0 = 80110000
    jal     func_800015BC
    addiu   a0, a0, 0xA218             # a0 = 8010A218
lbl_800CC604:
    lw      t8, 0x001C($sp)
    andi    t9, t8, 0x0002             # t9 = 00000000
    beq     t9, $zero, lbl_800CC61C
    lui     a0, 0x8011                 # a0 = 80110000
    jal     func_800015BC
    addiu   a0, a0, 0xA220             # a0 = 8010A220
lbl_800CC61C:
    lw      t0, 0x001C($sp)
    andi    t1, t0, 0x0004             # t1 = 00000000
    beq     t1, $zero, lbl_800CC634
    lui     a0, 0x8011                 # a0 = 80110000
    jal     func_800015BC
    addiu   a0, a0, 0xA228             # a0 = 8010A228
lbl_800CC634:
    lw      t2, 0x001C($sp)
    andi    t3, t2, 0x0008             # t3 = 00000000
    beq     t3, $zero, lbl_800CC64C
    lui     a0, 0x8011                 # a0 = 80110000
    jal     func_800015BC
    addiu   a0, a0, 0xA234             # a0 = 8010A234
lbl_800CC64C:
    lw      t4, 0x001C($sp)
    andi    t5, t4, 0x0010             # t5 = 00000000
    beq     t5, $zero, lbl_800CC664
    lui     a0, 0x8011                 # a0 = 80110000
    jal     func_800015BC
    addiu   a0, a0, 0xA240             # a0 = 8010A240
lbl_800CC664:
    lw      t6, 0x001C($sp)
    andi    t7, t6, 0x0020             # t7 = 00000000
    beq     t7, $zero, lbl_800CC67C
    lui     a0, 0x8011                 # a0 = 80110000
    jal     func_800015BC
    addiu   a0, a0, 0xA24C             # a0 = 8010A24C
lbl_800CC67C:
    lw      t8, 0x001C($sp)
    andi    t9, t8, 0x0040             # t9 = 00000000
    beq     t9, $zero, lbl_800CC694
    lui     a0, 0x8011                 # a0 = 80110000
    jal     func_800015BC
    addiu   a0, a0, 0xA254             # a0 = 8010A254
lbl_800CC694:
    lw      t0, 0x001C($sp)
    andi    t1, t0, 0x0080             # t1 = 00000000
    beq     t1, $zero, lbl_800CC6AC
    lui     a0, 0x8011                 # a0 = 80110000
    jal     func_800015BC
    addiu   a0, a0, 0xA260             # a0 = 8010A260
lbl_800CC6AC:
    lw      t2, 0x001C($sp)
    andi    t3, t2, 0x0100             # t3 = 00000000
    beq     t3, $zero, lbl_800CC6C4
    lui     a0, 0x8011                 # a0 = 80110000
    jal     func_800015BC
    addiu   a0, a0, 0xA268             # a0 = 8010A268
lbl_800CC6C4:
    lw      t4, 0x001C($sp)
    andi    t5, t4, 0x0200             # t5 = 00000000
    beq     t5, $zero, lbl_800CC6DC
    lui     a0, 0x8011                 # a0 = 80110000
    jal     func_800015BC
    addiu   a0, a0, 0xA274             # a0 = 8010A274
lbl_800CC6DC:
    lw      t6, 0x001C($sp)
    andi    t7, t6, 0x0400             # t7 = 00000000
    beq     t7, $zero, lbl_800CC6F4
    lui     a0, 0x8011                 # a0 = 80110000
    jal     func_800015BC
    addiu   a0, a0, 0xA280             # a0 = 8010A280
lbl_800CC6F4:
    lw      t8, 0x001C($sp)
    andi    t9, t8, 0x0800             # t9 = 00000000
    beq     t9, $zero, lbl_800CC70C
    lui     a0, 0x8011                 # a0 = 80110000
    jal     func_800015BC
    addiu   a0, a0, 0xA288             # a0 = 8010A288
lbl_800CC70C:
    lw      t0, 0x001C($sp)
    andi    t1, t0, 0x1000             # t1 = 00000000
    beq     t1, $zero, lbl_800CC724
    lui     a0, 0x8011                 # a0 = 80110000
    jal     func_800015BC
    addiu   a0, a0, 0xA290             # a0 = 8010A290
lbl_800CC724:
    lw      t2, 0x001C($sp)
    andi    t3, t2, 0x2000             # t3 = 00000000
    beq     t3, $zero, lbl_800CC73C
    lui     a0, 0x8011                 # a0 = 80110000
    jal     func_800015BC
    addiu   a0, a0, 0xA298             # a0 = 8010A298
lbl_800CC73C:
    lw      t4, 0x001C($sp)
    andi    t5, t4, 0x4000             # t5 = 00000000
    beq     t5, $zero, lbl_800CC754
    lui     a0, 0x8011                 # a0 = 80110000
    jal     func_800015BC
    addiu   a0, a0, 0xA2A0             # a0 = 8010A2A0
lbl_800CC754:
    lui     a0, 0x8011                 # a0 = 80110000
    jal     func_800015BC
    addiu   a0, a0, 0xA2A8             # a0 = 8010A2A8
    lui     a0, 0x8011                 # a0 = 80110000
    addiu   a0, a0, 0xA2AC             # a0 = 8010A2AC
    jal     func_800015BC
    lw      a1, 0x0018($sp)
    lw      t6, 0x0018($sp)
    andi    t7, t6, 0x0001             # t7 = 00000000
    beq     t7, $zero, lbl_800CC788
    lui     a0, 0x8011                 # a0 = 80110000
    jal     func_800015BC
    addiu   a0, a0, 0xA2C0             # a0 = 8010A2C0
lbl_800CC788:
    lw      t8, 0x0018($sp)
    andi    t9, t8, 0x0002             # t9 = 00000000
    beq     t9, $zero, lbl_800CC7A0
    lui     a0, 0x8011                 # a0 = 80110000
    jal     func_800015BC
    addiu   a0, a0, 0xA2D0             # a0 = 8010A2D0
lbl_800CC7A0:
    lw      t0, 0x0018($sp)
    lui     a0, 0x8011                 # a0 = 80110000
    andi    t1, t0, 0x0004             # t1 = 00000000
    beql    t1, $zero, lbl_800CC7C0
    lw      t2, 0x0018($sp)
    jal     func_800015BC
    addiu   a0, a0, 0xA2D8             # a0 = 8010A2D8
    lw      t2, 0x0018($sp)
lbl_800CC7C0:
    lui     a0, 0x8011                 # a0 = 80110000
    andi    t3, t2, 0x0008             # t3 = 00000000
    beql    t3, $zero, lbl_800CC7DC
    lw      t4, 0x0018($sp)
    jal     func_800015BC
    addiu   a0, a0, 0xA2E0             # a0 = 8010A2E0
    lw      t4, 0x0018($sp)
lbl_800CC7DC:
    lui     a0, 0x8011                 # a0 = 80110000
    andi    t5, t4, 0x0010             # t5 = 00000000
    beql    t5, $zero, lbl_800CC7F8
    lw      t6, 0x0018($sp)
    jal     func_800015BC
    addiu   a0, a0, 0xA2EC             # a0 = 8010A2EC
    lw      t6, 0x0018($sp)
lbl_800CC7F8:
    lui     a0, 0x8011                 # a0 = 80110000
    andi    t7, t6, 0x0020             # t7 = 00000000
    beql    t7, $zero, lbl_800CC814
    lw      t8, 0x0018($sp)
    jal     func_800015BC
    addiu   a0, a0, 0xA2F8             # a0 = 8010A2F8
    lw      t8, 0x0018($sp)
lbl_800CC814:
    lui     a0, 0x8011                 # a0 = 80110000
    andi    t9, t8, 0x0040             # t9 = 00000000
    beql    t9, $zero, lbl_800CC830
    lw      t0, 0x0018($sp)
    jal     func_800015BC
    addiu   a0, a0, 0xA304             # a0 = 8010A304
    lw      t0, 0x0018($sp)
lbl_800CC830:
    lui     a0, 0x8011                 # a0 = 80110000
    andi    t1, t0, 0x0080             # t1 = 00000000
    beql    t1, $zero, lbl_800CC84C
    lw      t2, 0x0018($sp)
    jal     func_800015BC
    addiu   a0, a0, 0xA310             # a0 = 8010A310
    lw      t2, 0x0018($sp)
lbl_800CC84C:
    lui     a0, 0x8011                 # a0 = 80110000
    andi    t3, t2, 0x0100             # t3 = 00000000
    beql    t3, $zero, lbl_800CC868
    lw      t4, 0x0018($sp)
    jal     func_800015BC
    addiu   a0, a0, 0xA31C             # a0 = 8010A31C
    lw      t4, 0x0018($sp)
lbl_800CC868:
    lui     a0, 0x8011                 # a0 = 80110000
    andi    t5, t4, 0x0200             # t5 = 00000000
    beql    t5, $zero, lbl_800CC884
    lw      t6, 0x0018($sp)
    jal     func_800015BC
    addiu   a0, a0, 0xA328             # a0 = 8010A328
    lw      t6, 0x0018($sp)
lbl_800CC884:
    lui     a0, 0x8011                 # a0 = 80110000
    andi    t7, t6, 0x0400             # t7 = 00000000
    beq     t7, $zero, lbl_800CC89C
    nop
    jal     func_800015BC
    addiu   a0, a0, 0xA334             # a0 = 8010A334
lbl_800CC89C:
    lui     a0, 0x8011                 # a0 = 80110000
    jal     func_800015BC
    addiu   a0, a0, 0xA344             # a0 = 8010A344
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0020           # $sp += 0x20
    jr      $ra
    nop


func_800CC8B8:
# MqDbg: RcpUtils_Reset
    addiu   $sp, $sp, 0xFFE8           # $sp -= 0x18
    sw      $ra, 0x0014($sp)
    jal     func_800CC5C0
    nop
    jal     func_800D2B00              # __osDpSetStatus
    addiu   a0, $zero, 0x0028          # a0 = 00000028
    jal     func_800D5A90              # __osSpSetStatus
    addiu   a0, $zero, 0x4082          # a0 = 00004082
    jal     func_800CC5C0
    nop
    lw      $ra, 0x0014($sp)
    addiu   $sp, $sp, 0x0018           # $sp += 0x18
    jr      $ra
    nop
