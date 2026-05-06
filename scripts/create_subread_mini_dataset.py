from pathlib import Path

Path("data/genome").mkdir(parents=True, exist_ok=True)
Path("data/fastq").mkdir(parents=True, exist_ok=True)
Path("results/index").mkdir(parents=True, exist_ok=True)
Path("results/bam").mkdir(parents=True, exist_ok=True)
Path("results/counts").mkdir(parents=True, exist_ok=True)

genes = {
    "geneA": "ATGACCTGACTGATCGTACCGTTAAGCTGACCTAGGCTAACCGTACGATCGTACGGTACCTGACTAAGCTTAGCGTACGATCGTACTGACCTAG",
    "geneB": "CGTTAACGATGCTAGCTTACCGGATCGATGACCTTGGACTAGCTAGGATCCGTAACGTTAGCCTAGGACCTTACGATCGTAGCTAACCGTTA",
    "geneC": "TTGACCGTACGATCGGATCCGTACTAGCTTACGATCGTTAACCGGTACTGATCGATGCTAGGCTAACCGATCGTACTAGCTTGACCGTAA",
    "geneD": "GGCATCGTACCTAGGATCGTTAACCGATGCTAGCTACCGGATTAACGTACGATCGGCTAGTACCGATCGATGCTAACCGTAGGCTA",
    "geneE": "CCTAGGATCGTACGATTAACCGGCTAGCTTACGATCGGATCCGTACCGTTAAGCTAGGATCGTACTAGCTAACCGGATCGTACTAACG",
}

spacer = "N" * 50
chrom = spacer
coords = {}
pos = len(chrom) + 1

for gene, seq in genes.items():
    start = pos
    chrom += seq
    end = start + len(seq) - 1
    coords[gene] = (start, end)
    chrom += spacer
    pos = len(chrom) + 1

with open("data/genome/mini_genome.fa", "w") as f:
    f.write(">chrMini\n")
    for i in range(0, len(chrom), 80):
        f.write(chrom[i:i+80] + "\n")

with open("data/genome/mini_annotation.gtf", "w") as f:
    for gene, (start, end) in coords.items():
        f.write(
            f'chrMini\tmini\texon\t{start}\t{end}\t.\t+\t.\tgene_id "{gene}"; gene_name "{gene}";\n'
        )

counts = {
    "control_1": {"geneA": 10, "geneB": 25, "geneC": 15, "geneD": 3,  "geneE": 20},
    "control_2": {"geneA": 11, "geneB": 22, "geneC": 14, "geneD": 4,  "geneE": 21},
    "treated_1": {"geneA": 30, "geneB": 8,  "geneC": 15, "geneD": 12, "geneE": 20},
    "treated_2": {"geneA": 28, "geneB": 7,  "geneC": 16, "geneD": 11, "geneE": 19},
}

for sample, gene_counts in counts.items():
    with open(f"data/fastq/{sample}.fastq", "w") as f:
        for gene, n in gene_counts.items():
            seq = genes[gene][:50]
            qual = "I" * len(seq)
            for i in range(1, n + 1):
                f.write(f"@{sample}_{gene}_{i}\n")
                f.write(seq + "\n")
                f.write("+\n")
                f.write(qual + "\n")

print("Mini Subread dataset created.")
