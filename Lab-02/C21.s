#C.2.1 Chương trình in ra độ dài của một chuỗi cho trước (tối đa 9 ký tự)

.section .data
output: 
	.string "NT209UIT"
length = . - output #do dai chuoi

.section .bss
.lcomm test,  1

.section .text 
    .globl _start
_start:
	addl $48, %esi #chuyen tu so sang ky tu
	add $length, %esi 
	subl $1, %esi #tru di ki tu null
	movl %esi, (test) 
	
	movl $4, %eax #sys_write
	movl $1, %ebx #cach in la terminal
	movl $test, %ecx #ket qua
	movl $1, %edx #do dai
	int $0x80 #call kernel
	 
	movl $1, %eax
	int $0x80
