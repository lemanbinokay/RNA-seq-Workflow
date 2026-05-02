#!/bin/bash

echo "Environment aktif ediliyor..."
source /opt/conda/etc/profile.d/conda.sh
conda activate omics_course

echo "FastQC çalıştırılıyor..."
mkdir -p results/fastqc

fastqc data/sample.fastq -o results/fastqc

echo "Bitti 🚀"
echo "Çıktı: results/fastqc klasöründe"
