library(igraph)
library(Cairo)

rm(list=ls(all=TRUE))

setwd("~/Desktop/wsanalysis/net")
# memberships <- list()

G <- read.graph("ws300.net", format="pajek")
# is.simple(gs)
G <- simplify(G)
# 
G <- minimum.spanning.tree(G)

par(mfrow=c(2,2))

lout <- layout.fruchterman.reingold(G)

# ### leading.eigenvector.community
# lec <- leading.eigenvector.community(G)
# memberships <- lec$membership
# 
# ## color
# comps <- memberships
# colbar <- rainbow(max(comps)+1)
# V(G)$color <- colbar[comps+1]
# plot(G, layout=lout, vertex.size=10)
# title(main="eigenvector")
# modularity(G, comps)

# layout.fruchterman.reingold
# layout.fruchterman.reingold

### spinglass.community
# sc <- spinglass.community(G, spins=10)
# memberships <- sc$membership
# ## color
# comps <- memberships
# colbar <- rainbow(max(comps)+1)
# V(G)$color <- colbar[comps+1]
# plot(G, layout=lout, vertex.size=10)
# title(main="spinglass")
# modularity(G, comps)

### edge.betweenness.community
wt <- edge.betweenness.community(G)
wmemb <- community.to.membership(G, wt$merges,steps=which.max(wt$modularity)-1)
memberships <- wmemb$membership
## color
comps <- memberships
colbar <- rainbow(max(comps)+1)
V(G)$color <- colbar[comps+1]
plot(G, layout=lout, vertex.size=10)
title(main="betweenness")
modularity(G, comps)

dend <- as.dendrogram(wt, use.modularity=TRUE)
plot(dend, nodePar=list(pch=c(20, 20)))
title(main="betweenness")


### label.propagation.community
# memberships <- label.propagation.community(G)
# comps <- memberships
# colbar <- rainbow(max(comps)+1)
# V(G)$color <- colbar[comps+1]
# plot(G, layout=lout, vertex.size=10)
# title(main="label.propagation.community")


### walktrap.community
wt <- walktrap.community(G)
wmemb <- community.to.membership(G, wt$merges,
                                steps=which.max(wt$modularity)-1)
memberships <- wmemb$membership

comps <- memberships

## color
colbar <- rainbow(max(comps)+1)
V(G)$color <- colbar[comps+1]
plot(G, layout=lout, vertex.size=10)
title(main="walktrap")
modularity(G, comps)

dend <- as.dendrogram(wt, use.modularity=TRUE)
plot(dend, nodePar=list(pch=c(20, 20)))
title(main="walktrap")