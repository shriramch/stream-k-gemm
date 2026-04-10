
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
     944: d0000090     	adrp	x16, 0x12000 <__FRAME_END__+0xff10>
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
     a9c: d0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xff10>
     aa0: f947e000     	ldr	x0, [x0, #0xfc0]
     aa4: d2800003     	mov	x3, #0x0                // =0
     aa8: d2800004     	mov	x4, #0x0                // =0
     aac: 97ffffc9     	bl	0x9d0 <__libc_start_main@plt>
     ab0: 97ffffd8     	bl	0xa10 <abort@plt>

0000000000000ab4 <call_weak_fn>:
     ab4: d0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xff10>
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
     ae8: d0000081     	adrp	x1, 0x12000 <__FRAME_END__+0xff10>
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
     b24: d0000082     	adrp	x2, 0x12000 <__FRAME_END__+0xff10>
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
     b58: d0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xff10>
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
     bbc: b0000000     	adrp	x0, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc4>
     bc0: 9131e000     	add	x0, x0, #0xc78
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
     c34: b0000000     	adrp	x0, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc4>
     c38: 9132f000     	add	x0, x0, #0xcbc
     c3c: 2a1303e1     	mov	w1, w19
     c40: 2a1403e2     	mov	w2, w20
     c44: 2a1603e3     	mov	w3, w22
     c48: 97ffff7e     	bl	0xa40 <printf@plt>
     c4c: 2f00e401     	movi	d1, #0000000000000000
     c50: 1e6e1000     	fmov	d0, #1.00000000
     c54: 2a1303e0     	mov	w0, w19
     c58: 2a1403e1     	mov	w1, w20
     c5c: 2a1603e2     	mov	w2, w22
     c60: 940000b7     	bl	0xf3c <_Z9test_gemmIdEbiiiT_S0_>
     c64: b81fc3a0     	stur	w0, [x29, #-0x4]
     c68: b0000000     	adrp	x0, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc4>
     c6c: 91382800     	add	x0, x0, #0xe0a
     c70: 97ffff48     	bl	0x990 <puts@plt>
     c74: b0000008     	adrp	x8, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc4>
     c78: 1e601000     	fmov	d0, #2.00000000
     c7c: 2a1303e0     	mov	w0, w19
     c80: fd462d01     	ldr	d1, [x8, #0xc58]
     c84: 2a1403e1     	mov	w1, w20
     c88: 2a1603e2     	mov	w2, w22
     c8c: 940000ac     	bl	0xf3c <_Z9test_gemmIdEbiiiT_S0_>
     c90: b9000be0     	str	w0, [sp, #0x8]
     c94: b0000000     	adrp	x0, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc4>
     c98: 9138c400     	add	x0, x0, #0xe31
     c9c: 97ffff3d     	bl	0x990 <puts@plt>
     ca0: b0000000     	adrp	x0, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc4>
     ca4: 91364c00     	add	x0, x0, #0xd93
     ca8: b0000001     	adrp	x1, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc4>
     cac: 9134fc21     	add	x1, x1, #0xd3f
     cb0: 2a1303e2     	mov	w2, w19
     cb4: 2a1403e3     	mov	w3, w20
     cb8: 2a1603e4     	mov	w4, w22
     cbc: 52800045     	mov	w5, #0x2                // =2
     cc0: 97ffff60     	bl	0xa40 <printf@plt>
     cc4: 52800040     	mov	w0, #0x2                // =2
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
     d54: b000000c     	adrp	x12, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc4>
     d58: 9131818c     	add	x12, x12, #0xc60
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
     da0: b000000a     	adrp	x10, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc4>
     da4: fd463140     	ldr	d0, [x10, #0xc60]
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
     df8: b000000a     	adrp	x10, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc4>
     dfc: 9131814a     	add	x10, x10, #0xc60
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
     e44: b0000009     	adrp	x9, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc4>
     e48: fd463120     	ldr	d0, [x9, #0xc60]
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
     e94: 94000197     	bl	0x14f0 <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd>
     e98: 1e620261     	scvtf	d1, w19
     e9c: 1e620282     	scvtf	d2, w20
     ea0: b0000000     	adrp	x0, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc4>
     ea4: 91371800     	add	x0, x0, #0xdc6
     ea8: 1e612821     	fadd	d1, d1, d1
     eac: 1e620821     	fmul	d1, d1, d2
     eb0: 1e6202c2     	scvtf	d2, w22
     eb4: 1e620821     	fmul	d1, d1, d2
     eb8: 1e601828     	fdiv	d8, d1, d0
     ebc: 1e604101     	fmov	d1, d8
     ec0: 97fffee0     	bl	0xa40 <printf@plt>
     ec4: 1e6c1000     	fmov	d0, #0.50000000
     ec8: b0000000     	adrp	x0, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc4>
     ecc: 91378c00     	add	x0, x0, #0xde3
     ed0: 1e600900     	fmul	d0, d8, d0
     ed4: 97fffedb     	bl	0xa40 <printf@plt>
     ed8: aa1803e0     	mov	x0, x24
     edc: 97fffec1     	bl	0x9e0 <_ZdaPv@plt>
     ee0: aa1903e0     	mov	x0, x25
     ee4: 97fffebf     	bl	0x9e0 <_ZdaPv@plt>
     ee8: aa1a03e0     	mov	x0, x26
     eec: 97fffebd     	bl	0x9e0 <_ZdaPv@plt>
     ef0: b85fc3b3     	ldur	w19, [x29, #-0x4]
     ef4: b9400bf4     	ldr	w20, [sp, #0x8]
     ef8: b0000000     	adrp	x0, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc4>
     efc: 91338800     	add	x0, x0, #0xce2
     f00: 12000268     	and	w8, w19, #0x1
     f04: 12000289     	and	w9, w20, #0x1
     f08: 0b080121     	add	w1, w9, w8
     f0c: 97fffecd     	bl	0xa40 <printf@plt>
     f10: 0a140268     	and	w8, w19, w20
     f14: 52800029     	mov	w9, #0x1                // =1
     f18: 0a280120     	bic	w0, w9, w8
     f1c: a9464ff4     	ldp	x20, x19, [sp, #0x60]
     f20: a94557f6     	ldp	x22, x21, [sp, #0x50]
     f24: a9445ff8     	ldp	x24, x23, [sp, #0x40]
     f28: a94367fa     	ldp	x26, x25, [sp, #0x30]
     f2c: a9426ffc     	ldp	x28, x27, [sp, #0x20]
     f30: a9417bfd     	ldp	x29, x30, [sp, #0x10]
     f34: fc4707e8     	ldr	d8, [sp], #0x70
     f38: d65f03c0     	ret

0000000000000f3c <_Z9test_gemmIdEbiiiT_S0_>:
     f3c: d10243ff     	sub	sp, sp, #0x90
     f40: 6d0223e9     	stp	d9, d8, [sp, #0x20]
     f44: a9037bfd     	stp	x29, x30, [sp, #0x30]
     f48: a9046ffc     	stp	x28, x27, [sp, #0x40]
     f4c: a90567fa     	stp	x26, x25, [sp, #0x50]
     f50: a9065ff8     	stp	x24, x23, [sp, #0x60]
     f54: a90757f6     	stp	x22, x21, [sp, #0x70]
     f58: a9084ff4     	stp	x20, x19, [sp, #0x80]
     f5c: 9100c3fd     	add	x29, sp, #0x30
     f60: 2a0203f4     	mov	w20, w2
     f64: 2a0103f7     	mov	w23, w1
     f68: 2a0003f9     	mov	w25, w0
     f6c: b0000000     	adrp	x0, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc4>
     f70: 91341c00     	add	x0, x0, #0xd07
     f74: b0000001     	adrp	x1, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc4>
     f78: 9134fc21     	add	x1, x1, #0xd3f
     f7c: 2a1903e2     	mov	w2, w25
     f80: 2a1703e3     	mov	w3, w23
     f84: 2a1403e4     	mov	w4, w20
     f88: 1e604028     	fmov	d8, d1
     f8c: 1e604009     	fmov	d9, d0
     f90: 97fffeac     	bl	0xa40 <printf@plt>
     f94: 52800040     	mov	w0, #0x2                // =2
     f98: 97fffe96     	bl	0x9f0 <omp_set_num_threads@plt>
     f9c: 1b197e88     	mul	w8, w20, w25
     fa0: d37d7d09     	ubfiz	x9, x8, #3, #32
     fa4: 7100011f     	cmp	w8, #0x0
     fa8: da9fa120     	csinv	x0, x9, xzr, ge
     fac: 97fffe6d     	bl	0x960 <_Znam@plt>
     fb0: 1b177e88     	mul	w8, w20, w23
     fb4: aa0003f3     	mov	x19, x0
     fb8: d37d7d09     	ubfiz	x9, x8, #3, #32
     fbc: 7100011f     	cmp	w8, #0x0
     fc0: da9fa120     	csinv	x0, x9, xzr, ge
     fc4: 97fffe67     	bl	0x960 <_Znam@plt>
     fc8: 1b197efb     	mul	w27, w23, w25
     fcc: aa0003fa     	mov	x26, x0
     fd0: d37d7f68     	ubfiz	x8, x27, #3, #32
     fd4: 7100037f     	cmp	w27, #0x0
     fd8: da9fa116     	csinv	x22, x8, xzr, ge
     fdc: aa1603e0     	mov	x0, x22
     fe0: 97fffe60     	bl	0x960 <_Znam@plt>
     fe4: aa0003f5     	mov	x21, x0
     fe8: aa1603e0     	mov	x0, x22
     fec: 97fffe5d     	bl	0x960 <_Znam@plt>
     ff0: 7100069f     	cmp	w20, #0x1
     ff4: aa0003f6     	mov	x22, x0
     ff8: 540010cb     	b.lt	0x1210 <_Z9test_gemmIdEbiiiT_S0_+0x2d4>
     ffc: 7100073f     	cmp	w25, #0x1
    1000: 9000000a     	adrp	x10, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc4>
    1004: 9000000b     	adrp	x11, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc4>
    1008: 9000000c     	adrp	x12, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc4>
    100c: 9131c18c     	add	x12, x12, #0xc70
    1010: 540007cb     	b.lt	0x1108 <_Z9test_gemmIdEbiiiT_S0_+0x1cc>
    1014: 04bf5028     	rdvl	x8, #0x1
    1018: 25d8e3e0     	ptrue	p0.d
    101c: 04e14000     	index	z0.d, #0x0, #0x1
    1020: d344fd0d     	lsr	x13, x8, #4
    1024: 321e73e8     	mov	w8, #0x7ffffffc         // =2147483644
    1028: 2a1903f0     	mov	w16, w25
    102c: fd463543     	ldr	d3, [x10, #0xc68]
    1030: fd463964     	ldr	d4, [x11, #0xc70]
    1034: 2a1f03ee     	mov	w14, wzr
    1038: 9b087db1     	mul	x17, x13, x8
    103c: 04e0e3e8     	cntd	x8
    1040: aa1f03ef     	mov	x15, xzr
    1044: 05e03901     	mov	z1.d, x8
    1048: 2a1403e8     	mov	w8, w20
    104c: 04a0e3e9     	cntw	x9
    1050: 85c0e182     	ld1rd	{ z2.d }, p0/z, [x12]
    1054: 8a100231     	and	x17, x17, x16
    1058: 14000004     	b	0x1068 <_Z9test_gemmIdEbiiiT_S0_+0x12c>
    105c: eb0801ff     	cmp	x15, x8
    1060: 0b1901ce     	add	w14, w14, w25
    1064: 540004c0     	b.eq	0x10fc <_Z9test_gemmIdEbiiiT_S0_+0x1c0>
    1068: 910005ef     	add	x15, x15, #0x1
    106c: 8b2e4e72     	add	x18, x19, w14, uxtw #3
    1070: eb10013f     	cmp	x9, x16
    1074: 1e6201e5     	scvtf	d5, w15
    1078: 1e6308a5     	fmul	d5, d5, d3
    107c: 54000069     	b.ls	0x1088 <_Z9test_gemmIdEbiiiT_S0_+0x14c>
    1080: aa1f03e0     	mov	x0, xzr
    1084: 14000016     	b	0x10dc <_Z9test_gemmIdEbiiiT_S0_+0x1a0>
    1088: 052820a6     	mov	z6.d, d5
    108c: 04603007     	mov	z7.d, z0.d
    1090: aa1f03e0     	mov	x0, xzr
    1094: 04325021     	addvl	x1, x18, #0x1
    1098: 04e100f0     	add	z16.d, z7.d, z1.d
    109c: 25e0c027     	add	z7.d, z7.d, #0x1        // =1
    10a0: 04e10211     	add	z17.d, z16.d, z1.d
    10a4: 25e0c030     	add	z16.d, z16.d, #0x1      // =1
    10a8: 65d0a0e7     	scvtf	z7.d, p0/m, z7.s
    10ac: 65d0a210     	scvtf	z16.d, p0/m, z16.s
    10b0: 65e68047     	fmad	z7.d, p0/m, z2.d, z6.d
    10b4: 65e68050     	fmad	z16.d, p0/m, z2.d, z6.d
    10b8: e5e04247     	st1d	{ z7.d }, p0, [x18, x0, lsl #3]
    10bc: 04713227     	mov	z7.d, z17.d
    10c0: e5e04030     	st1d	{ z16.d }, p0, [x1, x0, lsl #3]
    10c4: 04b0e3e0     	incw	x0
    10c8: eb00023f     	cmp	x17, x0
    10cc: 54fffe61     	b.ne	0x1098 <_Z9test_gemmIdEbiiiT_S0_+0x15c>
    10d0: eb10023f     	cmp	x17, x16
    10d4: aa1103e0     	mov	x0, x17
    10d8: 54fffc20     	b.eq	0x105c <_Z9test_gemmIdEbiiiT_S0_+0x120>
    10dc: 91000401     	add	x1, x0, #0x1
    10e0: 1e620026     	scvtf	d6, w1
    10e4: eb01021f     	cmp	x16, x1
    10e8: 1f4414c6     	fmadd	d6, d6, d4, d5
    10ec: fc207a46     	str	d6, [x18, x0, lsl #3]
    10f0: aa0103e0     	mov	x0, x1
    10f4: 54ffff41     	b.ne	0x10dc <_Z9test_gemmIdEbiiiT_S0_+0x1a0>
    10f8: 17ffffd9     	b	0x105c <_Z9test_gemmIdEbiiiT_S0_+0x120>
    10fc: 710002ff     	cmp	w23, #0x0
    1100: 5400010c     	b.gt	0x1120 <_Z9test_gemmIdEbiiiT_S0_+0x1e4>
    1104: 14000088     	b	0x1324 <_Z9test_gemmIdEbiiiT_S0_+0x3e8>
    1108: 710006ff     	cmp	w23, #0x1
    110c: 540010cb     	b.lt	0x1324 <_Z9test_gemmIdEbiiiT_S0_+0x3e8>
    1110: 04bf5028     	rdvl	x8, #0x1
    1114: 04a0e3e9     	cntw	x9
    1118: d344fd0d     	lsr	x13, x8, #4
    111c: 2a1403e8     	mov	w8, w20
    1120: 25d8e3e0     	ptrue	p0.d
    1124: d37ff9b0     	lsl	x16, x13, #1
    1128: 530101b1     	lsl	w17, w13, #31
    112c: 90000012     	adrp	x18, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc4>
    1130: 9131a252     	add	x18, x18, #0xc68
    1134: 04e14002     	index	z2.d, #0x0, #0x1
    1138: 05e03a00     	mov	z0.d, x16
    113c: 4b0d0a30     	sub	w16, w17, w13, lsl #2
    1140: d37cedad     	lsl	x13, x13, #4
    1144: fd463544     	ldr	d4, [x10, #0xc68]
    1148: fd463965     	ldr	d5, [x11, #0xc70]
    114c: 2a1f03ee     	mov	w14, wzr
    1150: aa1f03ef     	mov	x15, xzr
    1154: 85c0e241     	ld1rd	{ z1.d }, p0/z, [x18]
    1158: 85c0e183     	ld1rd	{ z3.d }, p0/z, [x12]
    115c: 2a1703ec     	mov	w12, w23
    1160: 8a0c020a     	and	x10, x16, x12
    1164: 14000004     	b	0x1174 <_Z9test_gemmIdEbiiiT_S0_+0x238>
    1168: eb0801ff     	cmp	x15, x8
    116c: 0b1701ce     	add	w14, w14, w23
    1170: 54000500     	b.eq	0x1210 <_Z9test_gemmIdEbiiiT_S0_+0x2d4>
    1174: 910005ef     	add	x15, x15, #0x1
    1178: 8b2e4f4b     	add	x11, x26, w14, uxtw #3
    117c: eb0c013f     	cmp	x9, x12
    1180: 1e6201e6     	scvtf	d6, w15
    1184: 54000069     	b.ls	0x1190 <_Z9test_gemmIdEbiiiT_S0_+0x254>
    1188: aa1f03f0     	mov	x16, xzr
    118c: 14000018     	b	0x11ec <_Z9test_gemmIdEbiiiT_S0_+0x2b0>
    1190: 052820c7     	mov	z7.d, d6
    1194: 04623050     	mov	z16.d, z2.d
    1198: aa1f03f0     	mov	x16, xzr
    119c: 8b0d0171     	add	x17, x11, x13
    11a0: 04e00211     	add	z17.d, z16.d, z0.d
    11a4: 25e0c030     	add	z16.d, z16.d, #0x1      // =1
    11a8: 04e00232     	add	z18.d, z17.d, z0.d
    11ac: 25e0c031     	add	z17.d, z17.d, #0x1      // =1
    11b0: 65d0a210     	scvtf	z16.d, p0/m, z16.s
    11b4: 65d0a231     	scvtf	z17.d, p0/m, z17.s
    11b8: 65c10a10     	fmul	z16.d, z16.d, z1.d
    11bc: 65c10a31     	fmul	z17.d, z17.d, z1.d
    11c0: 65e300f0     	fmla	z16.d, p0/m, z7.d, z3.d
    11c4: 65e300f1     	fmla	z17.d, p0/m, z7.d, z3.d
    11c8: e5f04170     	st1d	{ z16.d }, p0, [x11, x16, lsl #3]
    11cc: 04723250     	mov	z16.d, z18.d
    11d0: e5f04231     	st1d	{ z17.d }, p0, [x17, x16, lsl #3]
    11d4: 8b090210     	add	x16, x16, x9
    11d8: eb10015f     	cmp	x10, x16
    11dc: 54fffe21     	b.ne	0x11a0 <_Z9test_gemmIdEbiiiT_S0_+0x264>
    11e0: eb0c015f     	cmp	x10, x12
    11e4: aa0a03f0     	mov	x16, x10
    11e8: 54fffc00     	b.eq	0x1168 <_Z9test_gemmIdEbiiiT_S0_+0x22c>
    11ec: 91000611     	add	x17, x16, #0x1
    11f0: 1e620227     	scvtf	d7, w17
    11f4: eb11019f     	cmp	x12, x17
    11f8: 1e6408e7     	fmul	d7, d7, d4
    11fc: 1f451cc7     	fmadd	d7, d6, d5, d7
    1200: fc307967     	str	d7, [x11, x16, lsl #3]
    1204: aa1103f0     	mov	x16, x17
    1208: 54ffff21     	b.ne	0x11ec <_Z9test_gemmIdEbiiiT_S0_+0x2b0>
    120c: 17ffffd7     	b	0x1168 <_Z9test_gemmIdEbiiiT_S0_+0x22c>
    1210: 7100073f     	cmp	w25, #0x1
    1214: 5400088b     	b.lt	0x1324 <_Z9test_gemmIdEbiiiT_S0_+0x3e8>
    1218: 710006ff     	cmp	w23, #0x1
    121c: 5400084b     	b.lt	0x1324 <_Z9test_gemmIdEbiiiT_S0_+0x3e8>
    1220: b90007f4     	str	w20, [sp, #0x4]
    1224: 2a1903f4     	mov	w20, w25
    1228: 2a1703f8     	mov	w24, w23
    122c: a900ebfb     	stp	x27, x26, [sp, #0x8]
    1230: d37d7efa     	ubfiz	x26, x23, #3, #32
    1234: aa1403fc     	mov	x28, x20
    1238: f9000ff3     	str	x19, [sp, #0x18]
    123c: 2a1f03f3     	mov	w19, wzr
    1240: d37d7e7b     	ubfiz	x27, x19, #3, #32
    1244: 2a1f03e1     	mov	w1, wzr
    1248: aa1a03e2     	mov	x2, x26
    124c: 8b1b02a0     	add	x0, x21, x27
    1250: 97fffdd8     	bl	0x9b0 <memset@plt>
    1254: 8b1b02c0     	add	x0, x22, x27
    1258: 2a1f03e1     	mov	w1, wzr
    125c: aa1a03e2     	mov	x2, x26
    1260: 97fffdd4     	bl	0x9b0 <memset@plt>
    1264: f100079c     	subs	x28, x28, #0x1
    1268: 0b170273     	add	w19, w19, w23
    126c: 54fffea1     	b.ne	0x1240 <_Z9test_gemmIdEbiiiT_S0_+0x304>
    1270: a9414ffa     	ldp	x26, x19, [sp, #0x10]
    1274: 1e604120     	fmov	d0, d9
    1278: 1e604101     	fmov	d1, d8
    127c: 2a1903e0     	mov	w0, w25
    1280: b94007f9     	ldr	w25, [sp, #0x4]
    1284: 2a1703e1     	mov	w1, w23
    1288: aa1503e5     	mov	x5, x21
    128c: 2a1903e2     	mov	w2, w25
    1290: aa1303e3     	mov	x3, x19
    1294: aa1a03e4     	mov	x4, x26
    1298: 9400022f     	bl	0x1b54 <_ZN4gemmIdE12compute_testEiiiPKdS2_Pddd>
    129c: 7100033f     	cmp	w25, #0x0
    12a0: 54000d6d     	b.le	0x144c <_Z9test_gemmIdEbiiiT_S0_+0x510>
    12a4: d37df309     	lsl	x9, x24, #3
    12a8: d37df28a     	lsl	x10, x20, #3
    12ac: f94007fb     	ldr	x27, [sp, #0x8]
    12b0: aa1f03e8     	mov	x8, xzr
    12b4: 2a1903eb     	mov	w11, w25
    12b8: aa1303ec     	mov	x12, x19
    12bc: 9b187d0e     	mul	x14, x8, x24
    12c0: aa1f03ed     	mov	x13, xzr
    12c4: aa1a03ef     	mov	x15, x26
    12c8: 8b0e0ece     	add	x14, x22, x14, lsl #3
    12cc: 2f00e400     	movi	d0, #0000000000000000
    12d0: aa0c03f0     	mov	x16, x12
    12d4: aa0f03f1     	mov	x17, x15
    12d8: aa0b03f2     	mov	x18, x11
    12dc: fd400201     	ldr	d1, [x16]
    12e0: fd400222     	ldr	d2, [x17]
    12e4: f1000652     	subs	x18, x18, #0x1
    12e8: 8b090231     	add	x17, x17, x9
    12ec: 8b0a0210     	add	x16, x16, x10
    12f0: 1f420020     	fmadd	d0, d1, d2, d0
    12f4: 54ffff41     	b.ne	0x12dc <_Z9test_gemmIdEbiiiT_S0_+0x3a0>
    12f8: 1f402120     	fmadd	d0, d9, d0, d8
    12fc: 910021ef     	add	x15, x15, #0x8
    1300: fc2d79c0     	str	d0, [x14, x13, lsl #3]
    1304: 910005ad     	add	x13, x13, #0x1
    1308: eb1801bf     	cmp	x13, x24
    130c: 54fffe01     	b.ne	0x12cc <_Z9test_gemmIdEbiiiT_S0_+0x390>
    1310: 91000508     	add	x8, x8, #0x1
    1314: 9100218c     	add	x12, x12, #0x8
    1318: eb14011f     	cmp	x8, x20
    131c: 54fffd01     	b.ne	0x12bc <_Z9test_gemmIdEbiiiT_S0_+0x380>
    1320: 1400000a     	b	0x1348 <_Z9test_gemmIdEbiiiT_S0_+0x40c>
    1324: 1e604120     	fmov	d0, d9
    1328: 1e604101     	fmov	d1, d8
    132c: 2a1903e0     	mov	w0, w25
    1330: 2a1703e1     	mov	w1, w23
    1334: 2a1403e2     	mov	w2, w20
    1338: aa1303e3     	mov	x3, x19
    133c: aa1a03e4     	mov	x4, x26
    1340: aa1503e5     	mov	x5, x21
    1344: 94000204     	bl	0x1b54 <_ZN4gemmIdE12compute_testEiiiPKdS2_Pddd>
    1348: 7100077f     	cmp	w27, #0x1
    134c: 5400044b     	b.lt	0x13d4 <_Z9test_gemmIdEbiiiT_S0_+0x498>
    1350: 2f00e400     	movi	d0, #0000000000000000
    1354: 90000009     	adrp	x9, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc4>
    1358: aa1f03e8     	mov	x8, xzr
    135c: fd463121     	ldr	d1, [x9, #0xc60]
    1360: 52800029     	mov	w9, #0x1                // =1
    1364: 12800001     	mov	w1, #-0x1               // =-1
    1368: 1400000c     	b	0x1398 <_Z9test_gemmIdEbiiiT_S0_+0x45c>
    136c: 1e602040     	fcmp	d2, d0
    1370: 1e60cc42     	fcsel	d2, d2, d0, gt
    1374: 1a81c10a     	csel	w10, w8, w1, gt
    1378: 1e612080     	fcmp	d4, d1
    137c: 91000508     	add	x8, x8, #0x1
    1380: 1a9fc7eb     	cset	w11, le
    1384: 1a8ad021     	csel	w1, w1, w10, le
    1388: 1e62dc00     	fcsel	d0, d0, d2, le
    138c: eb08037f     	cmp	x27, x8
    1390: 0a090169     	and	w9, w11, w9
    1394: 540001e0     	b.eq	0x13d0 <_Z9test_gemmIdEbiiiT_S0_+0x494>
    1398: d37df10a     	lsl	x10, x8, #3
    139c: fc6a6aa2     	ldr	d2, [x21, x10]
    13a0: fc6a6ac3     	ldr	d3, [x22, x10]
    13a4: 1e633844     	fsub	d4, d2, d3
    13a8: 1e623865     	fsub	d5, d3, d2
    13ac: 1e632040     	fcmp	d2, d3
    13b0: 1e65cc82     	fcsel	d2, d4, d5, gt
    13b4: 1e602068     	fcmp	d3, #0.0
    13b8: 1e604044     	fmov	d4, d2
    13bc: 54fffd80     	b.eq	0x136c <_Z9test_gemmIdEbiiiT_S0_+0x430>
    13c0: 1e614064     	fneg	d4, d3
    13c4: 1e64cc63     	fcsel	d3, d3, d4, gt
    13c8: 1e631844     	fdiv	d4, d2, d3
    13cc: 17ffffe8     	b	0x136c <_Z9test_gemmIdEbiiiT_S0_+0x430>
    13d0: 360000c9     	tbz	w9, #0x0, 0x13e8 <_Z9test_gemmIdEbiiiT_S0_+0x4ac>
    13d4: 90000000     	adrp	x0, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc4>
    13d8: 91391400     	add	x0, x0, #0xe45
    13dc: 97fffd6d     	bl	0x990 <puts@plt>
    13e0: 52800037     	mov	w23, #0x1               // =1
    13e4: 14000008     	b	0x1404 <_Z9test_gemmIdEbiiiT_S0_+0x4c8>
    13e8: 937d7c28     	sbfiz	x8, x1, #3, #32
    13ec: 90000000     	adrp	x0, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc4>
    13f0: 91351800     	add	x0, x0, #0xd46
    13f4: fc686aa1     	ldr	d1, [x21, x8]
    13f8: fc686ac2     	ldr	d2, [x22, x8]
    13fc: 97fffd91     	bl	0xa40 <printf@plt>
    1400: 2a1f03f7     	mov	w23, wzr
    1404: aa1303e0     	mov	x0, x19
    1408: 97fffd76     	bl	0x9e0 <_ZdaPv@plt>
    140c: aa1a03e0     	mov	x0, x26
    1410: 97fffd74     	bl	0x9e0 <_ZdaPv@plt>
    1414: aa1503e0     	mov	x0, x21
    1418: 97fffd72     	bl	0x9e0 <_ZdaPv@plt>
    141c: aa1603e0     	mov	x0, x22
    1420: 97fffd70     	bl	0x9e0 <_ZdaPv@plt>
    1424: 2a1703e0     	mov	w0, w23
    1428: a9484ff4     	ldp	x20, x19, [sp, #0x80]
    142c: a94757f6     	ldp	x22, x21, [sp, #0x70]
    1430: a9465ff8     	ldp	x24, x23, [sp, #0x60]
    1434: a94567fa     	ldp	x26, x25, [sp, #0x50]
    1438: a9446ffc     	ldp	x28, x27, [sp, #0x40]
    143c: a9437bfd     	ldp	x29, x30, [sp, #0x30]
    1440: 6d4223e9     	ldp	d9, d8, [sp, #0x20]
    1444: 910243ff     	add	sp, sp, #0x90
    1448: d65f03c0     	ret
    144c: 2f00e400     	movi	d0, #0000000000000000
    1450: 04bf502a     	rdvl	x10, #0x1
    1454: 321e73eb     	mov	w11, #0x7ffffffc        // =2147483644
    1458: d344fd4a     	lsr	x10, x10, #4
    145c: 25d8e3e0     	ptrue	p0.d
    1460: f94007fb     	ldr	x27, [sp, #0x8]
    1464: 2a1f03e8     	mov	w8, wzr
    1468: aa1f03e9     	mov	x9, xzr
    146c: 9b0b7d4b     	mul	x11, x10, x11
    1470: 04a0e3ea     	cntw	x10
    1474: 1f402120     	fmadd	d0, d9, d0, d8
    1478: 05282001     	mov	z1.d, d0
    147c: 8a18016b     	and	x11, x11, x24
    1480: 14000005     	b	0x1494 <_Z9test_gemmIdEbiiiT_S0_+0x558>
    1484: 91000529     	add	x9, x9, #0x1
    1488: 0b170108     	add	w8, w8, w23
    148c: eb14013f     	cmp	x9, x20
    1490: 54fff5c0     	b.eq	0x1348 <_Z9test_gemmIdEbiiiT_S0_+0x40c>
    1494: d37d7d0c     	ubfiz	x12, x8, #3, #32
    1498: eb18015f     	cmp	x10, x24
    149c: 54000069     	b.ls	0x14a8 <_Z9test_gemmIdEbiiiT_S0_+0x56c>
    14a0: aa1f03ed     	mov	x13, xzr
    14a4: 1400000c     	b	0x14d4 <_Z9test_gemmIdEbiiiT_S0_+0x598>
    14a8: 8b0c02ce     	add	x14, x22, x12
    14ac: aa1f03ed     	mov	x13, xzr
    14b0: 042e502f     	addvl	x15, x14, #0x1
    14b4: e5ed41c1     	st1d	{ z1.d }, p0, [x14, x13, lsl #3]
    14b8: e5ed41e1     	st1d	{ z1.d }, p0, [x15, x13, lsl #3]
    14bc: 04b0e3ed     	incw	x13
    14c0: eb0d017f     	cmp	x11, x13
    14c4: 54ffff81     	b.ne	0x14b4 <_Z9test_gemmIdEbiiiT_S0_+0x578>
    14c8: eb18017f     	cmp	x11, x24
    14cc: aa0b03ed     	mov	x13, x11
    14d0: 54fffda0     	b.eq	0x1484 <_Z9test_gemmIdEbiiiT_S0_+0x548>
    14d4: 8b0d0d8e     	add	x14, x12, x13, lsl #3
    14d8: cb0d030c     	sub	x12, x24, x13
    14dc: 8b0e02cd     	add	x13, x22, x14
    14e0: f100058c     	subs	x12, x12, #0x1
    14e4: fc0085a0     	str	d0, [x13], #0x8
    14e8: 54ffffc1     	b.ne	0x14e0 <_Z9test_gemmIdEbiiiT_S0_+0x5a4>
    14ec: 17ffffe6     	b	0x1484 <_Z9test_gemmIdEbiiiT_S0_+0x548>

00000000000014f0 <_ZN4gemmIdE17compute_benchmarkEiiiPKdS2_Pddd>:
    14f0: 6db63bef     	stp	d15, d14, [sp, #-0xa0]!
    14f4: 6d0133ed     	stp	d13, d12, [sp, #0x10]
    14f8: 6d022beb     	stp	d11, d10, [sp, #0x20]
    14fc: 6d0323e9     	stp	d9, d8, [sp, #0x30]
    1500: a9047bfd     	stp	x29, x30, [sp, #0x40]
    1504: a9056ffc     	stp	x28, x27, [sp, #0x50]
    1508: a90667fa     	stp	x26, x25, [sp, #0x60]
    150c: a9075ff8     	stp	x24, x23, [sp, #0x70]
    1510: a90857f6     	stp	x22, x21, [sp, #0x80]
    1514: a9094ff4     	stp	x20, x19, [sp, #0x90]
    1518: 910103fd     	add	x29, sp, #0x40
    151c: d10203ff     	sub	sp, sp, #0x80
    1520: 043f5fff     	addsvl	sp, sp, #-0x1
    1524: aa0503f3     	mov	x19, x5
    1528: aa0403f4     	mov	x20, x4
    152c: aa0303f5     	mov	x21, x3
    1530: 2a0203f6     	mov	w22, w2
    1534: 2a0103f7     	mov	w23, w1
    1538: 2a0003f8     	mov	w24, w0
    153c: d503437f     	smstart	sm
    1540: 25d8e3e0     	ptrue	p0.d
    1544: 52800208     	mov	w8, #0x10               // =16
    1548: 910143e9     	add	x9, sp, #0x50
    154c: 1ac80c1c     	sdiv	w28, w0, w8
    1550: 52800408     	mov	w8, #0x20               // =32
    1554: d10103ba     	sub	x26, x29, #0x40
    1558: 047a5ffa     	addspl	x26, x26, #-0x1
    155c: 290f03e1     	stp	w1, w0, [sp, #0x78]
    1560: b0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xff10>
    1564: 91360000     	add	x0, x0, #0xd80
    1568: b90077e2     	str	w2, [sp, #0x74]
    156c: 90000002     	adrp	x2, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc4>
    1570: 911b1042     	add	x2, x2, #0x6c4
    1574: a9060fe4     	stp	x4, x3, [sp, #0x60]
    1578: f90027ff     	str	xzr, [sp, #0x48]
    157c: 1ac80c39     	sdiv	w25, w1, w8
    1580: d10103a8     	sub	x8, x29, #0x40
    1584: e5bf1900     	str	p0, [x8, #-0x2, mul vl]
    1588: d2e7fe08     	mov	x8, #0x3ff0000000000000 // =4607182418800017408
    158c: a90517e8     	stp	x8, x5, [sp, #0x50]
    1590: d10103a8     	sub	x8, x29, #0x40
    1594: e5bf1d00     	str	p0, [x8, #-0x1, mul vl]
    1598: 910123e8     	add	x8, sp, #0x48
    159c: a90223e9     	stp	x9, x8, [sp, #0x20]
    15a0: 910163e8     	add	x8, sp, #0x58
    15a4: 9101e3e9     	add	x9, sp, #0x78
    15a8: a90123e9     	stp	x9, x8, [sp, #0x10]
    15ac: 9101f3e8     	add	x8, sp, #0x7c
    15b0: a90023fa     	stp	x26, x8, [sp]
    15b4: 290873f9     	stp	w25, w28, [sp, #0x40]
    15b8: d503427f     	smstop	sm
    15bc: 910113e3     	add	x3, sp, #0x44
    15c0: 910103e4     	add	x4, sp, #0x40
    15c4: 9101a3e5     	add	x5, sp, #0x68
    15c8: 910183e6     	add	x6, sp, #0x60
    15cc: 9101d3e7     	add	x7, sp, #0x74
    15d0: 52800161     	mov	w1, #0xb                // =11
    15d4: 97fffd13     	bl	0xa20 <__kmpc_fork_call@plt>
    15d8: d503437f     	smstart	sm
    15dc: d503427f     	smstop	sm
    15e0: 97fffce8     	bl	0x980 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
    15e4: aa0003fb     	mov	x27, x0
    15e8: d503437f     	smstart	sm
    15ec: d2e7fe08     	mov	x8, #0x3ff0000000000000 // =4607182418800017408
    15f0: 290f63f7     	stp	w23, w24, [sp, #0x78]
    15f4: a9054fe8     	stp	x8, x19, [sp, #0x50]
    15f8: d10103a8     	sub	x8, x29, #0x40
    15fc: 85bf1900     	ldr	p0, [x8, #-0x2, mul vl]
    1600: b90077f6     	str	w22, [sp, #0x74]
    1604: a90657f4     	stp	x20, x21, [sp, #0x60]
    1608: e5bf1d00     	str	p0, [x8, #-0x1, mul vl]
    160c: 910123e8     	add	x8, sp, #0x48
    1610: f90017e8     	str	x8, [sp, #0x28]
    1614: 910143e8     	add	x8, sp, #0x50
    1618: f90013e8     	str	x8, [sp, #0x20]
    161c: 910163e8     	add	x8, sp, #0x58
    1620: f9000fe8     	str	x8, [sp, #0x18]
    1624: 9101e3e8     	add	x8, sp, #0x78
    1628: f9000be8     	str	x8, [sp, #0x10]
    162c: 9101f3e8     	add	x8, sp, #0x7c
    1630: f90027ff     	str	xzr, [sp, #0x48]
    1634: 290873f9     	stp	w25, w28, [sp, #0x40]
    1638: a90023fa     	stp	x26, x8, [sp]
    163c: d503427f     	smstop	sm
    1640: 910113e3     	add	x3, sp, #0x44
    1644: 910103e4     	add	x4, sp, #0x40
    1648: 9101a3e5     	add	x5, sp, #0x68
    164c: 910183e6     	add	x6, sp, #0x60
    1650: 9101d3e7     	add	x7, sp, #0x74
    1654: b0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xff10>
    1658: 91360000     	add	x0, x0, #0xd80
    165c: 52800161     	mov	w1, #0xb                // =11
    1660: 90000002     	adrp	x2, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc4>
    1664: 911b1042     	add	x2, x2, #0x6c4
    1668: 97fffcee     	bl	0xa20 <__kmpc_fork_call@plt>
    166c: d503437f     	smstart	sm
    1670: d503427f     	smstop	sm
    1674: 97fffcc3     	bl	0x980 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
    1678: d503437f     	smstart	sm
    167c: cb1b0008     	sub	x8, x0, x27
    1680: 9e620100     	scvtf	d0, x8
    1684: fd001fe0     	str	d0, [sp, #0x38]
    1688: d503427f     	smstop	sm
    168c: fd401fe0     	ldr	d0, [sp, #0x38]
    1690: 043f583f     	addsvl	sp, sp, #0x1
    1694: 910203ff     	add	sp, sp, #0x80
    1698: a9494ff4     	ldp	x20, x19, [sp, #0x90]
    169c: a94857f6     	ldp	x22, x21, [sp, #0x80]
    16a0: a9475ff8     	ldp	x24, x23, [sp, #0x70]
    16a4: a94667fa     	ldp	x26, x25, [sp, #0x60]
    16a8: a9456ffc     	ldp	x28, x27, [sp, #0x50]
    16ac: a9447bfd     	ldp	x29, x30, [sp, #0x40]
    16b0: 6d4323e9     	ldp	d9, d8, [sp, #0x30]
    16b4: 6d422beb     	ldp	d11, d10, [sp, #0x20]
    16b8: 6d4133ed     	ldp	d13, d12, [sp, #0x10]
    16bc: 6cca3bef     	ldp	d15, d14, [sp], #0xa0
    16c0: d65f03c0     	ret

00000000000016c4 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined>:
    16c4: a9bb7bfd     	stp	x29, x30, [sp, #-0x50]!
    16c8: a90167fc     	stp	x28, x25, [sp, #0x10]
    16cc: a9025ff8     	stp	x24, x23, [sp, #0x20]
    16d0: a90357f6     	stp	x22, x21, [sp, #0x30]
    16d4: a9044ff4     	stp	x20, x19, [sp, #0x40]
    16d8: 910003fd     	mov	x29, sp
    16dc: d10083ff     	sub	sp, sp, #0x20
    16e0: 043f57ff     	addvl	sp, sp, #-0x1
    16e4: b9400048     	ldr	w8, [x2]
    16e8: 71000519     	subs	w25, w8, #0x1
    16ec: 5400224b     	b.lt	0x1b34 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x470>
    16f0: b9400018     	ldr	w24, [x0]
    16f4: aa0703f3     	mov	x19, x7
    16f8: aa0603f4     	mov	x20, x6
    16fc: aa0503f5     	mov	x21, x5
    1700: aa0403f6     	mov	x22, x4
    1704: aa0303f7     	mov	x23, x3
    1708: 52800028     	mov	w8, #0x1                // =1
    170c: b0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xff10>
    1710: 9135a000     	add	x0, x0, #0xd68
    1714: 910043e3     	add	x3, sp, #0x10
    1718: 910073e4     	add	x4, sp, #0x1c
    171c: 910063e5     	add	x5, sp, #0x18
    1720: 910053e6     	add	x6, sp, #0x14
    1724: 2a1803e1     	mov	w1, w24
    1728: 52800442     	mov	w2, #0x22               // =34
    172c: 52800027     	mov	w7, #0x1                // =1
    1730: 29037ff9     	stp	w25, wzr, [sp, #0x18]
    1734: 290223ff     	stp	wzr, w8, [sp, #0x10]
    1738: b90003e8     	str	w8, [sp]
    173c: 97fffcb1     	bl	0xa00 <__kmpc_for_static_init_4@plt>
    1740: 294323e9     	ldp	w9, w8, [sp, #0x18]
    1744: 93407d08     	sxtw	x8, w8
    1748: 6b19013f     	cmp	w9, w25
    174c: 1a99b12e     	csel	w14, w9, w25, lt
    1750: 6b0e011f     	cmp	w8, w14
    1754: b9001bee     	str	w14, [sp, #0x18]
    1758: 54001e6c     	b.gt	0x1b24 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x460>
    175c: b94002f0     	ldr	w16, [x23]
    1760: 7100061f     	cmp	w16, #0x1
    1764: 54001e0b     	b.lt	0x1b24 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x460>
    1768: 25d8e3e0     	ptrue	p0.d
    176c: a946a7aa     	ldp	x10, x9, [x29, #0x68]
    1770: 25f8c000     	mov	z0.d, #0x0              // =0
    1774: a945afac     	ldp	x12, x11, [x29, #0x58]
    1778: f9402bad     	ldr	x13, [x29, #0x50]
    177c: 14000004     	b	0x178c <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xc8>
    1780: eb2ec11f     	cmp	x8, w14, sxtw
    1784: 91000508     	add	x8, x8, #0x1
    1788: 54001cea     	b.ge	0x1b24 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x460>
    178c: 7100061f     	cmp	w16, #0x1
    1790: 54ffff8b     	b.lt	0x1780 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xbc>
    1794: 531c6d0e     	lsl	w14, w8, #4
    1798: aa1f03ef     	mov	x15, xzr
    179c: 93407dc2     	sxtw	x2, w14
    17a0: c00800ff     	zero	{za}
    17a4: b940028e     	ldr	w14, [x20]
    17a8: 531b69f0     	lsl	w16, w15, #5
    17ac: 710001df     	cmp	w14, #0x0
    17b0: 540010ed     	b.le	0x19cc <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x308>
    17b4: 85800262     	ldr	p2, [x19]
    17b8: f94002ae     	ldr	x14, [x21]
    17bc: f94002d2     	ldr	x18, [x22]
    17c0: b9400191     	ldr	w17, [x12]
    17c4: 2a1f03e1     	mov	w1, wzr
    17c8: 85800261     	ldr	p1, [x19]
    17cc: 85800264     	ldr	p4, [x19]
    17d0: 8b100dce     	add	x14, x14, x16, lsl #3
    17d4: 8b020e44     	add	x4, x18, x2, lsl #3
    17d8: e5bf1fa2     	str	p2, [x29, #-0x1, mul vl]
    17dc: 93407e32     	sxtw	x18, w17
    17e0: b9400280     	ldr	w0, [x20]
    17e4: 85800262     	ldr	p2, [x19]
    17e8: 85800265     	ldr	p5, [x19]
    17ec: 85800266     	ldr	p6, [x19]
    17f0: e5bf1ba2     	str	p2, [x29, #-0x2, mul vl]
    17f4: 85800267     	ldr	p7, [x19]
    17f8: 85800262     	ldr	p2, [x19]
    17fc: a5e0a491     	ld1d	{ z17.d }, p1/z, [x4]
    1800: a5e0a5d2     	ld1d	{ z18.d }, p1/z, [x14]
    1804: 11000423     	add	w3, w1, #0x1
    1808: a5e1a5d3     	ld1d	{ z19.d }, p1/z, [x14, #0x1, mul vl]
    180c: a5e2a5d4     	ld1d	{ z20.d }, p1/z, [x14, #0x2, mul vl]
    1810: 6b00007f     	cmp	w3, w0
    1814: a5e1a495     	ld1d	{ z21.d }, p1/z, [x4, #0x1, mul vl]
    1818: a5e3a5d6     	ld1d	{ z22.d }, p1/z, [x14, #0x3, mul vl]
    181c: 80d22620     	fmopa	za0.d, p1/m, p1/m, z17.d, z18.d
    1820: 85bf1fa3     	ldr	p3, [x29, #-0x1, mul vl]
    1824: 80d36e21     	fmopa	za1.d, p3/m, p3/m, z17.d, z19.d
    1828: 85bf1ba3     	ldr	p3, [x29, #-0x2, mul vl]
    182c: 80d46e22     	fmopa	za2.d, p3/m, p3/m, z17.d, z20.d
    1830: 80d69223     	fmopa	za3.d, p4/m, p4/m, z17.d, z22.d
    1834: 80d2b6a4     	fmopa	za4.d, p5/m, p5/m, z21.d, z18.d
    1838: 80d3daa5     	fmopa	za5.d, p6/m, p6/m, z21.d, z19.d
    183c: 80d4fea6     	fmopa	za6.d, p7/m, p7/m, z21.d, z20.d
    1840: 80d64aa7     	fmopa	za7.d, p2/m, p2/m, z21.d, z22.d
    1844: 54000caa     	b.ge	0x19d8 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x314>
    1848: 85800263     	ldr	p3, [x19]
    184c: b98001a6     	ldrsw	x6, [x13]
    1850: 8b120dc3     	add	x3, x14, x18, lsl #3
    1854: 8b060c85     	add	x5, x4, x6, lsl #3
    1858: a5e64c91     	ld1d	{ z17.d }, p3/z, [x4, x6, lsl #3]
    185c: a5f24dd2     	ld1d	{ z18.d }, p3/z, [x14, x18, lsl #3]
    1860: a5e1ac74     	ld1d	{ z20.d }, p3/z, [x3, #0x1, mul vl]
    1864: a5e1acb3     	ld1d	{ z19.d }, p3/z, [x5, #0x1, mul vl]
    1868: a5e2ac75     	ld1d	{ z21.d }, p3/z, [x3, #0x2, mul vl]
    186c: a5e3ac76     	ld1d	{ z22.d }, p3/z, [x3, #0x3, mul vl]
    1870: 11000826     	add	w6, w1, #0x2
    1874: 80d26e20     	fmopa	za0.d, p3/m, p3/m, z17.d, z18.d
    1878: 85800263     	ldr	p3, [x19]
    187c: 80d46e21     	fmopa	za1.d, p3/m, p3/m, z17.d, z20.d
    1880: 85800263     	ldr	p3, [x19]
    1884: 80d56e22     	fmopa	za2.d, p3/m, p3/m, z17.d, z21.d
    1888: 85800263     	ldr	p3, [x19]
    188c: 80d66e23     	fmopa	za3.d, p3/m, p3/m, z17.d, z22.d
    1890: 85800263     	ldr	p3, [x19]
    1894: 80d26e64     	fmopa	za4.d, p3/m, p3/m, z19.d, z18.d
    1898: 85800263     	ldr	p3, [x19]
    189c: 80d46e65     	fmopa	za5.d, p3/m, p3/m, z19.d, z20.d
    18a0: 85800263     	ldr	p3, [x19]
    18a4: 80d56e66     	fmopa	za6.d, p3/m, p3/m, z19.d, z21.d
    18a8: 85800263     	ldr	p3, [x19]
    18ac: 80d66e67     	fmopa	za7.d, p3/m, p3/m, z19.d, z22.d
    18b0: b9400284     	ldr	w4, [x20]
    18b4: b940018e     	ldr	w14, [x12]
    18b8: 6b0400df     	cmp	w6, w4
    18bc: 540008ca     	b.ge	0x19d4 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x310>
    18c0: 85800263     	ldr	p3, [x19]
    18c4: 93407dc6     	sxtw	x6, w14
    18c8: b98001a7     	ldrsw	x7, [x13]
    18cc: 8b060c6e     	add	x14, x3, x6, lsl #3
    18d0: 8b070ca4     	add	x4, x5, x7, lsl #3
    18d4: a5e74cb1     	ld1d	{ z17.d }, p3/z, [x5, x7, lsl #3]
    18d8: a5e64c72     	ld1d	{ z18.d }, p3/z, [x3, x6, lsl #3]
    18dc: 11000c26     	add	w6, w1, #0x3
    18e0: a5e1ac93     	ld1d	{ z19.d }, p3/z, [x4, #0x1, mul vl]
    18e4: a5e1add4     	ld1d	{ z20.d }, p3/z, [x14, #0x1, mul vl]
    18e8: a5e2add5     	ld1d	{ z21.d }, p3/z, [x14, #0x2, mul vl]
    18ec: a5e3add6     	ld1d	{ z22.d }, p3/z, [x14, #0x3, mul vl]
    18f0: 80d26e20     	fmopa	za0.d, p3/m, p3/m, z17.d, z18.d
    18f4: 85800263     	ldr	p3, [x19]
    18f8: 80d46e21     	fmopa	za1.d, p3/m, p3/m, z17.d, z20.d
    18fc: 85800263     	ldr	p3, [x19]
    1900: 80d56e22     	fmopa	za2.d, p3/m, p3/m, z17.d, z21.d
    1904: 85800263     	ldr	p3, [x19]
    1908: 80d66e23     	fmopa	za3.d, p3/m, p3/m, z17.d, z22.d
    190c: 85800263     	ldr	p3, [x19]
    1910: 80d26e64     	fmopa	za4.d, p3/m, p3/m, z19.d, z18.d
    1914: 85800263     	ldr	p3, [x19]
    1918: 80d46e65     	fmopa	za5.d, p3/m, p3/m, z19.d, z20.d
    191c: 85800263     	ldr	p3, [x19]
    1920: 80d56e66     	fmopa	za6.d, p3/m, p3/m, z19.d, z21.d
    1924: 85800263     	ldr	p3, [x19]
    1928: 80d66e67     	fmopa	za7.d, p3/m, p3/m, z19.d, z22.d
    192c: b9400285     	ldr	w5, [x20]
    1930: b9400183     	ldr	w3, [x12]
    1934: 6b0500df     	cmp	w6, w5
    1938: 5400046a     	b.ge	0x19c4 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x300>
    193c: 85800263     	ldr	p3, [x19]
    1940: 93407c63     	sxtw	x3, w3
    1944: b98001a5     	ldrsw	x5, [x13]
    1948: 11001021     	add	w1, w1, #0x4
    194c: 8b030dc6     	add	x6, x14, x3, lsl #3
    1950: 8b050c87     	add	x7, x4, x5, lsl #3
    1954: a5e54c91     	ld1d	{ z17.d }, p3/z, [x4, x5, lsl #3]
    1958: a5e34dd2     	ld1d	{ z18.d }, p3/z, [x14, x3, lsl #3]
    195c: a5e1acf3     	ld1d	{ z19.d }, p3/z, [x7, #0x1, mul vl]
    1960: a5e1acd4     	ld1d	{ z20.d }, p3/z, [x6, #0x1, mul vl]
    1964: a5e2acd5     	ld1d	{ z21.d }, p3/z, [x6, #0x2, mul vl]
    1968: a5e3acd6     	ld1d	{ z22.d }, p3/z, [x6, #0x3, mul vl]
    196c: 80d26e20     	fmopa	za0.d, p3/m, p3/m, z17.d, z18.d
    1970: 85800263     	ldr	p3, [x19]
    1974: 80d46e21     	fmopa	za1.d, p3/m, p3/m, z17.d, z20.d
    1978: 85800263     	ldr	p3, [x19]
    197c: 80d56e22     	fmopa	za2.d, p3/m, p3/m, z17.d, z21.d
    1980: 85800263     	ldr	p3, [x19]
    1984: 80d66e23     	fmopa	za3.d, p3/m, p3/m, z17.d, z22.d
    1988: 85800263     	ldr	p3, [x19]
    198c: 80d26e64     	fmopa	za4.d, p3/m, p3/m, z19.d, z18.d
    1990: 85800263     	ldr	p3, [x19]
    1994: 80d46e65     	fmopa	za5.d, p3/m, p3/m, z19.d, z20.d
    1998: 85800263     	ldr	p3, [x19]
    199c: 80d56e66     	fmopa	za6.d, p3/m, p3/m, z19.d, z21.d
    19a0: 85800263     	ldr	p3, [x19]
    19a4: 80d66e67     	fmopa	za7.d, p3/m, p3/m, z19.d, z22.d
    19a8: b98001ae     	ldrsw	x14, [x13]
    19ac: b9800183     	ldrsw	x3, [x12]
    19b0: b9400285     	ldr	w5, [x20]
    19b4: 8b0e0ce4     	add	x4, x7, x14, lsl #3
    19b8: 8b030cce     	add	x14, x6, x3, lsl #3
    19bc: 6b05003f     	cmp	w1, w5
    19c0: 54fff1eb     	b.lt	0x17fc <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x138>
    19c4: 2a0303f1     	mov	w17, w3
    19c8: 14000004     	b	0x19d8 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x314>
    19cc: b9400191     	ldr	w17, [x12]
    19d0: 14000002     	b	0x19d8 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x314>
    19d4: 2a0e03f1     	mov	w17, w14
    19d8: 1b027e2e     	mul	w14, w17, w2
    19dc: f9400171     	ldr	x17, [x11]
    19e0: 85800261     	ldr	p1, [x19]
    19e4: 8b2ece2e     	add	x14, x17, w14, sxtw #3
    19e8: 8b100dd0     	add	x16, x14, x16, lsl #3
    19ec: 2a1f03ee     	mov	w14, wzr
    19f0: c0c24407     	mov	z7.d, p1/m, za0h.d[w14, 0]
    19f4: 85800261     	ldr	p1, [x19]
    19f8: c0c24445     	mov	z5.d, p1/m, za1h.d[w14, 0]
    19fc: 85800261     	ldr	p1, [x19]
    1a00: c0c24483     	mov	z3.d, p1/m, za2h.d[w14, 0]
    1a04: 85800261     	ldr	p1, [x19]
    1a08: c0c244c1     	mov	z1.d, p1/m, za3h.d[w14, 0]
    1a0c: 110005ce     	add	w14, w14, #0x1
    1a10: 85800261     	ldr	p1, [x19]
    1a14: 85c0e151     	ld1rd	{ z17.d }, p0/z, [x10]
    1a18: b9800191     	ldrsw	x17, [x12]
    1a1c: 710021df     	cmp	w14, #0x8
    1a20: 05e0c4e7     	sel	z7.d, p1, z7.d, z0.d
    1a24: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1a28: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1a2c: 05e0c421     	sel	z1.d, p1, z1.d, z0.d
    1a30: 65ca8627     	fmulx	z7.d, p1/m, z7.d, z17.d
    1a34: 65ca8625     	fmulx	z5.d, p1/m, z5.d, z17.d
    1a38: 65ca8623     	fmulx	z3.d, p1/m, z3.d, z17.d
    1a3c: 65ca8621     	fmulx	z1.d, p1/m, z1.d, z17.d
    1a40: 85c0e131     	ld1rd	{ z17.d }, p0/z, [x9]
    1a44: 05e0c4e7     	sel	z7.d, p1, z7.d, z0.d
    1a48: 05e0c4a5     	sel	z5.d, p1, z5.d, z0.d
    1a4c: 05e0c463     	sel	z3.d, p1, z3.d, z0.d
    1a50: 05e0c421     	sel	z1.d, p1, z1.d, z0.d
    1a54: 65c08627     	fadd	z7.d, p1/m, z7.d, z17.d
    1a58: 65c08625     	fadd	z5.d, p1/m, z5.d, z17.d
    1a5c: 65c08623     	fadd	z3.d, p1/m, z3.d, z17.d
    1a60: 65c08621     	fadd	z1.d, p1/m, z1.d, z17.d
    1a64: e5e0e607     	st1d	{ z7.d }, p1, [x16]
    1a68: e5e1e605     	st1d	{ z5.d }, p1, [x16, #0x1, mul vl]
    1a6c: e5e2e603     	st1d	{ z3.d }, p1, [x16, #0x2, mul vl]
    1a70: e5e3e601     	st1d	{ z1.d }, p1, [x16, #0x3, mul vl]
    1a74: 8b110e10     	add	x16, x16, x17, lsl #3
    1a78: 54fffbc1     	b.ne	0x19f0 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x32c>
    1a7c: 2a1f03ee     	mov	w14, wzr
    1a80: c0c24510     	mov	z16.d, p1/m, za4h.d[w14, 0]
    1a84: 85800261     	ldr	p1, [x19]
    1a88: c0c24546     	mov	z6.d, p1/m, za5h.d[w14, 0]
    1a8c: 85800261     	ldr	p1, [x19]
    1a90: c0c24584     	mov	z4.d, p1/m, za6h.d[w14, 0]
    1a94: 85800261     	ldr	p1, [x19]
    1a98: c0c245c2     	mov	z2.d, p1/m, za7h.d[w14, 0]
    1a9c: 110005ce     	add	w14, w14, #0x1
    1aa0: 85800261     	ldr	p1, [x19]
    1aa4: 85c0e151     	ld1rd	{ z17.d }, p0/z, [x10]
    1aa8: b9800191     	ldrsw	x17, [x12]
    1aac: 710021df     	cmp	w14, #0x8
    1ab0: 05e0c610     	sel	z16.d, p1, z16.d, z0.d
    1ab4: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1ab8: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1abc: 05e0c442     	sel	z2.d, p1, z2.d, z0.d
    1ac0: 65ca8630     	fmulx	z16.d, p1/m, z16.d, z17.d
    1ac4: 65ca8626     	fmulx	z6.d, p1/m, z6.d, z17.d
    1ac8: 65ca8624     	fmulx	z4.d, p1/m, z4.d, z17.d
    1acc: 65ca8622     	fmulx	z2.d, p1/m, z2.d, z17.d
    1ad0: 85c0e131     	ld1rd	{ z17.d }, p0/z, [x9]
    1ad4: 05e0c610     	sel	z16.d, p1, z16.d, z0.d
    1ad8: 05e0c4c6     	sel	z6.d, p1, z6.d, z0.d
    1adc: 05e0c484     	sel	z4.d, p1, z4.d, z0.d
    1ae0: 05e0c442     	sel	z2.d, p1, z2.d, z0.d
    1ae4: 65c08630     	fadd	z16.d, p1/m, z16.d, z17.d
    1ae8: 65c08626     	fadd	z6.d, p1/m, z6.d, z17.d
    1aec: 65c08624     	fadd	z4.d, p1/m, z4.d, z17.d
    1af0: 65c08622     	fadd	z2.d, p1/m, z2.d, z17.d
    1af4: e5e0e610     	st1d	{ z16.d }, p1, [x16]
    1af8: e5e1e606     	st1d	{ z6.d }, p1, [x16, #0x1, mul vl]
    1afc: e5e2e604     	st1d	{ z4.d }, p1, [x16, #0x2, mul vl]
    1b00: e5e3e602     	st1d	{ z2.d }, p1, [x16, #0x3, mul vl]
    1b04: 8b110e10     	add	x16, x16, x17, lsl #3
    1b08: 54fffbc1     	b.ne	0x1a80 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0x3bc>
    1b0c: b98002f0     	ldrsw	x16, [x23]
    1b10: 910005ef     	add	x15, x15, #0x1
    1b14: eb1001ff     	cmp	x15, x16
    1b18: 54ffe44b     	b.lt	0x17a0 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xdc>
    1b1c: b9401bee     	ldr	w14, [sp, #0x18]
    1b20: 17ffff18     	b	0x1780 <_ZN4gemmIdE7computeEiiiPKdS2_Pddd.omp_outlined+0xbc>
    1b24: b0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xff10>
    1b28: 9135a000     	add	x0, x0, #0xd68
    1b2c: 2a1803e1     	mov	w1, w24
    1b30: 97fffb90     	bl	0x970 <__kmpc_for_static_fini@plt>
    1b34: 043f503f     	addvl	sp, sp, #0x1
    1b38: 910083ff     	add	sp, sp, #0x20
    1b3c: a9444ff4     	ldp	x20, x19, [sp, #0x40]
    1b40: a94357f6     	ldp	x22, x21, [sp, #0x30]
    1b44: a9425ff8     	ldp	x24, x23, [sp, #0x20]
    1b48: a94167fc     	ldp	x28, x25, [sp, #0x10]
    1b4c: a8c57bfd     	ldp	x29, x30, [sp], #0x50
    1b50: d65f03c0     	ret

0000000000001b54 <_ZN4gemmIdE12compute_testEiiiPKdS2_Pddd>:
    1b54: 6dba3bef     	stp	d15, d14, [sp, #-0x60]!
    1b58: 6d0133ed     	stp	d13, d12, [sp, #0x10]
    1b5c: 6d022beb     	stp	d11, d10, [sp, #0x20]
    1b60: 6d0323e9     	stp	d9, d8, [sp, #0x30]
    1b64: a9047bfd     	stp	x29, x30, [sp, #0x40]
    1b68: f9002bfc     	str	x28, [sp, #0x50]
    1b6c: 910103fd     	add	x29, sp, #0x40
    1b70: d10203ff     	sub	sp, sp, #0x80
    1b74: 043f5fff     	addsvl	sp, sp, #-0x1
    1b78: 6d0387e0     	stp	d0, d1, [sp, #0x38]
    1b7c: d503437f     	smstart	sm
    1b80: 52800208     	mov	w8, #0x10               // =16
    1b84: 52800409     	mov	w9, #0x20               // =32
    1b88: 25d8e3e0     	ptrue	p0.d
    1b8c: 1ac80c08     	sdiv	w8, w0, w8
    1b90: 6d4383e2     	ldp	d2, d0, [sp, #0x38]
    1b94: 290303a1     	stp	w1, w0, [x29, #0x18]
    1b98: b0000080     	adrp	x0, 0x12000 <__FRAME_END__+0xff10>
    1b9c: 91360000     	add	x0, x0, #0xd80
    1ba0: b9007fe2     	str	w2, [sp, #0x7c]
    1ba4: 90000002     	adrp	x2, 0x1000 <_Z9test_gemmIdEbiiiT_S0_+0xc4>
    1ba8: 911b1042     	add	x2, x2, #0x6c4
    1bac: a9068fe4     	stp	x4, x3, [sp, #0x68]
    1bb0: f90033e5     	str	x5, [sp, #0x60]
    1bb4: 6d050be0     	stp	d0, d2, [sp, #0x50]
    1bb8: 1ac90c29     	sdiv	w9, w1, w9
    1bbc: 290923e9     	stp	w9, w8, [sp, #0x48]
    1bc0: d10103a8     	sub	x8, x29, #0x40
    1bc4: 910163e9     	add	x9, sp, #0x58
    1bc8: e5bf1d00     	str	p0, [x8, #-0x1, mul vl]
    1bcc: 910143e8     	add	x8, sp, #0x50
    1bd0: a90223e9     	stp	x9, x8, [sp, #0x20]
    1bd4: 910183e8     	add	x8, sp, #0x60
    1bd8: 910063a9     	add	x9, x29, #0x18
    1bdc: a90123e9     	stp	x9, x8, [sp, #0x10]
    1be0: d10103a9     	sub	x9, x29, #0x40
    1be4: 910073a8     	add	x8, x29, #0x1c
    1be8: 04695fe9     	addspl	x9, x9, #-0x1
    1bec: a90023e9     	stp	x9, x8, [sp]
    1bf0: d503427f     	smstop	sm
    1bf4: 910133e3     	add	x3, sp, #0x4c
    1bf8: 910123e4     	add	x4, sp, #0x48
    1bfc: 9101c3e5     	add	x5, sp, #0x70
    1c00: 9101a3e6     	add	x6, sp, #0x68
    1c04: 9101f3e7     	add	x7, sp, #0x7c
    1c08: 52800161     	mov	w1, #0xb                // =11
    1c0c: 97fffb85     	bl	0xa20 <__kmpc_fork_call@plt>
    1c10: d503437f     	smstart	sm
    1c14: d503427f     	smstop	sm
    1c18: 043f583f     	addsvl	sp, sp, #0x1
    1c1c: 910203ff     	add	sp, sp, #0x80
    1c20: a9447bfd     	ldp	x29, x30, [sp, #0x40]
    1c24: f9402bfc     	ldr	x28, [sp, #0x50]
    1c28: 6d4323e9     	ldp	d9, d8, [sp, #0x30]
    1c2c: 6d422beb     	ldp	d11, d10, [sp, #0x20]
    1c30: 6d4133ed     	ldp	d13, d12, [sp, #0x10]
    1c34: 6cc63bef     	ldp	d15, d14, [sp], #0x60
    1c38: d65f03c0     	ret

Disassembly of section .fini:

0000000000001c3c <_fini>:
    1c3c: d503201f     	nop
    1c40: a9bf7bfd     	stp	x29, x30, [sp, #-0x10]!
    1c44: 910003fd     	mov	x29, sp
    1c48: a8c17bfd     	ldp	x29, x30, [sp], #0x10
    1c4c: d65f03c0     	ret
