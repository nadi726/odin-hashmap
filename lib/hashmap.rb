# frozen_string_literal: true

# A basic hashmap implementation
class HashMap
  def initialize
    @buckets
  end

  def get_bucket(index)
    raise IndexError if index.negative? || index >= @buckets.length

    @buckets[index]
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = (prime_number * hash_code) + char.ord }

    hash_code
  end
end
