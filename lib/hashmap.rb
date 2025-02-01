class HashMap
  attr_accessor :loadfactor, :capacity

  def initialize(loadfactor = nil, capacity = nil)
    @loadfactor = loadfactor
    @capacity = capacity
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
       
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
       
    hash_code
  end 

end