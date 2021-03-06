include(vcpkg_common_functions)

if (TARGET_TRIPLET MATCHES "^x(86|64)-windows$" AND VCPKG_LIBRARY_LINKAGE STREQUAL dynamic)
    message(WARNING "\
The author of imgui strongly advises users of this lib against using a DLL. \
For more details, please visit: \
https://github.com/Microsoft/vcpkg/issues/5110"
    )
endif ()

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ocornut/imgui
    REF v1.69
    SHA512 6d65bc513ce30c77f7714c852cc1fd56295d212a7adc61cd81f48551bb5b88000dbc193fb9a167fb9819ed99a6b05a7001f82dbc727fdb438ca82dafc1c688d9
    HEAD_REF master
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS_DEBUG
        -DIMGUI_SKIP_HEADERS=ON
)

vcpkg_install_cmake()
vcpkg_copy_pdbs()
vcpkg_fixup_cmake_targets(CONFIG_PATH share/imgui)

configure_file(${SOURCE_PATH}/LICENSE.txt ${CURRENT_PACKAGES_DIR}/share/imgui/copyright COPYONLY)
