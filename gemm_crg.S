
gemm_crg:	file format elf64-littleaarch64

Disassembly of section .init:

00000000000008e8 <_init>:
     8e8: d503201f     	nop
     8ec: a9bf7bfd     	stp	x29, x30, [sp, #-0x10]!
     8f0: 910003fd     	mov	x29, sp
     8f4: 94000050     	bl	0xa34 <call_weak_fn>
     8f8: a8c17bfd     	ldp	x29, x30, [sp], #0x10
     8fc: d65f03c0     	ret

Disassembly of section .plt:

0000000000000900 <.plt>:
     900: a9bf7bf0     	stp	x16, x30, [sp, #-0x10]!
     904: f0000090     	adrp	x16, 0x13000 <__FRAME_END__+0x100f0>
     908: f947fe11     	ldr	x17, [x16, #0xff8]
     90c: 913fe210     	add	x16, x16, #0xff8
     910: d61f0220     	br	x17
     914: d503201f     	nop
     918: d503201f     	nop
     91c: d503201f     	nop

0000000000000920 <_Znam@plt>:
     920: 900000b0     	adrp	x16, 0x14000 <_GLOBAL_OFFSET_TABLE_+0x48>
     924: f9400211     	ldr	x17, [x16]
     928: 91000210     	add	x16, x16, #0x0
     92c: d61f0220     	br	x17

0000000000000930 <__kmpc_for_static_fini@plt>:
     930: 900000b0     	adrp	x16, 0x14000 <_GLOBAL_OFFSET_TABLE_+0x48>
     934: f9400611     	ldr	x17, [x16, #0x8]
     938: 91002210     	add	x16, x16, #0x8
     93c: d61f0220     	br	x17

0000000000000940 <_ZNSt6chrono3_V212system_clock3nowEv@plt>:
     940: 900000b0     	adrp	x16, 0x14000 <_GLOBAL_OFFSET_TABLE_+0x48>
     944: f9400a11     	ldr	x17, [x16, #0x10]
     948: 91004210     	add	x16, x16, #0x10
     94c: d61f0220     	br	x17

0000000000000950 <puts@plt>:
     950: 900000b0     	adrp	x16, 0x14000 <_GLOBAL_OFFSET_TABLE_+0x48>
     954: f9400e11     	ldr	x17, [x16, #0x18]
     958: 91006210     	add	x16, x16, #0x18
     95c: d61f0220     	br	x17

0000000000000960 <memset@plt>:
     960: 900000b0     	adrp	x16, 0x14000 <_GLOBAL_OFFSET_TABLE_+0x48>
     964: f9401211     	ldr	x17, [x16, #0x20]
     968: 91008210     	add	x16, x16, #0x20
     96c: d61f0220     	br	x17

0000000000000970 <__cxa_finalize@plt>:
     970: 900000b0     	adrp	x16, 0x14000 <_GLOBAL_OFFSET_TABLE_+0x48>
     974: f9401611     	ldr	x17, [x16, #0x28]
     978: 9100a210     	add	x16, x16, #0x28
     97c: d61f0220     	br	x17

0000000000000980 <__libc_start_main@plt>:
     980: 900000b0     	adrp	x16, 0x14000 <_GLOBAL_OFFSET_TABLE_+0x48>
     984: f9401a11     	ldr	x17, [x16, #0x30]
     988: 9100c210     	add	x16, x16, #0x30
     98c: d61f0220     	br	x17

0000000000000990 <_ZdaPv@plt>:
     990: 900000b0     	adrp	x16, 0x14000 <_GLOBAL_OFFSET_TABLE_+0x48>
     994: f9401e11     	ldr	x17, [x16, #0x38]
     998: 9100e210     	add	x16, x16, #0x38
     99c: d61f0220     	br	x17

00000000000009a0 <omp_set_num_threads@plt>:
     9a0: 900000b0     	adrp	x16, 0x14000 <_GLOBAL_OFFSET_TABLE_+0x48>
     9a4: f9402211     	ldr	x17, [x16, #0x40]
     9a8: 91010210     	add	x16, x16, #0x40
     9ac: d61f0220     	br	x17

00000000000009b0 <__kmpc_for_static_init_4@plt>:
     9b0: 900000b0     	adrp	x16, 0x14000 <_GLOBAL_OFFSET_TABLE_+0x48>
     9b4: f9402611     	ldr	x17, [x16, #0x48]
     9b8: 91012210     	add	x16, x16, #0x48
     9bc: d61f0220     	br	x17

00000000000009c0 <abort@plt>:
     9c0: 900000b0     	adrp	x16, 0x14000 <_GLOBAL_OFFSET_TABLE_+0x48>
     9c4: f9402a11     	ldr	x17, [x16, #0x50]
     9c8: 91014210     	add	x16, x16, #0x50
     9cc: d61f0220     	br	x17

00000000000009d0 <__kmpc_fork_call@plt>:
     9d0: 900000b0     	adrp	x16, 0x14000 <_GLOBAL_OFFSET_TABLE_+0x48>
     9d4: f9402e11     	ldr	x17, [x16, #0x58]
     9d8: 91016210     	add	x16, x16, #0x58
     9dc: d61f0220     	br	x17

00000000000009e0 <__gmon_start__@plt>:
     9e0: 900000b0     	adrp	x16, 0x14000 <_GLOBAL_OFFSET_TABLE_+0x48>
     9e4: f9403211     	ldr	x17, [x16, #0x60]
     9e8: 91018210     	add	x16, x16, #0x60
     9ec: d61f0220     	br	x17

00000000000009f0 <printf@plt>:
     9f0: 900000b0     	adrp	x16, 0x14000 <_GLOBAL_OFFSET_TABLE_+0x48>
     9f4: f9403611     	ldr	x17, [x16, #0x68]
     9f8: 9101a210     	add	x16, x16, #0x68
     9fc: d61f0220     	br	x17

Disassembly of section .text:

0000000000000a00 <_start>:
     a00: d503201f     	nop
     a04: d280001d     	mov	x29, #0x0               // =0
     a08: d280001e     	mov	x30, #0x0               // =0
     a0c: aa0003e5     	mov	x5, x0
     a10: f94003e1     	ldr	x1, [sp]
     a14: 910023e2     	add	x2, sp, #0x8
     a18: 910003e6     	mov	x6, sp
     a1c: f0000080     	adrp	x0, 0x13000 <__FRAME_END__+0x100f0>
     a20: f947e000     	ldr	x0, [x0, #0xfc0]
     a24: d2800003     	mov	x3, #0x0                // =0
     a28: d2800004     	mov	x4, #0x0                // =0
     a2c: 97ffffd5     	bl	0x980 <__libc_start_main@plt>
     a30: 97ffffe4     	bl	0x9c0 <abort@plt>

0000000000000a34 <call_weak_fn>:
     a34: f0000080     	adrp	x0, 0x13000 <__FRAME_END__+0x100f0>
     a38: f947ec00     	ldr	x0, [x0, #0xfd8]
     a3c: b4000040     	cbz	x0, 0xa44 <call_weak_fn+0x10>
     a40: 17ffffe8     	b	0x9e0 <__gmon_start__@plt>
     a44: d65f03c0     	ret
     a48: d503201f     	nop
     a4c: d503201f     	nop

0000000000000a50 <deregister_tm_clones>:
     a50: 900000a0     	adrp	x0, 0x14000 <_GLOBAL_OFFSET_TABLE_+0x48>
     a54: 91020000     	add	x0, x0, #0x80
     a58: 900000a1     	adrp	x1, 0x14000 <_GLOBAL_OFFSET_TABLE_+0x48>
     a5c: 91020021     	add	x1, x1, #0x80
     a60: eb00003f     	cmp	x1, x0
     a64: 540000c0     	b.eq	0xa7c <deregister_tm_clones+0x2c>
     a68: f0000081     	adrp	x1, 0x13000 <__FRAME_END__+0x100f0>
     a6c: f947e821     	ldr	x1, [x1, #0xfd0]
     a70: b4000061     	cbz	x1, 0xa7c <deregister_tm_clones+0x2c>
     a74: aa0103f0     	mov	x16, x1
     a78: d61f0200     	br	x16
     a7c: d65f03c0     	ret

0000000000000a80 <register_tm_clones>:
     a80: 900000a0     	adrp	x0, 0x14000 <_GLOBAL_OFFSET_TABLE_+0x48>
     a84: 91020000     	add	x0, x0, #0x80
     a88: 900000a1     	adrp	x1, 0x14000 <_GLOBAL_OFFSET_TABLE_+0x48>
     a8c: 91020021     	add	x1, x1, #0x80
     a90: cb000021     	sub	x1, x1, x0
     a94: d37ffc22     	lsr	x2, x1, #63
     a98: 8b810c41     	add	x1, x2, x1, asr #3
     a9c: 9341fc21     	asr	x1, x1, #1
     aa0: b40000c1     	cbz	x1, 0xab8 <register_tm_clones+0x38>
     aa4: f0000082     	adrp	x2, 0x13000 <__FRAME_END__+0x100f0>
     aa8: f947f042     	ldr	x2, [x2, #0xfe0]
     aac: b4000062     	cbz	x2, 0xab8 <register_tm_clones+0x38>
     ab0: aa0203f0     	mov	x16, x2
     ab4: d61f0200     	br	x16
     ab8: d65f03c0     	ret
     abc: d503201f     	nop

0000000000000ac0 <__do_global_dtors_aux>:
     ac0: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
     ac4: 910003fd     	mov	x29, sp
     ac8: f9000bf3     	str	x19, [sp, #0x10]
     acc: 900000b3     	adrp	x19, 0x14000 <_GLOBAL_OFFSET_TABLE_+0x48>
     ad0: 39420260     	ldrb	w0, [x19, #0x80]
     ad4: 35000140     	cbnz	w0, 0xafc <__do_global_dtors_aux+0x3c>
     ad8: f0000080     	adrp	x0, 0x13000 <__FRAME_END__+0x100f0>
     adc: f947e400     	ldr	x0, [x0, #0xfc8]
     ae0: b4000080     	cbz	x0, 0xaf0 <__do_global_dtors_aux+0x30>
     ae4: 900000a0     	adrp	x0, 0x14000 <_GLOBAL_OFFSET_TABLE_+0x48>
     ae8: f9403c00     	ldr	x0, [x0, #0x78]
     aec: 97ffffa1     	bl	0x970 <__cxa_finalize@plt>
     af0: 97ffffd8     	bl	0xa50 <deregister_tm_clones>
     af4: 52800020     	mov	w0, #0x1                // =1
     af8: 39020260     	strb	w0, [x19, #0x80]
     afc: f9400bf3     	ldr	x19, [sp, #0x10]
     b00: a8c27bfd     	ldp	x29, x30, [sp], #0x20
     b04: d65f03c0     	ret
     b08: d503201f     	nop
     b0c: d503201f     	nop

0000000000000b10 <frame_dummy>:
     b10: 17ffffdc     	b	0xa80 <register_tm_clones>

0000000000000b14 <main>:
     b14: a9bd7bfd     	stp	x29, x30, [sp, #-0x30]!
     b18: a90157f6     	stp	x22, x21, [sp, #0x10]
     b1c: a9024ff4     	stp	x20, x19, [sp, #0x20]
     b20: 910003fd     	mov	x29, sp
     b24: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     b28: 912ee000     	add	x0, x0, #0xbb8
     b2c: 97ffff89     	bl	0x950 <puts@plt>
     b30: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     b34: 9128a000     	add	x0, x0, #0xa28
     b38: 52800801     	mov	w1, #0x40               // =64
     b3c: 52800202     	mov	w2, #0x10               // =16
     b40: 52800403     	mov	w3, #0x20               // =32
     b44: 97ffffab     	bl	0x9f0 <printf@plt>
     b48: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     b4c: 91293000     	add	x0, x0, #0xa4c
     b50: 52810001     	mov	w1, #0x800              // =2048
     b54: 52800802     	mov	w2, #0x40               // =64
     b58: 52800103     	mov	w3, #0x8                // =8
     b5c: 52800204     	mov	w4, #0x10               // =16
     b60: 97ffffa4     	bl	0x9f0 <printf@plt>
     b64: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     b68: 9129cc00     	add	x0, x0, #0xa73
     b6c: 52800041     	mov	w1, #0x2                // =2
     b70: 97ffffa0     	bl	0x9f0 <printf@plt>
     b74: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     b78: 912f8000     	add	x0, x0, #0xbe0
     b7c: 97ffff75     	bl	0x950 <puts@plt>
     b80: 2f00e401     	movi	d1, #0000000000000000
     b84: 1e6e1000     	fmov	d0, #1.00000000
     b88: 52800400     	mov	w0, #0x20               // =32
     b8c: 52800801     	mov	w1, #0x40               // =64
     b90: 52801002     	mov	w2, #0x80               // =128
     b94: 94000066     	bl	0xd2c <_Z9test_gemmIdEbiiiT_S0_>
     b98: 2a0003f3     	mov	w19, w0
     b9c: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     ba0: 912fe000     	add	x0, x0, #0xbf8
     ba4: 97ffff6b     	bl	0x950 <puts@plt>
     ba8: 2f00e401     	movi	d1, #0000000000000000
     bac: 1e6e1000     	fmov	d0, #1.00000000
     bb0: 52800400     	mov	w0, #0x20               // =32
     bb4: 52800801     	mov	w1, #0x40               // =64
     bb8: 52820002     	mov	w2, #0x1000             // =4096
     bbc: 9400005c     	bl	0xd2c <_Z9test_gemmIdEbiiiT_S0_>
     bc0: 72000268     	ands	w8, w19, #0x1
     bc4: 52800029     	mov	w9, #0x1                // =1
     bc8: 1a890529     	cinc	w9, w9, ne
     bcc: 7200001f     	tst	w0, #0x1
     bd0: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     bd4: 91304000     	add	x0, x0, #0xc10
     bd8: 1a881133     	csel	w19, w9, w8, ne
     bdc: 97ffff5d     	bl	0x950 <puts@plt>
     be0: 1e601000     	fmov	d0, #2.00000000
     be4: 1e6c1001     	fmov	d1, #0.50000000
     be8: 52800400     	mov	w0, #0x20               // =32
     bec: 52800801     	mov	w1, #0x40               // =64
     bf0: 52820002     	mov	w2, #0x1000             // =4096
     bf4: 9400004e     	bl	0xd2c <_Z9test_gemmIdEbiiiT_S0_>
     bf8: 12000014     	and	w20, w0, #0x1
     bfc: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     c00: 9130b800     	add	x0, x0, #0xc2e
     c04: 97ffff53     	bl	0x950 <puts@plt>
     c08: 2f00e401     	movi	d1, #0000000000000000
     c0c: 1e6e1000     	fmov	d0, #1.00000000
     c10: 52800800     	mov	w0, #0x40               // =64
     c14: 52801001     	mov	w1, #0x80               // =128
     c18: 52810002     	mov	w2, #0x800              // =2048
     c1c: 94000044     	bl	0xd2c <_Z9test_gemmIdEbiiiT_S0_>
     c20: 12000008     	and	w8, w0, #0x1
     c24: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     c28: 912a0000     	add	x0, x0, #0xa80
     c2c: 0b080288     	add	w8, w20, w8
     c30: 52800082     	mov	w2, #0x4                // =4
     c34: 0b080273     	add	w19, w19, w8
     c38: 2a1303e1     	mov	w1, w19
     c3c: 97ffff6d     	bl	0x9f0 <printf@plt>
     c40: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     c44: 91312c00     	add	x0, x0, #0xc4b
     c48: 97ffff42     	bl	0x950 <puts@plt>
     c4c: 52a00400     	mov	w0, #0x200000           // =2097152
     c50: 97ffff34     	bl	0x920 <_Znam@plt>
     c54: aa0003f4     	mov	x20, x0
     c58: 52a00800     	mov	w0, #0x400000           // =4194304
     c5c: 97ffff31     	bl	0x920 <_Znam@plt>
     c60: aa0003f5     	mov	x21, x0
     c64: 52a00020     	mov	w0, #0x10000            // =65536
     c68: 97ffff2e     	bl	0x920 <_Znam@plt>
     c6c: aa0003f6     	mov	x22, x0
     c70: aa1403e0     	mov	x0, x20
     c74: 2a1f03e1     	mov	w1, wzr
     c78: 52a00402     	mov	w2, #0x200000           // =2097152
     c7c: 97ffff39     	bl	0x960 <memset@plt>
     c80: aa1503e0     	mov	x0, x21
     c84: 2a1f03e1     	mov	w1, wzr
     c88: 52a00802     	mov	w2, #0x400000           // =4194304
     c8c: 97ffff35     	bl	0x960 <memset@plt>
     c90: aa1603e0     	mov	x0, x22
     c94: 2a1f03e1     	mov	w1, wzr
     c98: 52a00022     	mov	w2, #0x10000            // =65536
     c9c: 97ffff31     	bl	0x960 <memset@plt>
     ca0: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     ca4: 912a9800     	add	x0, x0, #0xaa6
     ca8: 52800801     	mov	w1, #0x40               // =64
     cac: 52801002     	mov	w2, #0x80               // =128
     cb0: 52820003     	mov	w3, #0x1000             // =4096
     cb4: 52800044     	mov	w4, #0x2                // =2
     cb8: 97ffff4e     	bl	0x9f0 <printf@plt>
     cbc: 52800040     	mov	w0, #0x2                // =2
     cc0: 97ffff38     	bl	0x9a0 <omp_set_num_threads@plt>
     cc4: aa1403e0     	mov	x0, x20
     cc8: aa1503e1     	mov	x1, x21
     ccc: aa1603e2     	mov	x2, x22
     cd0: 94000154     	bl	0x1220 <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd>
     cd4: d2e83208     	mov	x8, #0x4190000000000000 // =4724276009111650304
     cd8: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     cdc: 912b1000     	add	x0, x0, #0xac4
     ce0: 9e670101     	fmov	d1, x8
     ce4: d2c80008     	mov	x8, #0x400000000000     // =70368744177664
     ce8: f2e811e8     	movk	x8, #0x408f, lsl #48
     cec: 9e670102     	fmov	d2, x8
     cf0: 1e601821     	fdiv	d1, d1, d0
     cf4: 1e621800     	fdiv	d0, d0, d2
     cf8: 97ffff3e     	bl	0x9f0 <printf@plt>
     cfc: aa1403e0     	mov	x0, x20
     d00: 97ffff24     	bl	0x990 <_ZdaPv@plt>
     d04: aa1503e0     	mov	x0, x21
     d08: 97ffff22     	bl	0x990 <_ZdaPv@plt>
     d0c: aa1603e0     	mov	x0, x22
     d10: 97ffff20     	bl	0x990 <_ZdaPv@plt>
     d14: 7100127f     	cmp	w19, #0x4
     d18: 1a9f07e0     	cset	w0, ne
     d1c: a9424ff4     	ldp	x20, x19, [sp, #0x20]
     d20: a94157f6     	ldp	x22, x21, [sp, #0x10]
     d24: a8c37bfd     	ldp	x29, x30, [sp], #0x30
     d28: d65f03c0     	ret

0000000000000d2c <_Z9test_gemmIdEbiiiT_S0_>:
     d2c: d10283ff     	sub	sp, sp, #0xa0
     d30: fd0013ea     	str	d10, [sp, #0x20]
     d34: 6d0323e9     	stp	d9, d8, [sp, #0x30]
     d38: a9047bfd     	stp	x29, x30, [sp, #0x40]
     d3c: a9056ffc     	stp	x28, x27, [sp, #0x50]
     d40: a90667fa     	stp	x26, x25, [sp, #0x60]
     d44: a9075ff8     	stp	x24, x23, [sp, #0x70]
     d48: a90857f6     	stp	x22, x21, [sp, #0x80]
     d4c: a9094ff4     	stp	x20, x19, [sp, #0x90]
     d50: 910103fd     	add	x29, sp, #0x40
     d54: 2a0203f3     	mov	w19, w2
     d58: 2a0103f8     	mov	w24, w1
     d5c: 2a0003f9     	mov	w25, w0
     d60: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     d64: 912ba800     	add	x0, x0, #0xaea
     d68: d0000001     	adrp	x1, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     d6c: 912b8c21     	add	x1, x1, #0xae3
     d70: 2a1903e2     	mov	w2, w25
     d74: 2a1803e3     	mov	w3, w24
     d78: 2a1303e4     	mov	w4, w19
     d7c: 1e604028     	fmov	d8, d1
     d80: 1e604009     	fmov	d9, d0
     d84: 97ffff1b     	bl	0x9f0 <printf@plt>
     d88: 52800040     	mov	w0, #0x2                // =2
     d8c: 97ffff05     	bl	0x9a0 <omp_set_num_threads@plt>
     d90: 1b197e68     	mul	w8, w19, w25
     d94: d37d7d00     	ubfiz	x0, x8, #3, #32
     d98: 97fffee2     	bl	0x920 <_Znam@plt>
     d9c: 1b187e68     	mul	w8, w19, w24
     da0: aa0003fb     	mov	x27, x0
     da4: d37d7d08     	ubfiz	x8, x8, #3, #32
     da8: aa0803e0     	mov	x0, x8
     dac: 97fffedd     	bl	0x920 <_Znam@plt>
     db0: 1b197f08     	mul	w8, w24, w25
     db4: aa0003f4     	mov	x20, x0
     db8: d37d7d16     	ubfiz	x22, x8, #3, #32
     dbc: f9000be8     	str	x8, [sp, #0x10]
     dc0: aa1603e0     	mov	x0, x22
     dc4: 97fffed7     	bl	0x920 <_Znam@plt>
     dc8: f9000fe0     	str	x0, [sp, #0x18]
     dcc: aa1603e0     	mov	x0, x22
     dd0: aa1603f5     	mov	x21, x22
     dd4: 97fffed3     	bl	0x920 <_Znam@plt>
     dd8: 04bf502a     	rdvl	x10, #0x1
     ddc: 25d8e3e0     	ptrue	p0.d
     de0: 04e0e3eb     	cntd	x11
     de4: d344fd5c     	lsr	x28, x10, #4
     de8: 321e73ea     	mov	w10, #0x7ffffffc        // =2147483644
     dec: 04e14004     	index	z4.d, #0x0, #0x1
     df0: d000000d     	adrp	x13, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     df4: 912841ad     	add	x13, x13, #0xa10
     df8: 05e03963     	mov	z3.d, x11
     dfc: 9b0a7f8a     	mul	x10, x28, x10
     e00: d000000b     	adrp	x11, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     e04: d000000c     	adrp	x12, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     e08: 2a1903f7     	mov	w23, w25
     e0c: fd450561     	ldr	d1, [x11, #0xa08]
     e10: fd450982     	ldr	d2, [x12, #0xa10]
     e14: aa0003f6     	mov	x22, x0
     e18: 2a1f03e8     	mov	w8, wzr
     e1c: aa1f03e9     	mov	x9, xzr
     e20: 85c0e1a0     	ld1rd	{ z0.d }, p0/z, [x13]
     e24: b9000ff3     	str	w19, [sp, #0xc]
     e28: 2a1303fa     	mov	w26, w19
     e2c: 04a0e3f3     	cntw	x19
     e30: 8a17014a     	and	x10, x10, x23
     e34: 14000004     	b	0xe44 <_Z9test_gemmIdEbiiiT_S0_+0x118>
     e38: eb1a013f     	cmp	x9, x26
     e3c: 0b190108     	add	w8, w8, w25
     e40: 540004c0     	b.eq	0xed8 <_Z9test_gemmIdEbiiiT_S0_+0x1ac>
     e44: 91000529     	add	x9, x9, #0x1
     e48: 8b284f6b     	add	x11, x27, w8, uxtw #3
     e4c: eb17027f     	cmp	x19, x23
     e50: 1e620125     	scvtf	d5, w9
     e54: 1e6108a5     	fmul	d5, d5, d1
     e58: 54000069     	b.ls	0xe64 <_Z9test_gemmIdEbiiiT_S0_+0x138>
     e5c: aa1f03ec     	mov	x12, xzr
     e60: 14000016     	b	0xeb8 <_Z9test_gemmIdEbiiiT_S0_+0x18c>
     e64: 052820a6     	mov	z6.d, d5
     e68: 04643087     	mov	z7.d, z4.d
     e6c: aa1f03ec     	mov	x12, xzr
     e70: 042b502d     	addvl	x13, x11, #0x1
     e74: 04e300f0     	add	z16.d, z7.d, z3.d
     e78: 25e0c027     	add	z7.d, z7.d, #0x1        // =1
     e7c: 04e30211     	add	z17.d, z16.d, z3.d
     e80: 25e0c030     	add	z16.d, z16.d, #0x1      // =1
     e84: 65d0a0e7     	scvtf	z7.d, p0/m, z7.s
     e88: 65d0a210     	scvtf	z16.d, p0/m, z16.s
     e8c: 65e68007     	fmad	z7.d, p0/m, z0.d, z6.d
     e90: 65e68010     	fmad	z16.d, p0/m, z0.d, z6.d
     e94: e5ec4167     	st1d	{ z7.d }, p0, [x11, x12, lsl #3]
     e98: 04713227     	mov	z7.d, z17.d
     e9c: e5ec41b0     	st1d	{ z16.d }, p0, [x13, x12, lsl #3]
     ea0: 04b0e3ec     	incw	x12
     ea4: eb0c015f     	cmp	x10, x12
     ea8: 54fffe61     	b.ne	0xe74 <_Z9test_gemmIdEbiiiT_S0_+0x148>
     eac: eb17015f     	cmp	x10, x23
     eb0: aa0a03ec     	mov	x12, x10
     eb4: 54fffc20     	b.eq	0xe38 <_Z9test_gemmIdEbiiiT_S0_+0x10c>
     eb8: 9100058d     	add	x13, x12, #0x1
     ebc: 1e6201a6     	scvtf	d6, w13
     ec0: eb0d02ff     	cmp	x23, x13
     ec4: 1f4214c6     	fmadd	d6, d6, d2, d5
     ec8: fc2c7966     	str	d6, [x11, x12, lsl #3]
     ecc: aa0d03ec     	mov	x12, x13
     ed0: 54ffff41     	b.ne	0xeb8 <_Z9test_gemmIdEbiiiT_S0_+0x18c>
     ed4: 17ffffd9     	b	0xe38 <_Z9test_gemmIdEbiiiT_S0_+0x10c>
     ed8: d37ffb8b     	lsl	x11, x28, #1
     edc: 5301038a     	lsl	w10, w28, #31
     ee0: 04e14003     	index	z3.d, #0x0, #0x1
     ee4: f81e83bb     	stur	x27, [x29, #-0x18]
     ee8: 2a1803fb     	mov	w27, w24
     eec: 2a1f03e8     	mov	w8, wzr
     ef0: 05e03964     	mov	z4.d, x11
     ef4: d000000b     	adrp	x11, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     ef8: 9128216b     	add	x11, x11, #0xa08
     efc: 4b1c094a     	sub	w10, w10, w28, lsl #2
     f00: 85c0e165     	ld1rd	{ z5.d }, p0/z, [x11]
     f04: aa1f03e9     	mov	x9, xzr
     f08: 8a1b014a     	and	x10, x10, x27
     f0c: 14000004     	b	0xf1c <_Z9test_gemmIdEbiiiT_S0_+0x1f0>
     f10: eb1a013f     	cmp	x9, x26
     f14: 0b180108     	add	w8, w8, w24
     f18: 54000500     	b.eq	0xfb8 <_Z9test_gemmIdEbiiiT_S0_+0x28c>
     f1c: 91000529     	add	x9, x9, #0x1
     f20: 8b284e8b     	add	x11, x20, w8, uxtw #3
     f24: eb1b027f     	cmp	x19, x27
     f28: 1e620126     	scvtf	d6, w9
     f2c: 54000069     	b.ls	0xf38 <_Z9test_gemmIdEbiiiT_S0_+0x20c>
     f30: aa1f03ec     	mov	x12, xzr
     f34: 14000018     	b	0xf94 <_Z9test_gemmIdEbiiiT_S0_+0x268>
     f38: 052820c7     	mov	z7.d, d6
     f3c: 04633070     	mov	z16.d, z3.d
     f40: aa1f03ec     	mov	x12, xzr
     f44: 042b502d     	addvl	x13, x11, #0x1
     f48: 04e40211     	add	z17.d, z16.d, z4.d
     f4c: 25e0c030     	add	z16.d, z16.d, #0x1      // =1
     f50: 04e40232     	add	z18.d, z17.d, z4.d
     f54: 25e0c031     	add	z17.d, z17.d, #0x1      // =1
     f58: 65d0a210     	scvtf	z16.d, p0/m, z16.s
     f5c: 65d0a231     	scvtf	z17.d, p0/m, z17.s
     f60: 65c00a10     	fmul	z16.d, z16.d, z0.d
     f64: 65c00a31     	fmul	z17.d, z17.d, z0.d
     f68: 65e500f0     	fmla	z16.d, p0/m, z7.d, z5.d
     f6c: 65e500f1     	fmla	z17.d, p0/m, z7.d, z5.d
     f70: e5ec4170     	st1d	{ z16.d }, p0, [x11, x12, lsl #3]
     f74: 04723250     	mov	z16.d, z18.d
     f78: e5ec41b1     	st1d	{ z17.d }, p0, [x13, x12, lsl #3]
     f7c: 04b0e3ec     	incw	x12
     f80: eb0c015f     	cmp	x10, x12
     f84: 54fffe21     	b.ne	0xf48 <_Z9test_gemmIdEbiiiT_S0_+0x21c>
     f88: eb1b015f     	cmp	x10, x27
     f8c: aa0a03ec     	mov	x12, x10
     f90: 54fffc00     	b.eq	0xf10 <_Z9test_gemmIdEbiiiT_S0_+0x1e4>
     f94: 9100058d     	add	x13, x12, #0x1
     f98: 1e6201a7     	scvtf	d7, w13
     f9c: eb0d037f     	cmp	x27, x13
     fa0: 1e6208e7     	fmul	d7, d7, d2
     fa4: 1f411cc7     	fmadd	d7, d6, d1, d7
     fa8: fc2c7967     	str	d7, [x11, x12, lsl #3]
     fac: aa0d03ec     	mov	x12, x13
     fb0: 54ffff21     	b.ne	0xf94 <_Z9test_gemmIdEbiiiT_S0_+0x268>
     fb4: 17ffffd7     	b	0xf10 <_Z9test_gemmIdEbiiiT_S0_+0x1e4>
     fb8: f9400fe0     	ldr	x0, [sp, #0x18]
     fbc: 2a1f03e1     	mov	w1, wzr
     fc0: aa1503e2     	mov	x2, x21
     fc4: 97fffe67     	bl	0x960 <memset@plt>
     fc8: aa1603e0     	mov	x0, x22
     fcc: 2a1f03e1     	mov	w1, wzr
     fd0: aa1503e2     	mov	x2, x21
     fd4: 97fffe63     	bl	0x960 <memset@plt>
     fd8: 25d8e3e0     	ptrue	p0.d
     fdc: 9bbc7eea     	umull	x10, w23, w28
     fe0: f100227f     	cmp	x19, #0x8
     fe4: 9bbc7f6b     	umull	x11, w27, w28
     fe8: 52800109     	mov	w9, #0x8                // =8
     fec: d37df36c     	lsl	x12, x27, #3
     ff0: 9a898269     	csel	x9, x19, x9, hi
     ff4: 7100073f     	cmp	w25, #0x1
     ff8: d37df2ed     	lsl	x13, x23, #3
     ffc: 7a410b00     	ccmp	w24, #0x1, #0x0, eq
    1000: d37be94a     	lsl	x10, x10, #5
    1004: f85e83b0     	ldur	x16, [x29, #-0x18]
    1008: d37be96b     	lsl	x11, x11, #5
    100c: aa1f03e8     	mov	x8, xzr
    1010: 1a9f07ee     	cset	w14, ne
    1014: 1280006f     	mov	w15, #-0x4              // =-4
    1018: 14000005     	b	0x102c <_Z9test_gemmIdEbiiiT_S0_+0x300>
    101c: 91000508     	add	x8, x8, #0x1
    1020: 91002210     	add	x16, x16, #0x8
    1024: eb17011f     	cmp	x8, x23
    1028: 54000620     	b.eq	0x10ec <_Z9test_gemmIdEbiiiT_S0_+0x3c0>
    102c: 9b1b7d12     	mul	x18, x8, x27
    1030: aa1f03f1     	mov	x17, xzr
    1034: aa1403e0     	mov	x0, x20
    1038: 8b120ed2     	add	x18, x22, x18, lsl #3
    103c: 14000007     	b	0x1058 <_Z9test_gemmIdEbiiiT_S0_+0x32c>
    1040: 1f402120     	fmadd	d0, d9, d0, d8
    1044: 91002000     	add	x0, x0, #0x8
    1048: fc317a40     	str	d0, [x18, x17, lsl #3]
    104c: 91000631     	add	x17, x17, #0x1
    1050: eb1b023f     	cmp	x17, x27
    1054: 54fffe40     	b.eq	0x101c <_Z9test_gemmIdEbiiiT_S0_+0x2f0>
    1058: eb1a013f     	cmp	x9, x26
    105c: 1a9f95c1     	csinc	w1, w14, wzr, ls
    1060: 36000081     	tbz	w1, #0x0, 0x1070 <_Z9test_gemmIdEbiiiT_S0_+0x344>
    1064: 2f00e400     	movi	d0, #0000000000000000
    1068: aa1f03e1     	mov	x1, xzr
    106c: 14000015     	b	0x10c0 <_Z9test_gemmIdEbiiiT_S0_+0x394>
    1070: 9b0f7f81     	mul	x1, x28, x15
    1074: 2f00e400     	movi	d0, #0000000000000000
    1078: aa0003e3     	mov	x3, x0
    107c: aa1003e4     	mov	x4, x16
    1080: 8a1a0021     	and	x1, x1, x26
    1084: aa0103e2     	mov	x2, x1
    1088: a5e0a081     	ld1d	{ z1.d }, p0/z, [x4]
    108c: a5e0a062     	ld1d	{ z2.d }, p0/z, [x3]
    1090: 04b0e7e2     	decw	x2
    1094: 65c20821     	fmul	z1.d, z1.d, z2.d
    1098: a5e1a062     	ld1d	{ z2.d }, p0/z, [x3, #0x1, mul vl]
    109c: 8b0b0063     	add	x3, x3, x11
    10a0: 65d82020     	fadda	d0, p0, d0, z1.d
    10a4: a5e1a081     	ld1d	{ z1.d }, p0/z, [x4, #0x1, mul vl]
    10a8: 8b0a0084     	add	x4, x4, x10
    10ac: 65c20821     	fmul	z1.d, z1.d, z2.d
    10b0: 65d82020     	fadda	d0, p0, d0, z1.d
    10b4: b5fffea2     	cbnz	x2, 0x1088 <_Z9test_gemmIdEbiiiT_S0_+0x35c>
    10b8: eb1a003f     	cmp	x1, x26
    10bc: 54fffc20     	b.eq	0x1040 <_Z9test_gemmIdEbiiiT_S0_+0x314>
    10c0: 9b017d82     	mul	x2, x12, x1
    10c4: 9b017da3     	mul	x3, x13, x1
    10c8: cb010341     	sub	x1, x26, x1
    10cc: fc636a01     	ldr	d1, [x16, x3]
    10d0: fc626802     	ldr	d2, [x0, x2]
    10d4: f1000421     	subs	x1, x1, #0x1
    10d8: 8b0c0042     	add	x2, x2, x12
    10dc: 8b0d0063     	add	x3, x3, x13
    10e0: 1f420020     	fmadd	d0, d1, d2, d0
    10e4: 54ffff41     	b.ne	0x10cc <_Z9test_gemmIdEbiiiT_S0_+0x3a0>
    10e8: 17ffffd6     	b	0x1040 <_Z9test_gemmIdEbiiiT_S0_+0x314>
    10ec: 1e604120     	fmov	d0, d9
    10f0: 1e604101     	fmov	d1, d8
    10f4: f85e83ba     	ldur	x26, [x29, #-0x18]
    10f8: f9400ff5     	ldr	x21, [sp, #0x18]
    10fc: b9400fe2     	ldr	w2, [sp, #0xc]
    1100: 2a1903e0     	mov	w0, w25
    1104: 2a1803e1     	mov	w1, w24
    1108: aa1a03e3     	mov	x3, x26
    110c: aa1403e4     	mov	x4, x20
    1110: aa1503e5     	mov	x5, x21
    1114: 940005ca     	bl	0x283c <_ZN4gemmIdE12compute_testEiiiPKdS2_Pddd>
    1118: 2f00e408     	movi	d8, #0000000000000000
    111c: b0000008     	adrp	x8, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
    1120: f9400bfb     	ldr	x27, [sp, #0x10]
    1124: fd450d09     	ldr	d9, [x8, #0xa18]
    1128: b0000008     	adrp	x8, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
    112c: aa1f03f8     	mov	x24, xzr
    1130: fd45110a     	ldr	d10, [x8, #0xa20]
    1134: b0000019     	adrp	x25, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
    1138: 912ca739     	add	x25, x25, #0xb29
    113c: 52800033     	mov	w19, #0x1               // =1
    1140: b0000017     	adrp	x23, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
    1144: 912e0ef7     	add	x23, x23, #0xb83
    1148: 14000007     	b	0x1164 <_Z9test_gemmIdEbiiiT_S0_+0x438>
    114c: 1e6a2040     	fcmp	d2, d10
    1150: 91000718     	add	x24, x24, #0x1
    1154: 1a9fc7e8     	cset	w8, le
    1158: eb1b031f     	cmp	x24, x27
    115c: 0a130113     	and	w19, w8, w19
    1160: 540002a0     	b.eq	0x11b4 <_Z9test_gemmIdEbiiiT_S0_+0x488>
    1164: d37df308     	lsl	x8, x24, #3
    1168: fc686ac1     	ldr	d1, [x22, x8]
    116c: fc686aa0     	ldr	d0, [x21, x8]
    1170: 1e60c022     	fabs	d2, d1
    1174: 7ee1d403     	fabd	d3, d0, d1
    1178: 1e692842     	fadd	d2, d2, d9
    117c: 1e621862     	fdiv	d2, d3, d2
    1180: 1e682040     	fcmp	d2, d8
    1184: 1e68cc48     	fcsel	d8, d2, d8, gt
    1188: 1e6a2040     	fcmp	d2, d10
    118c: 54fffe0d     	b.le	0x114c <_Z9test_gemmIdEbiiiT_S0_+0x420>
    1190: 3607fdf3     	tbz	w19, #0x0, 0x114c <_Z9test_gemmIdEbiiiT_S0_+0x420>
    1194: aa1903e0     	mov	x0, x25
    1198: 2a1803e1     	mov	w1, w24
    119c: 97fffe15     	bl	0x9f0 <printf@plt>
    11a0: 91000718     	add	x24, x24, #0x1
    11a4: 2a1f03f3     	mov	w19, wzr
    11a8: eb1b031f     	cmp	x24, x27
    11ac: 54fffdc1     	b.ne	0x1164 <_Z9test_gemmIdEbiiiT_S0_+0x438>
    11b0: 14000006     	b	0x11c8 <_Z9test_gemmIdEbiiiT_S0_+0x49c>
    11b4: 7100027f     	cmp	w19, #0x0
    11b8: b0000008     	adrp	x8, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
    11bc: 912d9508     	add	x8, x8, #0xb65
    11c0: 13000273     	sbfx	w19, w19, #0, #1
    11c4: 9a971117     	csel	x23, x8, x23, ne
    11c8: 1e604100     	fmov	d0, d8
    11cc: aa1703e0     	mov	x0, x23
    11d0: 97fffe08     	bl	0x9f0 <printf@plt>
    11d4: aa1a03e0     	mov	x0, x26
    11d8: 97fffdee     	bl	0x990 <_ZdaPv@plt>
    11dc: aa1403e0     	mov	x0, x20
    11e0: 97fffdec     	bl	0x990 <_ZdaPv@plt>
    11e4: aa1503e0     	mov	x0, x21
    11e8: 97fffdea     	bl	0x990 <_ZdaPv@plt>
    11ec: aa1603e0     	mov	x0, x22
    11f0: 97fffde8     	bl	0x990 <_ZdaPv@plt>
    11f4: 12000260     	and	w0, w19, #0x1
    11f8: a9494ff4     	ldp	x20, x19, [sp, #0x90]
    11fc: fd4013ea     	ldr	d10, [sp, #0x20]
    1200: a94857f6     	ldp	x22, x21, [sp, #0x80]
    1204: a9475ff8     	ldp	x24, x23, [sp, #0x70]
    1208: a94667fa     	ldp	x26, x25, [sp, #0x60]
    120c: a9456ffc     	ldp	x28, x27, [sp, #0x50]
    1210: a9447bfd     	ldp	x29, x30, [sp, #0x40]
    1214: 6d4323e9     	ldp	d9, d8, [sp, #0x30]
    1218: 910283ff     	add	sp, sp, #0xa0
    121c: d65f03c0     	ret

0000000000001220 <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd>:
    1220: 6db63bef     	stp	d15, d14, [sp, #-0xa0]!
    1224: 6d0133ed     	stp	d13, d12, [sp, #0x10]
    1228: 6d022beb     	stp	d11, d10, [sp, #0x20]
    122c: 6d0323e9     	stp	d9, d8, [sp, #0x30]
    1230: a9047bfd     	stp	x29, x30, [sp, #0x40]
    1234: a9056ffc     	stp	x28, x27, [sp, #0x50]
    1238: a90667fa     	stp	x26, x25, [sp, #0x60]
    123c: a9075ff8     	stp	x24, x23, [sp, #0x70]
    1240: a90857f6     	stp	x22, x21, [sp, #0x80]
    1244: a9094ff4     	stp	x20, x19, [sp, #0x90]
    1248: 910103fd     	add	x29, sp, #0x40
    124c: d10343ff     	sub	sp, sp, #0xd0
    1250: 043f5fff     	addsvl	sp, sp, #-0x1
    1254: d503437f     	smstart	sm
    1258: 25d8e3e0     	ptrue	p0.d
    125c: 52800809     	mov	w9, #0x40               // =64
    1260: 5280100a     	mov	w10, #0x80              // =128
    1264: 291927ea     	stp	w10, w9, [sp, #0xc8]
    1268: d2e7fe09     	mov	x9, #0x3ff0000000000000 // =4607182418800017408
    126c: 2a1f03e8     	mov	w8, wzr
    1270: 5280008b     	mov	w11, #0x4               // =4
    1274: 5280004d     	mov	w13, #0x2               // =2
    1278: a90a8be9     	stp	x9, x2, [sp, #0xa8]
    127c: 910283ee     	add	x14, sp, #0xa0
    1280: 9102a3f3     	add	x19, sp, #0xa8
    1284: 910233f4     	add	x20, sp, #0x8c
    1288: 910253f5     	add	x21, sp, #0x94
    128c: 910243f9     	add	x25, sp, #0x90
    1290: 9102c3fa     	add	x26, sp, #0xb0
    1294: 910323f8     	add	x24, sp, #0xc8
    1298: 9102e3fb     	add	x27, sp, #0xb8
    129c: d10103a9     	sub	x9, x29, #0x40
    12a0: d0000096     	adrp	x22, 0x13000 <__FRAME_END__+0x100f0>
    12a4: 913602d6     	add	x22, x22, #0xd80
    12a8: 910333fc     	add	x28, sp, #0xcc
    12ac: 90000017     	adrp	x23, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0x2d4>
    12b0: 9114f2f7     	add	x23, x23, #0x53c
    12b4: a90687e0     	stp	x0, x1, [sp, #0x68]
    12b8: a90b83e1     	stp	x1, x0, [sp, #0xb8]
    12bc: f9003fe2     	str	x2, [sp, #0x78]
    12c0: f90053ff     	str	xzr, [sp, #0xa0]
    12c4: 29132fff     	stp	wzr, w11, [sp, #0x98]
    12c8: e5bf1920     	str	p0, [x9, #-0x2, mul vl]
    12cc: e5bf1d20     	str	p0, [x9, #-0x1, mul vl]
    12d0: 5282000a     	mov	w10, #0x1000            // =4096
    12d4: 7120011f     	cmp	w8, #0x800
    12d8: 5281000c     	mov	w12, #0x800             // =2048
    12dc: 4b08014a     	sub	w10, w10, w8
    12e0: 2a1f03e9     	mov	w9, wzr
    12e4: b9008bff     	str	wzr, [sp, #0x88]
    12e8: 1a8cc14a     	csel	w10, w10, w12, gt
    12ec: 7100011f     	cmp	w8, #0x0
    12f0: b90097ea     	str	w10, [sp, #0x94]
    12f4: 1a9f17ea     	cset	w10, eq
    12f8: 711ffd1f     	cmp	w8, #0x7ff
    12fc: 1a9fd7e8     	cset	w8, gt
    1300: 390243ea     	strb	w10, [sp, #0x90]
    1304: 390233e8     	strb	w8, [sp, #0x8c]
    1308: 4b090168     	sub	w8, w11, w9
    130c: 7100093f     	cmp	w9, #0x2
    1310: a9043bf3     	stp	x19, x14, [sp, #0x40]
    1314: 1a8dc108     	csel	w8, w8, w13, gt
    1318: a90353f5     	stp	x21, x20, [sp, #0x30]
    131c: b90087e8     	str	w8, [sp, #0x84]
    1320: d10103a8     	sub	x8, x29, #0x40
    1324: 04685fe8     	addspl	x8, x8, #-0x1
    1328: a9016bf8     	stp	x24, x26, [sp, #0x10]
    132c: a90223f9     	stp	x25, x8, [sp, #0x20]
    1330: a9006ffc     	stp	x28, x27, [sp]
    1334: d503427f     	smstop	sm
    1338: 910273e3     	add	x3, sp, #0x9c
    133c: 910213e4     	add	x4, sp, #0x84
    1340: 910223e5     	add	x5, sp, #0x88
    1344: 910303e6     	add	x6, sp, #0xc0
    1348: 910263e7     	add	x7, sp, #0x98
    134c: aa1603e0     	mov	x0, x22
    1350: 528001e1     	mov	w1, #0xf                // =15
    1354: aa1703e2     	mov	x2, x23
    1358: 97fffd9e     	bl	0x9d0 <__kmpc_fork_call@plt>
    135c: 910283ee     	add	x14, sp, #0xa0
    1360: 5280004d     	mov	w13, #0x2               // =2
    1364: 5280008b     	mov	w11, #0x4               // =4
    1368: d503437f     	smstart	sm
    136c: b9408be8     	ldr	w8, [sp, #0x88]
    1370: 11000909     	add	w9, w8, #0x2
    1374: 7100091f     	cmp	w8, #0x2
    1378: b9008be9     	str	w9, [sp, #0x88]
    137c: 54fffc6b     	b.lt	0x1308 <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd+0xe8>
    1380: b9409be9     	ldr	w9, [sp, #0x98]
    1384: 11200128     	add	w8, w9, #0x800
    1388: 7120013f     	cmp	w9, #0x800
    138c: b9009be8     	str	w8, [sp, #0x98]
    1390: 54fffa0b     	b.lt	0x12d0 <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd+0xb0>
    1394: d503427f     	smstop	sm
    1398: 97fffd6a     	bl	0x940 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
    139c: f90033e0     	str	x0, [sp, #0x60]
    13a0: d503437f     	smstart	sm
    13a4: 52800809     	mov	w9, #0x40               // =64
    13a8: 5280100a     	mov	w10, #0x80              // =128
    13ac: 2a1f03e8     	mov	w8, wzr
    13b0: 291927ea     	stp	w10, w9, [sp, #0xc8]
    13b4: f94037ea     	ldr	x10, [sp, #0x68]
    13b8: d2e7fe09     	mov	x9, #0x3ff0000000000000 // =4607182418800017408
    13bc: 5280008b     	mov	w11, #0x4               // =4
    13c0: 5280004d     	mov	w13, #0x2               // =2
    13c4: 910283ee     	add	x14, sp, #0xa0
    13c8: f90063ea     	str	x10, [sp, #0xc0]
    13cc: f9403bea     	ldr	x10, [sp, #0x70]
    13d0: 9102a3fb     	add	x27, sp, #0xa8
    13d4: 910233fc     	add	x28, sp, #0x8c
    13d8: 910253f6     	add	x22, sp, #0x94
    13dc: 910243f5     	add	x21, sp, #0x90
    13e0: f9005fea     	str	x10, [sp, #0xb8]
    13e4: f9403fea     	ldr	x10, [sp, #0x78]
    13e8: 9102c3f8     	add	x24, sp, #0xb0
    13ec: 910323f7     	add	x23, sp, #0xc8
    13f0: 9102e3f9     	add	x25, sp, #0xb8
    13f4: 910333fa     	add	x26, sp, #0xcc
    13f8: a90aabe9     	stp	x9, x10, [sp, #0xa8]
    13fc: d10103a9     	sub	x9, x29, #0x40
    1400: d0000093     	adrp	x19, 0x13000 <__FRAME_END__+0x100f0>
    1404: 91360273     	add	x19, x19, #0xd80
    1408: 85bf1920     	ldr	p0, [x9, #-0x2, mul vl]
    140c: 90000014     	adrp	x20, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0x2d4>
    1410: 9114f294     	add	x20, x20, #0x53c
    1414: f90053ff     	str	xzr, [sp, #0xa0]
    1418: 29132fff     	stp	wzr, w11, [sp, #0x98]
    141c: e5bf1d20     	str	p0, [x9, #-0x1, mul vl]
    1420: 5282000a     	mov	w10, #0x1000            // =4096
    1424: 7120011f     	cmp	w8, #0x800
    1428: 5281000c     	mov	w12, #0x800             // =2048
    142c: 4b08014a     	sub	w10, w10, w8
    1430: 2a1f03e9     	mov	w9, wzr
    1434: b9008bff     	str	wzr, [sp, #0x88]
    1438: 1a8cc14a     	csel	w10, w10, w12, gt
    143c: 7100011f     	cmp	w8, #0x0
    1440: b90097ea     	str	w10, [sp, #0x94]
    1444: 1a9f17ea     	cset	w10, eq
    1448: 711ffd1f     	cmp	w8, #0x7ff
    144c: 1a9fd7e8     	cset	w8, gt
    1450: 390243ea     	strb	w10, [sp, #0x90]
    1454: 390233e8     	strb	w8, [sp, #0x8c]
    1458: 4b090168     	sub	w8, w11, w9
    145c: 7100093f     	cmp	w9, #0x2
    1460: a9043bfb     	stp	x27, x14, [sp, #0x40]
    1464: 1a8dc108     	csel	w8, w8, w13, gt
    1468: a90373f6     	stp	x22, x28, [sp, #0x30]
    146c: b90087e8     	str	w8, [sp, #0x84]
    1470: d10103a8     	sub	x8, x29, #0x40
    1474: 04685fe8     	addspl	x8, x8, #-0x1
    1478: a90163f7     	stp	x23, x24, [sp, #0x10]
    147c: a90223f5     	stp	x21, x8, [sp, #0x20]
    1480: a90067fa     	stp	x26, x25, [sp]
    1484: d503427f     	smstop	sm
    1488: 910273e3     	add	x3, sp, #0x9c
    148c: 910213e4     	add	x4, sp, #0x84
    1490: 910223e5     	add	x5, sp, #0x88
    1494: 910303e6     	add	x6, sp, #0xc0
    1498: 910263e7     	add	x7, sp, #0x98
    149c: aa1303e0     	mov	x0, x19
    14a0: 528001e1     	mov	w1, #0xf                // =15
    14a4: aa1403e2     	mov	x2, x20
    14a8: 97fffd4a     	bl	0x9d0 <__kmpc_fork_call@plt>
    14ac: 910283ee     	add	x14, sp, #0xa0
    14b0: 5280004d     	mov	w13, #0x2               // =2
    14b4: 5280008b     	mov	w11, #0x4               // =4
    14b8: d503437f     	smstart	sm
    14bc: b9408be8     	ldr	w8, [sp, #0x88]
    14c0: 11000909     	add	w9, w8, #0x2
    14c4: 7100091f     	cmp	w8, #0x2
    14c8: b9008be9     	str	w9, [sp, #0x88]
    14cc: 54fffc6b     	b.lt	0x1458 <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd+0x238>
    14d0: b9409be9     	ldr	w9, [sp, #0x98]
    14d4: 11200128     	add	w8, w9, #0x800
    14d8: 7120013f     	cmp	w9, #0x800
    14dc: b9009be8     	str	w8, [sp, #0x98]
    14e0: 54fffa0b     	b.lt	0x1420 <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd+0x200>
    14e4: d503427f     	smstop	sm
    14e8: 97fffd16     	bl	0x940 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
    14ec: d503437f     	smstart	sm
    14f0: f94033e8     	ldr	x8, [sp, #0x60]
    14f4: cb080008     	sub	x8, x0, x8
    14f8: 9e620100     	scvtf	d0, x8
    14fc: fd003fe0     	str	d0, [sp, #0x78]
    1500: d503427f     	smstop	sm
    1504: fd403fe0     	ldr	d0, [sp, #0x78]
    1508: 043f583f     	addsvl	sp, sp, #0x1
    150c: 910343ff     	add	sp, sp, #0xd0
    1510: a9494ff4     	ldp	x20, x19, [sp, #0x90]
    1514: a94857f6     	ldp	x22, x21, [sp, #0x80]
    1518: a9475ff8     	ldp	x24, x23, [sp, #0x70]
    151c: a94667fa     	ldp	x26, x25, [sp, #0x60]
    1520: a9456ffc     	ldp	x28, x27, [sp, #0x50]
    1524: a9447bfd     	ldp	x29, x30, [sp, #0x40]
    1528: 6d4323e9     	ldp	d9, d8, [sp, #0x30]
    152c: 6d422beb     	ldp	d11, d10, [sp, #0x20]
    1530: 6d4133ed     	ldp	d13, d12, [sp, #0x10]
    1534: 6cca3bef     	ldp	d15, d14, [sp], #0xa0
    1538: d65f03c0     	ret

000000000000153c <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined>:
    153c: a9ba7bfd     	stp	x29, x30, [sp, #-0x60]!
    1540: a9016ffc     	stp	x28, x27, [sp, #0x10]
    1544: a90267fa     	stp	x26, x25, [sp, #0x20]
    1548: a9035ff8     	stp	x24, x23, [sp, #0x30]
    154c: a90457f6     	stp	x22, x21, [sp, #0x40]
    1550: a9054ff4     	stp	x20, x19, [sp, #0x50]
    1554: 910003fd     	mov	x29, sp
    1558: d106c3ff     	sub	sp, sp, #0x1b0
    155c: b9400048     	ldr	w8, [x2]
    1560: 71000513     	subs	w19, w8, #0x1
    1564: 540095cb     	b.lt	0x281c <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x12e0>
    1568: b9400001     	ldr	w1, [x0]
    156c: aa0703f4     	mov	x20, x7
    1570: aa0603f6     	mov	x22, x6
    1574: aa0503f9     	mov	x25, x5
    1578: aa0403fa     	mov	x26, x4
    157c: 52800028     	mov	w8, #0x1                // =1
    1580: d0000080     	adrp	x0, 0x13000 <__FRAME_END__+0x100f0>
    1584: 9135a000     	add	x0, x0, #0xd68
    1588: f9003fe3     	str	x3, [sp, #0x78]
    158c: d10063a3     	sub	x3, x29, #0x18
    1590: d10033a4     	sub	x4, x29, #0xc
    1594: d10043a5     	sub	x5, x29, #0x10
    1598: d10053a6     	sub	x6, x29, #0x14
    159c: 52800442     	mov	w2, #0x22               // =34
    15a0: 52800027     	mov	w7, #0x1                // =1
    15a4: 293e7fb3     	stp	w19, wzr, [x29, #-0x10]
    15a8: 293d23bf     	stp	wzr, w8, [x29, #-0x18]
    15ac: b90017e1     	str	w1, [sp, #0x14]
    15b0: b90003e8     	str	w8, [sp]
    15b4: 97fffcff     	bl	0x9b0 <__kmpc_for_static_init_4@plt>
    15b8: 297e2fa8     	ldp	w8, w11, [x29, #-0x10]
    15bc: f9403ff0     	ldr	x16, [sp, #0x78]
    15c0: 93407d6b     	sxtw	x11, w11
    15c4: 6b13011f     	cmp	w8, w19
    15c8: 1a93b109     	csel	w9, w8, w19, lt
    15cc: 6b09017f     	cmp	w11, w9
    15d0: b81f03a9     	stur	w9, [x29, #-0x10]
    15d4: 540091cc     	b.gt	0x280c <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x12d0>
    15d8: b9400208     	ldr	w8, [x16]
    15dc: 7100051f     	cmp	w8, #0x1
    15e0: 5400916b     	b.lt	0x280c <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x12d0>
    15e4: 25d8e3e0     	ptrue	p0.d
    15e8: f94053aa     	ldr	x10, [x29, #0xa0]
    15ec: 04e14000     	index	z0.d, #0x0, #0x1
    15f0: a948c7b2     	ldp	x18, x17, [x29, #0x88]
    15f4: 25f8c001     	mov	z1.d, #0x0              // =0
    15f8: a94783a1     	ldp	x1, x0, [x29, #0x78]
    15fc: f90053ea     	str	x10, [sp, #0xa0]
    1600: a9468ba3     	ldp	x3, x2, [x29, #0x68]
    1604: 531c6d6a     	lsl	w10, w11, #4
    1608: f9404fac     	ldr	x12, [x29, #0x98]
    160c: f94033a4     	ldr	x4, [x29, #0x60]
    1610: a906d3f6     	stp	x22, x20, [sp, #0x68]
    1614: a905e7fa     	stp	x26, x25, [sp, #0x58]
    1618: f9004fec     	str	x12, [sp, #0x98]
    161c: a904c7f2     	stp	x18, x17, [sp, #0x48]
    1620: a90383e1     	stp	x1, x0, [sp, #0x38]
    1624: a9028be3     	stp	x3, x2, [sp, #0x28]
    1628: f90013e4     	str	x4, [sp, #0x20]
    162c: 14000008     	b	0x164c <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x110>
    1630: b85f03a9     	ldur	w9, [x29, #-0x10]
    1634: f9400feb     	ldr	x11, [sp, #0x18]
    1638: f9404bea     	ldr	x10, [sp, #0x90]
    163c: eb29c17f     	cmp	x11, w9, sxtw
    1640: 9100056b     	add	x11, x11, #0x1
    1644: 1100414a     	add	w10, w10, #0x10
    1648: 54008e2a     	b.ge	0x280c <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x12d0>
    164c: 93407d4c     	sxtw	x12, w10
    1650: 7100051f     	cmp	w8, #0x1
    1654: f9004bec     	str	x12, [sp, #0x90]
    1658: 54ffff0b     	b.lt	0x1638 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xfc>
    165c: 531c6d68     	lsl	w8, w11, #4
    1660: 937d7d49     	sbfiz	x9, x10, #3, #32
    1664: 2a1f03e6     	mov	w6, wzr
    1668: f9000feb     	str	x11, [sp, #0x18]
    166c: 93407d05     	sxtw	x5, w8
    1670: a90827e5     	stp	x5, x9, [sp, #0x80]
    1674: 140000a2     	b	0x18fc <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x3c0>
    1678: 85800001     	ldr	p1, [x0]
    167c: 2a1f03ed     	mov	w13, wzr
    1680: 5280002c     	mov	w12, #0x1               // =1
    1684: 8b1c00e8     	add	x8, x7, x28
    1688: 5280004e     	mov	w14, #0x2               // =2
    168c: 5280006f     	mov	w15, #0x3               // =3
    1690: 8b1c0109     	add	x9, x8, x28
    1694: c0c22402     	mov	z2.d, p1/m, za0h.d[w13, 0]
    1698: c0c22443     	mov	z3.d, p1/m, za1h.d[w13, 0]
    169c: c0c22484     	mov	z4.d, p1/m, za2h.d[w13, 0]
    16a0: c0c224c5     	mov	z5.d, p1/m, za3h.d[w13, 0]
    16a4: e5e0e4e2     	st1d	{ z2.d }, p1, [x7]
    16a8: e5e1e4e3     	st1d	{ z3.d }, p1, [x7, #0x1, mul vl]
    16ac: e5e2e4e4     	st1d	{ z4.d }, p1, [x7, #0x2, mul vl]
    16b0: e5e3e4e5     	st1d	{ z5.d }, p1, [x7, #0x3, mul vl]
    16b4: c0c20402     	mov	z2.d, p1/m, za0h.d[w12, 0]
    16b8: c0c20443     	mov	z3.d, p1/m, za1h.d[w12, 0]
    16bc: c0c20484     	mov	z4.d, p1/m, za2h.d[w12, 0]
    16c0: c0c204c5     	mov	z5.d, p1/m, za3h.d[w12, 0]
    16c4: e5fb44e2     	st1d	{ z2.d }, p1, [x7, x27, lsl #3]
    16c8: 5280008c     	mov	w12, #0x4               // =4
    16cc: e5e1e503     	st1d	{ z3.d }, p1, [x8, #0x1, mul vl]
    16d0: e5e2e504     	st1d	{ z4.d }, p1, [x8, #0x2, mul vl]
    16d4: e5e3e505     	st1d	{ z5.d }, p1, [x8, #0x3, mul vl]
    16d8: c0c24402     	mov	z2.d, p1/m, za0h.d[w14, 0]
    16dc: c0c24443     	mov	z3.d, p1/m, za1h.d[w14, 0]
    16e0: c0c24484     	mov	z4.d, p1/m, za2h.d[w14, 0]
    16e4: c0c244c5     	mov	z5.d, p1/m, za3h.d[w14, 0]
    16e8: e5fb4502     	st1d	{ z2.d }, p1, [x8, x27, lsl #3]
    16ec: 8b1c0128     	add	x8, x9, x28
    16f0: e5e1e523     	st1d	{ z3.d }, p1, [x9, #0x1, mul vl]
    16f4: e5e2e524     	st1d	{ z4.d }, p1, [x9, #0x2, mul vl]
    16f8: e5e3e525     	st1d	{ z5.d }, p1, [x9, #0x3, mul vl]
    16fc: c0c26402     	mov	z2.d, p1/m, za0h.d[w15, 0]
    1700: c0c26443     	mov	z3.d, p1/m, za1h.d[w15, 0]
    1704: c0c26484     	mov	z4.d, p1/m, za2h.d[w15, 0]
    1708: c0c264c5     	mov	z5.d, p1/m, za3h.d[w15, 0]
    170c: e5fb4522     	st1d	{ z2.d }, p1, [x9, x27, lsl #3]
    1710: 8b1c0109     	add	x9, x8, x28
    1714: e5e1e503     	st1d	{ z3.d }, p1, [x8, #0x1, mul vl]
    1718: e5e2e504     	st1d	{ z4.d }, p1, [x8, #0x2, mul vl]
    171c: e5e3e505     	st1d	{ z5.d }, p1, [x8, #0x3, mul vl]
    1720: c0c20402     	mov	z2.d, p1/m, za0h.d[w12, 0]
    1724: c0c20443     	mov	z3.d, p1/m, za1h.d[w12, 0]
    1728: c0c20484     	mov	z4.d, p1/m, za2h.d[w12, 0]
    172c: c0c204c5     	mov	z5.d, p1/m, za3h.d[w12, 0]
    1730: e5fb4502     	st1d	{ z2.d }, p1, [x8, x27, lsl #3]
    1734: 528000ac     	mov	w12, #0x5               // =5
    1738: e5e1e523     	st1d	{ z3.d }, p1, [x9, #0x1, mul vl]
    173c: 8b1c0128     	add	x8, x9, x28
    1740: e5e2e524     	st1d	{ z4.d }, p1, [x9, #0x2, mul vl]
    1744: e5e3e525     	st1d	{ z5.d }, p1, [x9, #0x3, mul vl]
    1748: c0c20402     	mov	z2.d, p1/m, za0h.d[w12, 0]
    174c: c0c20443     	mov	z3.d, p1/m, za1h.d[w12, 0]
    1750: c0c20484     	mov	z4.d, p1/m, za2h.d[w12, 0]
    1754: c0c204c5     	mov	z5.d, p1/m, za3h.d[w12, 0]
    1758: e5fb4522     	st1d	{ z2.d }, p1, [x9, x27, lsl #3]
    175c: 528000cc     	mov	w12, #0x6               // =6
    1760: e5e1e503     	st1d	{ z3.d }, p1, [x8, #0x1, mul vl]
    1764: 8b1c0109     	add	x9, x8, x28
    1768: e5e2e504     	st1d	{ z4.d }, p1, [x8, #0x2, mul vl]
    176c: e5e3e505     	st1d	{ z5.d }, p1, [x8, #0x3, mul vl]
    1770: c0c20402     	mov	z2.d, p1/m, za0h.d[w12, 0]
    1774: c0c20443     	mov	z3.d, p1/m, za1h.d[w12, 0]
    1778: c0c20484     	mov	z4.d, p1/m, za2h.d[w12, 0]
    177c: c0c204c5     	mov	z5.d, p1/m, za3h.d[w12, 0]
    1780: e5fb4502     	st1d	{ z2.d }, p1, [x8, x27, lsl #3]
    1784: 528000ec     	mov	w12, #0x7               // =7
    1788: e5e1e523     	st1d	{ z3.d }, p1, [x9, #0x1, mul vl]
    178c: 8b1c0128     	add	x8, x9, x28
    1790: e5e2e524     	st1d	{ z4.d }, p1, [x9, #0x2, mul vl]
    1794: e5e3e525     	st1d	{ z5.d }, p1, [x9, #0x3, mul vl]
    1798: c0c20402     	mov	z2.d, p1/m, za0h.d[w12, 0]
    179c: c0c20443     	mov	z3.d, p1/m, za1h.d[w12, 0]
    17a0: c0c20484     	mov	z4.d, p1/m, za2h.d[w12, 0]
    17a4: c0c204c5     	mov	z5.d, p1/m, za3h.d[w12, 0]
    17a8: e5fb4522     	st1d	{ z2.d }, p1, [x9, x27, lsl #3]
    17ac: 8b1c0109     	add	x9, x8, x28
    17b0: e5e1e503     	st1d	{ z3.d }, p1, [x8, #0x1, mul vl]
    17b4: 5280002c     	mov	w12, #0x1               // =1
    17b8: e5e2e504     	st1d	{ z4.d }, p1, [x8, #0x2, mul vl]
    17bc: e5e3e505     	st1d	{ z5.d }, p1, [x8, #0x3, mul vl]
    17c0: c0c22502     	mov	z2.d, p1/m, za4h.d[w13, 0]
    17c4: c0c22543     	mov	z3.d, p1/m, za5h.d[w13, 0]
    17c8: c0c22584     	mov	z4.d, p1/m, za6h.d[w13, 0]
    17cc: c0c225c5     	mov	z5.d, p1/m, za7h.d[w13, 0]
    17d0: e5fb4502     	st1d	{ z2.d }, p1, [x8, x27, lsl #3]
    17d4: 8b1c0128     	add	x8, x9, x28
    17d8: e5e1e523     	st1d	{ z3.d }, p1, [x9, #0x1, mul vl]
    17dc: e5e2e524     	st1d	{ z4.d }, p1, [x9, #0x2, mul vl]
    17e0: e5e3e525     	st1d	{ z5.d }, p1, [x9, #0x3, mul vl]
    17e4: c0c20502     	mov	z2.d, p1/m, za4h.d[w12, 0]
    17e8: c0c20543     	mov	z3.d, p1/m, za5h.d[w12, 0]
    17ec: c0c20584     	mov	z4.d, p1/m, za6h.d[w12, 0]
    17f0: c0c205c5     	mov	z5.d, p1/m, za7h.d[w12, 0]
    17f4: e5fb4522     	st1d	{ z2.d }, p1, [x9, x27, lsl #3]
    17f8: 8b1c0109     	add	x9, x8, x28
    17fc: e5e1e503     	st1d	{ z3.d }, p1, [x8, #0x1, mul vl]
    1800: 5280008c     	mov	w12, #0x4               // =4
    1804: e5e2e504     	st1d	{ z4.d }, p1, [x8, #0x2, mul vl]
    1808: e5e3e505     	st1d	{ z5.d }, p1, [x8, #0x3, mul vl]
    180c: c0c24502     	mov	z2.d, p1/m, za4h.d[w14, 0]
    1810: c0c24543     	mov	z3.d, p1/m, za5h.d[w14, 0]
    1814: c0c24584     	mov	z4.d, p1/m, za6h.d[w14, 0]
    1818: c0c245c5     	mov	z5.d, p1/m, za7h.d[w14, 0]
    181c: e5fb4502     	st1d	{ z2.d }, p1, [x8, x27, lsl #3]
    1820: 8b1c0128     	add	x8, x9, x28
    1824: e5e1e523     	st1d	{ z3.d }, p1, [x9, #0x1, mul vl]
    1828: e5e2e524     	st1d	{ z4.d }, p1, [x9, #0x2, mul vl]
    182c: e5e3e525     	st1d	{ z5.d }, p1, [x9, #0x3, mul vl]
    1830: c0c26502     	mov	z2.d, p1/m, za4h.d[w15, 0]
    1834: c0c26543     	mov	z3.d, p1/m, za5h.d[w15, 0]
    1838: c0c26584     	mov	z4.d, p1/m, za6h.d[w15, 0]
    183c: c0c265c5     	mov	z5.d, p1/m, za7h.d[w15, 0]
    1840: e5fb4522     	st1d	{ z2.d }, p1, [x9, x27, lsl #3]
    1844: 8b1c0109     	add	x9, x8, x28
    1848: e5e1e503     	st1d	{ z3.d }, p1, [x8, #0x1, mul vl]
    184c: e5e2e504     	st1d	{ z4.d }, p1, [x8, #0x2, mul vl]
    1850: e5e3e505     	st1d	{ z5.d }, p1, [x8, #0x3, mul vl]
    1854: c0c20502     	mov	z2.d, p1/m, za4h.d[w12, 0]
    1858: c0c20543     	mov	z3.d, p1/m, za5h.d[w12, 0]
    185c: c0c20584     	mov	z4.d, p1/m, za6h.d[w12, 0]
    1860: c0c205c5     	mov	z5.d, p1/m, za7h.d[w12, 0]
    1864: e5fb4502     	st1d	{ z2.d }, p1, [x8, x27, lsl #3]
    1868: 528000ac     	mov	w12, #0x5               // =5
    186c: e5e1e523     	st1d	{ z3.d }, p1, [x9, #0x1, mul vl]
    1870: 8b1c0128     	add	x8, x9, x28
    1874: e5e2e524     	st1d	{ z4.d }, p1, [x9, #0x2, mul vl]
    1878: e5e3e525     	st1d	{ z5.d }, p1, [x9, #0x3, mul vl]
    187c: c0c20502     	mov	z2.d, p1/m, za4h.d[w12, 0]
    1880: c0c20543     	mov	z3.d, p1/m, za5h.d[w12, 0]
    1884: c0c20584     	mov	z4.d, p1/m, za6h.d[w12, 0]
    1888: c0c205c5     	mov	z5.d, p1/m, za7h.d[w12, 0]
    188c: e5fb4522     	st1d	{ z2.d }, p1, [x9, x27, lsl #3]
    1890: 528000cc     	mov	w12, #0x6               // =6
    1894: e5e1e503     	st1d	{ z3.d }, p1, [x8, #0x1, mul vl]
    1898: 8b1c0109     	add	x9, x8, x28
    189c: e5e2e504     	st1d	{ z4.d }, p1, [x8, #0x2, mul vl]
    18a0: e5e3e505     	st1d	{ z5.d }, p1, [x8, #0x3, mul vl]
    18a4: c0c20502     	mov	z2.d, p1/m, za4h.d[w12, 0]
    18a8: c0c20543     	mov	z3.d, p1/m, za5h.d[w12, 0]
    18ac: c0c20584     	mov	z4.d, p1/m, za6h.d[w12, 0]
    18b0: c0c205c5     	mov	z5.d, p1/m, za7h.d[w12, 0]
    18b4: e5fb4502     	st1d	{ z2.d }, p1, [x8, x27, lsl #3]
    18b8: 528000ec     	mov	w12, #0x7               // =7
    18bc: e5e1e523     	st1d	{ z3.d }, p1, [x9, #0x1, mul vl]
    18c0: 8b1c0128     	add	x8, x9, x28
    18c4: e5e2e524     	st1d	{ z4.d }, p1, [x9, #0x2, mul vl]
    18c8: e5e3e525     	st1d	{ z5.d }, p1, [x9, #0x3, mul vl]
    18cc: c0c20502     	mov	z2.d, p1/m, za4h.d[w12, 0]
    18d0: c0c20543     	mov	z3.d, p1/m, za5h.d[w12, 0]
    18d4: c0c20584     	mov	z4.d, p1/m, za6h.d[w12, 0]
    18d8: c0c205c5     	mov	z5.d, p1/m, za7h.d[w12, 0]
    18dc: e5fb4522     	st1d	{ z2.d }, p1, [x9, x27, lsl #3]
    18e0: e5e1e503     	st1d	{ z3.d }, p1, [x8, #0x1, mul vl]
    18e4: e5e2e504     	st1d	{ z4.d }, p1, [x8, #0x2, mul vl]
    18e8: e5e3e505     	st1d	{ z5.d }, p1, [x8, #0x3, mul vl]
    18ec: b9400208     	ldr	w8, [x16]
    18f0: 110004c6     	add	w6, w6, #0x1
    18f4: 6b0800df     	cmp	w6, w8
    18f8: 54ffe9ca     	b.ge	0x1630 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xf4>
    18fc: b9400355     	ldr	w21, [x26]
    1900: b9800069     	ldrsw	x9, [x3]
    1904: f940004b     	ldr	x11, [x2]
    1908: f9400337     	ldr	x23, [x25]
    190c: 3940002d     	ldrb	w13, [x1]
    1910: f9400093     	ldr	x19, [x4]
    1914: 0b0602a8     	add	w8, w21, w6
    1918: 1b057d2a     	mul	w10, w9, w5
    191c: 531b6908     	lsl	w8, w8, #5
    1920: 937d7d08     	sbfiz	x8, x8, #3, #32
    1924: 8b2acd6c     	add	x12, x11, w10, sxtw #3
    1928: b94002ca     	ldr	w10, [x22]
    192c: b940028b     	ldr	w11, [x20]
    1930: 8b080187     	add	x7, x12, x8
    1934: 3400006d     	cbz	w13, 0x1940 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x404>
    1938: c00800ff     	zero	{za}
    193c: 140000a0     	b	0x1bbc <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x680>
    1940: 85800001     	ldr	p1, [x0]
    1944: d37df138     	lsl	x24, x9, #3
    1948: 5280002c     	mov	w12, #0x1               // =1
    194c: 8b1800ee     	add	x14, x7, x24
    1950: a5e0a4e2     	ld1d	{ z2.d }, p1/z, [x7]
    1954: a5e1a4e3     	ld1d	{ z3.d }, p1/z, [x7, #0x1, mul vl]
    1958: a5e2a4e4     	ld1d	{ z4.d }, p1/z, [x7, #0x2, mul vl]
    195c: a5e3a4e5     	ld1d	{ z5.d }, p1/z, [x7, #0x3, mul vl]
    1960: 8b1801cf     	add	x15, x14, x24
    1964: c0c02440     	mov	za0h.d[w13, 0], p1/m, z2.d
    1968: c0c02462     	mov	za1h.d[w13, 0], p1/m, z3.d
    196c: c0c02484     	mov	za2h.d[w13, 0], p1/m, z4.d
    1970: c0c024a6     	mov	za3h.d[w13, 0], p1/m, z5.d
    1974: a5e944e2     	ld1d	{ z2.d }, p1/z, [x7, x9, lsl #3]
    1978: a5e1a5c3     	ld1d	{ z3.d }, p1/z, [x14, #0x1, mul vl]
    197c: a5e2a5c4     	ld1d	{ z4.d }, p1/z, [x14, #0x2, mul vl]
    1980: a5e3a5c5     	ld1d	{ z5.d }, p1/z, [x14, #0x3, mul vl]
    1984: c0c00440     	mov	za0h.d[w12, 0], p1/m, z2.d
    1988: c0c00462     	mov	za1h.d[w12, 0], p1/m, z3.d
    198c: c0c00484     	mov	za2h.d[w12, 0], p1/m, z4.d
    1990: c0c004a6     	mov	za3h.d[w12, 0], p1/m, z5.d
    1994: a5e945c2     	ld1d	{ z2.d }, p1/z, [x14, x9, lsl #3]
    1998: a5e1a5e3     	ld1d	{ z3.d }, p1/z, [x15, #0x1, mul vl]
    199c: a5e2a5e4     	ld1d	{ z4.d }, p1/z, [x15, #0x2, mul vl]
    19a0: a5e3a5e5     	ld1d	{ z5.d }, p1/z, [x15, #0x3, mul vl]
    19a4: 8b1801ee     	add	x14, x15, x24
    19a8: 5280004c     	mov	w12, #0x2               // =2
    19ac: c0c00440     	mov	za0h.d[w12, 0], p1/m, z2.d
    19b0: c0c00462     	mov	za1h.d[w12, 0], p1/m, z3.d
    19b4: c0c00484     	mov	za2h.d[w12, 0], p1/m, z4.d
    19b8: c0c004a6     	mov	za3h.d[w12, 0], p1/m, z5.d
    19bc: a5e945e2     	ld1d	{ z2.d }, p1/z, [x15, x9, lsl #3]
    19c0: a5e1a5c3     	ld1d	{ z3.d }, p1/z, [x14, #0x1, mul vl]
    19c4: a5e2a5c4     	ld1d	{ z4.d }, p1/z, [x14, #0x2, mul vl]
    19c8: a5e3a5c5     	ld1d	{ z5.d }, p1/z, [x14, #0x3, mul vl]
    19cc: 8b1801cf     	add	x15, x14, x24
    19d0: 5280006c     	mov	w12, #0x3               // =3
    19d4: c0c00440     	mov	za0h.d[w12, 0], p1/m, z2.d
    19d8: c0c00462     	mov	za1h.d[w12, 0], p1/m, z3.d
    19dc: c0c00484     	mov	za2h.d[w12, 0], p1/m, z4.d
    19e0: c0c004a6     	mov	za3h.d[w12, 0], p1/m, z5.d
    19e4: a5e945c2     	ld1d	{ z2.d }, p1/z, [x14, x9, lsl #3]
    19e8: a5e1a5e3     	ld1d	{ z3.d }, p1/z, [x15, #0x1, mul vl]
    19ec: a5e2a5e4     	ld1d	{ z4.d }, p1/z, [x15, #0x2, mul vl]
    19f0: a5e3a5e5     	ld1d	{ z5.d }, p1/z, [x15, #0x3, mul vl]
    19f4: 8b1801ee     	add	x14, x15, x24
    19f8: 5280008c     	mov	w12, #0x4               // =4
    19fc: c0c00440     	mov	za0h.d[w12, 0], p1/m, z2.d
    1a00: c0c00462     	mov	za1h.d[w12, 0], p1/m, z3.d
    1a04: c0c00484     	mov	za2h.d[w12, 0], p1/m, z4.d
    1a08: c0c004a6     	mov	za3h.d[w12, 0], p1/m, z5.d
    1a0c: a5e945e2     	ld1d	{ z2.d }, p1/z, [x15, x9, lsl #3]
    1a10: a5e1a5c3     	ld1d	{ z3.d }, p1/z, [x14, #0x1, mul vl]
    1a14: a5e2a5c4     	ld1d	{ z4.d }, p1/z, [x14, #0x2, mul vl]
    1a18: a5e3a5c5     	ld1d	{ z5.d }, p1/z, [x14, #0x3, mul vl]
    1a1c: 8b1801cf     	add	x15, x14, x24
    1a20: 528000ac     	mov	w12, #0x5               // =5
    1a24: c0c00440     	mov	za0h.d[w12, 0], p1/m, z2.d
    1a28: c0c00462     	mov	za1h.d[w12, 0], p1/m, z3.d
    1a2c: c0c00484     	mov	za2h.d[w12, 0], p1/m, z4.d
    1a30: c0c004a6     	mov	za3h.d[w12, 0], p1/m, z5.d
    1a34: a5e945c2     	ld1d	{ z2.d }, p1/z, [x14, x9, lsl #3]
    1a38: a5e1a5e3     	ld1d	{ z3.d }, p1/z, [x15, #0x1, mul vl]
    1a3c: a5e2a5e4     	ld1d	{ z4.d }, p1/z, [x15, #0x2, mul vl]
    1a40: a5e3a5e5     	ld1d	{ z5.d }, p1/z, [x15, #0x3, mul vl]
    1a44: 8b1801ee     	add	x14, x15, x24
    1a48: 528000cc     	mov	w12, #0x6               // =6
    1a4c: c0c00440     	mov	za0h.d[w12, 0], p1/m, z2.d
    1a50: c0c00462     	mov	za1h.d[w12, 0], p1/m, z3.d
    1a54: c0c00484     	mov	za2h.d[w12, 0], p1/m, z4.d
    1a58: c0c004a6     	mov	za3h.d[w12, 0], p1/m, z5.d
    1a5c: a5e945e2     	ld1d	{ z2.d }, p1/z, [x15, x9, lsl #3]
    1a60: a5e1a5c3     	ld1d	{ z3.d }, p1/z, [x14, #0x1, mul vl]
    1a64: a5e2a5c4     	ld1d	{ z4.d }, p1/z, [x14, #0x2, mul vl]
    1a68: a5e3a5c5     	ld1d	{ z5.d }, p1/z, [x14, #0x3, mul vl]
    1a6c: 8b1801cf     	add	x15, x14, x24
    1a70: 528000ec     	mov	w12, #0x7               // =7
    1a74: c0c00440     	mov	za0h.d[w12, 0], p1/m, z2.d
    1a78: c0c00462     	mov	za1h.d[w12, 0], p1/m, z3.d
    1a7c: c0c00484     	mov	za2h.d[w12, 0], p1/m, z4.d
    1a80: c0c004a6     	mov	za3h.d[w12, 0], p1/m, z5.d
    1a84: a5e945c2     	ld1d	{ z2.d }, p1/z, [x14, x9, lsl #3]
    1a88: a5e1a5e3     	ld1d	{ z3.d }, p1/z, [x15, #0x1, mul vl]
    1a8c: a5e2a5e4     	ld1d	{ z4.d }, p1/z, [x15, #0x2, mul vl]
    1a90: a5e3a5e5     	ld1d	{ z5.d }, p1/z, [x15, #0x3, mul vl]
    1a94: 8b1801ee     	add	x14, x15, x24
    1a98: 5280002c     	mov	w12, #0x1               // =1
    1a9c: c0c02448     	mov	za4h.d[w13, 0], p1/m, z2.d
    1aa0: c0c0246a     	mov	za5h.d[w13, 0], p1/m, z3.d
    1aa4: c0c0248c     	mov	za6h.d[w13, 0], p1/m, z4.d
    1aa8: c0c024ae     	mov	za7h.d[w13, 0], p1/m, z5.d
    1aac: a5e945e2     	ld1d	{ z2.d }, p1/z, [x15, x9, lsl #3]
    1ab0: a5e1a5c3     	ld1d	{ z3.d }, p1/z, [x14, #0x1, mul vl]
    1ab4: a5e2a5c4     	ld1d	{ z4.d }, p1/z, [x14, #0x2, mul vl]
    1ab8: a5e3a5c5     	ld1d	{ z5.d }, p1/z, [x14, #0x3, mul vl]
    1abc: 8b1801cd     	add	x13, x14, x24
    1ac0: c0c00448     	mov	za4h.d[w12, 0], p1/m, z2.d
    1ac4: c0c0046a     	mov	za5h.d[w12, 0], p1/m, z3.d
    1ac8: c0c0048c     	mov	za6h.d[w12, 0], p1/m, z4.d
    1acc: c0c004ae     	mov	za7h.d[w12, 0], p1/m, z5.d
    1ad0: a5e945c2     	ld1d	{ z2.d }, p1/z, [x14, x9, lsl #3]
    1ad4: a5e1a5a3     	ld1d	{ z3.d }, p1/z, [x13, #0x1, mul vl]
    1ad8: a5e2a5a4     	ld1d	{ z4.d }, p1/z, [x13, #0x2, mul vl]
    1adc: a5e3a5a5     	ld1d	{ z5.d }, p1/z, [x13, #0x3, mul vl]
    1ae0: 8b1801ae     	add	x14, x13, x24
    1ae4: 5280004c     	mov	w12, #0x2               // =2
    1ae8: c0c00448     	mov	za4h.d[w12, 0], p1/m, z2.d
    1aec: c0c0046a     	mov	za5h.d[w12, 0], p1/m, z3.d
    1af0: c0c0048c     	mov	za6h.d[w12, 0], p1/m, z4.d
    1af4: c0c004ae     	mov	za7h.d[w12, 0], p1/m, z5.d
    1af8: a5e945a2     	ld1d	{ z2.d }, p1/z, [x13, x9, lsl #3]
    1afc: a5e1a5c3     	ld1d	{ z3.d }, p1/z, [x14, #0x1, mul vl]
    1b00: a5e2a5c4     	ld1d	{ z4.d }, p1/z, [x14, #0x2, mul vl]
    1b04: a5e3a5c5     	ld1d	{ z5.d }, p1/z, [x14, #0x3, mul vl]
    1b08: 8b1801cd     	add	x13, x14, x24
    1b0c: 5280006c     	mov	w12, #0x3               // =3
    1b10: c0c00448     	mov	za4h.d[w12, 0], p1/m, z2.d
    1b14: c0c0046a     	mov	za5h.d[w12, 0], p1/m, z3.d
    1b18: c0c0048c     	mov	za6h.d[w12, 0], p1/m, z4.d
    1b1c: c0c004ae     	mov	za7h.d[w12, 0], p1/m, z5.d
    1b20: a5e945c2     	ld1d	{ z2.d }, p1/z, [x14, x9, lsl #3]
    1b24: a5e1a5a3     	ld1d	{ z3.d }, p1/z, [x13, #0x1, mul vl]
    1b28: a5e2a5a4     	ld1d	{ z4.d }, p1/z, [x13, #0x2, mul vl]
    1b2c: a5e3a5a5     	ld1d	{ z5.d }, p1/z, [x13, #0x3, mul vl]
    1b30: 8b1801ae     	add	x14, x13, x24
    1b34: 5280008c     	mov	w12, #0x4               // =4
    1b38: c0c00448     	mov	za4h.d[w12, 0], p1/m, z2.d
    1b3c: c0c0046a     	mov	za5h.d[w12, 0], p1/m, z3.d
    1b40: c0c0048c     	mov	za6h.d[w12, 0], p1/m, z4.d
    1b44: c0c004ae     	mov	za7h.d[w12, 0], p1/m, z5.d
    1b48: a5e945a2     	ld1d	{ z2.d }, p1/z, [x13, x9, lsl #3]
    1b4c: a5e1a5c3     	ld1d	{ z3.d }, p1/z, [x14, #0x1, mul vl]
    1b50: a5e2a5c4     	ld1d	{ z4.d }, p1/z, [x14, #0x2, mul vl]
    1b54: a5e3a5c5     	ld1d	{ z5.d }, p1/z, [x14, #0x3, mul vl]
    1b58: 8b1801cd     	add	x13, x14, x24
    1b5c: 528000ac     	mov	w12, #0x5               // =5
    1b60: c0c00448     	mov	za4h.d[w12, 0], p1/m, z2.d
    1b64: c0c0046a     	mov	za5h.d[w12, 0], p1/m, z3.d
    1b68: c0c0048c     	mov	za6h.d[w12, 0], p1/m, z4.d
    1b6c: c0c004ae     	mov	za7h.d[w12, 0], p1/m, z5.d
    1b70: a5e945c2     	ld1d	{ z2.d }, p1/z, [x14, x9, lsl #3]
    1b74: a5e1a5a3     	ld1d	{ z3.d }, p1/z, [x13, #0x1, mul vl]
    1b78: a5e2a5a4     	ld1d	{ z4.d }, p1/z, [x13, #0x2, mul vl]
    1b7c: a5e3a5a5     	ld1d	{ z5.d }, p1/z, [x13, #0x3, mul vl]
    1b80: 8b1801ac     	add	x12, x13, x24
    1b84: 528000ce     	mov	w14, #0x6               // =6
    1b88: c0c04448     	mov	za4h.d[w14, 0], p1/m, z2.d
    1b8c: c0c0446a     	mov	za5h.d[w14, 0], p1/m, z3.d
    1b90: c0c0448c     	mov	za6h.d[w14, 0], p1/m, z4.d
    1b94: c0c044ae     	mov	za7h.d[w14, 0], p1/m, z5.d
    1b98: a5e945a2     	ld1d	{ z2.d }, p1/z, [x13, x9, lsl #3]
    1b9c: a5e1a583     	ld1d	{ z3.d }, p1/z, [x12, #0x1, mul vl]
    1ba0: a5e2a584     	ld1d	{ z4.d }, p1/z, [x12, #0x2, mul vl]
    1ba4: a5e3a585     	ld1d	{ z5.d }, p1/z, [x12, #0x3, mul vl]
    1ba8: 528000ec     	mov	w12, #0x7               // =7
    1bac: c0c00448     	mov	za4h.d[w12, 0], p1/m, z2.d
    1bb0: c0c0046a     	mov	za5h.d[w12, 0], p1/m, z3.d
    1bb4: c0c0048c     	mov	za6h.d[w12, 0], p1/m, z4.d
    1bb8: c0c004ae     	mov	za7h.d[w12, 0], p1/m, z5.d
    1bbc: 1b0a7d6b     	mul	w11, w11, w10
    1bc0: b9400258     	ldr	w24, [x18]
    1bc4: 85800001     	ldr	p1, [x0]
    1bc8: 1b0a7d2a     	mul	w10, w9, w10
    1bcc: b980029e     	ldrsw	x30, [x20]
    1bd0: b980006d     	ldrsw	x13, [x3]
    1bd4: 7100231f     	cmp	w24, #0x8
    1bd8: 5400012a     	b.ge	0x1bfc <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x6c0>
    1bdc: 8b050ee9     	add	x9, x23, x5, lsl #3
    1be0: 8b08026c     	add	x12, x19, x8
    1be4: 8b2bcd28     	add	x8, x9, w11, sxtw #3
    1be8: 8b2acd89     	add	x9, x12, w10, sxtw #3
    1bec: 2a1f03ea     	mov	w10, wzr
    1bf0: 6b1f030a     	subs	w10, w24, wzr
    1bf4: 5400294c     	b.gt	0x211c <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xbe0>
    1bf8: 1400015d     	b	0x216c <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xc30>
    1bfc: d37cefc9     	lsl	x9, x30, #4
    1c00: 05e03bc2     	mov	z2.d, x30
    1c04: 52800711     	mov	w17, #0x38              // =56
    1c08: 05e039a4     	mov	z4.d, x13
    1c0c: aa0d03e5     	mov	x5, x13
    1c10: 52800612     	mov	w18, #0x30              // =48
    1c14: 05e03923     	mov	z3.d, x9
    1c18: 93407d69     	sxtw	x9, w11
    1c1c: d37cedab     	lsl	x11, x13, #4
    1c20: 52800500     	mov	w0, #0x28               // =40
    1c24: 52800314     	mov	w20, #0x18              // =24
    1c28: 93407d4a     	sxtw	x10, w10
    1c2c: 0433507a     	addvl	x26, x19, #0x3
    1c30: 0433503c     	addvl	x28, x19, #0x1
    1c34: 04335044     	addvl	x4, x19, #0x2
    1c38: 04c0c062     	mad	z2.d, p0/m, z0.d, z3.d
    1c3c: 05e03963     	mov	z3.d, x11
    1c40: b900c7e6     	str	w6, [sp, #0xc4]
    1c44: a948afe1     	ldp	x1, x11, [sp, #0x88]
    1c48: f9005fe7     	str	x7, [sp, #0xb8]
    1c4c: aa1f03e3     	mov	x3, xzr
    1c50: aa1f03e8     	mov	x8, xzr
    1c54: 04c44003     	mla	z3.d, p0/m, z0.d, z4.d
    1c58: 8b09016b     	add	x11, x11, x9
    1c5c: d37df129     	lsl	x9, x9, #3
    1c60: 8b0102ed     	add	x13, x23, x1
    1c64: d37df16b     	lsl	x11, x11, #3
    1c68: 9b312fcc     	smaddl	x12, w30, w17, x11
    1c6c: 8b0901af     	add	x15, x13, x9
    1c70: 9b322fce     	smaddl	x14, w30, w18, x11
    1c74: f81e03af     	stur	x15, [x29, #-0x20]
    1c78: 0437502f     	addvl	x15, x23, #0x1
    1c7c: 8b0c01f0     	add	x16, x15, x12
    1c80: 8b0c02ec     	add	x12, x23, x12
    1c84: a93d43ac     	stp	x12, x16, [x29, #-0x30]
    1c88: 9b202fcc     	smaddl	x12, w30, w0, x11
    1c8c: 8b0e01f0     	add	x16, x15, x14
    1c90: 8b0e02ee     	add	x14, x23, x14
    1c94: a93c43ae     	stp	x14, x16, [x29, #-0x40]
    1c98: 8b1e156e     	add	x14, x11, x30, lsl #5
    1c9c: 9b342fcb     	smaddl	x11, w30, w20, x11
    1ca0: 0b0602b0     	add	w16, w21, w6
    1ca4: 8b0c01e2     	add	x2, x15, x12
    1ca8: 8b0c02ec     	add	x12, x23, x12
    1cac: a93b0bac     	stp	x12, x2, [x29, #-0x50]
    1cb0: 531b6a0c     	lsl	w12, w16, #5
    1cb4: 8b0e01f0     	add	x16, x15, x14
    1cb8: 8b0e02ee     	add	x14, x23, x14
    1cbc: a93a43ae     	stp	x14, x16, [x29, #-0x60]
    1cc0: 8b1e112e     	add	x14, x9, x30, lsl #4
    1cc4: 8b0b01f0     	add	x16, x15, x11
    1cc8: f81983b0     	stur	x16, [x29, #-0x68]
    1ccc: 8b0101ef     	add	x15, x15, x1
    1cd0: 8b2cc150     	add	x16, x10, w12, sxtw
    1cd4: 8b0b02eb     	add	x11, x23, x11
    1cd8: d37df14a     	lsl	x10, x10, #3
    1cdc: f81903ab     	stur	x11, [x29, #-0x70]
    1ce0: 8b0e01eb     	add	x11, x15, x14
    1ce4: 8b0e01ae     	add	x14, x13, x14
    1ce8: a9382fae     	stp	x14, x11, [x29, #-0x80]
    1cec: 8b1e0d2b     	add	x11, x9, x30, lsl #3
    1cf0: 8b0901e9     	add	x9, x15, x9
    1cf4: d37df20e     	lsl	x14, x16, #3
    1cf8: 9b3138b0     	smaddl	x16, w5, w17, x14
    1cfc: 8b0b01f1     	add	x17, x15, x11
    1d00: 8b0b01ab     	add	x11, x13, x11
    1d04: f81683a9     	stur	x9, [x29, #-0x98]
    1d08: 9b3238a9     	smaddl	x9, w5, w18, x14
    1d0c: a93747ab     	stp	x11, x17, [x29, #-0x90]
    1d10: 8b2ccd5b     	add	x27, x10, w12, sxtw #3
    1d14: 8b10034a     	add	x10, x26, x16
    1d18: 8b10038b     	add	x11, x28, x16
    1d1c: 9b3438ac     	smaddl	x12, w5, w20, x14
    1d20: f81603aa     	stur	x10, [x29, #-0xa0]
    1d24: 8b10008a     	add	x10, x4, x16
    1d28: aa0503ef     	mov	x15, x5
    1d2c: a9352bab     	stp	x11, x10, [x29, #-0xb0]
    1d30: 8b10026b     	add	x11, x19, x16
    1d34: 8b05136d     	add	x13, x27, x5, lsl #4
    1d38: 9b2038aa     	smaddl	x10, w5, w0, x14
    1d3c: 8b0c0356     	add	x22, x26, x12
    1d40: f81483ab     	stur	x11, [x29, #-0xb8]
    1d44: 8b09034b     	add	x11, x26, x9
    1d48: 8b0c0391     	add	x17, x28, x12
    1d4c: f81403ab     	stur	x11, [x29, #-0xc0]
    1d50: 8b09008b     	add	x11, x4, x9
    1d54: 8b0c0261     	add	x1, x19, x12
    1d58: f81383ab     	stur	x11, [x29, #-0xc8]
    1d5c: 8b09038b     	add	x11, x28, x9
    1d60: 8b090269     	add	x9, x19, x9
    1d64: f81303ab     	stur	x11, [x29, #-0xd0]
    1d68: 8b0515cb     	add	x11, x14, x5, lsl #5
    1d6c: 8b0a0385     	add	x5, x28, x10
    1d70: f9006fe9     	str	x9, [sp, #0xd8]
    1d74: 8b0a0349     	add	x9, x26, x10
    1d78: 8b0a0266     	add	x6, x19, x10
    1d7c: f9006be9     	str	x9, [sp, #0xd0]
    1d80: 8b0a0089     	add	x9, x4, x10
    1d84: 8b0b008a     	add	x10, x4, x11
    1d88: f90067e9     	str	x9, [sp, #0xc8]
    1d8c: 8b0b0349     	add	x9, x26, x11
    1d90: 8b0b038e     	add	x14, x28, x11
    1d94: 8b0b0275     	add	x21, x19, x11
    1d98: 8b0c008b     	add	x11, x4, x12
    1d9c: 8b0f0f6c     	add	x12, x27, x15, lsl #3
    1da0: 8b0d0357     	add	x23, x26, x13
    1da4: 8b0d0090     	add	x16, x4, x13
    1da8: 8b0d0380     	add	x0, x28, x13
    1dac: 8b0d0279     	add	x25, x19, x13
    1db0: a90afbef     	stp	x15, x30, [sp, #0xa8]
    1db4: d37ae7cd     	lsl	x13, x30, #6
    1db8: d37ae5ef     	lsl	x15, x15, #6
    1dbc: 8b1b0267     	add	x7, x19, x27
    1dc0: 8b0c0273     	add	x19, x19, x12
    1dc4: 8b0c0342     	add	x2, x26, x12
    1dc8: 8b0c0092     	add	x18, x4, x12
    1dcc: 8b0c038c     	add	x12, x28, x12
    1dd0: 8b1b035a     	add	x26, x26, x27
    1dd4: 8b1b009e     	add	x30, x4, x27
    1dd8: 8b1b039b     	add	x27, x28, x27
    1ddc: 140000b8     	b	0x20bc <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xb80>
    1de0: a5e0a484     	ld1d	{ z4.d }, p1/z, [x4]
    1de4: 8b030364     	add	x4, x27, x3
    1de8: a5e0a785     	ld1d	{ z5.d }, p1/z, [x28]
    1dec: a5e0a486     	ld1d	{ z6.d }, p1/z, [x4]
    1df0: f85683a4     	ldur	x4, [x29, #-0x98]
    1df4: 8b0303dc     	add	x28, x30, x3
    1df8: a5e0a787     	ld1d	{ z7.d }, p1/z, [x28]
    1dfc: 8b03035c     	add	x28, x26, x3
    1e00: 8b080084     	add	x4, x4, x8
    1e04: a5e0a791     	ld1d	{ z17.d }, p1/z, [x28]
    1e08: 8b03027c     	add	x28, x19, x3
    1e0c: a5e0a490     	ld1d	{ z16.d }, p1/z, [x4]
    1e10: 80c52480     	fmopa	za0.d, p1/m, p1/m, z4.d, z5.d
    1e14: 80c62481     	fmopa	za1.d, p1/m, p1/m, z4.d, z6.d
    1e18: 80c72482     	fmopa	za2.d, p1/m, p1/m, z4.d, z7.d
    1e1c: 80d12483     	fmopa	za3.d, p1/m, p1/m, z4.d, z17.d
    1e20: 80c52604     	fmopa	za4.d, p1/m, p1/m, z16.d, z5.d
    1e24: 80c62605     	fmopa	za5.d, p1/m, p1/m, z16.d, z6.d
    1e28: 80c72606     	fmopa	za6.d, p1/m, p1/m, z16.d, z7.d
    1e2c: 80d12607     	fmopa	za7.d, p1/m, p1/m, z16.d, z17.d
    1e30: a5e0a785     	ld1d	{ z5.d }, p1/z, [x28]
    1e34: a97773a4     	ldp	x4, x28, [x29, #-0x90]
    1e38: 8b080084     	add	x4, x4, x8
    1e3c: a5e0a484     	ld1d	{ z4.d }, p1/z, [x4]
    1e40: 8b030184     	add	x4, x12, x3
    1e44: 8b08039c     	add	x28, x28, x8
    1e48: a5e0a486     	ld1d	{ z6.d }, p1/z, [x4]
    1e4c: 8b030244     	add	x4, x18, x3
    1e50: a5e0a790     	ld1d	{ z16.d }, p1/z, [x28]
    1e54: a5e0a487     	ld1d	{ z7.d }, p1/z, [x4]
    1e58: 8b030044     	add	x4, x2, x3
    1e5c: 8b03033c     	add	x28, x25, x3
    1e60: a5e0a491     	ld1d	{ z17.d }, p1/z, [x4]
    1e64: 80c52480     	fmopa	za0.d, p1/m, p1/m, z4.d, z5.d
    1e68: 80c62481     	fmopa	za1.d, p1/m, p1/m, z4.d, z6.d
    1e6c: 80c72482     	fmopa	za2.d, p1/m, p1/m, z4.d, z7.d
    1e70: 80d12483     	fmopa	za3.d, p1/m, p1/m, z4.d, z17.d
    1e74: 80c52604     	fmopa	za4.d, p1/m, p1/m, z16.d, z5.d
    1e78: 80c62605     	fmopa	za5.d, p1/m, p1/m, z16.d, z6.d
    1e7c: 80c72606     	fmopa	za6.d, p1/m, p1/m, z16.d, z7.d
    1e80: 80d12607     	fmopa	za7.d, p1/m, p1/m, z16.d, z17.d
    1e84: a5e0a785     	ld1d	{ z5.d }, p1/z, [x28]
    1e88: a97873a4     	ldp	x4, x28, [x29, #-0x80]
    1e8c: 8b080084     	add	x4, x4, x8
    1e90: a5e0a484     	ld1d	{ z4.d }, p1/z, [x4]
    1e94: 8b030004     	add	x4, x0, x3
    1e98: 8b08039c     	add	x28, x28, x8
    1e9c: a5e0a486     	ld1d	{ z6.d }, p1/z, [x4]
    1ea0: 8b030204     	add	x4, x16, x3
    1ea4: a5e0a790     	ld1d	{ z16.d }, p1/z, [x28]
    1ea8: a5e0a487     	ld1d	{ z7.d }, p1/z, [x4]
    1eac: 8b0302e4     	add	x4, x23, x3
    1eb0: 8b03003c     	add	x28, x1, x3
    1eb4: a5e0a491     	ld1d	{ z17.d }, p1/z, [x4]
    1eb8: 80c52480     	fmopa	za0.d, p1/m, p1/m, z4.d, z5.d
    1ebc: 80c62481     	fmopa	za1.d, p1/m, p1/m, z4.d, z6.d
    1ec0: 80c72482     	fmopa	za2.d, p1/m, p1/m, z4.d, z7.d
    1ec4: 80d12483     	fmopa	za3.d, p1/m, p1/m, z4.d, z17.d
    1ec8: 80c52604     	fmopa	za4.d, p1/m, p1/m, z16.d, z5.d
    1ecc: 80c62605     	fmopa	za5.d, p1/m, p1/m, z16.d, z6.d
    1ed0: 80c72606     	fmopa	za6.d, p1/m, p1/m, z16.d, z7.d
    1ed4: 80d12607     	fmopa	za7.d, p1/m, p1/m, z16.d, z17.d
    1ed8: a5e0a785     	ld1d	{ z5.d }, p1/z, [x28]
    1edc: a97973a4     	ldp	x4, x28, [x29, #-0x70]
    1ee0: 8b080084     	add	x4, x4, x8
    1ee4: a5e0a484     	ld1d	{ z4.d }, p1/z, [x4]
    1ee8: 8b030224     	add	x4, x17, x3
    1eec: 8b08039c     	add	x28, x28, x8
    1ef0: a5e0a486     	ld1d	{ z6.d }, p1/z, [x4]
    1ef4: 8b030164     	add	x4, x11, x3
    1ef8: a5e0a790     	ld1d	{ z16.d }, p1/z, [x28]
    1efc: a5e0a487     	ld1d	{ z7.d }, p1/z, [x4]
    1f00: 8b0302c4     	add	x4, x22, x3
    1f04: 8b0302bc     	add	x28, x21, x3
    1f08: a5e0a491     	ld1d	{ z17.d }, p1/z, [x4]
    1f0c: 80c52480     	fmopa	za0.d, p1/m, p1/m, z4.d, z5.d
    1f10: 80c62481     	fmopa	za1.d, p1/m, p1/m, z4.d, z6.d
    1f14: 80c72482     	fmopa	za2.d, p1/m, p1/m, z4.d, z7.d
    1f18: 80d12483     	fmopa	za3.d, p1/m, p1/m, z4.d, z17.d
    1f1c: 80c52604     	fmopa	za4.d, p1/m, p1/m, z16.d, z5.d
    1f20: 80c62605     	fmopa	za5.d, p1/m, p1/m, z16.d, z6.d
    1f24: 80c72606     	fmopa	za6.d, p1/m, p1/m, z16.d, z7.d
    1f28: 80d12607     	fmopa	za7.d, p1/m, p1/m, z16.d, z17.d
    1f2c: a5e0a785     	ld1d	{ z5.d }, p1/z, [x28]
    1f30: a97a73a4     	ldp	x4, x28, [x29, #-0x60]
    1f34: 8b080084     	add	x4, x4, x8
    1f38: a5e0a484     	ld1d	{ z4.d }, p1/z, [x4]
    1f3c: 8b0301c4     	add	x4, x14, x3
    1f40: 8b08039c     	add	x28, x28, x8
    1f44: a5e0a486     	ld1d	{ z6.d }, p1/z, [x4]
    1f48: 8b030144     	add	x4, x10, x3
    1f4c: a5e0a790     	ld1d	{ z16.d }, p1/z, [x28]
    1f50: a5e0a487     	ld1d	{ z7.d }, p1/z, [x4]
    1f54: 8b030124     	add	x4, x9, x3
    1f58: 8b0300dc     	add	x28, x6, x3
    1f5c: a5e0a491     	ld1d	{ z17.d }, p1/z, [x4]
    1f60: 80c52480     	fmopa	za0.d, p1/m, p1/m, z4.d, z5.d
    1f64: 80c62481     	fmopa	za1.d, p1/m, p1/m, z4.d, z6.d
    1f68: 80c72482     	fmopa	za2.d, p1/m, p1/m, z4.d, z7.d
    1f6c: 80d12483     	fmopa	za3.d, p1/m, p1/m, z4.d, z17.d
    1f70: 80c52604     	fmopa	za4.d, p1/m, p1/m, z16.d, z5.d
    1f74: 80c62605     	fmopa	za5.d, p1/m, p1/m, z16.d, z6.d
    1f78: 80c72606     	fmopa	za6.d, p1/m, p1/m, z16.d, z7.d
    1f7c: 80d12607     	fmopa	za7.d, p1/m, p1/m, z16.d, z17.d
    1f80: a5e0a785     	ld1d	{ z5.d }, p1/z, [x28]
    1f84: a97b73a4     	ldp	x4, x28, [x29, #-0x50]
    1f88: 8b080084     	add	x4, x4, x8
    1f8c: a5e0a484     	ld1d	{ z4.d }, p1/z, [x4]
    1f90: 8b0300a4     	add	x4, x5, x3
    1f94: 8b08039c     	add	x28, x28, x8
    1f98: a5e0a486     	ld1d	{ z6.d }, p1/z, [x4]
    1f9c: f94067e4     	ldr	x4, [sp, #0xc8]
    1fa0: a5e0a790     	ld1d	{ z16.d }, p1/z, [x28]
    1fa4: 8b030084     	add	x4, x4, x3
    1fa8: a5e0a487     	ld1d	{ z7.d }, p1/z, [x4]
    1fac: a94d73e4     	ldp	x4, x28, [sp, #0xd0]
    1fb0: 8b030084     	add	x4, x4, x3
    1fb4: a5e0a491     	ld1d	{ z17.d }, p1/z, [x4]
    1fb8: 80c52480     	fmopa	za0.d, p1/m, p1/m, z4.d, z5.d
    1fbc: 80c62481     	fmopa	za1.d, p1/m, p1/m, z4.d, z6.d
    1fc0: 80c72482     	fmopa	za2.d, p1/m, p1/m, z4.d, z7.d
    1fc4: 80d12483     	fmopa	za3.d, p1/m, p1/m, z4.d, z17.d
    1fc8: 80c52604     	fmopa	za4.d, p1/m, p1/m, z16.d, z5.d
    1fcc: 80c62605     	fmopa	za5.d, p1/m, p1/m, z16.d, z6.d
    1fd0: 80c72606     	fmopa	za6.d, p1/m, p1/m, z16.d, z7.d
    1fd4: 80d12607     	fmopa	za7.d, p1/m, p1/m, z16.d, z17.d
    1fd8: f85c03a4     	ldur	x4, [x29, #-0x40]
    1fdc: 8b080084     	add	x4, x4, x8
    1fe0: a5e0a484     	ld1d	{ z4.d }, p1/z, [x4]
    1fe4: f85303a4     	ldur	x4, [x29, #-0xd0]
    1fe8: 8b03039c     	add	x28, x28, x3
    1fec: a5e0a785     	ld1d	{ z5.d }, p1/z, [x28]
    1ff0: f85c83bc     	ldur	x28, [x29, #-0x38]
    1ff4: 8b030084     	add	x4, x4, x3
    1ff8: a5e0a486     	ld1d	{ z6.d }, p1/z, [x4]
    1ffc: f85383a4     	ldur	x4, [x29, #-0xc8]
    2000: 8b08039c     	add	x28, x28, x8
    2004: a5e0a790     	ld1d	{ z16.d }, p1/z, [x28]
    2008: 8b030084     	add	x4, x4, x3
    200c: a5e0a487     	ld1d	{ z7.d }, p1/z, [x4]
    2010: a97473a4     	ldp	x4, x28, [x29, #-0xc0]
    2014: 8b030084     	add	x4, x4, x3
    2018: a5e0a491     	ld1d	{ z17.d }, p1/z, [x4]
    201c: 80c52480     	fmopa	za0.d, p1/m, p1/m, z4.d, z5.d
    2020: 80c62481     	fmopa	za1.d, p1/m, p1/m, z4.d, z6.d
    2024: 80c72482     	fmopa	za2.d, p1/m, p1/m, z4.d, z7.d
    2028: 80d12483     	fmopa	za3.d, p1/m, p1/m, z4.d, z17.d
    202c: 80c52604     	fmopa	za4.d, p1/m, p1/m, z16.d, z5.d
    2030: 80c62605     	fmopa	za5.d, p1/m, p1/m, z16.d, z6.d
    2034: 80c72606     	fmopa	za6.d, p1/m, p1/m, z16.d, z7.d
    2038: 80d12607     	fmopa	za7.d, p1/m, p1/m, z16.d, z17.d
    203c: f85d03a4     	ldur	x4, [x29, #-0x30]
    2040: 8b080084     	add	x4, x4, x8
    2044: a5e0a484     	ld1d	{ z4.d }, p1/z, [x4]
    2048: f85503a4     	ldur	x4, [x29, #-0xb0]
    204c: 8b03039c     	add	x28, x28, x3
    2050: a5e0a785     	ld1d	{ z5.d }, p1/z, [x28]
    2054: f85d83bc     	ldur	x28, [x29, #-0x28]
    2058: 8b030084     	add	x4, x4, x3
    205c: a5e0a486     	ld1d	{ z6.d }, p1/z, [x4]
    2060: f85583a4     	ldur	x4, [x29, #-0xa8]
    2064: 8b08039c     	add	x28, x28, x8
    2068: a5e0a790     	ld1d	{ z16.d }, p1/z, [x28]
    206c: 8b0d0108     	add	x8, x8, x13
    2070: 8b030084     	add	x4, x4, x3
    2074: a5e0a487     	ld1d	{ z7.d }, p1/z, [x4]
    2078: f85603a4     	ldur	x4, [x29, #-0xa0]
    207c: 8b030084     	add	x4, x4, x3
    2080: 8b0f0063     	add	x3, x3, x15
    2084: a5e0a491     	ld1d	{ z17.d }, p1/z, [x4]
    2088: 51002284     	sub	w4, w20, #0x8
    208c: 80c52480     	fmopa	za0.d, p1/m, p1/m, z4.d, z5.d
    2090: 6b18009f     	cmp	w4, w24
    2094: 11002284     	add	w4, w20, #0x8
    2098: 80c62481     	fmopa	za1.d, p1/m, p1/m, z4.d, z6.d
    209c: 2a0403f4     	mov	w20, w4
    20a0: 80c72482     	fmopa	za2.d, p1/m, p1/m, z4.d, z7.d
    20a4: 80d12483     	fmopa	za3.d, p1/m, p1/m, z4.d, z17.d
    20a8: 80c52604     	fmopa	za4.d, p1/m, p1/m, z16.d, z5.d
    20ac: 80c62605     	fmopa	za5.d, p1/m, p1/m, z16.d, z6.d
    20b0: 80c72606     	fmopa	za6.d, p1/m, p1/m, z16.d, z7.d
    20b4: 80d12607     	fmopa	za7.d, p1/m, p1/m, z16.d, z17.d
    20b8: 5400012c     	b.gt	0x20dc <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xba0>
    20bc: f85e03a4     	ldur	x4, [x29, #-0x20]
    20c0: 6b18029f     	cmp	w20, w24
    20c4: 8b0300fc     	add	x28, x7, x3
    20c8: 8b080084     	add	x4, x4, x8
    20cc: 54ffe8ac     	b.gt	0x1de0 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x8a4>
    20d0: c462e480     	prfd	pldl1keep, p1, [x4, z2.d, lsl #3]
    20d4: c463e780     	prfd	pldl1keep, p1, [x28, z3.d, lsl #3]
    20d8: 17ffff42     	b	0x1de0 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x8a4>
    20dc: 8b0300e9     	add	x9, x7, x3
    20e0: f85e03aa     	ldur	x10, [x29, #-0x20]
    20e4: f94013e4     	ldr	x4, [sp, #0x20]
    20e8: a946d3f6     	ldp	x22, x20, [sp, #0x68]
    20ec: b940c7e6     	ldr	w6, [sp, #0xc4]
    20f0: a945e7fa     	ldp	x26, x25, [sp, #0x58]
    20f4: 8b080148     	add	x8, x10, x8
    20f8: a94797f0     	ldp	x16, x5, [sp, #0x78]
    20fc: 121d6f0a     	and	w10, w24, #0x7ffffff8
    2100: a944c7f2     	ldp	x18, x17, [sp, #0x48]
    2104: f94057ed     	ldr	x13, [sp, #0xa8]
    2108: a94383e1     	ldp	x1, x0, [sp, #0x38]
    210c: a9428be3     	ldp	x3, x2, [sp, #0x28]
    2110: a94b1ffe     	ldp	x30, x7, [sp, #0xb0]
    2114: 6b0a030a     	subs	w10, w24, w10
    2118: 540002ad     	b.le	0x216c <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xc30>
    211c: d37df3cb     	lsl	x11, x30, #3
    2120: d37df1ac     	lsl	x12, x13, #3
    2124: a5e0a502     	ld1d	{ z2.d }, p1/z, [x8]
    2128: a5e0a523     	ld1d	{ z3.d }, p1/z, [x9]
    212c: 7100054a     	subs	w10, w10, #0x1
    2130: a5e1a524     	ld1d	{ z4.d }, p1/z, [x9, #0x1, mul vl]
    2134: a5e1a505     	ld1d	{ z5.d }, p1/z, [x8, #0x1, mul vl]
    2138: 8b0b0108     	add	x8, x8, x11
    213c: a5e2a526     	ld1d	{ z6.d }, p1/z, [x9, #0x2, mul vl]
    2140: a5e3a527     	ld1d	{ z7.d }, p1/z, [x9, #0x3, mul vl]
    2144: 8b0c0129     	add	x9, x9, x12
    2148: 80c32440     	fmopa	za0.d, p1/m, p1/m, z2.d, z3.d
    214c: 80c42441     	fmopa	za1.d, p1/m, p1/m, z2.d, z4.d
    2150: 80c62442     	fmopa	za2.d, p1/m, p1/m, z2.d, z6.d
    2154: 80c72443     	fmopa	za3.d, p1/m, p1/m, z2.d, z7.d
    2158: 80c324a4     	fmopa	za4.d, p1/m, p1/m, z5.d, z3.d
    215c: 80c424a5     	fmopa	za5.d, p1/m, p1/m, z5.d, z4.d
    2160: 80c624a6     	fmopa	za6.d, p1/m, p1/m, z5.d, z6.d
    2164: 80c724a7     	fmopa	za7.d, p1/m, p1/m, z5.d, z7.d
    2168: 54fffde1     	b.ne	0x2124 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xbe8>
    216c: b980007b     	ldrsw	x27, [x3]
    2170: 39400228     	ldrb	w8, [x17]
    2174: d37df37c     	lsl	x28, x27, #3
    2178: 34ffa808     	cbz	w8, 0x1678 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x13c>
    217c: 85800001     	ldr	p1, [x0]
    2180: a949a3e9     	ldp	x9, x8, [sp, #0x98]
    2184: 2a1f03ee     	mov	w14, wzr
    2188: 5280002c     	mov	w12, #0x1               // =1
    218c: 5280004d     	mov	w13, #0x2               // =2
    2190: 5280006f     	mov	w15, #0x3               // =3
    2194: 85c0e123     	ld1rd	{ z3.d }, p0/z, [x9]
    2198: 85c0e102     	ld1rd	{ z2.d }, p0/z, [x8]
    219c: c0c24404     	mov	z4.d, p1/m, za0h.d[w14, 0]
    21a0: c0c24445     	mov	z5.d, p1/m, za1h.d[w14, 0]
    21a4: 8b1c00e8     	add	x8, x7, x28
    21a8: c0c24486     	mov	z6.d, p1/m, za2h.d[w14, 0]
    21ac: 8b1c0109     	add	x9, x8, x28
    21b0: c0c244c7     	mov	z7.d, p1/m, za3h.d[w14, 0]
    21b4: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    21b8: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    21bc: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    21c0: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    21c4: 65ca8464     	fmulx	z4.d, p1/m, z4.d, z3.d
    21c8: 65ca8465     	fmulx	z5.d, p1/m, z5.d, z3.d
    21cc: 65ca8466     	fmulx	z6.d, p1/m, z6.d, z3.d
    21d0: 65ca8467     	fmulx	z7.d, p1/m, z7.d, z3.d
    21d4: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    21d8: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    21dc: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    21e0: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    21e4: 65c08444     	fadd	z4.d, p1/m, z4.d, z2.d
    21e8: 65c08445     	fadd	z5.d, p1/m, z5.d, z2.d
    21ec: 65c08446     	fadd	z6.d, p1/m, z6.d, z2.d
    21f0: 65c08447     	fadd	z7.d, p1/m, z7.d, z2.d
    21f4: e5e0e4e4     	st1d	{ z4.d }, p1, [x7]
    21f8: e5e1e4e5     	st1d	{ z5.d }, p1, [x7, #0x1, mul vl]
    21fc: e5e2e4e6     	st1d	{ z6.d }, p1, [x7, #0x2, mul vl]
    2200: e5e3e4e7     	st1d	{ z7.d }, p1, [x7, #0x3, mul vl]
    2204: c0c20404     	mov	z4.d, p1/m, za0h.d[w12, 0]
    2208: c0c20445     	mov	z5.d, p1/m, za1h.d[w12, 0]
    220c: c0c20486     	mov	z6.d, p1/m, za2h.d[w12, 0]
    2210: c0c204c7     	mov	z7.d, p1/m, za3h.d[w12, 0]
    2214: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    2218: 5280008c     	mov	w12, #0x4               // =4
    221c: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    2220: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    2224: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    2228: 65ca8464     	fmulx	z4.d, p1/m, z4.d, z3.d
    222c: 65ca8465     	fmulx	z5.d, p1/m, z5.d, z3.d
    2230: 65ca8466     	fmulx	z6.d, p1/m, z6.d, z3.d
    2234: 65ca8467     	fmulx	z7.d, p1/m, z7.d, z3.d
    2238: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    223c: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    2240: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    2244: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    2248: 65c08444     	fadd	z4.d, p1/m, z4.d, z2.d
    224c: 65c08445     	fadd	z5.d, p1/m, z5.d, z2.d
    2250: 65c08446     	fadd	z6.d, p1/m, z6.d, z2.d
    2254: 65c08447     	fadd	z7.d, p1/m, z7.d, z2.d
    2258: e5fb44e4     	st1d	{ z4.d }, p1, [x7, x27, lsl #3]
    225c: e5e1e505     	st1d	{ z5.d }, p1, [x8, #0x1, mul vl]
    2260: e5e2e506     	st1d	{ z6.d }, p1, [x8, #0x2, mul vl]
    2264: e5e3e507     	st1d	{ z7.d }, p1, [x8, #0x3, mul vl]
    2268: c0c22404     	mov	z4.d, p1/m, za0h.d[w13, 0]
    226c: c0c22445     	mov	z5.d, p1/m, za1h.d[w13, 0]
    2270: c0c22486     	mov	z6.d, p1/m, za2h.d[w13, 0]
    2274: c0c224c7     	mov	z7.d, p1/m, za3h.d[w13, 0]
    2278: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    227c: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    2280: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    2284: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    2288: 65ca8464     	fmulx	z4.d, p1/m, z4.d, z3.d
    228c: 65ca8465     	fmulx	z5.d, p1/m, z5.d, z3.d
    2290: 65ca8466     	fmulx	z6.d, p1/m, z6.d, z3.d
    2294: 65ca8467     	fmulx	z7.d, p1/m, z7.d, z3.d
    2298: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    229c: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    22a0: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    22a4: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    22a8: 65c08444     	fadd	z4.d, p1/m, z4.d, z2.d
    22ac: 65c08445     	fadd	z5.d, p1/m, z5.d, z2.d
    22b0: 65c08446     	fadd	z6.d, p1/m, z6.d, z2.d
    22b4: 65c08447     	fadd	z7.d, p1/m, z7.d, z2.d
    22b8: e5fb4504     	st1d	{ z4.d }, p1, [x8, x27, lsl #3]
    22bc: 8b1c0128     	add	x8, x9, x28
    22c0: e5e1e525     	st1d	{ z5.d }, p1, [x9, #0x1, mul vl]
    22c4: e5e2e526     	st1d	{ z6.d }, p1, [x9, #0x2, mul vl]
    22c8: e5e3e527     	st1d	{ z7.d }, p1, [x9, #0x3, mul vl]
    22cc: c0c26404     	mov	z4.d, p1/m, za0h.d[w15, 0]
    22d0: c0c26445     	mov	z5.d, p1/m, za1h.d[w15, 0]
    22d4: c0c26486     	mov	z6.d, p1/m, za2h.d[w15, 0]
    22d8: c0c264c7     	mov	z7.d, p1/m, za3h.d[w15, 0]
    22dc: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    22e0: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    22e4: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    22e8: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    22ec: 65ca8464     	fmulx	z4.d, p1/m, z4.d, z3.d
    22f0: 65ca8465     	fmulx	z5.d, p1/m, z5.d, z3.d
    22f4: 65ca8466     	fmulx	z6.d, p1/m, z6.d, z3.d
    22f8: 65ca8467     	fmulx	z7.d, p1/m, z7.d, z3.d
    22fc: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    2300: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    2304: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    2308: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    230c: 65c08444     	fadd	z4.d, p1/m, z4.d, z2.d
    2310: 65c08445     	fadd	z5.d, p1/m, z5.d, z2.d
    2314: 65c08446     	fadd	z6.d, p1/m, z6.d, z2.d
    2318: 65c08447     	fadd	z7.d, p1/m, z7.d, z2.d
    231c: e5fb4524     	st1d	{ z4.d }, p1, [x9, x27, lsl #3]
    2320: 8b1c0109     	add	x9, x8, x28
    2324: e5e1e505     	st1d	{ z5.d }, p1, [x8, #0x1, mul vl]
    2328: e5e2e506     	st1d	{ z6.d }, p1, [x8, #0x2, mul vl]
    232c: e5e3e507     	st1d	{ z7.d }, p1, [x8, #0x3, mul vl]
    2330: c0c20404     	mov	z4.d, p1/m, za0h.d[w12, 0]
    2334: c0c20445     	mov	z5.d, p1/m, za1h.d[w12, 0]
    2338: c0c20486     	mov	z6.d, p1/m, za2h.d[w12, 0]
    233c: c0c204c7     	mov	z7.d, p1/m, za3h.d[w12, 0]
    2340: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    2344: 528000ac     	mov	w12, #0x5               // =5
    2348: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    234c: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    2350: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    2354: 65ca8464     	fmulx	z4.d, p1/m, z4.d, z3.d
    2358: 65ca8465     	fmulx	z5.d, p1/m, z5.d, z3.d
    235c: 65ca8466     	fmulx	z6.d, p1/m, z6.d, z3.d
    2360: 65ca8467     	fmulx	z7.d, p1/m, z7.d, z3.d
    2364: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    2368: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    236c: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    2370: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    2374: 65c08444     	fadd	z4.d, p1/m, z4.d, z2.d
    2378: 65c08445     	fadd	z5.d, p1/m, z5.d, z2.d
    237c: 65c08446     	fadd	z6.d, p1/m, z6.d, z2.d
    2380: 65c08447     	fadd	z7.d, p1/m, z7.d, z2.d
    2384: e5fb4504     	st1d	{ z4.d }, p1, [x8, x27, lsl #3]
    2388: 8b1c0128     	add	x8, x9, x28
    238c: e5e1e525     	st1d	{ z5.d }, p1, [x9, #0x1, mul vl]
    2390: e5e2e526     	st1d	{ z6.d }, p1, [x9, #0x2, mul vl]
    2394: e5e3e527     	st1d	{ z7.d }, p1, [x9, #0x3, mul vl]
    2398: c0c20404     	mov	z4.d, p1/m, za0h.d[w12, 0]
    239c: c0c20445     	mov	z5.d, p1/m, za1h.d[w12, 0]
    23a0: c0c20486     	mov	z6.d, p1/m, za2h.d[w12, 0]
    23a4: c0c204c7     	mov	z7.d, p1/m, za3h.d[w12, 0]
    23a8: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    23ac: 528000cc     	mov	w12, #0x6               // =6
    23b0: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    23b4: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    23b8: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    23bc: 65ca8464     	fmulx	z4.d, p1/m, z4.d, z3.d
    23c0: 65ca8465     	fmulx	z5.d, p1/m, z5.d, z3.d
    23c4: 65ca8466     	fmulx	z6.d, p1/m, z6.d, z3.d
    23c8: 65ca8467     	fmulx	z7.d, p1/m, z7.d, z3.d
    23cc: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    23d0: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    23d4: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    23d8: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    23dc: 65c08444     	fadd	z4.d, p1/m, z4.d, z2.d
    23e0: 65c08445     	fadd	z5.d, p1/m, z5.d, z2.d
    23e4: 65c08446     	fadd	z6.d, p1/m, z6.d, z2.d
    23e8: 65c08447     	fadd	z7.d, p1/m, z7.d, z2.d
    23ec: e5fb4524     	st1d	{ z4.d }, p1, [x9, x27, lsl #3]
    23f0: 8b1c0109     	add	x9, x8, x28
    23f4: e5e1e505     	st1d	{ z5.d }, p1, [x8, #0x1, mul vl]
    23f8: e5e2e506     	st1d	{ z6.d }, p1, [x8, #0x2, mul vl]
    23fc: e5e3e507     	st1d	{ z7.d }, p1, [x8, #0x3, mul vl]
    2400: c0c20404     	mov	z4.d, p1/m, za0h.d[w12, 0]
    2404: c0c20445     	mov	z5.d, p1/m, za1h.d[w12, 0]
    2408: c0c20486     	mov	z6.d, p1/m, za2h.d[w12, 0]
    240c: c0c204c7     	mov	z7.d, p1/m, za3h.d[w12, 0]
    2410: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    2414: 528000ec     	mov	w12, #0x7               // =7
    2418: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    241c: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    2420: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    2424: 65ca8464     	fmulx	z4.d, p1/m, z4.d, z3.d
    2428: 65ca8465     	fmulx	z5.d, p1/m, z5.d, z3.d
    242c: 65ca8466     	fmulx	z6.d, p1/m, z6.d, z3.d
    2430: 65ca8467     	fmulx	z7.d, p1/m, z7.d, z3.d
    2434: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    2438: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    243c: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    2440: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    2444: 65c08444     	fadd	z4.d, p1/m, z4.d, z2.d
    2448: 65c08445     	fadd	z5.d, p1/m, z5.d, z2.d
    244c: 65c08446     	fadd	z6.d, p1/m, z6.d, z2.d
    2450: 65c08447     	fadd	z7.d, p1/m, z7.d, z2.d
    2454: e5fb4504     	st1d	{ z4.d }, p1, [x8, x27, lsl #3]
    2458: 8b1c0128     	add	x8, x9, x28
    245c: e5e1e525     	st1d	{ z5.d }, p1, [x9, #0x1, mul vl]
    2460: e5e2e526     	st1d	{ z6.d }, p1, [x9, #0x2, mul vl]
    2464: e5e3e527     	st1d	{ z7.d }, p1, [x9, #0x3, mul vl]
    2468: c0c20404     	mov	z4.d, p1/m, za0h.d[w12, 0]
    246c: c0c20445     	mov	z5.d, p1/m, za1h.d[w12, 0]
    2470: c0c20486     	mov	z6.d, p1/m, za2h.d[w12, 0]
    2474: c0c204c7     	mov	z7.d, p1/m, za3h.d[w12, 0]
    2478: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    247c: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    2480: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    2484: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    2488: 65ca8464     	fmulx	z4.d, p1/m, z4.d, z3.d
    248c: 65ca8465     	fmulx	z5.d, p1/m, z5.d, z3.d
    2490: 65ca8466     	fmulx	z6.d, p1/m, z6.d, z3.d
    2494: 65ca8467     	fmulx	z7.d, p1/m, z7.d, z3.d
    2498: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    249c: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    24a0: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    24a4: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    24a8: 65c08444     	fadd	z4.d, p1/m, z4.d, z2.d
    24ac: 65c08445     	fadd	z5.d, p1/m, z5.d, z2.d
    24b0: 65c08446     	fadd	z6.d, p1/m, z6.d, z2.d
    24b4: 65c08447     	fadd	z7.d, p1/m, z7.d, z2.d
    24b8: e5fb4524     	st1d	{ z4.d }, p1, [x9, x27, lsl #3]
    24bc: 8b1c0109     	add	x9, x8, x28
    24c0: e5e1e505     	st1d	{ z5.d }, p1, [x8, #0x1, mul vl]
    24c4: e5e2e506     	st1d	{ z6.d }, p1, [x8, #0x2, mul vl]
    24c8: e5e3e507     	st1d	{ z7.d }, p1, [x8, #0x3, mul vl]
    24cc: c0c24504     	mov	z4.d, p1/m, za4h.d[w14, 0]
    24d0: c0c24545     	mov	z5.d, p1/m, za5h.d[w14, 0]
    24d4: c0c24586     	mov	z6.d, p1/m, za6h.d[w14, 0]
    24d8: c0c245c7     	mov	z7.d, p1/m, za7h.d[w14, 0]
    24dc: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    24e0: 5280002e     	mov	w14, #0x1               // =1
    24e4: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    24e8: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    24ec: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    24f0: 65ca8464     	fmulx	z4.d, p1/m, z4.d, z3.d
    24f4: 65ca8465     	fmulx	z5.d, p1/m, z5.d, z3.d
    24f8: 65ca8466     	fmulx	z6.d, p1/m, z6.d, z3.d
    24fc: 65ca8467     	fmulx	z7.d, p1/m, z7.d, z3.d
    2500: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    2504: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    2508: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    250c: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    2510: 65c08444     	fadd	z4.d, p1/m, z4.d, z2.d
    2514: 65c08445     	fadd	z5.d, p1/m, z5.d, z2.d
    2518: 65c08446     	fadd	z6.d, p1/m, z6.d, z2.d
    251c: 65c08447     	fadd	z7.d, p1/m, z7.d, z2.d
    2520: e5fb4504     	st1d	{ z4.d }, p1, [x8, x27, lsl #3]
    2524: 8b1c0128     	add	x8, x9, x28
    2528: e5e1e525     	st1d	{ z5.d }, p1, [x9, #0x1, mul vl]
    252c: e5e2e526     	st1d	{ z6.d }, p1, [x9, #0x2, mul vl]
    2530: e5e3e527     	st1d	{ z7.d }, p1, [x9, #0x3, mul vl]
    2534: c0c24504     	mov	z4.d, p1/m, za4h.d[w14, 0]
    2538: c0c24545     	mov	z5.d, p1/m, za5h.d[w14, 0]
    253c: c0c24586     	mov	z6.d, p1/m, za6h.d[w14, 0]
    2540: c0c245c7     	mov	z7.d, p1/m, za7h.d[w14, 0]
    2544: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    2548: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    254c: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    2550: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    2554: 65ca8464     	fmulx	z4.d, p1/m, z4.d, z3.d
    2558: 65ca8465     	fmulx	z5.d, p1/m, z5.d, z3.d
    255c: 65ca8466     	fmulx	z6.d, p1/m, z6.d, z3.d
    2560: 65ca8467     	fmulx	z7.d, p1/m, z7.d, z3.d
    2564: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    2568: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    256c: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    2570: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    2574: 65c08444     	fadd	z4.d, p1/m, z4.d, z2.d
    2578: 65c08445     	fadd	z5.d, p1/m, z5.d, z2.d
    257c: 65c08446     	fadd	z6.d, p1/m, z6.d, z2.d
    2580: 65c08447     	fadd	z7.d, p1/m, z7.d, z2.d
    2584: e5fb4524     	st1d	{ z4.d }, p1, [x9, x27, lsl #3]
    2588: 8b1c0109     	add	x9, x8, x28
    258c: e5e1e505     	st1d	{ z5.d }, p1, [x8, #0x1, mul vl]
    2590: e5e2e506     	st1d	{ z6.d }, p1, [x8, #0x2, mul vl]
    2594: e5e3e507     	st1d	{ z7.d }, p1, [x8, #0x3, mul vl]
    2598: c0c22504     	mov	z4.d, p1/m, za4h.d[w13, 0]
    259c: c0c22545     	mov	z5.d, p1/m, za5h.d[w13, 0]
    25a0: c0c22586     	mov	z6.d, p1/m, za6h.d[w13, 0]
    25a4: c0c225c7     	mov	z7.d, p1/m, za7h.d[w13, 0]
    25a8: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    25ac: 5280008d     	mov	w13, #0x4               // =4
    25b0: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    25b4: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    25b8: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    25bc: 65ca8464     	fmulx	z4.d, p1/m, z4.d, z3.d
    25c0: 65ca8465     	fmulx	z5.d, p1/m, z5.d, z3.d
    25c4: 65ca8466     	fmulx	z6.d, p1/m, z6.d, z3.d
    25c8: 65ca8467     	fmulx	z7.d, p1/m, z7.d, z3.d
    25cc: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    25d0: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    25d4: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    25d8: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    25dc: 65c08444     	fadd	z4.d, p1/m, z4.d, z2.d
    25e0: 65c08445     	fadd	z5.d, p1/m, z5.d, z2.d
    25e4: 65c08446     	fadd	z6.d, p1/m, z6.d, z2.d
    25e8: 65c08447     	fadd	z7.d, p1/m, z7.d, z2.d
    25ec: e5fb4504     	st1d	{ z4.d }, p1, [x8, x27, lsl #3]
    25f0: 8b1c0128     	add	x8, x9, x28
    25f4: e5e1e525     	st1d	{ z5.d }, p1, [x9, #0x1, mul vl]
    25f8: e5e2e526     	st1d	{ z6.d }, p1, [x9, #0x2, mul vl]
    25fc: e5e3e527     	st1d	{ z7.d }, p1, [x9, #0x3, mul vl]
    2600: c0c26504     	mov	z4.d, p1/m, za4h.d[w15, 0]
    2604: c0c26545     	mov	z5.d, p1/m, za5h.d[w15, 0]
    2608: c0c26586     	mov	z6.d, p1/m, za6h.d[w15, 0]
    260c: c0c265c7     	mov	z7.d, p1/m, za7h.d[w15, 0]
    2610: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    2614: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    2618: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    261c: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    2620: 65ca8464     	fmulx	z4.d, p1/m, z4.d, z3.d
    2624: 65ca8465     	fmulx	z5.d, p1/m, z5.d, z3.d
    2628: 65ca8466     	fmulx	z6.d, p1/m, z6.d, z3.d
    262c: 65ca8467     	fmulx	z7.d, p1/m, z7.d, z3.d
    2630: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    2634: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    2638: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    263c: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    2640: 65c08444     	fadd	z4.d, p1/m, z4.d, z2.d
    2644: 65c08445     	fadd	z5.d, p1/m, z5.d, z2.d
    2648: 65c08446     	fadd	z6.d, p1/m, z6.d, z2.d
    264c: 65c08447     	fadd	z7.d, p1/m, z7.d, z2.d
    2650: e5fb4524     	st1d	{ z4.d }, p1, [x9, x27, lsl #3]
    2654: 8b1c0109     	add	x9, x8, x28
    2658: e5e1e505     	st1d	{ z5.d }, p1, [x8, #0x1, mul vl]
    265c: e5e2e506     	st1d	{ z6.d }, p1, [x8, #0x2, mul vl]
    2660: e5e3e507     	st1d	{ z7.d }, p1, [x8, #0x3, mul vl]
    2664: c0c22504     	mov	z4.d, p1/m, za4h.d[w13, 0]
    2668: c0c22545     	mov	z5.d, p1/m, za5h.d[w13, 0]
    266c: c0c22586     	mov	z6.d, p1/m, za6h.d[w13, 0]
    2670: c0c225c7     	mov	z7.d, p1/m, za7h.d[w13, 0]
    2674: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    2678: 528000ad     	mov	w13, #0x5               // =5
    267c: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    2680: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    2684: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    2688: 65ca8464     	fmulx	z4.d, p1/m, z4.d, z3.d
    268c: 65ca8465     	fmulx	z5.d, p1/m, z5.d, z3.d
    2690: 65ca8466     	fmulx	z6.d, p1/m, z6.d, z3.d
    2694: 65ca8467     	fmulx	z7.d, p1/m, z7.d, z3.d
    2698: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    269c: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    26a0: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    26a4: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    26a8: 65c08444     	fadd	z4.d, p1/m, z4.d, z2.d
    26ac: 65c08445     	fadd	z5.d, p1/m, z5.d, z2.d
    26b0: 65c08446     	fadd	z6.d, p1/m, z6.d, z2.d
    26b4: 65c08447     	fadd	z7.d, p1/m, z7.d, z2.d
    26b8: e5fb4504     	st1d	{ z4.d }, p1, [x8, x27, lsl #3]
    26bc: 8b1c0128     	add	x8, x9, x28
    26c0: e5e1e525     	st1d	{ z5.d }, p1, [x9, #0x1, mul vl]
    26c4: e5e2e526     	st1d	{ z6.d }, p1, [x9, #0x2, mul vl]
    26c8: e5e3e527     	st1d	{ z7.d }, p1, [x9, #0x3, mul vl]
    26cc: c0c22504     	mov	z4.d, p1/m, za4h.d[w13, 0]
    26d0: c0c22545     	mov	z5.d, p1/m, za5h.d[w13, 0]
    26d4: c0c22586     	mov	z6.d, p1/m, za6h.d[w13, 0]
    26d8: c0c225c7     	mov	z7.d, p1/m, za7h.d[w13, 0]
    26dc: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    26e0: 528000cd     	mov	w13, #0x6               // =6
    26e4: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    26e8: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    26ec: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    26f0: 65ca8464     	fmulx	z4.d, p1/m, z4.d, z3.d
    26f4: 65ca8465     	fmulx	z5.d, p1/m, z5.d, z3.d
    26f8: 65ca8466     	fmulx	z6.d, p1/m, z6.d, z3.d
    26fc: 65ca8467     	fmulx	z7.d, p1/m, z7.d, z3.d
    2700: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    2704: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    2708: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    270c: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    2710: 65c08444     	fadd	z4.d, p1/m, z4.d, z2.d
    2714: 65c08445     	fadd	z5.d, p1/m, z5.d, z2.d
    2718: 65c08446     	fadd	z6.d, p1/m, z6.d, z2.d
    271c: 65c08447     	fadd	z7.d, p1/m, z7.d, z2.d
    2720: e5fb4524     	st1d	{ z4.d }, p1, [x9, x27, lsl #3]
    2724: 8b1c0109     	add	x9, x8, x28
    2728: e5e1e505     	st1d	{ z5.d }, p1, [x8, #0x1, mul vl]
    272c: e5e2e506     	st1d	{ z6.d }, p1, [x8, #0x2, mul vl]
    2730: e5e3e507     	st1d	{ z7.d }, p1, [x8, #0x3, mul vl]
    2734: c0c22504     	mov	z4.d, p1/m, za4h.d[w13, 0]
    2738: c0c22545     	mov	z5.d, p1/m, za5h.d[w13, 0]
    273c: c0c22586     	mov	z6.d, p1/m, za6h.d[w13, 0]
    2740: c0c225c7     	mov	z7.d, p1/m, za7h.d[w13, 0]
    2744: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    2748: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    274c: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    2750: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    2754: 65ca8464     	fmulx	z4.d, p1/m, z4.d, z3.d
    2758: 65ca8465     	fmulx	z5.d, p1/m, z5.d, z3.d
    275c: 65ca8466     	fmulx	z6.d, p1/m, z6.d, z3.d
    2760: 65ca8467     	fmulx	z7.d, p1/m, z7.d, z3.d
    2764: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    2768: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    276c: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    2770: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    2774: 65c08444     	fadd	z4.d, p1/m, z4.d, z2.d
    2778: 65c08445     	fadd	z5.d, p1/m, z5.d, z2.d
    277c: 65c08446     	fadd	z6.d, p1/m, z6.d, z2.d
    2780: 65c08447     	fadd	z7.d, p1/m, z7.d, z2.d
    2784: e5fb4504     	st1d	{ z4.d }, p1, [x8, x27, lsl #3]
    2788: 8b1c0128     	add	x8, x9, x28
    278c: e5e1e525     	st1d	{ z5.d }, p1, [x9, #0x1, mul vl]
    2790: e5e2e526     	st1d	{ z6.d }, p1, [x9, #0x2, mul vl]
    2794: e5e3e527     	st1d	{ z7.d }, p1, [x9, #0x3, mul vl]
    2798: c0c20504     	mov	z4.d, p1/m, za4h.d[w12, 0]
    279c: c0c20545     	mov	z5.d, p1/m, za5h.d[w12, 0]
    27a0: c0c20586     	mov	z6.d, p1/m, za6h.d[w12, 0]
    27a4: c0c205c7     	mov	z7.d, p1/m, za7h.d[w12, 0]
    27a8: 05e1c484     	sel	z4.d, p1, z4.d, z1.d
    27ac: 05e1c4a5     	sel	z5.d, p1, z5.d, z1.d
    27b0: 05e1c4c6     	sel	z6.d, p1, z6.d, z1.d
    27b4: 05e1c4e7     	sel	z7.d, p1, z7.d, z1.d
    27b8: 65ca8464     	fmulx	z4.d, p1/m, z4.d, z3.d
    27bc: 65ca8465     	fmulx	z5.d, p1/m, z5.d, z3.d
    27c0: 65ca8466     	fmulx	z6.d, p1/m, z6.d, z3.d
    27c4: 65ca8467     	fmulx	z7.d, p1/m, z7.d, z3.d
    27c8: 05e1c483     	sel	z3.d, p1, z4.d, z1.d
    27cc: 05e1c4a4     	sel	z4.d, p1, z5.d, z1.d
    27d0: 05e1c4c5     	sel	z5.d, p1, z6.d, z1.d
    27d4: 05e1c4e6     	sel	z6.d, p1, z7.d, z1.d
    27d8: 65c08443     	fadd	z3.d, p1/m, z3.d, z2.d
    27dc: 65c08444     	fadd	z4.d, p1/m, z4.d, z2.d
    27e0: 65c08445     	fadd	z5.d, p1/m, z5.d, z2.d
    27e4: 65c08446     	fadd	z6.d, p1/m, z6.d, z2.d
    27e8: e5fb4523     	st1d	{ z3.d }, p1, [x9, x27, lsl #3]
    27ec: e5e1e504     	st1d	{ z4.d }, p1, [x8, #0x1, mul vl]
    27f0: e5e2e505     	st1d	{ z5.d }, p1, [x8, #0x2, mul vl]
    27f4: e5e3e506     	st1d	{ z6.d }, p1, [x8, #0x3, mul vl]
    27f8: b9400208     	ldr	w8, [x16]
    27fc: 110004c6     	add	w6, w6, #0x1
    2800: 6b0800df     	cmp	w6, w8
    2804: 54ff87cb     	b.lt	0x18fc <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x3c0>
    2808: 17fffb8a     	b	0x1630 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xf4>
    280c: b94017e1     	ldr	w1, [sp, #0x14]
    2810: b0000080     	adrp	x0, 0x13000 <__FRAME_END__+0x100f0>
    2814: 9135a000     	add	x0, x0, #0xd68
    2818: 97fff846     	bl	0x930 <__kmpc_for_static_fini@plt>
    281c: 9106c3ff     	add	sp, sp, #0x1b0
    2820: a9454ff4     	ldp	x20, x19, [sp, #0x50]
    2824: a94457f6     	ldp	x22, x21, [sp, #0x40]
    2828: a9435ff8     	ldp	x24, x23, [sp, #0x30]
    282c: a94267fa     	ldp	x26, x25, [sp, #0x20]
    2830: a9416ffc     	ldp	x28, x27, [sp, #0x10]
    2834: a8c67bfd     	ldp	x29, x30, [sp], #0x60
    2838: d65f03c0     	ret

000000000000283c <_ZN4gemmIdE12compute_testEiiiPKdS2_Pddd>:
    283c: 6db63bef     	stp	d15, d14, [sp, #-0xa0]!
    2840: 6d0133ed     	stp	d13, d12, [sp, #0x10]
    2844: 6d022beb     	stp	d11, d10, [sp, #0x20]
    2848: 6d0323e9     	stp	d9, d8, [sp, #0x30]
    284c: a9047bfd     	stp	x29, x30, [sp, #0x40]
    2850: a9056ffc     	stp	x28, x27, [sp, #0x50]
    2854: a90667fa     	stp	x26, x25, [sp, #0x60]
    2858: a9075ff8     	stp	x24, x23, [sp, #0x70]
    285c: a90857f6     	stp	x22, x21, [sp, #0x80]
    2860: a9094ff4     	stp	x20, x19, [sp, #0x90]
    2864: 910103fd     	add	x29, sp, #0x40
    2868: d10303ff     	sub	sp, sp, #0xc0
    286c: 043f5fff     	addsvl	sp, sp, #-0x1
    2870: 6d0607e0     	stp	d0, d1, [sp, #0x60]
    2874: d503437f     	smstart	sm
    2878: 25d8e3e0     	ptrue	p0.d
    287c: 53057c36     	lsr	w22, w1, #5
    2880: 53047c09     	lsr	w9, w0, #4
    2884: 6d4603e2     	ldp	d2, d0, [sp, #0x60]
    2888: 2a1f03e8     	mov	w8, wzr
    288c: 51000ad7     	sub	w23, w22, #0x2
    2890: 5280004c     	mov	w12, #0x2               // =2
    2894: 910243ed     	add	x13, sp, #0x90
    2898: 910263ee     	add	x14, sp, #0x98
    289c: 9101f3ef     	add	x15, sp, #0x7c
    28a0: 910213f8     	add	x24, sp, #0x84
    28a4: 910203f3     	add	x19, sp, #0x80
    28a8: 910283f9     	add	x25, sp, #0xa0
    28ac: 9102e3fa     	add	x26, sp, #0xb8
    28b0: 9102a3fb     	add	x27, sp, #0xa8
    28b4: 291127ff     	stp	wzr, w9, [sp, #0x88]
    28b8: 9102f3fc     	add	x28, sp, #0xbc
    28bc: d10103a9     	sub	x9, x29, #0x40
    28c0: b0000094     	adrp	x20, 0x13000 <__FRAME_END__+0x100f0>
    28c4: 91360294     	add	x20, x20, #0xd80
    28c8: f0fffff5     	adrp	x21, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0x2d4>
    28cc: 9114f2b5     	add	x21, x21, #0x53c
    28d0: 291703e1     	stp	w1, w0, [sp, #0xb8]
    28d4: a90a8fe4     	stp	x4, x3, [sp, #0xa8]
    28d8: f90053e5     	str	x5, [sp, #0xa0]
    28dc: 6d090be0     	stp	d0, d2, [sp, #0x90]
    28e0: e5bf1d20     	str	p0, [x9, #-0x1, mul vl]
    28e4: b90073e2     	str	w2, [sp, #0x70]
    28e8: 1120010a     	add	w10, w8, #0x800
    28ec: 7100011f     	cmp	w8, #0x0
    28f0: 4b080048     	sub	w8, w2, w8
    28f4: 1a9f17eb     	cset	w11, eq
    28f8: 6b02015f     	cmp	w10, w2
    28fc: 5281000a     	mov	w10, #0x800             // =2048
    2900: 2a1f03e9     	mov	w9, wzr
    2904: 1a8ac108     	csel	w8, w8, w10, gt
    2908: 1a9fb7ea     	cset	w10, ge
    290c: 390203eb     	strb	w11, [sp, #0x80]
    2910: b90087e8     	str	w8, [sp, #0x84]
    2914: 3901f3ea     	strb	w10, [sp, #0x7c]
    2918: b9007bff     	str	wzr, [sp, #0x78]
    291c: 4b0902c8     	sub	w8, w22, w9
    2920: 6b17013f     	cmp	w9, w23
    2924: a90437ee     	stp	x14, x13, [sp, #0x40]
    2928: 1a8cc108     	csel	w8, w8, w12, gt
    292c: a9033ff8     	stp	x24, x15, [sp, #0x30]
    2930: b90077e8     	str	w8, [sp, #0x74]
    2934: d10103a8     	sub	x8, x29, #0x40
    2938: 04685fe8     	addspl	x8, x8, #-0x1
    293c: a90167fa     	stp	x26, x25, [sp, #0x10]
    2940: a90223f3     	stp	x19, x8, [sp, #0x20]
    2944: a9006ffc     	stp	x28, x27, [sp]
    2948: d503427f     	smstop	sm
    294c: 910233e3     	add	x3, sp, #0x8c
    2950: 9101d3e4     	add	x4, sp, #0x74
    2954: 9101e3e5     	add	x5, sp, #0x78
    2958: 9102c3e6     	add	x6, sp, #0xb0
    295c: 910223e7     	add	x7, sp, #0x88
    2960: aa1403e0     	mov	x0, x20
    2964: 528001e1     	mov	w1, #0xf                // =15
    2968: aa1503e2     	mov	x2, x21
    296c: 97fff819     	bl	0x9d0 <__kmpc_fork_call@plt>
    2970: 9101f3ef     	add	x15, sp, #0x7c
    2974: 910263ee     	add	x14, sp, #0x98
    2978: 910243ed     	add	x13, sp, #0x90
    297c: 5280004c     	mov	w12, #0x2               // =2
    2980: d503437f     	smstart	sm
    2984: b9407be8     	ldr	w8, [sp, #0x78]
    2988: 11000909     	add	w9, w8, #0x2
    298c: 6b16013f     	cmp	w9, w22
    2990: b9007be9     	str	w9, [sp, #0x78]
    2994: 54fffc4b     	b.lt	0x291c <_ZN4gemmIdE12compute_testEiiiPKdS2_Pddd+0xe0>
    2998: b9408be8     	ldr	w8, [sp, #0x88]
    299c: b94073e2     	ldr	w2, [sp, #0x70]
    29a0: 11200108     	add	w8, w8, #0x800
    29a4: 6b02011f     	cmp	w8, w2
    29a8: b9008be8     	str	w8, [sp, #0x88]
    29ac: 54fff9eb     	b.lt	0x28e8 <_ZN4gemmIdE12compute_testEiiiPKdS2_Pddd+0xac>
    29b0: d503427f     	smstop	sm
    29b4: 043f583f     	addsvl	sp, sp, #0x1
    29b8: 910303ff     	add	sp, sp, #0xc0
    29bc: a9494ff4     	ldp	x20, x19, [sp, #0x90]
    29c0: a94857f6     	ldp	x22, x21, [sp, #0x80]
    29c4: a9475ff8     	ldp	x24, x23, [sp, #0x70]
    29c8: a94667fa     	ldp	x26, x25, [sp, #0x60]
    29cc: a9456ffc     	ldp	x28, x27, [sp, #0x50]
    29d0: a9447bfd     	ldp	x29, x30, [sp, #0x40]
    29d4: 6d4323e9     	ldp	d9, d8, [sp, #0x30]
    29d8: 6d422beb     	ldp	d11, d10, [sp, #0x20]
    29dc: 6d4133ed     	ldp	d13, d12, [sp, #0x10]
    29e0: 6cca3bef     	ldp	d15, d14, [sp], #0xa0
    29e4: d65f03c0     	ret

Disassembly of section .fini:

00000000000029e8 <_fini>:
    29e8: d503201f     	nop
    29ec: a9bf7bfd     	stp	x29, x30, [sp, #-0x10]!
    29f0: 910003fd     	mov	x29, sp
    29f4: a8c17bfd     	ldp	x29, x30, [sp], #0x10
    29f8: d65f03c0     	ret
