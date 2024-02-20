# Crafted Experiment

This repository contains the code for generating crafted datasets based on real scRNA-seq data. In [our study](), we generated a set of 24 crafted datasets via perturbing genes selected from different levels of sparsity based on the previously published 3 cell line mixture dataset from [GEO: GSE136148](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE136148).

### Please cite:


![Concept of crafted experiment](https://github.com/siyao-liu/CraftedExperiment/blob/main/docs/figure.png)


On the background of the 3 cell line mixture dataset, we created a fourth luminal group by randomly sampling 30% of the luminal cells (N=162) and perturbing a set of genes for these chosen luminal cells. Instead of randomly perturbing genes across the whole genome, we focused on different gene regions based on the relationship between the total count per gene and the proportion of zeros per gene across the luminal cells only. First, we split the genes into three major regions: 
- Sparse (S) - genes with proportion of zeros greater than 0.9 (N=9,223)
- Medium (M) - genes with proportion of zeros between 0.45 and 0.55 (N=732)
- Dense (D) - genes with proportion of zeros less than 0.1 (N=613)

From each gene region, we randomly selected 600, 300, 100, and 50 genes to control the strength of the added signal. To allow cross comparisons, these gene sets are nested within each other.


### Description

The 3 cell line mixture dataset used in this analysis is in the `data` folder. 

The `code` folder contains the R scripts listed below:

- `Helper.R`: This script contains the R functions used in the analysis.

- `1.GenerateCraftedGenes.R`: This script is used to randomly select genes for perturbation. The list of crafted genes are saved in the `crafted_datasets` folder.

- `2.GenerateCraftedExperiments_SparseRegion.R`: This script is used to generate crafted datasets via perturbing genes in the sparse region. 

- `3.GenerateCraftedExperiments_DenseRegion.R`: This script is used to generate crafted datasets via perturbing genes in the dense region. 

- `4.GenerateCraftedExperiments_MediumRegion.R`: This script is used to generate crafted datasets via perturbing genes in the medium region. 


All crafted datasets generated from the scripts above are included in the `crafted_datasets` folder:








### Example

 1. Run `1.GenerateCraftedGenes.R` to randomly select genes for crafting. From each gene regions (sparse, dense, or medium), 600, 300, 100, and 50 genes are randomly selected. For best comparisons, these sets of genes are all nested within each other.

 2. Depending on which type of genes selected for crafting in step 1, use `GenerateCraftedExperiments_***.R` to generate crafted datasets.

  





