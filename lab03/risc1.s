.rodata

input: .float 3.1415

.data

sign: .word 0

eps: .word 0

mant: .word 0

mant210: .zero 32

.text

.globl __start

__start:

la a1, input

lw a0, 0(a1)

if_sign: bgez a0, end_if_sign # запись знака

la a1, sign

li t0, 1

sw t0, 0(a1)

end_if_sign:

srli t0, a0, 23

li t1, 0xFF

and t0, t0, t1

la a1, eps

sw t0, 0(a1) # записываем эпсилон

li t1, 0x7FFFFF

and t0, a0, t1

la a1, mant

sw t0, 0(a1) # записываем мантиссу

while_mantissa_nez: beqz t0, finish

li t2, 2

rem a0, t0, t2

srli t0, t0, 1

addi sp, sp, -4

sw t0, 0(sp)

la t0, mant210

la t1, mant210

addi t0, t0, 96

lb t2, 0(t0)

add t2, t2, a0

mv a0, t2

mv a1, zero

update: beq t0, t1, end_update # цикл обновления результата

addi sp, sp, -12

sw t0, 0(sp)

sw t1, 4(sp)

sw ra, 8(sp)

li t2, 2

rem t1, a0, t2

srli a0, a0, 1

shift_if: beqz a1, end_shift_if

addi a0, a0, 5

end_shift_if:

mv a1, t1

lw t0, 0(sp)

lw t1, 4(sp)

lw ra, 8(sp)

addi sp, sp, 12

sw a0, 0(t0)

addi t0, t0, -4

lb a0, 0(t0)

j update

end_update:

lw t0, 0(sp)

addi sp, sp, 4

j while_mantissa_nez

finish:

li a0, 1

lw a1, sign

ecall # печатаем знак

li a0, 1

lw a1, eps

ecall # печатаем эпсилон

li a0, 10

ecall # завершаем программу