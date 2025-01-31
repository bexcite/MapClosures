# MIT License
#
# Copyright (c) 2024 Saurabh Gupta, Tiziano Guadagnino, Benedikt Mersch,
# Ignacio Vizzo, Cyrill Stachniss.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

function(set_global_target_properties target)
  target_compile_features(${target} PUBLIC cxx_std_23)
  target_compile_definitions(${target} PUBLIC $<$<COMPILE_LANG_AND_ID:CXX,MSVC>:_USE_MATH_DEFINES>)
  target_compile_options(
    ${target}
    PRIVATE # Clang
            $<$<COMPILE_LANG_AND_ID:CXX,Clang>:-fcolor-diagnostics>
            $<$<COMPILE_LANG_AND_ID:CXX,Clang>:-Werror>
            $<$<COMPILE_LANG_AND_ID:CXX,Clang>:-Wall>
            $<$<COMPILE_LANG_AND_ID:CXX,Clang>:-Wextra>
            $<$<COMPILE_LANG_AND_ID:CXX,Clang>:-Wno-sign-compare>
            $<$<COMPILE_LANG_AND_ID:CXX,Clang>:-Wno-sign-conversion>
            $<$<COMPILE_LANG_AND_ID:CXX,Clang>:-Wno-ignored-qualifiers>
            # GNU
            $<$<COMPILE_LANG_AND_ID:CXX,GNU>:-fdiagnostics-color=always>
            $<$<COMPILE_LANG_AND_ID:CXX,GNU>:-Werror>
            $<$<COMPILE_LANG_AND_ID:CXX,GNU>:-Wall>
            $<$<COMPILE_LANG_AND_ID:CXX,GNU>:-Wextra>
            $<$<COMPILE_LANG_AND_ID:CXX,GNU>:-pedantic>
            $<$<COMPILE_LANG_AND_ID:CXX,GNU>:-Wcast-align>
            $<$<COMPILE_LANG_AND_ID:CXX,GNU>:-Wno-sign-compare>
            $<$<COMPILE_LANG_AND_ID:CXX,GNU>:-Woverloaded-virtual>
            $<$<COMPILE_LANG_AND_ID:CXX,GNU>:-Wdisabled-optimization>
            $<$<COMPILE_LANG_AND_ID:CXX,GNU>:-Wno-ignored-qualifiers>)
  set(INCLUDE_DIRS ${PROJECT_SOURCE_DIR})
  get_filename_component(INCLUDE_DIRS ${INCLUDE_DIRS} PATH)
  target_include_directories(${target} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
                             PUBLIC $<BUILD_INTERFACE:${INCLUDE_DIRS}> $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)
endfunction()
