#!/bin/bash
#SBATCH -p long            # Partition to submit to
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu 10Gb           # Memory in MB
#SBATCH -J Featcounts           # job name
#SBATCH -o /users/genomics/magda/Featcounts.%j.out    # File to which standard out will be written
#SBATCH -e /users/genomics/magda/FeatCounts.%j.err    # File to which standard err will be written

module load singularity/3.2.0-foss-2016b

SCRIPT=/bicoh/MARGenomics/Singularity_scripts/Quantification/feature.counts

singularity exec -B /bicoh/MARGenomics:/bicoh/MARGenomics -B /projects_rg/MARGenomics:/projects_rg/MARGenomics /bicoh/MARGenomics/Singularity_images/subread/subread.img $SCRIPT
