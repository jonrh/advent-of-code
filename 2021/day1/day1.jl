using Test

# Returns the number of times a measurement is larger than the previous measurement 
function increases(measurements::Vector{Int})
  count = 0
  
  for i in 2:length(measurements)
    if measurements[i] > measurements[i-1]
      count += 1
    end
  end

  count
end

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
end

runtests()

input = [1, 2, 3]
answer = increases(input)

println("Advent of Code 2021 - Day 1")
println("Answer: $answer")
