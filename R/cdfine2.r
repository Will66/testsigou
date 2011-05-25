library(igraph)
library(Cairo)

rm(list=ls(all=TRUE))

setwd("~/Desktop/wsanalysis/")
# memberships <- list()

G <- read.graph("ws100s.net", format="pajek")
# is.simple(gs)
G <- simplify(G)
# 
# G <- minimum.spanning.tree(G)

par(mfrow=c(2,2))


### leading.eigenvector.community
lec <- leading.eigenvector.community(G)
memberships <- lec$membership

# # color
comps <- memberships
colbar <- rainbow(max(comps)+1)
V(G)$color <- colbar[comps+1]
plot(G, layout=layout.circle, vertex.size=10)
title(main="eigenvector")

# layout.fruchterman.reingold

### spinglass.community
sc <- spinglass.community(G, spins=10)
memberships <- sc$membership

## color`
comps <- memberships
colbar <- rainbow(max(comps)+1)
V(G)$color <- colbar[comps+1]
plot(G, layout=layout.circle, vertex.size=10)
title(main="spinglass")


### edge.betweenness.community
wt <- edge.betweenness.community(G)
wmemb <- community.to.membership(G, wt$merges,steps=which.max(wt$modularity)-1)
memberships <- wmemb$membership

# # color
comps <- memberships
colbar <- rainbow(max(comps)+1)
V(G)$color <- colbar[comps+1]
plot(G, layout=layout.circle, vertex.size=10)
title(main="betweenness")

# mod <- modularity(G, memberships)
# wt <- merge(mod,memberships)
# wt <- hclust(dist(wt))
# plot(wt)

dend <- as.dendrogram(wt, use.modularity=TRUE)
plot(dend, nodePar=list(pch=c(20, 20)))


# 
# ### label.propagation.community
# memberships <- label.propagation.community(G)
# comps <- memberships

# cx <- list(1:100)
# hc <- hclust(cx, "ave")
# 
# dend <- as.dendrogram(hc)
# plot(dend, nodePar=list(pch=c(20, 20)))



# com <- spinglass.community(g, spins=10)
# com <- walktrap.community(g, modularity=TRUE)
# fastgreedy.community -- ony
# edge.betweenness.community
# com <- edge.betweenness.community(g)
# V(g)$color <- com$membership+1

# plot(g, layout=layout.reingold.tilford, vertex.size=4,vertex.label.dist=0.5, edge.arrow.size=0.3)
# layout.fruchterman.reingold layout.reingold.tilford

# dend <- as.dendrogram(com, use.modularity=TRUE)
# plot(dend, nodePar=list(pch=c(20, 20)))

# q <- modularity(G, cl)
# clique.community(g,5)

# G$layout <- layout.lgl
# l <- layout.circle(G)                                  
# V(G)$color <- rainbow(3)[memberships$'Edge betweenness'+1]                
# plot(G)

# plot(G, vertex.size=3, vertex.label=NA, vertex.color="#ff000033",
#      vertex.frame.color="#ff000033", edge.color="#55555533", edge.arrow.size=0.3)

# plot(G, layout=l, vertex.size=8, vertex.label.font=0,
#        edge.label.color="red", vertex.color="yellow",
#        edge.label.font=2)

# wt <- walktrap.community(g, modularity=TRUE)
# dend <- as.dendrogram(wt, use.modularity=TRUE)
# plot(dend, nodePar=list(pch=c(20, 20)))

# plot(dend$merges)
# CairoPNG()
# plot(dend, nodePar=list(pch=c(1, 20)))
# plot(dend, xlim = c(1,100), ylim = c(1,50),horiz = TRUE)
# plot(dend$upper)

# hc <- hclust(dist(g), "ave")
# plot(hc, hang=-1, cex=0.5)