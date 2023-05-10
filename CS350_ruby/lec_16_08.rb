# control flow in ruby


number = 7

if number > 1 then
  puts "Greater"
elsif number == 1 then
  puts "Equal"
else 
  puts "Less"
end

current_hour = Time.now.hour
puts current_hour
puts "Good Morning" if current_hour < 12
puts "Good Afternoon" if current_hour > 12 and current_hour < 17


name = gets.chomp
puts "Hello, #{name}!" unless name.length == 0



