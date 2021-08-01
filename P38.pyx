cdef bint is_pandigital(s):
  if '0' in s:
    return False

  for k, digit in enumerate(s[:-1]):
    if digit in s[k + 1:]:
      return False
  return True

cpdef unsigned solve():
  cdef unsigned i, j

  for i in range(9234, 19000 // 2 - 100):
    attempt = str(i) + str(i * 2)

    if is_pandigital(attempt):
      result = attempt

  return int(result)