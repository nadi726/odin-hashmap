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

  # Adds a node to the beginnig of the list
  def prepend(key, value)
    @head = Node.new(key, value, @head)
  end

  # Returns the number of nodes
  def size
    return 0 if @head.nil?

    @head.size
  end

  # Return the first node in the list
  attr_reader :head

  # Return the last node in the list
  def tail
    return nil if @head.nil?

    node = @head
    node = node.next_node until node.next_node.nil?
    node
  end

  # Return the node at the given index
  def at(index)
    return nil if @head.nil? || index.negative?

    node = @head
    until node.nil? || index.zero?
      index -= 1
      node = node.next_node
    end
    node
  end

  # Remove the last node and return its value
  def pop
    return nil if @head.nil?

    # If there's only one element, we need to update the head
    if @head.end?
      @head = nil
      return node.value
    end

    node = @head
    node = node.next_node until node.next_node&.end?

    # Remove and return the last node
    last_node = node.next_node
    node.next_node = nil
    last_node&.value
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

  # returns the index of the node containing key, or nil if not found
  def find_index(key)
    return nil if @head.nil?

    index = 0
    node = @head
    until node.nil?
      return index if node.key == key

      index += 1
      node = node.next_node
    end
    nil
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

  def insert_at(key, value, index)
    return prepend(value) if index.zero?

    prev_node = at(index - 1)
    return nil if prev_node.nil?

    node = Node.new(key, value, prev_node.next_node)
    prev_node.next_node = node
  end

  def remove_at(index)
    if index.zero?
      removed = @head
      @head = @head&.next_node
      return removed&.value
    end

    prev_node = at(index - 1)
    return nil if prev_node.nil? || prev_node.next_node.nil?

    removed = prev_node.next_node
    prev_node.next_node = removed.next_node
    removed.value
  end

  def remove(key)
    return if @head.nil?

    if @head.key == key
      value = @head.value
      @head = nil
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
  end

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
