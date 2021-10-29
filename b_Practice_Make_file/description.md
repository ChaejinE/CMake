# 실행파일 만들기
```cpp
#include <iosteam>

int main() {
    std::cout << "Hello, CMake" << std::endl;

    return 0;
}
```
- main.cc에 저장

# 빌드파일 생성
```
# CMake 프로그램의 최소 버전
cmake_minimum_required(VERSION 3.10)

# 프로젝트 정보
project(
  CJLotto
  VERSION 0.1
  DESCRIPTION "예제 프로젝트"
  LANGUAGES CXX)

add_executable (program main.cpp)
```
- 위 내용으로 CMakeLists.txt 생성
- 위 실행 파일과 같은 경로에 있어야 한다.

```
$ tree
.
├── build
├── CMakeLists.txt
└── main.cpp
```

- CMake에서 권장하는 방법은 빌드 파일은 작업하는 디렉토리와 다른 디렉토리에서 만드는 것이다.
- 프로젝트 폴더의 형태는 위와 같이 한다.

```
cmake ..
```
- build 폴더로 들어가서 실행한다.
  - CMake 실행 시 최상위 CMakeLists.txt가 위치한 폴더의 경로를 입력해야 한다.

```
-- The CXX compiler identification is GNU 7.5.0
-- Check for working CXX compiler: /usr/bin/c++
-- Check for working CXX compiler: /usr/bin/c++ -- works
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done
-- Generating done
-- Build files have been written to: /home/cjlotto/git_clone/CMake/b_Practice_Make_file/Practice/build
```
- 실행 성공

```
.
├── build
│   ├── CMakeCache.txt
│   ├── CMakeFiles
│   │   ├── 3.10.2
│   │   │   ├── CMakeCXXCompiler.cmake
│   │   │   ├── CMakeDetermineCompilerABI_CXX.bin
│   │   │   ├── CMakeSystem.cmake
│   │   │   └── CompilerIdCXX
│   │   │       ├── a.out
│   │   │       ├── CMakeCXXCompilerId.cpp
│   │   │       └── tmp
│   │   ├── cmake.check_cache
│   │   ├── CMakeDirectoryInformation.cmake
│   │   ├── CMakeOutput.log
│   │   ├── CMakeTmp
│   │   ├── feature_tests.bin
│   │   ├── feature_tests.cxx
│   │   ├── Makefile2
│   │   ├── Makefile.cmake
│   │   ├── program.dir
│   │   │   ├── build.make
│   │   │   ├── cmake_clean.cmake
│   │   │   ├── DependInfo.cmake
│   │   │   ├── depend.make
│   │   │   ├── flags.make
│   │   │   ├── link.txt
│   │   │   └── progress.make
│   │   ├── progress.marks
│   │   └── TargetDirectories.txt
│   ├── cmake_install.cmake
│   └── Makefile
├── CMakeLists.txt
└── main.cpp
```
- build 폴더 안에 많은 파일/폴더들이 생성되었다.
- Makefile도 만들어 졌다.
- **반드시 빌드 파일용 디렉토리를 만들고 그 디렉토리에서 CMake를 실행하자**
  - 여러 파일들을 캐시용도로 생성하는데, 디렉토리가 나름 난장판이다.
  - 이미 있는 파일 덮어쓰기 되면 멘탈 ㅂㅂ;

```
make
```
- build 폴더에 들어가서 make를 실행
- **program**이라는 실행 파일이 생성된다.

```
./program
```
- 실행하면
```
Hello, CMake
```
- 지린다..