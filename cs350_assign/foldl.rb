class Array
    def foldl(id=0, &block)
        inject(id, &block)
    end
    def foldl2 (id=0)
        for i in 0...self.length do
            id = yield id, self[i]
        end
        return id
    end
end


printf "%d\n" ,([1,2,3,20].foldl2 (1) {|sum, num| sum * num})