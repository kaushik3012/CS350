
# The $ symbol preceding a variable name indicates that it is a
# global variable.

$character_count = 0

def update_character_count ( line )
  $character_count = $character_count + line.length
end

while (line = gets).length > 1 do
  update_character_count ( line )
  printf "%d\n", $character_count
end

puts "Your text contains #{$character_count} characters"




