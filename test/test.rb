require_relative 'TestManager.rb'
require_relative '../math/math.rb'

test_manager = TestManager.new

## Category 1 Tests

## Square root and cube root tests 
def square_root_test_1
  res = squareRoot(9)
  res == 3
end
test_manager.add_test("Square root test #1", -> {square_root_test_1})

def square_root_test_2
  res = squareRoot(1)
  res == 1
end
test_manager.add_test("Square root test #2", -> {square_root_test_2})

def cube_root_test_1
  res = cubeRoot(1)
  res == 1
end
test_manager.add_test("Cube root test #1", -> {cube_root_test_1})

def cube_root_test_2
  res = cubeRoot(27)
  res == 3
end
test_manager.add_test("Cube root test #2", -> {cube_root_test_2})

def cube_root_test_3
  res = cubeRoot(64)
  res == 4
end
test_manager.add_test("Cube root test #3", -> {cube_root_test_3})

## Log tests

def log_test_1
  res = log(10, 100)
  res == 2
end
test_manager.add_test("Log test #1", -> {log_test_1})

def log_test_2
  res = log(2, 8)
  res == 3
end
test_manager.add_test("Log test #2", -> {log_test_2})

def log_test_3
  res = log(2, 32)
  res == 5
end
test_manager.add_test("Log test #3", -> {log_test_3})

## Sin, Cos, Tan tests
def sin_test_1()
  res = sinFunc(90)
  res == 1.00
end
test_manager.add_test("Sine test #1", -> {sin_test_1})

def sin_test_2()
  res = sinFunc(0)
  res == 0.00
end
test_manager.add_test("Sine test #2", -> {sin_test_2})

def cos_test_1()
  res = cosFunc(90)
  res == 0.00
end
test_manager.add_test("Cosine test #1", -> {cos_test_1})

def cos_test_2()
  res = cosFunc(0)
  res == 1.00
end
test_manager.add_test("Cosine test #2", -> {cos_test_2})

def tan_test_1()
  res = tanFunc(45)
  res == 1.00
end
test_manager.add_test("Tangent test #1", -> {tan_test_1})

def tan_test_2()
  res = tanFunc(0)
  res == 0.00
end
test_manager.add_test("Tangent test #2", -> {tan_test_2})

## Decimal to other base tests
def decimal_to_binary_test
  res = decimal_to_binary(9)
  res == "1001"
end
test_manager.add_test("Decimal to binary test #1", -> {decimal_to_binary_test})

def decimal_to_octal_test
  res = decimal_to_octal(9)
  res == "11"
end
test_manager.add_test("Decimal to octal test #1", -> {decimal_to_octal_test})

def decimal_to_hexadecimal_test_1
  res = decimal_to_hexadecimal(18)
  res == "12"
end
test_manager.add_test("Decimal to hexadecimal test #1", -> {decimal_to_hexadecimal_test_1})

def decimal_to_hexadecimal_test_2
  res = decimal_to_hexadecimal(30)
  res == "1e"
end
test_manager.add_test("Decimal to hexadecimal test #2", -> {decimal_to_hexadecimal_test_2})

## Group 1 tests

# exponent tests
def exponent_test_1
  res = exponent(3, 2)
  res == 9
end
test_manager.add_test("exponent test #1", -> {exponent_test_1})

def exponent_test_2
  res = exponent(5,3)
  res == 125
end
test_manager.add_test("exponent test #2", -> {exponent_test_2})

def exponent_test_3
  res = exponent(1,2)
  res == 1
end
test_manager.add_test("exponent test #3", -> {exponent_test_3})

def exponent_test_4
  res = exponent(10,1)
  res == 10
end
test_manager.add_test("exponent test #4", -> {exponent_test_4})

# genEven tests
def genEven_test_1
  file_name = "output.txt"
  genEvens(1,5, file_name)
  res = File.read(file_name) == "2, 4"
  File.delete(file_name)
  res
end
test_manager.add_test("genEven test #1", -> {genEven_test_1})

def genEven_test_2
  file_name = "output.txt"
  genEvens(0,10, file_name)
  res = File.read(file_name) == "0, 2, 4, 6, 8, 10"
  File.delete(file_name)
  res
end
test_manager.add_test("genEven test #2", -> {genEven_test_2})

def genEven_test_3
  file_name = "output.txt"
  genEvens(100, 104, file_name)
  res = File.read(file_name) == "100, 102, 104"
  File.delete(file_name)
  res
end
test_manager.add_test("genEven test #3", -> {genEven_test_3})

# absolute value tests
def absoluteValue_test_1
  res = absoluteVal(1)
  res == 1
end
test_manager.add_test("absolute value test #1", -> {absoluteValue_test_1})

def absoluteValue_test_2
  res = absoluteVal(-27)
  res == 27
end
test_manager.add_test("absolute value test #2", -> {absoluteValue_test_2})

def absoluteValue_test_3
  res = absoluteVal(0)
  res == 0
end
test_manager.add_test("absolute value test #3", -> {absoluteValue_test_3})

# getSquares tests
def genSquares_test_1
  file_name = "output.txt"
  getSquares(1, 3, file_name)
  res = File.read(file_name) == "1, 4, 9"
  File.delete(file_name)
  res
end
test_manager.add_test("getSquares test #1", -> {genSquares_test_1})

def genSquares_test_2
  file_name = "output.txt"
  getSquares(0, 2, file_name)
  res = File.read(file_name) == "0, 1, 4"
  File.delete(file_name)
  res
end
test_manager.add_test("getSquares test #2", -> {genSquares_test_2})

def genSquares_test_3
  file_name = "output.txt"
  getSquares(8,10, file_name)
  res = File.read(file_name) == "64, 81, 100"
  File.delete(file_name)
  res
end
test_manager.add_test("getSquares test #3", -> {genSquares_test_3})

## Group 2 tests

# factorial tests
def factorial_test_1
  res = factorial(1)
  res == 1
end
test_manager.add_test("factorial test #1", -> {factorial_test_1})

def factorial_test_2
  res = factorial(5)
  res == 120
end
test_manager.add_test("factorial test #2", -> {factorial_test_2})

def factorial_test_3
  res = factorial(0)
  res == 1
end
test_manager.add_test("factorial test #3", -> {factorial_test_3})

# percentage tests
def percentage_test_1
  res = percentage(1, 10)
  res == 10
end
test_manager.add_test("percentage test #1", -> {percentage_test_1})

def percentage_test_2
  res = percentage(1, 100)
  res == 1
end
test_manager.add_test("percentage test #2", -> {percentage_test_2})

def percentage_test_3
  res = percentage(1, 1)
  res == 100
end
test_manager.add_test("percentage test #3", -> {percentage_test_3})

# median tests
def median_test_1
  dataset = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  res = median(dataset)
  res == 5
end
test_manager.add_test("median test #1", -> {median_test_1})

def median_test_2
  dataset = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  res = median(dataset)
  res == 5.5
end
test_manager.add_test("median test #2", -> {median_test_2})

def median_test_3
  dataset = [15,3,17,18,18,20]
  res = median(dataset)
  res == 17.5
end
test_manager.add_test("median test #3", -> {median_test_3})

# generate_primes_and_save_to_file tests
def generate_primes_and_save_to_file_test_1
  file_name = "output.txt"
  generate_primes_and_save_to_file(0, file_name)
  res = File.read(file_name) == ""
  File.delete(file_name)
  res
end
test_manager.add_test("generate_primes_and_save_to_file test #1", -> {generate_primes_and_save_to_file_test_1})

def generate_primes_and_save_to_file_test_2
  file_name = "output.txt"
  generate_primes_and_save_to_file(5, file_name)
  res = File.read(file_name) == "2, 3"
  File.delete(file_name)
  res
end
test_manager.add_test("generate_primes_and_save_to_file test #2", -> {generate_primes_and_save_to_file_test_2})

def generate_primes_and_save_to_file_test_3
  file_name = "output.txt"
  generate_primes_and_save_to_file(10, file_name)
  res = File.read(file_name) == "2, 3, 5, 7"
  File.delete(file_name)
  res
end
test_manager.add_test("generate_primes_and_save_to_file test #3", -> {generate_primes_and_save_to_file_test_3})



## Group 3 tests

# isprime tests
def isprime_test_1
  res = is_prime(1)
  res == false
end
test_manager.add_test("isprime test #1", -> {isprime_test_1})

def isprime_test_2
  res = is_prime(0)
  res == false
end
test_manager.add_test("isprime test #2", -> {isprime_test_2})

def isprime_test_3
  res = is_prime(13)
  res == true
end
test_manager.add_test("isprime test #3", -> {isprime_test_3})

def isprime_test_4
  res = is_prime(12)
  res == false
end
test_manager.add_test("isprime test #4", -> {isprime_test_4})

# minimum tests
def minimum_test_1
  res = minimum([0,1,3,4])
  res == 0
end
test_manager.add_test("minimum test #1", -> {minimum_test_1})

def minimum_test_2
  res = minimum([1,1,3,4,1])
  res == 1
end
test_manager.add_test("minimum test #2", -> {minimum_test_2})

def minimum_test_3
  res = minimum([])
  res == nil
end
test_manager.add_test("minimum test #3", -> {minimum_test_3})

# genOdd tests
def genOdd_test_1
  file_name = "output.txt"
  genOdd(0,5, file_name)
  res = File.read(file_name) == "1, 3, 5"
  File.delete(file_name)
  res
end
test_manager.add_test("genOdd test #1", -> {genOdd_test_1})

def genOdd_test_2
  file_name = "output.txt"
  genOdd(5,0, file_name)
  res = File.read(file_name) == ""
  File.delete(file_name)
  res
end
test_manager.add_test("genOdd test #2", -> {genOdd_test_2})

def mode_test_1
  res = mode([0,1,3,1,])
  res == [1]
end
test_manager.add_test("mode test #1", -> {mode_test_1})

def mode_test_2
  res = mode([0,1,3,4,1,3])
  res == [1,3]
end
test_manager.add_test("mode test #2", -> {mode_test_2})

def mode_test_3
  res = mode([])
  res == nil
end
test_manager.add_test("mode test #3", -> {mode_test_3})

## Group 4 tests

# mean tests
def mean_test_1
  res = mean([1, 5, 7, 3])
  res == 4
end
test_manager.add_test("Mean test #1", -> {mean_test_1})

def mean_test_2
  res = mean([4, 2, 10, -3])
  res == 3.25
end
test_manager.add_test("Mean test #2", -> {mean_test_2})

# maximum tests
def maximum_test_1
  res = maximum([1, 5, 7, 3])
  res == 7
end
test_manager.add_test("Maximum test #1", -> {maximum_test_1})

def maximum_test_2
  res = maximum([4, 2, 10, -3])
  res == 10
end
test_manager.add_test("Maximum test #2", -> {maximum_test_2})

#fibonacci tests
def fibonacci_test_1
  file_name = "output.txt"
  fibonacci(10, file_name)
  res = File.read(file_name) == "0, 1, 1, 2, 3, 5, 8"
  File.delete(file_name)
  res
end
test_manager.add_test("Fibonacci test #1", -> {fibonacci_test_1})

def fibonacci_test_2
  file_name = "output.txt"
  fibonacci(0, file_name)
  res = File.read(file_name) == ""
  File.delete(file_name)
  res
end
test_manager.add_test("Fibonacci test #2", -> {fibonacci_test_2})

#F to C tests
def fahrenheit_to_celsius_test_1
  res = fahrenheit_to_celsius(32)
  res == 0
end
test_manager.add_test("Fahrenheit to celsius test #1", -> {fahrenheit_to_celsius_test_1})

def fahrenheit_to_celsius_test_2
  res = fahrenheit_to_celsius(56)
  res == 13.333333333333332
end
test_manager.add_test("Fahrenheit to celsius test #2", -> {fahrenheit_to_celsius_test_2})

# Run tests
test_manager.run_tests