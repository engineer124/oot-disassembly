

.section .text
func_800CD8C0:
# MqDbg: floorf
# Floor f32
# F12 = Input
# F0 = Output
    floor.w.s $f12, $f12
    jr      $ra
    cvt.s.w $f0, $f12


func_800CD8CC:
# MqDbg: floor
# Floor f64
# F12 = Input
# F0 = Output
    floor.w.d $f12, $f12
    jr      $ra
    cvt.d.w $f0, $f12


func_800CD8D8:
# MqDbg: lfloorf
# Floor f32
# F12 = Input
# V0 = Output
    floor.w.s $f4, $f12
    mfc1    v0, $f4
    jr      $ra
    nop


func_800CD8E8:
# MqDbg: lfloor
# Floor f64
# F12 = Input
# V0 = Output
    floor.w.d $f4, $f12
    mfc1    v0, $f4
    jr      $ra
    nop


func_800CD8F8:
# MqDbg: ceilf
# Ceiling f32
# F12 = Input
# F0 = Output
    ceil.w.s $f12, $f12
    jr      $ra
    cvt.s.w $f0, $f12


func_800CD904:
# MqDbg: ceil
# Ceiling f64
# F12 = Input
# F0 = Output
    ceil.w.d $f12, $f12
    jr      $ra
    cvt.d.w $f0, $f12


func_800CD910:
# MqDbg: lceilf
# Ceiling f32
# F12 = Input
# V0 = Output
    ceil.w.s $f4, $f12
    mfc1    v0, $f4
    jr      $ra
    nop


func_800CD920:
# MqDbg: lceil
# Ceiling f64
# F12 = Input
# V0 = Output
    ceil.w.d $f4, $f12
    mfc1    v0, $f4
    jr      $ra
    nop


func_800CD930:
# MqDbg: truncf
# Round To Zero f32
# F12 = Input
# F0 = Output
    trunc.w.s $f12, $f12
    jr      $ra
    cvt.s.w $f0, $f12


func_800CD93C:
# MqDbg: trunc
# Round To Zero f64
# F12 = Input
# F0 = Output
    trunc.w.d $f12, $f12
    jr      $ra
    cvt.d.w $f0, $f12


func_800CD948:
# MqDbg: ltruncf
# Round To Zero f32
# F12 = Input
# V0 = Output
    trunc.w.s $f4, $f12
    mfc1    v0, $f4
    jr      $ra
    nop


func_800CD958:
# MqDbg: ltrunc
# Round To Zero f64
# F12 = Input
# V0 = Output
    trunc.w.d $f4, $f12
    mfc1    v0, $f4
    jr      $ra
    nop


func_800CD968:
# MqDbg: nearbyintf
# Round f32
# F12 = Input
# F0 = Output
    round.w.s $f12, $f12
    jr      $ra
    cvt.s.w $f0, $f12


func_800CD974:
# MqDbg: nearbyint
# Round f64
# F12 = Input
# F0 = Output
    round.w.d $f12, $f12
    jr      $ra
    cvt.d.w $f0, $f12


func_800CD980:
# MqDbg: lnearbyintf
# Round f32
# F12 = Input
# V0 = Output
    round.w.s $f4, $f12
    mfc1    v0, $f4
    jr      $ra
    nop


func_800CD990:
# MqDbg: lnearbyint
# Round f64
# F12 = Input
# V0 = Output
    round.w.d $f4, $f12
    mfc1    v0, $f4
    jr      $ra
    nop


func_800CD9A0:
# MqDbg: roundf
# Round f32 (+0.5 then floor)
# F12 = Input
# F0 = Output
    lui     $at, 0x3F00                # $at = 3F000000
    mtc1    $at, $f4                   # $f4 = 0.50
    nop
    add.s   $f0, $f12, $f4
    floor.w.s $f0, $f0
    jr      $ra
    cvt.s.w $f0, $f0


func_800CD9BC:
# MqDbg: round
# Round f64 (+0.5 then floor)
# F12 = Input
# F0 = Output
    lui     $at, 0x3FE0                # $at = 3FE00000
    mtc1    $at, $f5                   # $f5 = 1.75
    mtc1    $zero, $f4                 # $f4 = 0.00
    nop
    add.d   $f0, $f12, $f4
    floor.w.d $f0, $f0
    jr      $ra
    cvt.d.w $f0, $f0


func_800CD9DC:
# MqDbg: lroundf
# Round f32 (+0.5 then floor)
# F12 = Input
# V0 = Output
    lui     $at, 0x3F00                # $at = 3F000000
    mtc1    $at, $f4                   # $f4 = 0.50
    nop
    add.s   $f0, $f12, $f4
    floor.w.s $f0, $f0
    mfc1    v0, $f0
    jr      $ra
    nop


func_800CD9FC:
# MqDbg: lround
# Round f64 (+0.5 then floor)
# F12 = Input
# V0 = Output
    lui     $at, 0x3FE0                # $at = 3FE00000
    mtc1    $at, $f5                   # $f5 = 1.75
    mtc1    $zero, $f4                 # $f4 = 0.00
    nop
    add.d   $f0, $f12, $f4
    floor.w.d $f0, $f0
    mfc1    v0, $f0
    jr      $ra
    nop