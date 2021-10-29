#include <iostream>
#include "shape.h"

int main(){
    Rectangle rect(5, 6);
    std::cout << "Get size : " << rect.GetSize() << std::endl;
    return 0;
}