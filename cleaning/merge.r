reformatDateAndId <-function(d, oldDatesName, oldDatesFormat, siteIDsName, wellIDsName){
  d$newdate <- strptime(as.character(d[, oldDatesName]), oldDatesFormat)
  d$date=format(d$newdate, "%Y-%m-%d")
  d$yearmonth=format(d$newdate, "%Y-%m")
  d$year=format(d$newdate, "%Y")
  d$UID=do.call(paste, c(d[c("yearmonth", siteIDsName, wellIDsName)], sep = " "))
  return(d)
}

base = "../CR6Data/counties/"
getCountyChromium <- function(base, county){
  d=read.csv(paste(base, county, "/raw/CR6.csv", sep=""), sep="\t", header=T)
  d$CR6=d$RESULT
  d=reformatDateAndId(d, "DATE", "%m/%d/%Y", "WELL.ID", "WELL.NAME")
  d=d[, c("UID", "WELL.ID", "WELL.NAME", "CR6", "date", "yearmonth","year", "APPROXIMATE.LATITUDE", "APPROXIMATE.LONGITUDE")]
  d=d[!duplicated(d$UID), ]
  d=d[order(d$UID), ]
  return(d)
}

addChemical <-function(d, base, county, chem){
  dnewchem=read.csv(paste(base,county, "/raw/", chem, ".csv", sep=""), sep="\t", header=T)
  if(nrow(dnewchem)==0){
    print("this county does not have data for this chemical")
    d[, chem]=NA
    return(d)
  }
  dnewchem[, chem]=dnewchem$RESULT
  dnewchem=reformatDateAndId(dnewchem, "DATE", "%m/%d/%Y", "WELL.ID", "WELL.NAME")
  dnewchem=dnewchem[, c("UID", chem)]
  dnewchem=dnewchem[!duplicated(dnewchem$UID), ]
  return(merge(x = d, y = dnewchem, by = "UID", all.x=TRUE))
}

addDepth <-function(d, base, county){
  depth=read.csv(paste(base,county, "/raw/GEOWell.csv", sep=""), sep="\t", header=T)
  if(nrow(depth)==0){
    print("this county does not have depth data")
    d[, "Z"]=NA
    return(d)
  }
  depth=reformatDateAndId(depth, "GW_MEAS_DATE", "%Y-%m-%d", "GLOBAL_ID", "FIELD_POINT_NAME")
  depth=depth[!duplicated(depth$UID), ]
  depth=depth[, c("UID", "DTW")]
  return(merge(x = d, y = depth, by = c("UID"), all.x=TRUE))
}

getAll<-function(base, counties, chems, getDepth){
  d=NULL
  for(county in counties){
    print(county)
    dt=getCountyChromium(base, county)
    if(nrow(dt)==0){
      print("no chromium")
      next
    }
    for(chem in chems){
      print(chem)
      dt=addChemical(dt,base, county, chem )
    }
    if(getDepth)
      dt=addDepth(dt, base, county)
    dt$county=county
    if(is.null(d)){
      d=dt
    }else{
      d=rbind(d, dt)
    }
    
  }
  return(d)
}


