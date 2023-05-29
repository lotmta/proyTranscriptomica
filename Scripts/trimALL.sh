#!/bin/bash 
files_1=$(ls fastq| grep "_1")
files_2=$(ls fastq| grep "_2")


for i in {1..12}; do
	R1=$(sed "${i}q;d"  <(cat <<< "$files_1"))
	R2=$(sed "${i}q;d"  <(cat <<< "$files_2"))

	trim_galore --cores 8 -o trimFastq/ --paired fastq/$R1 fastq/$R2 
done
