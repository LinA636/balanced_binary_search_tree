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

  def delete(node = self.root, value)
    if node == nil
      nil
    # delete a child
    elsif node > value
      if node.left_child == value
        node.left_child = delete_child(node.left_child)
      elsif
        delete(node.left_child, value)
      end
    elsif node < value
      if node.right_child == value
        node.right_child = delete_child(node.right_child)
      else
        delete(node.right_child, value)
      end
    else
      # delete root
      add_to_subtree(node.right_child, node.left_child.right_child)
      self.root = node.left_child
      self.root.right_child = node.right_child
    end      
  end

  def delete_child(node)
    if node.left_child == nil && node.right_child == nil
      # delete leafe (child without children)
      nil
    elsif node == nil
      # delete child with only right_child
      node.right_child
    elsif node.right_child == nil
      # delete chilt with only left_chil
      node.left_child
    else
      # delete child with two children
      add_to_subtree(node.right_child, node.left_child)
      node.right_child
    end
  end

  def find(node = self.root, value)
    if node == nil
      "this node does not exist"
    elsif node == value
      node
    elsif node < value
      find(node.right_child, value)
    else
      find(node.left_child, value)
    end
  end

  def height(node = self.root)
    if node == nil
      0
    elsif node.left_child == nil && node.right_child == nil
      1
    else
      height_left_subtree = 1 + height(node.left_child)
      height_rigth_subtree = 1 + height(node.right_child)
      height_left_subtree < height_rigth_subtree ? height_rigth_subtree : height_left_subtree
    end
  end

  def depth(current_node = self.root, node)
    if current_node == node
      1
    elsif current_node < node
      1 + depth(current_node.right_child, node)
    elsif current_node > node 
      1 + depth(current_node.left_child, node)
    else
      0
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
        build_tree(array[0..half_length-1]),
        build_tree(array[half_length+1..-1]))
    end
  end

  def add_to_subtree(current_node, node_to_add)
    if node_to_add == nil
      nil
    elsif current_node < node_to_add
      if current_node.right_child == nil
        current_node.right_child = node_to_add
      else
        add_to_subtree(current_node.right_child, node_to_add)
      end
    else
      if current_node.left_child == nil
        current_node.left_child = node_to_add
      else
        add_to_subtree(current_node.left_child, node_to_add)
      end
    end
  end


end