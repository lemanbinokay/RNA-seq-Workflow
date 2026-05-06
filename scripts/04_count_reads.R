library(Rsubread)

dir.create("results/counts", recursive = TRUE, showWarnings = FALSE)

bams <- list.files(
  "results/bam",
  pattern = "\\.bam$",
  full.names = TRUE
)

counts <- featureCounts(
  files = bams,
  annot.ext = "data/genome/mini_annotation.gtf",
  isGTFAnnotationFile = TRUE,
  isPairedEnd = FALSE,
  GTF.featureType = "exon",
  GTF.attrType = "gene_id",
  nthreads = 2
)

count_matrix <- counts$counts
colnames(count_matrix) <- gsub(".bam$", "", basename(colnames(count_matrix)))

write.table(
  count_matrix,
  "results/counts/mini_count_matrix.tsv",
  sep = "\t",
  quote = FALSE,
  col.names = NA
)

print(count_matrix)
