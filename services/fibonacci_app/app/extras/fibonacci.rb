# Class used to calculate numbers in the Fibonacci series
# It is eager loaded in all environments so Rails treat it
# as a first class citizen. Feel free to use it in your 
# controllers and models.
# 
# This Fibonacci class prefers using Enumerator due to the
# following benefits:
# 1. It can deal with very large numbers because it doesn't mess with floats.
# 2. It is performant enough for a reasonable length of terms.
# 3. The algorithm is very easy to read and understand.
#
class Fibonacci  

  include Enumerable

  # Enumerators are a powerful Ruby tool to deal with infinite series.
  # This enumerator contains an inner generator that can be controlled
  # by Enumerator::take.
  # Read the method[] comments for more detail
  #
  @@fib_enum = Enumerator.new do |y|
    penultimate, ultimate = 0,1
    loop do
      y << penultimate
      penultimate, ultimate = penultimate + ultimate, penultimate
    end
  end

  class << self

    # method [](nterm=1)
    # A human-readable method to find the *n*-th term
    # of the sequence using the syntax:
    #
    #     Fibonacci[n]
    #
    def [](nterm=0)
      return -1 unless nterm.is_a? Integer
      return -1 unless nterm >= 0

      # Because we are using an Enumerator, it is the 'take' function who is in control
      # of the fibonacci numbers generator inside the loop block.
      @@fib_enum.take(nterm+1).last
    end

    # method take(size)
    # Obtains an array of Fibonacci numbers of size 'size'.
    # Leverages the power of Enumerator generator to generate
    # the list of Fibonacci numbers. Use the syntax:
    #
    #      Fibonacci.take(10)
    # 
    def take(size)
      @@fib_enum.take(size)
    end

  end

end
