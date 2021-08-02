cpdef unsigned solve(unsigned target):
  cdef unsigned a, p, p3, cnt, max = 0, maxp

  for p in range(4, target, 2):
    cnt = 0
    p3 = p // 3

    for a in range(1, p3):
        if 0 == (p*(p - 2*a)) % (2*(p - a)):
          cnt += 1

    if cnt > max:
      max = cnt
      maxp = p

  return maxp