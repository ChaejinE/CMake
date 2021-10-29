# 만능 CMake
- https://github.com/kev0960/cmake-for-all

# Make 이외 빌드 시스템
- Ninja
- Visual Studio 16 2019
```shell
cmake .. -DCMAKE_GENERATOR=Ninja
```
- 요새 많이 사용하는 Ninja 사용 시 예 이다.
- **이미 빌드 시스템을 설정했다면 바꿀수 없다.**
  - 새 디렉토리로 CMake 다시하거나 기존 디렉토리 안의 파일을 모두 지워야한다.

# 올바르게 CMake 사용하기 위한 동영상
- https://www.youtube.com/watch?v=bsXLMQ6WgIk

# 공식 문서
- https://cmake.org/cmake/help/latest/index.html
- 이해하기 어려우므로 참고

# 기초에서 좀더 깊은 내용
- https://gist.github.com/luncliff/6e2d4eb7ca29a0afd5b592f72b80cb5c