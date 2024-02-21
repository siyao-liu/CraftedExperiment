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
table(lab)

# randomly select 30% of luminal cells --> crafted luminal group
lum.ind <- which(lab=="lum")
c.ind <- sample(x=lum.ind, size=floor(541*0.3), replace=FALSE)

# Load the selected medium genes for perturbation 
goi.list <- readRDS(paste0("crafted_datasets/CraftedGenes_Medium.list_seed", myseed, ".rds"))


#### Add count 2 ###
crafted.dl <- lapply(goi.list[2:5], function(x) { 
  AddCount(data=dat, genes=x, c.ind=c.ind, C=2) 
  }
)
saveRDS(crafted.dl, file="crafted_datasets/Medium_AddCount2_craftedata.rds")


#### Add Pois(1.5) ###
crafted.dl <- lapply(goi.list[2:5], function(x) { 
  AddPois(data=dat, genes=x, c.ind=c.ind, lambda=1.5)
  }
)
saveRDS(crafted.dl, file="crafted_datasets/Medium_AddPois1.5_craftedata.rds")


#### Add Pois(3*count) ###
crafted.dl <- lapply(goi.list[2:5], function(x) { 
  AddPoisF(data=dat, genes=x, c.ind=c.ind, lambda=3)
  }
)
saveRDS(crafted.dl, file="crafted_datasets/Medium_AddPoisF3_craftedata.rds")