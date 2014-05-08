source('cleaning/merge.r')
library(maps) # For map data
library(ggplot2)
library(scales)
counties=c( 'Alameda', 'Alpine', 'Amador', 'Butte', 'Calaveras', 'Colusa', 'ContraCosta', 'DelNorte', 'ElDorado', 'Fresno', 'Glenn', 'Humboldt', 'Imperial', 'Inyo', 'Kern', 'Kings', 'Lake', 'Lassen', 'LosAngeles', 'Madera', 'Marin', 'Mariposa', 'Mendocino', 'Merced', 'Modoc', 'Mono', 'Monterey', 'Napa', 'Nevada', 'Orange', 'Placer', 'Plumas', 'Riverside', 'Sacramento', 'SanBenito', 'SanBernardino', 'SanDiego', 'SanFrancisco', 'SanJoaquin', 'SanLuisObispo', 'SanMateo', 'SantaBarbara', 'SantaClara', 'SantaCruz', 'Shasta', 'Sierra', 'Siskiyou', 'Solano', 'Sonoma', 'Stanislaus', 'Sutter', 'Tehama', 'Trinity', 'Tulare', 'Tuolumne', 'Ventura', 'Yolo', 'Yuba')

c1 = "CR6"
c2 = "DTW"
dbase = "../CR6Data/clean/correlations/"

d=getAll(base, counties, c(), c1, T)


d = d[order(d$WELL.ID), ]



indices = (1:nrow(d))[!duplicated(d$WELL.ID) ]

dcorr = d[indices,c("WELL.ID", "APPROXIMATE.LATITUDE", "APPROXIMATE.LONGITUDE")]
dcorr$corr = NA
dcorr$count = 0

for(i in 1:(length(indices)-1)){
    sidx = (indices[i])
    eidx = (indices[i+1])-1
    ds = d[sidx:eidx, ]
    ds = ds[!is.na(c2), ]
    print(sidx)
    dcorr$corr[i] = cor(ds[c1], ds[c2]) 
    dcorr$count[i] = nrow(ds)
}

dcorr = dcorr[!is.na(dcorr$corr), ]
dcorr = dcorr[dcorr$count>2, ]
dcorr$group =1

# Get map data for USA
cali_map <- map_data("state", region =("California"))

# geom_path (no fill) and Mercator projection
m = ggplot(cali_map, aes(x=long, y=lat, group=group)) +
  geom_path() + coord_map("mercator")

tm = m + geom_point(
  aes(x = APPROXIMATE.LONGITUDE, y = APPROXIMATE.LATITUDE, colour = dcorr$corr, size = abs(dcorr$corr) ),
  data = dcorr)+ scale_size_area(max_size=4)+scale_colour_gradient2(high=muted("green"), low=muted("red"))

png(paste(dbase,"map_", c1, "_",c2, ".png",  sep=""))
plot(tm) 
dev.off()

png(paste(dbase,"hist_", c1, "_",c2, ".png",  sep=""))
plot(hist(dcorr$corr)) 
dev.off()

write.csv(dcorr, file=paste(dbase,c1, "_",c2, ".csv",  sep=""), row.names=F)

