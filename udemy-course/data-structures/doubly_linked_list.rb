# Each node has a next node and a previous node
# Means it's more efficient for some operations compared to singly linked list

# Big O Notation:
# Insertion - O(1) (same as singly)
# Removal - O(1) (better than singly)
# Searching - O(N) (better - n/2)
# Access - O(N) (same)

# If you need to access data in a reverse manner (e.g. browser history), v. good compared to singly linked list
# Better for finding nodes - done in half time
# Drawback - more memory! More memory == more flexibility

class Node

  attr_accessor :val, :next, :prev
  
  def initialize(val)
    @val = val
    @next = nil
    @prev = nil
  end
end

class DoublyLinkedList

  attr_accessor :head, :tail, :length

  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end

  def push(val)
    # Create new node
    node = Node.new(val)
    # If head is nil, set head and tail to be newly created node
    if !self.head
      self.head = node
      self.tail = node
    # If not, set next property on tail to be that node
    else
      self.tail.next = node
    # Set the previous property on newly created node to be the tail
      node.prev = self.tail
    # Set the tail to be the newly created node
      self.tail = node
    # Increment the length
    # Return the doubly linked list
    end
    
    self.length += 1

    return self
  end

  def pop 
    if self.length == 0
      return nil
    end

    removed = self.tail

    if self.length == 1 
      self.head = nil
      self.tail = nil
    else
      # set the tail's previous as the new tail
      self.tail = removed.prev
      # set the new tail's next to nil
      self.tail.next = nil
      removed.prev = nil
    end
      self.length -= 1
      return removed
  end

  def shift
     if self.length == 0
      return nil
     end

     removed = self.head

     if self.length == 1
      self.head = nil
      self.tail = nil
     else
      self.head = removed.next
      self.head.prev = nil
      removed.next = nil
     end
     self.length -= 1
     return removed
  end 

  def unshift(val)
    node = Node.new(val)

    if !self.head
      self.head = node
      self.tail = node
    else
      node.next = self.head
      self.head.prev = node
      self.head = node
    end

    self.length += 1
    return self
  end

  def get(idx)
    if idx < 0 || idx >= self.length
      return nil
    end
    # either start at beginning or end depending on idx. Halves search time
    if idx < (self.length) / 2
      node = self.head
      for i in 0...idx do
        node = node.next
      end
    else
      node = self.tail
      for i in 0...(self.length) -1 - idx do
        node = node.prev
      end
    end
    return node
  end

  def set(idx, val)
    node = self.get(idx)
    if node
      node.val = val
    end
    return !!node
  end

  def insert(idx, val)
    if idx < 0 || idx >= self.length
      return nil
    end 

    if idx == 0
      return !!self.unshift(val)
    elsif idx == self.length
      return !!self.push(val)
    end

    new_node = Node.new(val)
    prev_node = self.get(idx -1)
    next_node = prev_node.next

    new_node.next = next_node, next_node.prev = new_node
    new_node.prev = prev_node, prev_node.next = new_node
    
    self.length += 1
    return true
  end

  def remove(idx)
    if idx < 0 || idx >= self.length
      return nil
    end

    if idx == 0
      return !!self.shift
    elsif idx == (self.length) -1
      return !!self.pop
    end

    removed = self.get(idx)
    prev_node = removed.prev
    next_node = removed.next

    prev_node.next = next_node, next_node.prev = prev_node
    removed.next = nil, removed.prev = nil

    self.length -=1
    return removed
  end

end

list = DoublyLinkedList.new
list.push(5)
list.push(10)
list.push(15)
list.push(20)
list.push(25)
list.push(30)
p list.remove(2)
p list