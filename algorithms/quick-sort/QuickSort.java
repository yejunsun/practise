public class QuickSort {
    public static int partition(int[] alist, int first, int last) {
        int pirot = alist[first];

        int left_mark = first + 1;
        int right_mark = last;

        boolean done = false;

        while(!done) {
            while (left_mark <= right_mark && alist[left_mark] <= pirot) {
                left_mark ++;
            }
            while (right_mark >= left_mark && alist[right_mark] >= pirot) {
                right_mark --;
            }

            if (left_mark > right_mark) {
                done = true;
            } else {
                int temp = alist[right_mark];
                alist[right_mark] = alist[left_mark];
                alist[left_mark] = temp;
            }
        }

        alist[first] = alist[right_mark];
        alist[right_mark] = pirot;
        return right_mark;
    }

    public static void quick_sort_helper(int[] alist, int first, int last) {
        if (first >= last) {
            return;
        }

        int pirot_point = partition(alist, first, last);

        quick_sort_helper(alist, first, pirot_point -1);
        quick_sort_helper(alist, pirot_point + 1, last);
    }

    public static void quick_sort(int[] alist) {
        quick_sort_helper(alist, 0, alist.length - 1);
    }

    public static void main(String args[]) {
        int[] alist = {5, 1, 2, 7, 5, 8, 1, 9};
        quick_sort(alist);
        for (int i = 0; i < alist.length; i ++) {
            System.out.println(alist[i]);
        }
    }
}
