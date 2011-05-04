require 'bigdecimal'

module FibonacciRangeUtils

  KEY_FIB_LEVELS = [0.236, 0.382, 0.500, 0.618, 0.764, 1.000, 1.382, 1.618, 2.618, 4.236]

# Given a move in either direction(up or down) within a range, computes the value at the closest
# Fibonacci level out of all key levels.
#
# @return [Float] the value at the closest Fibonacci proportion.
  def nearest_fibonacci_level(val)
    span = (self.end - self.begin).abs
    move = (val - self.begin).abs

    current_level = move/span
    puts "------------" + current_level.to_s
    nearest_key_level = KEY_FIB_LEVELS.sort_by { |level| (level-current_level).abs }.first
    puts "###############" + nearest_key_level.to_s

    if self.begin < self.end
      nearest_fib_value = self.begin + span*nearest_key_level
    else
      nearest_fib_value = self.begin - span*nearest_key_level
    end
    nearest_fib_value.round(3)
  end

end