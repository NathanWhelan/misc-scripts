#!/bin/bash
for FILE in *.fas
do
fasta2phylip.sh $FILE >$FILE.phy
done
rename .fas.phy .phy *.fas.phy
