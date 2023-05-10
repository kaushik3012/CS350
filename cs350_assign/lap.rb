def max n1,n2
    if n1 > n2
        n1
    else
        n2
    end
end

def longest_arithmetic_progression arr
    n = arr.length()
    if n <= 2
        return n
    end
    llap = [2] * n
    arr = arr.sort()
    for j in (n-2).downto(0)
        i = j-1
        k = j+1
        while i >= 0 and k < n
            if arr[i] + arr[k] == 2*arr[j] then
                llap[j] = max(llap[k] + 1, llap[j])
                i -= 1
                k += 1
            elsif arr[i] + arr[k] < 2*arr[j] then
                k += 1
            else
                i -= 1
            end
        end
    end
    return llap.max()
end


arr = [9,4,7,2,10]
printf "%d\n", longest_arithmetic_progression(arr)
