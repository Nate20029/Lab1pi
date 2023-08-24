CC = gcc
CFLAGS = -g -Wall -fopenmp
PROG = piSeriesNaivePolitics
OBJS = piSeriesNaivePolitics.o
CORES = 4  # Puedes ajustar este número al número de núcleos que desees usar
OUTFILE = results.txt

all: $(PROG)

$(PROG): $(OBJS)
	$(CC) $(CFLAGS) -o $(PROG) $(OBJS) -lm

$(OBJS): piSeriesNaivePolitics.c
	$(CC) $(CFLAGS) -c piSeriesNaivePolitics.c

test: $(PROG)
	echo "Testing with $(CORES) cores" > $(OUTFILE)

	echo "Static, 16" >> $(OUTFILE)
	set OMP_SCHEDULE=static,16 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=static,16 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=static,16 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=static,16 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=static,16 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	echo "Static, 64" >> $(OUTFILE)
	set OMP_SCHEDULE=static,64 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=static,64 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=static,64 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=static,64 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=static,64 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	echo "Static, 128" >> $(OUTFILE)
	set OMP_SCHEDULE=static,128 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=static,128 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=static,128 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=static,128 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=static,128 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	echo "Dynamic, 16" >> $(OUTFILE)
	set OMP_SCHEDULE=dynamic,16 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=dynamic,16 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=dynamic,16 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=dynamic,16 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=dynamic,16 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	echo "Dynamic, 64" >> $(OUTFILE)
	set OMP_SCHEDULE=dynamic,64 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=dynamic,64 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=dynamic,64 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=dynamic,64 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=dynamic,64 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	echo "Dynamic, 128" >> $(OUTFILE)
	set OMP_SCHEDULE=dynamic,128 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=dynamic,128 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=dynamic,128 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=dynamic,128 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=dynamic,128 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	echo "Guided, 16" >> $(OUTFILE)
	set OMP_SCHEDULE=guided,16 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=guided,16 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=guided,16 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=guided,16 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=guided,16 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	echo "Guided, 64" >> $(OUTFILE)
	set OMP_SCHEDULE=guided,64 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=guided,16 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=guided,16 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=guided,16 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=guided,16 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	echo "Guided, 128" >> $(OUTFILE)
	set OMP_SCHEDULE=guided,128 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=guided,128 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=guided,128 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=guided,128 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=guided,128 && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	echo "Auto" >> $(OUTFILE)
	set OMP_SCHEDULE=auto && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=auto && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=auto && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=auto && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)
	set OMP_SCHEDULE=auto && .\\$(PROG) $(CORES) 10000000 >> $(OUTFILE)


clean:
	del *.o $(PROG).exe

alt: 
	