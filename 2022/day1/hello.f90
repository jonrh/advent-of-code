program hello
  ! This code is not related to the problem at hand. Just some test code to get
  ! familiar with the basics of Fortran. Followed the Quickstart tutorial at:
  ! https://fortran-lang.org/en/learn/quickstart/hello_world/

  ! Always use implicit none. Without it variables are implicitly typed by the
  ! letter they start with. i, iTest would become integers. The old buggy way.
  implicit none

  ! A good Fortran practice is to seperate variables from their declaration
  integer :: age
  integer :: amount
  real :: pi
  complex :: frequency
  character :: initial
  logical :: isOkay

  amount = 10
  pi = 3.1415927
  frequency = (1.0, -0.5)
  initial = "A"
  isOkay = .false.

  print *, "Please enter your age: "
  read(*,*) age

  ! This is a comment
  print *, "Hæ!"

  print *, "Your age is: ", age
  print *, "The value of amount (integer) is: ", amount
  print *, "The value of pi (real) is: ", pi
  print *, "The value of frequency (complex) is: ", frequency
  print *, "The value of initial (character) is: ", initial
  print *, "The value of isOkay (logical) is: ", isOkay
end program hello