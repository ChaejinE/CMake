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
- CMake에서 파일들을 관련해 다룰 때 사용하는 명령어이다.
- GLOB-RECURSE 옵션 : 인자로 주어진 디렉토리와 해당 디렉토리 안에 있는 모든 하위 디렉토리 까지 재귀적으로 살펴본다는 의미
- 참고 : CMake에서 모든 변수들은  ${변수 이름}과 같은 식으로 참조한다.
  - 중괄호 !
- 주어진 디렉토리
  - ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp
  - ${CMAKE_CURRENT_SOURCE_DIR} : CMake에서 기본으로 제공하는 변수 현재 CMakeLists.txt가 위치한 디렉토리. 즉, 현재 디렉토리
- 위 명령을 *현재 디렉토리 안에 있는 모든 .cpp로 끝나는 파일들(하위 디렉토리 포함)**을 나타내며 해당 파일들을 모두 모아 SRC_FILES 라는 변수를 구성하라는 의미다.
- 하위 디렉토리를 포함하고 싶지 않다면 GLOB_RECURESE -> GLOB 으로 바꿔주면 된다.
- CONFIGURE_DEPENDS 옵션 : GLOB으로 불러오는 파일 목록이 이전과 다를 경우(파일 추가 삭제 시) CMake를 다시 실행해서 빌드 파일을 재생성하라는 의미
- 만약 디렉토리에 파일이 추가되더라도 cmake .. 실행할 필요 없이 그냥 make만 해도 CMake가 다시 실행되면서 빌드 파일을 재작성한다.
  - 아주 편리
- 사실 CMake에선 위 명령으로 파일들을 읽어들이는 것을 권장하지 않는다.
  - 파일이 추가 되더라도 CMake가 생성한 빌드 파일 안에 명시된 파일들이 바뀌는 것은 아니므로 CMake를 통해 어차피 빌드 파일을 생성해야 하기 때문이다.
  - CONFIGURE_DEPENDS 옵션을 주긴하지만 모든 빌드 시스템에서 안정적으로 동작하지는 않는다고 한다.

```CMake
add_library(shape STATIC ${SRC_FILES})
```
- SRC_FILES 변수에 파일들의 목록이 들어가있으므로 필요한 파일들을 모두 지정할 수 있다.