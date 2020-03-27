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

Open `A2780_6hr_R2_featureCount.out` for the transcript counts we obtained. If you open this data using R, the first column of the data frame is the list of genes for which transcripts were obtained. The seventh column contains the transcript counts for the cisplatin-sensitive cell line and the eighth column contains the transcript counts for the cisplatin-resistant cell line. 

To reproduce the first figure we created, the heatmap showing the transcript counts for the 21 genes with the largest differences in expression between the two cell lines, run `Final_Project_Proposal_Figure.Rmd`. This code is broken into three chunks. Run the first chunk to open the data file, isolate the useful data (just the genes and transcript counts), and calculate the percentage difference in expression for each gene. The percentage difference will then be used to filter the data to only show the genes with the largest differences in expression between the two cell lines. In the second chunk of code, you can change the percentage difference threshold on the data filter to determine how many genes will be visible on the heatmap. Then, you can simply run the second chunk of code and it should produce the heatmap. 

The third chunk of code works fairly similarly to the second chunk except that it produces a heatmap showing the fold difference between the number of transcripts for the two cell types in a heat map. We decided not to use this figure in our project for now, but left the code in case we decide to use it later. You do not need to run this chunk of code to reproduce our analyses. 

# Directory Structure

### Data
All data-related files are in `data/`. 




### Analysis


### Figures
