counties=c( 'Alameda', 'Alpine', 'Amador', 'Butte', 'Calaveras', 'Colusa', 'ContraCosta', 'DelNorte', 'ElDorado', 'Fresno', 'Glenn', 'Humboldt', 'Imperial', 'Inyo', 'Kern', 'Kings', 'Lake', 'Lassen', 'LosAngeles', 'Madera', 'Marin', 'Mariposa', 'Mendocino', 'Merced', 'Modoc', 'Mono', 'Monterey', 'Napa', 'Nevada', 'Orange', 'Placer', 'Plumas', 'Riverside', 'Sacramento', 'SanBenito', 'SanBernardino', 'SanDiego', 'SanFrancisco', 'SanJoaquin', 'SanLuisObispo', 'SanMateo', 'SantaBarbara', 'SantaClara', 'SantaCruz', 'Shasta', 'Sierra', 'Siskiyou', 'Solano', 'Sonoma', 'Stanislaus', 'Sutter', 'Tehama', 'Trinity', 'Tulare', 'Tuolumne', 'Ventura', 'Yolo', 'Yuba')
chems = c('DCE11', 'TCA111', 'PCA', 'FC113', 'TCA112', 'DCA11', 'EDB', 'DCBZ12', 'DCA12', 'DCPA12', 'TCPR123', 'TCB124', 'TMB124', 'DBCP', 'DCP13', 'TMB135', 'DCBZ13', 'DCBZ14', 'DIOXANE14', '17DIMETHYLX', 'CLBZME2', 'TCDD2378', 'SILVEX', 'TNT', '24D', 'CLBZME4', 'DDD44', 'DDE44', 'DDT44', 'ACETAMPHEN', 'ALACL', 'ALBUTEROL', 'ALDICARB', 'ALDSULF', 'ALDSULFOX', 'BHCALPHA', 'AL', 'NH3NH4N', 'ACB', 'SB', 'AS', 'ATRAZINE', 'AZIPE', 'BA', 'BENSULM', 'BTZ', 'BZ', 'BZAP', 'BE', 'BHCBETA', 'ALKB', 'B', 'BROMCIL', 'BRO3', 'BR', 'BDCME', 'TBME', 'CD', 'CA', 'CARBAMPINE', 'SEVIN', 'CRBFN', 'C-14', 'CDS', 'CTCL', 'CHLORATE', 'CHLORDANE', 'CL', 'CHLORITE', 'CLBZ', 'TCLME', 'CLPICRIN', 'TERMIL', 'CR','CR6', 'DCE12C', 'CO', 'CODEINE', 'CU', 'COTININE', 'CYANAZ', 'CN', 'CYPERM', 'OXYGEN18', 'DACTH', 'DACTACID', 'DALAPON', 'DEATZ', 'DEHYDRONIF', 'DIPATZ', 'DEUTERIUM', 'DOA', 'BIS2EHP', 'DIAZ', 'DBCME', 'DICAMBA', 'FC12', 'DCMA', 'DCPROP', 'DICHLORVOS', 'DICOFOL', 'DIELDRIN', 'DILTIAZEM', 'DIMETHAT', 'DINOSEB', 'DIPHENHYDR', 'DIQUAT', 'DO', 'DOSAT', 'DIURON', 'SC', 'ENDOSULFANA', 'ENDOSULFANB', 'ENDOSULFANS', 'ENDOTHAL', 'ENDRIN', 'ENDRINALD', 'EPTAM', 'ETBE', 'EBZ', 'ETEGLY', 'FCOLIFORM', 'FENPHOS', 'F', 'FOAMAGENTS', 'FONOFOS', 'FORMALD', 'GLYP', 'ALPHA', 'BETA', 'AZIPM', 'HEPTACHLOR', 'HEPT-EPOX', 'HCLBZ', 'HCBU', 'HCCP', 'HEXAZINONE', 'I', 'IPRODIONE', 'FE', 'IPBZ', 'PB', 'BHCGAMMA', 'LINURON', 'LI', 'MG', 'MALA', 'MN', 'HG', 'METALAXYL', 'METHOMYL', 'MTXYCL', 'BRME', 'IME', 'MIBK', 'METOCHLOR', 'METRIBUZ', 'MOLINATE', 'MO', 'MTBE', 'BTBZN', 'NNSPR', 'NNSE', 'NNSM', 'PBZN', 'NALED', 'NAPH', 'NAPROPAM', 'NI', 'NO3', 'NO2', 'NORFLUZON', 'HMX', 'PORTHO', 'OXAMYL', 'OXYFLUOREN', 'PARAE', 'PCNB', 'PCP', 'PCATE', 'PERMETHRIN', 'PH', 'PHORATE', 'PICLORAM', 'PCB1016', 'K', 'PROMETON', 'PROMETRYN', 'PROPACHLOR', 'PROPANIL', 'PROPGITE', 'RA-226', 'RA-228', 'RN-222', 'RDX', 'BTBZS', 'SE', 'AG', 'SIMAZINE', 'NA', 'SR', 'SR-90', 'STY', 'SULFAMETH', 'SO4', 'TEBUTHIURON', 'TEMP', 'TBA', 'BTBZT', 'TAME', 'PCE', 'TL', 'THIABEND', 'THIOBENCARB', 'BZME', 'COLIFORM', 'TDS', 'TOCH', 'THM', 'TOXAP', 'DCE12T', 'TCE', 'FC11', 'TRICLOPYR', 'TRIFLURALIN', 'TRIMETHOP', 'H-3', 'W', 'U', 'V', 'VC', 'WARFARIN', 'XYLENES', 'ZN')
full_chem_names = c('1,1 Dichloroethylene (1,1 DCE)', '1,1,1-Trichloroethane', '1,1,2,2 Tetrachloroethane (PCA)', '1,1,2-Trichloro-1,2,2-Trifluoroethane (Freon 113)', '1,1,2-Trichloroethane', '1,1-Dichloroethane (1,1 DCA)', '1,2 Dibromoethane (EDB)', '1,2 Dichlorobenzene (1,2-DCB)', '1,2 Dichloroethane (1,2 DCA)', '1,2 Dichloropropane (1,2 DCP)', '1,2,3-Trichloropropane (1,2,3 TCP)', '1,2,4- Trichlorobenzene (1,2,4 TCB)', '1,2,4-Trimethylbenzene', '1,2-Dibromo-3-chloropropane (DBCP)', '1,3 Dichloropropene', '1,3,5-Trimethylbenzene', '1,3-Dichlorobenzene ', '1,4-Dichlorobenzene (p-DCB)', '1,4-Dioxane', '1,7-Dimethylxanthine  ', '2 Chlorotoluene', '2,3,7,8-Tetrachlorodibenzodioxin (Dioxin)', '2,4,5-TP (Silvex)', '2,4,6-Trinitrotoluene (TNT)', '2,4-Dichlorophenoxyacetic acid (2,4 D)', '4 Chlorotoluene', "4,4'-DDD", "4,4'-DDE", "4,4'-DDT", 'Acetaminophen ', 'Alachlor', 'Albuterol', 'Aldicarb', 'Aldicarb Sulfone', 'Aldicarb sulfoxide', 'Alpha-Benzene Hexachloride (Alpha-BHC)', 'Aluminum', 'Ammonia', 'Anion/Cation Balance', 'Antimony', 'Arsenic', 'Atrazine', 'Azinphos Ethyl', 'Barium', 'Bensulfuron Methyl', 'Bentazon', 'Benzene', 'Benzo(a)pyrene', 'Beryllium', 'Beta-Benzene Hexachloride (Beta- BHC)', 'Bicarbonate Alkalinity', 'Boron', 'Bromacil', 'Bromate', 'Bromide', 'Bromodichloromethane (THM)', 'Bromoform (THM)', 'Cadmium', 'Calcium', 'Carbamazepine ', 'Carbaryl (1-naphthyl methylcarbamate)', 'Carbofuran', 'Carbon 14', 'Carbon Disulfide', 'Carbon Tetrachloride', 'Chlorate', 'Chlordane', 'Chloride', 'Chlorite', 'Chlorobenzene', 'Chloroform (THM)', 'Chloropicrin', 'Chorothalonil', 'Chromium', 'Chromium, Hexavalent (Cr6)', 'cis-1,2 Dichloroethylene', 'Cobalt', 'Codeine ', 'Copper', 'Cotinine ', 'Cyanazine', 'Cyanide (CN)', 'Cypermethrin', 'd-18O in Water', 'Dacthal', 'Dacthalmonoacid', 'Dalapon', 'Deethylatrazine', 'Dehydronifedipine ', 'Deisopropyl Atrazine', 'Deuterium', 'Di(2-ethylhexyl)adipate', 'Di(2-ethylhexyl)phthalate (DEHP)', 'Diazinon', 'Dibromochloromethane (THM)', 'Dicamba', 'Dichlorodifluoromethane', 'Dichloromethane (Methylene Chloride)', 'Dichlorprop', 'Dichlorvos (DDVP)', 'Dicofol', 'Dieldrin', 'Diltiazem', 'Dimethoate', 'Dinoseb', 'Diphenhydramine ', 'Diquat', 'Dissolved Oxygen (DO)', 'Dissolved Oxygen, Percent Saturation  ', 'Diuron', 'Electrical Conductivity', 'Endosulfan I', 'Endosulfan II', 'Endosulfan Sulfate', 'Endothall', 'Endrin', 'Endrin Aldehyde', 'EPTC', 'Ethyl tertiary butyl ether (ETBE)', 'Ethylbenzene', 'Ethylene glycol', 'Fecal Coliform (bacteria)', 'Fenamiphos', 'Fluoride', 'Foaming Agents (MBAS)', 'Fonofos', 'Formaldehyde', 'Glyphosate (Round-up)', 'Gross Alpha radioactivity', 'Gross beta', 'Guthion (Azinphos Methyl)', 'Heptachlor', 'Heptachlor Epoxide', 'Hexachlorobenzene (HCB)', 'Hexachlorobutadiene', 'Hexachlorocyclopentadiene', 'Hexazinone', 'Iodide', 'Iprodione', 'Iron', 'Isopropylbenzene ( Cumene)', 'Lead', 'Lindane (Gamma-BHC) ', 'Linuron', 'Lithium', 'Magnesium', 'Malathion', 'Manganese', 'Mercury', 'Metalaxyl', 'Methomyl', 'Methoxychlor', 'Methyl Bromide (Bromomethane)', 'Methyl Iodide', 'Methyl Isobutyl Ketone (MIBK)', 'Metolachlor', 'Metribuzin', 'Molinate', 'Molybdenum', 'MTBE (Methyl-tert-butyl ether)', 'n-Butylbenzene', 'N-Nitrosodi-N-Propylamine (NDPA)', 'N-Nitrosodiethylamine (NDEA)', 'N-Nitrosodimethylamine (NDMA)', 'n-Propylbenzene (Isocumene)', 'Naled', 'Naphthalene', 'Napropamide', 'Nickel', 'Nitrate as NO3', 'Nitrite as N', 'Norflurazon', 'Octogen (HMX)', 'orthophosphate', 'Oxamyl', 'Oxyfluorfen', 'Parathion', 'PCNB', 'Pentachlorophenol (PCP)', 'Perchlorate', 'Permethrin', 'pH', 'Phorate', 'Picloram', 'Polychlorinated Biphenyls (PCBs)', 'Potassium', 'Prometon', 'Prometryn', 'Propachlor (2-Chloro-N-isopropylacetanilide)', 'Propanil', 'Propargite', 'Radium 226', 'Radium 228', 'Radon 222', 'RDX (hexahydro-1,3,5-trinitro-1,3,5-triazine)', 'sec-Butylbenzene', 'Selenium', 'Silver', 'Simazine', 'Sodium ', 'Strontium', 'Strontium 90', 'Styrene', 'Sulfamethoxazole  ', 'Sulfate', 'tebuthiuron', 'Temperature', 'tert-Butyl alcohol (TBA)', 'tert-Buytlbenzene', 'Tertiary amyl methyl ether', 'Tetrachloroethene (PCE)', 'Thallium', 'Thiabendazole', 'Thiobencarb', 'Toluene', 'Total Coliform Bacteria', 'Total Dissolved Solids', 'Total Organic Carbon', 'Total Trihalomethanes ', 'Toxaphene', 'trans-1,2, Dichloroethylene', 'Trichloroethene (TCE)', 'Trichlorofluoromethane (Freon 11)', 'Trichlorpyr', 'Trifluralin', 'Trimethoprim', 'Tritium (Hydrogen-3)', 'Tungsten', 'Uranium', 'Vanadium', 'Vinyl Chloride', 'Warfarin ', 'Xylenes (total)', 'Zinc')
base = "../CR6Data/counties/"

reformatDateAndId <-function(d, oldDatesName, oldDatesFormat, siteIDsName, wellIDsName){
  d$newdate <- strptime(as.character(d[, oldDatesName]), oldDatesFormat)
  d$date=format(d$newdate, "%Y-%m-%d")
  d$yearmonth=format(d$newdate, "%Y-%m")
  d$year=format(d$newdate, "%Y")
  d$MID=do.call(paste, c(d[c("yearmonth", siteIDsName, wellIDsName)], sep = " "))
  d$WID = do.call(paste, c(d[c(siteIDsName, wellIDsName)], sep = " "))
  return(d)
}

base = "../CR6Data/counties/"


getCountyChem <- function(base, county, basechem, datasets=c()){
  d=read.csv(paste(base, county, "/raw/", basechem, ".csv", sep=""), sep="\t", header=T)
  if(length(datasets != 0)){
    d = d[d$DATASET %in% datasets, ]
  }
  d[, basechem]=d$RESULT
  d=reformatDateAndId(d, "DATE", "%m/%d/%Y", "WELL.ID", "WELL.NAME")
  d=d[, c("MID","WID", "WELL.ID", "WELL.NAME", basechem, "date", "APPROXIMATE.LATITUDE", "APPROXIMATE.LONGITUDE")]
  d=d[!duplicated(d$MID), ]
  d=d[order(d$MID), ]
  return(d)
}


addChemical <-function(d, base, county, chem, complete){
  dnewchem=read.csv(paste(base,county, "/raw/", chem, ".csv", sep=""), sep="\t", header=T)
  if(nrow(dnewchem)==0){
    print("this county does not have data for this chemical")
    if(!complete)
      d[, chem]=NA
    return(d)
  }
  dnewchem[, chem]=dnewchem$RESULT
  dnewchem=reformatDateAndId(dnewchem, "DATE", "%m/%d/%Y", "WELL.ID", "WELL.NAME")
  dnewchem=dnewchem[, c("MID", chem)]
  dnewchem=dnewchem[!duplicated(dnewchem$MID), ]
  return(merge(x = d, y = dnewchem, by = "MID", all.x=!complete))
}

addDepth <-function(d, base, county, complete){
  depth=read.csv(paste(base,county, "/raw/GEOWell.csv", sep=""), sep="\t", header=T)
  if(nrow(depth)==0){
    print("this county does not have depth data")
    d[, "Z"]=NA
    return(d)
  }
  depth=reformatDateAndId(depth, "GW_MEAS_DATE", "%Y-%m-%d", "GLOBAL_ID", "FIELD_POINT_NAME")
  depth=depth[!duplicated(depth$MID), ]
  depth=depth[, c("MID", "DTW")]
  return(merge(x = d, y = depth, by = c("MID"), all.x=!complete))
}

getAll<-function(base, counties, chems, basechem, getDepth, complete, datasets=c()){
  d=NULL
  for(county in counties){
    #print(county)
    dt=getCountyChem(base, county, basechem, datasets)
    if(nrow(dt)==0){
      #print("no basechem")
      next
    }
    for(chem in chems){
      print(chem)
      if(chem==basechem)
        next 
      dt=addChemical(dt,base, county, chem, complete )
    }
    if(getDepth)
      dt=addDepth(dt, base, county, complete)
    if(nrow(dt)>0){
      dt$county=county
      if(is.null(d)){
        d=dt
      }else{
        d=rbind(d, dt)
      }
    }
    
  }
  
  #Now give every well belonging to the same site the same location
  #dg = d[, c("WELL.ID", "APPROXIMATE.LATITUDE", "APPROXIMATE.LONGITUDE" )]
  #dg= dg[!duplicated(dg$WELL.ID), ]
  #d$APPROXIMATE.LATITUDE = NULL
  #d$APPROXIMATE.LONGITUDE = NULL
  #d2 = merge(x = d, y = dg, by = c("WELL.ID"), all.x=TRUE)
  
  return(d)
}


