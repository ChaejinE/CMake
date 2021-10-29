# Property
- CMake의 명령어는 모두 target 기준으로 돌아간다.
- 각 target에는 Property를 정의할 수 있다.
- program이라는 타겟에 컴파일 옵션 속성을 설정하는 것이라 볼 수 있다.
- 그 외에도 어떠한 라이브러리를 링크하는 것인지, include 하는 파일은 어디서 보는지 등등 여러 속성을 정의해줄 수 있다.
- add_executable과 같이 CMake 명령은 타겟을 정의한다.
- target_compile_options 처럼 타겟들의 속성을 지정할 수 있다.

# include path setting
- CMake에서는 컴파일 시 헤더파일들을 찾을 경로의 위치를 지정할 수 있다.
- 보통 Compiler는 **#include<>**형태로 헤더 파일들은 시스템 경로에서 찾는다.
- **#include ""**형태는 따로 지정하지 않은 이상 현재 코드의 위치를 기준으로 찾는다.
  - 경우에따라, 특히 라이브러리 만들 시 헤더 파일들을 다른 곳에 위치시키는 경우가 있다.
  - 해당 파일들을 찾기 위해 컴파일 시 따로 경로를 지정해줘야 한다.

```
tree
  .
├── build
├── CMakeLists.txt
├── foo.cpp
├── includes
│   └── foo.h
└── main.cpp
```
- 위와 같은 구조라고 해보자.
- foo.h가 inlcudes 폴더 안에 있다.
- 그냥 컴파일 하면 foo.h를 찾을 수 없다는 오류가 난다.
  - includes 디렉토리를 헤더 파일 경로 탐색 시 확인하라고 알려줘야 한다.

```
target_include_directories(<실행 파일 이름> PUBLIC <경로 1> <경로 2> ...)
```
- [Reference](https://cmake.org/cmake/help/latest/command/target_include_directories.html)


```CMake
target_include_directories(program PUBLIC ${CMAKE_SOURCE_DIR}/includes)
```
- ${CMAKE_SOURCE_DIR}/includes를 헤더 파일 탐색 경로에 추가하고 있다.
- **CMake에서 디렉토리 경로를 지정할 때 왠만하면 절대경로를 쓰지 않는 것이 좋다.**
  - CMake 큰 장점 중 하나가 여러 플랫폼에서 사용할 수 있는 것인데 절대 경로로 박아 놓으면 다른 시스템에서 사용할 수 없기 때문이다.
- ${CMAKE_SOURCE_DIR}
  - CMake에서 기본으로 제공하는 변수
  - CMakeLists.txt의 경로를 의미한다. **프로젝트의 경로라고 볼 수 있다.**
  - 현재 프로젝트 안에 includes 디렉토리라고 보면 되겠다.
- 헤더 파일 탐색 경로를 추가하고 나면 컴파일이 잘 됨을 확인할 수 있다.