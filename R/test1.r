# plotting a simple ring graph, all default parameters, except the layout
# g <- graph.ring(10)
# g$layout <- layout.circle
# plot(g)
# tkplot(g)
# rglplot(g)

# plotting a random graph, set the parameters in the command arguments
g <- barabasi.game(100)
plot(g, layout=layout.fruchterman.reingold, vertex.size=4,
vertex.label.dist=0.5, vertex.color="red", edge.arrow.size=0.5)
# plot a random graph, different color for each component

g <- erdos.renyi.game(100, 1/100)
comps <- edge.betweenness.community(g)$membership
colbar <- rainbow(max(comps)+1)
V(g)$color <- colbar[comps+1]
plot(g, layout=layout.fruchterman.reingold, vertex.size=5, vertex.label=NA)
# 
# 
# # plot communities in a graph
g <- graph.full(5) %du% graph.full(5) %du% graph.full(5)
g <- add.edges(g, c(0,5, 0,10, 5,10))
com <- spinglass.community(g, spins=5)
V(g)$color <- com$membership+1
g <- set.graph.attribute(g, "layout", layout.kamada.kawai(g))
plot(g, vertex.label.dist=1.5)

# # draw a bunch of trees, fix layout
igraph.par("plot.layout", layout.reingold.tilford)
plot(graph.tree(20, 2))
# plot(graph.tree(50, 3), vertex.size=3, vertex.label=NA)
# plot(graph.tree(50, 2, mode="undirected"), vertex.size=10, vertex.color="green")

