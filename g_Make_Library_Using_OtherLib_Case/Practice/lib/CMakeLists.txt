# /lib/CMakeLists.txt

# add_library(shape STATIC shape.cpp color.cpp circle.cpp)
# 타겟을 빌드하기 위해 필요한 소스 파일들을 명시하기 귀찮을 때
file(GLOB_RECURESE SRC_FILES CONFIGURE_DEPENDS
    ${CMAKE_CURRENT_SOURCE_DIR}/*cpp
)

# 정적 라이브러리 shape 를 만든다.
add_library(shape STATIC ${SRC_FILES})

# 해당 라이브러리 컴파일 시 사용할 헤더파일 경로
target_include_directories(shape PUBLIC ${CMAKE_SOURCE_DIR}/includes)

# 해당 라이브러리를 컴파일 할 옵션
target_compile_options(shape PRIVATE -Wall -Werror)

target_link_libraries(shape PRIVATE pthread)
