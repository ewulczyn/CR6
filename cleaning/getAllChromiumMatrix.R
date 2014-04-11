counties=c( 'Alpine', 'Amador', 'Butte', 'Calaveras', 'Colusa', 'ContraCosta', 'DelNorte', 'ElDorado', 'Fresno', 'Glenn', 'Humboldt', 'Imperial', 'Inyo', 'Kern', 'Kings', 'Lake', 'Lassen', 'LosAngeles', 'Madera', 'Marin', 'Mariposa', 'Mendocino', 'Merced', 'Modoc', 'Mono', 'Monterey', 'Napa', 'Nevada', 'Orange', 'Placer', 'Plumas', 'Riverside', 'Sacramento', 'SanBenito', 'SanBernardino', 'SanDiego', 'SanFrancisco', 'SanJoaquin', 'SanLuisObispo', 'SanMateo', 'SantaBarbara', 'SantaClara', 'SantaCruz', 'Shasta', 'Sierra', 'Siskiyou', 'Solano', 'Sonoma', 'Stanislaus', 'Sutter', 'Tehama', 'Trinity', 'Tulare', 'Tuolumne', 'Ventura', 'Yolo', 'Yuba')
base="/Users/bholley/Desktop/Academics/CR6/StatewideEDF/";

d=getCountyChromium(base, "Alameda")
d$county="Alameda"
for(c in counties){
  print(c)
  dt=getCountyChromium(base, c)
  if(nrow(dt)==0){
    print("no chromium")
    next
  }
  dt$county=c
  d=rbind(d, dt)
}

write.csv(d, file="/Users/bholley/Desktop/Academics/CR6/clean/allCR6.csv", row.names=F)