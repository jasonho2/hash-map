class HashMap
  #attr_accessor :loadfactor, :capacity

  def initialize(loadfactor = 0.75, capacity = 16)
    @loadfactor = loadfactor
    @capacity = capacity
    @buckets = Array.new(@capacity) { [] }
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
       
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
       
    hash_code
  end

  def set(key, value)
    index = hash(key) % @capacity
    raise IndexError if index.negative? || index >= @buckets.length
    bucket = @buckets[index]

    bucket.each do |pair|
      if pair[0] == key
        pair[1] = value
      end
    end

    bucket << [key, value]
  end

end