import subprocess
from main import itr, par, ppe

for i, parameter in enumerate(par):
	data = []; 
	fileName = 'data_' + parameter + '_' + str(itr) + '.csv'
	print('Filename for parameter %s = %s' %(parameter, fileName))
	with open(fileName) as f:
		for line in f:
			read = line.strip().split(',')[:-1]
			data.append( float(read[1]) )

	outFile = 'out_' + parameter + '_' + str(itr)
	f = open(outFile, 'w')
	for i in range(len(data)):
		f.write("%15.6f \n" % data[i])
	f.close()

plot = 'paste '
for i in range(len(par)):
	plot = plot + 'out_' + par[i] + '_' + str(itr) + ' '
subprocess.call(plot, shell=True)
plot = plot + ' > xy_' + str(itr)
subprocess.call(plot, shell=True)
	
for i, parameter in enumerate(par):
	outFile = 'out_' + parameter + '_' + str(itr)
	subprocess.call('rm ' + outFile, shell=True)
