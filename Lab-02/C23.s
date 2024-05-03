#C.2.3 Chương trình kiểm tra một số có phải số chẵn hay không?

.section .data
thongbao: .string "Nhap so nguyen tu 10 den 99\n"

.section .bss
    .lcomm x, 3 #tao vung nho 3 byte = 2 ky tu + 1 null
    .lcomm res, 2 

.section .text
    .globl _start
_start:
    #in thong bao nhap so
    movl $4, %eax  #goi ham sys_write
    movl $1, %ebx  #cach in la terminal
    movl $thongbao, %ecx #dia chi chuoi thong bao
    movl $29, %edx #do dai chuoi thong bao can in
    int $0x80 #call kernel

    #nguoi dung nhap
    movl $3, %eax  #goi ham sys_read
    movl $0, %ebx  #cach nhap la keyboard
    mov $x,%ecx  #dia chi day
    movl $2, %edx  #read 9 byte, bao gom n
    int $0x80

    #in so nguoi dung nhap (ktra)
    #movl $4, %eax  #goi ham sys_write
    #movl $1, %ebx  #cach in la terminal
    #movl $x, %ecx #dia chi ngay
    #movl $2, %edx #do dai ngay
    #int $0x80 #call kernel

    #doi chuoi sang so
    movl $x, %eax #chuyen gia tri x vao eax
    mov (%eax),%ebx
    sub $0x30,%ebx #chuyen ky tu dau tien sang so
    mov 1(%eax),%ecx
    sub $0x30,%ecx #chuyen ky tu thu 2 sang so

    #xu ly
    imull $0xA,%ebx #nhan ky tu dau tien voi 10
    addl %ecx,%ebx #cong ky tu thu 2 vao ket qua
    andl $0x1,%ebx # neu chan = 0, neu le = 1
    xorl $0x1, %ebx # dao bit cuoi ebx

    # chuyen so thanh chuoi
    movl %ebx,res   # luu kq vao res
    movb $0, res+1 # gan ky tu ket thuc chuoi
    addb $0x30,res # chuyen so thanh ky tu

    #in ket qua
    movl $4, %eax  #goi ham sys_write
    movl $1, %ebx  #cach in la terminal
    movl $res, %ecx #dia chi ngay
    movl $2, %edx #do dai ngay
    int $0x80 #call kernel

    movl $1, %eax  # system call number exit 
    int $0x80      # call kernel
