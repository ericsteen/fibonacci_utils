require 'fibonacci_utils/fibonacci_integer_utils'
require 'fibonacci_utils/fibonacci_range_utils'

class Integer #:nodoc:
  include FibonacciIntegerUtils
end

class Range
  include FibonacciRangeUtils
end