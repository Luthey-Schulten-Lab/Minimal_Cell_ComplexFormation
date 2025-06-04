# List of Input Files for CME/ODE WCM of Syn3A

## **1. syn3A.gb**
- [GenBank file](https://www.ncbi.nlm.nih.gov/nuccore/CP016816) of JCVI-SYN3A (ACCESSION: CP016816 in NCBI).
- Contains the **sequence, segmentation, and functions** of the whole genome of syn3A.
- **Read in** once at the very beginning of the simulation.

### Usage:
- The `mapDNA` function in **`initiation.py`** converts `syn3A.gb` into a multilayer dictionary (`genome`).
- The `genome` dictionary is used to define **CME transcription, translation, and degradation reactions** in the `addGeneticInformationReactions` function in **`rxns_CME.py`**.

---

## **2. Syn3A_updated.xml**
- Updated **SBML** file of syn3A, based on the file from the [*eLife* 2019 paper](https://elifesciences.org/articles/36842).
- Contains **compartments, metabolites, reactions, and related genes** of metabolism in JCVI-Syn3A.
- **Read in** when constructing ODEs in **`rxns_ODE.py`** (per `hookInterval`) for **stoichiometric coefficients** of reactions.

---

## **3. initial_concentration_JPCB.xlsx**
- Excel file containing **initial counts/concentrations** of proteins, medium, and metabolites.
- **Read in** once at the start of the simulation.

### Sheets:
1. **Comparative Proteomics**:
   - Read when adding **initial counts of proteins** in CME.
   - Contains **Gene LocusTag**, function, localization, and initial protein counts.

2. **Experimental Medium**:
   - **Not read in**.
   - Contains **concentrations of molecules** in the experimental medium.

3. **Simulation Medium**:
   - Read when **initializing the medium**.
   - Contains **concentrations** and **Met IDs** of the simulated medium.

4. **Intracellular Metabolites**:
   - Read when **initializing cytoplasmic metabolites**.
   - Contains **concentrations** and **Met IDs** of simulated metabolites.

5. **protein_metabolites**:
   - Read when initializing **protein metabolites** in **`initiation.py`**.
   - Also read when adding protein metabolite counts in **`rxns_ODE.py`**.
   - Contains **Met IDs** of proteins.

---

## **4. kinetic_params_JPCB.xlsx**
- Excel file containing **metabolic reactions** in ODEs and **tRNA charging** in CME.
- **Read in** when constructing reactions in ODEs (per `hookInterval`) and tRNA charging in CME.

### Sheets:
1. **Central, Nucleotide, Lipid, Cofactor, and Transport**:
   - Contain reactions following **random binding model** and **convenience rate law**.
   - These reactions are added via `defineRandomBindingRxns` in **`rxns_ODE.py`**.

2. **Non-Random-binding Reactions**:
   - Contain **serial phosphorelay reactions** and **passive transport reactions**.
   - These are added via `defineNonRandomBindingRxns` in **`rxns_ODE.py`**.

3. **tRNA Charging**:
   - Contains **amino acids, synthetases, and kinetic parameters** for tRNA charging reactions.
   - Read in via `tRNAcharging` in **`rxns_CME.py`**.

> **Note:** Other sheets in `kinetic_params_10thSeptember.xlsx` are **not used** in the current simulation.

---

## **5. complex_formation_JPCB.xlsx**
- Excel file containing **compositions of protein complexes**.
- **Read in** when constructing **assembly reactions** of protein complexes in CME.

### Sheets:
- **Complexes**:
  - Contains **compositions, assembly pathways, initial counts, and PDB structures** of protein complexes.

---

## **6. avg_mRNACount_JPCB.xlsx**
- Contains **initial counts** of each mRNA.
- Obtained by averaging the **steady-state counts** (see SI for details).
- Old name: avg_mRNACount_30thAugust_1200_1800.xlsx
---

## **7. oneParamMulder-local_min.json**
- JSON file containing **assembly pathways and kinetic parameters** of ribosome SSU.
- Data sourced from [Earnest et al.](https://www.sciencedirect.com/science/article/pii/S0006349515007651).

---

## **8. ribo_assembly.xlsx**
- Excel file containing the **assembly pathway** of LSU, SSU and **rate parameters**.

---

