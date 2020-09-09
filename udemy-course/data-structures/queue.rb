# Queue
# FIFO - First In First Out data structure
# E.g. printer queues, task processing (sometimes)
# can build queue class, or use an array

# Big O Notation
# Insertion/Removal - O(1)
# Searching/Access - O(N)
# You want to use a queue for insertion/removal


# Building a queue with an array
# Similar to stack, there are two pairs of built-in operations
# PUSH items in, SHIFT them out (add to end, remove from start)
# UNSHIFT items in, POP them out (add to start, remove from end)
# Unlike stack, there is no fully efficient way to add/remove.
# Will always need to re-index whole array, either to add or remove

# A queue class with a singly linked list
# Add to the end and remove from beginning - more efficient

 class Node

  attr_accessor :value, :next

  def initialize(value)
    self.value = value
    self.next = nil
  end
 end

 class Queue

  attr_accessor :first, :last, :size

  def initialize
    self.first = nil
    self.last = nil
    self.size = 0
  end

  def enqueue(val)

    node = Node.new(val)

    if self.size == 0
      self.first = node
    else
      self.last.next = node
    end

    self.last = node
    return self.size += 1
  end

  def dequeue
    if self.size == 0
      return nil
    end

    node = self.first

    if self.size == 1
      self.first = nil
      self.last = nil
    else
      self.first = node.next
      node.next = nil
    end
      self.size -= 1
      return node 
  end

 end

 q = Queue.new
 q.enqueue(10)
 q.enqueue(15)
 q.enqueue(20)
 p q
 p q.dequeue
 p q

