#!/bin/bash 
#### 13012023
#### Hamidah Ghani <hamidahghani20@rcsi.ie>
#### hg38_CNV_Calling_WES
#### 
#SBATCH --job-name=job1
#SBATCH --output=%j.cnv_wes_job1.out 
#SBATCH --error=%j.cnv_wes_job1.err 
#SBATCH --partition=ProdQ 
#SBATCH --time=1-00:00:00
#SBATCH --ntasks=2
#SBATCH --mem=12000
#SBATCH --mail-type=END,FAIL 
#SBATCH --mail-user=hamidahghani20@rcsi.com 
 

module load Miniconda3/4.12.0

#activating a sub-environment
conda activate ngsbits

#To run COV files,for on target 
#clean the bed files by removing unnecessary contigs before run this steps


/home/users/hamidahghani20/.conda/envs/ngsbits/bin/BedCoverage -bam /home/data/lighthouse/ClinCNV/lighthouse_cohorts/cegat_LH/bam_cegat_twist/*.bam \
-in /home/data/lighthouse/ClinCNV/lighthouse_cohorts/cegat_LH/cegat_twist_gcAnnotated.bed \
-min_mapq 5 -decimals 4 > /home/data/lighthouse/ClinCNV/lighthouse_cohorts/cegat_LH/output_ontarget.cov

exit 0