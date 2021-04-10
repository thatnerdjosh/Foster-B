# Cross-compiler generation environment file.

# Terminology

## Sysroot
#
# A sysroot is a directory which is considered to be the root directory 
# for the purpose of locating headers and libraries. So for example if 
# your build toolchain wants to find /usr/include/foo.h but you are 
# cross-compiling and the appropriate foo.h is in
# /my/other/place/usr/include/foo.h, you would use /my/other/place as 
# your sysroot.
#
## --prefix
# When you install software with make install or sudo make install, 
# different files are placed in different directories. Executables that
# provide commands the user is intended to run usually go in a bin
# directory, libraries usually go in a lib directory, manual pages 
# usually go in a man directory, and so forth.
#
# When you run ./configure, the --prefix option lets you specify where 
# those directories are. It is called --prefix because it lets you give 
# the prefix that appears in the paths to each of the directories where
# files from the program or library that you are building are to be 
# installed. Most configure scripts support --prefix, and omitting it 
# and just running ./configure is typically equivalent to ./configure
# --prefix=/usr/local.
#
# So, while they appear to have similar functions, a sysroot deals with
# linked header files and sources, and a prefix deals with artifacts of
# your build.

