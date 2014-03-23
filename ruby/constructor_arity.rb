#!/usr/bin/env ruby -wKU

# How can I tell how many arguments a class's constructor takes (its arity)?

class A1
	def initialize(a)
  end
end

class A2
  def initialize(a, b)
  end
end

class A3
  def initialize(a, b, c)
  end
end

# Checking the arity of the initialize and new methods does not work:

puts "A1.method(:new).arity: #{(A1.method(:new).arity).inspect}" # => -1

# That's because the .new class method, if it were implemented in Ruby, works like this:
#
# def self.new(*args, &block)
#   obj = allocate
#   obj.initialize(*args, &block)
# end
#
# initialize is an instance method called on the instance.

def constructor_arity(klass)
  klass.allocate.method(:initialize).arity
end

[A1, A2, A3].each do |klass|
  puts "constructor_arity(#{klass}): #{constructor_arity(klass).inspect}"
end

# constructor_arity(A1): 1
# constructor_arity(A2): 2
# constructor_arity(A3): 3