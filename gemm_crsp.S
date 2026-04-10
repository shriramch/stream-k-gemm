
gemm_crsp:	file format elf64-littleaarch64

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
     994: d0000090     	adrp	x16, 0x12000 <__FRAME_END__+0xf67c>
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
     adc: d0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xf67c>
     ae0: f947e000     	ldr	x0, [x0, #0xfc0]
     ae4: d2800003     	mov	x3, #0x0                // =0
     ae8: d2800004     	mov	x4, #0x0                // =0
     aec: 97ffffcd     	bl	0xa20 <__libc_start_main@plt>
     af0: 97ffffdc     	bl	0xa60 <abort@plt>

0000000000000af4 <call_weak_fn>:
     af4: d0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xf67c>
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
     b28: d0000081     	adrp	x1, 0x12000 <__FRAME_END__+0xf67c>
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
     b64: d0000082     	adrp	x2, 0x12000 <__FRAME_END__+0xf67c>
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
     b98: d0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xf67c>
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
     bd4: a9bb7bfd     	stp	x29, x30, [sp, #-0x50]!
     bd8: f9000bf9     	str	x25, [sp, #0x10]
     bdc: a9025ff8     	stp	x24, x23, [sp, #0x20]
     be0: a90357f6     	stp	x22, x21, [sp, #0x30]
     be4: a9044ff4     	stp	x20, x19, [sp, #0x40]
     be8: 910003fd     	mov	x29, sp
     bec: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x4fc>
     bf0: 91175400     	add	x0, x0, #0x5d5
     bf4: 97ffff7b     	bl	0x9e0 <puts@plt>
     bf8: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x4fc>
     bfc: 91114000     	add	x0, x0, #0x450
     c00: 52800801     	mov	w1, #0x40               // =64
     c04: 52800202     	mov	w2, #0x10               // =16
     c08: 52800403     	mov	w3, #0x20               // =32
     c0c: 97ffffa5     	bl	0xaa0 <printf@plt>
     c10: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x4fc>
     c14: 9111d000     	add	x0, x0, #0x474
     c18: 52810001     	mov	w1, #0x800              // =2048
     c1c: 52800202     	mov	w2, #0x10               // =16
     c20: 97ffffa0     	bl	0xaa0 <printf@plt>
     c24: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x4fc>
     c28: 91121c00     	add	x0, x0, #0x487
     c2c: 528004c1     	mov	w1, #0x26               // =38
     c30: 97ffff9c     	bl	0xaa0 <printf@plt>
     c34: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x4fc>
     c38: 9117e000     	add	x0, x0, #0x5f8
     c3c: 97ffff69     	bl	0x9e0 <puts@plt>
     c40: 2f00e401     	movi	d1, #0000000000000000
     c44: 1e6e1000     	fmov	d0, #1.00000000
     c48: 52800400     	mov	w0, #0x20               // =32
     c4c: 52800801     	mov	w1, #0x40               // =64
     c50: 52801002     	mov	w2, #0x80               // =128
     c54: 940000a9     	bl	0xef8 <_Z9test_gemmIdEbiiiT_S0_>
     c58: 2a0003f3     	mov	w19, w0
     c5c: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x4fc>
     c60: 91184000     	add	x0, x0, #0x610
     c64: 97ffff5f     	bl	0x9e0 <puts@plt>
     c68: 2f00e401     	movi	d1, #0000000000000000
     c6c: 1e6e1000     	fmov	d0, #1.00000000
     c70: 52800400     	mov	w0, #0x20               // =32
     c74: 52800801     	mov	w1, #0x40               // =64
     c78: 52820002     	mov	w2, #0x1000             // =4096
     c7c: 9400009f     	bl	0xef8 <_Z9test_gemmIdEbiiiT_S0_>
     c80: 72000268     	ands	w8, w19, #0x1
     c84: 52800029     	mov	w9, #0x1                // =1
     c88: 1a890529     	cinc	w9, w9, ne
     c8c: 7200001f     	tst	w0, #0x1
     c90: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x4fc>
     c94: 9118a000     	add	x0, x0, #0x628
     c98: 1a881133     	csel	w19, w9, w8, ne
     c9c: 97ffff51     	bl	0x9e0 <puts@plt>
     ca0: 1e601000     	fmov	d0, #2.00000000
     ca4: 1e6c1001     	fmov	d1, #0.50000000
     ca8: 52800400     	mov	w0, #0x20               // =32
     cac: 52800801     	mov	w1, #0x40               // =64
     cb0: 52820002     	mov	w2, #0x1000             // =4096
     cb4: 94000091     	bl	0xef8 <_Z9test_gemmIdEbiiiT_S0_>
     cb8: 12000014     	and	w20, w0, #0x1
     cbc: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x4fc>
     cc0: 91191800     	add	x0, x0, #0x646
     cc4: 97ffff47     	bl	0x9e0 <puts@plt>
     cc8: 2f00e401     	movi	d1, #0000000000000000
     ccc: 1e6e1000     	fmov	d0, #1.00000000
     cd0: 52800800     	mov	w0, #0x40               // =64
     cd4: 52801001     	mov	w1, #0x80               // =128
     cd8: 52810002     	mov	w2, #0x800              // =2048
     cdc: 94000087     	bl	0xef8 <_Z9test_gemmIdEbiiiT_S0_>
     ce0: 12000008     	and	w8, w0, #0x1
     ce4: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x4fc>
     ce8: 91125000     	add	x0, x0, #0x494
     cec: 0b080288     	add	w8, w20, w8
     cf0: 0b080261     	add	w1, w19, w8
     cf4: 97ffff6b     	bl	0xaa0 <printf@plt>
     cf8: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x4fc>
     cfc: 91198c00     	add	x0, x0, #0x663
     d00: 97ffff38     	bl	0x9e0 <puts@plt>
     d04: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x4fc>
     d08: 9112e800     	add	x0, x0, #0x4ba
     d0c: 52800801     	mov	w1, #0x40               // =64
     d10: 52801002     	mov	w2, #0x80               // =128
     d14: 52820003     	mov	w3, #0x1000             // =4096
     d18: 52800044     	mov	w4, #0x2                // =2
     d1c: 97ffff61     	bl	0xaa0 <printf@plt>
     d20: 528004c0     	mov	w0, #0x26               // =38
     d24: 97ffff4b     	bl	0xa50 <omp_set_num_threads@plt>
     d28: 52a00400     	mov	w0, #0x200000           // =2097152
     d2c: 97ffff21     	bl	0x9b0 <_Znam@plt>
     d30: aa0003f3     	mov	x19, x0
     d34: 52a00800     	mov	w0, #0x400000           // =4194304
     d38: 97ffff1e     	bl	0x9b0 <_Znam@plt>
     d3c: aa0003f4     	mov	x20, x0
     d40: 52a00020     	mov	w0, #0x10000            // =65536
     d44: 97ffff1b     	bl	0x9b0 <_Znam@plt>
     d48: 25d8e3e0     	ptrue	p0.d
     d4c: 04e14002     	index	z2.d, #0x0, #0x1
     d50: 04e0e3e9     	cntd	x9
     d54: 05e03920     	mov	z0.d, x9
     d58: d0000009     	adrp	x9, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x4fc>
     d5c: 91108129     	add	x9, x9, #0x420
     d60: aa0003f5     	mov	x21, x0
     d64: aa1f03e8     	mov	x8, xzr
     d68: 04623043     	mov	z3.d, z2.d
     d6c: 85c0e121     	ld1rd	{ z1.d }, p0/z, [x9]
     d70: 04335029     	addvl	x9, x19, #0x1
     d74: 04e00064     	add	z4.d, z3.d, z0.d
     d78: 65d0a063     	scvtf	z3.d, p0/m, z3.s
     d7c: 0420bc85     	movprfx	z5, z4
     d80: 65d0a085     	scvtf	z5.d, p0/m, z4.s
     d84: 65c108a5     	fmul	z5.d, z5.d, z1.d
     d88: 65c10863     	fmul	z3.d, z3.d, z1.d
     d8c: e5e84263     	st1d	{ z3.d }, p0, [x19, x8, lsl #3]
     d90: 04e00083     	add	z3.d, z4.d, z0.d
     d94: e5e84125     	st1d	{ z5.d }, p0, [x9, x8, lsl #3]
     d98: 04b0e3e8     	incw	x8
     d9c: f141011f     	cmp	x8, #0x40, lsl #12      // =0x40000
     da0: 54fffea1     	b.ne	0xd74 <main+0x1a0>
     da4: aa1f03e8     	mov	x8, xzr
     da8: 04345029     	addvl	x9, x20, #0x1
     dac: 04e00043     	add	z3.d, z2.d, z0.d
     db0: 65d0a042     	scvtf	z2.d, p0/m, z2.s
     db4: 0420bc64     	movprfx	z4, z3
     db8: 65d0a064     	scvtf	z4.d, p0/m, z3.s
     dbc: 65c10884     	fmul	z4.d, z4.d, z1.d
     dc0: 65c10842     	fmul	z2.d, z2.d, z1.d
     dc4: e5e84282     	st1d	{ z2.d }, p0, [x20, x8, lsl #3]
     dc8: 04e00062     	add	z2.d, z3.d, z0.d
     dcc: e5e84124     	st1d	{ z4.d }, p0, [x9, x8, lsl #3]
     dd0: 04b0e3e8     	incw	x8
     dd4: f142011f     	cmp	x8, #0x80, lsl #12      // =0x80000
     dd8: 54fffea1     	b.ne	0xdac <main+0x1d8>
     ddc: aa1503e0     	mov	x0, x21
     de0: 2a1f03e1     	mov	w1, wzr
     de4: 52a00022     	mov	w2, #0x10000            // =65536
     de8: 97ffff06     	bl	0xa00 <memset@plt>
     dec: 52a00400     	mov	w0, #0x200000           // =2097152
     df0: 97fffef0     	bl	0x9b0 <_Znam@plt>
     df4: aa0003f6     	mov	x22, x0
     df8: 52a00800     	mov	w0, #0x400000           // =4194304
     dfc: 97fffeed     	bl	0x9b0 <_Znam@plt>
     e00: aa0003f7     	mov	x23, x0
     e04: 52800800     	mov	w0, #0x40               // =64
     e08: 52820001     	mov	w1, #0x1000             // =4096
     e0c: aa1303e2     	mov	x2, x19
     e10: aa1603e3     	mov	x3, x22
     e14: 940001a5     	bl	0x14a8 <_ZN4gemmIdE6pack_AEiiPKdPd>
     e18: 52801000     	mov	w0, #0x80               // =128
     e1c: 52820001     	mov	w1, #0x1000             // =4096
     e20: aa1403e2     	mov	x2, x20
     e24: aa1703e3     	mov	x3, x23
     e28: 940001e3     	bl	0x15b4 <_ZN4gemmIdE6pack_BEiiPKdPd>
     e2c: 2f00e401     	movi	d1, #0000000000000000
     e30: 1e6e1000     	fmov	d0, #1.00000000
     e34: 52800800     	mov	w0, #0x40               // =64
     e38: 52801001     	mov	w1, #0x80               // =128
     e3c: 52820002     	mov	w2, #0x1000             // =4096
     e40: aa1603e3     	mov	x3, x22
     e44: aa1703e4     	mov	x4, x23
     e48: aa1503e5     	mov	x5, x21
     e4c: 9400024d     	bl	0x1780 <_ZN4gemmIdE22compute_streamk_packedEiiiPKdS2_Pddd>
     e50: 97fffee0     	bl	0x9d0 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
     e54: 2f00e401     	movi	d1, #0000000000000000
     e58: 1e6e1000     	fmov	d0, #1.00000000
     e5c: aa0003f8     	mov	x24, x0
     e60: 52800800     	mov	w0, #0x40               // =64
     e64: 52801001     	mov	w1, #0x80               // =128
     e68: 52820002     	mov	w2, #0x1000             // =4096
     e6c: aa1603e3     	mov	x3, x22
     e70: aa1703e4     	mov	x4, x23
     e74: aa1503e5     	mov	x5, x21
     e78: 94000242     	bl	0x1780 <_ZN4gemmIdE22compute_streamk_packedEiiiPKdS2_Pddd>
     e7c: 97fffed5     	bl	0x9d0 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
     e80: aa0003f9     	mov	x25, x0
     e84: aa1603e0     	mov	x0, x22
     e88: 97fffeee     	bl	0xa40 <_ZdaPv@plt>
     e8c: aa1703e0     	mov	x0, x23
     e90: 97fffeec     	bl	0xa40 <_ZdaPv@plt>
     e94: cb180328     	sub	x8, x25, x24
     e98: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x4fc>
     e9c: 91136000     	add	x0, x0, #0x4d8
     ea0: 9e620101     	scvtf	d1, x8
     ea4: d2c80008     	mov	x8, #0x400000000000     // =70368744177664
     ea8: f2e811e8     	movk	x8, #0x408f, lsl #48
     eac: 9e670100     	fmov	d0, x8
     eb0: d2e83208     	mov	x8, #0x4190000000000000 // =4724276009111650304
     eb4: 9e670102     	fmov	d2, x8
     eb8: 1e601820     	fdiv	d0, d1, d0
     ebc: 1e611841     	fdiv	d1, d2, d1
     ec0: 97fffef8     	bl	0xaa0 <printf@plt>
     ec4: aa1303e0     	mov	x0, x19
     ec8: 97fffede     	bl	0xa40 <_ZdaPv@plt>
     ecc: aa1403e0     	mov	x0, x20
     ed0: 97fffedc     	bl	0xa40 <_ZdaPv@plt>
     ed4: aa1503e0     	mov	x0, x21
     ed8: 97fffeda     	bl	0xa40 <_ZdaPv@plt>
     edc: 2a1f03e0     	mov	w0, wzr
     ee0: a9444ff4     	ldp	x20, x19, [sp, #0x40]
     ee4: f9400bf9     	ldr	x25, [sp, #0x10]
     ee8: a94357f6     	ldp	x22, x21, [sp, #0x30]
     eec: a9425ff8     	ldp	x24, x23, [sp, #0x20]
     ef0: a8c57bfd     	ldp	x29, x30, [sp], #0x50
     ef4: d65f03c0     	ret

0000000000000ef8 <_Z9test_gemmIdEbiiiT_S0_>:
     ef8: d10303ff     	sub	sp, sp, #0xc0
     efc: fd0023ea     	str	d10, [sp, #0x40]
     f00: 6d0523e9     	stp	d9, d8, [sp, #0x50]
     f04: a9067bfd     	stp	x29, x30, [sp, #0x60]
     f08: a9076ffc     	stp	x28, x27, [sp, #0x70]
     f0c: a90867fa     	stp	x26, x25, [sp, #0x80]
     f10: a9095ff8     	stp	x24, x23, [sp, #0x90]
     f14: a90a57f6     	stp	x22, x21, [sp, #0xa0]
     f18: a90b4ff4     	stp	x20, x19, [sp, #0xb0]
     f1c: 910183fd     	add	x29, sp, #0x60
     f20: 2a0203f3     	mov	w19, w2
     f24: 2a0103f8     	mov	w24, w1
     f28: 2a0003f9     	mov	w25, w0
     f2c: d0000000     	adrp	x0, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x4fc>
     f30: 9113f800     	add	x0, x0, #0x4fe
     f34: d0000001     	adrp	x1, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x4fc>
     f38: 9113dc21     	add	x1, x1, #0x4f7
     f3c: 2a1903e2     	mov	w2, w25
     f40: 2a1803e3     	mov	w3, w24
     f44: 2a1303e4     	mov	w4, w19
     f48: 1e604028     	fmov	d8, d1
     f4c: 1e604009     	fmov	d9, d0
     f50: 97fffed4     	bl	0xaa0 <printf@plt>
     f54: 528004c0     	mov	w0, #0x26               // =38
     f58: 97fffebe     	bl	0xa50 <omp_set_num_threads@plt>
     f5c: 1b197e68     	mul	w8, w19, w25
     f60: d37d7d00     	ubfiz	x0, x8, #3, #32
     f64: 97fffe93     	bl	0x9b0 <_Znam@plt>
     f68: 1b187e68     	mul	w8, w19, w24
     f6c: aa0003fc     	mov	x28, x0
     f70: d37d7d08     	ubfiz	x8, x8, #3, #32
     f74: aa0803e0     	mov	x0, x8
     f78: 97fffe8e     	bl	0x9b0 <_Znam@plt>
     f7c: 1b197f08     	mul	w8, w24, w25
     f80: aa0003f4     	mov	x20, x0
     f84: d37d7d16     	ubfiz	x22, x8, #3, #32
     f88: f9001be8     	str	x8, [sp, #0x30]
     f8c: aa1603e0     	mov	x0, x22
     f90: 97fffe88     	bl	0x9b0 <_Znam@plt>
     f94: f81d83a0     	stur	x0, [x29, #-0x28]
     f98: aa1603e0     	mov	x0, x22
     f9c: aa1603f5     	mov	x21, x22
     fa0: 97fffe84     	bl	0x9b0 <_Znam@plt>
     fa4: 04bf502a     	rdvl	x10, #0x1
     fa8: 25d8e3e0     	ptrue	p0.d
     fac: 04e0e3eb     	cntd	x11
     fb0: d344fd5b     	lsr	x27, x10, #4
     fb4: 321e73ea     	mov	w10, #0x7ffffffc        // =2147483644
     fb8: 04e14004     	index	z4.d, #0x0, #0x1
     fbc: d000000d     	adrp	x13, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x4fc>
     fc0: 9110a1ad     	add	x13, x13, #0x428
     fc4: 05e03963     	mov	z3.d, x11
     fc8: 9b0a7f6a     	mul	x10, x27, x10
     fcc: d000000b     	adrp	x11, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x4fc>
     fd0: d000000c     	adrp	x12, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x4fc>
     fd4: 2a1903f7     	mov	w23, w25
     fd8: fd421161     	ldr	d1, [x11, #0x420]
     fdc: fd421582     	ldr	d2, [x12, #0x428]
     fe0: aa0003f6     	mov	x22, x0
     fe4: 2a1f03e8     	mov	w8, wzr
     fe8: aa1f03e9     	mov	x9, xzr
     fec: 85c0e1a0     	ld1rd	{ z0.d }, p0/z, [x13]
     ff0: b9002ff3     	str	w19, [sp, #0x2c]
     ff4: 2a1303fa     	mov	w26, w19
     ff8: 04a0e3f3     	cntw	x19
     ffc: 8a17014a     	and	x10, x10, x23
    1000: 14000004     	b	0x1010 <_Z9test_gemmIdEbiiiT_S0_+0x118>
    1004: eb1a013f     	cmp	x9, x26
    1008: 0b190108     	add	w8, w8, w25
    100c: 540004c0     	b.eq	0x10a4 <_Z9test_gemmIdEbiiiT_S0_+0x1ac>
    1010: 91000529     	add	x9, x9, #0x1
    1014: 8b284f8b     	add	x11, x28, w8, uxtw #3
    1018: eb17027f     	cmp	x19, x23
    101c: 1e620125     	scvtf	d5, w9
    1020: 1e6108a5     	fmul	d5, d5, d1
    1024: 54000069     	b.ls	0x1030 <_Z9test_gemmIdEbiiiT_S0_+0x138>
    1028: aa1f03ec     	mov	x12, xzr
    102c: 14000016     	b	0x1084 <_Z9test_gemmIdEbiiiT_S0_+0x18c>
    1030: 052820a6     	mov	z6.d, d5
    1034: 04643087     	mov	z7.d, z4.d
    1038: aa1f03ec     	mov	x12, xzr
    103c: 042b502d     	addvl	x13, x11, #0x1
    1040: 04e300f0     	add	z16.d, z7.d, z3.d
    1044: 25e0c027     	add	z7.d, z7.d, #0x1        // =1
    1048: 04e30211     	add	z17.d, z16.d, z3.d
    104c: 25e0c030     	add	z16.d, z16.d, #0x1      // =1
    1050: 65d0a0e7     	scvtf	z7.d, p0/m, z7.s
    1054: 65d0a210     	scvtf	z16.d, p0/m, z16.s
    1058: 65e68007     	fmad	z7.d, p0/m, z0.d, z6.d
    105c: 65e68010     	fmad	z16.d, p0/m, z0.d, z6.d
    1060: e5ec4167     	st1d	{ z7.d }, p0, [x11, x12, lsl #3]
    1064: 04713227     	mov	z7.d, z17.d
    1068: e5ec41b0     	st1d	{ z16.d }, p0, [x13, x12, lsl #3]
    106c: 04b0e3ec     	incw	x12
    1070: eb0c015f     	cmp	x10, x12
    1074: 54fffe61     	b.ne	0x1040 <_Z9test_gemmIdEbiiiT_S0_+0x148>
    1078: eb17015f     	cmp	x10, x23
    107c: aa0a03ec     	mov	x12, x10
    1080: 54fffc20     	b.eq	0x1004 <_Z9test_gemmIdEbiiiT_S0_+0x10c>
    1084: 9100058d     	add	x13, x12, #0x1
    1088: 1e6201a6     	scvtf	d6, w13
    108c: eb0d02ff     	cmp	x23, x13
    1090: 1f4214c6     	fmadd	d6, d6, d2, d5
    1094: fc2c7966     	str	d6, [x11, x12, lsl #3]
    1098: aa0d03ec     	mov	x12, x13
    109c: 54ffff41     	b.ne	0x1084 <_Z9test_gemmIdEbiiiT_S0_+0x18c>
    10a0: 17ffffd9     	b	0x1004 <_Z9test_gemmIdEbiiiT_S0_+0x10c>
    10a4: d37ffb6b     	lsl	x11, x27, #1
    10a8: 5301036a     	lsl	w10, w27, #31
    10ac: 04e14003     	index	z3.d, #0x0, #0x1
    10b0: f81e83bc     	stur	x28, [x29, #-0x18]
    10b4: 2a1803fc     	mov	w28, w24
    10b8: 2a1f03e8     	mov	w8, wzr
    10bc: 05e03964     	mov	z4.d, x11
    10c0: b000000b     	adrp	x11, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x4fc>
    10c4: 9110816b     	add	x11, x11, #0x420
    10c8: 4b1b094a     	sub	w10, w10, w27, lsl #2
    10cc: 85c0e165     	ld1rd	{ z5.d }, p0/z, [x11]
    10d0: aa1f03e9     	mov	x9, xzr
    10d4: 8a1c014a     	and	x10, x10, x28
    10d8: 14000004     	b	0x10e8 <_Z9test_gemmIdEbiiiT_S0_+0x1f0>
    10dc: eb1a013f     	cmp	x9, x26
    10e0: 0b180108     	add	w8, w8, w24
    10e4: 54000500     	b.eq	0x1184 <_Z9test_gemmIdEbiiiT_S0_+0x28c>
    10e8: 91000529     	add	x9, x9, #0x1
    10ec: 8b284e8b     	add	x11, x20, w8, uxtw #3
    10f0: eb1c027f     	cmp	x19, x28
    10f4: 1e620126     	scvtf	d6, w9
    10f8: 54000069     	b.ls	0x1104 <_Z9test_gemmIdEbiiiT_S0_+0x20c>
    10fc: aa1f03ec     	mov	x12, xzr
    1100: 14000018     	b	0x1160 <_Z9test_gemmIdEbiiiT_S0_+0x268>
    1104: 052820c7     	mov	z7.d, d6
    1108: 04633070     	mov	z16.d, z3.d
    110c: aa1f03ec     	mov	x12, xzr
    1110: 042b502d     	addvl	x13, x11, #0x1
    1114: 04e40211     	add	z17.d, z16.d, z4.d
    1118: 25e0c030     	add	z16.d, z16.d, #0x1      // =1
    111c: 04e40232     	add	z18.d, z17.d, z4.d
    1120: 25e0c031     	add	z17.d, z17.d, #0x1      // =1
    1124: 65d0a210     	scvtf	z16.d, p0/m, z16.s
    1128: 65d0a231     	scvtf	z17.d, p0/m, z17.s
    112c: 65c00a10     	fmul	z16.d, z16.d, z0.d
    1130: 65c00a31     	fmul	z17.d, z17.d, z0.d
    1134: 65e500f0     	fmla	z16.d, p0/m, z7.d, z5.d
    1138: 65e500f1     	fmla	z17.d, p0/m, z7.d, z5.d
    113c: e5ec4170     	st1d	{ z16.d }, p0, [x11, x12, lsl #3]
    1140: 04723250     	mov	z16.d, z18.d
    1144: e5ec41b1     	st1d	{ z17.d }, p0, [x13, x12, lsl #3]
    1148: 04b0e3ec     	incw	x12
    114c: eb0c015f     	cmp	x10, x12
    1150: 54fffe21     	b.ne	0x1114 <_Z9test_gemmIdEbiiiT_S0_+0x21c>
    1154: eb1c015f     	cmp	x10, x28
    1158: aa0a03ec     	mov	x12, x10
    115c: 54fffc00     	b.eq	0x10dc <_Z9test_gemmIdEbiiiT_S0_+0x1e4>
    1160: 9100058d     	add	x13, x12, #0x1
    1164: 1e6201a7     	scvtf	d7, w13
    1168: eb0d039f     	cmp	x28, x13
    116c: 1e6208e7     	fmul	d7, d7, d2
    1170: 1f411cc7     	fmadd	d7, d6, d1, d7
    1174: fc2c7967     	str	d7, [x11, x12, lsl #3]
    1178: aa0d03ec     	mov	x12, x13
    117c: 54ffff21     	b.ne	0x1160 <_Z9test_gemmIdEbiiiT_S0_+0x268>
    1180: 17ffffd7     	b	0x10dc <_Z9test_gemmIdEbiiiT_S0_+0x1e4>
    1184: f85d83a0     	ldur	x0, [x29, #-0x28]
    1188: 2a1f03e1     	mov	w1, wzr
    118c: aa1503e2     	mov	x2, x21
    1190: 97fffe1c     	bl	0xa00 <memset@plt>
    1194: aa1603e0     	mov	x0, x22
    1198: 2a1f03e1     	mov	w1, wzr
    119c: aa1503e2     	mov	x2, x21
    11a0: 97fffe18     	bl	0xa00 <memset@plt>
    11a4: 25d8e3e0     	ptrue	p0.d
    11a8: 9bbb7eea     	umull	x10, w23, w27
    11ac: f100227f     	cmp	x19, #0x8
    11b0: 9bbb7f8b     	umull	x11, w28, w27
    11b4: 52800109     	mov	w9, #0x8                // =8
    11b8: d37df38c     	lsl	x12, x28, #3
    11bc: 9a898269     	csel	x9, x19, x9, hi
    11c0: 7100073f     	cmp	w25, #0x1
    11c4: d37df2ed     	lsl	x13, x23, #3
    11c8: 7a410b00     	ccmp	w24, #0x1, #0x0, eq
    11cc: d37be94a     	lsl	x10, x10, #5
    11d0: f85e83b0     	ldur	x16, [x29, #-0x18]
    11d4: d37be96b     	lsl	x11, x11, #5
    11d8: aa1f03e8     	mov	x8, xzr
    11dc: 1a9f07ee     	cset	w14, ne
    11e0: 1280006f     	mov	w15, #-0x4              // =-4
    11e4: 14000005     	b	0x11f8 <_Z9test_gemmIdEbiiiT_S0_+0x300>
    11e8: 91000508     	add	x8, x8, #0x1
    11ec: 91002210     	add	x16, x16, #0x8
    11f0: eb17011f     	cmp	x8, x23
    11f4: 54000620     	b.eq	0x12b8 <_Z9test_gemmIdEbiiiT_S0_+0x3c0>
    11f8: 9b1c7d12     	mul	x18, x8, x28
    11fc: aa1f03f1     	mov	x17, xzr
    1200: aa1403e0     	mov	x0, x20
    1204: 8b120ed2     	add	x18, x22, x18, lsl #3
    1208: 14000007     	b	0x1224 <_Z9test_gemmIdEbiiiT_S0_+0x32c>
    120c: 1f402120     	fmadd	d0, d9, d0, d8
    1210: 91002000     	add	x0, x0, #0x8
    1214: fc317a40     	str	d0, [x18, x17, lsl #3]
    1218: 91000631     	add	x17, x17, #0x1
    121c: eb1c023f     	cmp	x17, x28
    1220: 54fffe40     	b.eq	0x11e8 <_Z9test_gemmIdEbiiiT_S0_+0x2f0>
    1224: eb1a013f     	cmp	x9, x26
    1228: 1a9f95c1     	csinc	w1, w14, wzr, ls
    122c: 36000081     	tbz	w1, #0x0, 0x123c <_Z9test_gemmIdEbiiiT_S0_+0x344>
    1230: 2f00e400     	movi	d0, #0000000000000000
    1234: aa1f03e1     	mov	x1, xzr
    1238: 14000015     	b	0x128c <_Z9test_gemmIdEbiiiT_S0_+0x394>
    123c: 9b0f7f61     	mul	x1, x27, x15
    1240: 2f00e400     	movi	d0, #0000000000000000
    1244: aa0003e3     	mov	x3, x0
    1248: aa1003e4     	mov	x4, x16
    124c: 8a1a0021     	and	x1, x1, x26
    1250: aa0103e2     	mov	x2, x1
    1254: a5e0a081     	ld1d	{ z1.d }, p0/z, [x4]
    1258: a5e0a062     	ld1d	{ z2.d }, p0/z, [x3]
    125c: 04b0e7e2     	decw	x2
    1260: 65c20821     	fmul	z1.d, z1.d, z2.d
    1264: a5e1a062     	ld1d	{ z2.d }, p0/z, [x3, #0x1, mul vl]
    1268: 8b0b0063     	add	x3, x3, x11
    126c: 65d82020     	fadda	d0, p0, d0, z1.d
    1270: a5e1a081     	ld1d	{ z1.d }, p0/z, [x4, #0x1, mul vl]
    1274: 8b0a0084     	add	x4, x4, x10
    1278: 65c20821     	fmul	z1.d, z1.d, z2.d
    127c: 65d82020     	fadda	d0, p0, d0, z1.d
    1280: b5fffea2     	cbnz	x2, 0x1254 <_Z9test_gemmIdEbiiiT_S0_+0x35c>
    1284: eb1a003f     	cmp	x1, x26
    1288: 54fffc20     	b.eq	0x120c <_Z9test_gemmIdEbiiiT_S0_+0x314>
    128c: 9b017d82     	mul	x2, x12, x1
    1290: 9b017da3     	mul	x3, x13, x1
    1294: cb010341     	sub	x1, x26, x1
    1298: fc636a01     	ldr	d1, [x16, x3]
    129c: fc626802     	ldr	d2, [x0, x2]
    12a0: f1000421     	subs	x1, x1, #0x1
    12a4: 8b0c0042     	add	x2, x2, x12
    12a8: 8b0d0063     	add	x3, x3, x13
    12ac: 1f420020     	fmadd	d0, d1, d2, d0
    12b0: 54ffff41     	b.ne	0x1298 <_Z9test_gemmIdEbiiiT_S0_+0x3a0>
    12b4: 17ffffd6     	b	0x120c <_Z9test_gemmIdEbiiiT_S0_+0x314>
    12b8: 1e270300     	fmov	s0, w24
    12bc: b0000008     	adrp	x8, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x4fc>
    12c0: b9402ff3     	ldr	w19, [sp, #0x2c]
    12c4: fd421902     	ldr	d2, [x8, #0x430]
    12c8: b0000008     	adrp	x8, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x4fc>
    12cc: 4e0c1f20     	mov	v0.s[1], w25
    12d0: 0ea0a801     	cmlt	v1.2s, v0.2s, #0
    12d4: 2ea24421     	ushl	v1.2s, v1.2s, v2.2s
    12d8: 0e040e62     	dup	v2.2s, w19
    12dc: 0ea18400     	add	v0.2s, v0.2s, v1.2s
    12e0: fd421d01     	ldr	d1, [x8, #0x438]
    12e4: 0ea14400     	sshl	v0.2s, v0.2s, v1.2s
    12e8: 0ea29c00     	mul	v0.2s, v0.2s, v2.2s
    12ec: 0e0c3c08     	mov	w8, v0.s[1]
    12f0: 0ea0a801     	cmlt	v1.2s, v0.2s, #0
    12f4: 0e0c3c29     	mov	w9, v1.s[1]
    12f8: ad0007e0     	stp	q0, q1, [sp]
    12fc: 531c6d08     	lsl	w8, w8, #4
    1300: 937d7d08     	sbfiz	x8, x8, #3, #32
    1304: 7200013f     	tst	w9, #0x1
    1308: da9f0100     	csinv	x0, x8, xzr, eq
    130c: 97fffda9     	bl	0x9b0 <_Znam@plt>
    1310: 3dc003e0     	ldr	q0, [sp]
    1314: aa0003fa     	mov	x26, x0
    1318: 1e260008     	fmov	w8, s0
    131c: 3dc007e0     	ldr	q0, [sp, #0x10]
    1320: 1e260009     	fmov	w9, s0
    1324: 531b6908     	lsl	w8, w8, #5
    1328: 937d7d08     	sbfiz	x8, x8, #3, #32
    132c: 7200013f     	tst	w9, #0x1
    1330: da9f0100     	csinv	x0, x8, xzr, eq
    1334: 97fffd9f     	bl	0x9b0 <_Znam@plt>
    1338: f85e83bc     	ldur	x28, [x29, #-0x18]
    133c: aa0003fb     	mov	x27, x0
    1340: 2a1903e0     	mov	w0, w25
    1344: 2a1303e1     	mov	w1, w19
    1348: aa1a03e3     	mov	x3, x26
    134c: aa1c03e2     	mov	x2, x28
    1350: 94000056     	bl	0x14a8 <_ZN4gemmIdE6pack_AEiiPKdPd>
    1354: 2a1803e0     	mov	w0, w24
    1358: 2a1303e1     	mov	w1, w19
    135c: aa1403e2     	mov	x2, x20
    1360: aa1b03e3     	mov	x3, x27
    1364: 94000094     	bl	0x15b4 <_ZN4gemmIdE6pack_BEiiPKdPd>
    1368: 1e604120     	fmov	d0, d9
    136c: 1e604101     	fmov	d1, d8
    1370: f85d83b5     	ldur	x21, [x29, #-0x28]
    1374: 2a1903e0     	mov	w0, w25
    1378: 2a1803e1     	mov	w1, w24
    137c: 2a1303e2     	mov	w2, w19
    1380: aa1a03e3     	mov	x3, x26
    1384: aa1b03e4     	mov	x4, x27
    1388: aa1503e5     	mov	x5, x21
    138c: 940000fd     	bl	0x1780 <_ZN4gemmIdE22compute_streamk_packedEiiiPKdS2_Pddd>
    1390: aa1a03e0     	mov	x0, x26
    1394: 97fffdab     	bl	0xa40 <_ZdaPv@plt>
    1398: aa1b03e0     	mov	x0, x27
    139c: 97fffda9     	bl	0xa40 <_ZdaPv@plt>
    13a0: 2f00e408     	movi	d8, #0000000000000000
    13a4: b0000008     	adrp	x8, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x4fc>
    13a8: f9401bfa     	ldr	x26, [sp, #0x30]
    13ac: fd422109     	ldr	d9, [x8, #0x440]
    13b0: b0000008     	adrp	x8, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x4fc>
    13b4: aa1f03f8     	mov	x24, xzr
    13b8: fd42250a     	ldr	d10, [x8, #0x448]
    13bc: b0000019     	adrp	x25, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x4fc>
    13c0: 91151b39     	add	x25, x25, #0x546
    13c4: 52800033     	mov	w19, #0x1               // =1
    13c8: b0000017     	adrp	x23, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x4fc>
    13cc: 911682f7     	add	x23, x23, #0x5a0
    13d0: 14000007     	b	0x13ec <_Z9test_gemmIdEbiiiT_S0_+0x4f4>
    13d4: 1e6a2040     	fcmp	d2, d10
    13d8: 91000718     	add	x24, x24, #0x1
    13dc: 1a9fc7e8     	cset	w8, le
    13e0: eb1a031f     	cmp	x24, x26
    13e4: 0a130113     	and	w19, w8, w19
    13e8: 540002a0     	b.eq	0x143c <_Z9test_gemmIdEbiiiT_S0_+0x544>
    13ec: d37df308     	lsl	x8, x24, #3
    13f0: fc686ac1     	ldr	d1, [x22, x8]
    13f4: fc686aa0     	ldr	d0, [x21, x8]
    13f8: 1e60c022     	fabs	d2, d1
    13fc: 7ee1d403     	fabd	d3, d0, d1
    1400: 1e692842     	fadd	d2, d2, d9
    1404: 1e621862     	fdiv	d2, d3, d2
    1408: 1e682040     	fcmp	d2, d8
    140c: 1e68cc48     	fcsel	d8, d2, d8, gt
    1410: 1e6a2040     	fcmp	d2, d10
    1414: 54fffe0d     	b.le	0x13d4 <_Z9test_gemmIdEbiiiT_S0_+0x4dc>
    1418: 3607fdf3     	tbz	w19, #0x0, 0x13d4 <_Z9test_gemmIdEbiiiT_S0_+0x4dc>
    141c: aa1903e0     	mov	x0, x25
    1420: 2a1803e1     	mov	w1, w24
    1424: 97fffd9f     	bl	0xaa0 <printf@plt>
    1428: 91000718     	add	x24, x24, #0x1
    142c: 2a1f03f3     	mov	w19, wzr
    1430: eb1a031f     	cmp	x24, x26
    1434: 54fffdc1     	b.ne	0x13ec <_Z9test_gemmIdEbiiiT_S0_+0x4f4>
    1438: 14000006     	b	0x1450 <_Z9test_gemmIdEbiiiT_S0_+0x558>
    143c: 7100027f     	cmp	w19, #0x0
    1440: b0000008     	adrp	x8, 0x2000 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x4fc>
    1444: 91160908     	add	x8, x8, #0x582
    1448: 13000273     	sbfx	w19, w19, #0, #1
    144c: 9a971117     	csel	x23, x8, x23, ne
    1450: 1e604100     	fmov	d0, d8
    1454: aa1703e0     	mov	x0, x23
    1458: 97fffd92     	bl	0xaa0 <printf@plt>
    145c: aa1c03e0     	mov	x0, x28
    1460: 97fffd78     	bl	0xa40 <_ZdaPv@plt>
    1464: aa1403e0     	mov	x0, x20
    1468: 97fffd76     	bl	0xa40 <_ZdaPv@plt>
    146c: aa1503e0     	mov	x0, x21
    1470: 97fffd74     	bl	0xa40 <_ZdaPv@plt>
    1474: aa1603e0     	mov	x0, x22
    1478: 97fffd72     	bl	0xa40 <_ZdaPv@plt>
    147c: 12000260     	and	w0, w19, #0x1
    1480: a94b4ff4     	ldp	x20, x19, [sp, #0xb0]
    1484: fd4023ea     	ldr	d10, [sp, #0x40]
    1488: a94a57f6     	ldp	x22, x21, [sp, #0xa0]
    148c: a9495ff8     	ldp	x24, x23, [sp, #0x90]
    1490: a94867fa     	ldp	x26, x25, [sp, #0x80]
    1494: a9476ffc     	ldp	x28, x27, [sp, #0x70]
    1498: a9467bfd     	ldp	x29, x30, [sp, #0x60]
    149c: 6d4523e9     	ldp	d9, d8, [sp, #0x50]
    14a0: 910303ff     	add	sp, sp, #0xc0
    14a4: d65f03c0     	ret

00000000000014a8 <_ZN4gemmIdE6pack_AEiiPKdPd>:
    14a8: 53047c0a     	lsr	w10, w0, #4
    14ac: 531c6c2b     	lsl	w11, w1, #4
    14b0: 2a1f03e8     	mov	w8, wzr
    14b4: aa1f03e9     	mov	x9, xzr
    14b8: 2a0103ec     	mov	w12, w1
    14bc: 528001ed     	mov	w13, #0xf               // =15
    14c0: 2a0d03ee     	mov	w14, w13
    14c4: 2a0803ef     	mov	w15, w8
    14c8: aa0c03f0     	mov	x16, x12
    14cc: 51003dd1     	sub	w17, w14, #0xf
    14d0: 510039d2     	sub	w18, w14, #0xe
    14d4: f1000610     	subs	x16, x16, #0x1
    14d8: fc71d840     	ldr	d0, [x2, w17, sxtw #3]
    14dc: 8b2fcc71     	add	x17, x3, w15, sxtw #3
    14e0: 110041ef     	add	w15, w15, #0x10
    14e4: fd000220     	str	d0, [x17]
    14e8: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    14ec: 510035d2     	sub	w18, w14, #0xd
    14f0: fd000620     	str	d0, [x17, #0x8]
    14f4: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    14f8: 510031d2     	sub	w18, w14, #0xc
    14fc: fd000a20     	str	d0, [x17, #0x10]
    1500: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1504: 51002dd2     	sub	w18, w14, #0xb
    1508: fd000e20     	str	d0, [x17, #0x18]
    150c: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1510: 510029d2     	sub	w18, w14, #0xa
    1514: fd001220     	str	d0, [x17, #0x20]
    1518: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    151c: 510025d2     	sub	w18, w14, #0x9
    1520: fd001620     	str	d0, [x17, #0x28]
    1524: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1528: 510021d2     	sub	w18, w14, #0x8
    152c: fd001a20     	str	d0, [x17, #0x30]
    1530: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1534: 51001dd2     	sub	w18, w14, #0x7
    1538: fd001e20     	str	d0, [x17, #0x38]
    153c: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1540: 510019d2     	sub	w18, w14, #0x6
    1544: fd002220     	str	d0, [x17, #0x40]
    1548: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    154c: 510015d2     	sub	w18, w14, #0x5
    1550: fd002620     	str	d0, [x17, #0x48]
    1554: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1558: 510011d2     	sub	w18, w14, #0x4
    155c: fd002a20     	str	d0, [x17, #0x50]
    1560: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1564: 51000dd2     	sub	w18, w14, #0x3
    1568: fd002e20     	str	d0, [x17, #0x58]
    156c: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1570: 510009d2     	sub	w18, w14, #0x2
    1574: fd003220     	str	d0, [x17, #0x60]
    1578: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    157c: 510005d2     	sub	w18, w14, #0x1
    1580: fd003620     	str	d0, [x17, #0x68]
    1584: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1588: fd003a20     	str	d0, [x17, #0x70]
    158c: fc6ed840     	ldr	d0, [x2, w14, sxtw #3]
    1590: 0b0001ce     	add	w14, w14, w0
    1594: fd003e20     	str	d0, [x17, #0x78]
    1598: 54fff9a1     	b.ne	0x14cc <_ZN4gemmIdE6pack_AEiiPKdPd+0x24>
    159c: 91000529     	add	x9, x9, #0x1
    15a0: 0b0b0108     	add	w8, w8, w11
    15a4: 110041ad     	add	w13, w13, #0x10
    15a8: eb0a013f     	cmp	x9, x10
    15ac: 54fff8a1     	b.ne	0x14c0 <_ZN4gemmIdE6pack_AEiiPKdPd+0x18>
    15b0: d65f03c0     	ret

00000000000015b4 <_ZN4gemmIdE6pack_BEiiPKdPd>:
    15b4: 53057c0a     	lsr	w10, w0, #5
    15b8: 531b682b     	lsl	w11, w1, #5
    15bc: 2a1f03e8     	mov	w8, wzr
    15c0: aa1f03e9     	mov	x9, xzr
    15c4: 2a0103ec     	mov	w12, w1
    15c8: 528003ed     	mov	w13, #0x1f              // =31
    15cc: 2a0d03ee     	mov	w14, w13
    15d0: 2a0803ef     	mov	w15, w8
    15d4: aa0c03f0     	mov	x16, x12
    15d8: 51007dd1     	sub	w17, w14, #0x1f
    15dc: 510079d2     	sub	w18, w14, #0x1e
    15e0: f1000610     	subs	x16, x16, #0x1
    15e4: fc71d840     	ldr	d0, [x2, w17, sxtw #3]
    15e8: 8b2fcc71     	add	x17, x3, w15, sxtw #3
    15ec: 110081ef     	add	w15, w15, #0x20
    15f0: fd000220     	str	d0, [x17]
    15f4: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    15f8: 510075d2     	sub	w18, w14, #0x1d
    15fc: fd000620     	str	d0, [x17, #0x8]
    1600: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1604: 510071d2     	sub	w18, w14, #0x1c
    1608: fd000a20     	str	d0, [x17, #0x10]
    160c: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1610: 51006dd2     	sub	w18, w14, #0x1b
    1614: fd000e20     	str	d0, [x17, #0x18]
    1618: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    161c: 510069d2     	sub	w18, w14, #0x1a
    1620: fd001220     	str	d0, [x17, #0x20]
    1624: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1628: 510065d2     	sub	w18, w14, #0x19
    162c: fd001620     	str	d0, [x17, #0x28]
    1630: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1634: 510061d2     	sub	w18, w14, #0x18
    1638: fd001a20     	str	d0, [x17, #0x30]
    163c: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1640: 51005dd2     	sub	w18, w14, #0x17
    1644: fd001e20     	str	d0, [x17, #0x38]
    1648: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    164c: 510059d2     	sub	w18, w14, #0x16
    1650: fd002220     	str	d0, [x17, #0x40]
    1654: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1658: 510055d2     	sub	w18, w14, #0x15
    165c: fd002620     	str	d0, [x17, #0x48]
    1660: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1664: 510051d2     	sub	w18, w14, #0x14
    1668: fd002a20     	str	d0, [x17, #0x50]
    166c: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1670: 51004dd2     	sub	w18, w14, #0x13
    1674: fd002e20     	str	d0, [x17, #0x58]
    1678: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    167c: 510049d2     	sub	w18, w14, #0x12
    1680: fd003220     	str	d0, [x17, #0x60]
    1684: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1688: 510045d2     	sub	w18, w14, #0x11
    168c: fd003620     	str	d0, [x17, #0x68]
    1690: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1694: 510041d2     	sub	w18, w14, #0x10
    1698: fd003a20     	str	d0, [x17, #0x70]
    169c: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    16a0: 51003dd2     	sub	w18, w14, #0xf
    16a4: fd003e20     	str	d0, [x17, #0x78]
    16a8: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    16ac: 510039d2     	sub	w18, w14, #0xe
    16b0: fd004220     	str	d0, [x17, #0x80]
    16b4: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    16b8: 510035d2     	sub	w18, w14, #0xd
    16bc: fd004620     	str	d0, [x17, #0x88]
    16c0: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    16c4: 510031d2     	sub	w18, w14, #0xc
    16c8: fd004a20     	str	d0, [x17, #0x90]
    16cc: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    16d0: 51002dd2     	sub	w18, w14, #0xb
    16d4: fd004e20     	str	d0, [x17, #0x98]
    16d8: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    16dc: 510029d2     	sub	w18, w14, #0xa
    16e0: fd005220     	str	d0, [x17, #0xa0]
    16e4: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    16e8: 510025d2     	sub	w18, w14, #0x9
    16ec: fd005620     	str	d0, [x17, #0xa8]
    16f0: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    16f4: 510021d2     	sub	w18, w14, #0x8
    16f8: fd005a20     	str	d0, [x17, #0xb0]
    16fc: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1700: 51001dd2     	sub	w18, w14, #0x7
    1704: fd005e20     	str	d0, [x17, #0xb8]
    1708: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    170c: 510019d2     	sub	w18, w14, #0x6
    1710: fd006220     	str	d0, [x17, #0xc0]
    1714: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1718: 510015d2     	sub	w18, w14, #0x5
    171c: fd006620     	str	d0, [x17, #0xc8]
    1720: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1724: 510011d2     	sub	w18, w14, #0x4
    1728: fd006a20     	str	d0, [x17, #0xd0]
    172c: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1730: 51000dd2     	sub	w18, w14, #0x3
    1734: fd006e20     	str	d0, [x17, #0xd8]
    1738: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    173c: 510009d2     	sub	w18, w14, #0x2
    1740: fd007220     	str	d0, [x17, #0xe0]
    1744: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1748: 510005d2     	sub	w18, w14, #0x1
    174c: fd007620     	str	d0, [x17, #0xe8]
    1750: fc72d840     	ldr	d0, [x2, w18, sxtw #3]
    1754: fd007a20     	str	d0, [x17, #0xf0]
    1758: fc6ed840     	ldr	d0, [x2, w14, sxtw #3]
    175c: 0b0001ce     	add	w14, w14, w0
    1760: fd007e20     	str	d0, [x17, #0xf8]
    1764: 54fff3a1     	b.ne	0x15d8 <_ZN4gemmIdE6pack_BEiiPKdPd+0x24>
    1768: 91000529     	add	x9, x9, #0x1
    176c: 0b0b0108     	add	w8, w8, w11
    1770: 110081ad     	add	w13, w13, #0x20
    1774: eb0a013f     	cmp	x9, x10
    1778: 54fff2a1     	b.ne	0x15cc <_ZN4gemmIdE6pack_BEiiPKdPd+0x18>
    177c: d65f03c0     	ret

0000000000001780 <_ZN4gemmIdE22compute_streamk_packedEiiiPKdS2_Pddd>:
    1780: d10283ff     	sub	sp, sp, #0xa0
    1784: a9067bfd     	stp	x29, x30, [sp, #0x60]
    1788: f9003bf7     	str	x23, [sp, #0x70]
    178c: a90857f6     	stp	x22, x21, [sp, #0x80]
    1790: a9094ff4     	stp	x20, x19, [sp, #0x90]
    1794: 910183fd     	add	x29, sp, #0x60
    1798: 2a0203f3     	mov	w19, w2
    179c: 2a0103f6     	mov	w22, w1
    17a0: 2a0003f7     	mov	w23, w0
    17a4: b81fc3a2     	stur	w2, [x29, #-0x4]
    17a8: 290303a1     	stp	w1, w0, [x29, #0x18]
    17ac: a93e8fa4     	stp	x4, x3, [x29, #-0x18]
    17b0: f81e03a5     	stur	x5, [x29, #-0x20]
    17b4: fc1d83a0     	stur	d0, [x29, #-0x28]
    17b8: fd001be1     	str	d1, [sp, #0x30]
    17bc: 97fffcad     	bl	0xa70 <omp_get_max_threads@plt>
    17c0: 2a0003f4     	mov	w20, w0
    17c4: 7100001f     	cmp	w0, #0x0
    17c8: b9002fe0     	str	w0, [sp, #0x2c]
    17cc: 937d7e88     	sbfiz	x8, x20, #3, #32
    17d0: da9fa100     	csinv	x0, x8, xzr, ge
    17d4: 97fffc77     	bl	0x9b0 <_Znam@plt>
    17d8: 7100069f     	cmp	w20, #0x1
    17dc: f90013e0     	str	x0, [sp, #0x20]
    17e0: 540001ab     	b.lt	0x1814 <_ZN4gemmIdE22compute_streamk_packedEiiiPKdS2_Pddd+0x94>
    17e4: 1b177ec8     	mul	w8, w22, w23
    17e8: aa0003f5     	mov	x21, x0
    17ec: 2a1403f7     	mov	w23, w20
    17f0: d37d7d16     	ubfiz	x22, x8, #3, #32
    17f4: aa1603e0     	mov	x0, x22
    17f8: 97fffc6e     	bl	0x9b0 <_Znam@plt>
    17fc: 2a1f03e1     	mov	w1, wzr
    1800: aa1603e2     	mov	x2, x22
    1804: f80086a0     	str	x0, [x21], #0x8
    1808: 97fffc7e     	bl	0xa00 <memset@plt>
    180c: f10006f7     	subs	x23, x23, #0x1
    1810: 54ffff21     	b.ne	0x17f4 <_ZN4gemmIdE22compute_streamk_packedEiiiPKdS2_Pddd+0x74>
    1814: 0b130288     	add	w8, w20, w19
    1818: b0000093     	adrp	x19, 0x12000 <__FRAME_END__+0xf67c>
    181c: 9135a273     	add	x19, x19, #0xd68
    1820: 51000508     	sub	w8, w8, #0x1
    1824: d10063a9     	sub	x9, x29, #0x18
    1828: 90000002     	adrp	x2, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0x108>
    182c: 9123c042     	add	x2, x2, #0x8f0
    1830: 1ad40d08     	sdiv	w8, w8, w20
    1834: 910073e3     	add	x3, sp, #0x1c
    1838: d10013a4     	sub	x4, x29, #0x4
    183c: 910073a5     	add	x5, x29, #0x1c
    1840: 910063a6     	add	x6, x29, #0x18
    1844: d10043a7     	sub	x7, x29, #0x10
    1848: aa1303e0     	mov	x0, x19
    184c: 528000e1     	mov	w1, #0x7                // =7
    1850: b9001fe8     	str	w8, [sp, #0x1c]
    1854: 910083e8     	add	x8, sp, #0x20
    1858: a90023e9     	stp	x9, x8, [sp]
    185c: 97fffc89     	bl	0xa80 <__kmpc_fork_call@plt>
    1860: 9100c3e8     	add	x8, sp, #0x30
    1864: d100a3a9     	sub	x9, x29, #0x28
    1868: 90000002     	adrp	x2, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0x108>
    186c: 91265042     	add	x2, x2, #0x994
    1870: 910073a3     	add	x3, x29, #0x1c
    1874: 910063a4     	add	x4, x29, #0x18
    1878: 9100b3e5     	add	x5, sp, #0x2c
    187c: 910083e6     	add	x6, sp, #0x20
    1880: d10083a7     	sub	x7, x29, #0x20
    1884: aa1303e0     	mov	x0, x19
    1888: 528000e1     	mov	w1, #0x7                // =7
    188c: a90023e9     	stp	x9, x8, [sp]
    1890: 97fffc7c     	bl	0xa80 <__kmpc_fork_call@plt>
    1894: b9402fe8     	ldr	w8, [sp, #0x2c]
    1898: 7100051f     	cmp	w8, #0x1
    189c: 5400018b     	b.lt	0x18cc <_ZN4gemmIdE22compute_streamk_packedEiiiPKdS2_Pddd+0x14c>
    18a0: aa1f03f3     	mov	x19, xzr
    18a4: 14000004     	b	0x18b4 <_ZN4gemmIdE22compute_streamk_packedEiiiPKdS2_Pddd+0x134>
    18a8: 91000673     	add	x19, x19, #0x1
    18ac: eb28c27f     	cmp	x19, w8, sxtw
    18b0: 540000ea     	b.ge	0x18cc <_ZN4gemmIdE22compute_streamk_packedEiiiPKdS2_Pddd+0x14c>
    18b4: f94013e9     	ldr	x9, [sp, #0x20]
    18b8: f8737920     	ldr	x0, [x9, x19, lsl #3]
    18bc: b4ffff60     	cbz	x0, 0x18a8 <_ZN4gemmIdE22compute_streamk_packedEiiiPKdS2_Pddd+0x128>
    18c0: 97fffc60     	bl	0xa40 <_ZdaPv@plt>
    18c4: b9402fe8     	ldr	w8, [sp, #0x2c]
    18c8: 17fffff8     	b	0x18a8 <_ZN4gemmIdE22compute_streamk_packedEiiiPKdS2_Pddd+0x128>
    18cc: f94013e0     	ldr	x0, [sp, #0x20]
    18d0: b4000040     	cbz	x0, 0x18d8 <_ZN4gemmIdE22compute_streamk_packedEiiiPKdS2_Pddd+0x158>
    18d4: 97fffc5b     	bl	0xa40 <_ZdaPv@plt>
    18d8: a9494ff4     	ldp	x20, x19, [sp, #0x90]
    18dc: f9403bf7     	ldr	x23, [sp, #0x70]
    18e0: a94857f6     	ldp	x22, x21, [sp, #0x80]
    18e4: a9467bfd     	ldp	x29, x30, [sp, #0x60]
    18e8: 910283ff     	add	sp, sp, #0xa0
    18ec: d65f03c0     	ret

00000000000018f0 <_ZN4gemmIdE22compute_streamk_packedEiiiPKdS2_Pddd.omp_outlined>:
    18f0: a9bb7bfd     	stp	x29, x30, [sp, #-0x50]!
    18f4: f9000bf9     	str	x25, [sp, #0x10]
    18f8: a9025ff8     	stp	x24, x23, [sp, #0x20]
    18fc: a90357f6     	stp	x22, x21, [sp, #0x30]
    1900: a9044ff4     	stp	x20, x19, [sp, #0x40]
    1904: 910003fd     	mov	x29, sp
    1908: f9402bb9     	ldr	x25, [x29, #0x50]
    190c: aa0703f3     	mov	x19, x7
    1910: aa0603f4     	mov	x20, x6
    1914: aa0503f5     	mov	x21, x5
    1918: aa0403f6     	mov	x22, x4
    191c: aa0303f7     	mov	x23, x3
    1920: aa0203f8     	mov	x24, x2
    1924: 97fffc43     	bl	0xa30 <omp_get_thread_num@plt>
    1928: b9400308     	ldr	w8, [x24]
    192c: b94002e2     	ldr	w2, [x23]
    1930: 1b007d03     	mul	w3, w8, w0
    1934: 6b02007f     	cmp	w3, w2
    1938: 5400022a     	b.ge	0x197c <_ZN4gemmIdE22compute_streamk_packedEiiiPKdS2_Pddd.omp_outlined+0x8c>
    193c: f940032a     	ldr	x10, [x25]
    1940: 0b080069     	add	w9, w3, w8
    1944: b94002c8     	ldr	w8, [x22]
    1948: b94002a1     	ldr	w1, [x21]
    194c: 6b02013f     	cmp	w9, w2
    1950: f9400285     	ldr	x5, [x20]
    1954: f9400266     	ldr	x6, [x19]
    1958: f860d947     	ldr	x7, [x10, w0, sxtw #3]
    195c: 1a82b124     	csel	w4, w9, w2, lt
    1960: 2a0803e0     	mov	w0, w8
    1964: a9444ff4     	ldp	x20, x19, [sp, #0x40]
    1968: f9400bf9     	ldr	x25, [sp, #0x10]
    196c: a94357f6     	ldp	x22, x21, [sp, #0x30]
    1970: a9425ff8     	ldp	x24, x23, [sp, #0x20]
    1974: a8c57bfd     	ldp	x29, x30, [sp], #0x50
    1978: 14000063     	b	0x1b04 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd>
    197c: a9444ff4     	ldp	x20, x19, [sp, #0x40]
    1980: f9400bf9     	ldr	x25, [sp, #0x10]
    1984: a94357f6     	ldp	x22, x21, [sp, #0x30]
    1988: a9425ff8     	ldp	x24, x23, [sp, #0x20]
    198c: a8c57bfd     	ldp	x29, x30, [sp], #0x50
    1990: d65f03c0     	ret

0000000000001994 <_ZN4gemmIdE22compute_streamk_packedEiiiPKdS2_Pddd.omp_outlined.17>:
    1994: b9400048     	ldr	w8, [x2]
    1998: 7100051f     	cmp	w8, #0x1
    199c: 54000b2b     	b.lt	0x1b00 <_ZN4gemmIdE22compute_streamk_packedEiiiPKdS2_Pddd.omp_outlined.17+0x16c>
    19a0: b9400069     	ldr	w9, [x3]
    19a4: 7100053f     	cmp	w9, #0x1
    19a8: 54000acb     	b.lt	0x1b00 <_ZN4gemmIdE22compute_streamk_packedEiiiPKdS2_Pddd.omp_outlined.17+0x16c>
    19ac: d10203ff     	sub	sp, sp, #0x80
    19b0: a9037bfd     	stp	x29, x30, [sp, #0x30]
    19b4: a90467fa     	stp	x26, x25, [sp, #0x40]
    19b8: a9055ff8     	stp	x24, x23, [sp, #0x50]
    19bc: a90657f6     	stp	x22, x21, [sp, #0x60]
    19c0: a9074ff4     	stp	x20, x19, [sp, #0x70]
    19c4: 9100c3fd     	add	x29, sp, #0x30
    19c8: 93407d35     	sxtw	x21, w9
    19cc: 92800009     	mov	x9, #-0x1               // =-1
    19d0: b9400014     	ldr	w20, [x0]
    19d4: aa0703f3     	mov	x19, x7
    19d8: aa0403f9     	mov	x25, x4
    19dc: aa0303f8     	mov	x24, x3
    19e0: 9b0826ba     	madd	x26, x21, x8, x9
    19e4: aa0603f7     	mov	x23, x6
    19e8: aa0503f6     	mov	x22, x5
    19ec: 52800028     	mov	w8, #0x1                // =1
    19f0: b0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xf67c>
    19f4: 91360000     	add	x0, x0, #0xd80
    19f8: 910053e3     	add	x3, sp, #0x14
    19fc: d10023a4     	sub	x4, x29, #0x8
    1a00: d10043a5     	sub	x5, x29, #0x10
    1a04: 910063e6     	add	x6, sp, #0x18
    1a08: 2a1403e1     	mov	w1, w20
    1a0c: 52800442     	mov	w2, #0x22               // =34
    1a10: 52800027     	mov	w7, #0x1                // =1
    1a14: f9000fe8     	str	x8, [sp, #0x18]
    1a18: a93f7fba     	stp	x26, xzr, [x29, #-0x10]
    1a1c: b90017ff     	str	wzr, [sp, #0x14]
    1a20: f90003e8     	str	x8, [sp]
    1a24: 97fffbf3     	bl	0x9f0 <__kmpc_for_static_init_8@plt>
    1a28: a97f23a9     	ldp	x9, x8, [x29, #-0x10]
    1a2c: eb1a013f     	cmp	x9, x26
    1a30: 9a9ab12b     	csel	x11, x9, x26, lt
    1a34: eb0b011f     	cmp	x8, x11
    1a38: f81f03ab     	stur	x11, [x29, #-0x10]
    1a3c: 540004ec     	b.gt	0x1ad8 <_ZN4gemmIdE22compute_streamk_packedEiiiPKdS2_Pddd.omp_outlined.17+0x144>
    1a40: b940032d     	ldr	w13, [x25]
    1a44: f9402ba9     	ldr	x9, [x29, #0x50]
    1a48: b940030c     	ldr	w12, [x24]
    1a4c: f94002ea     	ldr	x10, [x23]
    1a50: 710001bf     	cmp	w13, #0x0
    1a54: 540002ad     	b.le	0x1aa8 <_ZN4gemmIdE22compute_streamk_packedEiiiPKdS2_Pddd.omp_outlined.17+0x114>
    1a58: f94002ce     	ldr	x14, [x22]
    1a5c: 9ad50d0f     	sdiv	x15, x8, x21
    1a60: 2f00e400     	movi	d0, #0000000000000000
    1a64: aa0d03f1     	mov	x17, x13
    1a68: 1b15a1f0     	msub	w16, w15, w21, w8
    1a6c: 1b0f418f     	madd	w15, w12, w15, w16
    1a70: aa0e03f0     	mov	x16, x14
    1a74: f8408612     	ldr	x18, [x16], #0x8
    1a78: f1000631     	subs	x17, x17, #0x1
    1a7c: fc6fda41     	ldr	d1, [x18, w15, sxtw #3]
    1a80: 1e612800     	fadd	d0, d0, d1
    1a84: 54ffff81     	b.ne	0x1a74 <_ZN4gemmIdE22compute_streamk_packedEiiiPKdS2_Pddd.omp_outlined.17+0xe0>
    1a88: fd400261     	ldr	d1, [x19]
    1a8c: fd400122     	ldr	d2, [x9]
    1a90: eb0b011f     	cmp	x8, x11
    1a94: 91000508     	add	x8, x8, #0x1
    1a98: 1f400820     	fmadd	d0, d1, d0, d2
    1a9c: fc2fd940     	str	d0, [x10, w15, sxtw #3]
    1aa0: 54fffde1     	b.ne	0x1a5c <_ZN4gemmIdE22compute_streamk_packedEiiiPKdS2_Pddd.omp_outlined.17+0xc8>
    1aa4: 1400000d     	b	0x1ad8 <_ZN4gemmIdE22compute_streamk_packedEiiiPKdS2_Pddd.omp_outlined.17+0x144>
    1aa8: 2f00e400     	movi	d0, #0000000000000000
    1aac: 9100056b     	add	x11, x11, #0x1
    1ab0: 4b15018c     	sub	w12, w12, w21
    1ab4: 9ad50d0d     	sdiv	x13, x8, x21
    1ab8: fd400261     	ldr	d1, [x19]
    1abc: fd400122     	ldr	d2, [x9]
    1ac0: 1f400821     	fmadd	d1, d1, d0, d2
    1ac4: 1b0d218d     	madd	w13, w12, w13, w8
    1ac8: 91000508     	add	x8, x8, #0x1
    1acc: eb08017f     	cmp	x11, x8
    1ad0: fc2dd941     	str	d1, [x10, w13, sxtw #3]
    1ad4: 54ffff01     	b.ne	0x1ab4 <_ZN4gemmIdE22compute_streamk_packedEiiiPKdS2_Pddd.omp_outlined.17+0x120>
    1ad8: b0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xf67c>
    1adc: 91360000     	add	x0, x0, #0xd80
    1ae0: 2a1403e1     	mov	w1, w20
    1ae4: 97fffbb7     	bl	0x9c0 <__kmpc_for_static_fini@plt>
    1ae8: a9474ff4     	ldp	x20, x19, [sp, #0x70]
    1aec: a94657f6     	ldp	x22, x21, [sp, #0x60]
    1af0: a9455ff8     	ldp	x24, x23, [sp, #0x50]
    1af4: a94467fa     	ldp	x26, x25, [sp, #0x40]
    1af8: a9437bfd     	ldp	x29, x30, [sp, #0x30]
    1afc: 910203ff     	add	sp, sp, #0x80
    1b00: d65f03c0     	ret

0000000000001b04 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd>:
    1b04: 6db63bef     	stp	d15, d14, [sp, #-0xa0]!
    1b08: 6d0133ed     	stp	d13, d12, [sp, #0x10]
    1b0c: 6d022beb     	stp	d11, d10, [sp, #0x20]
    1b10: 6d0323e9     	stp	d9, d8, [sp, #0x30]
    1b14: a9047bfd     	stp	x29, x30, [sp, #0x40]
    1b18: a9056ffc     	stp	x28, x27, [sp, #0x50]
    1b1c: a90667fa     	stp	x26, x25, [sp, #0x60]
    1b20: a9075ff8     	stp	x24, x23, [sp, #0x70]
    1b24: a90857f6     	stp	x22, x21, [sp, #0x80]
    1b28: a9094ff4     	stp	x20, x19, [sp, #0x90]
    1b2c: d10783ff     	sub	sp, sp, #0x1e0
    1b30: a9029fe5     	stp	x5, x7, [sp, #0x28]
    1b34: f9002be6     	str	x6, [sp, #0x50]
    1b38: 290d0fe2     	stp	w2, w3, [sp, #0x68]
    1b3c: d503437f     	smstart	sm
    1b40: 7100401f     	cmp	w0, #0x10
    1b44: 5400444b     	b.lt	0x23cc <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8c8>
    1b48: 7100803f     	cmp	w1, #0x20
    1b4c: 5400440b     	b.lt	0x23cc <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8c8>
    1b50: b9406fe8     	ldr	w8, [sp, #0x6c]
    1b54: 4b080088     	sub	w8, w4, w8
    1b58: 7100051f     	cmp	w8, #0x1
    1b5c: 5400438b     	b.lt	0x23cc <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8c8>
    1b60: 52800209     	mov	w9, #0x10               // =16
    1b64: 25d8e3e0     	ptrue	p0.d
    1b68: 531c6c2a     	lsl	w10, w1, #4
    1b6c: 1ac90c09     	sdiv	w9, w0, w9
    1b70: aa1f03eb     	mov	x11, xzr
    1b74: b9001fea     	str	w10, [sp, #0x1c]
    1b78: f90013e9     	str	x9, [sp, #0x20]
    1b7c: 52800409     	mov	w9, #0x20               // =32
    1b80: 1ac90c29     	sdiv	w9, w1, w9
    1b84: f90027e9     	str	x9, [sp, #0x48]
    1b88: 93407c29     	sxtw	x9, w1
    1b8c: d37df129     	lsl	x9, x9, #3
    1b90: f90023e9     	str	x9, [sp, #0x40]
    1b94: 14000006     	b	0x1bac <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0xa8>
    1b98: f9401feb     	ldr	x11, [sp, #0x38]
    1b9c: f94013e9     	ldr	x9, [sp, #0x20]
    1ba0: 9100056b     	add	x11, x11, #0x1
    1ba4: eb09017f     	cmp	x11, x9
    1ba8: 54004120     	b.eq	0x23cc <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8c8>
    1bac: 294d27ea     	ldp	w10, w9, [sp, #0x68]
    1bb0: f9001feb     	str	x11, [sp, #0x38]
    1bb4: 1b0a2569     	madd	w9, w11, w10, w9
    1bb8: b9401fea     	ldr	w10, [sp, #0x1c]
    1bbc: 1b0b7d4a     	mul	w10, w10, w11
    1bc0: f94017eb     	ldr	x11, [sp, #0x28]
    1bc4: 531c6d29     	lsl	w9, w9, #4
    1bc8: 8b29cd69     	add	x9, x11, w9, sxtw #3
    1bcc: aa1f03eb     	mov	x11, xzr
    1bd0: f90033e9     	str	x9, [sp, #0x60]
    1bd4: f9401be9     	ldr	x9, [sp, #0x30]
    1bd8: 8b2acd29     	add	x9, x9, w10, sxtw #3
    1bdc: f9002fe9     	str	x9, [sp, #0x58]
    1be0: 14000006     	b	0x1bf8 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0xf4>
    1be4: f9403beb     	ldr	x11, [sp, #0x70]
    1be8: f94027e9     	ldr	x9, [sp, #0x48]
    1bec: 9100056b     	add	x11, x11, #0x1
    1bf0: eb09017f     	cmp	x11, x9
    1bf4: 54fffd20     	b.eq	0x1b98 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x94>
    1bf8: a945e7e9     	ldp	x9, x25, [sp, #0x58]
    1bfc: f94023ee     	ldr	x14, [sp, #0x40]
    1c00: 2a1f03f5     	mov	w21, wzr
    1c04: f9003beb     	str	x11, [sp, #0x70]
    1c08: 8b0b212c     	add	x12, x9, x11, lsl #8
    1c0c: 294d27ea     	ldp	w10, w9, [sp, #0x68]
    1c10: 1b0a2569     	madd	w9, w11, w10, w9
    1c14: 042c502a     	addvl	x10, x12, #0x1
    1c18: a91d33ea     	stp	x10, x12, [sp, #0x1d0]
    1c1c: 042c504a     	addvl	x10, x12, #0x2
    1c20: f900e7ea     	str	x10, [sp, #0x1c8]
    1c24: 042c506a     	addvl	x10, x12, #0x3
    1c28: f900e3ea     	str	x10, [sp, #0x1c0]
    1c2c: 8b0e018a     	add	x10, x12, x14
    1c30: 531b6929     	lsl	w9, w9, #5
    1c34: 042a502b     	addvl	x11, x10, #0x1
    1c38: 042a504c     	addvl	x12, x10, #0x2
    1c3c: a91b2beb     	stp	x11, x10, [sp, #0x1b0]
    1c40: 8b0e014b     	add	x11, x10, x14
    1c44: 042a506a     	addvl	x10, x10, #0x3
    1c48: a919b3ea     	stp	x10, x12, [sp, #0x198]
    1c4c: 042b502a     	addvl	x10, x11, #0x1
    1c50: f900cbea     	str	x10, [sp, #0x190]
    1c54: 042b504a     	addvl	x10, x11, #0x2
    1c58: f900c7ea     	str	x10, [sp, #0x188]
    1c5c: 042b506a     	addvl	x10, x11, #0x3
    1c60: f900c3ea     	str	x10, [sp, #0x180]
    1c64: f9402bea     	ldr	x10, [sp, #0x50]
    1c68: f900d7eb     	str	x11, [sp, #0x1a8]
    1c6c: 8b0e016b     	add	x11, x11, x14
    1c70: 8b29cd58     	add	x24, x10, w9, sxtw #3
    1c74: 042b5029     	addvl	x9, x11, #0x1
    1c78: 042b504a     	addvl	x10, x11, #0x2
    1c7c: a9172fe9     	stp	x9, x11, [sp, #0x170]
    1c80: 8b0e0169     	add	x9, x11, x14
    1c84: a91627ea     	stp	x10, x9, [sp, #0x160]
    1c88: 042b506a     	addvl	x10, x11, #0x3
    1c8c: 0429502b     	addvl	x11, x9, #0x1
    1c90: f900afea     	str	x10, [sp, #0x158]
    1c94: 0429504a     	addvl	x10, x9, #0x2
    1c98: a914afea     	stp	x10, x11, [sp, #0x148]
    1c9c: 0429506b     	addvl	x11, x9, #0x3
    1ca0: 8b0e0129     	add	x9, x9, x14
    1ca4: 0429502a     	addvl	x10, x9, #0x1
    1ca8: a913afe9     	stp	x9, x11, [sp, #0x138]
    1cac: 0429506b     	addvl	x11, x9, #0x3
    1cb0: f9009bea     	str	x10, [sp, #0x130]
    1cb4: 0429504a     	addvl	x10, x9, #0x2
    1cb8: f90097ea     	str	x10, [sp, #0x128]
    1cbc: 8b0e012a     	add	x10, x9, x14
    1cc0: 042a5029     	addvl	x9, x10, #0x1
    1cc4: f90093ea     	str	x10, [sp, #0x120]
    1cc8: a9112fe9     	stp	x9, x11, [sp, #0x110]
    1ccc: 8b0e0149     	add	x9, x10, x14
    1cd0: 042a504b     	addvl	x11, x10, #0x2
    1cd4: 042a506a     	addvl	x10, x10, #0x3
    1cd8: 8b0e013d     	add	x29, x9, x14
    1cdc: f90087e9     	str	x9, [sp, #0x108]
    1ce0: a90fafea     	stp	x10, x11, [sp, #0xf8]
    1ce4: 0429502b     	addvl	x11, x9, #0x1
    1ce8: 0429504a     	addvl	x10, x9, #0x2
    1cec: a90eafea     	stp	x10, x11, [sp, #0xe8]
    1cf0: 0429506a     	addvl	x10, x9, #0x3
    1cf4: 043d5029     	addvl	x9, x29, #0x1
    1cf8: 8b0e03a5     	add	x5, x29, x14
    1cfc: a90dabe9     	stp	x9, x10, [sp, #0xd8]
    1d00: 043d504a     	addvl	x10, x29, #0x2
    1d04: 043d5069     	addvl	x9, x29, #0x3
    1d08: 8b0e00a1     	add	x1, x5, x14
    1d0c: a90cabe9     	stp	x9, x10, [sp, #0xc8]
    1d10: 0425502a     	addvl	x10, x5, #0x1
    1d14: 04255049     	addvl	x9, x5, #0x2
    1d18: 8b0e0032     	add	x18, x1, x14
    1d1c: a90babe9     	stp	x9, x10, [sp, #0xb8]
    1d20: 0425506a     	addvl	x10, x5, #0x3
    1d24: 04215029     	addvl	x9, x1, #0x1
    1d28: 8b0e0256     	add	x22, x18, x14
    1d2c: a90aabe9     	stp	x9, x10, [sp, #0xa8]
    1d30: 0421504a     	addvl	x10, x1, #0x2
    1d34: 04215069     	addvl	x9, x1, #0x3
    1d38: 8b0e02db     	add	x27, x22, x14
    1d3c: a909abe9     	stp	x9, x10, [sp, #0x98]
    1d40: 0432502a     	addvl	x10, x18, #0x1
    1d44: 04325049     	addvl	x9, x18, #0x2
    1d48: 8b0e036b     	add	x11, x27, x14
    1d4c: 0436507c     	addvl	x28, x22, #0x3
    1d50: a908abe9     	stp	x9, x10, [sp, #0x88]
    1d54: 0432506a     	addvl	x10, x18, #0x3
    1d58: 04365029     	addvl	x9, x22, #0x1
    1d5c: 8b0e0173     	add	x19, x11, x14
    1d60: a907abe9     	stp	x9, x10, [sp, #0x78]
    1d64: 0436504a     	addvl	x10, x22, #0x2
    1d68: 043b503e     	addvl	x30, x27, #0x1
    1d6c: 043b5049     	addvl	x9, x27, #0x2
    1d70: 043b5067     	addvl	x7, x27, #0x3
    1d74: 042b5026     	addvl	x6, x11, #0x1
    1d78: 042b5042     	addvl	x2, x11, #0x2
    1d7c: 042b5063     	addvl	x3, x11, #0x3
    1d80: 04335020     	addvl	x0, x19, #0x1
    1d84: 04335051     	addvl	x17, x19, #0x2
    1d88: 04335064     	addvl	x4, x19, #0x3
    1d8c: 5280002e     	mov	w14, #0x1               // =1
    1d90: 140000b9     	b	0x2074 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x570>
    1d94: 2a1f03ee     	mov	w14, wzr
    1d98: 5280002f     	mov	w15, #0x1               // =1
    1d9c: 93407eb5     	sxtw	x21, w21
    1da0: c0c24000     	mov	z0.d, p0/m, za0h.d[w14, 0]
    1da4: 6b08029f     	cmp	w20, w8
    1da8: c0c24041     	mov	z1.d, p0/m, za1h.d[w14, 0]
    1dac: 8b151f39     	add	x25, x25, x21, lsl #7
    1db0: 8b152318     	add	x24, x24, x21, lsl #8
    1db4: c0c24082     	mov	z2.d, p0/m, za2h.d[w14, 0]
    1db8: 2a1403f5     	mov	w21, w20
    1dbc: c0c240c3     	mov	z3.d, p0/m, za3h.d[w14, 0]
    1dc0: a95d37ec     	ldp	x12, x13, [sp, #0x1d0]
    1dc4: e5e0e1a0     	st1d	{ z0.d }, p0, [x13]
    1dc8: e5e0e181     	st1d	{ z1.d }, p0, [x12]
    1dcc: a95c37ec     	ldp	x12, x13, [sp, #0x1c0]
    1dd0: e5e0e1a2     	st1d	{ z2.d }, p0, [x13]
    1dd4: e5e0e183     	st1d	{ z3.d }, p0, [x12]
    1dd8: c0c26000     	mov	z0.d, p0/m, za0h.d[w15, 0]
    1ddc: c0c26041     	mov	z1.d, p0/m, za1h.d[w15, 0]
    1de0: c0c26082     	mov	z2.d, p0/m, za2h.d[w15, 0]
    1de4: c0c260c3     	mov	z3.d, p0/m, za3h.d[w15, 0]
    1de8: a95b37ec     	ldp	x12, x13, [sp, #0x1b0]
    1dec: e5e0e1a0     	st1d	{ z0.d }, p0, [x13]
    1df0: e5e0e181     	st1d	{ z1.d }, p0, [x12]
    1df4: a959b7ec     	ldp	x12, x13, [sp, #0x198]
    1df8: e5e0e1a2     	st1d	{ z2.d }, p0, [x13]
    1dfc: e5e0e183     	st1d	{ z3.d }, p0, [x12]
    1e00: 5280004c     	mov	w12, #0x2               // =2
    1e04: c0c20000     	mov	z0.d, p0/m, za0h.d[w12, 0]
    1e08: c0c20041     	mov	z1.d, p0/m, za1h.d[w12, 0]
    1e0c: c0c20082     	mov	z2.d, p0/m, za2h.d[w12, 0]
    1e10: c0c200c3     	mov	z3.d, p0/m, za3h.d[w12, 0]
    1e14: f940d7ed     	ldr	x13, [sp, #0x1a8]
    1e18: e5e0e1a0     	st1d	{ z0.d }, p0, [x13]
    1e1c: a958b3ed     	ldp	x13, x12, [sp, #0x188]
    1e20: e5e0e181     	st1d	{ z1.d }, p0, [x12]
    1e24: 5280008c     	mov	w12, #0x4               // =4
    1e28: e5e0e1a2     	st1d	{ z2.d }, p0, [x13]
    1e2c: f940c3ed     	ldr	x13, [sp, #0x180]
    1e30: e5e0e1a3     	st1d	{ z3.d }, p0, [x13]
    1e34: 5280006d     	mov	w13, #0x3               // =3
    1e38: c0c22000     	mov	z0.d, p0/m, za0h.d[w13, 0]
    1e3c: c0c22041     	mov	z1.d, p0/m, za1h.d[w13, 0]
    1e40: c0c22082     	mov	z2.d, p0/m, za2h.d[w13, 0]
    1e44: c0c220c3     	mov	z3.d, p0/m, za3h.d[w13, 0]
    1e48: f940bff0     	ldr	x16, [sp, #0x178]
    1e4c: e5e0e200     	st1d	{ z0.d }, p0, [x16]
    1e50: f940bbf0     	ldr	x16, [sp, #0x170]
    1e54: e5e0e201     	st1d	{ z1.d }, p0, [x16]
    1e58: f940b3f0     	ldr	x16, [sp, #0x160]
    1e5c: e5e0e202     	st1d	{ z2.d }, p0, [x16]
    1e60: f940aff0     	ldr	x16, [sp, #0x158]
    1e64: e5e0e203     	st1d	{ z3.d }, p0, [x16]
    1e68: c0c20000     	mov	z0.d, p0/m, za0h.d[w12, 0]
    1e6c: c0c20041     	mov	z1.d, p0/m, za1h.d[w12, 0]
    1e70: c0c20082     	mov	z2.d, p0/m, za2h.d[w12, 0]
    1e74: c0c200c3     	mov	z3.d, p0/m, za3h.d[w12, 0]
    1e78: 528000ac     	mov	w12, #0x5               // =5
    1e7c: f940b7f0     	ldr	x16, [sp, #0x168]
    1e80: e5e0e200     	st1d	{ z0.d }, p0, [x16]
    1e84: f940abf0     	ldr	x16, [sp, #0x150]
    1e88: e5e0e201     	st1d	{ z1.d }, p0, [x16]
    1e8c: f940a7f0     	ldr	x16, [sp, #0x148]
    1e90: e5e0e202     	st1d	{ z2.d }, p0, [x16]
    1e94: f940a3f0     	ldr	x16, [sp, #0x140]
    1e98: e5e0e203     	st1d	{ z3.d }, p0, [x16]
    1e9c: c0c20000     	mov	z0.d, p0/m, za0h.d[w12, 0]
    1ea0: c0c20041     	mov	z1.d, p0/m, za1h.d[w12, 0]
    1ea4: c0c20082     	mov	z2.d, p0/m, za2h.d[w12, 0]
    1ea8: c0c200c3     	mov	z3.d, p0/m, za3h.d[w12, 0]
    1eac: 528000cc     	mov	w12, #0x6               // =6
    1eb0: f9409ff0     	ldr	x16, [sp, #0x138]
    1eb4: e5e0e200     	st1d	{ z0.d }, p0, [x16]
    1eb8: f9409bf0     	ldr	x16, [sp, #0x130]
    1ebc: e5e0e201     	st1d	{ z1.d }, p0, [x16]
    1ec0: f94097f0     	ldr	x16, [sp, #0x128]
    1ec4: e5e0e202     	st1d	{ z2.d }, p0, [x16]
    1ec8: f9408ff0     	ldr	x16, [sp, #0x118]
    1ecc: e5e0e203     	st1d	{ z3.d }, p0, [x16]
    1ed0: c0c20000     	mov	z0.d, p0/m, za0h.d[w12, 0]
    1ed4: c0c20041     	mov	z1.d, p0/m, za1h.d[w12, 0]
    1ed8: c0c20082     	mov	z2.d, p0/m, za2h.d[w12, 0]
    1edc: c0c200c3     	mov	z3.d, p0/m, za3h.d[w12, 0]
    1ee0: 528000ec     	mov	w12, #0x7               // =7
    1ee4: f94093f0     	ldr	x16, [sp, #0x120]
    1ee8: e5e0e200     	st1d	{ z0.d }, p0, [x16]
    1eec: f9408bf0     	ldr	x16, [sp, #0x110]
    1ef0: e5e0e201     	st1d	{ z1.d }, p0, [x16]
    1ef4: f94083f0     	ldr	x16, [sp, #0x100]
    1ef8: e5e0e202     	st1d	{ z2.d }, p0, [x16]
    1efc: f9407ff0     	ldr	x16, [sp, #0xf8]
    1f00: e5e0e203     	st1d	{ z3.d }, p0, [x16]
    1f04: c0c20000     	mov	z0.d, p0/m, za0h.d[w12, 0]
    1f08: c0c20041     	mov	z1.d, p0/m, za1h.d[w12, 0]
    1f0c: c0c20082     	mov	z2.d, p0/m, za2h.d[w12, 0]
    1f10: c0c200c3     	mov	z3.d, p0/m, za3h.d[w12, 0]
    1f14: f94087f0     	ldr	x16, [sp, #0x108]
    1f18: e5e0e200     	st1d	{ z0.d }, p0, [x16]
    1f1c: f9407bf0     	ldr	x16, [sp, #0xf0]
    1f20: e5e0e201     	st1d	{ z1.d }, p0, [x16]
    1f24: f94077f0     	ldr	x16, [sp, #0xe8]
    1f28: e5e0e202     	st1d	{ z2.d }, p0, [x16]
    1f2c: f94073f0     	ldr	x16, [sp, #0xe0]
    1f30: e5e0e203     	st1d	{ z3.d }, p0, [x16]
    1f34: c0c24101     	mov	z1.d, p0/m, za4h.d[w14, 0]
    1f38: c0c24142     	mov	z2.d, p0/m, za5h.d[w14, 0]
    1f3c: c0c24183     	mov	z3.d, p0/m, za6h.d[w14, 0]
    1f40: c0c241c0     	mov	z0.d, p0/m, za7h.d[w14, 0]
    1f44: e5e0e3a1     	st1d	{ z1.d }, p0, [x29]
    1f48: f9406ff0     	ldr	x16, [sp, #0xd8]
    1f4c: e5e0e202     	st1d	{ z2.d }, p0, [x16]
    1f50: f9406bf0     	ldr	x16, [sp, #0xd0]
    1f54: e5e0e203     	st1d	{ z3.d }, p0, [x16]
    1f58: f94067f0     	ldr	x16, [sp, #0xc8]
    1f5c: e5e0e200     	st1d	{ z0.d }, p0, [x16]
    1f60: c0c26101     	mov	z1.d, p0/m, za4h.d[w15, 0]
    1f64: c0c26142     	mov	z2.d, p0/m, za5h.d[w15, 0]
    1f68: c0c26183     	mov	z3.d, p0/m, za6h.d[w15, 0]
    1f6c: c0c261c0     	mov	z0.d, p0/m, za7h.d[w15, 0]
    1f70: e5e0e0a1     	st1d	{ z1.d }, p0, [x5]
    1f74: a94bb3ef     	ldp	x15, x12, [sp, #0xb8]
    1f78: e5e0e182     	st1d	{ z2.d }, p0, [x12]
    1f7c: 5280004c     	mov	w12, #0x2               // =2
    1f80: e5e0e1e3     	st1d	{ z3.d }, p0, [x15]
    1f84: f9405bef     	ldr	x15, [sp, #0xb0]
    1f88: e5e0e1e0     	st1d	{ z0.d }, p0, [x15]
    1f8c: c0c20101     	mov	z1.d, p0/m, za4h.d[w12, 0]
    1f90: c0c20142     	mov	z2.d, p0/m, za5h.d[w12, 0]
    1f94: c0c20183     	mov	z3.d, p0/m, za6h.d[w12, 0]
    1f98: c0c201c0     	mov	z0.d, p0/m, za7h.d[w12, 0]
    1f9c: e5e0e021     	st1d	{ z1.d }, p0, [x1]
    1fa0: a94a3fec     	ldp	x12, x15, [sp, #0xa0]
    1fa4: e5e0e1e2     	st1d	{ z2.d }, p0, [x15]
    1fa8: e5e0e183     	st1d	{ z3.d }, p0, [x12]
    1fac: f9404fec     	ldr	x12, [sp, #0x98]
    1fb0: e5e0e180     	st1d	{ z0.d }, p0, [x12]
    1fb4: c0c22101     	mov	z1.d, p0/m, za4h.d[w13, 0]
    1fb8: c0c22142     	mov	z2.d, p0/m, za5h.d[w13, 0]
    1fbc: c0c22183     	mov	z3.d, p0/m, za6h.d[w13, 0]
    1fc0: c0c221c0     	mov	z0.d, p0/m, za7h.d[w13, 0]
    1fc4: e5e0e241     	st1d	{ z1.d }, p0, [x18]
    1fc8: a948b7ec     	ldp	x12, x13, [sp, #0x88]
    1fcc: e5e0e1a2     	st1d	{ z2.d }, p0, [x13]
    1fd0: e5e0e183     	st1d	{ z3.d }, p0, [x12]
    1fd4: f94043ec     	ldr	x12, [sp, #0x80]
    1fd8: e5e0e180     	st1d	{ z0.d }, p0, [x12]
    1fdc: 5280008c     	mov	w12, #0x4               // =4
    1fe0: c0c20101     	mov	z1.d, p0/m, za4h.d[w12, 0]
    1fe4: c0c20142     	mov	z2.d, p0/m, za5h.d[w12, 0]
    1fe8: c0c20183     	mov	z3.d, p0/m, za6h.d[w12, 0]
    1fec: c0c201c0     	mov	z0.d, p0/m, za7h.d[w12, 0]
    1ff0: e5e0e2c1     	st1d	{ z1.d }, p0, [x22]
    1ff4: f9403fec     	ldr	x12, [sp, #0x78]
    1ff8: e5e0e182     	st1d	{ z2.d }, p0, [x12]
    1ffc: 528000ac     	mov	w12, #0x5               // =5
    2000: e5e0e143     	st1d	{ z3.d }, p0, [x10]
    2004: e5e0e380     	st1d	{ z0.d }, p0, [x28]
    2008: c0c20101     	mov	z1.d, p0/m, za4h.d[w12, 0]
    200c: c0c20142     	mov	z2.d, p0/m, za5h.d[w12, 0]
    2010: c0c20183     	mov	z3.d, p0/m, za6h.d[w12, 0]
    2014: c0c201c0     	mov	z0.d, p0/m, za7h.d[w12, 0]
    2018: e5e0e361     	st1d	{ z1.d }, p0, [x27]
    201c: 528000cc     	mov	w12, #0x6               // =6
    2020: e5e0e3c2     	st1d	{ z2.d }, p0, [x30]
    2024: e5e0e123     	st1d	{ z3.d }, p0, [x9]
    2028: e5e0e0e0     	st1d	{ z0.d }, p0, [x7]
    202c: c0c20101     	mov	z1.d, p0/m, za4h.d[w12, 0]
    2030: c0c20142     	mov	z2.d, p0/m, za5h.d[w12, 0]
    2034: c0c20183     	mov	z3.d, p0/m, za6h.d[w12, 0]
    2038: c0c201c0     	mov	z0.d, p0/m, za7h.d[w12, 0]
    203c: e5e0e161     	st1d	{ z1.d }, p0, [x11]
    2040: 528000ec     	mov	w12, #0x7               // =7
    2044: e5e0e0c2     	st1d	{ z2.d }, p0, [x6]
    2048: e5e0e043     	st1d	{ z3.d }, p0, [x2]
    204c: e5e0e060     	st1d	{ z0.d }, p0, [x3]
    2050: c0c20101     	mov	z1.d, p0/m, za4h.d[w12, 0]
    2054: c0c20142     	mov	z2.d, p0/m, za5h.d[w12, 0]
    2058: c0c20183     	mov	z3.d, p0/m, za6h.d[w12, 0]
    205c: c0c201c0     	mov	z0.d, p0/m, za7h.d[w12, 0]
    2060: e5e0e261     	st1d	{ z1.d }, p0, [x19]
    2064: e5e0e002     	st1d	{ z2.d }, p0, [x0]
    2068: e5e0e223     	st1d	{ z3.d }, p0, [x17]
    206c: e5e0e080     	st1d	{ z0.d }, p0, [x4]
    2070: 54ffdbaa     	b.ge	0x1be4 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0xe0>
    2074: 112002b4     	add	w20, w21, #0x800
    2078: 4b150110     	sub	w16, w8, w21
    207c: 52810015     	mov	w21, #0x800             // =2048
    2080: 6b08029f     	cmp	w20, w8
    2084: 1a95c215     	csel	w21, w16, w21, gt
    2088: 360000ae     	tbz	w14, #0x0, 0x209c <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x598>
    208c: c00800ff     	zero	{za}
    2090: 710006bf     	cmp	w21, #0x1
    2094: 5400162a     	b.ge	0x2358 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x854>
    2098: 17ffff3f     	b	0x1d94 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x290>
    209c: a95d37ec     	ldp	x12, x13, [sp, #0x1d0]
    20a0: 2a1f03ee     	mov	w14, wzr
    20a4: 5280002f     	mov	w15, #0x1               // =1
    20a8: a5e0a1a0     	ld1d	{ z0.d }, p0/z, [x13]
    20ac: a5e0a181     	ld1d	{ z1.d }, p0/z, [x12]
    20b0: a95c37ec     	ldp	x12, x13, [sp, #0x1c0]
    20b4: a5e0a1a2     	ld1d	{ z2.d }, p0/z, [x13]
    20b8: a5e0a183     	ld1d	{ z3.d }, p0/z, [x12]
    20bc: c0c04000     	mov	za0h.d[w14, 0], p0/m, z0.d
    20c0: c0c04022     	mov	za1h.d[w14, 0], p0/m, z1.d
    20c4: c0c04044     	mov	za2h.d[w14, 0], p0/m, z2.d
    20c8: c0c04066     	mov	za3h.d[w14, 0], p0/m, z3.d
    20cc: a95b37ec     	ldp	x12, x13, [sp, #0x1b0]
    20d0: a5e0a1a0     	ld1d	{ z0.d }, p0/z, [x13]
    20d4: a5e0a181     	ld1d	{ z1.d }, p0/z, [x12]
    20d8: a959b7ec     	ldp	x12, x13, [sp, #0x198]
    20dc: a5e0a1a2     	ld1d	{ z2.d }, p0/z, [x13]
    20e0: a5e0a183     	ld1d	{ z3.d }, p0/z, [x12]
    20e4: c0c06000     	mov	za0h.d[w15, 0], p0/m, z0.d
    20e8: c0c06022     	mov	za1h.d[w15, 0], p0/m, z1.d
    20ec: c0c06044     	mov	za2h.d[w15, 0], p0/m, z2.d
    20f0: c0c06066     	mov	za3h.d[w15, 0], p0/m, z3.d
    20f4: f940d7ec     	ldr	x12, [sp, #0x1a8]
    20f8: a5e0a180     	ld1d	{ z0.d }, p0/z, [x12]
    20fc: a958b7ec     	ldp	x12, x13, [sp, #0x188]
    2100: a5e0a1a1     	ld1d	{ z1.d }, p0/z, [x13]
    2104: a5e0a182     	ld1d	{ z2.d }, p0/z, [x12]
    2108: a957b3ed     	ldp	x13, x12, [sp, #0x178]
    210c: a5e0a183     	ld1d	{ z3.d }, p0/z, [x12]
    2110: 5280004c     	mov	w12, #0x2               // =2
    2114: c0c00000     	mov	za0h.d[w12, 0], p0/m, z0.d
    2118: c0c00022     	mov	za1h.d[w12, 0], p0/m, z1.d
    211c: c0c00044     	mov	za2h.d[w12, 0], p0/m, z2.d
    2120: c0c00066     	mov	za3h.d[w12, 0], p0/m, z3.d
    2124: a5e0a1a0     	ld1d	{ z0.d }, p0/z, [x13]
    2128: a956b7f0     	ldp	x16, x13, [sp, #0x168]
    212c: a5e0a1a1     	ld1d	{ z1.d }, p0/z, [x13]
    2130: a955b3ed     	ldp	x13, x12, [sp, #0x158]
    2134: a5e0a182     	ld1d	{ z2.d }, p0/z, [x12]
    2138: a5e0a1a3     	ld1d	{ z3.d }, p0/z, [x13]
    213c: 5280006d     	mov	w13, #0x3               // =3
    2140: c0c02000     	mov	za0h.d[w13, 0], p0/m, z0.d
    2144: c0c02022     	mov	za1h.d[w13, 0], p0/m, z1.d
    2148: 5280008c     	mov	w12, #0x4               // =4
    214c: c0c02044     	mov	za2h.d[w13, 0], p0/m, z2.d
    2150: c0c02066     	mov	za3h.d[w13, 0], p0/m, z3.d
    2154: a5e0a200     	ld1d	{ z0.d }, p0/z, [x16]
    2158: f940abf0     	ldr	x16, [sp, #0x150]
    215c: a5e0a201     	ld1d	{ z1.d }, p0/z, [x16]
    2160: f940a7f0     	ldr	x16, [sp, #0x148]
    2164: a5e0a202     	ld1d	{ z2.d }, p0/z, [x16]
    2168: f940a3f0     	ldr	x16, [sp, #0x140]
    216c: a5e0a203     	ld1d	{ z3.d }, p0/z, [x16]
    2170: c0c00000     	mov	za0h.d[w12, 0], p0/m, z0.d
    2174: c0c00022     	mov	za1h.d[w12, 0], p0/m, z1.d
    2178: c0c00044     	mov	za2h.d[w12, 0], p0/m, z2.d
    217c: c0c00066     	mov	za3h.d[w12, 0], p0/m, z3.d
    2180: f9409ff0     	ldr	x16, [sp, #0x138]
    2184: 528000ac     	mov	w12, #0x5               // =5
    2188: a5e0a200     	ld1d	{ z0.d }, p0/z, [x16]
    218c: f9409bf0     	ldr	x16, [sp, #0x130]
    2190: a5e0a201     	ld1d	{ z1.d }, p0/z, [x16]
    2194: f94097f0     	ldr	x16, [sp, #0x128]
    2198: a5e0a202     	ld1d	{ z2.d }, p0/z, [x16]
    219c: f9408ff0     	ldr	x16, [sp, #0x118]
    21a0: a5e0a203     	ld1d	{ z3.d }, p0/z, [x16]
    21a4: c0c00000     	mov	za0h.d[w12, 0], p0/m, z0.d
    21a8: c0c00022     	mov	za1h.d[w12, 0], p0/m, z1.d
    21ac: c0c00044     	mov	za2h.d[w12, 0], p0/m, z2.d
    21b0: c0c00066     	mov	za3h.d[w12, 0], p0/m, z3.d
    21b4: f94093f0     	ldr	x16, [sp, #0x120]
    21b8: 528000cc     	mov	w12, #0x6               // =6
    21bc: a5e0a200     	ld1d	{ z0.d }, p0/z, [x16]
    21c0: f9408bf0     	ldr	x16, [sp, #0x110]
    21c4: a5e0a201     	ld1d	{ z1.d }, p0/z, [x16]
    21c8: f94083f0     	ldr	x16, [sp, #0x100]
    21cc: a5e0a202     	ld1d	{ z2.d }, p0/z, [x16]
    21d0: f9407ff0     	ldr	x16, [sp, #0xf8]
    21d4: a5e0a203     	ld1d	{ z3.d }, p0/z, [x16]
    21d8: c0c00000     	mov	za0h.d[w12, 0], p0/m, z0.d
    21dc: c0c00022     	mov	za1h.d[w12, 0], p0/m, z1.d
    21e0: c0c00044     	mov	za2h.d[w12, 0], p0/m, z2.d
    21e4: c0c00066     	mov	za3h.d[w12, 0], p0/m, z3.d
    21e8: f94087f0     	ldr	x16, [sp, #0x108]
    21ec: 528000ec     	mov	w12, #0x7               // =7
    21f0: a5e0a200     	ld1d	{ z0.d }, p0/z, [x16]
    21f4: f9407bf0     	ldr	x16, [sp, #0xf0]
    21f8: a5e0a201     	ld1d	{ z1.d }, p0/z, [x16]
    21fc: f94077f0     	ldr	x16, [sp, #0xe8]
    2200: a5e0a202     	ld1d	{ z2.d }, p0/z, [x16]
    2204: f94073f0     	ldr	x16, [sp, #0xe0]
    2208: a5e0a203     	ld1d	{ z3.d }, p0/z, [x16]
    220c: c0c00000     	mov	za0h.d[w12, 0], p0/m, z0.d
    2210: c0c00022     	mov	za1h.d[w12, 0], p0/m, z1.d
    2214: c0c00044     	mov	za2h.d[w12, 0], p0/m, z2.d
    2218: c0c00066     	mov	za3h.d[w12, 0], p0/m, z3.d
    221c: f9406ff0     	ldr	x16, [sp, #0xd8]
    2220: a5e0a3a0     	ld1d	{ z0.d }, p0/z, [x29]
    2224: a5e0a201     	ld1d	{ z1.d }, p0/z, [x16]
    2228: f9406bf0     	ldr	x16, [sp, #0xd0]
    222c: a5e0a202     	ld1d	{ z2.d }, p0/z, [x16]
    2230: f94067f0     	ldr	x16, [sp, #0xc8]
    2234: a5e0a203     	ld1d	{ z3.d }, p0/z, [x16]
    2238: c0c04008     	mov	za4h.d[w14, 0], p0/m, z0.d
    223c: c0c0402a     	mov	za5h.d[w14, 0], p0/m, z1.d
    2240: c0c0404c     	mov	za6h.d[w14, 0], p0/m, z2.d
    2244: c0c0406e     	mov	za7h.d[w14, 0], p0/m, z3.d
    2248: a94bb3ee     	ldp	x14, x12, [sp, #0xb8]
    224c: a5e0a0a0     	ld1d	{ z0.d }, p0/z, [x5]
    2250: a5e0a181     	ld1d	{ z1.d }, p0/z, [x12]
    2254: a5e0a1c2     	ld1d	{ z2.d }, p0/z, [x14]
    2258: a94ab3ee     	ldp	x14, x12, [sp, #0xa8]
    225c: a5e0a183     	ld1d	{ z3.d }, p0/z, [x12]
    2260: c0c06008     	mov	za4h.d[w15, 0], p0/m, z0.d
    2264: c0c0602a     	mov	za5h.d[w15, 0], p0/m, z1.d
    2268: c0c0604c     	mov	za6h.d[w15, 0], p0/m, z2.d
    226c: c0c0606e     	mov	za7h.d[w15, 0], p0/m, z3.d
    2270: a5e0a1c1     	ld1d	{ z1.d }, p0/z, [x14]
    2274: a5e0a020     	ld1d	{ z0.d }, p0/z, [x1]
    2278: a949b3ee     	ldp	x14, x12, [sp, #0x98]
    227c: a5e0a182     	ld1d	{ z2.d }, p0/z, [x12]
    2280: a5e0a1c3     	ld1d	{ z3.d }, p0/z, [x14]
    2284: 5280004c     	mov	w12, #0x2               // =2
    2288: c0c00008     	mov	za4h.d[w12, 0], p0/m, z0.d
    228c: c0c0002a     	mov	za5h.d[w12, 0], p0/m, z1.d
    2290: c0c0004c     	mov	za6h.d[w12, 0], p0/m, z2.d
    2294: c0c0006e     	mov	za7h.d[w12, 0], p0/m, z3.d
    2298: a5e0a240     	ld1d	{ z0.d }, p0/z, [x18]
    229c: a948bbec     	ldp	x12, x14, [sp, #0x88]
    22a0: a5e0a1c1     	ld1d	{ z1.d }, p0/z, [x14]
    22a4: a5e0a182     	ld1d	{ z2.d }, p0/z, [x12]
    22a8: a947bbec     	ldp	x12, x14, [sp, #0x78]
    22ac: a5e0a1c3     	ld1d	{ z3.d }, p0/z, [x14]
    22b0: c0c02008     	mov	za4h.d[w13, 0], p0/m, z0.d
    22b4: c0c0202a     	mov	za5h.d[w13, 0], p0/m, z1.d
    22b8: c0c0204c     	mov	za6h.d[w13, 0], p0/m, z2.d
    22bc: c0c0206e     	mov	za7h.d[w13, 0], p0/m, z3.d
    22c0: a5e0a2c0     	ld1d	{ z0.d }, p0/z, [x22]
    22c4: a5e0a181     	ld1d	{ z1.d }, p0/z, [x12]
    22c8: a5e0a142     	ld1d	{ z2.d }, p0/z, [x10]
    22cc: a5e0a383     	ld1d	{ z3.d }, p0/z, [x28]
    22d0: 5280008c     	mov	w12, #0x4               // =4
    22d4: c0c00008     	mov	za4h.d[w12, 0], p0/m, z0.d
    22d8: c0c0002a     	mov	za5h.d[w12, 0], p0/m, z1.d
    22dc: c0c0004c     	mov	za6h.d[w12, 0], p0/m, z2.d
    22e0: c0c0006e     	mov	za7h.d[w12, 0], p0/m, z3.d
    22e4: a5e0a360     	ld1d	{ z0.d }, p0/z, [x27]
    22e8: a5e0a3c1     	ld1d	{ z1.d }, p0/z, [x30]
    22ec: a5e0a122     	ld1d	{ z2.d }, p0/z, [x9]
    22f0: a5e0a0e3     	ld1d	{ z3.d }, p0/z, [x7]
    22f4: 528000ac     	mov	w12, #0x5               // =5
    22f8: c0c00008     	mov	za4h.d[w12, 0], p0/m, z0.d
    22fc: c0c0002a     	mov	za5h.d[w12, 0], p0/m, z1.d
    2300: c0c0004c     	mov	za6h.d[w12, 0], p0/m, z2.d
    2304: c0c0006e     	mov	za7h.d[w12, 0], p0/m, z3.d
    2308: a5e0a160     	ld1d	{ z0.d }, p0/z, [x11]
    230c: a5e0a0c1     	ld1d	{ z1.d }, p0/z, [x6]
    2310: a5e0a042     	ld1d	{ z2.d }, p0/z, [x2]
    2314: a5e0a063     	ld1d	{ z3.d }, p0/z, [x3]
    2318: 528000cc     	mov	w12, #0x6               // =6
    231c: c0c00008     	mov	za4h.d[w12, 0], p0/m, z0.d
    2320: c0c0002a     	mov	za5h.d[w12, 0], p0/m, z1.d
    2324: c0c0004c     	mov	za6h.d[w12, 0], p0/m, z2.d
    2328: c0c0006e     	mov	za7h.d[w12, 0], p0/m, z3.d
    232c: a5e0a260     	ld1d	{ z0.d }, p0/z, [x19]
    2330: a5e0a001     	ld1d	{ z1.d }, p0/z, [x0]
    2334: a5e0a222     	ld1d	{ z2.d }, p0/z, [x17]
    2338: a5e0a083     	ld1d	{ z3.d }, p0/z, [x4]
    233c: 528000ec     	mov	w12, #0x7               // =7
    2340: c0c00008     	mov	za4h.d[w12, 0], p0/m, z0.d
    2344: c0c0002a     	mov	za5h.d[w12, 0], p0/m, z1.d
    2348: c0c0004c     	mov	za6h.d[w12, 0], p0/m, z2.d
    234c: c0c0006e     	mov	za7h.d[w12, 0], p0/m, z3.d
    2350: 710006bf     	cmp	w21, #0x1
    2354: 54ffd20b     	b.lt	0x1d94 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x290>
    2358: 2a1f03ee     	mov	w14, wzr
    235c: aa1903f7     	mov	x23, x25
    2360: aa1803f0     	mov	x16, x24
    2364: 14000014     	b	0x23b4 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x8b0>
    2368: a5e0a2e0     	ld1d	{ z0.d }, p0/z, [x23]
    236c: a5e0a201     	ld1d	{ z1.d }, p0/z, [x16]
    2370: 110005ce     	add	w14, w14, #0x1
    2374: a5e1a202     	ld1d	{ z2.d }, p0/z, [x16, #0x1, mul vl]
    2378: a5e1a2e3     	ld1d	{ z3.d }, p0/z, [x23, #0x1, mul vl]
    237c: 6b1501df     	cmp	w14, w21
    2380: a5e2a204     	ld1d	{ z4.d }, p0/z, [x16, #0x2, mul vl]
    2384: a5e3a205     	ld1d	{ z5.d }, p0/z, [x16, #0x3, mul vl]
    2388: 910202f7     	add	x23, x23, #0x80
    238c: 91040210     	add	x16, x16, #0x100
    2390: 80c10000     	fmopa	za0.d, p0/m, p0/m, z0.d, z1.d
    2394: 80c20001     	fmopa	za1.d, p0/m, p0/m, z0.d, z2.d
    2398: 80c40002     	fmopa	za2.d, p0/m, p0/m, z0.d, z4.d
    239c: 80c50003     	fmopa	za3.d, p0/m, p0/m, z0.d, z5.d
    23a0: 80c10064     	fmopa	za4.d, p0/m, p0/m, z3.d, z1.d
    23a4: 80c20065     	fmopa	za5.d, p0/m, p0/m, z3.d, z2.d
    23a8: 80c40066     	fmopa	za6.d, p0/m, p0/m, z3.d, z4.d
    23ac: 80c50067     	fmopa	za7.d, p0/m, p0/m, z3.d, z5.d
    23b0: 54ffcf2a     	b.ge	0x1d94 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x290>
    23b4: 110041da     	add	w26, w14, #0x10
    23b8: 6b15035f     	cmp	w26, w21
    23bc: 54fffd6a     	b.ge	0x2368 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x864>
    23c0: f98402e0     	prfm	pldl1keep, [x23, #0x800]
    23c4: f9880200     	prfm	pldl1keep, [x16, #0x1000]
    23c8: 17ffffe8     	b	0x2368 <_ZN4gemmIdE22compute_thread_streamkEiiiiiPKdS2_Pd+0x864>
    23cc: d503427f     	smstop	sm
    23d0: 910783ff     	add	sp, sp, #0x1e0
    23d4: a9494ff4     	ldp	x20, x19, [sp, #0x90]
    23d8: a94857f6     	ldp	x22, x21, [sp, #0x80]
    23dc: a9475ff8     	ldp	x24, x23, [sp, #0x70]
    23e0: a94667fa     	ldp	x26, x25, [sp, #0x60]
    23e4: a9456ffc     	ldp	x28, x27, [sp, #0x50]
    23e8: a9447bfd     	ldp	x29, x30, [sp, #0x40]
    23ec: 6d4323e9     	ldp	d9, d8, [sp, #0x30]
    23f0: 6d422beb     	ldp	d11, d10, [sp, #0x20]
    23f4: 6d4133ed     	ldp	d13, d12, [sp, #0x10]
    23f8: 6cca3bef     	ldp	d15, d14, [sp], #0xa0
    23fc: d65f03c0     	ret

Disassembly of section .fini:

0000000000002400 <_fini>:
    2400: d503201f     	nop
    2404: a9bf7bfd     	stp	x29, x30, [sp, #-0x10]!
    2408: 910003fd     	mov	x29, sp
    240c: a8c17bfd     	ldp	x29, x30, [sp], #0x10
    2410: d65f03c0     	ret
