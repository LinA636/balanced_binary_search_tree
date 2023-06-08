require_relative 'node.rb'

class Tree
  attr_accessor :root
  
  def initialize(array)
    @root = build_tree(array.uniq.sort)
    pretty_print()
  end

  public
  def pretty_print(node = self.root, prefix = '', is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end

  def insert(node = self.root, value)
    if node == nil
      node = Node.new(value)
    elsif node > value
      if node.left_child == nil
        node.left_child = insert(node.left_child, value)
      else
        insert(node.left_child, value)
      end
    elsif node < value
      if node.right_child == nil
        node.right_child = insert(node.right_child, value)
      else
        insert(node.right_child, value)
      end
    end
  end

  private
  def build_tree(array)
    if array.length == 0
      nil
    elsif array.length == 1
      Node.new(array[0])
    elsif array.length == 2
      Node.new(
        array[1], 
        Node.new(array[0]))      
    else
      half_length = array.length/2
      Node.new(
        array[half_length],
        build_subtree(array[0..half_length-1]),
        build_subtree(array[half_length+1..-1]))
    end
  end

  def build_subtree(array)
    if array.length == 0
      nil
    elsif array.length == 1
      Node.new(array[0])
    elsif array.length == 2
      Node.new(
        array[1], 
        Node.new(array[0]))      
    else
      half_length = array.length/2
      Node.new(
        array[half_length],
        build_tree(array[0..half_length-1]),
        build_tree(array[half_length+1..-1]))
    end
  end


end