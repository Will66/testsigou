g <- erdos.renyi.game(100,1/20)
# this will find the distances to vertex 2

s <- c(shortest.paths(g,2))
# Find the index of the furthest vertex(s)

which(s == max(s))
# Display the path

get.shortest.paths(g,2,21)