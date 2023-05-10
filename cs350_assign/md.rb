module Context
  NONE, LIST, PARAGRAPH = 0,1,2
end

# actually we need to maintain a stack of contexts, and pop off
# on completion

class BasicOutputter
  def initialize filename
    @line=nil
    @para_beginning = true
    @list_beginning = true
    @bold_beginning = true
    @emphasis_beginning=true
    @filename=filename
    @context=Context::NONE
  end
  def bold
  end
  def emphasis
  end
  def list
  end
  def paragraph
  end
  def heading
  end
  def reset_context
  end
  def process
  end
  def parse
  end
end


class HTMLOutputter < BasicOutputter
  def bold
  end

  def emphasis
  end

  def list
    printf "<li> %s </li>", @line[2..-1]
  end
  
  def heading
    level = 0
    i     = 0
    while @line[i]=='#'
      level = level+1
      i = i+1
    end
    printf "<h%d>%s</h%d>\n", level,@line[i..-2],level
  end
  
  def reset_context
    case @context
    when Context::LIST
      puts "</ul>"
    when Context::PARAGRAPH
      puts "</p>"
      @para_beginning = true 
    end
  end

  def process
    @line.each_char do |c|
      case c
      when '*'
        if @bold_beginning
          printf "<b>"
          @bold_beginning = false
        else
          printf "</b>"
        end
      when '/'
        if @emphasis_beginning
          printf "<em>"
          @emphasis_beginning = false
        else
          printf "</em>"
        end
      else
        putc c
      end
    end
  end
  
  def paragraph
    process 
  end

  def heading
    level = 0
    i     = 0
    while @line[i]=='#'
      level = level+1
      i = i+1
    end
    
    printf "<h%d>%s</h%d>\n", level,@line[i..-2],level
  end


  def parse
    File.readlines(@filename).each do |text_line|
      if text_line.strip.empty?
        reset_context
        @context = Context::NONE
        next
      end
      @line = text_line
      case @line[0]
      when '#'
        heading 
      when '+'
        if @list_beginning == true
          puts "<ul>"
          @list_beginning = false
        end
        list
        @context = Context::LIST
      else 
        if @para_beginning == true
          puts "<p>"
          @para_beginning = false
        end          
        paragraph
        @context = Context::PARAGRAPH
      end
    end
  end
end

class LaTeXOutputter < BasicOutputter
  def bold
    if @bold_beginning
      printf "\\textbf{"
      @bold_beginning = false
    else
      printf "}"
    end
  end

  def emphasis
    if @emphasis_beginning
      printf "\\emph{"
      @emphasis_beginning = false
    else
      printf "}"
    end
  end

  def list
    printf "\\item %s \n", @line[2..-1]
  end
  
  def heading
    level = 0
    i     = 0
    while @line[i]=='#'
      level = level+1
      i = i+1
    end
    if level==1 then printf "\\section*{%s}\n", @line[(i+1)..-3]
    elsif level==2 then printf "\\subsection*{%s}\n",@line[(i+1)..-3]
    elsif level==3 then printf "\\subsubsection*{%s}\n",@line[(i+1)..-3]
    elsif level==4 then printf "\\paragraph*{%s}\n",@line[(i+1)..-3]
    elsif level==5 then printf "\\subparagraph*{%s}\n",@line[(i+1)..-3]
    else printf "%s\n", @line[(i+1)..-3]
    end
  end
  
  def reset_context
    case @context
    when Context::LIST
      puts "\\end{itemize}"
      @list_beginning = true
    when Context::PARAGRAPH
      puts "\\end{flushleft}"
      @para_beginning = true 
    end
  end

  def process
    @line.each_char do |c|
      case c
      when '*'
        bold
      when '/'
        emphasis
      else
        putc c
      end
    end
  end
  
  def paragraph
    process 
  end

  def parse
    puts"\\documentclass[12pt, a4paper]{article}"
    puts "\\begin{document}"
    File.readlines(@filename).each do |text_line|
      if text_line.strip.empty? then
        reset_context
        @context = Context::NONE
        next
      end
      @line = text_line
      case @line[0]
      when '#'
        heading 
      when '+'
        if @list_beginning == true then
          puts "\\begin{itemize}\n"
          @list_beginning = false
        end
        list
        @context = Context::LIST
      else 
        if @context == Context::LIST then
          process
        else
          if @para_beginning == true then
            puts "\\begin{flushleft}"
            @para_beginning = false
          end          
          paragraph
          @context = Context::PARAGRAPH
        end
      end
    end
    puts "\\end{document}\n"
  end
end

o = LaTeXOutputter.new "sample.md"
o.parse
