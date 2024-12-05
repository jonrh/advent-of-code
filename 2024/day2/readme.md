# Advent of Code, 2024-12-02

- Wrote the solution initially on the false assumption that the demo data 
  was structurally the same as the real data. Demo data had 5 numbers on 
  each line but real data could contain a lot more numbers. Very easy change 
  to account for but in the future it is likely best to take a peak at the 
  real input data before working on the solution to avoid false assumptions.
- Not quite happy with the solution to part 1. It solved the problem in a 
  fairly performant way but could not spot any patterns to simplify the code 
  but suspect they do exist.
- Part 2 threw a wrench in the assumptions the code took. The algorithm assumed 
  only one possible direction for the levels, up or down. In part 2 there can 
  be a single bad level which means checking for the direction by the first two 
  levels no longer works.