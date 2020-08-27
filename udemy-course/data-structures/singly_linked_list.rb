# Big O of Singly Linked Lists:

# Excels at insertion and removal times, especially at the beginning
# Not as good as arrays at random access to elements
# Insertion: O(1)
# Removal: Depends. O(1) or O(N) depending on start/end removal
# Searching: O(N)
# Access: O(N)

class Node

  attr_accessor :val, :next
  
  def initialize(val)
    @val = val
    @next = nil
  end
end

class SinglyLinkedList

  attr_accessor :length, :head, :tail
  
  def initialize
    @length = 0
    @head = nil
    @tail = nil
  end

  def push(val)
    # accept a value
    # create a new node with the value
    node = Node.new(val)
    # if there is no head, set head and tail to the node
    if !self.head 
      self.head = node
      self.tail = node
    else
    # otherwise, set the next property on the tail to be the new node 
    # and set the tail property on the list to be the new node
      self.tail.next = node
      self.tail = node
    end
    # increment length by 1 
    self.length += 1
    
    return node
  end

  def pop
    if self.length == 0
      return nil
    end

    current = self.head
    new_tail = current
    while current.next do
      new_tail = current
      current = current.next
    end
    self.tail = new_tail
    self.tail.next = nil
    self.length -= 1

    if self.length == 0
      self.head == nil
      self.tail == nil
    end

    return current
  end

  def shift
    # if no nodes, return nil
    if self.length == 0
      return nil
    end
    # Store current head in variable
    head = self.head
    # Set head property to be current head's next property
    self.head = head.next
    # Decrement length by 1
    self.length -= 1
    # Return value of node removed
    return head
  end

  def unshift(val)
    node = Node.new(val)

    if !self.head
      self.head = node
      self.tail = node
    else
      node.next = self.head
      self.head = node
    end
    self.length += 1
    return node
  end

  def get(idx)
    # if index is less than 0 or greater than or equal to length of list, return nil
    if idx < 0 || idx >= self.length
      return nil
    else
      node = self.head
      for i in 0...idx do
        node = node.next
      end
      return node
    end
    # otherwise, loop through and return node at that position
  end

  def set(val, idx)
    node = self.get(idx)
    if node
      node.val = val
    end
    return !!node
  end

  def insert(val, idx)
    if idx > self.length || idx < 0
      return false
    elsif idx == 0
      return !!self.unshift(val)
    elsif idx == self.length
      return !!self.push(val)
    else
      new_node = Node.new(val)
      new_node.next = self.get(idx)
      prev_node = self.get(idx -1)
      prev_node.next = new_node
      self.length += 1
    end
    return !!new_node
  end

  def remove(idx)
    if idx < 0 || idx >= self.length
      return false
    elsif idx == self.length - 1
      return !!self.pop
    elsif idx == 0
      return !!self.shift
    else
      prev_node = self.get(idx -1)
      removed = prev_node.next
      prev_node.next = self.get(idx +1)
      self.length -= 1
      return removed
    end
  end

  def reverse
    if self.length == 0
      return nil
    elsif self.length == 1
      return self
    end
    node = self.head
    self.head = self.tail
    self.tail = node

    prev = nil
    nxt = nil

    for i in 0...self.length do
      nxt = node.next
      node.next = prev
      prev = node
      node = nxt
    end
    return self
  end

end

test = SinglyLinkedList.new
test.push(15)
test.push(20)
test.push(25)
test.insert(1000, 0)
p test
