CC = gcc
CFLAGS = -g -Wall -fopenmp -O2  # -O2 Optimizacion del inciso b

all: piSeriesAlt piSeriesNaivePolitics

piSeriesAlt: piSeriesAlt.c
	$(CC) $(CFLAGS) -o piSeriesAlt piSeriesAlt.c -lm

piSeriesNaivePolitics: piSeriesNaivePolitics.c
	$(CC) $(CFLAGS) -o piSeriesNaivePolitics piSeriesNaivePolitics.c -lm

test: piSeriesAlt
	(set OMP_SCHEDULE=static,64 &&  piSeriesAlt 4 10000000 > best_version_results_optimizado.txt)
	(set OMP_SCHEDULE=static,64 &&  piSeriesAlt 4 10000000 >> best_version_results_optimizado.txt)
	(set OMP_SCHEDULE=static,64 &&  piSeriesAlt 4 10000000 >> best_version_results_optimizado.txt)
	(set OMP_SCHEDULE=static,64 &&  piSeriesAlt 4 10000000 >> best_version_results_optimizado.txt)
	(set OMP_SCHEDULE=static,64 &&  piSeriesAlt 4 10000000 >> best_version_results_optimizado.txt)
