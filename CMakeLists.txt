cmake_minimum_required (VERSION 3.0)
project (tinyrenderer)

set (CMAKE_CXX_STANDARD 14)

file(GLOB SOURCES src/*.h src/*.cpp)

IF(CMAKE_BUILD_TYPE MATCHES Debug)
  message("Debug mode")
  set(RESOURCE_PATH "${CMAKE_SOURCE_DIR}/")
ELSE(CMAKE_BUILD_TYPE MATCHES Debug)
  message("Release mode")
  set(RESOURCE_PATH "${CMAKE_INSTALL_PREFIX}/")
ENDIF(CMAKE_BUILD_TYPE MATCHES Debug)

configure_file(config.h.in config.h)

include_directories(${CMAKE_CURRENT_BINARY_DIR})

add_executable(${PROJECT_NAME} ${SOURCES})

install(TARGETS ${PROJECT_NAME} DESTINATION bin)
install(DIRECTORY obj DESTINATION share/)
install(DIRECTORY obj DESTINATION /)
