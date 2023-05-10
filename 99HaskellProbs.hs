--(1) Find the last element of a list.
myLast :: [a] -> a
myLast [] = error "No end for empty lists!"
myLast [x] = x
myLast (_:xs) = myLast xs


--(2) Second Last element
myButLast :: [a] -> a
myButLast [] = error "No end for empty lists!"
myButLast [x1,_] = x1
myButLast (_:xs) = myButLast xs


--(3) k'th element of a list
elementAt [] n = error "Empty List"
elementAt (x:xs) 1 = x
elementAt (x:xs) n = Main.elementAt xs (n-1)


--(4) Find the number of elements of a list.
myLength [] = 0
myLength (x:xs) = 1 + Main.myLength xs


--(5) Reverse a list
myReverse [] = []
myReverse (x:xs) = (Main.myReverse (xs)) ++ [x]

--(6) Find out whether a list is a palindrome. 
isPalindrome [] = True
isPalindrome (x:xs) = if (x:xs)== (myReverse (x:xs)) then True else False

--(7) Flatten a nested list structure.
data List a = Elem a | List [List a] deriving Show  
flatten (Elem x) = [x]
flatten (List []) = []
flatten (List (x:xs)) = (flatten x)++(flatten (List xs))


--(8) Eliminate consecutive duplicates of list elements
compress [] = []
compress [x] = [x]
compress (x:xs) = if (head xs /= x) then x:compress xs
                  else compress xs

-- (9) Pack consecutive duplicates of list elements into sublists. 
-- If a list contains repeated elements they should be placed in separate sublists.
pack [] = []
pack [x] = [[x]]
pack (x:xs) = if (head xs /= x) then [x]:pack (xs)
              else ([x]++(head (pack xs))) : (tail (pack xs))

-- (10) Run-length encoding of a list. Use the result of problem P09 to implement the so-called run-length encoding data compression method. 
-- Consecutive duplicates of elements are encoded as lists (N E) where N is the number of duplicates of the element E.
encode [] = []
encode (x:xs) = count ls where
    ls = pack (x:xs)
    count [] = []
    count (x:xs) = (length (x), head x) : count xs

encode' xs = [(length (x:xs), x) | (x:xs) <- pack xs]

-- (11) Modify the result of problem 10 in such a way that if an element has no duplicates it is simply copied into the result list. 
-- Only elements with duplicates are transferred as (N E) lists.
data Count a = Single a | Multiple Int a deriving Show

encodeModified [] = []
encodeModified (x:xs) = count ls where
    ls = pack (x:xs)
    count [] = []
    count (x:xs) = if length x<=1 then Single (head x) : count xs
        else (Multiple (length (x)) (head x)) : count xs

-- (12) Given a run-length code list generated as specified in problem 11.
-- Construct its uncompressed version.
decodeModified [] = []
decodeModified ((Single x): xs) = [x] ++ decodeModified xs
decodeModified ((Multiple 0 x) :xs) = decodeModified xs
decodeModified ((Multiple n x) :xs) = [x]++(decodeModified ((Multiple (n-1) x): xs))

-- (13) Implement the so-called run-length encoding data compression method directly. I.e. don't explicitly create the sublists containing the duplicates, as in problem 9, but only count them. As in problem P11, simplify the result list by replacing the singleton lists (1 X) by X.
-- encodeModified [] = []
-- encodeModified (x:xs) = count ls where
--     ls = pack (x:xs)
--     count [] = []
--     count (x:xs) = if length x<=1 then Single (head x) : count xs
--         else (Multiple (length (x)) (head x)) : count xs

-- (14) Duplicate the elements of a list.
dupli [] = []
dupli (x:xs) = (x:(x:(dupli xs)))

-- (15) Replicate the elements of a list a given number of times.
repli xs n = decodeModified [ Multiple n x | x <- xs]

-- (16) Drop every N'th element from a list.
dropEvery xs n = fun xs n 1 where
    fun [] _ _ = []
    fun (x:xs) n i = if ((mod i n)/=0) then x:(fun xs n (i+1))
                     else fun xs n (i+1)

-- (17) Split a list into two parts; the length of the first part is given.


-- (18) Extract a slice from a list.
slice xs m n = recur xs m n 1 where
            recur [] _ _ _ = []
            recur (x:xs) l r i = if (i>=l && i<=r) then x:(recur xs l r (i+1))
                                  else recur xs l r (i+1)

-- (19) Rotate a list N places to the left.
rotate xs n = let i = if n < 0 then length xs + n else n
              in drop i xs ++ take i xs

-- (20) Remove the K'th element from a list.
removeAt 1 (x:xs) = (x, xs)
removeAt n (x:xs) = (l, x:r) where
    (l, r) = removeAt (n - 1) xs
    
-- (21) Insert an element at a given position into a list.
insertAt e [] 1 = [e]
insertAt _ [] _ = []
insertAt e (x:xs) 1 = [e] ++ (insertAt e (x:xs) 0)
insertAt e (x:xs) (n) = (x:insertAt e xs (n-1))

insertAt' :: a -> [a] -> Int -> [a]
insertAt' x ys     1 = x:ys
insertAt' x (y:ys) n = y:insertAt x ys (n-1)


-- (22) Create a list containing all integers within a given range.
range l r = [l..r]

-- (23) Extract a given number of randomly selected elements from a list.

-- (31) Determine whether a given integer number is prime.
isPrime n = findPrime 2 n where
            findPrime x n = if (x==n) then True
                            else if (mod n x==0) then False
                            else findPrime (x+1) n
                            
-- (32) Determine the greatest common divisor of two positive integer numbers. 
myGCD 0 x = abs x
myGCD a b = myGCD (mod b a) (a)

-- (33) Determine whether two positive integer numbers are coprime. Two numbers are coprime if their greatest common divisor equals 1.
coprime a b = if (gcd a b==1) then True
            else False

--(34) Calculate Euler's totient function phi(m).
totient 1 = 1
totient m = phi m 2 1 where
            phi m i count = if(i==m) then count
                            else if (coprime i m) then phi m (i+1) (count+1)
                            else phi m (i+1) (count)

-- (35) Determine the prime factors of a given positive integer. Construct a flat list containing the prime factors in ascending order.
primeFactors n = primeFactors' n 2
  where
    primeFactors' 1 _ = []
    primeFactors' n f
      | n `mod` f == 0 = f : primeFactors' (n `div` f) f
      | otherwise      = primeFactors' n (f + 1)


-- (36) Determine the prime factors of a given positive integer. Construct a list containing the prime factors and their multiplicity.
prime_factors_mult n = [(x, length (x:xs)) | (x:xs) <- pack (primeFactors n)]

{-- (37) Calculate Euler's totient function phi(m) (improved).

See problem 34 for the definition of Euler's totient function. If the list of the prime factors of a number m is known in the form of problem 36 then the function phi(m) can be efficiently calculated as follows: Let ((p1 m1) (p2 m2) (p3 m3) ...) be the list of prime factors (and their multiplicities) of a given number m. Then phi(m) can be calculated with the following formula:

phi(m) = (p1 - 1) * p1 ** (m1 - 1) * 
         (p2 - 1) * p2 ** (m2 - 1) * 
         (p3 - 1) * p3 ** (m3 - 1) * ...
Note that a ** b stands for the b'th power of a.
--}

totient2 (m) = phi (prime_factors_mult m) where
                phi (x:xs) = (p1 - 1) * p1 ** (m1 - 1)

                



