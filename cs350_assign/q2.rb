'''
Q2) Given an array of integers, write a Ruby function 
to find the longest Arithmetic progression in 
the list. [10]
'''

# Function to find longest subarray forming an AP
def longest_ap arr
    max_len = 0
    prev_cd = arr[1] - arr[0]
    max_ap = [arr[0]]
    temp = max_ap
    for i in 1..(arr.length-1) do  
        cd = arr[i] - arr[i-1] 
        if(cd==prev_cd) then
            temp.append(arr[i])
            if temp.length > max_len then
                max_ap = temp
                max_len = temp.length
            end
        else
            temp = [arr[i-1], arr[i]]
            prev_cd = cd
        end
    end
    return max_ap
end

# Enter the array as a single line with 
# space as the separtor between the elements
arr = gets.split(' ').map &:to_i
puts (longest_ap arr)