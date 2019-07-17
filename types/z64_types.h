#ifndef _Z64_TYPES_H_
#define _Z64_TYPES_H_

#include "ultra_types.h"
#include "os_types.h"

typedef struct z_getfile_t {
  /* 0x00 */ u32            vrom_addr;  // VROM address
  /* 0x04 */ void*          dram_addr;  // DRAM address
  /* 0x08 */ u32            size;       // File size
  /* 0x0C */ char*          filename;   // Filename for debugging
  /* 0x10 */ s32            line;       // Line for debugging
  /* 0x14 */ s32            unk_0x14;
  /* 0x18 */ OSMesgQueue*   notify_mq;  // Message queue for the notification message
  /* 0x1C */ OSMesg         notify_msg; // Completion notification message
  /* 0x20 */
} z_getfile_t;

#endif