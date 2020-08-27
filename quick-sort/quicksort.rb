# Psuedo-code

# Partition array into two sub-arrays, left and right of a pivot (could be any integer in array)
# Sort left array recursively - partitioning into smaller sub-arrays until they are length 1
# Sort right array recursively in the same way

# Average O notation complexity is n(logn) but worst case is n ** 2
# Space complexity is O(logn) - in-place

array = [6, 3, 5, 8, 1, 2, 7, 4]

def partition(array, arr_start, arr_end)
  pivot = array[arr_end]
  p "pivot = #{pivot}"
  p_index = arr_start
  i = arr_start
  while i < arr_end do
    if array[i] <= pivot
      array[i], array[p_index] = array[p_index], array[i] # aka swap elements
      p_index += 1
      i += 1
    else
      i += 1
    end
  end
  array[p_index], array[arr_end] = array[arr_end], array[p_index]
  p "after partition, array is now #{array}"
  p "p_index = #{p_index}"
  p_index
end

# Note - start/end are used so that we can use the same array when sorting sub-arrays
# No need for extra arrays which take up extra space
def quicksort(array, arr_start, arr_end)
  p "array is #{array}"
  p "arr_start is #{arr_start}"
  p "arr_end is #{arr_end}"
  # Greater than ensures base case reached when only one element left in array, 
  # or segment is invalid (e.g. calling index-1 of 0th element)
  if arr_start < arr_end
    p_index = partition(array, arr_start, arr_end)
    quicksort(array, arr_start, p_index -1)
    quicksort(array, p_index +1, arr_end)
  end
  array
end

p quicksort(array, 0, 7)
