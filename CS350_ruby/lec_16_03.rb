# run using
#   ruby <filename>



# demonstrates the output of formatted messages
def greet ( name )
  puts "Hello, " + name
  puts "#{name}, it's a rather windy day today."
  printf "%d little birds on my doorstep\n", 3
end


puppy = gets
greet ( puppy )



