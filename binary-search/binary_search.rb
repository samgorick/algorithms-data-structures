array = [1, 2, 3, 4, 5, 6, 8, 9, 10, 11]

# Time Complexity: Big O log(n).
# Much more efficient than linear search, which is Big O(n)

# First attempt - more verbose than 'optimal' solution below
def binary_search(array, search)
  if search < array[0] || search > array[-1]
    return nil
  end
  start = 0
  finish = (array.length) -1
  bisection = (start + finish) / 2
  while array[bisection] != search
    p "search area = #{start} - #{finish}"
    bisection = (start + finish) / 2
    p "bisection = #{bisection}"
    p "comparison number = #{array[bisection]}"
      if search == array[bisection]
        return bisection
      elsif start == finish
        return -1
      elsif search < array[bisection]
        finish = bisection -1
      elsif search > array[bisection]
        start = bisection +1
      end
  end
end

# Solved iteratively
def bisection_search(array, search)
  # Set up start and finish as first/last index of array
  start = 0
  finish = (array.length) -1

  # While loop, until no elements left to search for
  while start <= finish
    p "search area = #{start} - #{finish}"
    # Bisection is mid-point between start and finish. These change each iteration
    bisection = (start + finish) / 2
    p "bisection = #{bisection}"
    p "comparison number = #{array[bisection]}"
    # if the search element is at the bisection index of the array, we're done! Return the index
      if search == array[bisection]
        return bisection
        # Otherwise, because the array is sorted we know that if search is lower than bisection
        # We don't need to check any indices at or above that position. Thus finish becomes bisection -1
      elsif search < array[bisection]
        finish = bisection -1
        # We don't need to check any indices lower than the position if search is higher. Thus start becomes bisection +1
      elsif search > array[bisection]
        start = bisection +1
      end
  end
  # If function gets to this point, the number will not be in the array, so we return -1
  -1
end

# Solved recursively. Includes start and finish as arguments, otherwise is similar to above.
def recursive_binary(array, start, finish, search)
  if finish < start
    return -1
  end
  bisection = (start + finish) / 2
  if search == array[bisection]
    return bisection
  elsif search < array[bisection]
    return recursive_binary(array, start, bisection-1, search)
  elsif search > array[bisection]
    return recursive_binary(array, bisection+1, finish, search)
  end
end

# Minor modification to binary search for first occurence of a number in an array
def find_index_search(array, search, find_first)
  # Set up start and finish as first/last index of array
  start = 0
  finish = (array.length) -1
  # We will return the index of the first element as result
  result = -1
  # While loop, until no elements left to search for
  while start <= finish
    p "search area = #{start} - #{finish}"
    # Bisection is mid-point between start and finish. These change each iteration
    bisection = (start + finish) / 2
    p "bisection = #{bisection}"
    p "comparison number = #{array[bisection]}"
    # if the search element is at the bisection index of the array,
    # We set result as bisection, to return the index
    # We run the while loop again starting from the element before the one == search, 
    # in case we find a lower index, or above, 
    # depending on whether algorithm is being used to find first or last
      if search == array[bisection]
        result = bisection
        if find_first
          finish = bisection -1
        else
          start = bisection +1
        end
      elsif search < array[bisection]
        finish = bisection -1
        # We don't need to check any indices lower than the position if search is higher. Thus start becomes bisection +1
      elsif search > array[bisection]
        start = bisection +1
      end
  end
  result
end

# These two functions above can be combined to help us find the count of any number
# Time complexity: 2(log(n)) which becomes Big O log(n) - much more efficient than linear search!
def find_count(array, search)
  first_index = find_index_search(array, search, true)
  last_index = find_index_search(array, search, false)
  if first_index != -1 && last_index != -1
    last_index - first_index + 1
  else
    0
  end
end