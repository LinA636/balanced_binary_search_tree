require_relative 'tree.rb'
require_relative 'node.rb'

tree = Tree.new(Array.new(15){rand(1..100)})
puts "tree balanced?: #{tree.balanced?}"
unless tree.balanced?
  tree.rebalance
  tree.pretty_print
end

puts "\nlevel_order:"
p tree.level_order{|node| node.value}

puts "\ninorder:"
p tree.inorder{|node| node.value}

puts "\npreorder:"
p tree.preorder{|node| node.value}

puts "\npostorder:"
p tree.postorder{|node| node.value}

val1 = 111
val2 = 222
val3 = 333
puts "\n adding #{val1}, #{val2} and #{val3}:"
tree.insert(val1)
tree.insert(val2)
tree.insert(val3)
tree.pretty_print

puts "\ntree balanced?: #{tree.balanced?}"
puts "rebalance:"
tree.rebalance
tree.pretty_print
puts "tree balanced?: #{tree.balanced?}"

puts "\nlevel_order:"
p tree.level_order{|node| node.value}

puts "\ninorder:"
p tree.inorder{|node| node.value}

puts "\npreorder:"
p tree.preorder{|node| node.value}

puts "\npostorder:"
p tree.postorder{|node| node.value}