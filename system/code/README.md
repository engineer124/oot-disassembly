# Code File (Split)

This directory contains all files composing the massive "code" file which holds the core of the game's execution along with a lot of common external functions used by actors and other game files.

## File Map

| File Name                                              | Short Name / Purpose                 | VRAM Start | VROM Start | Size  |
| ------------------------------------------------------ | ------------------------------------ | :--------: | :--------: | :---: |
| [**En_A_Keep.s**](En_A_Keep.s)                         | Actor En_A_Obj (Gameplay_keep Items) |  800110A0  |   A87000   |  AA0  |
| [**En_Item00.s**](En_Item00.s)                         | Actor En_Item00 (Collectibles)       |  80011B40  |   A87AA0   | 23F0  |
| [**particle.s**](particle.s)                           | Particle Effects                     |  80013F30  |   A89E90   | A690  |
| [**flg_set.s**](flg_set.s)                             | Flag Set                             |  8001E5C0  |   A94520   |  410  |
| [**DLF.s**](DLF.s)                                     | Dynamically Linked File              |  8001E9D0  |   A94930   |  250  |
| [**z_actor.s**](z_actor.s)                             | Actor                                |  8001EC20  |   A94B80   | C540  |
| [**z_actor_dlftbls.s**](z_actor_dlftbls.s)             | Actor Overlay Tables                 |  8002B160  |   ??????   |  200  |
| [**bgcheck.s**](bgcheck.s)                             | Background Check                     |  8002B360  |   AA12C0   | A290  |
| [**camera.s**](camera.s)                               | Camera                               |  800355F0  |   AAB550   | 14820 |
| [**collision_check.s**](collision_check.s)             | Collision Check                      |  80049E10  |   ABFD70   | 7C90  |
| [**code_80051AA0.s**](code_80051AA0.s)                 | Unknown (80051AA0)                   |  80051AA0  |   AC7A00   |  B0   |
| [**debug.s**](debug.s)                                 | Static Context                       |  80051B50  |   AC7AB0   |  310  |
| [**debug_display.s**](debug_display.s)                 | Debugger Display                     |  80051E60  |   AC7DC0   |  4B0  |
| [**z_demo.s**](z_demo.s)                               | Cutscene                             |  80052310  |   AC8270   | 4D20  |
| [**mem.s**](mem.s)                                     | Memory Util                          |  80057030  |   ACCF90   |  90   |
| [**draw.s**](draw.s)                                   | Draw Items                           |  800570C0  |   ACD020   | 1E60  |
| [**code_80058F20.s**](code_80058F20.s)                 | Unknown (80058F20)                   |  80058F20  |   ACEE80   |  1C0  |
| [**elf_message.s**](elf_message.s)                     | Elf_Message                          |  800590E0  |   ACF040   |  6E0  |
| [**mask_reaction.s**](mask_reaction.s)                 | Mask Reaction                        |  800597C0  |   ACF720   |  50   |
| [**env_flag.s**](env_flag.s)                           | Environment Flags                    |  80059810  |   ACF770   |  180  |
| [**fcurve_data_skelanime.s**](fcurve_data_skelanime.s) | FCurve Animation Data                |  80059990  |   ACF8F0   |  A30  |
| [**horse.s**](horse.s)                                 | Horse                                |  8005A3C0  |   AD0320   |  CE0  |
| [**jpeg.s**](jpeg.s)                                   | JPEG                                 |  8005B0A0  |   AD1000   |  7C0  |
| [**code_8005B860.s**](code_8005B860.s)                 | Unknown (8005B860)                   |  8005B860  |   AD17C0   |  430  |
| [**kanfont.s**](kanfont.s)                             | Kanji Font                           |  8005BC90  |   AD1BF0   |  210  |
| [**kankyo.s**](kankyo.s)                               | Kankyo (Environment)                 |  8005BEA0  |   AD1E00   | 7790  |
| [**lib.s**](lib.s)                                     | General Library                      |  80063630  |   AD9590   | 11A0  |
| [**lifemeter.s**](lifemeter.s)                         | Player Health                        |  800647D0  |   ADA730   | 13A0  |
| [**lights.s**](lights.s)                               | Lights                               |  80065B70  |   ADBAD0   | 10A0  |
| [**zelda_alloc.s**](zelda_alloc.s)                     | Game Memory Allocation               |  80066C10  |   ADCB70   |  1E0  |
| [**map_mark.s**](map_mark.s)                           | Map Markers                          |  80066DF0  |   ADCD50   |  650  |
| [**code_80067440.s**](code_80067440.s)                 | Unknown (80067440)                   |  80067440  |   ADD3A0   |  C0   |
| [**code_80067500.s**](code_80067500.s)                 | Unknown (80067500)                   |  80067500  |   ADD460   |  80   |
| [**vector.s**](vector.s)                               | Vector Util                          |  80067580  |   ADD4E0   |  6F0  |
| [**onepointdemo.s**](onepointdemo.s)                   | Single Focus Cutscene                |  80067C70  |   ADDBD0   | 4000  |
| [**map_exp.s**](map_exp.s)                             | Minimap                              |  8006BC70  |   AE1BD0   | 1C70  |
| [**z_parameter.s**](z_parameter.s)                     | Interface, Hud, Items                |  8006D8E0  |   AE3840   | B7D0  |
| [**z_path.s**](z_path.s)                               | Paths                                |  800790B0  |   ??????   |  150  |
| [**z_player_lib.s**](z_player_lib.s)                   | Player Library                       |  80079200  |   AEF160   | 3A30  |
| [**prenmi.s**](prenmi.s)                               | PreNMI                               |  8007CC30  |   AF2B90   | 1010  |
| [**rcp.s**](rcp.s)                                     | Reality Co-Processor                 |  8007DC40  |   AF3BA0   | 1900  |
| [**room.s**](room.s)                                   | Room                                 |  8007F540  |   AF54A0   | 17F0  |
| [**sample.s**](sample.s)                               | Sample                               |  80080D30  |   AF6C90   |  400  |
| [**scene.s**](scene.s)                                 | Scene                                |  80081130  |   AF7090   | 7CC0  |
| [**skelanime.s**](skelanime.s)                         | Animation                            |  80088DF0  |   AFED50   | 4980  |
| [**skin.s**](skin.s)                                   | Skin                                 |  8008D770  |   B036D0   | 2850  |
| [**sram.s**](sram.s)                                   | Save RAM                             |  8008FFC0  |   B05F20   | 1520  |
| [**view.s**](view.s)                                   | VIEW                                 |  800914E0  |   B07440   | 19D0  |
| [**vimode.s**](vimode.s)                               | Video Interface Mode                 |  80092EB0  |   B08E10   | 17B0  |
| [**vr_box.s**](vr_box.s)                               | Skybox                               |  80094660  |   B0A5C0   | 28F0  |
| [**vr_box_draw.s**](vr_box_draw.s)                     | Skybox Draw                          |  80096F50  |   B0CEB0   |  700  |
| [**z_player_call.s**](z_player_call.s)                 | Player Call (Main Functions)         |  80097650  |   B0D5B0   |  170  |
| [**z_fbdemo.s**](z_fbdemo.s)                           | Transition System: Tile (Unused)     |  800977C0  |   ??????   |  A20  |
| [**z_fbdemo_triforce.s**](z_fbdemo_triforce.s)         | Transition System: Triforce (Unused) |  800981E0  |   B0E140   |  5B0  |
| [**z_fbdemo_wipe1.s**](z_fbdemo_wipe1.s)               | Transition System: Wiping            |  80098790  |   ??????   |  470  |
| [**z_fbdemo_circle.s**](z_fbdemo_circle.s)             | Transition System: Circles           |  80098C00  |   ??????   |  6C0  |
| [**z_fbdemo_fade.s**](z_fbdemo_fade.s)                 | Transition System: Fading            |  800992C0  |   ??????   |  360  |
| [**shrink_window.s**](shrink_window.s)                 | Letterboxing                         |  80099620  |   ??????   |  170  |
| [**code_80099790.s**](code_80099790.s)                 | Cutscene Camera Spline               |  80099790  |   ??????   |  4D0  |
| [**kaleido_manager.s**](kaleido_manager.s)             | Pause Screen Manager                 |  80099C60  |   B0FBC0   |  230  |
| [**kaleido_scope_call.s**](kaleido_scope_call.s)       | Pause Screen Call                    |  80099E90  |   B0FDF0   |  2E0  |
| [**play.s**](play.s)                                   | Play                                 |  8009A170  |   B100D0   | 5D50  |
| [**code_8009FEC0.s**](code_8009FEC0.s)                 | Unknown (8009FEC0)                   |  8009FEC0  |   B15E20   |  3D0  |
| [**code_800A0290.s**](code_800A0290.s)                 | Unknown (800A0290)                   |  800A0290  |   B161F0   |  50   |
| [**audioMgr.s**](audioMgr.s)                           | Audio Thread Manager                 |  800A02E0  |   B16240   |  420  |
| [**game.s**](game.s)                                   | Game                                 |  800A0700  |   B16660   |  8F0  |
| [**graph.s**](graph.s)                                 | Graph Thread                         |  800A0FF0  |   B16F50   |  C60  |
| [**main.s**](main.s)                                   | Main Thread                          |  800A1C50  |   B17BB0   |  3B0  |
| [**padmgr.s**](padmgr.s)                               | Control Pad Manager Thread           |  800A2000  |   B17F60   |  B20  |
| [**sched.s**](sched.s)                                 | Scheduler Thread                     |  800A2B20  |   B18A80   |  D90  |
| [**speed_meter.s**](speed_meter.s)                     | Speed Meter                          |  800A38B0  |   B19810   |  A40  |
| [**sys_cfb.s**](sys_cfb.s)                             | System Color Frame Buffer            |  800A42F0  |   B1A250   |  3C0  |
| [**sys_math.s**](sys_math.s)                           | System Math                          |  800A46B0  |   B1A610   | 6000  |
| [**sys_matrix.s**](sys_matrix.s)                       | System Matrix                        |  800AA6B0  |   B20610   | 2400  |
| [**rsp.s**](rsp.s)                                     | Reality Signal Processor Util        |  800ACAB0  |   B22A10   |  50   |
| [**code_800ACB00.s**](code_800ACB00.s)                 | Unknown (800ACB00)                   |  800ACB00  |   B22A60   |  360  |
| [**irqmgr.s**](irqmgr.s)                               | Interrupt Request Manager Thread     |  800ACE60  |   B22DC0   |  5B0  |
| [**code_800AD410.s**](code_800AD410.s)                 | Unknown (800AD410)                   |  800AD410  |   B23370   |  180  |
| [**fault.s**](fault.s)                                 | Crash Debugger Thread                |  800AD590  |   B234F0   | 2200  |
| [**kancode.s**](kancode.s)                             | Kanji Code                           |  800AF790  |   B256F0   |  AF0  |
| [**audio_synthesis.s**](audio_synthesis.s)             | Audio Synthesis                      |  800B0280  |   B261E0   | 3160  |
| [**audio_heap.s**](audio_heap.s)                       | Audio Heap                           |  800B33E0  |   ??????   | 33D0  |
| [**audio_load.s**](audio_load.s)                       | Audio Load                           |  800B67B0  |   ??????   | 3DF0  |
| [**code_800BA5A0.s**](code_800BA5A0.s)                 | Audio Thread                         |  800BA5A0  |   ??????   | 1860  |
| [**code_800BBE00.s**](code_800BBE00.s)                 | Audio DCache                         |  800BBE00  |   ??????   |  80   |
| [**aisetnextbuf.s**](aisetnextbuf.s)                   | Audio Interface: Set Next Buffer     |  800BBE80  |   ??????   |  80   |
| [**audio_playback.s**](audio_playback.s)               | Audio Playback                       |  800BBF00  |   ??????   | 1F80  |
| [**audio_effects.s**](audio_effects.s)                 | Audio Effects                        |  800BDE80  |   ??????   |  A80  |
| [**audio_seqplayer.s**](audio_seqplayer.s)             | Audio Sequence Player                |  800BE900  |   ??????   | 3620  |
| [**code_800C1F20.s**](code_800C1F20.s)                 | Audio External General               |  800C1F20  |   ??????   | 6020  |
| [**code_800C7F40.s**](code_800C7F40.s)                 | Audio External Sfx                   |  800C7F40  |   ??????   | 1E60  |
| [**code_800C9DA0.s**](code_800C9DA0.s)                 | Audio External Sequence              |  800C9DA0  |   ??????   | 1C20  |
| [**text_draw.s**](text_draw.s)                         | Text Draw                            |  800CB9C0  |   B41920   |  C00  |
| [**n64_lib.s**](n64_lib.s)                             | N64 Library                          |  800CC5C0  |   B42520   | 9930  |
| [**message.s**](message.s)                             | Message                              |  800D5EF0  |   B4BE50   | BD00  |
| [**lmap_mark.s**](lmap_mark.s)                         | Minimap Markers                      |  800E1BF0  |   B57B50   | 13D0  |
