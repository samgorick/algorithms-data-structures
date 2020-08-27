const arr = [1, 2, 5, 2, 8, 1, 50]
const n = 4

const reducer = (accumulator, currentValue) => accumulator + currentValue;

function maxSubarraySumFirst(arr, n){
  if (arr.length < n){
    return null
  }
  let highest = -Infinity
  for(let i=0; i < (arr.length - (n-1)); i++){
    let sum = arr.slice(i, i+n).reduce(reducer)
    if (sum > highest){
      highest = sum
    }
  }
  return highest
}

function maxSubarraySum(arr, n){
  if (arr.length < n){
    return null
  }
  let highest = arr.slice(0, n).reduce(reducer)
  let tempSum = highest
  for(let i=n; i < arr.length; i++){
    tempSum = tempSum - arr[i-n] + arr[i]
    highest = Math.max(highest, tempSum)
  }
  return highest
}

console.log(maxSubarraySum(arr, n))
