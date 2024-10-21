
require_relative 'math.rb'
# USAGE:
# Solver.solve("{equation}")
# EXAMPLE:
# puts "5 + 2 = #{Solver.solve("5 + 2")}"
class Solver
  ORDER_OF_OPERATIONS = [
    [
      {
        symbol: "+",
        resolver: ->(a, b) { a + b }
      },
      {
        symbol: "-",
        resolver: ->(a, b) { a - b }
      }
    ],
    [
        {
          symbol: "*",
          resolver: ->(a, b) { a * b }
        },
        {
          symbol: "/",
          resolver: ->(a, b) { a / b }
        },
        {
          symbol: "%",
          resolver: ->(a, b) { a % b }
        }
    ]
  ]

  # Equation is a string.
  def self.solve(equation)
    # remove whitespace before solving.
    equation.gsub! " ", ""
    solve_equation(equation)
  end

  private

  def self.solve_equation(equation)
    # Take care of parenthesis first
    # Find the last (.
    while (start_i = equation.rindex("(")) do
      # Match the ( with its )
      end_i = equation.index(")", start_i)
      if end_i == nil
        raise ArgumentError, "No matching closing parenthesis to open parenthesis at position #{start_i}"
      end

      # Replace the parenthesis with their value
      equation.sub! equation[start_i..end_i], solve_equation(equation[start_i+1..end_i-1]).to_s
    end

    # If there is just a plain number, that's the value
    val = Float(equation, exception: false)
    if val != nil
      return val
    end

    # Go nuts.
    ORDER_OF_OPERATIONS.each do |operations|
      # Find an operation following order of operations
      # Only match operators that follow numbers (or closing parenthesis) so negative numbers work
      regex = /(?<=\d|\))(#{operations.map { |x| Regexp.escape(x[:symbol]) }.join("|")})/
      op_location = equation.rindex(/#{regex}/)
      next unless op_location
      operation = operations.find {|x| equation[op_location] == x[:symbol]}

      # Simplify both sides
      right = solve_equation(equation[op_location+1..])
      left = solve_equation(equation[..op_location - 1])

      # Catch divide by 0
      if ("/%".include? operation[:symbol]) && right == 0.0 
        raise ZeroDivisionError, "Trying to divide by zero"
      end

      # Return the result of the operation on both sides
      return operation[:resolver].call(left, right)
    end

    # If we made it here, we have an invalid input.
    raise ArgumentError, "Invalid input!"
  end
end
