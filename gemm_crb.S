
gemm_crb:	file format elf64-littleaarch64

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
     904: d0000090     	adrp	x16, 0x12000 <__FRAME_END__+0xf5f0>
     908: f947fe11     	ldr	x17, [x16, #0xff8]
     90c: 913fe210     	add	x16, x16, #0xff8
     910: d61f0220     	br	x17
     914: d503201f     	nop
     918: d503201f     	nop
     91c: d503201f     	nop

0000000000000920 <_Znam@plt>:
     920: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     924: f9400211     	ldr	x17, [x16]
     928: 91000210     	add	x16, x16, #0x0
     92c: d61f0220     	br	x17

0000000000000930 <__kmpc_for_static_fini@plt>:
     930: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     934: f9400611     	ldr	x17, [x16, #0x8]
     938: 91002210     	add	x16, x16, #0x8
     93c: d61f0220     	br	x17

0000000000000940 <_ZNSt6chrono3_V212system_clock3nowEv@plt>:
     940: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     944: f9400a11     	ldr	x17, [x16, #0x10]
     948: 91004210     	add	x16, x16, #0x10
     94c: d61f0220     	br	x17

0000000000000950 <puts@plt>:
     950: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     954: f9400e11     	ldr	x17, [x16, #0x18]
     958: 91006210     	add	x16, x16, #0x18
     95c: d61f0220     	br	x17

0000000000000960 <memset@plt>:
     960: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     964: f9401211     	ldr	x17, [x16, #0x20]
     968: 91008210     	add	x16, x16, #0x20
     96c: d61f0220     	br	x17

0000000000000970 <__cxa_finalize@plt>:
     970: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     974: f9401611     	ldr	x17, [x16, #0x28]
     978: 9100a210     	add	x16, x16, #0x28
     97c: d61f0220     	br	x17

0000000000000980 <__libc_start_main@plt>:
     980: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     984: f9401a11     	ldr	x17, [x16, #0x30]
     988: 9100c210     	add	x16, x16, #0x30
     98c: d61f0220     	br	x17

0000000000000990 <_ZdaPv@plt>:
     990: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     994: f9401e11     	ldr	x17, [x16, #0x38]
     998: 9100e210     	add	x16, x16, #0x38
     99c: d61f0220     	br	x17

00000000000009a0 <omp_set_num_threads@plt>:
     9a0: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     9a4: f9402211     	ldr	x17, [x16, #0x40]
     9a8: 91010210     	add	x16, x16, #0x40
     9ac: d61f0220     	br	x17

00000000000009b0 <__kmpc_for_static_init_4@plt>:
     9b0: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     9b4: f9402611     	ldr	x17, [x16, #0x48]
     9b8: 91012210     	add	x16, x16, #0x48
     9bc: d61f0220     	br	x17

00000000000009c0 <abort@plt>:
     9c0: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     9c4: f9402a11     	ldr	x17, [x16, #0x50]
     9c8: 91014210     	add	x16, x16, #0x50
     9cc: d61f0220     	br	x17

00000000000009d0 <__kmpc_fork_call@plt>:
     9d0: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     9d4: f9402e11     	ldr	x17, [x16, #0x58]
     9d8: 91016210     	add	x16, x16, #0x58
     9dc: d61f0220     	br	x17

00000000000009e0 <__gmon_start__@plt>:
     9e0: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     9e4: f9403211     	ldr	x17, [x16, #0x60]
     9e8: 91018210     	add	x16, x16, #0x60
     9ec: d61f0220     	br	x17

00000000000009f0 <printf@plt>:
     9f0: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
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
     a1c: d0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xf5f0>
     a20: f947e000     	ldr	x0, [x0, #0xfc0]
     a24: d2800003     	mov	x3, #0x0                // =0
     a28: d2800004     	mov	x4, #0x0                // =0
     a2c: 97ffffd5     	bl	0x980 <__libc_start_main@plt>
     a30: 97ffffe4     	bl	0x9c0 <abort@plt>

0000000000000a34 <call_weak_fn>:
     a34: d0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xf5f0>
     a38: f947ec00     	ldr	x0, [x0, #0xfd8]
     a3c: b4000040     	cbz	x0, 0xa44 <call_weak_fn+0x10>
     a40: 17ffffe8     	b	0x9e0 <__gmon_start__@plt>
     a44: d65f03c0     	ret
     a48: d503201f     	nop
     a4c: d503201f     	nop

0000000000000a50 <deregister_tm_clones>:
     a50: f0000080     	adrp	x0, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     a54: 91020000     	add	x0, x0, #0x80
     a58: f0000081     	adrp	x1, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     a5c: 91020021     	add	x1, x1, #0x80
     a60: eb00003f     	cmp	x1, x0
     a64: 540000c0     	b.eq	0xa7c <deregister_tm_clones+0x2c>
     a68: d0000081     	adrp	x1, 0x12000 <__FRAME_END__+0xf5f0>
     a6c: f947e821     	ldr	x1, [x1, #0xfd0]
     a70: b4000061     	cbz	x1, 0xa7c <deregister_tm_clones+0x2c>
     a74: aa0103f0     	mov	x16, x1
     a78: d61f0200     	br	x16
     a7c: d65f03c0     	ret

0000000000000a80 <register_tm_clones>:
     a80: f0000080     	adrp	x0, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     a84: 91020000     	add	x0, x0, #0x80
     a88: f0000081     	adrp	x1, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     a8c: 91020021     	add	x1, x1, #0x80
     a90: cb000021     	sub	x1, x1, x0
     a94: d37ffc22     	lsr	x2, x1, #63
     a98: 8b810c41     	add	x1, x2, x1, asr #3
     a9c: 9341fc21     	asr	x1, x1, #1
     aa0: b40000c1     	cbz	x1, 0xab8 <register_tm_clones+0x38>
     aa4: d0000082     	adrp	x2, 0x12000 <__FRAME_END__+0xf5f0>
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
     acc: f0000093     	adrp	x19, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     ad0: 39420260     	ldrb	w0, [x19, #0x80]
     ad4: 35000140     	cbnz	w0, 0xafc <__do_global_dtors_aux+0x3c>
     ad8: d0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xf5f0>
     adc: f947e400     	ldr	x0, [x0, #0xfc8]
     ae0: b4000080     	cbz	x0, 0xaf0 <__do_global_dtors_aux+0x30>
     ae4: f0000080     	adrp	x0, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
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
     b28: 911a6400     	add	x0, x0, #0x699
     b2c: 97ffff89     	bl	0x950 <puts@plt>
     b30: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     b34: 91140000     	add	x0, x0, #0x500
     b38: 52800801     	mov	w1, #0x40               // =64
     b3c: 52800102     	mov	w2, #0x8                // =8
     b40: 97ffffac     	bl	0x9f0 <printf@plt>
     b44: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     b48: 91146000     	add	x0, x0, #0x518
     b4c: 52800201     	mov	w1, #0x10               // =16
     b50: 52800402     	mov	w2, #0x20               // =32
     b54: 97ffffa7     	bl	0x9f0 <printf@plt>
     b58: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     b5c: 9114d000     	add	x0, x0, #0x534
     b60: 52810001     	mov	w1, #0x800              // =2048
     b64: 52800802     	mov	w2, #0x40               // =64
     b68: 97ffffa2     	bl	0x9f0 <printf@plt>
     b6c: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     b70: 91150800     	add	x0, x0, #0x542
     b74: 52800041     	mov	w1, #0x2                // =2
     b78: 97ffff9e     	bl	0x9f0 <printf@plt>
     b7c: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     b80: 911ad800     	add	x0, x0, #0x6b6
     b84: 97ffff73     	bl	0x950 <puts@plt>
     b88: 2f00e401     	movi	d1, #0000000000000000
     b8c: 1e6e1000     	fmov	d0, #1.00000000
     b90: 52800400     	mov	w0, #0x20               // =32
     b94: 52800801     	mov	w1, #0x40               // =64
     b98: 52801002     	mov	w2, #0x80               // =128
     b9c: 94000062     	bl	0xd24 <_Z9test_gemmIdEbiiiT_S0_>
     ba0: 2a0003f3     	mov	w19, w0
     ba4: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     ba8: 911b7c00     	add	x0, x0, #0x6df
     bac: 97ffff69     	bl	0x950 <puts@plt>
     bb0: 2f00e401     	movi	d1, #0000000000000000
     bb4: 1e6e1000     	fmov	d0, #1.00000000
     bb8: 52800400     	mov	w0, #0x20               // =32
     bbc: 52800801     	mov	w1, #0x40               // =64
     bc0: 52820002     	mov	w2, #0x1000             // =4096
     bc4: 94000058     	bl	0xd24 <_Z9test_gemmIdEbiiiT_S0_>
     bc8: 72000268     	ands	w8, w19, #0x1
     bcc: 52800029     	mov	w9, #0x1                // =1
     bd0: 1a890529     	cinc	w9, w9, ne
     bd4: 7200001f     	tst	w0, #0x1
     bd8: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     bdc: 911c2c00     	add	x0, x0, #0x70b
     be0: 1a881133     	csel	w19, w9, w8, ne
     be4: 97ffff5b     	bl	0x950 <puts@plt>
     be8: 1e601000     	fmov	d0, #2.00000000
     bec: 1e6c1001     	fmov	d1, #0.50000000
     bf0: 52800400     	mov	w0, #0x20               // =32
     bf4: 52800801     	mov	w1, #0x40               // =64
     bf8: 52820002     	mov	w2, #0x1000             // =4096
     bfc: 9400004a     	bl	0xd24 <_Z9test_gemmIdEbiiiT_S0_>
     c00: 12000014     	and	w20, w0, #0x1
     c04: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     c08: 911cc400     	add	x0, x0, #0x731
     c0c: 97ffff51     	bl	0x950 <puts@plt>
     c10: 2f00e401     	movi	d1, #0000000000000000
     c14: 1e6e1000     	fmov	d0, #1.00000000
     c18: 52800800     	mov	w0, #0x40               // =64
     c1c: 52801001     	mov	w1, #0x80               // =128
     c20: 52810002     	mov	w2, #0x800              // =2048
     c24: 94000040     	bl	0xd24 <_Z9test_gemmIdEbiiiT_S0_>
     c28: 12000008     	and	w8, w0, #0x1
     c2c: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     c30: 91153c00     	add	x0, x0, #0x54f
     c34: 0b080288     	add	w8, w20, w8
     c38: 52800082     	mov	w2, #0x4                // =4
     c3c: 0b080273     	add	w19, w19, w8
     c40: 2a1303e1     	mov	w1, w19
     c44: 97ffff6b     	bl	0x9f0 <printf@plt>
     c48: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     c4c: 911d3800     	add	x0, x0, #0x74e
     c50: 97ffff40     	bl	0x950 <puts@plt>
     c54: 52a00400     	mov	w0, #0x200000           // =2097152
     c58: 97ffff32     	bl	0x920 <_Znam@plt>
     c5c: aa0003f4     	mov	x20, x0
     c60: 52a00800     	mov	w0, #0x400000           // =4194304
     c64: 97ffff2f     	bl	0x920 <_Znam@plt>
     c68: aa0003f5     	mov	x21, x0
     c6c: 52a00020     	mov	w0, #0x10000            // =65536
     c70: 97ffff2c     	bl	0x920 <_Znam@plt>
     c74: aa0003f6     	mov	x22, x0
     c78: aa1403e0     	mov	x0, x20
     c7c: 2a1f03e1     	mov	w1, wzr
     c80: 52a00402     	mov	w2, #0x200000           // =2097152
     c84: 97ffff37     	bl	0x960 <memset@plt>
     c88: aa1503e0     	mov	x0, x21
     c8c: 2a1f03e1     	mov	w1, wzr
     c90: 52a00802     	mov	w2, #0x400000           // =4194304
     c94: 97ffff33     	bl	0x960 <memset@plt>
     c98: aa1603e0     	mov	x0, x22
     c9c: 2a1f03e1     	mov	w1, wzr
     ca0: 52a00022     	mov	w2, #0x10000            // =65536
     ca4: 97ffff2f     	bl	0x960 <memset@plt>
     ca8: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     cac: 9115d400     	add	x0, x0, #0x575
     cb0: 52800801     	mov	w1, #0x40               // =64
     cb4: 52801002     	mov	w2, #0x80               // =128
     cb8: 52820003     	mov	w3, #0x1000             // =4096
     cbc: 52800044     	mov	w4, #0x2                // =2
     cc0: 97ffff4c     	bl	0x9f0 <printf@plt>
     cc4: 52800040     	mov	w0, #0x2                // =2
     cc8: 97ffff36     	bl	0x9a0 <omp_set_num_threads@plt>
     ccc: aa1403e0     	mov	x0, x20
     cd0: aa1503e1     	mov	x1, x21
     cd4: aa1603e2     	mov	x2, x22
     cd8: 94000152     	bl	0x1220 <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd>
     cdc: d2e83208     	mov	x8, #0x4190000000000000 // =4724276009111650304
     ce0: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     ce4: 91168000     	add	x0, x0, #0x5a0
     ce8: 9e670101     	fmov	d1, x8
     cec: 1e601821     	fdiv	d1, d1, d0
     cf0: 97ffff40     	bl	0x9f0 <printf@plt>
     cf4: aa1403e0     	mov	x0, x20
     cf8: 97ffff26     	bl	0x990 <_ZdaPv@plt>
     cfc: aa1503e0     	mov	x0, x21
     d00: 97ffff24     	bl	0x990 <_ZdaPv@plt>
     d04: aa1603e0     	mov	x0, x22
     d08: 97ffff22     	bl	0x990 <_ZdaPv@plt>
     d0c: 7100127f     	cmp	w19, #0x4
     d10: 1a9f07e0     	cset	w0, ne
     d14: a9424ff4     	ldp	x20, x19, [sp, #0x20]
     d18: a94157f6     	ldp	x22, x21, [sp, #0x10]
     d1c: a8c37bfd     	ldp	x29, x30, [sp], #0x30
     d20: d65f03c0     	ret

0000000000000d24 <_Z9test_gemmIdEbiiiT_S0_>:
     d24: d10283ff     	sub	sp, sp, #0xa0
     d28: fd0013ea     	str	d10, [sp, #0x20]
     d2c: 6d0323e9     	stp	d9, d8, [sp, #0x30]
     d30: a9047bfd     	stp	x29, x30, [sp, #0x40]
     d34: a9056ffc     	stp	x28, x27, [sp, #0x50]
     d38: a90667fa     	stp	x26, x25, [sp, #0x60]
     d3c: a9075ff8     	stp	x24, x23, [sp, #0x70]
     d40: a90857f6     	stp	x22, x21, [sp, #0x80]
     d44: a9094ff4     	stp	x20, x19, [sp, #0x90]
     d48: 910103fd     	add	x29, sp, #0x40
     d4c: 2a0203f3     	mov	w19, w2
     d50: 2a0103f8     	mov	w24, w1
     d54: 2a0003f9     	mov	w25, w0
     d58: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     d5c: 91171800     	add	x0, x0, #0x5c6
     d60: d0000001     	adrp	x1, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     d64: 9116fc21     	add	x1, x1, #0x5bf
     d68: 2a1903e2     	mov	w2, w25
     d6c: 2a1803e3     	mov	w3, w24
     d70: 2a1303e4     	mov	w4, w19
     d74: 52810005     	mov	w5, #0x800              // =2048
     d78: 52800806     	mov	w6, #0x40               // =64
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
     df4: 9113a1ad     	add	x13, x13, #0x4e8
     df8: 05e03963     	mov	z3.d, x11
     dfc: 9b0a7f8a     	mul	x10, x28, x10
     e00: d000000b     	adrp	x11, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     e04: d000000c     	adrp	x12, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     e08: 2a1903f7     	mov	w23, w25
     e0c: fd427161     	ldr	d1, [x11, #0x4e0]
     e10: fd427582     	ldr	d2, [x12, #0x4e8]
     e14: aa0003f6     	mov	x22, x0
     e18: 2a1f03e8     	mov	w8, wzr
     e1c: aa1f03e9     	mov	x9, xzr
     e20: 85c0e1a0     	ld1rd	{ z0.d }, p0/z, [x13]
     e24: b9000ff3     	str	w19, [sp, #0xc]
     e28: 2a1303fa     	mov	w26, w19
     e2c: 04a0e3f3     	cntw	x19
     e30: 8a17014a     	and	x10, x10, x23
     e34: 14000004     	b	0xe44 <_Z9test_gemmIdEbiiiT_S0_+0x120>
     e38: eb1a013f     	cmp	x9, x26
     e3c: 0b190108     	add	w8, w8, w25
     e40: 540004c0     	b.eq	0xed8 <_Z9test_gemmIdEbiiiT_S0_+0x1b4>
     e44: 91000529     	add	x9, x9, #0x1
     e48: 8b284f6b     	add	x11, x27, w8, uxtw #3
     e4c: eb17027f     	cmp	x19, x23
     e50: 1e620125     	scvtf	d5, w9
     e54: 1e6108a5     	fmul	d5, d5, d1
     e58: 54000069     	b.ls	0xe64 <_Z9test_gemmIdEbiiiT_S0_+0x140>
     e5c: aa1f03ec     	mov	x12, xzr
     e60: 14000016     	b	0xeb8 <_Z9test_gemmIdEbiiiT_S0_+0x194>
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
     ea8: 54fffe61     	b.ne	0xe74 <_Z9test_gemmIdEbiiiT_S0_+0x150>
     eac: eb17015f     	cmp	x10, x23
     eb0: aa0a03ec     	mov	x12, x10
     eb4: 54fffc20     	b.eq	0xe38 <_Z9test_gemmIdEbiiiT_S0_+0x114>
     eb8: 9100058d     	add	x13, x12, #0x1
     ebc: 1e6201a6     	scvtf	d6, w13
     ec0: eb0d02ff     	cmp	x23, x13
     ec4: 1f4214c6     	fmadd	d6, d6, d2, d5
     ec8: fc2c7966     	str	d6, [x11, x12, lsl #3]
     ecc: aa0d03ec     	mov	x12, x13
     ed0: 54ffff41     	b.ne	0xeb8 <_Z9test_gemmIdEbiiiT_S0_+0x194>
     ed4: 17ffffd9     	b	0xe38 <_Z9test_gemmIdEbiiiT_S0_+0x114>
     ed8: d37ffb8b     	lsl	x11, x28, #1
     edc: 5301038a     	lsl	w10, w28, #31
     ee0: 04e14003     	index	z3.d, #0x0, #0x1
     ee4: f81e83bb     	stur	x27, [x29, #-0x18]
     ee8: 2a1803fb     	mov	w27, w24
     eec: 2a1f03e8     	mov	w8, wzr
     ef0: 05e03964     	mov	z4.d, x11
     ef4: d000000b     	adrp	x11, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
     ef8: 9113816b     	add	x11, x11, #0x4e0
     efc: 4b1c094a     	sub	w10, w10, w28, lsl #2
     f00: 85c0e165     	ld1rd	{ z5.d }, p0/z, [x11]
     f04: aa1f03e9     	mov	x9, xzr
     f08: 8a1b014a     	and	x10, x10, x27
     f0c: 14000004     	b	0xf1c <_Z9test_gemmIdEbiiiT_S0_+0x1f8>
     f10: eb1a013f     	cmp	x9, x26
     f14: 0b180108     	add	w8, w8, w24
     f18: 54000500     	b.eq	0xfb8 <_Z9test_gemmIdEbiiiT_S0_+0x294>
     f1c: 91000529     	add	x9, x9, #0x1
     f20: 8b284e8b     	add	x11, x20, w8, uxtw #3
     f24: eb1b027f     	cmp	x19, x27
     f28: 1e620126     	scvtf	d6, w9
     f2c: 54000069     	b.ls	0xf38 <_Z9test_gemmIdEbiiiT_S0_+0x214>
     f30: aa1f03ec     	mov	x12, xzr
     f34: 14000018     	b	0xf94 <_Z9test_gemmIdEbiiiT_S0_+0x270>
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
     f84: 54fffe21     	b.ne	0xf48 <_Z9test_gemmIdEbiiiT_S0_+0x224>
     f88: eb1b015f     	cmp	x10, x27
     f8c: aa0a03ec     	mov	x12, x10
     f90: 54fffc00     	b.eq	0xf10 <_Z9test_gemmIdEbiiiT_S0_+0x1ec>
     f94: 9100058d     	add	x13, x12, #0x1
     f98: 1e6201a7     	scvtf	d7, w13
     f9c: eb0d037f     	cmp	x27, x13
     fa0: 1e6208e7     	fmul	d7, d7, d2
     fa4: 1f411cc7     	fmadd	d7, d6, d1, d7
     fa8: fc2c7967     	str	d7, [x11, x12, lsl #3]
     fac: aa0d03ec     	mov	x12, x13
     fb0: 54ffff21     	b.ne	0xf94 <_Z9test_gemmIdEbiiiT_S0_+0x270>
     fb4: 17ffffd7     	b	0xf10 <_Z9test_gemmIdEbiiiT_S0_+0x1ec>
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
    1018: 14000005     	b	0x102c <_Z9test_gemmIdEbiiiT_S0_+0x308>
    101c: 91000508     	add	x8, x8, #0x1
    1020: 91002210     	add	x16, x16, #0x8
    1024: eb17011f     	cmp	x8, x23
    1028: 54000620     	b.eq	0x10ec <_Z9test_gemmIdEbiiiT_S0_+0x3c8>
    102c: 9b1b7d12     	mul	x18, x8, x27
    1030: aa1f03f1     	mov	x17, xzr
    1034: aa1403e0     	mov	x0, x20
    1038: 8b120ed2     	add	x18, x22, x18, lsl #3
    103c: 14000007     	b	0x1058 <_Z9test_gemmIdEbiiiT_S0_+0x334>
    1040: 1f402120     	fmadd	d0, d9, d0, d8
    1044: 91002000     	add	x0, x0, #0x8
    1048: fc317a40     	str	d0, [x18, x17, lsl #3]
    104c: 91000631     	add	x17, x17, #0x1
    1050: eb1b023f     	cmp	x17, x27
    1054: 54fffe40     	b.eq	0x101c <_Z9test_gemmIdEbiiiT_S0_+0x2f8>
    1058: eb1a013f     	cmp	x9, x26
    105c: 1a9f95c1     	csinc	w1, w14, wzr, ls
    1060: 36000081     	tbz	w1, #0x0, 0x1070 <_Z9test_gemmIdEbiiiT_S0_+0x34c>
    1064: 2f00e400     	movi	d0, #0000000000000000
    1068: aa1f03e1     	mov	x1, xzr
    106c: 14000015     	b	0x10c0 <_Z9test_gemmIdEbiiiT_S0_+0x39c>
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
    10b4: b5fffea2     	cbnz	x2, 0x1088 <_Z9test_gemmIdEbiiiT_S0_+0x364>
    10b8: eb1a003f     	cmp	x1, x26
    10bc: 54fffc20     	b.eq	0x1040 <_Z9test_gemmIdEbiiiT_S0_+0x31c>
    10c0: 9b017d82     	mul	x2, x12, x1
    10c4: 9b017da3     	mul	x3, x13, x1
    10c8: cb010341     	sub	x1, x26, x1
    10cc: fc636a01     	ldr	d1, [x16, x3]
    10d0: fc626802     	ldr	d2, [x0, x2]
    10d4: f1000421     	subs	x1, x1, #0x1
    10d8: 8b0c0042     	add	x2, x2, x12
    10dc: 8b0d0063     	add	x3, x3, x13
    10e0: 1f420020     	fmadd	d0, d1, d2, d0
    10e4: 54ffff41     	b.ne	0x10cc <_Z9test_gemmIdEbiiiT_S0_+0x3a8>
    10e8: 17ffffd6     	b	0x1040 <_Z9test_gemmIdEbiiiT_S0_+0x31c>
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
    1114: 94000480     	bl	0x2314 <_ZN4gemmIdE12compute_testEiiiPKdS2_Pddd>
    1118: 2f00e408     	movi	d8, #0000000000000000
    111c: b0000008     	adrp	x8, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
    1120: f9400bfb     	ldr	x27, [sp, #0x10]
    1124: fd427909     	ldr	d9, [x8, #0x4f0]
    1128: b0000008     	adrp	x8, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
    112c: aa1f03f8     	mov	x24, xzr
    1130: fd427d0a     	ldr	d10, [x8, #0x4f8]
    1134: b0000019     	adrp	x25, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
    1138: 91182b39     	add	x25, x25, #0x60a
    113c: 52800033     	mov	w19, #0x1               // =1
    1140: b0000017     	adrp	x23, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
    1144: 911992f7     	add	x23, x23, #0x664
    1148: 14000007     	b	0x1164 <_Z9test_gemmIdEbiiiT_S0_+0x440>
    114c: 1e6a2040     	fcmp	d2, d10
    1150: 91000718     	add	x24, x24, #0x1
    1154: 1a9fc7e8     	cset	w8, le
    1158: eb1b031f     	cmp	x24, x27
    115c: 0a130113     	and	w19, w8, w19
    1160: 540002a0     	b.eq	0x11b4 <_Z9test_gemmIdEbiiiT_S0_+0x490>
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
    118c: 54fffe0d     	b.le	0x114c <_Z9test_gemmIdEbiiiT_S0_+0x428>
    1190: 3607fdf3     	tbz	w19, #0x0, 0x114c <_Z9test_gemmIdEbiiiT_S0_+0x428>
    1194: aa1903e0     	mov	x0, x25
    1198: 2a1803e1     	mov	w1, w24
    119c: 97fffe15     	bl	0x9f0 <printf@plt>
    11a0: 91000718     	add	x24, x24, #0x1
    11a4: 2a1f03f3     	mov	w19, wzr
    11a8: eb1b031f     	cmp	x24, x27
    11ac: 54fffdc1     	b.ne	0x1164 <_Z9test_gemmIdEbiiiT_S0_+0x440>
    11b0: 14000006     	b	0x11c8 <_Z9test_gemmIdEbiiiT_S0_+0x4a4>
    11b4: 7100027f     	cmp	w19, #0x0
    11b8: b0000008     	adrp	x8, 0x2000 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac4>
    11bc: 91191908     	add	x8, x8, #0x646
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
    12a0: b0000096     	adrp	x22, 0x12000 <__FRAME_END__+0xf5f0>
    12a4: 913602d6     	add	x22, x22, #0xd80
    12a8: 910333fc     	add	x28, sp, #0xcc
    12ac: 90000017     	adrp	x23, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0x2dc>
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
    1400: b0000093     	adrp	x19, 0x12000 <__FRAME_END__+0xf5f0>
    1404: 91360273     	add	x19, x19, #0xd80
    1408: 85bf1920     	ldr	p0, [x9, #-0x2, mul vl]
    140c: 90000014     	adrp	x20, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0x2dc>
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
    153c: d10283ff     	sub	sp, sp, #0xa0
    1540: a9047bfd     	stp	x29, x30, [sp, #0x40]
    1544: a9056ffc     	stp	x28, x27, [sp, #0x50]
    1548: a90667fa     	stp	x26, x25, [sp, #0x60]
    154c: a9075ff8     	stp	x24, x23, [sp, #0x70]
    1550: a90857f6     	stp	x22, x21, [sp, #0x80]
    1554: a9094ff4     	stp	x20, x19, [sp, #0x90]
    1558: 910103fd     	add	x29, sp, #0x40
    155c: b9400048     	ldr	w8, [x2]
    1560: 71000518     	subs	w24, w8, #0x1
    1564: 54006c8b     	b.lt	0x22f4 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xdb8>
    1568: b9400001     	ldr	w1, [x0]
    156c: aa0703f3     	mov	x19, x7
    1570: aa0603f4     	mov	x20, x6
    1574: aa0503f5     	mov	x21, x5
    1578: aa0403f6     	mov	x22, x4
    157c: aa0303f7     	mov	x23, x3
    1580: 52800028     	mov	w8, #0x1                // =1
    1584: b0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xf5f0>
    1588: 9135a000     	add	x0, x0, #0xd68
    158c: d10043a3     	sub	x3, x29, #0x10
    1590: d10013a4     	sub	x4, x29, #0x4
    1594: d10023a5     	sub	x5, x29, #0x8
    1598: d10033a6     	sub	x6, x29, #0xc
    159c: 52800442     	mov	w2, #0x22               // =34
    15a0: 52800027     	mov	w7, #0x1                // =1
    15a4: 293f7fb8     	stp	w24, wzr, [x29, #-0x8]
    15a8: 293e23bf     	stp	wzr, w8, [x29, #-0x10]
    15ac: b90017e1     	str	w1, [sp, #0x14]
    15b0: b90003e8     	str	w8, [sp]
    15b4: 97fffcff     	bl	0x9b0 <__kmpc_for_static_init_4@plt>
    15b8: 297f23a9     	ldp	w9, w8, [x29, #-0x8]
    15bc: 93407d08     	sxtw	x8, w8
    15c0: 6b18013f     	cmp	w9, w24
    15c4: 1a98b12f     	csel	w15, w9, w24, lt
    15c8: 6b0f011f     	cmp	w8, w15
    15cc: b81f83af     	stur	w15, [x29, #-0x8]
    15d0: 540068ac     	b.gt	0x22e4 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xda8>
    15d4: b94002ee     	ldr	w14, [x23]
    15d8: 710005df     	cmp	w14, #0x1
    15dc: 5400684b     	b.lt	0x22e4 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xda8>
    15e0: 25d8e3e0     	ptrue	p0.d
    15e4: a949aba9     	ldp	x9, x10, [x29, #0x98]
    15e8: a948afa2     	ldp	x2, x11, [x29, #0x88]
    15ec: 25f8c000     	mov	z0.d, #0x0              // =0
    15f0: a9478fb0     	ldp	x16, x3, [x29, #0x78]
    15f4: f94033a0     	ldr	x0, [x29, #0x60]
    15f8: a946c7b2     	ldp	x18, x17, [x29, #0x68]
    15fc: f90013e9     	str	x9, [sp, #0x20]
    1600: 531c6d09     	lsl	w9, w8, #4
    1604: f81e83aa     	stur	x10, [x29, #-0x18]
    1608: 14000007     	b	0x1624 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xe8>
    160c: b85f83af     	ldur	w15, [x29, #-0x8]
    1610: f9400fe9     	ldr	x9, [sp, #0x18]
    1614: eb2fc11f     	cmp	x8, w15, sxtw
    1618: 91000508     	add	x8, x8, #0x1
    161c: 11004129     	add	w9, w9, #0x10
    1620: 5400662a     	b.ge	0x22e4 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xda8>
    1624: 710005df     	cmp	w14, #0x1
    1628: 54ffff6b     	b.lt	0x1614 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xd8>
    162c: 937d7d24     	sbfiz	x4, x9, #3, #32
    1630: 531c6d05     	lsl	w5, w8, #4
    1634: 2a1f03e6     	mov	w6, wzr
    1638: f9000fe9     	str	x9, [sp, #0x18]
    163c: 140001a9     	b	0x1ce0 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x7a4>
    1640: f94013e9     	ldr	x9, [sp, #0x20]
    1644: 85800061     	ldr	p1, [x3]
    1648: 2a1f03ee     	mov	w14, wzr
    164c: 5280002c     	mov	w12, #0x1               // =1
    1650: 937d7f19     	sbfiz	x25, x24, #3, #32
    1654: 93407f07     	sxtw	x7, w24
    1658: 85c0e122     	ld1rd	{ z2.d }, p0/z, [x9]
    165c: f85e83a9     	ldur	x9, [x29, #-0x18]
    1660: 5280004d     	mov	w13, #0x2               // =2
    1664: 85c0e121     	ld1rd	{ z1.d }, p0/z, [x9]
    1668: c0c24403     	mov	z3.d, p1/m, za0h.d[w14, 0]
    166c: 8b190349     	add	x9, x26, x25
    1670: c0c24444     	mov	z4.d, p1/m, za1h.d[w14, 0]
    1674: 8b19012f     	add	x15, x9, x25
    1678: c0c24485     	mov	z5.d, p1/m, za2h.d[w14, 0]
    167c: c0c244c6     	mov	z6.d, p1/m, za3h.d[w14, 0]
    1680: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1684: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1688: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    168c: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1690: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1694: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1698: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    169c: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    16a0: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    16a4: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    16a8: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    16ac: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    16b0: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    16b4: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    16b8: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    16bc: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    16c0: e5e0e743     	st1d	{ z3.d }, p1, [x26]
    16c4: e5e1e744     	st1d	{ z4.d }, p1, [x26, #0x1, mul vl]
    16c8: e5e2e745     	st1d	{ z5.d }, p1, [x26, #0x2, mul vl]
    16cc: e5e3e746     	st1d	{ z6.d }, p1, [x26, #0x3, mul vl]
    16d0: c0c20403     	mov	z3.d, p1/m, za0h.d[w12, 0]
    16d4: c0c20444     	mov	z4.d, p1/m, za1h.d[w12, 0]
    16d8: c0c20485     	mov	z5.d, p1/m, za2h.d[w12, 0]
    16dc: c0c204c6     	mov	z6.d, p1/m, za3h.d[w12, 0]
    16e0: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    16e4: 5280006c     	mov	w12, #0x3               // =3
    16e8: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    16ec: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    16f0: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    16f4: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    16f8: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    16fc: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1700: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1704: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1708: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    170c: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1710: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1714: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1718: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    171c: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1720: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1724: e5e74743     	st1d	{ z3.d }, p1, [x26, x7, lsl #3]
    1728: e5e1e524     	st1d	{ z4.d }, p1, [x9, #0x1, mul vl]
    172c: e5e2e525     	st1d	{ z5.d }, p1, [x9, #0x2, mul vl]
    1730: e5e3e526     	st1d	{ z6.d }, p1, [x9, #0x3, mul vl]
    1734: c0c22403     	mov	z3.d, p1/m, za0h.d[w13, 0]
    1738: c0c22444     	mov	z4.d, p1/m, za1h.d[w13, 0]
    173c: c0c22485     	mov	z5.d, p1/m, za2h.d[w13, 0]
    1740: c0c224c6     	mov	z6.d, p1/m, za3h.d[w13, 0]
    1744: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1748: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    174c: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1750: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1754: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1758: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    175c: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1760: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1764: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1768: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    176c: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1770: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1774: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1778: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    177c: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1780: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1784: e5e74523     	st1d	{ z3.d }, p1, [x9, x7, lsl #3]
    1788: 8b1901e9     	add	x9, x15, x25
    178c: e5e1e5e4     	st1d	{ z4.d }, p1, [x15, #0x1, mul vl]
    1790: e5e2e5e5     	st1d	{ z5.d }, p1, [x15, #0x2, mul vl]
    1794: e5e3e5e6     	st1d	{ z6.d }, p1, [x15, #0x3, mul vl]
    1798: c0c20403     	mov	z3.d, p1/m, za0h.d[w12, 0]
    179c: c0c20444     	mov	z4.d, p1/m, za1h.d[w12, 0]
    17a0: c0c20485     	mov	z5.d, p1/m, za2h.d[w12, 0]
    17a4: c0c204c6     	mov	z6.d, p1/m, za3h.d[w12, 0]
    17a8: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    17ac: 528000ac     	mov	w12, #0x5               // =5
    17b0: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    17b4: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    17b8: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    17bc: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    17c0: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    17c4: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    17c8: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    17cc: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    17d0: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    17d4: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    17d8: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    17dc: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    17e0: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    17e4: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    17e8: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    17ec: e5e745e3     	st1d	{ z3.d }, p1, [x15, x7, lsl #3]
    17f0: 5280008f     	mov	w15, #0x4               // =4
    17f4: e5e1e524     	st1d	{ z4.d }, p1, [x9, #0x1, mul vl]
    17f8: e5e2e525     	st1d	{ z5.d }, p1, [x9, #0x2, mul vl]
    17fc: e5e3e526     	st1d	{ z6.d }, p1, [x9, #0x3, mul vl]
    1800: c0c26403     	mov	z3.d, p1/m, za0h.d[w15, 0]
    1804: c0c26444     	mov	z4.d, p1/m, za1h.d[w15, 0]
    1808: c0c26485     	mov	z5.d, p1/m, za2h.d[w15, 0]
    180c: c0c264c6     	mov	z6.d, p1/m, za3h.d[w15, 0]
    1810: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1814: 8b19012f     	add	x15, x9, x25
    1818: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    181c: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1820: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1824: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1828: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    182c: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1830: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1834: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1838: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    183c: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1840: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1844: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1848: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    184c: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1850: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1854: e5e74523     	st1d	{ z3.d }, p1, [x9, x7, lsl #3]
    1858: 8b1901e9     	add	x9, x15, x25
    185c: e5e1e5e4     	st1d	{ z4.d }, p1, [x15, #0x1, mul vl]
    1860: e5e2e5e5     	st1d	{ z5.d }, p1, [x15, #0x2, mul vl]
    1864: e5e3e5e6     	st1d	{ z6.d }, p1, [x15, #0x3, mul vl]
    1868: c0c20403     	mov	z3.d, p1/m, za0h.d[w12, 0]
    186c: c0c20444     	mov	z4.d, p1/m, za1h.d[w12, 0]
    1870: c0c20485     	mov	z5.d, p1/m, za2h.d[w12, 0]
    1874: c0c204c6     	mov	z6.d, p1/m, za3h.d[w12, 0]
    1878: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    187c: 528000cc     	mov	w12, #0x6               // =6
    1880: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1884: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1888: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    188c: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1890: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1894: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1898: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    189c: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    18a0: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    18a4: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    18a8: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    18ac: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    18b0: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    18b4: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    18b8: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    18bc: e5e745e3     	st1d	{ z3.d }, p1, [x15, x7, lsl #3]
    18c0: 8b19012f     	add	x15, x9, x25
    18c4: e5e1e524     	st1d	{ z4.d }, p1, [x9, #0x1, mul vl]
    18c8: e5e2e525     	st1d	{ z5.d }, p1, [x9, #0x2, mul vl]
    18cc: e5e3e526     	st1d	{ z6.d }, p1, [x9, #0x3, mul vl]
    18d0: c0c20403     	mov	z3.d, p1/m, za0h.d[w12, 0]
    18d4: c0c20444     	mov	z4.d, p1/m, za1h.d[w12, 0]
    18d8: c0c20485     	mov	z5.d, p1/m, za2h.d[w12, 0]
    18dc: c0c204c6     	mov	z6.d, p1/m, za3h.d[w12, 0]
    18e0: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    18e4: 528000ec     	mov	w12, #0x7               // =7
    18e8: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    18ec: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    18f0: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    18f4: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    18f8: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    18fc: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1900: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1904: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1908: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    190c: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1910: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1914: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1918: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    191c: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1920: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1924: e5e74523     	st1d	{ z3.d }, p1, [x9, x7, lsl #3]
    1928: 8b1901e9     	add	x9, x15, x25
    192c: e5e1e5e4     	st1d	{ z4.d }, p1, [x15, #0x1, mul vl]
    1930: e5e2e5e5     	st1d	{ z5.d }, p1, [x15, #0x2, mul vl]
    1934: e5e3e5e6     	st1d	{ z6.d }, p1, [x15, #0x3, mul vl]
    1938: c0c20403     	mov	z3.d, p1/m, za0h.d[w12, 0]
    193c: c0c20444     	mov	z4.d, p1/m, za1h.d[w12, 0]
    1940: c0c20485     	mov	z5.d, p1/m, za2h.d[w12, 0]
    1944: c0c204c6     	mov	z6.d, p1/m, za3h.d[w12, 0]
    1948: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    194c: 5280002c     	mov	w12, #0x1               // =1
    1950: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1954: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1958: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    195c: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1960: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1964: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1968: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    196c: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1970: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1974: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1978: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    197c: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1980: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1984: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1988: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    198c: e5e745e3     	st1d	{ z3.d }, p1, [x15, x7, lsl #3]
    1990: e5e1e524     	st1d	{ z4.d }, p1, [x9, #0x1, mul vl]
    1994: e5e2e525     	st1d	{ z5.d }, p1, [x9, #0x2, mul vl]
    1998: e5e3e526     	st1d	{ z6.d }, p1, [x9, #0x3, mul vl]
    199c: c0c24503     	mov	z3.d, p1/m, za4h.d[w14, 0]
    19a0: c0c24544     	mov	z4.d, p1/m, za5h.d[w14, 0]
    19a4: c0c24585     	mov	z5.d, p1/m, za6h.d[w14, 0]
    19a8: c0c245c6     	mov	z6.d, p1/m, za7h.d[w14, 0]
    19ac: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    19b0: 8b19012e     	add	x14, x9, x25
    19b4: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    19b8: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    19bc: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    19c0: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    19c4: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    19c8: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    19cc: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    19d0: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    19d4: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    19d8: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    19dc: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    19e0: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    19e4: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    19e8: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    19ec: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    19f0: e5e74523     	st1d	{ z3.d }, p1, [x9, x7, lsl #3]
    19f4: 8b1901c9     	add	x9, x14, x25
    19f8: e5e1e5c4     	st1d	{ z4.d }, p1, [x14, #0x1, mul vl]
    19fc: e5e2e5c5     	st1d	{ z5.d }, p1, [x14, #0x2, mul vl]
    1a00: e5e3e5c6     	st1d	{ z6.d }, p1, [x14, #0x3, mul vl]
    1a04: c0c20503     	mov	z3.d, p1/m, za4h.d[w12, 0]
    1a08: c0c20544     	mov	z4.d, p1/m, za5h.d[w12, 0]
    1a0c: c0c20585     	mov	z5.d, p1/m, za6h.d[w12, 0]
    1a10: c0c205c6     	mov	z6.d, p1/m, za7h.d[w12, 0]
    1a14: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1a18: 5280006c     	mov	w12, #0x3               // =3
    1a1c: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1a20: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1a24: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1a28: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1a2c: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1a30: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1a34: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1a38: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1a3c: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1a40: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1a44: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1a48: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1a4c: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1a50: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1a54: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1a58: e5e745c3     	st1d	{ z3.d }, p1, [x14, x7, lsl #3]
    1a5c: 8b19012e     	add	x14, x9, x25
    1a60: e5e1e524     	st1d	{ z4.d }, p1, [x9, #0x1, mul vl]
    1a64: e5e2e525     	st1d	{ z5.d }, p1, [x9, #0x2, mul vl]
    1a68: e5e3e526     	st1d	{ z6.d }, p1, [x9, #0x3, mul vl]
    1a6c: c0c22503     	mov	z3.d, p1/m, za4h.d[w13, 0]
    1a70: c0c22544     	mov	z4.d, p1/m, za5h.d[w13, 0]
    1a74: c0c22585     	mov	z5.d, p1/m, za6h.d[w13, 0]
    1a78: c0c225c6     	mov	z6.d, p1/m, za7h.d[w13, 0]
    1a7c: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1a80: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1a84: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1a88: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1a8c: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1a90: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1a94: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1a98: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1a9c: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1aa0: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1aa4: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1aa8: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1aac: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1ab0: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1ab4: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1ab8: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1abc: e5e74523     	st1d	{ z3.d }, p1, [x9, x7, lsl #3]
    1ac0: 8b1901c9     	add	x9, x14, x25
    1ac4: e5e1e5c4     	st1d	{ z4.d }, p1, [x14, #0x1, mul vl]
    1ac8: e5e2e5c5     	st1d	{ z5.d }, p1, [x14, #0x2, mul vl]
    1acc: e5e3e5c6     	st1d	{ z6.d }, p1, [x14, #0x3, mul vl]
    1ad0: c0c20503     	mov	z3.d, p1/m, za4h.d[w12, 0]
    1ad4: c0c20544     	mov	z4.d, p1/m, za5h.d[w12, 0]
    1ad8: c0c20585     	mov	z5.d, p1/m, za6h.d[w12, 0]
    1adc: c0c205c6     	mov	z6.d, p1/m, za7h.d[w12, 0]
    1ae0: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1ae4: 5280008c     	mov	w12, #0x4               // =4
    1ae8: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1aec: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1af0: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1af4: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1af8: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1afc: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1b00: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1b04: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1b08: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1b0c: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1b10: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1b14: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1b18: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1b1c: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1b20: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1b24: e5e745c3     	st1d	{ z3.d }, p1, [x14, x7, lsl #3]
    1b28: 8b19012e     	add	x14, x9, x25
    1b2c: e5e1e524     	st1d	{ z4.d }, p1, [x9, #0x1, mul vl]
    1b30: e5e2e525     	st1d	{ z5.d }, p1, [x9, #0x2, mul vl]
    1b34: e5e3e526     	st1d	{ z6.d }, p1, [x9, #0x3, mul vl]
    1b38: c0c20503     	mov	z3.d, p1/m, za4h.d[w12, 0]
    1b3c: c0c20544     	mov	z4.d, p1/m, za5h.d[w12, 0]
    1b40: c0c20585     	mov	z5.d, p1/m, za6h.d[w12, 0]
    1b44: c0c205c6     	mov	z6.d, p1/m, za7h.d[w12, 0]
    1b48: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1b4c: 528000ac     	mov	w12, #0x5               // =5
    1b50: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1b54: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1b58: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1b5c: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1b60: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1b64: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1b68: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1b6c: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1b70: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1b74: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1b78: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1b7c: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1b80: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1b84: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1b88: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1b8c: e5e74523     	st1d	{ z3.d }, p1, [x9, x7, lsl #3]
    1b90: 8b1901c9     	add	x9, x14, x25
    1b94: e5e1e5c4     	st1d	{ z4.d }, p1, [x14, #0x1, mul vl]
    1b98: e5e2e5c5     	st1d	{ z5.d }, p1, [x14, #0x2, mul vl]
    1b9c: e5e3e5c6     	st1d	{ z6.d }, p1, [x14, #0x3, mul vl]
    1ba0: c0c20503     	mov	z3.d, p1/m, za4h.d[w12, 0]
    1ba4: c0c20544     	mov	z4.d, p1/m, za5h.d[w12, 0]
    1ba8: c0c20585     	mov	z5.d, p1/m, za6h.d[w12, 0]
    1bac: c0c205c6     	mov	z6.d, p1/m, za7h.d[w12, 0]
    1bb0: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1bb4: 528000cc     	mov	w12, #0x6               // =6
    1bb8: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1bbc: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1bc0: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1bc4: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1bc8: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1bcc: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1bd0: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1bd4: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1bd8: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1bdc: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1be0: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1be4: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1be8: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1bec: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1bf0: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1bf4: e5e745c3     	st1d	{ z3.d }, p1, [x14, x7, lsl #3]
    1bf8: 8b19012e     	add	x14, x9, x25
    1bfc: e5e1e524     	st1d	{ z4.d }, p1, [x9, #0x1, mul vl]
    1c00: e5e2e525     	st1d	{ z5.d }, p1, [x9, #0x2, mul vl]
    1c04: e5e3e526     	st1d	{ z6.d }, p1, [x9, #0x3, mul vl]
    1c08: c0c20503     	mov	z3.d, p1/m, za4h.d[w12, 0]
    1c0c: c0c20544     	mov	z4.d, p1/m, za5h.d[w12, 0]
    1c10: c0c20585     	mov	z5.d, p1/m, za6h.d[w12, 0]
    1c14: c0c205c6     	mov	z6.d, p1/m, za7h.d[w12, 0]
    1c18: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1c1c: 528000ec     	mov	w12, #0x7               // =7
    1c20: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1c24: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1c28: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1c2c: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1c30: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1c34: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1c38: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1c3c: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1c40: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1c44: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1c48: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1c4c: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1c50: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1c54: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1c58: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1c5c: e5e74523     	st1d	{ z3.d }, p1, [x9, x7, lsl #3]
    1c60: 8b1901c9     	add	x9, x14, x25
    1c64: e5e1e5c4     	st1d	{ z4.d }, p1, [x14, #0x1, mul vl]
    1c68: e5e2e5c5     	st1d	{ z5.d }, p1, [x14, #0x2, mul vl]
    1c6c: e5e3e5c6     	st1d	{ z6.d }, p1, [x14, #0x3, mul vl]
    1c70: c0c20503     	mov	z3.d, p1/m, za4h.d[w12, 0]
    1c74: c0c20544     	mov	z4.d, p1/m, za5h.d[w12, 0]
    1c78: c0c20585     	mov	z5.d, p1/m, za6h.d[w12, 0]
    1c7c: c0c205c6     	mov	z6.d, p1/m, za7h.d[w12, 0]
    1c80: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1c84: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1c88: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1c8c: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1c90: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1c94: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1c98: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1c9c: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1ca0: 05e0c462     	sel	z2.d, p1, z3.d, z0.d
    1ca4: 05e0c483     	sel	z3.d, p1, z4.d, z0.d
    1ca8: 05e0c4a4     	sel	z4.d, p1, z5.d, z0.d
    1cac: 05e0c4c5     	sel	z5.d, p1, z6.d, z0.d
    1cb0: 65c08422     	fadd	z2.d, p1/m, z2.d, z1.d
    1cb4: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1cb8: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1cbc: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1cc0: e5e745c2     	st1d	{ z2.d }, p1, [x14, x7, lsl #3]
    1cc4: e5e1e523     	st1d	{ z3.d }, p1, [x9, #0x1, mul vl]
    1cc8: e5e2e524     	st1d	{ z4.d }, p1, [x9, #0x2, mul vl]
    1ccc: e5e3e525     	st1d	{ z5.d }, p1, [x9, #0x3, mul vl]
    1cd0: b94002ee     	ldr	w14, [x23]
    1cd4: 110004c6     	add	w6, w6, #0x1
    1cd8: 6b0e00df     	cmp	w6, w14
    1cdc: 54ffc98a     	b.ge	0x160c <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xd0>
    1ce0: b980025b     	ldrsw	x27, [x18]
    1ce4: b94002ca     	ldr	w10, [x22]
    1ce8: f9400227     	ldr	x7, [x17]
    1cec: f94002b9     	ldr	x25, [x21]
    1cf0: b940029c     	ldr	w28, [x20]
    1cf4: 39400201     	ldrb	w1, [x16]
    1cf8: 1b057f6f     	mul	w15, w27, w5
    1cfc: 0b060158     	add	w24, w10, w6
    1d00: b940027e     	ldr	w30, [x19]
    1d04: 531b6b18     	lsl	w24, w24, #5
    1d08: 8b2fccef     	add	x15, x7, w15, sxtw #3
    1d0c: f9400007     	ldr	x7, [x0]
    1d10: 8b38cdfa     	add	x26, x15, w24, sxtw #3
    1d14: 34000121     	cbz	w1, 0x1d38 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x7fc>
    1d18: c00800ff     	zero	{za}
    1d1c: b940004f     	ldr	w15, [x2]
    1d20: b9400258     	ldr	w24, [x18]
    1d24: 710005ff     	cmp	w15, #0x1
    1d28: 540014aa     	b.ge	0x1fbc <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xa80>
    1d2c: 39400169     	ldrb	w9, [x11]
    1d30: 35ffc889     	cbnz	w9, 0x1640 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x104>
    1d34: 140000c7     	b	0x2050 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xb14>
    1d38: 85800061     	ldr	p1, [x3]
    1d3c: d37df378     	lsl	x24, x27, #3
    1d40: 2a1f03ef     	mov	w15, wzr
    1d44: 5280002c     	mov	w12, #0x1               // =1
    1d48: 5280004d     	mov	w13, #0x2               // =2
    1d4c: 5280006e     	mov	w14, #0x3               // =3
    1d50: 8b180341     	add	x1, x26, x24
    1d54: a5e0a741     	ld1d	{ z1.d }, p1/z, [x26]
    1d58: a5e1a742     	ld1d	{ z2.d }, p1/z, [x26, #0x1, mul vl]
    1d5c: a5e2a743     	ld1d	{ z3.d }, p1/z, [x26, #0x2, mul vl]
    1d60: a5e3a744     	ld1d	{ z4.d }, p1/z, [x26, #0x3, mul vl]
    1d64: 8b180029     	add	x9, x1, x24
    1d68: c0c06420     	mov	za0h.d[w15, 0], p1/m, z1.d
    1d6c: c0c06442     	mov	za1h.d[w15, 0], p1/m, z2.d
    1d70: c0c06464     	mov	za2h.d[w15, 0], p1/m, z3.d
    1d74: c0c06486     	mov	za3h.d[w15, 0], p1/m, z4.d
    1d78: a5fb4741     	ld1d	{ z1.d }, p1/z, [x26, x27, lsl #3]
    1d7c: a5e1a422     	ld1d	{ z2.d }, p1/z, [x1, #0x1, mul vl]
    1d80: a5e2a423     	ld1d	{ z3.d }, p1/z, [x1, #0x2, mul vl]
    1d84: a5e3a424     	ld1d	{ z4.d }, p1/z, [x1, #0x3, mul vl]
    1d88: c0c00420     	mov	za0h.d[w12, 0], p1/m, z1.d
    1d8c: c0c00442     	mov	za1h.d[w12, 0], p1/m, z2.d
    1d90: c0c00464     	mov	za2h.d[w12, 0], p1/m, z3.d
    1d94: c0c00486     	mov	za3h.d[w12, 0], p1/m, z4.d
    1d98: a5fb4421     	ld1d	{ z1.d }, p1/z, [x1, x27, lsl #3]
    1d9c: a5e1a522     	ld1d	{ z2.d }, p1/z, [x9, #0x1, mul vl]
    1da0: a5e2a523     	ld1d	{ z3.d }, p1/z, [x9, #0x2, mul vl]
    1da4: a5e3a524     	ld1d	{ z4.d }, p1/z, [x9, #0x3, mul vl]
    1da8: 8b180121     	add	x1, x9, x24
    1dac: 5280008c     	mov	w12, #0x4               // =4
    1db0: c0c02420     	mov	za0h.d[w13, 0], p1/m, z1.d
    1db4: c0c02442     	mov	za1h.d[w13, 0], p1/m, z2.d
    1db8: c0c02464     	mov	za2h.d[w13, 0], p1/m, z3.d
    1dbc: c0c02486     	mov	za3h.d[w13, 0], p1/m, z4.d
    1dc0: a5fb4521     	ld1d	{ z1.d }, p1/z, [x9, x27, lsl #3]
    1dc4: a5e1a422     	ld1d	{ z2.d }, p1/z, [x1, #0x1, mul vl]
    1dc8: a5e2a423     	ld1d	{ z3.d }, p1/z, [x1, #0x2, mul vl]
    1dcc: a5e3a424     	ld1d	{ z4.d }, p1/z, [x1, #0x3, mul vl]
    1dd0: 8b180029     	add	x9, x1, x24
    1dd4: c0c04420     	mov	za0h.d[w14, 0], p1/m, z1.d
    1dd8: c0c04442     	mov	za1h.d[w14, 0], p1/m, z2.d
    1ddc: c0c04464     	mov	za2h.d[w14, 0], p1/m, z3.d
    1de0: c0c04486     	mov	za3h.d[w14, 0], p1/m, z4.d
    1de4: a5fb4421     	ld1d	{ z1.d }, p1/z, [x1, x27, lsl #3]
    1de8: a5e1a522     	ld1d	{ z2.d }, p1/z, [x9, #0x1, mul vl]
    1dec: a5e2a523     	ld1d	{ z3.d }, p1/z, [x9, #0x2, mul vl]
    1df0: a5e3a524     	ld1d	{ z4.d }, p1/z, [x9, #0x3, mul vl]
    1df4: 8b180121     	add	x1, x9, x24
    1df8: c0c00420     	mov	za0h.d[w12, 0], p1/m, z1.d
    1dfc: c0c00442     	mov	za1h.d[w12, 0], p1/m, z2.d
    1e00: c0c00464     	mov	za2h.d[w12, 0], p1/m, z3.d
    1e04: c0c00486     	mov	za3h.d[w12, 0], p1/m, z4.d
    1e08: a5fb4521     	ld1d	{ z1.d }, p1/z, [x9, x27, lsl #3]
    1e0c: a5e1a422     	ld1d	{ z2.d }, p1/z, [x1, #0x1, mul vl]
    1e10: a5e2a423     	ld1d	{ z3.d }, p1/z, [x1, #0x2, mul vl]
    1e14: a5e3a424     	ld1d	{ z4.d }, p1/z, [x1, #0x3, mul vl]
    1e18: 8b180029     	add	x9, x1, x24
    1e1c: 528000ac     	mov	w12, #0x5               // =5
    1e20: c0c00420     	mov	za0h.d[w12, 0], p1/m, z1.d
    1e24: c0c00442     	mov	za1h.d[w12, 0], p1/m, z2.d
    1e28: c0c00464     	mov	za2h.d[w12, 0], p1/m, z3.d
    1e2c: c0c00486     	mov	za3h.d[w12, 0], p1/m, z4.d
    1e30: a5fb4421     	ld1d	{ z1.d }, p1/z, [x1, x27, lsl #3]
    1e34: a5e1a522     	ld1d	{ z2.d }, p1/z, [x9, #0x1, mul vl]
    1e38: a5e2a523     	ld1d	{ z3.d }, p1/z, [x9, #0x2, mul vl]
    1e3c: a5e3a524     	ld1d	{ z4.d }, p1/z, [x9, #0x3, mul vl]
    1e40: 8b180121     	add	x1, x9, x24
    1e44: 528000cc     	mov	w12, #0x6               // =6
    1e48: c0c00420     	mov	za0h.d[w12, 0], p1/m, z1.d
    1e4c: c0c00442     	mov	za1h.d[w12, 0], p1/m, z2.d
    1e50: c0c00464     	mov	za2h.d[w12, 0], p1/m, z3.d
    1e54: c0c00486     	mov	za3h.d[w12, 0], p1/m, z4.d
    1e58: a5fb4521     	ld1d	{ z1.d }, p1/z, [x9, x27, lsl #3]
    1e5c: a5e1a422     	ld1d	{ z2.d }, p1/z, [x1, #0x1, mul vl]
    1e60: a5e2a423     	ld1d	{ z3.d }, p1/z, [x1, #0x2, mul vl]
    1e64: a5e3a424     	ld1d	{ z4.d }, p1/z, [x1, #0x3, mul vl]
    1e68: 8b180029     	add	x9, x1, x24
    1e6c: 528000ec     	mov	w12, #0x7               // =7
    1e70: c0c00420     	mov	za0h.d[w12, 0], p1/m, z1.d
    1e74: c0c00442     	mov	za1h.d[w12, 0], p1/m, z2.d
    1e78: c0c00464     	mov	za2h.d[w12, 0], p1/m, z3.d
    1e7c: c0c00486     	mov	za3h.d[w12, 0], p1/m, z4.d
    1e80: a5fb4421     	ld1d	{ z1.d }, p1/z, [x1, x27, lsl #3]
    1e84: a5e1a522     	ld1d	{ z2.d }, p1/z, [x9, #0x1, mul vl]
    1e88: a5e2a523     	ld1d	{ z3.d }, p1/z, [x9, #0x2, mul vl]
    1e8c: a5e3a524     	ld1d	{ z4.d }, p1/z, [x9, #0x3, mul vl]
    1e90: 8b180121     	add	x1, x9, x24
    1e94: c0c06428     	mov	za4h.d[w15, 0], p1/m, z1.d
    1e98: c0c0644a     	mov	za5h.d[w15, 0], p1/m, z2.d
    1e9c: c0c0646c     	mov	za6h.d[w15, 0], p1/m, z3.d
    1ea0: c0c0648e     	mov	za7h.d[w15, 0], p1/m, z4.d
    1ea4: a5fb4521     	ld1d	{ z1.d }, p1/z, [x9, x27, lsl #3]
    1ea8: a5e1a422     	ld1d	{ z2.d }, p1/z, [x1, #0x1, mul vl]
    1eac: a5e2a423     	ld1d	{ z3.d }, p1/z, [x1, #0x2, mul vl]
    1eb0: a5e3a424     	ld1d	{ z4.d }, p1/z, [x1, #0x3, mul vl]
    1eb4: 8b180029     	add	x9, x1, x24
    1eb8: 5280002f     	mov	w15, #0x1               // =1
    1ebc: c0c06428     	mov	za4h.d[w15, 0], p1/m, z1.d
    1ec0: c0c0644a     	mov	za5h.d[w15, 0], p1/m, z2.d
    1ec4: c0c0646c     	mov	za6h.d[w15, 0], p1/m, z3.d
    1ec8: c0c0648e     	mov	za7h.d[w15, 0], p1/m, z4.d
    1ecc: a5fb4421     	ld1d	{ z1.d }, p1/z, [x1, x27, lsl #3]
    1ed0: a5e1a522     	ld1d	{ z2.d }, p1/z, [x9, #0x1, mul vl]
    1ed4: a5e2a523     	ld1d	{ z3.d }, p1/z, [x9, #0x2, mul vl]
    1ed8: a5e3a524     	ld1d	{ z4.d }, p1/z, [x9, #0x3, mul vl]
    1edc: 8b18012f     	add	x15, x9, x24
    1ee0: c0c02428     	mov	za4h.d[w13, 0], p1/m, z1.d
    1ee4: c0c0244a     	mov	za5h.d[w13, 0], p1/m, z2.d
    1ee8: c0c0246c     	mov	za6h.d[w13, 0], p1/m, z3.d
    1eec: c0c0248e     	mov	za7h.d[w13, 0], p1/m, z4.d
    1ef0: a5fb4521     	ld1d	{ z1.d }, p1/z, [x9, x27, lsl #3]
    1ef4: a5e1a5e2     	ld1d	{ z2.d }, p1/z, [x15, #0x1, mul vl]
    1ef8: a5e2a5e3     	ld1d	{ z3.d }, p1/z, [x15, #0x2, mul vl]
    1efc: a5e3a5e4     	ld1d	{ z4.d }, p1/z, [x15, #0x3, mul vl]
    1f00: 8b1801e9     	add	x9, x15, x24
    1f04: 5280008d     	mov	w13, #0x4               // =4
    1f08: c0c04428     	mov	za4h.d[w14, 0], p1/m, z1.d
    1f0c: c0c0444a     	mov	za5h.d[w14, 0], p1/m, z2.d
    1f10: c0c0446c     	mov	za6h.d[w14, 0], p1/m, z3.d
    1f14: c0c0448e     	mov	za7h.d[w14, 0], p1/m, z4.d
    1f18: a5fb45e1     	ld1d	{ z1.d }, p1/z, [x15, x27, lsl #3]
    1f1c: a5e1a522     	ld1d	{ z2.d }, p1/z, [x9, #0x1, mul vl]
    1f20: a5e2a523     	ld1d	{ z3.d }, p1/z, [x9, #0x2, mul vl]
    1f24: a5e3a524     	ld1d	{ z4.d }, p1/z, [x9, #0x3, mul vl]
    1f28: 8b18012f     	add	x15, x9, x24
    1f2c: c0c02428     	mov	za4h.d[w13, 0], p1/m, z1.d
    1f30: c0c0244a     	mov	za5h.d[w13, 0], p1/m, z2.d
    1f34: c0c0246c     	mov	za6h.d[w13, 0], p1/m, z3.d
    1f38: c0c0248e     	mov	za7h.d[w13, 0], p1/m, z4.d
    1f3c: a5fb4521     	ld1d	{ z1.d }, p1/z, [x9, x27, lsl #3]
    1f40: a5e1a5e2     	ld1d	{ z2.d }, p1/z, [x15, #0x1, mul vl]
    1f44: a5e2a5e3     	ld1d	{ z3.d }, p1/z, [x15, #0x2, mul vl]
    1f48: a5e3a5e4     	ld1d	{ z4.d }, p1/z, [x15, #0x3, mul vl]
    1f4c: 8b1801e9     	add	x9, x15, x24
    1f50: 528000ad     	mov	w13, #0x5               // =5
    1f54: c0c02428     	mov	za4h.d[w13, 0], p1/m, z1.d
    1f58: c0c0244a     	mov	za5h.d[w13, 0], p1/m, z2.d
    1f5c: c0c0246c     	mov	za6h.d[w13, 0], p1/m, z3.d
    1f60: c0c0248e     	mov	za7h.d[w13, 0], p1/m, z4.d
    1f64: a5fb45e1     	ld1d	{ z1.d }, p1/z, [x15, x27, lsl #3]
    1f68: a5e1a522     	ld1d	{ z2.d }, p1/z, [x9, #0x1, mul vl]
    1f6c: a5e2a523     	ld1d	{ z3.d }, p1/z, [x9, #0x2, mul vl]
    1f70: a5e3a524     	ld1d	{ z4.d }, p1/z, [x9, #0x3, mul vl]
    1f74: 8b18012f     	add	x15, x9, x24
    1f78: 528000cd     	mov	w13, #0x6               // =6
    1f7c: c0c02428     	mov	za4h.d[w13, 0], p1/m, z1.d
    1f80: c0c0244a     	mov	za5h.d[w13, 0], p1/m, z2.d
    1f84: c0c0246c     	mov	za6h.d[w13, 0], p1/m, z3.d
    1f88: c0c0248e     	mov	za7h.d[w13, 0], p1/m, z4.d
    1f8c: a5fb4521     	ld1d	{ z1.d }, p1/z, [x9, x27, lsl #3]
    1f90: a5e1a5e2     	ld1d	{ z2.d }, p1/z, [x15, #0x1, mul vl]
    1f94: a5e2a5e3     	ld1d	{ z3.d }, p1/z, [x15, #0x2, mul vl]
    1f98: a5e3a5e4     	ld1d	{ z4.d }, p1/z, [x15, #0x3, mul vl]
    1f9c: c0c00428     	mov	za4h.d[w12, 0], p1/m, z1.d
    1fa0: c0c0044a     	mov	za5h.d[w12, 0], p1/m, z2.d
    1fa4: c0c0046c     	mov	za6h.d[w12, 0], p1/m, z3.d
    1fa8: c0c0048e     	mov	za7h.d[w12, 0], p1/m, z4.d
    1fac: b940004f     	ldr	w15, [x2]
    1fb0: b9400258     	ldr	w24, [x18]
    1fb4: 710005ff     	cmp	w15, #0x1
    1fb8: 54ffebab     	b.lt	0x1d2c <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x7f0>
    1fbc: 1b1c7f69     	mul	w9, w27, w28
    1fc0: 0b06014e     	add	w14, w10, w6
    1fc4: b980027b     	ldrsw	x27, [x19]
    1fc8: 1b1c7fc1     	mul	w1, w30, w28
    1fcc: 531b69ce     	lsl	w14, w14, #5
    1fd0: 93407f1c     	sxtw	x28, w24
    1fd4: 85800061     	ldr	p1, [x3]
    1fd8: 8b040338     	add	x24, x25, x4
    1fdc: 93407d29     	sxtw	x9, w9
    1fe0: d37df399     	lsl	x25, x28, #3
    1fe4: 93407c21     	sxtw	x1, w1
    1fe8: d37df129     	lsl	x9, x9, #3
    1fec: 8b2ecd29     	add	x9, x9, w14, sxtw #3
    1ff0: 8b010f0e     	add	x14, x24, x1, lsl #3
    1ff4: d37df378     	lsl	x24, x27, #3
    1ff8: 8b0900e7     	add	x7, x7, x9
    1ffc: a5e0a5c1     	ld1d	{ z1.d }, p1/z, [x14]
    2000: a5e0a4e2     	ld1d	{ z2.d }, p1/z, [x7]
    2004: 710005ef     	subs	w15, w15, #0x1
    2008: a5e1a4e3     	ld1d	{ z3.d }, p1/z, [x7, #0x1, mul vl]
    200c: a5e1a5c4     	ld1d	{ z4.d }, p1/z, [x14, #0x1, mul vl]
    2010: 8b1801ce     	add	x14, x14, x24
    2014: a5e2a4e5     	ld1d	{ z5.d }, p1/z, [x7, #0x2, mul vl]
    2018: a5e3a4e6     	ld1d	{ z6.d }, p1/z, [x7, #0x3, mul vl]
    201c: 8b1900e7     	add	x7, x7, x25
    2020: 80c22420     	fmopa	za0.d, p1/m, p1/m, z1.d, z2.d
    2024: 80c32421     	fmopa	za1.d, p1/m, p1/m, z1.d, z3.d
    2028: 80c52422     	fmopa	za2.d, p1/m, p1/m, z1.d, z5.d
    202c: 80c62423     	fmopa	za3.d, p1/m, p1/m, z1.d, z6.d
    2030: 80c22484     	fmopa	za4.d, p1/m, p1/m, z4.d, z2.d
    2034: 80c32485     	fmopa	za5.d, p1/m, p1/m, z4.d, z3.d
    2038: 80c52486     	fmopa	za6.d, p1/m, p1/m, z4.d, z5.d
    203c: 80c62487     	fmopa	za7.d, p1/m, p1/m, z4.d, z6.d
    2040: 54fffde1     	b.ne	0x1ffc <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xac0>
    2044: b9400258     	ldr	w24, [x18]
    2048: 39400169     	ldrb	w9, [x11]
    204c: 35ffafa9     	cbnz	w9, 0x1640 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x104>
    2050: 85800061     	ldr	p1, [x3]
    2054: 2a1f03ef     	mov	w15, wzr
    2058: 5280002c     	mov	w12, #0x1               // =1
    205c: 937d7f07     	sbfiz	x7, x24, #3, #32
    2060: 93407f0e     	sxtw	x14, w24
    2064: 5280004d     	mov	w13, #0x2               // =2
    2068: c0c26401     	mov	z1.d, p1/m, za0h.d[w15, 0]
    206c: 8b070349     	add	x9, x26, x7
    2070: c0c26442     	mov	z2.d, p1/m, za1h.d[w15, 0]
    2074: 8b070121     	add	x1, x9, x7
    2078: c0c26483     	mov	z3.d, p1/m, za2h.d[w15, 0]
    207c: c0c264c4     	mov	z4.d, p1/m, za3h.d[w15, 0]
    2080: e5e0e741     	st1d	{ z1.d }, p1, [x26]
    2084: e5e1e742     	st1d	{ z2.d }, p1, [x26, #0x1, mul vl]
    2088: e5e2e743     	st1d	{ z3.d }, p1, [x26, #0x2, mul vl]
    208c: e5e3e744     	st1d	{ z4.d }, p1, [x26, #0x3, mul vl]
    2090: c0c20401     	mov	z1.d, p1/m, za0h.d[w12, 0]
    2094: c0c20442     	mov	z2.d, p1/m, za1h.d[w12, 0]
    2098: c0c20483     	mov	z3.d, p1/m, za2h.d[w12, 0]
    209c: c0c204c4     	mov	z4.d, p1/m, za3h.d[w12, 0]
    20a0: e5ee4741     	st1d	{ z1.d }, p1, [x26, x14, lsl #3]
    20a4: 5280006c     	mov	w12, #0x3               // =3
    20a8: e5e1e522     	st1d	{ z2.d }, p1, [x9, #0x1, mul vl]
    20ac: e5e2e523     	st1d	{ z3.d }, p1, [x9, #0x2, mul vl]
    20b0: e5e3e524     	st1d	{ z4.d }, p1, [x9, #0x3, mul vl]
    20b4: c0c22401     	mov	z1.d, p1/m, za0h.d[w13, 0]
    20b8: c0c22442     	mov	z2.d, p1/m, za1h.d[w13, 0]
    20bc: c0c22483     	mov	z3.d, p1/m, za2h.d[w13, 0]
    20c0: c0c224c4     	mov	z4.d, p1/m, za3h.d[w13, 0]
    20c4: e5ee4521     	st1d	{ z1.d }, p1, [x9, x14, lsl #3]
    20c8: 8b070029     	add	x9, x1, x7
    20cc: e5e1e422     	st1d	{ z2.d }, p1, [x1, #0x1, mul vl]
    20d0: e5e2e423     	st1d	{ z3.d }, p1, [x1, #0x2, mul vl]
    20d4: e5e3e424     	st1d	{ z4.d }, p1, [x1, #0x3, mul vl]
    20d8: c0c20401     	mov	z1.d, p1/m, za0h.d[w12, 0]
    20dc: c0c20442     	mov	z2.d, p1/m, za1h.d[w12, 0]
    20e0: c0c20483     	mov	z3.d, p1/m, za2h.d[w12, 0]
    20e4: c0c204c4     	mov	z4.d, p1/m, za3h.d[w12, 0]
    20e8: e5ee4421     	st1d	{ z1.d }, p1, [x1, x14, lsl #3]
    20ec: 5280008c     	mov	w12, #0x4               // =4
    20f0: e5e1e522     	st1d	{ z2.d }, p1, [x9, #0x1, mul vl]
    20f4: 8b070121     	add	x1, x9, x7
    20f8: e5e2e523     	st1d	{ z3.d }, p1, [x9, #0x2, mul vl]
    20fc: e5e3e524     	st1d	{ z4.d }, p1, [x9, #0x3, mul vl]
    2100: c0c20401     	mov	z1.d, p1/m, za0h.d[w12, 0]
    2104: c0c20442     	mov	z2.d, p1/m, za1h.d[w12, 0]
    2108: c0c20483     	mov	z3.d, p1/m, za2h.d[w12, 0]
    210c: c0c204c4     	mov	z4.d, p1/m, za3h.d[w12, 0]
    2110: e5ee4521     	st1d	{ z1.d }, p1, [x9, x14, lsl #3]
    2114: 528000ac     	mov	w12, #0x5               // =5
    2118: e5e1e422     	st1d	{ z2.d }, p1, [x1, #0x1, mul vl]
    211c: 8b070029     	add	x9, x1, x7
    2120: e5e2e423     	st1d	{ z3.d }, p1, [x1, #0x2, mul vl]
    2124: e5e3e424     	st1d	{ z4.d }, p1, [x1, #0x3, mul vl]
    2128: c0c20401     	mov	z1.d, p1/m, za0h.d[w12, 0]
    212c: c0c20442     	mov	z2.d, p1/m, za1h.d[w12, 0]
    2130: c0c20483     	mov	z3.d, p1/m, za2h.d[w12, 0]
    2134: c0c204c4     	mov	z4.d, p1/m, za3h.d[w12, 0]
    2138: e5ee4421     	st1d	{ z1.d }, p1, [x1, x14, lsl #3]
    213c: 528000cc     	mov	w12, #0x6               // =6
    2140: e5e1e522     	st1d	{ z2.d }, p1, [x9, #0x1, mul vl]
    2144: 8b070121     	add	x1, x9, x7
    2148: e5e2e523     	st1d	{ z3.d }, p1, [x9, #0x2, mul vl]
    214c: e5e3e524     	st1d	{ z4.d }, p1, [x9, #0x3, mul vl]
    2150: c0c20401     	mov	z1.d, p1/m, za0h.d[w12, 0]
    2154: c0c20442     	mov	z2.d, p1/m, za1h.d[w12, 0]
    2158: c0c20483     	mov	z3.d, p1/m, za2h.d[w12, 0]
    215c: c0c204c4     	mov	z4.d, p1/m, za3h.d[w12, 0]
    2160: e5ee4521     	st1d	{ z1.d }, p1, [x9, x14, lsl #3]
    2164: 528000ec     	mov	w12, #0x7               // =7
    2168: e5e1e422     	st1d	{ z2.d }, p1, [x1, #0x1, mul vl]
    216c: 8b070029     	add	x9, x1, x7
    2170: e5e2e423     	st1d	{ z3.d }, p1, [x1, #0x2, mul vl]
    2174: e5e3e424     	st1d	{ z4.d }, p1, [x1, #0x3, mul vl]
    2178: c0c20401     	mov	z1.d, p1/m, za0h.d[w12, 0]
    217c: c0c20442     	mov	z2.d, p1/m, za1h.d[w12, 0]
    2180: c0c20483     	mov	z3.d, p1/m, za2h.d[w12, 0]
    2184: c0c204c4     	mov	z4.d, p1/m, za3h.d[w12, 0]
    2188: e5ee4421     	st1d	{ z1.d }, p1, [x1, x14, lsl #3]
    218c: 8b070121     	add	x1, x9, x7
    2190: e5e1e522     	st1d	{ z2.d }, p1, [x9, #0x1, mul vl]
    2194: 5280002c     	mov	w12, #0x1               // =1
    2198: e5e2e523     	st1d	{ z3.d }, p1, [x9, #0x2, mul vl]
    219c: e5e3e524     	st1d	{ z4.d }, p1, [x9, #0x3, mul vl]
    21a0: c0c26501     	mov	z1.d, p1/m, za4h.d[w15, 0]
    21a4: c0c26542     	mov	z2.d, p1/m, za5h.d[w15, 0]
    21a8: c0c26583     	mov	z3.d, p1/m, za6h.d[w15, 0]
    21ac: c0c265c4     	mov	z4.d, p1/m, za7h.d[w15, 0]
    21b0: e5ee4521     	st1d	{ z1.d }, p1, [x9, x14, lsl #3]
    21b4: 8b070029     	add	x9, x1, x7
    21b8: e5e1e422     	st1d	{ z2.d }, p1, [x1, #0x1, mul vl]
    21bc: 8b07012f     	add	x15, x9, x7
    21c0: e5e2e423     	st1d	{ z3.d }, p1, [x1, #0x2, mul vl]
    21c4: e5e3e424     	st1d	{ z4.d }, p1, [x1, #0x3, mul vl]
    21c8: c0c20501     	mov	z1.d, p1/m, za4h.d[w12, 0]
    21cc: c0c20542     	mov	z2.d, p1/m, za5h.d[w12, 0]
    21d0: c0c20583     	mov	z3.d, p1/m, za6h.d[w12, 0]
    21d4: c0c205c4     	mov	z4.d, p1/m, za7h.d[w12, 0]
    21d8: e5ee4421     	st1d	{ z1.d }, p1, [x1, x14, lsl #3]
    21dc: 5280006c     	mov	w12, #0x3               // =3
    21e0: e5e1e522     	st1d	{ z2.d }, p1, [x9, #0x1, mul vl]
    21e4: e5e2e523     	st1d	{ z3.d }, p1, [x9, #0x2, mul vl]
    21e8: e5e3e524     	st1d	{ z4.d }, p1, [x9, #0x3, mul vl]
    21ec: c0c22501     	mov	z1.d, p1/m, za4h.d[w13, 0]
    21f0: c0c22542     	mov	z2.d, p1/m, za5h.d[w13, 0]
    21f4: c0c22583     	mov	z3.d, p1/m, za6h.d[w13, 0]
    21f8: c0c225c4     	mov	z4.d, p1/m, za7h.d[w13, 0]
    21fc: e5ee4521     	st1d	{ z1.d }, p1, [x9, x14, lsl #3]
    2200: 8b0701e9     	add	x9, x15, x7
    2204: e5e1e5e2     	st1d	{ z2.d }, p1, [x15, #0x1, mul vl]
    2208: e5e2e5e3     	st1d	{ z3.d }, p1, [x15, #0x2, mul vl]
    220c: e5e3e5e4     	st1d	{ z4.d }, p1, [x15, #0x3, mul vl]
    2210: c0c20501     	mov	z1.d, p1/m, za4h.d[w12, 0]
    2214: c0c20542     	mov	z2.d, p1/m, za5h.d[w12, 0]
    2218: c0c20583     	mov	z3.d, p1/m, za6h.d[w12, 0]
    221c: c0c205c4     	mov	z4.d, p1/m, za7h.d[w12, 0]
    2220: e5ee45e1     	st1d	{ z1.d }, p1, [x15, x14, lsl #3]
    2224: 5280008c     	mov	w12, #0x4               // =4
    2228: e5e1e522     	st1d	{ z2.d }, p1, [x9, #0x1, mul vl]
    222c: 8b07012f     	add	x15, x9, x7
    2230: e5e2e523     	st1d	{ z3.d }, p1, [x9, #0x2, mul vl]
    2234: e5e3e524     	st1d	{ z4.d }, p1, [x9, #0x3, mul vl]
    2238: c0c20501     	mov	z1.d, p1/m, za4h.d[w12, 0]
    223c: c0c20542     	mov	z2.d, p1/m, za5h.d[w12, 0]
    2240: c0c20583     	mov	z3.d, p1/m, za6h.d[w12, 0]
    2244: c0c205c4     	mov	z4.d, p1/m, za7h.d[w12, 0]
    2248: e5ee4521     	st1d	{ z1.d }, p1, [x9, x14, lsl #3]
    224c: 528000ac     	mov	w12, #0x5               // =5
    2250: e5e1e5e2     	st1d	{ z2.d }, p1, [x15, #0x1, mul vl]
    2254: 8b0701e9     	add	x9, x15, x7
    2258: e5e2e5e3     	st1d	{ z3.d }, p1, [x15, #0x2, mul vl]
    225c: e5e3e5e4     	st1d	{ z4.d }, p1, [x15, #0x3, mul vl]
    2260: c0c20501     	mov	z1.d, p1/m, za4h.d[w12, 0]
    2264: c0c20542     	mov	z2.d, p1/m, za5h.d[w12, 0]
    2268: c0c20583     	mov	z3.d, p1/m, za6h.d[w12, 0]
    226c: c0c205c4     	mov	z4.d, p1/m, za7h.d[w12, 0]
    2270: e5ee45e1     	st1d	{ z1.d }, p1, [x15, x14, lsl #3]
    2274: 528000cc     	mov	w12, #0x6               // =6
    2278: e5e1e522     	st1d	{ z2.d }, p1, [x9, #0x1, mul vl]
    227c: 8b07012f     	add	x15, x9, x7
    2280: e5e2e523     	st1d	{ z3.d }, p1, [x9, #0x2, mul vl]
    2284: e5e3e524     	st1d	{ z4.d }, p1, [x9, #0x3, mul vl]
    2288: c0c20501     	mov	z1.d, p1/m, za4h.d[w12, 0]
    228c: c0c20542     	mov	z2.d, p1/m, za5h.d[w12, 0]
    2290: c0c20583     	mov	z3.d, p1/m, za6h.d[w12, 0]
    2294: c0c205c4     	mov	z4.d, p1/m, za7h.d[w12, 0]
    2298: e5ee4521     	st1d	{ z1.d }, p1, [x9, x14, lsl #3]
    229c: 528000ec     	mov	w12, #0x7               // =7
    22a0: e5e1e5e2     	st1d	{ z2.d }, p1, [x15, #0x1, mul vl]
    22a4: 8b0701e9     	add	x9, x15, x7
    22a8: e5e2e5e3     	st1d	{ z3.d }, p1, [x15, #0x2, mul vl]
    22ac: e5e3e5e4     	st1d	{ z4.d }, p1, [x15, #0x3, mul vl]
    22b0: c0c20501     	mov	z1.d, p1/m, za4h.d[w12, 0]
    22b4: c0c20542     	mov	z2.d, p1/m, za5h.d[w12, 0]
    22b8: c0c20583     	mov	z3.d, p1/m, za6h.d[w12, 0]
    22bc: c0c205c4     	mov	z4.d, p1/m, za7h.d[w12, 0]
    22c0: e5ee45e1     	st1d	{ z1.d }, p1, [x15, x14, lsl #3]
    22c4: e5e1e522     	st1d	{ z2.d }, p1, [x9, #0x1, mul vl]
    22c8: e5e2e523     	st1d	{ z3.d }, p1, [x9, #0x2, mul vl]
    22cc: e5e3e524     	st1d	{ z4.d }, p1, [x9, #0x3, mul vl]
    22d0: b94002ee     	ldr	w14, [x23]
    22d4: 110004c6     	add	w6, w6, #0x1
    22d8: 6b0e00df     	cmp	w6, w14
    22dc: 54ffd02b     	b.lt	0x1ce0 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x7a4>
    22e0: 17fffccb     	b	0x160c <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xd0>
    22e4: b94017e1     	ldr	w1, [sp, #0x14]
    22e8: 90000080     	adrp	x0, 0x12000 <__FRAME_END__+0xf5f0>
    22ec: 9135a000     	add	x0, x0, #0xd68
    22f0: 97fff990     	bl	0x930 <__kmpc_for_static_fini@plt>
    22f4: a9494ff4     	ldp	x20, x19, [sp, #0x90]
    22f8: a94857f6     	ldp	x22, x21, [sp, #0x80]
    22fc: a9475ff8     	ldp	x24, x23, [sp, #0x70]
    2300: a94667fa     	ldp	x26, x25, [sp, #0x60]
    2304: a9456ffc     	ldp	x28, x27, [sp, #0x50]
    2308: a9447bfd     	ldp	x29, x30, [sp, #0x40]
    230c: 910283ff     	add	sp, sp, #0xa0
    2310: d65f03c0     	ret

0000000000002314 <_ZN4gemmIdE12compute_testEiiiPKdS2_Pddd>:
    2314: 6db63bef     	stp	d15, d14, [sp, #-0xa0]!
    2318: 6d0133ed     	stp	d13, d12, [sp, #0x10]
    231c: 6d022beb     	stp	d11, d10, [sp, #0x20]
    2320: 6d0323e9     	stp	d9, d8, [sp, #0x30]
    2324: a9047bfd     	stp	x29, x30, [sp, #0x40]
    2328: a9056ffc     	stp	x28, x27, [sp, #0x50]
    232c: a90667fa     	stp	x26, x25, [sp, #0x60]
    2330: a9075ff8     	stp	x24, x23, [sp, #0x70]
    2334: a90857f6     	stp	x22, x21, [sp, #0x80]
    2338: a9094ff4     	stp	x20, x19, [sp, #0x90]
    233c: 910103fd     	add	x29, sp, #0x40
    2340: d10303ff     	sub	sp, sp, #0xc0
    2344: 043f5fff     	addsvl	sp, sp, #-0x1
    2348: 6d0607e0     	stp	d0, d1, [sp, #0x60]
    234c: d503437f     	smstart	sm
    2350: 25d8e3e0     	ptrue	p0.d
    2354: 53057c36     	lsr	w22, w1, #5
    2358: 53047c09     	lsr	w9, w0, #4
    235c: 6d4603e2     	ldp	d2, d0, [sp, #0x60]
    2360: 2a1f03e8     	mov	w8, wzr
    2364: 51000ad7     	sub	w23, w22, #0x2
    2368: 5280004c     	mov	w12, #0x2               // =2
    236c: 910243ed     	add	x13, sp, #0x90
    2370: 910263ee     	add	x14, sp, #0x98
    2374: 9101f3ef     	add	x15, sp, #0x7c
    2378: 910213f8     	add	x24, sp, #0x84
    237c: 910203f3     	add	x19, sp, #0x80
    2380: 910283f9     	add	x25, sp, #0xa0
    2384: 9102e3fa     	add	x26, sp, #0xb8
    2388: 9102a3fb     	add	x27, sp, #0xa8
    238c: 291127ff     	stp	wzr, w9, [sp, #0x88]
    2390: 9102f3fc     	add	x28, sp, #0xbc
    2394: d10103a9     	sub	x9, x29, #0x40
    2398: 90000094     	adrp	x20, 0x12000 <__FRAME_END__+0xf5f0>
    239c: 91360294     	add	x20, x20, #0xd80
    23a0: f0fffff5     	adrp	x21, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0x2dc>
    23a4: 9114f2b5     	add	x21, x21, #0x53c
    23a8: 291703e1     	stp	w1, w0, [sp, #0xb8]
    23ac: a90a8fe4     	stp	x4, x3, [sp, #0xa8]
    23b0: f90053e5     	str	x5, [sp, #0xa0]
    23b4: 6d090be0     	stp	d0, d2, [sp, #0x90]
    23b8: e5bf1d20     	str	p0, [x9, #-0x1, mul vl]
    23bc: b90073e2     	str	w2, [sp, #0x70]
    23c0: 1120010a     	add	w10, w8, #0x800
    23c4: 7100011f     	cmp	w8, #0x0
    23c8: 4b080048     	sub	w8, w2, w8
    23cc: 1a9f17eb     	cset	w11, eq
    23d0: 6b02015f     	cmp	w10, w2
    23d4: 5281000a     	mov	w10, #0x800             // =2048
    23d8: 2a1f03e9     	mov	w9, wzr
    23dc: 1a8ac108     	csel	w8, w8, w10, gt
    23e0: 1a9fb7ea     	cset	w10, ge
    23e4: 390203eb     	strb	w11, [sp, #0x80]
    23e8: b90087e8     	str	w8, [sp, #0x84]
    23ec: 3901f3ea     	strb	w10, [sp, #0x7c]
    23f0: b9007bff     	str	wzr, [sp, #0x78]
    23f4: 4b0902c8     	sub	w8, w22, w9
    23f8: 6b17013f     	cmp	w9, w23
    23fc: a90437ee     	stp	x14, x13, [sp, #0x40]
    2400: 1a8cc108     	csel	w8, w8, w12, gt
    2404: a9033ff8     	stp	x24, x15, [sp, #0x30]
    2408: b90077e8     	str	w8, [sp, #0x74]
    240c: d10103a8     	sub	x8, x29, #0x40
    2410: 04685fe8     	addspl	x8, x8, #-0x1
    2414: a90167fa     	stp	x26, x25, [sp, #0x10]
    2418: a90223f3     	stp	x19, x8, [sp, #0x20]
    241c: a9006ffc     	stp	x28, x27, [sp]
    2420: d503427f     	smstop	sm
    2424: 910233e3     	add	x3, sp, #0x8c
    2428: 9101d3e4     	add	x4, sp, #0x74
    242c: 9101e3e5     	add	x5, sp, #0x78
    2430: 9102c3e6     	add	x6, sp, #0xb0
    2434: 910223e7     	add	x7, sp, #0x88
    2438: aa1403e0     	mov	x0, x20
    243c: 528001e1     	mov	w1, #0xf                // =15
    2440: aa1503e2     	mov	x2, x21
    2444: 97fff963     	bl	0x9d0 <__kmpc_fork_call@plt>
    2448: 9101f3ef     	add	x15, sp, #0x7c
    244c: 910263ee     	add	x14, sp, #0x98
    2450: 910243ed     	add	x13, sp, #0x90
    2454: 5280004c     	mov	w12, #0x2               // =2
    2458: d503437f     	smstart	sm
    245c: b9407be8     	ldr	w8, [sp, #0x78]
    2460: 11000909     	add	w9, w8, #0x2
    2464: 6b16013f     	cmp	w9, w22
    2468: b9007be9     	str	w9, [sp, #0x78]
    246c: 54fffc4b     	b.lt	0x23f4 <_ZN4gemmIdE12compute_testEiiiPKdS2_Pddd+0xe0>
    2470: b9408be8     	ldr	w8, [sp, #0x88]
    2474: b94073e2     	ldr	w2, [sp, #0x70]
    2478: 11200108     	add	w8, w8, #0x800
    247c: 6b02011f     	cmp	w8, w2
    2480: b9008be8     	str	w8, [sp, #0x88]
    2484: 54fff9eb     	b.lt	0x23c0 <_ZN4gemmIdE12compute_testEiiiPKdS2_Pddd+0xac>
    2488: d503427f     	smstop	sm
    248c: 043f583f     	addsvl	sp, sp, #0x1
    2490: 910303ff     	add	sp, sp, #0xc0
    2494: a9494ff4     	ldp	x20, x19, [sp, #0x90]
    2498: a94857f6     	ldp	x22, x21, [sp, #0x80]
    249c: a9475ff8     	ldp	x24, x23, [sp, #0x70]
    24a0: a94667fa     	ldp	x26, x25, [sp, #0x60]
    24a4: a9456ffc     	ldp	x28, x27, [sp, #0x50]
    24a8: a9447bfd     	ldp	x29, x30, [sp, #0x40]
    24ac: 6d4323e9     	ldp	d9, d8, [sp, #0x30]
    24b0: 6d422beb     	ldp	d11, d10, [sp, #0x20]
    24b4: 6d4133ed     	ldp	d13, d12, [sp, #0x10]
    24b8: 6cca3bef     	ldp	d15, d14, [sp], #0xa0
    24bc: d65f03c0     	ret

Disassembly of section .fini:

00000000000024c0 <_fini>:
    24c0: d503201f     	nop
    24c4: a9bf7bfd     	stp	x29, x30, [sp, #-0x10]!
    24c8: 910003fd     	mov	x29, sp
    24cc: a8c17bfd     	ldp	x29, x30, [sp], #0x10
    24d0: d65f03c0     	ret
