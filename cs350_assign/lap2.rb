def lap arr
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



t = gets.to_i
for k in 1..t do
    n = gets.to_i
    arr = gets.split(' ').map &:to_i
    printf "Case \##{k}: %d\n",(lap arr)
end

