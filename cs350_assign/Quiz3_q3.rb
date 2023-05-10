#Latex Converter Version: 1.0

class Latex
    def initialize
    end
    def title course, sem, date
        puts "\\title{#{course} #{sem}}"
        puts "\\date{#{date}}"
    end

    def instructions inst
        puts "\\section{#{inst}}"
    end
       
    def tag tagname
      if tagname[0..2]=="par"
        tagname="p"
      end
      
      printf "<%s>\n", tagname
  
       if block_given?
         content = yield
         if content
           puts content.to_s
           printf "</%s>\n", tagname
         end
       else
         printf "\n<%s/>\n",tagname
       end
      nil
    end
  
    alias method_missing tag
  
    #class method
    def self.generate  out, &block
      Latex.new.instance_eval(&block)
    end
  end
  
  
  