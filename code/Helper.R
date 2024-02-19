#### Function for adding a fixed value to the original count matrix ###
AddCount <- function(data, genes, c.ind, C) {
  new.data <- data
  new.data[genes, c.ind] <- data[genes, c.ind] + C
  # change colnames
  colnames(new.data)[c.ind] <- paste0("crafted.", colnames(new.data)[c.ind])
  return(new.data)
}

#### Function for adding counts generated from a Poisson distribution to the orignal count matrix ###
AddPois <- function(data, genes, c.ind, lambda) {
  new.data <- data
  # add Pois(lambda)
  c.mat <- matrix(rpois(n = length(genes)*length(c.ind), lambda = lambda), 
                  nrow = length(genes), ncol = length(c.ind), byrow = FALSE)
  
  new.data[genes, c.ind] <- data[genes, c.ind] + c.mat
  # change colnames
  colnames(new.data)[c.ind] <- paste0("crafted.", colnames(new.data)[c.ind])
  return(new.data)
}


#### Function for adding counts generated from a Poisson distribution with a Poisson parameter estimated using f*count #### 
AddPoisF <- function(data, genes, c.ind, lambda) {
  new.data <- data
  # add Pois(f*count)
  sub.mat <- new.data[genes, c.ind]
  c.mat <- matrix(NA, nrow=length(genes), ncol=length(c.ind))
  
  for (i in 1: nrow(sub.mat)) {
    for (j in 1: ncol(sub.mat)) {
      c.mat[i,j] <- sub.mat[i,j] + rpois(n=1, lambda=lambda*sub.mat[i,j])
    }
  }
  new.data[genes, c.ind] <- c.mat
  # change colnames
  colnames(new.data)[c.ind] <- paste0("crafted.", colnames(new.data)[c.ind])
  return(new.data)
}
