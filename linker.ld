OUTPUT_ARCH( "riscv" )
ENTRY( _start )

SECTIONS
{
  /*
   * ensure that entry.S / _entry is at 0x80000000,
   * where qemu's -kernel jumps.
   */
  . = 0x80000000;
  .text :
  {
    *(.text)
    . = ALIGN(0x1000);
  }

  . = ALIGN(0x1000);
  PROVIDE(etext = .);
/*
   * make sure end is after data and bss.
   */
  .data : {
    *(.data)
  }
  .bss : {
    *(.bss)
    *(.sbss*)
     PROVIDE(end = .);
  }
  . = . + 0x4000;
  PROVIDE(__stack_top = .);
 }
