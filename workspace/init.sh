#!/bin/bash

# Executes Examplar from within the shell.

/usr/bin/examplar \
	-v \
	-c /opt/foster/examplar.project/foster.examplar.config

retVal=$?



if [ $retVal -ne 0 ]; then
	# The autostarted version of Examplar failed.	
	printf "\n\n***\n***\tEXAMPLAR FAILED\n***\n"
	printf "\nFix the project on the host filesystem and re-run:\n"
	printf "\n/opt/foster/init.sh\n"

	if [ ! -e debug_shell ]; then
		touch debug_shell
		printf "\n\nDropping to debug shell.\n"
		/bin/bash
	fi
fi
/bin/bash
rm -f debug_shell
