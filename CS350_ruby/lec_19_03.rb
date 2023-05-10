class Color
  def initialize(s)
    @name=s
  end
  def identify
    return @name
  end
  def ===(c)
    return @name==c.identify
  end
end

red = Color.new("red")
deeperRed = Color.new("red")
puts red === deeperRed
