library(plyr)
source('cleaning/merge.r')


getAggregatedTimeSlice<-function(d, sites, chem, sdate, edate){
  t = d[(d$date<edate)  & (sdate<d$date), ]
  if(nrow(t)==0){
    return(NULL)
    print("no data")
  }
  print(dim(t))
  colnames(t)[3]="chem"
  agg=aggregate(t$chem, by=list(t$ID), FUN=mean, na.rm=TRUE)
  names(agg)=c("ID", chem)
  f = (merge(x = agg, y = sites, by = "ID"))
  print(dim(f))
  return(f)
}

createTimeSeriesFixed <- function(chem, span){
  d=getAll(base, counties, c(), chem, F)
  d$date=as.Date(d$date)
  d$year=NULL
  d$yearmonth=NULL
  d$WID = NULL
  d$MID = NULL
  d$ID = d$WELL.ID
  
  #find all well sites and locations
  sites = unique(d[, c("ID", "APPROXIMATE.LATITUDE", "APPROXIMATE.LONGITUDE")])
  
  #how many days to agg over
  
  dbase = paste("../CR6Data/clean/ts_", chem, "_", toString(span), "/", sep = "")
  unlink(dbase, recursive = TRUE)
  dir.create(dbase)
  
  sdate = as.Date("2004-01-01")
  mdate = as.Date("2014-01-01")
  edate = sdate+span
  
  while(edate<mdate){
    s = d[(d$date<edate)  & (sdate<d$date), ]
    s = unique(s[, c("ID", "APPROXIMATE.LATITUDE", "APPROXIMATE.LONGITUDE")])
    sites = merge(x = sites, y = s, by = c("ID", "APPROXIMATE.LATITUDE", "APPROXIMATE.LONGITUDE"))
    print(dim(sites))
    sdate=sdate+span
    edate=min(edate+span, mdate)
  }
  
  sdate = as.Date("2004-01-01")
  mdate = as.Date("2014-01-01")
  edate = sdate+span
  
  while(edate<mdate){
    f = getAggregatedTimeSlice(d, sites, chem, sdate, edate)
    print(sdate)
    if(!is.null(f)){
      write.csv(f, file=paste(dbase,sdate ,"to", edate ,".csv", sep=""), row.names=F) 
    }
    sdate=sdate+span
    edate=min(edate+span, mdate)
  }
}

