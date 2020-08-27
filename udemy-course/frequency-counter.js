// Create a function that returns true if all elements in one array are squares of the other array
arr1 = [1, 2, 3, 2, 5]
arr2 = [9, 4, 1, 4, 11]

// My naive solution, O(n logn) time due to sort
function sameNaive(arr1, arr2){
  const sortedArr1 = arr1.sort((a, b) => a > b ? 1 : -1)
  const sortedArr2 = arr2.sort((a, b) => a > b ? 1 : -1)

  for(let i=0; i < arr1.length; i++){
    if (sortedArr1[i] ** 2 !== sortedArr2[i]){
      return false
    }
  }
  return true
}

// Time complexity: O(n)
function same(arr1, arr2){
  if(arr1.length !== arr2.length){
    return false
  }
  let frequencyCounter1 = {}
  let frequencyCounter2 = {}

  for(let val of arr1){
    frequencyCounter1[val] = (frequencyCounter1[val] || 0) + 1
  }

  for(let val of arr2){
    frequencyCounter2[val] = (frequencyCounter2[val] || 0) + 1
  }
  console.log(frequencyCounter1)
  console.log(frequencyCounter2)
  for(let key in frequencyCounter1){
    // First checks - is there the squared key in the 2nd array?
    if(!(key ** 2 in frequencyCounter2)){
      return false
    }
    // if there is, are there the same frequency of values in both arrays?
    if(frequencyCounter2[key ** 2] !== frequencyCounter1[key]){
      return false
    }
  }
  return true
}

// same(arr1, arr2)

const str1 = 'razza'
const str2 = 'zazas'

function anagram(str1, str2){
  // if the lengths of strings are not equal, return false
  if(str1.length !== str2.length){
    return false
  }
  // put each string into an object of characters (key) and occurrences (value)
  let stringFrequency1 = {}
  let stringFrequency2 = {}

  for(let val of str1){
    stringFrequency1[val] = (stringFrequency1[val] || 0) + 1
  }
  for(let val of str2){
    stringFrequency2[val] = (stringFrequency2[val] || 0) + 1
  }
  // Then, for each key/value pair in the string frequency object
  for(let key in stringFrequency1){
    // then compare each key. Does it exist in the other object? If not, return false
    if (!(stringFrequency2[key])){
      return false
    }
    // then compare occurrences of each value. Are they the same? If not, return false.
    if (stringFrequency1[key] !== stringFrequency2[key]){
      return false
    }
  }
  // If all true, then is an anagram, and we can return true
  return true
}

console.log(anagram(str1, str2))