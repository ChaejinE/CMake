# add_executable
- CMake에서 실행 파일을 생성하기 위해 사용한다.
- 맨 처음 생성하고자 하는 실행 파일 이름을 적고 그 뒤로 해당 실행 파일을 만드는데 필요한 소스들을 나열하면 된다.

# Practice
- 실행파일 생성 시 main.cpp, foo.cpp가 필요하다고 해보자.

```cpp
int foo();
```
- foo.h 

```cpp
#include "foo.h"

int foo() { return 3; }
```
- foo.cpp

```cpp
#include <iostream>
#include "foo.h"

int main() {
    std::cout << "Foo : " << foo() << std::endl;

    return 0
}
```
- main.cpp

```
add_executable (program main.cc foo.cc)
```
- 컴파일에 필요한 소스파일들인 main.cpp, foo.cpp를 위와 같이 해주면 된다.
- 하지만 이 상태로 make 하면 에러가난다.
  - CMakeLists.txt를 바꿨지만 Makefile을 바꾼 것은 아니기 때문이다.
  