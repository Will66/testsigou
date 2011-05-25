library(igraph)
library(Cairo)

rm(list=ls(all=TRUE))

setwd("~/Desktop/wsanalysis/net")
# memberships <- list()

G <- read.graph("ws100s.net", format="pajek")
# is.simple(gs)
# G <- simplify(G)
# 
G <- minimum.spanning.tree(G)

# par(mfrow=c(3,2))

degree(G)
diameter(G)
betweenness(G)

lout <- layout.fruchterman.reingold(G)

plot(G, layout=lout, vertex.size=10)

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