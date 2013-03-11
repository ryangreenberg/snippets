#!/usr/bin/env ruby -wKU

# The powerset of a set is the set of all combinations
#
# Start with the empty list. For each element add it to
# all existing members of the list
def powerset(*args)
  args.inject([[]]) do |arr, i|
    arr.concat(arr.map {|ea| ea + [i]})
  end
end

puts powerset(1, 2, 3).inspect
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]