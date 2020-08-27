to_sort = [5, 3, 6, 1, 2, 8, 4, 7, 9]

# Start with two sorted arrays, and another array to combine them
def merge(left, right)
  new_arr = []
  left_idx = 0
  right_idx = 0

  # As the arrays are already sorted, can work along each array comparing minimum values
  # Whichever is smaller gets added to the new array and index is incremented
  # Process repeats until one array has been added to new_arr
  # At this point, we know that all remaining values of the other array can be added, no need to check
  while left_idx < left.length && right_idx < right.length do
    if left[left_idx] <= right[right_idx]
      p "left: #{left[left_idx]} right: #{right[right_idx]}"
      new_arr.push(left[left_idx])
      left_idx += 1
      p "new_arr: #{new_arr}"
    else
      p "left: #{left[left_idx]} right: #{right[right_idx]}"
      new_arr.push(right[right_idx])
      right_idx += 1
      p "new_arr: #{new_arr}"
    end
  end

  # Adds the number of values remaining if right array left over
  for i in 0..(right.length - right_idx -1) do
    new_arr.push(right[right_idx])
    right_idx += 1
    p "new_arr: #{new_arr}"
  end

  # Adds the number of values remaining if left array left over
  for i in 0..(left.length - left_idx -1) do
  new_arr.push(left[left_idx])
  left_idx += 1
  p "new_arr: #{new_arr}"
  end

  # Returns new array
  new_arr
end

def mergesort(array)
  p "mergesort: #{array}"
  # If array is length < 2, return array
  if array.length < 2
    return array
  else
    # Otherwise, split array into two sub-arrays
    mid = array.length / 2
    p "mid: #{mid}"
    left = array.slice(0...mid)
    p "left: #{left}"
    right = array.slice(mid..-1)
    p "right: #{right}"
  # Run mergesort on left array - this will progressively split array until arrays of length 1. (Recursion)
    sorted_left = mergesort(left)
  # Run mergesort on right array
    sorted_right = mergesort(right)
  # Run merge on both sorted arrays
    p "sorted_left: #{sorted_left}"
    p "sorted_right: #{sorted_right}"
    # Return result
    merge(sorted_left, sorted_right)
  end
end

mergesort(to_sort)