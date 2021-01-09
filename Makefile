create-data:
	python createData.py

all: seq mpi diff

seq:
	python apyori.py 
mpi:
	srun -n2 python apyoriMpi.py 
diff:
	diff ./correct_output.dump ./mpi_output.dump

profile:
	python -m cProfile -s time apyori.py 

time:
	srun -n2 time python apyoriMpi.py 
	time python apyori.py
