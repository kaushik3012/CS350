# methods in ruby

def add(a, b)
  return a + b
end


j = add( 3, 4 )

# whitespace can cause issues: the following line is a syntax error
# j = add ( 3, 4 )
# beacuse of the space between the function name and the open parantheses


puts j


# on the other hand, you can omit parantheses

k = add 4, 8

puts k


# The following is a function with default arguments.

def boiling_point(liquid="water", scale="celsius")
  if liquid == "water" then
    if scale == "celsius" then
      return 100
    elsif scale == "kelvin" then
      return 373.2
    else
      return 212
    end
  else
    return "data missing"
  end
end



puts boiling_point
puts boiling_point(liquid="water","kelvin") # not every argument needs to be labelled


# associating methods with blocks
# 0 stands for arithemetic progression
# 1 stands for geometric progression
def gp_or_ap(n,r,k,progression=0)
  
  if progression == 0 then
    return (0..(k-1)).collect {|m| n+r*m} # note upper limit behavior
  else
    return (1..(k-1)).collect {|m| n*(r**(m-1))}
  end
end


puts "#{gp_or_ap(1,2,10,progression=1)}"
puts "#{gp_or_ap(1,2,10,progression=0)}"




# Advanced: passing blocks as arguments
# to get the result, use yield() with arugments that
# we need to pass to the block.
  
def do_this(k,&block)
  return (0..(k-1)).collect { |m| yield(m) }
end


puts "#{do_this(10) {|m| 1+2*m} }"


