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

plot(G, layout=layout.kamada.kawai, vertex.size=10, edge.label=0.3)
