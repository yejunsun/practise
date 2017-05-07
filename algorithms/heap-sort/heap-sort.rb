def left(i)
     return 2 * i + 1
end

def right(i)
     return 2 * i + 2
end

def max_heapify(alist, i, heap_size)
  l = left(i)
  r = right(i)

  if (l < heap_size && alist[l] > alist[i])
    largest = l
  else
    largest = i
  end 

  if (r < heap_size && alist[r] > alist[largest])
    largest = r
  end

  if (i != largest)
    temp = alist[i]
    alist[i] = alist[largest]
    alist[largest] = temp

    max_heapify(alist, largest, heap_size)
  end
end

def build_max_heap(alist)
  heap_size = alist.length

  (heap_size / 2 - 1).downto(0) do |i| 
    max_heapify(alist, i, heap_size)
  end

end

def heap_sort(alist)
  build_max_heap(alist)

  heap_size = alist.length
  while heap_size > 0
    heap_size -= 1

    temp = alist[0]
    alist[0] = alist[heap_size]
    alist[heap_size] = temp

    max_heapify(alist, 0, heap_size)
  end
end

alist = [1, 5, 3, 10, 35, 1, 4, 56]
heap_sort(alist)
print(alist)
