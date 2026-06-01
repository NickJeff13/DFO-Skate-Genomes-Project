#This was done in command-line

module load apptainer

apptainer exec \
    $SCRATCH/blobtoolkit.sif \
    bash -c "
        mkdir -p /scratch/mahnoorn/snailplots/smoothskate && \
        cd /scratch/mahnoorn/snailplots/smoothskate && \
        blobtools create --fasta /scratch/mahnoorn/earlgrey_smoothskate/genome/GCA_038087875.1_sMalSen1_p1.0_genomic.fna datasets/smoothskate && \
        blobtools add --busco /project/def-cottenie/mahnoorn/DFO-Skate-Genomes-Project/results/busco/smooth_busco/run_vertebrata_odb10/full_table.tsv datasets/smoothskate && \
        blobtools view datasets/smoothskate --view snail --plot --out snailplots
    "
