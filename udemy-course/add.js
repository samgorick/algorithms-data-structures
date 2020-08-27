function add(n){
  let total = 0
  for (let i=1; i < n; i++){
    total += i
  }
  return total
}

function addTwo(n){
  return n * (n-1) / 2
}

const t1 = performance.now()
add(1000)
const t2 = performance.now()
console.log(`Time elapsed: ${(t2 - t1) / 1000} seconds`)
