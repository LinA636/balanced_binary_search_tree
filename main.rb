require_relative 'tree.rb'
require_relative 'node.rb'


array = (Array.new(15) { rand(1..100) })
array = [1,4,23,67,43, 75,23,65,34, 65]
#array = [1, 2, 3]
tree = Tree.new(array)
# root does not take the actual root but the smallest one

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
