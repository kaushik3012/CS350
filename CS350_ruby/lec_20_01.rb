# demonstrates method overriding, and how overloading should have worked

def delimit
  50.times {printf "="}
  puts ""
end

class Building
  def initialize numFloors, capacity
    @numFloors = numFloors
    @capacity  = capacity
  end

  def occupancy
    puts "Inside Building"
    puts self
    return @capacity + helperFunction
  end

  # def to_s
  #   return "Building"
  # end

  def helperFunction
    return 0
  end

  private :helperFunction
        
end


class House < Building
  def initialize numFloors, capacity
    super numFloors, capacity
    @capacity = 2
  end
end


class Hotel < Building
  def initialize numFloors, capacity, numRooms
    super numFloors, capacity
    @numRooms = numRooms
    @emptyRooms = Array.new(0)
    @numRooms.times {|i| @emptyRooms[i] = i} # add all rooms as empty
  end
  def rent roomId
    if @emptyRooms.include? roomId
      @emptyRooms.reject! {|i| i==roomId}
    end
  end
  def free roomId
    if @emptyRooms.include? roomId == false
      @emptyRooms.add roomId
    end
  end

  # # Does ruby support overloading?
  # def occupancy floor
  #   return "canot give that information"
  # end

  def occupancy
    puts self
    return (@capacity - (@emptyRooms.length*2))
  end


end


# overriding
inn = Hotel.new 3, 60, 30
puts inn.occupancy
inn.rent 3
puts inn.occupancy 
delimit
# method lookup in the superclass
sweetHome = House.new 1, 5
puts "My house has #{sweetHome.occupancy} occupants" # note how self behaves


inn2 = Hotel.new 3, 80, 40

def inn2.usePool
  puts "under maintenance"
end

#inn.usePool
inn2.usePool


def Hotel.code
  return -1
end

puts Hotel.code

delimit

puts inn.singleton_methods
puts inn2.singleton_methods

delimit

puts Hotel.singleton_methods
puts Hotel.methods
