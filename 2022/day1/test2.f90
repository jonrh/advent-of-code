program test
      implicit none

      integer :: i, Cpass, Clast

      Cpass = 2
      Clast = 2

      do 40000 i = 1, 5
        print *, "Inside loop, iteration: ", i

        if (Cpass < Clast) then
          GOTO 40001
        else
          Clast = Cpass
        end if
40000 continue
40001 continue

      print *, "End of program"
end program test