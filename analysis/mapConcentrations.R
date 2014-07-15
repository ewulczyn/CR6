library(maps) # For map data
library(ggplot2)
source('cleaning/createTimeSeries.r')
source('cleaning/createTimeSeriesFixed.r')

counties=c( 'Alameda', 'Alpine', 'Amador', 'Butte', 'Calaveras', 'Colusa', 'ContraCosta', 'DelNorte', 'ElDorado', 'Fresno', 'Glenn', 'Humboldt', 'Imperial', 'Inyo', 'Kern', 'Kings', 'Lake', 'Lassen', 'LosAngeles', 'Madera', 'Marin', 'Mariposa', 'Mendocino', 'Merced', 'Modoc', 'Mono', 'Monterey', 'Napa', 'Nevada', 'Orange', 'Placer', 'Plumas', 'Riverside', 'Sacramento', 'SanBenito', 'SanBernardino', 'SanDiego', 'SanFrancisco', 'SanJoaquin', 'SanLuisObispo', 'SanMateo', 'SantaBarbara', 'SantaClara', 'SantaCruz', 'Shasta', 'Sierra', 'Siskiyou', 'Solano', 'Sonoma', 'Stanislaus', 'Sutter', 'Tehama', 'Trinity', 'Tulare', 'Tuolumne', 'Ventura', 'Yolo', 'Yuba')



span = 180
chem = "NO3"

createTimeSeriesFixed(chem, span)

# Get map data for USA
cali_map <- map_data("state", region =("California"))

# geom_path (no fill) and Mercator projection
m = ggplot(cali_map, aes(x=long, y=lat, group=group)) +
  geom_path() + coord_map("mercator")

dbase = paste("../CR6Data/clean/ts", "_", chem, "_", toString(span), "/", sep="")
pbase = paste("../CR6Data/clean/plot", "_", chem, "_", toString(span), "/", sep="")
unlink(pbase, recursive = TRUE)
dir.create(pbase)



fs = list.files(path=dbase)
means=c()

for(f in fs){
  t = read.csv(paste(dbase, f, sep=""))
  print(nrow(t))
  if(nrow(t)<10){
    next
  }
  colnames(t)[2] = "chem"
  t$group=1
  splits=c(0.2, 10, 100)
  t$level = "<0.2"
  t$level[t$chem>splits[1] & t$chem<splits[2]]="0.2-10";
  t$level[t$chem>splits[2] & t$chem<splits[3]]="10-100";
  t$level[t$chem>splits[3]]=">100";
  means = append(means, mean(t$chem))
  
  t$chem[t$chem>100]=100
  print(f)
  
  tm = m + geom_point(
    aes(x = APPROXIMATE.LONGITUDE, y = APPROXIMATE.LATITUDE, colour = sqrt(t$chem), size = sqrt(t$chem), alpha=0.01),
    data = t)+ scale_size_area(max_size=10)+scale_colour_gradient(high = "#D55E00",low = "#F0E442")

  png(paste(pbase,substr(x = f, start = 1, stop = 22), ".png",  sep=""))
  plot(tm) 
  dev.off()
}


png(paste(pbase,"means.png",  sep=""))
plot(means) 
dev.off()