// PWR039: Consider loop interchange to improve the locality of reference and
// enable vectorization

void matmul(int n, const double *A, const double *B, double *C) {
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      for (int k = 0; k < n; k++) {
        C[i * n + j] += A[i * n + k] * B[k * n + j];
      }
    }
  }
}
