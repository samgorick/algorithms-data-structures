# Another category of trees
# Lots of types of heaps
# Focus on min and max heaps

# MaxBinaryHeap
# Parent node value is always larger than child nodes
# No guarantees between sibling nodes, unlike binary search tree
# Binary heap is as compact as possible, all children of each node are as full as they can be
# MinBinaryHeap - child nodes are always larger than their parent node

# For any index of an array at position n
# Left child is 2n + 1
# Right child is 2n + 2

# For any child node at index n
# Its parent is at index (n-1)/2 (integral part)

class MaxBinaryHeap

  attr_accessor :values

  def initialize
    @values = []
  end

  # Insert at end, swap to move to correct position in heap
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
    # helper method invoked below
    def sinkDown
      parentIndex = 0
      element = self.values[parentIndex]

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
    end

    max = self.values[0]
    last = self.values.pop
    if self.values.length > 0
      self.values[0] = last
      self.sinkDown
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

class Node
  attr_accessor :value, :priority 

  def initialize(value, priority)
    @value = value
    @priority = priority
  end
end

# Will use a MinHeap as lower numbers are more important
class PriorityQueue
  attr_accessor :values

  def initialize
    @values = []
  end

  def enqueue(value, priority)
    node = Node.new(value, priority)
    self.values << node
    index = (self.values.length) - 1
    while index > 0
      parentIndex = (index - 1) / 2
      if self.values[parentIndex].priority <= self.values[index].priority
        break
      else
        self.values[parentIndex], self.values[index] = self.values[index], self.values[parentIndex]
        index = parentIndex
      end
    end
    self.values
  end

  def dequeue
    # helper method invoked below
  def sinkDown
    parentIndex = 0
    element = self.values[parentIndex]

    while true
      left_child_idx = 2 * parentIndex + 1
      right_child_idx = 2 * parentIndex + 2
      swap = nil

      if left_child_idx < self.values.length
        left_child = self.values[left_child_idx]
        if left_child.priority < element.priority
          swap = left_child_idx
        end
      end

      if right_child_idx < self.values.length
        right_child = self.values[right_child_idx]
        if swap == nil && right_child.priority < element.priority || swap != nil && right_child.priority < left_child.priority
          swap = right_child_idx
        end
      end

      break if swap == nil
      self.values[parentIndex] = self.values[swap]
      self.values[swap] = element
      parentIndex = swap
    end
  end

  min = self.values[0]
  last = self.values.pop
  if self.values.length > 0
    self.values[0] = last
    self.sinkDown
  end
  return min
  end

end

priority = PriorityQueue.new
priority.enqueue(15, 3)
priority.enqueue(20, 2)
priority.enqueue(25, 1)
priority.enqueue(20, 5)
p priority
p priority.dequeue
p priority
