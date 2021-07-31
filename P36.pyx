cpdef unsigned solve(unsigned target):
  cdef unsigned i, j, total = 0
  cdef bin = [0]

  for i in range(1, target):
    for j in range(len(bin)):
      if bin[j] == 0:
        bin[j] = 1
        break
      else:
        bin[j] = 0
    if bin[-1] == 0:
      bin.append(1)

    if bin == bin[::-1] and str(i) == str(i)[::-1]:
      total += i

  return total