hashed_months=Hash.new
months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
for i in 0..(months.length-1) do
    hashed_months[i+1]=months[i]
end

puts hashed_months