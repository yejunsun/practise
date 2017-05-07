import java.util.Arrays;

public class HeapSort {
    public static int left(int i) {
        return 2 * i + 1;
    }

    public static int right(int i) {
        return 2 * i + 2;
    }

    public static void maxHeapify(int[] alist, int i, int heapSize) {
        int l = left(i);
        int r = right(i);

        int largest = i;
        if (l < heapSize && alist[l] > alist[i]) {
            largest = l;
        }
        if (r < heapSize && alist[r] > alist[largest]) {
            largest = r;
        }

        if (largest != i) {
            int temp = alist[i];
            alist[i] = alist[largest];
            alist[largest] = temp;

            maxHeapify(alist, largest, heapSize);
        }
        
    }

    public static void buildMaxHeap(int[] alist) {
        int heapSize = alist.length;
        for (int i = heapSize / 2 -1; i >= 0; i--) {
            maxHeapify(alist, i, heapSize);
            
        }
    }

    public static void sort(int[] alist) {
        int heapSize = alist.length;

        buildMaxHeap(alist);

        while (heapSize > 0) {
            heapSize --;

            int temp = alist[0];
            alist[0] = alist[heapSize];
            alist[heapSize] = temp;

            maxHeapify(alist, 0, heapSize);
        }
    }

    public static void main(String[] args) {
        int[] alist = {1, 2, 5, 89, 2, 22, 34, 11, 6};
        sort(alist);
        System.out.println(Arrays.toString(alist));
    }
}
