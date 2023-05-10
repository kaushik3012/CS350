# basic class


class Color
  @@lookup_table={
    "red"=>{"blue"=>"magenta","green"=>"yellow","red"=>"red"},
    "green"=>{"blue"=>"cyan","green"=>"green","red"=>"yellow"},
    "blue"=>{"blue"=>"blue","green"=>"cyan","red"=>"magenta"}}

  def Color.identify
    return "class Color"
  end
  
  # @name is an instance variable
  def initialize (str)
    @name = str
  end
  def identify 
    return @name
  end
  def rename(newName)
    @name = newName
  end
  def blend(other_color)
    return @@lookup_table[identify][other_color.identify]
  end
  def Color.blend2(color1, color2)
    return @@lookup_table[color1.identify][color2.identify]
  end
end

redColor = Color.new("red")   # new calls initialize
blueColor = Color.new("blue")




puts redColor.class.identify
puts blueColor.class.identify
puts redColor.identify
puts blueColor.identify

#puts redColor.@name # error

puts "red and blue blend to form #{redColor.blend(blueColor)}"
puts "red and blue blend to form #{Color.blend2(redColor,blueColor)}"

# redColor2 = redColor
# redColor.rename("cyan")
# puts redColor2.identify





# initialize is a private method. It cannot be called directly

#puts redColor.identify
#puts blueColor.identify



# we can ask for the class of any object
# puts redColor.class
# puts redColor.class.superclass
# puts redColor.class.superclass.class
# puts redColor.class.superclass.class.superclass
# puts redColor.class.superclass.class.superclass.class



#puts redColor.methods
#puts redColor.nil?

# # we can ask an object for its methods
# # where did all these methods come from?
# # == use the "up" versus "off to the right" contrast
# puts redColor.methods
# puts redColor.class.superclass


# # testing class method usage

# puts redColor.blend(blueColor)

