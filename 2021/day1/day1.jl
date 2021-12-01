using Test


# Returns the number of time a measurement is larger than the previous measurement 
function increases(measurements::Vector{Int})
  1
end

function runtests()
  # Trivial unit tests
  @test 1+2 == 3
  @test 2+2 == 5 broken=true

  # The example that was given in the description
  @test increases([199, 200, 208, 210, 200, 207, 240, 269, 260, 263]) == 7
  @test increases([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) == 9

  @test increases([1, 2, 3]) == 2
  @test increases([]) == 0
  @test increases([1]) == 0
  @test increases([1, 0]) == 0
  @test increses([1, 1, 1, 1]) == 0
  @test increaes([3, 2, 1]) == 0
end

#runtests() # Commented out while I learn Julia typing

input = [1, 2, 3]
answer = increases(input)

println("Advent of Code 2021 - Day 1")
println("Answer: $answer")
