# Another category of trees
# Lots of types of heaps
# Focus on min and max heaps

# MaxBinaryHeap
# Parent node value is always larger than child nodes
# No guarantees between sibling nodes, unlike binary search tree
# Binary heap is as compact as possible, all children of each node are as full as they can be
# MinBinaryHeap - child nodes are always larger than their parent node

# For any index of an array - n
# Left child is 2n + 1
# Right child is 2n + 2

# For any child node at index n
# Its parent is at index (n-1)/2 (integral part)

class MaxBinaryHeap

  attr_accessor :values

  def initialize
    @values = []
  end

  def insert(val)
    self.values << val
    index = (self.values.length) - 1
    while index > 0
      parentIndex = (index - 1) / 2
      if self.values[parentIndex] >= self.values[index]
        break
      else
        self.values[parentIndex], self.values[index] = self.values[index], self.values[parentIndex]
        index = parentIndex
      end
    end
    self.values
  end

  # remove largest and sink down remainder
  def extractMax
    last = (self.values.length) - 1
    self.values[0], self.values[last] = self.values[last], self.values[0]
    max = self.values.pop

    parentIndex = 0
    element = self.values[parentIndex]
    max_child = nil

    while true
      left_child_idx = 2 * parentIndex + 1
      right_child_idx = 2 * parentIndex + 2
      swap = nil

      if left_child_idx < self.values.length
        left_child = self.values[left_child_idx]
        if left_child > element
          swap = left_child_idx
        end
      end

      if right_child_idx < self.values.length
        right_child = self.values[right_child_idx]
        if swap == nil && right_child > element || swap != nil && right_child > left_child
          swap = right_child_idx
        end
      end

      break if swap == nil
      self.values[parentIndex] = self.values[swap]
      self.values[swap] = element
      parentIndex = swap
    end
    return max
  end
end

heap = MaxBinaryHeap.new
heap.insert(10)
heap.insert(20)
heap.insert(15)
heap.insert(25)
heap.insert(12)
p heap
p heap.extractMax
p heap