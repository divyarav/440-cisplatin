#!/bin/bash

STAR --version
STAR=STAR

STARgenomeDir="/nfs/young_ata3/SWH/Cancer-Project/cisplatin-resistant_rna-seq/star_index/hg19_RefSeq"
fastaGenome="/nfs/genomes/human_gp_feb_09/fasta_whole_genome/hg19_all.fa"
gtf="/nfs/genomes/human_gp_feb_09/gtf/hg19.refseq.gtf"

STARparIndex="                                                                                                                              
--runThreadN 8                                                                                                                         
--runMode genomeGenerate 
--genomeDir $STARgenomeDir                                                                                                                  
--genomeFastaFiles $fastaGenome                                                                                                             
--sjdbGTFfile $gtf                                                                                                                        
--sjdbOverhang 100                                                                                                                          
--outFileNamePrefix $STARgenomeDir"


#echo $STAR $STARparIndex
#bsub $STAR $STARparIndex


###############################
###### Access SRA files #######
###############################

#prefetch --option-file kuhlmannSraFileList.txt

#fastq-dump -outdir ./fastq --gzip -I --split-files /home/swilson/ncbi/public/sra/SRR5482435.sra

#java -jar /usr/local/share/Trinity-v2.6.5/trinity-plugins/Trimmomatic-0.36/trimmomatic-0.36.jar PE SRR5482436_1.fastq.gz SRR5482436_2.fastq.gz SRR5482436_1_paired.fastq.gz SRR5482436_1_unpaired.fastq.gz SRR5482436_2_paired.fastq.gz SRR5482436_2_unpaired.fastq.gz ILLUMINACLIP:/usr/local/share/Trinity-v2.6.5/trinity-plugins/Trimmomatic/adapters/TruSeq3-PE.fa:2:30:10:2:true LEADING:15 TRAILING:15 SLIDINGWINDOW:4:15 MINLEN:36 CROP:75

##########################
##### Process Files ######
##########################
rootDir="/home/swilson/young_ata3/SWH/Cancer-Project/RNA-seq/fastq/"
declare -A files=(
    #["SRR5482437"]="SRR5482437_1.fastq.gz"
    #["SRR5482438"]="SRR5482438_1.fastq.gz"
    #["SRR5482439"]="SRR5482439_1.fastq.gz"
    #["SRR5482440"]="SRR5482440_1.fastq.gz"
    #["SRR5482441"]="SRR5482441_1.fastq.gz"
    #["SRR5482442"]="SRR5482442_1.fastq.gz"
    #["SRR5482443"]="SRR5482443_1.fastq.gz"
    #["SRR5482444"]="SRR5482444_1.fastq.gz"
    #["SRR5482445"]="SRR5482445_1.fastq.gz"
    #["SRR5482446"]="SRR5482446_1.fastq.gz"
    #["SRR5482447"]="SRR5482447_1.fastq.gz"
    #["SRR5482448"]="SRR5482448_1.fastq.gz"
    #["SRR5482449"]="SRR5482449_1.fastq.gz"
    #["SRR5482450"]="SRR5482450_1.fastq.gz"
    #["SRR5482451"]="SRR5482451_1.fastq.gz"
    #["SRR5482452"]="SRR5482452_1.fastq.gz"
    #["SRR5482453"]="SRR5482453_1.fastq.gz"
    #["SRR5482454"]="SRR5482454_1.fastq.gz"
    #["SRR5482455"]="SRR5482455_1.fastq.gz"
    #["SRR5482456"]="SRR5482456_1.fastq.gz"
    #["SRR5482457"]="SRR5482457_1.fastq.gz"
    #["SRR5482458"]="SRR5482458_1.fastq.gz"
    #["SRR5482459"]="SRR5482459_1.fastq.gz"
    #["SRR5482460"]="SRR5482460_1.fastq.gz"
    #["SRR5482461"]="SRR5482461_1.fastq.gz"
    #["SRR5482462"]="SRR5482462_1.fastq.gz"
    #["SRR5482463"]="SRR5482463_1.fastq.gz"
    #["SRR5482464"]="SRR5482464_1.fastq.gz"
    #["SRR5482465"]="SRR5482465_1.fastq.gz"
    #["SRR5482466"]="SRR5482466_1.fastq.gz"
    #["SRR5482467"]="SRR5482467_1.fastq.gz"
    #["SRR5482468"]="SRR5482468_1.fastq.gz"
    #["SRR5482469"]="SRR5482469_1.fastq.gz"
    #["SRR5482470"]="SRR5482470_1.fastq.gz"
    #["SRR5482471"]="SRR5482471_1.fastq.gz"
    #["SRR5482472"]="SRR5482472_1.fastq.gz"
    #["SRR5482473"]="SRR5482473_1.fastq.gz"
    #["SRR5482474"]="SRR5482474_1.fastq.gz"
    #["SRR5482475"]="SRR5482475_1.fastq.gz"
    #["SRR5482476"]="SRR5482476_1.fastq.gz"
    #["SRR5482477"]="SRR5482477_1.fastq.gz"
    #["SRR5482478"]="SRR5482478_1.fastq.gz"
    #["SRR5482479"]="SRR5482479_1.fastq.gz"
    #["SRR5482480"]="SRR5482480_1.fastq.gz"
    #["SRR5482481"]="SRR5482481_1.fastq.gz"
    #["SRR5482482"]="SRR5482482_1.fastq.gz"
)

# for file in "${!files[@]}"
# do
#    java -jar /usr/local/share/Trinity-v2.6.5/trinity-plugins/Trimmomatic-0.36/trimmomatic-0.36.jar PE $rootDir/"${file}_1.fastq.gz" $rootDir/"${file}_2.fastq.gz" $rootDir/"${file}_1_paired.fastq.gz" $rootDir/"${file}_1_unpaired.fastq.gz" $rootDir/"${file}_2_paired.fastq.gz" $rootDir/"${file}_2_unpaired.fastq.gz" ILLUMINACLIP:/usr/local/share/Trinity-v2.6.5/trinity-plugins/Trimmomatic/adapters/TruSeq3-PE.fa:2:30:10:2:true LEADING:15 TRAILING:15 SLIDINGWINDOW:4:15 MINLEN:36 CROP:75
# done

STARgenomeDir="/home/swilson/young_ata3/SWH/Cancer-Project/cisplatin-resistant_rna-seq/star_index/hg19_RefSeq"
nThreadsSTAR="8"

STARparCommon="
--genomeDir $STARgenomeDir 
--outSAMunmapped Within 
--outFilterType BySJout 
--outSAMattributes NH HI AS NM MD 
--outFilterMultimapNmax 20 
--outFilterMismatchNmax 999 
--outFilterMismatchNoverReadLmax 0.05 
--alignIntronMin 20
--alignIntronMax 1000000 
--alignMatesGapMax 1000000 
--alignSJoverhangMin 8 
--alignSJDBoverhangMin 1 
--sjdbScore 1"

STARparRun="
--runThreadN $nThreadsSTAR 
--genomeLoad NoSharedMemory 
--limitBAMsortRAM 10000000000"

STARparBAM="
--outSAMtype BAM SortedByCoordinate
--quantMode TranscriptomeSAM"

#gunzip $rootDir/"SRR5482437_1.fastq.gz" > $rootDir/"SRR5482437_1.fastq"
#gunzip $rootDir/"SRR5482437_2.fastq.gz" > $rootDir/"SRR5482437_2.fastq"
#gunzip $rootDir/"SRR5482449_1.fastq.gz" > $rootDir/"SRR5482449_1.fastq"                       
#gunzip $rootDir/"SRR5482449_2.fastq.gz" > $rootDir/"SRR5482449_2.fastq"  

#bsub -m it-bigboy $STAR $STARparCommon $STARparRun $STARparBAM --outFileNamePrefix A2780_6hr_Control_R2 --readFilesIn $rootDir/"SRR5482437_1.fastq" $rootDir/"SRR5482437_2.fastq"

#bsub -m it-bigboy $STAR $STARparCommon $STARparRun $STARparBAM --outFileNamePrefix A2780_6hr_Treated_R2 --readFilesIn $rootDir/"SRR5482449_1.fastq" $rootDir/"SRR5482449_2.fastq"

bsub featureCounts -p -s 0 -T 4 -a $gtf -o A2780_6hr_R2_featureCount.out A2780_6hr_Control_R2Aligned.sortedByCoord.out.bam A2780_6hr_Treated_R2Aligned.sortedByCoord.out.bam

# bsub featureCounts -p -s 0 -T 4 -a $gtf -o A2780_6hr_Treated_R2_featureCount.out A2780_6hr_Treated_R2Aligned.sortedByCoord.out.bam 

# bsub STAR --genomeDir /nfs/young_ata3/COHESIN_MODS/Workshop/RNA-seq/database/star_index/hg19_RefSeq  --readFilesIn $rootDir/"SRR5482437_1.fastq.gz" $rootDir/"SRR5482437_2.fastq.gz" --sjdbScore 2 --outFileNamePrefix A2780_6hr_Control_R2 --runThreadN 8 --outSAMtype BAM SortedByCoordinate