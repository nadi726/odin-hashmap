# frozen_string_literal: true

require_relative 'linked_list'

# A basic hashmap implementation
class HashMap
  def initialize(load_factor = 0.8)
    @load_factor = load_factor
    @capacity = 16
    @buckets = Array.new(@capacity) { LinkedList.new }
  end

  def validate_bucket(index)
    raise IndexError if index.negative? || index >= @buckets.length

    @buckets[index]
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = (prime_number * hash_code) + char.ord }

    hash_code % @capacity
  end

  def get_list(key)
    bucket_index = hash(key)
    validate_bucket(bucket_index)
    @buckets[bucket_index]
  end

  def set(key, value)
    list = get_list key
    list_node = list.find(key)

    if list_node.nil?
      list.append(key, value)
    else
      list_node.value = value
    end
  end

  def get(key)
    list = get_list key
    list_node = list.find(key)
    list_node&.value
  end

  def has?(key)
    get_list(key)&.contains?(key) || false
  end

  def remove(key)
    list = get_list key
    list&.remove(key)
  end
end
