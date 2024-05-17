# Hướng dẫn cách chạy code
- Hợp dịch với công cụ **as** để thu được một file nhj phân **.o** từ file **.s**:
```
as -o <file.o> <file.s đầu vào>
```
- Liên kết với công cụ **ld** để tạo file thực thi của chương trình:
```
ld -o <file thực thi> <file.o đầu vào>
```
- Thực thi file
```
./<file thực thi đầu ra>
```

## [Bài 1](/C1.s)  Chương trình kiểm tra tính giảm dần của các chữ số trong số có 5 chữ số  

## [Bài 2](/C2.s)  Chuẩn hóa chuỗi ký tự có 10 ký tự

## [Bài 3](/C3.s)  Chương trình đếm số lớn hơn hoặc bằng 5 trong 5 số có 1 chữ số

## [Bài 4](/C4.s)  Kiểm tra tuổi lao động dựa trên Căn cước công dân (CCCD)