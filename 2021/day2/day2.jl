using Test
using Match # Requires the third party package Match.jl

# Which ways the submarine can go
@enum Direction forward up down

# Pattern match a direction like "forward" to the correct enum value
function parse_direction(direction::AbstractString)::Direction
  @match direction begin
    "forward" => forward
    "up" => up
    "down" => down
    _ => throw(DomainError("Invalid direction string"))
  end
end

struct Command
  direction::Direction
  units::Int
end

# Converts a string like "forward 5" into typed Command
function parse_command(command::String)::Command
  (cmd, units) = split(command, " ")
  Command(parse_direction(cmd), parse(Int, units))
end

# Calculates the submarine x and y position after exucuting all the provided 
# commands. Returns a (x, y, product) tuple where product = x * y. Part 1.
function getposition(commands::Vector{Command})::Tuple{Int, Int, Int}
  x = 0 # Horizontal position
  y = 0 # Vertical depth

  for command in commands
    if command.direction === forward x += command.units end
    if command.direction === down y += command.units end
    if command.direction === up
      # max() ensures the submarine can not fly, lowest value is 0
      y = max(y - command.units, 0)
    end
  end
  
  (x, y, x*y)
end

# Part 2
function getposition2(commands::Vector{Command})::Tuple{Int, Int, Int}
  aim = 0
  x = 0 # Horizontal position
  y = 0 # Vertical depth

  for command in commands
    if command.direction === down aim += command.units end
    if command.direction === up aim -= command.units end
    if command.direction === forward
      x += command.units
      y += command.units * aim
    end
  end
  
  (x, y, x*y)

end


# Run unit tests
function runtests()
  # Sample provided by the challenge
  sample_position1 = [
    Command(forward, 5),
    Command(down, 5),
    Command(forward, 8),
    Command(up, 3),
    Command(down, 8),
    Command(forward, 2)
  ]

  # Submarines can not fly
  sample_position2 = [
    Command(up, 10),
    Command(forward, 1),
  ]

  # Submarines can not fly #2
  sample_position3 = [
    Command(down, 5),
    Command(up, 10),
    Command(forward, 1),
  ]

  # Hardly a submarine
  sample_position4 = [
    Command(down, 2),
    Command(forward, 100),
    Command(forward, 200),
    Command(forward, 300),
  ]

  # I could just as well be a normal boat
  sample_position5 = [
    Command(forward, 100),
    Command(forward, 200),
    Command(forward, 300),
  ]

  # Part 1 unit tests
  @test getposition(sample_position1) == (15, 10, 150)
  @test getposition(sample_position2) == (1, 0, 0)
  @test getposition(sample_position3) == (1, 0, 0)
  @test getposition(sample_position4) == (600, 2, 1200)
  @test getposition(sample_position5) == (600, 0, 0)

  # Part 2 unit tests
  @test getposition2(sample_position1) == (15, 60, 900)
end

# Reads an input file with a command on each line. Example:
# 
#   forward 5
#   down 3
#   up 2
#   
function readfile(filename::String)::Vector{Command}
  file = open(filename)
  commands::Vector{String} = readlines(file) # Each command is a string line
  map(x -> parse_command(x), commands) # Convert all lines to Commands
end

runtests()

input = readfile("input.txt")
#input = readfile("input_sample.txt") # Debug while developing
(x1, y1, answer_part1) = getposition(input)
(x2, y2, answer_part2) = getposition2(input)

println("Advent of Code 2021 - Day 2")
println("Answer, part 1: $answer_part1. (x: $x1, y: $y1)")
println("Answer, part 2: $answer_part2, (x: $x2, y: $y2)")

