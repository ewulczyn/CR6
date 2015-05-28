setwd("~/CR6")
source('cleaning/merge.r')
library(ggplot2)
library(data.table)
base = "../CR6Data/non_edf/cluster_data/"
dendrogram_base = "../CR6Data/non_edf/dendrograms/"

labels = c()
postchems= c()
ds= list()
vi=1
i=1

extension = "min_log/"

base = paste(base, extension, sep="");

for(vi in 1:length(chems)){
  c = chems[vi]
  print(c)
  l = full_chem_names[vi]
  f = paste(base,c ,".csv", sep="");
  if(file.exists(f)){
    d = data.table(read.csv(file=f), key="key")
    ds[[i]] <- d
    i=i+1
    labels = append(labels, l)
    postchems = append(postchems, c)
  }
}

n = length(postchems)

dcorr = matrix(0,n,n)
dscorr = matrix(0,n,n)
counts = matrix(0,n,n)



for(i in 2:n){
  print(i)
  for(j in 1:(i-1)){
    ci = postchems[[i]]
    cj = postchems[[j]]
    di = ds[[i]]
    dj = ds[[j]]
    if(nrow(di)!=0 && nrow(dj)!=0){
      d = merge(x=di, y=dj)
      dcorr[i, j] = cor(d[[ci]], d[[cj]])
      dscorr[i, j] = cor(d[[ci]], d[[cj]], method=c("spearman"))
      counts[i, j] = nrow(d)
    }
  }
}


rownames(dcorr) = labels[1:n]
colnames(dcorr) = labels[1:n]
rownames(dscorr) = labels[1:n]
colnames(dscorr) = labels[1:n]
rownames(counts) = labels[1:n]
colnames(counts) = labels[1:n]

dcorr = as.data.frame(dcorr)
dcorr[is.na(dcorr)] <-0

dscorr = as.data.frame(dscorr)
dscorr[is.na(dscorr)] <-0

write.csv(dcorr, file=paste(base, "pcorr.csv", sep=""), row.names=T) 
write.csv(dscorr, file=paste(base, "scorr.csv", sep=""), row.names=T) 
write.csv(counts, file=paste(base, "counts.csv", sep=""), row.names=T) 

dcorr[counts<30] = 0
dscorr[counts<30] = 0

dcorr_pos = dcorr
dcorr_pos[dcorr>0] = 0

dcorr_neg = dcorr
dcorr_neg[dcorr<0] = 0

dscorr_pos = dscorr
dscorr_pos[dscorr>0] = 0

dscorr_neg = dscorr
dscorr_neg[dscorr<0] = 0


dbase = paste(dendrogram_base, extension, sep="");

fit <-hclust(as.dist(1 - (dcorr + 1)/2),method="ward" )
pdf(paste(dbase, "p/all.pdf", sep=""),width=50, height=15)
plot(fit)
dev.off()

fit <-hclust(as.dist(dcorr_pos),method="ward" )
pdf(paste(dbase, "p/pos.pdf", sep=""),width=50)
plot(fit, hang=-1, cex=0.5)
dev.off()

#does not make sense
#fit <-hclust(as.dist(dcorr_neg),method="ward" )
#pdf(paste(dbase, "p/neg.pdf", sep=""),width=50)
#plot(fit, hang=-1, cex=0.5)
#dev.off()



fit <-hclust(as.dist(1 - (dscorr + 1)/2),method="ward" )
pdf(paste(dbase, "s/all.pdf", sep=""),width=50)
plot(fit, hang=-1, cex=0.5)
dev.off()

fit <-hclust(as.dist(dscorr_pos),method="ward" )
pdf(paste(dbase, "s/pos.pdf", sep=""),width=50)
plot(fit, hang=-1, cex=0.5)
dev.off()

#fit <-hclust(as.dist(dscorr_neg),method="ward" )
#pdf(paste(dbase, "s/neg.pdf", sep=""),width=50)
#plot(fit, hang=-1, cex=0.5)
#dev.off()


#correllations

chem = "Chromium, Hexavalent (Cr6)"
c1=dcorr[chem,  ]
c2=dcorr[, chem]
idx = which(names(dcorr) == chem)
c2=c2[idx:length(c2)]
c1[1, idx:213] = c2
dc = t(c1)
dc = data.frame( dc, row.names(dc))
names(dc) = c("corr", "names")

dc = dc[dc$corr< -0.1 | dc$corr>0.1, ]


ggplot(dc, aes(x=reorder(names, corr), y=corr)) + geom_point(size=3) + # Use a larger dot theme_bw() +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank(),
        panel.grid.major.x = element_line(colour="grey60", linetype="dashed"))
ggsave(file=paste(dbase, "p/cors.pdf", sep=""), width=20)


chem = "Chromium, Hexavalent (Cr6)"
c1=dscorr[chem,  ]
c2=dscorr[, chem]
idx = which(names(dscorr) == chem)
c2=c2[idx:length(c2)]
c1[1, idx:213] = c2
dc = t(c1)
dc = data.frame( dc, row.names(dc))
names(dc) = c("corr", "names")

dc = dc[dc$corr< -0.1 | dc$corr>0.1, ]


ggplot(dc, aes(x=reorder(names, corr), y=corr)) + geom_point(size=3) + # Use a larger dot theme_bw() +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank(),
        panel.grid.major.x = element_line(colour="grey60", linetype="dashed"))
ggsave(file=paste(dbase, "s/cors.pdf", sep=""), width=20)
