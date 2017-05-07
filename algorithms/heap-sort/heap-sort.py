# -*- coding:utf-8 -*-

def left(i):
    return 2 * i + 1

def right(i):
    return 2 * i + 2

def max_heapify(alist, i, heap_size):
    l = left(i)
    r = right(i)

    if l < heap_size and alist[l] > alist[i]:
        largest = l
    else:
        largest = i

    if r < heap_size and alist[r] > alist[largest]:
        largest = r

    if largest != i:
        temp = alist[i]
        alist[i] = alist[largest]
        alist[largest] = temp

        max_heapify(alist, largest, heap_size)

def build_max_heap(alist):
    heap_size = len(alist)
    for i in range(heap_size / 2 - 1, -1, -1):
        max_heapify(alist, i, heap_size)

def heap_sort(alist):
    build_max_heap(alist)
    
    heap_size = len(alist)
    for i in range(heap_size -1, 0, -1):
        heap_size -= 1

        max_heapify(alist, 0, heap_size)

        temp = alist[0]
        alist[0] =  alist[i]
        alist[i] = temp

def main():
    alist = [1, 5, 7, 3, 9 ,2, 34, 12, 12, 10]
    heap_sort(alist)
    print(alist)

if __name__ == "__main__":
    main()



