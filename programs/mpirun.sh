# The bash file to launch parallel CMEODE simulations
# Each CMEODE simulation is independent with each other, i.e. do not communicate with each other

# Activate conda enviroment
source ~/anaconda3/etc/profile.d/conda.sh
conda activate LM_Cell

# Change the directory as you need
SIM_NAME='Test'
SIM_YEAR='2025'
BASE_DIR="/home/enguang/Documents/Paper_ComplexFormation/Minimal_Cell_ComplexFormation"
OUTPUT_DIR="$BASE_DIR/output_${SIM_NAME}_1/"
INPUT_DIR="$BASE_DIR/input_data/"

# Create Output Folder
if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir -p "$OUTPUT_DIR"
fi

# Run Simulation
mpirun -np 25 python ./WCM_CMEODE_Hook.py \
    -in "$INPUT_DIR" \
    -st cme-ode \
    -t 7200 \
    -rs 60 \
    -hi 1 \
    -f "$OUTPUT_DIR" \

# Input Arguments
# for mpirun:

    # -np numbers of parallel CMEODE simulations, integer number from 1 to nmax

# for python:
    # -in input directory

    # -st simulation type, only support "cme-ode"

    # -t simulation time, integer numbers, in seconds

    # -rs restart interval, integer numbers, in seconds

    # -hi hook interval, integer numbers, in seconds
    
    # -f directory to store output trajectory .csv files and log .txt files, strings, created automatically

    # -si start index of cell replicates, integer numbers, from 1, 2, 3, ...

    # For the times, the former should be the integer multiples of the latter e.g. -t 120 -rs 60 -wi 2 -hi 1
