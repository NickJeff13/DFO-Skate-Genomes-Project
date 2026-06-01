module load apptainer

apptainer exec \
  $SCRATCH/blobtoolkit.sif \
    bash -c "
      mkdir -p /scratch/mahnoorn/snailplots/winterskate && \
      cd /scratch/mahnoorn/snailplots/winterskate && \
      blobtools create --fasta /scratch/mahnoorn/earlgrey_winterskate/genome/GCA_036785375.1_sLeuOce1_p1.0_genomic.fna datasets/winterskate && \
      blobtools add --busco /project/def-cottenie/mahnoorn/DFO-Skate-Genomes-Project/results/busco/winter_busco/run_vertebrata_odb10/full_table.tsv datasets/winterskate && \
      blobtools view datasets/winterskate --view snail --plot --out snailplots
      "
