with open("/Users/bholley/Desktop/Academics/CR6/clean/allChems.csv") as f:
    m=f.readlines()
    items=m[0].split(",")[7:-1]
    print items
    with open("/Users/bholley/Desktop/Academics/CR6/clean/items.csv", "w") as f1:
    	for i in range(1, len(m)):
    		bstr=""
    		basket=m[i].split(",")[7:-1]
    		for i in range(0, 233):
    			if basket[i] != "NA":
    				bstr=bstr+" "+items[i]
    		print bstr
    		if len(bstr)>0:
    			f1.write(bstr+'\n')
    	