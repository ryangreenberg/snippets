#!/usr/bin/env ruby -wKU

def powerset(*args)
  args.inject([[]]) do |arr, i|
    arr.concat(arr.map {|ea| ea + [i]})
  end
end

puts powerset(1,2,3,4,5).inspect