# An unexpected feature: closures!!!

# in ruby (as well as Smalltalk), these are called blocks.

messages = ["Hello", "Goodbye", "Good night"]

personalized_messages = messages.collect! {|m|  m + " Frodo!"}

puts personalized_messages


# |m| is like \lambda m: this introduces the variable
# we can think of the above block as the following anonymous
# function : (\l x -> x+"!")


# Also note the exclamation mark in the function name (collect!)
# this means that we are making permanent changes (i.e. the array
# will change after the call to collect!
# the exclamation mark has no meaning to the Ruby interpreter.
# it is just a documentation for the programmer using it, so that
# (s)he is aware that a call to the function may change the array
# permanently.
