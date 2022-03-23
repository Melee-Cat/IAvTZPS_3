#include <iostream>
extern "C" {
 unsigned int crc32d(const unsigned int* buf, unsigned long len);
}
int main() { unsigned int in_arr[] = {1,2,3,4,5,6,7,8,9,1};
 unsigned int res = crc32d(in_arr, 10);
 std::cout << std::hex << res << std::endl;
 return 0;
} 
