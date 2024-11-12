@echo off
setlocal

:: 设置默认项目名称
set "ProjectName=project_root"
if not "%~1"=="" set "ProjectName=%~1"

:: 创建项目目录结构
mkdir "%ProjectName%\src"
mkdir "%ProjectName%\include"
mkdir "%ProjectName%\build"
mkdir "%ProjectName%\lib"
mkdir "%ProjectName%\bin"
mkdir "%ProjectName%\tests"

:: 创建示例文件
echo // main.cpp > "%ProjectName%\src\main.cpp"
echo // main.h > "%ProjectName%\include\main.h"
echo // test_main.cpp > "%ProjectName%\tests\test_main.cpp"

:: 创建 CMakeLists.txt 文件并写入内容
(
    echo # CMakeLists.txt
) > "%ProjectName%\CMakeLists.txt"

>> "%ProjectName%\CMakeLists.txt" echo cmake_minimum_required(VERSION 3.10)
>> "%ProjectName%\CMakeLists.txt" echo.
>> "%ProjectName%\CMakeLists.txt" echo project(%ProjectName%)
>> "%ProjectName%\CMakeLists.txt" echo.
>> "%ProjectName%\CMakeLists.txt" echo set(CMAKE_CXX_STANDARD 17)
>> "%ProjectName%\CMakeLists.txt" echo set(CMAKE_CXX_STANDARD_REQUIRED True)
>> "%ProjectName%\CMakeLists.txt" echo.
>> "%ProjectName%\CMakeLists.txt" echo include_directories(include)
>> "%ProjectName%\CMakeLists.txt" echo.
>> "%ProjectName%\CMakeLists.txt" echo file(GLOB SOURCES "src/*.cpp")
>> "%ProjectName%\CMakeLists.txt" echo.
>> "%ProjectName%\CMakeLists.txt" echo add_executable(^%ProjectName%^ ${SOURCES})

:: 复制 catch.hpp 文件到 include 文件夹
if exist "catch.hpp" (
    copy /Y "catch.hpp" "%ProjectName%\include\"
    echo catch.hpp copied to %ProjectName%\include
) else (
    echo catch.hpp not found in script directory. Please ensure it is located in the same directory as this script.
)

echo Project structure created successfully in %ProjectName%
endlocal
