#/usr/bin/python3

import os
import sys
import pickle
from string import capwords
file_name = 'barcodes'
p={}
with open(file_name, encoding='utf-8') as f:
    
 for line in f:
  s = line.split('*',1)
  p[s[0]] = capwords(s[1])

print(sorted(p))  
pickle.dump(p,open('products.p','wb'))
        
