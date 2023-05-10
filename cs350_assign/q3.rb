'''
Implement a method foldl for Ruby’s arrays.
This function will take a block as an argument. Kindly recall that a
block in Ruby is essentially an anonymous λ function.
The “list” argument in Haskell is the receiver object in Ruby.
So foldl f id lst in Haskell will be equivalent to array.foldl id
<block>. [15]
'''

# Extending the Array Class
# and defining the Fold left method
class Array
    def foldl (id=nil, &block)
        for i in 0...self.length do
            id = yield id, self[i]
        end
        return id
    end
    def foldl2(*id, &block)
        inject(*id, &block)
    end
end


# Usage Example
30.times do
    printf "-"
end
puts "\nUsage Examples"
30.times do
    printf "-"
end
printf "\n"
puts ("[\"Hello\",\" \", \"world\"].foldl(\"\") {|sum, num| sum+num} => " + ["Hello"," ", "world"].foldl("") {|sum, num| sum+num})
puts ("[1,2,4,5,7,10].foldl(0) {|sum, num| sum+num} => " + ([1,2,4,5,7,10].foldl(0) {|sum, num| sum+num}).to_s)
puts ("[[1,2],[2,4],[5,7]].foldl([]) {|sum, num| sum+num} => " + ([[1,2],[2,4],[5,7]].foldl([]) {|sum, num| sum+num}).to_s)

puts ("[\"Hello\",\" \", \"world\"].foldl2 {|sum, num| sum+num} => " + (["Hello"," ", "world"].foldl2 {|sum, num| sum+num}).to_s)


