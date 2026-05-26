
a.out:	file format elf64-littleaarch64

Sections:
Idx Name               Size     VMA              Type
  0                    00000000 0000000000000000 
  1 .interp            0000001b 0000000000000238 DATA
  2 .note.gnu.build-id 00000024 0000000000000254 
  3 .note.ABI-tag      00000020 0000000000000278 
  4 .gnu.hash          0000001c 0000000000000298 
  5 .dynsym            00000120 00000000000002b8 
  6 .dynstr            00000104 00000000000003d8 
  7 .gnu.version       00000018 00000000000004dc 
  8 .gnu.version_r     00000050 00000000000004f8 
  9 .rela.dyn          000000c0 0000000000000548 
 10 .rela.plt          000000a8 0000000000000608 
 11 .init              00000018 00000000000006b0 TEXT
 12 .plt               00000090 00000000000006d0 TEXT
 13 .text              000003cc 0000000000000780 TEXT
 14 .fini              00000014 0000000000000b4c TEXT
 15 .rodata            000000f9 0000000000000b60 DATA
 16 .eh_frame_hdr      00000044 0000000000000c5c DATA
 17 .eh_frame          00000138 0000000000000ca0 DATA
 18 .init_array        00000008 0000000000011d88 
 19 .fini_array        00000008 0000000000011d90 
 20 .dynamic           00000220 0000000000011d98 
 21 .got               00000030 0000000000011fb8 DATA
 22 .got.plt           00000050 0000000000011fe8 DATA
 23 .data              00000010 0000000000012038 DATA
 24 .bss               00000008 0000000000012048 BSS
 25 .comment           00000083 0000000000000000 
 26 .symtab            000008e8 0000000000000000 
 27 .strtab            000002b9 0000000000000000 
 28 .shstrtab          00000103 0000000000000000 

Disassembly of section .init:

00000000000006b0 <_init>:
     6b0: d503201f     	nop
     6b4: a9bf7bfd     	stp	x29, x30, [sp, #-0x10]!
     6b8: 910003fd     	mov	x29, sp
     6bc: 9400003e     	bl	0x7b4 <call_weak_fn>
     6c0: a8c17bfd     	ldp	x29, x30, [sp], #0x10
     6c4: d65f03c0     	ret

Disassembly of section .plt:

00000000000006d0 <.plt>:
     6d0: a9bf7bf0     	stp	x16, x30, [sp, #-0x10]!
     6d4: b0000090     	adrp	x16, 0x11000 <__FRAME_END__+0x1022c>
     6d8: f947fe11     	ldr	x17, [x16, #0xff8]
     6dc: 913fe210     	add	x16, x16, #0xff8
     6e0: d61f0220     	br	x17
     6e4: d503201f     	nop
     6e8: d503201f     	nop
     6ec: d503201f     	nop

00000000000006f0 <_ZNSt6chrono3_V212system_clock3nowEv@plt>:
     6f0: d0000090     	adrp	x16, 0x12000 <_GLOBAL_OFFSET_TABLE_+0x48>
     6f4: f9400211     	ldr	x17, [x16]
     6f8: 91000210     	add	x16, x16, #0x0
     6fc: d61f0220     	br	x17

0000000000000700 <__cxa_finalize@plt>:
     700: d0000090     	adrp	x16, 0x12000 <_GLOBAL_OFFSET_TABLE_+0x48>
     704: f9400611     	ldr	x17, [x16, #0x8]
     708: 91002210     	add	x16, x16, #0x8
     70c: d61f0220     	br	x17

0000000000000710 <__libc_start_main@plt>:
     710: d0000090     	adrp	x16, 0x12000 <_GLOBAL_OFFSET_TABLE_+0x48>
     714: f9400a11     	ldr	x17, [x16, #0x10]
     718: 91004210     	add	x16, x16, #0x10
     71c: d61f0220     	br	x17

0000000000000720 <strtoull@plt>:
     720: d0000090     	adrp	x16, 0x12000 <_GLOBAL_OFFSET_TABLE_+0x48>
     724: f9400e11     	ldr	x17, [x16, #0x18]
     728: 91006210     	add	x16, x16, #0x18
     72c: d61f0220     	br	x17

0000000000000730 <abort@plt>:
     730: d0000090     	adrp	x16, 0x12000 <_GLOBAL_OFFSET_TABLE_+0x48>
     734: f9401211     	ldr	x17, [x16, #0x20]
     738: 91008210     	add	x16, x16, #0x20
     73c: d61f0220     	br	x17

0000000000000740 <__gmon_start__@plt>:
     740: d0000090     	adrp	x16, 0x12000 <_GLOBAL_OFFSET_TABLE_+0x48>
     744: f9401611     	ldr	x17, [x16, #0x28]
     748: 9100a210     	add	x16, x16, #0x28
     74c: d61f0220     	br	x17

0000000000000750 <printf@plt>:
     750: d0000090     	adrp	x16, 0x12000 <_GLOBAL_OFFSET_TABLE_+0x48>
     754: f9401a11     	ldr	x17, [x16, #0x30]
     758: 9100c210     	add	x16, x16, #0x30
     75c: d61f0220     	br	x17

Disassembly of section .text:

0000000000000780 <_start>:
     780: d503201f     	nop
     784: d280001d     	mov	x29, #0x0               // =0
     788: d280001e     	mov	x30, #0x0               // =0
     78c: aa0003e5     	mov	x5, x0
     790: f94003e1     	ldr	x1, [sp]
     794: 910023e2     	add	x2, sp, #0x8
     798: 910003e6     	mov	x6, sp
     79c: b0000080     	adrp	x0, 0x11000 <__FRAME_END__+0x1022c>
     7a0: f947e000     	ldr	x0, [x0, #0xfc0]
     7a4: d2800003     	mov	x3, #0x0                // =0
     7a8: d2800004     	mov	x4, #0x0                // =0
     7ac: 97ffffd9     	bl	0x710 <__libc_start_main@plt>
     7b0: 97ffffe0     	bl	0x730 <abort@plt>

00000000000007b4 <call_weak_fn>:
     7b4: b0000080     	adrp	x0, 0x11000 <__FRAME_END__+0x1022c>
     7b8: f947ec00     	ldr	x0, [x0, #0xfd8]
     7bc: b4000040     	cbz	x0, 0x7c4 <call_weak_fn+0x10>
     7c0: 17ffffe0     	b	0x740 <__gmon_start__@plt>
     7c4: d65f03c0     	ret
     7c8: d503201f     	nop
     7cc: d503201f     	nop

00000000000007d0 <deregister_tm_clones>:
     7d0: d0000080     	adrp	x0, 0x12000 <_GLOBAL_OFFSET_TABLE_+0x48>
     7d4: 91012000     	add	x0, x0, #0x48
     7d8: d0000081     	adrp	x1, 0x12000 <_GLOBAL_OFFSET_TABLE_+0x48>
     7dc: 91012021     	add	x1, x1, #0x48
     7e0: eb00003f     	cmp	x1, x0
     7e4: 540000c0     	b.eq	0x7fc <deregister_tm_clones+0x2c>
     7e8: b0000081     	adrp	x1, 0x11000 <__FRAME_END__+0x1022c>
     7ec: f947e821     	ldr	x1, [x1, #0xfd0]
     7f0: b4000061     	cbz	x1, 0x7fc <deregister_tm_clones+0x2c>
     7f4: aa0103f0     	mov	x16, x1
     7f8: d61f0200     	br	x16
     7fc: d65f03c0     	ret

0000000000000800 <register_tm_clones>:
     800: d0000080     	adrp	x0, 0x12000 <_GLOBAL_OFFSET_TABLE_+0x48>
     804: 91012000     	add	x0, x0, #0x48
     808: d0000081     	adrp	x1, 0x12000 <_GLOBAL_OFFSET_TABLE_+0x48>
     80c: 91012021     	add	x1, x1, #0x48
     810: cb000021     	sub	x1, x1, x0
     814: d37ffc22     	lsr	x2, x1, #63
     818: 8b810c41     	add	x1, x2, x1, asr #3
     81c: 9341fc21     	asr	x1, x1, #1
     820: b40000c1     	cbz	x1, 0x838 <register_tm_clones+0x38>
     824: b0000082     	adrp	x2, 0x11000 <__FRAME_END__+0x1022c>
     828: f947f042     	ldr	x2, [x2, #0xfe0]
     82c: b4000062     	cbz	x2, 0x838 <register_tm_clones+0x38>
     830: aa0203f0     	mov	x16, x2
     834: d61f0200     	br	x16
     838: d65f03c0     	ret
     83c: d503201f     	nop

0000000000000840 <__do_global_dtors_aux>:
     840: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
     844: 910003fd     	mov	x29, sp
     848: f9000bf3     	str	x19, [sp, #0x10]
     84c: d0000093     	adrp	x19, 0x12000 <_GLOBAL_OFFSET_TABLE_+0x48>
     850: 39412260     	ldrb	w0, [x19, #0x48]
     854: 35000140     	cbnz	w0, 0x87c <__do_global_dtors_aux+0x3c>
     858: b0000080     	adrp	x0, 0x11000 <__FRAME_END__+0x1022c>
     85c: f947e400     	ldr	x0, [x0, #0xfc8]
     860: b4000080     	cbz	x0, 0x870 <__do_global_dtors_aux+0x30>
     864: d0000080     	adrp	x0, 0x12000 <_GLOBAL_OFFSET_TABLE_+0x48>
     868: f9402000     	ldr	x0, [x0, #0x40]
     86c: 97ffffa5     	bl	0x700 <__cxa_finalize@plt>
     870: 97ffffd8     	bl	0x7d0 <deregister_tm_clones>
     874: 52800020     	mov	w0, #0x1                // =1
     878: 39012260     	strb	w0, [x19, #0x48]
     87c: f9400bf3     	ldr	x19, [sp, #0x10]
     880: a8c27bfd     	ldp	x29, x30, [sp], #0x20
     884: d65f03c0     	ret
     888: d503201f     	nop
     88c: d503201f     	nop

0000000000000890 <frame_dummy>:
     890: 17ffffdc     	b	0x800 <register_tm_clones>

0000000000000894 <main>:
     894: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
     898: a9014ff4     	stp	x20, x19, [sp, #0x10]
     89c: 910003fd     	mov	x29, sp
     8a0: d10383e9     	sub	x9, sp, #0xe0
     8a4: 927ae53f     	and	sp, x9, #0xffffffffffffffc0
     8a8: 7100081f     	cmp	w0, #0x2
     8ac: 5400018b     	b.lt	0x8dc <main+0x48>
     8b0: 2a0003f4     	mov	w20, w0
     8b4: f9400420     	ldr	x0, [x1, #0x8]
     8b8: aa0103f3     	mov	x19, x1
     8bc: aa1f03e1     	mov	x1, xzr
     8c0: 52800142     	mov	w2, #0xa                // =10
     8c4: 97ffff97     	bl	0x720 <strtoull@plt>
     8c8: 71000a9f     	cmp	w20, #0x2
     8cc: 54000121     	b.ne	0x8f0 <main+0x5c>
     8d0: 2a1f03e8     	mov	w8, wzr
     8d4: b5000240     	cbnz	x0, 0x91c <main+0x88>
     8d8: 1400002f     	b	0x994 <main+0x100>
     8dc: 52994000     	mov	w0, #0xca00             // =51712
     8e0: 2a1f03e8     	mov	w8, wzr
     8e4: 72a77340     	movk	w0, #0x3b9a, lsl #16
     8e8: b50001a0     	cbnz	x0, 0x91c <main+0x88>
     8ec: 1400002a     	b	0x994 <main+0x100>
     8f0: f9400a68     	ldr	x8, [x19, #0x10]
     8f4: aa0003f3     	mov	x19, x0
     8f8: aa1f03e1     	mov	x1, xzr
     8fc: 52800142     	mov	w2, #0xa                // =10
     900: aa0803e0     	mov	x0, x8
     904: 97ffff87     	bl	0x720 <strtoull@plt>
     908: aa0003e8     	mov	x8, x0
     90c: aa1303e0     	mov	x0, x19
     910: f100011f     	cmp	x8, #0x0
     914: 1a9f17e8     	cset	w8, eq
     918: b40003f3     	cbz	x19, 0x994 <main+0x100>
     91c: 350003c8     	cbnz	w8, 0x994 <main+0x100>
     920: 90000008     	adrp	x8, 0x0 <strtoull@GLIBC_2.17>
     924: 910203e1     	add	x1, sp, #0x80
     928: 910103e2     	add	x2, sp, #0x40
     92c: 3dc2dd00     	ldr	q0, [x8, #0xb70]
     930: 90000008     	adrp	x8, 0x0 <strtoull@GLIBC_2.17>
     934: 9100e3e3     	add	x3, sp, #0x38
     938: 3dc2e501     	ldr	q1, [x8, #0xb90]
     93c: 90000008     	adrp	x8, 0x0 <strtoull@GLIBC_2.17>
     940: 3dc2e102     	ldr	q2, [x8, #0xb80]
     944: 90000008     	adrp	x8, 0x0 <strtoull@GLIBC_2.17>
     948: ad0407e0     	stp	q0, q1, [sp, #0x80]
     94c: 3dc2e900     	ldr	q0, [x8, #0xba0]
     950: 90000008     	adrp	x8, 0x0 <strtoull@GLIBC_2.17>
     954: 3dc2ed01     	ldr	q1, [x8, #0xbb0]
     958: 90000008     	adrp	x8, 0x0 <strtoull@GLIBC_2.17>
     95c: ad0203e2     	stp	q2, q0, [sp, #0x40]
     960: 3dc2f500     	ldr	q0, [x8, #0xbd0]
     964: 90000008     	adrp	x8, 0x0 <strtoull@GLIBC_2.17>
     968: 3dc2f102     	ldr	q2, [x8, #0xbc0]
     96c: 90000008     	adrp	x8, 0x0 <strtoull@GLIBC_2.17>
     970: ad0503e1     	stp	q1, q0, [sp, #0xa0]
     974: 3dc2f900     	ldr	q0, [x8, #0xbe0]
     978: ad0303e2     	stp	q2, q0, [sp, #0x60]
     97c: 9400000e     	bl	0x9b4 <_ZN12_GLOBAL__N_114run_fmopa_loopEmPKdS1_Pd>
     980: 2a1f03e0     	mov	w0, wzr
     984: 910003bf     	mov	sp, x29
     988: a9414ff4     	ldp	x20, x19, [sp, #0x10]
     98c: a8c27bfd     	ldp	x29, x30, [sp], #0x20
     990: d65f03c0     	ret
     994: 90000000     	adrp	x0, 0x0 <strtoull@GLIBC_2.17>
     998: 912fc000     	add	x0, x0, #0xbf0
     99c: 97ffff6d     	bl	0x750 <printf@plt>
     9a0: 52800020     	mov	w0, #0x1                // =1
     9a4: 910003bf     	mov	sp, x29
     9a8: a9414ff4     	ldp	x20, x19, [sp, #0x10]
     9ac: a8c27bfd     	ldp	x29, x30, [sp], #0x20
     9b0: d65f03c0     	ret

00000000000009b4 <_ZN12_GLOBAL__N_114run_fmopa_loopEmPKdS1_Pd>:
     9b4: 6db93bef     	stp	d15, d14, [sp, #-0x70]!
     9b8: 6d0133ed     	stp	d13, d12, [sp, #0x10]
     9bc: 6d022beb     	stp	d11, d10, [sp, #0x20]
     9c0: 6d0323e9     	stp	d9, d8, [sp, #0x30]
     9c4: a9047bfd     	stp	x29, x30, [sp, #0x40]
     9c8: a90557fc     	stp	x28, x21, [sp, #0x50]
     9cc: a9064ff4     	stp	x20, x19, [sp, #0x60]
     9d0: 910103fd     	add	x29, sp, #0x40
     9d4: d10243e9     	sub	x9, sp, #0x90
     9d8: 04295f49     	addsvl	x9, x9, #-0x6
     9dc: 927ae53f     	and	sp, x9, #0xffffffffffffffc0
     9e0: aa0303f3     	mov	x19, x3
     9e4: aa0003f4     	mov	x20, x0
     9e8: d503437f     	smstart	sm
     9ec: 25d8e3e0     	ptrue	p0.d
     9f0: d10103a8     	sub	x8, x29, #0x40
     9f4: a5e0a020     	ld1d	{ z0.d }, p0/z, [x1]
     9f8: e5bf1d00     	str	p0, [x8, #-0x1, mul vl]
     9fc: e5bf5900     	str	z0, [x8, #-0x2, mul vl]
     a00: a5e0a040     	ld1d	{ z0.d }, p0/z, [x2]
     a04: e5bf5500     	str	z0, [x8, #-0x3, mul vl]
     a08: a5e1a040     	ld1d	{ z0.d }, p0/z, [x2, #0x1, mul vl]
     a0c: e5bf5100     	str	z0, [x8, #-0x4, mul vl]
     a10: a5e2a040     	ld1d	{ z0.d }, p0/z, [x2, #0x2, mul vl]
     a14: e5bf4d00     	str	z0, [x8, #-0x5, mul vl]
     a18: a5e3a040     	ld1d	{ z0.d }, p0/z, [x2, #0x3, mul vl]
     a1c: e5bf4900     	str	z0, [x8, #-0x6, mul vl]
     a20: d503427f     	smstop	sm
     a24: 97ffff33     	bl	0x6f0 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
     a28: aa0003f5     	mov	x21, x0
     a2c: d503437f     	smstart	sm
     a30: d10103a8     	sub	x8, x29, #0x40
     a34: 85bf4904     	ldr	z4, [x8, #-0x6, mul vl]
     a38: 85bf4d03     	ldr	z3, [x8, #-0x5, mul vl]
     a3c: 85bf5102     	ldr	z2, [x8, #-0x4, mul vl]
     a40: 85bf5501     	ldr	z1, [x8, #-0x3, mul vl]
     a44: 85bf5900     	ldr	z0, [x8, #-0x2, mul vl]
     a48: 85bf1d00     	ldr	p0, [x8, #-0x1, mul vl]
     a4c: aa1403e8     	mov	x8, x20
     a50: 80c10000     	fmopa	za0.d, p0/m, p0/m, z0.d, z1.d
     a54: 80c20001     	fmopa	za1.d, p0/m, p0/m, z0.d, z2.d
     a58: 80c30002     	fmopa	za2.d, p0/m, p0/m, z0.d, z3.d
     a5c: 80c40003     	fmopa	za3.d, p0/m, p0/m, z0.d, z4.d
     a60: f1000508     	subs	x8, x8, #0x1
     a64: 54ffff61     	b.ne	0xa50 <_ZN12_GLOBAL__N_114run_fmopa_loopEmPKdS1_Pd+0x9c>
     a68: d503427f     	smstop	sm
     a6c: 97ffff21     	bl	0x6f0 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
     a70: d503437f     	smstart	sm
     a74: 9e630280     	ucvtf	d0, x20
     a78: d2e81008     	mov	x8, #0x4080000000000000 // =4647714815446351872
     a7c: cb150009     	sub	x9, x0, x21
     a80: 9e670101     	fmov	d1, x8
     a84: 9e620122     	scvtf	d2, x9
     a88: d2d09008     	mov	x8, #0x848000000000     // =145685290680320
     a8c: f2e825c8     	movk	x8, #0x412e, lsl #48
     a90: 90000000     	adrp	x0, 0x0 <strtoull@GLIBC_2.17>
     a94: 91308000     	add	x0, x0, #0xc20
     a98: 1e610800     	fmul	d0, d0, d1
     a9c: 1e621801     	fdiv	d1, d0, d2
     aa0: 9e670100     	fmov	d0, x8
     aa4: d2d9aca8     	mov	x8, #0xcd6500000000     // =225833675390976
     aa8: f2e839a8     	movk	x8, #0x41cd, lsl #48
     aac: 1e601842     	fdiv	d2, d2, d0
     ab0: 9e670100     	fmov	d0, x8
     ab4: 1e601820     	fdiv	d0, d1, d0
     ab8: fd0017e2     	str	d2, [sp, #0x28]
     abc: 6d0307e0     	stp	d0, d1, [sp, #0x30]
     ac0: d503427f     	smstop	sm
     ac4: 6d4287e0     	ldp	d0, d1, [sp, #0x28]
     ac8: fd401fe2     	ldr	d2, [sp, #0x38]
     acc: 97ffff21     	bl	0x750 <printf@plt>
     ad0: d503437f     	smstart	sm
     ad4: d10103a8     	sub	x8, x29, #0x40
     ad8: 2a1f03ec     	mov	w12, wzr
     adc: 9e6703e1     	fmov	d1, xzr
     ae0: 85bf1d00     	ldr	p0, [x8, #-0x1, mul vl]
     ae4: 910103e8     	add	x8, sp, #0x40
     ae8: c0c20000     	mov	z0.d, p0/m, za0h.d[w12, 0]
     aec: e5e0e100     	st1d	{ z0.d }, p0, [x8]
     af0: 6d440be0     	ldp	d0, d2, [sp, #0x40]
     af4: 1e612800     	fadd	d0, d0, d1
     af8: 1e622800     	fadd	d0, d0, d2
     afc: 6d450be1     	ldp	d1, d2, [sp, #0x50]
     b00: 1e612800     	fadd	d0, d0, d1
     b04: 1e622800     	fadd	d0, d0, d2
     b08: 6d460be1     	ldp	d1, d2, [sp, #0x60]
     b0c: 1e612800     	fadd	d0, d0, d1
     b10: 1e622800     	fadd	d0, d0, d2
     b14: 6d470be1     	ldp	d1, d2, [sp, #0x70]
     b18: 1e612800     	fadd	d0, d0, d1
     b1c: 1e622800     	fadd	d0, d0, d2
     b20: fd000260     	str	d0, [x19]
     b24: d503427f     	smstop	sm
     b28: d10103bf     	sub	sp, x29, #0x40
     b2c: a9464ff4     	ldp	x20, x19, [sp, #0x60]
     b30: a94557fc     	ldp	x28, x21, [sp, #0x50]
     b34: a9447bfd     	ldp	x29, x30, [sp, #0x40]
     b38: 6d4323e9     	ldp	d9, d8, [sp, #0x30]
     b3c: 6d422beb     	ldp	d11, d10, [sp, #0x20]
     b40: 6d4133ed     	ldp	d13, d12, [sp, #0x10]
     b44: 6cc73bef     	ldp	d15, d14, [sp], #0x70
     b48: d65f03c0     	ret

Disassembly of section .fini:

0000000000000b4c <_fini>:
     b4c: d503201f     	nop
     b50: a9bf7bfd     	stp	x29, x30, [sp, #-0x10]!
     b54: 910003fd     	mov	x29, sp
     b58: a8c17bfd     	ldp	x29, x30, [sp], #0x10
     b5c: d65f03c0     	ret
