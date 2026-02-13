# Task 4
# Clearing ram

.section .bss
.global ram
.lcomm ram, 256 # just one byte

.section .text
.globl fill_ram     # THIS is what makes the function visible to the C program

fill_ram:

    # load the ram data into the EDI register
    lea ram+0x50, %edi

    # counter starts at 10
    mov $0x0A, %ecx
    mov $0x00, %eax

    # loop to add
    loop_start:

        add %ecx, %eax

        dec %ecx
        jnz loop_start
    
    mov %eax, (%edi)

    ret

.section .note.GNU-stack,"",@progbits
