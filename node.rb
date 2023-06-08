class Node
  include Comparable

  attr_accessor :value, :left_child, :right_child

  def initialize(value, left_child = nil, right_child = nil)
    @value = value
    @left_child = left_child
    @right_child = right_child
    #puts_children()
  end

  def <=>(value)
    self.value <=> value
  end

  def to_s
    puts "Node with value: #{self.value}, left: #{self.left_child.nil? ? 'nil' : self.left_child} , right: #{self.right_child.nil? ? 'nil' : self.right_child}"
  end

end