from libc.math cimport sqrt
from libc.stdlib cimport malloc

cdef unsigned calc_len(unsigned n):
  cdef unsigned ln = 1, num = n

  while num > 10:
    ln += 1
    num //= 10

  return ln

cdef bint* calc_sieve(unsigned size):
  cdef unsigned i, j, size_sqrt = <unsigned> sqrt(size)
  cdef bint* sieve = <bint*> malloc(size * sizeof(bint))

  for i in range(1, size):
    sieve[i] = True

  sieve[0] = False
  sieve[1] = False

  for i in range(2, size_sqrt):
    if sieve[i]:
      for j in range(i * i, size, i):
        sieve[j] = False
  
  return sieve

cdef unsigned* calc_split(unsigned n, unsigned ln):
  cdef unsigned i, lg = 10 ** (ln - 1)
  cdef unsigned* digits = <unsigned*> malloc(ln * sizeof(unsigned))

  for i in range(ln):
    digits[i] = n // lg
    n -= lg * digits[i]
    lg //= 10
  
  return digits

cdef unsigned concat(unsigned x, unsigned y):
  cdef unsigned pow = 10

  while y >= pow:
    pow *= 10

  return x * pow + y

cdef bint is_circular_prime(unsigned n, bint* sieve):
  cdef unsigned i, j, k, t, ln = calc_len(n)
  cdef unsigned* digits = calc_split(n, ln)

  for i in range(ln):
    t = digits[i]

    for j in range(i + 1, ln + i):
      k = j if j < ln else j - ln
      t = concat(t, digits[k])

    if not sieve[t]:
      sieve[n] = False
      return False

  return True

cpdef unsigned solve(unsigned target):
  cdef bint* sieve = calc_sieve(target)
  cdef unsigned i, total = 0

  for i in range(target):
    if sieve[i] and is_circular_prime(i, sieve):
      total += 1
  
  return total