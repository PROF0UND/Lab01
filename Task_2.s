# Task 2
# Indirect addressing mode

.section .bss
.global ram
.lcomm ram, 256

.section .text
.globl fill_ram     # THIS is what makes the function visible to the C program

fill_ram:
    lea ram+0x50, %edi

    # counter starts at 8
    mov $0x08, %ecx

    loop_start:

        movb $0xAA, (%edi)
        # increase the edi to go to the next index
        inc %edi

        # decrease the counter 
        dec %ecx
        # if the counter is not zero, jump back to the start
        jnz loop_start

    ret

.section .note.GNU-stack,"",@progbits
