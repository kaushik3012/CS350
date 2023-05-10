
class QP
    def initialize 
    end

    def question
      printf "\\item\n"
        if block_given?
          content = yield
          if content
            puts content.to_s
          end
        end
    end
    
    def tag tagname

      if tagname[0..-1] == "questions"
        tagname = "enumerate"
      
      elsif tagname[0..-1] == "code"
        tagname = "verbatim"

      elsif tagname[0..-1] == "text"
        if block_given?
          content = yield
          if content
            puts content.to_s
          end
        end
        return 
      end

      printf "\\begin{%s}\n", tagname
      if block_given?
        content = yield
        if content
          puts content.to_s
        end
      end
      printf "\\end{%s}\n",tagname
    end
    alias method_missing tag

    
    def title  course, semester, date
      puts "\\documentclass[11pt]{article}"
      puts "\\usepackage{amsmath, amsthm, amssymb}"
      puts "\\usepackage[margin=1in]{geometry}"
      puts "\\begin{document}"
      puts "\\title{#{course} #{semester}}"
      puts "\\date{#{date}}"
      puts "\\maketitle"
    end
    def instructions str
      puts "\\textbf{#{str}}"
    end
    def finalize  
      puts "\\end{document}"
    end

    #class method
    def self.generate &block
      QP.new.instance_eval(&block)
    end
end
  
  
  