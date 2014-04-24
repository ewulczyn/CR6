library(plyr)

getTimeSlice<-function(d, sites, chem, sdate, edate){
  t = d[(d$date<edate)  & (sdate<d$date), ]
  if(nrow(t)==0){
    return(NULL)
    print("no data")
  }
  print(dim(t))
  colnames(t)[3]="chem"
  agg=aggregate(t$chem, by=list(t$ID), FUN=mean, na.rm=TRUE)
  names(agg)=c("ID", chem)
  f = (merge(x = agg, y = sites, by = "ID", all.x=TRUE))
  return(f)
}

#get data frame
base = "../CR6Data/counties/"
county="Yolo"
chem = "CR6"
#d = getCountyChem(base, county, chem)
d = read.csv("../CR6Data/clean/allNO3.csv", sep=",", header=T)

d$date=as.Date(d$date)
d$year=NULL
d$yearmonth=NULL
d$UID=NULL
d$ID=do.call(paste, c(d[c("WELL.ID", "WELL.NAME")], sep = " "))


#find all well and locations
sites = unique(d[, c("ID", "APPROXIMATE.LATITUDE", "APPROXIMATE.LONGITUDE")])

#how many days to agg over
span = 180;
sdate = as.Date("1995-01-01")
mdate = as.Date("2014-01-01")
edate = sdate+span

while(edate<mdate){
  f = getTimeSlice(d, sites, chem, sdate, edate)
  if(!is.null(f)){
    #write.csv(f, file=paste(base, county, "/clean/ts/",sdate ,"-", edate ,".csv", sep=""), row.names=F) 
    write.csv(f, file=paste("../CR6Data/clean/ts_NO3_180/",sdate ,"to", edate ,".csv", sep=""), row.names=F) 
  }
  sdate=sdate+span
  edate=edate+span
}


