# FetchContent
- **원하는 라이브러리를 설치한다.**
  - Python's pip 같이
  - C++에서는 언어 상 제공하는 기능이 없어 외부 라이브러리를 불러오거나 설치하는 것이 굉장히 불편하다.

# fmt 라이브러리 Practice
- [fmt Github](https://github.com/fmtlib/fmt)
- FetchContent는 적어도 3.11 이상 버전의 CMake를 사용해야한다.
  - 그 이하는 ExternalProject 모듈 사용
  - FetchContent는 CMake를 실행하는 시점에서 외부 파일을 불러온다.
  - 반면 ExternalProject는 빌드 타임에 불러온다.

```CMake
include(FetchContent)
FetchContent_Declare(
    Fmt
    GIT_REPOSITORY ""https://github.com/fmtlib/fmt"
    GIT_TAG "7.1.3"
)
FetchContent_MakeAvailable(Fmt)
```
- fmt 라이브러리를 CMake를 통해 불러오고 설치하는 명령

```CMake
include(FetchContent)
```
- include를 통해 FetchContent 모듈을 불러온다.

```CMake
FetchContent_Declare(
  Fmt
  GIT_REPOSITORY "https://github.com/fmtlib/fmt"
  GIT_TAG "7.1.3"
)
```
- 어디에서 데이터를 불러올지 명시한다.
- 깃허브에 특정 릴리즈를 가져왔다. 7.1.3

```CMake
FetchContent_MakeAvailable(Fmt)
```
- 위 처럼 fmt를 사용할 수 있도록 설정한다.
- FetchContent로 불러온 라이브러리는 프로젝트 전체에서 사용가능하다.

```cpp
#include <fmt/core.h>

#include <iostream>
#include <thread>

#include "shape.h"

Rectangle::Rectangle(int width, int height) : width_(width), height_(height) {}

int Rectangle::GetSize() const {
  std::thread t([this]() { std::cout << "Calulate .." << std::endl; });
  t.join();

  fmt::print("width : {} \n", width_ * height_);

  // 직사각형의 넓이를 리턴한다.
  return width_ * height_;
}

void Rectangle::SetColor(Color color) { color_ = color; }
```
- shape라이브러리에서 fmt를 사용하고 싶다면 위 처럼 추가하면 된다.
- /build/shape.cpp
- fmt::print를 사용해본 것이다.
---
- CMake Upgrade
```shell
sudo apt remove cmake

sudo wget https://cmake.org/files/v3.11/cmake-3.11.0.tar.gz
tar -zxvf cmake-3.11.0.tar.gz

cd cmake-3.11.0
./bootstrap
make
sudo make install

cmake --version
```
---
