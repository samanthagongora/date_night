require "minitest/autorun"
require "minitest/pride"
require "../lib/node"

class NodeTest < Minitest::Test
  def test_node_has_score_and_movie
    node = Node.new(61, "Independence Day")

    assert_equal 61, node.score
    assert_equal "Independence Day", node.title
  end

  def test_node_has_different_score_and_movie
    node = Node.new(95, "Scott Pilgrim")

    assert_equal 95, node.score
    assert_equal "Scott Pilgrim", node.title
  end

  def test_node_has_nil_links_by_default
    node = Node.new(95, "Scott Pilgrim")

    assert_nil node.left_link
    assert_nil node.right_link
  end

  def test_sets_left_link
    root = Node.new(30, 'Ground Hog Day')

    left_node = Node.new(15, 'Bad Movie')

    left_node = root.left_link

    assert_equal left_node, root.left_link
  end

end
