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
				if [[ $ii == *-fr* ]] ; then
					[[ -d $i ]] || mkdir -p $workdir/$i ;
					cp $ii $workdir/$i/ ;
				fi
			done
			cd $workdir
			for iii in $(ls $i | grep "html"); do
				sed -i 's/id="lastpix/class="lastpix/' $i/$iii ; 
				sed -i "s/\"images/\"$tutosdir4sed\/$i\/images/g" "$i/$iii" ;
				sed -i 's/<h1.*<\/h1>//' $i/$iii ; 
				sed -i 's/<aside>/\n&/g' $i/$iii ; 
				sed -i 's/<\/aside>/&\n/g' $i/$iii ;
				sed -i '/<aside>/,/<\/aside>/d' $i/$iii ; 
				sed -i 's/&#13;//' $i/$iii ; 
				sed -i 's/header>/&\n/g' $i/$iii ; 
				sed -i '/mr-ballon-logo/d' $i/$iii ; 
				sed -i 's/<div class="pagebreak/\t<div class="pagebreak/' $i/$iii ; 
				sed -i '/<!DOCTYPE html>/,/<header>/d' $i/$iii ; 
				sed -i '/header>/d' $i/$iii ;
				sed -i 's/<\main>//' $i/$iii ; 
				sed -i 's/<\/main>//' $i/$iii ; 
				sed -i '/<\/body>/,/<\/html>/d' $i/$iii ; 
				sed -i 's/<\/section>/&\n/g' $i/$iii ;
				sed -i 's/<\/figure>/&\n/g' $i/$iii ;	
				sed -i '/^\s*$/d' $i/$iii ; 				
				vid=$(echo ${i}vid | tr '-' '_')
				sed -i '/Ce tutoriel photo est un outil.*vidéo.*$/a\\t\t\<p><a href="insert-vid-url" target="_blank"><img id="ytlogo" src="global-images/youtube-logo.png" width="32"> <strong>Vous pouvez consulter la version vidéo de ce tutoriel sur YouTube</strong></a></p>' $i/$iii ;									
				sed -i "s/\insert-vid-url/${!vid}/g" "$i/$iii" ;
				sed -i 's/Ce tutoriel photo est un outil.*vidéo <a href=/Ce tutoriel fut premièrement publié sous le titre <a href=/' $i/$iii ;
				sed -i 's/<\/a>.*que vous pouvez également retrouver sur la.*YouTube de Môssieur Ballon<\/a>/<\/a>/' $i/$iii ;
				sed -i 's/^/\t\t/' $i/$iii ;
				sed -i 's/https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-6-technique-1-les-noeuds/#an1/' $i/$iii ; 				
				sed -i 's/sous le titre <a href="#an1/sous le titre <a href="https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-6-technique-1-les-noeuds/' $i/$iii ;
				sed -i 's/https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-7-technique-2-les-bulles/#an2/' $i/$iii ; 
				sed -i 's/sous le titre <a href="#an2/sous le titre <a href="https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-7-technique-2-les-bulles/' $i/$iii ;
				sed -i 's/https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-8-technique-3-faire-un-arrondi/#an3/' $i/$iii ; 
				sed -i 's/sous le titre <a href="#an3/sous le titre <a href="https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-8-technique-3-faire-un-arrondi/' $i/$iii ;
				sed -i 's/https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-9-technique-4-faire-un-angle/#an4/' $i/$iii ; 
				sed -i 's/sous le titre <a href="#an4/sous le titre <a href="https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-9-technique-4-faire-un-angle/' $i/$iii ;
				sed -i 's/https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-10-technique-5-faire-une-bulle-oreille-pinch-twist/#an5/' $i/$iii ; 
				sed -i 's/sous le titre <a href="#an5/sous le titre <a href="https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-10-technique-5-faire-une-bulle-oreille-pinch-twist/' $i/$iii ;
				sed -i 's/https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-11-technique-6-le-controle-de-la-pression-d-air/#an6/' $i/$iii ; 
				sed -i 's/sous le titre <a href="#an6/sous le titre <a href="https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-11-technique-6-le-controle-de-la-pression-d-air/' $i/$iii ;
				sed -i 's/https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-12-technique-7-la-boucle/#an7/' $i/$iii ; 
				sed -i 's/sous le titre <a href="#an7/sous le titre <a href="https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-12-technique-7-la-boucle/' $i/$iii ;								
				sed -i 's/https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-13-technique-8-la-bulle-tulipe-tulip-twist/#an8/' $i/$iii ; 
				sed -i 's/sous le titre <a href="#an8/sous le titre <a href="https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-13-technique-8-la-bulle-tulipe-tulip-twist/' $i/$iii ;
				sed -i 's/https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-1-le-toutou/#ch2/' $i/$iii ;
				sed -i 's/sous le titre <a href="#ch2/sous le titre <a href="https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-1-le-toutou/' $i/$iii ;
				sed -i 's/https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-2-le-sabre/#ch3/' $i/$iii ;
				sed -i 's/sous le titre <a href="#ch3/sous le titre <a href="https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-2-le-sabre/' $i/$iii ;
				sed -i 's/https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-3-la-grenouille/#ch6/' $i/$iii ;
				sed -i 's/sous le titre <a href="#ch6/sous le titre <a href="https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-3-la-grenouille/' $i/$iii ;				
				sed -i 's/https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-4-le-tigre/#ch5/' $i/$iii ;
				sed -i 's/sous le titre <a href="#ch5/sous le titre <a href="https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-4-le-tigre/' $i/$iii ;	
				sed -i 's/https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-14-la-fleur-classique/#ch11/' $i/$iii ;
				sed -i 's/sous le titre <a href="#ch11/sous le titre <a href="https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-14-la-fleur-classique/' $i/$iii ;
				sed -i 's/https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-15-la-girafe/#ch7/' $i/$iii ;
				sed -i 's/sous le titre <a href="#ch7/sous le titre <a href="https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-15-la-girafe/' $i/$iii ;	
				sed -i 's/https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-16-le-coeur/#ch4/' $i/$iii ;
				sed -i 's/sous le titre <a href="#ch4/sous le titre <a href="https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-16-le-coeur/' $i/$iii ;					
				sed -i 's/https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-5-tux-le-manchot-pingouin/#ch9/' $i/$iii ;
				sed -i 's/sous le titre <a href="#ch9/sous le titre <a href="https:\/\/www.mossieur-ballon.com\/fr\/tutoriels\/initiation-a-la-sculpture-sur-ballon-5-tux-le-manchot-pingouin/' $i/$iii ;
				sed -i 's/<strong>.* bientôt !.*Môssieur Ballon !/<br><strong>Voili, voilou !/' $i/$iii ;
				sed -i 's/<strong>.* bientôt !.*Môssieur Ballon !/<br><strong>Voili, voilou !/' $i/$iii ;
				sed -i 's/<strong><br><br>A bientôt!<br>Pour une nouvelle leçon...<br>avec Môssier Ballon !/<br><strong>Voili, voilou !/' $i/$iii ;
				sed -i 's/<strong>À bientôt !<br>Pour une autre leçon...<br>avec Môssieur Ballon!/<strong>Voili, voilou !/' $i/$iii ;
				sed -i 's/<strong>À bientôt.*<br>pour une autre leçon...<br>avec Môssieur Ballon !/<br><strong>Voili, voilou !/' $i/$iii ;
				sed -i 's/<strong>À bientôt…<br>pour une nouvelle leçon,<br>avec Môssieur Ballon !/<br><strong>Voili, voilou !/' $i/$iii ;
				sed -i 's/<strong>À bientôt&nbsp;!<br>Pour une autre leçon…<br>avec Môssieur Ballon&nbsp;!/<strong>Voili, voilou !/' $i/$iii ;
				sed -i 's/<strong>À bientôt&nbsp;!<br>Pour une nouvelle leçon.*<br>avec Môssieur Ballon&nbsp;!/<br><strong>Voili, voilou !/' $i/$iii ;
				sed -i 's/<strong>À bientôt,<br>pour une autre leçon.*<br>avec Môssieur Ballon&nbsp;!/<br><strong>Voili, voilou !/' $i/$iii ;				
				sed -i 's/<figcaption>.*oilà.*<br><br>/<figcaption>/' $i/$iii ;
				sed -i 's/taches… et voilà !/taches./' $i/$iii ;
				sed -i 's/ que nous apprendrons plus tard//' $i/$iii ;
				sed -i 's/utiliserons cette technique assez rapidement, dans un prochain/avons utilisé cette technique dans le/' $i/$iii ;		
			done
		fi
    fi
done










