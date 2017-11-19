#!/bin/bash
#sed easy from @PetrHodac
#TIME je prodleva mezi slide 
TIME=4
#pokus o interaktivni vyuku ; cat sed.sh ; chmod u+x sed.sh ; ./sed.sh
pekne()
{
	pis "Stejne pekne!"
}	

pis()
{
	BARVA='\033[1;32m'
	KONEC='\033[0m'
	echo -e  "${BARVA}${1}${KONEC}"
}

clear

echo -e " 
 Ted se mrknem jak na sed 
 sed 'vzor {d,s,p,q}prikaz' kde
 sed 's|RE|text|g' prikaz
 sed -i 's|RE|text|g' prikaz #rovnou v souboru
"

sleep "$TIME"

cd /tmp
clear
pis "Vyrabim soubor o 13 radcich se 13 cisly"
sleep "$TIME"
cat<<END>soubor
1
2
3
4
5
6
7
8
9
10
11
12
13
END

pis "hotovo takhle vypada soubor:"
cat soubor
sleep "$TIME"
clear 
#head

pis "head -10 soubor = head soubor"
head -10 soubor
sleep "$TIME"

pis "a ted sed '10q' soubor"
sed '10q' soubor
sleep "$TIME"

pis "sed -n '1,10p' soubor"
sed -n '1,10p' soubor
pekne
sleep "$TIME"
clear
#tail

pis "tail -1 soubor"
tail -1 soubor
sleep "$TIME"
pis "sed -n '\$p' soubor"
sed -n '$p' soubor
pekne
sleep "$TIME"
clear

#tail
pis "tail -n +2 soubor"
tail -n +2 soubor
sleep "$TIME"
pis "sed -n '2,\$p' soubor"
sed -n '2,$p' soubor
pekne
sleep "$TIME"
clear

#sed
pis "nahrada prvni jednicky za x"
pis "sed 's|1|x|' soubor"
sed 's|1|x|' soubor
sleep "$((TIME+2))"
pis "nahrada vsech jednicek za x"
pis "sed 's|1|x|g' soubor"
sed 's|1|x|g' soubor
sleep "$((TIME+2))"
#end

pis "zatim konec"
