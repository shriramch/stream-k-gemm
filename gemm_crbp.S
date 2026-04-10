
gemm_crbp:	file format elf64-littleaarch64

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
     904: f0000090     	adrp	x16, 0x13000 <__FRAME_END__+0x1015c>
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
     a1c: f0000080     	adrp	x0, 0x13000 <__FRAME_END__+0x1015c>
     a20: f947e000     	ldr	x0, [x0, #0xfc0]
     a24: d2800003     	mov	x3, #0x0                // =0
     a28: d2800004     	mov	x4, #0x0                // =0
     a2c: 97ffffd5     	bl	0x980 <__libc_start_main@plt>
     a30: 97ffffe4     	bl	0x9c0 <abort@plt>

0000000000000a34 <call_weak_fn>:
     a34: f0000080     	adrp	x0, 0x13000 <__FRAME_END__+0x1015c>
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
     a68: f0000081     	adrp	x1, 0x13000 <__FRAME_END__+0x1015c>
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
     aa4: f0000082     	adrp	x2, 0x13000 <__FRAME_END__+0x1015c>
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
     ad8: f0000080     	adrp	x0, 0x13000 <__FRAME_END__+0x1015c>
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
     b24: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x72c>
     b28: 912cdc00     	add	x0, x0, #0xb37
     b2c: 97ffff89     	bl	0x950 <puts@plt>
     b30: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x72c>
     b34: 91270000     	add	x0, x0, #0x9c0
     b38: 52800801     	mov	w1, #0x40               // =64
     b3c: 52800202     	mov	w2, #0x10               // =16
     b40: 52800403     	mov	w3, #0x20               // =32
     b44: 97ffffab     	bl	0x9f0 <printf@plt>
     b48: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x72c>
     b4c: 91279000     	add	x0, x0, #0x9e4
     b50: 52810001     	mov	w1, #0x800              // =2048
     b54: 52800802     	mov	w2, #0x40               // =64
     b58: 52800043     	mov	w3, #0x2                // =2
     b5c: 97ffffa5     	bl	0x9f0 <printf@plt>
     b60: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x72c>
     b64: 912d6800     	add	x0, x0, #0xb5a
     b68: 97ffff7a     	bl	0x950 <puts@plt>
     b6c: 2f00e401     	movi	d1, #0000000000000000
     b70: 1e6e1000     	fmov	d0, #1.00000000
     b74: 52800400     	mov	w0, #0x20               // =32
     b78: 52800801     	mov	w1, #0x40               // =64
     b7c: 52801002     	mov	w2, #0x80               // =128
     b80: 94000066     	bl	0xd18 <_Z9test_gemmIdEbiiiT_S0_>
     b84: 2a0003f3     	mov	w19, w0
     b88: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x72c>
     b8c: 912dc800     	add	x0, x0, #0xb72
     b90: 97ffff70     	bl	0x950 <puts@plt>
     b94: 2f00e401     	movi	d1, #0000000000000000
     b98: 1e6e1000     	fmov	d0, #1.00000000
     b9c: 52800400     	mov	w0, #0x20               // =32
     ba0: 52800801     	mov	w1, #0x40               // =64
     ba4: 52820002     	mov	w2, #0x1000             // =4096
     ba8: 9400005c     	bl	0xd18 <_Z9test_gemmIdEbiiiT_S0_>
     bac: 72000268     	ands	w8, w19, #0x1
     bb0: 52800029     	mov	w9, #0x1                // =1
     bb4: 1a890529     	cinc	w9, w9, ne
     bb8: 7200001f     	tst	w0, #0x1
     bbc: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x72c>
     bc0: 912e2800     	add	x0, x0, #0xb8a
     bc4: 1a881133     	csel	w19, w9, w8, ne
     bc8: 97ffff62     	bl	0x950 <puts@plt>
     bcc: 1e601000     	fmov	d0, #2.00000000
     bd0: 1e6c1001     	fmov	d1, #0.50000000
     bd4: 52800400     	mov	w0, #0x20               // =32
     bd8: 52800801     	mov	w1, #0x40               // =64
     bdc: 52820002     	mov	w2, #0x1000             // =4096
     be0: 9400004e     	bl	0xd18 <_Z9test_gemmIdEbiiiT_S0_>
     be4: 12000014     	and	w20, w0, #0x1
     be8: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x72c>
     bec: 912ea000     	add	x0, x0, #0xba8
     bf0: 97ffff58     	bl	0x950 <puts@plt>
     bf4: 2f00e401     	movi	d1, #0000000000000000
     bf8: 1e6e1000     	fmov	d0, #1.00000000
     bfc: 52800800     	mov	w0, #0x40               // =64
     c00: 52801001     	mov	w1, #0x80               // =128
     c04: 52810002     	mov	w2, #0x800              // =2048
     c08: 94000044     	bl	0xd18 <_Z9test_gemmIdEbiiiT_S0_>
     c0c: 12000008     	and	w8, w0, #0x1
     c10: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x72c>
     c14: 9127fc00     	add	x0, x0, #0x9ff
     c18: 0b080288     	add	w8, w20, w8
     c1c: 52800082     	mov	w2, #0x4                // =4
     c20: 0b080273     	add	w19, w19, w8
     c24: 2a1303e1     	mov	w1, w19
     c28: 97ffff72     	bl	0x9f0 <printf@plt>
     c2c: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x72c>
     c30: 912f1400     	add	x0, x0, #0xbc5
     c34: 97ffff47     	bl	0x950 <puts@plt>
     c38: 52a00400     	mov	w0, #0x200000           // =2097152
     c3c: 97ffff39     	bl	0x920 <_Znam@plt>
     c40: aa0003f4     	mov	x20, x0
     c44: 52a00800     	mov	w0, #0x400000           // =4194304
     c48: 97ffff36     	bl	0x920 <_Znam@plt>
     c4c: aa0003f5     	mov	x21, x0
     c50: 52a00020     	mov	w0, #0x10000            // =65536
     c54: 97ffff33     	bl	0x920 <_Znam@plt>
     c58: aa0003f6     	mov	x22, x0
     c5c: aa1403e0     	mov	x0, x20
     c60: 2a1f03e1     	mov	w1, wzr
     c64: 52a00402     	mov	w2, #0x200000           // =2097152
     c68: 97ffff3e     	bl	0x960 <memset@plt>
     c6c: aa1503e0     	mov	x0, x21
     c70: 2a1f03e1     	mov	w1, wzr
     c74: 52a00802     	mov	w2, #0x400000           // =4194304
     c78: 97ffff3a     	bl	0x960 <memset@plt>
     c7c: aa1603e0     	mov	x0, x22
     c80: 2a1f03e1     	mov	w1, wzr
     c84: 52a00022     	mov	w2, #0x10000            // =65536
     c88: 97ffff36     	bl	0x960 <memset@plt>
     c8c: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x72c>
     c90: 91289400     	add	x0, x0, #0xa25
     c94: 52800801     	mov	w1, #0x40               // =64
     c98: 52801002     	mov	w2, #0x80               // =128
     c9c: 52820003     	mov	w3, #0x1000             // =4096
     ca0: 52800044     	mov	w4, #0x2                // =2
     ca4: 97ffff53     	bl	0x9f0 <printf@plt>
     ca8: 52800040     	mov	w0, #0x2                // =2
     cac: 97ffff3d     	bl	0x9a0 <omp_set_num_threads@plt>
     cb0: aa1403e0     	mov	x0, x20
     cb4: aa1503e1     	mov	x1, x21
     cb8: aa1603e2     	mov	x2, x22
     cbc: 94000154     	bl	0x120c <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd>
     cc0: d2e83208     	mov	x8, #0x4190000000000000 // =4724276009111650304
     cc4: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x72c>
     cc8: 91290c00     	add	x0, x0, #0xa43
     ccc: 9e670101     	fmov	d1, x8
     cd0: d2c80008     	mov	x8, #0x400000000000     // =70368744177664
     cd4: f2e811e8     	movk	x8, #0x408f, lsl #48
     cd8: 9e670102     	fmov	d2, x8
     cdc: 1e601821     	fdiv	d1, d1, d0
     ce0: 1e621800     	fdiv	d0, d0, d2
     ce4: 97ffff43     	bl	0x9f0 <printf@plt>
     ce8: aa1403e0     	mov	x0, x20
     cec: 97ffff29     	bl	0x990 <_ZdaPv@plt>
     cf0: aa1503e0     	mov	x0, x21
     cf4: 97ffff27     	bl	0x990 <_ZdaPv@plt>
     cf8: aa1603e0     	mov	x0, x22
     cfc: 97ffff25     	bl	0x990 <_ZdaPv@plt>
     d00: 7100127f     	cmp	w19, #0x4
     d04: 1a9f07e0     	cset	w0, ne
     d08: a9424ff4     	ldp	x20, x19, [sp, #0x20]
     d0c: a94157f6     	ldp	x22, x21, [sp, #0x10]
     d10: a8c37bfd     	ldp	x29, x30, [sp], #0x30
     d14: d65f03c0     	ret

0000000000000d18 <_Z9test_gemmIdEbiiiT_S0_>:
     d18: d10283ff     	sub	sp, sp, #0xa0
     d1c: fd0013ea     	str	d10, [sp, #0x20]
     d20: 6d0323e9     	stp	d9, d8, [sp, #0x30]
     d24: a9047bfd     	stp	x29, x30, [sp, #0x40]
     d28: a9056ffc     	stp	x28, x27, [sp, #0x50]
     d2c: a90667fa     	stp	x26, x25, [sp, #0x60]
     d30: a9075ff8     	stp	x24, x23, [sp, #0x70]
     d34: a90857f6     	stp	x22, x21, [sp, #0x80]
     d38: a9094ff4     	stp	x20, x19, [sp, #0x90]
     d3c: 910103fd     	add	x29, sp, #0x40
     d40: 2a0203f3     	mov	w19, w2
     d44: 2a0103f8     	mov	w24, w1
     d48: 2a0003f9     	mov	w25, w0
     d4c: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x72c>
     d50: 9129a400     	add	x0, x0, #0xa69
     d54: d0000001     	adrp	x1, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x72c>
     d58: 91298821     	add	x1, x1, #0xa62
     d5c: 2a1903e2     	mov	w2, w25
     d60: 2a1803e3     	mov	w3, w24
     d64: 2a1303e4     	mov	w4, w19
     d68: 1e604028     	fmov	d8, d1
     d6c: 1e604009     	fmov	d9, d0
     d70: 97ffff20     	bl	0x9f0 <printf@plt>
     d74: 52800040     	mov	w0, #0x2                // =2
     d78: 97ffff0a     	bl	0x9a0 <omp_set_num_threads@plt>
     d7c: 1b197e68     	mul	w8, w19, w25
     d80: d37d7d00     	ubfiz	x0, x8, #3, #32
     d84: 97fffee7     	bl	0x920 <_Znam@plt>
     d88: 1b187e68     	mul	w8, w19, w24
     d8c: aa0003fb     	mov	x27, x0
     d90: d37d7d08     	ubfiz	x8, x8, #3, #32
     d94: aa0803e0     	mov	x0, x8
     d98: 97fffee2     	bl	0x920 <_Znam@plt>
     d9c: 1b197f08     	mul	w8, w24, w25
     da0: aa0003f4     	mov	x20, x0
     da4: d37d7d16     	ubfiz	x22, x8, #3, #32
     da8: f9000be8     	str	x8, [sp, #0x10]
     dac: aa1603e0     	mov	x0, x22
     db0: 97fffedc     	bl	0x920 <_Znam@plt>
     db4: f9000fe0     	str	x0, [sp, #0x18]
     db8: aa1603e0     	mov	x0, x22
     dbc: aa1603f5     	mov	x21, x22
     dc0: 97fffed8     	bl	0x920 <_Znam@plt>
     dc4: 04bf502a     	rdvl	x10, #0x1
     dc8: 25d8e3e0     	ptrue	p0.d
     dcc: 04e0e3eb     	cntd	x11
     dd0: d344fd5c     	lsr	x28, x10, #4
     dd4: 321e73ea     	mov	w10, #0x7ffffffc        // =2147483644
     dd8: 04e14004     	index	z4.d, #0x0, #0x1
     ddc: d000000d     	adrp	x13, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x72c>
     de0: 9126a1ad     	add	x13, x13, #0x9a8
     de4: 05e03963     	mov	z3.d, x11
     de8: 9b0a7f8a     	mul	x10, x28, x10
     dec: d000000b     	adrp	x11, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x72c>
     df0: d000000c     	adrp	x12, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x72c>
     df4: 2a1903f7     	mov	w23, w25
     df8: fd44d161     	ldr	d1, [x11, #0x9a0]
     dfc: fd44d582     	ldr	d2, [x12, #0x9a8]
     e00: aa0003f6     	mov	x22, x0
     e04: 2a1f03e8     	mov	w8, wzr
     e08: aa1f03e9     	mov	x9, xzr
     e0c: 85c0e1a0     	ld1rd	{ z0.d }, p0/z, [x13]
     e10: b9000ff3     	str	w19, [sp, #0xc]
     e14: 2a1303fa     	mov	w26, w19
     e18: 04a0e3f3     	cntw	x19
     e1c: 8a17014a     	and	x10, x10, x23
     e20: 14000004     	b	0xe30 <_Z9test_gemmIdEbiiiT_S0_+0x118>
     e24: eb1a013f     	cmp	x9, x26
     e28: 0b190108     	add	w8, w8, w25
     e2c: 540004c0     	b.eq	0xec4 <_Z9test_gemmIdEbiiiT_S0_+0x1ac>
     e30: 91000529     	add	x9, x9, #0x1
     e34: 8b284f6b     	add	x11, x27, w8, uxtw #3
     e38: eb17027f     	cmp	x19, x23
     e3c: 1e620125     	scvtf	d5, w9
     e40: 1e6108a5     	fmul	d5, d5, d1
     e44: 54000069     	b.ls	0xe50 <_Z9test_gemmIdEbiiiT_S0_+0x138>
     e48: aa1f03ec     	mov	x12, xzr
     e4c: 14000016     	b	0xea4 <_Z9test_gemmIdEbiiiT_S0_+0x18c>
     e50: 052820a6     	mov	z6.d, d5
     e54: 04643087     	mov	z7.d, z4.d
     e58: aa1f03ec     	mov	x12, xzr
     e5c: 042b502d     	addvl	x13, x11, #0x1
     e60: 04e300f0     	add	z16.d, z7.d, z3.d
     e64: 25e0c027     	add	z7.d, z7.d, #0x1        // =1
     e68: 04e30211     	add	z17.d, z16.d, z3.d
     e6c: 25e0c030     	add	z16.d, z16.d, #0x1      // =1
     e70: 65d0a0e7     	scvtf	z7.d, p0/m, z7.s
     e74: 65d0a210     	scvtf	z16.d, p0/m, z16.s
     e78: 65e68007     	fmad	z7.d, p0/m, z0.d, z6.d
     e7c: 65e68010     	fmad	z16.d, p0/m, z0.d, z6.d
     e80: e5ec4167     	st1d	{ z7.d }, p0, [x11, x12, lsl #3]
     e84: 04713227     	mov	z7.d, z17.d
     e88: e5ec41b0     	st1d	{ z16.d }, p0, [x13, x12, lsl #3]
     e8c: 04b0e3ec     	incw	x12
     e90: eb0c015f     	cmp	x10, x12
     e94: 54fffe61     	b.ne	0xe60 <_Z9test_gemmIdEbiiiT_S0_+0x148>
     e98: eb17015f     	cmp	x10, x23
     e9c: aa0a03ec     	mov	x12, x10
     ea0: 54fffc20     	b.eq	0xe24 <_Z9test_gemmIdEbiiiT_S0_+0x10c>
     ea4: 9100058d     	add	x13, x12, #0x1
     ea8: 1e6201a6     	scvtf	d6, w13
     eac: eb0d02ff     	cmp	x23, x13
     eb0: 1f4214c6     	fmadd	d6, d6, d2, d5
     eb4: fc2c7966     	str	d6, [x11, x12, lsl #3]
     eb8: aa0d03ec     	mov	x12, x13
     ebc: 54ffff41     	b.ne	0xea4 <_Z9test_gemmIdEbiiiT_S0_+0x18c>
     ec0: 17ffffd9     	b	0xe24 <_Z9test_gemmIdEbiiiT_S0_+0x10c>
     ec4: d37ffb8b     	lsl	x11, x28, #1
     ec8: 5301038a     	lsl	w10, w28, #31
     ecc: 04e14003     	index	z3.d, #0x0, #0x1
     ed0: f81e83bb     	stur	x27, [x29, #-0x18]
     ed4: 2a1803fb     	mov	w27, w24
     ed8: 2a1f03e8     	mov	w8, wzr
     edc: 05e03964     	mov	z4.d, x11
     ee0: d000000b     	adrp	x11, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x72c>
     ee4: 9126816b     	add	x11, x11, #0x9a0
     ee8: 4b1c094a     	sub	w10, w10, w28, lsl #2
     eec: 85c0e165     	ld1rd	{ z5.d }, p0/z, [x11]
     ef0: aa1f03e9     	mov	x9, xzr
     ef4: 8a1b014a     	and	x10, x10, x27
     ef8: 14000004     	b	0xf08 <_Z9test_gemmIdEbiiiT_S0_+0x1f0>
     efc: eb1a013f     	cmp	x9, x26
     f00: 0b180108     	add	w8, w8, w24
     f04: 54000500     	b.eq	0xfa4 <_Z9test_gemmIdEbiiiT_S0_+0x28c>
     f08: 91000529     	add	x9, x9, #0x1
     f0c: 8b284e8b     	add	x11, x20, w8, uxtw #3
     f10: eb1b027f     	cmp	x19, x27
     f14: 1e620126     	scvtf	d6, w9
     f18: 54000069     	b.ls	0xf24 <_Z9test_gemmIdEbiiiT_S0_+0x20c>
     f1c: aa1f03ec     	mov	x12, xzr
     f20: 14000018     	b	0xf80 <_Z9test_gemmIdEbiiiT_S0_+0x268>
     f24: 052820c7     	mov	z7.d, d6
     f28: 04633070     	mov	z16.d, z3.d
     f2c: aa1f03ec     	mov	x12, xzr
     f30: 042b502d     	addvl	x13, x11, #0x1
     f34: 04e40211     	add	z17.d, z16.d, z4.d
     f38: 25e0c030     	add	z16.d, z16.d, #0x1      // =1
     f3c: 04e40232     	add	z18.d, z17.d, z4.d
     f40: 25e0c031     	add	z17.d, z17.d, #0x1      // =1
     f44: 65d0a210     	scvtf	z16.d, p0/m, z16.s
     f48: 65d0a231     	scvtf	z17.d, p0/m, z17.s
     f4c: 65c00a10     	fmul	z16.d, z16.d, z0.d
     f50: 65c00a31     	fmul	z17.d, z17.d, z0.d
     f54: 65e500f0     	fmla	z16.d, p0/m, z7.d, z5.d
     f58: 65e500f1     	fmla	z17.d, p0/m, z7.d, z5.d
     f5c: e5ec4170     	st1d	{ z16.d }, p0, [x11, x12, lsl #3]
     f60: 04723250     	mov	z16.d, z18.d
     f64: e5ec41b1     	st1d	{ z17.d }, p0, [x13, x12, lsl #3]
     f68: 04b0e3ec     	incw	x12
     f6c: eb0c015f     	cmp	x10, x12
     f70: 54fffe21     	b.ne	0xf34 <_Z9test_gemmIdEbiiiT_S0_+0x21c>
     f74: eb1b015f     	cmp	x10, x27
     f78: aa0a03ec     	mov	x12, x10
     f7c: 54fffc00     	b.eq	0xefc <_Z9test_gemmIdEbiiiT_S0_+0x1e4>
     f80: 9100058d     	add	x13, x12, #0x1
     f84: 1e6201a7     	scvtf	d7, w13
     f88: eb0d037f     	cmp	x27, x13
     f8c: 1e6208e7     	fmul	d7, d7, d2
     f90: 1f411cc7     	fmadd	d7, d6, d1, d7
     f94: fc2c7967     	str	d7, [x11, x12, lsl #3]
     f98: aa0d03ec     	mov	x12, x13
     f9c: 54ffff21     	b.ne	0xf80 <_Z9test_gemmIdEbiiiT_S0_+0x268>
     fa0: 17ffffd7     	b	0xefc <_Z9test_gemmIdEbiiiT_S0_+0x1e4>
     fa4: f9400fe0     	ldr	x0, [sp, #0x18]
     fa8: 2a1f03e1     	mov	w1, wzr
     fac: aa1503e2     	mov	x2, x21
     fb0: 97fffe6c     	bl	0x960 <memset@plt>
     fb4: aa1603e0     	mov	x0, x22
     fb8: 2a1f03e1     	mov	w1, wzr
     fbc: aa1503e2     	mov	x2, x21
     fc0: 97fffe68     	bl	0x960 <memset@plt>
     fc4: 25d8e3e0     	ptrue	p0.d
     fc8: 9bbc7eea     	umull	x10, w23, w28
     fcc: f100227f     	cmp	x19, #0x8
     fd0: 9bbc7f6b     	umull	x11, w27, w28
     fd4: 52800109     	mov	w9, #0x8                // =8
     fd8: d37df36c     	lsl	x12, x27, #3
     fdc: 9a898269     	csel	x9, x19, x9, hi
     fe0: 7100073f     	cmp	w25, #0x1
     fe4: d37df2ed     	lsl	x13, x23, #3
     fe8: 7a410b00     	ccmp	w24, #0x1, #0x0, eq
     fec: d37be94a     	lsl	x10, x10, #5
     ff0: f85e83b0     	ldur	x16, [x29, #-0x18]
     ff4: d37be96b     	lsl	x11, x11, #5
     ff8: aa1f03e8     	mov	x8, xzr
     ffc: 1a9f07ee     	cset	w14, ne
    1000: 1280006f     	mov	w15, #-0x4              // =-4
    1004: 14000005     	b	0x1018 <_Z9test_gemmIdEbiiiT_S0_+0x300>
    1008: 91000508     	add	x8, x8, #0x1
    100c: 91002210     	add	x16, x16, #0x8
    1010: eb17011f     	cmp	x8, x23
    1014: 54000620     	b.eq	0x10d8 <_Z9test_gemmIdEbiiiT_S0_+0x3c0>
    1018: 9b1b7d12     	mul	x18, x8, x27
    101c: aa1f03f1     	mov	x17, xzr
    1020: aa1403e0     	mov	x0, x20
    1024: 8b120ed2     	add	x18, x22, x18, lsl #3
    1028: 14000007     	b	0x1044 <_Z9test_gemmIdEbiiiT_S0_+0x32c>
    102c: 1f402120     	fmadd	d0, d9, d0, d8
    1030: 91002000     	add	x0, x0, #0x8
    1034: fc317a40     	str	d0, [x18, x17, lsl #3]
    1038: 91000631     	add	x17, x17, #0x1
    103c: eb1b023f     	cmp	x17, x27
    1040: 54fffe40     	b.eq	0x1008 <_Z9test_gemmIdEbiiiT_S0_+0x2f0>
    1044: eb1a013f     	cmp	x9, x26
    1048: 1a9f95c1     	csinc	w1, w14, wzr, ls
    104c: 36000081     	tbz	w1, #0x0, 0x105c <_Z9test_gemmIdEbiiiT_S0_+0x344>
    1050: 2f00e400     	movi	d0, #0000000000000000
    1054: aa1f03e1     	mov	x1, xzr
    1058: 14000015     	b	0x10ac <_Z9test_gemmIdEbiiiT_S0_+0x394>
    105c: 9b0f7f81     	mul	x1, x28, x15
    1060: 2f00e400     	movi	d0, #0000000000000000
    1064: aa0003e3     	mov	x3, x0
    1068: aa1003e4     	mov	x4, x16
    106c: 8a1a0021     	and	x1, x1, x26
    1070: aa0103e2     	mov	x2, x1
    1074: a5e0a081     	ld1d	{ z1.d }, p0/z, [x4]
    1078: a5e0a062     	ld1d	{ z2.d }, p0/z, [x3]
    107c: 04b0e7e2     	decw	x2
    1080: 65c20821     	fmul	z1.d, z1.d, z2.d
    1084: a5e1a062     	ld1d	{ z2.d }, p0/z, [x3, #0x1, mul vl]
    1088: 8b0b0063     	add	x3, x3, x11
    108c: 65d82020     	fadda	d0, p0, d0, z1.d
    1090: a5e1a081     	ld1d	{ z1.d }, p0/z, [x4, #0x1, mul vl]
    1094: 8b0a0084     	add	x4, x4, x10
    1098: 65c20821     	fmul	z1.d, z1.d, z2.d
    109c: 65d82020     	fadda	d0, p0, d0, z1.d
    10a0: b5fffea2     	cbnz	x2, 0x1074 <_Z9test_gemmIdEbiiiT_S0_+0x35c>
    10a4: eb1a003f     	cmp	x1, x26
    10a8: 54fffc20     	b.eq	0x102c <_Z9test_gemmIdEbiiiT_S0_+0x314>
    10ac: 9b017d82     	mul	x2, x12, x1
    10b0: 9b017da3     	mul	x3, x13, x1
    10b4: cb010341     	sub	x1, x26, x1
    10b8: fc636a01     	ldr	d1, [x16, x3]
    10bc: fc626802     	ldr	d2, [x0, x2]
    10c0: f1000421     	subs	x1, x1, #0x1
    10c4: 8b0c0042     	add	x2, x2, x12
    10c8: 8b0d0063     	add	x3, x3, x13
    10cc: 1f420020     	fmadd	d0, d1, d2, d0
    10d0: 54ffff41     	b.ne	0x10b8 <_Z9test_gemmIdEbiiiT_S0_+0x3a0>
    10d4: 17ffffd6     	b	0x102c <_Z9test_gemmIdEbiiiT_S0_+0x314>
    10d8: 1e604120     	fmov	d0, d9
    10dc: 1e604101     	fmov	d1, d8
    10e0: f85e83ba     	ldur	x26, [x29, #-0x18]
    10e4: f9400ff5     	ldr	x21, [sp, #0x18]
    10e8: b9400fe2     	ldr	w2, [sp, #0xc]
    10ec: 2a1903e0     	mov	w0, w25
    10f0: 2a1803e1     	mov	w1, w24
    10f4: aa1a03e3     	mov	x3, x26
    10f8: aa1403e4     	mov	x4, x20
    10fc: aa1503e5     	mov	x5, x21
    1100: 94000556     	bl	0x2658 <_ZN4gemmIdE12compute_testEiiiPKdS2_Pddd>
    1104: 2f00e408     	movi	d8, #0000000000000000
    1108: b0000008     	adrp	x8, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x72c>
    110c: f9400bfb     	ldr	x27, [sp, #0x10]
    1110: fd44d909     	ldr	d9, [x8, #0x9b0]
    1114: b0000008     	adrp	x8, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x72c>
    1118: aa1f03f8     	mov	x24, xzr
    111c: fd44dd0a     	ldr	d10, [x8, #0x9b8]
    1120: b0000019     	adrp	x25, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x72c>
    1124: 912aa339     	add	x25, x25, #0xaa8
    1128: 52800033     	mov	w19, #0x1               // =1
    112c: b0000017     	adrp	x23, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x72c>
    1130: 912c0af7     	add	x23, x23, #0xb02
    1134: 14000007     	b	0x1150 <_Z9test_gemmIdEbiiiT_S0_+0x438>
    1138: 1e6a2040     	fcmp	d2, d10
    113c: 91000718     	add	x24, x24, #0x1
    1140: 1a9fc7e8     	cset	w8, le
    1144: eb1b031f     	cmp	x24, x27
    1148: 0a130113     	and	w19, w8, w19
    114c: 540002a0     	b.eq	0x11a0 <_Z9test_gemmIdEbiiiT_S0_+0x488>
    1150: d37df308     	lsl	x8, x24, #3
    1154: fc686ac1     	ldr	d1, [x22, x8]
    1158: fc686aa0     	ldr	d0, [x21, x8]
    115c: 1e60c022     	fabs	d2, d1
    1160: 7ee1d403     	fabd	d3, d0, d1
    1164: 1e692842     	fadd	d2, d2, d9
    1168: 1e621862     	fdiv	d2, d3, d2
    116c: 1e682040     	fcmp	d2, d8
    1170: 1e68cc48     	fcsel	d8, d2, d8, gt
    1174: 1e6a2040     	fcmp	d2, d10
    1178: 54fffe0d     	b.le	0x1138 <_Z9test_gemmIdEbiiiT_S0_+0x420>
    117c: 3607fdf3     	tbz	w19, #0x0, 0x1138 <_Z9test_gemmIdEbiiiT_S0_+0x420>
    1180: aa1903e0     	mov	x0, x25
    1184: 2a1803e1     	mov	w1, w24
    1188: 97fffe1a     	bl	0x9f0 <printf@plt>
    118c: 91000718     	add	x24, x24, #0x1
    1190: 2a1f03f3     	mov	w19, wzr
    1194: eb1b031f     	cmp	x24, x27
    1198: 54fffdc1     	b.ne	0x1150 <_Z9test_gemmIdEbiiiT_S0_+0x438>
    119c: 14000006     	b	0x11b4 <_Z9test_gemmIdEbiiiT_S0_+0x49c>
    11a0: 7100027f     	cmp	w19, #0x0
    11a4: b0000008     	adrp	x8, 0x2000 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x72c>
    11a8: 912b9108     	add	x8, x8, #0xae4
    11ac: 13000273     	sbfx	w19, w19, #0, #1
    11b0: 9a971117     	csel	x23, x8, x23, ne
    11b4: 1e604100     	fmov	d0, d8
    11b8: aa1703e0     	mov	x0, x23
    11bc: 97fffe0d     	bl	0x9f0 <printf@plt>
    11c0: aa1a03e0     	mov	x0, x26
    11c4: 97fffdf3     	bl	0x990 <_ZdaPv@plt>
    11c8: aa1403e0     	mov	x0, x20
    11cc: 97fffdf1     	bl	0x990 <_ZdaPv@plt>
    11d0: aa1503e0     	mov	x0, x21
    11d4: 97fffdef     	bl	0x990 <_ZdaPv@plt>
    11d8: aa1603e0     	mov	x0, x22
    11dc: 97fffded     	bl	0x990 <_ZdaPv@plt>
    11e0: 12000260     	and	w0, w19, #0x1
    11e4: a9494ff4     	ldp	x20, x19, [sp, #0x90]
    11e8: fd4013ea     	ldr	d10, [sp, #0x20]
    11ec: a94857f6     	ldp	x22, x21, [sp, #0x80]
    11f0: a9475ff8     	ldp	x24, x23, [sp, #0x70]
    11f4: a94667fa     	ldp	x26, x25, [sp, #0x60]
    11f8: a9456ffc     	ldp	x28, x27, [sp, #0x50]
    11fc: a9447bfd     	ldp	x29, x30, [sp, #0x40]
    1200: 6d4323e9     	ldp	d9, d8, [sp, #0x30]
    1204: 910283ff     	add	sp, sp, #0xa0
    1208: d65f03c0     	ret

000000000000120c <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd>:
    120c: 6db63bef     	stp	d15, d14, [sp, #-0xa0]!
    1210: 6d0133ed     	stp	d13, d12, [sp, #0x10]
    1214: 6d022beb     	stp	d11, d10, [sp, #0x20]
    1218: 6d0323e9     	stp	d9, d8, [sp, #0x30]
    121c: a9047bfd     	stp	x29, x30, [sp, #0x40]
    1220: a9056ffc     	stp	x28, x27, [sp, #0x50]
    1224: a90667fa     	stp	x26, x25, [sp, #0x60]
    1228: a9075ff8     	stp	x24, x23, [sp, #0x70]
    122c: a90857f6     	stp	x22, x21, [sp, #0x80]
    1230: a9094ff4     	stp	x20, x19, [sp, #0x90]
    1234: 910103fd     	add	x29, sp, #0x40
    1238: d10343ff     	sub	sp, sp, #0xd0
    123c: 043f5fff     	addsvl	sp, sp, #-0x1
    1240: aa0203f8     	mov	x24, x2
    1244: aa0103f6     	mov	x22, x1
    1248: aa0003f7     	mov	x23, x0
    124c: d503437f     	smstart	sm
    1250: d503427f     	smstop	sm
    1254: 52a00400     	mov	w0, #0x200000           // =2097152
    1258: 97fffdb2     	bl	0x920 <_Znam@plt>
    125c: aa0003f4     	mov	x20, x0
    1260: d503437f     	smstart	sm
    1264: d503427f     	smstop	sm
    1268: 52a00800     	mov	w0, #0x400000           // =4194304
    126c: 97fffdad     	bl	0x920 <_Znam@plt>
    1270: f9003fe0     	str	x0, [sp, #0x78]
    1274: d503437f     	smstart	sm
    1278: aa1f03e8     	mov	x8, xzr
    127c: 910102e9     	add	x9, x23, #0x40
    1280: 3cdc0120     	ldur	q0, [x9, #-0x40]
    1284: 8b08028a     	add	x10, x20, x8
    1288: fc5d0121     	ldur	d1, [x9, #-0x30]
    128c: 3cdd8122     	ldur	q2, [x9, #-0x28]
    1290: 91020108     	add	x8, x8, #0x80
    1294: 3d800140     	str	q0, [x10]
    1298: fc5e8120     	ldur	d0, [x9, #-0x18]
    129c: f142011f     	cmp	x8, #0x80, lsl #12      // =0x80000
    12a0: fd000941     	str	d1, [x10, #0x10]
    12a4: fd001540     	str	d0, [x10, #0x28]
    12a8: ad7f8121     	ldp	q1, q0, [x9, #-0x10]
    12ac: 3c818142     	stur	q2, [x10, #0x18]
    12b0: ad018141     	stp	q1, q0, [x10, #0x30]
    12b4: 6d410122     	ldp	d2, d0, [x9, #0x10]
    12b8: 6d050142     	stp	d2, d0, [x10, #0x50]
    12bc: 6d420121     	ldp	d1, d0, [x9, #0x20]
    12c0: 6d060141     	stp	d1, d0, [x10, #0x60]
    12c4: 6d430122     	ldp	d2, d0, [x9, #0x30]
    12c8: 91080129     	add	x9, x9, #0x200
    12cc: 6d070142     	stp	d2, d0, [x10, #0x70]
    12d0: 54fffd81     	b.ne	0x1280 <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd+0x74>
    12d4: 9103e2e8     	add	x8, x23, #0xf8
    12d8: 52a00109     	mov	w9, #0x80000            // =524288
    12dc: 3cd88100     	ldur	q0, [x8, #-0x78]
    12e0: 8b09028a     	add	x10, x20, x9
    12e4: fc598101     	ldur	d1, [x8, #-0x68]
    12e8: 3cda0102     	ldur	q2, [x8, #-0x60]
    12ec: 91020129     	add	x9, x9, #0x80
    12f0: 3d800140     	str	q0, [x10]
    12f4: fc5b0100     	ldur	d0, [x8, #-0x50]
    12f8: f144013f     	cmp	x9, #0x100, lsl #12     // =0x100000
    12fc: fd000941     	str	d1, [x10, #0x10]
    1300: 3cdb8101     	ldur	q1, [x8, #-0x48]
    1304: fd001540     	str	d0, [x10, #0x28]
    1308: 3cdc8100     	ldur	q0, [x8, #-0x38]
    130c: 3c818142     	stur	q2, [x10, #0x18]
    1310: ad018141     	stp	q1, q0, [x10, #0x30]
    1314: 6d7d8102     	ldp	d2, d0, [x8, #-0x28]
    1318: 6d050142     	stp	d2, d0, [x10, #0x50]
    131c: 6d7e8101     	ldp	d1, d0, [x8, #-0x18]
    1320: 6d060141     	stp	d1, d0, [x10, #0x60]
    1324: 6d7f8102     	ldp	d2, d0, [x8, #-0x8]
    1328: 91080108     	add	x8, x8, #0x200
    132c: 6d070142     	stp	d2, d0, [x10, #0x70]
    1330: 54fffd61     	b.ne	0x12dc <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd+0xd0>
    1334: 9105e2e8     	add	x8, x23, #0x178
    1338: 3cd88100     	ldur	q0, [x8, #-0x78]
    133c: 8b09028a     	add	x10, x20, x9
    1340: fc598101     	ldur	d1, [x8, #-0x68]
    1344: 3cda0102     	ldur	q2, [x8, #-0x60]
    1348: 91020129     	add	x9, x9, #0x80
    134c: 3d800140     	str	q0, [x10]
    1350: fc5b0100     	ldur	d0, [x8, #-0x50]
    1354: f146013f     	cmp	x9, #0x180, lsl #12     // =0x180000
    1358: fd000941     	str	d1, [x10, #0x10]
    135c: 3cdb8101     	ldur	q1, [x8, #-0x48]
    1360: fd001540     	str	d0, [x10, #0x28]
    1364: 3cdc8100     	ldur	q0, [x8, #-0x38]
    1368: 3c818142     	stur	q2, [x10, #0x18]
    136c: ad018141     	stp	q1, q0, [x10, #0x30]
    1370: 6d7d8102     	ldp	d2, d0, [x8, #-0x28]
    1374: 6d050142     	stp	d2, d0, [x10, #0x50]
    1378: 6d7e8101     	ldp	d1, d0, [x8, #-0x18]
    137c: 6d060141     	stp	d1, d0, [x10, #0x60]
    1380: 6d7f8102     	ldp	d2, d0, [x8, #-0x8]
    1384: 91080108     	add	x8, x8, #0x200
    1388: 6d070142     	stp	d2, d0, [x10, #0x70]
    138c: 54fffd61     	b.ne	0x1338 <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd+0x12c>
    1390: 9107e2e8     	add	x8, x23, #0x1f8
    1394: 3cd88100     	ldur	q0, [x8, #-0x78]
    1398: 8b09028a     	add	x10, x20, x9
    139c: fc598101     	ldur	d1, [x8, #-0x68]
    13a0: 3cda0102     	ldur	q2, [x8, #-0x60]
    13a4: 91020129     	add	x9, x9, #0x80
    13a8: 3d800140     	str	q0, [x10]
    13ac: fc5b0100     	ldur	d0, [x8, #-0x50]
    13b0: f148013f     	cmp	x9, #0x200, lsl #12     // =0x200000
    13b4: fd000941     	str	d1, [x10, #0x10]
    13b8: 3cdb8101     	ldur	q1, [x8, #-0x48]
    13bc: fd001540     	str	d0, [x10, #0x28]
    13c0: 3cdc8100     	ldur	q0, [x8, #-0x38]
    13c4: 3c818142     	stur	q2, [x10, #0x18]
    13c8: ad018141     	stp	q1, q0, [x10, #0x30]
    13cc: 6d7d8102     	ldp	d2, d0, [x8, #-0x28]
    13d0: 6d050142     	stp	d2, d0, [x10, #0x50]
    13d4: 6d7e8101     	ldp	d1, d0, [x8, #-0x18]
    13d8: 6d060141     	stp	d1, d0, [x10, #0x60]
    13dc: 6d7f8102     	ldp	d2, d0, [x8, #-0x8]
    13e0: 91080108     	add	x8, x8, #0x200
    13e4: 6d070142     	stp	d2, d0, [x10, #0x70]
    13e8: 54fffd61     	b.ne	0x1394 <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd+0x188>
    13ec: 52801013     	mov	w19, #0x80              // =128
    13f0: d503427f     	smstop	sm
    13f4: f9403ff5     	ldr	x21, [sp, #0x78]
    13f8: 52801000     	mov	w0, #0x80               // =128
    13fc: 52820001     	mov	w1, #0x1000             // =4096
    1400: aa1603e2     	mov	x2, x22
    1404: aa1503e3     	mov	x3, x21
    1408: 940000c0     	bl	0x1708 <_ZN4gemmIdE6pack_BEiiPKdPd>
    140c: 5282000f     	mov	w15, #0x1000            // =4096
    1410: d503437f     	smstart	sm
    1414: 25d8e3e0     	ptrue	p0.d
    1418: d2e7fe09     	mov	x9, #0x3ff0000000000000 // =4607182418800017408
    141c: 2a1f03e8     	mov	w8, wzr
    1420: 29194fef     	stp	w15, w19, [sp, #0xc8]
    1424: 5280008c     	mov	w12, #0x4               // =4
    1428: 5280004d     	mov	w13, #0x2               // =2
    142c: a906d3f8     	stp	x24, x20, [sp, #0x68]
    1430: 910283ee     	add	x14, sp, #0xa0
    1434: 9102a3fc     	add	x28, sp, #0xa8
    1438: a90bd3f5     	stp	x21, x20, [sp, #0xb8]
    143c: 910233f5     	add	x21, sp, #0x8c
    1440: 910253f4     	add	x20, sp, #0x94
    1444: a90ae3e9     	stp	x9, x24, [sp, #0xa8]
    1448: 910243f9     	add	x25, sp, #0x90
    144c: 910333f3     	add	x19, sp, #0xcc
    1450: 9102c3f8     	add	x24, sp, #0xb0
    1454: 9102e3fa     	add	x26, sp, #0xb8
    1458: d10103a9     	sub	x9, x29, #0x40
    145c: 910263fb     	add	x27, sp, #0x98
    1460: d0000096     	adrp	x22, 0x13000 <__FRAME_END__+0x1015c>
    1464: 913602d6     	add	x22, x22, #0xd80
    1468: 90000017     	adrp	x23, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0x2e8>
    146c: 912352f7     	add	x23, x23, #0x8d4
    1470: f90053ff     	str	xzr, [sp, #0xa0]
    1474: 291333ff     	stp	wzr, w12, [sp, #0x98]
    1478: e5bf1920     	str	p0, [x9, #-0x2, mul vl]
    147c: e5bf1d20     	str	p0, [x9, #-0x1, mul vl]
    1480: 1120010a     	add	w10, w8, #0x800
    1484: 7100011f     	cmp	w8, #0x0
    1488: 4b0801e8     	sub	w8, w15, w8
    148c: 1a9f17eb     	cset	w11, eq
    1490: 6b0f015f     	cmp	w10, w15
    1494: 5281000a     	mov	w10, #0x800             // =2048
    1498: 2a1f03e9     	mov	w9, wzr
    149c: 1a8ac108     	csel	w8, w8, w10, gt
    14a0: 1a9fb7ea     	cset	w10, ge
    14a4: 390243eb     	strb	w11, [sp, #0x90]
    14a8: b90097e8     	str	w8, [sp, #0x94]
    14ac: 390233ea     	strb	w10, [sp, #0x8c]
    14b0: b9008bff     	str	wzr, [sp, #0x88]
    14b4: 4b090188     	sub	w8, w12, w9
    14b8: 7100093f     	cmp	w9, #0x2
    14bc: a9043bfc     	stp	x28, x14, [sp, #0x40]
    14c0: 1a8dc108     	csel	w8, w8, w13, gt
    14c4: a90357f4     	stp	x20, x21, [sp, #0x30]
    14c8: b90087e8     	str	w8, [sp, #0x84]
    14cc: d10103a8     	sub	x8, x29, #0x40
    14d0: 04685fe8     	addspl	x8, x8, #-0x1
    14d4: a9014ff8     	stp	x24, x19, [sp, #0x10]
    14d8: a90223f9     	stp	x25, x8, [sp, #0x20]
    14dc: a9006bfb     	stp	x27, x26, [sp]
    14e0: d503427f     	smstop	sm
    14e4: 910273e3     	add	x3, sp, #0x9c
    14e8: 910213e4     	add	x4, sp, #0x84
    14ec: 910223e5     	add	x5, sp, #0x88
    14f0: 910303e6     	add	x6, sp, #0xc0
    14f4: 910323e7     	add	x7, sp, #0xc8
    14f8: aa1603e0     	mov	x0, x22
    14fc: 528001e1     	mov	w1, #0xf                // =15
    1500: aa1703e2     	mov	x2, x23
    1504: 97fffd33     	bl	0x9d0 <__kmpc_fork_call@plt>
    1508: 910283ee     	add	x14, sp, #0xa0
    150c: 5280004d     	mov	w13, #0x2               // =2
    1510: 5280008c     	mov	w12, #0x4               // =4
    1514: d503437f     	smstart	sm
    1518: b9408be8     	ldr	w8, [sp, #0x88]
    151c: 11000909     	add	w9, w8, #0x2
    1520: 7100091f     	cmp	w8, #0x2
    1524: b9008be9     	str	w9, [sp, #0x88]
    1528: 54fffc6b     	b.lt	0x14b4 <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd+0x2a8>
    152c: b9409be8     	ldr	w8, [sp, #0x98]
    1530: b940cbef     	ldr	w15, [sp, #0xc8]
    1534: 11200108     	add	w8, w8, #0x800
    1538: 6b0f011f     	cmp	w8, w15
    153c: b9009be8     	str	w8, [sp, #0x98]
    1540: 54fffa0b     	b.lt	0x1480 <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd+0x274>
    1544: d503427f     	smstop	sm
    1548: 97fffcfe     	bl	0x940 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
    154c: f90033e0     	str	x0, [sp, #0x60]
    1550: d503437f     	smstart	sm
    1554: 5280100a     	mov	w10, #0x80              // =128
    1558: 52820009     	mov	w9, #0x1000             // =4096
    155c: 2a1f03e8     	mov	w8, wzr
    1560: 29192be9     	stp	w9, w10, [sp, #0xc8]
    1564: a9472fea     	ldp	x10, x11, [sp, #0x70]
    1568: 5280008d     	mov	w13, #0x4               // =4
    156c: 5280004e     	mov	w14, #0x2               // =2
    1570: 910283ef     	add	x15, sp, #0xa0
    1574: 9102a3fc     	add	x28, sp, #0xa8
    1578: 910233f4     	add	x20, sp, #0x8c
    157c: 910253f6     	add	x22, sp, #0x94
    1580: a90babeb     	stp	x11, x10, [sp, #0xb8]
    1584: f94037eb     	ldr	x11, [sp, #0x68]
    1588: d2e7fe0a     	mov	x10, #0x3ff0000000000000 // =4607182418800017408
    158c: 910243f9     	add	x25, sp, #0x90
    1590: 910333f3     	add	x19, sp, #0xcc
    1594: 9102c3f8     	add	x24, sp, #0xb0
    1598: a90aafea     	stp	x10, x11, [sp, #0xa8]
    159c: d10103aa     	sub	x10, x29, #0x40
    15a0: 9102e3fa     	add	x26, sp, #0xb8
    15a4: 85bf1940     	ldr	p0, [x10, #-0x2, mul vl]
    15a8: 910263fb     	add	x27, sp, #0x98
    15ac: d0000095     	adrp	x21, 0x13000 <__FRAME_END__+0x1015c>
    15b0: 913602b5     	add	x21, x21, #0xd80
    15b4: 90000017     	adrp	x23, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0x2e8>
    15b8: 912352f7     	add	x23, x23, #0x8d4
    15bc: f90053ff     	str	xzr, [sp, #0xa0]
    15c0: 291337ff     	stp	wzr, w13, [sp, #0x98]
    15c4: e5bf1d40     	str	p0, [x10, #-0x1, mul vl]
    15c8: 1120010b     	add	w11, w8, #0x800
    15cc: 7100011f     	cmp	w8, #0x0
    15d0: 4b080128     	sub	w8, w9, w8
    15d4: 1a9f17ec     	cset	w12, eq
    15d8: 6b09017f     	cmp	w11, w9
    15dc: 52810009     	mov	w9, #0x800              // =2048
    15e0: 2a1f03ea     	mov	w10, wzr
    15e4: 1a89c108     	csel	w8, w8, w9, gt
    15e8: 1a9fb7e9     	cset	w9, ge
    15ec: 390243ec     	strb	w12, [sp, #0x90]
    15f0: b90097e8     	str	w8, [sp, #0x94]
    15f4: 390233e9     	strb	w9, [sp, #0x8c]
    15f8: b9008bff     	str	wzr, [sp, #0x88]
    15fc: 4b0a01a8     	sub	w8, w13, w10
    1600: 7100095f     	cmp	w10, #0x2
    1604: a9043ffc     	stp	x28, x15, [sp, #0x40]
    1608: 1a8ec108     	csel	w8, w8, w14, gt
    160c: a90353f6     	stp	x22, x20, [sp, #0x30]
    1610: b90087e8     	str	w8, [sp, #0x84]
    1614: d10103a8     	sub	x8, x29, #0x40
    1618: 04685fe8     	addspl	x8, x8, #-0x1
    161c: a9014ff8     	stp	x24, x19, [sp, #0x10]
    1620: a90223f9     	stp	x25, x8, [sp, #0x20]
    1624: a9006bfb     	stp	x27, x26, [sp]
    1628: d503427f     	smstop	sm
    162c: 910273e3     	add	x3, sp, #0x9c
    1630: 910213e4     	add	x4, sp, #0x84
    1634: 910223e5     	add	x5, sp, #0x88
    1638: 910303e6     	add	x6, sp, #0xc0
    163c: 910323e7     	add	x7, sp, #0xc8
    1640: aa1503e0     	mov	x0, x21
    1644: 528001e1     	mov	w1, #0xf                // =15
    1648: aa1703e2     	mov	x2, x23
    164c: 97fffce1     	bl	0x9d0 <__kmpc_fork_call@plt>
    1650: 910283ef     	add	x15, sp, #0xa0
    1654: 5280004e     	mov	w14, #0x2               // =2
    1658: 5280008d     	mov	w13, #0x4               // =4
    165c: d503437f     	smstart	sm
    1660: b9408be8     	ldr	w8, [sp, #0x88]
    1664: 1100090a     	add	w10, w8, #0x2
    1668: 7100091f     	cmp	w8, #0x2
    166c: b9008bea     	str	w10, [sp, #0x88]
    1670: 54fffc6b     	b.lt	0x15fc <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd+0x3f0>
    1674: b9409be8     	ldr	w8, [sp, #0x98]
    1678: b940cbe9     	ldr	w9, [sp, #0xc8]
    167c: 11200108     	add	w8, w8, #0x800
    1680: 6b09011f     	cmp	w8, w9
    1684: b9009be8     	str	w8, [sp, #0x98]
    1688: 54fffa0b     	b.lt	0x15c8 <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd+0x3bc>
    168c: d503427f     	smstop	sm
    1690: 97fffcac     	bl	0x940 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
    1694: aa0003f5     	mov	x21, x0
    1698: d503437f     	smstart	sm
    169c: d503427f     	smstop	sm
    16a0: f9403be0     	ldr	x0, [sp, #0x70]
    16a4: 97fffcbb     	bl	0x990 <_ZdaPv@plt>
    16a8: d503437f     	smstart	sm
    16ac: d503427f     	smstop	sm
    16b0: f9403fe0     	ldr	x0, [sp, #0x78]
    16b4: 97fffcb7     	bl	0x990 <_ZdaPv@plt>
    16b8: d503437f     	smstart	sm
    16bc: f94033e8     	ldr	x8, [sp, #0x60]
    16c0: cb0802a8     	sub	x8, x21, x8
    16c4: 9e620100     	scvtf	d0, x8
    16c8: fd003fe0     	str	d0, [sp, #0x78]
    16cc: d503427f     	smstop	sm
    16d0: fd403fe0     	ldr	d0, [sp, #0x78]
    16d4: 043f583f     	addsvl	sp, sp, #0x1
    16d8: 910343ff     	add	sp, sp, #0xd0
    16dc: a9494ff4     	ldp	x20, x19, [sp, #0x90]
    16e0: a94857f6     	ldp	x22, x21, [sp, #0x80]
    16e4: a9475ff8     	ldp	x24, x23, [sp, #0x70]
    16e8: a94667fa     	ldp	x26, x25, [sp, #0x60]
    16ec: a9456ffc     	ldp	x28, x27, [sp, #0x50]
    16f0: a9447bfd     	ldp	x29, x30, [sp, #0x40]
    16f4: 6d4323e9     	ldp	d9, d8, [sp, #0x30]
    16f8: 6d422beb     	ldp	d11, d10, [sp, #0x20]
    16fc: 6d4133ed     	ldp	d13, d12, [sp, #0x10]
    1700: 6cca3bef     	ldp	d15, d14, [sp], #0xa0
    1704: d65f03c0     	ret

0000000000001708 <_ZN4gemmIdE6pack_BEiiPKdPd>:
    1708: 53057c0a     	lsr	w10, w0, #5
    170c: 531b682b     	lsl	w11, w1, #5
    1710: 2a1f03e8     	mov	w8, wzr
    1714: aa1f03e9     	mov	x9, xzr
    1718: 2a0103ec     	mov	w12, w1
    171c: 528003ed     	mov	w13, #0x1f              // =31
    1720: 2a0d03ee     	mov	w14, w13
    1724: 2a0803ef     	mov	w15, w8
    1728: aa0c03f0     	mov	x16, x12
    172c: 51007dd1     	sub	w17, w14, #0x1f
    1730: 510079d2     	sub	w18, w14, #0x1e
    1734: f1000610     	subs	x16, x16, #0x1
    1738: fc71d840     	ldr	d0, [x2, w17, sxtw #3]
    173c: 8b2fcc71     	add	x17, x3, w15, sxtw #3
    1740: 110081ef     	add	w15, w15, #0x20
    1744: fd000220     	str	d0, [x17]
    1748: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    174c: 510075d2     	sub	w18, w14, #0x1d
    1750: fd000620     	str	d0, [x17, #0x8]
    1754: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1758: 510071d2     	sub	w18, w14, #0x1c
    175c: fd000a20     	str	d0, [x17, #0x10]
    1760: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1764: 51006dd2     	sub	w18, w14, #0x1b
    1768: fd000e20     	str	d0, [x17, #0x18]
    176c: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1770: 510069d2     	sub	w18, w14, #0x1a
    1774: fd001220     	str	d0, [x17, #0x20]
    1778: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    177c: 510065d2     	sub	w18, w14, #0x19
    1780: fd001620     	str	d0, [x17, #0x28]
    1784: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1788: 510061d2     	sub	w18, w14, #0x18
    178c: fd001a20     	str	d0, [x17, #0x30]
    1790: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1794: 51005dd2     	sub	w18, w14, #0x17
    1798: fd001e20     	str	d0, [x17, #0x38]
    179c: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    17a0: 510059d2     	sub	w18, w14, #0x16
    17a4: fd002220     	str	d0, [x17, #0x40]
    17a8: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    17ac: 510055d2     	sub	w18, w14, #0x15
    17b0: fd002620     	str	d0, [x17, #0x48]
    17b4: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    17b8: 510051d2     	sub	w18, w14, #0x14
    17bc: fd002a20     	str	d0, [x17, #0x50]
    17c0: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    17c4: 51004dd2     	sub	w18, w14, #0x13
    17c8: fd002e20     	str	d0, [x17, #0x58]
    17cc: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    17d0: 510049d2     	sub	w18, w14, #0x12
    17d4: fd003220     	str	d0, [x17, #0x60]
    17d8: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    17dc: 510045d2     	sub	w18, w14, #0x11
    17e0: fd003620     	str	d0, [x17, #0x68]
    17e4: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    17e8: 510041d2     	sub	w18, w14, #0x10
    17ec: fd003a20     	str	d0, [x17, #0x70]
    17f0: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    17f4: 51003dd2     	sub	w18, w14, #0xf
    17f8: fd003e20     	str	d0, [x17, #0x78]
    17fc: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1800: 510039d2     	sub	w18, w14, #0xe
    1804: fd004220     	str	d0, [x17, #0x80]
    1808: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    180c: 510035d2     	sub	w18, w14, #0xd
    1810: fd004620     	str	d0, [x17, #0x88]
    1814: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1818: 510031d2     	sub	w18, w14, #0xc
    181c: fd004a20     	str	d0, [x17, #0x90]
    1820: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1824: 51002dd2     	sub	w18, w14, #0xb
    1828: fd004e20     	str	d0, [x17, #0x98]
    182c: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1830: 510029d2     	sub	w18, w14, #0xa
    1834: fd005220     	str	d0, [x17, #0xa0]
    1838: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    183c: 510025d2     	sub	w18, w14, #0x9
    1840: fd005620     	str	d0, [x17, #0xa8]
    1844: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1848: 510021d2     	sub	w18, w14, #0x8
    184c: fd005a20     	str	d0, [x17, #0xb0]
    1850: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1854: 51001dd2     	sub	w18, w14, #0x7
    1858: fd005e20     	str	d0, [x17, #0xb8]
    185c: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1860: 510019d2     	sub	w18, w14, #0x6
    1864: fd006220     	str	d0, [x17, #0xc0]
    1868: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    186c: 510015d2     	sub	w18, w14, #0x5
    1870: fd006620     	str	d0, [x17, #0xc8]
    1874: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1878: 510011d2     	sub	w18, w14, #0x4
    187c: fd006a20     	str	d0, [x17, #0xd0]
    1880: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1884: 51000dd2     	sub	w18, w14, #0x3
    1888: fd006e20     	str	d0, [x17, #0xd8]
    188c: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1890: 510009d2     	sub	w18, w14, #0x2
    1894: fd007220     	str	d0, [x17, #0xe0]
    1898: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    189c: 510005d2     	sub	w18, w14, #0x1
    18a0: fd007620     	str	d0, [x17, #0xe8]
    18a4: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    18a8: fd007a20     	str	d0, [x17, #0xf0]
    18ac: fc6ed840     	ldr	d0, [x2, w14, sxtw #3]
    18b0: 0b0001ce     	add	w14, w14, w0
    18b4: fd007e20     	str	d0, [x17, #0xf8]
    18b8: 54fff3a1     	b.ne	0x172c <_ZN4gemmIdE6pack_BEiiPKdPd+0x24>
    18bc: 91000529     	add	x9, x9, #0x1
    18c0: 0b0b0108     	add	w8, w8, w11
    18c4: 110081ad     	add	w13, w13, #0x20
    18c8: eb0a013f     	cmp	x9, x10
    18cc: 54fff2a1     	b.ne	0x1720 <_ZN4gemmIdE6pack_BEiiPKdPd+0x18>
    18d0: d65f03c0     	ret

00000000000018d4 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined>:
    18d4: d10243ff     	sub	sp, sp, #0x90
    18d8: a9037bfd     	stp	x29, x30, [sp, #0x30]
    18dc: a9046ffc     	stp	x28, x27, [sp, #0x40]
    18e0: a90567fa     	stp	x26, x25, [sp, #0x50]
    18e4: a9065ff8     	stp	x24, x23, [sp, #0x60]
    18e8: a90757f6     	stp	x22, x21, [sp, #0x70]
    18ec: a9084ff4     	stp	x20, x19, [sp, #0x80]
    18f0: 9100c3fd     	add	x29, sp, #0x30
    18f4: b9400048     	ldr	w8, [x2]
    18f8: 71000519     	subs	w25, w8, #0x1
    18fc: 540069eb     	b.lt	0x2638 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xd64>
    1900: b9400001     	ldr	w1, [x0]
    1904: aa0703f3     	mov	x19, x7
    1908: aa0603f4     	mov	x20, x6
    190c: aa0503f5     	mov	x21, x5
    1910: aa0403f6     	mov	x22, x4
    1914: aa0303f7     	mov	x23, x3
    1918: 52800028     	mov	w8, #0x1                // =1
    191c: d0000080     	adrp	x0, 0x13000 <__FRAME_END__+0x1015c>
    1920: 9135a000     	add	x0, x0, #0xd68
    1924: d10043a3     	sub	x3, x29, #0x10
    1928: d10013a4     	sub	x4, x29, #0x4
    192c: d10023a5     	sub	x5, x29, #0x8
    1930: d10033a6     	sub	x6, x29, #0xc
    1934: 52800442     	mov	w2, #0x22               // =34
    1938: 52800027     	mov	w7, #0x1                // =1
    193c: 293f7fb9     	stp	w25, wzr, [x29, #-0x8]
    1940: 293e23bf     	stp	wzr, w8, [x29, #-0x10]
    1944: b90017e1     	str	w1, [sp, #0x14]
    1948: b90003e8     	str	w8, [sp]
    194c: 97fffc19     	bl	0x9b0 <__kmpc_for_static_init_4@plt>
    1950: 297f23a9     	ldp	w9, w8, [x29, #-0x8]
    1954: 6b19013f     	cmp	w9, w25
    1958: 1a99b12e     	csel	w14, w9, w25, lt
    195c: 6b0e011f     	cmp	w8, w14
    1960: b81f83ae     	stur	w14, [x29, #-0x8]
    1964: 5400662c     	b.gt	0x2628 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xd54>
    1968: b94002ec     	ldr	w12, [x23]
    196c: 7100059f     	cmp	w12, #0x1
    1970: 540065cb     	b.lt	0x2628 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xd54>
    1974: 25d8e3e0     	ptrue	p0.d
    1978: a9492bab     	ldp	x11, x10, [x29, #0x90]
    197c: a94807a2     	ldp	x2, x1, [x29, #0x80]
    1980: 25f8c000     	mov	z0.d, #0x0              // =0
    1984: a94743b1     	ldp	x17, x16, [x29, #0x70]
    1988: f94053a9     	ldr	x9, [x29, #0xa0]
    198c: a9464ba0     	ldp	x0, x18, [x29, #0x60]
    1990: f9000fe9     	str	x9, [sp, #0x18]
    1994: 14000005     	b	0x19a8 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xd4>
    1998: b85f83ae     	ldur	w14, [x29, #-0x8]
    199c: 6b0e011f     	cmp	w8, w14
    19a0: 11000508     	add	w8, w8, #0x1
    19a4: 5400642a     	b.ge	0x2628 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xd54>
    19a8: 7100059f     	cmp	w12, #0x1
    19ac: 54ffff8b     	b.lt	0x199c <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xc8>
    19b0: 531c6d03     	lsl	w3, w8, #4
    19b4: 2a1f03e4     	mov	w4, wzr
    19b8: 140001a5     	b	0x204c <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x778>
    19bc: 85800041     	ldr	p1, [x2]
    19c0: f9400fe9     	ldr	x9, [sp, #0x18]
    19c4: 2a1f03ee     	mov	w14, wzr
    19c8: 85c0e142     	ld1rd	{ z2.d }, p0/z, [x10]
    19cc: 5280002f     	mov	w15, #0x1               // =1
    19d0: 8b0600ec     	add	x12, x7, x6
    19d4: 85c0e121     	ld1rd	{ z1.d }, p0/z, [x9]
    19d8: 5280004d     	mov	w13, #0x2               // =2
    19dc: c0c24403     	mov	z3.d, p1/m, za0h.d[w14, 0]
    19e0: c0c24444     	mov	z4.d, p1/m, za1h.d[w14, 0]
    19e4: c0c24485     	mov	z5.d, p1/m, za2h.d[w14, 0]
    19e8: c0c244c6     	mov	z6.d, p1/m, za3h.d[w14, 0]
    19ec: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    19f0: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    19f4: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    19f8: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    19fc: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1a00: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1a04: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1a08: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1a0c: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1a10: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1a14: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1a18: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1a1c: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1a20: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1a24: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1a28: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1a2c: e5e0e4e3     	st1d	{ z3.d }, p1, [x7]
    1a30: e5e1e4e4     	st1d	{ z4.d }, p1, [x7, #0x1, mul vl]
    1a34: e5e2e4e5     	st1d	{ z5.d }, p1, [x7, #0x2, mul vl]
    1a38: e5e3e4e6     	st1d	{ z6.d }, p1, [x7, #0x3, mul vl]
    1a3c: c0c26403     	mov	z3.d, p1/m, za0h.d[w15, 0]
    1a40: c0c26444     	mov	z4.d, p1/m, za1h.d[w15, 0]
    1a44: c0c26485     	mov	z5.d, p1/m, za2h.d[w15, 0]
    1a48: c0c264c6     	mov	z6.d, p1/m, za3h.d[w15, 0]
    1a4c: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1a50: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1a54: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1a58: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1a5c: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1a60: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1a64: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1a68: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1a6c: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1a70: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1a74: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1a78: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1a7c: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1a80: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1a84: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1a88: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1a8c: e5e544e3     	st1d	{ z3.d }, p1, [x7, x5, lsl #3]
    1a90: 8b060187     	add	x7, x12, x6
    1a94: e5e1e584     	st1d	{ z4.d }, p1, [x12, #0x1, mul vl]
    1a98: e5e2e585     	st1d	{ z5.d }, p1, [x12, #0x2, mul vl]
    1a9c: e5e3e586     	st1d	{ z6.d }, p1, [x12, #0x3, mul vl]
    1aa0: c0c22403     	mov	z3.d, p1/m, za0h.d[w13, 0]
    1aa4: c0c22444     	mov	z4.d, p1/m, za1h.d[w13, 0]
    1aa8: c0c22485     	mov	z5.d, p1/m, za2h.d[w13, 0]
    1aac: c0c224c6     	mov	z6.d, p1/m, za3h.d[w13, 0]
    1ab0: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1ab4: 5280008d     	mov	w13, #0x4               // =4
    1ab8: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1abc: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1ac0: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1ac4: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1ac8: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1acc: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1ad0: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1ad4: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1ad8: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1adc: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1ae0: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1ae4: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1ae8: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1aec: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1af0: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1af4: e5e54583     	st1d	{ z3.d }, p1, [x12, x5, lsl #3]
    1af8: 5280006c     	mov	w12, #0x3               // =3
    1afc: e5e1e4e4     	st1d	{ z4.d }, p1, [x7, #0x1, mul vl]
    1b00: e5e2e4e5     	st1d	{ z5.d }, p1, [x7, #0x2, mul vl]
    1b04: e5e3e4e6     	st1d	{ z6.d }, p1, [x7, #0x3, mul vl]
    1b08: c0c20403     	mov	z3.d, p1/m, za0h.d[w12, 0]
    1b0c: c0c20444     	mov	z4.d, p1/m, za1h.d[w12, 0]
    1b10: c0c20485     	mov	z5.d, p1/m, za2h.d[w12, 0]
    1b14: c0c204c6     	mov	z6.d, p1/m, za3h.d[w12, 0]
    1b18: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1b1c: 8b0600ec     	add	x12, x7, x6
    1b20: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1b24: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1b28: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1b2c: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1b30: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1b34: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1b38: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1b3c: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1b40: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1b44: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1b48: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1b4c: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1b50: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1b54: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1b58: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1b5c: e5e544e3     	st1d	{ z3.d }, p1, [x7, x5, lsl #3]
    1b60: 8b060187     	add	x7, x12, x6
    1b64: e5e1e584     	st1d	{ z4.d }, p1, [x12, #0x1, mul vl]
    1b68: e5e2e585     	st1d	{ z5.d }, p1, [x12, #0x2, mul vl]
    1b6c: e5e3e586     	st1d	{ z6.d }, p1, [x12, #0x3, mul vl]
    1b70: c0c22403     	mov	z3.d, p1/m, za0h.d[w13, 0]
    1b74: c0c22444     	mov	z4.d, p1/m, za1h.d[w13, 0]
    1b78: c0c22485     	mov	z5.d, p1/m, za2h.d[w13, 0]
    1b7c: c0c224c6     	mov	z6.d, p1/m, za3h.d[w13, 0]
    1b80: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1b84: 528000cd     	mov	w13, #0x6               // =6
    1b88: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1b8c: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1b90: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1b94: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1b98: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1b9c: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1ba0: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1ba4: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1ba8: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1bac: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1bb0: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1bb4: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1bb8: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1bbc: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1bc0: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1bc4: e5e54583     	st1d	{ z3.d }, p1, [x12, x5, lsl #3]
    1bc8: 528000ac     	mov	w12, #0x5               // =5
    1bcc: e5e1e4e4     	st1d	{ z4.d }, p1, [x7, #0x1, mul vl]
    1bd0: e5e2e4e5     	st1d	{ z5.d }, p1, [x7, #0x2, mul vl]
    1bd4: e5e3e4e6     	st1d	{ z6.d }, p1, [x7, #0x3, mul vl]
    1bd8: c0c20403     	mov	z3.d, p1/m, za0h.d[w12, 0]
    1bdc: c0c20444     	mov	z4.d, p1/m, za1h.d[w12, 0]
    1be0: c0c20485     	mov	z5.d, p1/m, za2h.d[w12, 0]
    1be4: c0c204c6     	mov	z6.d, p1/m, za3h.d[w12, 0]
    1be8: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1bec: 8b0600ec     	add	x12, x7, x6
    1bf0: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1bf4: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1bf8: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1bfc: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1c00: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1c04: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1c08: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1c0c: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1c10: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1c14: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1c18: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1c1c: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1c20: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1c24: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1c28: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1c2c: e5e544e3     	st1d	{ z3.d }, p1, [x7, x5, lsl #3]
    1c30: 8b060187     	add	x7, x12, x6
    1c34: e5e1e584     	st1d	{ z4.d }, p1, [x12, #0x1, mul vl]
    1c38: e5e2e585     	st1d	{ z5.d }, p1, [x12, #0x2, mul vl]
    1c3c: e5e3e586     	st1d	{ z6.d }, p1, [x12, #0x3, mul vl]
    1c40: c0c22403     	mov	z3.d, p1/m, za0h.d[w13, 0]
    1c44: c0c22444     	mov	z4.d, p1/m, za1h.d[w13, 0]
    1c48: c0c22485     	mov	z5.d, p1/m, za2h.d[w13, 0]
    1c4c: c0c224c6     	mov	z6.d, p1/m, za3h.d[w13, 0]
    1c50: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1c54: 528000ed     	mov	w13, #0x7               // =7
    1c58: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1c5c: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1c60: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1c64: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1c68: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1c6c: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1c70: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1c74: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1c78: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1c7c: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1c80: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1c84: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1c88: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1c8c: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1c90: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1c94: e5e54583     	st1d	{ z3.d }, p1, [x12, x5, lsl #3]
    1c98: 8b0600ec     	add	x12, x7, x6
    1c9c: e5e1e4e4     	st1d	{ z4.d }, p1, [x7, #0x1, mul vl]
    1ca0: e5e2e4e5     	st1d	{ z5.d }, p1, [x7, #0x2, mul vl]
    1ca4: e5e3e4e6     	st1d	{ z6.d }, p1, [x7, #0x3, mul vl]
    1ca8: c0c22403     	mov	z3.d, p1/m, za0h.d[w13, 0]
    1cac: c0c22444     	mov	z4.d, p1/m, za1h.d[w13, 0]
    1cb0: c0c22485     	mov	z5.d, p1/m, za2h.d[w13, 0]
    1cb4: c0c224c6     	mov	z6.d, p1/m, za3h.d[w13, 0]
    1cb8: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1cbc: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1cc0: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1cc4: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1cc8: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1ccc: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1cd0: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1cd4: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1cd8: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1cdc: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1ce0: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1ce4: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1ce8: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1cec: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1cf0: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1cf4: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1cf8: e5e544e3     	st1d	{ z3.d }, p1, [x7, x5, lsl #3]
    1cfc: e5e1e584     	st1d	{ z4.d }, p1, [x12, #0x1, mul vl]
    1d00: e5e2e585     	st1d	{ z5.d }, p1, [x12, #0x2, mul vl]
    1d04: e5e3e586     	st1d	{ z6.d }, p1, [x12, #0x3, mul vl]
    1d08: c0c24503     	mov	z3.d, p1/m, za4h.d[w14, 0]
    1d0c: c0c24544     	mov	z4.d, p1/m, za5h.d[w14, 0]
    1d10: c0c24585     	mov	z5.d, p1/m, za6h.d[w14, 0]
    1d14: c0c245c6     	mov	z6.d, p1/m, za7h.d[w14, 0]
    1d18: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1d1c: 8b06018e     	add	x14, x12, x6
    1d20: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1d24: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1d28: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1d2c: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1d30: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1d34: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1d38: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1d3c: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1d40: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1d44: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1d48: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1d4c: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1d50: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1d54: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1d58: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1d5c: e5e54583     	st1d	{ z3.d }, p1, [x12, x5, lsl #3]
    1d60: 8b0601cc     	add	x12, x14, x6
    1d64: e5e1e5c4     	st1d	{ z4.d }, p1, [x14, #0x1, mul vl]
    1d68: e5e2e5c5     	st1d	{ z5.d }, p1, [x14, #0x2, mul vl]
    1d6c: e5e3e5c6     	st1d	{ z6.d }, p1, [x14, #0x3, mul vl]
    1d70: c0c26503     	mov	z3.d, p1/m, za4h.d[w15, 0]
    1d74: c0c26544     	mov	z4.d, p1/m, za5h.d[w15, 0]
    1d78: c0c26585     	mov	z5.d, p1/m, za6h.d[w15, 0]
    1d7c: c0c265c6     	mov	z6.d, p1/m, za7h.d[w15, 0]
    1d80: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1d84: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1d88: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1d8c: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1d90: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1d94: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1d98: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1d9c: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1da0: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1da4: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1da8: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1dac: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1db0: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1db4: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1db8: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1dbc: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1dc0: e5e545c3     	st1d	{ z3.d }, p1, [x14, x5, lsl #3]
    1dc4: 5280004e     	mov	w14, #0x2               // =2
    1dc8: e5e1e584     	st1d	{ z4.d }, p1, [x12, #0x1, mul vl]
    1dcc: e5e2e585     	st1d	{ z5.d }, p1, [x12, #0x2, mul vl]
    1dd0: e5e3e586     	st1d	{ z6.d }, p1, [x12, #0x3, mul vl]
    1dd4: c0c24503     	mov	z3.d, p1/m, za4h.d[w14, 0]
    1dd8: c0c24544     	mov	z4.d, p1/m, za5h.d[w14, 0]
    1ddc: c0c24585     	mov	z5.d, p1/m, za6h.d[w14, 0]
    1de0: c0c245c6     	mov	z6.d, p1/m, za7h.d[w14, 0]
    1de4: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1de8: 8b06018e     	add	x14, x12, x6
    1dec: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1df0: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1df4: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1df8: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1dfc: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1e00: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1e04: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1e08: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1e0c: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1e10: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1e14: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1e18: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1e1c: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1e20: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1e24: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1e28: e5e54583     	st1d	{ z3.d }, p1, [x12, x5, lsl #3]
    1e2c: 5280006c     	mov	w12, #0x3               // =3
    1e30: e5e1e5c4     	st1d	{ z4.d }, p1, [x14, #0x1, mul vl]
    1e34: e5e2e5c5     	st1d	{ z5.d }, p1, [x14, #0x2, mul vl]
    1e38: e5e3e5c6     	st1d	{ z6.d }, p1, [x14, #0x3, mul vl]
    1e3c: c0c20503     	mov	z3.d, p1/m, za4h.d[w12, 0]
    1e40: c0c20544     	mov	z4.d, p1/m, za5h.d[w12, 0]
    1e44: c0c20585     	mov	z5.d, p1/m, za6h.d[w12, 0]
    1e48: c0c205c6     	mov	z6.d, p1/m, za7h.d[w12, 0]
    1e4c: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1e50: 8b0601cc     	add	x12, x14, x6
    1e54: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1e58: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1e5c: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1e60: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1e64: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1e68: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1e6c: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1e70: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1e74: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1e78: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1e7c: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1e80: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1e84: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1e88: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1e8c: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1e90: e5e545c3     	st1d	{ z3.d }, p1, [x14, x5, lsl #3]
    1e94: 5280008e     	mov	w14, #0x4               // =4
    1e98: e5e1e584     	st1d	{ z4.d }, p1, [x12, #0x1, mul vl]
    1e9c: e5e2e585     	st1d	{ z5.d }, p1, [x12, #0x2, mul vl]
    1ea0: e5e3e586     	st1d	{ z6.d }, p1, [x12, #0x3, mul vl]
    1ea4: c0c24503     	mov	z3.d, p1/m, za4h.d[w14, 0]
    1ea8: c0c24544     	mov	z4.d, p1/m, za5h.d[w14, 0]
    1eac: c0c24585     	mov	z5.d, p1/m, za6h.d[w14, 0]
    1eb0: c0c245c6     	mov	z6.d, p1/m, za7h.d[w14, 0]
    1eb4: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1eb8: 8b06018e     	add	x14, x12, x6
    1ebc: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1ec0: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1ec4: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1ec8: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1ecc: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1ed0: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1ed4: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1ed8: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1edc: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1ee0: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1ee4: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1ee8: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1eec: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1ef0: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1ef4: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1ef8: e5e54583     	st1d	{ z3.d }, p1, [x12, x5, lsl #3]
    1efc: 528000ac     	mov	w12, #0x5               // =5
    1f00: e5e1e5c4     	st1d	{ z4.d }, p1, [x14, #0x1, mul vl]
    1f04: e5e2e5c5     	st1d	{ z5.d }, p1, [x14, #0x2, mul vl]
    1f08: e5e3e5c6     	st1d	{ z6.d }, p1, [x14, #0x3, mul vl]
    1f0c: c0c20503     	mov	z3.d, p1/m, za4h.d[w12, 0]
    1f10: c0c20544     	mov	z4.d, p1/m, za5h.d[w12, 0]
    1f14: c0c20585     	mov	z5.d, p1/m, za6h.d[w12, 0]
    1f18: c0c205c6     	mov	z6.d, p1/m, za7h.d[w12, 0]
    1f1c: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1f20: 8b0601cc     	add	x12, x14, x6
    1f24: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1f28: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1f2c: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1f30: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1f34: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1f38: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1f3c: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1f40: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1f44: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1f48: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1f4c: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1f50: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1f54: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1f58: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1f5c: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1f60: e5e545c3     	st1d	{ z3.d }, p1, [x14, x5, lsl #3]
    1f64: 528000ce     	mov	w14, #0x6               // =6
    1f68: e5e1e584     	st1d	{ z4.d }, p1, [x12, #0x1, mul vl]
    1f6c: e5e2e585     	st1d	{ z5.d }, p1, [x12, #0x2, mul vl]
    1f70: e5e3e586     	st1d	{ z6.d }, p1, [x12, #0x3, mul vl]
    1f74: c0c24503     	mov	z3.d, p1/m, za4h.d[w14, 0]
    1f78: c0c24544     	mov	z4.d, p1/m, za5h.d[w14, 0]
    1f7c: c0c24585     	mov	z5.d, p1/m, za6h.d[w14, 0]
    1f80: c0c245c6     	mov	z6.d, p1/m, za7h.d[w14, 0]
    1f84: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1f88: 8b06018e     	add	x14, x12, x6
    1f8c: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1f90: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1f94: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1f98: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    1f9c: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    1fa0: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    1fa4: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    1fa8: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1fac: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1fb0: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1fb4: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1fb8: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    1fbc: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    1fc0: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    1fc4: 65c08426     	fadd	z6.d, p1/m, z6.d, z1.d
    1fc8: e5e54583     	st1d	{ z3.d }, p1, [x12, x5, lsl #3]
    1fcc: 8b0601cc     	add	x12, x14, x6
    1fd0: e5e1e5c4     	st1d	{ z4.d }, p1, [x14, #0x1, mul vl]
    1fd4: e5e2e5c5     	st1d	{ z5.d }, p1, [x14, #0x2, mul vl]
    1fd8: e5e3e5c6     	st1d	{ z6.d }, p1, [x14, #0x3, mul vl]
    1fdc: c0c22503     	mov	z3.d, p1/m, za4h.d[w13, 0]
    1fe0: c0c22544     	mov	z4.d, p1/m, za5h.d[w13, 0]
    1fe4: c0c22585     	mov	z5.d, p1/m, za6h.d[w13, 0]
    1fe8: c0c225c6     	mov	z6.d, p1/m, za7h.d[w13, 0]
    1fec: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1ff0: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1ff4: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1ff8: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1ffc: 65ca8443     	fmulx	z3.d, p1/m, z3.d, z2.d
    2000: 65ca8444     	fmulx	z4.d, p1/m, z4.d, z2.d
    2004: 65ca8445     	fmulx	z5.d, p1/m, z5.d, z2.d
    2008: 65ca8446     	fmulx	z6.d, p1/m, z6.d, z2.d
    200c: 05e0c462     	sel	z2.d, p1, z3.d, z0.d
    2010: 05e0c483     	sel	z3.d, p1, z4.d, z0.d
    2014: 05e0c4a4     	sel	z4.d, p1, z5.d, z0.d
    2018: 05e0c4c5     	sel	z5.d, p1, z6.d, z0.d
    201c: 65c08422     	fadd	z2.d, p1/m, z2.d, z1.d
    2020: 65c08423     	fadd	z3.d, p1/m, z3.d, z1.d
    2024: 65c08424     	fadd	z4.d, p1/m, z4.d, z1.d
    2028: 65c08425     	fadd	z5.d, p1/m, z5.d, z1.d
    202c: e5e545c2     	st1d	{ z2.d }, p1, [x14, x5, lsl #3]
    2030: e5e1e583     	st1d	{ z3.d }, p1, [x12, #0x1, mul vl]
    2034: e5e2e584     	st1d	{ z4.d }, p1, [x12, #0x2, mul vl]
    2038: e5e3e585     	st1d	{ z5.d }, p1, [x12, #0x3, mul vl]
    203c: b94002ec     	ldr	w12, [x23]
    2040: 11000484     	add	w4, w4, #0x1
    2044: 6b0c009f     	cmp	w4, w12
    2048: 54ffca8a     	b.ge	0x1998 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xc4>
    204c: b980023b     	ldrsw	x27, [x17]
    2050: b94002cc     	ldr	w12, [x22]
    2054: f9400246     	ldr	x6, [x18]
    2058: f94002a9     	ldr	x9, [x21]
    205c: b9400299     	ldr	w25, [x20]
    2060: 3940021c     	ldrb	w28, [x16]
    2064: 1b1b7c6e     	mul	w14, w3, w27
    2068: 0b040185     	add	w5, w12, w4
    206c: b940027a     	ldr	w26, [x19]
    2070: 531b68a7     	lsl	w7, w5, #5
    2074: 8b2ecccc     	add	x12, x6, w14, sxtw #3
    2078: f9400006     	ldr	x6, [x0]
    207c: 8b27cd87     	add	x7, x12, w7, sxtw #3
    2080: 340000dc     	cbz	w28, 0x2098 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x7c4>
    2084: c00800ff     	zero	{za}
    2088: b940002c     	ldr	w12, [x1]
    208c: 7100059f     	cmp	w12, #0x1
    2090: 5400144a     	b.ge	0x2318 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xa44>
    2094: 140000ba     	b	0x237c <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xaa8>
    2098: 85800041     	ldr	p1, [x2]
    209c: d37df37c     	lsl	x28, x27, #3
    20a0: 2a1f03ec     	mov	w12, wzr
    20a4: 5280002f     	mov	w15, #0x1               // =1
    20a8: 5280004d     	mov	w13, #0x2               // =2
    20ac: 5280006e     	mov	w14, #0x3               // =3
    20b0: 8b1c00fe     	add	x30, x7, x28
    20b4: a5e0a4e1     	ld1d	{ z1.d }, p1/z, [x7]
    20b8: a5e1a4e2     	ld1d	{ z2.d }, p1/z, [x7, #0x1, mul vl]
    20bc: a5e2a4e3     	ld1d	{ z3.d }, p1/z, [x7, #0x2, mul vl]
    20c0: a5e3a4e4     	ld1d	{ z4.d }, p1/z, [x7, #0x3, mul vl]
    20c4: 8b1c03d8     	add	x24, x30, x28
    20c8: c0c00420     	mov	za0h.d[w12, 0], p1/m, z1.d
    20cc: c0c00442     	mov	za1h.d[w12, 0], p1/m, z2.d
    20d0: c0c00464     	mov	za2h.d[w12, 0], p1/m, z3.d
    20d4: c0c00486     	mov	za3h.d[w12, 0], p1/m, z4.d
    20d8: a5fb44e1     	ld1d	{ z1.d }, p1/z, [x7, x27, lsl #3]
    20dc: a5e1a7c2     	ld1d	{ z2.d }, p1/z, [x30, #0x1, mul vl]
    20e0: a5e2a7c3     	ld1d	{ z3.d }, p1/z, [x30, #0x2, mul vl]
    20e4: a5e3a7c4     	ld1d	{ z4.d }, p1/z, [x30, #0x3, mul vl]
    20e8: c0c06420     	mov	za0h.d[w15, 0], p1/m, z1.d
    20ec: c0c06442     	mov	za1h.d[w15, 0], p1/m, z2.d
    20f0: c0c06464     	mov	za2h.d[w15, 0], p1/m, z3.d
    20f4: c0c06486     	mov	za3h.d[w15, 0], p1/m, z4.d
    20f8: a5fb47c1     	ld1d	{ z1.d }, p1/z, [x30, x27, lsl #3]
    20fc: a5e1a702     	ld1d	{ z2.d }, p1/z, [x24, #0x1, mul vl]
    2100: a5e2a703     	ld1d	{ z3.d }, p1/z, [x24, #0x2, mul vl]
    2104: a5e3a704     	ld1d	{ z4.d }, p1/z, [x24, #0x3, mul vl]
    2108: 8b1c031e     	add	x30, x24, x28
    210c: c0c02420     	mov	za0h.d[w13, 0], p1/m, z1.d
    2110: c0c02442     	mov	za1h.d[w13, 0], p1/m, z2.d
    2114: c0c02464     	mov	za2h.d[w13, 0], p1/m, z3.d
    2118: c0c02486     	mov	za3h.d[w13, 0], p1/m, z4.d
    211c: a5fb4701     	ld1d	{ z1.d }, p1/z, [x24, x27, lsl #3]
    2120: a5e1a7c2     	ld1d	{ z2.d }, p1/z, [x30, #0x1, mul vl]
    2124: a5e2a7c3     	ld1d	{ z3.d }, p1/z, [x30, #0x2, mul vl]
    2128: a5e3a7c4     	ld1d	{ z4.d }, p1/z, [x30, #0x3, mul vl]
    212c: 8b1c03d8     	add	x24, x30, x28
    2130: 5280008d     	mov	w13, #0x4               // =4
    2134: c0c04420     	mov	za0h.d[w14, 0], p1/m, z1.d
    2138: c0c04442     	mov	za1h.d[w14, 0], p1/m, z2.d
    213c: c0c04464     	mov	za2h.d[w14, 0], p1/m, z3.d
    2140: c0c04486     	mov	za3h.d[w14, 0], p1/m, z4.d
    2144: a5fb47c1     	ld1d	{ z1.d }, p1/z, [x30, x27, lsl #3]
    2148: a5e1a702     	ld1d	{ z2.d }, p1/z, [x24, #0x1, mul vl]
    214c: a5e2a703     	ld1d	{ z3.d }, p1/z, [x24, #0x2, mul vl]
    2150: a5e3a704     	ld1d	{ z4.d }, p1/z, [x24, #0x3, mul vl]
    2154: 8b1c031e     	add	x30, x24, x28
    2158: c0c02420     	mov	za0h.d[w13, 0], p1/m, z1.d
    215c: c0c02442     	mov	za1h.d[w13, 0], p1/m, z2.d
    2160: c0c02464     	mov	za2h.d[w13, 0], p1/m, z3.d
    2164: c0c02486     	mov	za3h.d[w13, 0], p1/m, z4.d
    2168: a5fb4701     	ld1d	{ z1.d }, p1/z, [x24, x27, lsl #3]
    216c: a5e1a7c2     	ld1d	{ z2.d }, p1/z, [x30, #0x1, mul vl]
    2170: a5e2a7c3     	ld1d	{ z3.d }, p1/z, [x30, #0x2, mul vl]
    2174: a5e3a7c4     	ld1d	{ z4.d }, p1/z, [x30, #0x3, mul vl]
    2178: 8b1c03d8     	add	x24, x30, x28
    217c: 528000ad     	mov	w13, #0x5               // =5
    2180: c0c02420     	mov	za0h.d[w13, 0], p1/m, z1.d
    2184: c0c02442     	mov	za1h.d[w13, 0], p1/m, z2.d
    2188: c0c02464     	mov	za2h.d[w13, 0], p1/m, z3.d
    218c: c0c02486     	mov	za3h.d[w13, 0], p1/m, z4.d
    2190: a5fb47c1     	ld1d	{ z1.d }, p1/z, [x30, x27, lsl #3]
    2194: a5e1a702     	ld1d	{ z2.d }, p1/z, [x24, #0x1, mul vl]
    2198: a5e2a703     	ld1d	{ z3.d }, p1/z, [x24, #0x2, mul vl]
    219c: a5e3a704     	ld1d	{ z4.d }, p1/z, [x24, #0x3, mul vl]
    21a0: 8b1c031e     	add	x30, x24, x28
    21a4: 528000cd     	mov	w13, #0x6               // =6
    21a8: c0c02420     	mov	za0h.d[w13, 0], p1/m, z1.d
    21ac: c0c02442     	mov	za1h.d[w13, 0], p1/m, z2.d
    21b0: c0c02464     	mov	za2h.d[w13, 0], p1/m, z3.d
    21b4: c0c02486     	mov	za3h.d[w13, 0], p1/m, z4.d
    21b8: a5fb4701     	ld1d	{ z1.d }, p1/z, [x24, x27, lsl #3]
    21bc: a5e1a7c2     	ld1d	{ z2.d }, p1/z, [x30, #0x1, mul vl]
    21c0: a5e2a7c3     	ld1d	{ z3.d }, p1/z, [x30, #0x2, mul vl]
    21c4: a5e3a7c4     	ld1d	{ z4.d }, p1/z, [x30, #0x3, mul vl]
    21c8: 8b1c03d8     	add	x24, x30, x28
    21cc: 528000ed     	mov	w13, #0x7               // =7
    21d0: c0c02420     	mov	za0h.d[w13, 0], p1/m, z1.d
    21d4: c0c02442     	mov	za1h.d[w13, 0], p1/m, z2.d
    21d8: c0c02464     	mov	za2h.d[w13, 0], p1/m, z3.d
    21dc: c0c02486     	mov	za3h.d[w13, 0], p1/m, z4.d
    21e0: a5fb47c1     	ld1d	{ z1.d }, p1/z, [x30, x27, lsl #3]
    21e4: a5e1a702     	ld1d	{ z2.d }, p1/z, [x24, #0x1, mul vl]
    21e8: a5e2a703     	ld1d	{ z3.d }, p1/z, [x24, #0x2, mul vl]
    21ec: a5e3a704     	ld1d	{ z4.d }, p1/z, [x24, #0x3, mul vl]
    21f0: 8b1c031e     	add	x30, x24, x28
    21f4: c0c00428     	mov	za4h.d[w12, 0], p1/m, z1.d
    21f8: c0c0044a     	mov	za5h.d[w12, 0], p1/m, z2.d
    21fc: c0c0046c     	mov	za6h.d[w12, 0], p1/m, z3.d
    2200: c0c0048e     	mov	za7h.d[w12, 0], p1/m, z4.d
    2204: a5fb4701     	ld1d	{ z1.d }, p1/z, [x24, x27, lsl #3]
    2208: a5e1a7c2     	ld1d	{ z2.d }, p1/z, [x30, #0x1, mul vl]
    220c: a5e2a7c3     	ld1d	{ z3.d }, p1/z, [x30, #0x2, mul vl]
    2210: a5e3a7c4     	ld1d	{ z4.d }, p1/z, [x30, #0x3, mul vl]
    2214: 8b1c03cc     	add	x12, x30, x28
    2218: 8b1c0198     	add	x24, x12, x28
    221c: c0c06428     	mov	za4h.d[w15, 0], p1/m, z1.d
    2220: c0c0644a     	mov	za5h.d[w15, 0], p1/m, z2.d
    2224: c0c0646c     	mov	za6h.d[w15, 0], p1/m, z3.d
    2228: c0c0648e     	mov	za7h.d[w15, 0], p1/m, z4.d
    222c: a5fb47c1     	ld1d	{ z1.d }, p1/z, [x30, x27, lsl #3]
    2230: a5e1a582     	ld1d	{ z2.d }, p1/z, [x12, #0x1, mul vl]
    2234: a5e2a583     	ld1d	{ z3.d }, p1/z, [x12, #0x2, mul vl]
    2238: a5e3a584     	ld1d	{ z4.d }, p1/z, [x12, #0x3, mul vl]
    223c: 5280004f     	mov	w15, #0x2               // =2
    2240: c0c06428     	mov	za4h.d[w15, 0], p1/m, z1.d
    2244: c0c0644a     	mov	za5h.d[w15, 0], p1/m, z2.d
    2248: c0c0646c     	mov	za6h.d[w15, 0], p1/m, z3.d
    224c: c0c0648e     	mov	za7h.d[w15, 0], p1/m, z4.d
    2250: a5fb4581     	ld1d	{ z1.d }, p1/z, [x12, x27, lsl #3]
    2254: a5e1a702     	ld1d	{ z2.d }, p1/z, [x24, #0x1, mul vl]
    2258: a5e2a703     	ld1d	{ z3.d }, p1/z, [x24, #0x2, mul vl]
    225c: a5e3a704     	ld1d	{ z4.d }, p1/z, [x24, #0x3, mul vl]
    2260: 8b1c030c     	add	x12, x24, x28
    2264: c0c04428     	mov	za4h.d[w14, 0], p1/m, z1.d
    2268: c0c0444a     	mov	za5h.d[w14, 0], p1/m, z2.d
    226c: c0c0446c     	mov	za6h.d[w14, 0], p1/m, z3.d
    2270: c0c0448e     	mov	za7h.d[w14, 0], p1/m, z4.d
    2274: a5fb4701     	ld1d	{ z1.d }, p1/z, [x24, x27, lsl #3]
    2278: a5e1a582     	ld1d	{ z2.d }, p1/z, [x12, #0x1, mul vl]
    227c: a5e2a583     	ld1d	{ z3.d }, p1/z, [x12, #0x2, mul vl]
    2280: a5e3a584     	ld1d	{ z4.d }, p1/z, [x12, #0x3, mul vl]
    2284: 8b1c0198     	add	x24, x12, x28
    2288: 5280008e     	mov	w14, #0x4               // =4
    228c: c0c04428     	mov	za4h.d[w14, 0], p1/m, z1.d
    2290: c0c0444a     	mov	za5h.d[w14, 0], p1/m, z2.d
    2294: c0c0446c     	mov	za6h.d[w14, 0], p1/m, z3.d
    2298: c0c0448e     	mov	za7h.d[w14, 0], p1/m, z4.d
    229c: a5fb4581     	ld1d	{ z1.d }, p1/z, [x12, x27, lsl #3]
    22a0: a5e1a702     	ld1d	{ z2.d }, p1/z, [x24, #0x1, mul vl]
    22a4: a5e2a703     	ld1d	{ z3.d }, p1/z, [x24, #0x2, mul vl]
    22a8: a5e3a704     	ld1d	{ z4.d }, p1/z, [x24, #0x3, mul vl]
    22ac: 8b1c030c     	add	x12, x24, x28
    22b0: 528000ae     	mov	w14, #0x5               // =5
    22b4: c0c04428     	mov	za4h.d[w14, 0], p1/m, z1.d
    22b8: c0c0444a     	mov	za5h.d[w14, 0], p1/m, z2.d
    22bc: c0c0446c     	mov	za6h.d[w14, 0], p1/m, z3.d
    22c0: c0c0448e     	mov	za7h.d[w14, 0], p1/m, z4.d
    22c4: a5fb4701     	ld1d	{ z1.d }, p1/z, [x24, x27, lsl #3]
    22c8: a5e1a582     	ld1d	{ z2.d }, p1/z, [x12, #0x1, mul vl]
    22cc: a5e2a583     	ld1d	{ z3.d }, p1/z, [x12, #0x2, mul vl]
    22d0: a5e3a584     	ld1d	{ z4.d }, p1/z, [x12, #0x3, mul vl]
    22d4: 8b1c0198     	add	x24, x12, x28
    22d8: 528000ce     	mov	w14, #0x6               // =6
    22dc: c0c04428     	mov	za4h.d[w14, 0], p1/m, z1.d
    22e0: c0c0444a     	mov	za5h.d[w14, 0], p1/m, z2.d
    22e4: c0c0446c     	mov	za6h.d[w14, 0], p1/m, z3.d
    22e8: c0c0448e     	mov	za7h.d[w14, 0], p1/m, z4.d
    22ec: a5fb4581     	ld1d	{ z1.d }, p1/z, [x12, x27, lsl #3]
    22f0: a5e1a702     	ld1d	{ z2.d }, p1/z, [x24, #0x1, mul vl]
    22f4: a5e2a703     	ld1d	{ z3.d }, p1/z, [x24, #0x2, mul vl]
    22f8: a5e3a704     	ld1d	{ z4.d }, p1/z, [x24, #0x3, mul vl]
    22fc: c0c02428     	mov	za4h.d[w13, 0], p1/m, z1.d
    2300: c0c0244a     	mov	za5h.d[w13, 0], p1/m, z2.d
    2304: c0c0246c     	mov	za6h.d[w13, 0], p1/m, z3.d
    2308: c0c0248e     	mov	za7h.d[w13, 0], p1/m, z4.d
    230c: b940002c     	ldr	w12, [x1]
    2310: 7100059f     	cmp	w12, #0x1
    2314: 5400034b     	b.lt	0x237c <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xaa8>
    2318: 1b086b38     	madd	w24, w25, w8, w26
    231c: 85800041     	ldr	p1, [x2]
    2320: 1b056b25     	madd	w5, w25, w5, w26
    2324: 531c6f18     	lsl	w24, w24, #4
    2328: 531b68a5     	lsl	w5, w5, #5
    232c: 8b38cd2e     	add	x14, x9, w24, sxtw #3
    2330: 8b25ccc5     	add	x5, x6, w5, sxtw #3
    2334: a5e0a5c1     	ld1d	{ z1.d }, p1/z, [x14]
    2338: a5e0a4a2     	ld1d	{ z2.d }, p1/z, [x5]
    233c: 7100058c     	subs	w12, w12, #0x1
    2340: a5e1a4a3     	ld1d	{ z3.d }, p1/z, [x5, #0x1, mul vl]
    2344: a5e1a5c4     	ld1d	{ z4.d }, p1/z, [x14, #0x1, mul vl]
    2348: 910201ce     	add	x14, x14, #0x80
    234c: a5e2a4a5     	ld1d	{ z5.d }, p1/z, [x5, #0x2, mul vl]
    2350: a5e3a4a6     	ld1d	{ z6.d }, p1/z, [x5, #0x3, mul vl]
    2354: 910400a5     	add	x5, x5, #0x100
    2358: 80c22420     	fmopa	za0.d, p1/m, p1/m, z1.d, z2.d
    235c: 80c32421     	fmopa	za1.d, p1/m, p1/m, z1.d, z3.d
    2360: 80c52422     	fmopa	za2.d, p1/m, p1/m, z1.d, z5.d
    2364: 80c62423     	fmopa	za3.d, p1/m, p1/m, z1.d, z6.d
    2368: 80c22484     	fmopa	za4.d, p1/m, p1/m, z4.d, z2.d
    236c: 80c32485     	fmopa	za5.d, p1/m, p1/m, z4.d, z3.d
    2370: 80c52486     	fmopa	za6.d, p1/m, p1/m, z4.d, z5.d
    2374: 80c62487     	fmopa	za7.d, p1/m, p1/m, z4.d, z6.d
    2378: 54fffde1     	b.ne	0x2334 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xa60>
    237c: b9800225     	ldrsw	x5, [x17]
    2380: 3940016c     	ldrb	w12, [x11]
    2384: d37df0a6     	lsl	x6, x5, #3
    2388: 35ffb1ac     	cbnz	w12, 0x19bc <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xe8>
    238c: 85800041     	ldr	p1, [x2]
    2390: 2a1f03ed     	mov	w13, wzr
    2394: 5280002f     	mov	w15, #0x1               // =1
    2398: 8b0600ee     	add	x14, x7, x6
    239c: 5280004c     	mov	w12, #0x2               // =2
    23a0: c0c22401     	mov	z1.d, p1/m, za0h.d[w13, 0]
    23a4: c0c22442     	mov	z2.d, p1/m, za1h.d[w13, 0]
    23a8: c0c22483     	mov	z3.d, p1/m, za2h.d[w13, 0]
    23ac: c0c224c4     	mov	z4.d, p1/m, za3h.d[w13, 0]
    23b0: e5e0e4e1     	st1d	{ z1.d }, p1, [x7]
    23b4: e5e1e4e2     	st1d	{ z2.d }, p1, [x7, #0x1, mul vl]
    23b8: e5e2e4e3     	st1d	{ z3.d }, p1, [x7, #0x2, mul vl]
    23bc: e5e3e4e4     	st1d	{ z4.d }, p1, [x7, #0x3, mul vl]
    23c0: c0c26401     	mov	z1.d, p1/m, za0h.d[w15, 0]
    23c4: c0c26442     	mov	z2.d, p1/m, za1h.d[w15, 0]
    23c8: c0c26483     	mov	z3.d, p1/m, za2h.d[w15, 0]
    23cc: c0c264c4     	mov	z4.d, p1/m, za3h.d[w15, 0]
    23d0: e5e544e1     	st1d	{ z1.d }, p1, [x7, x5, lsl #3]
    23d4: 8b0601c7     	add	x7, x14, x6
    23d8: e5e1e5c2     	st1d	{ z2.d }, p1, [x14, #0x1, mul vl]
    23dc: e5e2e5c3     	st1d	{ z3.d }, p1, [x14, #0x2, mul vl]
    23e0: e5e3e5c4     	st1d	{ z4.d }, p1, [x14, #0x3, mul vl]
    23e4: c0c20401     	mov	z1.d, p1/m, za0h.d[w12, 0]
    23e8: c0c20442     	mov	z2.d, p1/m, za1h.d[w12, 0]
    23ec: c0c20483     	mov	z3.d, p1/m, za2h.d[w12, 0]
    23f0: c0c204c4     	mov	z4.d, p1/m, za3h.d[w12, 0]
    23f4: e5e545c1     	st1d	{ z1.d }, p1, [x14, x5, lsl #3]
    23f8: 5280006e     	mov	w14, #0x3               // =3
    23fc: e5e1e4e2     	st1d	{ z2.d }, p1, [x7, #0x1, mul vl]
    2400: 5280006c     	mov	w12, #0x3               // =3
    2404: e5e2e4e3     	st1d	{ z3.d }, p1, [x7, #0x2, mul vl]
    2408: e5e3e4e4     	st1d	{ z4.d }, p1, [x7, #0x3, mul vl]
    240c: c0c24401     	mov	z1.d, p1/m, za0h.d[w14, 0]
    2410: c0c24442     	mov	z2.d, p1/m, za1h.d[w14, 0]
    2414: c0c24483     	mov	z3.d, p1/m, za2h.d[w14, 0]
    2418: 8b0600ee     	add	x14, x7, x6
    241c: c0c204c4     	mov	z4.d, p1/m, za3h.d[w12, 0]
    2420: e5e544e1     	st1d	{ z1.d }, p1, [x7, x5, lsl #3]
    2424: 5280008c     	mov	w12, #0x4               // =4
    2428: e5e1e5c2     	st1d	{ z2.d }, p1, [x14, #0x1, mul vl]
    242c: 8b0601c7     	add	x7, x14, x6
    2430: e5e2e5c3     	st1d	{ z3.d }, p1, [x14, #0x2, mul vl]
    2434: e5e3e5c4     	st1d	{ z4.d }, p1, [x14, #0x3, mul vl]
    2438: c0c20401     	mov	z1.d, p1/m, za0h.d[w12, 0]
    243c: c0c20442     	mov	z2.d, p1/m, za1h.d[w12, 0]
    2440: c0c20483     	mov	z3.d, p1/m, za2h.d[w12, 0]
    2444: c0c204c4     	mov	z4.d, p1/m, za3h.d[w12, 0]
    2448: e5e545c1     	st1d	{ z1.d }, p1, [x14, x5, lsl #3]
    244c: 528000ac     	mov	w12, #0x5               // =5
    2450: e5e1e4e2     	st1d	{ z2.d }, p1, [x7, #0x1, mul vl]
    2454: 8b0600ee     	add	x14, x7, x6
    2458: e5e2e4e3     	st1d	{ z3.d }, p1, [x7, #0x2, mul vl]
    245c: e5e3e4e4     	st1d	{ z4.d }, p1, [x7, #0x3, mul vl]
    2460: c0c20401     	mov	z1.d, p1/m, za0h.d[w12, 0]
    2464: c0c20442     	mov	z2.d, p1/m, za1h.d[w12, 0]
    2468: c0c20483     	mov	z3.d, p1/m, za2h.d[w12, 0]
    246c: c0c204c4     	mov	z4.d, p1/m, za3h.d[w12, 0]
    2470: e5e544e1     	st1d	{ z1.d }, p1, [x7, x5, lsl #3]
    2474: 528000cc     	mov	w12, #0x6               // =6
    2478: e5e1e5c2     	st1d	{ z2.d }, p1, [x14, #0x1, mul vl]
    247c: 8b0601c7     	add	x7, x14, x6
    2480: e5e2e5c3     	st1d	{ z3.d }, p1, [x14, #0x2, mul vl]
    2484: e5e3e5c4     	st1d	{ z4.d }, p1, [x14, #0x3, mul vl]
    2488: c0c20401     	mov	z1.d, p1/m, za0h.d[w12, 0]
    248c: c0c20442     	mov	z2.d, p1/m, za1h.d[w12, 0]
    2490: c0c20483     	mov	z3.d, p1/m, za2h.d[w12, 0]
    2494: c0c204c4     	mov	z4.d, p1/m, za3h.d[w12, 0]
    2498: e5e545c1     	st1d	{ z1.d }, p1, [x14, x5, lsl #3]
    249c: 528000ec     	mov	w12, #0x7               // =7
    24a0: e5e1e4e2     	st1d	{ z2.d }, p1, [x7, #0x1, mul vl]
    24a4: 8b0600ee     	add	x14, x7, x6
    24a8: e5e2e4e3     	st1d	{ z3.d }, p1, [x7, #0x2, mul vl]
    24ac: e5e3e4e4     	st1d	{ z4.d }, p1, [x7, #0x3, mul vl]
    24b0: c0c20401     	mov	z1.d, p1/m, za0h.d[w12, 0]
    24b4: c0c20442     	mov	z2.d, p1/m, za1h.d[w12, 0]
    24b8: c0c20483     	mov	z3.d, p1/m, za2h.d[w12, 0]
    24bc: c0c204c4     	mov	z4.d, p1/m, za3h.d[w12, 0]
    24c0: e5e544e1     	st1d	{ z1.d }, p1, [x7, x5, lsl #3]
    24c4: 8b0601c7     	add	x7, x14, x6
    24c8: e5e1e5c2     	st1d	{ z2.d }, p1, [x14, #0x1, mul vl]
    24cc: 8b0600ec     	add	x12, x7, x6
    24d0: e5e2e5c3     	st1d	{ z3.d }, p1, [x14, #0x2, mul vl]
    24d4: e5e3e5c4     	st1d	{ z4.d }, p1, [x14, #0x3, mul vl]
    24d8: c0c22501     	mov	z1.d, p1/m, za4h.d[w13, 0]
    24dc: c0c22542     	mov	z2.d, p1/m, za5h.d[w13, 0]
    24e0: c0c22583     	mov	z3.d, p1/m, za6h.d[w13, 0]
    24e4: c0c225c4     	mov	z4.d, p1/m, za7h.d[w13, 0]
    24e8: e5e545c1     	st1d	{ z1.d }, p1, [x14, x5, lsl #3]
    24ec: 5280004d     	mov	w13, #0x2               // =2
    24f0: e5e1e4e2     	st1d	{ z2.d }, p1, [x7, #0x1, mul vl]
    24f4: 8b06018e     	add	x14, x12, x6
    24f8: e5e2e4e3     	st1d	{ z3.d }, p1, [x7, #0x2, mul vl]
    24fc: e5e3e4e4     	st1d	{ z4.d }, p1, [x7, #0x3, mul vl]
    2500: c0c26501     	mov	z1.d, p1/m, za4h.d[w15, 0]
    2504: c0c26542     	mov	z2.d, p1/m, za5h.d[w15, 0]
    2508: c0c26583     	mov	z3.d, p1/m, za6h.d[w15, 0]
    250c: c0c265c4     	mov	z4.d, p1/m, za7h.d[w15, 0]
    2510: e5e544e1     	st1d	{ z1.d }, p1, [x7, x5, lsl #3]
    2514: e5e1e582     	st1d	{ z2.d }, p1, [x12, #0x1, mul vl]
    2518: e5e2e583     	st1d	{ z3.d }, p1, [x12, #0x2, mul vl]
    251c: e5e3e584     	st1d	{ z4.d }, p1, [x12, #0x3, mul vl]
    2520: c0c22501     	mov	z1.d, p1/m, za4h.d[w13, 0]
    2524: c0c22542     	mov	z2.d, p1/m, za5h.d[w13, 0]
    2528: c0c22583     	mov	z3.d, p1/m, za6h.d[w13, 0]
    252c: c0c225c4     	mov	z4.d, p1/m, za7h.d[w13, 0]
    2530: e5e54581     	st1d	{ z1.d }, p1, [x12, x5, lsl #3]
    2534: 5280006c     	mov	w12, #0x3               // =3
    2538: e5e1e5c2     	st1d	{ z2.d }, p1, [x14, #0x1, mul vl]
    253c: 5280006d     	mov	w13, #0x3               // =3
    2540: e5e2e5c3     	st1d	{ z3.d }, p1, [x14, #0x2, mul vl]
    2544: e5e3e5c4     	st1d	{ z4.d }, p1, [x14, #0x3, mul vl]
    2548: c0c20501     	mov	z1.d, p1/m, za4h.d[w12, 0]
    254c: c0c20542     	mov	z2.d, p1/m, za5h.d[w12, 0]
    2550: c0c20583     	mov	z3.d, p1/m, za6h.d[w12, 0]
    2554: 8b0601cc     	add	x12, x14, x6
    2558: c0c225c4     	mov	z4.d, p1/m, za7h.d[w13, 0]
    255c: e5e545c1     	st1d	{ z1.d }, p1, [x14, x5, lsl #3]
    2560: 5280008d     	mov	w13, #0x4               // =4
    2564: e5e1e582     	st1d	{ z2.d }, p1, [x12, #0x1, mul vl]
    2568: 8b06018e     	add	x14, x12, x6
    256c: e5e2e583     	st1d	{ z3.d }, p1, [x12, #0x2, mul vl]
    2570: e5e3e584     	st1d	{ z4.d }, p1, [x12, #0x3, mul vl]
    2574: c0c22501     	mov	z1.d, p1/m, za4h.d[w13, 0]
    2578: c0c22542     	mov	z2.d, p1/m, za5h.d[w13, 0]
    257c: c0c22583     	mov	z3.d, p1/m, za6h.d[w13, 0]
    2580: c0c225c4     	mov	z4.d, p1/m, za7h.d[w13, 0]
    2584: e5e54581     	st1d	{ z1.d }, p1, [x12, x5, lsl #3]
    2588: 528000ac     	mov	w12, #0x5               // =5
    258c: e5e1e5c2     	st1d	{ z2.d }, p1, [x14, #0x1, mul vl]
    2590: 528000ad     	mov	w13, #0x5               // =5
    2594: e5e2e5c3     	st1d	{ z3.d }, p1, [x14, #0x2, mul vl]
    2598: e5e3e5c4     	st1d	{ z4.d }, p1, [x14, #0x3, mul vl]
    259c: c0c20501     	mov	z1.d, p1/m, za4h.d[w12, 0]
    25a0: c0c20542     	mov	z2.d, p1/m, za5h.d[w12, 0]
    25a4: c0c20583     	mov	z3.d, p1/m, za6h.d[w12, 0]
    25a8: 8b0601cc     	add	x12, x14, x6
    25ac: c0c225c4     	mov	z4.d, p1/m, za7h.d[w13, 0]
    25b0: e5e545c1     	st1d	{ z1.d }, p1, [x14, x5, lsl #3]
    25b4: 528000cd     	mov	w13, #0x6               // =6
    25b8: e5e1e582     	st1d	{ z2.d }, p1, [x12, #0x1, mul vl]
    25bc: 8b06018e     	add	x14, x12, x6
    25c0: e5e2e583     	st1d	{ z3.d }, p1, [x12, #0x2, mul vl]
    25c4: e5e3e584     	st1d	{ z4.d }, p1, [x12, #0x3, mul vl]
    25c8: c0c22501     	mov	z1.d, p1/m, za4h.d[w13, 0]
    25cc: c0c22542     	mov	z2.d, p1/m, za5h.d[w13, 0]
    25d0: c0c22583     	mov	z3.d, p1/m, za6h.d[w13, 0]
    25d4: c0c225c4     	mov	z4.d, p1/m, za7h.d[w13, 0]
    25d8: e5e54581     	st1d	{ z1.d }, p1, [x12, x5, lsl #3]
    25dc: 528000ec     	mov	w12, #0x7               // =7
    25e0: e5e1e5c2     	st1d	{ z2.d }, p1, [x14, #0x1, mul vl]
    25e4: 528000ed     	mov	w13, #0x7               // =7
    25e8: e5e2e5c3     	st1d	{ z3.d }, p1, [x14, #0x2, mul vl]
    25ec: e5e3e5c4     	st1d	{ z4.d }, p1, [x14, #0x3, mul vl]
    25f0: c0c20501     	mov	z1.d, p1/m, za4h.d[w12, 0]
    25f4: c0c20542     	mov	z2.d, p1/m, za5h.d[w12, 0]
    25f8: c0c20583     	mov	z3.d, p1/m, za6h.d[w12, 0]
    25fc: 8b0601cc     	add	x12, x14, x6
    2600: c0c225c4     	mov	z4.d, p1/m, za7h.d[w13, 0]
    2604: e5e545c1     	st1d	{ z1.d }, p1, [x14, x5, lsl #3]
    2608: e5e1e582     	st1d	{ z2.d }, p1, [x12, #0x1, mul vl]
    260c: e5e2e583     	st1d	{ z3.d }, p1, [x12, #0x2, mul vl]
    2610: e5e3e584     	st1d	{ z4.d }, p1, [x12, #0x3, mul vl]
    2614: b94002ec     	ldr	w12, [x23]
    2618: 11000484     	add	w4, w4, #0x1
    261c: 6b0c009f     	cmp	w4, w12
    2620: 54ffd16b     	b.lt	0x204c <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0x778>
    2624: 17fffcdd     	b	0x1998 <_ZN4gemmIdE14compute_packedEiiiPKdS2_Pddd.omp_outlined+0xc4>
    2628: b94017e1     	ldr	w1, [sp, #0x14]
    262c: b0000080     	adrp	x0, 0x13000 <__FRAME_END__+0x1015c>
    2630: 9135a000     	add	x0, x0, #0xd68
    2634: 97fff8bf     	bl	0x930 <__kmpc_for_static_fini@plt>
    2638: a9484ff4     	ldp	x20, x19, [sp, #0x80]
    263c: a94757f6     	ldp	x22, x21, [sp, #0x70]
    2640: a9465ff8     	ldp	x24, x23, [sp, #0x60]
    2644: a94567fa     	ldp	x26, x25, [sp, #0x50]
    2648: a9446ffc     	ldp	x28, x27, [sp, #0x40]
    264c: a9437bfd     	ldp	x29, x30, [sp, #0x30]
    2650: 910243ff     	add	sp, sp, #0x90
    2654: d65f03c0     	ret

0000000000002658 <_ZN4gemmIdE12compute_testEiiiPKdS2_Pddd>:
    2658: 6db63bef     	stp	d15, d14, [sp, #-0xa0]!
    265c: 6d0133ed     	stp	d13, d12, [sp, #0x10]
    2660: 6d022beb     	stp	d11, d10, [sp, #0x20]
    2664: 6d0323e9     	stp	d9, d8, [sp, #0x30]
    2668: a9047bfd     	stp	x29, x30, [sp, #0x40]
    266c: a9056ffc     	stp	x28, x27, [sp, #0x50]
    2670: a90667fa     	stp	x26, x25, [sp, #0x60]
    2674: a9075ff8     	stp	x24, x23, [sp, #0x70]
    2678: a90857f6     	stp	x22, x21, [sp, #0x80]
    267c: a9094ff4     	stp	x20, x19, [sp, #0x90]
    2680: 910103fd     	add	x29, sp, #0x40
    2684: d10343ff     	sub	sp, sp, #0xd0
    2688: 043f5fff     	addsvl	sp, sp, #-0x1
    268c: aa0503f4     	mov	x20, x5
    2690: aa0403f8     	mov	x24, x4
    2694: aa0303f9     	mov	x25, x3
    2698: 2a0203f5     	mov	w21, w2
    269c: 2a0103f7     	mov	w23, w1
    26a0: 2a0003fa     	mov	w26, w0
    26a4: 6d0607e0     	stp	d0, d1, [sp, #0x60]
    26a8: d503437f     	smstart	sm
    26ac: 53047c16     	lsr	w22, w0, #4
    26b0: 53057c3b     	lsr	w27, w1, #5
    26b4: 1b027ec8     	mul	w8, w22, w2
    26b8: 531c6d08     	lsl	w8, w8, #4
    26bc: d37d7d00     	ubfiz	x0, x8, #3, #32
    26c0: d503427f     	smstop	sm
    26c4: 97fff897     	bl	0x920 <_Znam@plt>
    26c8: aa0003f3     	mov	x19, x0
    26cc: d503437f     	smstart	sm
    26d0: 1b157f68     	mul	w8, w27, w21
    26d4: 531b6908     	lsl	w8, w8, #5
    26d8: d37d7d00     	ubfiz	x0, x8, #3, #32
    26dc: d503427f     	smstop	sm
    26e0: 97fff890     	bl	0x920 <_Znam@plt>
    26e4: 2a1503f2     	mov	w18, w21
    26e8: aa0003f5     	mov	x21, x0
    26ec: d503437f     	smstart	sm
    26f0: 531c6e4a     	lsl	w10, w18, #4
    26f4: 2a1f03e8     	mov	w8, wzr
    26f8: aa1f03e9     	mov	x9, xzr
    26fc: 2a1203eb     	mov	w11, w18
    2700: 528001ec     	mov	w12, #0xf               // =15
    2704: 2a0c03ed     	mov	w13, w12
    2708: 2a0803ee     	mov	w14, w8
    270c: aa0b03ef     	mov	x15, x11
    2710: 51003db1     	sub	w17, w13, #0xf
    2714: 8b2ece70     	add	x16, x19, w14, sxtw #3
    2718: f10005ef     	subs	x15, x15, #0x1
    271c: fc71db20     	ldr	d0, [x25, w17, sxtw #3]
    2720: 510039b1     	sub	w17, w13, #0xe
    2724: 110041ce     	add	w14, w14, #0x10
    2728: fc71db21     	ldr	d1, [x25, w17, sxtw #3]
    272c: 510035b1     	sub	w17, w13, #0xd
    2730: fc71db22     	ldr	d2, [x25, w17, sxtw #3]
    2734: 510031b1     	sub	w17, w13, #0xc
    2738: 6d000600     	stp	d0, d1, [x16]
    273c: fc71db20     	ldr	d0, [x25, w17, sxtw #3]
    2740: 51002db1     	sub	w17, w13, #0xb
    2744: fc71db21     	ldr	d1, [x25, w17, sxtw #3]
    2748: 510029b1     	sub	w17, w13, #0xa
    274c: 6d010202     	stp	d2, d0, [x16, #0x10]
    2750: fc71db20     	ldr	d0, [x25, w17, sxtw #3]
    2754: 510025b1     	sub	w17, w13, #0x9
    2758: fc71db22     	ldr	d2, [x25, w17, sxtw #3]
    275c: 510021b1     	sub	w17, w13, #0x8
    2760: 6d020201     	stp	d1, d0, [x16, #0x20]
    2764: fc71db20     	ldr	d0, [x25, w17, sxtw #3]
    2768: 51001db1     	sub	w17, w13, #0x7
    276c: fc71db21     	ldr	d1, [x25, w17, sxtw #3]
    2770: 510019b1     	sub	w17, w13, #0x6
    2774: 6d030202     	stp	d2, d0, [x16, #0x30]
    2778: fc71db20     	ldr	d0, [x25, w17, sxtw #3]
    277c: 510015b1     	sub	w17, w13, #0x5
    2780: fc71db22     	ldr	d2, [x25, w17, sxtw #3]
    2784: 510011b1     	sub	w17, w13, #0x4
    2788: 6d040201     	stp	d1, d0, [x16, #0x40]
    278c: fc71db20     	ldr	d0, [x25, w17, sxtw #3]
    2790: 51000db1     	sub	w17, w13, #0x3
    2794: fc71db21     	ldr	d1, [x25, w17, sxtw #3]
    2798: 510009b1     	sub	w17, w13, #0x2
    279c: 6d050202     	stp	d2, d0, [x16, #0x50]
    27a0: fc71db20     	ldr	d0, [x25, w17, sxtw #3]
    27a4: 510005b1     	sub	w17, w13, #0x1
    27a8: fc71db22     	ldr	d2, [x25, w17, sxtw #3]
    27ac: 6d060201     	stp	d1, d0, [x16, #0x60]
    27b0: fc6ddb20     	ldr	d0, [x25, w13, sxtw #3]
    27b4: 0b1a01ad     	add	w13, w13, w26
    27b8: 6d070202     	stp	d2, d0, [x16, #0x70]
    27bc: 54fffaa1     	b.ne	0x2710 <_ZN4gemmIdE12compute_testEiiiPKdS2_Pddd+0xb8>
    27c0: 91000529     	add	x9, x9, #0x1
    27c4: 0b0a0108     	add	w8, w8, w10
    27c8: 1100418c     	add	w12, w12, #0x10
    27cc: eb16013f     	cmp	x9, x22
    27d0: 54fff9a1     	b.ne	0x2704 <_ZN4gemmIdE12compute_testEiiiPKdS2_Pddd+0xac>
    27d4: d503427f     	smstop	sm
    27d8: 2a1703e0     	mov	w0, w23
    27dc: 2a1203e1     	mov	w1, w18
    27e0: aa1803e2     	mov	x2, x24
    27e4: aa1503e3     	mov	x3, x21
    27e8: 2a1203f9     	mov	w25, w18
    27ec: 97fffbc7     	bl	0x1708 <_ZN4gemmIdE6pack_BEiiPKdPd>
    27f0: 2a1903ec     	mov	w12, w25
    27f4: d503437f     	smstart	sm
    27f8: 25d8e3e0     	ptrue	p0.d
    27fc: 6d4603e1     	ldp	d1, d0, [sp, #0x60]
    2800: 2a1f03e8     	mov	w8, wzr
    2804: 29195ff9     	stp	w25, w23, [sp, #0xc8]
    2808: 51000b78     	sub	w24, w27, #0x2
    280c: a9074ff5     	stp	x21, x19, [sp, #0x70]
    2810: 5280004d     	mov	w13, #0x2               // =2
    2814: 910283ee     	add	x14, sp, #0xa0
    2818: a90bcff5     	stp	x21, x19, [sp, #0xb8]
    281c: 9102a3ef     	add	x15, sp, #0xa8
    2820: 910233f0     	add	x16, sp, #0x8c
    2824: f9005bf4     	str	x20, [sp, #0xb0]
    2828: 910253f5     	add	x21, sp, #0x94
    282c: 910243f3     	add	x19, sp, #0x90
    2830: 910333fa     	add	x26, sp, #0xcc
    2834: 29135bff     	stp	wzr, w22, [sp, #0x98]
    2838: 9102c3f4     	add	x20, sp, #0xb0
    283c: 9102e3f9     	add	x25, sp, #0xb8
    2840: d10103a9     	sub	x9, x29, #0x40
    2844: 910263fc     	add	x28, sp, #0x98
    2848: b0000096     	adrp	x22, 0x13000 <__FRAME_END__+0x1015c>
    284c: 913602d6     	add	x22, x22, #0xd80
    2850: f0fffff7     	adrp	x23, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0x2e8>
    2854: 912352f7     	add	x23, x23, #0x8d4
    2858: 6d0a07e0     	stp	d0, d1, [sp, #0xa0]
    285c: e5bf1d20     	str	p0, [x9, #-0x1, mul vl]
    2860: 1120010a     	add	w10, w8, #0x800
    2864: 7100011f     	cmp	w8, #0x0
    2868: 4b080188     	sub	w8, w12, w8
    286c: 1a9f17eb     	cset	w11, eq
    2870: 6b0c015f     	cmp	w10, w12
    2874: 5281000a     	mov	w10, #0x800             // =2048
    2878: 2a1f03e9     	mov	w9, wzr
    287c: 1a8ac108     	csel	w8, w8, w10, gt
    2880: 1a9fb7ea     	cset	w10, ge
    2884: 390243eb     	strb	w11, [sp, #0x90]
    2888: b90097e8     	str	w8, [sp, #0x94]
    288c: 390233ea     	strb	w10, [sp, #0x8c]
    2890: b9008bff     	str	wzr, [sp, #0x88]
    2894: 4b090368     	sub	w8, w27, w9
    2898: 6b18013f     	cmp	w9, w24
    289c: a9043bef     	stp	x15, x14, [sp, #0x40]
    28a0: 1a8dc108     	csel	w8, w8, w13, gt
    28a4: a90343f5     	stp	x21, x16, [sp, #0x30]
    28a8: b90087e8     	str	w8, [sp, #0x84]
    28ac: d10103a8     	sub	x8, x29, #0x40
    28b0: 04685fe8     	addspl	x8, x8, #-0x1
    28b4: a9016bf4     	stp	x20, x26, [sp, #0x10]
    28b8: a90223f3     	stp	x19, x8, [sp, #0x20]
    28bc: a90067fc     	stp	x28, x25, [sp]
    28c0: d503427f     	smstop	sm
    28c4: 910273e3     	add	x3, sp, #0x9c
    28c8: 910213e4     	add	x4, sp, #0x84
    28cc: 910223e5     	add	x5, sp, #0x88
    28d0: 910303e6     	add	x6, sp, #0xc0
    28d4: 910323e7     	add	x7, sp, #0xc8
    28d8: aa1603e0     	mov	x0, x22
    28dc: 528001e1     	mov	w1, #0xf                // =15
    28e0: aa1703e2     	mov	x2, x23
    28e4: 97fff83b     	bl	0x9d0 <__kmpc_fork_call@plt>
    28e8: 910233f0     	add	x16, sp, #0x8c
    28ec: 9102a3ef     	add	x15, sp, #0xa8
    28f0: 910283ee     	add	x14, sp, #0xa0
    28f4: 5280004d     	mov	w13, #0x2               // =2
    28f8: d503437f     	smstart	sm
    28fc: b9408be8     	ldr	w8, [sp, #0x88]
    2900: 11000909     	add	w9, w8, #0x2
    2904: 6b1b013f     	cmp	w9, w27
    2908: b9008be9     	str	w9, [sp, #0x88]
    290c: 54fffc4b     	b.lt	0x2894 <_ZN4gemmIdE12compute_testEiiiPKdS2_Pddd+0x23c>
    2910: b9409be8     	ldr	w8, [sp, #0x98]
    2914: b940cbec     	ldr	w12, [sp, #0xc8]
    2918: 11200108     	add	w8, w8, #0x800
    291c: 6b0c011f     	cmp	w8, w12
    2920: b9009be8     	str	w8, [sp, #0x98]
    2924: 54fff9eb     	b.lt	0x2860 <_ZN4gemmIdE12compute_testEiiiPKdS2_Pddd+0x208>
    2928: d503427f     	smstop	sm
    292c: f9403fe0     	ldr	x0, [sp, #0x78]
    2930: 97fff818     	bl	0x990 <_ZdaPv@plt>
    2934: d503437f     	smstart	sm
    2938: d503427f     	smstop	sm
    293c: f9403be0     	ldr	x0, [sp, #0x70]
    2940: 97fff814     	bl	0x990 <_ZdaPv@plt>
    2944: d503437f     	smstart	sm
    2948: d503427f     	smstop	sm
    294c: 043f583f     	addsvl	sp, sp, #0x1
    2950: 910343ff     	add	sp, sp, #0xd0
    2954: a9494ff4     	ldp	x20, x19, [sp, #0x90]
    2958: a94857f6     	ldp	x22, x21, [sp, #0x80]
    295c: a9475ff8     	ldp	x24, x23, [sp, #0x70]
    2960: a94667fa     	ldp	x26, x25, [sp, #0x60]
    2964: a9456ffc     	ldp	x28, x27, [sp, #0x50]
    2968: a9447bfd     	ldp	x29, x30, [sp, #0x40]
    296c: 6d4323e9     	ldp	d9, d8, [sp, #0x30]
    2970: 6d422beb     	ldp	d11, d10, [sp, #0x20]
    2974: 6d4133ed     	ldp	d13, d12, [sp, #0x10]
    2978: 6cca3bef     	ldp	d15, d14, [sp], #0xa0
    297c: d65f03c0     	ret

Disassembly of section .fini:

0000000000002980 <_fini>:
    2980: d503201f     	nop
    2984: a9bf7bfd     	stp	x29, x30, [sp, #-0x10]!
    2988: 910003fd     	mov	x29, sp
    298c: a8c17bfd     	ldp	x29, x30, [sp], #0x10
    2990: d65f03c0     	ret
