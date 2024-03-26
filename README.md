# balanced_binary_search_tree
The Odin Project lesson: https://www.theodinproject.com/lessons/ruby-binary-search-trees

implementation of a BST - balanced binary search tree

# classes
We will implement a Node class with attributes for its value and its left and right children. Each "leave" (end node) will have nil as children

We will implement a Tree class, wich accepts an array when initialized and has an attribute for its root which is set by #build_tree.

# methods
#build_tree 
  takes an array of data and turns it into a balanced binary tree full of Node objects appropriately  places.
  First it will remove all duplicates from the array.
  it returns the level-0 root node

#pretty_print 
  hared on Discord. Thanks.

#insert
  accepts a value and inserts it into the tree in the approptiate place

#delete
  accepts a value, searches the value in the tree and removes it.
  arranges the children of the deleted value, so that the tree stays ordered.

#find
  accepts a vaule and returns the node with the given value

#level_order
  accepts a block. traverses the tree in breadth-first level order and yield each node to the provided block. returns an array of values if no block is given.

#inorder
  accepts a block. returns an array of values if no block is given, otherwise returns the nodes in appropriate order

#preorder
   accepts a block. returns an array of values if no block is given, otherwise returns the nodes in appropriate order

#postorder
   accepts a block. returns an array of values if no block is given, otherwise returns the nodes in appropriate order

#height
  accepts a node and returns its heigth. (number of edges in longest path from a given node to a leaf node)

#depth
  accepts a node and returns its depth. (number of edges in path from a given node to the trees root node)

#balanced?
  checks if the tree is balanced. (difference between heights of left and rigth subtree of every node is not more than 1)

#rebalance
  rebalances an unbalanced tree.
  (uses traversal method to provide a new array to the #build_tree method)
