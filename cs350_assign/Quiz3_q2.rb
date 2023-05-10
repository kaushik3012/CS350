def apply_block arr,&block
    new_arr = arr.collect!{|t| yield t[0],t[1] }
    return new_arr
end

arr = [[1,2],[3,4],[5,6]]
puts apply_block(arr){|a,b| a+b}