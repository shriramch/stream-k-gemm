
gemm_crs:	file format elf64-littleaarch64

Disassembly of section .init:

0000000000000970 <_init>:
     970: d503201f     	nop
     974: a9bf7bfd     	stp	x29, x30, [sp, #-0x10]!
     978: 910003fd     	mov	x29, sp
     97c: 9400005e     	bl	0xaf4 <call_weak_fn>
     980: a8c17bfd     	ldp	x29, x30, [sp], #0x10
     984: d65f03c0     	ret

Disassembly of section .plt:

0000000000000990 <.plt>:
     990: a9bf7bf0     	stp	x16, x30, [sp, #-0x10]!
     994: d0000090     	adrp	x16, 0x12000 <__FRAME_END__+0xf584>
     998: f947fe11     	ldr	x17, [x16, #0xff8]
     99c: 913fe210     	add	x16, x16, #0xff8
     9a0: d61f0220     	br	x17
     9a4: d503201f     	nop
     9a8: d503201f     	nop
     9ac: d503201f     	nop

00000000000009b0 <_Znam@plt>:
     9b0: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     9b4: f9400211     	ldr	x17, [x16]
     9b8: 91000210     	add	x16, x16, #0x0
     9bc: d61f0220     	br	x17

00000000000009c0 <__kmpc_for_static_fini@plt>:
     9c0: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     9c4: f9400611     	ldr	x17, [x16, #0x8]
     9c8: 91002210     	add	x16, x16, #0x8
     9cc: d61f0220     	br	x17

00000000000009d0 <_ZNSt6chrono3_V212system_clock3nowEv@plt>:
     9d0: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     9d4: f9400a11     	ldr	x17, [x16, #0x10]
     9d8: 91004210     	add	x16, x16, #0x10
     9dc: d61f0220     	br	x17

00000000000009e0 <puts@plt>:
     9e0: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     9e4: f9400e11     	ldr	x17, [x16, #0x18]
     9e8: 91006210     	add	x16, x16, #0x18
     9ec: d61f0220     	br	x17

00000000000009f0 <__kmpc_for_static_init_8@plt>:
     9f0: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     9f4: f9401211     	ldr	x17, [x16, #0x20]
     9f8: 91008210     	add	x16, x16, #0x20
     9fc: d61f0220     	br	x17

0000000000000a00 <memset@plt>:
     a00: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     a04: f9401611     	ldr	x17, [x16, #0x28]
     a08: 9100a210     	add	x16, x16, #0x28
     a0c: d61f0220     	br	x17

0000000000000a10 <__cxa_finalize@plt>:
     a10: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     a14: f9401a11     	ldr	x17, [x16, #0x30]
     a18: 9100c210     	add	x16, x16, #0x30
     a1c: d61f0220     	br	x17

0000000000000a20 <__libc_start_main@plt>:
     a20: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     a24: f9401e11     	ldr	x17, [x16, #0x38]
     a28: 9100e210     	add	x16, x16, #0x38
     a2c: d61f0220     	br	x17

0000000000000a30 <omp_get_thread_num@plt>:
     a30: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     a34: f9402211     	ldr	x17, [x16, #0x40]
     a38: 91010210     	add	x16, x16, #0x40
     a3c: d61f0220     	br	x17

0000000000000a40 <_ZdaPv@plt>:
     a40: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     a44: f9402611     	ldr	x17, [x16, #0x48]
     a48: 91012210     	add	x16, x16, #0x48
     a4c: d61f0220     	br	x17

0000000000000a50 <omp_set_num_threads@plt>:
     a50: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     a54: f9402a11     	ldr	x17, [x16, #0x50]
     a58: 91014210     	add	x16, x16, #0x50
     a5c: d61f0220     	br	x17

0000000000000a60 <abort@plt>:
     a60: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     a64: f9402e11     	ldr	x17, [x16, #0x58]
     a68: 91016210     	add	x16, x16, #0x58
     a6c: d61f0220     	br	x17

0000000000000a70 <omp_get_max_threads@plt>:
     a70: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     a74: f9403211     	ldr	x17, [x16, #0x60]
     a78: 91018210     	add	x16, x16, #0x60
     a7c: d61f0220     	br	x17

0000000000000a80 <__kmpc_fork_call@plt>:
     a80: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     a84: f9403611     	ldr	x17, [x16, #0x68]
     a88: 9101a210     	add	x16, x16, #0x68
     a8c: d61f0220     	br	x17

0000000000000a90 <__gmon_start__@plt>:
     a90: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     a94: f9403a11     	ldr	x17, [x16, #0x70]
     a98: 9101c210     	add	x16, x16, #0x70
     a9c: d61f0220     	br	x17

0000000000000aa0 <printf@plt>:
     aa0: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     aa4: f9403e11     	ldr	x17, [x16, #0x78]
     aa8: 9101e210     	add	x16, x16, #0x78
     aac: d61f0220     	br	x17

Disassembly of section .text:

0000000000000ac0 <_start>:
     ac0: d503201f     	nop
     ac4: d280001d     	mov	x29, #0x0               // =0
     ac8: d280001e     	mov	x30, #0x0               // =0
     acc: aa0003e5     	mov	x5, x0
     ad0: f94003e1     	ldr	x1, [sp]
     ad4: 910023e2     	add	x2, sp, #0x8
     ad8: 910003e6     	mov	x6, sp
     adc: d0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xf584>
     ae0: f947e000     	ldr	x0, [x0, #0xfc0]
     ae4: d2800003     	mov	x3, #0x0                // =0
     ae8: d2800004     	mov	x4, #0x0                // =0
     aec: 97ffffcd     	bl	0xa20 <__libc_start_main@plt>
     af0: 97ffffdc     	bl	0xa60 <abort@plt>

0000000000000af4 <call_weak_fn>:
     af4: d0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xf584>
     af8: f947ec00     	ldr	x0, [x0, #0xfd8]
     afc: b4000040     	cbz	x0, 0xb04 <call_weak_fn+0x10>
     b00: 17ffffe4     	b	0xa90 <__gmon_start__@plt>
     b04: d65f03c0     	ret
     b08: d503201f     	nop
     b0c: d503201f     	nop

0000000000000b10 <deregister_tm_clones>:
     b10: f0000080     	adrp	x0, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     b14: 91024000     	add	x0, x0, #0x90
     b18: f0000081     	adrp	x1, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     b1c: 91024021     	add	x1, x1, #0x90
     b20: eb00003f     	cmp	x1, x0
     b24: 540000c0     	b.eq	0xb3c <deregister_tm_clones+0x2c>
     b28: d0000081     	adrp	x1, 0x12000 <__FRAME_END__+0xf584>
     b2c: f947e821     	ldr	x1, [x1, #0xfd0]
     b30: b4000061     	cbz	x1, 0xb3c <deregister_tm_clones+0x2c>
     b34: aa0103f0     	mov	x16, x1
     b38: d61f0200     	br	x16
     b3c: d65f03c0     	ret

0000000000000b40 <register_tm_clones>:
     b40: f0000080     	adrp	x0, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     b44: 91024000     	add	x0, x0, #0x90
     b48: f0000081     	adrp	x1, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     b4c: 91024021     	add	x1, x1, #0x90
     b50: cb000021     	sub	x1, x1, x0
     b54: d37ffc22     	lsr	x2, x1, #63
     b58: 8b810c41     	add	x1, x2, x1, asr #3
     b5c: 9341fc21     	asr	x1, x1, #1
     b60: b40000c1     	cbz	x1, 0xb78 <register_tm_clones+0x38>
     b64: d0000082     	adrp	x2, 0x12000 <__FRAME_END__+0xf584>
     b68: f947f042     	ldr	x2, [x2, #0xfe0]
     b6c: b4000062     	cbz	x2, 0xb78 <register_tm_clones+0x38>
     b70: aa0203f0     	mov	x16, x2
     b74: d61f0200     	br	x16
     b78: d65f03c0     	ret
     b7c: d503201f     	nop

0000000000000b80 <__do_global_dtors_aux>:
     b80: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
     b84: 910003fd     	mov	x29, sp
     b88: f9000bf3     	str	x19, [sp, #0x10]
     b8c: f0000093     	adrp	x19, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     b90: 39424260     	ldrb	w0, [x19, #0x90]
     b94: 35000140     	cbnz	w0, 0xbbc <__do_global_dtors_aux+0x3c>
     b98: d0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xf584>
     b9c: f947e400     	ldr	x0, [x0, #0xfc8]
     ba0: b4000080     	cbz	x0, 0xbb0 <__do_global_dtors_aux+0x30>
     ba4: f0000080     	adrp	x0, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     ba8: f9404400     	ldr	x0, [x0, #0x88]
     bac: 97ffff99     	bl	0xa10 <__cxa_finalize@plt>
     bb0: 97ffffd8     	bl	0xb10 <deregister_tm_clones>
     bb4: 52800020     	mov	w0, #0x1                // =1
     bb8: 39024260     	strb	w0, [x19, #0x90]
     bbc: f9400bf3     	ldr	x19, [sp, #0x10]
     bc0: a8c27bfd     	ldp	x29, x30, [sp], #0x20
     bc4: d65f03c0     	ret
     bc8: d503201f     	nop
     bcc: d503201f     	nop

0000000000000bd0 <frame_dummy>:
     bd0: 17ffffdc     	b	0xb40 <register_tm_clones>

0000000000000bd4 <main>:
     bd4: a9bd7bfd     	stp	x29, x30, [sp, #-0x30]!
     bd8: a90157f6     	stp	x22, x21, [sp, #0x10]
     bdc: a9024ff4     	stp	x20, x19, [sp, #0x20]
     be0: 910003fd     	mov	x29, sp
     be4: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8f0>
     be8: 911c0c00     	add	x0, x0, #0x703
     bec: 97ffff7d     	bl	0x9e0 <puts@plt>
     bf0: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8f0>
     bf4: 9115e000     	add	x0, x0, #0x578
     bf8: 52800801     	mov	w1, #0x40               // =64
     bfc: 52800202     	mov	w2, #0x10               // =16
     c00: 52800403     	mov	w3, #0x20               // =32
     c04: 97ffffa7     	bl	0xaa0 <printf@plt>
     c08: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8f0>
     c0c: 91167000     	add	x0, x0, #0x59c
     c10: 52810001     	mov	w1, #0x800              // =2048
     c14: 52800102     	mov	w2, #0x8                // =8
     c18: 52800203     	mov	w3, #0x10               // =16
     c1c: 97ffffa1     	bl	0xaa0 <printf@plt>
     c20: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8f0>
     c24: 9116f000     	add	x0, x0, #0x5bc
     c28: 528004c1     	mov	w1, #0x26               // =38
     c2c: 97ffff9d     	bl	0xaa0 <printf@plt>
     c30: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8f0>
     c34: 911cd400     	add	x0, x0, #0x735
     c38: 97ffff6a     	bl	0x9e0 <puts@plt>
     c3c: 2f00e401     	movi	d1, #0000000000000000
     c40: 1e6e1000     	fmov	d0, #1.00000000
     c44: 52800400     	mov	w0, #0x20               // =32
     c48: 52800801     	mov	w1, #0x40               // =64
     c4c: 52801002     	mov	w2, #0x80               // =128
     c50: 94000092     	bl	0xe98 <_Z9test_gemmIdEbiiiT_S0_>
     c54: 2a0003f3     	mov	w19, w0
     c58: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8f0>
     c5c: 911d3400     	add	x0, x0, #0x74d
     c60: 97ffff60     	bl	0x9e0 <puts@plt>
     c64: 2f00e401     	movi	d1, #0000000000000000
     c68: 1e6e1000     	fmov	d0, #1.00000000
     c6c: 52800400     	mov	w0, #0x20               // =32
     c70: 52800801     	mov	w1, #0x40               // =64
     c74: 52820002     	mov	w2, #0x1000             // =4096
     c78: 94000088     	bl	0xe98 <_Z9test_gemmIdEbiiiT_S0_>
     c7c: 72000268     	ands	w8, w19, #0x1
     c80: 52800029     	mov	w9, #0x1                // =1
     c84: 1a890529     	cinc	w9, w9, ne
     c88: 7200001f     	tst	w0, #0x1
     c8c: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8f0>
     c90: 911d9400     	add	x0, x0, #0x765
     c94: 1a881133     	csel	w19, w9, w8, ne
     c98: 97ffff52     	bl	0x9e0 <puts@plt>
     c9c: 1e601000     	fmov	d0, #2.00000000
     ca0: 1e6c1001     	fmov	d1, #0.50000000
     ca4: 52800400     	mov	w0, #0x20               // =32
     ca8: 52800801     	mov	w1, #0x40               // =64
     cac: 52820002     	mov	w2, #0x1000             // =4096
     cb0: 9400007a     	bl	0xe98 <_Z9test_gemmIdEbiiiT_S0_>
     cb4: 12000014     	and	w20, w0, #0x1
     cb8: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8f0>
     cbc: 911e0c00     	add	x0, x0, #0x783
     cc0: 97ffff48     	bl	0x9e0 <puts@plt>
     cc4: 2f00e401     	movi	d1, #0000000000000000
     cc8: 1e6e1000     	fmov	d0, #1.00000000
     ccc: 52800800     	mov	w0, #0x40               // =64
     cd0: 52801001     	mov	w1, #0x80               // =128
     cd4: 52810002     	mov	w2, #0x800              // =2048
     cd8: 94000070     	bl	0xe98 <_Z9test_gemmIdEbiiiT_S0_>
     cdc: 12000008     	and	w8, w0, #0x1
     ce0: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8f0>
     ce4: 91172400     	add	x0, x0, #0x5c9
     ce8: 0b080288     	add	w8, w20, w8
     cec: 0b080261     	add	w1, w19, w8
     cf0: 97ffff6c     	bl	0xaa0 <printf@plt>
     cf4: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8f0>
     cf8: 911e8000     	add	x0, x0, #0x7a0
     cfc: 97ffff39     	bl	0x9e0 <puts@plt>
     d00: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8f0>
     d04: 9117bc00     	add	x0, x0, #0x5ef
     d08: 52800801     	mov	w1, #0x40               // =64
     d0c: 52801002     	mov	w2, #0x80               // =128
     d10: 52820003     	mov	w3, #0x1000             // =4096
     d14: 52800044     	mov	w4, #0x2                // =2
     d18: 97ffff62     	bl	0xaa0 <printf@plt>
     d1c: 528004c0     	mov	w0, #0x26               // =38
     d20: 97ffff4c     	bl	0xa50 <omp_set_num_threads@plt>
     d24: 52a00400     	mov	w0, #0x200000           // =2097152
     d28: 97ffff22     	bl	0x9b0 <_Znam@plt>
     d2c: aa0003f3     	mov	x19, x0
     d30: 52a00800     	mov	w0, #0x400000           // =4194304
     d34: 97ffff1f     	bl	0x9b0 <_Znam@plt>
     d38: aa0003f4     	mov	x20, x0
     d3c: 52a00020     	mov	w0, #0x10000            // =65536
     d40: 97ffff1c     	bl	0x9b0 <_Znam@plt>
     d44: 25d8e3e0     	ptrue	p0.d
     d48: 04e14002     	index	z2.d, #0x0, #0x1
     d4c: 04e0e3e9     	cntd	x9
     d50: 05e03920     	mov	z0.d, x9
     d54: d0000009     	adrp	x9, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8f0>
     d58: 91156129     	add	x9, x9, #0x558
     d5c: aa0003f5     	mov	x21, x0
     d60: aa1f03e8     	mov	x8, xzr
     d64: 04623043     	mov	z3.d, z2.d
     d68: 85c0e121     	ld1rd	{ z1.d }, p0/z, [x9]
     d6c: 04335029     	addvl	x9, x19, #0x1
     d70: 04e00064     	add	z4.d, z3.d, z0.d
     d74: 65d0a063     	scvtf	z3.d, p0/m, z3.s
     d78: 0420bc85     	movprfx	z5, z4
     d7c: 65d0a085     	scvtf	z5.d, p0/m, z4.s
     d80: 65c108a5     	fmul	z5.d, z5.d, z1.d
     d84: 65c10863     	fmul	z3.d, z3.d, z1.d
     d88: e5e84263     	st1d	{ z3.d }, p0, [x19, x8, lsl #3]
     d8c: 04e00083     	add	z3.d, z4.d, z0.d
     d90: e5e84125     	st1d	{ z5.d }, p0, [x9, x8, lsl #3]
     d94: 04b0e3e8     	incw	x8
     d98: f141011f     	cmp	x8, #0x40, lsl #12      // =0x40000
     d9c: 54fffea1     	b.ne	0xd70 <main+0x19c>
     da0: aa1f03e8     	mov	x8, xzr
     da4: 04345029     	addvl	x9, x20, #0x1
     da8: 04e00043     	add	z3.d, z2.d, z0.d
     dac: 65d0a042     	scvtf	z2.d, p0/m, z2.s
     db0: 0420bc64     	movprfx	z4, z3
     db4: 65d0a064     	scvtf	z4.d, p0/m, z3.s
     db8: 65c10884     	fmul	z4.d, z4.d, z1.d
     dbc: 65c10842     	fmul	z2.d, z2.d, z1.d
     dc0: e5e84282     	st1d	{ z2.d }, p0, [x20, x8, lsl #3]
     dc4: 04e00062     	add	z2.d, z3.d, z0.d
     dc8: e5e84124     	st1d	{ z4.d }, p0, [x9, x8, lsl #3]
     dcc: 04b0e3e8     	incw	x8
     dd0: f142011f     	cmp	x8, #0x80, lsl #12      // =0x80000
     dd4: 54fffea1     	b.ne	0xda8 <main+0x1d4>
     dd8: aa1503e0     	mov	x0, x21
     ddc: 2a1f03e1     	mov	w1, wzr
     de0: 52a00022     	mov	w2, #0x10000            // =65536
     de4: 97ffff07     	bl	0xa00 <memset@plt>
     de8: 2f00e401     	movi	d1, #0000000000000000
     dec: 1e6e1000     	fmov	d0, #1.00000000
     df0: 52800800     	mov	w0, #0x40               // =64
     df4: 52801001     	mov	w1, #0x80               // =128
     df8: 52820002     	mov	w2, #0x1000             // =4096
     dfc: aa1303e3     	mov	x3, x19
     e00: aa1403e4     	mov	x4, x20
     e04: aa1503e5     	mov	x5, x21
     e08: 94000161     	bl	0x138c <_ZN4gemmIdE15compute_streamkEiiiPKdS2_Pddd>
     e0c: 97fffef1     	bl	0x9d0 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
     e10: 2f00e401     	movi	d1, #0000000000000000
     e14: 1e6e1000     	fmov	d0, #1.00000000
     e18: aa0003f6     	mov	x22, x0
     e1c: 52800800     	mov	w0, #0x40               // =64
     e20: 52801001     	mov	w1, #0x80               // =128
     e24: 52820002     	mov	w2, #0x1000             // =4096
     e28: aa1303e3     	mov	x3, x19
     e2c: aa1403e4     	mov	x4, x20
     e30: aa1503e5     	mov	x5, x21
     e34: 94000156     	bl	0x138c <_ZN4gemmIdE15compute_streamkEiiiPKdS2_Pddd>
     e38: 97fffee6     	bl	0x9d0 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
     e3c: cb160008     	sub	x8, x0, x22
     e40: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8f0>
     e44: 91183400     	add	x0, x0, #0x60d
     e48: 9e620101     	scvtf	d1, x8
     e4c: d2c80008     	mov	x8, #0x400000000000     // =70368744177664
     e50: f2e811e8     	movk	x8, #0x408f, lsl #48
     e54: 9e670100     	fmov	d0, x8
     e58: d2e83208     	mov	x8, #0x4190000000000000 // =4724276009111650304
     e5c: 9e670102     	fmov	d2, x8
     e60: 1e601820     	fdiv	d0, d1, d0
     e64: 1e611841     	fdiv	d1, d2, d1
     e68: 97ffff0e     	bl	0xaa0 <printf@plt>
     e6c: aa1303e0     	mov	x0, x19
     e70: 97fffef4     	bl	0xa40 <_ZdaPv@plt>
     e74: aa1403e0     	mov	x0, x20
     e78: 97fffef2     	bl	0xa40 <_ZdaPv@plt>
     e7c: aa1503e0     	mov	x0, x21
     e80: 97fffef0     	bl	0xa40 <_ZdaPv@plt>
     e84: 2a1f03e0     	mov	w0, wzr
     e88: a9424ff4     	ldp	x20, x19, [sp, #0x20]
     e8c: a94157f6     	ldp	x22, x21, [sp, #0x10]
     e90: a8c37bfd     	ldp	x29, x30, [sp], #0x30
     e94: d65f03c0     	ret

0000000000000e98 <_Z9test_gemmIdEbiiiT_S0_>:
     e98: d10283ff     	sub	sp, sp, #0xa0
     e9c: fd0013ea     	str	d10, [sp, #0x20]
     ea0: 6d0323e9     	stp	d9, d8, [sp, #0x30]
     ea4: a9047bfd     	stp	x29, x30, [sp, #0x40]
     ea8: a9056ffc     	stp	x28, x27, [sp, #0x50]
     eac: a90667fa     	stp	x26, x25, [sp, #0x60]
     eb0: a9075ff8     	stp	x24, x23, [sp, #0x70]
     eb4: a90857f6     	stp	x22, x21, [sp, #0x80]
     eb8: a9094ff4     	stp	x20, x19, [sp, #0x90]
     ebc: 910103fd     	add	x29, sp, #0x40
     ec0: 2a0203f3     	mov	w19, w2
     ec4: 2a0103f8     	mov	w24, w1
     ec8: 2a0003f9     	mov	w25, w0
     ecc: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8f0>
     ed0: 9118cc00     	add	x0, x0, #0x633
     ed4: d0000001     	adrp	x1, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8f0>
     ed8: 9118b021     	add	x1, x1, #0x62c
     edc: 2a1903e2     	mov	w2, w25
     ee0: 2a1803e3     	mov	w3, w24
     ee4: 2a1303e4     	mov	w4, w19
     ee8: 1e604028     	fmov	d8, d1
     eec: 1e604009     	fmov	d9, d0
     ef0: 97fffeec     	bl	0xaa0 <printf@plt>
     ef4: 528004c0     	mov	w0, #0x26               // =38
     ef8: 97fffed6     	bl	0xa50 <omp_set_num_threads@plt>
     efc: 1b197e68     	mul	w8, w19, w25
     f00: d37d7d00     	ubfiz	x0, x8, #3, #32
     f04: 97fffeab     	bl	0x9b0 <_Znam@plt>
     f08: 1b187e68     	mul	w8, w19, w24
     f0c: aa0003fb     	mov	x27, x0
     f10: d37d7d08     	ubfiz	x8, x8, #3, #32
     f14: aa0803e0     	mov	x0, x8
     f18: 97fffea6     	bl	0x9b0 <_Znam@plt>
     f1c: 1b197f08     	mul	w8, w24, w25
     f20: aa0003f4     	mov	x20, x0
     f24: d37d7d16     	ubfiz	x22, x8, #3, #32
     f28: f9000be8     	str	x8, [sp, #0x10]
     f2c: aa1603e0     	mov	x0, x22
     f30: 97fffea0     	bl	0x9b0 <_Znam@plt>
     f34: f9000fe0     	str	x0, [sp, #0x18]
     f38: aa1603e0     	mov	x0, x22
     f3c: aa1603f5     	mov	x21, x22
     f40: 97fffe9c     	bl	0x9b0 <_Znam@plt>
     f44: 04bf502a     	rdvl	x10, #0x1
     f48: 25d8e3e0     	ptrue	p0.d
     f4c: 04e0e3eb     	cntd	x11
     f50: d344fd5c     	lsr	x28, x10, #4
     f54: 321e73ea     	mov	w10, #0x7ffffffc        // =2147483644
     f58: 04e14004     	index	z4.d, #0x0, #0x1
     f5c: d000000d     	adrp	x13, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8f0>
     f60: 911581ad     	add	x13, x13, #0x560
     f64: 05e03963     	mov	z3.d, x11
     f68: 9b0a7f8a     	mul	x10, x28, x10
     f6c: d000000b     	adrp	x11, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8f0>
     f70: d000000c     	adrp	x12, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8f0>
     f74: 2a1903f7     	mov	w23, w25
     f78: fd42ad61     	ldr	d1, [x11, #0x558]
     f7c: fd42b182     	ldr	d2, [x12, #0x560]
     f80: aa0003f6     	mov	x22, x0
     f84: 2a1f03e8     	mov	w8, wzr
     f88: aa1f03e9     	mov	x9, xzr
     f8c: 85c0e1a0     	ld1rd	{ z0.d }, p0/z, [x13]
     f90: b9000ff3     	str	w19, [sp, #0xc]
     f94: 2a1303fa     	mov	w26, w19
     f98: 04a0e3f3     	cntw	x19
     f9c: 8a17014a     	and	x10, x10, x23
     fa0: 14000004     	b	0xfb0 <_Z9test_gemmIdEbiiiT_S0_+0x118>
     fa4: eb1a013f     	cmp	x9, x26
     fa8: 0b190108     	add	w8, w8, w25
     fac: 540004c0     	b.eq	0x1044 <_Z9test_gemmIdEbiiiT_S0_+0x1ac>
     fb0: 91000529     	add	x9, x9, #0x1
     fb4: 8b284f6b     	add	x11, x27, w8, uxtw #3
     fb8: eb17027f     	cmp	x19, x23
     fbc: 1e620125     	scvtf	d5, w9
     fc0: 1e6108a5     	fmul	d5, d5, d1
     fc4: 54000069     	b.ls	0xfd0 <_Z9test_gemmIdEbiiiT_S0_+0x138>
     fc8: aa1f03ec     	mov	x12, xzr
     fcc: 14000016     	b	0x1024 <_Z9test_gemmIdEbiiiT_S0_+0x18c>
     fd0: 052820a6     	mov	z6.d, d5
     fd4: 04643087     	mov	z7.d, z4.d
     fd8: aa1f03ec     	mov	x12, xzr
     fdc: 042b502d     	addvl	x13, x11, #0x1
     fe0: 04e300f0     	add	z16.d, z7.d, z3.d
     fe4: 25e0c027     	add	z7.d, z7.d, #0x1        // =1
     fe8: 04e30211     	add	z17.d, z16.d, z3.d
     fec: 25e0c030     	add	z16.d, z16.d, #0x1      // =1
     ff0: 65d0a0e7     	scvtf	z7.d, p0/m, z7.s
     ff4: 65d0a210     	scvtf	z16.d, p0/m, z16.s
     ff8: 65e68007     	fmad	z7.d, p0/m, z0.d, z6.d
     ffc: 65e68010     	fmad	z16.d, p0/m, z0.d, z6.d
    1000: e5ec4167     	st1d	{ z7.d }, p0, [x11, x12, lsl #3]
    1004: 04713227     	mov	z7.d, z17.d
    1008: e5ec41b0     	st1d	{ z16.d }, p0, [x13, x12, lsl #3]
    100c: 04b0e3ec     	incw	x12
    1010: eb0c015f     	cmp	x10, x12
    1014: 54fffe61     	b.ne	0xfe0 <_Z9test_gemmIdEbiiiT_S0_+0x148>
    1018: eb17015f     	cmp	x10, x23
    101c: aa0a03ec     	mov	x12, x10
    1020: 54fffc20     	b.eq	0xfa4 <_Z9test_gemmIdEbiiiT_S0_+0x10c>
    1024: 9100058d     	add	x13, x12, #0x1
    1028: 1e6201a6     	scvtf	d6, w13
    102c: eb0d02ff     	cmp	x23, x13
    1030: 1f4214c6     	fmadd	d6, d6, d2, d5
    1034: fc2c7966     	str	d6, [x11, x12, lsl #3]
    1038: aa0d03ec     	mov	x12, x13
    103c: 54ffff41     	b.ne	0x1024 <_Z9test_gemmIdEbiiiT_S0_+0x18c>
    1040: 17ffffd9     	b	0xfa4 <_Z9test_gemmIdEbiiiT_S0_+0x10c>
    1044: d37ffb8b     	lsl	x11, x28, #1
    1048: 5301038a     	lsl	w10, w28, #31
    104c: 04e14003     	index	z3.d, #0x0, #0x1
    1050: f81e83bb     	stur	x27, [x29, #-0x18]
    1054: 2a1803fb     	mov	w27, w24
    1058: 2a1f03e8     	mov	w8, wzr
    105c: 05e03964     	mov	z4.d, x11
    1060: b000000b     	adrp	x11, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8f0>
    1064: 9115616b     	add	x11, x11, #0x558
    1068: 4b1c094a     	sub	w10, w10, w28, lsl #2
    106c: 85c0e165     	ld1rd	{ z5.d }, p0/z, [x11]
    1070: aa1f03e9     	mov	x9, xzr
    1074: 8a1b014a     	and	x10, x10, x27
    1078: 14000004     	b	0x1088 <_Z9test_gemmIdEbiiiT_S0_+0x1f0>
    107c: eb1a013f     	cmp	x9, x26
    1080: 0b180108     	add	w8, w8, w24
    1084: 54000500     	b.eq	0x1124 <_Z9test_gemmIdEbiiiT_S0_+0x28c>
    1088: 91000529     	add	x9, x9, #0x1
    108c: 8b284e8b     	add	x11, x20, w8, uxtw #3
    1090: eb1b027f     	cmp	x19, x27
    1094: 1e620126     	scvtf	d6, w9
    1098: 54000069     	b.ls	0x10a4 <_Z9test_gemmIdEbiiiT_S0_+0x20c>
    109c: aa1f03ec     	mov	x12, xzr
    10a0: 14000018     	b	0x1100 <_Z9test_gemmIdEbiiiT_S0_+0x268>
    10a4: 052820c7     	mov	z7.d, d6
    10a8: 04633070     	mov	z16.d, z3.d
    10ac: aa1f03ec     	mov	x12, xzr
    10b0: 042b502d     	addvl	x13, x11, #0x1
    10b4: 04e40211     	add	z17.d, z16.d, z4.d
    10b8: 25e0c030     	add	z16.d, z16.d, #0x1      // =1
    10bc: 04e40232     	add	z18.d, z17.d, z4.d
    10c0: 25e0c031     	add	z17.d, z17.d, #0x1      // =1
    10c4: 65d0a210     	scvtf	z16.d, p0/m, z16.s
    10c8: 65d0a231     	scvtf	z17.d, p0/m, z17.s
    10cc: 65c00a10     	fmul	z16.d, z16.d, z0.d
    10d0: 65c00a31     	fmul	z17.d, z17.d, z0.d
    10d4: 65e500f0     	fmla	z16.d, p0/m, z7.d, z5.d
    10d8: 65e500f1     	fmla	z17.d, p0/m, z7.d, z5.d
    10dc: e5ec4170     	st1d	{ z16.d }, p0, [x11, x12, lsl #3]
    10e0: 04723250     	mov	z16.d, z18.d
    10e4: e5ec41b1     	st1d	{ z17.d }, p0, [x13, x12, lsl #3]
    10e8: 04b0e3ec     	incw	x12
    10ec: eb0c015f     	cmp	x10, x12
    10f0: 54fffe21     	b.ne	0x10b4 <_Z9test_gemmIdEbiiiT_S0_+0x21c>
    10f4: eb1b015f     	cmp	x10, x27
    10f8: aa0a03ec     	mov	x12, x10
    10fc: 54fffc00     	b.eq	0x107c <_Z9test_gemmIdEbiiiT_S0_+0x1e4>
    1100: 9100058d     	add	x13, x12, #0x1
    1104: 1e6201a7     	scvtf	d7, w13
    1108: eb0d037f     	cmp	x27, x13
    110c: 1e6208e7     	fmul	d7, d7, d2
    1110: 1f411cc7     	fmadd	d7, d6, d1, d7
    1114: fc2c7967     	str	d7, [x11, x12, lsl #3]
    1118: aa0d03ec     	mov	x12, x13
    111c: 54ffff21     	b.ne	0x1100 <_Z9test_gemmIdEbiiiT_S0_+0x268>
    1120: 17ffffd7     	b	0x107c <_Z9test_gemmIdEbiiiT_S0_+0x1e4>
    1124: f9400fe0     	ldr	x0, [sp, #0x18]
    1128: 2a1f03e1     	mov	w1, wzr
    112c: aa1503e2     	mov	x2, x21
    1130: 97fffe34     	bl	0xa00 <memset@plt>
    1134: aa1603e0     	mov	x0, x22
    1138: 2a1f03e1     	mov	w1, wzr
    113c: aa1503e2     	mov	x2, x21
    1140: 97fffe30     	bl	0xa00 <memset@plt>
    1144: 25d8e3e0     	ptrue	p0.d
    1148: 9bbc7eea     	umull	x10, w23, w28
    114c: f100227f     	cmp	x19, #0x8
    1150: 9bbc7f6b     	umull	x11, w27, w28
    1154: 52800109     	mov	w9, #0x8                // =8
    1158: d37df36c     	lsl	x12, x27, #3
    115c: 9a898269     	csel	x9, x19, x9, hi
    1160: 7100073f     	cmp	w25, #0x1
    1164: d37df2ed     	lsl	x13, x23, #3
    1168: 7a410b00     	ccmp	w24, #0x1, #0x0, eq
    116c: d37be94a     	lsl	x10, x10, #5
    1170: f85e83b0     	ldur	x16, [x29, #-0x18]
    1174: d37be96b     	lsl	x11, x11, #5
    1178: aa1f03e8     	mov	x8, xzr
    117c: 1a9f07ee     	cset	w14, ne
    1180: 1280006f     	mov	w15, #-0x4              // =-4
    1184: 14000005     	b	0x1198 <_Z9test_gemmIdEbiiiT_S0_+0x300>
    1188: 91000508     	add	x8, x8, #0x1
    118c: 91002210     	add	x16, x16, #0x8
    1190: eb17011f     	cmp	x8, x23
    1194: 54000620     	b.eq	0x1258 <_Z9test_gemmIdEbiiiT_S0_+0x3c0>
    1198: 9b1b7d12     	mul	x18, x8, x27
    119c: aa1f03f1     	mov	x17, xzr
    11a0: aa1403e0     	mov	x0, x20
    11a4: 8b120ed2     	add	x18, x22, x18, lsl #3
    11a8: 14000007     	b	0x11c4 <_Z9test_gemmIdEbiiiT_S0_+0x32c>
    11ac: 1f402120     	fmadd	d0, d9, d0, d8
    11b0: 91002000     	add	x0, x0, #0x8
    11b4: fc317a40     	str	d0, [x18, x17, lsl #3]
    11b8: 91000631     	add	x17, x17, #0x1
    11bc: eb1b023f     	cmp	x17, x27
    11c0: 54fffe40     	b.eq	0x1188 <_Z9test_gemmIdEbiiiT_S0_+0x2f0>
    11c4: eb1a013f     	cmp	x9, x26
    11c8: 1a9f95c1     	csinc	w1, w14, wzr, ls
    11cc: 36000081     	tbz	w1, #0x0, 0x11dc <_Z9test_gemmIdEbiiiT_S0_+0x344>
    11d0: 2f00e400     	movi	d0, #0000000000000000
    11d4: aa1f03e1     	mov	x1, xzr
    11d8: 14000015     	b	0x122c <_Z9test_gemmIdEbiiiT_S0_+0x394>
    11dc: 9b0f7f81     	mul	x1, x28, x15
    11e0: 2f00e400     	movi	d0, #0000000000000000
    11e4: aa0003e3     	mov	x3, x0
    11e8: aa1003e4     	mov	x4, x16
    11ec: 8a1a0021     	and	x1, x1, x26
    11f0: aa0103e2     	mov	x2, x1
    11f4: a5e0a081     	ld1d	{ z1.d }, p0/z, [x4]
    11f8: a5e0a062     	ld1d	{ z2.d }, p0/z, [x3]
    11fc: 04b0e7e2     	decw	x2
    1200: 65c20821     	fmul	z1.d, z1.d, z2.d
    1204: a5e1a062     	ld1d	{ z2.d }, p0/z, [x3, #0x1, mul vl]
    1208: 8b0b0063     	add	x3, x3, x11
    120c: 65d82020     	fadda	d0, p0, d0, z1.d
    1210: a5e1a081     	ld1d	{ z1.d }, p0/z, [x4, #0x1, mul vl]
    1214: 8b0a0084     	add	x4, x4, x10
    1218: 65c20821     	fmul	z1.d, z1.d, z2.d
    121c: 65d82020     	fadda	d0, p0, d0, z1.d
    1220: b5fffea2     	cbnz	x2, 0x11f4 <_Z9test_gemmIdEbiiiT_S0_+0x35c>
    1224: eb1a003f     	cmp	x1, x26
    1228: 54fffc20     	b.eq	0x11ac <_Z9test_gemmIdEbiiiT_S0_+0x314>
    122c: 9b017d82     	mul	x2, x12, x1
    1230: 9b017da3     	mul	x3, x13, x1
    1234: cb010341     	sub	x1, x26, x1
    1238: fc636a01     	ldr	d1, [x16, x3]
    123c: fc626802     	ldr	d2, [x0, x2]
    1240: f1000421     	subs	x1, x1, #0x1
    1244: 8b0c0042     	add	x2, x2, x12
    1248: 8b0d0063     	add	x3, x3, x13
    124c: 1f420020     	fmadd	d0, d1, d2, d0
    1250: 54ffff41     	b.ne	0x1238 <_Z9test_gemmIdEbiiiT_S0_+0x3a0>
    1254: 17ffffd6     	b	0x11ac <_Z9test_gemmIdEbiiiT_S0_+0x314>
    1258: 1e604120     	fmov	d0, d9
    125c: 1e604101     	fmov	d1, d8
    1260: f85e83ba     	ldur	x26, [x29, #-0x18]
    1264: f9400ff5     	ldr	x21, [sp, #0x18]
    1268: b9400fe2     	ldr	w2, [sp, #0xc]
    126c: 2a1903e0     	mov	w0, w25
    1270: 2a1803e1     	mov	w1, w24
    1274: aa1a03e3     	mov	x3, x26
    1278: aa1403e4     	mov	x4, x20
    127c: aa1503e5     	mov	x5, x21
    1280: 94000043     	bl	0x138c <_ZN4gemmIdE15compute_streamkEiiiPKdS2_Pddd>
    1284: 2f00e408     	movi	d8, #0000000000000000
    1288: b0000008     	adrp	x8, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8f0>
    128c: f9400bfb     	ldr	x27, [sp, #0x10]
    1290: fd42b509     	ldr	d9, [x8, #0x568]
    1294: b0000008     	adrp	x8, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8f0>
    1298: aa1f03f8     	mov	x24, xzr
    129c: fd42b90a     	ldr	d10, [x8, #0x570]
    12a0: b0000019     	adrp	x25, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8f0>
    12a4: 9119d339     	add	x25, x25, #0x674
    12a8: 52800033     	mov	w19, #0x1               // =1
    12ac: b0000017     	adrp	x23, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8f0>
    12b0: 911b3af7     	add	x23, x23, #0x6ce
    12b4: 14000007     	b	0x12d0 <_Z9test_gemmIdEbiiiT_S0_+0x438>
    12b8: 1e6a2040     	fcmp	d2, d10
    12bc: 91000718     	add	x24, x24, #0x1
    12c0: 1a9fc7e8     	cset	w8, le
    12c4: eb1b031f     	cmp	x24, x27
    12c8: 0a130113     	and	w19, w8, w19
    12cc: 540002a0     	b.eq	0x1320 <_Z9test_gemmIdEbiiiT_S0_+0x488>
    12d0: d37df308     	lsl	x8, x24, #3
    12d4: fc686ac1     	ldr	d1, [x22, x8]
    12d8: fc686aa0     	ldr	d0, [x21, x8]
    12dc: 1e60c022     	fabs	d2, d1
    12e0: 7ee1d403     	fabd	d3, d0, d1
    12e4: 1e692842     	fadd	d2, d2, d9
    12e8: 1e621862     	fdiv	d2, d3, d2
    12ec: 1e682040     	fcmp	d2, d8
    12f0: 1e68cc48     	fcsel	d8, d2, d8, gt
    12f4: 1e6a2040     	fcmp	d2, d10
    12f8: 54fffe0d     	b.le	0x12b8 <_Z9test_gemmIdEbiiiT_S0_+0x420>
    12fc: 3607fdf3     	tbz	w19, #0x0, 0x12b8 <_Z9test_gemmIdEbiiiT_S0_+0x420>
    1300: aa1903e0     	mov	x0, x25
    1304: 2a1803e1     	mov	w1, w24
    1308: 97fffde6     	bl	0xaa0 <printf@plt>
    130c: 91000718     	add	x24, x24, #0x1
    1310: 2a1f03f3     	mov	w19, wzr
    1314: eb1b031f     	cmp	x24, x27
    1318: 54fffdc1     	b.ne	0x12d0 <_Z9test_gemmIdEbiiiT_S0_+0x438>
    131c: 14000006     	b	0x1334 <_Z9test_gemmIdEbiiiT_S0_+0x49c>
    1320: 7100027f     	cmp	w19, #0x0
    1324: b0000008     	adrp	x8, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8f0>
    1328: 911ac108     	add	x8, x8, #0x6b0
    132c: 13000273     	sbfx	w19, w19, #0, #1
    1330: 9a971117     	csel	x23, x8, x23, ne
    1334: 1e604100     	fmov	d0, d8
    1338: aa1703e0     	mov	x0, x23
    133c: 97fffdd9     	bl	0xaa0 <printf@plt>
    1340: aa1a03e0     	mov	x0, x26
    1344: 97fffdbf     	bl	0xa40 <_ZdaPv@plt>
    1348: aa1403e0     	mov	x0, x20
    134c: 97fffdbd     	bl	0xa40 <_ZdaPv@plt>
    1350: aa1503e0     	mov	x0, x21
    1354: 97fffdbb     	bl	0xa40 <_ZdaPv@plt>
    1358: aa1603e0     	mov	x0, x22
    135c: 97fffdb9     	bl	0xa40 <_ZdaPv@plt>
    1360: 12000260     	and	w0, w19, #0x1
    1364: a9494ff4     	ldp	x20, x19, [sp, #0x90]
    1368: fd4013ea     	ldr	d10, [sp, #0x20]
    136c: a94857f6     	ldp	x22, x21, [sp, #0x80]
    1370: a9475ff8     	ldp	x24, x23, [sp, #0x70]
    1374: a94667fa     	ldp	x26, x25, [sp, #0x60]
    1378: a9456ffc     	ldp	x28, x27, [sp, #0x50]
    137c: a9447bfd     	ldp	x29, x30, [sp, #0x40]
    1380: 6d4323e9     	ldp	d9, d8, [sp, #0x30]
    1384: 910283ff     	add	sp, sp, #0xa0
    1388: d65f03c0     	ret

000000000000138c <_ZN4gemmIdE15compute_streamkEiiiPKdS2_Pddd>:
    138c: d10283ff     	sub	sp, sp, #0xa0
    1390: a9067bfd     	stp	x29, x30, [sp, #0x60]
    1394: f9003bf7     	str	x23, [sp, #0x70]
    1398: a90857f6     	stp	x22, x21, [sp, #0x80]
    139c: a9094ff4     	stp	x20, x19, [sp, #0x90]
    13a0: 910183fd     	add	x29, sp, #0x60
    13a4: 2a0203f3     	mov	w19, w2
    13a8: 2a0103f6     	mov	w22, w1
    13ac: 2a0003f7     	mov	w23, w0
    13b0: b81fc3a2     	stur	w2, [x29, #-0x4]
    13b4: 290303a1     	stp	w1, w0, [x29, #0x18]
    13b8: a93e8fa4     	stp	x4, x3, [x29, #-0x18]
    13bc: f81e03a5     	stur	x5, [x29, #-0x20]
    13c0: fc1d83a0     	stur	d0, [x29, #-0x28]
    13c4: fd001be1     	str	d1, [sp, #0x30]
    13c8: 97fffdaa     	bl	0xa70 <omp_get_max_threads@plt>
    13cc: 2a0003f4     	mov	w20, w0
    13d0: 7100001f     	cmp	w0, #0x0
    13d4: b9002fe0     	str	w0, [sp, #0x2c]
    13d8: 937d7e88     	sbfiz	x8, x20, #3, #32
    13dc: da9fa100     	csinv	x0, x8, xzr, ge
    13e0: 97fffd74     	bl	0x9b0 <_Znam@plt>
    13e4: 7100069f     	cmp	w20, #0x1
    13e8: f90013e0     	str	x0, [sp, #0x20]
    13ec: 540001ab     	b.lt	0x1420 <_ZN4gemmIdE15compute_streamkEiiiPKdS2_Pddd+0x94>
    13f0: 1b177ec8     	mul	w8, w22, w23
    13f4: aa0003f5     	mov	x21, x0
    13f8: 2a1403f7     	mov	w23, w20
    13fc: d37d7d16     	ubfiz	x22, x8, #3, #32
    1400: aa1603e0     	mov	x0, x22
    1404: 97fffd6b     	bl	0x9b0 <_Znam@plt>
    1408: 2a1f03e1     	mov	w1, wzr
    140c: aa1603e2     	mov	x2, x22
    1410: f80086a0     	str	x0, [x21], #0x8
    1414: 97fffd7b     	bl	0xa00 <memset@plt>
    1418: f10006f7     	subs	x23, x23, #0x1
    141c: 54ffff21     	b.ne	0x1400 <_ZN4gemmIdE15compute_streamkEiiiPKdS2_Pddd+0x74>
    1420: 0b130288     	add	w8, w20, w19
    1424: b0000093     	adrp	x19, 0x12000 <__FRAME_END__+0xf584>
    1428: 9135a273     	add	x19, x19, #0xd68
    142c: 51000508     	sub	w8, w8, #0x1
    1430: d10063a9     	sub	x9, x29, #0x18
    1434: 90000002     	adrp	x2, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0x168>
    1438: 9113f042     	add	x2, x2, #0x4fc
    143c: 1ad40d08     	sdiv	w8, w8, w20
    1440: 910073e3     	add	x3, sp, #0x1c
    1444: d10013a4     	sub	x4, x29, #0x4
    1448: 910073a5     	add	x5, x29, #0x1c
    144c: 910063a6     	add	x6, x29, #0x18
    1450: d10043a7     	sub	x7, x29, #0x10
    1454: aa1303e0     	mov	x0, x19
    1458: 528000e1     	mov	w1, #0x7                // =7
    145c: b9001fe8     	str	w8, [sp, #0x1c]
    1460: 910083e8     	add	x8, sp, #0x20
    1464: a90023e9     	stp	x9, x8, [sp]
    1468: 97fffd86     	bl	0xa80 <__kmpc_fork_call@plt>
    146c: 9100c3e8     	add	x8, sp, #0x30
    1470: d100a3a9     	sub	x9, x29, #0x28
    1474: 90000002     	adrp	x2, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0x168>
    1478: 91168042     	add	x2, x2, #0x5a0
    147c: 910073a3     	add	x3, x29, #0x1c
    1480: 910063a4     	add	x4, x29, #0x18
    1484: 9100b3e5     	add	x5, sp, #0x2c
    1488: 910083e6     	add	x6, sp, #0x20
    148c: d10083a7     	sub	x7, x29, #0x20
    1490: aa1303e0     	mov	x0, x19
    1494: 528000e1     	mov	w1, #0x7                // =7
    1498: a90023e9     	stp	x9, x8, [sp]
    149c: 97fffd79     	bl	0xa80 <__kmpc_fork_call@plt>
    14a0: b9402fe8     	ldr	w8, [sp, #0x2c]
    14a4: 7100051f     	cmp	w8, #0x1
    14a8: 5400018b     	b.lt	0x14d8 <_ZN4gemmIdE15compute_streamkEiiiPKdS2_Pddd+0x14c>
    14ac: aa1f03f3     	mov	x19, xzr
    14b0: 14000004     	b	0x14c0 <_ZN4gemmIdE15compute_streamkEiiiPKdS2_Pddd+0x134>
    14b4: 91000673     	add	x19, x19, #0x1
    14b8: eb28c27f     	cmp	x19, w8, sxtw
    14bc: 540000ea     	b.ge	0x14d8 <_ZN4gemmIdE15compute_streamkEiiiPKdS2_Pddd+0x14c>
    14c0: f94013e9     	ldr	x9, [sp, #0x20]
    14c4: f8737920     	ldr	x0, [x9, x19, lsl #3]
    14c8: b4ffff60     	cbz	x0, 0x14b4 <_ZN4gemmIdE15compute_streamkEiiiPKdS2_Pddd+0x128>
    14cc: 97fffd5d     	bl	0xa40 <_ZdaPv@plt>
    14d0: b9402fe8     	ldr	w8, [sp, #0x2c]
    14d4: 17fffff8     	b	0x14b4 <_ZN4gemmIdE15compute_streamkEiiiPKdS2_Pddd+0x128>
    14d8: f94013e0     	ldr	x0, [sp, #0x20]
    14dc: b4000040     	cbz	x0, 0x14e4 <_ZN4gemmIdE15compute_streamkEiiiPKdS2_Pddd+0x158>
    14e0: 97fffd58     	bl	0xa40 <_ZdaPv@plt>
    14e4: a9494ff4     	ldp	x20, x19, [sp, #0x90]
    14e8: f9403bf7     	ldr	x23, [sp, #0x70]
    14ec: a94857f6     	ldp	x22, x21, [sp, #0x80]
    14f0: a9467bfd     	ldp	x29, x30, [sp, #0x60]
    14f4: 910283ff     	add	sp, sp, #0xa0
    14f8: d65f03c0     	ret

00000000000014fc <_ZN4gemmIdE15compute_streamkEiiiPKdS2_Pddd.omp_outlined>:
    14fc: a9bb7bfd     	stp	x29, x30, [sp, #-0x50]!
    1500: f9000bf9     	str	x25, [sp, #0x10]
    1504: a9025ff8     	stp	x24, x23, [sp, #0x20]
    1508: a90357f6     	stp	x22, x21, [sp, #0x30]
    150c: a9044ff4     	stp	x20, x19, [sp, #0x40]
    1510: 910003fd     	mov	x29, sp
    1514: f9402bb9     	ldr	x25, [x29, #0x50]
    1518: aa0703f3     	mov	x19, x7
    151c: aa0603f4     	mov	x20, x6
    1520: aa0503f5     	mov	x21, x5
    1524: aa0403f6     	mov	x22, x4
    1528: aa0303f7     	mov	x23, x3
    152c: aa0203f8     	mov	x24, x2
    1530: 97fffd40     	bl	0xa30 <omp_get_thread_num@plt>
    1534: b9400308     	ldr	w8, [x24]
    1538: b94002e9     	ldr	w9, [x23]
    153c: 1b007d02     	mul	w2, w8, w0
    1540: 6b09005f     	cmp	w2, w9
    1544: 5400022a     	b.ge	0x1588 <_ZN4gemmIdE15compute_streamkEiiiPKdS2_Pddd.omp_outlined+0x8c>
    1548: f940032b     	ldr	x11, [x25]
    154c: 0b08004a     	add	w10, w2, w8
    1550: b94002c8     	ldr	w8, [x22]
    1554: 6b09015f     	cmp	w10, w9
    1558: b94002a1     	ldr	w1, [x21]
    155c: f9400284     	ldr	x4, [x20]
    1560: f9400265     	ldr	x5, [x19]
    1564: f860d966     	ldr	x6, [x11, w0, sxtw #3]
    1568: 1a89b143     	csel	w3, w10, w9, lt
    156c: 2a0803e0     	mov	w0, w8
    1570: a9444ff4     	ldp	x20, x19, [sp, #0x40]
    1574: f9400bf9     	ldr	x25, [sp, #0x10]
    1578: a94357f6     	ldp	x22, x21, [sp, #0x30]
    157c: a9425ff8     	ldp	x24, x23, [sp, #0x20]
    1580: a8c57bfd     	ldp	x29, x30, [sp], #0x50
    1584: 14000063     	b	0x1710 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd>
    1588: a9444ff4     	ldp	x20, x19, [sp, #0x40]
    158c: f9400bf9     	ldr	x25, [sp, #0x10]
    1590: a94357f6     	ldp	x22, x21, [sp, #0x30]
    1594: a9425ff8     	ldp	x24, x23, [sp, #0x20]
    1598: a8c57bfd     	ldp	x29, x30, [sp], #0x50
    159c: d65f03c0     	ret

00000000000015a0 <_ZN4gemmIdE15compute_streamkEiiiPKdS2_Pddd.omp_outlined.17>:
    15a0: b9400048     	ldr	w8, [x2]
    15a4: 7100051f     	cmp	w8, #0x1
    15a8: 54000b2b     	b.lt	0x170c <_ZN4gemmIdE15compute_streamkEiiiPKdS2_Pddd.omp_outlined.17+0x16c>
    15ac: b9400069     	ldr	w9, [x3]
    15b0: 7100053f     	cmp	w9, #0x1
    15b4: 54000acb     	b.lt	0x170c <_ZN4gemmIdE15compute_streamkEiiiPKdS2_Pddd.omp_outlined.17+0x16c>
    15b8: d10203ff     	sub	sp, sp, #0x80
    15bc: a9037bfd     	stp	x29, x30, [sp, #0x30]
    15c0: a90467fa     	stp	x26, x25, [sp, #0x40]
    15c4: a9055ff8     	stp	x24, x23, [sp, #0x50]
    15c8: a90657f6     	stp	x22, x21, [sp, #0x60]
    15cc: a9074ff4     	stp	x20, x19, [sp, #0x70]
    15d0: 9100c3fd     	add	x29, sp, #0x30
    15d4: 93407d35     	sxtw	x21, w9
    15d8: 92800009     	mov	x9, #-0x1               // =-1
    15dc: b9400014     	ldr	w20, [x0]
    15e0: aa0703f3     	mov	x19, x7
    15e4: aa0403f9     	mov	x25, x4
    15e8: aa0303f8     	mov	x24, x3
    15ec: 9b0826ba     	madd	x26, x21, x8, x9
    15f0: aa0603f7     	mov	x23, x6
    15f4: aa0503f6     	mov	x22, x5
    15f8: 52800028     	mov	w8, #0x1                // =1
    15fc: b0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xf584>
    1600: 91360000     	add	x0, x0, #0xd80
    1604: 910053e3     	add	x3, sp, #0x14
    1608: d10023a4     	sub	x4, x29, #0x8
    160c: d10043a5     	sub	x5, x29, #0x10
    1610: 910063e6     	add	x6, sp, #0x18
    1614: 2a1403e1     	mov	w1, w20
    1618: 52800442     	mov	w2, #0x22               // =34
    161c: 52800027     	mov	w7, #0x1                // =1
    1620: f9000fe8     	str	x8, [sp, #0x18]
    1624: a93f7fba     	stp	x26, xzr, [x29, #-0x10]
    1628: b90017ff     	str	wzr, [sp, #0x14]
    162c: f90003e8     	str	x8, [sp]
    1630: 97fffcf0     	bl	0x9f0 <__kmpc_for_static_init_8@plt>
    1634: a97f23a9     	ldp	x9, x8, [x29, #-0x10]
    1638: eb1a013f     	cmp	x9, x26
    163c: 9a9ab12b     	csel	x11, x9, x26, lt
    1640: eb0b011f     	cmp	x8, x11
    1644: f81f03ab     	stur	x11, [x29, #-0x10]
    1648: 540004ec     	b.gt	0x16e4 <_ZN4gemmIdE15compute_streamkEiiiPKdS2_Pddd.omp_outlined.17+0x144>
    164c: b940032d     	ldr	w13, [x25]
    1650: f9402ba9     	ldr	x9, [x29, #0x50]
    1654: b940030c     	ldr	w12, [x24]
    1658: f94002ea     	ldr	x10, [x23]
    165c: 710001bf     	cmp	w13, #0x0
    1660: 540002ad     	b.le	0x16b4 <_ZN4gemmIdE15compute_streamkEiiiPKdS2_Pddd.omp_outlined.17+0x114>
    1664: f94002ce     	ldr	x14, [x22]
    1668: 9ad50d0f     	sdiv	x15, x8, x21
    166c: 2f00e400     	movi	d0, #0000000000000000
    1670: aa0d03f1     	mov	x17, x13
    1674: 1b15a1f0     	msub	w16, w15, w21, w8
    1678: 1b0f418f     	madd	w15, w12, w15, w16
    167c: aa0e03f0     	mov	x16, x14
    1680: f8408612     	ldr	x18, [x16], #0x8
    1684: f1000631     	subs	x17, x17, #0x1
    1688: fc6fda41     	ldr	d1, [x18, w15, sxtw #3]
    168c: 1e612800     	fadd	d0, d0, d1
    1690: 54ffff81     	b.ne	0x1680 <_ZN4gemmIdE15compute_streamkEiiiPKdS2_Pddd.omp_outlined.17+0xe0>
    1694: fd400261     	ldr	d1, [x19]
    1698: fd400122     	ldr	d2, [x9]
    169c: eb0b011f     	cmp	x8, x11
    16a0: 91000508     	add	x8, x8, #0x1
    16a4: 1f400820     	fmadd	d0, d1, d0, d2
    16a8: fc2fd940     	str	d0, [x10, w15, sxtw #3]
    16ac: 54fffde1     	b.ne	0x1668 <_ZN4gemmIdE15compute_streamkEiiiPKdS2_Pddd.omp_outlined.17+0xc8>
    16b0: 1400000d     	b	0x16e4 <_ZN4gemmIdE15compute_streamkEiiiPKdS2_Pddd.omp_outlined.17+0x144>
    16b4: 2f00e400     	movi	d0, #0000000000000000
    16b8: 9100056b     	add	x11, x11, #0x1
    16bc: 4b15018c     	sub	w12, w12, w21
    16c0: 9ad50d0d     	sdiv	x13, x8, x21
    16c4: fd400261     	ldr	d1, [x19]
    16c8: fd400122     	ldr	d2, [x9]
    16cc: 1f400821     	fmadd	d1, d1, d0, d2
    16d0: 1b0d218d     	madd	w13, w12, w13, w8
    16d4: 91000508     	add	x8, x8, #0x1
    16d8: eb08017f     	cmp	x11, x8
    16dc: fc2dd941     	str	d1, [x10, w13, sxtw #3]
    16e0: 54ffff01     	b.ne	0x16c0 <_ZN4gemmIdE15compute_streamkEiiiPKdS2_Pddd.omp_outlined.17+0x120>
    16e4: b0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xf584>
    16e8: 91360000     	add	x0, x0, #0xd80
    16ec: 2a1403e1     	mov	w1, w20
    16f0: 97fffcb4     	bl	0x9c0 <__kmpc_for_static_fini@plt>
    16f4: a9474ff4     	ldp	x20, x19, [sp, #0x70]
    16f8: a94657f6     	ldp	x22, x21, [sp, #0x60]
    16fc: a9455ff8     	ldp	x24, x23, [sp, #0x50]
    1700: a94467fa     	ldp	x26, x25, [sp, #0x40]
    1704: a9437bfd     	ldp	x29, x30, [sp, #0x30]
    1708: 910203ff     	add	sp, sp, #0x80
    170c: d65f03c0     	ret

0000000000001710 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd>:
    1710: 6db63bef     	stp	d15, d14, [sp, #-0xa0]!
    1714: 6d0133ed     	stp	d13, d12, [sp, #0x10]
    1718: 6d022beb     	stp	d11, d10, [sp, #0x20]
    171c: 6d0323e9     	stp	d9, d8, [sp, #0x30]
    1720: a9047bfd     	stp	x29, x30, [sp, #0x40]
    1724: a9056ffc     	stp	x28, x27, [sp, #0x50]
    1728: a90667fa     	stp	x26, x25, [sp, #0x60]
    172c: a9075ff8     	stp	x24, x23, [sp, #0x70]
    1730: a90857f6     	stp	x22, x21, [sp, #0x80]
    1734: a9094ff4     	stp	x20, x19, [sp, #0x90]
    1738: d10d03ff     	sub	sp, sp, #0x340
    173c: f90017e6     	str	x6, [sp, #0x28]
    1740: f9003fe1     	str	x1, [sp, #0x78]
    1744: d503437f     	smstart	sm
    1748: 7100401f     	cmp	w0, #0x10
    174c: b90077e0     	str	w0, [sp, #0x74]
    1750: 54006dab     	b.lt	0x2504 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0xdf4>
    1754: f9403fe8     	ldr	x8, [sp, #0x78]
    1758: 7100811f     	cmp	w8, #0x20
    175c: 54006d4b     	b.lt	0x2504 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0xdf4>
    1760: 4b02007a     	sub	w26, w3, w2
    1764: 7100075f     	cmp	w26, #0x1
    1768: 54006ceb     	b.lt	0x2504 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0xdf4>
    176c: b94077f1     	ldr	w17, [sp, #0x74]
    1770: 5280020a     	mov	w10, #0x10              // =16
    1774: f9403ff0     	ldr	x16, [sp, #0x78]
    1778: 25d8e3e0     	ptrue	p0.d
    177c: 52800408     	mov	w8, #0x20               // =32
    1780: 04e14001     	index	z1.d, #0x0, #0x1
    1784: 1aca0e2a     	sdiv	w10, w17, w10
    1788: 1b117c4b     	mul	w11, w2, w17
    178c: 2a1103e9     	mov	w9, w17
    1790: 1b107c4c     	mul	w12, w2, w16
    1794: d37ced32     	lsl	x18, x9, #4
    1798: 05e03920     	mov	z0.d, x9
    179c: d37ae52d     	lsl	x13, x9, #6
    17a0: d37df121     	lsl	x1, x9, #3
    17a4: 8b09052e     	add	x14, x9, x9, lsl #1
    17a8: 8b2bcc8b     	add	x11, x4, w11, sxtw #3
    17ac: 8b09092f     	add	x15, x9, x9, lsl #2
    17b0: d37be929     	lsl	x9, x9, #5
    17b4: 93407e00     	sxtw	x0, w16
    17b8: 05e03a42     	mov	z2.d, x18
    17bc: f9019bed     	str	x13, [sp, #0x330]
    17c0: a9012fea     	stp	x10, x11, [sp, #0x10]
    17c4: 8b2cccab     	add	x11, x5, w12, sxtw #3
    17c8: d37df1ec     	lsl	x12, x15, #3
    17cc: f9018be9     	str	x9, [sp, #0x310]
    17d0: 04295029     	addvl	x9, x9, #0x1
    17d4: d37cec13     	lsl	x19, x0, #4
    17d8: f90023eb     	str	x11, [sp, #0x40]
    17dc: cb0101ab     	sub	x11, x13, x1
    17e0: d37df017     	lsl	x23, x0, #3
    17e4: d37cedca     	lsl	x10, x14, #4
    17e8: 1ac80e08     	sdiv	w8, w16, w8
    17ec: f9017be9     	str	x9, [sp, #0x2f0]
    17f0: d37df1c9     	lsl	x9, x14, #3
    17f4: 05e03803     	mov	z3.d, x0
    17f8: f90193eb     	str	x11, [sp, #0x320]
    17fc: 042b502b     	addvl	x11, x11, #0x1
    1800: 04c1c040     	mad	z0.d, p0/m, z1.d, z2.d
    1804: f90187eb     	str	x11, [sp, #0x308]
    1808: d37ae40b     	lsl	x11, x0, #6
    180c: 05e03a62     	mov	z2.d, x19
    1810: f90197ea     	str	x10, [sp, #0x328]
    1814: 042a502a     	addvl	x10, x10, #0x1
    1818: d37be80d     	lsl	x13, x0, #5
    181c: f90177e9     	str	x9, [sp, #0x2e8]
    1820: 04295029     	addvl	x9, x9, #0x1
    1824: aa1f03f8     	mov	x24, xzr
    1828: f90183ea     	str	x10, [sp, #0x300]
    182c: 042c502a     	addvl	x10, x12, #0x1
    1830: 04c3c041     	mad	z1.d, p0/m, z3.d, z2.d
    1834: f9016fe9     	str	x9, [sp, #0x2d8]
    1838: 04325029     	addvl	x9, x18, #0x1
    183c: 042d5071     	addvl	x17, x13, #0x3
    1840: f9017fea     	str	x10, [sp, #0x2f8]
    1844: 8b00040a     	add	x10, x0, x0, lsl #1
    1848: 042d5050     	addvl	x16, x13, #0x2
    184c: f9016be9     	str	x9, [sp, #0x2d0]
    1850: 04215029     	addvl	x9, x1, #0x1
    1854: 04335065     	addvl	x5, x19, #0x3
    1858: f90173eb     	str	x11, [sp, #0x2e0]
    185c: cb17016b     	sub	x11, x11, x23
    1860: d37df14f     	lsl	x15, x10, #3
    1864: f90167e9     	str	x9, [sp, #0x2c8]
    1868: 8b000809     	add	x9, x0, x0, lsl #2
    186c: 042b506e     	addvl	x14, x11, #0x3
    1870: f9018fec     	str	x12, [sp, #0x318]
    1874: d37ced4c     	lsl	x12, x10, #4
    1878: 042f5062     	addvl	x2, x15, #0x3
    187c: f90163ee     	str	x14, [sp, #0x2c0]
    1880: 042b504e     	addvl	x14, x11, #0x2
    1884: 042f5043     	addvl	x3, x15, #0x2
    1888: f9015fee     	str	x14, [sp, #0x2b8]
    188c: d37df12e     	lsl	x14, x9, #3
    1890: aa0c03e6     	mov	x6, x12
    1894: f9014feb     	str	x11, [sp, #0x298]
    1898: 042b502b     	addvl	x11, x11, #0x1
    189c: 042f5024     	addvl	x4, x15, #0x1
    18a0: f9015beb     	str	x11, [sp, #0x2b0]
    18a4: 042c506b     	addvl	x11, x12, #0x3
    18a8: aa0e03e9     	mov	x9, x14
    18ac: f9001fe8     	str	x8, [sp, #0x38]
    18b0: 042c5048     	addvl	x8, x12, #0x2
    18b4: 042e502a     	addvl	x10, x14, #0x1
    18b8: f9019ff2     	str	x18, [sp, #0x338]
    18bc: 042d5032     	addvl	x18, x13, #0x1
    18c0: 04335047     	addvl	x7, x19, #0x2
    18c4: f90157eb     	str	x11, [sp, #0x2a8]
    18c8: 042e506b     	addvl	x11, x14, #0x3
    18cc: aa1303fb     	mov	x27, x19
    18d0: f90153e8     	str	x8, [sp, #0x2a0]
    18d4: 042c5028     	addvl	x8, x12, #0x1
    18d8: 04335033     	addvl	x19, x19, #0x1
    18dc: f90013e0     	str	x0, [sp, #0x20]
    18e0: 042e5040     	addvl	x0, x14, #0x2
    18e4: 04375074     	addvl	x20, x23, #0x3
    18e8: 04375055     	addvl	x21, x23, #0x2
    18ec: 04375036     	addvl	x22, x23, #0x1
    18f0: aa0f03ec     	mov	x12, x15
    18f4: b90073fa     	str	w26, [sp, #0x70]
    18f8: a9063fed     	stp	x13, x15, [sp, #0x60]
    18fc: 14000006     	b	0x1914 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x204>
    1900: f9401bf8     	ldr	x24, [sp, #0x30]
    1904: f9400bef     	ldr	x15, [sp, #0x10]
    1908: 91000718     	add	x24, x24, #0x1
    190c: eb0f031f     	cmp	x24, x15
    1910: 54005fa0     	b.eq	0x2504 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0xdf4>
    1914: a941bff9     	ldp	x25, x15, [sp, #0x18]
    1918: f9001bf8     	str	x24, [sp, #0x30]
    191c: 9b0f7f0f     	mul	x15, x24, x15
    1920: 8b181f2c     	add	x12, x25, x24, lsl #7
    1924: f94017f8     	ldr	x24, [sp, #0x28]
    1928: 8b0f1f0e     	add	x14, x24, x15, lsl #7
    192c: a904b3ee     	stp	x14, x12, [sp, #0x48]
    1930: aa1f03ee     	mov	x14, xzr
    1934: 14000006     	b	0x194c <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x23c>
    1938: f9402fee     	ldr	x14, [sp, #0x58]
    193c: f9401fef     	ldr	x15, [sp, #0x38]
    1940: 910005ce     	add	x14, x14, #0x1
    1944: eb0f01df     	cmp	x14, x15
    1948: 54fffdc0     	b.eq	0x1900 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x1f0>
    194c: a94433f8     	ldp	x24, x12, [sp, #0x40]
    1950: d378ddcf     	lsl	x15, x14, #8
    1954: f9002fee     	str	x14, [sp, #0x58]
    1958: f9402bfe     	ldr	x30, [sp, #0x50]
    195c: 2a1f03ed     	mov	w13, wzr
    1960: 8b0f018c     	add	x12, x12, x15
    1964: 8b0f031d     	add	x29, x24, x15
    1968: 042c502e     	addvl	x14, x12, #0x1
    196c: 042c504f     	addvl	x15, x12, #0x2
    1970: f9013fec     	str	x12, [sp, #0x278]
    1974: f9013bee     	str	x14, [sp, #0x270]
    1978: 8b17018e     	add	x14, x12, x23
    197c: 042c506c     	addvl	x12, x12, #0x3
    1980: f9012fec     	str	x12, [sp, #0x258]
    1984: 042e502c     	addvl	x12, x14, #0x1
    1988: f9012bec     	str	x12, [sp, #0x250]
    198c: 042e504c     	addvl	x12, x14, #0x2
    1990: f90127ec     	str	x12, [sp, #0x248]
    1994: 042e506c     	addvl	x12, x14, #0x3
    1998: f90123ec     	str	x12, [sp, #0x240]
    199c: 8b1701cc     	add	x12, x14, x23
    19a0: f90137ee     	str	x14, [sp, #0x268]
    19a4: 042c502e     	addvl	x14, x12, #0x1
    19a8: f9011bee     	str	x14, [sp, #0x230]
    19ac: 042c504e     	addvl	x14, x12, #0x2
    19b0: f90117ee     	str	x14, [sp, #0x228]
    19b4: 8b17018e     	add	x14, x12, x23
    19b8: f9011fec     	str	x12, [sp, #0x238]
    19bc: 042c506c     	addvl	x12, x12, #0x3
    19c0: f9010fec     	str	x12, [sp, #0x218]
    19c4: 042e502c     	addvl	x12, x14, #0x1
    19c8: f90133ef     	str	x15, [sp, #0x260]
    19cc: 042e504f     	addvl	x15, x14, #0x2
    19d0: f9010bec     	str	x12, [sp, #0x210]
    19d4: 8b1701cc     	add	x12, x14, x23
    19d8: f90113ee     	str	x14, [sp, #0x220]
    19dc: 042e506e     	addvl	x14, x14, #0x3
    19e0: a91fbfee     	stp	x14, x15, [sp, #0x1f8]
    19e4: 042c502f     	addvl	x15, x12, #0x1
    19e8: 042c504e     	addvl	x14, x12, #0x2
    19ec: a91ebfee     	stp	x14, x15, [sp, #0x1e8]
    19f0: 042c506f     	addvl	x15, x12, #0x3
    19f4: f90107ec     	str	x12, [sp, #0x208]
    19f8: 8b17018c     	add	x12, x12, x23
    19fc: 042c502e     	addvl	x14, x12, #0x1
    1a00: a91dbfec     	stp	x12, x15, [sp, #0x1d8]
    1a04: 042c506f     	addvl	x15, x12, #0x3
    1a08: f900ebee     	str	x14, [sp, #0x1d0]
    1a0c: 042c504e     	addvl	x14, x12, #0x2
    1a10: f900e7ee     	str	x14, [sp, #0x1c8]
    1a14: 8b17018e     	add	x14, x12, x23
    1a18: 042e502c     	addvl	x12, x14, #0x1
    1a1c: f900e3ee     	str	x14, [sp, #0x1c0]
    1a20: a91b3fec     	stp	x12, x15, [sp, #0x1b0]
    1a24: 8b1701cc     	add	x12, x14, x23
    1a28: 042e504f     	addvl	x15, x14, #0x2
    1a2c: 042e506e     	addvl	x14, x14, #0x3
    1a30: f900d7ec     	str	x12, [sp, #0x1a8]
    1a34: a919bfee     	stp	x14, x15, [sp, #0x198]
    1a38: 042c502f     	addvl	x15, x12, #0x1
    1a3c: 042c504e     	addvl	x14, x12, #0x2
    1a40: a918bfee     	stp	x14, x15, [sp, #0x188]
    1a44: 042c506f     	addvl	x15, x12, #0x3
    1a48: 8b17018c     	add	x12, x12, x23
    1a4c: 042c502e     	addvl	x14, x12, #0x1
    1a50: a917bfec     	stp	x12, x15, [sp, #0x178]
    1a54: 042c506f     	addvl	x15, x12, #0x3
    1a58: f900bbee     	str	x14, [sp, #0x170]
    1a5c: 042c504e     	addvl	x14, x12, #0x2
    1a60: f900b7ee     	str	x14, [sp, #0x168]
    1a64: 8b17018e     	add	x14, x12, x23
    1a68: 042e502c     	addvl	x12, x14, #0x1
    1a6c: f900b3ee     	str	x14, [sp, #0x160]
    1a70: a9153fec     	stp	x12, x15, [sp, #0x150]
    1a74: 8b1701cc     	add	x12, x14, x23
    1a78: 042e504f     	addvl	x15, x14, #0x2
    1a7c: 042e506e     	addvl	x14, x14, #0x3
    1a80: f900a7ec     	str	x12, [sp, #0x148]
    1a84: a913bfee     	stp	x14, x15, [sp, #0x138]
    1a88: 042c502f     	addvl	x15, x12, #0x1
    1a8c: 042c504e     	addvl	x14, x12, #0x2
    1a90: a912bfee     	stp	x14, x15, [sp, #0x128]
    1a94: 042c506f     	addvl	x15, x12, #0x3
    1a98: 8b17018c     	add	x12, x12, x23
    1a9c: 042c502e     	addvl	x14, x12, #0x1
    1aa0: a911bfec     	stp	x12, x15, [sp, #0x118]
    1aa4: 042c506f     	addvl	x15, x12, #0x3
    1aa8: f9008bee     	str	x14, [sp, #0x110]
    1aac: 042c504e     	addvl	x14, x12, #0x2
    1ab0: f90087ee     	str	x14, [sp, #0x108]
    1ab4: 8b17018e     	add	x14, x12, x23
    1ab8: 042e502c     	addvl	x12, x14, #0x1
    1abc: f90083ee     	str	x14, [sp, #0x100]
    1ac0: a90f3fec     	stp	x12, x15, [sp, #0xf0]
    1ac4: 8b1701cc     	add	x12, x14, x23
    1ac8: 042e504f     	addvl	x15, x14, #0x2
    1acc: 042e506e     	addvl	x14, x14, #0x3
    1ad0: f90077ec     	str	x12, [sp, #0xe8]
    1ad4: a90dbfee     	stp	x14, x15, [sp, #0xd8]
    1ad8: 042c502f     	addvl	x15, x12, #0x1
    1adc: 042c504e     	addvl	x14, x12, #0x2
    1ae0: a90cbfee     	stp	x14, x15, [sp, #0xc8]
    1ae4: 042c506f     	addvl	x15, x12, #0x3
    1ae8: 8b17018c     	add	x12, x12, x23
    1aec: 042c502e     	addvl	x14, x12, #0x1
    1af0: a90bbfec     	stp	x12, x15, [sp, #0xb8]
    1af4: 042c506f     	addvl	x15, x12, #0x3
    1af8: f9005bee     	str	x14, [sp, #0xb0]
    1afc: 042c504e     	addvl	x14, x12, #0x2
    1b00: f90057ee     	str	x14, [sp, #0xa8]
    1b04: 8b17018e     	add	x14, x12, x23
    1b08: 042e502c     	addvl	x12, x14, #0x1
    1b0c: f90053ee     	str	x14, [sp, #0xa0]
    1b10: a9093fec     	stp	x12, x15, [sp, #0x90]
    1b14: 042e504f     	addvl	x15, x14, #0x2
    1b18: 042e506c     	addvl	x12, x14, #0x3
    1b1c: a9083fec     	stp	x12, x15, [sp, #0x80]
    1b20: 5280002f     	mov	w15, #0x1               // =1
    1b24: 140000cf     	b	0x1e60 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x750>
    1b28: 2a1f03ef     	mov	w15, wzr
    1b2c: b94077f9     	ldr	w25, [sp, #0x74]
    1b30: 5280004e     	mov	w14, #0x2               // =2
    1b34: c0c26002     	mov	z2.d, p0/m, za0h.d[w15, 0]
    1b38: c0c26043     	mov	z3.d, p0/m, za1h.d[w15, 0]
    1b3c: 1b197f19     	mul	w25, w24, w25
    1b40: c0c26084     	mov	z4.d, p0/m, za2h.d[w15, 0]
    1b44: c0c260c5     	mov	z5.d, p0/m, za3h.d[w15, 0]
    1b48: f9413fec     	ldr	x12, [sp, #0x278]
    1b4c: e5e0e182     	st1d	{ z2.d }, p0, [x12]
    1b50: f9413bec     	ldr	x12, [sp, #0x270]
    1b54: e5e0e183     	st1d	{ z3.d }, p0, [x12]
    1b58: f94133ec     	ldr	x12, [sp, #0x260]
    1b5c: e5e0e184     	st1d	{ z4.d }, p0, [x12]
    1b60: f9412fec     	ldr	x12, [sp, #0x258]
    1b64: e5e0e185     	st1d	{ z5.d }, p0, [x12]
    1b68: 5280002c     	mov	w12, #0x1               // =1
    1b6c: c0c20002     	mov	z2.d, p0/m, za0h.d[w12, 0]
    1b70: c0c20043     	mov	z3.d, p0/m, za1h.d[w12, 0]
    1b74: c0c20084     	mov	z4.d, p0/m, za2h.d[w12, 0]
    1b78: c0c200c5     	mov	z5.d, p0/m, za3h.d[w12, 0]
    1b7c: f94137ed     	ldr	x13, [sp, #0x268]
    1b80: e5e0e1a2     	st1d	{ z2.d }, p0, [x13]
    1b84: f9412bed     	ldr	x13, [sp, #0x250]
    1b88: e5e0e1a3     	st1d	{ z3.d }, p0, [x13]
    1b8c: f94127ed     	ldr	x13, [sp, #0x248]
    1b90: e5e0e1a4     	st1d	{ z4.d }, p0, [x13]
    1b94: f94123ed     	ldr	x13, [sp, #0x240]
    1b98: e5e0e1a5     	st1d	{ z5.d }, p0, [x13]
    1b9c: c0c24002     	mov	z2.d, p0/m, za0h.d[w14, 0]
    1ba0: c0c24043     	mov	z3.d, p0/m, za1h.d[w14, 0]
    1ba4: c0c24084     	mov	z4.d, p0/m, za2h.d[w14, 0]
    1ba8: c0c240c5     	mov	z5.d, p0/m, za3h.d[w14, 0]
    1bac: f9411fed     	ldr	x13, [sp, #0x238]
    1bb0: e5e0e1a2     	st1d	{ z2.d }, p0, [x13]
    1bb4: f9411bed     	ldr	x13, [sp, #0x230]
    1bb8: e5e0e1a3     	st1d	{ z3.d }, p0, [x13]
    1bbc: f94117ed     	ldr	x13, [sp, #0x228]
    1bc0: e5e0e1a4     	st1d	{ z4.d }, p0, [x13]
    1bc4: f9410fed     	ldr	x13, [sp, #0x218]
    1bc8: e5e0e1a5     	st1d	{ z5.d }, p0, [x13]
    1bcc: 5280006d     	mov	w13, #0x3               // =3
    1bd0: c0c22002     	mov	z2.d, p0/m, za0h.d[w13, 0]
    1bd4: c0c22043     	mov	z3.d, p0/m, za1h.d[w13, 0]
    1bd8: c0c22084     	mov	z4.d, p0/m, za2h.d[w13, 0]
    1bdc: c0c220c5     	mov	z5.d, p0/m, za3h.d[w13, 0]
    1be0: f94113fa     	ldr	x26, [sp, #0x220]
    1be4: e5e0e342     	st1d	{ z2.d }, p0, [x26]
    1be8: f9410bfa     	ldr	x26, [sp, #0x210]
    1bec: e5e0e343     	st1d	{ z3.d }, p0, [x26]
    1bf0: a95fb3fa     	ldp	x26, x12, [sp, #0x1f8]
    1bf4: e5e0e184     	st1d	{ z4.d }, p0, [x12]
    1bf8: 5280008c     	mov	w12, #0x4               // =4
    1bfc: e5e0e345     	st1d	{ z5.d }, p0, [x26]
    1c00: c0c20002     	mov	z2.d, p0/m, za0h.d[w12, 0]
    1c04: c0c20043     	mov	z3.d, p0/m, za1h.d[w12, 0]
    1c08: c0c20084     	mov	z4.d, p0/m, za2h.d[w12, 0]
    1c0c: c0c200c5     	mov	z5.d, p0/m, za3h.d[w12, 0]
    1c10: f94107fa     	ldr	x26, [sp, #0x208]
    1c14: e5e0e342     	st1d	{ z2.d }, p0, [x26]
    1c18: a95eb3fa     	ldp	x26, x12, [sp, #0x1e8]
    1c1c: e5e0e183     	st1d	{ z3.d }, p0, [x12]
    1c20: 528000ac     	mov	w12, #0x5               // =5
    1c24: e5e0e344     	st1d	{ z4.d }, p0, [x26]
    1c28: f940f3fa     	ldr	x26, [sp, #0x1e0]
    1c2c: e5e0e345     	st1d	{ z5.d }, p0, [x26]
    1c30: c0c20002     	mov	z2.d, p0/m, za0h.d[w12, 0]
    1c34: c0c20043     	mov	z3.d, p0/m, za1h.d[w12, 0]
    1c38: c0c20084     	mov	z4.d, p0/m, za2h.d[w12, 0]
    1c3c: c0c200c5     	mov	z5.d, p0/m, za3h.d[w12, 0]
    1c40: a95d33fa     	ldp	x26, x12, [sp, #0x1d0]
    1c44: e5e0e182     	st1d	{ z2.d }, p0, [x12]
    1c48: 528000cc     	mov	w12, #0x6               // =6
    1c4c: e5e0e343     	st1d	{ z3.d }, p0, [x26]
    1c50: f940e7fa     	ldr	x26, [sp, #0x1c8]
    1c54: e5e0e344     	st1d	{ z4.d }, p0, [x26]
    1c58: f940dffa     	ldr	x26, [sp, #0x1b8]
    1c5c: e5e0e345     	st1d	{ z5.d }, p0, [x26]
    1c60: c0c20002     	mov	z2.d, p0/m, za0h.d[w12, 0]
    1c64: c0c20043     	mov	z3.d, p0/m, za1h.d[w12, 0]
    1c68: c0c20084     	mov	z4.d, p0/m, za2h.d[w12, 0]
    1c6c: c0c200c5     	mov	z5.d, p0/m, za3h.d[w12, 0]
    1c70: f940e3fa     	ldr	x26, [sp, #0x1c0]
    1c74: e5e0e342     	st1d	{ z2.d }, p0, [x26]
    1c78: f940dbfa     	ldr	x26, [sp, #0x1b0]
    1c7c: e5e0e343     	st1d	{ z3.d }, p0, [x26]
    1c80: a959b3fa     	ldp	x26, x12, [sp, #0x198]
    1c84: e5e0e184     	st1d	{ z4.d }, p0, [x12]
    1c88: 528000ec     	mov	w12, #0x7               // =7
    1c8c: e5e0e345     	st1d	{ z5.d }, p0, [x26]
    1c90: c0c20002     	mov	z2.d, p0/m, za0h.d[w12, 0]
    1c94: c0c20043     	mov	z3.d, p0/m, za1h.d[w12, 0]
    1c98: c0c20084     	mov	z4.d, p0/m, za2h.d[w12, 0]
    1c9c: c0c200c5     	mov	z5.d, p0/m, za3h.d[w12, 0]
    1ca0: f940d7fa     	ldr	x26, [sp, #0x1a8]
    1ca4: e5e0e342     	st1d	{ z2.d }, p0, [x26]
    1ca8: a958b3fa     	ldp	x26, x12, [sp, #0x188]
    1cac: e5e0e183     	st1d	{ z3.d }, p0, [x12]
    1cb0: e5e0e344     	st1d	{ z4.d }, p0, [x26]
    1cb4: f940c3fa     	ldr	x26, [sp, #0x180]
    1cb8: e5e0e345     	st1d	{ z5.d }, p0, [x26]
    1cbc: c0c26105     	mov	z5.d, p0/m, za4h.d[w15, 0]
    1cc0: c0c26143     	mov	z3.d, p0/m, za5h.d[w15, 0]
    1cc4: c0c26184     	mov	z4.d, p0/m, za6h.d[w15, 0]
    1cc8: c0c261c2     	mov	z2.d, p0/m, za7h.d[w15, 0]
    1ccc: a95733fa     	ldp	x26, x12, [sp, #0x170]
    1cd0: e5e0e185     	st1d	{ z5.d }, p0, [x12]
    1cd4: 5280002c     	mov	w12, #0x1               // =1
    1cd8: e5e0e343     	st1d	{ z3.d }, p0, [x26]
    1cdc: f940b7fa     	ldr	x26, [sp, #0x168]
    1ce0: e5e0e344     	st1d	{ z4.d }, p0, [x26]
    1ce4: f940affa     	ldr	x26, [sp, #0x158]
    1ce8: e5e0e342     	st1d	{ z2.d }, p0, [x26]
    1cec: c0c20105     	mov	z5.d, p0/m, za4h.d[w12, 0]
    1cf0: c0c20143     	mov	z3.d, p0/m, za5h.d[w12, 0]
    1cf4: c0c20184     	mov	z4.d, p0/m, za6h.d[w12, 0]
    1cf8: c0c201c2     	mov	z2.d, p0/m, za7h.d[w12, 0]
    1cfc: f940b3ec     	ldr	x12, [sp, #0x160]
    1d00: e5e0e185     	st1d	{ z5.d }, p0, [x12]
    1d04: f940abec     	ldr	x12, [sp, #0x150]
    1d08: e5e0e183     	st1d	{ z3.d }, p0, [x12]
    1d0c: f940a3ec     	ldr	x12, [sp, #0x140]
    1d10: e5e0e184     	st1d	{ z4.d }, p0, [x12]
    1d14: f9409fec     	ldr	x12, [sp, #0x138]
    1d18: e5e0e182     	st1d	{ z2.d }, p0, [x12]
    1d1c: c0c24105     	mov	z5.d, p0/m, za4h.d[w14, 0]
    1d20: c0c24143     	mov	z3.d, p0/m, za5h.d[w14, 0]
    1d24: c0c24184     	mov	z4.d, p0/m, za6h.d[w14, 0]
    1d28: c0c241c2     	mov	z2.d, p0/m, za7h.d[w14, 0]
    1d2c: f940a7ec     	ldr	x12, [sp, #0x148]
    1d30: e5e0e185     	st1d	{ z5.d }, p0, [x12]
    1d34: a952bbec     	ldp	x12, x14, [sp, #0x128]
    1d38: e5e0e1c3     	st1d	{ z3.d }, p0, [x14]
    1d3c: e5e0e184     	st1d	{ z4.d }, p0, [x12]
    1d40: f94093ec     	ldr	x12, [sp, #0x120]
    1d44: e5e0e182     	st1d	{ z2.d }, p0, [x12]
    1d48: c0c22105     	mov	z5.d, p0/m, za4h.d[w13, 0]
    1d4c: c0c22143     	mov	z3.d, p0/m, za5h.d[w13, 0]
    1d50: c0c22184     	mov	z4.d, p0/m, za6h.d[w13, 0]
    1d54: c0c221c2     	mov	z2.d, p0/m, za7h.d[w13, 0]
    1d58: a95137ec     	ldp	x12, x13, [sp, #0x110]
    1d5c: e5e0e1a5     	st1d	{ z5.d }, p0, [x13]
    1d60: e5e0e183     	st1d	{ z3.d }, p0, [x12]
    1d64: f94087ec     	ldr	x12, [sp, #0x108]
    1d68: e5e0e184     	st1d	{ z4.d }, p0, [x12]
    1d6c: f9407fec     	ldr	x12, [sp, #0xf8]
    1d70: e5e0e182     	st1d	{ z2.d }, p0, [x12]
    1d74: 5280008c     	mov	w12, #0x4               // =4
    1d78: c0c20105     	mov	z5.d, p0/m, za4h.d[w12, 0]
    1d7c: c0c20143     	mov	z3.d, p0/m, za5h.d[w12, 0]
    1d80: c0c20184     	mov	z4.d, p0/m, za6h.d[w12, 0]
    1d84: c0c201c2     	mov	z2.d, p0/m, za7h.d[w12, 0]
    1d88: f94083ec     	ldr	x12, [sp, #0x100]
    1d8c: e5e0e185     	st1d	{ z5.d }, p0, [x12]
    1d90: f9407bec     	ldr	x12, [sp, #0xf0]
    1d94: e5e0e183     	st1d	{ z3.d }, p0, [x12]
    1d98: a94db7ec     	ldp	x12, x13, [sp, #0xd8]
    1d9c: e5e0e1a4     	st1d	{ z4.d }, p0, [x13]
    1da0: e5e0e182     	st1d	{ z2.d }, p0, [x12]
    1da4: 528000ac     	mov	w12, #0x5               // =5
    1da8: c0c20105     	mov	z5.d, p0/m, za4h.d[w12, 0]
    1dac: c0c20143     	mov	z3.d, p0/m, za5h.d[w12, 0]
    1db0: c0c20184     	mov	z4.d, p0/m, za6h.d[w12, 0]
    1db4: c0c201c2     	mov	z2.d, p0/m, za7h.d[w12, 0]
    1db8: f94077ec     	ldr	x12, [sp, #0xe8]
    1dbc: e5e0e185     	st1d	{ z5.d }, p0, [x12]
    1dc0: a94cb7ec     	ldp	x12, x13, [sp, #0xc8]
    1dc4: e5e0e1a3     	st1d	{ z3.d }, p0, [x13]
    1dc8: e5e0e184     	st1d	{ z4.d }, p0, [x12]
    1dcc: f94063ec     	ldr	x12, [sp, #0xc0]
    1dd0: e5e0e182     	st1d	{ z2.d }, p0, [x12]
    1dd4: 528000cc     	mov	w12, #0x6               // =6
    1dd8: c0c20105     	mov	z5.d, p0/m, za4h.d[w12, 0]
    1ddc: c0c20143     	mov	z3.d, p0/m, za5h.d[w12, 0]
    1de0: c0c20184     	mov	z4.d, p0/m, za6h.d[w12, 0]
    1de4: c0c201c2     	mov	z2.d, p0/m, za7h.d[w12, 0]
    1de8: a94b37ec     	ldp	x12, x13, [sp, #0xb0]
    1dec: e5e0e1a5     	st1d	{ z5.d }, p0, [x13]
    1df0: e5e0e183     	st1d	{ z3.d }, p0, [x12]
    1df4: f94057ec     	ldr	x12, [sp, #0xa8]
    1df8: e5e0e184     	st1d	{ z4.d }, p0, [x12]
    1dfc: f9404fec     	ldr	x12, [sp, #0x98]
    1e00: e5e0e182     	st1d	{ z2.d }, p0, [x12]
    1e04: 528000ec     	mov	w12, #0x7               // =7
    1e08: c0c20105     	mov	z5.d, p0/m, za4h.d[w12, 0]
    1e0c: c0c20143     	mov	z3.d, p0/m, za5h.d[w12, 0]
    1e10: c0c20184     	mov	z4.d, p0/m, za6h.d[w12, 0]
    1e14: f9403ffa     	ldr	x26, [sp, #0x78]
    1e18: c0c201c2     	mov	z2.d, p0/m, za7h.d[w12, 0]
    1e1c: f94053ec     	ldr	x12, [sp, #0xa0]
    1e20: f94147fd     	ldr	x29, [sp, #0x288]
    1e24: f94143fe     	ldr	x30, [sp, #0x280]
    1e28: 1b1a7f1a     	mul	w26, w24, w26
    1e2c: b94297ed     	ldr	w13, [sp, #0x294]
    1e30: e5e0e185     	st1d	{ z5.d }, p0, [x12]
    1e34: a948bbec     	ldp	x12, x14, [sp, #0x88]
    1e38: 8b39cfde     	add	x30, x30, w25, sxtw #3
    1e3c: 0b0d030d     	add	w13, w24, w13
    1e40: 8b3acfbd     	add	x29, x29, w26, sxtw #3
    1e44: b94073fa     	ldr	w26, [sp, #0x70]
    1e48: e5e0e1c3     	st1d	{ z3.d }, p0, [x14]
    1e4c: e5e0e184     	st1d	{ z4.d }, p0, [x12]
    1e50: f94043ec     	ldr	x12, [sp, #0x80]
    1e54: 6b1a01bf     	cmp	w13, w26
    1e58: e5e0e182     	st1d	{ z2.d }, p0, [x12]
    1e5c: 54ffd6ea     	b.ge	0x1938 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x228>
    1e60: 112001b8     	add	w24, w13, #0x800
    1e64: 4b0d0359     	sub	w25, w26, w13
    1e68: b90297ed     	str	w13, [sp, #0x294]
    1e6c: 6b1a031f     	cmp	w24, w26
    1e70: 52810018     	mov	w24, #0x800             // =2048
    1e74: 1a98c338     	csel	w24, w25, w24, gt
    1e78: 360018ef     	tbz	w15, #0x0, 0x2194 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0xa84>
    1e7c: c00800ff     	zero	{za}
    1e80: a9463bed     	ldp	x13, x14, [sp, #0x60]
    1e84: 7100231f     	cmp	w24, #0x8
    1e88: f90147fd     	str	x29, [sp, #0x288]
    1e8c: f90143fe     	str	x30, [sp, #0x280]
    1e90: 5400308b     	b.lt	0x24a0 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0xd90>
    1e94: 2a1f03fc     	mov	w28, wzr
    1e98: aa1d03f9     	mov	x25, x29
    1e9c: aa1e03fa     	mov	x26, x30
    1ea0: 140000b7     	b	0x217c <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0xa6c>
    1ea4: a5e0a342     	ld1d	{ z2.d }, p0/z, [x26]
    1ea8: a5e0a323     	ld1d	{ z3.d }, p0/z, [x25]
    1eac: 8b01034f     	add	x15, x26, x1
    1eb0: a5e1a324     	ld1d	{ z4.d }, p0/z, [x25, #0x1, mul vl]
    1eb4: a5e1a345     	ld1d	{ z5.d }, p0/z, [x26, #0x1, mul vl]
    1eb8: 8b17033d     	add	x29, x25, x23
    1ebc: a5e2a326     	ld1d	{ z6.d }, p0/z, [x25, #0x2, mul vl]
    1ec0: a5e3a327     	ld1d	{ z7.d }, p0/z, [x25, #0x3, mul vl]
    1ec4: 8b14033e     	add	x30, x25, x20
    1ec8: 80c30040     	fmopa	za0.d, p0/m, p0/m, z2.d, z3.d
    1ecc: 80c40041     	fmopa	za1.d, p0/m, p0/m, z2.d, z4.d
    1ed0: 80c60042     	fmopa	za2.d, p0/m, p0/m, z2.d, z6.d
    1ed4: 80c70043     	fmopa	za3.d, p0/m, p0/m, z2.d, z7.d
    1ed8: 80c300a4     	fmopa	za4.d, p0/m, p0/m, z5.d, z3.d
    1edc: 80c400a5     	fmopa	za5.d, p0/m, p0/m, z5.d, z4.d
    1ee0: 80c600a6     	fmopa	za6.d, p0/m, p0/m, z5.d, z6.d
    1ee4: 80c700a7     	fmopa	za7.d, p0/m, p0/m, z5.d, z7.d
    1ee8: a5e0a1e2     	ld1d	{ z2.d }, p0/z, [x15]
    1eec: f94167ef     	ldr	x15, [sp, #0x2c8]
    1ef0: a5e0a3a3     	ld1d	{ z3.d }, p0/z, [x29]
    1ef4: 8b16033d     	add	x29, x25, x22
    1ef8: a5e0a3c7     	ld1d	{ z7.d }, p0/z, [x30]
    1efc: 8b05033e     	add	x30, x25, x5
    1f00: 8b0f034f     	add	x15, x26, x15
    1f04: a5e0a3a4     	ld1d	{ z4.d }, p0/z, [x29]
    1f08: 8b15033d     	add	x29, x25, x21
    1f0c: a5e0a1e5     	ld1d	{ z5.d }, p0/z, [x15]
    1f10: a5e0a3a6     	ld1d	{ z6.d }, p0/z, [x29]
    1f14: 80c30040     	fmopa	za0.d, p0/m, p0/m, z2.d, z3.d
    1f18: 8b1b033d     	add	x29, x25, x27
    1f1c: 80c40041     	fmopa	za1.d, p0/m, p0/m, z2.d, z4.d
    1f20: 80c60042     	fmopa	za2.d, p0/m, p0/m, z2.d, z6.d
    1f24: 80c70043     	fmopa	za3.d, p0/m, p0/m, z2.d, z7.d
    1f28: 80c300a4     	fmopa	za4.d, p0/m, p0/m, z5.d, z3.d
    1f2c: 80c400a5     	fmopa	za5.d, p0/m, p0/m, z5.d, z4.d
    1f30: 80c600a6     	fmopa	za6.d, p0/m, p0/m, z5.d, z6.d
    1f34: f9419fef     	ldr	x15, [sp, #0x338]
    1f38: 80c700a7     	fmopa	za7.d, p0/m, p0/m, z5.d, z7.d
    1f3c: a5e0a3a3     	ld1d	{ z3.d }, p0/z, [x29]
    1f40: 8b13033d     	add	x29, x25, x19
    1f44: 8b0f034f     	add	x15, x26, x15
    1f48: a5e0a3a4     	ld1d	{ z4.d }, p0/z, [x29]
    1f4c: 8b07033d     	add	x29, x25, x7
    1f50: a5e0a1e2     	ld1d	{ z2.d }, p0/z, [x15]
    1f54: f9416bef     	ldr	x15, [sp, #0x2d0]
    1f58: a5e0a3a6     	ld1d	{ z6.d }, p0/z, [x29]
    1f5c: a5e0a3c7     	ld1d	{ z7.d }, p0/z, [x30]
    1f60: 8b0e033d     	add	x29, x25, x14
    1f64: 8b02033e     	add	x30, x25, x2
    1f68: 8b0f034f     	add	x15, x26, x15
    1f6c: a5e0a1e5     	ld1d	{ z5.d }, p0/z, [x15]
    1f70: 80c30040     	fmopa	za0.d, p0/m, p0/m, z2.d, z3.d
    1f74: 80c40041     	fmopa	za1.d, p0/m, p0/m, z2.d, z4.d
    1f78: 80c60042     	fmopa	za2.d, p0/m, p0/m, z2.d, z6.d
    1f7c: 80c70043     	fmopa	za3.d, p0/m, p0/m, z2.d, z7.d
    1f80: 80c300a4     	fmopa	za4.d, p0/m, p0/m, z5.d, z3.d
    1f84: 80c400a5     	fmopa	za5.d, p0/m, p0/m, z5.d, z4.d
    1f88: 80c600a6     	fmopa	za6.d, p0/m, p0/m, z5.d, z6.d
    1f8c: f94177ef     	ldr	x15, [sp, #0x2e8]
    1f90: 80c700a7     	fmopa	za7.d, p0/m, p0/m, z5.d, z7.d
    1f94: a5e0a3a3     	ld1d	{ z3.d }, p0/z, [x29]
    1f98: 8b04033d     	add	x29, x25, x4
    1f9c: a5e0a3c7     	ld1d	{ z7.d }, p0/z, [x30]
    1fa0: 8b11033e     	add	x30, x25, x17
    1fa4: 8b0f034f     	add	x15, x26, x15
    1fa8: a5e0a3a4     	ld1d	{ z4.d }, p0/z, [x29]
    1fac: 8b03033d     	add	x29, x25, x3
    1fb0: a5e0a1e2     	ld1d	{ z2.d }, p0/z, [x15]
    1fb4: f9416fef     	ldr	x15, [sp, #0x2d8]
    1fb8: a5e0a3a6     	ld1d	{ z6.d }, p0/z, [x29]
    1fbc: 8b0d033d     	add	x29, x25, x13
    1fc0: 8b0f034f     	add	x15, x26, x15
    1fc4: a5e0a1e5     	ld1d	{ z5.d }, p0/z, [x15]
    1fc8: 80c30040     	fmopa	za0.d, p0/m, p0/m, z2.d, z3.d
    1fcc: 80c40041     	fmopa	za1.d, p0/m, p0/m, z2.d, z4.d
    1fd0: 80c60042     	fmopa	za2.d, p0/m, p0/m, z2.d, z6.d
    1fd4: 80c70043     	fmopa	za3.d, p0/m, p0/m, z2.d, z7.d
    1fd8: 80c300a4     	fmopa	za4.d, p0/m, p0/m, z5.d, z3.d
    1fdc: 80c400a5     	fmopa	za5.d, p0/m, p0/m, z5.d, z4.d
    1fe0: 80c600a6     	fmopa	za6.d, p0/m, p0/m, z5.d, z6.d
    1fe4: f9418bef     	ldr	x15, [sp, #0x310]
    1fe8: 80c700a7     	fmopa	za7.d, p0/m, p0/m, z5.d, z7.d
    1fec: a5e0a3a3     	ld1d	{ z3.d }, p0/z, [x29]
    1ff0: 8b12033d     	add	x29, x25, x18
    1ff4: a5e0a3c7     	ld1d	{ z7.d }, p0/z, [x30]
    1ff8: 8b0b033e     	add	x30, x25, x11
    1ffc: 8b0f034f     	add	x15, x26, x15
    2000: a5e0a3a4     	ld1d	{ z4.d }, p0/z, [x29]
    2004: 8b10033d     	add	x29, x25, x16
    2008: a5e0a1e2     	ld1d	{ z2.d }, p0/z, [x15]
    200c: f9417bef     	ldr	x15, [sp, #0x2f0]
    2010: a5e0a3a6     	ld1d	{ z6.d }, p0/z, [x29]
    2014: 8b09033d     	add	x29, x25, x9
    2018: 8b0f034f     	add	x15, x26, x15
    201c: a5e0a1e5     	ld1d	{ z5.d }, p0/z, [x15]
    2020: 80c30040     	fmopa	za0.d, p0/m, p0/m, z2.d, z3.d
    2024: 80c40041     	fmopa	za1.d, p0/m, p0/m, z2.d, z4.d
    2028: 80c60042     	fmopa	za2.d, p0/m, p0/m, z2.d, z6.d
    202c: 80c70043     	fmopa	za3.d, p0/m, p0/m, z2.d, z7.d
    2030: 80c300a4     	fmopa	za4.d, p0/m, p0/m, z5.d, z3.d
    2034: 80c400a5     	fmopa	za5.d, p0/m, p0/m, z5.d, z4.d
    2038: 80c600a6     	fmopa	za6.d, p0/m, p0/m, z5.d, z6.d
    203c: f9418fef     	ldr	x15, [sp, #0x318]
    2040: 80c700a7     	fmopa	za7.d, p0/m, p0/m, z5.d, z7.d
    2044: a5e0a3a3     	ld1d	{ z3.d }, p0/z, [x29]
    2048: 8b0a033d     	add	x29, x25, x10
    204c: a5e0a3c7     	ld1d	{ z7.d }, p0/z, [x30]
    2050: 8b0f034f     	add	x15, x26, x15
    2054: a5e0a3a4     	ld1d	{ z4.d }, p0/z, [x29]
    2058: 8b00033d     	add	x29, x25, x0
    205c: a5e0a1e2     	ld1d	{ z2.d }, p0/z, [x15]
    2060: f9417fef     	ldr	x15, [sp, #0x2f8]
    2064: a5e0a3a6     	ld1d	{ z6.d }, p0/z, [x29]
    2068: 8b06033d     	add	x29, x25, x6
    206c: 8b0f034f     	add	x15, x26, x15
    2070: a5e0a1e5     	ld1d	{ z5.d }, p0/z, [x15]
    2074: 80c30040     	fmopa	za0.d, p0/m, p0/m, z2.d, z3.d
    2078: 80c40041     	fmopa	za1.d, p0/m, p0/m, z2.d, z4.d
    207c: 80c60042     	fmopa	za2.d, p0/m, p0/m, z2.d, z6.d
    2080: 80c70043     	fmopa	za3.d, p0/m, p0/m, z2.d, z7.d
    2084: 80c300a4     	fmopa	za4.d, p0/m, p0/m, z5.d, z3.d
    2088: 80c400a5     	fmopa	za5.d, p0/m, p0/m, z5.d, z4.d
    208c: 80c600a6     	fmopa	za6.d, p0/m, p0/m, z5.d, z6.d
    2090: f94197ef     	ldr	x15, [sp, #0x328]
    2094: 80c700a7     	fmopa	za7.d, p0/m, p0/m, z5.d, z7.d
    2098: a5e0a3a3     	ld1d	{ z3.d }, p0/z, [x29]
    209c: 8b08033d     	add	x29, x25, x8
    20a0: f94157fe     	ldr	x30, [sp, #0x2a8]
    20a4: 8b0f034f     	add	x15, x26, x15
    20a8: a5e0a3a4     	ld1d	{ z4.d }, p0/z, [x29]
    20ac: f94153fd     	ldr	x29, [sp, #0x2a0]
    20b0: a5e0a1e2     	ld1d	{ z2.d }, p0/z, [x15]
    20b4: f94183ef     	ldr	x15, [sp, #0x300]
    20b8: 8b1e033e     	add	x30, x25, x30
    20bc: 8b1d033d     	add	x29, x25, x29
    20c0: a5e0a3c7     	ld1d	{ z7.d }, p0/z, [x30]
    20c4: 8b0f034f     	add	x15, x26, x15
    20c8: a5e0a3a6     	ld1d	{ z6.d }, p0/z, [x29]
    20cc: a5e0a1e5     	ld1d	{ z5.d }, p0/z, [x15]
    20d0: 80c30040     	fmopa	za0.d, p0/m, p0/m, z2.d, z3.d
    20d4: 80c40041     	fmopa	za1.d, p0/m, p0/m, z2.d, z4.d
    20d8: 80c60042     	fmopa	za2.d, p0/m, p0/m, z2.d, z6.d
    20dc: 80c70043     	fmopa	za3.d, p0/m, p0/m, z2.d, z7.d
    20e0: 80c300a4     	fmopa	za4.d, p0/m, p0/m, z5.d, z3.d
    20e4: 80c400a5     	fmopa	za5.d, p0/m, p0/m, z5.d, z4.d
    20e8: 80c600a6     	fmopa	za6.d, p0/m, p0/m, z5.d, z6.d
    20ec: f94193ef     	ldr	x15, [sp, #0x320]
    20f0: 80c700a7     	fmopa	za7.d, p0/m, p0/m, z5.d, z7.d
    20f4: f9414fec     	ldr	x12, [sp, #0x298]
    20f8: f94163fe     	ldr	x30, [sp, #0x2c0]
    20fc: 8b0c033d     	add	x29, x25, x12
    2100: 8b0f034f     	add	x15, x26, x15
    2104: a5e0a3a3     	ld1d	{ z3.d }, p0/z, [x29]
    2108: f9415bfd     	ldr	x29, [sp, #0x2b0]
    210c: a5e0a1e2     	ld1d	{ z2.d }, p0/z, [x15]
    2110: f94187ef     	ldr	x15, [sp, #0x308]
    2114: 8b1e033e     	add	x30, x25, x30
    2118: 8b1d033d     	add	x29, x25, x29
    211c: a5e0a3c7     	ld1d	{ z7.d }, p0/z, [x30]
    2120: a5e0a3a4     	ld1d	{ z4.d }, p0/z, [x29]
    2124: f9415ffd     	ldr	x29, [sp, #0x2b8]
    2128: 8b0f034f     	add	x15, x26, x15
    212c: a5e0a1e5     	ld1d	{ z5.d }, p0/z, [x15]
    2130: 1100238f     	add	w15, w28, #0x8
    2134: 8b1d033d     	add	x29, x25, x29
    2138: a5e0a3a6     	ld1d	{ z6.d }, p0/z, [x29]
    213c: 80c30040     	fmopa	za0.d, p0/m, p0/m, z2.d, z3.d
    2140: 80c40041     	fmopa	za1.d, p0/m, p0/m, z2.d, z4.d
    2144: 1100439d     	add	w29, w28, #0x10
    2148: 6b1803bf     	cmp	w29, w24
    214c: 80c60042     	fmopa	za2.d, p0/m, p0/m, z2.d, z6.d
    2150: 80c70043     	fmopa	za3.d, p0/m, p0/m, z2.d, z7.d
    2154: 80c300a4     	fmopa	za4.d, p0/m, p0/m, z5.d, z3.d
    2158: 80c400a5     	fmopa	za5.d, p0/m, p0/m, z5.d, z4.d
    215c: 80c600a6     	fmopa	za6.d, p0/m, p0/m, z5.d, z6.d
    2160: 80c700a7     	fmopa	za7.d, p0/m, p0/m, z5.d, z7.d
    2164: f9419bfc     	ldr	x28, [sp, #0x330]
    2168: 8b1c035a     	add	x26, x26, x28
    216c: f94173fc     	ldr	x28, [sp, #0x2e0]
    2170: 8b1c0339     	add	x25, x25, x28
    2174: 2a0f03fc     	mov	w28, w15
    2178: 540019ac     	b.gt	0x24ac <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0xd9c>
    217c: 1100638f     	add	w15, w28, #0x18
    2180: 6b1801ff     	cmp	w15, w24
    2184: 54ffe90c     	b.gt	0x1ea4 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x794>
    2188: c460e340     	prfd	pldl1keep, p0, [x26, z0.d, lsl #3]
    218c: c461e320     	prfd	pldl1keep, p0, [x25, z1.d, lsl #3]
    2190: 17ffff45     	b	0x1ea4 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x794>
    2194: f9413fec     	ldr	x12, [sp, #0x278]
    2198: 2a1f03ef     	mov	w15, wzr
    219c: 5280004e     	mov	w14, #0x2               // =2
    21a0: a5e0a182     	ld1d	{ z2.d }, p0/z, [x12]
    21a4: f9413bec     	ldr	x12, [sp, #0x270]
    21a8: a5e0a183     	ld1d	{ z3.d }, p0/z, [x12]
    21ac: f94133ec     	ldr	x12, [sp, #0x260]
    21b0: a5e0a184     	ld1d	{ z4.d }, p0/z, [x12]
    21b4: f9412fec     	ldr	x12, [sp, #0x258]
    21b8: a5e0a185     	ld1d	{ z5.d }, p0/z, [x12]
    21bc: c0c06040     	mov	za0h.d[w15, 0], p0/m, z2.d
    21c0: c0c06062     	mov	za1h.d[w15, 0], p0/m, z3.d
    21c4: c0c06084     	mov	za2h.d[w15, 0], p0/m, z4.d
    21c8: c0c060a6     	mov	za3h.d[w15, 0], p0/m, z5.d
    21cc: f94137ec     	ldr	x12, [sp, #0x268]
    21d0: a5e0a182     	ld1d	{ z2.d }, p0/z, [x12]
    21d4: f9412bec     	ldr	x12, [sp, #0x250]
    21d8: a5e0a183     	ld1d	{ z3.d }, p0/z, [x12]
    21dc: f94127ec     	ldr	x12, [sp, #0x248]
    21e0: a5e0a184     	ld1d	{ z4.d }, p0/z, [x12]
    21e4: f94123ec     	ldr	x12, [sp, #0x240]
    21e8: a5e0a185     	ld1d	{ z5.d }, p0/z, [x12]
    21ec: 5280002c     	mov	w12, #0x1               // =1
    21f0: c0c00040     	mov	za0h.d[w12, 0], p0/m, z2.d
    21f4: c0c00062     	mov	za1h.d[w12, 0], p0/m, z3.d
    21f8: c0c00084     	mov	za2h.d[w12, 0], p0/m, z4.d
    21fc: c0c000a6     	mov	za3h.d[w12, 0], p0/m, z5.d
    2200: f9411fed     	ldr	x13, [sp, #0x238]
    2204: a5e0a1a2     	ld1d	{ z2.d }, p0/z, [x13]
    2208: f9411bed     	ldr	x13, [sp, #0x230]
    220c: a5e0a1a3     	ld1d	{ z3.d }, p0/z, [x13]
    2210: f94117ed     	ldr	x13, [sp, #0x228]
    2214: a5e0a1a4     	ld1d	{ z4.d }, p0/z, [x13]
    2218: f9410fed     	ldr	x13, [sp, #0x218]
    221c: a5e0a1a5     	ld1d	{ z5.d }, p0/z, [x13]
    2220: c0c04040     	mov	za0h.d[w14, 0], p0/m, z2.d
    2224: c0c04062     	mov	za1h.d[w14, 0], p0/m, z3.d
    2228: c0c04084     	mov	za2h.d[w14, 0], p0/m, z4.d
    222c: c0c040a6     	mov	za3h.d[w14, 0], p0/m, z5.d
    2230: f94113ed     	ldr	x13, [sp, #0x220]
    2234: a5e0a1a2     	ld1d	{ z2.d }, p0/z, [x13]
    2238: f9410bed     	ldr	x13, [sp, #0x210]
    223c: a5e0a1a3     	ld1d	{ z3.d }, p0/z, [x13]
    2240: a95fb3ed     	ldp	x13, x12, [sp, #0x1f8]
    2244: a5e0a184     	ld1d	{ z4.d }, p0/z, [x12]
    2248: a5e0a1a5     	ld1d	{ z5.d }, p0/z, [x13]
    224c: 5280006d     	mov	w13, #0x3               // =3
    2250: c0c02040     	mov	za0h.d[w13, 0], p0/m, z2.d
    2254: c0c02062     	mov	za1h.d[w13, 0], p0/m, z3.d
    2258: c0c02084     	mov	za2h.d[w13, 0], p0/m, z4.d
    225c: c0c020a6     	mov	za3h.d[w13, 0], p0/m, z5.d
    2260: f94107f9     	ldr	x25, [sp, #0x208]
    2264: a5e0a322     	ld1d	{ z2.d }, p0/z, [x25]
    2268: a95eb3f9     	ldp	x25, x12, [sp, #0x1e8]
    226c: a5e0a324     	ld1d	{ z4.d }, p0/z, [x25]
    2270: f940f3f9     	ldr	x25, [sp, #0x1e0]
    2274: a5e0a183     	ld1d	{ z3.d }, p0/z, [x12]
    2278: 5280008c     	mov	w12, #0x4               // =4
    227c: a5e0a325     	ld1d	{ z5.d }, p0/z, [x25]
    2280: c0c00040     	mov	za0h.d[w12, 0], p0/m, z2.d
    2284: c0c00062     	mov	za1h.d[w12, 0], p0/m, z3.d
    2288: c0c00084     	mov	za2h.d[w12, 0], p0/m, z4.d
    228c: c0c000a6     	mov	za3h.d[w12, 0], p0/m, z5.d
    2290: a95d33f9     	ldp	x25, x12, [sp, #0x1d0]
    2294: a5e0a323     	ld1d	{ z3.d }, p0/z, [x25]
    2298: f940e7f9     	ldr	x25, [sp, #0x1c8]
    229c: a5e0a182     	ld1d	{ z2.d }, p0/z, [x12]
    22a0: 528000ac     	mov	w12, #0x5               // =5
    22a4: a5e0a324     	ld1d	{ z4.d }, p0/z, [x25]
    22a8: f940dff9     	ldr	x25, [sp, #0x1b8]
    22ac: a5e0a325     	ld1d	{ z5.d }, p0/z, [x25]
    22b0: c0c00040     	mov	za0h.d[w12, 0], p0/m, z2.d
    22b4: c0c00062     	mov	za1h.d[w12, 0], p0/m, z3.d
    22b8: c0c00084     	mov	za2h.d[w12, 0], p0/m, z4.d
    22bc: c0c000a6     	mov	za3h.d[w12, 0], p0/m, z5.d
    22c0: f940e3f9     	ldr	x25, [sp, #0x1c0]
    22c4: a5e0a322     	ld1d	{ z2.d }, p0/z, [x25]
    22c8: f940dbf9     	ldr	x25, [sp, #0x1b0]
    22cc: a5e0a323     	ld1d	{ z3.d }, p0/z, [x25]
    22d0: a959b3f9     	ldp	x25, x12, [sp, #0x198]
    22d4: a5e0a184     	ld1d	{ z4.d }, p0/z, [x12]
    22d8: a5e0a325     	ld1d	{ z5.d }, p0/z, [x25]
    22dc: 528000cc     	mov	w12, #0x6               // =6
    22e0: c0c00040     	mov	za0h.d[w12, 0], p0/m, z2.d
    22e4: c0c00062     	mov	za1h.d[w12, 0], p0/m, z3.d
    22e8: c0c00084     	mov	za2h.d[w12, 0], p0/m, z4.d
    22ec: c0c000a6     	mov	za3h.d[w12, 0], p0/m, z5.d
    22f0: f940d7f9     	ldr	x25, [sp, #0x1a8]
    22f4: a5e0a322     	ld1d	{ z2.d }, p0/z, [x25]
    22f8: a958b3f9     	ldp	x25, x12, [sp, #0x188]
    22fc: a5e0a324     	ld1d	{ z4.d }, p0/z, [x25]
    2300: f940c3f9     	ldr	x25, [sp, #0x180]
    2304: a5e0a183     	ld1d	{ z3.d }, p0/z, [x12]
    2308: 528000ec     	mov	w12, #0x7               // =7
    230c: a5e0a325     	ld1d	{ z5.d }, p0/z, [x25]
    2310: c0c00040     	mov	za0h.d[w12, 0], p0/m, z2.d
    2314: c0c00062     	mov	za1h.d[w12, 0], p0/m, z3.d
    2318: c0c00084     	mov	za2h.d[w12, 0], p0/m, z4.d
    231c: c0c000a6     	mov	za3h.d[w12, 0], p0/m, z5.d
    2320: a95733f9     	ldp	x25, x12, [sp, #0x170]
    2324: a5e0a323     	ld1d	{ z3.d }, p0/z, [x25]
    2328: f940b7f9     	ldr	x25, [sp, #0x168]
    232c: a5e0a182     	ld1d	{ z2.d }, p0/z, [x12]
    2330: a5e0a324     	ld1d	{ z4.d }, p0/z, [x25]
    2334: f940aff9     	ldr	x25, [sp, #0x158]
    2338: a5e0a325     	ld1d	{ z5.d }, p0/z, [x25]
    233c: c0c06048     	mov	za4h.d[w15, 0], p0/m, z2.d
    2340: c0c0606a     	mov	za5h.d[w15, 0], p0/m, z3.d
    2344: c0c0608c     	mov	za6h.d[w15, 0], p0/m, z4.d
    2348: c0c060ae     	mov	za7h.d[w15, 0], p0/m, z5.d
    234c: f940b3ef     	ldr	x15, [sp, #0x160]
    2350: a5e0a1e2     	ld1d	{ z2.d }, p0/z, [x15]
    2354: f940abef     	ldr	x15, [sp, #0x150]
    2358: a5e0a1e3     	ld1d	{ z3.d }, p0/z, [x15]
    235c: a953b3ef     	ldp	x15, x12, [sp, #0x138]
    2360: a5e0a184     	ld1d	{ z4.d }, p0/z, [x12]
    2364: a5e0a1e5     	ld1d	{ z5.d }, p0/z, [x15]
    2368: 5280002c     	mov	w12, #0x1               // =1
    236c: c0c00048     	mov	za4h.d[w12, 0], p0/m, z2.d
    2370: c0c0006a     	mov	za5h.d[w12, 0], p0/m, z3.d
    2374: c0c0008c     	mov	za6h.d[w12, 0], p0/m, z4.d
    2378: c0c000ae     	mov	za7h.d[w12, 0], p0/m, z5.d
    237c: f940a7ec     	ldr	x12, [sp, #0x148]
    2380: a5e0a182     	ld1d	{ z2.d }, p0/z, [x12]
    2384: a952bfec     	ldp	x12, x15, [sp, #0x128]
    2388: a5e0a1e3     	ld1d	{ z3.d }, p0/z, [x15]
    238c: a5e0a184     	ld1d	{ z4.d }, p0/z, [x12]
    2390: a951bfec     	ldp	x12, x15, [sp, #0x118]
    2394: a5e0a1e5     	ld1d	{ z5.d }, p0/z, [x15]
    2398: c0c04048     	mov	za4h.d[w14, 0], p0/m, z2.d
    239c: c0c0406a     	mov	za5h.d[w14, 0], p0/m, z3.d
    23a0: c0c0408c     	mov	za6h.d[w14, 0], p0/m, z4.d
    23a4: c0c040ae     	mov	za7h.d[w14, 0], p0/m, z5.d
    23a8: a5e0a182     	ld1d	{ z2.d }, p0/z, [x12]
    23ac: a950bbec     	ldp	x12, x14, [sp, #0x108]
    23b0: a5e0a1c3     	ld1d	{ z3.d }, p0/z, [x14]
    23b4: a5e0a184     	ld1d	{ z4.d }, p0/z, [x12]
    23b8: a94fb3ee     	ldp	x14, x12, [sp, #0xf8]
    23bc: a5e0a1c5     	ld1d	{ z5.d }, p0/z, [x14]
    23c0: c0c02048     	mov	za4h.d[w13, 0], p0/m, z2.d
    23c4: c0c0206a     	mov	za5h.d[w13, 0], p0/m, z3.d
    23c8: c0c0208c     	mov	za6h.d[w13, 0], p0/m, z4.d
    23cc: c0c020ae     	mov	za7h.d[w13, 0], p0/m, z5.d
    23d0: a5e0a182     	ld1d	{ z2.d }, p0/z, [x12]
    23d4: f9407bec     	ldr	x12, [sp, #0xf0]
    23d8: a5e0a183     	ld1d	{ z3.d }, p0/z, [x12]
    23dc: a94db7ec     	ldp	x12, x13, [sp, #0xd8]
    23e0: a5e0a1a4     	ld1d	{ z4.d }, p0/z, [x13]
    23e4: a5e0a185     	ld1d	{ z5.d }, p0/z, [x12]
    23e8: 5280008c     	mov	w12, #0x4               // =4
    23ec: c0c00048     	mov	za4h.d[w12, 0], p0/m, z2.d
    23f0: c0c0006a     	mov	za5h.d[w12, 0], p0/m, z3.d
    23f4: c0c0008c     	mov	za6h.d[w12, 0], p0/m, z4.d
    23f8: c0c000ae     	mov	za7h.d[w12, 0], p0/m, z5.d
    23fc: f94077ec     	ldr	x12, [sp, #0xe8]
    2400: a5e0a182     	ld1d	{ z2.d }, p0/z, [x12]
    2404: a94cb7ec     	ldp	x12, x13, [sp, #0xc8]
    2408: a5e0a184     	ld1d	{ z4.d }, p0/z, [x12]
    240c: f94063ec     	ldr	x12, [sp, #0xc0]
    2410: a5e0a1a3     	ld1d	{ z3.d }, p0/z, [x13]
    2414: a5e0a185     	ld1d	{ z5.d }, p0/z, [x12]
    2418: 528000ac     	mov	w12, #0x5               // =5
    241c: c0c00048     	mov	za4h.d[w12, 0], p0/m, z2.d
    2420: c0c0006a     	mov	za5h.d[w12, 0], p0/m, z3.d
    2424: c0c0008c     	mov	za6h.d[w12, 0], p0/m, z4.d
    2428: c0c000ae     	mov	za7h.d[w12, 0], p0/m, z5.d
    242c: a94b37ec     	ldp	x12, x13, [sp, #0xb0]
    2430: a5e0a183     	ld1d	{ z3.d }, p0/z, [x12]
    2434: f94057ec     	ldr	x12, [sp, #0xa8]
    2438: a5e0a1a2     	ld1d	{ z2.d }, p0/z, [x13]
    243c: a5e0a184     	ld1d	{ z4.d }, p0/z, [x12]
    2440: f9404fec     	ldr	x12, [sp, #0x98]
    2444: a5e0a185     	ld1d	{ z5.d }, p0/z, [x12]
    2448: 528000cc     	mov	w12, #0x6               // =6
    244c: c0c00048     	mov	za4h.d[w12, 0], p0/m, z2.d
    2450: c0c0006a     	mov	za5h.d[w12, 0], p0/m, z3.d
    2454: c0c0008c     	mov	za6h.d[w12, 0], p0/m, z4.d
    2458: c0c000ae     	mov	za7h.d[w12, 0], p0/m, z5.d
    245c: f94053ec     	ldr	x12, [sp, #0xa0]
    2460: a5e0a182     	ld1d	{ z2.d }, p0/z, [x12]
    2464: a948b7ec     	ldp	x12, x13, [sp, #0x88]
    2468: a5e0a184     	ld1d	{ z4.d }, p0/z, [x12]
    246c: f94043ec     	ldr	x12, [sp, #0x80]
    2470: a5e0a1a3     	ld1d	{ z3.d }, p0/z, [x13]
    2474: a5e0a185     	ld1d	{ z5.d }, p0/z, [x12]
    2478: 528000ec     	mov	w12, #0x7               // =7
    247c: c0c00048     	mov	za4h.d[w12, 0], p0/m, z2.d
    2480: c0c0006a     	mov	za5h.d[w12, 0], p0/m, z3.d
    2484: c0c0008c     	mov	za6h.d[w12, 0], p0/m, z4.d
    2488: c0c000ae     	mov	za7h.d[w12, 0], p0/m, z5.d
    248c: a9463bed     	ldp	x13, x14, [sp, #0x60]
    2490: 7100231f     	cmp	w24, #0x8
    2494: f90147fd     	str	x29, [sp, #0x288]
    2498: f90143fe     	str	x30, [sp, #0x280]
    249c: 54ffcfca     	b.ge	0x1e94 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x784>
    24a0: 2a1f03ef     	mov	w15, wzr
    24a4: aa1d03f9     	mov	x25, x29
    24a8: aa1e03fa     	mov	x26, x30
    24ac: 6b1801ff     	cmp	w15, w24
    24b0: 54ffb3ca     	b.ge	0x1b28 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x418>
    24b4: a5e0a342     	ld1d	{ z2.d }, p0/z, [x26]
    24b8: a5e0a323     	ld1d	{ z3.d }, p0/z, [x25]
    24bc: 110005ef     	add	w15, w15, #0x1
    24c0: a5e1a324     	ld1d	{ z4.d }, p0/z, [x25, #0x1, mul vl]
    24c4: a5e1a345     	ld1d	{ z5.d }, p0/z, [x26, #0x1, mul vl]
    24c8: 6b1801ff     	cmp	w15, w24
    24cc: a5e2a326     	ld1d	{ z6.d }, p0/z, [x25, #0x2, mul vl]
    24d0: a5e3a327     	ld1d	{ z7.d }, p0/z, [x25, #0x3, mul vl]
    24d4: 8b01035a     	add	x26, x26, x1
    24d8: 8b170339     	add	x25, x25, x23
    24dc: 80c30040     	fmopa	za0.d, p0/m, p0/m, z2.d, z3.d
    24e0: 80c40041     	fmopa	za1.d, p0/m, p0/m, z2.d, z4.d
    24e4: 80c60042     	fmopa	za2.d, p0/m, p0/m, z2.d, z6.d
    24e8: 80c70043     	fmopa	za3.d, p0/m, p0/m, z2.d, z7.d
    24ec: 80c300a4     	fmopa	za4.d, p0/m, p0/m, z5.d, z3.d
    24f0: 80c400a5     	fmopa	za5.d, p0/m, p0/m, z5.d, z4.d
    24f4: 80c600a6     	fmopa	za6.d, p0/m, p0/m, z5.d, z6.d
    24f8: 80c700a7     	fmopa	za7.d, p0/m, p0/m, z5.d, z7.d
    24fc: 54fffdcb     	b.lt	0x24b4 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0xda4>
    2500: 17fffd8a     	b	0x1b28 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x418>
    2504: d503427f     	smstop	sm
    2508: 910d03ff     	add	sp, sp, #0x340
    250c: a9494ff4     	ldp	x20, x19, [sp, #0x90]
    2510: a94857f6     	ldp	x22, x21, [sp, #0x80]
    2514: a9475ff8     	ldp	x24, x23, [sp, #0x70]
    2518: a94667fa     	ldp	x26, x25, [sp, #0x60]
    251c: a9456ffc     	ldp	x28, x27, [sp, #0x50]
    2520: a9447bfd     	ldp	x29, x30, [sp, #0x40]
    2524: 6d4323e9     	ldp	d9, d8, [sp, #0x30]
    2528: 6d422beb     	ldp	d11, d10, [sp, #0x20]
    252c: 6d4133ed     	ldp	d13, d12, [sp, #0x10]
    2530: 6cca3bef     	ldp	d15, d14, [sp], #0xa0
    2534: d65f03c0     	ret

Disassembly of section .fini:

0000000000002538 <_fini>:
    2538: d503201f     	nop
    253c: a9bf7bfd     	stp	x29, x30, [sp, #-0x10]!
    2540: 910003fd     	mov	x29, sp
    2544: a8c17bfd     	ldp	x29, x30, [sp], #0x10
    2548: d65f03c0     	ret
