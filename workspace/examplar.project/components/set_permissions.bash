#!/bin/bash
#
#    Foster - Installer ISO for SURRO Linux.
#
#    © SURRO INDUSTRIES and Chris Punches, 2017.
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as
#    published by the Free Software Foundation, either version 3 of the
#    License, or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.
echo "X DIR..."
chown -R ${BUILD_USER}:${BUILD_GROUP} ${X_DIR}
assert_err $?

echo "CX DIR...."
chown -R ${BUILD_USER}:${BUILD_GROUP} ${CX_DIR}
assert_err $?

echo "sources dir..."
chown -R ${BUILD_USER}:${BUILD_GROUP} ${SOURCES_DIR}
assert_err $?

echo "patches dir..."
chown -R ${BUILD_USER}:${BUILD_GROUP} ${PATCH_DIR}
assert_err $?

echo "build dir..."
chown -R ${BUILD_USER}:${BUILD_GROUP} ${BUILD_DIR}
assert_err $?

echo "mutable dir..."
chown -R ${BUILD_USER}:${BUILD_GROUP} ${OUTDIR}
assert_err $?

echo "log dir..."
chown -R ${BUILD_USER}:${BUILD_GROUP} ${LOG_DIR}
assert_err $?


exit $?
