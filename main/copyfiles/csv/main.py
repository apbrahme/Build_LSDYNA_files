import subprocess

# EPS XX, YY, ZZ = 57, 58, 59
# EPS XY, YZ, ZX = 60, 61, 62
# SIG XX, YY, ZZ =  1,  2,  3
# SIG XY, YZ, ZX =  4,  5,  6
itr = 't1'
par = ['e1','e2','e3','s1','s2','s3']
ppe = ['57','58','59','01','02','03']

def main():
	f = open('CSVget','w')
	f.write('bgstyle plain\n')
	f.write('openc d3plot "../d3plot"\n')
	f.write('ac\n\n')

	f.write('genselect target element\n')
	f.write('top\n')
	f.write('ac\n')	
	f.write('genselect whole\n\n')

	for i in range(len(par)):
		f.write('etime %s\n' %ppe[i])
		f.write('xyplot 1 operation average_curves all\n')
		f.write('xyplot 1 title none\n')
		f.write('xyplot 1 savefile ms_csv "./data_%s_%s.csv" 1 all\n' %(par[i],str(itr)))
		f.write('deletewin 1\n')
		f.write('\n')
	
	f.write('exit')
	f.close()
	print('Created prepost command file: CSVget\n')

	cp = 'cat ../deck.f  > ./data_' + str(itr)
	subprocess.call(cp,shell=True)
	print('Copied crystal plasticity parameter file\n')
	
	print('Executing prepost...')
	subprocess.call('./run.sh CSVget',shell=True)

	print('Create xy file')
	exec(open('plot.py').read())

if __name__ == "__main__":
	main()

