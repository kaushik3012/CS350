

class Vehicle
  def initialize(brand,numWheels)
    @brand = brand
    @numWheels = numWheels
  end
  def to_s
    return "The brand is #{@brand}, with #{@numWheels} wheels"
  end
end


# mnemonic for the < symbol:
# Vehicles are a superset of cars

class Car < Vehicle
  def initialize(brand, numWheels, numSeats)
    super brand, numWheels
    @numSeats = numSeats
  end

  def taxi?
    @numSeats >= 4
  end

  #if this works, then instance variables in Ruby have protected visibility
  #otherwise they are private
  def to_s
    return (super)+" able to carry " + @numSeats.to_s + "."
  end
end

class Jeep < Vehicle
  def initialize(brand, numWheels, numSeats, is4x4)
    super brand, numWheels
    @numSeats = numSeats
    @hasFourWheelDrive = is4x4
  end


  def offRoad?
    @hasFourWheelDrive
  end
end


myCar = Car.new("Maruti Suzuki Alto", 4, 4)
puts myCar
puts myCar.taxi?


myJeep = Jeep.new("Force Gurkha", 4, 8, true )
