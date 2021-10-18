######R script for Texas Biogeogrpahy Analyses########
#Install picante if needed
library(picante)

#Import phylogeny and view
tree <- read.tree("tree_rooted.new")
plot(tree)

#Import community data 
com_dist <- read.csv("TX_BIO_comm.csv", header = T, row.names = 1)

#Calculate Fatih's phylogenetic diversity per province
pd(com_dist, tree)

#Converted tree to interspecific phylogenetic distance matrix
phylo_dist <- cophenetic(tree) 

#tie together community and phylogenetic distance
#Calculate Nearest taxon distance using phylogeny
com_phy_dist_nt <- comdistnt(com_dist, phylo_dist)
com_phy_dist_nt

#Cluster the results (You may want to edit method based on NMDS priors)
#Nearest Taxon
comdist.clusters_nt <- hclust(com_phy_dist_nt, method = "ward.D2")
plot(comdist.clusters_nt)

