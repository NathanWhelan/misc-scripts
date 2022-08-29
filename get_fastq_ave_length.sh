#!/bin/bash
zcat $1 | awk '{if(NR%4==2) {count++; bases += length} } END{print bases/count}'
