# Set seed for reproducibility
myseed <- 2023
set.seed(myseed)

# Load preprocessed 3 cell line mixture dataset
fpath <- 'data/'
dat <- as.matrix(readRDS(file=file.path(fpath, '190529_P3CL_V3_SeuRawData_21409by2609.rds')))
# remove genes with 0s across all cells
dat <- dat[rowSums(dat) > 0,]

# Get ground truth cell labels
lab <- unlist(lapply(colnames(dat), function(x) unlist(strsplit(x, "_"))[[1]]))
table(lab)

#### Select genes to perturb from Sparse region ####

# look at the total counts per cell in the luminals only
lum.tct <- rowSums(dat[, which(lab=="lum")])
lum.zp <- rowSums(dat[, which(lab=="lum")]==0)/541

# create a data frame to store the data
df <- data.frame("lum.tct"=lum.tct, "lum.zp"=lum.zp, "gene"=rownames(dat))
# calculate gene average
df$lum.avg <- df$lum.tct/541

#### Sparse region: select genes with zero proportion above 0.9 ####
s.goi <- df[df$lum.zp >0.9 & df$lum.tct!=0, ]$gene

s.600 <- sample(x=s.goi, size=num.genes, replace = FALSE)
s.300 <- sample(x=s.600, size=300, replace = FALSE)
s.100 <- sample(x=s.300, size=100, replace = FALSE)
s.50 <- sample(x=s.100, size=50, replace = FALSE)

s.list <- list("s.goi"=s.goi, "s.600"=s.600, "s.300"=s.300, "s.100"=s.100, "s.50"=s.50)
saveRDS(s.list, paste0("crafted_datasets/CraftedGenes_Sparse.list_seed", myseed, ".rds"))


#### Dense region: select genes with zero proportion < 0.1 ####
d.goi <- df[df$lum.zp < 0.1 & df$lum.tct!=0, ]$gene
# Nested randomly select 600 genes, 300 genes, 100 genes, 50 genes
num.genes <- 600
d.600 <- sample(x=d.goi, size=num.genes, replace = FALSE)

d.300 <- sample(x=d.600, size=300, replace = FALSE)

d.100 <- sample(x=d.300, size=100, replace = FALSE)

d.50 <- sample(x=d.100, size=50, replace = FALSE)

d.list <- list("d.goi"=d.goi, "d.600"=s.600, "d.300"=lo.300, "d.100"=d.100, "d.50"=d.50)
saveRDS(s.list, paste0("crafted_datasets/CraftedGenes_Dense.list_seed", myseed, ".rds"))


#### Select genes with zero proportion across cells between 0.45 and 0.55 ####
goi <- df[df$lum.zp > 0.45 & df$lum.zp < 0.55 & df$lum.tct!=0, ]$gene

# Nested randomly select 600 genes, 300 genes, 100 genes, 50 genes
myseed <- 2023
set.seed(myseed)

m.600 <- sample(x=goi, size=num.genes, replace = FALSE)
m.300 <- sample(x=goi.600, size=300, replace = FALSE)
m.100 <- sample(x=goi.300, size=100, replace = FALSE)
m.50 <- sample(x=goi.100, size=50, replace = FALSE)

m.list <- list("m.goi"=goi, "m.600"=m.600, "m.300"=m.300, "m.100"=m.100, "m.50"=m.50)
saveRDS(m.list, paste0("crafted_datasets/CraftedGenes_Medium.list_seed", myseed, ".rds"))







