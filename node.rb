class Node
  include Comparable

  attr_accessor :value, :left_child, :right_child

  def initialize(value, left_child = nil, right_child = nil)
    @value = value
    @left_child = left_child
    @right_child = right_child
  end

  def <=>(value)
    if Node === value
      self.value <=> value.value
    else
      self.value <=> value
    end
  end

  def to_s
    "Node with value: #{self.value}, left: #{self.left_child.nil? ? 'nil' : self.left_child.value} , right: #{self.right_child.nil? ? 'nil' : self.right_child.value}"
  end

end