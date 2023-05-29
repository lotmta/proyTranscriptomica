#!/bin/bash 
files=$(ls histat)

for i in $files; do

	ext=${i::-4}
	samtools view -bSq 10 histat/$i | samtools sort --threads 10 -T $ext -o histat/$ext.bam
	samtools index histat/$ext.bam
done
