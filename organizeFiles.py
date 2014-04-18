import os

counties=['Alameda', 'Alpine', 'Amador', 'Butte', 'Calaveras', 'Colusa', 'ContraCosta', 'DelNorte', 'ElDorado', 'Fresno', 'Glenn', 'Humboldt', 'Imperial', 'Inyo', 'Kern', 'Kings', 'Lake', 'Lassen', 'LosAngeles', 'Madera', 'Marin', 'Mariposa', 'Mendocino', 'Merced', 'Modoc', 'Mono', 'Monterey', 'Napa', 'Nevada', 'Orange', 'Placer', 'Plumas', 'Riverside', 'Sacramento', 'SanBenito', 'SanBernardino', 'SanDiego', 'SanFrancisco', 'SanJoaquin', 'SanLuisObispo', 'SanMateo', 'SantaBarbara', 'SantaClara', 'SantaCruz', 'Shasta', 'Sierra', 'Siskiyou', 'Solano', 'Sonoma', 'Stanislaus', 'Sutter', 'Tehama', 'Trinity', 'Tulare', 'Tuolumne', 'Ventura', 'Yolo', 'Yuba']



from os import listdir
from os.path import isfile, join

for c in counties:
	print c

	#os.system("mkdir ../CR6Data/counties/"+c);
	#os.system("cp ../CR6Data/datadump/"+c+"* ../CR6Data/counties/"+c)
	#os.system("cp ../CR6Data/datadump/"+c.upper()+"* ../CR6Data/counties/"+c)
	onlyfiles = [ f for f in listdir("../CR6Data/counties/"+c+"/") if isfile(join("../CR6Data/counties/"+c+"/",f)) ]
	os.system("mkdir ../CR6Data/counties/"+c+"/raw");
	os.system("mkdir ../CR6Data/counties/"+c+"/clean");
	for fn in onlyfiles:
		os.system("mv ../CR6Data/counties/"+c+"/"+fn+" ../CR6Data/counties/"+c+"/raw/"+fn)


"""
		if c.upper() in fn:
			chem = fn.split("_")[1].split(".")[0]
			#print chem
			 
			#os.system("mv ../CR6Data/counties/"+c+"/"+fn+" ../CR6Data/counties/"+c+"/"+chem+".csv")
		if c in fn:
			typ=fn.split(c)[1].split(".")[0]
			#os.system("mv ../CR6Data/counties/"+c+"/"+fn+" ../CR6Data/counties/"+c+"/"+typ+".csv")

"""
