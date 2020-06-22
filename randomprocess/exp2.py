import numpy as np
import matplotlib.pyplot as plt


f = open('C:/Users/User/Desktop/exp2_001.txt','r')

lines = f.readlines()

a=[]
b=[]
c=[]
d=[]
index = 0

for line in lines:
    a.append(line.split())

for i in a:
    b.append(float(i[0]))
    c.append(float(i[1]))
    d.append(float(i[2]))
    index += 1


x = np.correlate(b,c,'full')
x = np.array(x).tolist()
y = np.correlate(c,d,'full')
z = np.correlate(b,d,'full')
#print(x)
print(len(x))
'''
print(max(x))
print(np.where(x==max(x)))
print(y)
print(len(y))
print(max(y))
print(np.where(y==max(y)))
print(z)
print(len(z))
print(max(z))
print(np.where(z==max(z)))
'''
t=[]
for i in range(len(x)):
    t.append((-len(x)-1)/2+i)
print(t)
plt.plot(t,x)
#plt.axis([-len(x),len(x),0,50])
plt.show()