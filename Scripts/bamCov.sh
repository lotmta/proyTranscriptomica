#!/bin/bash 
files=$(ls histat | grep '.bam')


for i in $files; do

	ext=${i::-4}
	echo ${ext}
	bamCoverage -p 20 -b histat/$i -o histat/$ext.bw -bs 20 --blackListFileName /export/storage/users/dvalle/genome/mm10-blacklist-v2.bed --normalizeUsing BPM --skipNAs --ignoreDuplicates  --samFlagInclude 64

done
