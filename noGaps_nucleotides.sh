#!/bin/bash

##This script will remove gap-only columns and columns with non-gaps in 4 or less taxa from an alignment. All files need to be fasta format, and as written the file suffix must be .fas

echo "Removing gap-only columns..." 
for FILENAME in *.fas
do
awk 'BEGIN { FS = "" }
!/^>/ { \
  sequence[NR] = $0 
  for ( i = 1; i <= NF; i++ ) \
    position[i] += ($i ~ /[A-MO-Z]/) \
} \
/^>/ { \
  header[NR] = $0 \
} \
END { \
  for ( j = 1; j <= NR; j++ ) { \
    if ( j in header) print header[j]
    if ( j in sequence ) { 
    $0 = sequence[j]
    for ( i = 1; i <= NF; i++)
    if ( position[i] > 4 ) printf "%s", $i  ###4 is the number of taxa where if non-gaps are present in 4 or less taxa that column is removed. Can change to zero to make it so script only removes columns with all gaps.
    printf "\n"
    } \
  } \
}' $FILENAME > $FILENAME.nogaps
done
#rename .fas.nogaps .fas *.fas.nogaps
echo Done
echo
