#!/bin/bash

#~ This script merges the headless html files, created by the script
#~ prepare-tuto-files.sh, into a single html file ready for book 
#~ publishing.

#~ Author Pierrick LE BRUN (alias Môssieur Ballon)
#~ Licensed under GNU GPL version 3.0 

. ./var

cp $frbase $workdir/$frbook
cd $workdir/
export lc_all=fr_fr.utf-8
sed -i "s/Dernière mise à jour :/Dernière mise à jour : $(date)/g" "$frbook"
unset LC_ALL
cd $workdir/dog/
sed -i -e '/chien<\/h2>/r dog-fr.html' ../$frbook
cd ../sword/
sed -i -e '/épée<\/h2>/r sword-fr.html' ../$frbook
cd ../heart/
sed -i -e '/cœur<\/h2>/r love-heart-fr.html' ../$frbook
cd ../tiger/
sed -i -e '/tigre<\/h2>/r tiger-fr.html' ../$frbook
cd ../frog/
sed -i -e '/grenouille<\/h2>/r frog-fr.html' ../$frbook
cd ../giraffe/
sed -i -e '/girafe<\/h2>/r giraffe-fr.html' ../$frbook
cd ../ladybug/
sed -i -e '/coccinelle<\/h2>/r ladybug-fr.html' ../$frbook
cd ../tux/
sed -i -e '/pingouin<\/h2>/r tux-fr.html' ../$frbook
cd ../fish/
sed -i -e '/poisson<\/h2>/r fish-fr.html' ../$frbook
cd ../flower
sed -i -e '/fleur<\/h2>/r flower-fr.html' ../$frbook
cd ../butterfly/
sed -i -e '/papillon<\/h2>/r butterfly-fr.html' ../$frbook
cd ../snake/
sed -i -e '/serpent<\/h2>/r snake-fr.html' ../$frbook
cd ../knot/
sed -i -e '/nœud<\/h3>/r knot-fr.html' ../$frbook
cd ../bubble/
sed -i -e '/bulle<\/h3>/r bubble-fr.html' ../$frbook
cd ../loop/
sed -i -e '/boucle<\/h3>/r loop-fr.html' ../$frbook
cd ../curve/
sed -i -e '/arrondir un ballon<\/h3>/r curve-fr.html' ../$frbook
cd ../angle/
sed -i -e '/angle<\/h3>/r angle-fr.html' ../$frbook
cd ../pinch-twist/
sed -i -e '/bulle-oreille<\/h3>/r pinch-twist-fr.html' ../$frbook
cd ../tulip-twist/
sed -i -e '/bulle-tulipe<\/h3>/r tulip-twist-fr.html' ../$frbook
cd ../air-control/
sed -i -e "/pression d'air<\/h3>/r air-control-fr.html" ../$frbook
sed -i 's/<br><br>//' ../$frbook
