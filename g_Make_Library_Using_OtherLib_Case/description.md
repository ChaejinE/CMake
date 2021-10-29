# 다른 라이브러리를 사용하는 라이브러리
- Shape 라이브러리에서 thread 라이브러리를 사용한다고 해보자.

```cpp
#include <iostream>
#include <thread>

#include "shape.h"

Rectangle::Rectangle(int width, int height) : width_(width), height_(height) {}

int Rectangle::GetSize() const {
    std::thread t([this]() {
        std::cout << "Calculate .." << std::endl;
    });

    t.join();

    return width_ * height_;
}
```
- /lib/shape.cpp

```CMake
# /lib/CMakeLists.txt

# 정적 라이브러리 shape 를 만든다.
add_library(shape STATIC shape.cpp)

# 해당 라이브러리 컴파일 시 사용할 헤더파일 경로
target_include_directories(shape PUBLIC ${CMAKE_SOURCE_DIR}/includes)

# 해당 라이브러리를 컴파일 할 옵션
target_compile_options(shape PRIVATE -Wall -Werror)

target_link_libraries(shape PRIVATE pthread)
```
- /lib/CMakeLists.txt

# target_link_libraries
```CMake
add_library(shape STATIC shape.cc)
target_include_directories(shape PUBLIC ${CMAKE_SOURCE_DIR}/includes)
target_compile_options(shape PRIVATE -Wall -Werror)

# pthread 라이브러리를 링크
target_link_libraries(shape PRIVATE pthread)
```
- pthread 라이브러리를 통해 shape에 pthread 라이브러리를 추가해준다.
---
- target_link_libraries를 통해 Dependency library를 추가할때 세가지 방식이 있다.
- 어떤 라이브러리 A를 참조한다고 해보자.
  - A를 헤더 파일과 구현 내부에서 모두 사용 : PUBLIC
  - A를 내부 구현에서만 사용하고, 헤더파일에서는 사용 X : PRIVATE
  - A를 헤더 파일에서만 사용하고 내부 구현에는 사용 X : INTERFACE
- 위의 경우 \<thread>를 내부 구현에서만 사용하므로 PRIVATE으로 링크해주는 것이 맞다.
  - 이를 통해 shape을 사용하는 다른 라이브러리가 불필요하게 pthread를 링크해주는 일을 막을 수 있다.

# 파일 한꺼번에 추가
```CMake
add_library(shape STATIC shape.cpp color.cpp circle.cpp)
```
- 위 방식은 라이브러리가 추가될때마다 수정해줘야하는 번거러움이 있다.
- **이 디렉토리에 있는 파일들을 모두 이 라이브러리를 빌드하는데 사용해달라**고 명령할 수 있는 방법을 제공한다.

## file
- [Reference](https://cmake.org/cmake/help/latest/command/file.html)

```CMake
file(GLOB_RECURSE SRC_FILES CONFIGURE_DEPENDS
  ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp
)

add_library(shape STATIC ${SRC_FILES})
```
