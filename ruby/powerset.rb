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

# Recursive solution
def powerset_recursive(*elements)
  if elements.empty?
    [ [] ]
  else
    head = elements.shift
    tail = elements
    tail_sets = powerset_recursive(*tail)
    tail_sets + tail_sets.map {|ea| ea + [ head ] }
  end
end

puts powerset(1, 2, 3).inspect
puts powerset_recursive(1, 2, 3).inspect
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]