puts 'Hello World'                  # self is main
puts self
class A
  puts self                         # self is now the class A

  def name=(str)
   @name = str                      # instance method. when it is
                                    # called, self will be the receiver
   puts self                 
  end
end

puts 'Hi there'                     # self is main
puts self
a = A.new

a.name=("Hello")                      # when a.name= executes, self
                                    # changes to a. Check the output 
                                    # to see that self changes during
                                    # the method call.
