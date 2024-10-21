# Contains student written math functions.
# Created 9/12/24

# Require the Math module
include Math

### USE BUILT IN METHODS:
# sqrt, cube root
#sqrt root built in function
def squareRoot(num)
  return Math.sqrt(num)
end

#cube root built in math function
def cubeRoot(num)
  return Math.cbrt(num)
end

# log(base, a)
def log(base, a)
  log_result = Math.log(a, base)
  return log_result
end  

# sin, cos, tan
def sinFunc(degrees)
  radians = degrees * Math::PI / 180
  sine_value = Math.sin(radians)
  return format('%.2f', sine_value).to_f
end

def cosFunc(degrees)
  radians = degrees * Math::PI / 180
  cosine_value = Math.cos(radians)
  return format('%.2f', cosine_value).to_f
end

def tanFunc(degrees)
  radians = degrees * Math::PI / 180
  tangent_value = Math.tan(radians)
  return format('%.2f', tangent_value).to_f
end

# Convert decimal to binary, octal hexadecimal
def decimal_to_binary(decimal)
  decimal.to_s(2)
end

def decimal_to_octal(decimal)
  decimal.to_s(8)
end

def decimal_to_hexadecimal(decimal)
  decimal.to_s(16)
end

### NO BUILT IN METHODS:

## Group 1

#Takes num1 to the num2nd power
#num1 is base, num2 is exponent
def exponent(num1, num2)
  num1**num2
end

#Gets all even values between the value start and the value end
#If end greater than start, does not return
def genEvens(start, finish, filename)
  evenVals = []
  if start > finish
    puts "Cannot Generate Solution"
    return
  end
  #block option
  #puts [start..end].select{|val| val.even?}
  for i in start..finish do
    if i % 2==0
      evenVals << i
    end
  end

  #Write to a file
  File.open(filename, 'w') do |file|
    file.write(evenVals.join(", "))
  end
  
end

#Gets the absolute value of a number
def absoluteVal(num)
  if num < 0
    num += 2*-num
  end
  return num
end

#Generates square numbers from startval to endval. 
#If endval > startval, does not return
def getSquares(startVal, endVal, filename)
  squareValues = []
  #Use block instead of loop here 
  if startVal > endVal
    puts "Cannot Generate Solution"
    return
  end
  for i in startVal..endVal
      squareValues << (i * i)
  end

  #Write to a file
  File.open(filename, 'w') do |file|
    file.write(squareValues.join(", "))
  end
end

## Group 2

# factorial(n)
def factorial(n)
  factorial_result=1
  if n == 0
    return 1
  elsif n > 0
    for i in 1..n do
      factorial_result= factorial_result*i
    end
  else
    # Throw error because invalid input
    raise ArgumentError, "Input must be equal-to or greater-than 0."
  end
  return factorial_result
end

# percentage (a, b) calculate what percentage a is of b
def percentage(a, b)
  if b == 0
    # Throw error because invalid input
    raise ArgumentError, "Denominator cannot be 0"
  end 
  return (a.to_f / b) * 100
end

# median (data) calculate the median of a dataset
def median(data)
  median_result = 0
  if data.empty?
    return nil
  end
  ordered_data = data.sort
  middle_index = ordered_data.length/2
  if data.length.even?
      median_result = (ordered_data[middle_index] + ordered_data[middle_index - 1]) / 2.0  # Use 2.0 for float division
  else 
    median_result= ordered_data[middle_index]
  end
  return median_result
end

# Generate all prime numbers less than a given number and save them to a file
def generate_primes_and_save_to_file(given_num, filename)
  primes = []
  if given_num >= 2
    for i in 2...given_num do
      if is_prime(i)
        primes << i
      end
    end
  end

  File.write(filename, primes.join(", "))
end

## Group 3

# is_prime(x) Checks if a given number is prime
def is_prime(n)
  # check that dataset is not 0 or 1
  if n <= 1
      return false
  end
  s = (2..Math.sqrt(n)).map {|divisor| n % divisor }
  return !s.include?(0)
end

# minimum(data) returns the minimum from a set of data
def minimum(data)
  # check that dataset is not empty
  if data.empty?
    return nil
  end
  data.reduce do |one,two|
      one < two ? one : two
  end
end

# Generate odd numbers within a given range and save them to a file
def genOdd(start,finish,filename)
  #check that range is not 0 or negative
  if start > finish
    return File.write(filename, "")
  end
  r = (start..finish).find_all{|i|i.odd?}
  File.write(filename, r.join(", "))
end

# mode (data) calculate the mode of a dataset
def mode(data)
  # check that dataset is not empty
  if data.empty?
    return nil
  end
  h1 = Hash.new(0)
  frequency = data.reduce(h1) do |freq, i|
      freq[i] = freq[i] + 1
      freq
  end
  return frequency.select{|k,v| v==frequency.values.max}.keys
end

## Group 4

# mean(data) calculate the mean of a dataset
def mean(collection)
  collection.reduce(:+) / collection.length.to_f
end

# maximum(data) return the max of a dataset
def maximum(collection)
  collection.reduce(0) { |max, ele| ele > max ? ele : max }
end

# Generate Fibonacci numbers up to a given limit and save to a file
def fibonacci(limit, filename)
  # Any limit less that 1 leaves no sequence at all.
  if limit < 1
    return File.write(filename, "")
  end

  fib = [0]
  x = 1
  while x < limit do
    fib << x
    x = fib[-2] + fib[-1]
  end

  File.write(filename, fib.join(", "))
end

# Convert Fahrenheit to Celsius
def fahrenheit_to_celsius(fahrenheit)
  (fahrenheit - 32) / 1.8
end
