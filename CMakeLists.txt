cmake_minimum_required (VERSION 3.0)
project (tinyrenderer)

set (CMAKE_CXX_STANDARD 14)

file(GLOB SOURCES src/*.h src/*.cpp)

add_executable(${PROJECT_NAME} ${SOURCES})

install(TARGETS ${PROJECT_NAME} DESTINATION bin)
install(DIRECTORY obj DESTINATION share/)
