#!/bin/bash
#SBATCH --job-name=trinity_smoothskate
#SBATCH --account=def-cottenie
#SBATCH --time=24:00:00
#SBATCH --cpus-per-task=16
#SBATCH --mem=128G
#SBATCH --output=trinity_smoothskate/logs/trinity_%j.out
#SBATCH --error=trinity_smoothskate/logs/trinity_%j.err
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mnizaman@uoguelph.ca

module load StdEnv/2020
module load trinity/2.14.0
module load samtools
module load jellyfish
module load salmon/1.7.0
module load openmpi/4.0.3
module load gcc/9.3.0


Trinity \
    --seqType fq \
    --left $SCRATCH/trinity_smoothskate/reads/SRR26062589_1.fastq.gz \
    --right $SCRATCH/trinity_smoothskate/reads/SRR26062589_2.fastq.gz \
    --CPU 16 \
    --max_memory 120G \
    --output $SCRATCH/trinity_smoothskate/trinity_assembly \
    --full_cleanup
