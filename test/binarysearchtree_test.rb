require 'minitest/autorun'
require 'minitest/pride'
require '../lib/node'
require '../lib/binarysearchtree'

class BinarySearchTreeTest < Minitest::Test
  def test_root_is_nil_by_default
    tree = BinarySearchTree.new

    result = tree.root

    assert_nil result
  end

  def test_inserts_a_root_node
    tree = BinarySearchTree.new

    tree.insert(45, 'Bad Movie')

    assert_equal 45, tree.root.score
    assert_equal 'Bad Movie', tree.root.title
  end

  def test_insert_adds_2_nodes_1_left
    tree = BinarySearchTree.new

    tree.insert(45, 'Bad Movie')
    tree.insert(30, 'Worst Movie')

    assert_equal 45, tree.root.score
    assert_equal 'Bad Movie', tree.root.title
    assert_equal 30, tree.root.left_link.score
    assert_equal 'Worst Movie', tree.root.left_link.title
  end

  def test_insert_adds_2_nodes_1_right
    tree = BinarySearchTree.new

    tree.insert(45, 'Bad Movie')
    tree.insert(60, 'Best Movie')

    assert_equal 45, tree.root.score
    assert_equal 'Bad Movie', tree.root.title
    assert_equal 60, tree.root.right_link.score
    assert_equal 'Best Movie', tree.root.right_link.title
  end

  def test_instert_adds_5_nodes
    tree = BinarySearchTree.new

    tree.insert(45, 'Bad Movie')
    tree.insert(60, 'Best Movie')
    tree.insert(50, 'Meh Movie')
    tree.insert(25, 'Worstest Movie')
    tree.insert(30, 'Worst Movie')

    assert_equal 45, tree.root.score
    assert_equal 'Bad Movie', tree.root.title
    assert_equal 60, tree.root.right_link.score
    assert_equal 'Best Movie', tree.root.right_link.title
    assert_equal 50, tree.root.right_link.left_link.score
    assert_equal 'Meh Movie', tree.root.right_link.left_link.title
    assert_equal 25, tree.root.left_link.score
    assert_equal 'Worstest Movie', tree.root.left_link.title
    assert_equal 30, tree.root.left_link.right_link.score
    assert_equal 'Worst Movie', tree.root.left_link.right_link.title
  end

  def test_insert_returns_depth_of_new_node

    tree = BinarySearchTree.new

    depth_1 = tree.insert(45, 'Bad Movie')
    depth_2 = tree.insert(60, 'Best Movie')
    depth_3 = tree.insert(50, 'Meh Movie')
    depth_4 = tree.insert(25, 'Worstest Movie')
    depth_5 = tree.insert(30, 'Worst Movie')

    assert_equal 0, depth_1
    assert_equal 1, depth_2
    assert_equal 2, depth_3
    assert_equal 1, depth_4
    assert_equal 2, depth_5
  end

  def test_returns_true_if_1_score_exists
    tree = BinarySearchTree.new

    tree.insert(45, 'Bad Movie')

    assert_equal true, tree.include?(45)
  end

  def test_returns_false_if_1_score_does_not_exist
    tree = BinarySearchTree.new

    tree.insert(45, 'Bad Movie')

    assert_equal false, tree.include?(60)
  end

  def test_returns_true_if_3_score_exists
    tree = BinarySearchTree.new

    tree.insert(45, 'Bad Movie')
    tree.insert(60, 'Best Movie')
    tree.insert(25, 'Worstest Movie')

    assert_equal true, tree.include?(45)
    assert_equal true, tree.include?(60)
    assert_equal true, tree.include?(25)
  end

  def test_returns_false_if_3_score_does_not_exist
    tree = BinarySearchTree.new

    tree.insert(45, 'Bad Movie')
    tree.insert(60, 'Best Movie')
    tree.insert(25, 'Worstest Movie')

    assert_equal false, tree.include?(20)
    assert_equal false, tree.include?(30)
    assert_equal false, tree.include?(80)
    end

  def test_returns_true_if_5_score_exists
    tree = BinarySearchTree.new

    tree.insert(45, 'Bad Movie')
    tree.insert(60, 'Best Movie')
    tree.insert(50, 'Meh Movie')
    tree.insert(25, 'Worstest Movie')
    tree.insert(30, 'Worst Movie')

    assert_equal true, tree.include?(45)
    assert_equal true, tree.include?(60)
    assert_equal true, tree.include?(50)
    assert_equal true, tree.include?(25)
    assert_equal true, tree.include?(30)
  end

  def test_returns_false_if_5_score_does_not_exist
    tree = BinarySearchTree.new

    tree.insert(45, 'Bad Movie')
    tree.insert(60, 'Best Movie')
    tree.insert(50, 'Meh Movie')
    tree.insert(25, 'Worstest Movie')
    tree.insert(30, 'Worst Movie')

    assert_equal false, tree.include?(20)
    assert_equal false, tree.include?(35)
    assert_equal false, tree.include?(63)
    assert_equal false, tree.include?(52)
    assert_equal false, tree.include?(18)
  end

  def test_depth_returns_depth_location_for_1_node
    tree = BinarySearchTree.new

    tree.insert(45, 'Bad Movie')

    assert_equal 0, tree.depth_of(45)
  end

  def test_depth_returns_depth_location_for_2_nodes
    tree = BinarySearchTree.new

    tree.insert(45, 'Bad Movie')
    tree.insert(60, 'Best Movie')

    assert_equal 0, tree.depth_of(45)
    assert_equal 1, tree.depth_of(60)
  end

  def test_depth_returns_depth_location_for_5_nodes
    tree = BinarySearchTree.new

    tree.insert(45, 'Bad Movie')
    tree.insert(60, 'Best Movie')
    tree.insert(50, 'Meh Movie')
    tree.insert(25, 'Worstest Movie')
    tree.insert(30, 'Worst Movie')

    assert_equal 0, tree.depth_of(45)
    assert_equal 1, tree.depth_of(60)
    assert_equal 2, tree.depth_of(50)
    assert_equal 1, tree.depth_of(25)
    assert_equal 2, tree.depth_of(30)
  end

  def test_depth_returns_nil_location_for_1_nonexistent_node
    tree = BinarySearchTree.new

    tree.insert(45, 'Bad Movie')

    assert_nil tree.depth_of(50)
  end

  def test_depth_returns_nil_location_for_2_nonexistent_node
    tree = BinarySearchTree.new

    tree.insert(45, 'Bad Movie')
    tree.insert(60, 'Best Movie')

    assert_nil tree.depth_of(50)
    assert_nil tree.depth_of(20)
  end

  def test_depth_returns_nil_location_for_5_nonexistent_node
    tree = BinarySearchTree.new

    tree.insert(45, 'Bad Movie')
    tree.insert(60, 'Best Movie')
    tree.insert(50, 'Meh Movie')
    tree.insert(25, 'Worstest Movie')
    tree.insert(30, 'Worst Movie')

    assert_nil tree.depth_of(29)
    assert_nil tree.depth_of(56)
    assert_nil tree.depth_of(37)
    assert_nil tree.depth_of(104)
    assert_nil tree.depth_of(15)
  end

  def test_max_returns_highest_score_1_node
    tree = BinarySearchTree.new

    tree.insert(45, 'Bad Movie')

    max_hash = {}
    max_hash['Bad Movie'] = 45

    assert_equal max_hash, tree.max
  end

  def test_max_returns_highest_score_2_node
    tree = BinarySearchTree.new

    tree.insert(45, 'Bad Movie')
    tree.insert(60, 'Best Movie')

    max_hash = {}
    max_hash['Best Movie'] = 60

    assert_equal max_hash, tree.max
  end

  def test_max_returns_highest_score_5_node
    tree = BinarySearchTree.new

    tree.insert(45, 'Bad Movie')
    tree.insert(60, 'Best Movie')
    tree.insert(50, 'Meh Movie')
    tree.insert(25, 'Worstest Movie')
    tree.insert(30, 'Worst Movie')

    max_hash = {}
    max_hash['Best Movie'] = 60

    assert_equal max_hash, tree.max
  end

  def test_max_returns_highest_score_1_node
    tree = BinarySearchTree.new

    tree.insert(45, 'Bad Movie')

    min_hash = {}
    min_hash['Bad Movie'] = 45

    assert_equal min_hash, tree.max
  end

  def test_max_returns_highest_score_2_node
    tree = BinarySearchTree.new

    tree.insert(45, 'Bad Movie')
    tree.insert(60, 'Best Movie')

    max_hash = {}
    max_hash['Best Movie'] = 60

    assert_equal max_hash, tree.max
  end

  def test_max_returns_highest_score_5_node
    tree = BinarySearchTree.new

    tree.insert(45, 'Bad Movie')
    tree.insert(60, 'Best Movie')
    tree.insert(50, 'Meh Movie')
    tree.insert(25, 'Worstest Movie')
    tree.insert(30, 'Worst Movie')

    max_hash = {}
    max_hash['Best Movie'] = 60

    assert_equal max_hash, tree.max
  end
end
