// Idea is to improve on brute force checking for a condition by moving a certain way based on testing inputs

// E.g. write a function that takes a sorted array and returns the first pair that adds to 0

const arr = [1, 2, 3, 4, 4, 4, 7, 7, 12, 12, 13];

function sumToZero(arr) {
  let left = 0;
  let right = arr.length - 1;
  while (left < right) {
    if (arr[left] + arr[right] === 0) {
      return [arr[left], arr[right]];
    } else if (arr[left] + arr[right] > 0) {
      right--;
    } else {
      left++;
    }
  }
}

// Time complexity: O(n) - but a bit messy
function countUniqueValues(arr) {
  if (arr.length === 0) {
    return 0;
  }
  // Must be one, means we don't need to compare first.
  let total = 1;
  let j = 0;
  for (let i = 1; i < arr.length; i++) {
    if (arr[i] !== arr[j]) {
      total++;
    }
    j++;
  }
  return total;
}

function countUniqueValuesTwo(arr) {
  if (arr.length === 0) {
    return 0;
  }
  let i = 0;
  for (let j = 1; j < arr.length; j++) {
    if (arr[i] !== arr[j]) {
      i++;
      arr[i] = arr[j];
    }
  }
  return i + 1;
}
console.log(countUniqueValues(arr));
console.log(countUniqueValuesTwo(arr));
