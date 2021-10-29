# target_compile_options
```
target_compile_options(<실행 파일 이름> PUBLIC <컴파일 옵션1> <컴파일 옵션2> ...)
```
- 컴파일 옵션을 지정하고 싶을 때 사용하는 명령어

```
target_compile_options(program PUBLIC -Wall -Werror)
```
- program 빌드 시 컴파일 옵션으로 -Wall, -Werror를 줬다.
  - -Wall : 모든 경고 표시
  - -Werror : 경고는 컴파일 오류로 간주
- PUBLIC은 실행 파일 빌드 시에는 그닥 중요한건 아니라고한다.
  - INTERFACE, PRIVATE 도 있다.

```cpp
#include <iostream>

int main() {
    int i; // 안쓰는 변수를 줘본다
    std::cout << "Test" << std::endl;

    return 0;
}
```
- main.cpp를 위와 같이 구성한다.

```CMake
# CMake 프로그램의 최소 버전
cmake_minimum_required(VERSION 3.10)

# 프로젝트 정보
project(
  CJLotto
  VERSION 0.1
  DESCRIPTION "예제 프로젝트"
  LANGUAGES CXX)

add_executable (program main.cpp)
target_compile_options(program PUBLIC -Wall -Werror)
```
- CMakeLists.txt
- 해보니까 순서도 신경써줘야 되는 듯 하다.

```
 [50%] Building CXX object CMakeFiles/program.dir/main.cpp.o
/home/cjlotto/git_clone/CMake/d_Compile_Option_Setting/Practice/main.cpp: In function ‘int main()’:
/home/cjlotto/git_clone/CMake/d_Compile_Option_Setting/Practice/main.cpp:4:9: error: unused variable ‘i’ [-Werror=unused-variable]
     int i; // 안쓰는 변수를 줘본다
         ^
cc1plus: all warnings being treated as errors
CMakeFiles/program.dir/build.make:62: recipe for target 'CMakeFiles/program.dir/main.cpp.o' failed
make[2]: *** [CMakeFiles/program.dir/main.cpp.o] Error 1
CMakeFiles/Makefile2:67: recipe for target 'CMakeFiles/program.dir/all' failed
make[1]: *** [CMakeFiles/program.dir/all] Error 2
Makefile:83: recipe for target 'all' failed
make: *** [all] Error 2
```
- unused error가 발생한다.
- 컴파일 옵션이 제대로 들어간다.
- target_compile_options로 program을 빌드할 때 컴파일 옵션을 줄 수 있다.
- CMake에서 ***target*** : **프로그램을 구성하는 요소들**
  - 실행파일이 될수도, 라이브러리 파일이 될 수도있다.
