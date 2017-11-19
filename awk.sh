#!/bin/bash
#awk easy from @PetrHodac
#TIME je prodleva mezi slide 
TIME=5
#pokus o interaktivni vyuku ; cat awk.sh ; chmod u+x awk.sh ; ./awk.sh
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

pis "Ted se mrknem jak na awk"
echo -e "
 awk  '/vzor/ {prikaz pro kazdy radek vzoru}' soubor
 awk -Fdelimier '{prikaz}' soubor
 awk 'BEGIN {prikaz pred} {prikaz pro kazdy radek} END {prikaz na konci}' soubor
 Zajimave promenne \$1=prvni sloupec ; NR=aktualni radek ; NF=pocet sloupcu 
"

sleep $((TIME+4))

cd /tmp
clear
pis "Vyrabim soubor o 10 radcich s dvoumi sloupecky, kazdy s 10 cisly"
sleep "$TIME"
cat<<END>soubor
1 11
2 22
3 33
4 44
5 55
6 66
7 77
8 88
9 99
10 1010
END

pis "hotovo takhle vypada soubor:"
cat soubor
sleep "$TIME"
clear 

#Zamena sloupce
pis "Pokusime se vymenit 1 a 2 sloupec"
echo -e " 
V promenne \$1 je prvni sloupec a v \$2 je druhy. 
Takze pomoci awk '{print \$2,\$1}' soubor 
"

sleep "$TIME"

awk '{print $2,$1}' soubor

pis "Hura!"

sleep "$TIME"

clear

#prumer sloupce
pis "Ted zkusime spocitat prumer prvniho radku + vypsat neco pred a neco po"

echo "
Vyuzijeme operace += a promnene NR kde je ulozena cislo aktualni radky tj. na konci je tam pocet radku. Taky pouzijeme casti BEGIN a END.
awk 'BEGIN {print "Pocitam prumer prvniho sloupce" } {SOUCET+=\$1} END {print "Prumer je " SOUCET/NR }' soubor
"

sleep $((TIME+7))

clear
cat soubor
echo "------------------------------"
awk 'BEGIN {print "Pocitam prumer prvniho sloupce" } {SOUCET+=$1} END {print "Prumer je " SOUCET/NR }' soubor


pis "Hura!"

