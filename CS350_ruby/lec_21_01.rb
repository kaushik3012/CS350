# understanding self


# There are exactly two ways in which self can be changed:
#  1. when there is an explicit receiver
#  2. when a new class or module is being defined.


class Book
  def initialize title, author
    @title = title
    @author = author
  end
  def getTitle
    return @title
  end
  def getAuthor
    return @author
  end
  def getDescription
    return getTitle + "by " + getAuthor # no explicit receiver, self is unchanged. 
  end
end


book = Book.new "Rendezvous with Rama", "Arthur C. Clarke"
puts book.getAuthor  # explicit receiver, self is "book"
puts book.getDescription


#---------------------------------------
# example of a situation when there is no explicit receiver
# here, self is the "main" object
#---------------------------------------


