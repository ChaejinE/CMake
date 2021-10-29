# CMake란
- 빌드파일을 생성해주는 프로그램
- **프로젝트를 빌드하는 것이 아니라 CMake를 통해서 빌드 파일을 생성**하면 빌드 프로그램을 통해 프로젝트를 빌드하는 것이다.
  - Make 사용시 CMake를 통해 Makefile 생성
  - Ninja : .ninja 빌드 파일을 만들어준다.
  - Ninja는 빌드 시스템이다.

# CMake 개요
![image](https://user-images.githubusercontent.com/69780812/139398882-67b944f5-c5da-4786-bd42-4bd23a56c8ad.png)

- 모든 프로젝트에는 반드시 **프로젝트 최상위 디렉토리에 CMakeLists.txt 파일이 있어야한다.
  - CMake가 빌드 파일을 생성하는 데 필요한 정보들이 들어있다.
- 위는 보통의 컴파일 과정이다.
  - Makefile을 반드시 만들 필요는 없고 원하는 빌드 프로그램 선택 가능

```CMake
# CMake 프로그램의 최소 버전
cmake_minimum_required(VERSION 3.11)

# 프로젝트 정보
project(
  CJLotto
  VERSION 0.1
  DESCRIPTION "예제 프로젝트"
  LANGUAGES CXX)
```
- CMakeLists.txt에는 반드시 위 두 개의 내용이 들어가야한다.

```CMake
cmake_minimum_required(VERSION 3.11)
```
- 최상단 해당 프로젝트에서 사용할 CMake 최소 버전을 명시한다.
- 시스템 마다 설치된 CMake 버전이 다르다.
  - 버전에따라 차이가 크다.

```CMake
project(
  CJLotto
  VERSION 0.1
  DESCRIPTION "예제 프로젝트"
  LANGUAGES CXX)
```
- 프로젝트 정보를 간단히 명시한다.
- CJLotto : 꼭 필요한 프로젝트 이름
  - 나머지는 없어도 된다.
- LANGUAGES
  - C : C
  - C++ : CXX
  - 명시안했을 시 Default (C, CXX)
  - CUDA, OBJC, OBJCXX, Fortran 등등이 가능하다고 한다.
- [참고](https://cmake.org/cmake/help/latest/command/project.html)