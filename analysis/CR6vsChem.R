source('cleaning/merge.r')
library(ggplot2)
counties=c( 'Alameda', 'Alpine', 'Amador', 'Butte', 'Calaveras', 'Colusa', 'ContraCosta', 'DelNorte', 'ElDorado', 'Fresno', 'Glenn', 'Humboldt', 'Imperial', 'Inyo', 'Kern', 'Kings', 'Lake', 'Lassen', 'LosAngeles', 'Madera', 'Marin', 'Mariposa', 'Mendocino', 'Merced', 'Modoc', 'Mono', 'Monterey', 'Napa', 'Nevada', 'Orange', 'Placer', 'Plumas', 'Riverside', 'Sacramento', 'SanBenito', 'SanBernardino', 'SanDiego', 'SanFrancisco', 'SanJoaquin', 'SanLuisObispo', 'SanMateo', 'SantaBarbara', 'SantaClara', 'SantaCruz', 'Shasta', 'Sierra', 'Siskiyou', 'Solano', 'Sonoma', 'Stanislaus', 'Sutter', 'Tehama', 'Trinity', 'Tulare', 'Tuolumne', 'Ventura', 'Yolo', 'Yuba')
base = "../CR6Data/counties/"

plotdir = "../CR6Data/clean/pairPlots"
unlink(plotdir, recursive = TRUE)
dir.create(plotdir );

chems = c("NO3", "FE", "MN", "CR");

for(c in chems){
  
  d=getAll(base, counties, c(c),"CR6", F, T)
  sp <- ggplot(d, aes_string(x=c, y="CR6"))
  sp + geom_point(alpha=.1)+ xlim(0, 100)+ ylim(0, 100)
  ggsave(file=paste(plotdir, "/", c, "vsCR6.png",  sep=""))
  
}


#depth
d=getAll(base, counties, c(), "CR6", T, T)
sp <- ggplot(d, aes(x=DTW, y=CR6))
sp + geom_point(alpha=.1)+ xlim(0, 100)+ ylim(0, 100)


