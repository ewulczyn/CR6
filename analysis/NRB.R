source('cleaning/merge.r')
library(ggplot2)
counties=c( 'Alameda', 'Alpine', 'Amador', 'Butte', 'Calaveras', 'Colusa', 'ContraCosta', 'DelNorte', 'ElDorado', 'Fresno', 'Glenn', 'Humboldt', 'Imperial', 'Inyo', 'Kern', 'Kings', 'Lake', 'Lassen', 'LosAngeles', 'Madera', 'Marin', 'Mariposa', 'Mendocino', 'Merced', 'Modoc', 'Mono', 'Monterey', 'Napa', 'Nevada', 'Orange', 'Placer', 'Plumas', 'Riverside', 'Sacramento', 'SanBenito', 'SanBernardino', 'SanDiego', 'SanFrancisco', 'SanJoaquin', 'SanLuisObispo', 'SanMateo', 'SantaBarbara', 'SantaClara', 'SantaCruz', 'Shasta', 'Sierra', 'Siskiyou', 'Solano', 'Sonoma', 'Stanislaus', 'Sutter', 'Tehama', 'Trinity', 'Tulare', 'Tuolumne', 'Ventura', 'Yolo', 'Yuba')
base = "../CR6Data/counties/"

plotdir = "../CR6Data/clean/NRB"
unlink(plotdir, recursive = TRUE)
dir.create(plotdir );

d=getAll(base, counties, c("NO3", "CR"),"CR6", F, T)

d = d[d$CR>0,]
d = d[!is.na(d$CR6), ]
d$R = d$CR6/d$CR

d = d[d$R<=1, ]
sp <- ggplot(d, aes(x=NO3, y=R))
sp + geom_point(alpha=.1)+ xlim(0, 100)+ ylim(0, 1)




diffs = c();
ts = seq(1,100,by=0.1)
for(t in ts){
  diffs = append(diffs, mean(d$R[d$NO3<t])-mean(d$R[d$NO3>=t]))
}
plot(ts, diffs)

diffmax = min(diffs)
tmax = ts[which(diffs==min(diffs))][1]
n = nrow(d)
k = nrow(d[d$NO3<tmax,])

sdiffs = c()
for(i in 1:5000){
  s = sample(1:n, k,replace=FALSE)
  s1 <- d[s,] 
  s2 <- d[-s, ]
  sdiffs = append(sdiffs, mean(s1$R)-mean(s2$R))
}
hist(sdiffs)
significance = sum(sdiffs<diffmax)/length(sdiffs)

qplot(R, data=d, binwidth=0.1)
qplot(R, data=d[d$NO3<tmax,], binwidth=0.1)
qplot(R, data=d[d$NO3>=tmax,], binwidth=0.1)

ggplot(d, aes(x=R)) + geom_density()+ xlim(0, 1)+ ylim(0, 10)
ggplot(d[d$NO3<tmax,], aes(x=R)) + geom_density()+ xlim(0, 1)+ ylim(0, 10)
ggplot(d[d$NO3>=tmax,], aes(x=R)) + geom_density()+ xlim(0, 1)+ ylim(0, 10)