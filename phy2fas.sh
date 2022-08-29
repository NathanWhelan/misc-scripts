#!/bin/bash
for FILE in *.phy
do
Phylip2Fasta.pl $FILE $FILE.fas
done
rename .phy.fas .fas *.phy.fas
