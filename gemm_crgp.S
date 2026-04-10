
gemm_crgp:	file format elf64-littleaarch64

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
     904: f0000090     	adrp	x16, 0x13000 <__FRAME_END__+0x10104>
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
     a1c: f0000080     	adrp	x0, 0x13000 <__FRAME_END__+0x10104>
     a20: f947e000     	ldr	x0, [x0, #0xfc0]
     a24: d2800003     	mov	x3, #0x0                // =0
     a28: d2800004     	mov	x4, #0x0                // =0
     a2c: 97ffffd5     	bl	0x980 <__libc_start_main@plt>
     a30: 97ffffe4     	bl	0x9c0 <abort@plt>

0000000000000a34 <call_weak_fn>:
     a34: f0000080     	adrp	x0, 0x13000 <__FRAME_END__+0x10104>
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
     a68: f0000081     	adrp	x1, 0x13000 <__FRAME_END__+0x10104>
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
     aa4: f0000082     	adrp	x2, 0x13000 <__FRAME_END__+0x10104>
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
     ad8: f0000080     	adrp	x0, 0x13000 <__FRAME_END__+0x10104>
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
     b24: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x718>
     b28: 912e4400     	add	x0, x0, #0xb91
     b2c: 97ffff89     	bl	0x950 <puts@plt>
     b30: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x718>
     b34: 9127e000     	add	x0, x0, #0x9f8
     b38: 52800801     	mov	w1, #0x40               // =64
     b3c: 52800202     	mov	w2, #0x10               // =16
     b40: 52800403     	mov	w3, #0x20               // =32
     b44: 97ffffab     	bl	0x9f0 <printf@plt>
     b48: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x718>
     b4c: 91287000     	add	x0, x0, #0xa1c
     b50: 52810001     	mov	w1, #0x800              // =2048
     b54: 52800802     	mov	w2, #0x40               // =64
     b58: 52800103     	mov	w3, #0x8                // =8
     b5c: 52800204     	mov	w4, #0x10               // =16
     b60: 97ffffa4     	bl	0x9f0 <printf@plt>
     b64: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x718>
     b68: 91290c00     	add	x0, x0, #0xa43
     b6c: 528004c1     	mov	w1, #0x26               // =38
     b70: 97ffffa0     	bl	0x9f0 <printf@plt>
     b74: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x718>
     b78: 912ed400     	add	x0, x0, #0xbb5
     b7c: 97ffff75     	bl	0x950 <puts@plt>
     b80: 2f00e401     	movi	d1, #0000000000000000
     b84: 1e6e1000     	fmov	d0, #1.00000000
     b88: 52800400     	mov	w0, #0x20               // =32
     b8c: 52800801     	mov	w1, #0x40               // =64
     b90: 52801002     	mov	w2, #0x80               // =128
     b94: 94000066     	bl	0xd2c <_Z9test_gemmIdEbiiiT_S0_>
     b98: 2a0003f3     	mov	w19, w0
     b9c: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x718>
     ba0: 912f3400     	add	x0, x0, #0xbcd
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
     bd0: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x718>
     bd4: 912f9400     	add	x0, x0, #0xbe5
     bd8: 1a881133     	csel	w19, w9, w8, ne
     bdc: 97ffff5d     	bl	0x950 <puts@plt>
     be0: 1e601000     	fmov	d0, #2.00000000
     be4: 1e6c1001     	fmov	d1, #0.50000000
     be8: 52800400     	mov	w0, #0x20               // =32
     bec: 52800801     	mov	w1, #0x40               // =64
     bf0: 52820002     	mov	w2, #0x1000             // =4096
     bf4: 9400004e     	bl	0xd2c <_Z9test_gemmIdEbiiiT_S0_>
     bf8: 12000014     	and	w20, w0, #0x1
     bfc: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x718>
     c00: 91300c00     	add	x0, x0, #0xc03
     c04: 97ffff53     	bl	0x950 <puts@plt>
     c08: 2f00e401     	movi	d1, #0000000000000000
     c0c: 1e6e1000     	fmov	d0, #1.00000000
     c10: 52800800     	mov	w0, #0x40               // =64
     c14: 52801001     	mov	w1, #0x80               // =128
     c18: 52810002     	mov	w2, #0x800              // =2048
     c1c: 94000044     	bl	0xd2c <_Z9test_gemmIdEbiiiT_S0_>
     c20: 12000008     	and	w8, w0, #0x1
     c24: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x718>
     c28: 91294000     	add	x0, x0, #0xa50
     c2c: 0b080288     	add	w8, w20, w8
     c30: 52800082     	mov	w2, #0x4                // =4
     c34: 0b080273     	add	w19, w19, w8
     c38: 2a1303e1     	mov	w1, w19
     c3c: 97ffff6d     	bl	0x9f0 <printf@plt>
     c40: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x718>
     c44: 91308000     	add	x0, x0, #0xc20
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
     ca0: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x718>
     ca4: 9129d800     	add	x0, x0, #0xa76
     ca8: 52800801     	mov	w1, #0x40               // =64
     cac: 52801002     	mov	w2, #0x80               // =128
     cb0: 52820003     	mov	w3, #0x1000             // =4096
     cb4: 52800044     	mov	w4, #0x2                // =2
     cb8: 97ffff4e     	bl	0x9f0 <printf@plt>
     cbc: 528004c0     	mov	w0, #0x26               // =38
     cc0: 97ffff38     	bl	0x9a0 <omp_set_num_threads@plt>
     cc4: aa1403e0     	mov	x0, x20
     cc8: aa1503e1     	mov	x1, x21
     ccc: aa1603e2     	mov	x2, x22
     cd0: 94000154     	bl	0x1220 <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd>
     cd4: d2e83208     	mov	x8, #0x4190000000000000 // =4724276009111650304
     cd8: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x718>
     cdc: 912a5000     	add	x0, x0, #0xa94
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
     d60: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x718>
     d64: 912ae800     	add	x0, x0, #0xaba
     d68: d0000001     	adrp	x1, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x718>
     d6c: 912acc21     	add	x1, x1, #0xab3
     d70: 2a1903e2     	mov	w2, w25
     d74: 2a1803e3     	mov	w3, w24
     d78: 2a1303e4     	mov	w4, w19
     d7c: 1e604028     	fmov	d8, d1
     d80: 1e604009     	fmov	d9, d0
     d84: 97ffff1b     	bl	0x9f0 <printf@plt>
     d88: 528004c0     	mov	w0, #0x26               // =38
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
     df0: d000000d     	adrp	x13, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x718>
     df4: 912781ad     	add	x13, x13, #0x9e0
     df8: 05e03963     	mov	z3.d, x11
     dfc: 9b0a7f8a     	mul	x10, x28, x10
     e00: d000000b     	adrp	x11, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x718>
     e04: d000000c     	adrp	x12, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x718>
     e08: 2a1903f7     	mov	w23, w25
     e0c: fd44ed61     	ldr	d1, [x11, #0x9d8]
     e10: fd44f182     	ldr	d2, [x12, #0x9e0]
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
     ef4: d000000b     	adrp	x11, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x718>
     ef8: 9127616b     	add	x11, x11, #0x9d8
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
    1114: 9400055f     	bl	0x2690 <_ZN4gemmIdE12compute_testEiiiPKdS2_Pddd>
    1118: 2f00e408     	movi	d8, #0000000000000000
    111c: b0000008     	adrp	x8, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x718>
    1120: f9400bfb     	ldr	x27, [sp, #0x10]
    1124: fd44f509     	ldr	d9, [x8, #0x9e8]
    1128: b0000008     	adrp	x8, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x718>
    112c: aa1f03f8     	mov	x24, xzr
    1130: fd44f90a     	ldr	d10, [x8, #0x9f0]
    1134: b0000019     	adrp	x25, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x718>
    1138: 912c0b39     	add	x25, x25, #0xb02
    113c: 52800033     	mov	w19, #0x1               // =1
    1140: b0000017     	adrp	x23, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x718>
    1144: 912d72f7     	add	x23, x23, #0xb5c
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
    11b8: b0000008     	adrp	x8, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x718>
    11bc: 912cf908     	add	x8, x8, #0xb3e
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
    1254: aa0203f8     	mov	x24, x2
    1258: aa0103f6     	mov	x22, x1
    125c: aa0003f7     	mov	x23, x0
    1260: d503437f     	smstart	sm
    1264: d503427f     	smstop	sm
    1268: 52a00400     	mov	w0, #0x200000           // =2097152
    126c: 97fffdad     	bl	0x920 <_Znam@plt>
    1270: aa0003f4     	mov	x20, x0
    1274: d503437f     	smstart	sm
    1278: d503427f     	smstop	sm
    127c: 52a00800     	mov	w0, #0x400000           // =4194304
    1280: 97fffda8     	bl	0x920 <_Znam@plt>
    1284: f9003fe0     	str	x0, [sp, #0x78]
    1288: d503437f     	smstart	sm
    128c: aa1f03e8     	mov	x8, xzr
    1290: 910102e9     	add	x9, x23, #0x40
    1294: 3cdc0120     	ldur	q0, [x9, #-0x40]
    1298: 8b08028a     	add	x10, x20, x8
    129c: fc5d0121     	ldur	d1, [x9, #-0x30]
    12a0: 3cdd8122     	ldur	q2, [x9, #-0x28]
    12a4: 91020108     	add	x8, x8, #0x80
    12a8: 3d800140     	str	q0, [x10]
    12ac: fc5e8120     	ldur	d0, [x9, #-0x18]
    12b0: f142011f     	cmp	x8, #0x80, lsl #12      // =0x80000
    12b4: fd000941     	str	d1, [x10, #0x10]
    12b8: fd001540     	str	d0, [x10, #0x28]
    12bc: ad7f8121     	ldp	q1, q0, [x9, #-0x10]
    12c0: 3c818142     	stur	q2, [x10, #0x18]
    12c4: ad018141     	stp	q1, q0, [x10, #0x30]
    12c8: 6d410122     	ldp	d2, d0, [x9, #0x10]
    12cc: 6d050142     	stp	d2, d0, [x10, #0x50]
    12d0: 6d420121     	ldp	d1, d0, [x9, #0x20]
    12d4: 6d060141     	stp	d1, d0, [x10, #0x60]
    12d8: 6d430122     	ldp	d2, d0, [x9, #0x30]
    12dc: 91080129     	add	x9, x9, #0x200
    12e0: 6d070142     	stp	d2, d0, [x10, #0x70]
    12e4: 54fffd81     	b.ne	0x1294 <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd+0x74>
    12e8: 9103e2e8     	add	x8, x23, #0xf8
    12ec: 52a00109     	mov	w9, #0x80000            // =524288
    12f0: 3cd88100     	ldur	q0, [x8, #-0x78]
    12f4: 8b09028a     	add	x10, x20, x9
    12f8: fc598101     	ldur	d1, [x8, #-0x68]
    12fc: 3cda0102     	ldur	q2, [x8, #-0x60]
    1300: 91020129     	add	x9, x9, #0x80
    1304: 3d800140     	str	q0, [x10]
    1308: fc5b0100     	ldur	d0, [x8, #-0x50]
    130c: f144013f     	cmp	x9, #0x100, lsl #12     // =0x100000
    1310: fd000941     	str	d1, [x10, #0x10]
    1314: 3cdb8101     	ldur	q1, [x8, #-0x48]
    1318: fd001540     	str	d0, [x10, #0x28]
    131c: 3cdc8100     	ldur	q0, [x8, #-0x38]
    1320: 3c818142     	stur	q2, [x10, #0x18]
    1324: ad018141     	stp	q1, q0, [x10, #0x30]
    1328: 6d7d8102     	ldp	d2, d0, [x8, #-0x28]
    132c: 6d050142     	stp	d2, d0, [x10, #0x50]
    1330: 6d7e8101     	ldp	d1, d0, [x8, #-0x18]
    1334: 6d060141     	stp	d1, d0, [x10, #0x60]
    1338: 6d7f8102     	ldp	d2, d0, [x8, #-0x8]
    133c: 91080108     	add	x8, x8, #0x200
    1340: 6d070142     	stp	d2, d0, [x10, #0x70]
    1344: 54fffd61     	b.ne	0x12f0 <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd+0xd0>
    1348: 9105e2e8     	add	x8, x23, #0x178
    134c: 3cd88100     	ldur	q0, [x8, #-0x78]
    1350: 8b09028a     	add	x10, x20, x9
    1354: fc598101     	ldur	d1, [x8, #-0x68]
    1358: 3cda0102     	ldur	q2, [x8, #-0x60]
    135c: 91020129     	add	x9, x9, #0x80
    1360: 3d800140     	str	q0, [x10]
    1364: fc5b0100     	ldur	d0, [x8, #-0x50]
    1368: f146013f     	cmp	x9, #0x180, lsl #12     // =0x180000
    136c: fd000941     	str	d1, [x10, #0x10]
    1370: 3cdb8101     	ldur	q1, [x8, #-0x48]
    1374: fd001540     	str	d0, [x10, #0x28]
    1378: 3cdc8100     	ldur	q0, [x8, #-0x38]
    137c: 3c818142     	stur	q2, [x10, #0x18]
    1380: ad018141     	stp	q1, q0, [x10, #0x30]
    1384: 6d7d8102     	ldp	d2, d0, [x8, #-0x28]
    1388: 6d050142     	stp	d2, d0, [x10, #0x50]
    138c: 6d7e8101     	ldp	d1, d0, [x8, #-0x18]
    1390: 6d060141     	stp	d1, d0, [x10, #0x60]
    1394: 6d7f8102     	ldp	d2, d0, [x8, #-0x8]
    1398: 91080108     	add	x8, x8, #0x200
    139c: 6d070142     	stp	d2, d0, [x10, #0x70]
    13a0: 54fffd61     	b.ne	0x134c <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd+0x12c>
    13a4: 9107e2e8     	add	x8, x23, #0x1f8
    13a8: 3cd88100     	ldur	q0, [x8, #-0x78]
    13ac: 8b09028a     	add	x10, x20, x9
    13b0: fc598101     	ldur	d1, [x8, #-0x68]
    13b4: 3cda0102     	ldur	q2, [x8, #-0x60]
    13b8: 91020129     	add	x9, x9, #0x80
    13bc: 3d800140     	str	q0, [x10]
    13c0: fc5b0100     	ldur	d0, [x8, #-0x50]
    13c4: f148013f     	cmp	x9, #0x200, lsl #12     // =0x200000
    13c8: fd000941     	str	d1, [x10, #0x10]
    13cc: 3cdb8101     	ldur	q1, [x8, #-0x48]
    13d0: fd001540     	str	d0, [x10, #0x28]
    13d4: 3cdc8100     	ldur	q0, [x8, #-0x38]
    13d8: 3c818142     	stur	q2, [x10, #0x18]
    13dc: ad018141     	stp	q1, q0, [x10, #0x30]
    13e0: 6d7d8102     	ldp	d2, d0, [x8, #-0x28]
    13e4: 6d050142     	stp	d2, d0, [x10, #0x50]
    13e8: 6d7e8101     	ldp	d1, d0, [x8, #-0x18]
    13ec: 6d060141     	stp	d1, d0, [x10, #0x60]
    13f0: 6d7f8102     	ldp	d2, d0, [x8, #-0x8]
    13f4: 91080108     	add	x8, x8, #0x200
    13f8: 6d070142     	stp	d2, d0, [x10, #0x70]
    13fc: 54fffd61     	b.ne	0x13a8 <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd+0x188>
    1400: 52801013     	mov	w19, #0x80              // =128
    1404: d503427f     	smstop	sm
    1408: f9403ff5     	ldr	x21, [sp, #0x78]
    140c: 52801000     	mov	w0, #0x80               // =128
    1410: 52820001     	mov	w1, #0x1000             // =4096
    1414: aa1603e2     	mov	x2, x22
    1418: aa1503e3     	mov	x3, x21
    141c: 940000c0     	bl	0x171c <_ZN4gemmIdE6pack_BEiiPKdPd>
    1420: 5282000f     	mov	w15, #0x1000            // =4096
    1424: d503437f     	smstart	sm
    1428: 25d8e3e0     	ptrue	p0.d
    142c: d2e7fe09     	mov	x9, #0x3ff0000000000000 // =4607182418800017408
    1430: 2a1f03e8     	mov	w8, wzr
    1434: 29194fef     	stp	w15, w19, [sp, #0xc8]
    1438: 5280008c     	mov	w12, #0x4               // =4
    143c: 5280004d     	mov	w13, #0x2               // =2
    1440: a906d3f8     	stp	x24, x20, [sp, #0x68]
    1444: 910283ee     	add	x14, sp, #0xa0
    1448: 9102a3fc     	add	x28, sp, #0xa8
    144c: a90bd3f5     	stp	x21, x20, [sp, #0xb8]
    1450: 910233f5     	add	x21, sp, #0x8c
    1454: 910253f4     	add	x20, sp, #0x94
    1458: a90ae3e9     	stp	x9, x24, [sp, #0xa8]
    145c: 910243f9     	add	x25, sp, #0x90
    1460: 910333f3     	add	x19, sp, #0xcc
    1464: 9102c3f8     	add	x24, sp, #0xb0
    1468: 9102e3fa     	add	x26, sp, #0xb8
    146c: d10103a9     	sub	x9, x29, #0x40
    1470: 910263fb     	add	x27, sp, #0x98
    1474: d0000096     	adrp	x22, 0x13000 <__FRAME_END__+0x10104>
    1478: 913602d6     	add	x22, x22, #0xd80
    147c: 90000017     	adrp	x23, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0x2d4>
    1480: 9123a2f7     	add	x23, x23, #0x8e8
    1484: f90053ff     	str	xzr, [sp, #0xa0]
    1488: 291333ff     	stp	wzr, w12, [sp, #0x98]
    148c: e5bf1920     	str	p0, [x9, #-0x2, mul vl]
    1490: e5bf1d20     	str	p0, [x9, #-0x1, mul vl]
    1494: 1120010a     	add	w10, w8, #0x800
    1498: 7100011f     	cmp	w8, #0x0
    149c: 4b0801e8     	sub	w8, w15, w8
    14a0: 1a9f17eb     	cset	w11, eq
    14a4: 6b0f015f     	cmp	w10, w15
    14a8: 5281000a     	mov	w10, #0x800             // =2048
    14ac: 2a1f03e9     	mov	w9, wzr
    14b0: 1a8ac108     	csel	w8, w8, w10, gt
    14b4: 1a9fb7ea     	cset	w10, ge
    14b8: 390243eb     	strb	w11, [sp, #0x90]
    14bc: b90097e8     	str	w8, [sp, #0x94]
    14c0: 390233ea     	strb	w10, [sp, #0x8c]
    14c4: b9008bff     	str	wzr, [sp, #0x88]
    14c8: 4b090188     	sub	w8, w12, w9
    14cc: 7100093f     	cmp	w9, #0x2
    14d0: a9043bfc     	stp	x28, x14, [sp, #0x40]
    14d4: 1a8dc108     	csel	w8, w8, w13, gt
    14d8: a90357f4     	stp	x20, x21, [sp, #0x30]
    14dc: b90087e8     	str	w8, [sp, #0x84]
    14e0: d10103a8     	sub	x8, x29, #0x40
    14e4: 04685fe8     	addspl	x8, x8, #-0x1
    14e8: a9014ff8     	stp	x24, x19, [sp, #0x10]
    14ec: a90223f9     	stp	x25, x8, [sp, #0x20]
    14f0: a9006bfb     	stp	x27, x26, [sp]
    14f4: d503427f     	smstop	sm
    14f8: 910273e3     	add	x3, sp, #0x9c
    14fc: 910213e4     	add	x4, sp, #0x84
    1500: 910223e5     	add	x5, sp, #0x88
    1504: 910303e6     	add	x6, sp, #0xc0
    1508: 910323e7     	add	x7, sp, #0xc8
    150c: aa1603e0     	mov	x0, x22
    1510: 528001e1     	mov	w1, #0xf                // =15
    1514: aa1703e2     	mov	x2, x23
    1518: 97fffd2e     	bl	0x9d0 <__kmpc_fork_call@plt>
    151c: 910283ee     	add	x14, sp, #0xa0
    1520: 5280004d     	mov	w13, #0x2               // =2
    1524: 5280008c     	mov	w12, #0x4               // =4
    1528: d503437f     	smstart	sm
    152c: b9408be8     	ldr	w8, [sp, #0x88]
    1530: 11000909     	add	w9, w8, #0x2
    1534: 7100091f     	cmp	w8, #0x2
    1538: b9008be9     	str	w9, [sp, #0x88]
    153c: 54fffc6b     	b.lt	0x14c8 <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd+0x2a8>
    1540: b9409be8     	ldr	w8, [sp, #0x98]
    1544: b940cbef     	ldr	w15, [sp, #0xc8]
    1548: 11200108     	add	w8, w8, #0x800
    154c: 6b0f011f     	cmp	w8, w15
    1550: b9009be8     	str	w8, [sp, #0x98]
    1554: 54fffa0b     	b.lt	0x1494 <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd+0x274>
    1558: d503427f     	smstop	sm
    155c: 97fffcf9     	bl	0x940 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
    1560: f90033e0     	str	x0, [sp, #0x60]
    1564: d503437f     	smstart	sm
    1568: 5280100a     	mov	w10, #0x80              // =128
    156c: 52820009     	mov	w9, #0x1000             // =4096
    1570: 2a1f03e8     	mov	w8, wzr
    1574: 29192be9     	stp	w9, w10, [sp, #0xc8]
    1578: a9472fea     	ldp	x10, x11, [sp, #0x70]
    157c: 5280008d     	mov	w13, #0x4               // =4
    1580: 5280004e     	mov	w14, #0x2               // =2
    1584: 910283ef     	add	x15, sp, #0xa0
    1588: 9102a3fc     	add	x28, sp, #0xa8
    158c: 910233f4     	add	x20, sp, #0x8c
    1590: 910253f6     	add	x22, sp, #0x94
    1594: a90babeb     	stp	x11, x10, [sp, #0xb8]
    1598: f94037eb     	ldr	x11, [sp, #0x68]
    159c: d2e7fe0a     	mov	x10, #0x3ff0000000000000 // =4607182418800017408
    15a0: 910243f9     	add	x25, sp, #0x90
    15a4: 910333f3     	add	x19, sp, #0xcc
    15a8: 9102c3f8     	add	x24, sp, #0xb0
    15ac: a90aafea     	stp	x10, x11, [sp, #0xa8]
    15b0: d10103aa     	sub	x10, x29, #0x40
    15b4: 9102e3fa     	add	x26, sp, #0xb8
    15b8: 85bf1940     	ldr	p0, [x10, #-0x2, mul vl]
    15bc: 910263fb     	add	x27, sp, #0x98
    15c0: d0000095     	adrp	x21, 0x13000 <__FRAME_END__+0x10104>
    15c4: 913602b5     	add	x21, x21, #0xd80
    15c8: 90000017     	adrp	x23, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0x2d4>
    15cc: 9123a2f7     	add	x23, x23, #0x8e8
    15d0: f90053ff     	str	xzr, [sp, #0xa0]
    15d4: 291337ff     	stp	wzr, w13, [sp, #0x98]
    15d8: e5bf1d40     	str	p0, [x10, #-0x1, mul vl]
    15dc: 1120010b     	add	w11, w8, #0x800
    15e0: 7100011f     	cmp	w8, #0x0
    15e4: 4b080128     	sub	w8, w9, w8
    15e8: 1a9f17ec     	cset	w12, eq
    15ec: 6b09017f     	cmp	w11, w9
    15f0: 52810009     	mov	w9, #0x800              // =2048
    15f4: 2a1f03ea     	mov	w10, wzr
    15f8: 1a89c108     	csel	w8, w8, w9, gt
    15fc: 1a9fb7e9     	cset	w9, ge
    1600: 390243ec     	strb	w12, [sp, #0x90]
    1604: b90097e8     	str	w8, [sp, #0x94]
    1608: 390233e9     	strb	w9, [sp, #0x8c]
    160c: b9008bff     	str	wzr, [sp, #0x88]
    1610: 4b0a01a8     	sub	w8, w13, w10
    1614: 7100095f     	cmp	w10, #0x2
    1618: a9043ffc     	stp	x28, x15, [sp, #0x40]
    161c: 1a8ec108     	csel	w8, w8, w14, gt
    1620: a90353f6     	stp	x22, x20, [sp, #0x30]
    1624: b90087e8     	str	w8, [sp, #0x84]
    1628: d10103a8     	sub	x8, x29, #0x40
    162c: 04685fe8     	addspl	x8, x8, #-0x1
    1630: a9014ff8     	stp	x24, x19, [sp, #0x10]
    1634: a90223f9     	stp	x25, x8, [sp, #0x20]
    1638: a9006bfb     	stp	x27, x26, [sp]
    163c: d503427f     	smstop	sm
    1640: 910273e3     	add	x3, sp, #0x9c
    1644: 910213e4     	add	x4, sp, #0x84
    1648: 910223e5     	add	x5, sp, #0x88
    164c: 910303e6     	add	x6, sp, #0xc0
    1650: 910323e7     	add	x7, sp, #0xc8
    1654: aa1503e0     	mov	x0, x21
    1658: 528001e1     	mov	w1, #0xf                // =15
    165c: aa1703e2     	mov	x2, x23
    1660: 97fffcdc     	bl	0x9d0 <__kmpc_fork_call@plt>
    1664: 910283ef     	add	x15, sp, #0xa0
    1668: 5280004e     	mov	w14, #0x2               // =2
    166c: 5280008d     	mov	w13, #0x4               // =4
    1670: d503437f     	smstart	sm
    1674: b9408be8     	ldr	w8, [sp, #0x88]
    1678: 1100090a     	add	w10, w8, #0x2
    167c: 7100091f     	cmp	w8, #0x2
    1680: b9008bea     	str	w10, [sp, #0x88]
    1684: 54fffc6b     	b.lt	0x1610 <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd+0x3f0>
    1688: b9409be8     	ldr	w8, [sp, #0x98]
    168c: b940cbe9     	ldr	w9, [sp, #0xc8]
    1690: 11200108     	add	w8, w8, #0x800
    1694: 6b09011f     	cmp	w8, w9
    1698: b9009be8     	str	w8, [sp, #0x98]
    169c: 54fffa0b     	b.lt	0x15dc <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd+0x3bc>
    16a0: d503427f     	smstop	sm
    16a4: 97fffca7     	bl	0x940 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
    16a8: aa0003f5     	mov	x21, x0
    16ac: d503437f     	smstart	sm
    16b0: d503427f     	smstop	sm
    16b4: f9403be0     	ldr	x0, [sp, #0x70]
    16b8: 97fffcb6     	bl	0x990 <_ZdaPv@plt>
    16bc: d503437f     	smstart	sm
    16c0: d503427f     	smstop	sm
    16c4: f9403fe0     	ldr	x0, [sp, #0x78]
    16c8: 97fffcb2     	bl	0x990 <_ZdaPv@plt>
    16cc: d503437f     	smstart	sm
    16d0: f94033e8     	ldr	x8, [sp, #0x60]
    16d4: cb0802a8     	sub	x8, x21, x8
    16d8: 9e620100     	scvtf	d0, x8
    16dc: fd003fe0     	str	d0, [sp, #0x78]
    16e0: d503427f     	smstop	sm
    16e4: fd403fe0     	ldr	d0, [sp, #0x78]
    16e8: 043f583f     	addsvl	sp, sp, #0x1
    16ec: 910343ff     	add	sp, sp, #0xd0
    16f0: a9494ff4     	ldp	x20, x19, [sp, #0x90]
    16f4: a94857f6     	ldp	x22, x21, [sp, #0x80]
    16f8: a9475ff8     	ldp	x24, x23, [sp, #0x70]
    16fc: a94667fa     	ldp	x26, x25, [sp, #0x60]
    1700: a9456ffc     	ldp	x28, x27, [sp, #0x50]
    1704: a9447bfd     	ldp	x29, x30, [sp, #0x40]
    1708: 6d4323e9     	ldp	d9, d8, [sp, #0x30]
    170c: 6d422beb     	ldp	d11, d10, [sp, #0x20]
    1710: 6d4133ed     	ldp	d13, d12, [sp, #0x10]
    1714: 6cca3bef     	ldp	d15, d14, [sp], #0xa0
    1718: d65f03c0     	ret

000000000000171c <_ZN4gemmIdE6pack_BEiiPKdPd>:
    171c: 53057c0a     	lsr	w10, w0, #5
    1720: 531b682b     	lsl	w11, w1, #5
    1724: 2a1f03e8     	mov	w8, wzr
    1728: aa1f03e9     	mov	x9, xzr
    172c: 2a0103ec     	mov	w12, w1
    1730: 528003ed     	mov	w13, #0x1f              // =31
    1734: 2a0d03ee     	mov	w14, w13
    1738: 2a0803ef     	mov	w15, w8
    173c: aa0c03f0     	mov	x16, x12
    1740: 51007dd1     	sub	w17, w14, #0x1f
    1744: 510079d2     	sub	w18, w14, #0x1e
    1748: f1000610     	subs	x16, x16, #0x1
    174c: fc71d840     	ldr	d0, [x2, w17, sxtw #3]
    1750: 8b2fcc71     	add	x17, x3, w15, sxtw #3
    1754: 110081ef     	add	w15, w15, #0x20
    1758: fd000220     	str	d0, [x17]
    175c: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1760: 510075d2     	sub	w18, w14, #0x1d
    1764: fd000620     	str	d0, [x17, #0x8]
    1768: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    176c: 510071d2     	sub	w18, w14, #0x1c
    1770: fd000a20     	str	d0, [x17, #0x10]
    1774: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1778: 51006dd2     	sub	w18, w14, #0x1b
    177c: fd000e20     	str	d0, [x17, #0x18]
    1780: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1784: 510069d2     	sub	w18, w14, #0x1a
    1788: fd001220     	str	d0, [x17, #0x20]
    178c: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1790: 510065d2     	sub	w18, w14, #0x19
    1794: fd001620     	str	d0, [x17, #0x28]
    1798: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    179c: 510061d2     	sub	w18, w14, #0x18
    17a0: fd001a20     	str	d0, [x17, #0x30]
    17a4: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    17a8: 51005dd2     	sub	w18, w14, #0x17
    17ac: fd001e20     	str	d0, [x17, #0x38]
    17b0: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    17b4: 510059d2     	sub	w18, w14, #0x16
    17b8: fd002220     	str	d0, [x17, #0x40]
    17bc: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    17c0: 510055d2     	sub	w18, w14, #0x15
    17c4: fd002620     	str	d0, [x17, #0x48]
    17c8: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    17cc: 510051d2     	sub	w18, w14, #0x14
    17d0: fd002a20     	str	d0, [x17, #0x50]
    17d4: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    17d8: 51004dd2     	sub	w18, w14, #0x13
    17dc: fd002e20     	str	d0, [x17, #0x58]
    17e0: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    17e4: 510049d2     	sub	w18, w14, #0x12
    17e8: fd003220     	str	d0, [x17, #0x60]
    17ec: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    17f0: 510045d2     	sub	w18, w14, #0x11
    17f4: fd003620     	str	d0, [x17, #0x68]
    17f8: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    17fc: 510041d2     	sub	w18, w14, #0x10
    1800: fd003a20     	str	d0, [x17, #0x70]
    1804: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1808: 51003dd2     	sub	w18, w14, #0xf
    180c: fd003e20     	str	d0, [x17, #0x78]
    1810: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1814: 510039d2     	sub	w18, w14, #0xe
    1818: fd004220     	str	d0, [x17, #0x80]
    181c: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1820: 510035d2     	sub	w18, w14, #0xd
    1824: fd004620     	str	d0, [x17, #0x88]
    1828: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    182c: 510031d2     	sub	w18, w14, #0xc
    1830: fd004a20     	str	d0, [x17, #0x90]
    1834: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1838: 51002dd2     	sub	w18, w14, #0xb
    183c: fd004e20     	str	d0, [x17, #0x98]
    1840: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1844: 510029d2     	sub	w18, w14, #0xa
    1848: fd005220     	str	d0, [x17, #0xa0]
    184c: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1850: 510025d2     	sub	w18, w14, #0x9
    1854: fd005620     	str	d0, [x17, #0xa8]
    1858: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    185c: 510021d2     	sub	w18, w14, #0x8
    1860: fd005a20     	str	d0, [x17, #0xb0]
    1864: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1868: 51001dd2     	sub	w18, w14, #0x7
    186c: fd005e20     	str	d0, [x17, #0xb8]
    1870: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1874: 510019d2     	sub	w18, w14, #0x6
    1878: fd006220     	str	d0, [x17, #0xc0]
    187c: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1880: 510015d2     	sub	w18, w14, #0x5
    1884: fd006620     	str	d0, [x17, #0xc8]
    1888: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    188c: 510011d2     	sub	w18, w14, #0x4
    1890: fd006a20     	str	d0, [x17, #0xd0]
    1894: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1898: 51000dd2     	sub	w18, w14, #0x3
    189c: fd006e20     	str	d0, [x17, #0xd8]
    18a0: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    18a4: 510009d2     	sub	w18, w14, #0x2
    18a8: fd007220     	str	d0, [x17, #0xe0]
    18ac: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    18b0: 510005d2     	sub	w18, w14, #0x1
    18b4: fd007620     	str	d0, [x17, #0xe8]
    18b8: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    18bc: fd007a20     	str	d0, [x17, #0xf0]
    18c0: fc6ed840     	ldr	d0, [x2, w14, sxtw #3]
    18c4: 0b0001ce     	add	w14, w14, w0
    18c8: fd007e20     	str	d0, [x17, #0xf8]
    18cc: 54fff3a1     	b.ne	0x1740 <_ZN4gemmIdE6pack_BEiiPKdPd+0x24>
    18d0: 91000529     	add	x9, x9, #0x1
    18d4: 0b0b0108     	add	w8, w8, w11
    18d8: 110081ad     	add	w13, w13, #0x20
    18dc: eb0a013f     	cmp	x9, x10
    18e0: 54fff2a1     	b.ne	0x1734 <_ZN4gemmIdE6pack_BEiiPKdPd+0x18>
    18e4: d65f03c0     	ret

00000000000018e8 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined>:
    18e8: d10243ff     	sub	sp, sp, #0x90
    18ec: a9037bfd     	stp	x29, x30, [sp, #0x30]
    18f0: a9046ffc     	stp	x28, x27, [sp, #0x40]
    18f4: a90567fa     	stp	x26, x25, [sp, #0x50]
    18f8: a9065ff8     	stp	x24, x23, [sp, #0x60]
    18fc: a90757f6     	stp	x22, x21, [sp, #0x70]
    1900: a9084ff4     	stp	x20, x19, [sp, #0x80]
    1904: 9100c3fd     	add	x29, sp, #0x30
    1908: b9400048     	ldr	w8, [x2]
    190c: 71000519     	subs	w25, w8, #0x1
    1910: 54006b0b     	b.lt	0x2670 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xd88>
    1914: b9400001     	ldr	w1, [x0]
    1918: aa0703f3     	mov	x19, x7
    191c: aa0603f4     	mov	x20, x6
    1920: aa0503f5     	mov	x21, x5
    1924: aa0403f6     	mov	x22, x4
    1928: aa0303f7     	mov	x23, x3
    192c: 52800028     	mov	w8, #0x1                // =1
    1930: d0000080     	adrp	x0, 0x13000 <__FRAME_END__+0x10104>
    1934: 9135a000     	add	x0, x0, #0xd68
    1938: d10043a3     	sub	x3, x29, #0x10
    193c: d10013a4     	sub	x4, x29, #0x4
    1940: d10023a5     	sub	x5, x29, #0x8
    1944: d10033a6     	sub	x6, x29, #0xc
    1948: 52800442     	mov	w2, #0x22               // =34
    194c: 52800027     	mov	w7, #0x1                // =1
    1950: 293f7fb9     	stp	w25, wzr, [x29, #-0x8]
    1954: 293e23bf     	stp	wzr, w8, [x29, #-0x10]
    1958: b90017e1     	str	w1, [sp, #0x14]
    195c: b90003e8     	str	w8, [sp]
    1960: 97fffc14     	bl	0x9b0 <__kmpc_for_static_init_4@plt>
    1964: 297f23a9     	ldp	w9, w8, [x29, #-0x8]
    1968: 6b19013f     	cmp	w9, w25
    196c: 1a99b12e     	csel	w14, w9, w25, lt
    1970: 6b0e011f     	cmp	w8, w14
    1974: b81f83ae     	stur	w14, [x29, #-0x8]
    1978: 5400674c     	b.gt	0x2660 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xd78>
    197c: b94002ec     	ldr	w12, [x23]
    1980: 7100059f     	cmp	w12, #0x1
    1984: 540066eb     	b.lt	0x2660 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xd78>
    1988: 25d8e3e0     	ptrue	p0.d
    198c: a9492bab     	ldp	x11, x10, [x29, #0x90]
    1990: a94807a2     	ldp	x2, x1, [x29, #0x80]
    1994: 25f8c000     	mov	z0.d, #0x0              // =0
    1998: a94743b1     	ldp	x17, x16, [x29, #0x70]
    199c: f94053a9     	ldr	x9, [x29, #0xa0]
    19a0: a9464ba0     	ldp	x0, x18, [x29, #0x60]
    19a4: f9000fe9     	str	x9, [sp, #0x18]
    19a8: 14000005     	b	0x19bc <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xd4>
    19ac: b85f83ae     	ldur	w14, [x29, #-0x8]
    19b0: 6b0e011f     	cmp	w8, w14
    19b4: 11000508     	add	w8, w8, #0x1
    19b8: 5400654a     	b.ge	0x2660 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xd78>
    19bc: 7100059f     	cmp	w12, #0x1
    19c0: 54ffff8b     	b.lt	0x19b0 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xc8>
    19c4: 531c6d03     	lsl	w3, w8, #4
    19c8: 2a1f03e4     	mov	w4, wzr
    19cc: 14000250     	b	0x230c <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xa24>
    19d0: b9800225     	ldrsw	x5, [x17]
    19d4: 3940016c     	ldrb	w12, [x11]
    19d8: d37df0a6     	lsl	x6, x5, #3
    19dc: 340034cc     	cbz	w12, 0x2074 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x78c>
    19e0: 85800041     	ldr	p1, [x2]
    19e4: f9400fe9     	ldr	x9, [sp, #0x18]
    19e8: 2a1f03ee     	mov	w14, wzr
    19ec: 85c0e142     	ld1rd	{ z2.d }, p0/z, [x10]
    19f0: 5280002f     	mov	w15, #0x1               // =1
    19f4: 8b0600ec     	add	x12, x7, x6
    19f8: 85c0e121     	ld1rd	{ z1.d }, p0/z, [x9]
    19fc: 5280004d     	mov	w13, #0x2               // =2
    1a00: c0c24403     	mov	z3.d, p1/m, za0h.d[w14, 0]
    1a04: c0c24444     	mov	z4.d, p1/m, za1h.d[w14, 0]
    1a08: c0c24485     	mov	z5.d, p1/m, za2h.d[w14, 0]
    1a0c: c0c244c6     	mov	z6.d, p1/m, za3h.d[w14, 0]
    1a10: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1a14: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1a18: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1a1c: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1a20: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1a24: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1a28: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1a2c: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1a30: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1a34: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1a38: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1a3c: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1a40: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1a44: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1a48: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1a4c: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1a50: e5e0e4e3     	st1d	{ z3.d }, p1, [x7]
    1a54: e5e1e4e4     	st1d	{ z4.d }, p1, [x7, #0x1, mul vl]
    1a58: e5e2e4e5     	st1d	{ z5.d }, p1, [x7, #0x2, mul vl]
    1a5c: e5e3e4e6     	st1d	{ z6.d }, p1, [x7, #0x3, mul vl]
    1a60: c0c26403     	mov	z3.d, p1/m, za0h.d[w15, 0]
    1a64: c0c26444     	mov	z4.d, p1/m, za1h.d[w15, 0]
    1a68: c0c26485     	mov	z5.d, p1/m, za2h.d[w15, 0]
    1a6c: c0c264c6     	mov	z6.d, p1/m, za3h.d[w15, 0]
    1a70: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1a74: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1a78: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1a7c: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1a80: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1a84: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1a88: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1a8c: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1a90: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1a94: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1a98: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1a9c: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1aa0: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1aa4: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1aa8: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1aac: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1ab0: e5e544e3     	st1d	{ z3.d }, p1, [x7, x5, lsl #3]
    1ab4: 8b060187     	add	x7, x12, x6
    1ab8: e5e1e584     	st1d	{ z4.d }, p1, [x12, #0x1, mul vl]
    1abc: e5e2e585     	st1d	{ z5.d }, p1, [x12, #0x2, mul vl]
    1ac0: e5e3e586     	st1d	{ z6.d }, p1, [x12, #0x3, mul vl]
    1ac4: c0c22403     	mov	z3.d, p1/m, za0h.d[w13, 0]
    1ac8: c0c22444     	mov	z4.d, p1/m, za1h.d[w13, 0]
    1acc: c0c22485     	mov	z5.d, p1/m, za2h.d[w13, 0]
    1ad0: c0c224c6     	mov	z6.d, p1/m, za3h.d[w13, 0]
    1ad4: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1ad8: 5280008d     	mov	w13, #0x4               // =4
    1adc: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1ae0: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1ae4: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1ae8: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1aec: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1af0: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1af4: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1af8: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1afc: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1b00: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1b04: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1b08: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1b0c: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1b10: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1b14: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1b18: e5e54583     	st1d	{ z3.d }, p1, [x12, x5, lsl #3]
    1b1c: 5280006c     	mov	w12, #0x3               // =3
    1b20: e5e1e4e4     	st1d	{ z4.d }, p1, [x7, #0x1, mul vl]
    1b24: e5e2e4e5     	st1d	{ z5.d }, p1, [x7, #0x2, mul vl]
    1b28: e5e3e4e6     	st1d	{ z6.d }, p1, [x7, #0x3, mul vl]
    1b2c: c0c20403     	mov	z3.d, p1/m, za0h.d[w12, 0]
    1b30: c0c20444     	mov	z4.d, p1/m, za1h.d[w12, 0]
    1b34: c0c20485     	mov	z5.d, p1/m, za2h.d[w12, 0]
    1b38: c0c204c6     	mov	z6.d, p1/m, za3h.d[w12, 0]
    1b3c: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1b40: 8b0600ec     	add	x12, x7, x6
    1b44: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1b48: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1b4c: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1b50: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1b54: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1b58: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1b5c: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1b60: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1b64: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1b68: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1b6c: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1b70: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1b74: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1b78: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1b7c: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1b80: e5e544e3     	st1d	{ z3.d }, p1, [x7, x5, lsl #3]
    1b84: 8b060187     	add	x7, x12, x6
    1b88: e5e1e584     	st1d	{ z4.d }, p1, [x12, #0x1, mul vl]
    1b8c: e5e2e585     	st1d	{ z5.d }, p1, [x12, #0x2, mul vl]
    1b90: e5e3e586     	st1d	{ z6.d }, p1, [x12, #0x3, mul vl]
    1b94: c0c22403     	mov	z3.d, p1/m, za0h.d[w13, 0]
    1b98: c0c22444     	mov	z4.d, p1/m, za1h.d[w13, 0]
    1b9c: c0c22485     	mov	z5.d, p1/m, za2h.d[w13, 0]
    1ba0: c0c224c6     	mov	z6.d, p1/m, za3h.d[w13, 0]
    1ba4: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1ba8: 528000cd     	mov	w13, #0x6               // =6
    1bac: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1bb0: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1bb4: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1bb8: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1bbc: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1bc0: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1bc4: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1bc8: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1bcc: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1bd0: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1bd4: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1bd8: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1bdc: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1be0: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1be4: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1be8: e5e54583     	st1d	{ z3.d }, p1, [x12, x5, lsl #3]
    1bec: 528000ac     	mov	w12, #0x5               // =5
    1bf0: e5e1e4e4     	st1d	{ z4.d }, p1, [x7, #0x1, mul vl]
    1bf4: e5e2e4e5     	st1d	{ z5.d }, p1, [x7, #0x2, mul vl]
    1bf8: e5e3e4e6     	st1d	{ z6.d }, p1, [x7, #0x3, mul vl]
    1bfc: c0c20403     	mov	z3.d, p1/m, za0h.d[w12, 0]
    1c00: c0c20444     	mov	z4.d, p1/m, za1h.d[w12, 0]
    1c04: c0c20485     	mov	z5.d, p1/m, za2h.d[w12, 0]
    1c08: c0c204c6     	mov	z6.d, p1/m, za3h.d[w12, 0]
    1c0c: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1c10: 8b0600ec     	add	x12, x7, x6
    1c14: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1c18: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1c1c: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1c20: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1c24: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1c28: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1c2c: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1c30: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1c34: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1c38: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1c3c: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1c40: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1c44: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1c48: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1c4c: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1c50: e5e544e3     	st1d	{ z3.d }, p1, [x7, x5, lsl #3]
    1c54: 8b060187     	add	x7, x12, x6
    1c58: e5e1e584     	st1d	{ z4.d }, p1, [x12, #0x1, mul vl]
    1c5c: e5e2e585     	st1d	{ z5.d }, p1, [x12, #0x2, mul vl]
    1c60: e5e3e586     	st1d	{ z6.d }, p1, [x12, #0x3, mul vl]
    1c64: c0c22403     	mov	z3.d, p1/m, za0h.d[w13, 0]
    1c68: c0c22444     	mov	z4.d, p1/m, za1h.d[w13, 0]
    1c6c: c0c22485     	mov	z5.d, p1/m, za2h.d[w13, 0]
    1c70: c0c224c6     	mov	z6.d, p1/m, za3h.d[w13, 0]
    1c74: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1c78: 528000ed     	mov	w13, #0x7               // =7
    1c7c: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1c80: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1c84: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1c88: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1c8c: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1c90: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1c94: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1c98: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1c9c: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1ca0: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1ca4: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1ca8: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1cac: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1cb0: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1cb4: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1cb8: e5e54583     	st1d	{ z3.d }, p1, [x12, x5, lsl #3]
    1cbc: 8b0600ec     	add	x12, x7, x6
    1cc0: e5e1e4e4     	st1d	{ z4.d }, p1, [x7, #0x1, mul vl]
    1cc4: e5e2e4e5     	st1d	{ z5.d }, p1, [x7, #0x2, mul vl]
    1cc8: e5e3e4e6     	st1d	{ z6.d }, p1, [x7, #0x3, mul vl]
    1ccc: c0c22403     	mov	z3.d, p1/m, za0h.d[w13, 0]
    1cd0: c0c22444     	mov	z4.d, p1/m, za1h.d[w13, 0]
    1cd4: c0c22485     	mov	z5.d, p1/m, za2h.d[w13, 0]
    1cd8: c0c224c6     	mov	z6.d, p1/m, za3h.d[w13, 0]
    1cdc: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1ce0: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1ce4: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1ce8: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1cec: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1cf0: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1cf4: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1cf8: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1cfc: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1d00: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1d04: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1d08: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1d0c: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1d10: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1d14: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1d18: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1d1c: e5e544e3     	st1d	{ z3.d }, p1, [x7, x5, lsl #3]
    1d20: e5e1e584     	st1d	{ z4.d }, p1, [x12, #0x1, mul vl]
    1d24: e5e2e585     	st1d	{ z5.d }, p1, [x12, #0x2, mul vl]
    1d28: e5e3e586     	st1d	{ z6.d }, p1, [x12, #0x3, mul vl]
    1d2c: c0c24503     	mov	z3.d, p1/m, za4h.d[w14, 0]
    1d30: c0c24544     	mov	z4.d, p1/m, za5h.d[w14, 0]
    1d34: c0c24585     	mov	z5.d, p1/m, za6h.d[w14, 0]
    1d38: c0c245c6     	mov	z6.d, p1/m, za7h.d[w14, 0]
    1d3c: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1d40: 8b06018e     	add	x14, x12, x6
    1d44: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1d48: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1d4c: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1d50: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1d54: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1d58: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1d5c: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1d60: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1d64: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1d68: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1d6c: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1d70: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1d74: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1d78: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1d7c: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1d80: e5e54583     	st1d	{ z3.d }, p1, [x12, x5, lsl #3]
    1d84: 8b0601cc     	add	x12, x14, x6
    1d88: e5e1e5c4     	st1d	{ z4.d }, p1, [x14, #0x1, mul vl]
    1d8c: e5e2e5c5     	st1d	{ z5.d }, p1, [x14, #0x2, mul vl]
    1d90: e5e3e5c6     	st1d	{ z6.d }, p1, [x14, #0x3, mul vl]
    1d94: c0c26503     	mov	z3.d, p1/m, za4h.d[w15, 0]
    1d98: c0c26544     	mov	z4.d, p1/m, za5h.d[w15, 0]
    1d9c: c0c26585     	mov	z5.d, p1/m, za6h.d[w15, 0]
    1da0: c0c265c6     	mov	z6.d, p1/m, za7h.d[w15, 0]
    1da4: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1da8: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1dac: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1db0: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1db4: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1db8: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1dbc: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1dc0: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1dc4: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1dc8: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1dcc: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1dd0: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1dd4: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1dd8: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1ddc: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1de0: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1de4: e5e545c3     	st1d	{ z3.d }, p1, [x14, x5, lsl #3]
    1de8: 5280004e     	mov	w14, #0x2               // =2
    1dec: e5e1e584     	st1d	{ z4.d }, p1, [x12, #0x1, mul vl]
    1df0: e5e2e585     	st1d	{ z5.d }, p1, [x12, #0x2, mul vl]
    1df4: e5e3e586     	st1d	{ z6.d }, p1, [x12, #0x3, mul vl]
    1df8: c0c24503     	mov	z3.d, p1/m, za4h.d[w14, 0]
    1dfc: c0c24544     	mov	z4.d, p1/m, za5h.d[w14, 0]
    1e00: c0c24585     	mov	z5.d, p1/m, za6h.d[w14, 0]
    1e04: c0c245c6     	mov	z6.d, p1/m, za7h.d[w14, 0]
    1e08: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1e0c: 8b06018e     	add	x14, x12, x6
    1e10: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1e14: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1e18: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1e1c: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1e20: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1e24: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1e28: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1e2c: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1e30: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1e34: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1e38: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1e3c: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1e40: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1e44: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1e48: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1e4c: e5e54583     	st1d	{ z3.d }, p1, [x12, x5, lsl #3]
    1e50: 5280006c     	mov	w12, #0x3               // =3
    1e54: e5e1e5c4     	st1d	{ z4.d }, p1, [x14, #0x1, mul vl]
    1e58: e5e2e5c5     	st1d	{ z5.d }, p1, [x14, #0x2, mul vl]
    1e5c: e5e3e5c6     	st1d	{ z6.d }, p1, [x14, #0x3, mul vl]
    1e60: c0c20503     	mov	z3.d, p1/m, za4h.d[w12, 0]
    1e64: c0c20544     	mov	z4.d, p1/m, za5h.d[w12, 0]
    1e68: c0c20585     	mov	z5.d, p1/m, za6h.d[w12, 0]
    1e6c: c0c205c6     	mov	z6.d, p1/m, za7h.d[w12, 0]
    1e70: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1e74: 8b0601cc     	add	x12, x14, x6
    1e78: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1e7c: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1e80: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1e84: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1e88: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1e8c: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1e90: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1e94: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1e98: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1e9c: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1ea0: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1ea4: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1ea8: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1eac: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1eb0: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1eb4: e5e545c3     	st1d	{ z3.d }, p1, [x14, x5, lsl #3]
    1eb8: 5280008e     	mov	w14, #0x4               // =4
    1ebc: e5e1e584     	st1d	{ z4.d }, p1, [x12, #0x1, mul vl]
    1ec0: e5e2e585     	st1d	{ z5.d }, p1, [x12, #0x2, mul vl]
    1ec4: e5e3e586     	st1d	{ z6.d }, p1, [x12, #0x3, mul vl]
    1ec8: c0c24503     	mov	z3.d, p1/m, za4h.d[w14, 0]
    1ecc: c0c24544     	mov	z4.d, p1/m, za5h.d[w14, 0]
    1ed0: c0c24585     	mov	z5.d, p1/m, za6h.d[w14, 0]
    1ed4: c0c245c6     	mov	z6.d, p1/m, za7h.d[w14, 0]
    1ed8: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1edc: 8b06018e     	add	x14, x12, x6
    1ee0: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1ee4: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1ee8: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1eec: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1ef0: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1ef4: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1ef8: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1efc: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1f00: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1f04: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1f08: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1f0c: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1f10: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1f14: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1f18: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1f1c: e5e54583     	st1d	{ z3.d }, p1, [x12, x5, lsl #3]
    1f20: 528000ac     	mov	w12, #0x5               // =5
    1f24: e5e1e5c4     	st1d	{ z4.d }, p1, [x14, #0x1, mul vl]
    1f28: e5e2e5c5     	st1d	{ z5.d }, p1, [x14, #0x2, mul vl]
    1f2c: e5e3e5c6     	st1d	{ z6.d }, p1, [x14, #0x3, mul vl]
    1f30: c0c20503     	mov	z3.d, p1/m, za4h.d[w12, 0]
    1f34: c0c20544     	mov	z4.d, p1/m, za5h.d[w12, 0]
    1f38: c0c20585     	mov	z5.d, p1/m, za6h.d[w12, 0]
    1f3c: c0c205c6     	mov	z6.d, p1/m, za7h.d[w12, 0]
    1f40: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1f44: 8b0601cc     	add	x12, x14, x6
    1f48: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1f4c: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1f50: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1f54: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1f58: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1f5c: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1f60: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1f64: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1f68: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1f6c: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1f70: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1f74: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1f78: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1f7c: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1f80: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1f84: e5e545c3     	st1d	{ z3.d }, p1, [x14, x5, lsl #3]
    1f88: 528000ce     	mov	w14, #0x6               // =6
    1f8c: e5e1e584     	st1d	{ z4.d }, p1, [x12, #0x1, mul vl]
    1f90: e5e2e585     	st1d	{ z5.d }, p1, [x12, #0x2, mul vl]
    1f94: e5e3e586     	st1d	{ z6.d }, p1, [x12, #0x3, mul vl]
    1f98: c0c24503     	mov	z3.d, p1/m, za4h.d[w14, 0]
    1f9c: c0c24544     	mov	z4.d, p1/m, za5h.d[w14, 0]
    1fa0: c0c24585     	mov	z5.d, p1/m, za6h.d[w14, 0]
    1fa4: c0c245c6     	mov	z6.d, p1/m, za7h.d[w14, 0]
    1fa8: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1fac: 8b06018e     	add	x14, x12, x6
    1fb0: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1fb4: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1fb8: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1fbc: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1fc0: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1fc4: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1fc8: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1fcc: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1fd0: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1fd4: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1fd8: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1fdc: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1fe0: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1fe4: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1fe8: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1fec: e5e54583     	st1d	{ z3.d }, p1, [x12, x5, lsl #3]
    1ff0: 8b0601cc     	add	x12, x14, x6
    1ff4: e5e1e5c4     	st1d	{ z4.d }, p1, [x14, #0x1, mul vl]
    1ff8: e5e2e5c5     	st1d	{ z5.d }, p1, [x14, #0x2, mul vl]
    1ffc: e5e3e5c6     	st1d	{ z6.d }, p1, [x14, #0x3, mul vl]
    2000: c0c22503     	mov	z3.d, p1/m, za4h.d[w13, 0]
    2004: c0c22544     	mov	z4.d, p1/m, za5h.d[w13, 0]
    2008: c0c22585     	mov	z5.d, p1/m, za6h.d[w13, 0]
    200c: c0c225c6     	mov	z6.d, p1/m, za7h.d[w13, 0]
    2010: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    2014: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    2018: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    201c: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    2020: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    2024: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    2028: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    202c: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    2030: 05e0c462     	sel	z2.d, p1, z3.d, z0.d
    2034: 05e0c483     	sel	z3.d, p1, z4.d, z0.d
    2038: 05e0c4a4     	sel	z4.d, p1, z5.d, z0.d
    203c: 05e0c4c5     	sel	z5.d, p1, z6.d, z0.d
    2040: 65c08422     	fadd	z2.d, p1/m, z2.d, z1.d
    2044: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    2048: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    204c: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    2050: e5e545c2     	st1d	{ z2.d }, p1, [x14, x5, lsl #3]
    2054: e5e1e583     	st1d	{ z3.d }, p1, [x12, #0x1, mul vl]
    2058: e5e2e584     	st1d	{ z4.d }, p1, [x12, #0x2, mul vl]
    205c: e5e3e585     	st1d	{ z5.d }, p1, [x12, #0x3, mul vl]
    2060: b94002ec     	ldr	w12, [x23]
    2064: 11000484     	add	w4, w4, #0x1
    2068: 6b0c009f     	cmp	w4, w12
    206c: 5400150b     	b.lt	0x230c <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xa24>
    2070: 17fffe4f     	b	0x19ac <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xc4>
    2074: 85800041     	ldr	p1, [x2]
    2078: 2a1f03ed     	mov	w13, wzr
    207c: 5280002f     	mov	w15, #0x1               // =1
    2080: 8b0600ee     	add	x14, x7, x6
    2084: 5280004c     	mov	w12, #0x2               // =2
    2088: c0c22401     	mov	z1.d, p1/m, za0h.d[w13, 0]
    208c: c0c22442     	mov	z2.d, p1/m, za1h.d[w13, 0]
    2090: c0c22483     	mov	z3.d, p1/m, za2h.d[w13, 0]
    2094: c0c224c4     	mov	z4.d, p1/m, za3h.d[w13, 0]
    2098: e5e0e4e1     	st1d	{ z1.d }, p1, [x7]
    209c: e5e1e4e2     	st1d	{ z2.d }, p1, [x7, #0x1, mul vl]
    20a0: e5e2e4e3     	st1d	{ z3.d }, p1, [x7, #0x2, mul vl]
    20a4: e5e3e4e4     	st1d	{ z4.d }, p1, [x7, #0x3, mul vl]
    20a8: c0c26401     	mov	z1.d, p1/m, za0h.d[w15, 0]
    20ac: c0c26442     	mov	z2.d, p1/m, za1h.d[w15, 0]
    20b0: c0c26483     	mov	z3.d, p1/m, za2h.d[w15, 0]
    20b4: c0c264c4     	mov	z4.d, p1/m, za3h.d[w15, 0]
    20b8: e5e544e1     	st1d	{ z1.d }, p1, [x7, x5, lsl #3]
    20bc: 8b0601c7     	add	x7, x14, x6
    20c0: e5e1e5c2     	st1d	{ z2.d }, p1, [x14, #0x1, mul vl]
    20c4: e5e2e5c3     	st1d	{ z3.d }, p1, [x14, #0x2, mul vl]
    20c8: e5e3e5c4     	st1d	{ z4.d }, p1, [x14, #0x3, mul vl]
    20cc: c0c20401     	mov	z1.d, p1/m, za0h.d[w12, 0]
    20d0: c0c20442     	mov	z2.d, p1/m, za1h.d[w12, 0]
    20d4: c0c20483     	mov	z3.d, p1/m, za2h.d[w12, 0]
    20d8: c0c204c4     	mov	z4.d, p1/m, za3h.d[w12, 0]
    20dc: e5e545c1     	st1d	{ z1.d }, p1, [x14, x5, lsl #3]
    20e0: 5280006e     	mov	w14, #0x3               // =3
    20e4: e5e1e4e2     	st1d	{ z2.d }, p1, [x7, #0x1, mul vl]
    20e8: 5280006c     	mov	w12, #0x3               // =3
    20ec: e5e2e4e3     	st1d	{ z3.d }, p1, [x7, #0x2, mul vl]
    20f0: e5e3e4e4     	st1d	{ z4.d }, p1, [x7, #0x3, mul vl]
    20f4: c0c24401     	mov	z1.d, p1/m, za0h.d[w14, 0]
    20f8: c0c24442     	mov	z2.d, p1/m, za1h.d[w14, 0]
    20fc: c0c24483     	mov	z3.d, p1/m, za2h.d[w14, 0]
    2100: 8b0600ee     	add	x14, x7, x6
    2104: c0c204c4     	mov	z4.d, p1/m, za3h.d[w12, 0]
    2108: e5e544e1     	st1d	{ z1.d }, p1, [x7, x5, lsl #3]
    210c: 5280008c     	mov	w12, #0x4               // =4
    2110: e5e1e5c2     	st1d	{ z2.d }, p1, [x14, #0x1, mul vl]
    2114: 8b0601c7     	add	x7, x14, x6
    2118: e5e2e5c3     	st1d	{ z3.d }, p1, [x14, #0x2, mul vl]
    211c: e5e3e5c4     	st1d	{ z4.d }, p1, [x14, #0x3, mul vl]
    2120: c0c20401     	mov	z1.d, p1/m, za0h.d[w12, 0]
    2124: c0c20442     	mov	z2.d, p1/m, za1h.d[w12, 0]
    2128: c0c20483     	mov	z3.d, p1/m, za2h.d[w12, 0]
    212c: c0c204c4     	mov	z4.d, p1/m, za3h.d[w12, 0]
    2130: e5e545c1     	st1d	{ z1.d }, p1, [x14, x5, lsl #3]
    2134: 528000ac     	mov	w12, #0x5               // =5
    2138: e5e1e4e2     	st1d	{ z2.d }, p1, [x7, #0x1, mul vl]
    213c: 8b0600ee     	add	x14, x7, x6
    2140: e5e2e4e3     	st1d	{ z3.d }, p1, [x7, #0x2, mul vl]
    2144: e5e3e4e4     	st1d	{ z4.d }, p1, [x7, #0x3, mul vl]
    2148: c0c20401     	mov	z1.d, p1/m, za0h.d[w12, 0]
    214c: c0c20442     	mov	z2.d, p1/m, za1h.d[w12, 0]
    2150: c0c20483     	mov	z3.d, p1/m, za2h.d[w12, 0]
    2154: c0c204c4     	mov	z4.d, p1/m, za3h.d[w12, 0]
    2158: e5e544e1     	st1d	{ z1.d }, p1, [x7, x5, lsl #3]
    215c: 528000cc     	mov	w12, #0x6               // =6
    2160: e5e1e5c2     	st1d	{ z2.d }, p1, [x14, #0x1, mul vl]
    2164: 8b0601c7     	add	x7, x14, x6
    2168: e5e2e5c3     	st1d	{ z3.d }, p1, [x14, #0x2, mul vl]
    216c: e5e3e5c4     	st1d	{ z4.d }, p1, [x14, #0x3, mul vl]
    2170: c0c20401     	mov	z1.d, p1/m, za0h.d[w12, 0]
    2174: c0c20442     	mov	z2.d, p1/m, za1h.d[w12, 0]
    2178: c0c20483     	mov	z3.d, p1/m, za2h.d[w12, 0]
    217c: c0c204c4     	mov	z4.d, p1/m, za3h.d[w12, 0]
    2180: e5e545c1     	st1d	{ z1.d }, p1, [x14, x5, lsl #3]
    2184: 528000ec     	mov	w12, #0x7               // =7
    2188: e5e1e4e2     	st1d	{ z2.d }, p1, [x7, #0x1, mul vl]
    218c: 8b0600ee     	add	x14, x7, x6
    2190: e5e2e4e3     	st1d	{ z3.d }, p1, [x7, #0x2, mul vl]
    2194: e5e3e4e4     	st1d	{ z4.d }, p1, [x7, #0x3, mul vl]
    2198: c0c20401     	mov	z1.d, p1/m, za0h.d[w12, 0]
    219c: c0c20442     	mov	z2.d, p1/m, za1h.d[w12, 0]
    21a0: c0c20483     	mov	z3.d, p1/m, za2h.d[w12, 0]
    21a4: c0c204c4     	mov	z4.d, p1/m, za3h.d[w12, 0]
    21a8: e5e544e1     	st1d	{ z1.d }, p1, [x7, x5, lsl #3]
    21ac: 8b0601c7     	add	x7, x14, x6
    21b0: e5e1e5c2     	st1d	{ z2.d }, p1, [x14, #0x1, mul vl]
    21b4: 8b0600ec     	add	x12, x7, x6
    21b8: e5e2e5c3     	st1d	{ z3.d }, p1, [x14, #0x2, mul vl]
    21bc: e5e3e5c4     	st1d	{ z4.d }, p1, [x14, #0x3, mul vl]
    21c0: c0c22501     	mov	z1.d, p1/m, za4h.d[w13, 0]
    21c4: c0c22542     	mov	z2.d, p1/m, za5h.d[w13, 0]
    21c8: c0c22583     	mov	z3.d, p1/m, za6h.d[w13, 0]
    21cc: c0c225c4     	mov	z4.d, p1/m, za7h.d[w13, 0]
    21d0: e5e545c1     	st1d	{ z1.d }, p1, [x14, x5, lsl #3]
    21d4: 5280004d     	mov	w13, #0x2               // =2
    21d8: e5e1e4e2     	st1d	{ z2.d }, p1, [x7, #0x1, mul vl]
    21dc: 8b06018e     	add	x14, x12, x6
    21e0: e5e2e4e3     	st1d	{ z3.d }, p1, [x7, #0x2, mul vl]
    21e4: e5e3e4e4     	st1d	{ z4.d }, p1, [x7, #0x3, mul vl]
    21e8: c0c26501     	mov	z1.d, p1/m, za4h.d[w15, 0]
    21ec: c0c26542     	mov	z2.d, p1/m, za5h.d[w15, 0]
    21f0: c0c26583     	mov	z3.d, p1/m, za6h.d[w15, 0]
    21f4: c0c265c4     	mov	z4.d, p1/m, za7h.d[w15, 0]
    21f8: e5e544e1     	st1d	{ z1.d }, p1, [x7, x5, lsl #3]
    21fc: e5e1e582     	st1d	{ z2.d }, p1, [x12, #0x1, mul vl]
    2200: e5e2e583     	st1d	{ z3.d }, p1, [x12, #0x2, mul vl]
    2204: e5e3e584     	st1d	{ z4.d }, p1, [x12, #0x3, mul vl]
    2208: c0c22501     	mov	z1.d, p1/m, za4h.d[w13, 0]
    220c: c0c22542     	mov	z2.d, p1/m, za5h.d[w13, 0]
    2210: c0c22583     	mov	z3.d, p1/m, za6h.d[w13, 0]
    2214: c0c225c4     	mov	z4.d, p1/m, za7h.d[w13, 0]
    2218: e5e54581     	st1d	{ z1.d }, p1, [x12, x5, lsl #3]
    221c: 5280006c     	mov	w12, #0x3               // =3
    2220: e5e1e5c2     	st1d	{ z2.d }, p1, [x14, #0x1, mul vl]
    2224: 5280006d     	mov	w13, #0x3               // =3
    2228: e5e2e5c3     	st1d	{ z3.d }, p1, [x14, #0x2, mul vl]
    222c: e5e3e5c4     	st1d	{ z4.d }, p1, [x14, #0x3, mul vl]
    2230: c0c20501     	mov	z1.d, p1/m, za4h.d[w12, 0]
    2234: c0c20542     	mov	z2.d, p1/m, za5h.d[w12, 0]
    2238: c0c20583     	mov	z3.d, p1/m, za6h.d[w12, 0]
    223c: 8b0601cc     	add	x12, x14, x6
    2240: c0c225c4     	mov	z4.d, p1/m, za7h.d[w13, 0]
    2244: e5e545c1     	st1d	{ z1.d }, p1, [x14, x5, lsl #3]
    2248: 5280008d     	mov	w13, #0x4               // =4
    224c: e5e1e582     	st1d	{ z2.d }, p1, [x12, #0x1, mul vl]
    2250: 8b06018e     	add	x14, x12, x6
    2254: e5e2e583     	st1d	{ z3.d }, p1, [x12, #0x2, mul vl]
    2258: e5e3e584     	st1d	{ z4.d }, p1, [x12, #0x3, mul vl]
    225c: c0c22501     	mov	z1.d, p1/m, za4h.d[w13, 0]
    2260: c0c22542     	mov	z2.d, p1/m, za5h.d[w13, 0]
    2264: c0c22583     	mov	z3.d, p1/m, za6h.d[w13, 0]
    2268: c0c225c4     	mov	z4.d, p1/m, za7h.d[w13, 0]
    226c: e5e54581     	st1d	{ z1.d }, p1, [x12, x5, lsl #3]
    2270: 528000ac     	mov	w12, #0x5               // =5
    2274: e5e1e5c2     	st1d	{ z2.d }, p1, [x14, #0x1, mul vl]
    2278: 528000ad     	mov	w13, #0x5               // =5
    227c: e5e2e5c3     	st1d	{ z3.d }, p1, [x14, #0x2, mul vl]
    2280: e5e3e5c4     	st1d	{ z4.d }, p1, [x14, #0x3, mul vl]
    2284: c0c20501     	mov	z1.d, p1/m, za4h.d[w12, 0]
    2288: c0c20542     	mov	z2.d, p1/m, za5h.d[w12, 0]
    228c: c0c20583     	mov	z3.d, p1/m, za6h.d[w12, 0]
    2290: 8b0601cc     	add	x12, x14, x6
    2294: c0c225c4     	mov	z4.d, p1/m, za7h.d[w13, 0]
    2298: e5e545c1     	st1d	{ z1.d }, p1, [x14, x5, lsl #3]
    229c: 528000cd     	mov	w13, #0x6               // =6
    22a0: e5e1e582     	st1d	{ z2.d }, p1, [x12, #0x1, mul vl]
    22a4: 8b06018e     	add	x14, x12, x6
    22a8: e5e2e583     	st1d	{ z3.d }, p1, [x12, #0x2, mul vl]
    22ac: e5e3e584     	st1d	{ z4.d }, p1, [x12, #0x3, mul vl]
    22b0: c0c22501     	mov	z1.d, p1/m, za4h.d[w13, 0]
    22b4: c0c22542     	mov	z2.d, p1/m, za5h.d[w13, 0]
    22b8: c0c22583     	mov	z3.d, p1/m, za6h.d[w13, 0]
    22bc: c0c225c4     	mov	z4.d, p1/m, za7h.d[w13, 0]
    22c0: e5e54581     	st1d	{ z1.d }, p1, [x12, x5, lsl #3]
    22c4: 528000ec     	mov	w12, #0x7               // =7
    22c8: e5e1e5c2     	st1d	{ z2.d }, p1, [x14, #0x1, mul vl]
    22cc: 528000ed     	mov	w13, #0x7               // =7
    22d0: e5e2e5c3     	st1d	{ z3.d }, p1, [x14, #0x2, mul vl]
    22d4: e5e3e5c4     	st1d	{ z4.d }, p1, [x14, #0x3, mul vl]
    22d8: c0c20501     	mov	z1.d, p1/m, za4h.d[w12, 0]
    22dc: c0c20542     	mov	z2.d, p1/m, za5h.d[w12, 0]
    22e0: c0c20583     	mov	z3.d, p1/m, za6h.d[w12, 0]
    22e4: 8b0601cc     	add	x12, x14, x6
    22e8: c0c225c4     	mov	z4.d, p1/m, za7h.d[w13, 0]
    22ec: e5e545c1     	st1d	{ z1.d }, p1, [x14, x5, lsl #3]
    22f0: e5e1e582     	st1d	{ z2.d }, p1, [x12, #0x1, mul vl]
    22f4: e5e2e583     	st1d	{ z3.d }, p1, [x12, #0x2, mul vl]
    22f8: e5e3e584     	st1d	{ z4.d }, p1, [x12, #0x3, mul vl]
    22fc: b94002ec     	ldr	w12, [x23]
    2300: 11000484     	add	w4, w4, #0x1
    2304: 6b0c009f     	cmp	w4, w12
    2308: 54ffb52a     	b.ge	0x19ac <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xc4>
    230c: b980023b     	ldrsw	x27, [x17]
    2310: b94002cc     	ldr	w12, [x22]
    2314: f9400246     	ldr	x6, [x18]
    2318: f94002a9     	ldr	x9, [x21]
    231c: b9400299     	ldr	w25, [x20]
    2320: 3940021c     	ldrb	w28, [x16]
    2324: 1b1b7c6e     	mul	w14, w3, w27
    2328: 0b040185     	add	w5, w12, w4
    232c: b940027a     	ldr	w26, [x19]
    2330: 531b68a7     	lsl	w7, w5, #5
    2334: 8b2ecccc     	add	x12, x6, w14, sxtw #3
    2338: f9400006     	ldr	x6, [x0]
    233c: 8b27cd87     	add	x7, x12, w7, sxtw #3
    2340: 340000dc     	cbz	w28, 0x2358 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xa70>
    2344: c00800ff     	zero	{za}
    2348: b940002c     	ldr	w12, [x1]
    234c: 7100059f     	cmp	w12, #0x1
    2350: 5400144a     	b.ge	0x25d8 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xcf0>
    2354: 17fffd9f     	b	0x19d0 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xe8>
    2358: 85800041     	ldr	p1, [x2]
    235c: d37df37c     	lsl	x28, x27, #3
    2360: 2a1f03ec     	mov	w12, wzr
    2364: 5280002f     	mov	w15, #0x1               // =1
    2368: 5280004d     	mov	w13, #0x2               // =2
    236c: 5280006e     	mov	w14, #0x3               // =3
    2370: 8b1c00fe     	add	x30, x7, x28
    2374: a5e0a4e1     	ld1d	{ z1.d }, p1/z, [x7]
    2378: a5e1a4e2     	ld1d	{ z2.d }, p1/z, [x7, #0x1, mul vl]
    237c: a5e2a4e3     	ld1d	{ z3.d }, p1/z, [x7, #0x2, mul vl]
    2380: a5e3a4e4     	ld1d	{ z4.d }, p1/z, [x7, #0x3, mul vl]
    2384: 8b1c03d8     	add	x24, x30, x28
    2388: c0c00420     	mov	za0h.d[w12, 0], p1/m, z1.d
    238c: c0c00442     	mov	za1h.d[w12, 0], p1/m, z2.d
    2390: c0c00464     	mov	za2h.d[w12, 0], p1/m, z3.d
    2394: c0c00486     	mov	za3h.d[w12, 0], p1/m, z4.d
    2398: a5fb44e1     	ld1d	{ z1.d }, p1/z, [x7, x27, lsl #3]
    239c: a5e1a7c2     	ld1d	{ z2.d }, p1/z, [x30, #0x1, mul vl]
    23a0: a5e2a7c3     	ld1d	{ z3.d }, p1/z, [x30, #0x2, mul vl]
    23a4: a5e3a7c4     	ld1d	{ z4.d }, p1/z, [x30, #0x3, mul vl]
    23a8: c0c06420     	mov	za0h.d[w15, 0], p1/m, z1.d
    23ac: c0c06442     	mov	za1h.d[w15, 0], p1/m, z2.d
    23b0: c0c06464     	mov	za2h.d[w15, 0], p1/m, z3.d
    23b4: c0c06486     	mov	za3h.d[w15, 0], p1/m, z4.d
    23b8: a5fb47c1     	ld1d	{ z1.d }, p1/z, [x30, x27, lsl #3]
    23bc: a5e1a702     	ld1d	{ z2.d }, p1/z, [x24, #0x1, mul vl]
    23c0: a5e2a703     	ld1d	{ z3.d }, p1/z, [x24, #0x2, mul vl]
    23c4: a5e3a704     	ld1d	{ z4.d }, p1/z, [x24, #0x3, mul vl]
    23c8: 8b1c031e     	add	x30, x24, x28
    23cc: c0c02420     	mov	za0h.d[w13, 0], p1/m, z1.d
    23d0: c0c02442     	mov	za1h.d[w13, 0], p1/m, z2.d
    23d4: c0c02464     	mov	za2h.d[w13, 0], p1/m, z3.d
    23d8: c0c02486     	mov	za3h.d[w13, 0], p1/m, z4.d
    23dc: a5fb4701     	ld1d	{ z1.d }, p1/z, [x24, x27, lsl #3]
    23e0: a5e1a7c2     	ld1d	{ z2.d }, p1/z, [x30, #0x1, mul vl]
    23e4: a5e2a7c3     	ld1d	{ z3.d }, p1/z, [x30, #0x2, mul vl]
    23e8: a5e3a7c4     	ld1d	{ z4.d }, p1/z, [x30, #0x3, mul vl]
    23ec: 8b1c03d8     	add	x24, x30, x28
    23f0: 5280008d     	mov	w13, #0x4               // =4
    23f4: c0c04420     	mov	za0h.d[w14, 0], p1/m, z1.d
    23f8: c0c04442     	mov	za1h.d[w14, 0], p1/m, z2.d
    23fc: c0c04464     	mov	za2h.d[w14, 0], p1/m, z3.d
    2400: c0c04486     	mov	za3h.d[w14, 0], p1/m, z4.d
    2404: a5fb47c1     	ld1d	{ z1.d }, p1/z, [x30, x27, lsl #3]
    2408: a5e1a702     	ld1d	{ z2.d }, p1/z, [x24, #0x1, mul vl]
    240c: a5e2a703     	ld1d	{ z3.d }, p1/z, [x24, #0x2, mul vl]
    2410: a5e3a704     	ld1d	{ z4.d }, p1/z, [x24, #0x3, mul vl]
    2414: 8b1c031e     	add	x30, x24, x28
    2418: c0c02420     	mov	za0h.d[w13, 0], p1/m, z1.d
    241c: c0c02442     	mov	za1h.d[w13, 0], p1/m, z2.d
    2420: c0c02464     	mov	za2h.d[w13, 0], p1/m, z3.d
    2424: c0c02486     	mov	za3h.d[w13, 0], p1/m, z4.d
    2428: a5fb4701     	ld1d	{ z1.d }, p1/z, [x24, x27, lsl #3]
    242c: a5e1a7c2     	ld1d	{ z2.d }, p1/z, [x30, #0x1, mul vl]
    2430: a5e2a7c3     	ld1d	{ z3.d }, p1/z, [x30, #0x2, mul vl]
    2434: a5e3a7c4     	ld1d	{ z4.d }, p1/z, [x30, #0x3, mul vl]
    2438: 8b1c03d8     	add	x24, x30, x28
    243c: 528000ad     	mov	w13, #0x5               // =5
    2440: c0c02420     	mov	za0h.d[w13, 0], p1/m, z1.d
    2444: c0c02442     	mov	za1h.d[w13, 0], p1/m, z2.d
    2448: c0c02464     	mov	za2h.d[w13, 0], p1/m, z3.d
    244c: c0c02486     	mov	za3h.d[w13, 0], p1/m, z4.d
    2450: a5fb47c1     	ld1d	{ z1.d }, p1/z, [x30, x27, lsl #3]
    2454: a5e1a702     	ld1d	{ z2.d }, p1/z, [x24, #0x1, mul vl]
    2458: a5e2a703     	ld1d	{ z3.d }, p1/z, [x24, #0x2, mul vl]
    245c: a5e3a704     	ld1d	{ z4.d }, p1/z, [x24, #0x3, mul vl]
    2460: 8b1c031e     	add	x30, x24, x28
    2464: 528000cd     	mov	w13, #0x6               // =6
    2468: c0c02420     	mov	za0h.d[w13, 0], p1/m, z1.d
    246c: c0c02442     	mov	za1h.d[w13, 0], p1/m, z2.d
    2470: c0c02464     	mov	za2h.d[w13, 0], p1/m, z3.d
    2474: c0c02486     	mov	za3h.d[w13, 0], p1/m, z4.d
    2478: a5fb4701     	ld1d	{ z1.d }, p1/z, [x24, x27, lsl #3]
    247c: a5e1a7c2     	ld1d	{ z2.d }, p1/z, [x30, #0x1, mul vl]
    2480: a5e2a7c3     	ld1d	{ z3.d }, p1/z, [x30, #0x2, mul vl]
    2484: a5e3a7c4     	ld1d	{ z4.d }, p1/z, [x30, #0x3, mul vl]
    2488: 8b1c03d8     	add	x24, x30, x28
    248c: 528000ed     	mov	w13, #0x7               // =7
    2490: c0c02420     	mov	za0h.d[w13, 0], p1/m, z1.d
    2494: c0c02442     	mov	za1h.d[w13, 0], p1/m, z2.d
    2498: c0c02464     	mov	za2h.d[w13, 0], p1/m, z3.d
    249c: c0c02486     	mov	za3h.d[w13, 0], p1/m, z4.d
    24a0: a5fb47c1     	ld1d	{ z1.d }, p1/z, [x30, x27, lsl #3]
    24a4: a5e1a702     	ld1d	{ z2.d }, p1/z, [x24, #0x1, mul vl]
    24a8: a5e2a703     	ld1d	{ z3.d }, p1/z, [x24, #0x2, mul vl]
    24ac: a5e3a704     	ld1d	{ z4.d }, p1/z, [x24, #0x3, mul vl]
    24b0: 8b1c031e     	add	x30, x24, x28
    24b4: c0c00428     	mov	za4h.d[w12, 0], p1/m, z1.d
    24b8: c0c0044a     	mov	za5h.d[w12, 0], p1/m, z2.d
    24bc: c0c0046c     	mov	za6h.d[w12, 0], p1/m, z3.d
    24c0: c0c0048e     	mov	za7h.d[w12, 0], p1/m, z4.d
    24c4: a5fb4701     	ld1d	{ z1.d }, p1/z, [x24, x27, lsl #3]
    24c8: a5e1a7c2     	ld1d	{ z2.d }, p1/z, [x30, #0x1, mul vl]
    24cc: a5e2a7c3     	ld1d	{ z3.d }, p1/z, [x30, #0x2, mul vl]
    24d0: a5e3a7c4     	ld1d	{ z4.d }, p1/z, [x30, #0x3, mul vl]
    24d4: 8b1c03cc     	add	x12, x30, x28
    24d8: 8b1c0198     	add	x24, x12, x28
    24dc: c0c06428     	mov	za4h.d[w15, 0], p1/m, z1.d
    24e0: c0c0644a     	mov	za5h.d[w15, 0], p1/m, z2.d
    24e4: c0c0646c     	mov	za6h.d[w15, 0], p1/m, z3.d
    24e8: c0c0648e     	mov	za7h.d[w15, 0], p1/m, z4.d
    24ec: a5fb47c1     	ld1d	{ z1.d }, p1/z, [x30, x27, lsl #3]
    24f0: a5e1a582     	ld1d	{ z2.d }, p1/z, [x12, #0x1, mul vl]
    24f4: a5e2a583     	ld1d	{ z3.d }, p1/z, [x12, #0x2, mul vl]
    24f8: a5e3a584     	ld1d	{ z4.d }, p1/z, [x12, #0x3, mul vl]
    24fc: 5280004f     	mov	w15, #0x2               // =2
    2500: c0c06428     	mov	za4h.d[w15, 0], p1/m, z1.d
    2504: c0c0644a     	mov	za5h.d[w15, 0], p1/m, z2.d
    2508: c0c0646c     	mov	za6h.d[w15, 0], p1/m, z3.d
    250c: c0c0648e     	mov	za7h.d[w15, 0], p1/m, z4.d
    2510: a5fb4581     	ld1d	{ z1.d }, p1/z, [x12, x27, lsl #3]
    2514: a5e1a702     	ld1d	{ z2.d }, p1/z, [x24, #0x1, mul vl]
    2518: a5e2a703     	ld1d	{ z3.d }, p1/z, [x24, #0x2, mul vl]
    251c: a5e3a704     	ld1d	{ z4.d }, p1/z, [x24, #0x3, mul vl]
    2520: 8b1c030c     	add	x12, x24, x28
    2524: c0c04428     	mov	za4h.d[w14, 0], p1/m, z1.d
    2528: c0c0444a     	mov	za5h.d[w14, 0], p1/m, z2.d
    252c: c0c0446c     	mov	za6h.d[w14, 0], p1/m, z3.d
    2530: c0c0448e     	mov	za7h.d[w14, 0], p1/m, z4.d
    2534: a5fb4701     	ld1d	{ z1.d }, p1/z, [x24, x27, lsl #3]
    2538: a5e1a582     	ld1d	{ z2.d }, p1/z, [x12, #0x1, mul vl]
    253c: a5e2a583     	ld1d	{ z3.d }, p1/z, [x12, #0x2, mul vl]
    2540: a5e3a584     	ld1d	{ z4.d }, p1/z, [x12, #0x3, mul vl]
    2544: 8b1c0198     	add	x24, x12, x28
    2548: 5280008e     	mov	w14, #0x4               // =4
    254c: c0c04428     	mov	za4h.d[w14, 0], p1/m, z1.d
    2550: c0c0444a     	mov	za5h.d[w14, 0], p1/m, z2.d
    2554: c0c0446c     	mov	za6h.d[w14, 0], p1/m, z3.d
    2558: c0c0448e     	mov	za7h.d[w14, 0], p1/m, z4.d
    255c: a5fb4581     	ld1d	{ z1.d }, p1/z, [x12, x27, lsl #3]
    2560: a5e1a702     	ld1d	{ z2.d }, p1/z, [x24, #0x1, mul vl]
    2564: a5e2a703     	ld1d	{ z3.d }, p1/z, [x24, #0x2, mul vl]
    2568: a5e3a704     	ld1d	{ z4.d }, p1/z, [x24, #0x3, mul vl]
    256c: 8b1c030c     	add	x12, x24, x28
    2570: 528000ae     	mov	w14, #0x5               // =5
    2574: c0c04428     	mov	za4h.d[w14, 0], p1/m, z1.d
    2578: c0c0444a     	mov	za5h.d[w14, 0], p1/m, z2.d
    257c: c0c0446c     	mov	za6h.d[w14, 0], p1/m, z3.d
    2580: c0c0448e     	mov	za7h.d[w14, 0], p1/m, z4.d
    2584: a5fb4701     	ld1d	{ z1.d }, p1/z, [x24, x27, lsl #3]
    2588: a5e1a582     	ld1d	{ z2.d }, p1/z, [x12, #0x1, mul vl]
    258c: a5e2a583     	ld1d	{ z3.d }, p1/z, [x12, #0x2, mul vl]
    2590: a5e3a584     	ld1d	{ z4.d }, p1/z, [x12, #0x3, mul vl]
    2594: 8b1c0198     	add	x24, x12, x28
    2598: 528000ce     	mov	w14, #0x6               // =6
    259c: c0c04428     	mov	za4h.d[w14, 0], p1/m, z1.d
    25a0: c0c0444a     	mov	za5h.d[w14, 0], p1/m, z2.d
    25a4: c0c0446c     	mov	za6h.d[w14, 0], p1/m, z3.d
    25a8: c0c0448e     	mov	za7h.d[w14, 0], p1/m, z4.d
    25ac: a5fb4581     	ld1d	{ z1.d }, p1/z, [x12, x27, lsl #3]
    25b0: a5e1a702     	ld1d	{ z2.d }, p1/z, [x24, #0x1, mul vl]
    25b4: a5e2a703     	ld1d	{ z3.d }, p1/z, [x24, #0x2, mul vl]
    25b8: a5e3a704     	ld1d	{ z4.d }, p1/z, [x24, #0x3, mul vl]
    25bc: c0c02428     	mov	za4h.d[w13, 0], p1/m, z1.d
    25c0: c0c0244a     	mov	za5h.d[w13, 0], p1/m, z2.d
    25c4: c0c0246c     	mov	za6h.d[w13, 0], p1/m, z3.d
    25c8: c0c0248e     	mov	za7h.d[w13, 0], p1/m, z4.d
    25cc: b940002c     	ldr	w12, [x1]
    25d0: 7100059f     	cmp	w12, #0x1
    25d4: 54ff9feb     	b.lt	0x19d0 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xe8>
    25d8: 1b086b38     	madd	w24, w25, w8, w26
    25dc: 85800041     	ldr	p1, [x2]
    25e0: 1b056b25     	madd	w5, w25, w5, w26
    25e4: 531c6f18     	lsl	w24, w24, #4
    25e8: 531b68a5     	lsl	w5, w5, #5
    25ec: 8b38cd2e     	add	x14, x9, w24, sxtw #3
    25f0: 8b25ccc5     	add	x5, x6, w5, sxtw #3
    25f4: 2a1f03e6     	mov	w6, wzr
    25f8: 14000014     	b	0x2648 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xd60>
    25fc: a5e0a5c1     	ld1d	{ z1.d }, p1/z, [x14]
    2600: a5e0a4a2     	ld1d	{ z2.d }, p1/z, [x5]
    2604: 110004c6     	add	w6, w6, #0x1
    2608: a5e1a4a3     	ld1d	{ z3.d }, p1/z, [x5, #0x1, mul vl]
    260c: a5e1a5c4     	ld1d	{ z4.d }, p1/z, [x14, #0x1, mul vl]
    2610: 6b06019f     	cmp	w12, w6
    2614: a5e2a4a5     	ld1d	{ z5.d }, p1/z, [x5, #0x2, mul vl]
    2618: a5e3a4a6     	ld1d	{ z6.d }, p1/z, [x5, #0x3, mul vl]
    261c: 910201ce     	add	x14, x14, #0x80
    2620: 910400a5     	add	x5, x5, #0x100
    2624: 80c22420     	fmopa	za0.d, p1/m, p1/m, z1.d, z2.d
    2628: 80c32421     	fmopa	za1.d, p1/m, p1/m, z1.d, z3.d
    262c: 80c52422     	fmopa	za2.d, p1/m, p1/m, z1.d, z5.d
    2630: 80c62423     	fmopa	za3.d, p1/m, p1/m, z1.d, z6.d
    2634: 80c22484     	fmopa	za4.d, p1/m, p1/m, z4.d, z2.d
    2638: 80c32485     	fmopa	za5.d, p1/m, p1/m, z4.d, z3.d
    263c: 80c52486     	fmopa	za6.d, p1/m, p1/m, z4.d, z5.d
    2640: 80c62487     	fmopa	za7.d, p1/m, p1/m, z4.d, z6.d
    2644: 54ff9c60     	b.eq	0x19d0 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xe8>
    2648: 110040d8     	add	w24, w6, #0x10
    264c: 6b0c031f     	cmp	w24, w12
    2650: 54fffd6a     	b.ge	0x25fc <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xd14>
    2654: f98401c0     	prfm	pldl1keep, [x14, #0x800]
    2658: f98800a0     	prfm	pldl1keep, [x5, #0x1000]
    265c: 17ffffe8     	b	0x25fc <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xd14>
    2660: b94017e1     	ldr	w1, [sp, #0x14]
    2664: b0000080     	adrp	x0, 0x13000 <__FRAME_END__+0x10104>
    2668: 9135a000     	add	x0, x0, #0xd68
    266c: 97fff8b1     	bl	0x930 <__kmpc_for_static_fini@plt>
    2670: a9484ff4     	ldp	x20, x19, [sp, #0x80]
    2674: a94757f6     	ldp	x22, x21, [sp, #0x70]
    2678: a9465ff8     	ldp	x24, x23, [sp, #0x60]
    267c: a94567fa     	ldp	x26, x25, [sp, #0x50]
    2680: a9446ffc     	ldp	x28, x27, [sp, #0x40]
    2684: a9437bfd     	ldp	x29, x30, [sp, #0x30]
    2688: 910243ff     	add	sp, sp, #0x90
    268c: d65f03c0     	ret

0000000000002690 <_ZN4gemmIdE12compute_testEiiiPKdS2_Pddd>:
    2690: 6db63bef     	stp	d15, d14, [sp, #-0xa0]!
    2694: 6d0133ed     	stp	d13, d12, [sp, #0x10]
    2698: 6d022beb     	stp	d11, d10, [sp, #0x20]
    269c: 6d0323e9     	stp	d9, d8, [sp, #0x30]
    26a0: a9047bfd     	stp	x29, x30, [sp, #0x40]
    26a4: a9056ffc     	stp	x28, x27, [sp, #0x50]
    26a8: a90667fa     	stp	x26, x25, [sp, #0x60]
    26ac: a9075ff8     	stp	x24, x23, [sp, #0x70]
    26b0: a90857f6     	stp	x22, x21, [sp, #0x80]
    26b4: a9094ff4     	stp	x20, x19, [sp, #0x90]
    26b8: 910103fd     	add	x29, sp, #0x40
    26bc: d10343ff     	sub	sp, sp, #0xd0
    26c0: 043f5fff     	addsvl	sp, sp, #-0x1
    26c4: aa0503f4     	mov	x20, x5
    26c8: aa0403f8     	mov	x24, x4
    26cc: aa0303f9     	mov	x25, x3
    26d0: 2a0203f5     	mov	w21, w2
    26d4: 2a0103f7     	mov	w23, w1
    26d8: 2a0003fa     	mov	w26, w0
    26dc: 6d0607e0     	stp	d0, d1, [sp, #0x60]
    26e0: d503437f     	smstart	sm
    26e4: 53047c16     	lsr	w22, w0, #4
    26e8: 53057c3b     	lsr	w27, w1, #5
    26ec: 1b027ec8     	mul	w8, w22, w2
    26f0: 531c6d08     	lsl	w8, w8, #4
    26f4: d37d7d00     	ubfiz	x0, x8, #3, #32
    26f8: d503427f     	smstop	sm
    26fc: 97fff889     	bl	0x920 <_Znam@plt>
    2700: aa0003f3     	mov	x19, x0
    2704: d503437f     	smstart	sm
    2708: 1b157f68     	mul	w8, w27, w21
    270c: 531b6908     	lsl	w8, w8, #5
    2710: d37d7d00     	ubfiz	x0, x8, #3, #32
    2714: d503427f     	smstop	sm
    2718: 97fff882     	bl	0x920 <_Znam@plt>
    271c: 2a1503f2     	mov	w18, w21
    2720: aa0003f5     	mov	x21, x0
    2724: d503437f     	smstart	sm
    2728: 531c6e4a     	lsl	w10, w18, #4
    272c: 2a1f03e8     	mov	w8, wzr
    2730: aa1f03e9     	mov	x9, xzr
    2734: 2a1203eb     	mov	w11, w18
    2738: 528001ec     	mov	w12, #0xf               // =15
    273c: 2a0c03ed     	mov	w13, w12
    2740: 2a0803ee     	mov	w14, w8
    2744: aa0b03ef     	mov	x15, x11
    2748: 51003db1     	sub	w17, w13, #0xf
    274c: 8b2ece70     	add	x16, x19, w14, sxtw #3
    2750: f10005ef     	subs	x15, x15, #0x1
    2754: fc71db20     	ldr	d0, [x25, w17, sxtw #3]
    2758: 510039b1     	sub	w17, w13, #0xe
    275c: 110041ce     	add	w14, w14, #0x10
    2760: fc71db21     	ldr	d1, [x25, w17, sxtw #3]
    2764: 510035b1     	sub	w17, w13, #0xd
    2768: fc71db22     	ldr	d2, [x25, w17, sxtw #3]
    276c: 510031b1     	sub	w17, w13, #0xc
    2770: 6d000600     	stp	d0, d1, [x16]
    2774: fc71db20     	ldr	d0, [x25, w17, sxtw #3]
    2778: 51002db1     	sub	w17, w13, #0xb
    277c: fc71db21     	ldr	d1, [x25, w17, sxtw #3]
    2780: 510029b1     	sub	w17, w13, #0xa
    2784: 6d010202     	stp	d2, d0, [x16, #0x10]
    2788: fc71db20     	ldr	d0, [x25, w17, sxtw #3]
    278c: 510025b1     	sub	w17, w13, #0x9
    2790: fc71db22     	ldr	d2, [x25, w17, sxtw #3]
    2794: 510021b1     	sub	w17, w13, #0x8
    2798: 6d020201     	stp	d1, d0, [x16, #0x20]
    279c: fc71db20     	ldr	d0, [x25, w17, sxtw #3]
    27a0: 51001db1     	sub	w17, w13, #0x7
    27a4: fc71db21     	ldr	d1, [x25, w17, sxtw #3]
    27a8: 510019b1     	sub	w17, w13, #0x6
    27ac: 6d030202     	stp	d2, d0, [x16, #0x30]
    27b0: fc71db20     	ldr	d0, [x25, w17, sxtw #3]
    27b4: 510015b1     	sub	w17, w13, #0x5
    27b8: fc71db22     	ldr	d2, [x25, w17, sxtw #3]
    27bc: 510011b1     	sub	w17, w13, #0x4
    27c0: 6d040201     	stp	d1, d0, [x16, #0x40]
    27c4: fc71db20     	ldr	d0, [x25, w17, sxtw #3]
    27c8: 51000db1     	sub	w17, w13, #0x3
    27cc: fc71db21     	ldr	d1, [x25, w17, sxtw #3]
    27d0: 510009b1     	sub	w17, w13, #0x2
    27d4: 6d050202     	stp	d2, d0, [x16, #0x50]
    27d8: fc71db20     	ldr	d0, [x25, w17, sxtw #3]
    27dc: 510005b1     	sub	w17, w13, #0x1
    27e0: fc71db22     	ldr	d2, [x25, w17, sxtw #3]
    27e4: 6d060201     	stp	d1, d0, [x16, #0x60]
    27e8: fc6ddb20     	ldr	d0, [x25, w13, sxtw #3]
    27ec: 0b1a01ad     	add	w13, w13, w26
    27f0: 6d070202     	stp	d2, d0, [x16, #0x70]
    27f4: 54fffaa1     	b.ne	0x2748 <_ZN4gemmIdE12compute_testEiiiPKdS2_Pddd+0xb8>
    27f8: 91000529     	add	x9, x9, #0x1
    27fc: 0b0a0108     	add	w8, w8, w10
    2800: 1100418c     	add	w12, w12, #0x10
    2804: eb16013f     	cmp	x9, x22
    2808: 54fff9a1     	b.ne	0x273c <_ZN4gemmIdE12compute_testEiiiPKdS2_Pddd+0xac>
    280c: d503427f     	smstop	sm
    2810: 2a1703e0     	mov	w0, w23
    2814: 2a1203e1     	mov	w1, w18
    2818: aa1803e2     	mov	x2, x24
    281c: aa1503e3     	mov	x3, x21
    2820: 2a1203f9     	mov	w25, w18
    2824: 97fffbbe     	bl	0x171c <_ZN4gemmIdE6pack_BEiiPKdPd>
    2828: 2a1903ec     	mov	w12, w25
    282c: d503437f     	smstart	sm
    2830: 25d8e3e0     	ptrue	p0.d
    2834: 6d4603e1     	ldp	d1, d0, [sp, #0x60]
    2838: 2a1f03e8     	mov	w8, wzr
    283c: 29195ff9     	stp	w25, w23, [sp, #0xc8]
    2840: 51000b78     	sub	w24, w27, #0x2
    2844: a9074ff5     	stp	x21, x19, [sp, #0x70]
    2848: 5280004d     	mov	w13, #0x2               // =2
    284c: 910283ee     	add	x14, sp, #0xa0
    2850: a90bcff5     	stp	x21, x19, [sp, #0xb8]
    2854: 9102a3ef     	add	x15, sp, #0xa8
    2858: 910233f0     	add	x16, sp, #0x8c
    285c: f9005bf4     	str	x20, [sp, #0xb0]
    2860: 910253f5     	add	x21, sp, #0x94
    2864: 910243f3     	add	x19, sp, #0x90
    2868: 910333fa     	add	x26, sp, #0xcc
    286c: 29135bff     	stp	wzr, w22, [sp, #0x98]
    2870: 9102c3f4     	add	x20, sp, #0xb0
    2874: 9102e3f9     	add	x25, sp, #0xb8
    2878: d10103a9     	sub	x9, x29, #0x40
    287c: 910263fc     	add	x28, sp, #0x98
    2880: b0000096     	adrp	x22, 0x13000 <__FRAME_END__+0x10104>
    2884: 913602d6     	add	x22, x22, #0xd80
    2888: f0fffff7     	adrp	x23, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0x2d4>
    288c: 9123a2f7     	add	x23, x23, #0x8e8
    2890: 6d0a07e0     	stp	d0, d1, [sp, #0xa0]
    2894: e5bf1d20     	str	p0, [x9, #-0x1, mul vl]
    2898: 1120010a     	add	w10, w8, #0x800
    289c: 7100011f     	cmp	w8, #0x0
    28a0: 4b080188     	sub	w8, w12, w8
    28a4: 1a9f17eb     	cset	w11, eq
    28a8: 6b0c015f     	cmp	w10, w12
    28ac: 5281000a     	mov	w10, #0x800             // =2048
    28b0: 2a1f03e9     	mov	w9, wzr
    28b4: 1a8ac108     	csel	w8, w8, w10, gt
    28b8: 1a9fb7ea     	cset	w10, ge
    28bc: 390243eb     	strb	w11, [sp, #0x90]
    28c0: b90097e8     	str	w8, [sp, #0x94]
    28c4: 390233ea     	strb	w10, [sp, #0x8c]
    28c8: b9008bff     	str	wzr, [sp, #0x88]
    28cc: 4b090368     	sub	w8, w27, w9
    28d0: 6b18013f     	cmp	w9, w24
    28d4: a9043bef     	stp	x15, x14, [sp, #0x40]
    28d8: 1a8dc108     	csel	w8, w8, w13, gt
    28dc: a90343f5     	stp	x21, x16, [sp, #0x30]
    28e0: b90087e8     	str	w8, [sp, #0x84]
    28e4: d10103a8     	sub	x8, x29, #0x40
    28e8: 04685fe8     	addspl	x8, x8, #-0x1
    28ec: a9016bf4     	stp	x20, x26, [sp, #0x10]
    28f0: a90223f3     	stp	x19, x8, [sp, #0x20]
    28f4: a90067fc     	stp	x28, x25, [sp]
    28f8: d503427f     	smstop	sm
    28fc: 910273e3     	add	x3, sp, #0x9c
    2900: 910213e4     	add	x4, sp, #0x84
    2904: 910223e5     	add	x5, sp, #0x88
    2908: 910303e6     	add	x6, sp, #0xc0
    290c: 910323e7     	add	x7, sp, #0xc8
    2910: aa1603e0     	mov	x0, x22
    2914: 528001e1     	mov	w1, #0xf                // =15
    2918: aa1703e2     	mov	x2, x23
    291c: 97fff82d     	bl	0x9d0 <__kmpc_fork_call@plt>
    2920: 910233f0     	add	x16, sp, #0x8c
    2924: 9102a3ef     	add	x15, sp, #0xa8
    2928: 910283ee     	add	x14, sp, #0xa0
    292c: 5280004d     	mov	w13, #0x2               // =2
    2930: d503437f     	smstart	sm
    2934: b9408be8     	ldr	w8, [sp, #0x88]
    2938: 11000909     	add	w9, w8, #0x2
    293c: 6b1b013f     	cmp	w9, w27
    2940: b9008be9     	str	w9, [sp, #0x88]
    2944: 54fffc4b     	b.lt	0x28cc <_ZN4gemmIdE12compute_testEiiiPKdS2_Pddd+0x23c>
    2948: b9409be8     	ldr	w8, [sp, #0x98]
    294c: b940cbec     	ldr	w12, [sp, #0xc8]
    2950: 11200108     	add	w8, w8, #0x800
    2954: 6b0c011f     	cmp	w8, w12
    2958: b9009be8     	str	w8, [sp, #0x98]
    295c: 54fff9eb     	b.lt	0x2898 <_ZN4gemmIdE12compute_testEiiiPKdS2_Pddd+0x208>
    2960: d503427f     	smstop	sm
    2964: f9403fe0     	ldr	x0, [sp, #0x78]
    2968: 97fff80a     	bl	0x990 <_ZdaPv@plt>
    296c: d503437f     	smstart	sm
    2970: d503427f     	smstop	sm
    2974: f9403be0     	ldr	x0, [sp, #0x70]
    2978: 97fff806     	bl	0x990 <_ZdaPv@plt>
    297c: d503437f     	smstart	sm
    2980: d503427f     	smstop	sm
    2984: 043f583f     	addsvl	sp, sp, #0x1
    2988: 910343ff     	add	sp, sp, #0xd0
    298c: a9494ff4     	ldp	x20, x19, [sp, #0x90]
    2990: a94857f6     	ldp	x22, x21, [sp, #0x80]
    2994: a9475ff8     	ldp	x24, x23, [sp, #0x70]
    2998: a94667fa     	ldp	x26, x25, [sp, #0x60]
    299c: a9456ffc     	ldp	x28, x27, [sp, #0x50]
    29a0: a9447bfd     	ldp	x29, x30, [sp, #0x40]
    29a4: 6d4323e9     	ldp	d9, d8, [sp, #0x30]
    29a8: 6d422beb     	ldp	d11, d10, [sp, #0x20]
    29ac: 6d4133ed     	ldp	d13, d12, [sp, #0x10]
    29b0: 6cca3bef     	ldp	d15, d14, [sp], #0xa0
    29b4: d65f03c0     	ret

Disassembly of section .fini:

00000000000029b8 <_fini>:
    29b8: d503201f     	nop
    29bc: a9bf7bfd     	stp	x29, x30, [sp, #-0x10]!
    29c0: 910003fd     	mov	x29, sp
    29c4: a8c17bfd     	ldp	x29, x30, [sp], #0x10
    29c8: d65f03c0     	ret
