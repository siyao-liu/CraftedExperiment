# Crafted Experiment

This repository contains the code for generating crafted datasets based on real scRNA-seq data. In [our study](), we generated 24 crafted datasets via perturbing genes selected from different levels of sparsity based on the previously published 3 cell line mixture dataset from [GEO: GSE136148](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE136148).

![Concept of crafted experiment](https://github.com/siyao-liu/CraftedExperiment/blob/main/docs/figure.png)

### Please cite:


### Code

The 3 cell line mixture dataset used in this analysis is in the `data` folder. 

**Helper.R**: This script contains

**1.GenerateCraftedGenes.R**: This script is used to randomly select genes for perturbation. The list of crafted genes are saved in the `crafted_datasets` folder.

**2.GenerateCraftedExperiments_SparseRegion.R**:

**3.GenerateCraftedExperiments_DenseRegion.R**:

**4.GenerateCraftedExperiments_MediumRegion.R**:




