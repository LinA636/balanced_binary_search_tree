require_relative 'tree.rb'
require_relative 'node.rb'


array = (Array.new(15) { rand(1..100) })
array = [1,4,23,67,43, 75,23,65,34, 65]
tree = Tree.new(array)

tree.insert(30)
tree.insert(77)
tree.insert(35)
tree.insert(64)
tree.insert(66)
tree.pretty_print()

puts tree.find(30)

value = 66
puts "height of #{value}: #{tree.height(tree.find(value))}"
puts "depths of #{value}: #{tree.depth(tree.find(value))}"

array2 = [10, 20, 30, 100, 150, 200, 300]
tree2 = Tree.new(array2)
#puts tree2.level_order
puts tree2.inorder
puts ''
puts tree2.preorder
puts
puts tree2.postorder