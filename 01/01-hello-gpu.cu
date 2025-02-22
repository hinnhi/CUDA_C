#include <stdio.h>

void helloCPU()
{
  printf("Hello from the CPU.\n");
}

// __global__ keyword indicates that the following function will run on the GPU
__global__ void helloGPU()    
{
  printf("Hello also from the CPU.\n");
}

int main()
{
  helloCPU();

  helloGPU<<<1,1>>>();    // 1 block of 1 thread
  cudaDeviceSynchronize();    // will cause the host code (CPU) to wait until the device code (GPU) completes
}
