#!/bin/sh

SCRIPTS/tei2roff.pl boken.xml > boken.ms
/usr/bin/groff -U -T ps -ma4 -M ~/Dropbox/documents/tmac/ -mgs boken.ms > ud.ps
#/usr/bin/groff -s -U -T dvi -ma4 -mec -M ~/documents/tmac/ -mgs boken.ms > ud.dvi

# dvips ud.dvi -o ud.ps
ps2pdf -sPAPERSIZE=a4 ud.ps 
echo
echo -------------------
echo
#./lengths.pl
