#include <stddef.h>
#include <stdint.h>

/* The caller supplies valid arrays; row copy preserves ordinary overlap order. */
void copy_row(double *a, const double *b, size_t i, size_t n) {
    for (size_t j = 0; j < n; ++j)
        a[i * n + j] = b[j];
}

/* Unsigned arithmetic has defined modulo-2^64 semantics. */
uint64_t times16(uint64_t x) { return x * UINT64_C(16); }
uint64_t common(uint64_t x, uint64_t y) {
    return (x + y) * (x + y + UINT64_C(1));
}
uint64_t sum_serial(const uint64_t *a, size_t n) {
    uint64_t x = 0;
    for (size_t i = 0; i < n; ++i) x += a[i];
    return x;
}
uint64_t sum_two(const uint64_t *a, size_t n) {
    uint64_t x0 = 0, x1 = 0;
    size_t i = 0;
    for (; n - i >= 2; i += 2) {
        x0 += a[i];
        x1 += a[i + 1];
    }
    if (i < n) x0 += a[i];
    return x0 + x1;
}
uint64_t dot_two(const uint64_t *a, const uint64_t *b, size_t n) {
    uint64_t x0 = 0, x1 = 0;
    size_t i = 0;
    for (; n - i >= 2; i += 2) {
        x0 += a[i] * b[i];
        x1 += a[i + 1] * b[i + 1];
    }
    if (i < n) x0 += a[i] * b[i];
    return x0 + x1;
}

/* a, b, c are disjoint n*n arrays; c is zeroed by the caller; tile > 0. */
void matmul_blocked(const double *a, const double *b, double *c,
                    size_t n, size_t tile) {
    if (tile == 0) return;
    for (size_t ii = 0; ii < n; ) {
        size_t ie = n - ii < tile ? n : ii + tile;
        for (size_t jj = 0; jj < n; ) {
            size_t je = n - jj < tile ? n : jj + tile;
            for (size_t kk = 0; kk < n; ) {
                size_t ke = n - kk < tile ? n : kk + tile;
                for (size_t i = ii; i < ie; ++i)
                    for (size_t j = jj; j < je; ++j)
                        for (size_t k = kk; k < ke; ++k)
                            c[i*n+j] += a[i*n+k] * b[k*n+j];
                kk = ke;
            }
            jj = je;
        }
        ii = ie;
    }
}
