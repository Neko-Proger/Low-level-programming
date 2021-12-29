	.file	"form.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0_a2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	form
	.type	form, @function
form:
	li	a5,0
	blt	a0,zero,.L7
.L2:
	sw	a5,0(a1)
	ble	a2,zero,.L1
	slli	a2,a2,2
	add	a2,a1,a2
	li	a5,10
.L4:
	rem	a4,a0,a5
	sw	a4,0(a2)
	div	a0,a0,a5
	addi	a2,a2,-4
	bne	a2,a1,.L4
.L1:
	ret
.L7:
	neg	a0,a0
	li	a5,1
	j	.L2
	.size	form, .-form
	.ident	"GCC: (SiFive GCC 8.3.0-2020.04.1) 8.3.0"
