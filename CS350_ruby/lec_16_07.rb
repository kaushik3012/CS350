#Program to copy one file to another
#with exception handling

from_filename, to_filename = ARGV

from_file = open( from_filename )
from_data = from_file.read()
puts      "Copying #{from_data.length()} bytes..."

begin
  to_file_status = File.exist?( to_filename )

  # prompt the user before overwriting files
  if  to_file_status == true 
    puts "Output file exists. Will overwrite the existing file."
    puts "Continue (Y/N)?"
    answer = $stdin.gets().chomp()
    if answer != 'Y'
      raise "Try Again"
    end
  end
rescue
  # try copying again with a new filename
  puts "Enter another filename:"
  to_filename = $stdin.gets.chomp()
  retry
end


to_file   = open( to_filename , 'w' )
to_file.write(from_data)

from_file.close()
to_file.close()
puts "Copied \"#{from_filename}\" to \"#{to_filename}\" successfully."
