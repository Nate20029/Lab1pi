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
   double start_time, end_time;

   if (argc != 3) {
      Usage(argv[0]);
      return 1;
   }

   thread_count = strtol(argv[1], NULL, 10);
   n = strtoll(argv[2], NULL, 10);

   start_time = omp_get_wtime();

#  pragma omp parallel for num_threads(thread_count) \
      reduction(+: sum)
   for (k = 0; k < n; k++) { 
      factor = (k % 2 == 0) ? 1.0 : -1.0;
      sum += factor / (2.0 * k + 1);
   }

   end_time = omp_get_wtime();

   sum = 4.0 * sum;
   printf("With n = %lld terms and %d threads,\n", n, thread_count);
   printf("   Our estimate of pi = %.14f\n", sum);
   printf("                   PI = %.14f\n", 4.0 * atan(1.0));

   double actual_pi = 4.0 * atan(1.0);
   double error = fabs(actual_pi - sum);
   printf("   Error = %.14f\n", error);

   double elapsed_time = end_time - start_time;
   printf("   Elapsed time = %f seconds\n", elapsed_time);

   double sequential_time = elapsed_time / thread_count;
   double parallel_time = elapsed_time;
   
   double speedup = sequential_time / parallel_time;
   printf("   Speedup = %.2f\n", speedup);

   double efficiency = speedup / thread_count;
   printf("   Efficiency = %.2f%%\n", efficiency * 100);

   double strong_scalability = sequential_time / (thread_count * parallel_time);
   printf("   Strong Scalability = %.2f\n", strong_scalability);

   double weak_scalability = (sequential_time * thread_count) / parallel_time;
   printf("   Weak Scalability = %.2f\n", weak_scalability);

   return 0;
}

void Usage(char* prog_name) {
   fprintf(stderr, "Usage: %s <thread_count> <n>\n", prog_name);
   fprintf(stderr, "   thread_count is the number of threads\n");
   fprintf(stderr, "   n is the number of terms of the series to use\n");
}
