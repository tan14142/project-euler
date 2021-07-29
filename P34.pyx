from cpython cimport bool
from libc.stdlib cimport malloc

cdef unsigned i
cdef unsigned* factorials = <unsigned*> malloc(10 * sizeof(unsigned))

factorials[0] = 1
factorials[1] = 1

for i in range(2, 10):
  factorials[i] = i * factorials[i - 1]

cpdef unsigned solve():
  cdef unsigned i, s = 0

  for i in range(10, factorials[9] * 7):
    if is_equal_sum_of_factorial(i):
      s += i
  
  return s

cpdef bool is_equal_sum_of_factorial(unsigned num):
  cdef unsigned d, n = num, s = 0

  while n > 0:
    d = n % 10
    n //= 10
    s += factorials[d]

  return num == s