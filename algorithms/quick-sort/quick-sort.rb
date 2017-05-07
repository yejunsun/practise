def quick_sort(alist)
  quick_sort_helper(alist, 0, alist.length - 1)
end

def quick_sort_helper(alist, first, last)
  if first < last
    pirot_point = partition(alist, first, last)

    quick_sort_helper(alist, first, pirot_point - 1)
    quick_sort_helper(alist, pirot_point + 1, last)
  end
end

def partition(alist, first, last)
  pirot = alist[first]

  left_mark = first + 1
  right_mark = last

  done = false
  while not done
    while left_mark <= right_mark && alist[left_mark] <= pirot
      left_mark += 1
    end

    while right_mark >= left_mark && alist[right_mark] >= pirot
      right_mark -= 1
    end

    if (left_mark > right_mark)
      done = true
    else
      temp = alist[right_mark]
      alist[right_mark] = alist[left_mark]
      alist[left_mark] = temp
    end
  end

  alist[first] = alist[right_mark]
  alist[right_mark] = pirot
  return right_mark
end

alist = [5,1,6,7,2,3,9]
quick_sort(alist)
print alist
