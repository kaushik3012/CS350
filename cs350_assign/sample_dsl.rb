# A DSL for LaTeX
# Philosophy: avoid boilerplate code

require './qp_gen.rb'
course = "CS 350"
semester = "2022-23 I"
date = "November 14, 2022"

QP.generate{
    title course, semester, date
    instructions "All questions carry 10 marks each."
    questions{
        question{
            text{ "Write a Ruby function to reverse a string. Use idiomatic Ruby." }
        
            code {'
                months = ["January", "February", "March", "April", 
                    "May", "June", "July", "August", "September", 
                    "October", "November", "December"]
                '
            }
        }
        
        question{
            text{ "Given an array which consists of two-element arrays, write a Ruby function to take a block, 
                and return the value obtained by applying the block." }
        }

        question{
            text{
                "This question paper is specified by the following code in Ruby. The LaTeX output is given 
                in the following excerpt. Write the class \'QP\', the function \'generate\' and the function to 
                format \'questions\' and \'question\'. (You may omit the remaining functionality.)"
            }
        }
    }
    finalize
}