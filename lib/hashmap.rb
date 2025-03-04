class HashMap
  #attr_accessor :loadfactor, :capacity

  def initialize(loadfactor = 0.75, capacity = 16)
    @loadfactor = loadfactor
    @capacity = capacity
    @buckets = Array.new(@capacity) { [] }
    @count = 0
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
        return
      end
    end

    bucket << [key, value]
    @count += 1

    # if the capacity and load factor are exceeded, double capacity and rehash
    if (@capacity * @loadfactor) < @count
      old_buckets = @buckets
      @capacity *= 2
      @buckets = Array.new(@capacity) { [] }
      @count = 0

      old_buckets.each do |pair|
        pair.each do |key, value|
          set(key, value)
        end
      end
    end
    
  end

  def get(key)
    index = hash(key) % @capacity
    raise IndexError if index.negative? || index >= @buckets.length
    bucket = @buckets[index]

    bucket.each do |pair|
      return pair[1] if pair[0] == key
    end

    return nil
  end

  def has?(key)
    index = hash(key) % @capacity
    raise IndexError if index.negative? || index >= @buckets.length
    bucket = @buckets[index]

    bucket.each do |pair|
      return true if pair[0] == key
    end

    return false
  end

  def remove(key)
    index = hash(key) % @capacity
    raise IndexError if index.negative? || index >= @buckets.length
    bucket = @buckets[index]

    bucket.each_with_index do |pair, i|
      if pair[0] == key
        puts "[key, value] removed: #{pair}"
        bucket.delete_at(i)
        @count -= 1
        break
      end
    end
  end

  def length
    @count
  end

  def clear
    @buckets = Array.new(@capacity) { [] }
    @count = 0
  end

  def keys
    keys = []

    @buckets.each do |pair|
      pair.each do |key, value|
        if key
          keys << key
        end
      end
    end

    p keys
  end

  def values
    values = []

    @buckets.each do |pair|
      pair.each do |key, value|
        if key
          values << value
        end
      end
    end

    p values
  end

  def entries
    entries = []

    @buckets.each do |pair|
      pair.each do |key, value|
        if key
          entries << [key, value]
        end
      end
    end

    p entries
  end

end