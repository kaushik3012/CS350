# uses arrays

# arrays can be heterogeneous - i.e. contain
# multiple types

def title ( heading )
  printf "\n\n"
  puts   heading
  heading.length.times do
    print "="
  end
  print "\n"
end

rucksack = ['pen', 'pencil', 'medicine', 50]

title ( "Printing an array using gets" )
puts rucksack

title ( "Iterator" )
# a simple use of iterators
(0..rucksack.length-1).each do |i|
  print rucksack[i]
  print ", "
end


title ( "Iterators 2" )
for item in rucksack do
  puts "The rucksack contains a #{item}"
end

# splicing arrays

title ( "Splicing" )
puts "1 through 4:\n #{rucksack [1..4]}"
puts "0 through -1:\n #{rucksack [0..-1]}"
puts "-4 through -1:\n #{rucksack [-4..-1]}"


# Ruby has a huge list of array functions.
title ( "Array functions" )
puts rucksack[0]                  # arrays start at index 0
puts "intersection: #{rucksack & [1,2,3,50]}"    
puts "repetition: #{rucksack.* 3}"               
puts "concatenation: #{rucksack + [1]}"
rucksack[4] = "bread"
puts "modification: #{rucksack}"
rucksack[6] = "ketchup"           # going beyond the array boundaries
puts "addition at a much higher index (nil inserted): #{rucksack}"  # notice the nil at index 5
puts "compact: #{rucksack.compact!}"  # nil removed
