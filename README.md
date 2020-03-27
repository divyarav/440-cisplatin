# 440-cisplatin: Cisplatin Resistance in Ovarian Cancer

This repo contains the code to reproduce all of the analyses in "Identifying novel pathways involved in resistance to cisplatin" by Divya Ravinder and Susana Hawken.

The raw RNA-seq data is available on [GEO](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM2589608). 

# Reproducing Analyses

## Installing
To reproduce the analyses performed in this project, you'll need to install the required tools. 

Download STAR: Genetics at [http://star.mit.edu/genetics/download/index.html](http://star.mit.edu/genetics/download/index.html). You will use this to process the raw RNA-seq data and obtain transcript counts for each condition.

You should also download R for reproducing the analyses.
Download R version 3.4.1 (or latest version) at [https://www.r-project.org](https://www.r-project.org). 

## Reproducing Analyses
After downloading the RNA-seq data from [GEO](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM2589608), you will need to align the reads within a FASTQ file to a reference sequence. To do this, run `root.sh`. This will allow you to obtain transcript counts for each gene for both the cisplatin-sensitive cell line and the cisplatin-resistant cell line. 

# Directory Structure

### Data
All data-related files are in `data/`.




### Analysis


### Figures
