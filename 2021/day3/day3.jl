#convert_to_bitarray(arr) = BitArray(reshape(reduce(vcat, lines), :, length(lines)))'

lines = readlines("input_sample.txt")
arr = map(line -> split(line, "") .== "1", lines)
barr = reshape(reduce(vcat, arr), :, length(lines))'

#println(arr)
#println(barr)
#println(barr[1,:])

gamma = ""

num1s = count(i -> i == true, barr[2, :])
num0s = count(i -> i == false, barr[2, :])

#if num1s > num0s gamma *= "1" end
#if num0s > num1s gamma *= "0" end

num1s > num0s ? gamma *= "1" : gamma *= "0"

println("Number of 1s: $num1s")
println("Number of 0s: $num0s")
println("BitString: $gamma")

println("Gamma: ", parse(Int, gamma, base=2)

# Base.count_ones
# Base.count_zeros
