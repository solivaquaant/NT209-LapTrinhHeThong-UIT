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

## [Bài 1](/C21.s)  Chương trình kin ra độ dài của một chuỗi cho trước (tối đa 9 ký tự)

## [Bài 2](/C22.s)  Chương trình chuyển đổi định dạng ngày (từ DDMMYYYY thành YYYYDDMM)

## [Bài 3](/C23.s)  Chương trình kiểm tra một số có phải số chẵn hay không

## [Bài 4](/C24.s)  Chương trình đảo ngược các ký tự trong 1 chuỗi (5 chữ cái)