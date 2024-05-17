T thêm phần Hiện thông tin giới tính với nâng cao độn tuổi của nữ á:
.section .data
thongbao: .string "Nhap cccd \n"
ketqua1: .string "Chua den tuoi lao dong\n"
ketqua2: .string "Trong do tuoi lao dong\n"
ketqua3: .string "Het tuoi lao dong\n"
kqNam: .string "Gioi tinh Nam\n"
kqNu: .string "Gioi tinh Nu\n"

.section .bss
    .lcomm input, 13    # Tạo vùng nhớ có 13 ký tự để đọc vào (bao gồm cả ký tự kết thúc chuỗi)
    .lcomm age, 2
    .lcomm x, 1
    .lcomm y, 1

.section .text
    .globl _start
_start:
    # In thông báo nhập chuỗi
    movl $4, %eax       # Gọi hàm sys_write
    movl $1, %ebx       # In ra terminal
    movl $thongbao, %ecx   # Địa chỉ chuỗi thông báo
    movl $11, %edx      # Độ dài chuỗi cần in
    int $0x80           # Gọi hàm kernel

    # Người dùng nhập
    movl $3, %eax       # Gọi hàm sys_read
    movl $0, %ebx       # Nhập từ bàn phím
    mov $input, %ecx    # Địa chỉ chuỗi nhập
    movl $13, %edx      # Đọc 13 byte (bao gồm cả ký tự kết thúc chuỗi)
    int $0x80           # Gọi hàm kernel

    # Xử lí bit 4-5: 2 số cuối năm sinh XY
    movl $input, %eax   # Địa chỉ của chuỗi nhập
    movb 4(%eax), %cl   # ký tự thứ 5 của chuỗi X
    movb 5(%eax), %bl   # ký tự thứ 6 của chuỗi Y

    sub $48,%cl         # Chuyển ký tự thứ 5 sang số
    sub $48,%bl         # Chuyển ký tự thứ 6 sang số

    movzbl %cl, %ecx    # Mở rộng giá trị 8-bit trong %cl thành 32-bit trong %ecx
    movzbl %bl, %ebx # Mở rộng giá trị 8-bit trong %bl thành 32-bit trong %ebx
    imul $10, %ecx      # Nhân giá trị với 10 X*10
    addl %ebx, %ecx #Cộng giá trị hàng chục và hàng đơn vị năm sinh X*10+Y

    # So sánh ký tự thứ 4 (bit thứ 4) để xác định thế kỷ
    cmpb $'1', 3(%eax) 
    jle .TheKy20 #Nếu <= 1 (0,1) =>Thế kỷ 20
    jmp .TheKy21 #Còn lại => Thế kỷ 21

.TheKy20:
    addl $1900, %ecx    # Năm sinh = 1900 + X*10 + Y
    jmp .calculate_age

.TheKy21:
    addl $2000, %ecx    # Năm sinh = 2000 + X*10 + Y
    jmp .calculate_age

.calculate_age: 
    # Tính tuổi
    movl $2024, %edx    # %edx = 2024 (năm hiện tại)
    subl %ecx, %edx     # %edx = 2024 - năm sinh

# In kết quả dựa trên tuổi
    cmpl $15, %edx      # So sánh với 15
    jl .printKetqua1   # Nếu bé hơn 15
    cmpb $'1',3(%eax)
    je .DoTuoiNu
    cmpb $'3',3(%eax)
    je .DoTuoiNu
    cmpl $60, %edx      # So sánh với 60
    jl .printKetqua2   # Nếu lớn hơn 60
    jmp .printKetqua3   # Còn lại in kết quả 2
    
.DoTuoiNu:
    cmpl $55, %edx      # So sánh với 60
    jl .printKetqua2   # Nếu lớn hơn 60
    jmp .printKetqua3   # Còn lại in kết quả 2

.printKetqua1:
    # In kết quả
    movl $4, %eax       # Gọi hàm sys_write
    movl $1, %ebx       # In ra terminal
    movl $ketqua1, %ecx # Địa chỉ của chuỗi kết quả
    movl $23, %edx      # Độ dài của chuỗi
    int $0x80           # Gọi hàm kernel
    jmp .GioiTinh

.printKetqua2:
    # In kết quả
    movl $4, %eax       # Gọi hàm sys_write
    movl $1, %ebx       # In ra terminal
    movl $ketqua2, %ecx # Địa chỉ của chuỗi kết quả
    movl $23, %edx      # Độ dài của chuỗi
    int $0x80           # Gọi hàm kernel
    jmp .GioiTinh

.printKetqua3:
    # In kết quả
    movl $4, %eax       # Gọi hàm sys_write
    movl $1, %ebx       # In ra terminal
    movl $ketqua3, %ecx # Địa chỉ của chuỗi kết quả
    movl $18, %edx      # Độ dài của chuỗi
    int $0x80           # Gọi hàm kernel
    jmp .GioiTinh

.GioiTinh:
    movl $input, %eax
    # So sánh ký tự thứ 4 (bit thứ 4) để xác định giới tính
    cmpb $'0', 3(%eax) 
    je .Nam
    cmpb $'2', 3(%eax) 
    je .Nam
    jmp .Nu

#In kết quả giới tính
.Nam:
    movl $4, %eax       # Gọi hàm sys_write
    movl $1, %ebx       # In ra terminal
    movl $kqNam, %ecx # Địa chỉ của chuỗi kết quả
    movl $15, %edx      # Độ dài của chuỗi
    int $0x80           # Gọi hàm kernel
    jmp .exit

.Nu:
    movl $4, %eax       # Gọi hàm sys_write
    movl $1, %ebx       # In ra terminal
    movl $kqNu, %ecx    # Địa chỉ của chuỗi kết quả
    movl $14, %edx      # Độ dài của chuỗi
    int $0x80           # Gọi hàm kernel
    jmp .exit

.exit:
    movl $1, %eax
    int $0x80
