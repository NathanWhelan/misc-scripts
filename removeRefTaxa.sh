#!/bin/bash

Remove reference sequences from all .fas files in folder. Could include all three regions, or just one region


for FILE in *.fas
do
sed -e '/Lithasia/,+1d' $FILE |sed -e '/Pleurocera_prasinata/,+1d' |sed -e '/Leptoxis_ampla/,+1d' |sed -e '/Ampla3/,+1d' |sed -e '/Elimia/,+1d'| sed -e '/Biomphalaria/,+1d'>$FILE.noRef.fas
done