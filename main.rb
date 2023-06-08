require_relative 'tree.rb'


array = (Array.new(15) { rand(1..100) })
array = [1,4,23,67,43, 75,23,65,34, 65]
#array = [1, 2, 3]
tree = Tree.new(array)

tree.insert(30)
tree.pretty_print()

