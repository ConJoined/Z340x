#define KERNEL_MAGIC_NUMBER 0x2BADB002

#include "kernel_video.h"

extern "C" void kmain( void* mbd, unsigned int magic )
{
if ( magic != KERNEL_MAGIC_NUMBER )
{
kvideo_write_char('n');
kvideo_write_str((char*)"Dako Attak! The magic number is invalid!");

return;
}


// Locked and Loaded
kvideo_write_char('n');
kvideo_write_str((char*)"[Z340x@live] Welcome to Z340x");
kvideo_write_char('n');
kvideo_write_str((char*)"[Z340x@live] Distrobuted as Z340x by ConJoined, booted live");
}
