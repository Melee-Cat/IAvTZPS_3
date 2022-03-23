#include <iostream>
extern "C" {
char* getCpuName();
}
int main() {
std::cout << "CPU name is: " << getCpuName() <<'\n';
return 0;
}