class HashMap
  attr_accessor :loadfactor, :capacity

  def initialize(loadfactor = nil, capacity = nil)
    @loadfactor = loadfactor
    @capacity = capacity
  end
  
end