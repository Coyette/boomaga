 # BEGIN_COMMON_COPYRIGHT_HEADER
 # (c)LGPL2+
 #
 #
 # Copyright: 2012-2013 Boomaga team https://github.com/Boomaga
 # Authors:
 #   Alexander Sokoloff <sokoloff.a@gmail.com>
 #
 # This program or library is free software; you can redistribute it
 # and/or modify it under the terms of the GNU Lesser General Public
 # License as published by the Free Software Foundation; either
 # version 2.1 of the License, or (at your option) any later version.
 #
 # This library is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 # Lesser General Public License for more details.
 #
 # You should have received a copy of the GNU Lesser General
 # Public License along with this library; if not, write to the
 # Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 # Boston, MA 02110-1301 USA
 #
 # END_COMMON_COPYRIGHT_HEADER


cmake_minimum_required( VERSION 2.6 )

project(boomagaCups)

set(CUPS_BACKEND_ID "MFG:${CUPS_BACKEND_MANUFACTURER};CMD:PJL,PDF;MDL:${CUPS_BACKEND_MODEL};CLS:PRINTER;DES:${CUPS_BACKEND_DESCRIPTION};DRV:DPDF,R1,M0;")
add_definitions(-DCUPS_BACKEND_ID=\"${CUPS_BACKEND_ID}\")

if(APPLE)
    set(OUT_BACKEND_FILE ${OUT_DIR}/Resources/cups/${INSTANCE_NAME})
    set(OUT_FILTER_FILE  ${OUT_DIR}/Resources/cups/boomaga_pstopdf)
    set(OUT_PPD_FILE     ${OUT_DIR}/Resources/cups/${INSTANCE_NAME}.ppd)
else()
    set(OUT_BACKEND_FILE ${OUT_DIR}/${CUPS_BACKEND_DIR}/${INSTANCE_NAME})
    set(OUT_FILTER_FILE  ${OUT_DIR}/${CUPS_FILTER_DIR}/boomaga_pstopdf)
    set(OUT_PPD_FILE     ${OUT_DIR}/${CUPS_PPD_DIR}/${INSTANCE_NAME}.ppd)
endif()


configure_file(${CMAKE_CURRENT_SOURCE_DIR}/boomaga
               ${OUT_BACKEND_FILE}
               @ONLY)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/boomaga_pstopdf
               ${OUT_FILTER_FILE}
               COPYONLY)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/boomaga.ppd
               ${OUT_PPD_FILE}
               @ONLY)

install(FILES ${OUT_BACKEND_FILE}
  DESTINATION ${CUPS_BACKEND_DIR}
  PERMISSIONS
    OWNER_READ OWNER_WRITE OWNER_EXECUTE
)

if(NOT APPLE)
    install(FILES ${OUT_FILTER_FILE}
        DESTINATION ${CUPS_FILTER_DIR}
        PERMISSIONS
        OWNER_READ OWNER_WRITE OWNER_EXECUTE
        GROUP_READ             GROUP_EXECUTE
        WORLD_READ             WORLD_EXECUTE
    )
endif()

install(FILES ${OUT_PPD_FILE}
  DESTINATION ${CUPS_PPD_DIR}
  PERMISSIONS
    OWNER_READ OWNER_WRITE
    GROUP_READ
    WORLD_READ
)
