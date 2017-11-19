#!/bin/bash
#grep easy from @PetrHodac
#TIME je prodleva mezi slide 
TIME=5
#pokus o interaktivni vyuku ; cat grep.sh ; chmod u+x grep.sh ; ./grep.sh
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

#uvod
pis "Ted se mrknem jak na grep; RE je regularni vyraz"
echo -e "
 grep  'RE ' soubor # vypise radky obsahujici RE
 grep -c  'RE ' soubor # spocita radky obsahujici RE
 grep -v 'RE ' soubor # vypise co neobsahuji radky obsahujici RE
 grep -o 'RE ' soubor # vypise presne to co matchuje RE 
 Pokud neco najde konci \$? je 0, pokud ne tak \$? je 1

"

sleep $((TIME+4))

#vyroba dat
cd /tmp
clear
pis "Vyrabim soubor s testovacima datama"
sleep "$TIME"
cat<<END>soubor
1111
aaaa
aaa1
a15a
1aaa
1aa1
1921
1a1a
a1a1
a111 
111a 56
111a 87
a18a 11a
1aa91 12b
12a21 ba1
END

pis "hotovo takhle vypada soubor:"
cat soubor
sleep "$TIME"
clear 
#zaklady
pis "Chceme radky co obsahuji b"
echo " grep 'b' soubor "

grep 'b' soubor 

sleep "$TIME"

clear 

# zacatek konec RE
pis "Zacatky a konce u RE" 
echo "
^a zacina na 1$ konci na 1 
najdi vse co zacina na a ; grep '^a' soubor 
"
grep '^a' soubor 

sleep $TIME

echo "
najdi vse co konci na 1 ; grep '1$' soubor 
"

sleep $TIME

grep '1$' soubor 

sleep $TIME
clear

# grep -c 
pis "Kolik radku obsahuje znak 1?" 
echo "Pocitani v grepu  ; grep -c '1' soubor "

sleep $TIME

grep -c '1' soubor 

sleep $TIME
clear

# grep -o cele cisla
pis "Najdi jen radky s  cisly" 

echo "
rozsah a opakovani v RE # grep  '[0-9]' soubor vs grep -o '[0-9][0-9]*' soubor
"

sleep $TIME

echo "grep  '[0-9]' soubor"
grep  '[0-9]' soubor
