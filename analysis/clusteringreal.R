source('cleaning/merge.r')
library(ggplot2)

labels = c()
postchems= c()
ds= list()
vi=1
i=1
for(vi in 1:length(chems)){
  c = chems[vi]
  l = full_chem_names[vi]
  f = paste("../CR6Data/allChemsReduced/",c ,".csv", sep="");
  if(file.exists(f)){
    d = read.csv(file=f)[, c("WID", "date", c)]
    d = na.omit(d)
    #d$date=as.Date(d$date)
    ds[[i]] <- d
    i=i+1
    labels = append(labels, l)
    postchems = append(postchems, c)
  }
}

n = length(postchems)

dcorr = matrix(0,n,n)
dscorr = matrix(0,n,n)
dcorr_log = matrix(0,n,n)
dscorr_log = matrix(0,n,n)


counts = matrix(0,n,n)
counts_log = matrix(0,n,n)



for(i in 2:n){
  for(j in 1:(i-1)){
    print(i*10000+j)
    ci = postchems[[i]]
    cj = postchems[[j]]
    di = ds[[i]]
    dj = ds[[j]]
    
    dexact = merge(x=di[, c(ci, "date", "WID")], y=dj[, c(cj, "date", "WID")], by=c("WID", "date"), all=F)
    dcorr[i, j] = cor(dexact[,ci], dexact[,cj])
    dscorr[i, j] = cor(dexact[,ci], dexact[,cj], method=c("spearman"))
    counts[i, j] = nrow(dexact)
    
    dexact[, ci ] = log(dexact[, ci ])
    dexact[, cj] = log(dexact[, cj])
    
    #is.na(dexact) <- do.call(cbind,lapply(dexact, is.infinite))
    #dexact = na.omit(dexact)
    dcorr_log[i, j] = cor(dexact[,ci], dexact[,cj])
    dscorr_log[i,j] = cor(dexact[,ci], dexact[,cj], method=c("spearman"))
    counts_log[i, j] = nrow(dexact)
    
    
    
  }
}

#weighted nearest

rownames(dcorr) = labels[1:n]
colnames(dcorr) = labels[1:n]
rownames(dscorr) = labels[1:n]
colnames(dscorr) = labels[1:n]
rownames(counts) = labels[1:n]
colnames(counts) = labels[1:n]

rownames(dcorr_log) = labels[1:n]
colnames(dcorr_log) = labels[1:n]
rownames(dscorr_log) = labels[1:n]
colnames(dscorr_log) = labels[1:n]
rownames(counts_log) = labels[1:n]
colnames(counts_log) = labels[1:n]


dcorr = as.data.frame(dcorr)
dcorr[is.na(dcorr)] <-0

dscorr = as.data.frame(dscorr)
dscorr[is.na(dscorr)] <-0

dcorr_log = as.data.frame(dcorr_log)
dcorr_log[is.na(dcorr_log)] <-0

dscorr_log = as.data.frame(dscorr_log)
dscorr_log[is.na(dscorr_log)] <-0





fit <-hclust(as.dist(1 - (dcorr + 1)/2),method="ward" )

svg("../CR6Data/clean/clustering1/pcorr.SVG",width=50)
plot(fit, hang=-1, cex=0.5)
dev.off()

fit <-hclust(as.dist(1 - (dscorr + 1)/2),method="ward" )

svg("../CR6Data/clean/clustering/scorr.SVG",width=50)
plot(fit, hang=-1, cex=0.5)
dev.off()

fit <-hclust(as.dist(1 - (dcorr_log + 1)/2),method="ward" )

svg("../CR6Data/clean/clustering/pcorr_log.SVG",width=50)
plot(fit, hang=-1, cex=0.5)
dev.off()

fit <-hclust(as.dist(1 - (dscorr_log + 1)/2),method="ward" )

svg("../CR6Data/clean/clustering/scorr_log.SVG",width=50)
plot(fit, hang=-1, cex=0.5)
dev.off()

write.csv(dcorr, file="../CR6Data/clean/clustering/pcorr.csv", row.names=T) 
write.csv(dscorr, file="../CR6Data/clean/clustering/scorr.csv", row.names=T) 
write.csv(dcorr_log, file="../CR6Data/clean/clustering/pcorr_log.csv", row.names=T) 
write.csv(dscorr_log, file="../CR6Data/clean/clustering/pcorr_log.csv", row.names=T) 
write.csv(counts, file="../CR6Data/clean/clustering/counts.csv", row.names=T) 
write.csv(counts_log, file="../CR6Data/clean/clustering/counts_log.csv", row.names=T) 


