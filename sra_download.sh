#!/bin/bash

# sbatch -N 1 -c 8 -p short -t 0-11:00 --mem=50G --wrap="/home/rav589/scRNA-onco-analysis/sra_download.sh"

module load sratoolkit

ACC_LIST="/home/rav589/scRNA-onco-analysis/data/SRR_Acc_List.txt"

# tail -n +2 "$ACC_LIST" | while read -r SRA; do
#     prefetch "$SRA"

#     echo "Extracting fastq files $(date)"
#     fastq-dump --split-3 --gzip "$SRA"
    
# done

while read -r SRA; do
    echo "Processing $SRA..."

    # Prefetch the SRA data
    prefetch "$SRA"

    echo "Extracting fastq files $(date)"
    fastq-dump --split-3 --gzip "$SRA"
    
    echo "Done processing $SRA"
done < "$ACC_LIST"

