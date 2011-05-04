module FibonacciIntegerUtils

# Finds the closest fibonacci integer lower than the given integer.
#
# @return [Integer] the object which is an integer lower than then given integer and in the fibonacci sequence.
  def closest_fibonacci
    a,b = 0,1
    while(self > b) do
      a,b = b,a+b
    end
    return a
  end

end