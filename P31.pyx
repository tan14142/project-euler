from libc.stdlib cimport calloc, malloc, free

def solve(int target):
    cdef int coins[8], coin, i, k, ln

    coins = [1, 2, 5, 10, 20, 50, 100, 200]
    ln = len(coins)

    cdef int** mem = <int**> malloc(ln * sizeof(int*))

    for i in range(ln):
        mem[i] = <int*> malloc((target + 1) * sizeof(int))
    
    for k, coin in enumerate(coins):
        for i in range(1, target + 1):
            mem[k][i] = i // coin

    cdef int* result = <int*> calloc(target + 1, (target + 1) * sizeof(int))
    result[0] = 1

    for k, coin in enumerate(coins):
        for i in range(coin, target + 1):
            result[i] += result[i - coin]
    
    return result[target]