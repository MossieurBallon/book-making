#!/bin/bash

#~ This script copies individual html files from the original 
#~ step-by-step tutorials and edit them so that they can later be 
#~ aggregated into a single html file ready for book publishing

#~ Author Pierrick LE BRUN (alias Môssieur Ballon)
#~ Licensed under GNU GPL version 3.0 

. ./var

mkdir -p $workdir/$globalpixdir
cp $pixdir/* $workdir/$globalpixdir

for i in $tutosdiritems ; do
	if [ -d $tutosdir/$i ] ; then
		if [ "$i" = "css" ] ; then
	 		cp -r $tutosdir/$i $workdir ;
	 		sed -i 's/#lastpix/.lastpix/' $workdir/$i/* ; 
	 		sed -ni '/header{/{p;:a;N;/margin: 0 auto;/!ba;s/.*\n/\twidth: 100%;\n/};p' $workdir/$i/* ; 
	 		sed -ni '/\twidth: 100%;/{p;:a;N;/}/!ba;s/.*\n/\tmargin: 0;\n/};p' $workdir/$i/* ; 
	 		sed -i '/@media print{/i @page :first {\n\twidth: 100%;\n\tmargin: 0;\n}\n' $workdir/$i/* ;
			sed -i '/width: 90%;/a \\t\tfloat: left;' $workdir/$i/* ; 
	 	elif [ "$i" = "$globalpixdir" ] ; then
	 		cp -r $tutosdir/$i $workdir ;
		else
			for ii in $tutosdir/$i/* ; do
				if [[ $ii == *-en* ]] ; then
					[[ -d $i ]] || mkdir -p $workdir/$i ;
					cp $ii $workdir/$i/ ;
				fi
			done
			cd $workdir
			for iii in $(ls $i | grep "html"); do
				sed -i 's/id="lastpix/class="lastpix/' $i/$iii ; 
				sed -i "s/\"images/\"$tutosdir4sed\/$i\/images/g" "$i/$iii" ;
				sed -i 's/<h1.*<\/h1>//' $i/$iii ; 
				sed -i '/<aside>/,/<\/aside>/d' $i/$iii ; 
				sed -i '/mr-ballon-logo/d' $i/$iii ; 
				sed -i 's/<div class="pagebreak/\t<div class="pagebreak/' $i/$iii ; 				
				sed -i 's/<strong>.*ee you soon.*Môssieur Ballon.*<\/strong>/<strong>And that was the end of this lesson!<\/strong>/' $i/$iii ; 
				sed -i '/<!DOCTYPE html>/,/<header>/d' $i/$iii ; 
				sed -i '/header>/d' $i/$iii ;		
				sed -i '/main>/d' $i/$iii ;	
				sed -i '/<\/body>/,/<\/html>/d' $i/$iii ; 
				sed -i '/^\s*$/d' $i/$iii ; 
				vid=$(echo ${i}vid | tr '-' '_')
				sed -i '/This photo tutorial is.*which you can also find.*$/a\\t\t\<p><a href="insert-vid-url" target="_blank"><img src="global-images/youtube-logo.png" width="42"> <strong>Watch this video tutorial on YouTube</strong></a></p>' $i/$iii ;
				sed -i "s/\insert-vid-url/${!vid}/g" "$i/$iii" ;
				sed -i 's/^/\t\t/' $i/$iii ;
				sed -i 's/https:\/\/www.mossieur-ballon.com\/tutorials\/balloon-twisting-from-scratch-6-skill-1-knots/#an1/' $i/$iii ; 
				sed -i 's/video <a href="#an1/ <a href="https:\/\/www.mossieur-ballon.com\/tutorials\/balloon-twisting-from-scratch-6-skill-1-knots/' $i/$iii ;
				sed -i 's/https:\/\/www.mossieur-ballon.com\/tutorials\/balloon-twisting-from-scratch-7-skill-2-bubbles/#an2/' $i/$iii ; 
				sed -i 's/video <a href="#an2/ <a href="https:\/\/www.mossieur-ballon.com\/tutorials\/balloon-twisting-from-scratch-7-skill-2-bubbles/' $i/$iii ;
				sed -i 's/https:\/\/www.mossieur-ballon.com\/tutorials\/balloon-twisting-from-scratch-8-skill-3-how-to-curve-a-balloon/#an3/' $i/$iii ; 
				sed -i 's/video <a href="#an3/ <a href="https:\/\/www.mossieur-ballon.com\/tutorials\/balloon-twisting-from-scratch-8-skill-3-how-to-curve-a-balloon/' $i/$iii ;
				sed -i 's/https:\/\/www.mossieur-ballon.com\/tutorials\/balloon-twisting-from-scratch-9-skill-4-make-angles-with-balloons/#an4/' $i/$iii ; 
				sed -i 's/video <a href="#an4/ <a href="https:\/\/www.mossieur-ballon.com\/tutorials\/balloon-twisting-from-scratch-9-skill-4-make-angles-with-balloons/' $i/$iii ;
				sed -i 's/https:\/\/www.mossieur-ballon.com\/tutorials\/balloon-twisting-from-scratch-10-skill-5-pinch-twists/#an5/' $i/$iii ; 
				sed -i 's/video <a href="#an5/ <a href="https:\/\/www.mossieur-ballon.com\/tutorials\/balloon-twisting-from-scratch-10-skill-5-pinch-twists/' $i/$iii ;
				sed -i 's/https:\/\/www.mossieur-ballon.com\/tutorials\/balloon-twisting-from-scratch-11-skill-6-air-pressure-control/#an6/' $i/$iii ; 
				sed -i 's/video <a href="#an6/ <a href="https:\/\/www.mossieur-ballon.com\/tutorials\/balloon-twisting-from-scratch-11-skill-6-air-pressure-control/' $i/$iii ;
				sed -i 's/https:\/\/www.mossieur-ballon.com\/tutorials\/balloon-twisting-from-scratch-12-skill-7-the-loop/#an7/' $i/$iii ; 
				sed -i 's/video <a href="#an7/ <a href="https:\/\/www.mossieur-ballon.com\/tutorials\/balloon-twisting-from-scratch-12-skill-7-the-loop/' $i/$iii ;								
				sed -i 's/https:\/\/www.mossieur-ballon.com\/tutorials\/balloon-twisting-from-scratch-13-skill-8-tulip-twist/#an8/' $i/$iii ; 
				sed -i 's/video <a href="#an8/ <a href="https:\/\/www.mossieur-ballon.com\/tutorials\/balloon-twisting-from-scratch-13-skill-8-tulip-twist/' $i/$iii ;				
			done
		fi
    fi
done










