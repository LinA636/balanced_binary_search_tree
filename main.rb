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
puts tree.balanced?

tree.delete(67)
puts tree.balanced?
tree.delete(75)
tree.pretty_print()

puts tree.balanced?

tree2 = Tree.new([2,3, 4, 5])
puts tree2.balanced?
tree2.insert(1)
tree2.pretty_print()
puts tree2.balanced?