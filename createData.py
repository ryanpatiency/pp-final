import math
import numpy as np

lines = 10000
max_item_num = 20
size = np.random.randint(1, 20, size=(lines, ))
trans = np.arange(max_item_num)

res = []


for i in range(lines):
    np.random.shuffle(trans)
    res.append(trans[:size[i]].copy())

with open('data.txt', 'w') as fp:
    for ele in res:
        line = ','.join([str(e) for e in ele])
        fp.write(line+'\n')
