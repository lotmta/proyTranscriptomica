#!/bin/bash 
files_1=$(ls trimFastq | grep "_1")
files_2=$(ls trimFastq| grep "_2")


for i in {1..12}; do
	R1=$(sed "${i}q;d"  <(cat <<< "$files_1"))
	R2=$(sed "${i}q;d"  <(cat <<< "$files_2"))

	outp=${R1:0:10}

	echo ${outp}

	hisat2 -p 20 --no-mixed --no-discordant --no-unal -x /export/storage/users/dvalle/indexes/mm10.ensembl99.genes -1 trimFastq/$R1 -2 trimFastq/$R2 -S histat/$outp.sam 
done
