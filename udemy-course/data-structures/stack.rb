# Stack
# LIFO data structure - last element added, first one to remove

# Used to manage function invocations
# Used for UNDO / REDO
# Routing (history object) in web browser

# Can use an array if we only push and pop! (more efficient Big O time complexity)
# Can use an array if we only use unshift/shift (less efficient)
# But no need to use an array because we don't use the index
# Linked List is better for Big O time complexity

# Big O of Stacks
# Insertion: O(1)
# Removal: O(1)
# Searching: O(N)
# Access: O(N)
# Use a stack when you need insertion/removal, rather than search and access

class Node
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end

class Stack
   attr_accessor :first, :last, :size

   def initialize
    @first = nil
    @last = nil
    @size = 0
   end

   def push(val)
    node = Node.new(val)

    if !self.first 
      self.first = node
      self.last = node
    else
      first = self.first
      self.first = node
      self.first.next = first
    end
    self.size += 1
    return self.size
   end

  def pop
    if self.size == 0
      return nil
    end
    popped = self.first

    if self.size == 1
      self.last = nil
    end
    self.first = popped.next
    popped.next = nil
    self.size -= 1
    return popped
  end

end

stack = Stack.new
stack.push(11)
stack.push("Claire")
stack.push("Banter")
p stack.pop
p stack