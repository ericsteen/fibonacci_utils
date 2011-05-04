require 'bigdecimal'

module FibonacciRangeUtils

  KEY_FIB_LEVELS = [0.236, 0.382, 0.500, 0.618, 0.764, 1.000, 1.382, 1.618, 2.618, 4.236]

# Given a move in either direction(up or down) within a range, computes the value at the closest
# Fibonacci level out of all key levels. Note: returns a rough estimate due to float imprecision.
#
# @params [Float] the value at which one would like to find the closest fib value
# @return [Float, String] the value at the closest Fibonacci proportion and which proportion it corresponds to.
  def nearest_fibonacci_level(val)
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