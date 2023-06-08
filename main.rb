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

puts "\n"

array2 = [1, 2, 3, 4, 5, 6, 7]
tree2 = Tree.new(array2)
tree2.delete(2)
tree2.pretty_print
tree2.delete(3)
tree2.pretty_print
tree2.delete(5)
tree2.pretty_print
tree2.delete(6)
tree2.pretty_print
