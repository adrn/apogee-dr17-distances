#!/bin/bash
#SBATCH -J joaquin
#SBATCH -o logs/joaquin.o%j
#SBATCH -e logs/joaquin.e%j
#SBATCH -N 1
#SBATCH --ntasks-per-node=64
#SBATCH -t 12:00:00
#SBATCH -p cca
#SBATCH --constraint=rome

source ~/.bash_profile
init_conda

cd /mnt/ceph/users/apricewhelan/projects/apogee-dr17-distances

date

mpirun python3 -m mpi4py.run -rc thread_level='funneled' \
$CONDA_PREFIX/bin/joaquin run -c config.yml -v --mpi

date

