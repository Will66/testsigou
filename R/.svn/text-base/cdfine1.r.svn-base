library(igraph)
library(Cairo)

rm(list=ls(all=TRUE))

setwd("~/Desktop/wsanalysis/")
# memberships <- list()

G <- read.graph("ws300.net", format="pajek")
# is.simple(gs)
G <- simplify(G)
# 
G <- minimum.spanning.tree(G)
# plot(mst,layout=layout.fruchterman.reingold, vertex.size=6,vertex.label.font=1)
# plot(gs,layout=layout.fruchterman.reingold, vertex.size=10)

# modularity(gs, comps)
# ls <- largeScaleCommunity(gs)

### leading.eigenvector.community
# lec <- leading.eigenvector.community(G)
# memberships <- lec$membership

# ### spinglass.community
# sc <- spinglass.community(G, spins=10)
# memberships <- sc$membership

### walktrap.community
wt <- walktrap.community(G)
wmemb <- community.to.membership(G, wt$merges,
                                steps=which.max(wt$modularity)-1)
memberships <- wmemb$membership

comps <- memberships

par(mfrow=c(2,1))

# # color
colbar <- rainbow(max(comps)+1)
V(G)$color <- colbar[comps+1]
plot(G, layout=layout.fruchterman.reingold, vertex.size=10)

# mod <- modularity(G, memberships)
# wt <- merge(mod,memberships)
# hclust(dist(wt))

dend <- as.dendrogram(wt, use.modularity=TRUE)
plot(dend, nodePar=list(pch=c(20, 20)))
