from math import log10

cpdef unsigned solve():
  cdef i = 1, ln = 1, n, result = 1
  dx = [10, 100, 1000, 10000, 100000, 1000000]

  while len(dx):
    n = dx.pop(0)

    while ln < n:
      i += 1
      ln += int(log10(i)) + 1

    result *= i // 10**(ln - n) % 10

  return result