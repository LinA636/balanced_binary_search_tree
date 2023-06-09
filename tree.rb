require_relative 'node.rb'

class Tree
  attr_accessor :root
  attr :order_array
  
  def initialize(array)
    @root = build_tree(array.uniq.sort)
    @order_array = []
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
    # returns numb of edges from node to furthest away leafe
    if node == nil 
      0
    elsif node.left_child == nil && node.right_child == nil
      0
    else
      height_left_subtree = 1 + height(node.left_child)
      height_rigth_subtree = 1 + height(node.right_child)
      height_left_subtree < height_rigth_subtree ? height_rigth_subtree : height_left_subtree
    end
  end

  def depth(current_node = self.root, node)
    # returns numb of edges from root to node
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

  def inorder(node = self.root, &block)
    if node == self.root && !self.order_array.empty?
      self.order_array = []
    end
    if block_given?
        inorder(node.left_child, &block) if node.left_child
        self.order_array << block.call(node) if node
        inorder(node.right_child, &block) if node.right_child
    else
        inorder(node.left_child) if node.left_child
        self.order_array << node if node
        inorder(node.right_child) if node.right_child
    end
    self.order_array
  end

  def preorder(node = self.root, &block)
    if node == self.root && !self.order_array.empty?
      self.order_array = []
    end
    if block_given?
      self.order_array << block.call(node) if node
      preorder(node.left_child, &block) if node.left_child
      preorder(node.right_child, &block) if node.right_child
    else
      self.order_array << node if node
      preorder(node.left_child) if node.left_child
      preorder(node.right_child) if node.right_child
    end
    self.order_array
  end

  def postorder(node = self.root, &block)
    if node == self.root && !self.order_array.empty?
      self.order_array = []
    end
    if block_given?
      postorder(node.left_child, &block) if node.left_child
      postorder(node.right_child, &block) if node.right_child
      self.order_array << block.call(node) if node
    else
      postorder(node.left_child) if node.left_child
      postorder(node.right_child) if node.right_child
      self.order_array << node if node
    end
    self.order_array
  end

  def level_order(node = self.root, &block)
    if node == self.root && !self.order_array.empty?
      self.order_array = []
    end
    if block_given?
      if node == nil
        self.order_array
      else
        num_of_levels = height()
        for i in 0 .. num_of_levels
          save_level(self.root, i, &block)
        end
      end
    else
      if node == nil
        self.order_array
      else
        num_of_levels = height()
        for i in 0 .. num_of_levels
          save_level(self.root, i)
        end
      end
    end
    self.order_array
  end

  def balanced?(node = self.root)
    if node == nil
      true
    else
      if node.left_child == nil && node.right_child == nil
        true        
      elsif height(node) > 1 && (node.left_child == nil || node.right_child == nil)
        false       
      else
        balanced?(node.left_child) && balanced?(node.right_child)
      end
    end
  end

  def rebalance
    unless balanced?
      self.root = build_tree(inorder{|node| node.value})
    end
  end

# PRIVATE METHODS
  private
  def order_array
    @order_array
  end

  def order_array=(arr)
    @order_array = arr
  end

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

  def save_level(node, level_no, &block)
    if block_given?
      if level_no == 0
        self.order_array << block.call(node)
      else
        save_level(node.left_child, level_no-1, &block) if node.left_child
        save_level(node.right_child, level_no-1, &block) if node.right_child
      end
    else
      if level_no == 0
        self.order_array << node
      else
        save_level(node.left_child, level_no-1) if node.left_child
        save_level(node.right_child, level_no-1) if node.right_child
      end
    end
  end

end