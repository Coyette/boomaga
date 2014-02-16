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



set(OUT_PLIST_FILE ${OUT_DIR}/Info.plist)
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/mac/Info.plist.in
               ${OUT_PLIST_FILE}
               @ONLY)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/gui/images/mac/boomaga.icns
               ${OUT_DIR}/Resources/boomaga.icns
               COPYONLY)



if(DEFINED ENV{QTDIR})
    set(MACDEPLOYQT $ENV{QTDIR}/bin/macdeployqt)
else()
    set(MACDEPLOYQT macdeployqt)
endif()

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/mac/BuildBundle.sh.in
               ${CMAKE_BINARY_DIR}/BuildBundle.sh
               @ONLY)


add_custom_target(bundle
    COMMAND sh  "${CMAKE_BINARY_DIR}/BuildBundle.sh" ${OUT_DIR}/.. ${BUNDLE_DIR}
    VERBATIM
)


add_custom_target(dmg
    COMMAND sh  "${CMAKE_BINARY_DIR}/BuildBundle.sh" ${OUT_DIR}/.. ${BUNDLE_DIR} -dmg
    VERBATIM
)
