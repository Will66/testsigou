library(igraph)
library(Cairo)

rm(list=ls(all=TRUE))

postscript(file="plot.eps", onefile=FALSE, fonts=c("serif", "Palatino"), horizontal=FALSE)

setwd("~/Desktop/wsanalysis/net")
# memberships <- list()

G <- read.graph("camclean.net", format="pajek")
G
# is.simple(gs)
x <- degree(G)
# plot(x)
# G <- simplify(G)
# # 
# G <- minimum.spanning.tree(G)
b1 <- betweenness(G)
# plot(G)
# 
# par(mfrow=c(1,2))

# lout <- layout.fruchterman.reingold(G)
lout <- layout.fruchterman.reingold(G)

# plot(G, layout=lout, vertex.size=12)

# memberships <- label.propagation.community(G)
# comps1 <- memberships
# comps <- c(0,0,1,0,0,0,1,)
# 
# compsK <- c(0,0,1,0,0,0,1,4,0,0,1,1,0,0,0,1,0,0,0,0,1,1,0,4,1,4,1,1,4,4,4,1,0,1,4,1)
# commNum=2
# comm=[[1, 14, 18, 20, 4, 5, 10, 6, 15, 17, 19, 2, 23, 33],
# [11, 21, 36, 12, 25, 28, 3, 34, 7, 16, 22, 27, 32]]

#comm1=[[11 ,29 ,3 ,32 ,7 ,28 ,16 ,34 ,36 ,22 ,21 ,25 ,27 ,12 ,8],
#[1 ,4 ,30 ,2 ,14 ,18 ,23 ,17 ,5 ,15 ,19 ,33 ,20 ,10 ,6 ,13 ,9 ,24 ,26 ,35 ,31]]
# colbar <- rainbow(max(compsK)+1)
# V(G)$color <- colbar[compsK+1]
# plot(G, layout=lout, vertex.size=10)
# title(main="K-Clique for CAM")

compsF <- c(0,0,1,0,0,0,1,1,0,0,1,1,0,0,0,1,0,0,0,0,1,1,0,0,1,0,1,1,1,0,0,1,0,1,0,1)
colbar <- rainbow(max(compsF)+1)
V(G)$color <- colbar[compsF+1]
plot(G, layout=lout, vertex.size=10)
title(main="Fiedler for CAM")

# ## walktrap.community
# wt <- walktrap.community(G)
# wmemb <- community.to.membership(G, wt$merges,
#                                 steps=which.max(wt$modularity)-1)
# memberships <- wmemb$membership
# 
# comps <- memberships
# 
# ## color
# colbar <- rainbow(max(comps)+1)
# V(G)$color <- colbar[comps+1]
# plot(G, layout=lout, vertex.size=10)
# title(main="walktrap")
# modularity(G, comps)


# ### leading.eigenvector.community
# lec <- leading.eigenvector.community(G)
# memberships <- lec$membership
# 
# comps <- memberships
# 
# ## color
# colbar <- rainbow(max(comps)+1)
# V(G)$color <- colbar[comps+1]
# plot(G, layout=lout, vertex.size=10)
# title(main="walktrap")
# modularity(G, comps)
# title(main="leading.eigenvector.community")
# 
# dend <- as.dendrogram(lec, use.modularity=TRUE)
# plot(dend, nodePar=list(pch=c(20, 20)))
# title(main="eigenvector")
