
gemm_cr:	file format elf64-littleaarch64

Disassembly of section .init:

0000000000000920 <_init>:
     920: d503201f     	nop
     924: a9bf7bfd     	stp	x29, x30, [sp, #-0x10]!
     928: 910003fd     	mov	x29, sp
     92c: 94000062     	bl	0xab4 <call_weak_fn>
     930: a8c17bfd     	ldp	x29, x30, [sp], #0x10
     934: d65f03c0     	ret

Disassembly of section .plt:

0000000000000940 <.plt>:
     940: a9bf7bf0     	stp	x16, x30, [sp, #-0x10]!
     944: d0000090     	adrp	x16, 0x12000 <__FRAME_END__+0xff08>
     948: f947fe11     	ldr	x17, [x16, #0xff8]
     94c: 913fe210     	add	x16, x16, #0xff8
     950: d61f0220     	br	x17
     954: d503201f     	nop
     958: d503201f     	nop
     95c: d503201f     	nop

0000000000000960 <_Znam@plt>:
     960: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     964: f9400211     	ldr	x17, [x16]
     968: 91000210     	add	x16, x16, #0x0
     96c: d61f0220     	br	x17

0000000000000970 <__kmpc_for_static_fini@plt>:
     970: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     974: f9400611     	ldr	x17, [x16, #0x8]
     978: 91002210     	add	x16, x16, #0x8
     97c: d61f0220     	br	x17

0000000000000980 <_ZNSt6chrono3_V212system_clock3nowEv@plt>:
     980: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     984: f9400a11     	ldr	x17, [x16, #0x10]
     988: 91004210     	add	x16, x16, #0x10
     98c: d61f0220     	br	x17

0000000000000990 <puts@plt>:
     990: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     994: f9400e11     	ldr	x17, [x16, #0x18]
     998: 91006210     	add	x16, x16, #0x18
     99c: d61f0220     	br	x17

00000000000009a0 <strtol@plt>:
     9a0: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     9a4: f9401211     	ldr	x17, [x16, #0x20]
     9a8: 91008210     	add	x16, x16, #0x20
     9ac: d61f0220     	br	x17

00000000000009b0 <memset@plt>:
     9b0: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     9b4: f9401611     	ldr	x17, [x16, #0x28]
     9b8: 9100a210     	add	x16, x16, #0x28
     9bc: d61f0220     	br	x17

00000000000009c0 <__cxa_finalize@plt>:
     9c0: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     9c4: f9401a11     	ldr	x17, [x16, #0x30]
     9c8: 9100c210     	add	x16, x16, #0x30
     9cc: d61f0220     	br	x17

00000000000009d0 <__libc_start_main@plt>:
     9d0: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     9d4: f9401e11     	ldr	x17, [x16, #0x38]
     9d8: 9100e210     	add	x16, x16, #0x38
     9dc: d61f0220     	br	x17

00000000000009e0 <_ZdaPv@plt>:
     9e0: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     9e4: f9402211     	ldr	x17, [x16, #0x40]
     9e8: 91010210     	add	x16, x16, #0x40
     9ec: d61f0220     	br	x17

00000000000009f0 <omp_set_num_threads@plt>:
     9f0: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     9f4: f9402611     	ldr	x17, [x16, #0x48]
     9f8: 91012210     	add	x16, x16, #0x48
     9fc: d61f0220     	br	x17

0000000000000a00 <__kmpc_for_static_init_4@plt>:
     a00: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     a04: f9402a11     	ldr	x17, [x16, #0x50]
     a08: 91014210     	add	x16, x16, #0x50
     a0c: d61f0220     	br	x17

0000000000000a10 <abort@plt>:
     a10: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     a14: f9402e11     	ldr	x17, [x16, #0x58]
     a18: 91016210     	add	x16, x16, #0x58
     a1c: d61f0220     	br	x17

0000000000000a20 <__kmpc_fork_call@plt>:
     a20: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     a24: f9403211     	ldr	x17, [x16, #0x60]
     a28: 91018210     	add	x16, x16, #0x60
     a2c: d61f0220     	br	x17

0000000000000a30 <__gmon_start__@plt>:
     a30: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     a34: f9403611     	ldr	x17, [x16, #0x68]
     a38: 9101a210     	add	x16, x16, #0x68
     a3c: d61f0220     	br	x17

0000000000000a40 <printf@plt>:
     a40: f0000090     	adrp	x16, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     a44: f9403a11     	ldr	x17, [x16, #0x70]
     a48: 9101c210     	add	x16, x16, #0x70
     a4c: d61f0220     	br	x17

Disassembly of section .text:

0000000000000a80 <_start>:
     a80: d503201f     	nop
     a84: d280001d     	mov	x29, #0x0               // =0
     a88: d280001e     	mov	x30, #0x0               // =0
     a8c: aa0003e5     	mov	x5, x0
     a90: f94003e1     	ldr	x1, [sp]
     a94: 910023e2     	add	x2, sp, #0x8
     a98: 910003e6     	mov	x6, sp
     a9c: d0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xff08>
     aa0: f947e000     	ldr	x0, [x0, #0xfc0]
     aa4: d2800003     	mov	x3, #0x0                // =0
     aa8: d2800004     	mov	x4, #0x0                // =0
     aac: 97ffffc9     	bl	0x9d0 <__libc_start_main@plt>
     ab0: 97ffffd8     	bl	0xa10 <abort@plt>

0000000000000ab4 <call_weak_fn>:
     ab4: d0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xff08>
     ab8: f947ec00     	ldr	x0, [x0, #0xfd8]
     abc: b4000040     	cbz	x0, 0xac4 <call_weak_fn+0x10>
     ac0: 17ffffdc     	b	0xa30 <__gmon_start__@plt>
     ac4: d65f03c0     	ret
     ac8: d503201f     	nop
     acc: d503201f     	nop

0000000000000ad0 <deregister_tm_clones>:
     ad0: f0000080     	adrp	x0, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     ad4: 91022000     	add	x0, x0, #0x88
     ad8: f0000081     	adrp	x1, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     adc: 91022021     	add	x1, x1, #0x88
     ae0: eb00003f     	cmp	x1, x0
     ae4: 540000c0     	b.eq	0xafc <deregister_tm_clones+0x2c>
     ae8: d0000081     	adrp	x1, 0x12000 <__FRAME_END__+0xff08>
     aec: f947e821     	ldr	x1, [x1, #0xfd0]
     af0: b4000061     	cbz	x1, 0xafc <deregister_tm_clones+0x2c>
     af4: aa0103f0     	mov	x16, x1
     af8: d61f0200     	br	x16
     afc: d65f03c0     	ret

0000000000000b00 <register_tm_clones>:
     b00: f0000080     	adrp	x0, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     b04: 91022000     	add	x0, x0, #0x88
     b08: f0000081     	adrp	x1, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     b0c: 91022021     	add	x1, x1, #0x88
     b10: cb000021     	sub	x1, x1, x0
     b14: d37ffc22     	lsr	x2, x1, #63
     b18: 8b810c41     	add	x1, x2, x1, asr #3
     b1c: 9341fc21     	asr	x1, x1, #1
     b20: b40000c1     	cbz	x1, 0xb38 <register_tm_clones+0x38>
     b24: d0000082     	adrp	x2, 0x12000 <__FRAME_END__+0xff08>
     b28: f947f042     	ldr	x2, [x2, #0xfe0]
     b2c: b4000062     	cbz	x2, 0xb38 <register_tm_clones+0x38>
     b30: aa0203f0     	mov	x16, x2
     b34: d61f0200     	br	x16
     b38: d65f03c0     	ret
     b3c: d503201f     	nop

0000000000000b40 <__do_global_dtors_aux>:
     b40: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
     b44: 910003fd     	mov	x29, sp
     b48: f9000bf3     	str	x19, [sp, #0x10]
     b4c: f0000093     	adrp	x19, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     b50: 39422260     	ldrb	w0, [x19, #0x88]
     b54: 35000140     	cbnz	w0, 0xb7c <__do_global_dtors_aux+0x3c>
     b58: d0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xff08>
     b5c: f947e400     	ldr	x0, [x0, #0xfc8]
     b60: b4000080     	cbz	x0, 0xb70 <__do_global_dtors_aux+0x30>
     b64: f0000080     	adrp	x0, 0x13000 <_GLOBAL_OFFSET_TABLE_+0x48>
     b68: f9404000     	ldr	x0, [x0, #0x80]
     b6c: 97ffff95     	bl	0x9c0 <__cxa_finalize@plt>
     b70: 97ffffd8     	bl	0xad0 <deregister_tm_clones>
     b74: 52800020     	mov	w0, #0x1                // =1
     b78: 39022260     	strb	w0, [x19, #0x88]
     b7c: f9400bf3     	ldr	x19, [sp, #0x10]
     b80: a8c27bfd     	ldp	x29, x30, [sp], #0x20
     b84: d65f03c0     	ret
     b88: d503201f     	nop
     b8c: d503201f     	nop

0000000000000b90 <frame_dummy>:
     b90: 17ffffdc     	b	0xb00 <register_tm_clones>

0000000000000b94 <main>:
     b94: fc190fe8     	str	d8, [sp, #-0x70]!
     b98: a9017bfd     	stp	x29, x30, [sp, #0x10]
     b9c: a9026ffc     	stp	x28, x27, [sp, #0x20]
     ba0: a90367fa     	stp	x26, x25, [sp, #0x30]
     ba4: a9045ff8     	stp	x24, x23, [sp, #0x40]
     ba8: a90557f6     	stp	x22, x21, [sp, #0x50]
     bac: a9064ff4     	stp	x20, x19, [sp, #0x60]
     bb0: 910043fd     	add	x29, sp, #0x10
     bb4: aa0103f5     	mov	x21, x1
     bb8: 2a0003f6     	mov	w22, w0
     bbc: b0000000     	adrp	x0, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc0>
     bc0: 91320000     	add	x0, x0, #0xc80
     bc4: 52800801     	mov	w1, #0x40               // =64
     bc8: 52800102     	mov	w2, #0x8                // =8
     bcc: 52800203     	mov	w3, #0x10               // =16
     bd0: 52800404     	mov	w4, #0x20               // =32
     bd4: 52800213     	mov	w19, #0x10              // =16
     bd8: 52800414     	mov	w20, #0x20              // =32
     bdc: 97ffff99     	bl	0xa40 <printf@plt>
     be0: 710012df     	cmp	w22, #0x4
     be4: 5400026b     	b.lt	0xc30 <main+0x9c>
     be8: f94006a0     	ldr	x0, [x21, #0x8]
     bec: aa1f03e1     	mov	x1, xzr
     bf0: 52800142     	mov	w2, #0xa                // =10
     bf4: 97ffff6b     	bl	0x9a0 <strtol@plt>
     bf8: f9400aa8     	ldr	x8, [x21, #0x10]
     bfc: aa0003f3     	mov	x19, x0
     c00: aa1f03e1     	mov	x1, xzr
     c04: 52800142     	mov	w2, #0xa                // =10
     c08: aa0803e0     	mov	x0, x8
     c0c: 97ffff65     	bl	0x9a0 <strtol@plt>
     c10: f9400ea8     	ldr	x8, [x21, #0x18]
     c14: aa0003f4     	mov	x20, x0
     c18: aa1f03e1     	mov	x1, xzr
     c1c: 52800142     	mov	w2, #0xa                // =10
     c20: aa0803e0     	mov	x0, x8
     c24: 97ffff5f     	bl	0x9a0 <strtol@plt>
     c28: aa0003f6     	mov	x22, x0
     c2c: 14000002     	b	0xc34 <main+0xa0>
     c30: 52801016     	mov	w22, #0x80              // =128
     c34: b0000000     	adrp	x0, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc0>
     c38: 91331000     	add	x0, x0, #0xcc4
     c3c: 2a1303e1     	mov	w1, w19
     c40: 2a1403e2     	mov	w2, w20
     c44: 2a1603e3     	mov	w3, w22
     c48: 97ffff7e     	bl	0xa40 <printf@plt>
     c4c: 2f00e401     	movi	d1, #0000000000000000
     c50: 1e6e1000     	fmov	d0, #1.00000000
     c54: 2a1303e0     	mov	w0, w19
     c58: 2a1403e1     	mov	w1, w20
     c5c: 2a1603e2     	mov	w2, w22
     c60: 940000b8     	bl	0xf40 <_Z9test_gemmIdEbiiiT_S0_>
     c64: b81fc3a0     	stur	w0, [x29, #-0x4]
     c68: b0000000     	adrp	x0, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc0>
     c6c: 91384800     	add	x0, x0, #0xe12
     c70: 97ffff48     	bl	0x990 <puts@plt>
     c74: b0000008     	adrp	x8, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc0>
     c78: 1e601000     	fmov	d0, #2.00000000
     c7c: 2a1303e0     	mov	w0, w19
     c80: fd463101     	ldr	d1, [x8, #0xc60]
     c84: 2a1403e1     	mov	w1, w20
     c88: 2a1603e2     	mov	w2, w22
     c8c: 940000ad     	bl	0xf40 <_Z9test_gemmIdEbiiiT_S0_>
     c90: b9000be0     	str	w0, [sp, #0x8]
     c94: b0000000     	adrp	x0, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc0>
     c98: 9138e400     	add	x0, x0, #0xe39
     c9c: 97ffff3d     	bl	0x990 <puts@plt>
     ca0: b0000000     	adrp	x0, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc0>
     ca4: 91366c00     	add	x0, x0, #0xd9b
     ca8: b0000001     	adrp	x1, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc0>
     cac: 91351c21     	add	x1, x1, #0xd47
     cb0: 2a1303e2     	mov	w2, w19
     cb4: 2a1403e3     	mov	w3, w20
     cb8: 2a1603e4     	mov	w4, w22
     cbc: 528004c5     	mov	w5, #0x26               // =38
     cc0: 97ffff60     	bl	0xa40 <printf@plt>
     cc4: 528004c0     	mov	w0, #0x26               // =38
     cc8: 97ffff4a     	bl	0x9f0 <omp_set_num_threads@plt>
     ccc: 1b137ed7     	mul	w23, w22, w19
     cd0: d37d7ee8     	ubfiz	x8, x23, #3, #32
     cd4: 710002ff     	cmp	w23, #0x0
     cd8: da9fa100     	csinv	x0, x8, xzr, ge
     cdc: 97ffff21     	bl	0x960 <_Znam@plt>
     ce0: 1b147edc     	mul	w28, w22, w20
     ce4: aa0003f8     	mov	x24, x0
     ce8: d37d7f88     	ubfiz	x8, x28, #3, #32
     cec: 7100039f     	cmp	w28, #0x0
     cf0: da9fa100     	csinv	x0, x8, xzr, ge
     cf4: 97ffff1b     	bl	0x960 <_Znam@plt>
     cf8: 1b137e95     	mul	w21, w20, w19
     cfc: aa0003f9     	mov	x25, x0
     d00: d37d7ebb     	ubfiz	x27, x21, #3, #32
     d04: 710002bf     	cmp	w21, #0x0
     d08: da9fa360     	csinv	x0, x27, xzr, ge
     d0c: 97ffff15     	bl	0x960 <_Znam@plt>
     d10: aa0003fa     	mov	x26, x0
     d14: 710006ff     	cmp	w23, #0x1
     d18: 04bf5028     	rdvl	x8, #0x1
     d1c: 04a0e3e9     	cntw	x9
     d20: 5400050b     	b.lt	0xdc0 <main+0x22c>
     d24: eb17013f     	cmp	x9, x23
     d28: 54000069     	b.ls	0xd34 <main+0x1a0>
     d2c: aa1f03eb     	mov	x11, xzr
     d30: 1400001c     	b	0xda0 <main+0x20c>
     d34: 25d8e3e0     	ptrue	p0.d
     d38: d344fd0b     	lsr	x11, x8, #4
     d3c: 04e0e3ed     	cntd	x13
     d40: 04e14002     	index	z2.d, #0x0, #0x1
     d44: 05e039a0     	mov	z0.d, x13
     d48: aa1f03ea     	mov	x10, xzr
     d4c: 5301016c     	lsl	w12, w11, #31
     d50: 4b0b098b     	sub	w11, w12, w11, lsl #2
     d54: b000000c     	adrp	x12, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc0>
     d58: 9131a18c     	add	x12, x12, #0xc68
     d5c: 85c0e181     	ld1rd	{ z1.d }, p0/z, [x12]
     d60: 8a17016b     	and	x11, x11, x23
     d64: 0438502c     	addvl	x12, x24, #0x1
     d68: 04e00043     	add	z3.d, z2.d, z0.d
     d6c: 65d0a042     	scvtf	z2.d, p0/m, z2.s
     d70: 0420bc64     	movprfx	z4, z3
     d74: 65d0a064     	scvtf	z4.d, p0/m, z3.s
     d78: 65c10884     	fmul	z4.d, z4.d, z1.d
     d7c: 65c10842     	fmul	z2.d, z2.d, z1.d
     d80: e5ea4302     	st1d	{ z2.d }, p0, [x24, x10, lsl #3]
     d84: 04e00062     	add	z2.d, z3.d, z0.d
     d88: e5ea4184     	st1d	{ z4.d }, p0, [x12, x10, lsl #3]
     d8c: 04b0e3ea     	incw	x10
     d90: eb0a017f     	cmp	x11, x10
     d94: 54fffea1     	b.ne	0xd68 <main+0x1d4>
     d98: eb17017f     	cmp	x11, x23
     d9c: 54000120     	b.eq	0xdc0 <main+0x22c>
     da0: b000000a     	adrp	x10, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc0>
     da4: fd463540     	ldr	d0, [x10, #0xc68]
     da8: 1e620161     	scvtf	d1, w11
     dac: 1e600821     	fmul	d1, d1, d0
     db0: fc2b7b01     	str	d1, [x24, x11, lsl #3]
     db4: 9100056b     	add	x11, x11, #0x1
     db8: eb0b02ff     	cmp	x23, x11
     dbc: 54ffff61     	b.ne	0xda8 <main+0x214>
     dc0: 7100079f     	cmp	w28, #0x1
     dc4: 5400050b     	b.lt	0xe64 <main+0x2d0>
     dc8: eb1c013f     	cmp	x9, x28
     dcc: 54000069     	b.ls	0xdd8 <main+0x244>
     dd0: aa1f03e8     	mov	x8, xzr
     dd4: 1400001c     	b	0xe44 <main+0x2b0>
     dd8: 25d8e3e0     	ptrue	p0.d
     ddc: d344fd08     	lsr	x8, x8, #4
     de0: 04e0e3eb     	cntd	x11
     de4: 04e14002     	index	z2.d, #0x0, #0x1
     de8: 05e03960     	mov	z0.d, x11
     dec: aa1f03e9     	mov	x9, xzr
     df0: 5301010a     	lsl	w10, w8, #31
     df4: 4b080948     	sub	w8, w10, w8, lsl #2
     df8: b000000a     	adrp	x10, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc0>
     dfc: 9131a14a     	add	x10, x10, #0xc68
     e00: 85c0e141     	ld1rd	{ z1.d }, p0/z, [x10]
     e04: 8a1c0108     	and	x8, x8, x28
     e08: 0439502a     	addvl	x10, x25, #0x1
     e0c: 04e00043     	add	z3.d, z2.d, z0.d
     e10: 65d0a042     	scvtf	z2.d, p0/m, z2.s
     e14: 0420bc64     	movprfx	z4, z3
     e18: 65d0a064     	scvtf	z4.d, p0/m, z3.s
     e1c: 65c10884     	fmul	z4.d, z4.d, z1.d
     e20: 65c10842     	fmul	z2.d, z2.d, z1.d
     e24: e5e94322     	st1d	{ z2.d }, p0, [x25, x9, lsl #3]
     e28: 04e00062     	add	z2.d, z3.d, z0.d
     e2c: e5e94144     	st1d	{ z4.d }, p0, [x10, x9, lsl #3]
     e30: 04b0e3e9     	incw	x9
     e34: eb09011f     	cmp	x8, x9
     e38: 54fffea1     	b.ne	0xe0c <main+0x278>
     e3c: eb1c011f     	cmp	x8, x28
     e40: 54000120     	b.eq	0xe64 <main+0x2d0>
     e44: b0000009     	adrp	x9, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc0>
     e48: fd463520     	ldr	d0, [x9, #0xc68]
     e4c: 1e620101     	scvtf	d1, w8
     e50: 1e600821     	fmul	d1, d1, d0
     e54: fc287b21     	str	d1, [x25, x8, lsl #3]
     e58: 91000508     	add	x8, x8, #0x1
     e5c: eb08039f     	cmp	x28, x8
     e60: 54ffff61     	b.ne	0xe4c <main+0x2b8>
     e64: 710006bf     	cmp	w21, #0x1
     e68: 540000ab     	b.lt	0xe7c <main+0x2e8>
     e6c: aa1a03e0     	mov	x0, x26
     e70: 2a1f03e1     	mov	w1, wzr
     e74: aa1b03e2     	mov	x2, x27
     e78: 97fffece     	bl	0x9b0 <memset@plt>
     e7c: 2a1303e0     	mov	w0, w19
     e80: 2a1403e1     	mov	w1, w20
     e84: 2a1603e2     	mov	w2, w22
     e88: aa1803e3     	mov	x3, x24
     e8c: aa1903e4     	mov	x4, x25
     e90: aa1a03e5     	mov	x5, x26
     e94: 94000198     	bl	0x14f4 <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd>
     e98: 1e620261     	scvtf	d1, w19
     e9c: 1e620282     	scvtf	d2, w20
     ea0: b0000000     	adrp	x0, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc0>
     ea4: 91373800     	add	x0, x0, #0xdce
     ea8: 1e612821     	fadd	d1, d1, d1
     eac: 1e620821     	fmul	d1, d1, d2
     eb0: 1e6202c2     	scvtf	d2, w22
     eb4: 1e620821     	fmul	d1, d1, d2
     eb8: 1e601828     	fdiv	d8, d1, d0
     ebc: 1e604101     	fmov	d1, d8
     ec0: 97fffee0     	bl	0xa40 <printf@plt>
     ec4: d2e80868     	mov	x8, #0x4043000000000000 // =4630544841867001856
     ec8: b0000000     	adrp	x0, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc0>
     ecc: 9137ac00     	add	x0, x0, #0xdeb
     ed0: 9e670100     	fmov	d0, x8
     ed4: 1e601900     	fdiv	d0, d8, d0
     ed8: 97fffeda     	bl	0xa40 <printf@plt>
     edc: aa1803e0     	mov	x0, x24
     ee0: 97fffec0     	bl	0x9e0 <_ZdaPv@plt>
     ee4: aa1903e0     	mov	x0, x25
     ee8: 97fffebe     	bl	0x9e0 <_ZdaPv@plt>
     eec: aa1a03e0     	mov	x0, x26
     ef0: 97fffebc     	bl	0x9e0 <_ZdaPv@plt>
     ef4: b85fc3b3     	ldur	w19, [x29, #-0x4]
     ef8: b9400bf4     	ldr	w20, [sp, #0x8]
     efc: b0000000     	adrp	x0, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc0>
     f00: 9133a800     	add	x0, x0, #0xcea
     f04: 12000268     	and	w8, w19, #0x1
     f08: 12000289     	and	w9, w20, #0x1
     f0c: 0b080121     	add	w1, w9, w8
     f10: 97fffecc     	bl	0xa40 <printf@plt>
     f14: 0a140268     	and	w8, w19, w20
     f18: 52800029     	mov	w9, #0x1                // =1
     f1c: 0a280120     	bic	w0, w9, w8
     f20: a9464ff4     	ldp	x20, x19, [sp, #0x60]
     f24: a94557f6     	ldp	x22, x21, [sp, #0x50]
     f28: a9445ff8     	ldp	x24, x23, [sp, #0x40]
     f2c: a94367fa     	ldp	x26, x25, [sp, #0x30]
     f30: a9426ffc     	ldp	x28, x27, [sp, #0x20]
     f34: a9417bfd     	ldp	x29, x30, [sp, #0x10]
     f38: fc4707e8     	ldr	d8, [sp], #0x70
     f3c: d65f03c0     	ret

0000000000000f40 <_Z9test_gemmIdEbiiiT_S0_>:
     f40: d10243ff     	sub	sp, sp, #0x90
     f44: 6d0223e9     	stp	d9, d8, [sp, #0x20]
     f48: a9037bfd     	stp	x29, x30, [sp, #0x30]
     f4c: a9046ffc     	stp	x28, x27, [sp, #0x40]
     f50: a90567fa     	stp	x26, x25, [sp, #0x50]
     f54: a9065ff8     	stp	x24, x23, [sp, #0x60]
     f58: a90757f6     	stp	x22, x21, [sp, #0x70]
     f5c: a9084ff4     	stp	x20, x19, [sp, #0x80]
     f60: 9100c3fd     	add	x29, sp, #0x30
     f64: 2a0203f4     	mov	w20, w2
     f68: 2a0103f7     	mov	w23, w1
     f6c: 2a0003f9     	mov	w25, w0
     f70: b0000000     	adrp	x0, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc0>
     f74: 91343c00     	add	x0, x0, #0xd0f
     f78: b0000001     	adrp	x1, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc0>
     f7c: 91351c21     	add	x1, x1, #0xd47
     f80: 2a1903e2     	mov	w2, w25
     f84: 2a1703e3     	mov	w3, w23
     f88: 2a1403e4     	mov	w4, w20
     f8c: 1e604028     	fmov	d8, d1
     f90: 1e604009     	fmov	d9, d0
     f94: 97fffeab     	bl	0xa40 <printf@plt>
     f98: 528004c0     	mov	w0, #0x26               // =38
     f9c: 97fffe95     	bl	0x9f0 <omp_set_num_threads@plt>
     fa0: 1b197e88     	mul	w8, w20, w25
     fa4: d37d7d09     	ubfiz	x9, x8, #3, #32
     fa8: 7100011f     	cmp	w8, #0x0
     fac: da9fa120     	csinv	x0, x9, xzr, ge
     fb0: 97fffe6c     	bl	0x960 <_Znam@plt>
     fb4: 1b177e88     	mul	w8, w20, w23
     fb8: aa0003f3     	mov	x19, x0
     fbc: d37d7d09     	ubfiz	x9, x8, #3, #32
     fc0: 7100011f     	cmp	w8, #0x0
     fc4: da9fa120     	csinv	x0, x9, xzr, ge
     fc8: 97fffe66     	bl	0x960 <_Znam@plt>
     fcc: 1b197efb     	mul	w27, w23, w25
     fd0: aa0003fa     	mov	x26, x0
     fd4: d37d7f68     	ubfiz	x8, x27, #3, #32
     fd8: 7100037f     	cmp	w27, #0x0
     fdc: da9fa116     	csinv	x22, x8, xzr, ge
     fe0: aa1603e0     	mov	x0, x22
     fe4: 97fffe5f     	bl	0x960 <_Znam@plt>
     fe8: aa0003f5     	mov	x21, x0
     fec: aa1603e0     	mov	x0, x22
     ff0: 97fffe5c     	bl	0x960 <_Znam@plt>
     ff4: 7100069f     	cmp	w20, #0x1
     ff8: aa0003f6     	mov	x22, x0
     ffc: 540010cb     	b.lt	0x1214 <_Z9test_gemmIdEbiiiT_S0_+0x2d4>
    1000: 7100073f     	cmp	w25, #0x1
    1004: 9000000a     	adrp	x10, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc0>
    1008: 9000000b     	adrp	x11, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc0>
    100c: 9000000c     	adrp	x12, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc0>
    1010: 9131e18c     	add	x12, x12, #0xc78
    1014: 540007cb     	b.lt	0x110c <_Z9test_gemmIdEbiiiT_S0_+0x1cc>
    1018: 04bf5028     	rdvl	x8, #0x1
    101c: 25d8e3e0     	ptrue	p0.d
    1020: 04e14000     	index	z0.d, #0x0, #0x1
    1024: d344fd0d     	lsr	x13, x8, #4
    1028: 321e73e8     	mov	w8, #0x7ffffffc         // =2147483644
    102c: 2a1903f0     	mov	w16, w25
    1030: fd463943     	ldr	d3, [x10, #0xc70]
    1034: fd463d64     	ldr	d4, [x11, #0xc78]
    1038: 2a1f03ee     	mov	w14, wzr
    103c: 9b087db1     	mul	x17, x13, x8
    1040: 04e0e3e8     	cntd	x8
    1044: aa1f03ef     	mov	x15, xzr
    1048: 05e03901     	mov	z1.d, x8
    104c: 2a1403e8     	mov	w8, w20
    1050: 04a0e3e9     	cntw	x9
    1054: 85c0e182     	ld1rd	{ z2.d }, p0/z, [x12]
    1058: 8a100231     	and	x17, x17, x16
    105c: 14000004     	b	0x106c <_Z9test_gemmIdEbiiiT_S0_+0x12c>
    1060: eb0801ff     	cmp	x15, x8
    1064: 0b1901ce     	add	w14, w14, w25
    1068: 540004c0     	b.eq	0x1100 <_Z9test_gemmIdEbiiiT_S0_+0x1c0>
    106c: 910005ef     	add	x15, x15, #0x1
    1070: 8b2e4e72     	add	x18, x19, w14, uxtw #3
    1074: eb10013f     	cmp	x9, x16
    1078: 1e6201e5     	scvtf	d5, w15
    107c: 1e6308a5     	fmul	d5, d5, d3
    1080: 54000069     	b.ls	0x108c <_Z9test_gemmIdEbiiiT_S0_+0x14c>
    1084: aa1f03e0     	mov	x0, xzr
    1088: 14000016     	b	0x10e0 <_Z9test_gemmIdEbiiiT_S0_+0x1a0>
    108c: 052820a6     	mov	z6.d, d5
    1090: 04603007     	mov	z7.d, z0.d
    1094: aa1f03e0     	mov	x0, xzr
    1098: 04325021     	addvl	x1, x18, #0x1
    109c: 04e100f0     	add	z16.d, z7.d, z1.d
    10a0: 25e0c027     	add	z7.d, z7.d, #0x1        // =1
    10a4: 04e10211     	add	z17.d, z16.d, z1.d
    10a8: 25e0c030     	add	z16.d, z16.d, #0x1      // =1
    10ac: 65d0a0e7     	scvtf	z7.d, p0/m, z7.s
    10b0: 65d0a210     	scvtf	z16.d, p0/m, z16.s
    10b4: 65e68047     	fmad	z7.d, p0/m, z2.d, z6.d
    10b8: 65e68050     	fmad	z16.d, p0/m, z2.d, z6.d
    10bc: e5e04247     	st1d	{ z7.d }, p0, [x18, x0, lsl #3]
    10c0: 04713227     	mov	z7.d, z17.d
    10c4: e5e04030     	st1d	{ z16.d }, p0, [x1, x0, lsl #3]
    10c8: 04b0e3e0     	incw	x0
    10cc: eb00023f     	cmp	x17, x0
    10d0: 54fffe61     	b.ne	0x109c <_Z9test_gemmIdEbiiiT_S0_+0x15c>
    10d4: eb10023f     	cmp	x17, x16
    10d8: aa1103e0     	mov	x0, x17
    10dc: 54fffc20     	b.eq	0x1060 <_Z9test_gemmIdEbiiiT_S0_+0x120>
    10e0: 91000401     	add	x1, x0, #0x1
    10e4: 1e620026     	scvtf	d6, w1
    10e8: eb01021f     	cmp	x16, x1
    10ec: 1f4414c6     	fmadd	d6, d6, d4, d5
    10f0: fc207a46     	str	d6, [x18, x0, lsl #3]
    10f4: aa0103e0     	mov	x0, x1
    10f8: 54ffff41     	b.ne	0x10e0 <_Z9test_gemmIdEbiiiT_S0_+0x1a0>
    10fc: 17ffffd9     	b	0x1060 <_Z9test_gemmIdEbiiiT_S0_+0x120>
    1100: 710002ff     	cmp	w23, #0x0
    1104: 5400010c     	b.gt	0x1124 <_Z9test_gemmIdEbiiiT_S0_+0x1e4>
    1108: 14000088     	b	0x1328 <_Z9test_gemmIdEbiiiT_S0_+0x3e8>
    110c: 710006ff     	cmp	w23, #0x1
    1110: 540010cb     	b.lt	0x1328 <_Z9test_gemmIdEbiiiT_S0_+0x3e8>
    1114: 04bf5028     	rdvl	x8, #0x1
    1118: 04a0e3e9     	cntw	x9
    111c: d344fd0d     	lsr	x13, x8, #4
    1120: 2a1403e8     	mov	w8, w20
    1124: 25d8e3e0     	ptrue	p0.d
    1128: d37ff9b0     	lsl	x16, x13, #1
    112c: 530101b1     	lsl	w17, w13, #31
    1130: 90000012     	adrp	x18, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc0>
    1134: 9131c252     	add	x18, x18, #0xc70
    1138: 04e14002     	index	z2.d, #0x0, #0x1
    113c: 05e03a00     	mov	z0.d, x16
    1140: 4b0d0a30     	sub	w16, w17, w13, lsl #2
    1144: d37cedad     	lsl	x13, x13, #4
    1148: fd463944     	ldr	d4, [x10, #0xc70]
    114c: fd463d65     	ldr	d5, [x11, #0xc78]
    1150: 2a1f03ee     	mov	w14, wzr
    1154: aa1f03ef     	mov	x15, xzr
    1158: 85c0e241     	ld1rd	{ z1.d }, p0/z, [x18]
    115c: 85c0e183     	ld1rd	{ z3.d }, p0/z, [x12]
    1160: 2a1703ec     	mov	w12, w23
    1164: 8a0c020a     	and	x10, x16, x12
    1168: 14000004     	b	0x1178 <_Z9test_gemmIdEbiiiT_S0_+0x238>
    116c: eb0801ff     	cmp	x15, x8
    1170: 0b1701ce     	add	w14, w14, w23
    1174: 54000500     	b.eq	0x1214 <_Z9test_gemmIdEbiiiT_S0_+0x2d4>
    1178: 910005ef     	add	x15, x15, #0x1
    117c: 8b2e4f4b     	add	x11, x26, w14, uxtw #3
    1180: eb0c013f     	cmp	x9, x12
    1184: 1e6201e6     	scvtf	d6, w15
    1188: 54000069     	b.ls	0x1194 <_Z9test_gemmIdEbiiiT_S0_+0x254>
    118c: aa1f03f0     	mov	x16, xzr
    1190: 14000018     	b	0x11f0 <_Z9test_gemmIdEbiiiT_S0_+0x2b0>
    1194: 052820c7     	mov	z7.d, d6
    1198: 04623050     	mov	z16.d, z2.d
    119c: aa1f03f0     	mov	x16, xzr
    11a0: 8b0d0171     	add	x17, x11, x13
    11a4: 04e00211     	add	z17.d, z16.d, z0.d
    11a8: 25e0c030     	add	z16.d, z16.d, #0x1      // =1
    11ac: 04e00232     	add	z18.d, z17.d, z0.d
    11b0: 25e0c031     	add	z17.d, z17.d, #0x1      // =1
    11b4: 65d0a210     	scvtf	z16.d, p0/m, z16.s
    11b8: 65d0a231     	scvtf	z17.d, p0/m, z17.s
    11bc: 65c10a10     	fmul	z16.d, z16.d, z1.d
    11c0: 65c10a31     	fmul	z17.d, z17.d, z1.d
    11c4: 65e300f0     	fmla	z16.d, p0/m, z7.d, z3.d
    11c8: 65e300f1     	fmla	z17.d, p0/m, z7.d, z3.d
    11cc: e5f04170     	st1d	{ z16.d }, p0, [x11, x16, lsl #3]
    11d0: 04723250     	mov	z16.d, z18.d
    11d4: e5f04231     	st1d	{ z17.d }, p0, [x17, x16, lsl #3]
    11d8: 8b090210     	add	x16, x16, x9
    11dc: eb10015f     	cmp	x10, x16
    11e0: 54fffe21     	b.ne	0x11a4 <_Z9test_gemmIdEbiiiT_S0_+0x264>
    11e4: eb0c015f     	cmp	x10, x12
    11e8: aa0a03f0     	mov	x16, x10
    11ec: 54fffc00     	b.eq	0x116c <_Z9test_gemmIdEbiiiT_S0_+0x22c>
    11f0: 91000611     	add	x17, x16, #0x1
    11f4: 1e620227     	scvtf	d7, w17
    11f8: eb11019f     	cmp	x12, x17
    11fc: 1e6408e7     	fmul	d7, d7, d4
    1200: 1f451cc7     	fmadd	d7, d6, d5, d7
    1204: fc307967     	str	d7, [x11, x16, lsl #3]
    1208: aa1103f0     	mov	x16, x17
    120c: 54ffff21     	b.ne	0x11f0 <_Z9test_gemmIdEbiiiT_S0_+0x2b0>
    1210: 17ffffd7     	b	0x116c <_Z9test_gemmIdEbiiiT_S0_+0x22c>
    1214: 7100073f     	cmp	w25, #0x1
    1218: 5400088b     	b.lt	0x1328 <_Z9test_gemmIdEbiiiT_S0_+0x3e8>
    121c: 710006ff     	cmp	w23, #0x1
    1220: 5400084b     	b.lt	0x1328 <_Z9test_gemmIdEbiiiT_S0_+0x3e8>
    1224: b90007f4     	str	w20, [sp, #0x4]
    1228: 2a1903f4     	mov	w20, w25
    122c: 2a1703f8     	mov	w24, w23
    1230: a900ebfb     	stp	x27, x26, [sp, #0x8]
    1234: d37d7efa     	ubfiz	x26, x23, #3, #32
    1238: aa1403fc     	mov	x28, x20
    123c: f9000ff3     	str	x19, [sp, #0x18]
    1240: 2a1f03f3     	mov	w19, wzr
    1244: d37d7e7b     	ubfiz	x27, x19, #3, #32
    1248: 2a1f03e1     	mov	w1, wzr
    124c: aa1a03e2     	mov	x2, x26
    1250: 8b1b02a0     	add	x0, x21, x27
    1254: 97fffdd7     	bl	0x9b0 <memset@plt>
    1258: 8b1b02c0     	add	x0, x22, x27
    125c: 2a1f03e1     	mov	w1, wzr
    1260: aa1a03e2     	mov	x2, x26
    1264: 97fffdd3     	bl	0x9b0 <memset@plt>
    1268: f100079c     	subs	x28, x28, #0x1
    126c: 0b170273     	add	w19, w19, w23
    1270: 54fffea1     	b.ne	0x1244 <_Z9test_gemmIdEbiiiT_S0_+0x304>
    1274: a9414ffa     	ldp	x26, x19, [sp, #0x10]
    1278: 1e604120     	fmov	d0, d9
    127c: 1e604101     	fmov	d1, d8
    1280: 2a1903e0     	mov	w0, w25
    1284: b94007f9     	ldr	w25, [sp, #0x4]
    1288: 2a1703e1     	mov	w1, w23
    128c: aa1503e5     	mov	x5, x21
    1290: 2a1903e2     	mov	w2, w25
    1294: aa1303e3     	mov	x3, x19
    1298: aa1a03e4     	mov	x4, x26
    129c: 9400022f     	bl	0x1b58 <_ZN4gemmIdE12compute_testEiiiPKdS2_Pddd>
    12a0: 7100033f     	cmp	w25, #0x0
    12a4: 54000d6d     	b.le	0x1450 <_Z9test_gemmIdEbiiiT_S0_+0x510>
    12a8: d37df309     	lsl	x9, x24, #3
    12ac: d37df28a     	lsl	x10, x20, #3
    12b0: f94007fb     	ldr	x27, [sp, #0x8]
    12b4: aa1f03e8     	mov	x8, xzr
    12b8: 2a1903eb     	mov	w11, w25
    12bc: aa1303ec     	mov	x12, x19
    12c0: 9b187d0e     	mul	x14, x8, x24
    12c4: aa1f03ed     	mov	x13, xzr
    12c8: aa1a03ef     	mov	x15, x26
    12cc: 8b0e0ece     	add	x14, x22, x14, lsl #3
    12d0: 2f00e400     	movi	d0, #0000000000000000
    12d4: aa0c03f0     	mov	x16, x12
    12d8: aa0f03f1     	mov	x17, x15
    12dc: aa0b03f2     	mov	x18, x11
    12e0: fd400201     	ldr	d1, [x16]
    12e4: fd400222     	ldr	d2, [x17]
    12e8: f1000652     	subs	x18, x18, #0x1
    12ec: 8b090231     	add	x17, x17, x9
    12f0: 8b0a0210     	add	x16, x16, x10
    12f4: 1f420020     	fmadd	d0, d1, d2, d0
    12f8: 54ffff41     	b.ne	0x12e0 <_Z9test_gemmIdEbiiiT_S0_+0x3a0>
    12fc: 1f402120     	fmadd	d0, d9, d0, d8
    1300: 910021ef     	add	x15, x15, #0x8
    1304: fc2d79c0     	str	d0, [x14, x13, lsl #3]
    1308: 910005ad     	add	x13, x13, #0x1
    130c: eb1801bf     	cmp	x13, x24
    1310: 54fffe01     	b.ne	0x12d0 <_Z9test_gemmIdEbiiiT_S0_+0x390>
    1314: 91000508     	add	x8, x8, #0x1
    1318: 9100218c     	add	x12, x12, #0x8
    131c: eb14011f     	cmp	x8, x20
    1320: 54fffd01     	b.ne	0x12c0 <_Z9test_gemmIdEbiiiT_S0_+0x380>
    1324: 1400000a     	b	0x134c <_Z9test_gemmIdEbiiiT_S0_+0x40c>
    1328: 1e604120     	fmov	d0, d9
    132c: 1e604101     	fmov	d1, d8
    1330: 2a1903e0     	mov	w0, w25
    1334: 2a1703e1     	mov	w1, w23
    1338: 2a1403e2     	mov	w2, w20
    133c: aa1303e3     	mov	x3, x19
    1340: aa1a03e4     	mov	x4, x26
    1344: aa1503e5     	mov	x5, x21
    1348: 94000204     	bl	0x1b58 <_ZN4gemmIdE12compute_testEiiiPKdS2_Pddd>
    134c: 7100077f     	cmp	w27, #0x1
    1350: 5400044b     	b.lt	0x13d8 <_Z9test_gemmIdEbiiiT_S0_+0x498>
    1354: 2f00e400     	movi	d0, #0000000000000000
    1358: 90000009     	adrp	x9, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc0>
    135c: aa1f03e8     	mov	x8, xzr
    1360: fd463521     	ldr	d1, [x9, #0xc68]
    1364: 52800029     	mov	w9, #0x1                // =1
    1368: 12800001     	mov	w1, #-0x1               // =-1
    136c: 1400000c     	b	0x139c <_Z9test_gemmIdEbiiiT_S0_+0x45c>
    1370: 1e602040     	fcmp	d2, d0
    1374: 1e60cc42     	fcsel	d2, d2, d0, gt
    1378: 1a81c10a     	csel	w10, w8, w1, gt
    137c: 1e612080     	fcmp	d4, d1
    1380: 91000508     	add	x8, x8, #0x1
    1384: 1a9fc7eb     	cset	w11, le
    1388: 1a8ad021     	csel	w1, w1, w10, le
    138c: 1e62dc00     	fcsel	d0, d0, d2, le
    1390: eb08037f     	cmp	x27, x8
    1394: 0a090169     	and	w9, w11, w9
    1398: 540001e0     	b.eq	0x13d4 <_Z9test_gemmIdEbiiiT_S0_+0x494>
    139c: d37df10a     	lsl	x10, x8, #3
    13a0: fc6a6aa2     	ldr	d2, [x21, x10]
    13a4: fc6a6ac3     	ldr	d3, [x22, x10]
    13a8: 1e633844     	fsub	d4, d2, d3
    13ac: 1e623865     	fsub	d5, d3, d2
    13b0: 1e632040     	fcmp	d2, d3
    13b4: 1e65cc82     	fcsel	d2, d4, d5, gt
    13b8: 1e602068     	fcmp	d3, #0.0
    13bc: 1e604044     	fmov	d4, d2
    13c0: 54fffd80     	b.eq	0x1370 <_Z9test_gemmIdEbiiiT_S0_+0x430>
    13c4: 1e614064     	fneg	d4, d3
    13c8: 1e64cc63     	fcsel	d3, d3, d4, gt
    13cc: 1e631844     	fdiv	d4, d2, d3
    13d0: 17ffffe8     	b	0x1370 <_Z9test_gemmIdEbiiiT_S0_+0x430>
    13d4: 360000c9     	tbz	w9, #0x0, 0x13ec <_Z9test_gemmIdEbiiiT_S0_+0x4ac>
    13d8: 90000000     	adrp	x0, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc0>
    13dc: 91393400     	add	x0, x0, #0xe4d
    13e0: 97fffd6c     	bl	0x990 <puts@plt>
    13e4: 52800037     	mov	w23, #0x1               // =1
    13e8: 14000008     	b	0x1408 <_Z9test_gemmIdEbiiiT_S0_+0x4c8>
    13ec: 937d7c28     	sbfiz	x8, x1, #3, #32
    13f0: 90000000     	adrp	x0, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc0>
    13f4: 91353800     	add	x0, x0, #0xd4e
    13f8: fc686aa1     	ldr	d1, [x21, x8]
    13fc: fc686ac2     	ldr	d2, [x22, x8]
    1400: 97fffd90     	bl	0xa40 <printf@plt>
    1404: 2a1f03f7     	mov	w23, wzr
    1408: aa1303e0     	mov	x0, x19
    140c: 97fffd75     	bl	0x9e0 <_ZdaPv@plt>
    1410: aa1a03e0     	mov	x0, x26
    1414: 97fffd73     	bl	0x9e0 <_ZdaPv@plt>
    1418: aa1503e0     	mov	x0, x21
    141c: 97fffd71     	bl	0x9e0 <_ZdaPv@plt>
    1420: aa1603e0     	mov	x0, x22
    1424: 97fffd6f     	bl	0x9e0 <_ZdaPv@plt>
    1428: 2a1703e0     	mov	w0, w23
    142c: a9484ff4     	ldp	x20, x19, [sp, #0x80]
    1430: a94757f6     	ldp	x22, x21, [sp, #0x70]
    1434: a9465ff8     	ldp	x24, x23, [sp, #0x60]
    1438: a94567fa     	ldp	x26, x25, [sp, #0x50]
    143c: a9446ffc     	ldp	x28, x27, [sp, #0x40]
    1440: a9437bfd     	ldp	x29, x30, [sp, #0x30]
    1444: 6d4223e9     	ldp	d9, d8, [sp, #0x20]
    1448: 910243ff     	add	sp, sp, #0x90
    144c: d65f03c0     	ret
    1450: 2f00e400     	movi	d0, #0000000000000000
    1454: 04bf502a     	rdvl	x10, #0x1
    1458: 321e73eb     	mov	w11, #0x7ffffffc        // =2147483644
    145c: d344fd4a     	lsr	x10, x10, #4
    1460: 25d8e3e0     	ptrue	p0.d
    1464: f94007fb     	ldr	x27, [sp, #0x8]
    1468: 2a1f03e8     	mov	w8, wzr
    146c: aa1f03e9     	mov	x9, xzr
    1470: 9b0b7d4b     	mul	x11, x10, x11
    1474: 04a0e3ea     	cntw	x10
    1478: 1f402120     	fmadd	d0, d9, d0, d8
    147c: 05282001     	mov	z1.d, d0
    1480: 8a18016b     	and	x11, x11, x24
    1484: 14000005     	b	0x1498 <_Z9test_gemmIdEbiiiT_S0_+0x558>
    1488: 91000529     	add	x9, x9, #0x1
    148c: 0b170108     	add	w8, w8, w23
    1490: eb14013f     	cmp	x9, x20
    1494: 54fff5c0     	b.eq	0x134c <_Z9test_gemmIdEbiiiT_S0_+0x40c>
    1498: d37d7d0c     	ubfiz	x12, x8, #3, #32
    149c: eb18015f     	cmp	x10, x24
    14a0: 54000069     	b.ls	0x14ac <_Z9test_gemmIdEbiiiT_S0_+0x56c>
    14a4: aa1f03ed     	mov	x13, xzr
    14a8: 1400000c     	b	0x14d8 <_Z9test_gemmIdEbiiiT_S0_+0x598>
    14ac: 8b0c02ce     	add	x14, x22, x12
    14b0: aa1f03ed     	mov	x13, xzr
    14b4: 042e502f     	addvl	x15, x14, #0x1
    14b8: e5ed41c1     	st1d	{ z1.d }, p0, [x14, x13, lsl #3]
    14bc: e5ed41e1     	st1d	{ z1.d }, p0, [x15, x13, lsl #3]
    14c0: 04b0e3ed     	incw	x13
    14c4: eb0d017f     	cmp	x11, x13
    14c8: 54ffff81     	b.ne	0x14b8 <_Z9test_gemmIdEbiiiT_S0_+0x578>
    14cc: eb18017f     	cmp	x11, x24
    14d0: aa0b03ed     	mov	x13, x11
    14d4: 54fffda0     	b.eq	0x1488 <_Z9test_gemmIdEbiiiT_S0_+0x548>
    14d8: 8b0d0d8e     	add	x14, x12, x13, lsl #3
    14dc: cb0d030c     	sub	x12, x24, x13
    14e0: 8b0e02cd     	add	x13, x22, x14
    14e4: f100058c     	subs	x12, x12, #0x1
    14e8: fc0085a0     	str	d0, [x13], #0x8
    14ec: 54ffffc1     	b.ne	0x14e4 <_Z9test_gemmIdEbiiiT_S0_+0x5a4>
    14f0: 17ffffe6     	b	0x1488 <_Z9test_gemmIdEbiiiT_S0_+0x548>

00000000000014f4 <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd>:
    14f4: 6db63bef     	stp	d15, d14, [sp, #-0xa0]!
    14f8: 6d0133ed     	stp	d13, d12, [sp, #0x10]
    14fc: 6d022beb     	stp	d11, d10, [sp, #0x20]
    1500: 6d0323e9     	stp	d9, d8, [sp, #0x30]
    1504: a9047bfd     	stp	x29, x30, [sp, #0x40]
    1508: a9056ffc     	stp	x28, x27, [sp, #0x50]
    150c: a90667fa     	stp	x26, x25, [sp, #0x60]
    1510: a9075ff8     	stp	x24, x23, [sp, #0x70]
    1514: a90857f6     	stp	x22, x21, [sp, #0x80]
    1518: a9094ff4     	stp	x20, x19, [sp, #0x90]
    151c: 910103fd     	add	x29, sp, #0x40
    1520: d10203ff     	sub	sp, sp, #0x80
    1524: 043f5fff     	addsvl	sp, sp, #-0x1
    1528: aa0503f3     	mov	x19, x5
    152c: aa0403f4     	mov	x20, x4
    1530: aa0303f5     	mov	x21, x3
    1534: 2a0203f6     	mov	w22, w2
    1538: 2a0103f7     	mov	w23, w1
    153c: 2a0003f8     	mov	w24, w0
    1540: d503437f     	smstart	sm
    1544: 25d8e3e0     	ptrue	p0.d
    1548: 52800208     	mov	w8, #0x10               // =16
    154c: 910143e9     	add	x9, sp, #0x50
    1550: 1ac80c1c     	sdiv	w28, w0, w8
    1554: 52800408     	mov	w8, #0x20               // =32
    1558: d10103ba     	sub	x26, x29, #0x40
    155c: 047a5ffa     	addspl	x26, x26, #-0x1
    1560: 290f03e1     	stp	w1, w0, [sp, #0x78]
    1564: b0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xff08>
    1568: 91360000     	add	x0, x0, #0xd80
    156c: b90077e2     	str	w2, [sp, #0x74]
    1570: 90000002     	adrp	x2, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc0>
    1574: 911b2042     	add	x2, x2, #0x6c8
    1578: a9060fe4     	stp	x4, x3, [sp, #0x60]
    157c: f90027ff     	str	xzr, [sp, #0x48]
    1580: 1ac80c39     	sdiv	w25, w1, w8
    1584: d10103a8     	sub	x8, x29, #0x40
    1588: e5bf1900     	str	p0, [x8, #-0x2, mul vl]
    158c: d2e7fe08     	mov	x8, #0x3ff0000000000000 // =4607182418800017408
    1590: a90517e8     	stp	x8, x5, [sp, #0x50]
    1594: d10103a8     	sub	x8, x29, #0x40
    1598: e5bf1d00     	str	p0, [x8, #-0x1, mul vl]
    159c: 910123e8     	add	x8, sp, #0x48
    15a0: a90223e9     	stp	x9, x8, [sp, #0x20]
    15a4: 910163e8     	add	x8, sp, #0x58
    15a8: 9101e3e9     	add	x9, sp, #0x78
    15ac: a90123e9     	stp	x9, x8, [sp, #0x10]
    15b0: 9101f3e8     	add	x8, sp, #0x7c
    15b4: a90023fa     	stp	x26, x8, [sp]
    15b8: 290873f9     	stp	w25, w28, [sp, #0x40]
    15bc: d503427f     	smstop	sm
    15c0: 910113e3     	add	x3, sp, #0x44
    15c4: 910103e4     	add	x4, sp, #0x40
    15c8: 9101a3e5     	add	x5, sp, #0x68
    15cc: 910183e6     	add	x6, sp, #0x60
    15d0: 9101d3e7     	add	x7, sp, #0x74
    15d4: 52800161     	mov	w1, #0xb                // =11
    15d8: 97fffd12     	bl	0xa20 <__kmpc_fork_call@plt>
    15dc: d503437f     	smstart	sm
    15e0: d503427f     	smstop	sm
    15e4: 97fffce7     	bl	0x980 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
    15e8: aa0003fb     	mov	x27, x0
    15ec: d503437f     	smstart	sm
    15f0: d2e7fe08     	mov	x8, #0x3ff0000000000000 // =4607182418800017408
    15f4: 290f63f7     	stp	w23, w24, [sp, #0x78]
    15f8: a9054fe8     	stp	x8, x19, [sp, #0x50]
    15fc: d10103a8     	sub	x8, x29, #0x40
    1600: 85bf1900     	ldr	p0, [x8, #-0x2, mul vl]
    1604: b90077f6     	str	w22, [sp, #0x74]
    1608: a90657f4     	stp	x20, x21, [sp, #0x60]
    160c: e5bf1d00     	str	p0, [x8, #-0x1, mul vl]
    1610: 910123e8     	add	x8, sp, #0x48
    1614: f90017e8     	str	x8, [sp, #0x28]
    1618: 910143e8     	add	x8, sp, #0x50
    161c: f90013e8     	str	x8, [sp, #0x20]
    1620: 910163e8     	add	x8, sp, #0x58
    1624: f9000fe8     	str	x8, [sp, #0x18]
    1628: 9101e3e8     	add	x8, sp, #0x78
    162c: f9000be8     	str	x8, [sp, #0x10]
    1630: 9101f3e8     	add	x8, sp, #0x7c
    1634: f90027ff     	str	xzr, [sp, #0x48]
    1638: 290873f9     	stp	w25, w28, [sp, #0x40]
    163c: a90023fa     	stp	x26, x8, [sp]
    1640: d503427f     	smstop	sm
    1644: 910113e3     	add	x3, sp, #0x44
    1648: 910103e4     	add	x4, sp, #0x40
    164c: 9101a3e5     	add	x5, sp, #0x68
    1650: 910183e6     	add	x6, sp, #0x60
    1654: 9101d3e7     	add	x7, sp, #0x74
    1658: b0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xff08>
    165c: 91360000     	add	x0, x0, #0xd80
    1660: 52800161     	mov	w1, #0xb                // =11
    1664: 90000002     	adrp	x2, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc0>
    1668: 911b2042     	add	x2, x2, #0x6c8
    166c: 97fffced     	bl	0xa20 <__kmpc_fork_call@plt>
    1670: d503437f     	smstart	sm
    1674: d503427f     	smstop	sm
    1678: 97fffcc2     	bl	0x980 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
    167c: d503437f     	smstart	sm
    1680: cb1b0008     	sub	x8, x0, x27
    1684: 9e620100     	scvtf	d0, x8
    1688: fd001fe0     	str	d0, [sp, #0x38]
    168c: d503427f     	smstop	sm
    1690: fd401fe0     	ldr	d0, [sp, #0x38]
    1694: 043f583f     	addsvl	sp, sp, #0x1
    1698: 910203ff     	add	sp, sp, #0x80
    169c: a9494ff4     	ldp	x20, x19, [sp, #0x90]
    16a0: a94857f6     	ldp	x22, x21, [sp, #0x80]
    16a4: a9475ff8     	ldp	x24, x23, [sp, #0x70]
    16a8: a94667fa     	ldp	x26, x25, [sp, #0x60]
    16ac: a9456ffc     	ldp	x28, x27, [sp, #0x50]
    16b0: a9447bfd     	ldp	x29, x30, [sp, #0x40]
    16b4: 6d4323e9     	ldp	d9, d8, [sp, #0x30]
    16b8: 6d422beb     	ldp	d11, d10, [sp, #0x20]
    16bc: 6d4133ed     	ldp	d13, d12, [sp, #0x10]
    16c0: 6cca3bef     	ldp	d15, d14, [sp], #0xa0
    16c4: d65f03c0     	ret

00000000000016c8 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined>:
    16c8: a9bb7bfd     	stp	x29, x30, [sp, #-0x50]!
    16cc: a90167fc     	stp	x28, x25, [sp, #0x10]
    16d0: a9025ff8     	stp	x24, x23, [sp, #0x20]
    16d4: a90357f6     	stp	x22, x21, [sp, #0x30]
    16d8: a9044ff4     	stp	x20, x19, [sp, #0x40]
    16dc: 910003fd     	mov	x29, sp
    16e0: d10083ff     	sub	sp, sp, #0x20
    16e4: 043f57ff     	addvl	sp, sp, #-0x1
    16e8: b9400048     	ldr	w8, [x2]
    16ec: 71000519     	subs	w25, w8, #0x1
    16f0: 5400224b     	b.lt	0x1b38 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x470>
    16f4: b9400018     	ldr	w24, [x0]
    16f8: aa0703f3     	mov	x19, x7
    16fc: aa0603f4     	mov	x20, x6
    1700: aa0503f5     	mov	x21, x5
    1704: aa0403f6     	mov	x22, x4
    1708: aa0303f7     	mov	x23, x3
    170c: 52800028     	mov	w8, #0x1                // =1
    1710: b0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xff08>
    1714: 9135a000     	add	x0, x0, #0xd68
    1718: 910043e3     	add	x3, sp, #0x10
    171c: 910073e4     	add	x4, sp, #0x1c
    1720: 910063e5     	add	x5, sp, #0x18
    1724: 910053e6     	add	x6, sp, #0x14
    1728: 2a1803e1     	mov	w1, w24
    172c: 52800442     	mov	w2, #0x22               // =34
    1730: 52800027     	mov	w7, #0x1                // =1
    1734: 29037ff9     	stp	w25, wzr, [sp, #0x18]
    1738: 290223ff     	stp	wzr, w8, [sp, #0x10]
    173c: b90003e8     	str	w8, [sp]
    1740: 97fffcb0     	bl	0xa00 <__kmpc_for_static_init_4@plt>
    1744: 294323e9     	ldp	w9, w8, [sp, #0x18]
    1748: 93407d08     	sxtw	x8, w8
    174c: 6b19013f     	cmp	w9, w25
    1750: 1a99b12e     	csel	w14, w9, w25, lt
    1754: 6b0e011f     	cmp	w8, w14
    1758: b9001bee     	str	w14, [sp, #0x18]
    175c: 54001e6c     	b.gt	0x1b28 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x460>
    1760: b94002f0     	ldr	w16, [x23]
    1764: 7100061f     	cmp	w16, #0x1
    1768: 54001e0b     	b.lt	0x1b28 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x460>
    176c: 25d8e3e0     	ptrue	p0.d
    1770: a946a7aa     	ldp	x10, x9, [x29, #0x68]
    1774: 25f8c000     	mov	z0.d, #0x0              // =0
    1778: a945afac     	ldp	x12, x11, [x29, #0x58]
    177c: f9402bad     	ldr	x13, [x29, #0x50]
    1780: 14000004     	b	0x1790 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xc8>
    1784: eb2ec11f     	cmp	x8, w14, sxtw
    1788: 91000508     	add	x8, x8, #0x1
    178c: 54001cea     	b.ge	0x1b28 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x460>
    1790: 7100061f     	cmp	w16, #0x1
    1794: 54ffff8b     	b.lt	0x1784 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xbc>
    1798: 531c6d0e     	lsl	w14, w8, #4
    179c: aa1f03ef     	mov	x15, xzr
    17a0: 93407dc2     	sxtw	x2, w14
    17a4: c00800ff     	zero	{za}
    17a8: b940028e     	ldr	w14, [x20]
    17ac: 531b69f0     	lsl	w16, w15, #5
    17b0: 710001df     	cmp	w14, #0x0
    17b4: 540010ed     	b.le	0x19d0 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x308>
    17b8: 85800262     	ldr	p2, [x19]
    17bc: f94002ae     	ldr	x14, [x21]
    17c0: f94002d2     	ldr	x18, [x22]
    17c4: b9400191     	ldr	w17, [x12]
    17c8: 2a1f03e1     	mov	w1, wzr
    17cc: 85800261     	ldr	p1, [x19]
    17d0: 85800264     	ldr	p4, [x19]
    17d4: 8b100dce     	add	x14, x14, x16, lsl #3
    17d8: 8b020e44     	add	x4, x18, x2, lsl #3
    17dc: e5bf1fa2     	str	p2, [x29, #-0x1, mul vl]
    17e0: 93407e32     	sxtw	x18, w17
    17e4: b9400280     	ldr	w0, [x20]
    17e8: 85800262     	ldr	p2, [x19]
    17ec: 85800265     	ldr	p5, [x19]
    17f0: 85800266     	ldr	p6, [x19]
    17f4: e5bf1ba2     	str	p2, [x29, #-0x2, mul vl]
    17f8: 85800267     	ldr	p7, [x19]
    17fc: 85800262     	ldr	p2, [x19]
    1800: a5e0a491     	ld1d	{ z17.d }, p1/z, [x4]
    1804: a5e0a5d2     	ld1d	{ z18.d }, p1/z, [x14]
    1808: 11000423     	add	w3, w1, #0x1
    180c: a5e1a5d3     	ld1d	{ z19.d }, p1/z, [x14, #0x1, mul vl]
    1810: a5e2a5d4     	ld1d	{ z20.d }, p1/z, [x14, #0x2, mul vl]
    1814: 6b00007f     	cmp	w3, w0
    1818: a5e1a495     	ld1d	{ z21.d }, p1/z, [x4, #0x1, mul vl]
    181c: a5e3a5d6     	ld1d	{ z22.d }, p1/z, [x14, #0x3, mul vl]
    1820: 80d22620     	fmopa	za0.d, p1/m, p1/m, z17.d, z18.d
    1824: 85bf1fa3     	ldr	p3, [x29, #-0x1, mul vl]
    1828: 80d36e21     	fmopa	za1.d, p3/m, p3/m, z17.d, z19.d
    182c: 85bf1ba3     	ldr	p3, [x29, #-0x2, mul vl]
    1830: 80d46e22     	fmopa	za2.d, p3/m, p3/m, z17.d, z20.d
    1834: 80d69223     	fmopa	za3.d, p4/m, p4/m, z17.d, z22.d
    1838: 80d2b6a4     	fmopa	za4.d, p5/m, p5/m, z21.d, z18.d
    183c: 80d3daa5     	fmopa	za5.d, p6/m, p6/m, z21.d, z19.d
    1840: 80d4fea6     	fmopa	za6.d, p7/m, p7/m, z21.d, z20.d
    1844: 80d64aa7     	fmopa	za7.d, p2/m, p2/m, z21.d, z22.d
    1848: 54000caa     	b.ge	0x19dc <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x314>
    184c: 85800263     	ldr	p3, [x19]
    1850: b98001a6     	ldrsw	x6, [x13]
    1854: 8b120dc3     	add	x3, x14, x18, lsl #3
    1858: 8b060c85     	add	x5, x4, x6, lsl #3
    185c: a5e64c91     	ld1d	{ z17.d }, p3/z, [x4, x6, lsl #3]
    1860: a5f24dd2     	ld1d	{ z18.d }, p3/z, [x14, x18, lsl #3]
    1864: a5e1ac74     	ld1d	{ z20.d }, p3/z, [x3, #0x1, mul vl]
    1868: a5e1acb3     	ld1d	{ z19.d }, p3/z, [x5, #0x1, mul vl]
    186c: a5e2ac75     	ld1d	{ z21.d }, p3/z, [x3, #0x2, mul vl]
    1870: a5e3ac76     	ld1d	{ z22.d }, p3/z, [x3, #0x3, mul vl]
    1874: 11000826     	add	w6, w1, #0x2
    1878: 80d26e20     	fmopa	za0.d, p3/m, p3/m, z17.d, z18.d
    187c: 85800263     	ldr	p3, [x19]
    1880: 80d46e21     	fmopa	za1.d, p3/m, p3/m, z17.d, z20.d
    1884: 85800263     	ldr	p3, [x19]
    1888: 80d56e22     	fmopa	za2.d, p3/m, p3/m, z17.d, z21.d
    188c: 85800263     	ldr	p3, [x19]
    1890: 80d66e23     	fmopa	za3.d, p3/m, p3/m, z17.d, z22.d
    1894: 85800263     	ldr	p3, [x19]
    1898: 80d26e64     	fmopa	za4.d, p3/m, p3/m, z19.d, z18.d
    189c: 85800263     	ldr	p3, [x19]
    18a0: 80d46e65     	fmopa	za5.d, p3/m, p3/m, z19.d, z20.d
    18a4: 85800263     	ldr	p3, [x19]
    18a8: 80d56e66     	fmopa	za6.d, p3/m, p3/m, z19.d, z21.d
    18ac: 85800263     	ldr	p3, [x19]
    18b0: 80d66e67     	fmopa	za7.d, p3/m, p3/m, z19.d, z22.d
    18b4: b9400284     	ldr	w4, [x20]
    18b8: b940018e     	ldr	w14, [x12]
    18bc: 6b0400df     	cmp	w6, w4
    18c0: 540008ca     	b.ge	0x19d8 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x310>
    18c4: 85800263     	ldr	p3, [x19]
    18c8: 93407dc6     	sxtw	x6, w14
    18cc: b98001a7     	ldrsw	x7, [x13]
    18d0: 8b060c6e     	add	x14, x3, x6, lsl #3
    18d4: 8b070ca4     	add	x4, x5, x7, lsl #3
    18d8: a5e74cb1     	ld1d	{ z17.d }, p3/z, [x5, x7, lsl #3]
    18dc: a5e64c72     	ld1d	{ z18.d }, p3/z, [x3, x6, lsl #3]
    18e0: 11000c26     	add	w6, w1, #0x3
    18e4: a5e1ac93     	ld1d	{ z19.d }, p3/z, [x4, #0x1, mul vl]
    18e8: a5e1add4     	ld1d	{ z20.d }, p3/z, [x14, #0x1, mul vl]
    18ec: a5e2add5     	ld1d	{ z21.d }, p3/z, [x14, #0x2, mul vl]
    18f0: a5e3add6     	ld1d	{ z22.d }, p3/z, [x14, #0x3, mul vl]
    18f4: 80d26e20     	fmopa	za0.d, p3/m, p3/m, z17.d, z18.d
    18f8: 85800263     	ldr	p3, [x19]
    18fc: 80d46e21     	fmopa	za1.d, p3/m, p3/m, z17.d, z20.d
    1900: 85800263     	ldr	p3, [x19]
    1904: 80d56e22     	fmopa	za2.d, p3/m, p3/m, z17.d, z21.d
    1908: 85800263     	ldr	p3, [x19]
    190c: 80d66e23     	fmopa	za3.d, p3/m, p3/m, z17.d, z22.d
    1910: 85800263     	ldr	p3, [x19]
    1914: 80d26e64     	fmopa	za4.d, p3/m, p3/m, z19.d, z18.d
    1918: 85800263     	ldr	p3, [x19]
    191c: 80d46e65     	fmopa	za5.d, p3/m, p3/m, z19.d, z20.d
    1920: 85800263     	ldr	p3, [x19]
    1924: 80d56e66     	fmopa	za6.d, p3/m, p3/m, z19.d, z21.d
    1928: 85800263     	ldr	p3, [x19]
    192c: 80d66e67     	fmopa	za7.d, p3/m, p3/m, z19.d, z22.d
    1930: b9400285     	ldr	w5, [x20]
    1934: b9400183     	ldr	w3, [x12]
    1938: 6b0500df     	cmp	w6, w5
    193c: 5400046a     	b.ge	0x19c8 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x300>
    1940: 85800263     	ldr	p3, [x19]
    1944: 93407c63     	sxtw	x3, w3
    1948: b98001a5     	ldrsw	x5, [x13]
    194c: 11001021     	add	w1, w1, #0x4
    1950: 8b030dc6     	add	x6, x14, x3, lsl #3
    1954: 8b050c87     	add	x7, x4, x5, lsl #3
    1958: a5e54c91     	ld1d	{ z17.d }, p3/z, [x4, x5, lsl #3]
    195c: a5e34dd2     	ld1d	{ z18.d }, p3/z, [x14, x3, lsl #3]
    1960: a5e1acf3     	ld1d	{ z19.d }, p3/z, [x7, #0x1, mul vl]
    1964: a5e1acd4     	ld1d	{ z20.d }, p3/z, [x6, #0x1, mul vl]
    1968: a5e2acd5     	ld1d	{ z21.d }, p3/z, [x6, #0x2, mul vl]
    196c: a5e3acd6     	ld1d	{ z22.d }, p3/z, [x6, #0x3, mul vl]
    1970: 80d26e20     	fmopa	za0.d, p3/m, p3/m, z17.d, z18.d
    1974: 85800263     	ldr	p3, [x19]
    1978: 80d46e21     	fmopa	za1.d, p3/m, p3/m, z17.d, z20.d
    197c: 85800263     	ldr	p3, [x19]
    1980: 80d56e22     	fmopa	za2.d, p3/m, p3/m, z17.d, z21.d
    1984: 85800263     	ldr	p3, [x19]
    1988: 80d66e23     	fmopa	za3.d, p3/m, p3/m, z17.d, z22.d
    198c: 85800263     	ldr	p3, [x19]
    1990: 80d26e64     	fmopa	za4.d, p3/m, p3/m, z19.d, z18.d
    1994: 85800263     	ldr	p3, [x19]
    1998: 80d46e65     	fmopa	za5.d, p3/m, p3/m, z19.d, z20.d
    199c: 85800263     	ldr	p3, [x19]
    19a0: 80d56e66     	fmopa	za6.d, p3/m, p3/m, z19.d, z21.d
    19a4: 85800263     	ldr	p3, [x19]
    19a8: 80d66e67     	fmopa	za7.d, p3/m, p3/m, z19.d, z22.d
    19ac: b98001ae     	ldrsw	x14, [x13]
    19b0: b9800183     	ldrsw	x3, [x12]
    19b4: b9400285     	ldr	w5, [x20]
    19b8: 8b0e0ce4     	add	x4, x7, x14, lsl #3
    19bc: 8b030cce     	add	x14, x6, x3, lsl #3
    19c0: 6b05003f     	cmp	w1, w5
    19c4: 54fff1eb     	b.lt	0x1800 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x138>
    19c8: 2a0303f1     	mov	w17, w3
    19cc: 14000004     	b	0x19dc <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x314>
    19d0: b9400191     	ldr	w17, [x12]
    19d4: 14000002     	b	0x19dc <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x314>
    19d8: 2a0e03f1     	mov	w17, w14
    19dc: 1b027e2e     	mul	w14, w17, w2
    19e0: f9400171     	ldr	x17, [x11]
    19e4: 85800261     	ldr	p1, [x19]
    19e8: 8b2ece2e     	add	x14, x17, w14, sxtw #3
    19ec: 8b100dd0     	add	x16, x14, x16, lsl #3
    19f0: 2a1f03ee     	mov	w14, wzr
    19f4: c0c24407     	mov	z7.d, p1/m, za0h.d[w14, 0]
    19f8: 85800261     	ldr	p1, [x19]
    19fc: c0c24445     	mov	z5.d, p1/m, za1h.d[w14, 0]
    1a00: 85800261     	ldr	p1, [x19]
    1a04: c0c24483     	mov	z3.d, p1/m, za2h.d[w14, 0]
    1a08: 85800261     	ldr	p1, [x19]
    1a0c: c0c244c1     	mov	z1.d, p1/m, za3h.d[w14, 0]
    1a10: 110005ce     	add	w14, w14, #0x1
    1a14: 85800261     	ldr	p1, [x19]
    1a18: 85c0e151     	ld1rd	{ z17.d }, p0/z, [x10]
    1a1c: b9800191     	ldrsw	x17, [x12]
    1a20: 710021df     	cmp	w14, #0x8
    1a24: 05e0c4e7     	sel	z7.d, p1, z7.d, z0.d
    1a28: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1a2c: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1a30: 05e0c421     	sel	z1.d, p1, z1.d, z0.d
    1a34: 65ca8627     	fmulx	z7.d, p1/m, z7.d, z17.d
    1a38: 65ca8625     	fmulx	z5.d, p1/m, z5.d, z17.d
    1a3c: 65ca8623     	fmulx	z3.d, p1/m, z3.d, z17.d
    1a40: 65ca8621     	fmulx	z1.d, p1/m, z1.d, z17.d
    1a44: 85c0e131     	ld1rd	{ z17.d }, p0/z, [x9]
    1a48: 05e0c4e7     	sel	z7.d, p1, z7.d, z0.d
    1a4c: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1a50: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1a54: 05e0c421     	sel	z1.d, p1, z1.d, z0.d
    1a58: 65c08627     	fadd	z7.d, p1/m, z7.d, z17.d
    1a5c: 65c08625     	fadd	z5.d, p1/m, z5.d, z17.d
    1a60: 65c08623     	fadd	z3.d, p1/m, z3.d, z17.d
    1a64: 65c08621     	fadd	z1.d, p1/m, z1.d, z17.d
    1a68: e5e0e607     	st1d	{ z7.d }, p1, [x16]
    1a6c: e5e1e605     	st1d	{ z5.d }, p1, [x16, #0x1, mul vl]
    1a70: e5e2e603     	st1d	{ z3.d }, p1, [x16, #0x2, mul vl]
    1a74: e5e3e601     	st1d	{ z1.d }, p1, [x16, #0x3, mul vl]
    1a78: 8b110e10     	add	x16, x16, x17, lsl #3
    1a7c: 54fffbc1     	b.ne	0x19f4 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x32c>
    1a80: 2a1f03ee     	mov	w14, wzr
    1a84: c0c24510     	mov	z16.d, p1/m, za4h.d[w14, 0]
    1a88: 85800261     	ldr	p1, [x19]
    1a8c: c0c24546     	mov	z6.d, p1/m, za5h.d[w14, 0]
    1a90: 85800261     	ldr	p1, [x19]
    1a94: c0c24584     	mov	z4.d, p1/m, za6h.d[w14, 0]
    1a98: 85800261     	ldr	p1, [x19]
    1a9c: c0c245c2     	mov	z2.d, p1/m, za7h.d[w14, 0]
    1aa0: 110005ce     	add	w14, w14, #0x1
    1aa4: 85800261     	ldr	p1, [x19]
    1aa8: 85c0e151     	ld1rd	{ z17.d }, p0/z, [x10]
    1aac: b9800191     	ldrsw	x17, [x12]
    1ab0: 710021df     	cmp	w14, #0x8
    1ab4: 05e0c610     	sel	z16.d, p1, z16.d, z0.d
    1ab8: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1abc: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1ac0: 05e0c442     	sel	z2.d, p1, z2.d, z0.d
    1ac4: 65ca8630     	fmulx	z16.d, p1/m, z16.d, z17.d
    1ac8: 65ca8626     	fmulx	z6.d, p1/m, z6.d, z17.d
    1acc: 65ca8624     	fmulx	z4.d, p1/m, z4.d, z17.d
    1ad0: 65ca8622     	fmulx	z2.d, p1/m, z2.d, z17.d
    1ad4: 85c0e131     	ld1rd	{ z17.d }, p0/z, [x9]
    1ad8: 05e0c610     	sel	z16.d, p1, z16.d, z0.d
    1adc: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1ae0: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1ae4: 05e0c442     	sel	z2.d, p1, z2.d, z0.d
    1ae8: 65c08630     	fadd	z16.d, p1/m, z16.d, z17.d
    1aec: 65c08626     	fadd	z6.d, p1/m, z6.d, z17.d
    1af0: 65c08624     	fadd	z4.d, p1/m, z4.d, z17.d
    1af4: 65c08622     	fadd	z2.d, p1/m, z2.d, z17.d
    1af8: e5e0e610     	st1d	{ z16.d }, p1, [x16]
    1afc: e5e1e606     	st1d	{ z6.d }, p1, [x16, #0x1, mul vl]
    1b00: e5e2e604     	st1d	{ z4.d }, p1, [x16, #0x2, mul vl]
    1b04: e5e3e602     	st1d	{ z2.d }, p1, [x16, #0x3, mul vl]
    1b08: 8b110e10     	add	x16, x16, x17, lsl #3
    1b0c: 54fffbc1     	b.ne	0x1a84 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x3bc>
    1b10: b98002f0     	ldrsw	x16, [x23]
    1b14: 910005ef     	add	x15, x15, #0x1
    1b18: eb1001ff     	cmp	x15, x16
    1b1c: 54ffe44b     	b.lt	0x17a4 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xdc>
    1b20: b9401bee     	ldr	w14, [sp, #0x18]
    1b24: 17ffff18     	b	0x1784 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xbc>
    1b28: b0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xff08>
    1b2c: 9135a000     	add	x0, x0, #0xd68
    1b30: 2a1803e1     	mov	w1, w24
    1b34: 97fffb8f     	bl	0x970 <__kmpc_for_static_fini@plt>
    1b38: 043f503f     	addvl	sp, sp, #0x1
    1b3c: 910083ff     	add	sp, sp, #0x20
    1b40: a9444ff4     	ldp	x20, x19, [sp, #0x40]
    1b44: a94357f6     	ldp	x22, x21, [sp, #0x30]
    1b48: a9425ff8     	ldp	x24, x23, [sp, #0x20]
    1b4c: a94167fc     	ldp	x28, x25, [sp, #0x10]
    1b50: a8c57bfd     	ldp	x29, x30, [sp], #0x50
    1b54: d65f03c0     	ret

0000000000001b58 <_ZN4gemmIdE12compute_testEiiiPKdS2_Pddd>:
    1b58: 6dba3bef     	stp	d15, d14, [sp, #-0x60]!
    1b5c: 6d0133ed     	stp	d13, d12, [sp, #0x10]
    1b60: 6d022beb     	stp	d11, d10, [sp, #0x20]
    1b64: 6d0323e9     	stp	d9, d8, [sp, #0x30]
    1b68: a9047bfd     	stp	x29, x30, [sp, #0x40]
    1b6c: f9002bfc     	str	x28, [sp, #0x50]
    1b70: 910103fd     	add	x29, sp, #0x40
    1b74: d10203ff     	sub	sp, sp, #0x80
    1b78: 043f5fff     	addsvl	sp, sp, #-0x1
    1b7c: 6d0387e0     	stp	d0, d1, [sp, #0x38]
    1b80: d503437f     	smstart	sm
    1b84: 52800208     	mov	w8, #0x10               // =16
    1b88: 52800409     	mov	w9, #0x20               // =32
    1b8c: 25d8e3e0     	ptrue	p0.d
    1b90: 1ac80c08     	sdiv	w8, w0, w8
    1b94: 6d4383e2     	ldp	d2, d0, [sp, #0x38]
    1b98: 290303a1     	stp	w1, w0, [x29, #0x18]
    1b9c: b0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xff08>
    1ba0: 91360000     	add	x0, x0, #0xd80
    1ba4: b9007fe2     	str	w2, [sp, #0x7c]
    1ba8: 90000002     	adrp	x2, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc0>
    1bac: 911b2042     	add	x2, x2, #0x6c8
    1bb0: a9068fe4     	stp	x4, x3, [sp, #0x68]
    1bb4: f90033e5     	str	x5, [sp, #0x60]
    1bb8: 6d050be0     	stp	d0, d2, [sp, #0x50]
    1bbc: 1ac90c29     	sdiv	w9, w1, w9
    1bc0: 290923e9     	stp	w9, w8, [sp, #0x48]
    1bc4: d10103a8     	sub	x8, x29, #0x40
    1bc8: 910163e9     	add	x9, sp, #0x58
    1bcc: e5bf1d00     	str	p0, [x8, #-0x1, mul vl]
    1bd0: 910143e8     	add	x8, sp, #0x50
    1bd4: a90223e9     	stp	x9, x8, [sp, #0x20]
    1bd8: 910183e8     	add	x8, sp, #0x60
    1bdc: 910063a9     	add	x9, x29, #0x18
    1be0: a90123e9     	stp	x9, x8, [sp, #0x10]
    1be4: d10103a9     	sub	x9, x29, #0x40
    1be8: 910073a8     	add	x8, x29, #0x1c
    1bec: 04695fe9     	addspl	x9, x9, #-0x1
    1bf0: a90023e9     	stp	x9, x8, [sp]
    1bf4: d503427f     	smstop	sm
    1bf8: 910133e3     	add	x3, sp, #0x4c
    1bfc: 910123e4     	add	x4, sp, #0x48
    1c00: 9101c3e5     	add	x5, sp, #0x70
    1c04: 9101a3e6     	add	x6, sp, #0x68
    1c08: 9101f3e7     	add	x7, sp, #0x7c
    1c0c: 52800161     	mov	w1, #0xb                // =11
    1c10: 97fffb84     	bl	0xa20 <__kmpc_fork_call@plt>
    1c14: d503437f     	smstart	sm
    1c18: d503427f     	smstop	sm
    1c1c: 043f583f     	addsvl	sp, sp, #0x1
    1c20: 910203ff     	add	sp, sp, #0x80
    1c24: a9447bfd     	ldp	x29, x30, [sp, #0x40]
    1c28: f9402bfc     	ldr	x28, [sp, #0x50]
    1c2c: 6d4323e9     	ldp	d9, d8, [sp, #0x30]
    1c30: 6d422beb     	ldp	d11, d10, [sp, #0x20]
    1c34: 6d4133ed     	ldp	d13, d12, [sp, #0x10]
    1c38: 6cc63bef     	ldp	d15, d14, [sp], #0x60
    1c3c: d65f03c0     	ret

Disassembly of section .fini:

0000000000001c40 <_fini>:
    1c40: d503201f     	nop
    1c44: a9bf7bfd     	stp	x29, x30, [sp, #-0x10]!
    1c48: 910003fd     	mov	x29, sp
    1c4c: a8c17bfd     	ldp	x29, x30, [sp], #0x10
    1c50: d65f03c0     	ret
