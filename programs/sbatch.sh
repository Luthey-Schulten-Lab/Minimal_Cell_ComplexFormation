#!/bin/bash
#SBATCH --job-name=3_JPCB_NORNAP
#SBATCH --account=beyi-delta-gpu
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --nodes=1
#SBATCH --gpus-per-node=1
#SBATCH --time=00:05:00
#SBATCH --mem=16g
#SBATCH --partition=gpuA40x4
#SBATCH --mail-user=enguang3@illinois.edu
#SBATCH --mail-type=BEGIN,FAIL,END
#SBATCH --output=%x-%N-%j.out
#SBATCH --error=%x-%N-%j.err

export HYDRA_BOOTSTRAP=fork

SIM_NAME='NORNAP'
SIM_YEAR='2025'
BASE_DIR="/u/$USER/CPLX/${SIM_NAME}${SIM_YEAR}"
OUTPUT_DIR="$BASE_DIR/output_${SIM_NAME}_3/"
INPUT_DIR="$BASE_DIR/input_data/"

if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir -p "$OUTPUT_DIR"
fi

# Run with MPI on the host, container per rank
# Container is started per rank
mpirun -np 1 \
  apptainer exec --nv \
    --bind /u/$USER/MULTI/ \
    /u/$USER/summer2025.sif \
    bash -c "
      source /root/miniconda3/etc/profile.d/conda.sh && \
      conda activate lm_2.5_dev && \
      python ./WCM_CMEODE_Hook.py \
        -in $INPUT_DIR \
        -st cme-ode \
        -t 60 \
        -rs 60 \
        -hi 1 \
        -f $OUTPUT_DIR \
    "
