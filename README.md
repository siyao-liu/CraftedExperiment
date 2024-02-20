# Crafted Experiment

This repository contains the code for generating crafted datasets based on real scRNA-seq data. In [our study](), we generated 24 crafted datasets via perturbing genes selected from different levels of sparsity based on the previously published 3 cell line mixture dataset from [GEO: GSE136148](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE136148).

![Concept of crafted experiment](https://github.com/siyao-liu/CraftedExperiment/blob/main/docs/figure.png)


### Please cite:





### Description

The 3 cell line mixture dataset used in this analysis is in the `data` folder. 

The `code` folder contains the R scripts listed below:

- **Helper.R**: This script contains the R functions used in the analysis.

- **1.GenerateCraftedGenes.R**: This script is used to randomly select genes for perturbation. The list of crafted genes are saved in the `crafted_datasets` folder.

- **2.GenerateCraftedExperiments_SparseRegion.R**: This scritp is used to generate crafted datasets via perturbing genes in the sparse region. 

- **3.GenerateCraftedExperiments_DenseRegion.R**: This scritp is used to generate crafted datasets via perturbing genes in the dense region. 

- **4.GenerateCraftedExperiments_MediumRegion.R**: This scritp is used to generate crafted datasets via perturbing genes in the medium region. 

All crafted datasets generated used from the scripts above are included in the `crafted_datasets` folder.

All crafted genes and datasets generated in the paper are included in the `crafted_datasets_paper` folder. 




