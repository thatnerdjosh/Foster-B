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

tar xf crosstool-ng-1.24.0.tar.bz2
assert_err $?

rm crosstool-ng-1.24.0.tar.bz2
assert_err $?

popd

## stage the CTNG sources to the build directory
mkdir -vp ${BUILD_DIR}/crosstool-ng
assert_err $?

cp -Rf ${SOURCES_DIR}/crosstool-ng-*/* ${BUILD_DIR}/crosstool-ng
assert_err $?

# Enter the build directory
pushd ${BUILD_DIR}/crosstool-ng
assert_err $?

# configure CTNG and point the prefix at the root of the CTNG install target directory
./configure --prefix=${CTNG_DIR} >${LOG_DIR}/ctng_configure_out.log 2>${LOG_DIR}/ctng_configure_err.log
assert_err $?

# compile CTNG
make >${LOG_DIR}/ctng_make_out.log 2>${LOG_DIR}/ctng_make_err.log
assert_err $?

# install CTNG to ${CTNG_DIR}
make install >${LOG_DIR}/ctng_install_out.log 2>${LOG_DIR}/ctng_install_err.log
assert_err $?

## create the build_workspace for CTNG
mkdir -pv ${BUILD_DIR}/crosstool-ng/build_workspace
assert_err $?

# enter that workspace
pushd ${BUILD_DIR}/crosstool-ng/build_workspace
assert_err $?

# copy the CTNG config over
cp -v ${SOURCES_DIR}/ctng.x86_64-multilib.config ./.config
assert_err $?

# show the config
ct-ng show-x86_64-multilib-linux-gnu
assert_err $?

# set the config
ct-ng x86_64-multilib-linux-gnu
assert_err $?

# go to menuconfig (debug)
ct-ng menuconfig
assert_err $?

# copy the updated config back to original
cp -v ./.config ${SOURCES_DIR}/ctng.x86_64-multilib.config
assert_err $?

# compile CTNG
ct-ng build >${LOG_DIR}/ctng_build_out.log 2>${LOG_DIR}/ctng_build_err.log
assert_err $?

dirs -c
exit $?
