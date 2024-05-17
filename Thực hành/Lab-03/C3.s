.section .data
    count:
        .int 0
    i: #So lan lap
        .int 5 #
    tbao:
        .string "Nhap 1 so nguyen (0 : 9) : "
    tb_length= . -tbao
    tb2:
        .string "So luong so lon hon hoac bang 5: "
    tb2_length= . -tb2
    enter:
        .byte 13,10

.section .bss
    .lcomm input, 3 # Khai bao input > 1

.section .text
    .globl _start

_start:
.InputLoop:
#Xuat thong bao
    movl $4, %eax # sys_write
    movl $1, %ebx # stdout
    movl $tbao, %ecx # address of prompt to write
    movl $tb_length, %edx # prompt length
    int $0x80 # call kernel

#Nhap input tu ban phim
    movl $3, %eax # sys_read
    movl $0, %ebx # stdin
    movl $input, %ecx # address
    movl $3, %edx # input length
    int $0x80 # call kernel

    subb $48, input # Doi tu ky tu sang so
    cmpb $5, (input) #So sánh với 5
    jl .L1 
    .L2: 
        addl $1, (count) #count++
    .L1:
    subl $1, i #i--
    cmpl $0, i #So sánh i với 0, nếu i>0 => tiếp tục nhập
    jg .InputLoop

#Xuat thong bao
    movl $4, %eax # sys_write
    movl $1, %ebx # stdout
    movl $tb2, %ecx #   address of prompt2to write
    movl $tb2_length, %edx # prompt2 length
    int $0x80 # call kernel

#Xuat count
    addl $48, count
    movl $4, %eax # sys_write
    movl $1, %ebx # stdout
    movl $count, %ecx # address of count to write
    movl $2, %edx # count length
    int $0x80 # call kernel

#Xuat enter
    movl $2, %edx # count length
    movl $enter, %ecx #address of count to write
    movl $1, %ebx # stdout
    movl $4, %eax # sys_write
    int $0x80 # call kernel

#ket thuc
    movl $1, %eax # system call number (sys_exit)
    int $0x80 # call kernel
