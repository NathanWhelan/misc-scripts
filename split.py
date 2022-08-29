#!/usr/bin/env python
#Script written by Jesse Breinholt (jessebreinholt@gmail.com) and Chandra Earl (sunray1@ufl.edu)
#to split a fasta file containing multiple loci into individual files for each locus. The script
#needs a fasta file containing sequences from many loci/taxa and a character used as a delimiter to
#split the loci from the taxa name (I suggest you use an underscore). The name of the loci must be the
#first part of the sequence name, then the delimiter, then what ever else you want. (eg. L001_Bombyx_mori)
#Other delimiters have not been tested but should work. example: ./split.py infile _

import sys
from Bio import SeqIO

arguments = sys.argv
filein = arguments[1]
delim=arguments[2]

if "-h" in arguments:
	sys.exit("./split.py inputfile delimiter")
elif len(arguments) < 3:
	sys.exit("./split.py inputfile delimiter")
	
record_dic = {}
#read input file and fill a dictionary, using loci as keys and lists of SeqIO records as values
records = SeqIO.parse(filein, "fasta")
for record in records:
	locus = record.id.split(delim)[0]
	if locus in record_dic.keys():
		value_list = record_dic[locus]
		value_list.append(record)
		record_dic[locus] = value_list
	else:
		record_dic[locus] = [record]
		
#iterate through dictionary and print records to file
for locus in record_dic:
	outfile = open(locus + ".fa", "w")
	SeqIO.write(record_dic[locus], outfile, "fasta")