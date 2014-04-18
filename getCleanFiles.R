source('cleaning/merge.r')
counties=c( 'Alameda', 'Alpine', 'Amador', 'Butte', 'Calaveras', 'Colusa', 'ContraCosta', 'DelNorte', 'ElDorado', 'Fresno', 'Glenn', 'Humboldt', 'Imperial', 'Inyo', 'Kern', 'Kings', 'Lake', 'Lassen', 'LosAngeles', 'Madera', 'Marin', 'Mariposa', 'Mendocino', 'Merced', 'Modoc', 'Mono', 'Monterey', 'Napa', 'Nevada', 'Orange', 'Placer', 'Plumas', 'Riverside', 'Sacramento', 'SanBenito', 'SanBernardino', 'SanDiego', 'SanFrancisco', 'SanJoaquin', 'SanLuisObispo', 'SanMateo', 'SantaBarbara', 'SantaClara', 'SantaCruz', 'Shasta', 'Sierra', 'Siskiyou', 'Solano', 'Sonoma', 'Stanislaus', 'Sutter', 'Tehama', 'Trinity', 'Tulare', 'Tuolumne', 'Ventura', 'Yolo', 'Yuba')
chems = c('CR6', 'DCE11', 'TCA111', 'PCA', 'FC113', 'TCA112', 'DCA11', 'EDB', 'DCBZ12', 'DCA12', 'DCPA12', 'TCPR123', 'TCB124', 'TMB124', 'DBCP', 'DCP13', 'TMB135', 'DCBZ13', 'DCBZ14', 'DIOXANE14', '17DIMETHYLX', 'CLBZME2', 'TCDD2378', 'SILVEX', 'TNT', '24D', 'CLBZME4', 'DDD44', 'DDE44', 'DDT44', 'ACETAMPHEN', 'ALACL', 'ALBUTEROL', 'ALDICARB', 'ALDSULF', 'ALDSULFOX', 'BHCALPHA', 'AL', 'NH3NH4N', 'ACB', 'SB', 'AS', 'ATRAZINE', 'AZIPE', 'BA', 'BENSULM', 'BTZ', 'BZ', 'BZAP', 'BE', 'BHCBETA', 'ALKB', 'B', 'BROMCIL', 'BRO3', 'BR', 'BDCME', 'TBME', 'CD', 'CA', 'CARBAMPINE', 'SEVIN', 'CRBFN', 'C-14', 'CDS', 'CTCL', 'CHLORATE', 'CHLORDANE', 'CL', 'CHLORITE', 'CLBZ', 'TCLME', 'CLPICRIN', 'TERMIL', 'CR', 'DCE12C', 'CO', 'CODEINE', 'CU', 'COTININE', 'CYANAZ', 'CN', 'CYPERM', 'OXYGEN18', 'DACTH', 'DACTACID', 'DALAPON', 'DEATZ', 'DEHYDRONIF', 'DIPATZ', 'DEUTERIUM', 'DOA', 'BIS2EHP', 'DIAZ', 'DBCME', 'DICAMBA', 'FC12', 'DCMA', 'DCPROP', 'DICHLORVOS', 'DICOFOL', 'DIELDRIN', 'DILTIAZEM', 'DIMETHAT', 'DINOSEB', 'DIPHENHYDR', 'DIQUAT', 'DO', 'DOSAT', 'DIURON', 'SC', 'ENDOSULFANA', 'ENDOSULFANB', 'ENDOSULFANS', 'ENDOTHAL', 'ENDRIN', 'ENDRINALD', 'EPTAM', 'ETBE', 'EBZ', 'ETEGLY', 'FCOLIFORM', 'FENPHOS', 'F', 'FOAMAGENTS', 'FONOFOS', 'FORMALD', 'GLYP', 'ALPHA', 'BETA', 'AZIPM', 'HEPTACHLOR', 'HEPT-EPOX', 'HCLBZ', 'HCBU', 'HCCP', 'HEXAZINONE', 'I', 'IPRODIONE', 'FE', 'IPBZ', 'PB', 'BHCGAMMA', 'LINURON', 'LI', 'MG', 'MALA', 'MN', 'HG', 'METALAXYL', 'METHOMYL', 'MTXYCL', 'BRME', 'IME', 'MIBK', 'METOCHLOR', 'METRIBUZ', 'MOLINATE', 'MO', 'MTBE', 'BTBZN', 'NNSPR', 'NNSE', 'NNSM', 'PBZN', 'NALED', 'NAPH', 'NAPROPAM', 'NI', 'NO3', 'NO2', 'NORFLUZON', 'HMX', 'PORTHO', 'OXAMYL', 'OXYFLUOREN', 'PARAE', 'PCNB', 'PCP', 'PCATE', 'PERMETHRIN', 'PH', 'PHORATE', 'PICLORAM', 'PCB1016', 'K', 'PROMETON', 'PROMETRYN', 'PROPACHLOR', 'PROPANIL', 'PROPGITE', 'RA-226', 'RA-228', 'RN-222', 'RDX', 'BTBZS', 'SE', 'AG', 'SIMAZINE', 'NA', 'SR', 'SR-90', 'STY', 'SULFAMETH', 'SO4', 'TEBUTHIURON', 'TEMP', 'TBA', 'BTBZT', 'TAME', 'PCE', 'TL', 'THIABEND', 'THIOBENCARB', 'BZME', 'COLIFORM', 'TDS', 'TOCH', 'THM', 'TOXAP', 'DCE12T', 'TCE', 'FC11', 'TRICLOPYR', 'TRIFLURALIN', 'TRIMETHOP', 'H-3', 'W', 'U', 'V', 'VC', 'WARFARIN', 'XYLENES', 'ZN')
base = "../CR6Data/counties/"


# per county
for(county in counties){
  d=getAll(base, c(county), chems,"CR6, " T)
  write.csv(d, file=paste(base, county, "/clean/allChems.csv", sep=""), row.names=F) 
}

#all counties allchems
d=getAll(base, counties, chems,"CR6", T)
write.csv(d, file="../CR6Data/clean/allChems.csv", row.names=F)

#all counties CR6
d=getAll(base, counties, c(), "CR6", F)
write.csv(d, file="../CR6Data/clean/allCR6.csv", row.names=F)

#all counties NO3
d=getAll(base, counties, c(), "NO3", F)
write.csv(d, file="../CR6Data/clean/allNO3.csv", row.names=F)