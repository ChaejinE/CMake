# Overview
![image](https://user-images.githubusercontent.com/69780812/139410500-61983966-e0c0-4b5d-8a73-7992e021b622.png)

- 일반적으로 규모가 큰 C++ 프로젝트의 경우 위와 같은 구조를 가진다.
- 라이브러리 : 특정 역할을 수행할 수 있는 코드들을 모아놓은 것
  - Ex) \<filesystem> : C++에 파일 시스템 관련 작업을 하는 것을 모아 놓은 라이브러리
- C++ 개발 시 프로그램의 여러가지 요소들을 하나의 거대 라이브러리로 만들기 보다 각각의 요소들로 쪼개서 만드는 경우가 많다.
  - 1. 거대한 실행 파일로 관리한다 ? 코드가 바뀔 때마다 전체를 다시 컴파일 해야된다. 라이브러리의 경우 **바뀌지 않은 부분은 컴파일 하지 않아도 되서 개발속도가 빠르다. Linking만 하면 된다.**
  - 2. 라이브러리의 각 요소들을 전체 한꺼번에 묶어 놓았을 때 보다 **Testing 하기가 용이하다.**
- 위 그림에서는 실행파일을 만들기 위해 두 개 라이브러리를 사용한다. 또한 각 라이브러리는 또 다른 외부 라이브러리들을 참조하고 있다.
    - 외부 라이브러리들이 잘 설치되어 있는지 확인이 필요하다.
    - 라이브러리 1과 라이브러리 2가 각각에 맞는 외부 라이브러리들을 참조할 수 있도록 설정해야한다.
    - 실행파일을 만들 때, 라이브러리 1과 2를 사용하도록 해야한다.
- 위 3가지 작업을 하려고 MakeFile을 만들었다면 미친놈이다.. 너무 힘들다.

# Practice
```cpp
class Rectangle {
    public:
        Rectangle(int width, int height);
        int GetSize() const;

    private:
        int width_, height_;
};
```
- includes에 shape.h를 만든다.

```cpp
#include "shape.h"

Rectangle::Rectangle(int width, int height) : width_(width), height_(height) {}

int Rectangle::GetSize() const {
    return width_ * height_;
}
```
- lib에 shape.cpp을 작성한다.
- 위 라이브러리를 어떻게 빌드해야할지 알려주는 것을 작성해야한다.

```CMake
# /lib/CMakeLists.txt

# 정적 라이브러리 shape 를 만든다.
add_library(shape STATIC shape.cpp)

# 해당 라이브러리 컴파일 시 사용할 헤더파일 경로
target_include_directories(shape PUBLIC ${CMAKE_SOURCE_DIR}/includes)

# 해당 라이브러리를 컴파일 할 옵션
target_compile_options(shape PRIVATE -Wall -Werror)
```
- 라이브러리를 위한 CMake다.
- lib 디렉토리에 CMakeLists.txt를 만든다.

# add_library
- 만들어낼 라이브러리 파일을 추가하는 것이다.
```
add_library (<라이브러리 이름> [STATIC | SHARED | MODULE ] <소스 1> <소스 2> ...)
```
- [Reference](https://cmake.org/cmake/help/latest/command/add_library.html)
- 중간에 어떠한 형태릐 라이브러리를 만들지 설정할 수 있다.
  - STATIC : 정적라이브러리
  - SHARED : 동적으로 링크되는 동적라이브러리
  - MODULE : 동적으로 링크되지는 않지만 dlopen과 같은 함수로 런타임 시에 불러올 수 있는 라이브러리를 생성한다.
  - [동적 VS 정적 라이브러리](https://modoocode.com/321#page-heading-13)
- 정적라이브러리 : 프로그램 실행 파일에 라이브러리 코드가 전부 들어있는 것
- 동적라이브러리 : 프로그램 실행 파일에 라이브러리가 포함되어 있는 것이 아니라 메모리에 라이브러리가 따로 올라가며 이를 참조하는 형태다.
- 보통 정적으로 링크하면 실행 파일의 크기가 커지는 대신 동적 라이브러리를 사용할 때보다 빠르다.

```CMake
# 해당 라이브러리 컴파일 시 사용할 헤더파일 경로
target_include_directories(shape PUBLIC ${CMAKE_SOURCE_DIR}/includes)

# 해당 라이브러리를 컴파일 할 옵션
target_compile_options(shape PRIVATE -Wall -Werror)
```
- 간단한 실습을 위해 STATIC으로 설정한다.
- PUBLIC VS PRIVATE
  - CMake에서 A lib이 B lib을 사용하면 A는 B의 컴파일 옵션들과 헤더 파일 탐색 디렉토리 목록을 물려받게 된다.
  - PUBLIC으로 설정된 것은 물려 받는다.
  - PRIVATE으로 설정된 것은 물려 받지 않는다.

```CMake
target_include_directories(shape PUBLIC ${CMAKE_SOURCE_DIR}/includes)
```
- shape을 컴파일 할 때 헤더 파일 경로에 ${CMAKE_SOURCE_DIR}/includes 경로를 추가해달라.
- shape을 참조하는 타겟의 헤더 파일 검색 경로에 ${CMAKE_SOURCE_DIR}/includes를 추가해달라.
- program이 shape을 사용하면 program을 컴파일할 때 파일 검색 경로에 ${CMAKE_SOURCE_DIR}/includes 경로가 자동으로 추가된다.

```CMake
target_compile_options(shape PRIVATE -Wall -Werror)
```
- 라이브러리를 컴파일하는 옵션이다.
- PRIVATE으로 설정
  - shape 빌드 시 -Wall, -Werror를 적용하고 싶지만 shape을 사용하는 애들에게까지 이 옵션을 강제하고 싶지 않기 때문이다.

# target_link_libraries
- [Reference](https://cmake.org/cmake/help/latest/command/target_link_libraries.html)

![image](https://user-images.githubusercontent.com/69780812/139414279-51e7cb3b-496f-46d0-8bf8-83a566c22fab.png)

- shape을 program에 링크해서 사용해보자.

```CMake
# CMake 프로그램의 최소 버전
cmake_minimum_required(VERSION 3.10)

# 프로젝트 정보
project(
  MakeLib
  VERSION 0.1
  DESCRIPTION "예제 프로젝트"
  LANGUAGES CXX)

# 확인할 디렉토리 추가
add_subdirectory(lib)

add_executable (program main.cpp)

# program 에 shape 를 링크
target_link_libraries(program shape)
```
- main을 위한 CMake다.
- add-subdirectory 명령어를 통해 CMake가 추가로 확인해야 할 디렉토리의 경로를 지정해준다.
  - CMake가 해당 디렉토리로 가서 그 안에 있는 CMakeLists.txt도 실행한다.

```CMake
# program 에 shape 를 링크
target_link_libraries(program PUBLIC shape)
```
- program 빌드 시 shape 라이브러리를 링크 시켜준다.
- 실행 파일은 PUBLIC이냐 PRIVATE이냐 여부가 중요하지 않다.
  - 실행 파일을 다른 타겟이 참조할 수 없기 때문
  - 그래서 그냥 (program shape)으로만 써도 된다.

```cpp
#include <iostream>
#include "shape.h"

int main(){
    Rectangle rect(5, 6);
    std::cout << "Get size : " << rect.GetSize() << std::endl;
    return 0;
}
```
- main.cpp

```shell
tree .
.
├── build
├── CMakeLists.txt
├── includes
│   └── shape.h
├── lib
│   ├── CMakeLists.txt
│   └── shape.cpp
└── main.cpp
```
- 파일 구조는 이렇게 된다.
- CMake 시, build에 가면 libshape.a 정적 라이브러리가 있고, CMake는 Library를 만들면 앞에 lib을 붙인 러이브러리 파일을 만든다.

```shell
Get size : 30
```
- 실행의 결과는 위와 같을 것이다.
