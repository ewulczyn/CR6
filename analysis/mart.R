source('cleaning/merge.r')
setwd("~/Desktop/Academics/CR6")
library(data.table)

MARTDIR = "~/Desktop/Academics/315/MART"
mart.home = MARTDIR
source("~/Desktop/Academics/315/MART/mart.s")


#
c= "CR6"
f = paste("../CR6Data/allChemsReduced/",c ,".csv", sep="");
d = read.csv(file=f)

good_list = unique(d$WID[d$CR6<100])

# prep no zeroes
for(c in chems){
  print(c)
  
  f = paste("../CR6Data/allChemsReduced/",c ,".csv", sep="");
  print(file.exists(f));
  if(file.exists(f)){
    d = read.csv(file=f)
    if(nrow(d)>0 && c %in% names(d)){
      print(T)
      d = d[d$WID %in% good_list, ]
      if(nrow(d)>0){
      d$date = as.Date(d$date)
      d$year=format(d$date, "%Y")
      agg=aggregate(d[, c], by=list(d$WID, d$year), FUN=median, na.rm=TRUE)
      names(agg) = c("WID", "year", c)
      
      write.csv(agg, file=paste("../CR6Data/allChemsYearly/",c ,".csv", sep=""), row.names=F)
      }
    }
  }
}

c= "CR6"
f = paste("../CR6Data/allChemsYearly/",c ,".csv", sep="");
dbase = data.table(read.csv(file=f))

for( c in chems){
  if(c!="CR6"){
    print(c)
    f = paste("../CR6Data/allChemsYearly/",c ,".csv", sep="");
    if(file.exists(f)){
      d = data.table(read.csv(file=f))  
      dbase = merge(x = dbase, y = d, by = c("WID", "year"), all.x=T)
    }
  }
}

dbase = data.frame(dbase)


d = dbase[, colMeans(is.na(dbase)) <= .5] 


d[is.na(d)] = 0


y = d[1:200, "CR6"]
x = d[1:200, 4:ncol(d)]
x = as.matrix(x)
lx = c(1, rep(1, ncol(x)))



#no categorical variables
#no missing values

mart(x, y, lx, niter = 20, loss.cri = 2, tree.size = 2 , start = TRUE)
progress()
varimp()


