require_relative 'lib/hashmap.rb'

test = HashMap.new

#puts test.inspect

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

puts test.inspect

test.set('grape', 'green')
puts test.inspect
puts test.length

test.set('moon', 'silver')
puts test.inspect
puts test.length

puts test.get('hat')

puts test.has?('frog')
puts test.has?('bean')

puts test.remove('kite')
puts test.inspect

puts test.length

test.keys
test.values

test.entries

# clear the HashMap and inspect
test.clear
puts test.inspect