library(igraph)
library(Cairo)

clique.community <- function(graph, k) {
   clq <- cliques(graph, min=k, max=k)
   edges <- c()
   for (i in seq_along(clq)) {
     for (j in seq_along(clq)) {
       if ( length(unique(c(clq[[i]], clq[[j]]))) == k+1 ) {
         edges <- c(edges, c(i,j)-1)
       }
     }
   }
   clq.graph <- simplify(graph(edges))
   V(clq.graph)$name <- seq_len(vcount(clq.graph))
   comps <- decompose.graph(clq.graph)

   lapply(comps, function(x) {
     unique(unlist(clq[ V(x)$name ]))
   })
}

largeScaleCommunity <- function(g,mode="all"){
  V(g)$group <- as.character(V(g))
  thisOrder <- sample(vcount(g),vcount(g))-1
  t <- 0
  done <- FALSE
  while(!done){
    t <- t+1
    cat("\rtick:",t)
    done <- TRUE ## change to FALSE whenever a node changes groups              
    for(i in thisOrder){
      ## get the neighbor group frequencies:                                    
      groupFreq <- table(V(g)[nei(i,mode=mode)]$group)
      ## pick one of the most frequent:                                         
      newGroup <- sample(names(groupFreq) [groupFreq==max(groupFreq)],1)
      if(done){done <- newGroup==V(g)[i]$group}
      V(g)[i]$group <- newGroup
    }
  }
  ## now fix any distinct groups with same labels:                              
  for(i in unique(V(g)$group)){
    ## only bother for connected groups                                         
    if(!is.connected(subgraph(g,V(g)[group==i]))){
      theseNodes <- V(g)[group==i]
      theseClusters <- clusters(subgraph(g,theseNodes))
      ## iterate through the clusters and append their names                    
      for(j in unique(theseClusters$membership)){
        V(g)[theseNodes[theseClusters$membership==j]]$group <- paste(i,j,sep=".")
      }
    }
  }
  return(g)
}

setwd("~/Desktop/wsanalysis/")
# memberships <- list()

G <- read.graph("ws300.net", format="pajek")
# is.simple(gs)
G <- simplify(G)
# 
G <- minimum.spanning.tree(G)
# plot(mst,layout=layout.fruchterman.reingold, vertex.size=6,vertex.label.font=1)
# plot(gs,layout=layout.fruchterman.reingold, vertex.size=10)

# km <- clique.community(gs,5)
# wt <- walktrap.community(mst, modularity=TRUE)
# dend <- as.dendrogram(wt, use.modularity=TRUE)
# plot(dend)


# sc <- largest.cliques(gs)


# sc <- clusters(gs)
# sc <- leading.eigenvector.community(mst)
# sc <- edge.betweenness.community(mst)
# sc <- walktrap.community(gs,modularity=TRUE)
# sc <- spinglass.community(mst)
# comps <- sc$membership

# comps <- cliques(mst,min=2,max=8)
# comps<- label.propagation.community(mst)
# comps <- cliques(gs, min=2)
# comps <- largest.cliques(gs)

# modularity(gs, comps)
# ls <- largeScaleCommunity(gs)

### leading.eigenvector.community
# lec <- leading.eigenvector.community(G)
# memberships <- lec$membership

# ### spinglass.community
# sc <- spinglass.community(G, spins=10)
# memberships <- sc$membership

### walktrap.community
wt <- walktrap.community(G, modularity=TRUE)
wmemb <- community.to.membership(G, wt$merges,
                                steps=which.max(wt$modularity)-1)
memberships <- wmemb$membership

# # color
colbar <- rainbow(max(comps)+1)
V(G)$color <- colbar[comps+1]
plot(G, layout=layout.fruchterman.reingold, vertex.size=10)

# mod <- modularity(G, memberships)
# 
# wt <- merge(mod,memberships)
# hclust(dist(wt))

dend <- as.dendrogram(hclust(dist(wt)), use.modularity=TRUE)
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