# Advent of Code, 2021-12-02

## Notes

1. I have seen in a few places that there seems to be two ways to define "objects". One with `struct` and the other with `type`. According to [this](https://stackoverflow.com/questions/60578133/difference-between-type-and-struct) it is part of Julia legacy. In the old way you would define `type` and `immutable type`. Now things have been made reversed. The new keyword that should be used is `struct` which is immutable by default and to get a mutable struct you have to explicitly opt-in: `mutable struct`. This is very confusing but I believe a worthwhile effort because immutability is a better default.
1. Tried using the third party package [Match.jl](https://github.com/kmsquire/Match.jl). Not really sure how dependency managment works in Julia. The package instructions said "Use the Julia package manager. Within Julia, do: `Pkg.add("Match")`. I tried that but it did not seem to work. Maybe things have now changed in Julia 1.7 and these are old instructions? What did seem to work was to open the Julia REPL then hit the ] key to open the Julia Package manager then by reading the help I ran the command `add Match`. That seemed to do the trick but I can not see how this will not be a problem on a clean checkout of the code.
1. Currently I am just writing the Julia source files in Vim with no syntax highlighting. I have found the Julia error messages to be somewhat confusing and unhelpful. For example I had the following line: `throw(DomainError("Invalid direction")`. There was a missing parenthisis at the end. The Julia compiler said there was a missing commo or ) in an argument list but it hinted at the wrong line. It was way down in the source file. I had another similar error where there was an extra " inside a string, that triggered the same error but there was no mention in the error that unproperly closed strings could be an issue.
1. Aparenty the `split()` function returns a type of `SubString` which is not the same as the type `String`. `SubString` is essentially a indexed view into another string. A range if you will. I guess this is one of those things where Julia is ruthlessly focused on performance.
1. I ran into a massive issue while pattern matching on enum types. Was not able to figure it out. Spent too much time on it since it looked so nice if it had worked. Went with simple if sentences instead. Here are some of the attempts:
   ```
   for command in commands
     @match command begin
       Command(forward, units)  => (x += units)
       Command(Direction.forward, units)  => println(forward)
       Command(up, units)       => (y -= units)
       Command(down, units)     => (y += units)
     end
   end
   ```
   
   ```
   for command in commands
     cmd = command.direction
     @match cmd begin
       forward::Direction => println("áfram")
       up => println("upp")
       down => println("niður")
     end
   end
   ```
1. The answer to part 1 is 1947824 (x: 1817, y: 1072).
1. The answer to part 2 is 1813062561 (x: 1817, y: 997833).

## Problem description
--- Day 2: Dive! ---

Now, you need to figure out how to pilot this thing.

It seems like the submarine can take a series of commands like forward 1, down 2, or up 3:

- forward X increases the horizontal position by X units.
- down X increases the depth by X units.
- up X decreases the depth by X units.

Note that since you're on a submarine, down and up affect your depth, and so they have the opposite result of what you might expect.

The submarine seems to already have a planned course (your puzzle input). You should probably figure out where it's going. For example:

forward 5  
down 5  
forward 8  
up 3  
down 8  
forward 2  

Your horizontal position and depth both start at 0. The steps above would then modify them as follows:

- forward 5 adds 5 to your horizontal position, a total of 5.
- down 5 adds 5 to your depth, resulting in a value of 5.
- forward 8 adds 8 to your horizontal position, a total of 13.
- up 3 decreases your depth by 3, resulting in a value of 2.
- down 8 adds 8 to your depth, resulting in a value of 10.
- forward 2 adds 2 to your horizontal position, a total of 15.

After following these instructions, you would have a horizontal position of 15 and a depth of 10. (Multiplying these together produces 150.)

Calculate the horizontal position and depth you would have after following the planned course. What do you get if you multiply your final horizontal position by your final depth?
