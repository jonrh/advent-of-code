module modull
  implicit none
  save

  character(len=1024) :: path
  character(len=1) :: firstCharInPath
  logical :: isPosix, isWindows, isKek, isKek2
end module modull

program test
  use modull
  implicit none

  integer :: kek
!  character(len=1024) :: path
!  logical :: isPosix, isWindows

  call getenv("PATH", path)
  isPosix = index(path, "/") /= 0
  isWindows = index(path, "\") /= 0
  isKek = path(1:1) == "/"
  isKek2 = firstCharInPath == "/"

  print *, "Results: ", kek(3)
  print *, "Path: ", path
  print *, "Is Linux: ", isPosix
  print *, "Is Windows: ", isWindows
end program test

function kek(i) result(j)
  integer, intent (in) :: i ! input
  integer              :: j ! output

  j = i**2 + i**3
end function

!function check_operating_system()
!  implicit none
!  character(len=*), parameter :: path = trim(getenv("PATH"))
!  logical :: has_forward_slash = index(path, '/') /= 0
!  logical :: has_backward_slash = index(path, '\') /= 0
!  character(len=10) :: operating_system
!
!  if (has_forward_slash) then
!    operating_system = "Linux"
!  else if (has_backward_slash) then
!    operating_system = "Windows"
!  else
!    operating_system = "Unknown"
!  end if
!
!  check_operating_system = trim(operating_system)
!end function check_operating_system