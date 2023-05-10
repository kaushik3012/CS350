'''
Write a Ruby function to reverse a string. 
Use idiomatic Ruby. [10]
'''

# Function to reverse a string
def rev (str)
    return str.reverse
end

# Input and Output
stri = gets.chomp
stri = rev (stri)
printf "%s\n", stri