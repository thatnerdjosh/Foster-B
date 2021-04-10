#!/usr/bin/env bash

read -d '' info << EOF
Dear User,

Thanks for trying to use SURRO Linux.

It's been a long road just getting to this point, and there is still so much more road to go.  

I hope you'll track the progress of this project, and even contribute.

We're going to turn those windmills into dragons.

Sincerely,
-C
EOF

whiptail \
--fullbuttons \
--backtitle "Foster - Variant B" \
--title "NOTICE" \
--ok-button "continue" \
--msgbox "$info" \
${mid_height} \
${max_width}

NAME=$(whiptail --inputbox "What is your name?" 8 39 --title "Getting to know you" 3>&1 1>&2 2>&3)

echo "hello $NAME"
