#!/bin/bash

echo "1️⃣ FASTQC"
bash scripts/01_qc_fastqc.sh

echo "2️⃣ INDEX"
bash scripts/02_build_index.sh

echo "3️⃣ ALIGNMENT"
bash scripts/03_align_reads.sh

echo "4️⃣ COUNT"
Rscript scripts/04_count_reads.R

echo "🚀 Pipeline tamamlandı!"
