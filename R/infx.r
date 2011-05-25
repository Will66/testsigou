library(igraph)
library(Cairo)

rm(list=ls(all=TRUE))

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
par(mfrow=c(2,2))

# lout <- layout.fruchterman.reingold(G)
lout <- layout.fruchterman.reingold(G)

# plot(G, layout=lout, vertex.size=12)
# memberships <- label.propagation.community(G)
# comps1 <- memberships
# comps <- c(0,0,1,0,0,0,1,)
# 

# KClique
# commNum=2
# comm=[[1, 14, 18, 20, 4, 5, 10, 6, 15, 17, 19, 2, 23, 33],
# [11, 21, 36, 12, 25, 28, 3, 34, 7, 16, 22, 27, 32]]
# 0,0,1,0,0,0,1,8,8,0,1,1,8,0,0,1,0,0,0,0,1,1,0,8,1,8,1,1,8,8,8,1,0,1,8
# Fiedler
#comm1=[[11 ,29 ,3 ,32 ,7 ,28 ,16 ,34 ,36 ,22 ,21 ,25 ,27 ,12 ,8],
#[1 ,4 ,30 ,2 ,14 ,18 ,23 ,17 ,5 ,15 ,19 ,33 ,20 ,10 ,6 ,13 ,9 ,24 ,26 ,35 ,31]]
# 1,1,0,1,1,1,0,0,1,1,0,0,1,1,1,0,1,1,1,1,0,0,1,1,0,1,0,0,0,1,1,0,1,0,1,

# compsK <- c(0,0,1,0,0,0,1,4,0,0,1,1,0,0,0,1,0,0,0,0,1,1,0,4,1,4,1,1,4,4,4,1,0,1,4,1)
compsK <- c(0,0,1,0,0,0,1,8,8,0,1,1,8,0,0,1,0,0,0,0,1,1,0,8,1,8,1,1,8,8,8,1,0,1,8)
colbar <- rainbow(max(compsK)+1)
V(G)$color <- colbar[compsK+1]
plot(G, layout=lout, vertex.size=10)
title(main="K-Clique for CAM")

# compsF <- c(0,0,1,0,0,0,1,1,0,0,1,1,0,0,0,1,0,0,0,0,1,1,0,0,1,0,1,1,1,0,0,1,0,1,0,1)
compsF <- c(1,1,0,1,1,1,0,0,1,1,0,0,1,1,1,0,1,1,1,1,0,0,1,1,0,1,0,0,0,1,1,0,1,0,1)
colbar <- rainbow(max(compsF)+1)
V(G)$color <- colbar[compsF+1]
plot(G, layout=lout, vertex.size=10)
title(main="Fiedler for CAM")


# compsH <- c(1,1,0,1,1,1,0,1,1,1,0,0,1,1,1,0,1,1,1,1,0,0,1,1,0,1,0,0,1,1,1,0,1,0,1)
compsH <- c(1,1,2,1,1,1,2,1,1,1,2,2,1,1,1,2,1,1,1,1,2,2,1,1,2,1,2,2,1,1,1,2,1,2,1,2)
colbar <- rainbow(max(compsH)+1)
V(G)$color <- colbar[compsH+1]
plot(G, layout=lout, vertex.size=10)
title(main="Hcluster for CAM")