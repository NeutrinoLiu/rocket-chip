#define DDR_BASE  0x80000000
#define UART_BASE 0x60000000
#define BRAM_BASE 0x60010000
#define SPI_BASE  0x60020000

.section .text.start, "ax", @progbits
.globl _start
_start:
  csrwi 0x7c1, 0 // disable chicken bits
  li s0, DDR_BASE
  csrr a0, mhartid
  la a1, _dtb
  jr s0

.section .text.hang, "ax", @progbits
.globl _hang
_hang:
  csrwi 0x7c1, 0 // disable chicken bits
  li s0, BRAM_BASE
  csrr a0, mhartid
  la a1, _dtb
  jr s0

.section .rodata.dtb, "a", @progbits
.globl _dtb
.align 5, 0
_dtb:
.ascii "DTB goes here"

