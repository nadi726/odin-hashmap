# frozen_string_literal: true

require_relative 'hashmap'

# A simple hashset implementation - delegates method to a HashMap, with nil values
class HashSet
  def initialize
    @hashmap = HashMap.new
  end

  def add(element)
    @hashmap.set(element, nil)
  end

  def has?(element)
    @hashmap.has?(element)
  end

  def remove(element)
    @hashmap.remove element
  end

  def length
    @hashmap.length
  end

  def clear
    @hashmap = HashMap.new
  end

  def to_a
    @hashmap.keys
  end

  def to_s
    to_a.to_s
  end
end
