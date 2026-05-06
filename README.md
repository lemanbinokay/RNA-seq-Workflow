# OMICS Course – Mini RNA-seq Workflow

Bu repository, “OMICS Teknolojilerine Giriş: Transkriptomik & Metagenomik” kursu kapsamında temel Linux komutları, conda ortamı kullanımı ve RNA-seq analiz adımlarını göstermek amacıyla hazırlanmıştır.

Bu mini workflow ile katılımcılar küçük boyutlu bir eğitim veri seti üzerinde aşağıdaki temel RNA-seq analiz adımlarını çalıştıracaktır:

1. FASTQ kalite kontrolü  
2. Referans genom için index oluşturma  
3. FASTQ dosyalarını referans genoma hizalama  
4. Gen bazlı read count matrisi oluşturma  

Bu veri seti eğitim amaçlıdır ve gerçek biyolojik veri değildir; ancak RNA-seq analiz mantığını birebir yansıtır.

---

## Eğitim Ortamı

Bu repository GitHub Codespaces üzerinde çalıştırılmak üzere hazırlanmıştır.  
Herhangi bir kurulum gerekmez; tüm analizler tarayıcı üzerinden yapılır.

---
## Kurulum

# 🧬 OMICS Course – Mini RNA-seq Workflow

Bu repository, “OMICS Teknolojilerine Giriş: Transkriptomik & Metagenomik” kursu kapsamında **Linux, Conda ve temel RNA-seq analiz adımlarını uygulamalı olarak öğretmek** amacıyla hazırlanmıştır.

Bu mini workflow ile katılımcılar küçük bir veri seti üzerinde aşağıdaki RNA-seq analiz adımlarını çalıştıracaktır:

- FASTQ kalite kontrolü (FastQC)
- Referans genom index oluşturma (Subread)
- Read hizalama (alignment)
- Gen bazlı count matrisi oluşturma (featureCounts)

---

# Amaç

Bu repository’nin amacı:

- Terminal kullanımını öğretmek  
- Conda environment mantığını göstermek  
- Biyoinformatik pipeline nasıl çalışır onu anlatmak  
- HPC mantığına giriş sağlamak  

---

# Eğitim Akışı

FASTQ → QC → Index → Alignment → Count

---

# Kurulum 

Codespaces ortamında conda otomatik aktif gelmez.  
Bu nedenle aşağıdaki adımlar **zorunludur**:

```bash
# conda'yı shell'e bağla (çok önemli!)
source /opt/conda/etc/profile.d/conda.sh

# environment oluştur
conda create -n omics_course -y

# environment aktif et
conda activate omics_course

# gerekli tool'ları kur
conda install -c conda-forge -c bioconda fastqc subread -y
conda install -c conda-forge r-base r-essentials -y

# Kurulum Kontrolü
which fastqc
which subread-align
which Rscript
---

## Nasıl Çalıştırılır?

Codespaces açıldıktan sonra terminalde:

bash scripts/run_all.sh

Bu komut aşağıdaki adımları sırasıyla çalıştırır:

01 FastQC  
02 Index  
03 Alignment  
04 Count  

---

## Klasör Yapısı

omics-course/

data/  
  genome/  
    mini_genome.fa  
    mini_annotation.gtf  

  fastq/  
    control_1.fastq  
    control_2.fastq  
    treated_1.fastq  
    treated_2.fastq  

scripts/  
  01_qc_fastqc.sh  
  02_build_index.sh  
  03_align_reads.sh  
  04_count_reads.R  
  run_all.sh  

results/  
  fastqc/  
  index/  
  bam/  
  counts/  

---

## Pipeline Açıklaması

1. FastQC → FASTQ kalite kontrolü  
2. Index → referans genom index oluşturma (Subread)  
3. Alignment → FASTQ → BAM dönüşümü  
4. Count → featureCounts ile gen bazlı sayım  

---

## Veri Seti

4 örnek bulunmaktadır:

control_1  
control_2  
treated_1  
treated_2  

---

## Beklenen Çıktı

results/counts/mini_count_matrix.tsv

Örnek:

geneA 10 11 30 28  
geneB 25 22 8 7  
geneC 15 14 15 16  
geneD 3 4 12 11  
geneE 20 21 20 19  

---

## Kullanılan Araçlar

FastQC  
Subread  
featureCounts (Rsubread)  
R  
Conda  

---

## Hazırlayan

Leman Binokay  
İzmir Biyotıp ve Genom Merkezi (IBG)
