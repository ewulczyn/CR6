source('cleaning/merge.r')
counties=c( 'Alameda', 'Alpine', 'Amador', 'Butte', 'Calaveras', 'Colusa', 'ContraCosta', 'DelNorte', 'ElDorado', 'Fresno', 'Glenn', 'Humboldt', 'Imperial', 'Inyo', 'Kern', 'Kings', 'Lake', 'Lassen', 'LosAngeles', 'Madera', 'Marin', 'Mariposa', 'Mendocino', 'Merced', 'Modoc', 'Mono', 'Monterey', 'Napa', 'Nevada', 'Orange', 'Placer', 'Plumas', 'Riverside', 'Sacramento', 'SanBenito', 'SanBernardino', 'SanDiego', 'SanFrancisco', 'SanJoaquin', 'SanLuisObispo', 'SanMateo', 'SantaBarbara', 'SantaClara', 'SantaCruz', 'Shasta', 'Sierra', 'Siskiyou', 'Solano', 'Sonoma', 'Stanislaus', 'Sutter', 'Tehama', 'Trinity', 'Tulare', 'Tuolumne', 'Ventura', 'Yolo', 'Yuba')
chems = c('CR6', 'DCE11', 'TCA111', 'PCA', 'FC113', 'TCA112', 'DCA11', 'EDB', 'DCBZ12', 'DCA12', 'DCPA12', 'TCPR123', 'TCB124', 'TMB124', 'DBCP', 'DCP13', 'TMB135', 'DCBZ13', 'DCBZ14', 'DIOXANE14', '17DIMETHYLX', 'CLBZME2', 'TCDD2378', 'SILVEX', 'TNT', '24D', 'CLBZME4', 'DDD44', 'DDE44', 'DDT44', 'ACETAMPHEN', 'ALACL', 'ALBUTEROL', 'ALDICARB', 'ALDSULF', 'ALDSULFOX', 'BHCALPHA', 'AL', 'NH3NH4N', 'ACB', 'SB', 'AS', 'ATRAZINE', 'AZIPE', 'BA', 'BENSULM', 'BTZ', 'BZ', 'BZAP', 'BE', 'BHCBETA', 'ALKB', 'B', 'BROMCIL', 'BRO3', 'BR', 'BDCME', 'TBME', 'CD', 'CA', 'CARBAMPINE', 'SEVIN', 'CRBFN', 'C-14', 'CDS', 'CTCL', 'CHLORATE', 'CHLORDANE', 'CL', 'CHLORITE', 'CLBZ', 'TCLME', 'CLPICRIN', 'TERMIL', 'CR', 'DCE12C', 'CO', 'CODEINE', 'CU', 'COTININE', 'CYANAZ', 'CN', 'CYPERM', 'OXYGEN18', 'DACTH', 'DACTACID', 'DALAPON', 'DEATZ', 'DEHYDRONIF', 'DIPATZ', 'DEUTERIUM', 'DOA', 'BIS2EHP', 'DIAZ', 'DBCME', 'DICAMBA', 'FC12', 'DCMA', 'DCPROP', 'DICHLORVOS', 'DICOFOL', 'DIELDRIN', 'DILTIAZEM', 'DIMETHAT', 'DINOSEB', 'DIPHENHYDR', 'DIQUAT', 'DO', 'DOSAT', 'DIURON', 'SC', 'ENDOSULFANA', 'ENDOSULFANB', 'ENDOSULFANS', 'ENDOTHAL', 'ENDRIN', 'ENDRINALD', 'EPTAM', 'ETBE', 'EBZ', 'ETEGLY', 'FCOLIFORM', 'FENPHOS', 'F', 'FOAMAGENTS', 'FONOFOS', 'FORMALD', 'GLYP', 'ALPHA', 'BETA', 'AZIPM', 'HEPTACHLOR', 'HEPT-EPOX', 'HCLBZ', 'HCBU', 'HCCP', 'HEXAZINONE', 'I', 'IPRODIONE', 'FE', 'IPBZ', 'PB', 'BHCGAMMA', 'LINURON', 'LI', 'MG', 'MALA', 'MN', 'HG', 'METALAXYL', 'METHOMYL', 'MTXYCL', 'BRME', 'IME', 'MIBK', 'METOCHLOR', 'METRIBUZ', 'MOLINATE', 'MO', 'MTBE', 'BTBZN', 'NNSPR', 'NNSE', 'NNSM', 'PBZN', 'NALED', 'NAPH', 'NAPROPAM', 'NI', 'NO3', 'NO2', 'NORFLUZON', 'HMX', 'PORTHO', 'OXAMYL', 'OXYFLUOREN', 'PARAE', 'PCNB', 'PCP', 'PCATE', 'PERMETHRIN', 'PH', 'PHORATE', 'PICLORAM', 'PCB1016', 'K', 'PROMETON', 'PROMETRYN', 'PROPACHLOR', 'PROPANIL', 'PROPGITE', 'RA-226', 'RA-228', 'RN-222', 'RDX', 'BTBZS', 'SE', 'AG', 'SIMAZINE', 'NA', 'SR', 'SR-90', 'STY', 'SULFAMETH', 'SO4', 'TEBUTHIURON', 'TEMP', 'TBA', 'BTBZT', 'TAME', 'PCE', 'TL', 'THIABEND', 'THIOBENCARB', 'BZME', 'COLIFORM', 'TDS', 'TOCH', 'THM', 'TOXAP', 'DCE12T', 'TCE', 'FC11', 'TRICLOPYR', 'TRIFLURALIN', 'TRIMETHOP', 'H-3', 'W', 'U', 'V', 'VC', 'WARFARIN', 'XYLENES', 'ZN')
base = "../CR6Data/counties/"


#chem_data_base = "../CR6Data/edf/chems/"
#cluster_data_base = "../CR6Data/edf/cluster_data/"
#datsets = c('EDF', 'EPA', 'LLNL')

setwd('~/CR6')

chem_data_base = "../CR6Data/non_edf/chems/"
cluster_data_base = "../CR6Data/non_edf/cluster_data/"
datasets = c('GAMA', 'USGS',  'CDPH',  'DHS','USGSNEW', 'DWR')



# combine edf well data from all counties by chem
for(c in chems){
  d=getAll(base, counties, c(),c, F, F, datasets)[, c("WID", "date", c)]
  print(c)
  write.csv(d, file=paste(chem_data_base,c ,".csv", sep=""), row.names=F) 
  
}



for(c in chems){
  print(c)
  f = paste(chem_data_base,c ,".csv", sep="");
  if(file.exists(f)){
    print(f)
    
    d = read.csv(file=f)
    if(nrow(d)>0 && c %in% names(d)){
      d$key = do.call(paste, c(d[c("WID", "date")], sep = " "))
      d$WID=NULL
      d$date=NULL
      d = na.omit(d)
      #write.csv(d, file=paste("../CR6Data/cluster_data/with0/",c ,".csv", sep=""), row.names=F)
      d0 =d 
      indices = d0[,c]>0
      if(sum(indices)>0){
        d0 = d0[indices, ]
        #write.csv(d0, file=paste("../CR6Data/cluster_data/no0/",c ,".csv", sep=""), row.names=F)
        d0[, c] = log(d0[,c])
        d0=na.omit(d0)
        #write.csv(d0, file=paste("../CR6Data/cluster_data/no0_log/",c ,".csv", sep=""), row.names=F)
      }
      
      dmin = d
      ci = dmin[, c]
      uci=unique(ci)
      ci_min = uci[order(uci)[2]]
      print(ci_min)
      ci[ci==0] = ci_min
      dmin[, c]=ci
      print(min(dmin[, c]))
      #write.csv(dmin, file=paste("../CR6Data/cluster_data/min/",c ,".csv", sep=""), row.names=F) 
      dmin[, c] = log(dmin[,c])
      dmin=na.omit(dmin)
      write.csv(dmin, file=paste(cluster_data_base, 'min_log/',c ,".csv", sep=""), row.names=F)
    }
  }
}




