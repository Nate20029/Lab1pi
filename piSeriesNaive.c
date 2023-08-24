#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <omp.h> 

void Usage(char* prog_name);

int main(int argc, char* argv[]) {
   long long n, k;
   int thread_count;
   double factor = 1.0;
   double sum = 0.0;
   double start, finish; // Variables para medición de tiempo

   thread_count = strtol(argv[1], NULL, 10);
   n = strtoll(argv[2], NULL, 10);

   start = omp_get_wtime(); // Inicio de la medición del tiempo

#  pragma omp parallel for num_threads(thread_count) \
      reduction(+: sum)
   for (k = 0; k < n; k++) { 
      sum += factor/(2*k+1);
      factor = -factor;
   }

   sum = 4.0*sum;
   finish = omp_get_wtime(); // Fin de la medición del tiempo

   printf("With n = %lld terms and %d threads,\n", n, thread_count);
   printf("   Our estimate of pi = %.14f\n", sum);
   printf("                   PI = %.14f\n", 4.0*atan(1.0));
   printf("Elapsed time = %e seconds\n", finish - start); // Muestra el tiempo transcurrido

   return 0;
}  /* main */
