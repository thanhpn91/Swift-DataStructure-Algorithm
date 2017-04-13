
// Insertion sort
func insertionSort<T: Comparable>(arrays: [T]) -> [T] {
    var sortedArrays = arrays
    for index in 0 ..< sortedArrays.count {
        var currentIndex = index
        
        while currentIndex > 0 && sortedArrays[currentIndex] < sortedArrays[currentIndex - 1] {
            let temp = sortedArrays[currentIndex - 1]
            sortedArrays[currentIndex - 1] = sortedArrays[currentIndex]
            sortedArrays[currentIndex] = temp
            currentIndex -= 1
        }
    }
    return sortedArrays
}

let incrementalArray = [1, 2, 3, 4, 5]
var decrementalArray = [5, 4, 3, 2, 1, 4, 5, 1]

let sortedArray = insertionSort(arrays: incrementalArray)


// Overview of Quicksort
// Step 1: Picking a pivot 
// Step 2: Rearranging data into left(less than pivot) part and right part
// Step 3: Sorting left and right part recursively

func quickSort<T: Comparable>(arrays: inout [T]) {
    quickSort(arrays: &arrays, low: 0, high: arrays.count - 1)
}

private func quickSort<T: Comparable>(arrays: inout [T], low: Int, high: Int) {
    let index = partition(arrays: &arrays, low: low, high: high)
    if low < index - 1 {
        quickSort(arrays: &arrays, low: low, high: index - 1)
    }
    if  index < high {
        quickSort(arrays: &arrays, low: index, high: high)
    }
}

private func partition<T: Comparable>(arrays: inout [T], low: Int, high: Int) -> Int {
    var left = low
    var right = high
    let pivot = arrays[left + (right-left)/2]
    
    while left < right {
        while arrays[left] < pivot {
            left += 1
        }
        while arrays[right] > pivot {
            right -= 1
        }
        if left <= right {
            let temp = arrays[left]
            arrays[left] = arrays[right]
            arrays[right] = temp
            left += 1
            right -= 1
        }
    }
    return left
}

let quickSortArray = quickSort(arrays: &decrementalArray)
print(decrementalArray)


// Overview of MergeSort
// Step 1: If it only one element in the list return
// Step 2: Dividing the list into two halves until it can no more be divided
// Step 3: Merging two lists in sorted order

func mergeSort<T: Comparable>(arrays: inout [T]) {
    mergeSort(arrays: &arrays, start: 0, end: arrays.count - 1)
}

private func mergeSort<T: Comparable>(arrays: inout [T], start: Int, end: Int) {
    if start < end {
        let mid = (start + end)/2
        mergeSort(arrays: &arrays, start: start , end: mid)
        mergeSort(arrays: &arrays, start: mid + 1, end: end)
    }
}

private func merge<T: Comparable>(arrays: inout [T], start: Int, mid: Int, end: Int) {
    var mergeArray = [T]()
    var i = start
    var j = mid + 1
    for index in 0..<end - start {
        if i > mid {
            mergeArray[index] = arrays[j]
            j += 1
        }
        else if j > end {
            mergeArray[index] = arrays[i]
            i += 1
        }
        else if arrays[i] <= arrays[j] {
            mergeArray[index] = arrays[i]
            i += 1
        } else {
            mergeArray[index] = arrays[j]
            j += 1
        }
    }
    
    for index in start..<end {
        arrays[index] = mergeArray[index - start]
    }
}

var testMergeSortArray = [5, 4, 3, 2, 1, 4, 5, 1]

let mergeSortArray = mergeSort(arrays: &testMergeSortArray)
print(decrementalArray)

public func heapSort<T: Comparable>(arrays: inout [T]) {
    
    let n = arrays.count - 1
    let halfLength = (n)/2
    var sortedArray = [T]()
    for index in (0...halfLength).reversed() {
        heapify(arrays: &arrays, i: index)
    }
    
    for index in (0...n).reversed() {
        swap(arrays: &arrays, i: 0, j: index)
        sortedArray.append(arrays[index])
        arrays.remove(at: index)
        heapify(arrays: &arrays, i: 0)
    }
    
    arrays = sortedArray.reversed()
}

private func heapify<T: Comparable>(arrays: inout [T], i: Int) {
    let n = arrays.count - 1
    let left = (i + 1) * 2 - 1
    let right = (i + 1) * 2
    var max = i
//    print("n at \(n) parrent at \(i) left child at \(left) right child at \(right)")
    
    if left <= n && arrays[max] < arrays[left] {
        max = left
    }
    if right <= n && arrays[max] < arrays[right] {
        max = right
    }
    
    if max != i {
        swap(arrays: &arrays, i: max, j: i)
        heapify(arrays: &arrays, i: max)
    }
}

private func swap<T: Comparable>(arrays: inout [T], i: Int, j: Int) {
    let temp = arrays[i]
    arrays[i] = arrays[j]
    arrays[j] = temp
}

var testHeapSortArray = [5, 4, 3, 2, 1, 4, 5, 1]
let heapSortArray = heapSort(arrays: &testHeapSortArray)
print(testHeapSortArray)




