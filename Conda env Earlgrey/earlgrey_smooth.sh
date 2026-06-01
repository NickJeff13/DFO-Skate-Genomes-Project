#!/bin/bash
#SBATCH --job-name=earlgrey_smoothskate
#SBATCH --account=def-cottenie
#SBATCH --time=7-00:00:00
#SBATCH --cpus-per-task=16
#SBATCH --mem=128G
#SBATCH --output=earlgrey_smoothskate/logs/%x_%j.out
#SBATCH --error=earlgrey_smoothskate/logs/%x_%j.err
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mnizaman@uoguelph.ca

# I downloaded and configured for Dfam partition 12 (vertabrata) before this so -r chondrichthyes could be used

# Environment
source /home/mahnoorn/miniforge3/etc/profile.d/conda.sh
conda activate earlgrey2

# Paths
GENOME=$SCRATCH/earlgrey_smoothskate/genome/GCA_038087875.1_sMalSen1_p1.0_genomic.fna
OUTDIR=$SCRATCH/earlgrey_smoothskate/outputs

# Run EarlGrey
earlGrey -g "$GENOME" -s smoothskate -o "$OUTDIR" -t 16 -r chondrichthyes -q yes

