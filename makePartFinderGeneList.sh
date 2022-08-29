#!/bin/bash
###THIS PROGRAM WILL TAKE ALL *.fa_pruned.fa files and make a list of partitions for PartitionFinder
START=1
ONE=1

for FILE in *.fas
do
NAME=`echo $FILE | sed 's/.fas//'`
LENGTH=`awk '/^>/ {if (seqlen){print seqlen}; print ;seqlen=0;next; } { seqlen = seqlen +length($0)}END{print seqlen}' $FILE | tail -1`
if [[ "$START" -eq "$ONE" ]]; then
echo "Gene_$NAME = $START-$LENGTH;" >>partFinderGeneList.txt
else
((END=START+LENGTH-1))
echo $LENGTH
echo $END
echo "Gene_$NAME = $START-$END;" >>partFinderGeneList.txt
fi
((START=START+LENGTH))
done
