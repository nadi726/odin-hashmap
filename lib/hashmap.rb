# frozen_string_literal: true

require_relative 'linked_list'

# A basic hashmap implementation
class HashMap
  def initialize(load_factor = 0.8)
    @load_factor = load_factor
    @capacity = 16
    @buckets = Array.new(@capacity) { LinkedList.new }
  end

  # Sets a node with given key to have given value
  #
  # If a node with the given key already exists, override it with the new value
  # If no such node exists, make a new node with the given key & value
  def set(key, value)
    list = get_list key
    list_node = list.find(key)

    if list_node.nil?
      list.append(key, value)
    else
      list_node.value = value
    end

    return unless length > @capacity * @load_factor

    grow
  end

  # Return the value of the node with the given key, or nil if no such key exists
  def get(key)
    list = get_list key
    list_node = list.find(key)
    list_node&.value
  end

  # Return true if there exists a node with the given key, false otherwise
  def has?(key)
    get_list(key)&.contains?(key) || false
  end

  # Remove the node with the given key (if it exists)
  def remove(key)
    list = get_list key
    list&.remove(key)
  end

  # Returns the total number of nodes in the hashmap
  def length
    @buckets.sum(&:size)
  end

  # Remove all existing nodes
  def clear
    @buckets = Array.new(@capacity) { LinkedList.new }
  end

  # Return an array of all the keys
  def keys
    @buckets.sum([]) { |list| list.map(&:key) }
  end

  # Return an array of all the values
  def values
    @buckets.sum([]) { |list| list.map(&:value) }
  end

  # Return an array of key-value pairs: [key, value]
  def entries
    @buckets.sum([]) { |list| list.map { |node| [node.key, node.value] } }
  end

  # A string representation of the hashmap
  def to_s
    @buckets.map.with_index { |list, index| "#{index}: #{list}" }.join("\n")
  end

  private

  # Make sure that we're not taking advantage of rubby's automatic array capacity growing
  def validate_bucket(index)
    raise IndexError if index.negative? || index >= @buckets.length

    @buckets[index]
  end

  # The hashmap's hash function
  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = (prime_number * hash_code) + char.ord }

    hash_code % @capacity
  end

  # Returns the linked list corresponding to the given key's bucket index
  def get_list(key)
    bucket_index = hash(key)
    validate_bucket(bucket_index)
    @buckets[bucket_index]
  end

  # Doubles the size of the hashmap, rehashing all the key-value pairs
  def grow
    @capacity *= 2
    current_entries = entries
    @buckets = Array.new(@capacity) { LinkedList.new }
    current_entries.each do |key, value|
      bucket_index = hash(key)
      @buckets[bucket_index].append(key, value)
    end
  end
end
