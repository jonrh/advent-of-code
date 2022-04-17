# Advent of Code, 2021-12-03

## Notes
1. For this task I wanted to get some exposure to multidimensional arrays in Julia since they are at the core of real heavy duty numerical computation in the language.
1. Learned that I do not need to first open a file before reading lines: `open("file.txt")`. I can just do it directly: `readlines("file.txt")`.
1. Struggled quite a bit on how to convert a `Vector{Vector{Bool}}` to something like `BitArray`. The only way I found was some hack like `reshape(collect(Iterators.flatten(vector_of_vectors)), (3,3))'`. I find it hard to believe that functionality like this is not built into the core language. Must have missed something.
1. The cleanest way I found was flattening the vector of vector to a flat vector then reshaping that into an array: `reshape(reduce(vcat, array), (3, 3))` (this example being a 3x3 array).


BitArray(reshape(reduce(vcat, c), (3, 3)))
println(arr[1,:])
https://viralinstruction.com/posts/aoc2021_1/

## Problem description
--- Day 3: Binary Diagnostic ---

The submarine has been making some odd creaking noises, so you ask it to produce a diagnostic report just in case.

The diagnostic report (your puzzle input) consists of a list of binary numbers which, when decoded properly, can tell you many useful things about the conditions of the submarine. The first parameter to check is the power consumption.

You need to use the binary numbers in the diagnostic report to generate two new binary numbers (called the gamma rate and the epsilon rate). The power consumption can then be found by multiplying the gamma rate by the epsilon rate.

Each bit in the gamma rate can be determined by finding the most common bit in the corresponding position of all numbers in the diagnostic report. For example, given the following diagnostic report:

00100  
11110  
10110  
10111  
10101  
01111  
00111  
11100  
10000  
11001  
00010  
01010  

Considering only the first bit of each number, there are five 0 bits and seven 1 bits. Since the most common bit is 1, the first bit of the gamma rate is 1.

The most common second bit of the numbers in the diagnostic report is 0, so the second bit of the gamma rate is 0.

The most common value of the third, fourth, and fifth bits are 1, 1, and 0, respectively, and so the final three bits of the gamma rate are 110.

So, the gamma rate is the binary number 10110, or 22 in decimal.

The epsilon rate is calculated in a similar way; rather than use the most common bit, the least common bit from each position is used. So, the epsilon rate is 01001, or 9 in decimal. Multiplying the gamma rate (22) by the epsilon rate (9) produces the power consumption, 198.

Use the binary numbers in your diagnostic report to calculate the gamma rate and epsilon rate, then multiply them together. What is the power consumption of the submarine? (Be sure to represent your answer in decimal, not binary.)
