require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "FibonacciRangeUtils" do

  context "up move" do
    it "Range.new(0,1).nearest_fibonacci_level(0.2) => 0.236" do
      Range.new(0,1).nearest_fibonacci_level(0.2).should == [0.236,0.236]
    end
    it "Range.new(1,2).nearest_fibonacci_level(1.6) => 1.618" do
      Range.new(1,2).nearest_fibonacci_level(1.6).should == [1.618, 0.618]
    end
    it "Range.new(1,3).nearest_fibonacci_level(2.1) => 2" do
      Range.new(1,3).nearest_fibonacci_level(2.1).should == [2, 0.500]
    end
    it "Range.new(4,6).nearest_fibonacci_level(5.7) => 5.528" do
      Range.new(4,6).nearest_fibonacci_level(5.7).should == [5.528, 0.764]
    end
    it "Range.new(1,3).nearest_fibonacci_level(1.5) => 0.472" do
      Range.new(1,3).nearest_fibonacci_level(1.5).should == [1.472,0.236]
    end

  end

  context "down move" do
    it "Range.new(0.5,0).nearest_fibonacci_level(0.2) => 0.191" do
      Range.new(0.5,0).nearest_fibonacci_level(0.2).should == [0.191,0.618]
    end
    it "Range.new(165.54, 50.44).nearest_fibonacci_level(110) => 120" do
      Range.new(165.54, 50.44).nearest_fibonacci_level(110).should == [107.99,0.500]
    end
  end
end
