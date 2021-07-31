from libc.math cimport sqrt
from libc.stdlib cimport malloc

cdef calc_right_truncatable_primes(left, bint* sieve):
  cdef odd = ['1', '3', '5', '7', '9']
  cdef primes = []

  for right in odd:
    attempt = left + right
    
    if sieve[int(attempt)]:
      primes.append(attempt)

  return primes

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

cdef bint is_left_truncatable_prime(prime, bint* sieve):
  for i in range(1, len(prime)):
    if sieve[int(prime[i:])] == False:
      return False

  return True

cpdef unsigned solve(unsigned bound):
  cdef bint* sieve = calc_sieve(bound)
  cdef unsigned cnt = 0
  cdef unsigned total = 0
  cdef queue = ['2', '3', '5', '7']

  while cnt < 11:
    rt_primes = calc_right_truncatable_primes(queue.pop(0), sieve)
    queue += rt_primes

    for prime in rt_primes:
      if is_left_truncatable_prime(prime, sieve):
        cnt += 1
        total += int(prime)

  return total