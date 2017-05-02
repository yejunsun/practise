# -*- coding:utf-8 -*-

def quick_sort(alist):
    quick_sort_helper(alist, 0, len(alist) - 1)

def quick_sort_helper(alist, first, last):

    if first < last:

        pirot_point = partition(alist, first, last)

        quick_sort_helper(alist, first, pirot_point - 1)
        quick_sort_helper(alist, pirot_point + 1, last)

def partition(alist, first, last):
    pirot = alist[first]

    left_mark = first + 1
    right_mark = last

    done = False

    while not done:
        while left_mark <= right_mark and alist[left_mark] <= pirot :
            left_mark += 1
        while right_mark >= left_mark and alist[right_mark] >= pirot :
            right_mark -= 1

        if left_mark > right_mark:
            done = True
        else:
            temp = alist[left_mark]
            alist[left_mark] = alist[right_mark]
            alist[right_mark] = temp

    alist[first] = alist[right_mark]
    alist[right_mark] = pirot

    return right_mark
    

if __name__ == "__main__":
    alist = [5, 1, 6, 2, 8, 9 ,3, 10]
    quick_sort(alist)
    print(alist)
