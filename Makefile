P=2
create-data:
	python createData.py

all: seq mpi dyn diff

seq:
	python apyori.py 
mpi:
	srun -n${P} python apyoriMpi.py 
dyn:
	srun -n${P} python dynamic_apyori.py 

diff:
	diff ./correct_output.dump ./mpi_output.dump
	diff ./correct_output.dump ./dyn_mpi_output.dump

profile:
	python -m cProfile -s time apyori.py 

time:
	time python apyori.py
	srun -n${P} time python apyoriMpi.py 
	srun -n${P} time python dynamic_apyori.py  

clean:
	rm -f ./correct_output.dump ./mpi_output.dump ./dyn_mpi_output.dump