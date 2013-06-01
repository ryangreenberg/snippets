#!/usr/bin/env ruby -wKU

# In Ruby 1.8.7 .map uses an implicit block {|ea| ea } if no block is given
# In Ruby 1.9+ .map returns an Enumerator when no block is given, which makes
# it easy to chain with the .with_index Enumerator:
#
# arr.map.with_index {|ea, idx| ... }
#
# This hack lets you do something similar in Ruby 1.8

module Enumerable
  def map_with_index
    idx = 0
    map do |ea|
      (yield ea, idx).tap { idx += 1 }
    end
  end
end

puts [1,2,3].map_with_index {|ea, idx| ea}