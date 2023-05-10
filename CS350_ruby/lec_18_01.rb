# TOPIC: Hashes
# hashes are the name in ruby for associative arrays.

def spacedputs(v)
  puts " "
  puts v
  puts " "
end


book = Hash.new
pages = 0
book1 = { "title" => "Lord of the Rings:The Fellowship of the Ring",
          "author" => "J. R. R. Tolkien",
          "publisher" => "Allen and Unwin",
          "year" => 1954,                   # values need not be strings
          pages => 1040,                    # keys need not be strings!
          :genre => "fantasy"              # :genre is a ruby "symbol"
        }


puts book1["title"]

# keys may be added using the configure method
book1["edition"] = 1 
book1.rehash            # you MAY rehash after an update

puts book1

for key in book1.keys 
  puts book1[key]
end





# alternative syntax when the key is a "ruby symbol"
other_book = { genre: "scifi" }		#instead of :genre=>"scifi"
puts other_book

#===========================================
# A ruby idiom: named arguments to functions,
# using hashes. 
#===========================================

def create(book_params)
	title = book_params[:title]
	author = book_params[:author]
end 

# the following uses the alternative syntax when the key is a "symbol"
book2 = create({author: "J. R. R. Tolkien", title: "The Two Towers"})

# the curly braces are optional when the only argument is a Hash
book3 = create(author: "J. R. R. Tolkien", title: "The Return of the King")
book4 = create(title: "The Return of the King", author: "J. R. R. Tolkien")

# the last line almost looks like we have named arguments,
# which we can call in any order.
# This illusion of having named arguments is a common idiom in Ruby
