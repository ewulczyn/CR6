
from operator import itemgetter

def genCandidates(l):
	c_k=set()
	for i in l:
		for j in l:
			if i[:-1]==j[:-1] and i[-1]!=j[-1]:
				c=list(i[:-1])
				if(i[-1]>j[-1]):
					c.append(j[-1])
					c.append(i[-1])
				else:
					c.append(i[-1])
					c.append(j[-1])
				c_k.add(' '.join(c))
	return c_k



def subset(t, ck, k):
	sets=[]
	allCombinations(sets,[], t, k)
	ct=[s for s in sets if ' '.join(s) in ck]
	return ct


def allCombinations(sets, curr, options, k):
	s=len(curr)
	if s==k:
		sets.append(curr)
	else:
		for i in range(0, len(options) -(k-s)+1):
			new=list(curr)
			new.append(options[i])
			allCombinations(sets, new, options[(i+1):], k)




fname = "items.csv"

minsup=1000

bsize=6

ls=[[] for i in range(bsize)]
counts=[{} for i in range(bsize)]
confs = [[] for i in range(bsize-1)]

with open(fname) as f:
    for line in f:
    	items=line[:-2].split(" ")
    	print items
    	for item in items:
    		counts[0][item]=counts[0].get(item,0)+1

ls[0]=[[k] for k in counts[0].keys() if counts[0][k]>=minsup]
print ls[0]


for k in :
	ck = genCandidates(ls[k-2])
	with open(fname) as f:
	    for line in f:
	    	t=line[:-2].split(" ")
	    	t.sort()
	    	c_t = subset(t, ck, k)
	    	for item in c_t:
	    		string_item=' '.join(item)
	    		counts[k-1][string_item]=counts[k-1].get(string_item,0)+1;
	ls[k-1]=[ke.split(' ') for ke in counts[k-1].keys() if counts[k-1][ke]>=minsup]
	print k
	print ls[k-1]
	print counts[k-1]



for k in [2, 3,4]:
	l=ls[k-1]
	for itemset in l:
		for x in range(0, k):
			B=[itemset[x]]
			A=list(itemset)
			del A[x]
			suppAB=float(counts[k-1][' '.join(itemset)])
			suppA=counts[k-2][' '.join(A)]
			conf = (suppAB/suppA, ' '.join(A)+"->"+' '.join(B)) 
			confs[k-2].append(conf)

confs[0].sort(key=itemgetter(1))
confs[1].sort(key=itemgetter(1))
confs[0].sort(key=itemgetter(0), reverse=True)
confs[1].sort(key=itemgetter(0), reverse=True)

print confs[0]

for i in range(5):
	print confs[0][i]

for i in range(5):
	print confs[1][i]






   
