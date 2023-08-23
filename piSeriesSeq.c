
#include <stdio.h>
#include <stdlib.h>
#include <math.h>


int main(int argc, char* argv[]) {
   long long n, k;
   int thread_count;
   double factor = 1.0;
   double sum = 0.0;

   n = strtoll(argv[1], NULL, 10);

   for (k = 0; k < n; k++) { 
      sum += factor/(2*k+1);
	  factor = -factor;
   }

   sum = 4.0*sum;
   printf("With n = %lld terms \n", n);
   printf("   Our estimate of pi = %.14f\n", sum);
   printf("                   PI = %.14f\n", 4.0*atan(1.0));

   return 0;
}  /* main */

