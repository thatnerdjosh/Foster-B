# Foster B

This is a skeletal implementation of an Examplar project.

The make file will spin up a docker container.

That docker container will download the Examplar source code and compile it.

The container will then execute this examplar project.

Examplar is a harness tool that executes shell scripts.  The order of the units that examplar executes are specified in the plan file.  The definitions and execution context of those units are in the units files.  Whenever Examplar runs a script, it will first source the environment file specified for that unit.  More details about how Examplar works can be found at source.surroindustries.com

This is an attempt to integrate crosstool-ng so we can shift reliability of the build tools
to an external source for SURRO Linux.

* CTNG should be compiled to /opt/ctng
* a crosstool chain should be compiled using CTNG to /opt/cross-compiler
* a native toolchain for the chroot should be compiled with /opt/cross-compiler to /opt/compiler

The native toolchain in /opt/compiler should be used to compile the chroot, including a native toolchain inside the chroot.

Once a chroot is created, all builds from there will occur from inside the chroot.
