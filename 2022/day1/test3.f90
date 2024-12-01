program test
  implicit none

  integer :: i, Cpass, Clast

  Cpass = 1
  Clast = 2

  do i = 1, 5
    print *, "Inside loop, iteration: ", i

    !if (Cpass >= Clast) then
    !  Clast = Cpass
    !end if

    if (Cpass < Clast) then
      exit
    else
      Clast = Cpass
    end if
  end do

  print *, "End of program"
end program test