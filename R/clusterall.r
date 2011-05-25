library(igraph)
library(Cairo)
library(gclus)

rm(list=ls(all=TRUE))

# postscript(file="plot.eps", onefile=FALSE, fonts=c("serif", "Palatino"), horizontal=FALSE)

setwd("~/Desktop/wsanalysis/net")
# memberships <- list()

G <- read.graph("camx.net", format="pajek")
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

par(mfrow=c(2,2))

# hist (degree(G))
comm=2
# di <- dist(ad)

dis <- dist(ad)
hc <- hclust(dis, "ave")
# plot(hc)
# ave ward single

# hc <- reorder.hclust(hc,dis)
# plot(hc)
# # Ward Hierarchical Clustering with Bootstrapped p values
# library(pvclust)
# fit <- pvclust(ad, method.hclust="ward",
#    method.dist="euclidean")
# plot(fit) # dendogram with p values
# # add rectangles around groups highly supported by the data
# pvrect(fit, alpha=.95)

# dend <- as.dendrogram(hc, use.modularity=TRUE)
# plot(dend, nodePar=list(pch=c(20, 20)))
# rect.hclust(hc,k=comm,border="red")

# #
group <- cutree(hc,k=comm)
grx<-group

colbar <- rainbow(max(group)+1)
V(G)$color <- colbar[group+1]
plot(G, layout=lout, vertex.size=10)
# title(main="K-Clique for CAM")

# # 
cl1<-closeness(G)
plot(cl1)

# 
grx<-group-1.5
grx
i=1
for(x in grx)
{ 
  if (x > 0) grx[i]=x+0.5
  else grx[i]=x-0.5
  i=i+1
}
grx
cl2<-cl1*(grx)
plot(cl2)
grid(NA, 5, lwd = 2)
# grid(nx = 7, ny = 7, col = "lightgray", lty = "dotted",
#      lwd = par("lwd"), equilogs = TRUE)

# i=1
# for(x in grx)
# { 
#   if (x != 1) grx[i]=0
#   i=i+1
# }
# grx
# cl2<-cl1*(grx)
# plot(cl2)


#  plot(group-1.5,cl1)

# # Model Based Clustering
# library(mclust)
# fit <- Mclust(ad)
# plot(fit, ad) # plot results 
# print(fit) # display the best model

# # K-Means Clustering with 5 clusters
# fit <- kmeans(ad, 5)

# Cluster Plot against 1st 2 principal components

# # vary parameters for most readable graph
# library(cluster) 
# clusplot(ad, fit$cluster, color=TRUE, shade=TRUE, 
#   	 labels=2, lines=0)

# #
# # Centroid Plot against 1st 2 discriminant functions
# library(fpc)
# plotcluster(ad, fit$cluster)

# #
# # whis the meaning of this plot? what this represents?
# cmat <- dmat.color(dis, rev(cm.colors(5)))
# plotcolors(cmat[hc$order,hc$order], rlabels=labels(dis)[hc$order])
# title(main="eigenvector")