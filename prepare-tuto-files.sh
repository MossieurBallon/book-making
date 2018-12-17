#!/bin/bash

#~ This script copies individual html files from the original 
#~ step-by-step tutorials and edit them so that they can later be 
#~ aggregated into a single html file ready for book publishing

#~ Author Pierrick LE BRUN (alias Môssieur Ballon)
#~ Licensed under GNU GPL version 3.0 

tutosdir="../step-by-step-tutorials"
tutosdir4sed="\.\.\/step-by-step-tutorials"
tutosdiritems=$(ls $tutosdir)

for i in $tutosdiritems ; do
	if [ -d $tutosdir/$i ] ; then
		if [ "$i" = "css" ] ; then
	 		cp -r $tutosdir/$i . ;
	 	elif [ "$i" = "global-images" ] ; then
	 		cp -r $tutosdir/$i . ;
		else
			for ii in $tutosdir/$i/* ; do
				if [ -f $ii ] ; then
					[[ -d $i ]] || mkdir $i
					cp $ii $i/ ;
				fi
			done
			for iii in $(ls $i | grep "html"); do
				sed -i "s/\"images/\"$tutosdir4sed\/$i\/images/g" "$i/$iii" ;
				sed -i 's/<h1.*<\/h1>//' $i/$iii ; 
				sed -i '/<aside>/,/<\/aside>/d' $i/$iii ; 
				sed -i '/mr-ballon-logo/d' $i/$iii ; 
				sed -i 's/<div class="pagebreak/\t<div class="pagebreak/' $i/$iii ; 				
				sed -i 's/<strong>.*ee you soon.*Môssieur Ballon.*<\/strong>/<strong>And this is the end of our lesson!<\/strong>/' $i/$iii ; 
				sed -i '/<!DOCTYPE html>/,/<header>/d' $i/$iii ; 
				sed -i '/header>/d' $i/$iii ;		
				sed -i '/main>/d' $i/$iii ;	
				sed -i '/<\/body>/,/<\/html>/d' $i/$iii ; 
				sed -i '/^\s*$/d' $i/$iii ; 
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










