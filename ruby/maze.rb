#!/usr/bin/env ruby -wKU

require 'set'

maze = [
  [0, 0, 0, 0, 0],
  [0, 1, 0, 1, 0],
  [0, 1, 0, 1, 0],
  [0, 1, 0, 1, 1],
  [0, 1, 0, 0, 0]
]

maze_2 = [
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 1, 1, 1, 1, 1, 1, 0],
  [0, 0, 0, 0, 0, 0, 1, 0],
  [0, 1, 1, 0, 1, 0, 1, 0],
  [1, 1, 1, 0, 1, 0, 1, 0],
  [0, 0, 0, 1, 1, 0, 1, 0],
  [0, 1, 0, 0, 0, 0, 1, 0],
  [0, 1, 1, 1, 1, 1, 1, 1],
  [0, 0, 0, 0, 0, 0, 0, 0]
]

def find_path(maze, start, finish)
  current_position = start
  current_path = []
  fringe = []
  visited_positions = Set.new

  while current_position != finish
    visited_positions << current_position
    current_path << current_position
    moves_with_paths = possible_moves(maze, current_position).map {|ea| [ea, current_path.dup]}
    fringe.concat(moves_with_paths)
    while visited_positions.include?(current_position)
      current_position, current_path = fringe.shift
    end
  end

  current_path << current_position
end

def possible_moves(maze, position)
  transformations = [-1, 0], [1, 0], [0, -1], [0, 1]
  moves = transformations.map {|ea| [ position[0] + ea[0], position[1] + ea[1] ] }

  max_x = maze[0].size - 1
  max_y = maze.size - 1

  valid_moves = moves.select do |x, y|
    x >= 0 && x <= max_x && y >= 0 && y <= max_y && maze[y][x] != 1
  end

  valid_moves
end

def directions(path)
  moves = {
    [1, 0] => :left,
    [-1, 0] => :right,
    [0, 1] => :up,
    [0, -1] => :down
  }

  path.each_cons(2).map do |(x1, y1), (x2, y2)|
    move = [(x1 - x2), (y1 - y2)]
    moves[move]
  end
end

def pretty_print(maze, position = nil)
  max_x, max_y = maze.first.size, maze.size
  top = "-" * (max_x + 2)
  y = 0
  top + "\n" +
  maze.map do |row|
    x = 0
    ("|" + row.map do |col|
      if col == 1
        "X"
      elsif position && y == position[1] && x == position[0]
        '*'
      else
        " "
      end.tap { x += 1 }
    end.join + "|").tap { y += 1}
  end.join("\n") +
  "\n" + top
end

puts pretty_print(maze_2)
solution_path = find_path(maze_2, [0,0], [7,8])
puts solution_path.inspect
puts directions(solution_path).inspect
