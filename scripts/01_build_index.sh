#!/bin/bash
source /opt/conda/etc/profile.d/conda.sh
conda activate omics_course

mkdir -p results/index

subread-buildindex \
  -o results/index/mini_genome_index \
  data/genome/mini_genome.fa

echo "Index oluşturuldu."
