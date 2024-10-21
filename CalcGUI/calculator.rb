#Include individual files to access methods
require 'tk'
require_relative '../math/solver'

root = TkRoot.new(title: "Calculator 3901", padx: 300, pady: 300)

display = TkLabel.new(root) do
  text ""
  height 4
  width 32
  background "grey"
  grid(row:0, column:0, columnspan:6)
end

current_value = display.cget('text')
temp_value = nil
#add decimal to binary octal etc. 
OPERATION = {exponent: "exponent", evenNumbers: "evenNumbers", abs: "Absolute Value", squareNumbers: "squareNumbers", factorial: "Factorial", percentage: "Percentage", median: "Median", 
generatePrimes: "Generate Primes", isPrime: "Check Prime", minimum: "Min", oddNumbers: "Odd Numbers", mode: "Mode", 
mean: "Mean", max: "Maximum", fibonacci: "Fibonacci", farToCel: "Fahrenheit to Celsius", sqrt: "Square Root",
cbrt: "Cube Root", log: "Log (Base e)", sinFunc: "Sin(Degrees d)", cosFunc: "Cos(Degrees d)", tanFunc: "Tan(Degrees d)"}
action = nil

buttonOne = TkButton.new(root) do
  text("1")
  grid(row: 1, column: 0)
  borderwidth 1
  padx 20
  pady 15
  command(lambda {display.configure('text', current_value.concat('1'))})
end 


buttonTwo = TkButton.new(root) do
  text("2")
  grid(row: 1, column: 1)
  borderwidth 1
  padx 20
  pady 15
  command(lambda {display.configure('text', current_value.concat('2'))})
end 

buttonThree = TkButton.new(root) do
  text("3")
  grid(row: 1, column: 2)
  borderwidth 1
  padx 20
  pady 15
  command(lambda {display.configure('text', current_value.concat('3'))})
end 

buttonfour = TkButton.new(root) do
  text("4")
  grid(row: 2, column: 0)
  borderwidth 1
  padx 20
  pady 15
  command(lambda {display.configure('text', current_value.concat('4'))})

end
buttonFive = TkButton.new(root) do
  text("5")
  grid(row: 2, column: 1)
  borderwidth 1
  padx 20
  pady 15
  command(lambda {display.configure('text', current_value.concat('5'))})
end

buttonSix = TkButton.new(root) do
  text("6")
  grid(row: 2, column: 2)
  borderwidth 1
  padx 20
  pady 15
  command(lambda {display.configure('text', current_value.concat('6'))})
end

buttonSeven = TkButton.new(root) do
  text("7")
  grid(row: 3, column: 0)
  borderwidth 1
  padx 20
  pady 15
  command(lambda {display.configure('text', current_value.concat('7'))})
end

buttonEight = TkButton.new(root) do
  text("8")
  grid(row: 3, column: 1)
  borderwidth 1
  padx 20
  pady 15
  command(lambda {display.configure('text', current_value.concat('8'))})
end

buttonNine = TkButton.new(root) do
  text("9")
  grid(row: 3, column: 2)
  borderwidth 1
  padx 20
  pady 15
  command(lambda {display.configure('text', current_value.concat('9'))})
end

button0 = TkButton.new(root) do
  text("0")
  grid(row: 4, column: 1)
  borderwidth 1
  padx 20
  pady 15
  command(lambda {display.configure('text', current_value.concat('0'))})
end

buttonPlus = TkButton.new(root) do
  text("+")
  grid(row: 1, column: 3)
  borderwidth 1
  padx 20
  pady 15
  command(lambda {
    if "+-*/%".include?(current_value[-1])
      display.configure('text', current_value = current_value.chop.concat('+'))
    else
      display.configure('text', current_value = current_value.concat('+'))
    end
  })
end 

buttonMinus = TkButton.new(root) do
  text("-")
  grid(row: 2, column: 3)
  borderwidth 1
  padx 20
  pady 15
  command(lambda {
    if "+-*/%".include?(current_value[-1]) 
      display.configure('text', current_value = current_value.chop.concat('-'))
    else
      display.configure('text', current_value = current_value.concat('-'))
    end
  })
end 

buttonMultiply = TkButton.new(root) do
  text("*")
  grid(row: 3, column: 3)
  borderwidth 1
  padx 20
  pady 15
  command(lambda {
    if "+-*/%".include?(current_value[-1]) 
      display.configure('text', current_value = current_value.chop.concat('*'))
    else
      display.configure('text', current_value = current_value.concat('*'))
    end
  })
end 

buttonDivide = TkButton.new(root) do
  text("/")
  grid(row: 4, column: 3)
  borderwidth 1
  padx 20
  pady 15
  command(lambda {
    if "+-*/%".include?(current_value[-1]) 
      display.configure('text', current_value = current_value.chop.concat('/'))
    else
      display.configure('text', current_value = current_value.concat('/'))
    end
  })
end 

buttonClear = TkButton.new(root) do
  text("Clear")
  grid(row: 5, column: 1)
  borderwidth 1
  padx 20
  pady 15
  command(lambda {display.configure('text', current_value = '')})
end 

buttonDecimal = TkButton.new(root) do
  text(".")
  grid(row: 4, column: 2)
  borderwidth 1
  padx 20
  pady 15
  command(lambda {display.configure('text', current_value = current_value.concat('.'))})
end 

buttonLeftParenthesis = TkButton.new(root) do
  text("(")
  grid(row: 5, column: 0)
  borderwidth 1
  padx 20
  pady 15
  command(lambda {display.configure('text', current_value.concat('('))})
end 

buttonRightParenthesis = TkButton.new(root) do
  text(")")
  grid(row: 5, column: 2)
  borderwidth 1
  padx 20
  pady 15
  command(lambda {display.configure('text', current_value.concat(')'))})
end 

buttonMod = TkButton.new(root) do
  text("%")
  grid(row: 5, column: 3)
  borderwidth 1
  padx 20
  pady 15
  command(lambda {
    if "+-*/%".include?(current_value[-1]) 
      display.configure('text', current_value = current_value.chop.concat('%'))
    else
      display.configure('text', current_value = current_value.concat('%'))
    end
  })
end 

buttonNegToggle = TkButton.new(root) do
  text("+/-")
  grid(row: 4, column: 0)
  borderwidth 1
  padx 20
  pady 15
  command(lambda {display.configure('text', current_value = (current_value.to_f * -1).to_s)})
end 


#TODO: Add buttons for each of the commands and adjust the following function to call the functions we created:
equal_btn = TkButton.new(root) do 
  text("=")
  grid(row: 6, column: 3)
  borderwidth 1
  padx 30
  pady 25
  command(
    lambda {
      if current_value != ''
        display.configure('text', current_value = (Solver.solve(current_value)).to_s) 
      end
    })
end 


Tk.mainloop