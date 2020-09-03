# Trees
# Each node can reference +/- 1 node
# Must have one entry point (ROOT) only
# Sibling - a group of nodes with the same parent
# Leaf - a node with no children
# Edge - Connection between parent and child

# Use cases:
# HTML DOM
# Network Routing
# Hierarchical folder structure on PC
# JSON

# Binary Search Trees
# Each parent can have max. 2 children
# Special property: Every item on the left of a node is lesser
# Every item on the right of a node is greater
# Excel at sorting/accessing data that can be sortable

# Big O of BST
# Insert - O(log n) - average case
# Searching - O(log n) - average case

# Breadth First Search vs Depth First Search?
# Basically - breadth tree - use depth! Deep tree - use breadth!
# Fully fleshed out tree? Don't want to store all the nodes yet to visit in breadth first! Depth probably better
# If deep rather than wide - breadth first is bette

# Depth first - pre-order, post-order, in-order?
# In order - the nodes are IN ORDER. From low to high
# PreOrder - Starts with root, and can recreate easily
# PostOrder - who knows why this would be useful 

class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    self.value = value
    self.left = nil
    self.right = nil
  end
end

class BinarySearchTree

  attr_accessor :root

  def initialize
    self.root = nil
  end

  def insert(val)
    # create a node
    new_node = Node.new(val)
    # start at root
    # If no root, root becomes new nod
    if !self.root
      self.root = new_node
      return self
    end

    # If root, check if value of new node is greater than or less than value of root
    current = self.root
    while true
      if new_node.value == current.value
        return nil
      end
      if new_node.value < current.value
        if current.left == nil
           current.left = new_node
           return self
        else
          current = current.left
        end
      elsif new_node.value > current.value
        if current.right == nil
          current.right = new_node
          return self
        else
        current = current.right
        end
      end
    end
  end

  def find(val)
    if !self.root
      return false
    end

    current = self.root
    found = false
    while current && !found
      if current.value > val
        current = current.left
      elsif current.value < val
        current = current.right
      else
        return true # could also return current (node)
      end
    end
    return false
  end

  def breadthFirstSearch
    # create a queue and a variable to store value of nodes visited
    queue = []
    result = []
    # Place root node in the queue
    queue.push(self.root)
    # Loop as long as there is anything in the queue
    while queue.length > 0
    # Dequeue a node from the queue and push the value of the node into the variable that stores the nodes
      node = queue.shift
      result << node.value
    # If there is a left property on node dequeued add it to queue
      if node.left
        queue.push(node.left)
      end
    # If there is a right property on the node dequeued - add it to queue
      if node.right
        queue.push(node.right)
      end
    end
    # Return variable that stores the values
    return result
  end

  # Add node value to result as soon as visited
  def depthFirstSearchPreOrder
    # create result variable to store values of nodes visited
    @result = []
    # Helper function that accepts a node
    def traverse(node)
      # Push value of node to the variable that stores the values
      @result.push(node.value)
      # If the node has a left property, call helper function with left property of node
      traverse(node.left) if node.left 
      # If node has right property, called helper function with right property of node
      traverse(node.right) if node.right
    end
    # Invoke helper function with current variable
    traverse(self.root)
    # Return array of values
    return @result
  end

  # Go all the way to the left and then right before adding node to result
  def depthFirstSearchPostOrder
    @result = []

    def traverse(node)
      traverse(node.left) if node.left 
      traverse(node.right) if node.right
      @result << node.value
    end

    traverse(self.root)
    return @result
  end

  # Once left side is traversed, push node, then traverse right
  def depthFirstSearchInOrder
    @result = []

    def traverse(node)
      traverse(node.left) if node.left
      @result << node.value
      traverse(node.right) if node.right
    end

    traverse(self.root)
    return @result
  end
end

tree = BinarySearchTree.new
tree.insert(10)
tree.insert(5)
tree.insert(13)
tree.insert(11)
tree.insert(2)
tree.insert(16)
tree.insert(7)
p tree.depthFirstSearchInOrder

#           10
#      5          13
#   2     7    11     16 