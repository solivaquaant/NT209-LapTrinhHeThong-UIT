#include <iostream>
#include <fstream>
#include <string>
using namespace std;

// Hàm thực hiện logic của Phase 5
bool phase5(const string &s)
{
    if (s.length() != 6) // Kiểm tra độ dài chuỗi
        return false;

    int result = 0;
    int v2 = 0;
    int array[] = {2, 10, 6, 1, 12, 16, 9, 3, 4, 7, 14, 5, 11, 8};

    // Thực hiện vòng lặp từ 0 đến 5
    for (int i = 0; i < 6; ++i)
    {
        // Lấy 4 bit cuối của s[i]
        int index = s[i] & 0xF;
        // Gán giá trị của mảng array tại chỉ số index vào result
        result = array[index];
        // Cộng result vào v2
        v2 += result;
    }

    // Kiểm tra nếu v2 khác 48 thì bom nổ
    if (v2 != 48)
    {
        return false;
    }

    return true;
}

int main()
{
    // Mở file để ghi
    ofstream outputFile("input.txt");

    // Duyệt tất cả các số từ 100000 đến 999999
    for (int a = 100000; a <= 999999; a++)
    {
        string input = to_string(a);
        if (phase5(input))
        {
            // Ghi vào file các chuỗi thỏa mãn yêu cầu
            outputFile << input << ", ";
        }
    }

    // Đóng file
    outputFile.close();

    return 0;
}