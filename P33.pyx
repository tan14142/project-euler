from cpython cimport bool

cpdef unsigned solve():
  cdef unsigned num, den, n_prod = 1, d_prod = 1

  for num in range(10, 100):
    for den in range(num + 1, 100):
      if is_curious_fraction(num, den):
        n_prod *= num
        d_prod *= den

  return d_prod // n_prod

cpdef bool is_curious_fraction(unsigned num, unsigned den):
  if num % 10 == 0 or den % 10 == 0:
    return False
  return num % 10 == den // 10 and num / den == (num // 10) / (den % 10)