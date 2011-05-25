library(igraph)
library(Cairo)
library(gclus)

rm(list=ls(all=TRUE))

# postscript(file="plot.eps", onefile=FALSE, fonts=c("serif", "Palatino"), horizontal=FALSE)

setwd("~/Desktop/wsanalysis/net")
# memberships <- list()

G <- read.graph("infx.net", format="pajek")
# is.simple(gs)
G <- simplify(G)
# G <- na.omit(G)

ad <- get.adjacency(G)
x1 <- get.adjedgelist(G)
x2 <- get.edgelist(G)
# # 
# # G <- minimum.spanning.tree(G)
# betweenness(G)
# 

# d <- degree(G, mode="in")
# power.law.fit(d+1, 20)

# d <- degree(g, mode="in")
# power.law.fit(d+1, 20)
# 
lout <- layout.fruchterman.reingold(G)
# 
# 
# plot(G, layout=lout1, vertex.size=10)

# plot(G, layout=lout)

par(mfrow=c(2,2))

# di <- dist(ad)

dis <- dist(ad)
# dis <- dis^2
hc <- hclust(dis, "complete")
# eva ward single

hc$order
# hc <- reorder.hclust(hc,dis)
plot(hc)
group <- cutree(hc,k=2)

dend <- as.dendrogram(hc, use.modularity=TRUE)
plot(dend, nodePar=list(pch=c(20, 20)))

# whis the meaning of this plot? what this represents?
cmat <- dmat.color(dis, rev(cm.colors(5)))
plotcolors(cmat[hc$order,hc$order], rlabels=labels(dis)[hc$order])

# title(main="eigenvector")