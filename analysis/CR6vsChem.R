source('cleaning/merge.r')
counties=c( 'Alameda', 'Alpine', 'Amador', 'Butte', 'Calaveras', 'Colusa', 'ContraCosta', 'DelNorte', 'ElDorado', 'Fresno', 'Glenn', 'Humboldt', 'Imperial', 'Inyo', 'Kern', 'Kings', 'Lake', 'Lassen', 'LosAngeles', 'Madera', 'Marin', 'Mariposa', 'Mendocino', 'Merced', 'Modoc', 'Mono', 'Monterey', 'Napa', 'Nevada', 'Orange', 'Placer', 'Plumas', 'Riverside', 'Sacramento', 'SanBenito', 'SanBernardino', 'SanDiego', 'SanFrancisco', 'SanJoaquin', 'SanLuisObispo', 'SanMateo', 'SantaBarbara', 'SantaClara', 'SantaCruz', 'Shasta', 'Sierra', 'Siskiyou', 'Solano', 'Sonoma', 'Stanislaus', 'Sutter', 'Tehama', 'Trinity', 'Tulare', 'Tuolumne', 'Ventura', 'Yolo', 'Yuba')
base="../CR6Data/StatewideEDF/";

#NO3
d=getAll(base, counties, c('NO3'), F)
d=d[!is.na(d$NO3), ]
plot(d$NO3, d$CR6)
plot(d$NO3, d$CR6, xlim=c(0.1, 100), ylim=c(0.1, 100))
dx=d[d$CR6>50,]
plot(dx$NO3, dx$CR6)
plot(d$NO3, d$CR6, xlim=c(0.1, 100), ylim=c(0.1, 100))


#FE
d=getAll(base, counties, c('FE'), F)
d=d[!is.na(d$FE), ]
plot(d$FE, d$CR6, xlim=c(0.1, 1000), ylim=c(0.1, 1000))
plot(d$FE, log(d$CR6), xlim=c(0.1, 1000), ylim=c(0.1, 20))
plot(log(d$FE), log(d$CR6), xlim=c(0.1, 10), ylim=c(0.1, 20))
plot(d$FE, log(d$CR6), xlim=c(0.1, 2000), ylim=c(0.1, 20))
plot(log(d$FE), d$CR6, ylim=c(0.1, 20), xlim=c(0.1, 20))

#MN
d=getAll(base, counties, c('MN'), F)
d=d[!is.na(d$MN), ]
plot(d$MN, d$CR6)
plot(d$MN, d$CR6, xlim=c(0.1, 1000), ylim=c(0.1, 1000))
plot(d$MN, log(d$CR6), xlim=c(0.1, 1000), ylim=c(0.1, 20))


#NH4
d=getAll(base, counties, c('NH3NH4N'), F)
d=d[!is.na(d$NH3NH4N), ]
plot(d$NH3NH4N, d$CR6)
plot(d$NH3NH4N, d$CR6, xlim=c(0.1, 1000), ylim=c(0.1, 1000))
plot(d$NH3NH4N, log(d$CR6), xlim=c(0.1, 1000), ylim=c(0.1, 20))


#CR
dCR=getAll(base, counties, c("CR"), F)
dCR=dCR[!is.na(dCR$CR), ]
dCR=dCR[dCR$CR>dCR$CR6, ]
plot(dCR$CR, dCR$CR6)

dCR=dCR[dCR$CR<100000, ]
plot(dCR$CR, dCR$CR6)

dCR=dCR[dCR$CR<8000, ]
plot(dCR$CR, dCR$CR6)

#depth
d=getAll(base, counties, c())
d=d[!is.na(d$DTW), ]
plot(d$DTW, d$CR6, xlim=c(0.1, 10), ylim=c(0.1, 200))

d=getAll(base, c("Yolo"), c())
d=d[!is.na(d$DTW), ]
plot(d$DTW, d$CR6, xlim=c(0.1, 10), ylim=c(0.1, 200))

#write.csv(d, file="/Users/bholley/Desktop/Academics/CR6/clean/allChems.csv", row.names=F)