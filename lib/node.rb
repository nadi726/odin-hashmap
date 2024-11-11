# frozen_string_literal: true

# A Node in a Linked List
class Node
  attr_reader :key
  attr_accessor :value, :next_node

  def initialize(key, value, next_node)
    @key = key
    @value = value
    @next_node = next_node
  end

  def append(key, value)
    if @next_node.nil?
      @next_node = Node.new(key, value, nil)
      return
    end
    @next_node.append(key, value)
  end

  def size
    @next_node.nil? ? 1 : 1 + @next_node.size
  end

  def end?
    @next_node.nil?
  end
end
