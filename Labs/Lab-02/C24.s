#C.2.4 Chương trình đảo ngược các ký tự trong 1 chuỗi (5 chữ cái)

.section .data
noti:
	.string "Nhap chuoi: \n"
noti_len = . - noti	

.section .bss
	.lcomm text, 6 #str + null
	.lcomm rtext, 5
	
.section .text
	.globl _start
_start: 
#in thong bao
	movl $4, %eax #sys_write
	movl $1, %ebx #stdout
	movl $noti, %ecx #dia chi output
	movl $noti_len, %edx #do dai
	int $0x80 

#nguoi dung nhap chuoi
	movl $3, %eax #sys_read
	movl $0, %ebx #stdin
	movl $text, %ecx #dia chi
	movl $5, %edx #do dai
	int $0x80
	
	movl $text, %eax
	
	mov 0(%eax), %dl #ki tu 1 (dau tien) trongn chuoi
	mov 1(%eax), %dh #ki tu thu 2 trong chuoi
	mov 2(%eax), %cl #ki tu thu 3 trong chuoi
	mov 3(%eax), %ch #ki tu thu 4 trong chuoi
	mov 4(%eax), %r8w #ki tu thu 5 trong chuoi
	
	movl $rtext, %ebx 
	mov %r8w, 0(%ebx)  #chuyen ki tu thu  5 sang vi tri thu 1
	mov %ch, 1(%ebx) #chuyen ki tu thu 4 sang vi tri thu 2
	mov %cl, 2(%ebx) #chuyen ki tu thu 3 sang vi tri thu 3
	mov %dh, 3(%ebx) #chuyen ki tu thu 2 sang vi tri thu 4
	mov %dl, 4(%ebx) #chuyen ki tu thu 1 sang vi tri thu 5
	
	movl $4, %eax #sys_write
	movl $1, %ebx #stdout
	movl $rtext, %ecx #dia chi output
	movl $5, %edx #do dai
	int $0x80

	
	movl $1, %eax
	int $0x80
