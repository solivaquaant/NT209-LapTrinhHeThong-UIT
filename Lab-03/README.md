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