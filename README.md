# 440-cisplatin: Cisplatin Resistance in Ovarian Cancer

This repo contains the code to reproduce all of the analyses in "Identifying novel pathways involved in resistance to cisplatin" by Divya Ravinder and Susana Hawken.

The raw RNA-seq data is available on [GEO](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM2589608). All of the raw sequencing files are on SRA (Sequence Read Archive). This data was obtained from "The conjugated antimetabolite 5-FdU-ECyd and its cellular and molecular effects on platinum-sensitive vs. -resistant ovarian cancer cells in vitro", Schott et al. 2017.

_Schott S, Wimberger P, Klink B, et al. The conjugated antimetabolite 5-FdU-ECyd and its cellular and molecular effects on platinum-sensitive vs. -resistant ovarian cancer cells in vitro. Oncotarget. 2017;8(44). doi:10.18632/oncotarget.20260._

# Reproducing Analyses

## Installing
To reproduce the analyses performed in this project, you'll need to install the required tools. 

Download [STAR: Genetics version 2.6.1](http://star.mit.edu/genetics/download/index.html). You will use this to align the raw reads to the reference sequence. 

Install [fastq-dump](https://github.com/ncbi/sra-tools/wiki/HowTo:-Binary-Installation). You will use this to get the FASTQ files. 

Install [Trimmomatic version 0.36](https://kbase.us/applist/apps/kb_trimmomatic/run_trimmomatic/release). You will use this to trim the adapters off the reads.

Install [featurecounts](https://bio.tools/featurecounts). You will use this to count the transcripts for each gene for each cell type. 

Download [R version 3.4.1 (or latest version)](https://www.r-project.org) to reproduce the analyses.

## Reproducing Analyses
After downloading the RNA-seq data from [GEO](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM2589608), you will need to align the reads within a FASTQ file to a reference sequence, trim adapters off the reads, and count transcripts for each gene. To do this, run `root.sh`. This will allow you to obtain transcript counts for each gene for both the cisplatin-sensitive cell line and the cisplatin-resistant cell line. 

Open `A2780_6hr_R2_featureCount.out` for the transcript counts we obtained. If you open this data using R, the first column of the data frame is the list of genes for which transcripts were obtained. The seventh column contains the transcript counts for the cisplatin-sensitive cell line and the eighth column contains the transcript counts for the cisplatin-resistant cell line. 

To reproduce the first figure we created, the heatmap showing the transcript counts for the 21 genes with the largest differences in expression between the two cell lines, run `Transcript_count_heatmap.Rmd`. This code is broken into three chunks. Run the first chunk to open the data file, isolate the useful data (just the genes and transcript counts), and calculate the percentage difference in expression for each gene. The percentage difference will then be used to filter the data to only show the genes with the largest differences in expression between the two cell lines. In the second chunk of code, you can change the percentage difference threshold on the data filter to determine how many genes will be visible on the heatmap. Then, you can simply run the second chunk of code and it should produce the heatmap. 

The third chunk of code works fairly similarly to the second chunk except that it produces a heatmap showing the fold difference between the number of transcripts for the two cell types in a heat map. We decided not to use this figure in our project for now, but left the code in case we decide to use it later. You do not need to run this chunk of code to reproduce our analyses. 

# Directory Structure

### Data
All data-related files are in the `Data/` folder:

`root.sh` - script for collecting raw data from GEO and aligning reads

`A2780_6hr_R2_featureCount.out` - processed RNA-seq data (transcript counts after alignment of the reads)

### Analysis
All code for conducting data analyses are in the `Analysis/` folder:

`Transcript_count_heatmap.Rmd` - code used to generate heatmap showing the transcript counts for the 21 genes with the largest differences in expression between the two cell lines

### Figures
All figures are in the `Figures/` folder:

`Transcript_count_heatmap.pdf` - pdf of heatmap showing the transcript counts for the 21 genes with the largest differences in expression between the two cell lines
