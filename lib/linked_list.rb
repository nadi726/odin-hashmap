# frozen_string_literal: true

require_relative 'node'
# A classic singly-linked list
class LinkedList
  def initialize
    @head = nil
  end

  # Adds a node to the end of the list
  def append(key, value)
    if @head.nil?
      @head = Node.new(key, value, nil)
    else
      @head.append(key, value)
    end
  end

  # Returns the number of nodes
  def size
    return 0 if @head.nil?

    @head.size
  end

  # Return false if there's a node with the given key
  def contains?(key)
    return false if @head.nil?

    node = @head
    until node.nil?
      return true if node.key == key

      node = node.next_node
    end

    false
  end

  # Returns the node containing key, or nil if not found
  def find(key)
    return nil if @head.nil?

    node = @head
    until node.nil?
      return node if node.key == key

      node = node.next_node
    end
    nil
  end

  def to_s
    return 'nil' if @head.nil?

    str = ''
    node = @head
    until node.nil?
      str += "( #{node.key}: #{node.value} ) -> "
      node = node.next_node
    end
    "#{str}nil"
  end

  # Remove and return the node with the given key, or nil if none were found
  def remove(key) # rubocop:disable Metrics/MethodLength
    return nil if @head.nil?

    if @head.key == key
      value = @head.value
      @head = @head.next_node
      return value
    end

    node = @head
    while node.next_node
      if node.next_node.key == key
        value = node.next_node.value
        node.next_node = node.next_node.next_node
        return value
      end
      node = node.next_node
    end

    nil
  end

  # takes a block and maps each node to an array
  def map
    arr = []
    node = @head
    return arr if node.nil?

    while node
      arr.append(yield node)
      node = node.next_node
    end
    arr
  end
end
