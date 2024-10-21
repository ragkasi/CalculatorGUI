# Used for testing functions.
class TestManager
  def initialize
    @tests = []
  end

  def add_test(name, testFunc)
    @tests.push({name: name, testFunc: testFunc})
  end

  def run_tests
    successes = 0
    # run each test
    for test in @tests
      result = test[:testFunc].call
      # track successes, print failures
      if result
        successes += 1
      else
        puts "\e[31mTest #{test[:name]} Failed!\e[0m"
      end
    end
    # Ending status message
    puts "\nRan #{@tests.length} tests.\n\e[32m#{successes} Success\e[0m, \e[31m#{@tests.length - successes} Failed.\e[0m"

    # return true if all tests passed
    successes == @tests.length
  end
end