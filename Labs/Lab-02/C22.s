#C2.2 Chương trình chuyển đổi định dạng ngày (từ DDMMYYYY thành YYYYDDMM)

.section .data
    thongbao: .string "Date (DDMMYYYY): "
    thongbao1: .string "Date (YYYYDDMM): "

.section .bss
    .lcomm day, 8 #tao vung nho 8 byte - 8 ky tu
    .lcomm res, 8 #tao vung nho 8 byte - 8 ky tu

.section .text
    .globl _start
_start:
    #in thong bao nhap day
    movl $4, %eax  #goi ham sys_write
    movl $1, %ebx  #cach in la terminal
    movl $thongbao, %ecx #dia chi chuoi thong bao
    movl $18, %edx #do dai chuoi thong bao can in
    int $0x80 #call kernel

    #nguoi dung nhap
    movl $3, %eax  #goi ham sys_read
    movl $0, %ebx  #cach nhap la keyboard
    mov $day,%ecx  #dia chi day
    movl $9, %edx  #read 9 byte, bao gom n
    int $0x80

    #in thong bao
    movl $4, %eax  #goi ham sys_write
    movl $1, %ebx  #cach in la terminal
    movl $thongbao1, %ecx #dia chi chuoi thong bao
    movl $18, %edx #do dai chuoi thong bao can in
    int $0x80 #call kernel

    #tinh toan
    movl $day, %eax

    #dl, dh, cl, ch, al

    mov 4(%eax), %dl # vt nam 1
    mov 5(%eax), %dh # vt nam 2
    mov 6(%eax), %cl # vt nam 3
    mov 7(%eax), %ch # vt nam 4
    movl $res, %ebx
    mov %dl, 0(%ebx) # vt nam 1
    mov %dh, 1(%ebx) # vt nam 2
    mov %cl, 2(%ebx) # vt nam 3
    mov %ch, 3(%ebx) # vt nam 4

    mov 0(%eax), %dl # vt ngay
    mov 1(%eax), %dh # vt ngay
    mov 2(%eax), %cl # vt thang
    mov 3(%eax), %ch # vt thang
    mov %dl, 4(%ebx) # vt ngay
    mov %dh, 5(%ebx) # vt ngay
    mov %cl, 6(%ebx) # vt thang
    mov %ch, 7(%ebx) # vt thang


    #in ket qua
    movl $4, %eax  #goi ham sys_write
    movl $1, %ebx  #cach in la terminal
    movl $res, %ecx #dia chi ngay
    movl $8, %edx #do dai ngay
    int $0x80 #call kernel

    movl $1, %eax  # system call number exit 
    int $0x80      # call kernel
