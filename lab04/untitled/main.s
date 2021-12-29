	.file	"main.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0_a2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	addi	s0,sp,32
	addi	sp,sp,-16
	mv	s2,sp
	li	a2,2
	mv	a1,s2
	li	a0,32
	call	form
	mv	s1,s2
	addi	s2,s2,12
	lui	s3,%hi(.LC0)
.L2:
	lw	a1,0(s1)
	addi	a0,s3,%lo(.LC0)
	call	printf
	li	a0,10
	call	putchar
	addi	s1,s1,4
	bne	s2,s1,.L2
	li	a0,0
	addi	sp,s0,-32
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"%d"
	.ident	"GCC: (SiFive GCC 8.3.0-2020.04.1) 8.3.0"
