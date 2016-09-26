#!/bin/bash
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=20
#SBATCH --time=2-00:00:00
#SBATCH --job-name=benzene
#SBATCH --output=benzene.out
export
for i in $SLURM_JOB_NAME.xml $SLURM_JOB_NAME.dat; do
    sbcast $SLURM_SUBMIT_DIR/$i $LOCAL/$i
done
cd $LOCAL
module purge
module load intel/15.0.3 openmpi/1.10.2
module load libxml2/2.9.3 hdf5-parallel/1.8.16
module load qmcpack/rev-6761
ulimit -s unlimited
srun qmcpack input.xml
cp $SLURM_JOB_NAME.* $SLURM_SUBMIT_DIR
