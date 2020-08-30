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

mkdir -vp ${FOSTER_ROOT}
assert_err $?

# the directory for cross-compilation tools that need built to create
# the compiler that builds this system
mkdir -vp ${CX_DIR}
assert_err $?

# the compiler used that builds the system into FOSTER_ROOT
mkdir -vp ${X_DIR}
assert_err $?

# the working directory where the packages are built
mkdir -vp ${BUILD_DIR}
assert_err $?

mkdir -p ${LOG_DIR}
exit $?
