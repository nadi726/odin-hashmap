require_relative 'lib/hashmap'
require_relative 'lib/hashset'

test = HashMap.new

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')
test.set('lion', 'goldenROCK')

puts test
p test.get('apple')
p test.get('lion')
p test.get('ha')

p test.has?('kite')
p test.has?('kitte')

test.remove('lion')
p test.get('lion')

p test.length
p HashMap.new.length

p test.keys
p test.values
p test.entries

test.set('Bucket', 'ha')
test.set('hello', 'hi')
test.set('AAAAAAAAA', 'a')
test.set('Walla', 'hi')

puts test
p test.get('apple')
p test.get('lion')
p test.get('ha')

p test.has?('kite')
p test.has?('kitte')

test.remove('lion')
p test.get('lion')

p test.length
p HashMap.new.length

p test.keys
p test.values
p test.entries

hashset = HashSet.new
hashset.add 'a'
hashset.add 'b'

hashset.add 'c'
hashset.add 'd'
hashset.add 'e'
hashset.add 'f'
hashset.add 'g'
hashset.add 'h'
hashset.add 'i'
hashset.add '1'
hashset.add '2'
hashset.add '3'
hashset.add '5'
hashset.add '7'
hashset.add 'edwxsa'

puts hashset
puts hashset.length
hashset.add 'a'
puts hashset.length
puts hashset.has? '3'
puts hashset.has? '4'
