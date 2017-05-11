require_relative 'node'
class BinarySearchTree
  attr_reader   :root,
                :node
  def initialize
    @root = nil
    @node = node
  end

  def insert(score, title, current_node = @root)
    if @root.nil?
      @root = Node.new(score, title)
      return 0
    elsif score < current_node.score
      if current_node.left_link.nil?
        current_node.left_link = Node.new(score, title)
        return 1
      else
        current_node = current_node.left_link
        return 1 + insert(score, title, current_node)
      end
    else
      if current_node.right_link.nil?
        current_node.right_link = Node.new(score, title)
        return 1
      else
        current_node = current_node.right_link
        return 1 + insert(score, title, current_node)
      end
    end
  end

  def include?(score, current_node = @root)
    if current_node.nil?
      false
    elsif score == current_node.score
      true
    elsif score < current_node.score
      current_node = current_node.left_link
      include?(score, current_node)
    else
      current_node = current_node.right_link
      include?(score, current_node)
    end
  end

  def depth_of(score, current_node = @root)
    return nil if current_node.nil?
    if score == current_node.score
      return 0
    elsif score < current_node.score
      current_node = current_node.left_link
      return nil if depth_of(score, current_node).nil?
      return 1 + depth_of(score, current_node)
    else
      current_node = current_node.right_link
      return nil if depth_of(score, current_node).nil?
      return 1 + depth_of(score, current_node)
    end
  end

  def max(current_node = @root)
    if current_node.right_link.nil?
      max_hash = {}
      max_hash[current_node.title] = current_node.score
      return max_hash
    else
      current_node = current_node.right_link
      max(current_node)
    end
  end

  def min(current_node = @root)
    if current_node.left_link.nil?
      min_hash = {}
      min_hash[current_node.title] = current_node.score
      return min_hash
    else
      current_node = current_node.left_link
      min(current_node)
    end
  end
end
