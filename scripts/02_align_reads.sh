#!/bin/bash
source /opt/conda/etc/profile.d/conda.sh
conda activate omics_course

mkdir -p results/bam

for fq in data/fastq/*.fastq
do
  sample=$(basename "$fq" .fastq)

  echo "Aligning $sample"

  subread-align \
    -t 0 \
    -i results/index/mini_genome_index \
    -r "$fq" \
    -o results/bam/${sample}.bam
done

echo "Alignment tamamlandı."
