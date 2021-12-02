using Test

# Returns the number of times a measurement is larger than the previous 
# measurement. This is part 1 of the problem.
function increases(measurements::Vector{Int})::Int
  count = 0
  
  for i in 2:length(measurements)
    if measurements[i] > measurements[i-1]
      count += 1
    end
  end

  count
end

# Returns how many 3-sliding windows are bigger than the previous 3-sliding 
# window as described in part 2 of the problem. The function is more or less 
# the same as the original but with different indexes. Instead of calculating 
# sum of 3 numbers in each sliding window it is enough to compare the first 
# number in the previous window and the last number in the current window. 
# This is because the 2 other numbers overlap and are exactly the same. Note 
# that this function does not correctly handle edge cases like inputs of 
# vectors of size less than 4.
function increases_3window(measurements::Vector{Int})::Int
  count = 0

  for i in 4:length(measurements)
    if measurements[i] > measurements[i-3]
      count += 1
    end
  end

  count
end

# Run unit tests
function runtests()
  # Trivial unit tests
  @test 1+2 == 3
  @test 2+2 == 5 broken=true

  # The example that was given in the description
  @test increases([199, 200, 208, 210, 200, 207, 240, 269, 260, 263]) == 7
  @test increases([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) == 9

  @test increases([1, 2, 3]) == 2
  @test increases([1]) == 0
  @test increases([1, 0]) == 0
  @test increases([1, 1, 1, 1]) == 0
  @test increases([3, 2, 1]) == 0

  @test increases_3window([199, 200, 208, 210, 200, 207, 240, 269, 260, 263]) == 5
end

# Reads an input file with an measurement integer on each line, returns a 
# vector of those measurements as integers.
function readfile(filename)::Vector{Int}
  file = open(filename)
  measurements::Vector{String} = readlines(file) # Each item is a string line
  map(x -> parse(Int, x), measurements) # Convert all values from String to Int
end

runtests()

input = readfile("input.txt")
answer_part1 = increases(input)
answer_part2 = increases_3window(input)

println("Advent of Code 2021 - Day 1")
println("Answer, part 1: $answer_part1")
println("Answer, part 2: $answer_part2")
