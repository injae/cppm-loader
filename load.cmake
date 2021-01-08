# Cppm version and tool version match and downloader
set(CPPM_CACHE ${CPPM_ROOT}/cache)

if("${CPPM_VERSION}" VERSION_EQUAL "dev")
    set(CPPM_TOOLS_VERSION "dev")
elseif("${CPPM_VERSION}" VERSION_EQUAL "0.0.11")
    set(CPPM_TOOLS_VERSION "0.0.11")
else()
    set(CPPM_TOOLS_VERSION "0.0.12")
endif()

set(CPPM_CMAKE_INSTALL_PATH "${CPPM_ROOT}/cmake")
list(APPEND CMAKE_MODULE_PATH "${CPPM_CMAKE_INSTALL_PATH}")

include(cppm-loader/download)

set(CPPM_CORE "${CPPM_CMAKE_INSTALL_PATH}/cppm-tools-${CPPM_TOOLS_VERSION}")
set(CPPM_TOOL "cppm-tools-${CPPM_TOOLS_VERSION}")
cppm_loader_downloader(cppm-tools
    GIT     https://github.com/injae/cppm_tools.git
    GIT_TAG ${CPPM_TOOLS_VERSION}
    PATH    "${CPPM_CORE}"
)

cppm_loader_downloader(cppm-loader
    GIT  https://github.com/injae/cppm-loader.git
    PATH "${CPPM_CMAKE_INSTALL_PATH}/cppm-loader"
)

include(${CPPM_TOOL}/core_load)

cppm_set(CPPM_LOADER_CACHE  ${CPPM_ROOT}/cache/cppm-loader/git)
cppm_set(CPPM_LOADER_PATH   ${CPPM_ROOT}/cmake/cppm-loader/git)
cppm_set(CPPM_TOOLS_VERSION ${CPPM_TOOLS_VERSION})
cppm_set(IS_CPPM_LOADER_LOADED TRUE)
