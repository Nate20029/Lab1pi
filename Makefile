CC = gcc
CFLAGS = -g -Wall -fopenmp

all: piSeriesAlt piSeriesNaivePolitics

piSeriesAlt: piSeriesAlt.c
	$(CC) $(CFLAGS) -o piSeriesAlt piSeriesAlt.c -lm

piSeriesNaivePolitics: piSeriesNaivePolitics.c
	$(CC) $(CFLAGS) -o piSeriesNaivePolitics piSeriesNaivePolitics.c -lm

test: piSeriesAlt piSeriesNaivePolitics
	(set OMP_SCHEDULE=static,64 && piSeriesAlt 4 10000000 > piSeriesNaive_results.txt)
	(set OMP_SCHEDULE=static,64 && piSeriesNaivePolitics 4 10000000 > piSeriesNaivePolitics_results.txt)
	(set OMP_SCHEDULE=static,64 && piSeriesAlt 4 10000000 >> piSeriesNaive_results.txt)
	(set OMP_SCHEDULE=static,64 && piSeriesNaivePolitics 4 10000000 >> piSeriesNaivePolitics_results.txt)
	(set OMP_SCHEDULE=static,64 && piSeriesAlt 4 10000000 >> piSeriesNaive_results.txt)
	(set OMP_SCHEDULE=static,64 && piSeriesNaivePolitics 4 10000000 >> piSeriesNaivePolitics_results.txt)
	(set OMP_SCHEDULE=static,64 && piSeriesAlt 4 10000000 >> piSeriesNaive_results.txt)
	(set OMP_SCHEDULE=static,64 && piSeriesNaivePolitics 4 10000000 >> piSeriesNaivePolitics_results.txt)
	(set OMP_SCHEDULE=static,64 && piSeriesAlt 4 10000000 >> piSeriesNaive_results.txt)
	(set OMP_SCHEDULE=static,64 && piSeriesNaivePolitics 4 10000000 >> piSeriesNaivePolitics_results.txt)

