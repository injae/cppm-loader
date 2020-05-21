# Cppm version and tool version match and downloader
#set(CPPM_ROOT          ${CPPM_VERSION})
#set(CPPM_VERSION       ${CPPM_VERSION})
#set(CPPM_TOOLS_VERSION ${CPPM_TOOLS_VERSION})

if("${CPPM_VERSION}" VERSION_EQUAL "0.0.12")
    set(CPPM_TOOLS_VERSION "dev")
else()
    set(CPPM_TOOLS_VERSION "0.0.11")
endif()
set(CPPM_CMAKE_INSTALL_PATH "${CPPM_ROOT}/cmake")
list(APPEND CMAKE_MODULE_PATH ${CPPM_CMAKE_INSTALL_PATH})

include(cppm-loader/downloader)
cppm_loader_download(cppm-tools
    GIT https://github.com/injae/cppm_tools.git
    GIT_TAG ${CPPM_TOOLS_VERSION}
    PATH  ${CPPM_CMAKE_INSTALL_PATH}/cppm-tools-${CPPM_TOOLS_VERSION}
)

include(cppm-tools-${CPPM_TOOLS_VERSION}/core_load)

cppm_set(CPPM_LOADER_CACHE  ${CPPM_ROOT}/cache/cppm-loader/git)
cppm_set(CPPM_LOADER_PATH   ${CPPM_ROOT}/cmake/cppm-loader/git)
cppm_set(IS_CPPM_LOADER_LOADED TRUE)
