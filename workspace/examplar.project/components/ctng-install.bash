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

# Download CTNG to the sources dir and extract the archive
pushd ${SOURCES_DIR}

wget "http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-1.24.0.tar.bz2"
assert_err $?

tar xvf crosstool-ng-1.24.0.tar.bz2
assert_err $?

rm crosstool-ng-1.24.0.tar.bz2
assert_err $?

popd

## stage the CTNG sources to the build directory
mkdir -vp ${BUILD_DIR}/crosstool-ng
assert_err $?

cp -Rf ${SOURCES_DIR}/crosstool-ng-* ${BUILD_DIR}/crosstool-ng
assert_err $?

# Enter the build directory
pushd ${BUILD_DIR}/crosstool-ng
assert_err $?

# configure CTNG and point the prefix at the root of the CTNG install target directory
./configure --prefix=${CTNG_DIR}
assert_err $?

# compile CTNG
make
assert_err $?

# install CTNG to ${CTNG_DIR}
make install
assert_err $?

## create the build_workspace for CTNG
mkdir -pv ${BUILD_DIR}/crosstool-ng/build_workspace
assert_err $?

# enter that workspace
pushd ${BUILD_DIR}/crosstool-ng/build_workspace
assert_err $?

# copy the CTNG config over
cp ${SOURCES_DIR}/ctng.x86_64-multilib.config ./.config
assert_err $?

# show the config
ct-ng show-${CT_TARGET}
assert_err $?

# set the config
ct-ng ${CT_TARGET}
assert_err $?

# go to menuconfig (debug)
ct-ng menuconfig
assert_err $?

# compile CTNG
ct-ng build
assert_err $?

dirs -c
exit $?
