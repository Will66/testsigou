library(igraph)
rm(list=ls())
req.data <- as.data.frame(Titanic)
lookup <- c("M","F","C","A","N","Y")
names(lookup) <- c("Male","Female","Child","Adult","Yes","No")

req.data$board <- "board"
req.data$Class.m <- paste(req.data$board,req.data$Class,sep="_")
req.data$Sex.m <- paste(req.data$board,req.data$Class,req.data$Sex,
                        sep="_")
req.data$Age.m <- paste(req.data$board,req.data$Class,req.data$Sex,
                        req.data$Age,sep="_")
req.data$Survived.m <- paste(req.data$board,req.data$Class,req.data$Sex,
                           req.data$Age,req.data$Survived,sep="_")

tmp <- data.frame(from=
                  do.call("c",lapply(req.data[,c("board",
                                                 "Class.m",
                                                 "Sex.m",
                                                 "Age.m")],as.character)),
                  to=do.call("c",lapply(req.data[,c("Class.m",
                    "Sex.m",
                    "Age.m",
                    "Survived.m")],as.character)),
                  stringsAsFactors=FALSE)

tmp  <- tmp [!duplicated(tmp ),];rownames(tmp) <- NULL
tmp$num <- unlist(lapply(strsplit(tmp$to,"_"),
                         FUN=function(x){
                           check1 <- req.data$Class==x[2]
                           check2 <- req.data$Sex == x[3]
                           check3 <- req.data$Age == x[4]
                           check4 <- req.data$Survived == x[5]
                           sum(req.data$Freq[ifelse(is.na(check1),TRUE,check1)   &
                                             ifelse(is.na(check2),TRUE,check2)   &
                                             ifelse(is.na(check3),TRUE,check3)   &
                                             ifelse(is.na(check4),TRUE,check4)])}))


g <- graph.data.frame(tmp, directed=TRUE)
V(g)$label <- unlist(lapply(strsplit(V(g)$name,"_"),
                            FUN=function(y){ifelse(y[length(y)] %in% names(lookup),
                              lookup[y[length(y)]],y[length(y)])}))
E(g)$label <- tmp$num
plot(g,layout=layout.reingold.tilford,ylim=c(1,-1),edge.arrow.size=0.5,vertex.size=7)
legend("topleft", paste(lookup ,names(lookup),sep=" : "),ncol=2,bty="n",cex=0.7) 
### To find the case for crew members 
tmp1  <- tmp [grepl("Crew",tmp$from),];rownames(tmp1) <- NULL
g <- graph.data.frame(tmp1, directed=TRUE)
V(g)$label <- unlist(lapply(strsplit(V(g)$name,"_"),
                            FUN=function(y){ifelse(y[length(y)] %in% names(lookup),
                              lookup[y[length(y)]],y[length(y)])}))
E(g)$label <- tmp1$num
plot(g,layout=layout.reingold.tilford,ylim=c(1,-1),edge.arrow.size=0.5)
legend("topleft", paste(lookup ,names(lookup),sep=" : "),ncol=2,bty="n",cex=0.7) 