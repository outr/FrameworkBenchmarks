FIND_PATH(LIBTCMALLOC_INCLUDE_DIR gperftools/malloc_extension.h /usr/local/include /opt/local/include /usr/include)
FIND_LIBRARY(LIBTCMALLOC_LIBRARY NAMES libtcmalloc${CMAKE_SHARED_LIBRARY_SUFFIX} PATH /usr/local/lib /opt/local/lib /usr/lib)

IF (LIBTCMALLOC_INCLUDE_DIR AND LIBTCMALLOC_LIBRARY)
    SET(LIBTCMALLOC_FOUND TRUE)
ENDIF ()

IF (LIBTCMALLOC_FOUND)
    IF (NOT TCMalloc_FIND_QUIETLY)
        MESSAGE(STATUS "Found libtcmalloc: ${LIBTCMALLOC_LIBRARY}")
    ENDIF ()
ELSE()
    IF (TCMalloc_FIND_REQUIRED)
        IF(NOT LIBTCMALLOC_INCLUDE_DIR)
            MESSAGE(FATAL_ERROR "Could not find libtcmalloc header file!")
        ENDIF()

        IF(NOT LIBTCMALLOC_LIBRARY)
            MESSAGE(FATAL_ERROR "Could not find libtcmalloc library file!")
        ENDIF()
    ENDIF ()
ENDIF ()