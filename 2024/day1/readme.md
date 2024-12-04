# Advent of Code, 2024-12-01

## Notes
- Think the problem can be simplified as abs(leftListSum - rightListSum).
  - Turns out this assumption was wrong. Worked for the sample input but not 
    the real input. Got 568443 which is incorrect, correct answer for part 1 
    is 1830467. 
- Besides setting up Deno and have it play nicely with WebStorm most of the 
  time was spent battling the TypeScript types. It was simultaneously 
  impressive and frustrating that the type checker pointed out that there 
  might be a type mismatch depending on the contents of the text file. That 
  is, it is not guaranteed that there are two numbers per line. Solved it by 
  explicitly returning a list of 2 numbers for each line. Will likely not 
  spend as much effort on stuff like that and overwrite types if the problem 
  description guarantees a certain file content structure.