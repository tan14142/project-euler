cpdef unsigned solve():
  cdef unsigned digit, digits, m1, m2, prod
  cdef unsigned estimate = 5
  cdef unsigned max = 9876
  prods = set()

  for m1 in range(1, max // estimate):
    for m2 in range(1, max // estimate):
      prod = m1 * m2

      if prod > max:
        break

      digits = concat(concat(m1, m2), prod)

      if 123456789 <= digits <= 987654321:
        pd = set()

        while digits > 0:
          digit = digits % 10
          digits /= 10

          if digit == 0:
            break
          pd.add(digit)
        
        if len(pd) == 9:
          prods.add(prod)

  return sum(prods)

cpdef unsigned concat(unsigned x, unsigned y):
  cdef unsigned pow = 10
  while y >= pow:
    pow *= 10
  return x * pow + y