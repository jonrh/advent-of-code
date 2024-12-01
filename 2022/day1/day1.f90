program day1
  implicit none

  integer :: io, num

  num = 0

  open(newunit=io, file="test_input.txt")
  read(io, *) num
  close(io)

  print *, num
end program day1