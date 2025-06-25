## Programs for running CME/ODE model of minimal cell

#### Author: Enguang Fu
#### Email: enguang3@illinois.edu


#### Generals      

Simulating a whole JCVI-SYN3A cell using hybrid CME/ODE method

The CME and ODE communicates per hookInterval using user defined solver hookSolver_CMEODE

Launch the simulation by mpirun.sh

#### Input Files

Folder: ./input_data/

Check input README file for more

#### Output Files

Output folders are defined in the mpirun.sh and will be created if not exist.

The output files are three csv files and one log file for each CMEODE simulation replicate with rank r.

    Three csv files are counts_r.csv, SA_r.csv, and Flux_r.csv and one log file is log_r.txt.

    counts_r.csv is the trajectories of counts (unit: numbers) of all CMEODE species.

    SA_r.csv is the trajectories of surface area (unit: nm2 or m2) and volume (unit: Liter).

    Flux_r.csv is the trajectorie of all fluxes (unit: mM/s) through ODE reactions.
 
    The trajectories are sampled per hook interval.

    The typical size for a single csv file is 10 to 200 MBs when simulating 6300 seconds with hook interval 1 second.

log_r.txt as a log file contains the simulation start and end time, time cost of each operations and possible errors.


#### Scripts

Launching the Parallel Simulation:

    mpirun.sh - parallel simulation launching bash file
Main Script:

    WCM_CMEODE_Hook.py - Main script

Constructing the CMEODE framework:

    species_counts.py - defining class for easy passing of species counts data in the hook algorithm.

    integrate.py - perform the ODE integration 

    initiation.py - initialize constants, time traces of counts, membranes 

    communicate.py - updates CME and ODE states, calculate costs and update membrane
    
    hookSolver_CMEODE.py - user defined solver where hookSimulation performs every hookInterval

    hook_CMEODE.py - the operations when do hooking/communicating between CME/ODE

    filesaving.py - export the time traces of counts, Surface area, and fluxes into CSV files

Biological:

    rxns_CME.py - add GIP reactions including replication, transcription, translation, tRNA charging to CME
    
    cme_complexation.py - add Protein Complex Formation reactions 

    rxns_ODE.py - construct the ODE system using odecell

    replication.py - replication initiation and replication reactions
    
    GIP_rates.py - calculate the rates for genetic information processes (GIP) in CME

#### Launching the Simulation

Execute the mpirun.sh to parallelly run CMEODE models

`Bash mpirun.sh`

See mpi_run.sh file for detailed explanation
