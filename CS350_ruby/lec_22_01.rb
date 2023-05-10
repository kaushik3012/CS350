class ThreeDPoint
  def initialize x,y,z
    @x,@y,@z=x,y,z
  end

  alias old_handler method_missing


  #catch missing methods, add them, and then call them
  def method_missing key, *args
    name = key.to_s
    if name[0..2]=="get"
      var = name[3..-1]
      ThreeDPoint.class_eval "def #{name}; @#{var} end"
      send name.to_sym
    elsif name[0..2]=="set"
      var = name[3..-1]
      ThreeDPoint.class_eval "def #{name}(#{var}); @#{var}=#{args[0]} end"
      send name.to_sym, *args
    end
  end
end

p = ThreeDPoint.new 0,1,0
puts p.getx
puts p.getx
puts p.gety
puts p.getz
p.setx 1
puts "After set=#{p.getx}"
puts p



                                       
    
