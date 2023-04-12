#!/bin/sh

SCRIPTS/tei2roff.pl boken.xml > boken.ms
/usr/bin/groff -U -T ps -ma4 -M ~/Dropbox/documents/tmac/ -mgs boken.ms > ud.ps

ps2pdf -sPAPERSIZE=a4 ud.ps

echo
echo -------------------
echo
#./lengths.pl
