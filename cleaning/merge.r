reformatDateAndId <-function(d, oldDatesName, oldDatesFormat, siteIDsName, wellIDsName){
  d$newdate <- strptime(as.character(d[, oldDatesName]), oldDatesFormat)
  d$date=format(d$newdate, "%Y-%m-%d")
  d$yearmonth=format(d$newdate, "%Y-%m")
  d$year=format(d$newdate, "%Y")
  d$MID=do.call(paste, c(d[c("yearmonth", siteIDsName, wellIDsName)], sep = " "))
  d$WID = do.call(paste, c(d[c("yearmonth", siteIDsName, wellIDsName)], sep = " "))
  return(d)
}

base = "../CR6Data/counties/"


getCountyChem <- function(base, county, basechem){
  d=read.csv(paste(base, county, "/raw/", basechem, ".csv", sep=""), sep="\t", header=T)
  d[, basechem]=d$RESULT
  d=reformatDateAndId(d, "DATE", "%m/%d/%Y", "WELL.ID", "WELL.NAME")
  d=d[, c("MID","WID", "WELL.ID", "WELL.NAME", basechem, "date", "APPROXIMATE.LATITUDE", "APPROXIMATE.LONGITUDE")]
  d=d[!duplicated(d$MID), ]
  d=d[order(d$MID), ]
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
  dnewchem=dnewchem[, c("MID", chem)]
  dnewchem=dnewchem[!duplicated(dnewchem$MID), ]
  return(merge(x = d, y = dnewchem, by = "MID", all.x=TRUE))
}

addDepth <-function(d, base, county){
  depth=read.csv(paste(base,county, "/raw/GEOWell.csv", sep=""), sep="\t", header=T)
  if(nrow(depth)==0){
    print("this county does not have depth data")
    d[, "Z"]=NA
    return(d)
  }
  depth=reformatDateAndId(depth, "GW_MEAS_DATE", "%Y-%m-%d", "GLOBAL_ID", "FIELD_POINT_NAME")
  depth=depth[!duplicated(depth$MID), ]
  depth=depth[, c("MID", "DTW")]
  return(merge(x = d, y = depth, by = c("MID"), all.x=TRUE))
}

getAll<-function(base, counties, chems, basechem, getDepth){
  d=NULL
  for(county in counties){
    print(county)
    dt=getCountyChem(base, county, basechem)
    if(nrow(dt)==0){
      print("no basechem")
      next
    }
    for(chem in chems){
      print(chem)
      if(chem==basechem)
        next 
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
  
  #Now give every well belonging to the same site the same location
  dg = d[, c("WELL.ID", "APPROXIMATE.LATITUDE", "APPROXIMATE.LONGITUDE" )]
  dg= dg[!duplicated(dg$WELL.ID), ]
  d$APPROXIMATE.LATITUDE = NULL
  d$APPROXIMATE.LONGITUDE = NULL
  d2 = merge(x = d, y = dg, by = c("WELL.ID"), all.x=TRUE)
  
  return(d2)
}


