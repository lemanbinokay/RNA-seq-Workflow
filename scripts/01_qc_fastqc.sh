#!/bin/bash
source /opt/conda/etc/profile.d/conda.sh
conda activate omics_course

mkdir -p results/fastqc

for fq in data/fastq/*.fastq
do
  fastqc "$fq" -o results/fastqc
done

echo "FastQC tamamlandı"
