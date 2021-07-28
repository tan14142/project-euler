from libc.stdlib cimport calloc, malloc, free

def solve(int target):
  cdef int coins[8], coin, i
  cdef int* mem = <int*> calloc(target + 1, (target + 1) * sizeof(int))

  coins = [1, 2, 5, 10, 20, 50, 100, 200]

  if not mem:
    raise MemoryError()

  mem[0] = 1

  try:
    for coin in coins:
      for i in range(coin, target + 1):
        mem[i] += mem[i - coin]

    return mem[target]
  finally:
    free(mem)