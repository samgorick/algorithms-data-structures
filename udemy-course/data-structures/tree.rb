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
end

tree = BinarySearchTree.new
tree.insert(10)
tree.insert(5)
tree.insert(13)
tree.insert(11)
tree.insert(2)
tree.insert(16)
tree.insert(7)
tree.insert(10)
p tree