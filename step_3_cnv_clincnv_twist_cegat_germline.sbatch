#!/bin/bash 
#### 13012023
#### Hamidah Ghani <hamidahghani20@rcsi.ie>
#### hg38_CNV_Calling_WES
#### 
#SBATCH --job-name=job
#SBATCH --output=%j.cnv_wes_job1.out 
#SBATCH --error=%j.cnv_wes_job1.err 
#SBATCH --partition=ProdQ 
#SBATCH --time=10-00:00:00
#SBATCH --ntasks=2
#SBATCH --mem=15000
#SBATCH --mail-type=END,FAIL 
#SBATCH --mail-user=hamidahghani20@rcsi.com


module load ClinCNV/1.18.3

Rscript ${EBROOTCLINCNV}/clinCNV.R --normal /home/data/lighthouse/ClinCNV/lighthouse_cohorts/cegat_LH/output_ontarget.cov \
--bed /home/data/lighthouse/ClinCNV/lighthouse_cohorts/cegat_LH/cegat_twist_gcAnnotated.bed \
--out /home/data/lighthouse/ClinCNV/lighthouse_cohorts/cegat_LH/germline_output \
--scoreG 60 --lengthG 0 --numberOfThreads 2 --hg38

exit 0
