library(Seurat)
source("code/Helper.R")

# Set seed for reproducibility
myseed <- 2023
set.seed(myseed)

######################################################################################
# Load preprocessed 3 cell line mixture dataset
fpath <- 'data/'
dat <- as.matrix(readRDS(file=file.path(fpath, '190529_P3CL_V3_SeuRawData_21409by2609.rds')))
dat <- dat[rowSums(dat) > 0,]

# Get ground truth cell labels
lab <- unlist(lapply(colnames(dat), function(x) unlist(strsplit(x, "_"))[[1]]))

# Randomly select 30% of luminal cells --> crafted luminal group
lum.ind <- which(lab=="lum")
c.ind <- sample(x=lum.ind, size=floor(541*0.3), replace=FALSE)

# Load the selected sparse genes for perturbation 
goi.list <- readRDS(paste0("crafted_datasets/CraftedGenes_Sparse.list_seed", myseed, ".rds"))

crafted.dl <- lapply(goi.list[2:5], function(x) { 
  AddPois(data=dat, genes=x, c.ind=c.ind, lambda=0.5) 
}
)
saveRDS(crafted.dl, file=paste0("crafted_datasets/Sparse_AddPois0.5_crafteddata.rds"))




