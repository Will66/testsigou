library(igraph)
G <- graph(c(1,5,2,3,2,4,2,5,3,5)-1)
membership <- c(1,2,2,1,1)
modularity(G, membership)

# plot(graph.tree(20, 3), layout=layout.reingold.tilford, ylim=c(1,-1))


# ### edge.betweenness.community
# wt <- edge.betweenness.community(G)
# wmemb <- community.to.membership(G, wt$merges,steps=which.max(wt$modularity)-1)
# memberships <- wmemb$membership
# ## color
# comps <- memberships
# colbar <- rainbow(max(comps)+1)
# V(G)$color <- colbar[comps+1]
# plot(G, layout=lout, vertex.size=10)
# title(main="betweenness")
# modularity(G, comps)

# dend <- as.dendrogram(wt, use.modularity=TRUE)
# plot(dend, nodePar=list(pch=c(20, 20)))
# title(main="betweenness")