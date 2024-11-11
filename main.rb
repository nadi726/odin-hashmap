require_relative 'lib/hashmap'

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
test.set('hahahaha', 'ha')
test.set('Bucket', 'ha')

# p test
p test.get('apple')
p test.get('lion')
p test.get('ha')

p test.has?('kite')
p test.has?('kitte')

test.remove('lion')
p test.get('lion')

p test.length
p HashMap.new.length
