#TODO: require 'bigdecimal'

module FibonacciRangeUtils

  KEY_FIB_LEVELS = [0.236, 0.382, 0.500, 0.618, 0.764, 1.000, 1.382, 1.618, 2.618, 4.236]

  class ValueOutOfRangeError < ArgumentError; end

# Given a move in either direction(up or down) within a range, computes the value at the
# Fibonacci level nearest to the value passed as a parameter from the given key levels.
# Note: returns a rough estimate due to float imprecision.
#
# This method can be used to find the expected extent of a move or retracement of a financial instrument.
#
# @param [Float], the value at which one would like to find the nearest fib level value
# @return [Float, String] the value at the closest Fibonacci proportion and the corresponding proportion.
  def nearest_fibonacci_level(val)
    if val < self.begin
      raise FibonacciRangeUtils::ValueOutOfRangeError, "Must pass a value within the range." unless val > self.end
    elsif val > self.begin
      raise FibonacciRangeUtils::ValueOutOfRangeError, "Must pass a value within the range." unless val < self.end
    end
    
    span = (self.end - self.begin).abs
    move = (val - self.begin).abs

    current_level = move/span
    nearest_key_level = KEY_FIB_LEVELS.sort_by { |level| (level-current_level).abs }.first

    if self.begin < self.end
      nearest_fib_value = self.begin + span*nearest_key_level
    else
      nearest_fib_value = self.begin - span*nearest_key_level
    end
    [nearest_fib_value.round(3), nearest_key_level]
  end

end