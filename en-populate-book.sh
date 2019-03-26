#!/bin/bash

#~ This script merges the headless html files, created by the script
#~ prepare-tuto-files.sh, into a single html file ready for book 
#~ publishing.

#~ Author Pierrick LE BRUN (alias Môssieur Ballon)
#~ Licensed under GNU GPL version 3.0 

. ./var

cp $enbase $workdir/$enbook
cd $workdir/
export LC_ALL=C
sed -i "s/Last update:/Last update: $(date)/g" "$enbook"
unset LC_ALL
cd $workdir/dog/
sed -i -e '/dog<\/h2>/r dog-en.html' ../$enbook
cd ../sword/
sed -i -e '/sword<\/h2>/r sword-en.html' ../$enbook
cd ../heart/
sed -i -e '/heart<\/h2>/r love-heart-en.html' ../$enbook
cd ../tiger/
sed -i -e '/tiger<\/h2>/r tiger-en.html' ../$enbook
cd ../frog/
sed -i -e '/frog<\/h2>/r frog-en.html' ../$enbook
cd ../giraffe/
sed -i -e '/giraffe<\/h2>/r giraffe-en.html' ../$enbook
cd ../ladybug/
sed -i -e '/ladybug<\/h2>/r ladybug-en.html' ../$enbook
cd ../tux/
sed -i -e '/penguin<\/h2>/r tux-en.html' ../$enbook
cd ../fish/
sed -i -e '/fish<\/h2>/r fish-en.html' ../$enbook
cd ../flower
sed -i -e '/flower<\/h2>/r flower-en.html' ../$enbook
cd ../butterfly/
sed -i -e '/butterfly<\/h2>/r butterfly-en.html' ../$enbook
cd ../snake/
sed -i -e '/snake<\/h2>/r snake-en.html' ../$enbook
cd ../knot/
sed -i -e '/knot<\/h3>/r knot-en.html' ../$enbook
cd ../bubble/
sed -i -e '/bubble<\/h3>/r bubble-en.html' ../$enbook
cd ../loop/
sed -i -e '/loop<\/h3>/r loop-en.html' ../$enbook
cd ../curve/
sed -i -e '/curve a balloon<\/h3>/r curve-en.html' ../$enbook
cd ../angle/
sed -i -e '/angle<\/h3>/r angle-en.html' ../$enbook
cd ../pinch-twist/
sed -i -e '/pinch-twist<\/h3>/r pinch-twist-en.html' ../$enbook
cd ../tulip-twist/
sed -i -e '/tulip-twist<\/h3>/r tulip-twist-en.html' ../$enbook
cd ../air-control/
sed -i -e '/air pressure<\/h3>/r air-control-en.html' ../$enbook
sed -i 's/<br><br>//' ../$enbook
