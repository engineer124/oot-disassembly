# Audio Interface: Set Next Buffer
#
# Starts at VRAM: 800BBE80 / VROM: ??????
#

.section .text
func_800BBE80:
# MqDbg: 
# s32 osAiSetNextBuffer(void* vaddr, u32 nbytes)
# Sets up DMA transfer from RDRAM to the audio interface buffer
# A0 = RDRAM virtual address (64-bit aligned)
# A1 = u32 number of bytes to transfer (multiple of 8 bytes)
# V0 = 0 if success, else -1 (if the interface is busy)
    lui     t6, 0x8010                 # t6 = 80100000
    lbu     t6, 0x1810(t6)             # 80101810
    addu    t7, a0, a1
    or      v1, a0, $zero              # v1 = 00000000
    beq     t6, $zero, lbl_800BBE9C
    andi    t8, t7, 0x1FFF             # t8 = 00000000
    addiu   v1, a0, 0xE000             # v1 = FFFFE000
lbl_800BBE9C:
    bne     t8, $zero, lbl_800BBEB4
    lui     t0, 0xA450                 # t0 = A4500000
    addiu   t9, $zero, 0x0001          # t9 = 00000001
    lui     $at, 0x8010                # $at = 80100000
    b       lbl_800BBEBC
    sb      t9, 0x1810($at)            # 80101810
lbl_800BBEB4:
    lui     $at, 0x8010                # $at = 80100000
    sb      $zero, 0x1810($at)         # 80101810
lbl_800BBEBC:
    lw      v0, 0x000C(t0)             # A450000C
    lui     $at, 0x8000                # $at = 80000000
    addu    t2, v1, $at
    sll     t1, v0,  0
    bgez    t1, lbl_800BBEDC
    lui     t3, 0xA450                 # t3 = A4500000
    jr      $ra
    addiu   v0, $zero, 0xFFFF          # v0 = FFFFFFFF
lbl_800BBEDC:
    sw      t2, 0x0000(t3)             # A4500000
    lui     t4, 0xA450                 # t4 = A4500000
    sw      a1, 0x0004(t4)             # A4500004
    or      v0, $zero, $zero           # v0 = 00000000
    jr      $ra
    nop
    nop
    nop
    nop
    
