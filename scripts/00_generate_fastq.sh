#!/bin/bash
mkdir -p data/fastq

make_reads () {
  sample=$1
  geneA=$2
  geneB=$3
  geneC=$4
  geneD=$5
  geneE=$6
  outfile="data/fastq/${sample}.fastq"

  > "$outfile"

  add_reads () {
    gene=$1
    seq=$2
    n=$3
    for i in $(seq 1 $n); do
      echo "@${sample}_${gene}_${i}" >> "$outfile"
      echo "$seq" >> "$outfile"
      echo "+" >> "$outfile"
      printf 'I%.0s' $(seq 1 ${#seq}) >> "$outfile"
      echo "" >> "$outfile"
    done
  }

  add_reads geneA TGCTACGATCGATCGTACGATCGATCGTACGATCGATCGTACGATCGATCG "$geneA"
  add_reads geneB CGATCGTTAACCGGTACCGATCGTTAACCGGTACCGATCGTTAACCGGTAC "$geneB"
  add_reads geneC TTTGGGCCCAAATTTGGGCCCAAATTTGGGCCCAAATTTGGGCCCAAATTT "$geneC"
  add_reads geneD GGGATATCCGATATGGGATATCCGATATGGGATATCCGATATGGGATATC "$geneD"
  add_reads geneE CCCGGAATTCCGGAACCCGGAATTCCGGAACCCGGAATTCCGGAACCCGGA "$geneE"
}

make_reads control_1 10 25 15 3 20
make_reads control_2 11 22 14 4 21
make_reads treated_1 30 8 15 12 20
make_reads treated_2 28 7 16 11 19

echo "FASTQ düzgün oluşturuldu"
