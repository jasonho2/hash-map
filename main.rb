require_relative 'lib/hashmap.rb'

test = HashMap.new

test.set('apple', 'red')
test.set('banana', 'yellow')

puts test.inspect