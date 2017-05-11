require_relative 'binarysearchtree'
class Node

  attr_reader    :score,
                 :title

  attr_accessor  :right_link,
                 :left_link

  def initialize(score, title)
    @score      = score
    @title      = title
    @left_link  = left_link
    @right_link = right_link
  end
end
