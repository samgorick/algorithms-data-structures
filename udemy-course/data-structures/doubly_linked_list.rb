# Each node has a next node and a previous node
# Means it's more efficient for some operations compared to singly linked list
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

  def get(index)
    if index < 0 || index >= self.length
      return nil
    end
    # either start at beginning or end depending on index. Halves search time
    if index < (self.length) / 2
      node = self.head
      for i in 0...index do
        node = node.next
      end
    else
      node = self.tail
      for i in 0...(self.length) -1 - index do
        node = node.prev
      end
    end
    return node
  end

end

list = DoublyLinkedList.new
list.push(5)
list.push(10)
list.push(15)
list.push(20)
list.push(25)
list.push(30)