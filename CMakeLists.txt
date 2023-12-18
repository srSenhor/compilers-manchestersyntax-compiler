cmake_minimum_required(VERSION 3.0.0)
project(MansynLex)

set(CMAKE_BUILD_TYPE Build)
set(CMAKE_CXX_STANDARD 17)

find_package(FLEX)
FLEX_TARGET(Lexer lexer.l ${CMAKE_CURRENT_BINARY_DIR}/lex.yy.cc COMPILE_FLAGS "-+")
include_directories(${CMAKE_CURRENT_BINARY_DIR})
include_directories(${CMAKE_SOURCE_DIR})

add_executable(MansynLex ${SOURCES} ${FLEX_Lexer_OUTPUTS})

